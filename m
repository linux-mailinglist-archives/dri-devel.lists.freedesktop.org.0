Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61622A37AF2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 06:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33ACB10E250;
	Mon, 17 Feb 2025 05:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U+eItVWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E16410E250
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 05:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739770658;
 bh=C+lXutHoUJOEM2UwycToDgt8SFL77v+z6PrK5qLhE+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=U+eItVWL+xqAGl88T9GzqSxXC0gqMLP74yXQalTui+meCI9IfIEWw9Be6dlCB3Vym
 w8lXlBFZJmJa6F1sQNtDZibTn/2pwU5X63GJGaf49gl15e7lVxCjg6QH/NihgqBkC3
 K06QlFYWA1lZh4Om0BEykkcHOvFKKBnu1Ed7l0SHbHmiZqsPwxEEy/kzdT7biEQwUa
 UkoEuoLwZqKQUR0rZjgpm6P092JQMuviJmx6xbNJamwUHl0tbajoT0pWdtfe8hH5Rs
 hY/YpvmvGW+neaqOxg1nZD68ncSb6r3YYbjrxuPoA1gzJLamREJoCasemRNWzfKmU5
 3VLFVxMAeFqWg==
Received: from localhost.localdomain (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B49D17E0B59;
 Mon, 17 Feb 2025 06:37:32 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, boqun.feng@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/ci: enable lockdep detection
Date: Mon, 17 Feb 2025 11:07:09 +0530
Message-ID: <20250217053719.442644-1-vignesh.raman@collabora.com>
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

This patch series enables lockdep detection in drm-ci. Any lockdep
failures will be shown as warnings in the pipeline. This series
also enables CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex slowpath
debugging and refactors software-driver stage jobs.

Test run with this series,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1366054

Link to v1:
https://lore.kernel.org/all/20240812112030.81774-1-vignesh.raman@collabora.com/

Link to v2:
https://lore.kernel.org/all/20250211152812.54018-1-vignesh.raman@collabora.com/

Vignesh Raman (3):
  drm/ci: refactor software-driver stage jobs
  drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
  drm/ci: enable lockdep detection

 Documentation/gpu/automated_testing.rst |  4 ++
 drivers/gpu/drm/ci/build.yml            |  6 +-
 drivers/gpu/drm/ci/igt_runner.sh        | 11 ++++
 drivers/gpu/drm/ci/test.yml             | 76 ++++++++++++-------------
 4 files changed, 56 insertions(+), 41 deletions(-)

-- 
2.43.0

