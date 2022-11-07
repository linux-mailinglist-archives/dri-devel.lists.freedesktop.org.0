Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5E61F137
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3BE10E2DB;
	Mon,  7 Nov 2022 10:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 10:54:54 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B70310E2E6;
 Mon,  7 Nov 2022 10:54:54 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667818024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnhu/C4/dTNGh+9YxTAUPF0AHXOgpdZiA4TofS1TDao=;
 b=m8gFAB2FYV5B4BIkkbSCrPl5kngI1vwmC89wOqBJ/q73+RRLDUvN8153YBd0ancpYaUudU
 +fTzmJoLwRrrXw9ulhVtc41yRIMLNrOmB9kVLUOAn2xwOs861TQYPTmwfVqoXOpGOLsPn5
 hNBacxD9XN6Mi6tXS/NIbwjqzso2C6oqm6/L/mt2cpmfqfHELnCL8o8Pn38Ir7+eD8OVqk
 Lj3kRr5Ls1MIF7+wsJc3Ym/BQIZf8UhWrd8aE7FpoY/qhjIfIvELeoa8/ZXUqY5eKhjinO
 ZF4FT08X0F8jeyihKYji9kBCreFY8X9nEznXEcECfWmIcYVRm4zXH9JmYOmiiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667818024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnhu/C4/dTNGh+9YxTAUPF0AHXOgpdZiA4TofS1TDao=;
 b=bzVvnuX1mysTSSrkmkIGsLumN3FZV+biUwiIDeLZdScudMhEXojJ3c4U7ytkUdHNPdLCjD
 NbhAMzPLE4OU4lBA==
To: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] treewide: timers: Use timer_shutdown*() before
 freeing timers
In-Reply-To: <20221106223256.4bbdb018@rorschach.local.home>
References: <20221106223256.4bbdb018@rorschach.local.home>
Date: Mon, 07 Nov 2022 11:47:04 +0100
Message-ID: <87pmdzvy6v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-afs@lists.infradead.org, linux-leds@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 bridge@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org, cgroups@vger.kernel.org,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-nfs@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus,

On Sun, Nov 06 2022 at 22:32, Steven Rostedt wrote:
> As discussed here:
>
>   https://lore.kernel.org/all/20221106212427.739928660@goodmis.org/

Please hold off. It's only nits, but tip has documented rules and random
pull requests are not making them go away.

Thanks,

        tglx
