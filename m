Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F129910A6D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BD110EAA8;
	Thu, 20 Jun 2024 15:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HSdnSUGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C249210EA74
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:41 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso996993e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898400; x=1719503200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RldGIEEllNIV4EGABqgzjNJrsTpOsfjwSHsp4z2iitA=;
 b=HSdnSUGQ19RFD/AAgBX7dnRGFS65VgSf/eUnSzubAHEP918ct9TxWE3sYx+HuDLz8+
 M7lVOIGn6QHQMSGaed14Zv55ItsdhHA0OYo1L/ctgQAzAEbcb8vWjlBZn3QaVO9KS2qw
 uB4TV33kYgkaRPpBOLKBVgHiY9Q3SPg1YX7oBRv9Jn9GzwY5FdWjIvTqy0J4GXDL7uXF
 t/nrTpohvWcIkbxn7MzqA4cjs7FVB7UHIQ9CA1szWGVF3LZDlje7N5ZxUIIVtASzolup
 BWrAI1asbZmHzCkZmLO6HaOP1/61qh2MeTBL39uddf2AC71rHKKcJbu/rsqcafv5mbdD
 /vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898400; x=1719503200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RldGIEEllNIV4EGABqgzjNJrsTpOsfjwSHsp4z2iitA=;
 b=oprW6nWw93QmhvqudEG7+FcaBYoIQIgh9jHK5s8/8csEdzNDzvNtf2EObAMyE+R+QB
 EWfZsorCk0Kmr2o24nUToLVtHLDSPxY/ziM9Uuhirh7HQyFxgbtKLJXywSLp/gO9u8Jx
 5a1sZSwcxGfNNaLR55ZmJ8DMrKUgxgDs46TGDABr5hjzxq1vT17zTv/CFLkgUFm7AFsN
 HjgJYDxsLNghE0IkbBRnQmdbFn1guai1G5uFDGJL8dGZsSmy8bJmjjTnvnZa24by4tyF
 tiu2mlJc4i5AehPgjp/keG3sgHPFRmwhVRY5xI/AgdPn6CTq+70ZbAuO75B41l6xSiNq
 yk3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVisHqEuwTNEsU90LHGSL+9gBBV1u91Ci7tQKs1ueo5wo/6UyCykGsYPCjDZy7zsav2Ho6NFCsYE3119v4dVfetow4v5eQ5w1dlXXjF/6Un
X-Gm-Message-State: AOJu0Ywt3Elj3BgTjq7iPvmJzvzi5K56tGafvbJLNw5XS5ZQakVZI9P+
 olwOawv5lJN1RSUDBe+w+SU6UHHkfjULUWpIqwWjS9Ste8WFaikRBMOMMxlNCHNTQ9AtIyyHc1d
 n5iYk2Y6ODeZjT9sWqY2SNdmjocQse8dO
X-Google-Smtp-Source: AGHT+IHYXUYg7OA3EtFnA4YVm/qoE9PDJyePGtBma07U/wanxzm91MZ4SBK3zJQ437ySMgrGOeoeAKlR6W1P
X-Received: by 2002:a05:6512:3d04:b0:52b:c262:99b3 with SMTP id
 2adb3069b0e04-52ccaa5693emr4284745e87.11.1718898399977; 
 Thu, 20 Jun 2024 08:46:39 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 2adb3069b0e04-52ca287bbadsm215053e87.129.2024.06.20.08.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:39 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 03/31] drm/vc4: Force trigger of dlist update on margins change
Date: Thu, 20 Jun 2024 16:46:04 +0100
Message-Id: <20240620154632.4125308-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

When the margins are changed, the dlist needs to be regenerated
with the changed updated dest regions for each of the planes.

Setting the zpos_changed flag is sufficient to trigger that
without doing a full modeset, therefore set it should the
margins be changed.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 15 +++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.h  |  7 +------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8b5a7e5eb146..1d54176cf811 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -735,10 +735,17 @@ int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 		if (conn_state->crtc != crtc)
 			continue;
 
-		vc4_state->margins.left = conn_state->tv.margins.left;
-		vc4_state->margins.right = conn_state->tv.margins.right;
-		vc4_state->margins.top = conn_state->tv.margins.top;
-		vc4_state->margins.bottom = conn_state->tv.margins.bottom;
+		if (memcmp(&vc4_state->margins, &conn_state->tv.margins,
+			   sizeof(vc4_state->margins))) {
+			memcpy(&vc4_state->margins, &conn_state->tv.margins,
+			       sizeof(vc4_state->margins));
+
+			/*
+			 * Need to force the dlist entries for all planes to be
+			 * updated so that the dest rectangles are changed.
+			 */
+			crtc_state->zpos_changed = true;
+		}
 		break;
 	}
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 697e9b7c9d0e..717fd1140561 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -598,12 +598,7 @@ struct vc4_crtc_state {
 	bool txp_armed;
 	unsigned int assigned_channel;
 
-	struct {
-		unsigned int left;
-		unsigned int right;
-		unsigned int top;
-		unsigned int bottom;
-	} margins;
+	struct drm_connector_tv_margins margins;
 
 	unsigned long hvs_load;
 
-- 
2.34.1

