Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED9B24432E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF74F6EAD7;
	Fri, 14 Aug 2020 02:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FB06EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:33 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id e4so3727432pjd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz2om842hENe1C4GxYuHo4uVUVtC9/pJb1TCYs9UAyw=;
 b=C/XZbYYNs5TsZt4SVItSqAaaenn0dbjsVNbRraQMDKk34qewKYL3jw+efc/rxA3Z9x
 ptz1CNXxMro73mwMVPnimjT0DPs2Ugbfdd6f7eGfDSGtWYWAguiB0YLZrS1O+s1Q7Z7g
 1X4zG8mvYF8qLzsjxJNg7mSWWKeefR0sq1ISI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz2om842hENe1C4GxYuHo4uVUVtC9/pJb1TCYs9UAyw=;
 b=F659cmaM2IkkmQ/yfnqopLUPLgIlZWBX7DNFe3nINETIIu68egcjAVlCd6QN289R4V
 JbiaDXhiYYN4PbT5g/8DZ//LquVQ4566wud3IxT0UHhrZ5enY85Bgk+8fNAEMUOILGTF
 c37haH6rFppJS80hXmKvQp02SIm3K4RvWRzBdfQFjqO7JC8iIuxz5gDVrhtLpuGIEH2A
 2I0/LGiKGRZIUAh55ZIYTM8ECPPXB6Zd9gfaDj+h5BMQqZJlhMeQMuwbydxwFAlkc4vi
 NPqvLkXiTSg1q51M6GB6y+cJ1rLC4ID3oMYIMuCnDggytU/9eSUSOc2Vt5VweZmM6uXJ
 79fQ==
X-Gm-Message-State: AOAM530yMGJBGXoO/NZ+o0iWK0EElpmxycjrc5gAH2Z5f5F8YXrQi0ce
 2IAs3qGv1vNi96UHHBXed5H1+K9HxNs=
X-Google-Smtp-Source: ABdhPJyKxR69db754/kUKl5o+barEmlZ20guuHuFzKLtdj/G0WFk9KaIVyo9GJjjs0GCE4LfpvnhWg==
X-Received: by 2002:a17:902:123:: with SMTP id 32mr521465plb.143.1597372832770; 
 Thu, 13 Aug 2020 19:40:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:32 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 24/24] drm/virtio: advertise features to userspace
Date: Thu, 13 Aug 2020 19:40:00 -0700
Message-Id: <20200814024000.2485-25-gurchetansingh@chromium.org>
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

New api changes are now available to userspace.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 47ac32b7031a..f3737dc0f8ea 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -216,6 +216,15 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_CAPSET_QUERY_FIX:
 		value = 1;
 		break;
+	case VIRTGPU_PARAM_RESOURCE_BLOB:
+		value = vgdev->has_resource_blob == true ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_HOST_VISIBLE:
+		value = vgdev->has_host_visible == true ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_CROSS_DEVICE:
+		value = vgdev->has_resource_assign_uuid == true ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
