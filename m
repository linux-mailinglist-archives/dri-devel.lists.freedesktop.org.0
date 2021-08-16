Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E43ED0E3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 11:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258D4893D5;
	Mon, 16 Aug 2021 09:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 16 Aug 2021 08:29:30 UTC
Received: from omta012.uswest2.a.cloudfilter.net
 (omta012.uswest2.a.cloudfilter.net [35.164.127.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D9D89BB2;
 Mon, 16 Aug 2021 08:29:26 +0000 (UTC)
Received: from cxr.smtp.a.cloudfilter.net ([10.0.17.211]) by cmsmtp with ESMTP
 id FWt1myDJgfFugFXswmJoZZ; Mon, 16 Aug 2021 08:22:19 +0000
Received: from ws ([24.255.45.226]) by cmsmtp with ESMTPSA
 id FXsum0KTngQ8tFXsvmxHvt; Mon, 16 Aug 2021 08:22:18 +0000
Authentication-Results: cox.net; auth=pass (LOGIN)
 smtp.auth=1i5t5.duncan@cox.net
X-Authority-Analysis: v=2.4 cv=FL3ee8ks c=1 sm=1 tr=0 ts=611a203a
 a=rsvNbDP3XdDalhZof1p64w==:117 a=rsvNbDP3XdDalhZof1p64w==:17
 a=kj9zAlcOel0A:10 a=kviXuzpPAAAA:8 a=pGLkceISAAAA:8 a=eDshZfXNHJhCtg_awq0A:9
 a=CjuIK1q_8ugA:10 a=qrIFiuKZe2vaD64auk6j:22
Date: Mon, 16 Aug 2021 01:22:16 -0700
From: Duncan <1i5t5.duncan@cox.net>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Jason
 Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, Linux Kernel
 list <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION][BISECTED] 5.14.0-rc4 thru rc6 69de4421bb broke
Message-ID: <20210816012216.47babaf6@ws>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCA3p6Qy/wdzqHs2PjXrZSSeKX9Nsa+a9Ghxem2WRUDKFpKUbJGHjwtymlrLt9LZdlkwJqp3wocaxP7mIMnO+zY5CmXUAvVzPoKhkAgMlT9oMVJTAGIt
 wmLakeIEKEyGd4fEwGvJAyQQiOOiiLyn8AbEfGuif2QO9lKos5n4f1esG0vYu1E2B5sI7KoKadKSq47h3WA6WFDxkHK9xl/l0mA7tPDJKU8gkrWhRkWf15iM
 ndjxsV2fdquCTLibHuqIkk70wLJyrhLhhvGniBa8/P1QeoPDGexH2Mc31dcm+pQO6lfCcl5MlxyF7Vm1+j6fBx5T65rpCuJ+nUySHTmSmK0OzEXWNSzl3Fqi
 4wansc1n/owTuZyJT8O2/3KINbjr6bGyNdCbjtu6EprodJ5/Vz5uK14q30iC+uMHjZdufoEb6h9tt64aH+CrPQBAmm5JSg==
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:16:24 +0000
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

Duncan posted on Mon, 16 Aug 2021 07:58:37 +0000 as excerpted:

> Mikael Pettersson posted on Tue, 03 Aug 2021 08:54:18 +0200 as
> excerpted:
>> On Mon, Aug 2, 2021 at 8:29 PM Duncan <j.duncan@cox.net> wrote:
>>> Mikael Pettersson <mikpelinux@gmail.com> wrote...
>>> > Booting 5.14.0-rc4 on my box with Radeon graphics breaks with
>>> >
>>> > [drm:radeon_ttm_init [radeon]] *ERROR* failed initializing buffer
>>> > object driver(-19).
>>> > radeon 0000:01:00.0: Fatal error during GPU init
>>>
>>> Seeing this here too.  amdgpu on polaris-11, on an old amd-fx6100
>>> system.
>>>
>>> > after which the screen goes black for the rest of kernel boot and
>>> > early user-space init.
>>>
>>> *NOT* seeing that.  However, I have boot messages turned on by
>>> default and I see them as usual, only it stays in vga-console mode
>>> instead of switching to framebuffer after early-boot. I'm guessing
>>> MP has a high-res boot-splash which doesn't work in vga mode, thus
>>> the black-screen until the login shows up.
>> 
>> Yes, I have the Fedora boot splash enabled.
>> 
>>> > Once the console login shows up the screen is in some legacy
>>> > low-res mode and Xorg can't be started.
>>> >
>>> > A git bisect between v5.14-rc3 (good) and v5.14-rc4 (bad)
>>> > identified
>>> >
>>> > # first bad commit: [69de4421bb4c103ef42a32bafc596e23918c106f]
>>> > drm/ttm: Initialize debugfs from ttm_global_init()
>>> >
>>> > Reverting that from 5.14.0-rc4 gives me a working kernel again.
>>> >
>>> > Note that I have # CONFIG_DEBUG_FS is not set
>>>
>>> That all matches here, including the unset CONFIG_DEBUG_FS and
>>> confirming the revert on 5.14.0-rc4 works.
>> 
>> Thanks for the confirmation.
> 
> 69de44d1bb introduced a regression in rc4, reported to the list on
> August 2, that's still there in rc6.  It's also reported on kernel
> bugzilla as bug #214000.  No maintainer response either on-list or to
> the bug.  The commit was general ttm and the original post went to
> dri-devel and kernel,
> Jason E. and Daniel V., but all three user reports I've seen so far
> (two on-list and the bug reporter) are on amdgpu or radeon, so in an
> effort to at least get a response and hopefully a fix before release,
> I'm adding the amdgpu/radeon list and maintainers.
> 
> The bugzilla report confirmed that CONFIG_DEBUG_FS=y AND
> CONFIG_DEBUG_FS_ALLOW_ALL=y were *both* required to get a working
> kernel after that commit.  I and I believe the on-list reporter just
> reverted the commit in question, and kept our CONFIG_DEBUG_FS=n.

Trying again. I apologize if anyone gets this twice but I don't think
the first one made it at all (buggy client).

-- 
Duncan - List replies preferred.   No HTML msgs.
"Every nonfree program has a lord, a master --
and if you use the program, he is your master."  Richard Stallman
