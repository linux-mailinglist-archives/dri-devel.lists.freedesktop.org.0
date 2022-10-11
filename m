Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE05FB19B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CDF10E028;
	Tue, 11 Oct 2022 11:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2210E028
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:37:10 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665488227; x=1665747427;
 bh=QesH2rce+RYHMzwnr84ZCuM47mtBtKv65TR5dDHZQrE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=CkW49RMvad8TXFHNw0BgZ2spm3+EMYzxkPr/MEHGH77sVgxV67dGqygUzjZqkIGDa
 aLbT4fiH0CzryEGLCvSaPQi+Z3RJZFme5cp9kz3sYFKuhJG3wdogwnJoGRUP0D/axX
 4GEz08mbkpiHh9/lz4vkzsAjJOosdOcSvBVfOr6nUP5HK8+pU7us85d/W8523fRwam
 pNG3jjwPyEsyXmf7owz68vQKrlF1OQX+xDkn1O5koRu24uu0w7/enu/Oza6WJ/Qppg
 IhwB4dOMQx4tO0tmqfCgqAUPWtX0O63xCvliaEh3bwCzsWfTL45OKJLGekuywQePkW
 dDm/1ocHrbTNw==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Render only DRM devices
Message-ID: <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
In-Reply-To: <20221011110437.15258-1-christian.koenig@amd.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 11th, 2022 at 13:04, Christian K=C3=B6nig <ckoenig.leic=
htzumerken@gmail.com> wrote:

> we already have quite a bunch of devices which are essentially render
> only and don't expose any connectors or more general display functionalit=
y.
>=20
> Just recently I ran into a case where an older X/DDX combination
> caused problems for such a device so I looked a bit into the
> possibility to allow drivers to disable the primary node and only
> expose the render node.
>=20
> It turned out that this effectively hides the device from X, but
> OpenGL and Vulkan can still use it perfectly fine.
>=20
> The only crux is that this is checked so early in the initialization
> that drivers don't have an opportunity to update their
> dev->driver_features. So we will always need a separate drm_driver
> structure for render only devices.

Typically render-only devices still expose a primary node, but don't
expose any KMS resources on it. See drmIsKMS() in libdrm.

Primary nodes could still be used by older user-space for rendering with
legacy DRM authentication.
