Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE865B36CB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DD910E041;
	Fri,  9 Sep 2022 11:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9462610E040
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGc0m1yVDtObeXGC5g2i0gtTYHtAHJjA9ZDbtD5CNAA=;
 b=XsLku2dYAISB9Dlk4Hh1cY/udvNUGMD5EHUD9UCo3wPsmCAODKPJTcc7ePkLaCbfHH+wtB
 6XLyd/+RQb24rFrmA+iIUlh6mwES49Jhe1aJFnHPzHe3krfcGL85+ltcG9065v7X0CRqcu
 MeQfxnCi+1B0NzyquhUh+HL7qlAGBBw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-2YduklvwNdS430q8Hdh0Kw-1; Fri, 09 Sep 2022 07:56:55 -0400
X-MC-Unique: 2YduklvwNdS430q8Hdh0Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8242B38164DB;
 Fri,  9 Sep 2022 11:56:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3EE31410F36;
 Fri,  9 Sep 2022 11:56:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 3/6] drm/gma500: Remove never set dev_priv->rpm_enabled flag
Date: Fri,  9 Sep 2022 13:56:43 +0200
Message-Id: <20220909115646.99920-4-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

The rpm_enabled flag is never set, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 13 +------------
 drivers/gpu/drm/gma500/psb_drv.h     |  3 ---
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 2f52eceda3a1..bdbd2afa8171 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -558,18 +558,7 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 int gma_crtc_set_config(struct drm_mode_set *set,
 			struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = set->crtc->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	int ret;
-
-	if (!dev_priv->rpm_enabled)
-		return drm_crtc_helper_set_config(set, ctx);
-
-	pm_runtime_forbid(dev->dev);
-	ret = drm_crtc_helper_set_config(set, ctx);
-	pm_runtime_allow(dev->dev);
-
-	return ret;
+	return drm_crtc_helper_set_config(set, ctx);
 }
 
 const struct drm_crtc_funcs gma_crtc_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 731cc356c07a..dd6fd49d85f3 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -486,9 +486,6 @@ struct drm_psb_private {
 	unsigned int core_freq;
 	uint32_t iLVDS_enable;
 
-	/* Runtime PM state */
-	int rpm_enabled;
-
 	/* MID specific */
 	bool use_msi;
 	bool has_gct;
-- 
2.37.2

