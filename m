Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C93533FA5
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820CC10FA82;
	Wed, 25 May 2022 14:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545AC10FA82
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id E979D1F450F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490685;
 bh=9bRShdzh+eFKzI1iX/FrVehRhjCGpbUYT7uXkboDLFA=;
 h=From:To:Cc:Subject:Date:From;
 b=ff9drY7INcYIJup2RVvMPpszBqC32CT5ohYQyiXUkCP8LNum6WAjATumWLGFHa2sb
 TYwtNWK46RuqmcOypV9L9Yq4zzPDhPG5dIeeS1QEGl5ICTAuaVBPoZXf+zAeHkaCvB
 VA9M4ph/jpmJc0S1lkku7xMWWNi3E6MKm/1U5PLtRPZXcPE4W6WzkiOFnN2BEUrUoi
 l+dfbatSu2qZwLdKpb4vosiG93X/h6nJIglT3TkdXU+KZ5NDwfIYwxzlgN5/udwZcI
 Bk2ekki8HjOFhXDX5HkPvh+NUujpo6qKjANFpmXY8W0U2nqGx6XsauFVdN63o2SAsd
 sgdTg9IKruY8A==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/panfrost: Valhall (JM) support
Date: Wed, 25 May 2022 10:57:45 -0400
Message-Id: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here is version 2 of the series adding support for job manager Valhall
(v9). CSF Valhall is not supported in this series. The core
issues/features are added for Mali-G57 "Natt" as the current target.
Natt is used in MT8192, which needs a few extra patches to follow
(currently blocked on MediaTek integration issues.)

In terms of userspace, Mesa has almost all the required code for GLES3.1
conformance and is just missing a few patches to merge for remaining
features.

v2 addresses minor issues found in v1, but no major changes.

Alyssa Rosenzweig (9):
  dt-bindings: Add compatibles for Mali Valhall GPU
  drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
  drm/panfrost: Constify argument to has_hw_issue
  drm/panfrost: Handle HW_ISSUE_TTRX_3076
  drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
  drm/panfrost: Add "clean only safe" feature bit
  drm/panfrost: Don't set L2_MMU_CONFIG quirks
  drm/panfrost: Add Mali-G57 "Natt" support
  drm/panfrost: Add arm,mali-valhall-jm compatible

 .../bindings/gpu/arm,mali-bifrost.yaml        | 53 +++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_device.c    |  9 +++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
 drivers/gpu/drm/panfrost/panfrost_features.h  | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       | 18 +++----
 drivers/gpu/drm/panfrost/panfrost_issues.h    | 21 +++++++-
 drivers/gpu/drm/panfrost/panfrost_regs.h      |  1 +
 7 files changed, 91 insertions(+), 25 deletions(-)

-- 
2.35.1

