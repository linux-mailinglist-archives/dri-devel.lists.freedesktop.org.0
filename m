Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315AAA951E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB3610E0A2;
	Mon,  5 May 2025 14:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NTVyD1hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6B510E0A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746454313;
 bh=tIGZnInO3llyMoWK2+bBt9gCAfiyHT0iGIZI7DNasFA=;
 h=From:To:Cc:Subject:Date:From;
 b=NTVyD1hNHE9T2BbS9OH/QtHqy5WuDNOWMfxR2dpNDpxZk0G7RagZjVVRugH3qzYXQ
 aW85Rz1EV6xc5wYASvhDRfm8dmtfKCWmb7qY2+cyGSjeUg/Mj4ZBeDvdHmPL1vDYL5
 PbkHuUDNZAS0LR1wHqNDbq0cAQ13DZ3Ze5k0vnwxfrUjKIbY21y/beVifACHdNxSQd
 34nUu9ufbfifT/MKhaYSv2JDxFP2PJ1HouzS7kHu9y9zaTHDmCj6v0IhOnFj58xh8C
 p1uUW/FxhR+jI0JMO+R23Krrv3OAAEGj6BxBlE9g3xqUMpqaSPg5Eit1T3UJSAX8AU
 9gvlocWpaFl4g==
Received: from debian.. (unknown [171.76.80.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E07717E0F66;
 Mon,  5 May 2025 16:11:49 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ci: mesa uprev and python-artifacts fixes
Date: Mon,  5 May 2025 19:41:32 +0530
Message-ID: <20250505141139.472175-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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

The current s3cp stopped working after the migration. Update to the
latest mesa and ci-templates to get s3cp working again and adapt to
recent changes in mesa-ci.

check-patch testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/22
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1418294

mesa uprev testing,
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1418293

i915:cml jobs are stuck due to some issue with devices in the lava lab.

Vignesh Raman (2):
  drm/ci: python-artifacts: use shallow clone
  drm/ci: uprev mesa and ci-templates

 drivers/gpu/drm/ci/build.yml      | 10 +++++--
 drivers/gpu/drm/ci/container.yml  | 30 +++++---------------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 46 ++++++++++++++++++++++---------
 drivers/gpu/drm/ci/igt_runner.sh  |  5 +++-
 drivers/gpu/drm/ci/image-tags.yml | 20 +++++---------
 drivers/gpu/drm/ci/lava-submit.sh |  4 ++-
 drivers/gpu/drm/ci/test.yml       | 31 ++++++++++-----------
 7 files changed, 77 insertions(+), 69 deletions(-)

-- 
2.47.2

