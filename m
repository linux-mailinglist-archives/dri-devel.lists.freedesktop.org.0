Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9CE8FAFA5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 12:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7D10E3B7;
	Tue,  4 Jun 2024 10:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="0/K9RtZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9110E3B7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 10:13:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4214fe0067fso3860115e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717496028; x=1718100828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hkz0DVSHPM581bQdM1mhT6UQMZ8po+xcZl4Qk7/o78g=;
 b=0/K9RtZ8YxxJBDyd7EAeH+/8R2GUApxyMDhRiFRa0UP8BK/3ejHSwSXmUgUKRkzfFr
 t7+US1u7AQBMDL/qTwSFlC5nKH8LeAD0tgFLp7KFEQRmlkm6KerxvrD7TWGEtscHc7nm
 4wUBpxtzaGMClLGC4HAByC17e5aUaoVENSvHHAOQu0ppQbjr258PBZGmSrzeorZUArjA
 GFztTPLS2gQFqS3mEEarYGAuwdKB2yqKI1/16cPaxM4R+MPbnhe0HvPUMoiRge/V5LtN
 tZeYfGNylgCcXSYiq61ICqaAmcgc1jncIq6IDb+s6xnexhKx/Gn6GmIiVuojPcQDoduU
 pqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717496028; x=1718100828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hkz0DVSHPM581bQdM1mhT6UQMZ8po+xcZl4Qk7/o78g=;
 b=OcKAnBG7k+b0uwB63O1HPFTAStw9pEkswUO3m8q3RfodRSPrOinZVz/RUia35LszBH
 lOTutkK/KdKReGmCvlJeZVuXaUfGX5tXlahxf97KNRtktZiwWgBXtVOsNFohhkgiox4j
 gwllV2Ja8MLH7sUCzbxV7RsPh/2AElhYbs9O9i5Z2b+sgzFBnhnlRffrxTbPgcnqbLGK
 bDaYOIkb80mQLnTuNVDdfd9l+A2t/Csqa6J4e5CUDuyHuYNK4xPNz/wiJBdMt+Q+3A46
 xc2QQHdRxfCI0l0eIVcvMYv36irKvs2JxnnkfFwfgTM5qU1LQ6gIRfd104lpc+QroG7t
 e0Gg==
X-Gm-Message-State: AOJu0Yw+4X2bovZxYZa0QRk8nsOpRies6f9SRrVORiUaKGVKMi85Fg2k
 HLpUqz4LJD346jUfcVpTYXBf5Am3WzxEZSTqIlSGN/JtW/+nwf5454C3lnMgQOQ=
X-Google-Smtp-Source: AGHT+IGmr+mjlkB3IrxJZa093GkDQIwpDi38jRs3h2XnRLSE/PGxwx506ujykI/IZmoBxQJSs/mNrA==
X-Received: by 2002:a05:600c:424b:b0:421:29d7:f87 with SMTP id
 5b1f17b1804b1-4212e09ba44mr90528305e9.27.1717496028497; 
 Tue, 04 Jun 2024 03:13:48 -0700 (PDT)
Received: from debian.fritz.box. (aftr-82-135-80-160.dynamic.mnet-online.de.
 [82.135.80.160]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4214fdf4953sm12261565e9.25.2024.06.04.03.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 03:13:48 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] drm: Combine identical if/elif code blocks
Date: Tue,  4 Jun 2024 12:13:07 +0200
Message-Id: <20240604101306.2919-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
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

Merge the identical if/elif code blocks and remove the following two
warnings reported by make includecheck:

	asm/ioctl.h is included more than once
	linux/types.h is included more than once

Reverts commit 00c9672606f7 ("drm: Untangle __KERNEL__ guards") because
make headers_install seems to be able to handle this now.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 include/uapi/drm/drm.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..315af7b19c97 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -35,13 +35,7 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
-#if defined(__KERNEL__)
-
-#include <linux/types.h>
-#include <asm/ioctl.h>
-typedef unsigned int drm_handle_t;
-
-#elif defined(__linux__)
+#if defined(__KERNEL__) || defined(__linux__)
 
 #include <linux/types.h>
 #include <asm/ioctl.h>
-- 
2.39.2

