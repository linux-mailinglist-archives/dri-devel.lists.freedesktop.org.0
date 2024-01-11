Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CF82B53C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 20:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9E10E940;
	Thu, 11 Jan 2024 19:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CC210E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 16:57:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e5f746ac4so10142225e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704992229; x=1705597029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=slvuo9xUKDbs7pSIb1UU2ii5OzIe8P876xmBYHBwTwE=;
 b=RmGwU3FwHlyTC6y4MVLoF5eut3jRY7V0vdsdjBs/pmuEcITZhllB+5mx93MeAl960J
 r8Z3YeiD6BSa1pfXxJoBDJrgX2+idKVSDifsvjzYVCkLiWS7jYfO9Qzzsp1lnxaBRf/K
 ei0T8YmhhQhCLN/+a91M9Sxdx+V2FCfcXlPyNp902IXfXWN8YJ27HL0aB4Gygzr/e7a+
 iHg5rr637yy7XesN59Jado0dnv9iHP5zio+93fihYzn/JfKigEOYFivuMp/9tMm4KT5c
 fHIyc5DP22Aa+sbDnCm4os/1B3RMXNMZnDNd8as9+Rc+lJeP7ETw8TCdv+5hJAUAGCw5
 LN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704992229; x=1705597029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=slvuo9xUKDbs7pSIb1UU2ii5OzIe8P876xmBYHBwTwE=;
 b=nmPydNkMQJ2kKG5izRfx1L5ltJMbJ3Gg7Y/XmYsg9YRDj4ZE5s5DpYSK11JKGidFFV
 tg/YjyX78zCO7ccm4r9HbRrfvu0b+JyjSGgfYbUdaFItPxWTx8mXhFfsLzus1pLRI3od
 v7fd+hydyzpc47O+ab1iER1LZGXDYos1fT2fC4jaMEhcZn05RgMEYb+vNS0joxZ32jhd
 K1ZGzIwEDo+UJVQO25PqenUtM8fWLSF+kg3quje6Ov9VCqDSdRMwGAxS37f90Libcc7c
 hG/B3oQVag4rp9iTw79YKxFxV/5phhaMKeMLq3uEAaYoz90s8ODEbJ9m3dtTAf54UFuU
 U7oQ==
X-Gm-Message-State: AOJu0YzAt7zhHV9h7xCs5SdOfmF70jzrikt9XXcrHYUDuU8o0yOn3MLc
 hXRcxWWvvxLFncV3QAXnqIMix5viRQH+nQ==
X-Google-Smtp-Source: AGHT+IEjf3EoGbB8Lrkfk1lPmFVzJVTFS966cBM2QmQqUcP07RnYn+UH/BKUt8kQwUvYq/TDjz1nSw==
X-Received: by 2002:a05:600c:600e:b0:40d:859e:595a with SMTP id
 az14-20020a05600c600e00b0040d859e595amr86129wmb.0.1704992228883; 
 Thu, 11 Jan 2024 08:57:08 -0800 (PST)
Received: from Xavers-PC.fritz.box ([2a04:7d84:aac0:62f0:7df6:3016:6783:621d])
 by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c502600b0040e6245579csm1463706wmr.11.2024.01.11.08.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 08:57:08 -0800 (PST)
From: Xaver Hugl <xaver.hugl@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed with
 async commits
Date: Thu, 11 Jan 2024 17:56:15 +0100
Message-ID: <20240111165615.27587-1-xaver.hugl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Jan 2024 19:35:12 +0000
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
Cc: andrealmeid@igalia.com, Xaver Hugl <xaver.hugl@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like with FB_ID, the driver never has to do bandwidth validation to use
these properties, so there's no reason not to allow them.

Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index aee4a65d4959..06d476f5a746 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1108,7 +1108,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip && prop != config->prop_fb_id) {
+		if (async_flip && prop != config->prop_fb_id &&
+			prop != config->prop_in_fence_fd &&
+			prop != config->prop_fb_damage_clips) {
 			ret = drm_atomic_plane_get_property(plane, plane_state,
 							    prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-- 
2.43.0

