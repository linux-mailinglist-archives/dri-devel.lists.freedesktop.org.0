Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280E63C8EB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEAD10E35F;
	Tue, 29 Nov 2022 20:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290D10E367
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 20:03:00 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id k5so13694556pjo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmLZiaEVkjJr8RiYF6yToHXQoLPPBZhOHiujuwoMMv8=;
 b=Dz7C3calMnoC2yh0ZC4zZ18Y3+Fg658tq9lsj9p0WciuPXjgUd+tVvWl0Lc62p6jVW
 r2Bd5aY2VRPWULHTa6j95JU+cnKHKPHnhokZ8HHRUkXMxDRfKyho4TJOBtfLMgnN+jtk
 6qX+OzHN0jn37opP0t8b0WA97hE2SX19L9NufPseOkLxo9fx3ln3D27ws/2/FmFfLWBs
 2QiVp247MYChRznqD8zQlY1Lq6+md5jBcmE2ngOip1Im7cI9Rx6uQL1xuibovEpkTLY9
 POfy1S6VtEZK9vsQvB5mLbG+0CGKZwNmlz/ChDoSF5CaH+QBXV5gMYFobvOGJ+Jp5ez7
 mLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmLZiaEVkjJr8RiYF6yToHXQoLPPBZhOHiujuwoMMv8=;
 b=TBZKygFrrAh5t2uNN7ls0VxIQ3kKtmdhUt9rnYAi1TGE3IpoJlkbDJxzoHBLtkXZRx
 qnhbnBMebC6HHA8OScBLBvOjNE+CGSNGFsONNRoOAgKjkaT4uVJIsVRm5MdrZS1Q7yca
 PlwjOTl5TXasp9FTVN5VOONWun7P4gVhPsFOZq4kAPEfCmetiDk1yswbDtQ+gQS8XDxj
 dIrGyE/zACH/mQESsn/N4rOj9U3dMRUkjdZbKLZ6DotEcKRgNQ8wb+78YtPHo+t7W4AZ
 NIQUvciXS7vPfxq7dHfiPzjfRcbQjb5TkabVkdRIoWQ85K6xL+FoXh4y8vzsHdOzcPbN
 g4Ow==
X-Gm-Message-State: ANoB5pl5N0sdsdYDI3RNfpsdR4tN5xl2nqpNHJxjPnW5lHnWxjDh8A79
 dYBDXzRX93cfB/ohgRqaZcYwM9z6JcQ=
X-Google-Smtp-Source: AA0mqf58iGfyCo4hDR+2yRciiyJd2DTGXcfQcykl7GdRzbd7PwYHNjjcg3PQcDS5ZyQve/9BqimogA==
X-Received: by 2002:a17:902:dac6:b0:189:7105:59e8 with SMTP id
 q6-20020a170902dac600b00189710559e8mr19846111plx.50.1669752179326; 
 Tue, 29 Nov 2022 12:02:59 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a17090311c500b00186985198a4sm11337838plh.169.2022.11.29.12.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:02:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/shmem-helper: Avoid vm_open error paths
Date: Tue, 29 Nov 2022 12:02:42 -0800
Message-Id: <20221129200242.298120-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129200242.298120-1-robdclark@gmail.com>
References: <20221129200242.298120-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

vm_open() is not allowed to fail.  Fortunately we are guaranteed that
the pages are already pinned, and only need to increment the refcnt.  So
just increment it directly.

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 110a9eac2af8..9885ba64127f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -571,12 +571,20 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
 
 	WARN_ON(shmem->base.import_attach);
 
-	ret = drm_gem_shmem_get_pages(shmem);
-	WARN_ON_ONCE(ret != 0);
+	mutex_lock(&shmem->pages_lock);
+
+	/*
+	 * We should have already pinned the pages, vm_open() just grabs
+	 * an additional reference for the new mm the vma is getting
+	 * copied into.
+	 */
+	WARN_ON_ONCE(!shmem->pages_use_count);
+
+	shmem->pages_use_count++;
+	mutex_unlock(&shmem->pages_lock);
 
 	drm_gem_vm_open(vma);
 }
-- 
2.38.1

