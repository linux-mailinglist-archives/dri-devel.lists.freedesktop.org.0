Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA753985F0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AA86EC3A;
	Wed,  2 Jun 2021 10:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08BA6EC36
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qq22so2971951ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BBWDOfo+AAmiWki3wa4clOVay2MsSz9vXgJmj0Dia5I=;
 b=qmc6OaCpHRMBwFZqEIwOI9+NFWFdvk5quR2hTBEaJo5gU818DstS0yezSXztqTm9tO
 jpDuplXmHc7t/E4zlAoa19/2+MztWTl8jqrNAEIN5MVl6LDwblBs81ZQn6QvH0LWmYYH
 xqYn3Xo4uVvAY0v+apaQQ/fT1G46vMTgNnFz7i4o/ek/jsigTOK5Rs6y0qHQ0x3auijG
 Ia3SDWJZtF05Dx2rXnK4vdlj+qdW2SneESYbZ4yo5xZHaDjA7Mih8iNPlR90stZc6vEq
 GekZdrCFzDDmG7KyuTJFIVbgnnU6XRiMpFKwnzleyKbl8/9kA6i0j7igtx0egDDaq0ff
 TpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBWDOfo+AAmiWki3wa4clOVay2MsSz9vXgJmj0Dia5I=;
 b=hdL5u/AAKJcwNyd7K4+XQ+ezIh+DmuMxN+sM/ZB4eZzZ6oCGAlufGBWuOFqE3puiy1
 hTy7TraQhJTdV5ZzniRZGl9vzeyXY8nS2MXcZOAvYreICwx5YAsvn4h/xgXSHNJQrpxv
 nPumOyqxdzJ3Cklv3LtwUF0DB4M/Fj5FhM5JTqJwLYrillgI9F56uDJCWIrAa8X9HvTQ
 cI7L+CxbuED+fkqA6aabREUtWgDwn5EIf5e0YwClGc81yKa3iYaVmu8UFWMLc+lwu1hl
 jAWnbupdL5cLPO9N4yINVkp8hYv7/PlN1SgwFKjMyPZzIHTQHbPPMm3izVofjd6XQpkH
 kW/w==
X-Gm-Message-State: AOAM532kTEeBBR+qyilR042TaT/xz3BmO4oiSn8bTDNb9y1jABmWVYTp
 HXlPswMUB4jabSTc6QQGt0k=
X-Google-Smtp-Source: ABdhPJxF31uO5DSGGdHGH0krvGUMSjmMuo3TL83yeyu/laBEoRQmLzp5YITRg8GJ1RIFesba4CQF5Q==
X-Received: by 2002:a17:906:b24a:: with SMTP id
 ce10mr10810739ejb.83.1622628557340; 
 Wed, 02 Jun 2021 03:09:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] drm/ttm: flip over the sys manager to self allocated
 nodes
Date: Wed,  2 Jun 2021 12:09:07 +0200
Message-Id: <20210602100914.46246-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
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

Make sure to allocate a resource object here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_sys_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 474221e863d0..2b75f493c3c9 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -3,6 +3,7 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
+#include <linux/slab.h>
 
 #include "ttm_module.h"
 
@@ -11,12 +12,18 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
 			     const struct ttm_place *place,
 			     struct ttm_resource *mem)
 {
+	mem->mm_node = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem->mm_node)
+		return -ENOMEM;
+
+	ttm_resource_init(bo, place, mem->mm_node);
 	return 0;
 }
 
 static void ttm_sys_man_free(struct ttm_resource_manager *man,
 			     struct ttm_resource *mem)
 {
+	kfree(mem->mm_node);
 }
 
 static const struct ttm_resource_manager_func ttm_sys_manager_func = {
-- 
2.25.1

