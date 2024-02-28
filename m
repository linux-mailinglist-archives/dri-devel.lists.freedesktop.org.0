Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A486A63D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 03:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0410E0B6;
	Wed, 28 Feb 2024 02:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="UgDZBHvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC2B10E0B6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 02:00:16 +0000 (UTC)
Received: from [192.168.178.2] (unknown [58.7.187.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F11383F709; 
 Wed, 28 Feb 2024 02:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1709085614;
 bh=n+Qxvwa6/Lmg8IrAABOmQtN+Tn/Hh3PpwEHjX6UuBtI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=UgDZBHvthsBlKYE3AtgPSc0sOLqc7gaJbT3E6Vi4lBrhKfQUjEQpKSIJU9bYKu/M0
 KfWJhRtFjLizMB0m3WfUto3yUwLiqoCh+/eJH1nNAyOS8nxyAPseTzoXHeIwIKAAp5
 YXwAE721wv+t36ekPacR+Ue4W9YkbhCt6Zg//la2/cfCHz5pHdxlOLncEidfSnBonQ
 jh4zIfWT6rj3UHTM3gVbcwmICOkoBdXFzTJ4MbHbj2d6ZS2yEL4+V6rHqe/Kk27bOp
 1x/0vIk1NiVlfQxBFlzYUe2CpwNy3OV2Pi9J5Y+pmw/FhJKVY+5XF83uel6WcQM5KW
 em3gVtRIweUJA==
Message-ID: <b98562cc-c4ca-4a74-a0c1-e1192e67d19c@canonical.com>
Date: Wed, 28 Feb 2024 10:00:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sebastien Bacher <seb128@ubuntu.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
 <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
 <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
 <f3cdd944-5e68-49e5-bae8-4bc1f9f59131@redhat.com>
Content-Language: en-US
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
In-Reply-To: <f3cdd944-5e68-49e5-bae8-4bc1f9f59131@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 27/2/24 21:47, Hans de Goede wrote:
> Hi,
> 
> On 2/27/24 02:06, Daniel van Vugt wrote:
>> On 27/2/24 02:23, Hans de Goede wrote:
>>> Hi All,
>>>
>>> On 2/2/24 09:53, Daniel van Vugt wrote:
>>>> Until now, deferred console takeover only meant defer until there is
>>>> output. But that risks stepping on the toes of userspace splash screens,
>>>> as console messages may appear before the splash screen. So check for the
>>>> "splash" parameter (as used by Plymouth) and if present then extend the
>>>> deferral until the first switch.
>>>
>>> Daniel, thank you for your patch but I do not believe that this
>>> is the right solution. Deferring fbcon takeover further then
>>> after the first text is output means that any errors about e.g.
>>> a corrupt initrd or the kernel erroring out / crashing will not
>>> be visible.
>>
>> That's not really correct. If a boot failure has occurred after the splash then
>> pressing escape shows the log.
> 
> Hmm, I guess this is with the latest plymouth which has a builtin terminal
> emulator for kernels without VT support ? Pressing ESC does not to a VC
> switch and AFAICT that is what you are triggering on to allow fbcon takeover
> after this patches.
> 
>> If a boot failure has occurred before the splash
>> then it can be debugged visually by rebooting without the "splash" parameter.
> 
> Which requires the user to know this and requires the user to know how to
> edit kernel cmdline parameters in e.g. grub. This is not a good user
> experience. We want inexperienced users to just be able to point
> a phone camera at the screen and take a picture of the errors.

As the person who contributes most to Ubuntu bug triage I have a pretty good
idea of what users experience. And when they do experience boot failures it's
either with a blank screen already (because userspace, not the kernel's fault),
or they report an error message to us that's not relevant to the real failure.

In both cases our users understand (or learn quickly) the ease with which they
can reboot either to recovery mode, or a previous kernel. We then direct them
to collect the full log of the failed boot. Because even if they were booting
with a full text console, most of those bugs don't reveal themselves on the
console. If they did then they'd be visible in the system journal along with
everything else.

What is not a "good user experience" is the boot messages people are shown on
every boot.

> 
> 
>>> When the kernel e.g. oopses or panics because of not finding
>>> its rootfs (I tested the latter option when writing the original
>>> deferred fbcon takeover code) then fbcon must takeover and
>>> print the messages from the dying kernel so that the user has
>>> some notion of what is going wrong.
>>
>> Indeed, just reboot without the "splash" parameter to do that.
> 
> Again not something beginning Linux users will be able to do,
> what happened to "Ubuntu: Linux for Human Beings" ?

It is more user-friendly than it sounds. Just reboot, trigger the grub menu and
select recovery mode or an older kernel (which is always available).

I think some boot failures also take you to the grub menu automatically next time?

> 
>>> And since your patch seems to delay switching till the first
>>> vc-switch this means that e.g. even after say gdm refusing
>>> to start because of issues there still will be no text
>>> output. This makes debugging various issues much harder.
>>
>> I've debugged many gdm failures and it is never useful to use the console for
>> those. Reboot and get the system journal instead.
> 
> But users will not see any errors now, meaning they don't
> even know where to begin with troubleshooting ...

Indeed. I deal with those users every day and they log their bugs against the
wrong components, understandably. We then work with them to triage and reassign
the issue to the right place.

> 
>>> Moreover Fedora has been doing flickerfree boot for many
>>> years without needing this.
>>
>> I believe Fedora has a mostly working solution, but not totally reliable, as
>> mentioned in the commit message:
>>
>> "even systems whose splash exists in initrd may not be not immune because they
>>  still rely on racing against all possible kernel messages that might
>>  trigger the fbcon takeover"
> 
> Only very serious kernel errors like oopses or panics will
> trigger the takeover and that is *exactly* what we want.
> 
> There is a race where plymouth may hide such vary serious
> messages, if plymouth does manage to start before the errors,
> but that is actually an existing issue which we don't want
> to make bigger by *always* hiding such errors.
> 
>>> The kernel itself will be quiet as long as you set
>>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
>>> to 4 which means any kernel pr_err() or dev_err()
>>> messages will get through and since there are quite
>>> a few false positives of those Ubuntu really needs
>>> to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
>>> https://bugs.launchpad.net/bugs/1970069
>>
>> Incorrect. In my testing some laptops needed log level as low as 2 to go quiet.
>> And the Ubuntu kernel team is never going to fix all those for non-sponsored
>> devices.
> 
> Notice that atm Ubuntu's kernel is using the too high
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4 with
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 getting any errors logged
> to the console should be very very rare.
> 
> The only thing I can think of is if the kernel oopses
> / WARN()s early on but the cause is innocent enough
> that the boot happily continues.
> 
> In that case actually showing the oops/WARN() is a good
> thing.
> 
> For all the years Fedora has had flickerfree boot I have
> seen zero bug reports about this. If you have examples
> of this actually being a problem please file bugs for
> them (launchpad or bugzilla.kernel.org is fine) and
> then lets take a look at those bugs and fix them.
> 
> These should be so rare that I'm not worried about this
> becoming a never ending list of bugs (unlike pr_err() /
> dev_err() messages of which there are simply too many).

I personally own many laptops with so many different boot messages that it's
overwhelming for me already to report bugs for each of them. Hence this patch.

Also I don't own all the laptops in the world, so fixing all the errors just
for my collection wouldn't solve all cases. Whereas this patch does.

> 
>>> After that it is "just" a matter of not making userspace
>>> output anything unless it has errors to report.
>>>
>>> systemd already is quiet by default (only logging
>>> errors) when quiet is on the kernel commandline.
>>
>> Unfortunately not true for Ubuntu. We carry a noisy systemd patch which I'm
>> told we can't remove in the short term:
>>
>> https://bugs.launchpad.net/ubuntu/+source/plymouth/+bug/1970069/comments/39
> 
> Well then make the patch less noisy? Suppressing non
> error message unless in debug mode should be easy
> even with a downstream patch.
> 
>> Thanks for your input, but I respectfully disagree and did consider these
>> points already.
> 
> Sorry, but your real problem here seems to be your
> noisy downstream systemd patch. I'm not going to ack
> a kernel patch which I consider a bad idea because
> Ubuntu has a non standard systemd patch which is
> to trigger happy with spamming the console.

Indeed the systemd patch is a big problem. We seem to have had it for 9 years
or so. I only just discovered it recently and would love to drop it, but was
told we can't. Its main problem is that it uses the console as a communication
pipe to plymouth. So simply making it less noisy isn't possible without
disabling its functionality. It was seemingly intended to run behind the
splash, but since it does fsck it tends to run before the splash (because DRM
startup takes a few more seconds).

> 
> So this is still a NACK from me.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
>>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>>> ---
>>>>  drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>>>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>>>> index 63af6ab034..5b9f7635f7 100644
>>>> --- a/drivers/video/fbdev/core/fbcon.c
>>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>>> @@ -76,6 +76,7 @@
>>>>  #include <linux/crc32.h> /* For counting font checksums */
>>>>  #include <linux/uaccess.h>
>>>>  #include <asm/irq.h>
>>>> +#include <asm/cmdline.h>
>>>>  
>>>>  #include "fbcon.h"
>>>>  #include "fb_internal.h"
>>>> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>>>>  
>>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>  static bool deferred_takeover = true;
>>>> +static int initial_console = -1;
>>>>  #else
>>>>  #define deferred_takeover false
>>>>  #endif
>>>> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>>>>  	console_unlock();
>>>>  }
>>>>  
>>>> -static struct notifier_block fbcon_output_nb;
>>>> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>>>>  static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>>>>  
>>>>  static int fbcon_output_notifier(struct notifier_block *nb,
>>>> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>>>  
>>>>  	return NOTIFY_OK;
>>>>  }
>>>> +
>>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>>> +				 unsigned long action, void *data)
>>>> +{
>>>> +	struct vc_data *vc = data;
>>>> +
>>>> +	WARN_CONSOLE_UNLOCKED();
>>>> +
>>>> +	if (vc->vc_num != initial_console) {
>>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>>>> +	}
>>>> +
>>>> +	return NOTIFY_OK;
>>>> +}
>>>>  #endif
>>>>  
>>>>  static void fbcon_start(void)
>>>> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>>>>  
>>>>  	if (deferred_takeover) {
>>>>  		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>>>> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>>> +		initial_console = fg_console;
>>>> +
>>>> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
>>>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>>>> +		else
>>>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>>>> +
>>>>  		return;
>>>>  	}
>>>>  #endif
>>>> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>>>>  {
>>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>  	console_lock();
>>>> -	if (deferred_takeover)
>>>> +	if (deferred_takeover) {
>>>>  		dummycon_unregister_output_notifier(&fbcon_output_nb);
>>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>> +	}
>>>>  	console_unlock();
>>>>  
>>>>  	cancel_work_sync(&fbcon_deferred_takeover_work);
>>>
>>
> 
