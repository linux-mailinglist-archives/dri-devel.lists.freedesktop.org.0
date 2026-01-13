Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB5D1D17F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC0310E366;
	Wed, 14 Jan 2026 08:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FIVYMTKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E31D10E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:58:30 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso63806935e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768345108; x=1768949908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XY8aJdo/isS51GiJT3XMMqYZL8w9JZXzmK3xbGt6GFw=;
 b=FIVYMTKOhxS47lYyHMTpC+DhbC3BKbsKYozoBKjpTFTksxJkLOLAf6O7C/1FYsFJ0Q
 XpREU+kfD2GO+yVIWEzeKhv0jAZLQ0D5VbqwKjI1B05sDzqFVrowoEPEgMYffjfP+UNs
 4VY3/jkvY5LAPN+18PMhzOVLLguccPpRo+B7+qSTOauC7KIc6OrpsKf9DCKzJW1z98Zu
 trJokvU44vV0MCiS/iB6mteFbYBX0or1kvNBX3P37AFn/ICZhpvamF1s0wr/Rof90IzJ
 KXEc8wntfx2Lh6I/rXugyeFjbYKhTO4azP7Ya3GnxLyv2KaWglMtVt/Ilm4D8UZZak64
 m+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768345108; x=1768949908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY8aJdo/isS51GiJT3XMMqYZL8w9JZXzmK3xbGt6GFw=;
 b=ByJ3vLDg7IdaIdVjlBsotjgbmvQnNFSTRGUpdgiBtL4+fHFxuUrWgw6igwTcxzFxVg
 QRFAut85LVbdnhpgCXGGTLFeuklqy4MiKEViduYX5whlukLb1Dkt+NGanU1BZ9TLfGwA
 xmvphuz4z9NIK44W+hlBHKkHbsv79U1XlNoyY1OgI6R6F1pHQQyyU7h2hLliAcrFgEUO
 ajsON0nIw1yVja/UapvQtvIYFbiHMoNUKu2nkWg0IzNUONb6DxpVbjPQ94EI2ibxpakH
 7/hE1NNjOwjSYc6TLtIpSTVKLz1elxJ9JmDSamvTImu+Bd08hbmEVRcQBloq76bfqAfU
 3hhw==
X-Gm-Message-State: AOJu0YwjdRQ6ze3PzcJqog51j3qGQDWvNGJXeFk5zsMCGb8Mn2/evP6n
 L2l05hOEVWWcBdqO4FJ+EIK/z7EOrmbMeF4l4Ped4oNQJEpaEiof0RS4
X-Gm-Gg: AY/fxX605KhGYpk8roH4lxki9TSk2acL+L7NOWStOqo1WupTEL+kXsoIYd2hSmBgABp
 KCDTXtjUC1wUTYmEvjElCLnNsmy7qm3N7R2HxLBb8QzPbPmdyfbHKFiMjF8+64SjSoD/1F4tYG/
 FerDLJHP8r6N/rtL0OLj0lSEG4j3aidnIseFibQboQI9yylTRBA6+Tk8zPiLdb9LYdkKhDXKKl8
 jB62H2PD5aLH4G/fgmAmGWVlR1qon3zDGFDTMOwHHeBcxVvDLdoT1AqOeMTF/rI4IFNzsdTJ34+
 IFy2awjlpBrfaK7v6JM6SGJjy2RCfzfhOYTDh+izeCLFEE9O2Zi0KPLl5h5tzZWJSRytgKTGGuE
 tMfNzsOcgrODYIKUZYwq5TPB86suTfvbmkMz9SQfzGoaKIl8fTCmpeZSu1+NeKx9QrKQeD4aDft
 84BG3Qpac4HrCuE7C59AVg4dcowWSHtnMG4k4fBA==
X-Received: by 2002:a05:600c:638f:b0:47d:333d:868a with SMTP id
 5b1f17b1804b1-47ee484c53bmr1267985e9.33.1768345108321; 
 Tue, 13 Jan 2026 14:58:28 -0800 (PST)
Received: from practice.local ([147.235.205.136])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe67csm46588246f8f.40.2026.01.13.14.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 14:58:27 -0800 (PST)
From: Jay Winston <jaybenjaminwinston@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jay Winston <jaybenjaminwinston@gmail.com>
Subject: [PATCH] drm/gpusvm: Fix kernel-doc header, parameter, and grammar
Date: Wed, 14 Jan 2026 00:56:56 +0200
Message-ID: <20260113225656.21703-1-jaybenjaminwinston@gmail.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Jan 2026 08:25:16 +0000
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

The kernel-doc for the GPU SVM validation helper has drifted from the
actual implementation. Specifically:

1. The function name in the comment refers to a 'range' naming
   convention not present in the function signature.
2. The second parameter is documented as '@range' instead of
   '@svm_pages'.
3. The description seems to have some minor grammatical errors.

Update the kernel-doc block to match the implementation and improve
readability.

Signed-off-by: Jay Winston <jaybenjaminwinston@gmail.com>

 On branch gpusvm-docfix
 Changes to be committed:
	modified:   drivers/gpu/drm/drm_gpusvm.c
---
 drivers/gpu/drm/drm_gpusvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index aa9a0b60e727..1091514d9cf8 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1338,12 +1338,12 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
- * This function determines if a GPU SVM range pages are valid. Expected be
- * called without holding gpusvm->notifier_lock.
+ * This function determines if a GPU SVM range of pages is valid. Expected to
+ * be called without holding gpusvm->notifier_lock.
  *
  * Return: True if GPU SVM range has valid pages, False otherwise
  */
-- 
2.46.4

