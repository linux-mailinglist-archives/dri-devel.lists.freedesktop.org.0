Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D8896583
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5581125AB;
	Wed,  3 Apr 2024 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFWrgD4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4910E827
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 01:43:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-1e0fa980d55so47412505ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 18:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712108590; x=1712713390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ANtgOYO9WAyBBZOSz5s/CDBqqhmVXwUbrAduDgkrLo=;
 b=fFWrgD4SsUYOz9z+ztCDGWbY36zEXdQ2XfnqBxKih97lEN1spG7Uss5ztVz+AakY90
 DY+/IqDSMfqk4AXBvisPmsFR0c62PkzSHbmoC+BWfnZeOYR3g0yWVt5EZLhhSGyp5LyE
 x5yBMyziU7axSFhThO7RRmwDGL/pa5EhH30HNpMh8/UQFOYqq7EuqBavd/V8UqbMOSfb
 IvXRqRQB/2DhT5nA5wtjfExEAUoElYCM8fgEyJcDqSv9PbwXKBQ8cIjNKJalNjMmoOU+
 KNJrRE/twMmJ5eFEz7BVhNeJcS6dbzIW+3wapkyJiDTOn2sSbBenK0YL+ZyI5dALEB9l
 pZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712108590; x=1712713390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ANtgOYO9WAyBBZOSz5s/CDBqqhmVXwUbrAduDgkrLo=;
 b=TFdM/BXRGjpTB3wASWPtva+83hZibdHhyV94k1CDl2T9fRdwVWrQA/wXXjLy/f9u4M
 QRchdd6EK4QzbAEVT4f0EEKm4GL9Tm39jZdXkLAGmlmmunx5lEYHfXR1fK9k0QkSWolP
 PwQzZXhcevGxn4M44/+C2a+Y24eDyY3AsArOFW021a7q8UDlT9PRRAIxIYYop/bhzyS+
 qSIwjZFq3Xqqf6QEAa0iXtwvIjZTqlhuTlFCsW/EsVAXizGoE1LtcKTE7vRF/YBk/7zu
 cM4pdhiYPf+2pnhDSAgrXswO5w9CFj0ZhRBH58QB+qf2GhGaQN3fg+0nbMTdeS0gWwbG
 nfNA==
X-Gm-Message-State: AOJu0Yywu4HnESzRiCWVxEBFRqiMN1lWYx7WbRectx0AwafgNvpaPYA8
 dpu9exgCTWFLE/ZTjfj+uXP6A1Mu3/RIvey+24fcQ/wHO4EZDVTL
X-Google-Smtp-Source: AGHT+IEjHW5rJt9AjAJeQQL1pwOLtFoW7nhT0e4O9cBD7XnMBR0LatCqNrz3lBIZ8UAAvq6da797wA==
X-Received: by 2002:a17:902:f547:b0:1e1:5502:18cf with SMTP id
 h7-20020a170902f54700b001e1550218cfmr1464299plf.69.1712108589903; 
 Tue, 02 Apr 2024 18:43:09 -0700 (PDT)
Received: from lhy-a01-ubuntu22.. ([106.39.42.164])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001dc391cc28fsm11845534plh.121.2024.04.02.18.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 18:43:09 -0700 (PDT)
From: Huai-Yuan Liu <qq810974084@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@outlook.com, Huai-Yuan Liu <qq810974084@gmail.com>
Subject: [PATCH] drm/arm/malidp: fix a possible null pointer dereference
Date: Wed,  3 Apr 2024 09:43:01 +0800
Message-Id: <20240403014301.969988-1-qq810974084@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Apr 2024 07:10:39 +0000
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

In malidp_mw_connector_reset, new memory is allocated with kzalloc, but 
no check is performed. In order to prevent null pointer dereferencing, 
ensure that mw_state is checked before calling 
__drm_atomic_helper_connector_reset.

Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 626709bec6f5..25623ef9be80 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -72,7 +72,9 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
 		__drm_atomic_helper_connector_destroy_state(connector->state);
 
 	kfree(connector->state);
-	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
+
+	if (mw_state)
+		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
 }
 
 static enum drm_connector_status
-- 
2.34.1

