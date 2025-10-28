Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B2C16F43
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B94510E668;
	Tue, 28 Oct 2025 21:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AC3/Jd0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3135810E668
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D956143BDB;
 Tue, 28 Oct 2025 21:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64ECC4CEE7;
 Tue, 28 Oct 2025 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761686716;
 bh=9OLtvkhVhxl64Y1HwNo56j9KBqYKKTYYqibe59BP9Dc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AC3/Jd0+OXWSXwtfCJ8CynnjqmBnN2iqmXByBjcsGTA0fIXgLvfQZg1CJgzpjW90k
 Zj4pt5SP5+STNSoyBQ8m7f35iKn6IfhFfl456lb+cGp7pXhbo2P3d7otBDrM7Eu3DN
 p7x9LEogrhEKcvGkuoFWcl/SywWtxfeUbd7/+KM4mBNyjzVVt0zh8Y3Wkii68BC736
 nFesdcTb7RxVIbgoZ2lGiSLvyZ0cJCL+l/J4fhBVniBpRJxewd8gLCis7i75EwY3O7
 sDUJxSeq0WuaCEMnLrp+GTT26ljlXemdvNrqCrLs0uoN9Ej99eMwl+Rcc0odqjNOEK
 2dRSCaSvqCwkg==
Message-ID: <c7b86f6a-b691-41e3-955b-df40f4aca511@kernel.org>
Date: Tue, 28 Oct 2025 16:25:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] fbcon: Use screen info to find primary device
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Aaron Erhardt <aer@tuxedocomputers.com>, David Airlie <airlied@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-4-superm1@kernel.org>
 <e172ebf2-4b65-4781-b9e7-eb7bd4fa956a@tuxedocomputers.com>
 <fb519d0e-9d7f-4835-964a-c21fd24b10e8@kernel.org>
 <817215d6-0a37-41a3-89a0-b7d2f7c67f1f@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <817215d6-0a37-41a3-89a0-b7d2f7c67f1f@suse.de>
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

On 10/28/25 11:50 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.10.25 um 14:15 schrieb Mario Limonciello:
>> On 10/28/25 5:16 AM, Aaron Erhardt wrote:
>>>
>>> On Mon, Aug 11, 2025 at 11:26:05AM -0500, Mario Limonciello (AMD) wrote:
>>>> On systems with non VGA GPUs fbcon can't find the primary GPU because
>>>> video_is_primary_device() only checks the VGA arbiter.
>>>>
>>>> Add a screen info check to video_is_primary_device() so that callers
>>>> can get accurate data on such systems.
>>>
>>> I have a question regarding this change. To me, the function name
>>> video_is_primary_device() implies that there is only one primary GPU.
>>> I would also expect that the 'boot_display' attribute added later in
>>> the patch series based on this function is only set for one GPU, but
>>> that is not necessarily the case. Since I'm working on a user-space
>>> program that reads the 'boot_display' attribute, I need to know what
>>> behavior is intended in order to do a correct implementation.
>>>
>>>>
>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
>>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> ---
>>>> v10:
>>>>   * Rebase on 6.17-rc1
>>>>   * Squash 'fbcon: Stop using screen_info_pci_dev()'
>>>> ---
>>>>   arch/x86/video/video-common.c | 25 ++++++++++++++++++++++++-
>>>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video- 
>>>> common.c
>>>> index 81fc97a2a837a..e0aeee99bc99e 100644
>>>> --- a/arch/x86/video/video-common.c
>>>> +++ b/arch/x86/video/video-common.c
>>>> @@ -9,6 +9,7 @@
>>>>     #include <linux/module.h>
>>>>   #include <linux/pci.h>
>>>> +#include <linux/screen_info.h>
>>>>   #include <linux/vgaarb.h>
>>>>     #include <asm/video.h>
>>>> @@ -27,6 +28,11 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>>>>     bool video_is_primary_device(struct device *dev)
>>>>   {
>>>> +#ifdef CONFIG_SCREEN_INFO
>>>> +    struct screen_info *si = &screen_info;
>>>> +    struct resource res[SCREEN_INFO_MAX_RESOURCES];
>>>> +    ssize_t i, numres;
>>>> +#endif
>>>>       struct pci_dev *pdev;
>>>>         if (!dev_is_pci(dev))
>>>> @@ -34,7 +40,24 @@ bool video_is_primary_device(struct device *dev)
>>>>         pdev = to_pci_dev(dev);
>>>>   -    return (pdev == vga_default_device());
>>>> +    if (!pci_is_display(pdev))
>>>> +        return false;
>>>> +
>>>> +    if (pdev == vga_default_device())
>>>> +        return true;
>>>
>>> This can mark a VGA device as primary GPU.
> 
> Is the value returned from vga_default_device() eq to NULL?
> 
>>>
>>>> +
>>>> +#ifdef CONFIG_SCREEN_INFO
>>>> +    numres = screen_info_resources(si, res, ARRAY_SIZE(res));
>>>> +    for (i = 0; i < numres; ++i) {
>>>> +        if (!(res[i].flags & IORESOURCE_MEM))
>>>> +            continue;
>>>> +
>>>> +        if (pci_find_resource(pdev, &res[i]))
>>>> +            return true;
>>>> +    }
>>>> +#endif
>>>
>>> And then the new code can also choose a primary GPU.
> 
> Maybe we should drop this block or move it to [1]? At [1] it would only 
> run if the more sophisticated vgaarb has been disabled.
> 
> The vgaarb now selects CONFIG_SCREEN_INFO and already tests for 
> overlapping resources. There's nothing here that vgaarb shouldn't 
> already do. Yet, I don't understand how only one of the can be true at a 
> time.
> 
> [1] https://elixir.bootlin.com/linux/v6.18-rc3/source/include/linux/ 
> vgaarb.h#L55

There is a hunk at the end of vga_is_boot_device() which I think is 
causing this issue.  We have one VGA device which is NOT the boot 
display but the code figures if it found nothing this must be right.

	/*
	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
	 * other VGA devices, it is the best candidate so far.
	 */
	if (!boot_vga)
		return true;

I feel the right solution is to drop this now.

> 
>>>
>>>> +
>>>> +    return false;
>>>>   }
>>>>   EXPORT_SYMBOL(video_is_primary_device);
>>>
>>> In particular, I have hardware that has this exact configuration where
>>> two GPUs are marked as primary and have a 'boot_display' attribute: the
>>> first one through vga_default_device(), the second one through the new
>>> detection method.
>>>
>>> Is this intended?
>>>
>>> Kind regards
>>> Aaron
>>>
>>
>> I wouldn't have expected a case like this and I think it means there 
>> is a logic error.
>>
>> Can you please file a kernel bugzilla with details about your system 
>> and CC me?
>>
>> dmesg and lspci -vvnn please
>>
>> Also; please clarify which GPU shows something when booting up.
> 
> Agreed.
> 
> Best regards
> Thomas
> 
> 

