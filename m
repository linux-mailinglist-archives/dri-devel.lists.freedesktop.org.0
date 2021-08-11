Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F03E9A7A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 23:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DE26E1D6;
	Wed, 11 Aug 2021 21:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687A66E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 21:44:23 +0000 (UTC)
Date: Wed, 11 Aug 2021 21:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1628718261;
 bh=sP/ghrLUTDwIXGwfegYgP08hVzz/lmEH7KVQd+goS+w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=aN25tC3ujLNt9aJfs0KTCnMaw1t/VThydH+WF1E+pFyecLOy6dD49P3+19axeEQDh
 YPOKI3jBiQHCn6X7ceqHPaLsfqNfqbJTl+EzvuFzSMWrBzKXLJDXnLXDj5F9t+ZSz6
 2zqD52xk4MshBIlWpfzTZKW0qhbr8bYdx+6KzEHn2K862HYRNlCtM2wyrF3Ycf3WWi
 ZT0Vy8a1OMMrvT04W/Qu7tzy5Yp2IAN5zP8ngugTD4TikmVYSAcQrijHVPLqt1PPtF
 IGov9v8itG4aFmq1K/GOhjapM2r1dzNGgnBms2u/RlhpicgGPZDbQfmNXzMU9JRxNL
 D0ynrnINdzYSA==
To: John Cox <jc@kynesim.co.uk>
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Message-ID: <LpwasH5AmXuOZj29Gbc6zHVTqgUaTCqTzzRpNGkQQIOvqLddtYun_eiQq0n4p9n0AcX8mr1MDThylGfYGSXO5kR-pgsFRKsfqqwyI2bdfYw=@emersion.fr>
In-Reply-To: <cmc7hghfjaekbsu6e15hbolbteanadmlla@4ax.com>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
 <Af-nitVw-cgVIRn4hPB53-PwBSuaSqzaoUQA5H6kUF6BXVYJ5noiTAE6E1K0Q_aL_PxpA08bNQuxOKbSfSHQtSR-OOUtMtyrkLfSFBT7hDE=@emersion.fr>
 <cmc7hghfjaekbsu6e15hbolbteanadmlla@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, August 11th, 2021 at 13:40, John Cox <jc@kynesim.co.uk> wrote=
:

> Raspberry Pi displaying video with subtitles or other controls.  I was
> thinking of the fullscreen case but if zero copy video can be made to
> work to the main desktop then that would even better.
>
> If displaying 4k video the Pi does not have enough bandwidth left for a
> single frame copy, convert or merge so I need hardware scaling,
> composition & display taking the raw video frame (its in a dmabuf).  The
> raw video is in a somewhat unique format, I'd expect the other layers to
> be ARGB.  The Pi h/w can do this and I believe I can make it work via
> DRM if I own the screen so that was where I started.
>
> >Why not use an xdg_toplevel and wl_subsurface?
>
> Probably because I am woefully underinformed about how I should be doing
> stuff properly.  Please feel free to point me in the correct direction -
> any example that takes NV12 video (it isn't NV12 but if NV12 works then
> SAND can probably be made to too) would be a great start.  Also Wayland
> hasn't yet come to the Pi though it will shortly be using mutter.

By SAND do you mean one of these vc4-specific buffer tilings [1]? e.g.
BROADCOM_SAND64, SAND128 or SAND256?

[1]: https://drmdb.emersion.fr/formats?driver=3Dvc4

The fullscreen case may work already on all major Wayland compositors,
assuming the video size matches exactly the current mode. You'll need to us=
e
the linux-dmabuf Wayland extension to pass NV12 buffers to the compositor.

If you want to add scaling into the mix, you'll need to use the viewporter
extension as well. Most compositors aren't yet rigged up for direct scan-ou=
t,
they'll fall back to composition. Weston is your best bet if you want to tr=
y
this, it supports direct scan-out to multiple KMS planes with scaling and
cropping. There is some active work in wlroots to support this.  I'm not aw=
are
of any effort in this direction for mutter or kwin at the time of writing.

If you want to also use KMS planes with other layers (RGBA or something els=
e),
then you'll need to setup wl_subsurfaces with the rest of the content. As s=
aid
above, Weston will do its best to offload the composition work to KMS plane=
s.
You'll need to make sure each buffer you submit can be scanned out by the
display engine -- there's not yet a generic way of doing it, but the upcomi=
ng
linux-dmabuf hints protocol will fix that.

If you want to get started, maybe have a look at clients/simple-dmabuf-gbm =
in
Weston.

Hope this helps!
