Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C1362294
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B366EC1B;
	Fri, 16 Apr 2021 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55E96EC26
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g17so31848767edm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6lJM5vDlPCigZaMaZ137qXfyZxXCNgpbaNiX62r2Ss=;
 b=flSVCO6bULmEgKESUIhxGFuVTNcmVsqnwVrbn6m72srwUAYXKxBZS5Q/oDRhGv11DB
 v2a+c3zWguVvSFBphtnT73j9vAYOvHTNhi79odq04gfZLHYc8P+C4KTSZfBLdj8PyqNi
 BysQPAg5pgN8mANchtugw5z6tOHIVzKAx7bDEr8rmeH8ZQ8wjCv2lHbOIbX9jNKGxnLM
 ha5i5bwbGCMi3MrzIg5/rf/uHde9U+WFKoCGDBgH6kOx9yXAPH+LqQIFyTVIgV/dHEsc
 SyIsLANSeD5YaFr6F/3jY5GkhhiKLkX0scp2o5vzC6FMlIjMpnzTMnNQ3SCT8WDCRs+9
 AjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6lJM5vDlPCigZaMaZ137qXfyZxXCNgpbaNiX62r2Ss=;
 b=h6cf7Jg3mnsJEfyJRs9Aa8Xfxj3TpPGRa50JZOf3KoMTKf5XhblKOqpXBZ7tLr4mbw
 l9nIG/LHa+t35wZsWdnQDwIEVgKXOo7WKbX5SiFuXZ0lVUT0AZqh/dyn9cqhYc9NYr8E
 OU0Pj6ptH5wRmbFxXtTLVNS8EkVh/f6wOWurEb6ZnYyee3Xwaop/CC3tcUeN6OHdt8eV
 ToaY41C5nht8VaTVzUrz4dFWjWYJS2JtywjGFg5baispS3KaEs05jRs0p2O79EEttfyQ
 EpMXLQglT60E4mT/8l5WiMuvIhqfrJJr7J9/RbxYwKc/aHSwpWfgeUDQfXaOMKXc/HUB
 t1eQ==
X-Gm-Message-State: AOAM5316wHDZ1Q0BLAvuKSDaQyE9z4iykAsRMIeBHJhf89RXjT8G6Kru
 YhwhBGV9ONXV3mE651nQ0vLKxw==
X-Google-Smtp-Source: ABdhPJyb4be2bRHCUASGhOYcF9QNbDlJuZvsy9N/XCm+mUih0S3RcBA88c3OyeoKleXaK17tAQDyYw==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr10607699edi.376.1618583874356; 
 Fri, 16 Apr 2021 07:37:54 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function
 'ttm_bo_cleanup_refs'
Date: Fri, 16 Apr 2021 15:37:08 +0100
Message-Id: <20210416143725.2769053-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Huang Rui <ray.huang@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_bo.c:293: warning: expecting prototype for function ttm_bo_cleanup_refs(). Prototype was for ttm_bo_cleanup_refs() instead

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cfd0b92923973..defec9487e1de 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -274,7 +274,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 }
 
 /**
- * function ttm_bo_cleanup_refs
+ * ttm_bo_cleanup_refs
  * If bo idle, remove from lru lists, and unref.
  * If not idle, block if possible.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
