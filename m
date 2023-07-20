Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BF75AB7D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D4910E0C0;
	Thu, 20 Jul 2023 09:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717A10E0C0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:55:05 +0000 (UTC)
Date: Thu, 20 Jul 2023 09:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689846903; x=1690106103;
 bh=lJQ3xlZHNyHV1pm3R41CKd2Oxp2EM768wCQcPy40TFY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Zkl0uovKKYHgyt2zlddH7ujlJbB+GgP0H0cEW/FKbYKTq37mL1gKt5CYN5oiV8grN
 N3ANu8xYX1kex+xHC81IEgC31HAwZUlEK68wGvwm7HBCB1O6gRrErS8Z1iFlgOYRoC
 FhAZknOAGEaAtvhUUebMbkNjFdPClhgO/P2iGlM0F2s36GL0rCUmayxSzMwveT4LT6
 IGrVX8DAmq8yd0PCcFuO6yncEU1VFqWneBJZG5Xxu1K+mZVWHAn0VSQkGDhH4YwA9k
 jIxb8PsJJ9s2B+cY+Rm7E6OaLwVoULp3uYdvR4yILVPOboag/QG1F8OOwes27B83aq
 B5rkEtrqPK3Vg==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 8/9] drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
Message-ID: <1J5B03mDildYGwgLgV-xNRaf2gWF8mRCI95wKnbPo5GV4k-ajo5JZ3AL8jves1MGkC-ieljQRoByCFUSAO2zbiFNk-a8_tFc-iWJE6BVHCo=@emersion.fr>
In-Reply-To: <20230719014218.1700057-9-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-9-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 19th, 2023 at 03:42, Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Virtualized drivers place additional restrictions on the cursor plane
> which breaks the contract of universal planes. To allow atomic
> modesettings with virtualized drivers the clients need to advertise
> that they're capable of dealing with those extra restrictions.
>=20
> To do that introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT which
> lets DRM know that the client is aware of and capable of dealing with
> the extra restrictions on the virtual cursor plane.
>=20
> Setting this option to true makes DRM expose the cursor plane on
> virtualized drivers. The userspace is expected to set the hotspots
> and handle mouse events on that plane.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Looks good!

Reviewed-by: Simon Ser <contact@emersion.fr>
