Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A760D3D124F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520A76EB65;
	Wed, 21 Jul 2021 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D326E98F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:25:04 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so4220623pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BhkbkDYY5lvapWHEYykIm8DO+eSuMufmOfIOn+p1+24=;
 b=ICuQed88N2DSLox8+2+WLSYjWX9567etIPd6e2gZVhN5e9WAwnSsnYltZ0bOQncTA2
 PDSqyDltnwfZ+8eTQNYEjRO14OClQbNt256BFV9i8zepxyvIZxA7PSkpUKoF+wMONJeE
 RHbke94hJmTDTWCtXDUp/HVe50qgC5PFNqzwpiZ4kAMhL2537ofK5aqZidAFl2eOQEf1
 U1oXDkZToBXBqokztVEvNieliqQRpJpWBT/4u4pUtuD9chViEfVfbX8UUpkF1XYgooC8
 CO5nTp8+aF1iEZvcybwx2iAYbB6OLg5cutw+jpqnkVe2TPiC3qVUamwr7Hcj1QWnIigs
 C3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BhkbkDYY5lvapWHEYykIm8DO+eSuMufmOfIOn+p1+24=;
 b=A4NQjyB3GnqpMS7EBBLmnQS/3o+wh7WPR3qZrMRCUxY/JhTV5H5b6Gg0jVqPNU3r1p
 kamwkhpC1W9Lgb9Re6awvELdeyuwDPUHiCFEj+FX1aRAZyyk56Z6DHFV174wptXTBYtm
 shGZ6I1lxjJlwHaHLv42Ok1lZuE/9aCt0FPpXO69Pj4YHd2gwiPEMs5EtWXM/9weK/U6
 klzIbzm664E4fga57FBM4EiGnVyKoA0564C/lMGw6RgHiUNztkKfRxYGaFAtre2IJizB
 rRmWu9oEWFXZpkfSu/UGn935XcTj8xHesYtMotmIFvLR7D9sDUBOhpHUa1XR+fP2Zd1j
 AD2A==
X-Gm-Message-State: AOAM532zmYrKatxLxlmo+amZqg6vYLqlCAtCPabm/76PaR5IrlUDrHXR
 N+I4a5vE6jZAvqoM0Tm0IIEFQw==
X-Google-Smtp-Source: ABdhPJx+ValW3pKWYpEKgfKlU+q31MmAziW6tzU+OAKOMBI8RQolg01wyhynj1LpxSDAxZ9wxbw0UQ==
X-Received: by 2002:a17:90a:642:: with SMTP id
 q2mr4250208pje.205.1626881104316; 
 Wed, 21 Jul 2021 08:25:04 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:25:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/ttm: Force re-init if ttm_global_init() fails
Date: Wed, 21 Jul 2021 10:23:56 -0500
Message-Id: <20210721152358.2893314-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721152358.2893314-1-jason@jlekstrand.net>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have a failure, decrement the reference count so that the next
call to ttm_global_init() will actually do something instead of assume
everything is all set up.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 5f31acec3ad76..519deea8e39b7 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -100,6 +100,8 @@ static int ttm_global_init(void)
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
+	if (ret)
+		--ttm_glob_use_count;
 	mutex_unlock(&ttm_global_mutex);
 	return ret;
 }
-- 
2.31.1

