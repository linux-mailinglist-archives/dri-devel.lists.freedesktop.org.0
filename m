Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D5819EB4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193FE10E57E;
	Wed, 20 Dec 2023 12:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F3310E57E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074319;
 bh=5JYtuIZuEkvTZxlUYgCyzZRIqd+leW54ZkRZefuebz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VWFMwSBpYXflgVVjmHkLWkDqTMrLZdeyvBBDlzfjY0Cbfl40+z593xdaFYf20AJXq
 DYfwdwTCFEXRgf8ICdB5YeklNI3UzQQz8m/k2hXGh1yfm+yaG1Bw2tgpXCIRsKOdCc
 sbnfuWVGRBv8RI8bhMIvrl1WKibyDteLH8XsQgTuXma4JYwGIfcyvh+S+grfHzOUX5
 Srot51lVbJlX3Yt/FwUbrTXsBbfIl4zskxlLns1gXTxfwr8AgUQSSB0QqjGuao1PeO
 hqwyFGZQXt0yXB8tTVDzTRKHyHv1H5P0nHQwlhiHI1M+B/9F/cD0OeSVcTjgOScaEX
 BKmo9gWCZ9jbA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 412613781FED;
 Wed, 20 Dec 2023 12:11:53 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 5/8] drm/ci: Do not set IGT_FORCE_DRIVER based on driver
 name
Date: Wed, 20 Dec 2023 17:41:07 +0530
Message-Id: <20231220121110.1441160-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-rockchip@lists.infradead.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david.heidelberg@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the correct driver name is passed from the job to
test gpu and display driver, remove the check to set
IGT_FORCE_DRIVER based on driver name.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/igt_runner.sh | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..ce6e22369d4d 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
-        export IGT_FORCE_DRIVER="panfrost"
-        ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
-- 
2.40.1

