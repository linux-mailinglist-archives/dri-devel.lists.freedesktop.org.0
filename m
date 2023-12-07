Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C080842E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67510E832;
	Thu,  7 Dec 2023 09:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B587F10E832
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4E396607394;
 Thu,  7 Dec 2023 09:19:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701940752;
 bh=0x2mujmBnS9QcHk0k7mgb0lg6gdp78HOH3dqjQW7Q0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RtF7/utlbhd991M0yU/aU3QXOf91lczA8VbtqdHnGSh7deLj4PuhtuezbVtyLVJZm
 m5It3tciFlapi1oPIHJP1vly4Pv7vgdwbTltX3eMZoAQ/qSM49K5uuz4eL+UjAW0ek
 SmM4Wh+E83rWtciCsH67UH28Hc8TAQe0H+rrLD8SZvKJeh+rs3GnJA5Ex8cYUj5vFL
 BffwZK9fFex8Q9HppK2+0k7J7xO39rBaFcNP+Q9N6cGx/6xeZV0Y9QO5vADNvj+ofk
 gRPEtG1hkV13hOZC05BksYwDp31BdZV39Ls3ixUwczbC2JS3K0npLZFdOkWa5/TM9x
 eUrlWBErTtQNA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v7 08/10] drm: ci: uprev IGT
Date: Thu,  7 Dec 2023 14:48:29 +0530
Message-Id: <20231207091831.660054-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu kernel driver reports 16 for count_crtcs
which exceeds IGT_MAX_PIPES set to 8 in igt-gpu-tools.
This results in below memory corruption,

 malloc(): corrupted top size
 Received signal SIGABRT.
 Stack trace:
  #0 [fatal_sig_handler+0x17b]
  #1 [__sigaction+0x40]
  #2 [pthread_key_delete+0x14c]
  #3 [gsignal+0x12]
  #4 [abort+0xd3]
  #5 [__fsetlocking+0x290]
  #6 [timer_settime+0x37a]
  #7 [__default_morecore+0x1f1b]
  #8 [__libc_calloc+0x161]
  #9 [drmModeGetPlaneResources+0x44]
  #10 [igt_display_require+0x194]
  #11 [__igt_unique____real_main1356+0x93c]
  #12 [main+0x3f]
  #13 [__libc_init_first+0x8a]
  #14 [__libc_start_main+0x85]
  #15 [_start+0x21]
 
This is fixed in igt-gpu-tools by increasing IGT_MAX_PIPES to 16.  
https://patchwork.freedesktop.org/series/126327/
 
Uprev IGT to include the patches which fixes this issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to uprev IGT to fix memory corruption

v7:
  - No changes

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index aeb9bab1b069..dac92cc2777c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
+  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.40.1

