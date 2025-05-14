Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB7AB61EB
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 07:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F51D10E21A;
	Wed, 14 May 2025 05:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Mgfe1tkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F2710E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 05:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747199055;
 bh=fIu2GoblYaX9oVr9OdXmzneCDdQNm6ehbUVzxgRA1Fk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mgfe1tkpySKK6a/e4jJDjwGMlhFF0bj7wV2YU8S2ShEnyiFCpE1XZg3Q07HcOv9yY
 RM1abqmi/Jax16PEyP6fzCXs5XInkitC0deWNAEXBXkDgUVVeUEFZwrjGdF12U4RVP
 BvpJyR1gARjVREtP3fs3o+jfZqI2W2wG96fxRuZZvMF4hgcei1jwNHffYx7B8rjve/
 YnIGzmAsz8WO1tyTJvI5RPYp5d1AngF31M34FhxPHH9F0T1W85ZnpE8kV/+gCfwDxE
 vev9sWoV1SQ4ALQtVO3pIvM2OTX3HgeW4by2e2/cUuSb41bxu+bCN4V59NYPnomaVA
 ZczCbV//dDhxA==
Received: from debian.. (unknown [171.76.80.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EE33417E361D;
 Wed, 14 May 2025 07:04:11 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/ci: python-artifacts: use shallow clone
Date: Wed, 14 May 2025 10:33:35 +0530
Message-ID: <20250514050340.1418448-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514050340.1418448-1-vignesh.raman@collabora.com>
References: <20250514050340.1418448-1-vignesh.raman@collabora.com>
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

Acked-by: Helen Koike <helen.fornazier@gmail.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set GIT_DEPTH only for python-artifacts job.

v3:
  - No changes.

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index ba75b3a7eca4..cffcacfd070e 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -232,6 +232,11 @@ stages:
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

