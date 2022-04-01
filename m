Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C14EEFA4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339210E61E;
	Fri,  1 Apr 2022 14:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1DE10E61E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:27:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC6E1B82504;
 Fri,  1 Apr 2022 14:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409F5C340F2;
 Fri,  1 Apr 2022 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823258;
 bh=PTQafVcH6uGdJl+Xnw4Rt465WL/8+lgTK90mj/4yFRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hFDYZnVyzfXs7rLa+YyKKB2v5IZGFL/yGYrhbTBOnvh04lpFgRNhiNNGn2Qhd5+wB
 BgTI7jYBWlSuCHgpUeGMNdAM0jQ+lwvO14fTgdUsMsC3sNd+R0puz18SD50h1yiySg
 +ScvXsN1vbpO3Uf/7QizWCOQ3Yk2Rzm+AQ7imgVIemBaGFeQIRkZK8KTR+U0a2HuU5
 cCGHiQWtFXECq2QYfQIOeNOAQOJPgUzaRT+3leKNzK+HRHQDTE8Ah41AcoNozEZBtu
 7T8GEcsnmvlRCDcACDEcoTahI8EvRatWPYMH4YdXTdD0LgD07Tw3pBkt4RGbIyXE4I
 QhYrRVXHxfDtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 037/149] drm/v3d: fix missing unlock
Date: Fri,  1 Apr 2022 10:23:44 -0400
Message-Id: <20220401142536.1948161-37-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 emma@anholt.net, Yongzhi Liu <lyz_cs@pku.edu.cn>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 airlied@linux.ie
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongzhi Liu <lyz_cs@pku.edu.cn>

[ Upstream commit e57c1a3bd5e8e0c7181f65ae55581f0236a8f284 ]

[why]
Unlock is needed on the error handling path to prevent dead lock.
v3d_submit_cl_ioctl and v3d_submit_csd_ioctl is missing unlock.

[how]
Fix this by changing goto target on the error handling path. So
changing the goto to target an error handling path
that includes drm_gem_unlock reservations.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1643377262-109975-1-git-send-email-lyz_cs@pku.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index c7ed2e1cbab6..92bc0faee84f 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -798,7 +798,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 		if (!render->base.perfmon) {
 			ret = -ENOENT;
-			goto fail;
+			goto fail_perfmon;
 		}
 	}
 
@@ -847,6 +847,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
+fail_perfmon:
 	drm_gem_unlock_reservations(last_job->bo,
 				    last_job->bo_count, &acquire_ctx);
 fail:
@@ -1027,7 +1028,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 						     args->perfmon_id);
 		if (!job->base.perfmon) {
 			ret = -ENOENT;
-			goto fail;
+			goto fail_perfmon;
 		}
 	}
 
@@ -1056,6 +1057,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
+fail_perfmon:
 	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
 				    &acquire_ctx);
 fail:
-- 
2.34.1

