Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5459C83D30
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 08:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D5110E368;
	Tue, 25 Nov 2025 07:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wiytCc83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302D910E368
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:57:06 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dFw5C0Zyxz9tQ4;
 Tue, 25 Nov 2025 08:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764057423; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk7ztPL7YSIA3VCwiNrpEATpAWtKi603tJYUZ86CHOU=;
 b=wiytCc83j76MOqzzPz78DkT0ynmw5j3Nosh6aH3HUEWY7m9PLGBrJ3Cj5dage8TunkwV1t
 /1VVayokeM59Eyxmwv332iDpBFt1pHeu/Zukn5/bUSKWclGNaFMr4pBkj+4BE7xB3Kl0g0
 2YBlnaOjEc6Z5wOxocLNLyWi+I49cfSjTrmKw1fOgDC635JsKV+RdpDE4ZwYn2UsmkASi3
 oe/oHDmBmVh5xBImLdozBJi/rAWZdB19AuMzDJ7xkKazBD+cChP/dYwfjYDf41mkF5bl6G
 ZvVlRTTARWx6s+H+yeCEfkFwUCarGthz+DTMPcwhHDTmj+LF3q5yQ59NiuhP3Q==
Message-ID: <fb3474073493184043804bb0e0aee6ff17d23ad3.camel@mailbox.org>
Subject: Re: [PATCH 3/4] drm/vgem: use the reasonable maximum timeout
 defined by the dma_fence
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Nov 2025 08:56:59 +0100
In-Reply-To: <20251120150018.27385-4-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-4-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8d110ef1e6bfbfb33a7
X-MBO-RS-META: qzqqu3wiwoyepzka4pksfhn8byu7rz5r
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-11-20 at 15:41 +0100, Christian K=C3=B6nig wrote:
> Instead of 10 seconds just use the reasonable maximum timeout defined by

It's not 10 "seconds", it's 10 "HZ"

P.

> the dma_fence framework.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/vgem/vgem_fence.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vge=
m_fence.c
> index 07db319c3d7f..1ca14b83479d 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -27,8 +27,6 @@
> =C2=A0
> =C2=A0#include "vgem_drv.h"
> =C2=A0
> -#define VGEM_FENCE_TIMEOUT (10*HZ)
> -

