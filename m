Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FB11BB26
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 19:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8DF6E503;
	Wed, 11 Dec 2019 18:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657876E503
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:10:49 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA99E206C3;
 Wed, 11 Dec 2019 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576087849;
 bh=ge1kzVjxLXJX/q4avcgPuTPlbn4lhTQft8vdkDKA100=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M4aDxn13Tms3hLAmF7jdZtngCN2gVnijqznuqd51pXDjxXCfccegj8E7mBH7SCle4
 JxP+7Qqrhb8ek/N6y7S18aMB1ZdxicAFmAAM417etRMmfiLJDMdQfLdBxLYGA+Vf5j
 TjJcKECcfkKg9dtvN7rWCTzcdyOuxA0fKM/SnZmQ=
Date: Wed, 11 Dec 2019 19:10:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] drm/modes: Support video parameters with only reflect
 option
Message-ID: <20191211181046.xhlzc74m75lb525c@gilmour.lan>
References: <20191209183254.211428-1-stephan@gerhold.net>
 <20191210102046.fu5s4hzwcdfnv5zz@gilmour.lan>
 <20191210104237.GA228968@gerhold.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210104237.GA228968@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephan,

On Tue, Dec 10, 2019 at 11:42:37AM +0100, Stephan Gerhold wrote:
> On Tue, Dec 10, 2019 at 11:20:46AM +0100, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Dec 09, 2019 at 07:32:54PM +0100, Stephan Gerhold wrote:
> > > At the moment, video mode parameters like video=540x960,reflect_x,
> > > (without rotation set) are silently ignored.
> > >
> > > One of the reasons for this is that the calculation that
> > > combines the panel_orientation with cmdline->rotation_reflection
> > > does not handle the case when cmdline->rotation_reflection does
> > > not have any rotation set.
> > > (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
> > >
> > > Example:
> > >   *rotation = DRM_MODE_ROTATE_0 (no panel_orientation)
> > >   cmdline->rotation_reflection = DRM_MODE_REFLECT_X (video=MODE,reflect_x)
> > >
> > > The current code does:
> > >   panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> > >   cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
> > >   sum_rot = (panel_rot + cmdline_rot) % 4;
> > >
> > > and therefore:
> > >   panel_rot = ilog2(DRM_MODE_ROTATE_0) = ilog2(1) = 0
> > >   cmdline_rot = ilog2(0) = -1
> > >   sum_rot = (0 + -1) % 4 = -1 % 4 = 3
> > >    ...
> > >   *rotation = DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X
> > >
> > > So we incorrectly generate DRM_MODE_ROTATE_270 in this case.
> > > To prevent cmdline_rot from becoming -1, we need to treat
> > > the rotation as DRM_MODE_ROTATE_0.
> > >
> > > On the other hand, there is no need to go through that calculation
> > > at all if no rotation is set in rotation_reflection.
> > > A simple XOR is enough to combine the reflections.
> > >
> > > Finally, also allow DRM_MODE_ROTATE_0 in the if statement below.
> > > DRM_MODE_ROTATE_0 means "no rotation" and should therefore not
> > > require any special handling (e.g. specific tiling format).
> > >
> > > This makes video parameters with only reflect option work correctly.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> >
> > Thanks for that commit message.
> >
> > Can you also add a selftest to make sure we don't get a regression in
> > the future?
>
> Can you explain how/where I would add a test for drm_client_rotation()
> in drm_client_modeset.c? I'm not familiar with selftests to be honest.
>
> I found test-drm_cmdline_parser.c but that seems to cover only the
> cmdline parsing (which is working correctly already).

The cmdline here is the kernel command line. You were mentionning in
your commit log that video=540x960,reflect_x was broken?

But yeah, I meant this one.

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
