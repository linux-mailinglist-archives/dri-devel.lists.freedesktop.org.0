Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EFF90F25B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAFD10ED0A;
	Wed, 19 Jun 2024 15:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nSF0YXyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4C10ED06
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:39:30 +0000 (UTC)
Received: by mail-wr1-f99.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so1755736f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718811569; x=1719416369;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWkoJki2cXcy7XDkP36Wf4I7iYxzIC9B2wsE/hfXDzE=;
 b=nSF0YXytpv3NsskpbE7zkWOXZmduAQPkw4pSw0KGarBSGalNqMlqwsQs4AWsWURbaa
 Jz5q5YQZ88LAiK05oY8QSZnTNmoT7X/byoqAruZfRyuj9L0Mx5gEvif870ikTpOB2oQD
 +mokQlAvwCUMhE+Hq673tWkOaQtYDY+wnzxPr42hj+Z5QGa7eyqs+V6L0x0iC7PDc7+l
 FiLgReSFnNySkQL28WRGZDyROj+gJzaPNZ+PhXndAC64A1wres3mSuGdHNFaZgNTmDwE
 bLDnb4SohDF0BociYluW64pcZT3mrntcqnCVlutkkElBWzJ4cqqS/YatlXH+yyr75Rcs
 07jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718811569; x=1719416369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DWkoJki2cXcy7XDkP36Wf4I7iYxzIC9B2wsE/hfXDzE=;
 b=RbMUoiGsXnoaQfp0Z9qnP12/G0VQneOqySiatUOVDoCaM6gfSeZXY1JLgFHYXuXKi7
 NnDTCuOgSSz4gRFkjf+pd1M7lQxHckwHUPfyzRweAMPkRs5oNJFEWcSxuAxNNnI3PcY1
 7MZXIvXCQdXvFysYgdC/VhzIBlkFWAu1IZv9R7QPHlANiygOaG64DLEAH8/WFZn/ky0n
 ecFkrrwtUwkjr/iAZnVbLfehlzNAgbLD1pwBarcQTsb0JbZfUIeA5TlqDS6S4sbFjLe4
 MePpyuuZCnwvQeAwsFOpkM+SZ5aJdeg9bdFT0iTJon2UtdqtJltnquklFJqSicAOSIer
 LZ/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+7yQk2yfWoIDAfux1RV8qNF32lLI58vDNsk8Hhi+nlKY1/8DDvRar00idS9H4w03HzbPOMeMJGUJcQvrPBtEXER+7ORYmouq/8dTHMKFW
X-Gm-Message-State: AOJu0Yx02re12qwekh3FvBwawRU9ZLjEMBPHishNs3G45hr6L8A934+j
 AKcGfL3XDzuZnJXAtRRpNogtIbsAAOXOxOLnkTwsr+yEeQDjjWiagfEnZ3yvyOBUutLJbhRMkIe
 wfAGZypXwJqEET78L6y8eYvuLMQ0stayp
X-Google-Smtp-Source: AGHT+IF1tL0aR3u5EdxSXifgZxfguC8wd5gNnahHZoDjEzHGb5C46+Y/WraEjnxJoRORk07xHTcddbhMcVkQ
X-Received: by 2002:adf:f144:0:b0:360:8911:a7b2 with SMTP id
 ffacd0b85a97d-363192d063cmr2512396f8f.55.1718811569289; 
 Wed, 19 Jun 2024 08:39:29 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-36075123771sm649155f8f.80.2024.06.19.08.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:39:29 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 3/3] drm/vc4: vec: Add the margin properties to the
 connector
Date: Wed, 19 Jun 2024 16:39:13 +0100
Message-Id: <20240619153913.2804051-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
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

All the handling for the properties was present, but they
were never attached to the connector to allow userspace
to change them.

Add them to the connector.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 5fdde6f28d86..070813b8aff8 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -529,6 +529,8 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 
 	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
 
+	drm_connector_attach_tv_margin_properties(connector);
+
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
 	return 0;
-- 
2.34.1

