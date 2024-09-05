Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EC96D833
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD210E877;
	Thu,  5 Sep 2024 12:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UJYSgSCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA710E877
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:20:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so5527145e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725538829; x=1726143629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6vVoqhFptCkQXt3i+ZEJEpUKCxugyOE9bwve1vN+BA=;
 b=UJYSgSCITlzhmDfexOepIE1LBgdyWMb0zrXi0Ue+MVklG7deMWTnKYp0lOR8nwVthk
 IXy6XCxYT2xA2sZkDW2vA/cPbXLXArVzk/lIP8K+RYgf+QadD7we6J4hnRobV9NWJw9o
 CN0WkaRqPnoveOFzDwEb8lEIlXAxdnfjo5eDLKrQA3SxiwNQgbnmxvD5O56Sl+Gx8Hog
 AsB9GwCbr8cCuLCgFZSpBoKt63mnz6TGzr1jdmxkSWGckHVRLdVmXwSX1cD30LNx6OYw
 INt6N2+qaHpS+wbalRDf5cirz7y6Yq89n/ucR0yH08hgzSTzprNCQ48G0p0aw+Jdm4Ar
 iSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725538829; x=1726143629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6vVoqhFptCkQXt3i+ZEJEpUKCxugyOE9bwve1vN+BA=;
 b=duaAXGwHaSSqzyDroDSwX+lKLRvZfmA69GS+SVtkIkCuEqEA9C6QwhbM0kFEyXh7ep
 13o9GLZz2S27GYc7BTCzwV5JeD5xVDTuN2f59tABx7W/YL8MM1LB05v9mw3fBAXdUN5f
 zqvS/ZRkd0B1ahNEbytpzrWixsuTBg/YZVA/UaFHIXqvMfa7QzZLVkl0DWX4K2EFRnwj
 IqYenIlt0emRwBNqZQbqVNXW9bbIEgg6SWS2R7EiyMf3QcngjOEGYyp6eOhuEEKAedeN
 DdeqQy3pKK6qSaWj+AufoEMusri4Jvo/cekiSk9eT3lmmnKw1cwmvF9p7JhipjLlOXb3
 FnJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKCkTGtwgcXrZBNMBsu9kNI0EgoawcUgh7ZLM+FhvgOQRx1XBTJrhCkAPiqqh9cIJMNic2cgRBLiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP7E88H6ClV1aVuu1Rk6/UX8Fnbw8sezJc1fmfRSdilBFmQPw9
 JQ3j0IBGbU3tirF35gbvsEoOQ+F+qLn9KRbUngxqKGczsLe78ZfpBjEKAzw8Itc=
X-Google-Smtp-Source: AGHT+IHJpCeepIKpHkViCWDrVTZnpu8/LQ0QooYN0UAjk42ke/hGd6daAhMcjRRSSTY1ptqXauxyOA==
X-Received: by 2002:a05:600c:3b9b:b0:426:62c6:4341 with SMTP id
 5b1f17b1804b1-42c7b5b4bdfmr121442645e9.20.1725538829300; 
 Thu, 05 Sep 2024 05:20:29 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27364sm230390515e9.34.2024.09.05.05.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:20:28 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 03/18] drm/lib: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Thu,  5 Sep 2024 14:17:11 +0200
Message-ID: <20240905122020.872466-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905122020.872466-1-ubizjak@gmail.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
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

Usage of pseudo-random functions requires inclusion of
<linux/prandom.h> header instead of <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/lib/drm_random.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/drm/lib/drm_random.h
index 5543bf0474bc..9f827260a89d 100644
--- a/drivers/gpu/drm/lib/drm_random.h
+++ b/drivers/gpu/drm/lib/drm_random.h
@@ -6,7 +6,7 @@
  * be transposed to lib/ at the earliest convenience.
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #define DRM_RND_STATE_INITIALIZER(seed__) ({				\
 	struct rnd_state state__;					\
-- 
2.46.0

