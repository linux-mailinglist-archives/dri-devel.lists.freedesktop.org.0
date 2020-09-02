Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0441D25B59C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28466E50B;
	Wed,  2 Sep 2020 21:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543A6E50B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g29so341199pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymA7CMBqzTf2AtulE3uzd14cV8H6af0RTgPo13nA5sE=;
 b=R1rGxgDGip3Ho5RPcmSCaAAYjB8/w+3T5TiHXgKpPUhPKuITQgua3bIFVtKOc3S2lR
 PTx3F0JMej4qg+YncPOWAOvMfUEv+itX1+j7B4anbkk+IQDiFsPO98TA1+loBLs97HSG
 otSx9Jae7Gq6I5DQok22aMp+VUB4f5vJig4Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymA7CMBqzTf2AtulE3uzd14cV8H6af0RTgPo13nA5sE=;
 b=K2H7EAom7Xc09Rfb/37t5xBa6MwpOQo6G1ZhH4ufFoDD7trBbi8vTL1XtZ/Fq37U6f
 mqlryWyWP4nI5TSbkVNGT/7/Tvd4K6tU33mHvqyIrh9oL1XX33W5O2mabSs57GHEKxxH
 b59oeqlGa8bCwQmBiVdSWjzXFLQBLkzUVaCVNrd3q7Sv0nbQXytQ5WGfR5hl/IKP63nj
 ENPYwf2dhJhaEHy3DhZTHAozBxxw5AqkuY3AxRvSYPm0gpVKQm9yKYoHIOPkXgdq8rg6
 fwlFNcYYwqe3WOpeJhzBFukZcw4BGagR/mgrKihra0nSewPipdDXmVZTnN4g+Z/RzTgv
 HE7w==
X-Gm-Message-State: AOAM532FEqCNIV+M+e56Sib/FBrJoAVDDCYBXzi3kuPFsF4I53JBGsmT
 mkcR8r2EviW55JaMrf+vtZgkHgbTm/9yHQ==
X-Google-Smtp-Source: ABdhPJzL3May1A6+IcfJGbmLgiXhOvrvrS5vkcLee4iNcdcp4FxZES3BVqnvqG0uKbZrlcqTa2Q3Aw==
X-Received: by 2002:a62:1984:: with SMTP id 126mr303263pfz.17.1599080934473;
 Wed, 02 Sep 2020 14:08:54 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:53 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 03/23] drm/virtio: report uuid in debugfs
Date: Wed,  2 Sep 2020 14:08:27 -0700
Message-Id: <20200902210847.2689-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In keeping with other features, report this in the debugfs.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 3221520f61f0c..d5b0c543bd6d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -48,6 +48,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
 	virtio_add_bool(m, "edid", vgdev->has_edid);
 	virtio_add_bool(m, "indirect", vgdev->has_indirect);
+	virtio_add_bool(m, "resource uuid", vgdev->has_resource_assign_uuid);
 	virtio_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
 	return 0;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
