Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A134AA951F
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9310E0EB;
	Mon,  5 May 2025 14:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EVnW6Jbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004C10E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746454317;
 bh=/enN1zzXgWLN6TP2Q9v37bu1VnQvmfewf6HUUiqEyQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EVnW6JbteY7iY9MZb9CEGvKVCX6saM92cxxh5IDrTtXEgc2dVewXP/cje4+ES2OwR
 65i5WXIOLqcU+lowrh/I6xWdZd/T5945k6be9QQL1ZyWKEQFKYZ3ty1BOmP0If19rE
 1faP4fFMjalc3MDHGNTh3F/SUfLhr/o+Ef2AiDoiynpeDiLzxNBsg6LvHdNPt+QIwM
 5m7psi8ytzE3FhElJOEYXhS1KXjZvjPo97DsL7CxOHZeXuQtnmMuuzAodM2e/RQIeX
 LwEQPGrqaYRihq9JHnPb3swHp57PJhDQsE7Rn3ARd6gu5X6dAKTMN2ko1jCDHsTnVx
 pudPG1cdXlskw==
Received: from debian.. (unknown [171.76.80.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C522017E0F89;
 Mon,  5 May 2025 16:11:53 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/ci: python-artifacts: use shallow clone
Date: Mon,  5 May 2025 19:41:33 +0530
Message-ID: <20250505141139.472175-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505141139.472175-1-vignesh.raman@collabora.com>
References: <20250505141139.472175-1-vignesh.raman@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The python-artifacts job has a timeout of 10 minutes, which causes
build failures as it was unable to clone the repository within the
specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
build failures due to timeouts when fetching the full repository.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set GIT_DEPTH only for python-artifacts job.

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 65adcd97e06b..193f67121328 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -230,6 +230,11 @@ stages:
       - _build/meson-logs/strace
 
 
+python-artifacts:
+  variables:
+    GIT_DEPTH: 10
+
+
 # Git archive
 make git archive:
   extends:
-- 
2.47.2

