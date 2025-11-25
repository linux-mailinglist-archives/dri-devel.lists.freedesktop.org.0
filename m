Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77630C8413A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426510E049;
	Tue, 25 Nov 2025 08:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com
 [115.124.28.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93CE10E049;
 Tue, 25 Nov 2025 08:54:45 +0000 (UTC)
Received: from 172.38.10.120(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.fVUNjrr_1764060881 cluster:ay29) by smtp.aliyun-inc.com;
 Tue, 25 Nov 2025 16:54:42 +0800
Message-ID: <9bcca124-e4da-4f68-9ec6-ba76b88d26dc@bosc.ac.cn>
Date: Tue, 25 Nov 2025 16:54:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2/2] i915: Support Intel GPU porting on any non-x86
 system.
To: Jani Nikula <jani.nikula@linux.intel.com>, jeff@jeffgeerling.com,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn,
 ville.syrjala@linux.intel.com
References: <20251125033420.2265288-1-zhangzhijie@bosc.ac.cn>
 <98262d9d2ea7c02858aafae680a3ca0ff0a9dc9a@intel.com>
Content-Language: en-US
From: ZhangZhiJie <zhangzhijie@bosc.ac.cn>
In-Reply-To: <98262d9d2ea7c02858aafae680a3ca0ff0a9dc9a@intel.com>
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


Hi. Jani

On 2025/11/25 16:38, Jani Nikula wrote:
> On Tue, 25 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>> inb/outb speccial wire not support on other ARCH.
>> Should detect whether arch platform support or not.
> 
> I would rather finish the discussion on the previous version before
> seeing a new version.
> 
> You mentioned risc-v in the previous thread, but it needs to be part of
> the commit message too. And I still don't know what "speccial wire" is
> supposed to mean here.
> 
I using RISCV to bootingup A380, This arch not support  VGA_SEQ_* 
ioports. and i don't know if other arch(such as aarch64) has VGA_SEQ_*.
> You still use likely/unlikely, and I told you not to.
> 
Ok, Next patch will fixed.
> There's no patch changelog.
> 
> The version in the subject is "v2/2", but there has already been two
> "v2" posted previously.
> 
After sending emails using V2, I realized that I had used V2 before, so 
I started using V2/2. Can I use V3 to continue with subsequent 
patch-modified commits?
> 
> BR,
> Jani.
> 
> 
>>
>> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
>> ---
>>   drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++-------
>>   1 file changed, 23 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
>> index 6e125564db34..d85622ba10fc 100644
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
>> @@ -64,13 +73,15 @@ void intel_vga_disable(struct intel_display *display)
>>   	drm_dbg_kms(display->drm, "Disabling VGA plane on pipe %c\n",
>>   		    pipe_name(pipe));
>>   
>> -	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>> -	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> -	outb(0x01, VGA_SEQ_I);
>> -	sr1 = inb(VGA_SEQ_D);
>> -	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
>> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> -	udelay(300);
>> +	if (likely(intel_arch_support_vga_pm(display))) {
>> +		/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> +		outb(0x01, VGA_SEQ_I);
>> +		sr1 = inb(VGA_SEQ_D);
>> +		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
>> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> +		udelay(300);
>> +	}
>>   
>>   	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
>>   	intel_de_posting_read(display, vga_reg);
>> @@ -90,9 +101,11 @@ void intel_vga_reset_io_mem(struct intel_display *display)
>>   	 * sure vgacon can keep working normally without triggering interrupts
>>   	 * and error messages.
>>   	 */
>> -	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> -	outb(inb(VGA_MIS_R), VGA_MIS_W);
>> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> +	if (likely(intel_arch_support_vga_pm(display))) {
>> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>> +		outb(inb(VGA_MIS_R), VGA_MIS_W);
>> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> +	}
>>   }
>>   
>>   int intel_vga_register(struct intel_display *display)
> 

