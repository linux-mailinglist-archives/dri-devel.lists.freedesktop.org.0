Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DA7BD188
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F4010E210;
	Mon,  9 Oct 2023 00:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046610E210
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 00:51:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D8BCE6607243;
 Mon,  9 Oct 2023 01:51:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696812715;
 bh=S5ZXMtsqrCKXNXumQnygyDaY0j/k5BBmH6XyblMxH4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cmCOTNMMN5s7SN54REpOBYRfNpgzZyAbHmgF+YJzXMNMbz5O76ZWWuWAYhViz4SS8
 6EteOZ4+nom5JHiDC/whru/tTDJ22ba/KhohhXFdMTORrm965y8W4zp7IMvWFZoZ4o
 5nBqbzNGFBDdkaXHnZ54WbLUnUVs9BCBO1eAyrVsRTFnAWvS6BMGaYDoUqTHxmfiIv
 OLZ/CLbrtJUQDdrPxrid+AbtamrE31mSEDoXmH1BSBHckZ0SCN6RCiUxlf7LWQNc5T
 toep/H2UZw4QkcZJaAW1xaW4WRfEyBsF8eUZ5XEw/bYiubf5twITsvyYT9hwlvTug6
 WKHTjCNO3Hffg==
From: Helen Koike <helen.koike@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/9] drm/ci: export kernel config
Date: Sun,  8 Oct 2023 21:49:52 -0300
Message-Id: <20231009004953.203576-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009004953.203576-1-helen.koike@collabora.com>
References: <20231009004953.203576-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the resultant kernel config, making it easier to verify if the
resultant config was correctly generated.

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/gpu/drm/ci/build.sh       | 1 +
 drivers/gpu/drm/ci/image-tags.yml | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 8eec15143bfe..740b5008be2e 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -148,6 +148,7 @@ mkdir -p artifacts/install/lib
 mv install/* artifacts/install/.
 rm -rf artifacts/install/modules
 ln -s common artifacts/install/ci-common
+cp .config artifacts/${CI_JOB_NAME}_config
 
 for image in ${KERNEL_IMAGE_NAME}; do
     cp /lava-files/$image artifacts/install/.
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index df94d8fb348e..3e5cd4e8be24 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-08-igt"
+   DEBIAN_BUILD_TAG: "2023-10-08-config"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
 
-- 
2.34.1

