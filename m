Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734A122AA4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 12:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B7489804;
	Tue, 17 Dec 2019 11:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 141A689804
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 11:52:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91CC631B;
 Tue, 17 Dec 2019 03:52:31 -0800 (PST)
Received: from [10.1.196.56] (e112269-lin.cambridge.arm.com [10.1.196.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8ED3F6CF;
 Tue, 17 Dec 2019 03:52:30 -0800 (PST)
From: Steven Price <steven.price@arm.com>
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
To: Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
 <20191217054255.GA26868@ravnborg.org>
 <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
Message-ID: <aede39a0-3469-130d-f416-0e9426ebcec9@arm.com>
Date: Tue, 17 Dec 2019 11:52:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <65c9dc7b-3c61-8204-07da-212632732791@infradead.org>
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2019 06:37, Randy Dunlap wrote:
> On 12/16/19 9:42 PM, Sam Ravnborg wrote:
>> Hi Randy.
>>
>> On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
>>> On 12/15/19 9:22 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20191213:
>>>>
>>>
>>> on x86_64:
>>>
>>> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
>>> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
>>>
>>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
>>> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
>>> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
>>> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
>>>
>>> CONFIG_DRM_PANEL=y
>>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
>>> CONFIG_DRM_I915=y
>>>
>>> Full randconfig file is attached.
>>
>> Can you please verify if you have:
>> 907aa265fde6589b8059dc51649c6d1f49ade2f3
>> ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
>>
>> This commit is supposed to fix it.
>>
>> 	Sam
>>
> 
> Hi Sam,
> I don't have the linux-next.git tree so I can't check that.
> I just built whatever is in linux-next of 20191216.
> 

907aa265fde6589b8059dc51649c6d1f49ade2f3 ("drm/drm_panel: fix EXPORT of
drm_panel_of_backlight") is fixing drm_panel_of_backlight(), but the
error above is for backlight_device_register().

From what I can tell, that commit is actually the cause of the error -
now intel_backlight_device_register() is being included in the kernel
even though it calls backlight_device_register() which is in a module.
Of course it also fixed the original error, so reverting it isn't any
use.

The below Kconfig change fixes the build for me, but I've no idea
whether this is the correct fix.

Steve

----8<-----
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index ba9595960bbe..6b69dab683ae 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -16,7 +16,7 @@ config DRM_I915
 	select IRQ_WORK
 	# i915 depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
-	select BACKLIGHT_CLASS_DEVICE if ACPI
+	select BACKLIGHT_CLASS_DEVICE
 	select INPUT if ACPI
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
