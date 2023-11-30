Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CF7FF696
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4610E736;
	Thu, 30 Nov 2023 16:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514A510E732
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f/vG7TxPL8Pv8sZmuHhzZoJmOkFLRMJMPmeGSQLe0EM=; b=F2/07+4ONP0ZHXN2wK9EEYxNTz
 YieJLXSEhDqZKhwfD5V9ZThHoTD1mDceDSnfircfEruAwwvSr+KBm6n8iEzNTIQ7qpN8m/VXbI4OP
 xSr+1CZ2DjBR34saf+fLL/IqFf9+beS+hTu/XWZ9wB427TdrwgHm4AKC0DIPddanNlxrj8SHvNKw/
 m++T8Jj5JgbIxPNvbpfckXonZtXs61x3LyUKqydAjJaPkft3Fpod01SoVQZ6vS5S+ca8OSEFpkBYb
 FCTW07YB8CPSzZM2SdT48DTIsdjhHlqd17lTPjT5d6tkK3Z9NsgB/MB6pq4ImyHSo+y2u0WMpbWlr
 Zmlx51yg==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kA6-008scY-G7; Thu, 30 Nov 2023 17:45:15 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/17] drm/v3d: Simplify job refcount handling
Date: Thu, 30 Nov 2023 13:40:27 -0300
Message-ID: <20231130164420.932823-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Instead of checking if the job is NULL every time we call the function,
check it inside the function.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index f36214002f37..a0caf9c499bb 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -129,6 +129,9 @@ void v3d_job_cleanup(struct v3d_job *job)
 
 void v3d_job_put(struct v3d_job *job)
 {
+	if (!job)
+		return;
+
 	kref_put(&job->refcount, job->free);
 }
 
@@ -517,11 +520,9 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 						 &se,
 						 last_job->done_fence);
 
-	if (bin)
-		v3d_job_put(&bin->base);
+	v3d_job_put(&bin->base);
 	v3d_job_put(&render->base);
-	if (clean_job)
-		v3d_job_put(clean_job);
+	v3d_job_put(clean_job);
 
 	return 0;
 
-- 
2.42.0

