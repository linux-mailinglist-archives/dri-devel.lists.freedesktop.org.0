Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E773DDFD6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 21:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11126E06B;
	Mon,  2 Aug 2021 19:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 18:36:14 UTC
Received: from omta014.useast.a.cloudfilter.net
 (omta014.useast.a.cloudfilter.net [34.195.253.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E10A6E0EA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 18:36:14 +0000 (UTC)
Received: from cxr.smtp.a.cloudfilter.net ([10.0.17.147]) by cmsmtp with ESMTP
 id AbeMmD45o67fKAcgUmxBXA; Mon, 02 Aug 2021 18:29:06 +0000
Received: from ws ([24.255.45.226]) by cmsmtp with ESMTPSA
 id AcgSmMZ2YUuJWAcgTmiQl4; Mon, 02 Aug 2021 18:29:06 +0000
Authentication-Results: cox.net; auth=pass (LOGIN) smtp.auth=j.duncan@cox.net
X-Authority-Analysis: v=2.4 cv=cO0lDnSN c=1 sm=1 tr=0 ts=61083972
 a=rsvNbDP3XdDalhZof1p64w==:117 a=rsvNbDP3XdDalhZof1p64w==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=G4gGlADBVhTulWZLwAIA:9 a=CjuIK1q_8ugA:10
Date: Mon, 2 Aug 2021 11:29:04 -0700
From: Duncan <j.duncan@cox.net>
To: mikpelinux@gmail.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 jason@jlekstrand.net, linux-kernel@vger.kernel.org
Subject: Re: [BISECTED] 5.14.0-rc4 broke drm/ttm when !CONFIG_DEBUG_FS
Message-ID: <20210802112904.110028a4@ws>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-pc-linux-gnu)
In-Reply-To: <CAM43=SNDAcS952MZpsiD2Z-WU9Bd0EPv=7Z86i7FGdvDtsSXdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKOHvzWWmenb48sQIRdupwA5msxYl4omOjmeMvA8D0vxAtj2OhZKoOJ8REd3ujvkJ3Cfxi465To0ng2WLaRfFGIk0WfOwOX4rSvuYheg+HSiRRzqQZHk
 UVuQhEW9RskCZvTiP8kMocVMUfBik45ijgE/gSKQl8/dqKZuwZv+MyXfXSMEmrckcMhU8qZTBBAsCrncJQMmB24/dllnTa2RzE4zBpZ9xSB/8kj6DC0vReiR
 mbmDc82G/XSvPRkqMc48NviC99EXTmiO++noA77BUVhEoIW+Si6428uV6bCBe+TJsspDujbv88H3hgE32VFk19FbIkDUHoKS6heKF8c4kU4=
X-Mailman-Approved-At: Mon, 02 Aug 2021 19:07:20 +0000
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

[Not subscribed so please CC me.  Manual quoting after using lore's
in-reply-to functionality.  First time doing that so hope I got it
right.]

Mikael Pettersson <mikpelinux@gmail.com> wrote...
> Booting 5.14.0-rc4 on my box with Radeon graphics breaks with
> 
> [drm:radeon_ttm_init [radeon]] *ERROR* failed initializing buffer
> object driver(-19).
> radeon 0000:01:00.0: Fatal error during GPU init

Seeing this here too.  amdgpu on polaris-11, on an old amd-fx6100
system.

> after which the screen goes black for the rest of kernel boot
> and early user-space init.

*NOT* seeing that.  However, I have boot messages turned on by default
and I see them as usual, only it stays in vga-console mode instead of
switching to framebuffer after early-boot. I'm guessing MP has a
high-res boot-splash which doesn't work in vga mode, thus the
black-screen until the login shows up.

> Once the console login shows up the screen is in some legacy low-res
> mode and Xorg can't be started.
>
> A git bisect between v5.14-rc3 (good) and v5.14-rc4 (bad) identified
> 
> # first bad commit: [69de4421bb4c103ef42a32bafc596e23918c106f]
> drm/ttm: Initialize debugfs from ttm_global_init()
> 
> Reverting that from 5.14.0-rc4 gives me a working kernel again.
> 
> Note that I have
> # CONFIG_DEBUG_FS is not set

That all matches here, including the unset CONFIG_DEBUG_FS and
confirming the revert on 5.14.0-rc4 works.

-- 
Duncan - HTML messages treated as spam
"They that can give up essential liberty to obtain a little
temporary safety, deserve neither liberty nor safety."
Benjamin Franklin
