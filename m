Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686E9398E8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 06:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E610E3F3;
	Tue, 23 Jul 2024 04:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CvA0vIu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B47F10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 04:35:54 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e0874f138aeso2270012276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 21:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721709353; x=1722314153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wW+oGFZypdetqOd/jqxue+lJMMjuDPOU44J40e+rgeI=;
 b=CvA0vIu4bWXjdQeRu1jtsTg7TR0KnNKh5QMab0HMTKexJGCE2gWQrm9ZBbvoknXLPU
 hBrY/wsdXjujZ3C5oswdjfaU0juyf+jTcHe3NVwg3GTP0JMsBJJHgn+pRW432Tle/wDZ
 tugazi1+k9D9VEmQnZRwrHuTGNg6zaegiQXoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721709353; x=1722314153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wW+oGFZypdetqOd/jqxue+lJMMjuDPOU44J40e+rgeI=;
 b=ghzYcNRL1jT1ukU+UTkbFd+6EpT3I3eY0mMUOe60GZJ54i2jwmrH9LJi+H5f/j97f0
 yK6Ud5Z/J8WG09EAs/yXeVUw4qxF3x4lsPe3XpuXxupNhQ9Heo0Wgt1MVJ9LOyfhotxA
 EP6Z8zf6p4GUAmYOQcy/6FRVULxDqw/IdL6YQrr///nSEzyH0y0XR7E4JvB8XwlkgDb4
 /CUtIp0Xxoqfd/AaQJ/siSH+M6Noq/cPJ0jeUP+JGGExoInkB28cw9IsAx3SNgzbwEeI
 chEErkJuwdeaYYF8ijd4uqBeN0FQa3VtIsq9U4UD1SMZMy3Hu+LG3ERnrRYVmZJC03GZ
 IIxQ==
X-Gm-Message-State: AOJu0Ywj1SL9k/Ut6D14FM7P2eDW7YBxEpYoNMFr7esfomj9VFOJN6R0
 ps33S3StLnMCeSfNhqVjPB2EkenvvVkIhLvZ/0A4b7l9ykm6m4wtklpMLm9XhzdFIEUY1nbgFku
 jx7BogUCDTHRIt3OUeS646+fcUs9V5rd0qZsbwLyCtQYFPRcQl8au1cpjKMsGhbj9lErGhmRcsH
 amefumfCv2bL3sLepacn+lxgOaUe3Mz0aIUhvC9GOMXqNTigJ8BA==
X-Google-Smtp-Source: AGHT+IFxwZESi6X2+7vexGnnp+aYxEtRMQhlbAeoDHW0Of2X1zvAA4klVK6sijfEV/dlphjkzkYTCw==
X-Received: by 2002:a05:6902:20c8:b0:e03:619f:6826 with SMTP id
 3f1490d57ef6-e08b57e90b0mr1965465276.34.1721709352732; 
 Mon, 22 Jul 2024 21:35:52 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b96a7bb6dcsm23971196d6.90.2024.07.22.21.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 21:35:52 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Bump the minor version of the driver
Date: Tue, 23 Jul 2024 00:35:43 -0400
Message-ID: <20240723043543.536675-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

Provide a way to query for the fixed support for dumb buffers with kms.

Lets mesa svga return a buffer id, instead of a surface id from
resource_to_handle which fixes a lot of userspace apps that assume
that those handles are gem buffers.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8de973549b5e..ced881fdca4a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -57,9 +57,9 @@
 
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
-#define VMWGFX_DRIVER_DATE "20211206"
+#define VMWGFX_DRIVER_DATE "20240722"
 #define VMWGFX_DRIVER_MAJOR 2
-#define VMWGFX_DRIVER_MINOR 20
+#define VMWGFX_DRIVER_MINOR 21
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_MAX_DISPLAYS 16
-- 
2.43.0

