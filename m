Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975924432D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52816EAD1;
	Fri, 14 Aug 2020 02:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B106EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id f5so3515121plr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBdL6rsQPmatVbrgIA2MIRVgMnQa+GuMCanRStz/t0A=;
 b=ICG7Cb4M7/sBKqCrg6GMVfxeLk7AfBMkm65OKfgoshGpcx+s4JqFO+1r1IrAPgDmKh
 7z7JnHWXrZMtYzEDAuBqeN8GF49pfCEuYm3rNc7ZenV28HDF4vc5MRvFxkt5+osDOrja
 WBQOFGVfIG7+9Rp03PvtNvkqqdPfbLIz5WRcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBdL6rsQPmatVbrgIA2MIRVgMnQa+GuMCanRStz/t0A=;
 b=tDw/QB6eYNRJSOZN03iMwghZniIKJsN7HMz/jNZJeB0j5JDj2vP5SneJvnaPsyVCQt
 /xStK0NaICpxdsPAxILL1J7fMTFJmuG5olRCMolaPWf7NHNiykPiNar4zOxYVI0u/Etq
 BKi+Qz4ze6EkYATWskc5BgbOt3MUVO7xzYsRrEcbEuBFOcXz9cqJxPAD8X9OZizNIgN0
 +foxKMB2evlwE/TD6BUsL9kZXY2QnRnO7JJydlbzHLgTbTNgucWLaIVsT+BtYJQaFKcH
 6X/HsyMppKKmnD8iO8viWjHQYfZF1JrNvY69wiFIkKqC2B1+YN3F8apO5vaHRQFsvQ9T
 wCjw==
X-Gm-Message-State: AOAM533c/n9VTuOiKL/rpy7oRXdTqoR8kNwF53rvyXGYft6RtdnrYCev
 3HBUk9ReyQ4EJFYfTANhbC9bHIXDvKw=
X-Google-Smtp-Source: ABdhPJydXUpdQw3BIg2NCq2y+qBJKySV6ejf76Nd77XsC5yB0PANDrw1SzuSmMPqm+mAZ6o21yiLIQ==
X-Received: by 2002:a17:902:aa4c:: with SMTP id
 c12mr546386plr.237.1597372830278; 
 Thu, 13 Aug 2020 19:40:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 22/24] drm/virtio: implement blob resources: report blob mem
 to userspace
Date: Thu, 13 Aug 2020 19:39:58 -0700
Message-Id: <20200814024000.2485-23-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
index 0075995a9f5b..7dbe24248a20 100644
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
