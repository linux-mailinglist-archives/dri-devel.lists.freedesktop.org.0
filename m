Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79F3EABDA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 22:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B3E6E47A;
	Thu, 12 Aug 2021 20:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01D6E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 20:34:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id oa17so11829530pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVVjPWX6jcSp1gRrqICXCN1mOR2j3DjUtUf/9alZY3Y=;
 b=NTqEWkzJUOw2ZlXrzJrnIL4WSEmuEgL12Njv6P7CcRtEgYmBlih9RSajBqOAsK3ZM9
 V8PKTjIDKQL5gRifoAkZtS4W9g6QfcOZDuhy32XfekzezTvgaxz9ET1610rZWUUP2u2U
 CpWA9hnw6LmYuMtytVwNwMUMN1Hdq++j3+zwa2BoEKUlPkbsPEMqxUguO83zPZyK/RoC
 llVctLxu5z3Zs/gqEnHBUmKIvqBMampzJ4RBkPflBaMu5m9uN7KS9ywlVqCZEIFmIwsj
 yQAM51w3Ib4rKerBpFgY6GRmGXqs7RIhf3HvQuDqrh2MA1Q5r+7Z2DkB/6lKTf3wXwE7
 mRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVVjPWX6jcSp1gRrqICXCN1mOR2j3DjUtUf/9alZY3Y=;
 b=AlVqmxjydkEOXaqt6l7nus/6K6NPVb664e6yEuRAaf2xl7waiN3irWOKp0DumWqOTa
 ByEhnrtmn8TCRR6ih9vwPFS0PXbvsU8/jaV8F0bdDAy3IYMQbf2M2IUgcxNCV29JeQYJ
 7mj3nvR/v7DLGVO+vffxS+WOHLOZBV92oz7JD7ZW43g4LztMm1nZ6bDLBSgS/mP86/i2
 gSOqpkdODPQJK0tBL9I8PhsqF/KP3A33yu0buksVdg0Zn/tgxWdcw2Ct+Hv3GceZpO38
 ozsiMvz0WG/NrGDppGxtSjTZgFpmOxlPusVpjlv8qDiBvBrZ9YyWlau5dd97LhQZ0KXg
 S0jA==
X-Gm-Message-State: AOAM531GjjNFbVucZN+Wbg39dDvuz+C6JPYWxTDRW1TO89ZaWZ+Fy8K9
 bys2GMZXJpaTFJDEtOmqIhJIKemcs9B1xSa6
X-Google-Smtp-Source: ABdhPJxDromVb70j3SOsWGyuE45OdCGJRLAQxvA5DgMW3jezwPixi6sfC0TTSj4bEQmvD9f9JziRlQ==
X-Received: by 2002:a63:ce54:: with SMTP id r20mr5534412pgi.164.1628800487085; 
 Thu, 12 Aug 2021 13:34:47 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id h5sm3404482pfv.131.2021.08.12.13.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 13:34:46 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/ttm: ttm_bo_device is now ttm_device
Date: Thu, 12 Aug 2021 15:34:42 -0500
Message-Id: <20210812203443.1725307-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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

These names were changed in

commit 8af8a109b34fa88b8b91f25d11485b37d37549c3
Author: Christian König <christian.koenig@amd.com>
Date:   Thu Oct 1 14:51:40 2020 +0200

    drm/ttm: device naming cleanup

But he missed a couple of them.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian König <christian.koenig@amd.com>
Fixes: 8af8a109b34f ("drm/ttm: device naming cleanup")
---
 Documentation/gpu/drm-mm.rst | 2 +-
 include/drm/ttm/ttm_tt.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d5a73fa2c9ef..8126beadc7df 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -37,7 +37,7 @@ TTM initialization
     This section is outdated.
 
 Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
-<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
+<ttm_bo_driver>` structure to ttm_device_init, together with an
 initialized global reference to the memory manager.  The ttm_bo_driver
 structure contains several fields with function pointers for
 initializing the TTM, allocating and freeing memory, waiting for command
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 818680c6a8ed..0d97967bf955 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -31,7 +31,7 @@
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
-struct ttm_bo_device;
+struct ttm_device;
 struct ttm_tt;
 struct ttm_resource;
 struct ttm_buffer_object;
-- 
2.31.1

