Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C944F9E3A11
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 13:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C2A10E4B1;
	Wed,  4 Dec 2024 12:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ODUKqsvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87C110ECF4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vo+goKNglEASf6Eb98sknGCfxmQjYZXauzgbz5nH0HQ=; b=ODUKqsvppKTm7PqulqM5xBE88z
 daiy9W8jKjGKYkZe4z88ViZYdIFtqJpPl4GzAOqST/PBb61jxOY75su8LVV8WygXD8RsAAWDuFnux
 fU8JSDamqAVAyZcNIfJ/fTVQa6SL3K5ToShBzZDT5Weh394Nn6/5IxK3e4u16/8pJvcyKQwqJoHoa
 ECRlLmoC57UlHR3ns9dZIENtel3rQGElo2vtugPlq857WoTK0uN1b4T0y8p3oevkubwOj5l5X8+Dh
 tmiemDLdKzGI5a7U4e/5v7cf9cbh75cne2KiF9V45ziOxjoK8fCMbfb2EHBYjUYDmDMFyWUQjfl8N
 zPl4l/jQ==;
Received: from static-165-28-84-188.ipcom.comunitel.net ([188.84.28.165]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tIocX-00GVkb-US; Wed, 04 Dec 2024 13:36:46 +0100
Message-ID: <2c2af0bb388fd740f72d8e4521feb41feac86319.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Enable Performance Counters before clearing them
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Wed, 04 Dec 2024 13:36:35 +0100
In-Reply-To: <20241204122831.17015-1-mcanal@igalia.com>
References: <20241204122831.17015-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El mi=C3=A9, 04-12-2024 a las 09:28 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> On the Raspberry Pi 5, performance counters are not being cleared
> when `v3d_perfmon_start()` is called, even though we write to the
> CLR register. As a result, their values accumulate until they
> overflow.
>=20
> The expected behavior is for performance counters to reset to zero
> at the start of a job. When the job finishes and the perfmon is
> stopped, the counters should accurately reflect the values for that
> specific job.
>=20
> To ensure this behavior, the performance counters are now enabled
> before being cleared. This allows the CLR register to function as
> intended, zeroing the counter values when the job begins.
>=20
> Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to
> userspace")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_perfmon.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c
> b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index b4c3708ea781..c49abb90954d 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -255,9 +255,9 @@ void v3d_perfmon_start(struct v3d_dev *v3d,
> struct v3d_perfmon *perfmon)
> =C2=A0		V3D_CORE_WRITE(0, V3D_V4_PCTR_0_SRC_X(source),
> channel);
> =C2=A0	}
> =C2=A0
> +	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, mask);
> =C2=A0	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_CLR, mask);
> =C2=A0	V3D_CORE_WRITE(0, V3D_PCTR_0_OVERFLOW, mask);
> -	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, mask);
> =C2=A0
> =C2=A0	v3d->active_perfmon =3D perfmon;
> =C2=A0}

