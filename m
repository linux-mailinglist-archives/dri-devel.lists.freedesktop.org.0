Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCC852982
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 08:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCCA10E242;
	Tue, 13 Feb 2024 07:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="e+8ER6X9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB3D10E242
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 07:01:33 +0000 (UTC)
Received: from [192.168.178.2] (unknown [58.7.187.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F229C4092A; 
 Tue, 13 Feb 2024 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1707807688;
 bh=Iel6Dzu6unAVG4BrbtyD/lNPC5LjCFHUF/MgsE3DfU8=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
 In-Reply-To:Content-Type;
 b=e+8ER6X99Qs2nu0CoHgeCEQbd+ebPdDmwIgr04l/DtiV0n6Ncmd2D12izkxRqnyck
 asM0s8ZS2mi+/A9xto7kZp0kXtgeqxgJ2h06WJGJKrQreviqk2ZqwzQEdOclPBEFVV
 W2Us+MgoX68TIGIToJ4cYi7Xx4vtu+J/lbx4uf8MphLAcz8qUcCYkVeo/tzTqRfjMq
 fV3bqbWa8JuU64rB/NfJEhGKLPE7FL+DQoOKs7mL3kJ4d2qqv9iCaPxTnobKbGrTi4
 ES5cy9Cx4btxy8i0IWzLx11xtzzthdO4poM7cuIdUxSTZNo7Y4hFnfo5H5XU4iRJ/k
 8VTOh88mNYVjQ==
Message-ID: <f2c54ff7-d601-49d0-b5ad-9b111d743ded@canonical.com>
Date: Tue, 13 Feb 2024 15:01:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
 <20240206101100.25536-2-daniel.van.vugt@canonical.com>
 <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
 <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
 <26893900-2d0d-4624-94f1-c4aa88386e9c@canonical.com>
 <ZcNSleQOrBtSn3uM@phenom.ffwll.local>
 <88f3ff47-8c4b-424c-bf83-1570882cbb54@amd.com>
 <2a153cb6-4ece-4a37-9711-abdf4ba0ad50@canonical.com>
 <ZcYFOXdcAmJ6eeCa@phenom.ffwll.local>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 andy.whitcroft@canonical.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
In-Reply-To: <ZcYFOXdcAmJ6eeCa@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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

On 9/2/24 18:58, Daniel Vetter wrote:
> On Thu, Feb 08, 2024 at 09:16:50AM +0800, Daniel van Vugt wrote:
>> On 8/2/24 04:21, Mario Limonciello wrote:
>>> On 2/7/2024 03:51, Daniel Vetter wrote:
>>>> On Wed, Feb 07, 2024 at 10:03:10AM +0800, Daniel van Vugt wrote:
>>>>> On 6/2/24 23:41, Mario Limonciello wrote:
>>>>>> On 2/6/2024 08:21, Daniel Vetter wrote:
>>>>>>> On Tue, Feb 06, 2024 at 06:10:51PM +0800, Daniel van Vugt wrote:
>>>>>>>> Until now, deferred console takeover only meant defer until there is
>>>>>>>> output. But that risks stepping on the toes of userspace splash screens,
>>>>>>>> as console messages may appear before the splash screen. So check the
>>>>>>>> command line for the expectation of userspace splash and if present then
>>>>>>>> extend the deferral until after the first switch.
>>>>>>>>
>>>>>>>> V2: Added Kconfig option instead of hard coding "splash".
>>>>>>>>
>>>>>>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>>>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>>>>>>> ---
>>>>>>>>    drivers/video/console/Kconfig    | 13 +++++++++++
>>>>>>>>    drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
>>>>>>>>    2 files changed, 49 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>>>>>>>> index bc31db6ef7..a6e371bfb4 100644
>>>>>>>> --- a/drivers/video/console/Kconfig
>>>>>>>> +++ b/drivers/video/console/Kconfig
>>>>>>>> @@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>>>>          by the firmware in place, rather then replacing the contents with a
>>>>>>>>          black screen as soon as fbcon loads.
>>>>>>>>    +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>>>>> +    string "Framebuffer Console Deferred Takeover Condition"
>>>>>>>> +    depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>>>> +    default "splash"
>>>>>>>> +    help
>>>>>>>> +      If enabled this defers further the framebuffer console taking over
>>>>>>>> +      until the first console switch has occurred. And even then only if
>>>>>>>> +      text has been output, and only if the specified parameter is found
>>>>>>>> +      on the command line. This ensures fbcon does not interrupt userspace
>>>>>>>> +      splash screens such as Plymouth which may be yet to start rendering
>>>>>>>> +      at the time of the first console output. "splash" is the simplest
>>>>>>>> +      distro-agnostic condition for this that Plymouth checks for.
>>>>>>>
>>>>>>> Hm this seems a bit strange since a lot of complexity that no one needs,
>>>>>>> also my impression is that it's rather distro specific how you want this
>>>>>>> to work. So why not just a Kconfig option that lets you choose how much
>>>>>>> you want to delay fbcon setup, with the following options:
>>>>>>>
>>>>>>> - no delay at all
>>>>>>> - dely until first output from the console (which then works for distros
>>>>>>>     which set a log-level to suppress unwanted stuff)
>>>>>>> - delay until first vt-switch. In that case I don't think we also need to
>>>>>>>     delay for first output, since vt switch usually means you'll get first
>>>>>>>     output right away (if it's a vt terminal) or you switch to a different
>>>>>>>     graphical console (which will keep fbcon fully suppressed on the drm
>>>>>>>     side).
>>>>>>>
>>>>>
>>>>> I had similar thoughts, and had prototyped some of this already. But in the end
>>>>> it felt like extra complexity there was no demand for.
>>>>
>>>> For me this one is a bit too complex, since if you enable the vt switch
>>>> delay you also get the output delay on top. That seems one too much and I
>>>> can't come up with a use-case where you actually want that. So just a
>>>> choice of one or the other or none feels cleaner.
>>
>> Remember the output "delay" goes to zero if any putc has occurred prior to
>> registration (see dummycon.c).
>>
>> My current reason for using both is that in theory it prevents fbcon from
>> taking over *earlier* than it did before, in case there was never any output.
>> But I don't think there is "never any output" by the time you've tried to
>> manually VT switch so maybe that's unnecessary.
> 
> Yeah, but I'm not sure that's like a choice anyone needs, just these
> three:
> 
> - no delay
> - wait until first output, and set debuglevel appropriately (what fedora
>   and other distros do)
> - wait until first vt switch (what ubuntu wants)

Come to think of it, an enum or Kconfig "choice" isn't necessary if I change
the default for CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION to
blank/disabled. Then the default behaviour is unchanged and you've still got
the choice of all three modes:

- No delay: fbcon=nodefer

- Wait until first output: Already happens when
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION is absent from the
command line.

- Wait until first VT switch: Would only happen if compiled with
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION and its value is present
on the command line.

P.S. I suspect Fedora and other distros are not immune to the problem, just
make it less likely by starting Plymouth super early on simpledrm. Certainly I
am finding some models of laptop emit kernel messages that would still pass
under a reduced loglevel.

> 
> I don't ever expect fedora to just enable this, because they have
> something that works. Plus many distros are moving away from CONFIG_VT and
> all the in-kernel consoles anyway, so they want this even less.
> 
> So if just the delay to first vt-switch is enough for you, I think it's
> best we just implement that. The entire vt switch/ownership rules with drm
> and fbdev and all that is already really complex and in many cases it's
> impossible to tell what's accidental cargo-culted behaviour and what is
> actually required. That's why I'd prefer we exactly implement what you
> need in this area, nothing more, nothing less.
> 
> And from the testing you discuss below it sounds like you don't need both
> delays?
> 
> Cheers, Sima
> 
>>>>> If you would like to specify the preferred Kconfig design then I can implement
>>>>> it. Though I don't think there is an enumeration type. It could also be a
>>>>> runtime enumeration (deferred_takeover) controlled by fbcon=something.
>>>>
>>>> There's a choice in Kconfig, see e.g. kernel/Kconfig.hz for an example.
>>
>> Thanks!
>>
>>>>
>>>>>> IIUC there is an "automatic" VT switch that happens with Ubuntu GRUB + Ubuntu
>>>>>> kernels.
>>>>>>
>>>>>> Why?
>>>>>>
>>>>>> Couldn't this also be suppressed by just not doing that?
>>>>>
>>>>> I have not seen any automatic VT switches in debugging but now that you mention
>>>>> it I was probably only debugging on drm-misc-next and not an Ubuntu kernel.
>>>>
>>>> Hm but I don't see how the output delay would paper over a race (if there
>>>> is one) reliable for this case? If you do vt switch for boot splash or
>>>> login screen and don't yet have drm opened for display or something like
>>>> that, then fbcon can sneak in anyway ...
>>
>> There is no VT switch according to my logs, so there is no race with the
>> patchset. The only race that occurs is without this patchset, which is what's
>> being fixed here.
>>
>>>
>>> Ubuntu has had in (at least some) kernels:
>>>
>>> https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/unstable/commit/?id=320cfac8ef31
>>>
>>> I'm unsure if it's still there today, but maybe it would be best if the author
>>> (Andy) could enlighten us?  Any idea why that didn't go upstream?
>>>
>>> I had thought that tied with a automatic VT switch that was trying to hide
>>> fbcon as well.
>>
>> I checked the current Ubuntu 24.04 kernel yesterday and there is no VT switch
>> (anymore). The vc_num stays at zero until you do a manual VT switch. This seems
>> to be true for both drm-misc-next and Ubuntu kernels.
>>
>> There is still vt.handoff=7 on the command line for Ubuntu, but I'm not sure it
>> has a function anymore. Maybe it was primarily for legacy BIOS? Andy can confirm.
>>
>>>
>>>>
>>>> Cheers, Sima
>>>>>
>>>>> - Daniel
>>>>>
>>>>>>
>>>>>>> I think you could even reuse the existing
>>>>>>> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER for this, and then just
>>>>>>> compile-time select which kind of notifier to register (well plus the
>>>>>>> check for "splash" on the cmdline for the vt switch one I guess).
>>>>>>>
>>>>>>> Thoughts?
>>>>>>>
>>>>>>> Cheers, Sima
>>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>>    config STI_CONSOLE
>>>>>>>>        bool "STI text console"
>>>>>>>>        depends on PARISC && HAS_IOMEM
>>>>>>>> diff --git a/drivers/video/fbdev/core/fbcon.c
>>>>>>>> b/drivers/video/fbdev/core/fbcon.c
>>>>>>>> index 63af6ab034..98155d2256 100644
>>>>>>>> --- a/drivers/video/fbdev/core/fbcon.c
>>>>>>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>>>>>>> @@ -76,6 +76,7 @@
>>>>>>>>    #include <linux/crc32.h> /* For counting font checksums */
>>>>>>>>    #include <linux/uaccess.h>
>>>>>>>>    #include <asm/irq.h>
>>>>>>>> +#include <asm/cmdline.h>
>>>>>>>>      #include "fbcon.h"
>>>>>>>>    #include "fb_internal.h"
>>>>>>>> @@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct
>>>>>>>> notifier_block *nb,
>>>>>>>>          return NOTIFY_OK;
>>>>>>>>    }
>>>>>>>> +
>>>>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>>>>> +static int initial_console;
>>>>>>>> +static struct notifier_block fbcon_switch_nb;
>>>>>>>> +
>>>>>>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>>>>>>> +                 unsigned long action, void *data)
>>>>>>>> +{
>>>>>>>> +    struct vc_data *vc = data;
>>>>>>>> +
>>>>>>>> +    WARN_CONSOLE_UNLOCKED();
>>>>>>>> +
>>>>>>>> +    if (vc->vc_num != initial_console) {
>>>>>>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>>>>> +        dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    return NOTIFY_OK;
>>>>>>>> +}
>>>>>>>> +#endif
>>>>>>>>    #endif
>>>>>>>>      static void fbcon_start(void)
>>>>>>>> @@ -3370,7 +3391,16 @@ static void fbcon_start(void)
>>>>>>>>          if (deferred_takeover) {
>>>>>>>>            fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>>>>>>> -        dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>>>>> +        if (cmdline_find_option_bool(boot_command_line,
>>>>>>>> +              CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
>>>>>>>> +            initial_console = fg_console;
>>>>>>>> +            fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>>>>>>> +            dummycon_register_switch_notifier(&fbcon_switch_nb);
>>>>>>>> +        } else
>>>>>>>> +#endif
>>>>>>>> +            dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>>>> +
>>>>>>>>            return;
>>>>>>>>        }
>>>>>>>>    #endif
>>>>>>>> @@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
>>>>>>>>    {
>>>>>>>>    #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>>>>        console_lock();
>>>>>>>> -    if (deferred_takeover)
>>>>>>>> +    if (deferred_takeover) {
>>>>>>>>            dummycon_unregister_output_notifier(&fbcon_output_nb);
>>>>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>>>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>>>>> +#endif
>>>>>>>> +    }
>>>>>>>>        console_unlock();
>>>>>>>>          cancel_work_sync(&fbcon_deferred_takeover_work);
>>>>>>>> -- 
>>>>>>>> 2.43.0
>>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>>
> 
