Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FC413DF4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16D6E918;
	Tue, 21 Sep 2021 23:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521956E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:39 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id w8so674076pgf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KaOr+iVjfvuShj9ZpGnmwIF4s/YFeuhDRlcjYuMJV70=;
 b=ZYyBgc4hlKz70KEeU4y2THdeIvBYh8x5gUIc7h577eeJBukFvrKhIHIjHwAm/GxTJE
 ReN6rCu1O2q76iYIN3w5DQhHHQSaTdxCZg7mRA1Baklzl9QxUHSBuAZqKB9jGxYbRbNJ
 6rcAQt5lYZ0BiN5gX/UNFGB83e3h8evWEdGRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KaOr+iVjfvuShj9ZpGnmwIF4s/YFeuhDRlcjYuMJV70=;
 b=YQtmfFlanXVcBMnt9hndaadasATxpCElgO3NFTCUsKB7nsbbgqvclKHfHwfKlGnjt8
 6Wl+kcIDsd+WdGD5W9YhKkZZGj33DlefhZJgGFXv5IW2uYJDVzzN7+hgK8BBXj8/58e3
 XpfudB1r6N5L/q9uDhfMXUsQzVTiq86FVoj7Cwmh8rw8oA8veWKfEKdFwIHheDq7vOWL
 Gm+TR7d5mYspMVdWyOYMX/kuEvadJhyQVnUfbOUkEdw4+9+TAvYXrteshBgQYdpotdja
 8M8Q4mgnFJcyhs7P1a4vnkdMhs9uCKgJQXSBF3N87fEn8GDaAMYDRyJb7NlGJ/lijvhu
 69+A==
X-Gm-Message-State: AOAM5306YqeP2T9neOzV+ldQoZhkUQUL6U3lJXNzDslV6uZmmaJRbL+9
 2roPG/NtIRX7V/PECuzI4HLFeU/y2NZnsg==
X-Google-Smtp-Source: ABdhPJzbLwyEJux665SP6bA0Fw9LUrBGxIOpRVa+UMhekfewymy0+yAFV4PBfdEX9zCoRh/nOCxUgA==
X-Received: by 2002:a63:88c1:: with SMTP id l184mr3684965pgd.289.1632266438691; 
 Tue, 21 Sep 2021 16:20:38 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:38 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 12/12] drm/virtio: implement context init: advertise
 feature to userspace
Date: Tue, 21 Sep 2021 16:20:24 -0700
Message-Id: <20210921232024.817-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This advertises the context init feature to userspace, along with
a mask of supported capabilities.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index fdaa7f3d9eeb..5618a1d5879c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -286,6 +286,12 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_CROSS_DEVICE:
 		value = vgdev->has_resource_assign_uuid ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_CONTEXT_INIT:
+		value = vgdev->has_context_init ? 1 : 0;
+		break;
+	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
+		value = vgdev->capset_id_mask;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.33.0.464.g1972c5931b-goog

