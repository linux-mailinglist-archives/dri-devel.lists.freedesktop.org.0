Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B153F405E43
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C326E914;
	Thu,  9 Sep 2021 21:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52F6E914
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:22 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso2399991pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZvgdcotUW/Z2hr5W/JwqaH70rPJvl2nj6s4qqOeE0Dg=;
 b=Kk+o0RoM58UWObfVq9l6ZWG/YLrp1SwOU5m07aLzfk+Aqbxf3Rbi7USY5eNw5Pa/yQ
 0zdi7GNmSjZAiOaARPo/QZczwIe31+kTE+Xcu4LPr7AZ3ttD5/DUH6A5uUFjpXEtwpoF
 emWZzbR1kb2pGEtYFl+AWdJqYApSqvTho/0+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvgdcotUW/Z2hr5W/JwqaH70rPJvl2nj6s4qqOeE0Dg=;
 b=p4co+f+RXd7JarfTJl47j4jMC7AvMKepWkF669Xt/g63YwHnBMUTNUBkx679bwPqsV
 6KrN5EwArDLUwX1psqA4S2poVI7Z6AAFNU9S9kelIG6tu9DO8BIACufomASxpZYCb3gg
 nQrTzHyq3ZR7ghxH5/9EqWnEbksWbw+8JfyPYf0J7xLssTaMosclBJzWdViFME+3CaH+
 Qeuv0DH81n6jG+co14ZHPuxpuN7BNTTMnEdNHMaao8Dm5hp/CiPx5lC0An+W3lZMeYKh
 LipW1kYN9wR/g0jLsl570lfPSNyK7iqfAxdB01vEZbq3GYdm5JkweA57Ekr+mu/SzEyP
 1Qrg==
X-Gm-Message-State: AOAM530SU9YSbsAyJPKi8lZQ9hZU3mh0rXY3iEKvuFwjSPuTI0ZwGO5x
 1pgYHVA3FX3wdINpz8bH0Bcevw==
X-Google-Smtp-Source: ABdhPJxiD0XQ4iYeJdjwH+pdCT809jcMlYeS9QJJCeA1dn4+aT8l3d4hfno52/xSmDa7IX1TlI2qKA==
X-Received: by 2002:a17:902:c613:b0:136:5fc8:5372 with SMTP id
 r19-20020a170902c61300b001365fc85372mr4437797plr.41.1631221282174; 
 Thu, 09 Sep 2021 14:01:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/15] drm/edid: Break out reading block 0 of the EDID
Date: Thu,  9 Sep 2021 14:00:18 -0700
Message-Id: <20210909135838.v4.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4:
- "u8 *edid" => "void *edid" to avoid cast.
- Don't put kmalloc() in the "if" test even if the old code did.
- drm_do_get_edid_blk0() => drm_do_get_edid_base_block()

 drivers/gpu/drm/drm_edid.c | 63 +++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..520fe1391769 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1905,6 +1905,44 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
+static struct edid *drm_do_get_edid_base_block(
+	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
+			      size_t len),
+	void *data, bool *edid_corrupt, int *null_edid_counter)
+{
+	int i;
+	void *edid;
+
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (edid == NULL)
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
+	return edid;
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
@@ -1938,25 +1976,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
+	edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
+						&connector->edid_corrupt,
+						&connector->null_edid_counter);
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
@@ -2010,8 +2039,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	return (struct edid *)edid;
 
-carp:
-	connector_bad_edid(connector, edid, 1);
 out:
 	kfree(edid);
 	return NULL;
-- 
2.33.0.309.g3052b89438-goog

