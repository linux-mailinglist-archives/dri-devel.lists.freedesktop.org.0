Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2CD62B5B8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34E10E448;
	Wed, 16 Nov 2022 08:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Wed, 16 Nov 2022 08:56:15 UTC
Received: from abrecht.li (75-128-16-94.static.cable.fcom.ch [94.16.128.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2124010E448
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:56:14 +0000 (UTC)
Received: from mail.abrecht.li (unknown [IPv6:fc00:4::a3c:103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id F25572D61423;
 Wed, 16 Nov 2022 08:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li F25572D61423
MIME-Version: 1.0
Date: Wed, 16 Nov 2022 09:48:45 +0100
From: Daniel Abrecht <freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: do not branch based on the value of
 current->comm[0]
In-Reply-To: <20221105222012.4226-1-Jason@zx2c4.com>
References: <20221105222012.4226-1-Jason@zx2c4.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <26ef4a7059dd995731e2d4426c2400b2@abrecht.li>
X-Sender: freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-api@vger.kernel.org,
 =?UTF-8?Q?Michel_D=C3=A4nz?= =?UTF-8?Q?er?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-11-05 23:20, schrieb Jason A. Donenfeld:
> This reverts 26b1d3b527e7 ("drm/atomic: Take the atomic toys away from 
> X")

I'm in favor of reverting this commit. I've tried to get allowing to 
enable atomic in Xorg again in there in the past: 
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/533

I've no illusions of getting this through though, after all mostly the 
same people control what's merged into Xorg, what drm stuff gets into 
the kernel and who disabled it in the kernel in the first place. And 
there doesn't seem much interest in dealing with anything Xorg either, 
in the merge request I linked, someone even called Xorg "abandonware". 
This is also why I didn't respond here until now.

I do see value in enabling this. When I looked at this 2 years ago, 
there were situations where enabling atomic brought clear improvements, 
and I would expect that it can still improve performance on some special 
systems. I think the users should have the option to use it if they want 
or need to.

There is also the concern that this may cause a regression, but I would 
argue, that there never was a regression to be fixed here in the first 
place. There may have been that one broken application in the past, but 
it was just that, a broken application, not something broken by the 
kernel. I do not think the kernel should modify it's behavior just to 
work around bugs in a specific program, which have always existed, and 
didn't come from a changer in behavior of the kernel APIs. If a program 
was written wrongly, the program should be fixed, and in case of Xorg, I 
think it is fixed already.

This probably won't mean much coming from me, but:
Acked-by: Daniel Abrecht <public@danielabrecht.ch>
