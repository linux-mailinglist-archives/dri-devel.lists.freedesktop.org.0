Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6684C7EC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABC51131A2;
	Wed,  7 Feb 2024 09:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sk+aaTUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E1E10FE43
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:51:21 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33b182249a1so168341f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707299480; x=1707904280; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EkQyZ0MI8wRFHDASNpaqF76TZwJQiavWYlONDY7LM2I=;
 b=Sk+aaTUnIKvDMSoEx3yLCSYMu0rLKVpbJMkK82SRqmHS8q0ceZadRJ4C1Ju/XEeULx
 k41+NH8o+F2MI48yaa+Z62YStKFolpUx6n65pkJyOosJdnSUMLbpGMuWF5NRjCmGiK5Y
 f4aWdrMv7vXRmL2Rr8aakQACR6TJoZ5yz3dSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707299480; x=1707904280;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EkQyZ0MI8wRFHDASNpaqF76TZwJQiavWYlONDY7LM2I=;
 b=bID1gPjyOahgmW63ZL2Oq1Q4EQf3gD5oZYBlWYx5XCxLCV+S6Kbmqyzzw54SpTa7tX
 J7l6Nr0o0psgPWGPU3Fb18FGFlJJs5WxQK5pHTNmKKbY9Usycd6jgANQqstIjWiu8ryS
 aKCWkTWnVLPA0o8NMAdXnqqE58PN7A/X9DWk3FeAf1feSqUULNTvrPcKIa+wM2uW2pzB
 TZ8pnUKCI1HqnhBGcMBrCiZkQnmmhCaCd7FbinI6NMQzodE/TAsPauMB8hRrWAWEQPdB
 onVt4T6r17pfw53BiOTqjEP5KHEDWi/lNtio5TlgnL3/4Oi8OhohNtw/KWJ6gw35OXRz
 xTcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuXka63+xdMvcV04aBza0ol54M5FogYKLOdM4kqmKfL/sLc9mtc7YoF7qtejKiaIZ/otnnEsb6ORPQ6roPJY96bMuTg2w5Qylk3leS0X22
X-Gm-Message-State: AOJu0YwfbyPi7cZY8FrPrZNufEPAWx4kD6LnsrBtdcnDVciQuPXSRoIU
 n3dGX/1ULmp8l43b/9m5V5crvZuqmo9o4/t4wnAch3CfA5zA9IzhLx8yC/65cK0=
X-Google-Smtp-Source: AGHT+IHzZD0/QGe4QfxJf2FGQ+9awumjnvEMUAE5C8QxyXTwcil3ikG8lIlJkOybUxWfoeEKCUpSnQ==
X-Received: by 2002:adf:e481:0:b0:33b:50e9:738 with SMTP id
 i1-20020adfe481000000b0033b50e90738mr326080wrm.7.1707299479636; 
 Wed, 07 Feb 2024 01:51:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUN+wH4FMpYY1KvrFGNMyc5TEF8rohsy3qqHObc/Mx0XKUvKZvceDJDWvcdR35GH3U42vZP3qkGdnM/yZfV7gWl+L1fyFhthC/1glV0IAzfr1E83jrD9Fy8wkbNVgKaen2KcXeWOE2rwSvY7FPUgv86bUJvTroJaLLwyXKgy66gpZTyG0w3VSgRHUDEQQcgDrQTrG3sfukcb6+VEgnMjQJxDjB6u7vkTF16ZdJiv5SD+mBW2rBHzq288HDIVnhGys3ht2RV6oeuVMzWUckWmbJEat7SVtRrht0oCHsymBhZOqlvFzEnZR25ZqXyX04q
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b0033b3c03053esm1062568wrx.78.2024.02.07.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:51:19 -0800 (PST)
Date: Wed, 7 Feb 2024 10:51:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Message-ID: <ZcNSleQOrBtSn3uM@phenom.ffwll.local>
Mail-Followup-To: Daniel van Vugt <daniel.van.vugt@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
 <20240206101100.25536-2-daniel.van.vugt@canonical.com>
 <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
 <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
 <26893900-2d0d-4624-94f1-c4aa88386e9c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26893900-2d0d-4624-94f1-c4aa88386e9c@canonical.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Wed, Feb 07, 2024 at 10:03:10AM +0800, Daniel van Vugt wrote:
> On 6/2/24 23:41, Mario Limonciello wrote:
> > On 2/6/2024 08:21, Daniel Vetter wrote:
> >> On Tue, Feb 06, 2024 at 06:10:51PM +0800, Daniel van Vugt wrote:
> >>> Until now, deferred console takeover only meant defer until there is
> >>> output. But that risks stepping on the toes of userspace splash screens,
> >>> as console messages may appear before the splash screen. So check the
> >>> command line for the expectation of userspace splash and if present then
> >>> extend the deferral until after the first switch.
> >>>
> >>> V2: Added Kconfig option instead of hard coding "splash".
> >>>
> >>> Closes: https://bugs.launchpad.net/bugs/1970069
> >>> Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
> >>> ---
> >>>   drivers/video/console/Kconfig    | 13 +++++++++++
> >>>   drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
> >>>   2 files changed, 49 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> >>> index bc31db6ef7..a6e371bfb4 100644
> >>> --- a/drivers/video/console/Kconfig
> >>> +++ b/drivers/video/console/Kconfig
> >>> @@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> >>>         by the firmware in place, rather then replacing the contents with a
> >>>         black screen as soon as fbcon loads.
> >>>   +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> >>> +    string "Framebuffer Console Deferred Takeover Condition"
> >>> +    depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> >>> +    default "splash"
> >>> +    help
> >>> +      If enabled this defers further the framebuffer console taking over
> >>> +      until the first console switch has occurred. And even then only if
> >>> +      text has been output, and only if the specified parameter is found
> >>> +      on the command line. This ensures fbcon does not interrupt userspace
> >>> +      splash screens such as Plymouth which may be yet to start rendering
> >>> +      at the time of the first console output. "splash" is the simplest
> >>> +      distro-agnostic condition for this that Plymouth checks for.
> >>
> >> Hm this seems a bit strange since a lot of complexity that no one needs,
> >> also my impression is that it's rather distro specific how you want this
> >> to work. So why not just a Kconfig option that lets you choose how much
> >> you want to delay fbcon setup, with the following options:
> >>
> >> - no delay at all
> >> - dely until first output from the console (which then works for distros
> >>    which set a log-level to suppress unwanted stuff)
> >> - delay until first vt-switch. In that case I don't think we also need to
> >>    delay for first output, since vt switch usually means you'll get first
> >>    output right away (if it's a vt terminal) or you switch to a different
> >>    graphical console (which will keep fbcon fully suppressed on the drm
> >>    side).
> >>
> 
> I had similar thoughts, and had prototyped some of this already. But in the end
> it felt like extra complexity there was no demand for.

For me this one is a bit too complex, since if you enable the vt switch
delay you also get the output delay on top. That seems one too much and I
can't come up with a use-case where you actually want that. So just a
choice of one or the other or none feels cleaner.

> If you would like to specify the preferred Kconfig design then I can implement
> it. Though I don't think there is an enumeration type. It could also be a
> runtime enumeration (deferred_takeover) controlled by fbcon=something.

There's a choice in Kconfig, see e.g. kernel/Kconfig.hz for an example.

> > IIUC there is an "automatic" VT switch that happens with Ubuntu GRUB + Ubuntu
> > kernels.
> > 
> > Why?
> > 
> > Couldn't this also be suppressed by just not doing that?
> 
> I have not seen any automatic VT switches in debugging but now that you mention
> it I was probably only debugging on drm-misc-next and not an Ubuntu kernel.

Hm but I don't see how the output delay would paper over a race (if there
is one) reliable for this case? If you do vt switch for boot splash or
login screen and don't yet have drm opened for display or something like
that, then fbcon can sneak in anyway ...

Cheers, Sima
> 
> - Daniel
> 
> > 
> >> I think you could even reuse the existing
> >> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER for this, and then just
> >> compile-time select which kind of notifier to register (well plus the
> >> check for "splash" on the cmdline for the vt switch one I guess).
> >>
> >> Thoughts?
> >>
> >> Cheers, Sima
> >>
> >>
> >>> +
> >>>   config STI_CONSOLE
> >>>       bool "STI text console"
> >>>       depends on PARISC && HAS_IOMEM
> >>> diff --git a/drivers/video/fbdev/core/fbcon.c
> >>> b/drivers/video/fbdev/core/fbcon.c
> >>> index 63af6ab034..98155d2256 100644
> >>> --- a/drivers/video/fbdev/core/fbcon.c
> >>> +++ b/drivers/video/fbdev/core/fbcon.c
> >>> @@ -76,6 +76,7 @@
> >>>   #include <linux/crc32.h> /* For counting font checksums */
> >>>   #include <linux/uaccess.h>
> >>>   #include <asm/irq.h>
> >>> +#include <asm/cmdline.h>
> >>>     #include "fbcon.h"
> >>>   #include "fb_internal.h"
> >>> @@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct
> >>> notifier_block *nb,
> >>>         return NOTIFY_OK;
> >>>   }
> >>> +
> >>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> >>> +static int initial_console;
> >>> +static struct notifier_block fbcon_switch_nb;
> >>> +
> >>> +static int fbcon_switch_notifier(struct notifier_block *nb,
> >>> +                 unsigned long action, void *data)
> >>> +{
> >>> +    struct vc_data *vc = data;
> >>> +
> >>> +    WARN_CONSOLE_UNLOCKED();
> >>> +
> >>> +    if (vc->vc_num != initial_console) {
> >>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> >>> +        dummycon_register_output_notifier(&fbcon_output_nb);
> >>> +    }
> >>> +
> >>> +    return NOTIFY_OK;
> >>> +}
> >>> +#endif
> >>>   #endif
> >>>     static void fbcon_start(void)
> >>> @@ -3370,7 +3391,16 @@ static void fbcon_start(void)
> >>>         if (deferred_takeover) {
> >>>           fbcon_output_nb.notifier_call = fbcon_output_notifier;
> >>> -        dummycon_register_output_notifier(&fbcon_output_nb);
> >>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> >>> +        if (cmdline_find_option_bool(boot_command_line,
> >>> +              CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
> >>> +            initial_console = fg_console;
> >>> +            fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
> >>> +            dummycon_register_switch_notifier(&fbcon_switch_nb);
> >>> +        } else
> >>> +#endif
> >>> +            dummycon_register_output_notifier(&fbcon_output_nb);
> >>> +
> >>>           return;
> >>>       }
> >>>   #endif
> >>> @@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
> >>>   {
> >>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> >>>       console_lock();
> >>> -    if (deferred_takeover)
> >>> +    if (deferred_takeover) {
> >>>           dummycon_unregister_output_notifier(&fbcon_output_nb);
> >>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> >>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> >>> +#endif
> >>> +    }
> >>>       console_unlock();
> >>>         cancel_work_sync(&fbcon_deferred_takeover_work);
> >>> -- 
> >>> 2.43.0
> >>>
> >>
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
