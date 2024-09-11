Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B2974DBB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4156010E816;
	Wed, 11 Sep 2024 08:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiA0shh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CE610E805
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374c4d4f219so1002899f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045148; x=1726649948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0nxDSJHgcFS4awVmv73WpN+3ip7x93J9XXXe+0MIgDk=;
 b=aiA0shh2xQarBnXRnKcRQQoBH2Y3fzRqKbXtB6RQfunZ/JZYA0/I9Y2xABbIWdMejW
 h5qCv+w60sipSl9tZz5yiHrmn797seN5/o+XFIG8/HCFHhdzgwJ7Arz9EvnZUc7vmw/0
 oIBVBKB11y+5hRMlhXRwa4oUh7/eOi80FpLOh6roTBLxKZDVtNwt6+lCbG/mflhM+yxI
 3Ylw1zu2DU97MH5D1qYgCjV8Rv7Tc1sVNR7Dob/3qcKA3k7va56BIgeVT+zFYYdR3680
 MXwL4djmo7WSeeSEKJXJjk8jDUqmK7VpFFlFu82qQAOX7mkchCMMce9yfyOOd3GSD9lq
 o70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045148; x=1726649948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nxDSJHgcFS4awVmv73WpN+3ip7x93J9XXXe+0MIgDk=;
 b=rmzkkqdogO0ycRhgKw6Ja91J8ll4CsXJM4lne1epFIA78z0SZTLNpylMyGhIB2wAtK
 mGX+xIsvqY5sJ3/SvATvelepSIBPvUYngB+2NX6RwIEOzIMBAHYoDZPQHcfqpBOVrXN8
 mpLVqNrN54XMFtgmq+n4Axz+tIgROxUB1WrIH68QlGli2BcRC5ZwcOXRrSqe7m3WED2w
 cMJBVR5UKDjqU13+LE8C9v1u7LPzk5+ct3zOoVzyTD6c1WMCSs6iYfvHuTQ3DFbMXPdw
 FnG35+gybIOWKdqwD2wPHkqeF2Jhsb4P5Cy1zoeLOjSJiYEFPHLZMhhtmThM5GhHJR8b
 o4OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOl/Qr2fQg2UAAUn12C6uekDZoqM5+ecwRoZ1fJsEKDsvGuHLhK3q44txsMOevYiJJwZrEvowmiRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhqujnkASZkr8b1l1nUsw14p5Do02dxBoa1/t2LeW5lbjQY8rf
 7QAUr6OxU6mJ7cQP4JoUgIeTuTvH//g8nsLsU5n05tWSg+Hjqi9SphzMEwmnsKA=
X-Google-Smtp-Source: AGHT+IHi2IVJUNcKC1VrWNkypoVJ9xEvhG5hBL2B3SuUsPqZjSku4HzAYx0s3mOsXNHXIlAOsdmsGg==
X-Received: by 2002:adf:a3d5:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-378b07966fdmr1392242f8f.4.1726045148202; 
 Wed, 11 Sep 2024 01:59:08 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/writeback: remove pointless enable_signaling
 implementation
Date: Wed, 11 Sep 2024 10:58:59 +0200
Message-Id: <20240911085903.1496-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Just returning true here is a no-op, remove the optional callback.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_writeback.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a031c335bdb9..33a3c98a962d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -100,15 +100,9 @@ drm_writeback_fence_get_timeline_name(struct dma_fence *fence)
 	return wb_connector->timeline_name;
 }
 
-static bool drm_writeback_fence_enable_signaling(struct dma_fence *fence)
-{
-	return true;
-}
-
 static const struct dma_fence_ops drm_writeback_fence_ops = {
 	.get_driver_name = drm_writeback_fence_get_driver_name,
 	.get_timeline_name = drm_writeback_fence_get_timeline_name,
-	.enable_signaling = drm_writeback_fence_enable_signaling,
 };
 
 static int create_writeback_properties(struct drm_device *dev)
-- 
2.34.1

