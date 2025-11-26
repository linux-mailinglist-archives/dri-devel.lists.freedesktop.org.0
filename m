Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AABC87B82
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A5510E4EC;
	Wed, 26 Nov 2025 01:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C6F10E070;
 Wed, 26 Nov 2025 01:39:42 +0000 (UTC)
Received: from 172.38.10.120(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.fVyAjhI_1764121178 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 26 Nov 2025 09:39:39 +0800
Message-ID: <0d2e6a53-11f8-403c-a4e8-b9c367ed96a8@bosc.ac.cn>
Date: Wed, 26 Nov 2025 09:39:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, jeff@jeffgeerling.com,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn
References: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
 <bac7a05b799309fe2c269232e70e82f86a8e2811@intel.com>
 <1657dccb-3d03-420a-9ffa-5601ae212fd9@bosc.ac.cn>
 <58728a8ae8f0a3e92be203a9296d120fd12da8d5@intel.com>
 <14954d6d-67bc-49f4-b394-3da4e1f80af1@bosc.ac.cn>
 <743pqjv2sefs3bhsyyoezv2nzf6tcbc6fo5nshczsc3s36j3qy@2xla3yxhbhpd>
Content-Language: en-US
From: ZhangZhiJie <zhangzhijie@bosc.ac.cn>
In-Reply-To: <743pqjv2sefs3bhsyyoezv2nzf6tcbc6fo5nshczsc3s36j3qy@2xla3yxhbhpd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2025/11/26 05:54, Lucas De Marchi wrote:
> On Tue, Nov 25, 2025 at 06:20:00PM +0800, ZhangZhiJie wrote:
>>
>>
>> On 2025/11/25 18:13, Jani Nikula wrote:
>>> On Tue, 25 Nov 2025, ZhangZhiJie <zhangzhijie@bosc.ac.cn> wrote:
>>>> On 2025/11/24 20:24, Jani Nikula wrote:
>>>>> On Mon, 24 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>>>>>> inb/outb speccial wire not support on other ARCH.
>>>>>> Should detect whether arch platform support or not.
>>>>>
>>>>> Seems to me it inb/outb depend on CONFIG_HAS_IOPORT. Which arch are 
>>>>> you
>>>>> talking about specifically?
>>>>
>>>> riscv , has CONFIG_HAS_IOPORT.  is using for serial, GPIO., etc.
>>>
>>> What is the actual failure mode you see?
>>>
>>> Does it build?
>>>
>>> BR,
>>> Jani.
>>>
>> Yes, i compiled Xe driver, and it's occured load access fault when not 
>> disable  VGA_SEQ_*.
>>
>> can found this link https://github.com/geerlingguy/raspberry-pi-pcie- 
>> devices/issues/510#issuecomment-3383284831
> 
> and this is what I tested with rpi:
> https://lore.kernel.org/intel-xe/20251119-ioport-v1-1- 
> ec43f1e12c49@intel.com/
> 
Yep. agree like this patch.

In my mind. if machine not implement VGA_SEQ_* ioport.
should avoid access ioports about VGA_SEQ_* .

Can you give  log for bootting on non-x86 arch?

> not sure why you are changing the intel_vga_disable() function: out of
> reset that bit is disabled and the function does nothing:
> 
>      tmp = intel_de_read(display, vga_reg);
>      if (tmp & VGA_DISP_DISABLE)
>          return;
> 
> If there's no VGA, no bios, then there isn't anything enabling that and
> we don't need to disable it.
> 
> I have a patch that moves the vga access to a separate function,
> intel_vga_set_screen_off(), but that's mostly for clarity, not to fix
> anything. If later we want to add an ifdef then we'd probably have to
> implement the alternative.
> 
> Also note that not having CONFIG_HAS_IOPORT doesn't mean inb()/outb()
> are not implemented. See arch/{arm,powerpc,sparc}/include/asm/io.h
> for a few variants.
> 
> Lucas De Marchi

BR.
ZhiJie
