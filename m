Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27FB5A6439
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CB810E0CE;
	Tue, 30 Aug 2022 12:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB6210E0BF;
 Tue, 30 Aug 2022 12:58:59 +0000 (UTC)
Date: Tue, 30 Aug 2022 12:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661864337; x=1662123537;
 bh=JbJ8pny8WkXF+APpWNNDBSQ1nzirbBno8I1tYwCiudk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=QHa5bdYVErtJQJIPVUSczJuIzaH2i8OleeuHTi6gw6EdDCltSbUhHW5bOJpKsnVIk
 s3gQ48uLHseOE87Pi3SfGSEdD4bjYyL3uewjrHvB3viTMgBA2w7923nsVPUb1uzLbb
 v/utRlVWaQeY9fzrpegr2w1uZMEPkcMiKXUr1JOYQI2qyE9sWv6ftIMlngnPYQ8plu
 f4ketQ++kFLy/RAf+JuwZUsY/xLRLC8iBUqMYRwfQxOmjhgip3qZvmmWMPP3pc9L9k
 19PFpk7goWNft763nbO27GKZbqovX3rlnWpGi8h5Qrmdti/MTwtACAxY0yUVApu/rL
 MnzWEiUvrCUxg==
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <fuMqV8ApgDP5KbyvpvUtqTrigZjHfbW14uWyOuphpw8cSl39nUUWgtyTLbfC32BKFiKD-NcmydNkJQAZ9Q5nb0nz7gkiXth2HQyOsRI0Lj8=@emersion.fr>
In-Reply-To: <f7465260-5f5b-44da-4119-7bae9c8e9c8d@mailbox.org>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr> <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
 <f7465260-5f5b-44da-4119-7bae9c8e9c8d@mailbox.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, joshua@froggi.es, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Oops, I replied to the wrong thread. Re-sending to the correct one.)

On Tuesday, August 30th, 2022 at 10:41, Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org> wrote:

> > For the atomic uAPI, we need to pick on of these two approaches:
> >
> > 1. Let the kernel fall back to a sync flip if async isn't possible. Thi=
s
> >    simplifies user-space, but then user-space has no reliable way to fi=
gure out
> >    what really happened (sync or async?). That could be fixed with a ne=
w
> >    read-only CRTC prop indicating whether the last flip was async or no=
t.
> >    However, maybe someone will come up in the future with user-space wh=
ich
> >    needs to only apply an update if async flip is possible, in which ca=
se this
> >    approach falls short.
>
> The future is now. :)
>
> As I described in the documentation patch discussion, this approach would
> make it tricky for a Wayland compositor to decide if it should use an asy=
nc
> commit (which needs to be done ASAP to serve the intended purpose) or not=
 (in
> which case the compositor may want to delay the commit as long as possibl=
e
> for minimal latency).

Ah right. If an async page-flip is not possible, then a Wayland compositor
could want to wait the "last moment" before the next vblank to see if a mor=
e
up-to-date buffer is available.

With that + Xorg usage, I think we have a rather solid case for failing asy=
nc
flips rather than silently falling back to vsync.
