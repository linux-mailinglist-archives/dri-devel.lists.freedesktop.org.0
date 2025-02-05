Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F21EA28563
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF03F10E747;
	Wed,  5 Feb 2025 08:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B9x1gP7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9D610E747
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738743432;
 bh=5pzgqUleGLu1LVcCS6A0NDwS0fzFq+0ef1U3G8sw2uY=;
 h=From:To:Cc:Subject:Date:From;
 b=B9x1gP7q5uYFDr5s+zlmpzqgtfaW4a53udI09DNCmRcfXQYmOiYyJ7G+kMt/xjy7v
 9C4MalyXPg5PnwpBOkdLOXosfXy0ZUT467APVx6aYL2/YVd8LahjAnD6+fz6IcLH6/
 lCiJxWkcVDhmCOqZw5FUWiznWq3FjeH7O7Be18vwDW012pPp9cojxkEBXEayenfbG2
 f2cO2nBiwA3vJrE/TNAgG/s3hQLT/lOedRuBgL0yMC803qWoQygI5p/tW6z1/gacR1
 TDtXxchtdpeP5gbIkKEQCTDsBSpBtbrb47CtyPaQWWNrmE/W7GhLOnQqXe6Nhay2YX
 cvEALvH6ggGvw==
Received: from localhost.localdomain (unknown [171.76.83.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C613C17E0DD8;
 Wed,  5 Feb 2025 09:17:09 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/ci: uprev mesa and modify gitlab rules
Date: Wed,  5 Feb 2025 13:46:45 +0530
Message-ID: <20250205081652.1928927-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Uprev mesa to adapt to the latest changes in mesa-ci,
including new container jobs and stages. Update the
lava-submit script to align with recent mes-ci changes
for using LAVA rootfs overlays. Modify gitLab rules
to include scheduled pipelines. Also update the
expectation files.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1358207

Link to v1,
https://lore.kernel.org/all/20241128042025.611659-1-vignesh.raman@collabora.com/

Vignesh Raman (2):
  drm/ci: uprev mesa
  drm/ci: update gitlab rules
  drm/ci: update expectation files

 drivers/gpu/drm/ci/build.sh                   |   2 +-
 drivers/gpu/drm/ci/build.yml                  | 104 +++++++++-
 drivers/gpu/drm/ci/container.yml              |  22 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              | 195 ++++++++++--------
 drivers/gpu/drm/ci/igt_runner.sh              |  13 +-
 drivers/gpu/drm/ci/image-tags.yml             |  11 +-
 drivers/gpu/drm/ci/lava-submit.sh             | 100 ++++++---
 drivers/gpu/drm/ci/test.yml                   |  37 ++--
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 9 files changed, 325 insertions(+), 161 deletions(-)

-- 
2.43.0

