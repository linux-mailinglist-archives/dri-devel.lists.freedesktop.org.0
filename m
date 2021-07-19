Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2C3CEB02
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A89889E33;
	Mon, 19 Jul 2021 18:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2889DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 18:30:57 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id j199so17215799pfd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFNdhkykZcCs3HXRfapYY9OkVQ/lDSNnVRyFvwWEZ84=;
 b=LDjnX2FSQrlmSDxmQqhF3UZTYEjB3opXAgjmZl7d/IU6t7qJi3n/wlFASNdRJLwoL5
 pu5g65wb6YUYtnUPgT5BDqRsP8hX0AIY3nfdzjzBxUAqIyNkJwawDD0OVDr2fnJteppW
 0jx/Gr9dfw4UaatdLu6mAy9EspiX1GOIsi+2k+M/ucvNdn/7pejFWMBvWz+mCNv8hL/c
 mE07NK1eLorJQrAlo0BpmnqTeTeon4Q1FqnqlZuIGDqmtyK3WbBlvZPU+XY8Y/doGmpz
 4zELtwX2zIm3DA9B1IpjACCPCpRg14fKDM02rLIRIfFpJKgXBcQ86Ppaez0ZsPddAEsm
 g5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFNdhkykZcCs3HXRfapYY9OkVQ/lDSNnVRyFvwWEZ84=;
 b=OxUr3dYGtbes877bc0PIqh+VONkq5DpKaDdrqBljCvhFmHfrtL80pJWJOzReVMWSZc
 GyHPfyYRdOckm20c2fml3KXEvTzbnRDI6y1csLYC+DI5y0uJb2tnVEy49oqX+qoisVYW
 m4fGCyz8w53GriZe2lPN5oycm3Abh4qX2D+Wv/nPA+wyPbYYhU4iUArBOkHD7T+To/Y7
 ZIMBoXNPa3pmMns6NiZ5xiyu8S5J1hRzPa/X7SoQYWxxBg8Io8sl7FNIrNmLtEOCYJN9
 WDwxDpB9UiDc9SNJEjlBLjWXyNrEIZm4/CSrzCds+C1ZyE12x6Pifxec0IpneQ+Xe7PR
 S7Tg==
X-Gm-Message-State: AOAM530hTi2k00GGnCSIMg2rMomgXOP0IIfRRmxR+hs0iIrGdfaunLP9
 Jn8hpCAAyjAMcds8bpGfV7ZNDQ==
X-Google-Smtp-Source: ABdhPJyCSaK1BnjPMSbDfFGRDUr24/UBx8EAgEtP2JUda23KRKsR0D09mUnkHbwjSN6IBYFUMzGIYQ==
X-Received: by 2002:a63:43c4:: with SMTP id
 q187mr26495416pga.172.1626719457407; 
 Mon, 19 Jul 2021 11:30:57 -0700 (PDT)
Received: from omlet.com ([134.134.137.83])
 by smtp.gmail.com with ESMTPSA id w23sm6961555pfc.60.2021.07.19.11.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:30:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/ttm: Force re-init if ttm_global_init() fails
Date: Mon, 19 Jul 2021 13:30:45 -0500
Message-Id: <20210719183047.2624569-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719183047.2624569-1-jason@jlekstrand.net>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
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
Cc: Christian König <christian.koenig@amd.com>
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

