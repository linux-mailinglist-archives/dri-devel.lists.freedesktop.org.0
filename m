Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768B25B5AF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09226E95D;
	Wed,  2 Sep 2020 21:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755C96E95D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:23 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so397954pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeVSLXxceUjUqZd87CZF+DZDJIrRWa9mnuiD4JVBZB0=;
 b=SrblO0YZIO96dAuutypH+nd+wvQO34TqmKPeQhAE427WPLQqIvWNDrNbdzOrbFGTA4
 oV97a3oL2ZfySzDXqncII2vkTIc/BXnP7suxQEN4Yh8y4Qfvqy+M6uWPJr93cho6bTEQ
 hlMRe/mV3wrV690gvYft1ek0y8/ZRmfgPY4lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeVSLXxceUjUqZd87CZF+DZDJIrRWa9mnuiD4JVBZB0=;
 b=Yg4FYlrE2tO0VDMyXhx8qjHhROM0H2RL73d52CVJa2tD/bvUmf8T21053B2vx4kamk
 0T45G6saUiXmxFficuPMqX/8x+Ri7sQw8N9Io2oesCJy7xTT4V5qC18XTpH9lE1MN3FP
 Ph2IgQzN82/9ZR7SSAMNlqqya4gQRNg9WAeBuRO2c8M2Hj4/+Z+m1oIHV//rIzeAotWA
 CZjDxZpgo2Zbyr8klixahMd9B3kCISk6FPiME4mpH4Lr1wRC3azAGpWZY80azlzghf7A
 DdHvi3/eo+cYRiCiyUS2U0gX42D25eZK0xVmYwnY7h5GWOG0YVn1Z2mtEtSOyTaw0onx
 5yHQ==
X-Gm-Message-State: AOAM531cpjPfVoZq5ewmaaRDHlZ2u1b0at+OsqnT1PEt2IZitjkbRdn/
 Q2U9PhSQG72A5yVUnWJksF44bslTb9w0Gg==
X-Google-Smtp-Source: ABdhPJxJRaISTkbTs6M2Q2hwzzuc8/O3EyFEyPFVurKd6i20Xhex5cfCIoFxKX6arGHFt4JVXElWLQ==
X-Received: by 2002:a17:90b:f14:: with SMTP id
 br20mr3684422pjb.24.1599080962656; 
 Wed, 02 Sep 2020 14:09:22 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:21 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 21/23] drm/virtio: implement blob resources: report blob
 mem to userspace
Date: Wed,  2 Sep 2020 14:08:45 -0700
Message-Id: <20200902210847.2689-22-gurchetansingh@chromium.org>
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

The stride field has never been used, so repurpose it to be
"blob_mem". This way, userspace can know the memory properties
of the blob if it's passed between userspace processes and
no suitable userspace API exists to transmit that knowledge.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0075995a9f5b8..7dbe24248a200 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -300,6 +300,9 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 
 	ri->size = qobj->base.base.size;
 	ri->res_handle = qobj->hw_res_handle;
+	if (qobj->host3d_blob || qobj->guest_blob)
+		ri->blob_mem = qobj->blob_mem;
+
 	drm_gem_object_put(gobj);
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
