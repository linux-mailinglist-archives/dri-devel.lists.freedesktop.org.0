Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87681D5FD
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 19:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0610E185;
	Sat, 23 Dec 2023 18:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E377B10E185
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 18:33:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-550dd0e3304so3394507a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 10:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703356406; x=1703961206;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ruRMkuxTLRfeG6Csq4ElIsO4M1/KCLiyHuWeJfvDVGs=;
 b=ZxjoSiN3/Tm7jKoQXB1ZDCpEeBdZVtrAP0YVbyrky/4SWYveDpWKC334LHX7eplyyE
 I+VReBQ9Y+Tisqi9XRvAy6w1Xzecz2WxZ9GvhNmfYvtg6D24+YrudY+IgwIxCQpgOq9n
 ZmjWitndeYVsmj6jJPGiFzuv/TpO+TYN9fOT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703356406; x=1703961206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruRMkuxTLRfeG6Csq4ElIsO4M1/KCLiyHuWeJfvDVGs=;
 b=PyPzhm8JwvbUxoBTPhfleVCp5mNEPNU4stJereF+FG6hRvyb5WsTKHa+yBTjHWy36U
 s6cZB2axn1UF7h8n77jLgMDaSoUL+oAzcF32Q20wfth1h3KeX9Pcz7QyqK1gHIdeKdKh
 SMGfpaoWLxAUj6T1JGcAcr5FEnpM9yF9B/zbD4D2jn2sQzJOCcl4yQtb6k4kCLu7+VDI
 UpqGf+O3kwuGYmewMQwDqizsW7Pv9RVPwOroDhGTxf4ohmr1PHuHRLHZ6AlvQYE7K5K8
 L/5GpQr6uEfeKvkpWPzS+DeZTe8a7M2v1XgdvNvqdFJqgx8DB922LvlVegBS0BT7XUKO
 Z6Fw==
X-Gm-Message-State: AOJu0YxuBYkoseMtZLiTFda4qIV+j3Y9sHlz35qmvwbuvsucVC8n3VWo
 +9pOppba1UIvoMzfwkHIecBwP2DDvmR6SQ==
X-Google-Smtp-Source: AGHT+IFObCoZObJ9xG7YLuA6LJhDM4BoJEQE/rko43dkA/DzcHeY/t9X5gJmWy9epmDUOKgTOv4XsA==
X-Received: by 2002:a17:906:10b:b0:a26:b173:ff92 with SMTP id
 11-20020a170906010b00b00a26b173ff92mr1409440eje.65.1703356406378; 
 Sat, 23 Dec 2023 10:33:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-50-102-81.retail.telecomitalia.it. [79.50.102.81])
 by smtp.gmail.com with ESMTPSA id
 kb6-20020a170907924600b00a26b024070asm2290910ejb.50.2023.12.23.10.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 10:33:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/debugfs: drop unneeded DEBUG_FS guard
Date: Sat, 23 Dec 2023 19:32:48 +0100
Message-ID: <20231223183301.78332-1-dario.binacchi@amarulasolutions.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Makefile enables/disables the file compilation depending on
CONFIG_DEBUG_FS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

---

Changes in v2:
- Add 'Reviewed-by' tag of Jani Nikula

 drivers/gpu/drm/drm_debugfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f291fb4b359f..f80d9cf3e71a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -45,8 +45,6 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
-#if defined(CONFIG_DEBUG_FS)
-
 /***************************************************
  * Initialization, etc.
  **************************************************/
@@ -588,5 +586,3 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	debugfs_remove_recursive(crtc->debugfs_entry);
 	crtc->debugfs_entry = NULL;
 }
-
-#endif /* CONFIG_DEBUG_FS */
-- 
2.43.0

