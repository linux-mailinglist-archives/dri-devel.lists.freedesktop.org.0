Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB295A030F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FDBAA418;
	Wed, 24 Aug 2022 20:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEC81120C7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:09:07 +0000 (UTC)
Date: Wed, 24 Aug 2022 15:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661353745; x=1661612945;
 bh=d1jmacMTHHXwl8ftGYjIjmzVHQFBUrR8nDQasE6oCJQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=KzuyQ6SoHwef+gbQBxoqaqnc0TxuJdkpRcJHoebiM68i5LiyNw3Q1PYmVrGU74z6b
 KguMGWAEPZk8GgYHotADt4LXG7tBCrCYoCRBV0mNl9IxYq6rZ9nmDtXBxnMLThIvDv
 zXfnI0EnkikbO5ZoJPCToRSecC2BEoTBSqHD/Hfmbou9nvWjX+eVw5T+4KJmEkxYVq
 U4tYkOyEeU3Z9RPysvxf8gpJCVU5KyECEuNx1eC3YxMzmdxpzOKUTDuPEE1KjvNldV
 GG5zUb+vnYQSOlSr2NNhqcudlj+IXd8ulIk3rYtK1OR6ZkPiXHu79vCZw8w8375x4U
 tNyehwOopbbuw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 4/4] amd/display: indicate support for atomic async page-flips
 on DCN
Message-ID: <20220824150834.427572-5-contact@emersion.fr>
In-Reply-To: <20220824150834.427572-1-contact@emersion.fr>
References: <20220824150834.427572-1-contact@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, mwen@igalia.com, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_dm_commit_planes already sets the flip_immediate flag for
async page-flips. This flag is used to set the UNP_FLIP_CONTROL
register. Thus, no additional change is required to handle async
page-flips with the atomic uAPI.

Note, async page-flips are still unsupported on DCE with the atomic
uAPI. The mode_set_base callbacks unconditionally set the
GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
register to 0, which disables async page-flips.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ef816bf295eb..9ab01c58bedb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3804,7 +3804,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_d=
evice *adev)
 =09adev_to_drm(adev)->mode_config.prefer_shadow =3D 0;
 =09/* indicates support for immediate flip */
 =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
-=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported =3D=
 true;
=20
 =09adev_to_drm(adev)->mode_config.fb_base =3D adev->gmc.aper_base;
=20
--=20
2.37.2


