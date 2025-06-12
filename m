Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060AAD7500
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955B110E87D;
	Thu, 12 Jun 2025 15:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="UBs+WhFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534110E87D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:00:39 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 14A5A260A0;
 Thu, 12 Jun 2025 17:00:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma3iOkFIL4ux; Thu, 12 Jun 2025 17:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749740435; bh=hyszOhcRbzyjfVvsWkNpk+hVLWy3Vif4GHa8XCtb/z0=;
 h=From:Subject:Date:To:Cc;
 b=UBs+WhFPGmXf10maD/KCA03fqTS+jQmw0BJes/UnNzmC3xIEuLH2la6i7Qp2XZk4N
 3H8QosxjTDSMl6IvaERdEF5o/9lFwU01jdjA0Po7JFJvMiyp3ZABsTzTt4d6yCBiXb
 yOwlZi+8sc4hHDFjd14rxmfDdpm5jWajdicBwrQoVgHycyO9FJjoAbxM4ebi1EV7sG
 HxXyQu0I9+eoI17KoDJCUIKGAF1MMtvRXXAbDbQHyrlSqLTeNMMTI9CDxedjW9U9zf
 iAmientABoTM6Z65Y4RkCs/kkdFAX3sdeN/HQXDj3qX4m2FhuoDL8gcj5zWB0Mkfsy
 2JIEUcWipbuaA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Samsung Exynos 7870 DECON driver support
Date: Thu, 12 Jun 2025 20:29:18 +0530
Message-Id: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbrSmgC/2WNQQ6CMBBFr0JmbU3bIIIr72FYSGeAWdgxU0Igh
 LtbSVy5fC/572+QSJkS3IoNlGZOLDGDPxUQxmccyDBmBm99aRt3NbSsURLqyyAFiaYM3teIDn3
 XQ169lXpejuKjzTxymkTX42B2X/trNX+t2RlrqnCpKxdc6Gx5R04qMp1FB2j3ff8Ax0hFv7AAA
 AA=
X-Change-ID: 20240917-exynosdrm-decon-4c228dd1d2bf
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740428; l=1203;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hyszOhcRbzyjfVvsWkNpk+hVLWy3Vif4GHa8XCtb/z0=;
 b=RBepMzepmmvN9MEFlWtkAYr8CSmXHsbMD5QHpkFVOAJxzE4dbCgTT+mxjmvjvSYo2dr+5RnEc
 0Fi3M5ecoAzBnDtWAjPc8ngbIx8joImgFgyZP9PLH1uivMD+tNAjOEP
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

This patch series aims at adding support for Exynos7870's DECON in the
Exynos7 DECON driver. It introduces a driver data struct so that support
for DECON on other SoCs can be added to it in the future.

It also fixes a few bugs in the driver, such as functions receiving bad
pointers.

Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (2):
      drm/exynos: exynos7_drm_decon: fix call of decon_commit()
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

