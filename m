Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42949C84503
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF7110E39C;
	Tue, 25 Nov 2025 09:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com
 [115.124.28.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1AF10E39C;
 Tue, 25 Nov 2025 09:55:38 +0000 (UTC)
Received: from 172.38.10.120(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.fVY00.f_1764064535 cluster:ay29) by smtp.aliyun-inc.com;
 Tue, 25 Nov 2025 17:55:36 +0800
Message-ID: <1657dccb-3d03-420a-9ffa-5601ae212fd9@bosc.ac.cn>
Date: Tue, 25 Nov 2025 17:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
To: Jani Nikula <jani.nikula@linux.intel.com>, jeff@jeffgeerling.com,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn
References: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
 <bac7a05b799309fe2c269232e70e82f86a8e2811@intel.com>
Content-Language: en-US
From: ZhangZhiJie <zhangzhijie@bosc.ac.cn>
In-Reply-To: <bac7a05b799309fe2c269232e70e82f86a8e2811@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2025/11/24 20:24, Jani Nikula wrote:
> On Mon, 24 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>> inb/outb speccial wire not support on other ARCH.
>> Should detect whether arch platform support or not.
> 
> Seems to me it inb/outb depend on CONFIG_HAS_IOPORT. Which arch are you
> talking about specifically?

riscv , has CONFIG_HAS_IOPORT.  is using for serial, GPIO., etc.

Thanks.
BR.
ZhiJie
> 
>> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
>> ---
>>   drivers/gpu/drm/i915/display/intel_vga.c | 27 ++++++++++++++++++------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
>> index 6e125564db34..d5d6c4ba6434 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vga.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
>> @@ -41,6 +41,15 @@ static bool has_vga_pipe_sel(struct intel_display *display)
>>   	return DISPLAY_VER(display) < 7;
>>   }
>>   
>> +static bool intel_arch_support_vga_pm(struct intel_display *display)
>> +{
>> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
>> +	return true;
>> +#else
>> +	return false;
>> +#endif
>> +}
>> +
>>   /* Disable the VGA plane that we never use */
>>   void intel_vga_disable(struct intel_display *display)
>>   {
>> @@ -66,11 +75,13 @@ void intel_vga_disable(struct intel_display *display)
>>   
>>   	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>>   	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> -	outb(0x01, VGA_SEQ_I);
>> -	sr1 = inb(VGA_SEQ_D);
>> -	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
>> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> -	udelay(300);
>> +	if (likely(intel_arch_support_vga_pm(display))) {
> 
> As a rule of thumb, please do not use likely/unlikely, at all.
> 
> Here, intel_arch_support_vga_pm() is evaluated at build time, and the
> likely has no functional value, only dubious documentation value.
> 
>> +		outb(0x01, VGA_SEQ_I);
>> +		sr1 = inb(VGA_SEQ_D);
>> +		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
>> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> 
> Both or neither get/put need to be inside the branch. Now you only get,
> never put, on non-x86.
> 
> BR,
> Jani.
> 
>> +		udelay(300);
>> +	}
>>   
>>   	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
>>   	intel_de_posting_read(display, vga_reg);
>> @@ -91,8 +102,10 @@ void intel_vga_reset_io_mem(struct intel_display *display)
>>   	 * and error messages.
>>   	 */
>>   	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> -	outb(inb(VGA_MIS_R), VGA_MIS_W);
>> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> +	if (likely(intel_arch_support_vga_pm(display))) {
>> +		outb(inb(VGA_MIS_R), VGA_MIS_W);
>> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> +	}
>>   }
>>   
>>   int intel_vga_register(struct intel_display *display)
> 

