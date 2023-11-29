Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CD7FD686
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEFE10E51A;
	Wed, 29 Nov 2023 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028A710E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:19:20 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 529E16607326;
 Wed, 29 Nov 2023 12:19:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701260358;
 bh=H13PVkV6eP93AzIoNhD0cOJWUDbRbvEN1IuP+0EAl74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f2BYXI/usX+luXIuDlnTUmGLvpk8aKD8/G+FHPv3JgrCgSadJ5bpWBvxdLiM6jg/R
 r8j+GuhFzcffI9/LAp6LhVRi0faHRf9iaLDEN1glK36RhTBU1ygBDK17McV1yJNO0W
 1Y0HxAoeTpWtzumD5kobODYrZalzbCrAS4UnizkLpHbk9thEQ4Mk29aTEksfLq1QQE
 K8AQX8jhQieOzksaKSWm6qiCJf/6yRBaiem3xCvRV2djSacqnRVmfwvcc+B/kFEKQ/
 4ryMphd72tdnp1FkwGaGwSbOld8S/77vNqNLzzxpxUVTCsb2uAUdW3QfPA0VHkzFB7
 vwN4TT51DpuWQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
Date: Wed, 29 Nov 2023 17:48:37 +0530
Message-Id: <20231129121841.253223-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expected driver for mt8173 is "mediatek" and for mt8183
it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
the expected driver for mt8173.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173

v6:
  - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173

---
 drivers/gpu/drm/ci/igt_runner.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index c6cf963592c5..70a0f84021a1 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -30,6 +30,10 @@ case "$DRIVER_NAME" in
         ;;
 esac
 
+if [ "$GPU_VERSION" = "mt8173" ]; then
+    export IGT_FORCE_DRIVER=${DRIVER_NAME}
+fi
+
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
     IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
 fi
-- 
2.40.1

