Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4CA7D756
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3BB10E3AD;
	Mon,  7 Apr 2025 08:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3/xBqoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFED110E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so26107225e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013688; x=1744618488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=k3/xBqoj+KdGjJS3/V/eBP+TOTSnVEmCgkJgaVgheBqAUSYu8bR06z0pAldVOTdjUQ
 8MxMFuwdTuECqxC1hBAa9/nr1HxtJYFHKII4ocrsUHgvZc3yX3Npu1m97t0rC/HQrv+A
 QV3e+kVGWVgQpkADWn1rXdjYO2aFvv/RLwOxXIZFS1gux53GUKAceL8DmgsRUZaFEZKL
 BXNPOrxzEKLu5NHCEhJpgiUa0/x8AkLqar6D7LwGJLPlq3ei3t+XtI58tNSEehWR7ud9
 ZY/NK5ByMkVWSxFgXYIoANw+fTpK5LAR2LvpzMdsZDSNsYO5d29hSHPfxuEUQlpMPZrP
 CtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013688; x=1744618488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=DWXAR+eYxlvm/iBZ+YAhuwlYQ2X5smp9FxvvkozU2um4jmfQFRcClvnQ6/M1a9U6im
 a7IllLY1xJK4FJcEdWdqo4qoEip+X5hi6tDApQcuSetXUlyC3H+cERq8QnJVUkuONkJk
 XDjN4F42QFbxqvqSl5mhVlVKz5Q1h/cM2KcvykTIPk+xquAiatkRL6z5NUnvYD72/aDt
 I6mtbOYQJhN5dM99Wczb+pMv5vQYYz+YHZrSNvHUI3Dspz9MbdQ+7N831BLuN1u1PnyD
 /fWcvBba1lDUoj33g/vnwb07JGjRZrZQsMu0LkK0FOFagNn1GskfwUXtnFjyoVCUDEO8
 38KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaZMveIkpHRWxxxZVBUcVNJEsQXGeil+PP5sI/ztWTdscb9U3uGqQEANieMOYpqyNhwZmYOgfZrlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvSlPzgU9ZwOy68hmmYg+LG6k959eppa61muZrGO1WAz55PGwF
 Ss48Y7RCwPcA6GAPtETLvjrLm3jpV95p5/gygQTiJwyfBv9LqeW8
X-Gm-Gg: ASbGncv+4D0aQIQDyMHT03x3DBsO7XMrAKXgykyymu/8920kqCRVs2hkdk9GCHz2nYW
 Xoo4UKQMc1v/qANEiuJarxfGEhzSDBtXiTeSrum4KmlddGUwN2BoOdcuLTP0CkMABiMSnU2eRAO
 uVI3wy/u4bc93UiJP93HBbP6yq+0meF6AM+2lBOtqWADL9Jab041Nn+sdPqcLUw1F8cLo+y1GMS
 5VX0pE0LJdZNbTkIoUqRgzTdjY0Tq8EMXZGn23RXQ+EpDWZw1OhyZRg8oeVV4+W9JGPpFz59or8
 I1WsZL6zY7MUJegWH5XQndlnFF5z6z8c84QV0mp00xjp
X-Google-Smtp-Source: AGHT+IGbgQ//mAxkxBQPqRYYwqdydsPUaU2Ht9FH9jq4jjH4ZQzh906R4fJI7RwkRpSwroXoZXzckA==
X-Received: by 2002:a5d:5f96:0:b0:390:f2f1:2a17 with SMTP id
 ffacd0b85a97d-39d1466229bmr10501615f8f.53.1744013688359; 
 Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 13/16] drm/vkms: Remove completed task from the TODO list
Date: Mon,  7 Apr 2025 10:14:22 +0200
Message-ID: <20250407081425.6420-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 74126d2e32e4..c551241fe873 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -222,21 +222,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.48.1

