Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E466868585
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 02:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1CF10F188;
	Tue, 27 Feb 2024 01:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="n+wRXJm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9510F188
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:06:50 +0000 (UTC)
Received: from [192.168.178.2] (unknown [58.7.187.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 715913FBB1; 
 Tue, 27 Feb 2024 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1708996007;
 bh=JPI0TIq/AS3U6NVorLva8uA3bgYOgG/blVsTCa7sRoo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=n+wRXJm9JkMeOwF0boDflNkPPkYPFS4IZHMFq/hxpENkuoEY3U/pS0LFm3SMUF/I2
 VHFHC7PutVal5BLgJpFPE8yqdeJaJ0ZcZTSaLuIRMCY1cEbwdKbQYrHuq2mT/ybWS+
 9E5Iq5dZ38I/Pu09AhHuxjoZSdDnYHDPgRgS3CIOyWyj41RvdYTkQQyl8pjZtiVtbx
 1bDxo80mvGuikzBbjV4eoyON1KIGGCO/rTycJZO0eELQi5Wwq9w37p8pw5k6yssUeY
 l1SSoHwHDPDEnXkbM0snl3YQkqm3vgsERNhq5p/KfCf9zD75WLjDBh7Ixt3hYSxMtE
 34kYJ2O4XzH+w==
Message-ID: <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
Date: Tue, 27 Feb 2024 09:06:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sebastien Bacher <seb128@ubuntu.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
 <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
In-Reply-To: <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
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

On 27/2/24 02:23, Hans de Goede wrote:
> Hi All,
> 
> On 2/2/24 09:53, Daniel van Vugt wrote:
>> Until now, deferred console takeover only meant defer until there is
>> output. But that risks stepping on the toes of userspace splash screens,
>> as console messages may appear before the splash screen. So check for the
>> "splash" parameter (as used by Plymouth) and if present then extend the
>> deferral until the first switch.
> 
> Daniel, thank you for your patch but I do not believe that this
> is the right solution. Deferring fbcon takeover further then
> after the first text is output means that any errors about e.g.
> a corrupt initrd or the kernel erroring out / crashing will not
> be visible.

That's not really correct. If a boot failure has occurred after the splash then
pressing escape shows the log. If a boot failure has occurred before the splash
then it can be debugged visually by rebooting without the "splash" parameter.

> 
> When the kernel e.g. oopses or panics because of not finding
> its rootfs (I tested the latter option when writing the original
> deferred fbcon takeover code) then fbcon must takeover and
> print the messages from the dying kernel so that the user has
> some notion of what is going wrong.

Indeed, just reboot without the "splash" parameter to do that.

> 
> And since your patch seems to delay switching till the first
> vc-switch this means that e.g. even after say gdm refusing
> to start because of issues there still will be no text
> output. This makes debugging various issues much harder.

I've debugged many gdm failures and it is never useful to use the console for
those. Reboot and get the system journal instead.

> 
> Moreover Fedora has been doing flickerfree boot for many
> years without needing this.

I believe Fedora has a mostly working solution, but not totally reliable, as
mentioned in the commit message:

"even systems whose splash exists in initrd may not be not immune because they
 still rely on racing against all possible kernel messages that might
 trigger the fbcon takeover"

> 
> The kernel itself will be quiet as long as you set
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
> to 4 which means any kernel pr_err() or dev_err()
> messages will get through and since there are quite
> a few false positives of those Ubuntu really needs
> to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
> https://bugs.launchpad.net/bugs/1970069

Incorrect. In my testing some laptops needed log level as low as 2 to go quiet.
And the Ubuntu kernel team is never going to fix all those for non-sponsored
devices.

> 
> After that it is "just" a matter of not making userspace
> output anything unless it has errors to report.
> 
> systemd already is quiet by default (only logging
> errors) when quiet is on the kernel commandline.

Unfortunately not true for Ubuntu. We carry a noisy systemd patch which I'm
told we can't remove in the short term:

https://bugs.launchpad.net/ubuntu/+source/plymouth/+bug/1970069/comments/39

> 
> So any remaining issues are Ubuntu specific boot
> process bits and Ubuntu really should be able to
> make those by silent unless they have important
> info (errors or other unexpected things) to report.
> 
> Given that this will make debugging boot issues
> much harder and that there are other IMHO better
> alternatives I'm nacking this patch: NACK.
> 
> FWIW I believe that I'm actually saving Ubuntu
> from shooting themselves in the foot here,
> hiding all sort of boot errors (like the initrd
> not finding /) until the user does a magic
> alt+f2 followed by alt+f1 incantation really is
> not doing yourself any favors wrt debugging any
> sort of boot failures.
> 
> Regards,
> 
> Hans

Thanks for your input, but I respectfully disagree and did consider these
points already.

- Daniel

> 
> 
> 
> 
> 
>> Closes: https://bugs.launchpad.net/bugs/1970069
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 63af6ab034..5b9f7635f7 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -76,6 +76,7 @@
>>  #include <linux/crc32.h> /* For counting font checksums */
>>  #include <linux/uaccess.h>
>>  #include <asm/irq.h>
>> +#include <asm/cmdline.h>
>>  
>>  #include "fbcon.h"
>>  #include "fb_internal.h"
>> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>>  
>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>  static bool deferred_takeover = true;
>> +static int initial_console = -1;
>>  #else
>>  #define deferred_takeover false
>>  #endif
>> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>>  	console_unlock();
>>  }
>>  
>> -static struct notifier_block fbcon_output_nb;
>> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>>  static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>>  
>>  static int fbcon_output_notifier(struct notifier_block *nb,
>> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>  
>>  	return NOTIFY_OK;
>>  }
>> +
>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>> +				 unsigned long action, void *data)
>> +{
>> +	struct vc_data *vc = data;
>> +
>> +	WARN_CONSOLE_UNLOCKED();
>> +
>> +	if (vc->vc_num != initial_console) {
>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>>  #endif
>>  
>>  static void fbcon_start(void)
>> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>>  
>>  	if (deferred_takeover) {
>>  		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>> +		initial_console = fg_console;
>> +
>> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>> +		else
>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>> +
>>  		return;
>>  	}
>>  #endif
>> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>>  {
>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>  	console_lock();
>> -	if (deferred_takeover)
>> +	if (deferred_takeover) {
>>  		dummycon_unregister_output_notifier(&fbcon_output_nb);
>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>> +	}
>>  	console_unlock();
>>  
>>  	cancel_work_sync(&fbcon_deferred_takeover_work);
> 
