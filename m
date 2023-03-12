Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA86B6A94
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 20:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F3610E272;
	Sun, 12 Mar 2023 19:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E4A10E272
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678648683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUEnoOj5mVpGTN9PeeZh9hWCnroh4EciYx/3SGOOsu0=;
 b=L/gxRc23o+hvOiId+EmDRGx9I2xy2q6WFsx5fgFnl2yKg2c/Es+ZpTpWzvSzaJYdfo0Lkc
 3WpyanizrE9EyIATuggakfiaqtIy6Cv5JvzEXRiuBIb/z/R7IlW/nMmWkXj51AOi7faHhy
 wbIWnEcbXAezhvPG7q9/2JdQeGGdUWI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Tm6RNgmBMQi5hGG2uG-kyQ-1; Sun, 12 Mar 2023 15:17:59 -0400
X-MC-Unique: Tm6RNgmBMQi5hGG2uG-kyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E8C085CCE1;
 Sun, 12 Mar 2023 19:17:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70992140EBF4;
 Sun, 12 Mar 2023 19:17:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v3 1/6] drm/amd/display/amdgpu_dm: Fix
 backlight_device_register() error handling
Date: Sun, 12 Mar 2023 20:17:46 +0100
Message-Id: <20230312191751.183450-2-hdegoede@redhat.com>
In-Reply-To: <20230312191751.183450-1-hdegoede@redhat.com>
References: <20230312191751.183450-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_device_register() returns an ERR_PTR on error, but other code
such as amdgpu_dm_connector_destroy() assumes dm->backlight_dev[i] is NULL
if no backlight is registered.

Clear dm->backlight_dev[i] on registration failure, to avoid other code
trying to deref an ERR_PTR pointer.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 009ef917dad4..42b88ab5552d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4180,9 +4180,10 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 								       &amdgpu_dm_backlight_ops,
 								       &props);
 
-	if (IS_ERR(dm->backlight_dev[dm->num_of_edps]))
+	if (IS_ERR(dm->backlight_dev[dm->num_of_edps])) {
 		DRM_ERROR("DM: Backlight registration failed!\n");
-	else
+		dm->backlight_dev[dm->num_of_edps] = NULL;
+	} else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
 }
 
-- 
2.39.1

