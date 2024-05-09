Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D558C0B60
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537E810E331;
	Thu,  9 May 2024 06:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Dmiqaisf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADD010E331
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdxJ262dHToHUGGCgaLmJeOACkPI0cWgfTA5kozyCO0=; b=DmiqaisfhJruL1zW/hhlE+/tTL
 JbC+foWa7yje1NLAe/woagtbSuH+ZL1vFisY/SkOXpOX7l5tZryMqpm2mnC6/5pbteGwCc9fSFwaD
 k1qFYjdMjBirGCB72dddoySPCMpIMg2+66NWQiT4Gl+CBStxWPd95lsMoo5rPzEgaE/ZT96V96OSx
 7O8tCjeZfxPsf4uQB6kIR/Sq8n+SDpef6xJtMnwsV41vGrhhF4gPet7iQFcdovoK8FV4IOhaIs7Ps
 ZaHLlXm0EaoJvgdiglioVJ07aZiUayWeugkmO+s6A0LaaOyaYKwMnGMkzIzUj13YUVLqObj2I1hfM
 k9mdtWug==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4x3i-003a23-NS; Thu, 09 May 2024 08:15:14 +0200
Message-ID: <073ff0b7737845a12099ba39fc0cab0bdc730799.camel@igalia.com>
Subject: Re: [PATCH 0/6] drm/v3d: Improve Performance Counters handling
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 "Juan A ." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Thu, 09 May 2024 08:15:14 +0200
In-Reply-To: <20240508143306.2435304-2-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

Hi Ma=C3=ADra,

I made a couple of minor comments, with those addressed the series is:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thanks a lot for this!,
Iago

El mi=C3=A9, 08-05-2024 a las 11:30 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This series has the intention to address two issues with Performance
> Counters
> on V3D:
>=20
> 1. Update the number of Performance Counters for V3D 7.1=20
> =09
> V3D 7.1 has 93 performance counters, while V3D 4.2 has only 87.
> Although the
> series [1] enabled support for V3D 7.1, it didn=E2=80=99t replace the max=
imum
> number of
> performance counters. This led to errors in user space as the Vulkan
> driver
> updated the maximum number of performance counters, but the kernel
> didn=E2=80=99t.=20
> =C2=A0=C2=A0=C2=A0=20
> Currently, the user space can request values for performance counters
> that
> are greater than 87 and the kernel will return an error instead of
> the values.
> That=E2=80=99s why `dEQP-VK.query_pool.performance_query.*` currently fai=
ls
> on Mesa
> CI [2]. This series intends to fix the `dEQP-
> VK.query_pool.performance_query.*`
> fail.
> =C2=A0=C2=A0=C2=A0=20
> 2. Make the kernel able to provide the Performance Counter
> descriptions
> =C2=A0=C2=A0=C2=A0=20
> Although all the management of the Performance Monitors is done
> through IOCTLs,
> which means that the code is in the kernel, the performance counter
> descriptions
> are in Mesa. This means two things: (#1) only Mesa has access to the
> descriptions
> and (#2) we can have inconsistencies between the information provided
> by Mesa
> and the kernel, as seen in the first issue addressed by this series.
> =09
> To minimize the risk of inconsistencies, this series proposes to use
> the kernel
> as a =E2=80=9Csingle source of truth=E2=80=9D. Therefore, if there are an=
y changes to
> the
> performance monitors, all the changes must be done only in the
> kernel. This
> means that all information about the maximum number of performance
> counters and
> all the descriptions will now be retrieved from the kernel.=20
>=20
> This series is coupled with a Mesa series [3] that enabled the use of
> the new
> IOCTL. I appreciate any feedback from both the kernel and Mesa
> implementations.
>=20
> [1]
> https://lore.kernel.org/dri-devel/20231031073859.25298-1-itoral@igalia.co=
m/
> [2]
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/ea1f09a5f21839f4f3b9361=
0b58507c4bd9b9b81
> [3]
> https://gitlab.freedesktop.org/mairacanal/mesa/-/tree/v3dv/fix-perfcnt
>=20
> Best Regards,
> - Ma=C3=ADra Canal
>=20
> Ma=C3=ADra Canal (6):
> =C2=A0 drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
> =C2=A0 drm/v3d: Different V3D versions can have different number of
> perfcnt
> =C2=A0 drm/v3d: Create a new V3D parameter for the maximum number of
> perfcnt
> =C2=A0 drm/v3d: Create new IOCTL to expose performance counters
> information
> =C2=A0 drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
> =C2=A0 drm/v3d: Deprecate the use of the Performance Counters enum
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_perfmon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++-
> =C2=A0.../gpu/drm/v3d/v3d_performance_counters.h=C2=A0=C2=A0=C2=A0 | 208
> ++++++++++++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0include/uapi/drm/v3d_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 44 ++++
> =C2=A06 files changed, 312 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
>=20

