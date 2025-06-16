Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB6ADB122
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBDE10E386;
	Mon, 16 Jun 2025 13:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMIB4lpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799810E38A;
 Mon, 16 Jun 2025 13:07:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so734468966b.1; 
 Mon, 16 Jun 2025 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079249; x=1750684049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjmL9i3O04BAV4ezjRcd0ZZLH5tchyXgQBofGlKj3gk=;
 b=PMIB4lpFRrxKbf5wyD1VDJ9zcmaEDCiR599L8nguwcfdLNU/3kx6AnCh0JoU7yqM7r
 p4RKwxi6gwJAUaTJTYuq/u4bkWRqN4AAem81XWd+ljl1+BMvxlOp1onm2gFq6dX0tIf3
 m1Vt5vGHchTylzrobjAM1Qaq08ZeOJ7Y88F9noU+YBAo8jhV0r/4cI/hOaVYhQgUbwNR
 IKo+TBZ6ocDEjDEOBXu6q1SiyoHl6xwSfl1x0m/tBLPQE8ykwHDILq7LVKqZGPx+gr9j
 wAwE6enJ+rLxlQ8Lw+DZuUlZexRhH0h3Zgfgrc0Z8MKaOnBm2JziKfbOMfyb/hnS+4cq
 VQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079249; x=1750684049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjmL9i3O04BAV4ezjRcd0ZZLH5tchyXgQBofGlKj3gk=;
 b=J61oMB+aZ9A5oqnzVXMcof8UqKikMUvCVv4V8iHEYoNlQJgkruoWB4iOx6hM2ANPWg
 SDbYA5Jjp3SP4I5eHiyWjhnmlhsPypfcTdrRylEUFtUY4XU/IIlC2UfQCCofCeR8MKsJ
 Ljmt8jRljqRhXxj3mIDVdM+RG5WTy5TqWWpeJn4mlNoB0qbjj55OnL89fwrEWXxJgmWp
 Ebxp/NLYK9m1f0/ecYAPLHLH+yzukru4XnzCoku3gGnb2MuloXVV8lqGkj+B0+aOhmJA
 2G709VRn4EHvI9bXzyyAqh1/nL07+Q5fz1ZocOj98RFIuAt1RzWapG3xsemVS3Yn1gY6
 FJkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+3a+HGpQXoQIfQsysZyeeP2rbVaCar6myFsO8sDJpQCjizPL5R+WkWMRDLWasgsFO1eqzkBM8Uso=@lists.freedesktop.org,
 AJvYcCXs0TpoJFVM8TApZu/Kwaq0jzk+e21BOO6zDCgoK8y9dG9Bo5SzlG5DmYns3dtyk2C7BFz6Fb9nPl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7kbBjpBrYUs58ePyUtGAR8kiqibQlPQzuLkBrc6xhoM9kh8jC
 imaW3kmkyjInPO8hQwy8fL6KwuK3UYB0zz2mcfZaR4bWISTchitLIZE5g+q1qA==
X-Gm-Gg: ASbGncscNRmlC0a2VJvg2adFsQMcG5mVyIrXApemWtbVWzPHTusxZhRBH7ONC6KbT21
 f2lXqG3nZN6Hh9FzrZ1Dpy/xpnL57lPtWLwjYrgOBbvdzu3jfo8zffacbPeEW6ZnMwYUupaWgkC
 B/vaalyHlaPk3ZgcNR9TlHAppQRRpQ0LARvblsAfFEEjqt4au8eEl4VDN5UndfNzCWcQGMWsYd4
 l/GBQrxbwg0n1o+S3ZulN/VM+M3xyd0mbBglVohv/mVuinFn5qtjNfyF8TiWT9zrIGX0UDqWmOu
 pNQwAgUaU1Yi/hP7pkWU0zy8PJfR1KG/eHFlv7lat6Ia2UC49bE0+hlJ4kPjBi28edsrCnCrM+o
 Fc2wqNyG9quo=
X-Google-Smtp-Source: AGHT+IFIqssS6/s23VuGyzqiB4dWCts8BGvgwWhLVWXKh9plrSPxsGX29Mcz524oGc5AodsfyPtgdA==
X-Received: by 2002:a17:907:2d91:b0:ad2:3f54:1834 with SMTP id
 a640c23a62f3a-adfad451601mr795239466b.40.1750079248890; 
 Mon, 16 Jun 2025 06:07:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 2/6] drm/xe: stop asserting on the TTM refcount
Date: Mon, 16 Jun 2025 15:07:22 +0200
Message-Id: <20250616130726.22863-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616130726.22863-1-christian.koenig@amd.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
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

The TTM refcount is about to be removed.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7aa2c17825da..2a8e7cb8c982 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1417,8 +1417,6 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool locked;
 
-	xe_assert(xe, !kref_read(&ttm_bo->kref));
-
 	/*
 	 * We can typically only race with TTM trylocking under the
 	 * lru_lock, which will immediately be unlocked again since
-- 
2.34.1

