Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B06BD1930
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A4710E381;
	Mon, 13 Oct 2025 06:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TAFlBh2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ABC10E37A;
 Mon, 13 Oct 2025 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760335360;
 bh=gCTdPchWuc1xiR4tpvlqqw30LOOS9lTJyDFe5on17HM=;
 h=From:To:Cc:Subject:Date:From;
 b=TAFlBh2aNv23DXPQ8OmreZbzQmFTLIEjl9J0KbxvbjC5MtwEDNbXW5ujofaTRW+XL
 KO2ISTQK6VLqg6gIt8eK01iUC61DOl72IhIbVAd8Uh2RUP0MV+1sbBup1PxcUL3Udr
 rNFUwfDC3qq0kgUl0qUdx5t3dkfn+cHIOCN7SIWrLYmNfGvL7Dar5Jx6QYWjcHmEpA
 ZmH/LzM1ZfJ5fjq8ANRpuElYt405PKG/Rru0AscGlyxSihbzvzzmy/vF0/u9uZL1Io
 7KVmdMeZ3vp1bYNvsFVYPV/gZX1Wn7B/AL6tw4uOItj3wuAmFt97FfOZiW9LFpAlDN
 ltp9kK/V6HuoA==
Received: from debian (unknown [171.76.80.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BC90217E0CA3;
 Mon, 13 Oct 2025 08:02:36 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: disable broken MR check in sanity job
Date: Mon, 13 Oct 2025 11:32:10 +0530
Message-ID: <20251013060212.14583-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GitLab recently changed the required permissions for the
are-developers-allowed-to-push-to-my-MR check:
https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81

Until that’s resolved, disable the check - it’s mostly obsolete anyway.

Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37782

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d502d146b177..56638814bb28 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -280,7 +280,7 @@ sanity:
     GIT_STRATEGY: none
   script:
     # ci-fairy check-commits --junit-xml=check-commits.xml
-    - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
+    # - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
     - |
       set -eu
       image_tags=(
-- 
2.51.0

