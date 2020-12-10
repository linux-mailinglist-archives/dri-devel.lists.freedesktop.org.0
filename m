Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9422D60C8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5B36EA90;
	Thu, 10 Dec 2020 16:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12F16E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:01:43 +0000 (UTC)
Date: Thu, 10 Dec 2020 16:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607616102;
 bh=qtOM3E/kXoCe3ja09Lpz/w9hk2IhuaiBbAzwEq/fF6I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GUKlYKvKfcwPXhjL5qKch5OIPr+2pI1LTO4ZrzG9FIOlk9RIwh2LsGgR0w4McKOr3
 zCe9w9etVVv2Ti7GrYDUA954ymCf214t5/tM+4EqyRREFqDUiANCPj4d4tHSjM8XfN
 IcDBtHtlrOmQBTWaznntIyxZOorsf4Wu80OhK6IRo4vyylw4SlXNEE9P9g8Qo3Yu6s
 NwiwlncX2iSDHMk3oFCvanqSYZWTIaIu+wz5gH6dqSNIhChXBwaOD+5iExuYxXIndb
 eZyRndFdkIRPOVcyU9O0rXXpUfiY1Nx3B9SffYwxanF6rqKsMMKTb5gSKBZtEVeIUL
 rHNEl1yrsNaxw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <a1cgjxn5FymwxdC5i0QvhamqzSBWY1Sf0_1m8u8NciKXiWaaZOqCit3OOxd9gqrHrGofFraBoIPBhL8pNueHKsIr4xE0SvKJNf2XtCQysQ0=@emersion.fr>
In-Reply-To: <CAKMK7uFywgzd3JvACQLFupX6C9Cz_+XVHDV34XvNJHXv3TfXdQ@mail.gmail.com>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
 <20201209194030.GV401619@phenom.ffwll.local>
 <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
 <CAKMK7uFywgzd3JvACQLFupX6C9Cz_+XVHDV34XvNJHXv3TfXdQ@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, December 10th, 2020 at 4:56 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> Huh so crtc are registered forward and planes backward? I guess adding
> amd people. And yeah sounds like defacto you can't figure out which
> primary plane goes to which crtc, and we just take whatever goes.
> Maybe that stricter approach with more guarantees just doesn't work,
> ship sailed already :-/

Yeah. Even if we fixed the amdgpu driver and added the check, user-space still
couldn't have the guarantee that it can associate the n-th primary plane with
the n-th CRTC, because it might run with an old kernel.

If we really wanted to allow user-space to discover the internal
->{primary,cursor} pointers, I think we should just expose a new property. That
way, the uAPI would be a lot more explicit and a lot less guessing. The cost is
that it wouldn't work on older kernels, but with amdgpu user-space can't rely
on the implicit rule you've suggested anyways.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
