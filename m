Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11907BE4F1A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD8810E314;
	Thu, 16 Oct 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yc/VmjZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136CC10E344
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso8408575e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637417; x=1761242217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1SpBeUqpFn3lQrpk1/03vxKE+csOcXH6zxgB4nY+oo=;
 b=Yc/VmjZkLeDWp6XBC5K9sNINaJN6p7EBgDnSoCuIL/O1+IxCZG3X0Ui1fR53/N8NM0
 egMcsQyEOyaTmFSpte3VqMDWXl8xfNq/8HmmBRQKDLF8acYcuYUiJ+JnIJvk+zi3LLba
 2HBV/DVmum25gPTwFVk646rJu+cySfVEdmh+NzWhKu/kB1R1ZUe8D2mUJ2b+SjrjpEBR
 55P17VJdQVGgu9Nt2KfE+LHPXmEmWf/CoXCNBzBpJHcTsxNEeE/kmGf8gv8CnT4mmc1O
 k8Xgpi7PLQeZ6Gr+9j8v/fplAfq0Opy2V0kHjlDVzaZs1UEIbiOKiwA9ab6Na3KCMcic
 xiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637417; x=1761242217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1SpBeUqpFn3lQrpk1/03vxKE+csOcXH6zxgB4nY+oo=;
 b=GE5MKTTbWi994VFBlDz/f97ucmT4udfeQlZ7CTyCaj9HP+E/0Ky6CqL+xlxd9oR+kv
 pGAkvAUKAqE5mq5akYZbw6+41QssZelh7QuWvO0BSOi2drAJKE7E2/6bdBUlxmv6nL41
 kkX+BVO/wbAl+WikEUJ1K+7rjgGbnZo5qPb1RLMUKCjT5ynWHbl/F+gRXqVW8R3Zeoyh
 TxkJsppZZQcpcpw6ibo/pwDpNbt9G6Z0//sAb8MDF9hj/0p4jh3/HLFgd1KIeylwpLQN
 uRnqL6yRAC6z/gdSMKVhwj7SWjF/OHt5F5I5eRbhAK519gxwpHlNMrDfz8951Hrluykm
 JuiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO5L2vgYMWO+9dfcQ0lRc98U3d/yf3UrodOYvF0u6wI90EaEDfTCqulpnbeUrX0V+z6lizxIshcgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLfKgpcSqgVvJa56Yd/m0ckim/SSP3Xat/+JcmQBN4gCylr37T
 YqvLCPksWkqpthhM5XFQlus694qajvuBniJ85DMlTYu4RH5nDQHZXY/S
X-Gm-Gg: ASbGncvK12ca+MneeMGvYNl5Ii4wgnGaITtb4BI0Uf6YfG+C4hETfMuqMFVG7HX5QNp
 Pkky9Dju8WELnHix9Uv7ChG17CdaWvbZ4I6W/NCpWBjc11lYaTlQ22NUsfyPz9+OqQZzvDCc9vp
 f43TC2lDYuS4YsbNc3SPhR3pegyaAWCQ4YtxM5C1cNxlKYsR8gsUSJCEfT1ptR7raEkUH3Ct1q6
 gB336TlxmMys5tsPIsVyMH+xsgdpoViho9Hir/bh+LtOCznLEG83jvuF13Vn4QCrb6VYZNKpwvp
 68nzZX9mP4B/2UYNOD0FRD6irxl2vjCN5I15w/1AUBczCPuPfCV+lZFXJ0lPRVc2wD+q/ku23di
 NSZSqx2OstD1FBZBkEr+b3sUBlN4fu4M4+0+PBU5MglBEgUBLfcijhCnZXb5wXsc/J9bDRSlFG7
 4=
X-Google-Smtp-Source: AGHT+IH8NCXDHXN/QY9FgnYZ+eb63qPdeppxf26DoLioBmlgRGZ+ohwvaUIyXkL2ywEOCG9q5RVZcg==
X-Received: by 2002:a05:600c:4e8e:b0:471:a98:99a6 with SMTP id
 5b1f17b1804b1-4711789b11emr6597505e9.11.1760637417449; 
 Thu, 16 Oct 2025 10:56:57 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 13/16] drm/vkms: Remove completed task from the TODO list
Date: Thu, 16 Oct 2025 19:56:15 +0200
Message-ID: <20251016175618.10051-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 31a3880ad83c..364b574a8cae 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -233,21 +233,14 @@ Runtime Configuration
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
2.51.0

