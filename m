Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443B73F8058
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9326E491;
	Thu, 26 Aug 2021 02:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767E26E492
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:13 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so5014932pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7M/Bslgy64/2McARkqjQdkDLFrhy7btTeTgK4rZ/QU=;
 b=PQ9++Z44mDZF1o+0CWJpdDOX7hAiPh85dM3KBeGs4LQG1rs28D0pfZBt9uAOMc9YGx
 3QsBdNeiFXg6WeVeYm6jjarYwyPTLqZcru6bANM3J/WXsRfiqlkDhG8IFPhH7MHhlgKB
 B8PgsbVWmg3GdknecVoTGEkwEHKChsYVn9MEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7M/Bslgy64/2McARkqjQdkDLFrhy7btTeTgK4rZ/QU=;
 b=JWMAAoe0zVBEm29xZ3iLnCWPamCFF1NbF64br053fKzsqOHBSoILjGNTxuLDtAnPGe
 UnOIE9RrgfGiOr6uhj4fn4S12W0ZUw6wt3v0FQV1Vx5xgC1CYSDlO8554RcA4zK5t4uC
 M+vtMJvWg275Jiw78QJSmF3FpWElBPwmI1DE70hcicGP0JEZ2PU6bthmbRMIU6r0656d
 g2hzeyV2/88dwVa9vPK3QL9l4O6POn8ICDILdb9pg1deMxpgY0Hnxyzmcag41kqa7SOz
 63hjm3Q80qjrZReTxm8BBQnumq5ftp5nKaPYThmEDST6kKmbQhlrF3dC1eo/O3Le+vHv
 6IAw==
X-Gm-Message-State: AOAM530jEBapBUfzIiynjbPBkFz0yRDVlCp9w/n0KdAXTLEwxnCTyfrg
 mmquQT7FyGhXKNT5MOM5wWxMLfaA0HA/sA==
X-Google-Smtp-Source: ABdhPJwpPtbt2AzXiylN8ZfMpkxuhJ/B5S5p6nAco8EKpPoSX9lTBMnrs0z/lG0hw8tJzjSFTxc47A==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr13443485pjp.167.1629943512834; 
 Wed, 25 Aug 2021 19:05:12 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:12 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 12/12] drm/virtio: implement context init: advertise
 feature to userspace
Date: Wed, 25 Aug 2021 19:04:55 -0700
Message-Id: <20210826020455.1081-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
index 393897adbbaa..4e77a333005e 100644
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
2.33.0.259.gc128427fd7-goog

