Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11FA476EA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 08:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E410E041;
	Thu, 27 Feb 2025 07:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n5wJoWo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF8A10E041
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9CqUFNdUNUfzrYHmH4LKSH1/0fyY3uGBpsl530tWRY=; b=n5wJoWo76NUAcVvkT+YSgZ3Tp5
 7aj7m+zy5wUhO58FEqKsamkS1uiFe3SSRV9843uGt4OjDLnJ7OkTQZ6xBSFJ17BLwVAZXA0mezzsF
 K1DrlIIuIuyz53/LUVWIigDcTwvj+zFJsh2co/vlordfjoOW/EWN+3YR9TMD2yXUsjUOFGob6Bz1e
 4f0UGXi2eJh+W2p1TDg0Rl62gSlmApPRjLx/Rj8ge7J2Zw40pbbX01yGJbuZWjo3KTfq0+QZy84EP
 UrgNKmeEa9B7R0iAUW/UCUTmpj1rN+uj9/j7ofX82qLo3ZlEXPwFxWCWIRgpeJsKNvm95nbthq53D
 pUCO0Dmw==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnYjw-001UK9-CM; Thu, 27 Feb 2025 08:55:34 +0100
Message-ID: <75c3d6bc5e020868faf0fd91525cd75b497ac8dc.camel@igalia.com>
Subject: Re: [PATCH 0/6] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 devicetree@vger.kernel.org
Date: Thu, 27 Feb 2025 08:55:34 +0100
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
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

Thanks Ma=C3=ADra, all patches but 4 are:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

I hope someone else can can look at the remaining DT patch.

Iago

El mi=C3=A9, 26-02-2025 a las 16:58 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This series addresses GPU reset issues reported in [1], where running
> a
> long compute job would trigger repeated GPU resets, leading to a UI
> freeze.
>=20
> Patches #1 and #2 prevent the same faulty job from being resubmitted
> in a
> loop, mitigating the first cause of the issue.
>=20
> However, the issue isn't entirely solved. Even with only a single GPU
> reset, the UI still freezes on the Raspberry Pi 5, indicating a GPU
> hang.
> Patches #3 to #5 address this by properly configuring the V3D_SMS
> registers, which are required for power management and resets in V3D
> 7.1.
>=20
> Patch #6 updates the DT maintainership, replacing Emma with the
> current
> v3d driver maintainer.
>=20
> [1] https://github.com/raspberrypi/linux/issues/6660
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> ---
> Ma=C3=ADra Canal (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Don't run jobs that have errors f=
lagged in its fence
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Set job pointer to NULL when the =
job's fence has an
> error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Associate a V3D tech revision to =
all supported devices
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: gpu: v3d: Add SMS to the regi=
sters' list
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Use V3D_SMS registers for power o=
n/off and reset on
> V3D 7.x
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: gpu: Add V3D driver maintaine=
r as DT maintainer
>=20
> =C2=A0.../devicetree/bindings/gpu/brcm,bcm-v3d.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 58
> ++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 18 +++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 17 +++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 26 ++++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 23 +++++++--
> =C2=A06 files changed, 140 insertions(+), 10 deletions(-)
> ---
> base-commit: 099b79f94366f3110783301e20d8136d762247f8
> change-id: 20250224-v3d-gpu-reset-fixes-2d21fc70711d
>=20
>=20

