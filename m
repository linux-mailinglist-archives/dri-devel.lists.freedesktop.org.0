Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8009991D2F4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AF510E26D;
	Sun, 30 Jun 2024 17:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XCeO9lAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C02610E0DA;
 Sun, 30 Jun 2024 17:00:47 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79c05c19261so137524785a.0; 
 Sun, 30 Jun 2024 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766846; x=1720371646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHutpqbU2XFBkO4ZS+HSx6BtgstQ81ZFAirtiKOfnNQ=;
 b=XCeO9lAH5OB2UnHXKVcUEVfRUqcAOrLDLtAQfbmXpVif0RqnclSaroyA+oJgvRz7Z0
 wSmkqfMMesi3WC6FDbh2qWlXBpIwDm/TBjAnpvrvjQqGptRMJVxYMxW+ohQWq+O/qjEV
 1ieUv1oMiNesGJBmCB+JohFH6M9t1TLg7IKM0MH4h4MpIaM/wfSrQqY9FHL+ijSMiJmm
 fYFslu4KG2ZNq8szewAPgtx573/mJk/wqegVbrfvTI1YaF8EhnxkEXaDlNSSmvHocgfv
 hibDar9YIsHzoeUzXY3IPsfFI40TnguRf0K/2ANVZKvNa04sQnbKrsm2yK1JomydCE8k
 dXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766846; x=1720371646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHutpqbU2XFBkO4ZS+HSx6BtgstQ81ZFAirtiKOfnNQ=;
 b=u2J4X/BMbIhMKNRjYgyKSS2T05Ow2UnnH7oIh7LZFTMvrCDfBILTRC3h97Ee14fEVt
 zcFRyRnMIHvhDjeKhvlr9HwfIsFSxfhGjGQrQiFAuRkivGCyULJBW06LGHohibkZzZBL
 6LTSL7yyr2mKVImcX0emaNdRYx3kuMNqd+eX1OKyak476TGusUazt94XqydzFLTHWjKC
 trcI8p2G9ec6vVfD7YAkeWpJpMYA9aulsl0KU8cfVtLpUZcvWi5VYjGQ80Vmu1AAaTdW
 VFt4TRUcyLDrz+S4Qj7spCZP+e5s2rFQrCo2iTW1a8kUQ+/adAs6LRxgXeQwZTOMtZkX
 hG0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa6srq6CARlJmJiEaB6z6UXMadY1vz02MeStP8FcaJD5LKzdbuipzsJiceIT1QMjgE1D5Z4UHfo/ZTRg3gSRuEoI2iPDrWgzbiErV5Ku3o55NZVk7IpNyYC7x+blZsrTehfUC+WBQCYk85NXb+Ag==
X-Gm-Message-State: AOJu0YxX+a2LcR25POy38aJVRMPcNnllDlSVB7+zjPWsESqBZY0yP/kX
 qXhNiXAea0waSyVSRK7fQ3G9CsOCnjmFUnGlOVdZoGnbjVrsBa6u
X-Google-Smtp-Source: AGHT+IH0ztPyCY6Dqt4NpzMUYWlI0A2tAzXkZ1Uarh7nDBydP0UxmseHQ2j6rrqIVN9lnOUSv3vNKQ==
X-Received: by 2002:a05:620a:204d:b0:79b:f641:e6c with SMTP id
 af79cd13be357-79d7b9b0fcdmr432140085a.14.1719766846526; 
 Sun, 30 Jun 2024 10:00:46 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:46 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/radeon: add helper rdev_to_drm(rdev)
Date: Sun, 30 Jun 2024 12:59:20 -0400
Message-ID: <20240630165949.117634-5-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630165949.117634-1-wuhoipok@gmail.com>
References: <20240630165949.117634-1-wuhoipok@gmail.com>
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

Add helper rdev_to_drm(rdev), similar to amdgpu, most function should
access the "drm_device" with "rdev_to_drm(rdev)" instead, where amdgpu has
"adev_to_drm(adev)". It also makes changing from "*drm_device" to "drm_device"
in "radeon_devicce" later on easier.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 0999c8eaae94..ae35c102a487 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2476,6 +2476,11 @@ void r100_io_wreg(struct radeon_device *rdev, u32 reg, u32 v);
 u32 cik_mm_rdoorbell(struct radeon_device *rdev, u32 index);
 void cik_mm_wdoorbell(struct radeon_device *rdev, u32 index, u32 v);
 
+static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
+{
+	return rdev->ddev;
+}
+
 /*
  * Cast helper
  */
-- 
2.45.2

