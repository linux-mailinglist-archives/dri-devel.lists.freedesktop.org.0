Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AE142C0E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 14:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1036E951;
	Mon, 20 Jan 2020 13:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D906E951
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 13:27:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19946558-1500050 for multiple; Mon, 20 Jan 2020 13:27:20 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: Piper Fowler-Wright <piperfw@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200118202842.3pl5jcvl2bjxlgs3@thinkpad.localdomain>
In-Reply-To: <20200118202842.3pl5jcvl2bjxlgs3@thinkpad.localdomain>
Message-ID: <157952683738.2218.17820890800251279279@skylake-alporthouse-com>
Subject: Re: drm/i915 GPU hang
Date: Mon, 20 Jan 2020 13:27:17 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Piper Fowler-Wright (2020-01-18 20:28:42)
> I have recently (since the New Year) been experiencing regular GPU hangs
> which typically render the system unusable. 
> 
> During the hangs the kernel buffer is filled with messages of the form
> 
> [ 8269.599926] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
> [ 8269.600022] i915 0000:00:02.0: Resetting chip for hang on rcs0
> [ 8269.601827] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
> [ 8269.602595] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
> [ 8277.705805] i915 0000:00:02.0: Resetting rcs0 for hang on rcs0
> 

Sadly it is known and the backport of the fix seems to have slipped
through the stable@ cracks.

It should be fixed in 5.5, which is in -rc7 already so should be usable.
On the other hand, if the problem reoccurs, we need to use drm-tip as a
known baseline for patching anyway.

> etc.
> 
> Most recently the following message was displayed
> 
> [12796.753277] i915 0000:00:02.0: GPU HANG: ecode 9:1:0x00000000, hang on rcs0
> [12796.753281] GPU hangs can indicate a bug anywhere in the entire gfx stack, including userspace.
> [12796.753282] Please file a _new_ bug report on bugs.freedesktop.org against DRI -> DRM/Intel
> [12796.753283] drm/i915 developers can then reassign to the right component if it's not a kernel issue.
> [12796.753285] The GPU crash dump is required to analyze GPU hangs, so please always attach it.
> [12796.753286] GPU crash dump saved to /sys/class/drm/card0/error
> [12796.753304] i915 0000:00:02.0: Resetting rcs0 for hang on rcs0
> 
> Unfortunately, the /sys/class/drm/card0/error file contained only "No error
> state collected". 

It's only valid until the next reboot (since it's only kept in memory).
 
> bugs.freedesktop.org is no longer in operation so I decided to post here. Please
> redirect me to the correct list if this is one is not appropriate.

Fyi, the bug list is at gitlab.freedesktop.org/drm/intel now.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
