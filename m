Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06520796E9D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 03:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BB510E746;
	Thu,  7 Sep 2023 01:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-229.mta0.migadu.com (out-229.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::e5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0FF10E749
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 01:40:28 +0000 (UTC)
Message-ID: <2da16c01-260b-365d-4651-91d9172e5ed8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1694050826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdSJjVdF9N9VyWi8d0E/+tvyLt2iN7wqg3meq10BBqk=;
 b=ZKxMImLVCYGgQdGo7wEp8md0rexO3whf38TT14IgmeA2I8lJ1+FpCjs5ckzNyIl70hWb0l
 zhA/AEeUrYoo62kwzMEaVZue9c3989ZAOnT0QDm2vWL4fu5sqETOIWyXlnvsipgb5d/tj2
 dmoljB5GmkWXZn1QdoOXvE7jhONfgh0=
Date: Thu, 7 Sep 2023 09:40:15 +0800
MIME-Version: 1.0
Subject: Re: [RFC,drm-misc-next v4 3/9] drm/radeon: Implement .be_primary()
 callback
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, suijingfeng <suijingfeng@loongson.cn>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230904195724.633404-4-sui.jingfeng@linux.dev>
 <d3e6a9ce-1c7a-8e44-3127-413cd471a8e9@amd.com>
 <40f32814-ca87-6e29-0e10-4b4463a2920d@loongson.cn>
 <CADnq5_OYPha5cGF+tSj4fvSmf-6tObzNSe2__nG-SbjX6v_2vw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CADnq5_OYPha5cGF+tSj4fvSmf-6tObzNSe2__nG-SbjX6v_2vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/9/7 00:00, Alex Deucher wrote:
> On Tue, Sep 5, 2023 at 1:25 PM suijingfeng <suijingfeng@loongson.cn> wrote:
>> Hi,
>>
>>
>> On 2023/9/5 13:50, Christian König wrote:
>>> Am 04.09.23 um 21:57 schrieb Sui Jingfeng:
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>> On a machine with multiple GPUs, a Linux user has no control over
>>>> which one
>>>> is primary at boot time.
>>> Question is why is that useful? Should we give users the ability to
>>> control that?
>>>
>>> I don't see an use case for this.
>>>
>> On a specific machine with multiple GPUs mounted, only the
>> primary graphics get POST-ed (initialized) by the firmware.
>> Therefore the DRM drivers for the rest video cards have to
>> work without the prerequisite setups done by firmware, This
>> is called as POST.
> I think that should be regarded as a bug in the driver that should be
> fixed and this would not help with that case.  If a driver can't
> initialize a device without aid from the pre-OS environment, that
> should be fixed in the driver.  This solution also doesn't fix which
> device is selected as the primary by the pre-OS environment.  That can
> only be fixed in the pre-OS environment code.
>
>> One of the use cases is to test if a specific DRM driver
>> would works properly, under the circumstance of not being
>> POST-ed, The ast drm driver is the first one which refused
>> to work if not being POST-ed by the firmware.
>>
>> Before apply this series, I was unable make drm/ast as the
>> primary video card easily. The problem is that on a multiple
>> video card configuration, the monitor connected with my
>> AST2400 card not light up. While confusing, a naive programmer
>> may suspect the PRIME is not working.
>>
>> After applied this series and passing ast.modeset=10 on the
>> kernel cmd line, I found that the monitor connected with my
>> ast2400 video card still black, It doesn't display and It
>> doesn't show image to me.
> The problem with adding modeset=10 is that it only helps when you have
> one GPU driven by that driver in the system.  If you have multiple
> GPUs driven by that driver, which one would that apply to?  E.g., what
> if you have 2 AMD GPUs in the system.
>
>> While in the process of study drm/ast, I know that drm/ast
>> driver has the POST code shipped, See the ast_post_gpu() function.
>> Then, I was wondering why this function doesn't works.
>>
>> After a short-time (hasty) debugging, I found that the ast_post_gpu()
>> function didn't get run. Because it have something to do with the
>> ast->config_mode. Without thinking too much, I hardcoded the
>> ast->config_mode as ast_use_p2a, the key point is to force the
>> ast_post_gpu() function to run.
>>
>>
>> ```
>>
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -132,6 +132,8 @@ static int ast_device_config_init(struct ast_device
>> *ast)
>>                   }
>>           }
>>
>> +       ast->config_mode = ast_use_p2a;
>> +
>>           switch (ast->config_mode) {
>>           case ast_use_defaults:
>>                   drm_info(dev, "Using default configuration\n");
>>
>> ```
>>
>> Then, the monitor light up, it display the Ubuntu greeter to me. Therefore
>> my patch is useful, at least for the Linux drm driver tester and developer.
>> It allow programmers to test the specific part of a specific driver without
>> changing a line of the source code and without the need of sudo authority.
>>
>> It improves the efficiency of the testing and patch verification. I know
>> the PrimaryGPU option of Xorg conf, but this approach will remember the
>> setup have been made, you need modify it with root authority each time
>> you want to switch the primary. But on the process of rapid developing
>> and/or testing for multiple video drivers, with only one computer hardware
>> resource available. What we really want is a one-shot command, as provided
>> by this series.  So, this is the first use case.
>>
>>
>> The second use case is that sometime the firmware is not reliable.
>> While there are thousands of ARM64, PowerPC and Mips servers machine,
>> Most of them don't have a good UEFI firmware support. I haven't test the
>> drm/amdgpu and drm/radeon at my ARM64 server yet. Because this ARM64
>> server always use the platform(BMC) integrated display controller as primary.
>> The UEFI firmware of it does not provide options menu to tune.
>> So, for the first time, the discrete card because useless, despite more powerful.
>> I will take time to carry on the testing, so I will be able to tell more
>> in the future.
>>
>>
>> Even on X86, when select the PEG as primary on the UEFI BIOS menu.
>> There is no way to tell the bios which one of my three
>> discrete video be the primary. Not to mention some old UEFI
>> firmware, which doesn't provide a setting at all.
>> While the benefit of my approach is the flexibility.
>> Yes the i915, amdgpu and radeon are good quality,
>> but there may have programmers want to try nouveau.
>>
>>
>> The third use case is that VGAARB is also not reliable, It will
>> select a wrong device as primary. Especially on Arm64, Loongarch
>> and mips arch etc. And the X server will use this wrong device
>> as primary and completely crash there. Either because of lacking
>> a driver or the driver has a bug which can not bear the graphic
>> environment up. VGAARB is firmware dependent.
>> My patch provide a temporary method to rescue.
>>
> It sounds like we need a general purpose "primary" selector.  I think
> it's sort of orthogonal to VGA.  VGAARB is just for managing VGA
> routing on PCI.  It's not really directly related to which GPU you
> want to be the primary when the OS loads.  Maybe some new kernel
> parameter, E.g., primary_display=<string> where the string would be
> the specific device you wanted to be the primary,  E.g., you could use
> the PCI BDF on PCI devices, primary_display=0000:0a:00.0 or some other
> device string for non-PCI devices.


Indeed, thanks for you give the right direction.
Bjorn and Willianson also told me something similar,
but I didn't realized until today.

historically, VGAARB is only for managing VGA compatible device.
For legacy BIOS environment, the routing related to this need to handled.
I didn't realized those technique point by the time this series is sending.
Beside this, It not uncommon that a specific machine ship multiple identical
GPUs models Or GPUs from the same company (likely a integrated one and a discrete one)
My naive approach in v4 cannot solve complex problems like this.
I will try to solve this problems and concerns at the next version.

Thanks.


> Alex
