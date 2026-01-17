Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115CD39476
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 12:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00F110E00D;
	Sun, 18 Jan 2026 11:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="CNMHF0Gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A917810E084
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1768643702; x=1768902902;
 bh=QqVfeK3SfYvUi53Tki0TyzBz0y8YVVWc0anhKuMVQec=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=CNMHF0GiQu8JCROrNnIKNO6WFM1cIWiJ+uJMeOyCI8RB2DIaG4zyhnLBWYZMAygOf
 DQEs7oCDI3a67bP6uJB+uSpEChEgU2DbTXoAQOn9yQrOrrfa2NS7fEMx1xd63a4C/W
 NuCZ1S4IUMudmVh1woP0QdaAKJzC55KlWOX+0ZSStm3okqT71miUxPgQ8bjTi9RZNQ
 Jo15b56+Hq8rLKUnHouj8Apy6H0Vecjg3ra2rDjppXHtuZVIdDA14L0AvPUkHjO392
 iZbjQLji1pZT82mwORsfh22fy8ViAmVeP5pse3GUWw+z8KmYumPSFOOW/bYuegVujR
 HZ7UtMLQ2PzwA==
Date: Sat, 17 Jan 2026 09:54:58 +0000
To: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
From: decce6 <decce6@proton.me>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 decce6 <decce6@proton.me>
Subject: [PATCH] drm/[radeon|amdgpu]: Add HAINAN clock adjustment
Message-ID: <20260117095421.12700-1-decce6@proton.me>
Feedback-ID: 132957244:user:proton
X-Pm-Message-ID: 50c5b78347fc68f2714ce75f7848c9153c16531b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 18 Jan 2026 11:13:39 +0000
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

Currently, the AMD Radeon R5 M420 GPU is unstable when operating at the def=
ault maximum 850MHz/1000MHz (core/memory) clock speeds. For example, a game=
 may stop working within one minute after starting up. When using the amdgp=
u driver, the process stops with exitcode 6 and the following message is pr=
inted: "amdgpu: The CS has cancelled because the context is lost. This cont=
ext is innocent."

From my testing, limiting the clock speeds to 800/950 MHz makes it work per=
fectly stably.

Signed-off-by: decce6 <decce6@proton.me>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 4 ++++
 drivers/gpu/drm/radeon/si_dpm.c            | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/a=
md/pm/legacy-dpm/si_dpm.c
index 1f539cc65f41..fcb9e0e20175 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3468,6 +3468,10 @@ static void si_apply_state_adjust_rules(struct amdgp=
u_device *adev,
 =09=09=09max_sclk =3D 60000;
 =09=09=09max_mclk =3D 80000;
 =09=09}
+=09=09if (adev->pdev->device =3D=3D 0x666f) {
+=09=09=09max_sclk =3D 80000;
+=09=09=09max_mclk =3D 95000;
+=09=09}
 =09} else if (adev->asic_type =3D=3D CHIP_OLAND) {
 =09=09if ((adev->pdev->revision =3D=3D 0xC7) ||
 =09=09    (adev->pdev->revision =3D=3D 0x80) ||
diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dp=
m.c
index 9deb91970d4d..2f386ea8827f 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -2925,6 +2925,10 @@ static void si_apply_state_adjust_rules(struct radeo=
n_device *rdev,
 =09=09=09max_sclk =3D 60000;
 =09=09=09max_mclk =3D 80000;
 =09=09}
+=09=09if (rdev->pdev->device =3D=3D 0x666f) {
+=09=09=09max_sclk =3D 80000;
+=09=09=09max_mclk =3D 95000;
+=09=09}
 =09} else if (rdev->family =3D=3D CHIP_OLAND) {
 =09=09if ((rdev->pdev->revision =3D=3D 0xC7) ||
 =09=09    (rdev->pdev->revision =3D=3D 0x80) ||
--=20
2.43.0


