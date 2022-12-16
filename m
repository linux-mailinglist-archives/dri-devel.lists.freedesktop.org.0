Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897564F52D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21A010E642;
	Fri, 16 Dec 2022 23:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD67410E641
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:33:55 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d3so3753016plr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfjZR0CL1te6hYjGQ5Dgru9uZsEh0pXQEs7OK+nQBYw=;
 b=MEAPdrhZCgMx9z1Z6Jn2EYHyIXxjfM1YSxkXyqhSTc2jPmkC1c0uWfXBTsUYHE4PtP
 h8rVGbHesBKlT+CU8fc6gdoh+eOabsO2dVBJGr+mVHhCuUmi6DwypQm/9vV1MI1fcg1D
 5/Yf8XKQKp8JDF1kx0kdS89aVofVbDMcDrnd3M+E0O8FW5mqg3NBwMpmq92xGyZeL7yA
 dYhh8ayAcrmYr90vQ5arscaU13bsjieP09SmQliZrPvFAVWLqFwfXbCVU6Fl1I09FxNL
 01/YSveCtv21TrKwk4tV+8bE8YqKj4uQoT9ueZf8XPZpLeFHtkswnov/hR++CjriaVDq
 WNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfjZR0CL1te6hYjGQ5Dgru9uZsEh0pXQEs7OK+nQBYw=;
 b=fIHyCiMvpp4FznKOphNPjYeLiqmA65MUPD7gJHuhKP7jrEZdRe9p/xSFbWl9IczJH3
 +4VnRyPlVPhdRQiRcX7Tcm2TMc2ICqG4JZ/Dn9GdQbix1nVEwaer4hsc/U15X3TrIlXL
 f5gGgr+YQQu2Wc1O2bgJy0C3b6crnabIGBxbN9+B6N8j1g9o6Co9k2QCuhTLIzw6Ivh7
 ilZ47VJDDDyircyGpcwQT3T4aTBYPDw7R0t0pz5/UwZGD1baVa3XaJW5EAWH/O8niChO
 WI1t/Ib8jdzGzYIPNGiajsjEUG1RpLS4Aw66nOiBM2mTqS/6syoF7ET6z5SJvObX0P4L
 Kjug==
X-Gm-Message-State: AFqh2kqAaANQaa3llyxYHbaQ9eO8ifg1acVsKgFdfz5N7AEzUQARtX/G
 +eqyzCwnEl6yPNrRmDeV++1WQw2BRl4=
X-Google-Smtp-Source: AMrXdXsGC5cwDrscK9zfqya1W9a0AUROGuAxhCkIiB+QuUseJeEHf7YPmb7ebCFt6ikROnxni4p6EA==
X-Received: by 2002:a17:90a:6744:b0:219:1d62:9e05 with SMTP id
 c4-20020a17090a674400b002191d629e05mr164074pjm.34.1671233634873; 
 Fri, 16 Dec 2022 15:33:54 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 64-20020a630743000000b0047781f8ac17sm1976000pgh.77.2022.12.16.15.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 15:33:54 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Fix GEM handle creation UAF
Date: Fri, 16 Dec 2022 15:33:55 -0800
Message-Id: <20221216233355.542197-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216233355.542197-1-robdclark@gmail.com>
References: <20221216233355.542197-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Userspace can guess the handle value and try to race GEM object creation
with handle close, resulting in a use-after-free if we dereference the
object after dropping the handle's reference.  For that reason, dropping
the handle's reference must be done *after* we are done dereferencing
the object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index a5cccccb4998..f1c55c1630ca 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -366,10 +366,18 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 		drm_gem_object_release(obj);
 		return ret;
 	}
-	drm_gem_object_put(obj);
 
 	rc->res_handle = qobj->hw_res_handle; /* similiar to a VM address */
 	rc->bo_handle = handle;
+
+	/*
+	 * The handle owns the reference now.  But we must drop our
+	 * remaining reference *after* we no longer need to dereference
+	 * the obj.  Otherwise userspace could guess the handle and
+	 * race closing it from another thread.
+	 */
+	drm_gem_object_put(obj);
+
 	return 0;
 }
 
@@ -731,11 +739,18 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 		drm_gem_object_release(obj);
 		return ret;
 	}
-	drm_gem_object_put(obj);
 
 	rc_blob->res_handle = bo->hw_res_handle;
 	rc_blob->bo_handle = handle;
 
+	/*
+	 * The handle owns the reference now.  But we must drop our
+	 * remaining reference *after* we no longer need to dereference
+	 * the obj.  Otherwise userspace could guess the handle and
+	 * race closing it from another thread.
+	 */
+	drm_gem_object_put(obj);
+
 	return 0;
 }
 
-- 
2.38.1

