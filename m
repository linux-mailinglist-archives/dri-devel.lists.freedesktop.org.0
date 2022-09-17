Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E35BBA7F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 23:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF2E10E168;
	Sat, 17 Sep 2022 21:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6210E152
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663448370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6msLnDSomIwMNMBGo668RkwPupR261BzK7LKAgQV90=;
 b=IDi0+30tNisd/t6q1hd9EKxZH1+coRYOlEVkUEowkIcWkKZzz+7yCR2NXQxicuRSQvNQ1w
 b/90q2m+YtBcg6urVJyxwiyuLCAtc/nC+682Tw71IIxB8lXtxm0XdcRfdtUiqfN/UfLZGB
 P0le5fW/8giB3cQO7Q8+5IK265cBSYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-m1neOF6LNDeQS08ye0zYJA-1; Sat, 17 Sep 2022 16:59:27 -0400
X-MC-Unique: m1neOF6LNDeQS08ye0zYJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8959185A78F;
 Sat, 17 Sep 2022 20:59:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB3D11121314;
 Sat, 17 Sep 2022 20:59:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/5] drm/gma500: Use backlight_get_brightness() to get the
 brightness
Date: Sat, 17 Sep 2022 22:59:18 +0200
Message-Id: <20220917205920.647212-4-hdegoede@redhat.com>
In-Reply-To: <20220917205920.647212-1-hdegoede@redhat.com>
References: <20220917205920.647212-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use backlight_get_brightness() instead of directly referencing
bd->props.brightness. This will take backlight_is_blank() into account,
properly setting brightness to 0 when screen-blanking has been requested
through the backlight sysfs interface.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2 of the patch-set:
- New patch in v2 of the patch-set
---
 drivers/gpu/drm/gma500/backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 5a40414e5748..e85fd181f2f3 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -52,7 +52,7 @@ static int gma_backlight_get_brightness(struct backlight_device *bd)
 static int gma_backlight_update_status(struct backlight_device *bd)
 {
 	struct drm_device *dev = bl_get_data(bd);
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	/* Percentage 1-100% being valid */
 	if (level < 1)
-- 
2.37.3

