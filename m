Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE63FE3A0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9516E2BC;
	Wed,  1 Sep 2021 20:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1776E2B4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:29 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id j2so389487pll.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdvWH3y4JK/aU5g4UL9vX4Drgc5KR+WNcLLfmz6Dht0=;
 b=UDVkD/BN+MtASvoU5ESBO17dNBs/+/ptk17k5LqiGLVMA0vqAho4MYhGID93hNcoD3
 f45U5FRmuSltdaFdIV26coiOGHBk2k10CXvbbHqYDUddB9T63kSZqoNfgmPSdcWRfIkb
 fY9iLXDDMHFpwqjzuLagqrAuEAR1sTIWClOYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdvWH3y4JK/aU5g4UL9vX4Drgc5KR+WNcLLfmz6Dht0=;
 b=pz4NE2WArsxa8rjsg84Hh7rbkbJWQ8ovmyURoO0jDlmN/42iaoCqQqyJCr3ov2hYDF
 WxreS8LqEeZuYar8548FZU47Hdzo93LBNQ3plFvLu0HRENOiUcXSrsn0UTAofz6/c97G
 BpMacNZCjJPpOJRmGftsMR2RW1A1sHC5IzUGUOvgvFJvRWdb5aYxNSBa+yDKTj6/tQ9c
 ODi+HjLuiDnTmsNHcQ/3kGUdV5RpZHKVEcVGPn7WL22Al1lMFidWvXHkcyFuuV5flCAm
 cFBCiG/2maF9hNtHEu6wo/e2lhxc/kteecl605yA54fQjRIFfoKaSemtMKzuIouZfJm2
 YmLg==
X-Gm-Message-State: AOAM530jxlMPd6huNICeXKRF6KGHWuc5LLpa4FZDRWCGtsjjBnbAXWNS
 aw/B5daONgDFqCKl5HZRFhNySQ==
X-Google-Smtp-Source: ABdhPJzybWYw8OfKvEN0fimtrj6mwClpjSIup0tHDbRx+ZxBYyA+CaNWH/QnH38x8HXOsGvYpod3JQ==
X-Received: by 2002:a17:90a:520c:: with SMTP id
 v12mr1150359pjh.105.1630527629353; 
 Wed, 01 Sep 2021 13:20:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/16] drm/edid: Break out reading block 0 of the EDID
Date: Wed,  1 Sep 2021 13:19:20 -0700
Message-Id: <20210901131531.v3.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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

A future change wants to be able to read just block 0 of the EDID, so
break it out of drm_do_get_edid() into a sub-function.

This is intended to be a no-op change--just code movement.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/drm_edid.c | 62 +++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..a22c38482a90 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1905,6 +1905,43 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
+static struct edid *drm_do_get_edid_blk0(
+	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
+			      size_t len),
+	void *data, bool *edid_corrupt, int *null_edid_counter)
+{
+	int i;
+	u8 *edid;
+
+	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
+		return NULL;
+
+	/* base block fetch */
+	for (i = 0; i < 4; i++) {
+		if (get_edid_block(data, edid, 0, EDID_LENGTH))
+			goto out;
+		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
+			break;
+		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
+			if (null_edid_counter)
+				(*null_edid_counter)++;
+			goto carp;
+		}
+	}
+	if (i == 4)
+		goto carp;
+
+	return (struct edid *)edid;
+
+carp:
+	kfree(edid);
+	return ERR_PTR(-EINVAL);
+
+out:
+	kfree(edid);
+	return NULL;
+}
+
 /**
  * drm_do_get_edid - get EDID data using a custom EDID block read function
  * @connector: connector we're probing
@@ -1938,25 +1975,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
+	edid = (u8 *)drm_do_get_edid_blk0(get_edid_block, data,
+					  &connector->edid_corrupt,
+					  &connector->null_edid_counter);
+	if (IS_ERR_OR_NULL(edid)) {
+		if (IS_ERR(edid))
+			connector_bad_edid(connector, edid, 1);
 		return NULL;
-
-	/* base block fetch */
-	for (i = 0; i < 4; i++) {
-		if (get_edid_block(data, edid, 0, EDID_LENGTH))
-			goto out;
-		if (drm_edid_block_valid(edid, 0, false,
-					 &connector->edid_corrupt))
-			break;
-		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
-			connector->null_edid_counter++;
-			goto carp;
-		}
 	}
-	if (i == 4)
-		goto carp;
 
-	/* if there's no extensions, we're done */
+	/* if there's no extensions or no connector, we're done */
 	valid_extensions = edid[0x7e];
 	if (valid_extensions == 0)
 		return (struct edid *)edid;
@@ -2010,8 +2038,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	return (struct edid *)edid;
 
-carp:
-	connector_bad_edid(connector, edid, 1);
 out:
 	kfree(edid);
 	return NULL;
-- 
2.33.0.259.gc128427fd7-goog

