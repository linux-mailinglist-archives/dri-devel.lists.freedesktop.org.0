Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DD5623D4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D0B12B149;
	Thu, 30 Jun 2022 20:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99BF12B131
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:06:31 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4F7A6601982;
 Thu, 30 Jun 2022 21:06:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619590;
 bh=ZPZ5Uw8WfuLpWfqCGj0P84Xq3+MvCoBG3Xz7cqkjkIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtuP5uxMVGGoJr+g1XAK8gzrG+Ce0uKhMWiz8589NkV3hXraWoS9dXwCl2p4iDfzi
 yRGe/FI+8iOcun6gyHS5hv3V6jD/M8o3MRjPfZfappvu6pOhorvCMvKvCdP7WHFdgW
 GPciW+ul7eGORtSTNkIaU7pixxx3lJ/LMxmEYYuBqafO5Q6KD5BNJh1cd7AekE8uIR
 WShj/XvrAzMRocXBpSJ4xg8K7KVUMuDiSIXmyso5SQmvi/q/lt0jBiJa9IiOd9jeGq
 134r/fzE5N/WxVSFc4IMm2D+yVe7V5FVv7hfkSY3PvgPY9hGAIft7FAU1vchCGAJBs
 88JGZOeLAISbg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v7 2/2] drm/panfrost: Fix shrinker list corruption by madvise
 IOCTL
Date: Thu, 30 Jun 2022 23:06:01 +0300
Message-Id: <20220630200601.1884120-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200601.1884120-1-dmitry.osipenko@collabora.com>
References: <20220630200601.1884120-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling madvise IOCTL twice on BO causes memory shrinker list corruption
and crashes kernel because BO is already on the list and it's added to
the list again, while BO should be removed from the list before it's
re-added. Fix it.

Cc: stable@vger.kernel.org
Fixes: 013b65101315 ("drm/panfrost: Add madvise and shrinker support")
Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index c58075bc096e..2d870cf73b07 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -433,8 +433,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	if (args->retained) {
 		if (args->madv == PANFROST_MADV_DONTNEED)
-			list_add_tail(&bo->base.madv_list,
-				      &pfdev->shrinker_list);
+			list_move_tail(&bo->base.madv_list,
+				       &pfdev->shrinker_list);
 		else if (args->madv == PANFROST_MADV_WILLNEED)
 			list_del_init(&bo->base.madv_list);
 	}
-- 
2.36.1

