Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D394042C9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6583C6E409;
	Thu,  9 Sep 2021 01:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B646E420
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:31 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w8so178418pgf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEMJrKTftd2n2chbhqWjRiegEDDV0BWSsaeQnGT7bdA=;
 b=SXlWYhQcIrBFHg9GCruKc9powvvLNfDdISfiMMwVqoBvVcB0SyrQdpJI+ftZcFlhdp
 RLkXfFgFycqDhYJk6D7fPaU/dZPWVcFNtyaP+V6NJin3bF5jR5iRfbbZbULVeCzJXW5P
 L/qkd9dS20tTwguljma2n711fwfFtJsEgJBvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEMJrKTftd2n2chbhqWjRiegEDDV0BWSsaeQnGT7bdA=;
 b=Mu8UU+/p/ciAjpCezVs6Kcix9pTF/t99E3vHGfcyj8N9shCSYlJnVJSYfdLLLjms+F
 q198y4iaBy+zV8/MGOhYKNSzd/6EdpuVjb2fJR+ZDs1zVEwXwAQtiog93aIKc12LN2yB
 M31SB1wLuYTSR2K9QOSqVVFseSoUDbJbGYcJRYHg1L7QSuKbvc+u+2Eo8vO50q4cDaMS
 uAamlVzCby6TBWyInM42ROmPBfYSHmKJujapatSGYigo/bIv1qpnpeKj3MgUuiGMqRIX
 I0J7858/fsPlYjqCwYvOJpeYlEOp9cnUOx/CE3v5E7BsXpQGnG5qFuDF5NW6jwu0fYFK
 6QlQ==
X-Gm-Message-State: AOAM5310UEYBd5Ha/uFgiJWLIaQ9hPIrOC11PuLBxuJgwWd8m1IphVOy
 kEflbgKEXFx3VuhcSPeB2UttznaxQCO9W9Ez
X-Google-Smtp-Source: ABdhPJxqmMreuQV5gJTXchcxH0YQ0vUytZpOEhZUoA7dgNPtGvVAOBI8f/TjrYuRcXa7wcTszGrW1Q==
X-Received: by 2002:a63:cf41:: with SMTP id b1mr317682pgj.407.1631151451140;
 Wed, 08 Sep 2021 18:37:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 12/12] drm/virtio: implement context init: advertise
 feature to userspace
Date: Wed,  8 Sep 2021 18:37:17 -0700
Message-Id: <20210909013717.861-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
2.33.0.153.gba50c8fa24-goog

