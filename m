Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48984A44947
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8A10E77A;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzO5zpZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1283010E77A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so56429155e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506395; x=1741111195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=JzO5zpZtL6FqlISwqYvnjPCtwTzs8y0W6yuU+W6RsNtgE75bUlQVrFMgixXWPdkwHZ
 vjWp1pz0PWBZIXPsJtuks1/kgggaEx3sGloJopHCE9MjOgoHbwyEkymsp0ivZpWQRp+K
 xBBKgxylhNivRjDpNwTlTLMFCUM3RxzJfOl7hCRef1/y0WTnVcNSgiGRirf8tAdTQ1gT
 Yg0m7Cfv47rCyV9o4liVt7DeaT7o8pR6xCKJUScTZz4lkPIBx/xFPI7bZbDlZXJyyFra
 XDTBHtUedB5A6bmm73Qg7DbILR9bbhlx52nsZuD1huZk5X6qQwdlghX0NmPWqZZTpQJ6
 I/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506395; x=1741111195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
 b=vlraXZCBBUQyTG85QEFH0ME/VAKmvqVPNeQpLitK2P487O68CZuQvGBCx8PBLWn/7+
 jA8YSC2ZrHbpvY4inFWzpoCpgWw7ljKdG/N8OMGoNZxUmrJCiimtpuHLW/uza7+SvGph
 E35Vg9FjqcADuR8RZVq6dCmrEpyXHQPqv1Y1Es3xc4J5YlVPiYAO5RP3HTyOl+gx1cZa
 LccOWK1VFj0CTVpTi6epSOii71qpCUKgasqgP70AeHLUBBz6Wh+Zmsi6JbVujFgAgFo4
 0We5QTkVVPag6wHWNN4YJ7C9tq1Ygm0Yc7f6B2gB8Eik9FTqalWekfoI6dbfHUqfDAu5
 XftQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX2F1SfSAnvds+GqcYqcHyaL/ob0pXKhByhH34MsAQVtSPW7R6hAA5d3Yg7JOIxSRw6oSj5I19IlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyioiOpT8LwTjDLPEgcslOv8PjnlofOCOiWXIu3LpAvp5nA9CfT
 xqFk+Nbqzt+xJ4+Ub1a4+RpONKSYhQm8UwAsUvnb3atqmG/Kl93F
X-Gm-Gg: ASbGncuj8t/bKcFEv1l82ESlFlLzj5XBckjh2lSA4RS4K4sYTUKPfoGNYpRDfp3QTKx
 IDTvItS/6Z4I5GggcGA0fCSNUEy0j6nZ8C9iObQrE2Eh+e8HoTAus1X/YVDsLqts1OLorekv72D
 PcS3VnPHb0B2IYLt4j+yxqAtI2jFcfuigvOwXWftD+7/SjxwUgBX1eUjUUogjKUk5D7eA12BWlt
 fcZBiRrPPHbL0W7U96s44vsC49dwJJsgwhJ7/Fj3HSdUiEM4KT4QROtlM7z5mHzw8YxhsX3/6Ai
 XUYOzHd4FqnWI2Cefj1j4skKxsxR
X-Google-Smtp-Source: AGHT+IFXeUWeTF6dXkp/wlfC8bPpRknIuSG+G1DBxyLoGn/dLvboeFM7RCjs+ZLYjnsXSSYydGev3g==
X-Received: by 2002:a5d:6dae:0:b0:38f:2481:a6a3 with SMTP id
 ffacd0b85a97d-38f7079a3a9mr16896866f8f.18.1740506395455; 
 Tue, 25 Feb 2025 09:59:55 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:55 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 13/16] drm/vkms: Remove completed task from the TODO list
Date: Tue, 25 Feb 2025 18:59:33 +0100
Message-ID: <20250225175936.7223-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
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

