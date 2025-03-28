Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BDA748E3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3010E9F5;
	Fri, 28 Mar 2025 11:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sz2kqWji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985A10EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743159771;
 bh=Eg4htkgtKxBxfGSXYOZ7EIc8dBXBO4HYGaR+6HLT4nk=;
 h=From:To:Cc:Subject:Date:From;
 b=Sz2kqWjiL6JPedeWh2Yu1sKA0RuuOaiMvI3zA0EHxyfMhBe5Sfpl1W2M4fOUJ6WHU
 +QjOOGFWFcPepp7uF5IAW4fOX/8tzagh4MZnNSOJfaqFhFASQCjP12u2BzkjG3y9Xs
 PaLpuH2xPaiXbnb3JtiUNuIQGc/1BIhU/7a5vzRkmkPmo68wzNGK9KonaoMvdEpafM
 CCw/ZJzaaOeJ0O3HJvq0i+mdcR+uxDZLB0RsYqG99cjjGB8m+IGpiRwk0thUH7Omp0
 /FD65Y9bJ8CfxH0djH4PiynHWIdXGMzfUO37myCXcpvI4zr8pp24OX87jVJVIz+RUP
 KdZ2k5wbLuqPQ==
Received: from debian.. (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 19A4C17E0673;
 Fri, 28 Mar 2025 12:02:47 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: mesa uprev and python-artifacts/check-patch
 fixes
Date: Fri, 28 Mar 2025 16:32:30 +0530
Message-ID: <20250328110239.993685-1-vignesh.raman@collabora.com>
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
specified limits. This patch sets GIT_DEPTH to 10 to speed up cloning
and avoid build failures due to timeouts when fetching the full
repository.

The check-patch job is also updated to ensure the repository is not
shallow before fetching branches. This prevents issues where git
merge-base fails due to incomplete history. Additionally, the timeout
for the check-patch job is set to 1 hour.

The current s3cp implementation does not work anymore after the migration.
Uprev mesa to adapt these changes. Also replace broken s3cp command with a
curl wrapper call in drm-ci.

check-patch testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1391545

mesa uprev testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1391440

Google farm is down, so the baremetal jobs failed.
i915:cml jobs are stuck due to some devices in the lab being under maintenance.

Vignesh Raman (3):
  drm/ci: use shallow clone to avoid timeouts
  drm/ci: check-patch: unshallow repository before fetching
  drm/ci: uprev mesa

 drivers/gpu/drm/ci/build-igt.sh      |  2 +-
 drivers/gpu/drm/ci/build.sh          |  6 +++---
 drivers/gpu/drm/ci/check-patch.py    | 16 ++++++++++++----
 drivers/gpu/drm/ci/gitlab-ci.yml     |  8 ++++++--
 drivers/gpu/drm/ci/image-tags.yml    |  2 +-
 drivers/gpu/drm/ci/lava-submit.sh    |  2 +-
 drivers/gpu/drm/ci/static-checks.yml |  1 +
 7 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.47.2

