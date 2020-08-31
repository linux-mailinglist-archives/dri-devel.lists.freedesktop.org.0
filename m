Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32935258430
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 00:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252036E53C;
	Mon, 31 Aug 2020 22:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663C66E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:47:47 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id d26so10826888yba.20
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=KBtyw/RYmlSgJJ/27vILnBFPPzBvH0RegA0nLlpxjlc=;
 b=nnEChR4K+kZlMdchOSixR5K21N3MsHT5xPfBEgSVkZXGongrjChO3I7h8kr/CGDMBC
 sGviFdx1h3/Tr5iMkCZbp/FBMn1qlItT2Kfioxj2eAz2JyXOXzYNjtXhkqVPBeIiSHHF
 rGg2TxIvihlgbskgiRErmigMMuqleULXJZdhBpAcIGkbSPbX5XtRqgRReiuKUg4eu5IB
 vGc/fk2HD+HqM9XuzviczaRE2FK/7JCCabaHAE/Gg2xnsbqlrOCA3iAQFf7mKd6iL3qt
 iQ2BBgoUcXHyj1f9dzW2uPSS/qm34k389mPb6NUdEUg9sJaz4oTAfIrkIs3LTieXuLxL
 B5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=KBtyw/RYmlSgJJ/27vILnBFPPzBvH0RegA0nLlpxjlc=;
 b=H+YtbIz1tWZMhvaIvEwTWW0VAOCGq/KIXeOZyikuVr9iJr7y5Pe11hrpXH5JQudHy1
 QHS68GdbayMqCdWId1zx3cmbZ3bZVa5yH8vnrmzaWk6KLkAFXYxx+eIzM5o3Rplz7n+0
 h9EBt2B2HDkRpjumAaxTwE99pCCJ+GobPxOFjFfcebPuAHvq5Nkjozr1ZbB0+FuHSk3z
 VrP343pjDkU1wmsZn06CsIwEt/OzqFVhuZbpl/tcffpjXwHWsITbDePx0q8IFNt/bQ0T
 yNYffQ3FjaSlx/yrB29eYT3S7OjB16nX8FXfcORWx05NmnVCb6Ug8JuvI1EArIRec0wo
 JnAQ==
X-Gm-Message-State: AOAM533d4Tc6NbZWixcXPaaWOkLsKkXRRZmcf76b2ilgxLfkYhTTD+Lf
 9M/buj+JaDnZ3aachGj745cjSVYha6ARuA==
X-Google-Smtp-Source: ABdhPJyvEDGNzHiqwlI3HHsIGPS4iLco1NHQNc0Bx5jyBoa+GGnjWSSsU0rXGmvaNYJAt0/xbcOItFPNatE32A==
X-Received: from doughorn0.sfo.corp.google.com
 ([2620:15c:8:15:5265:f3ff:fe2c:51b7])
 (user=doughorn job=sendgmr) by 2002:a25:e06:: with SMTP id
 6mr5614705ybo.80.1598914066435; Mon, 31 Aug 2020 15:47:46 -0700 (PDT)
Date: Mon, 31 Aug 2020 15:47:42 -0700
Message-Id: <20200831224742.1342039-1-doughorn@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH] Fix use after free in get_capset_info callback.
From: Doug Horn <doughorn@google.com>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
 linux-kernel@vger.kernel.org
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
Cc: kernel-team@android.com, Doug Horn <doughorn@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a response to virtio_gpu_cmd_get_capset_info takes longer than
five seconds to return, the callback will access freed kernel memory
in vg->capsets.

Signed-off-by: Doug Horn <doughorn@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 75d0dc2f6d28..5ba389e0a02f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -80,8 +80,10 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
 		if (ret == 0) {
 			DRM_ERROR("timed out waiting for cap set %d\n", i);
+			spin_lock(&vgdev->display_info_lock);
 			kfree(vgdev->capsets);
 			vgdev->capsets = NULL;
+			spin_unlock(&vgdev->display_info_lock);
 			return;
 		}
 		DRM_INFO("cap set %d: id %d, max-version %d, max-size %d\n",
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c93c2db35aaf..7436705ba5a2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -684,9 +684,13 @@ static void virtio_gpu_cmd_get_capset_info_cb(struct virtio_gpu_device *vgdev,
 	int i = le32_to_cpu(cmd->capset_index);
 
 	spin_lock(&vgdev->display_info_lock);
-	vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
-	vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
-	vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	if (vgdev->capsets) {
+		vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
+		vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
+		vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	} else {
+		DRM_ERROR("invalid capset memory.");
+	}
 	spin_unlock(&vgdev->display_info_lock);
 	wake_up(&vgdev->resp_wq);
 }
-- 
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
