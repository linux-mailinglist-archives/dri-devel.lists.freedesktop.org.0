Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBF14213F6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDDA6E1C0;
	Mon,  4 Oct 2021 16:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17C6E1C0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 16:22:09 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id ls18so1820843pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFpFWPozOzmy1DYe8ZLU7j6QoXqHuTATAw+aImmNdlM=;
 b=jYaBj98wBy8NWMsSZogOXvVs5ZrmutlaeeQHykTZuMA/iEJvsrJTzKqDAIVPtzQRJX
 a2XM+P0+y5KIzZ87gXb63Tk+KiB53e4xf5PVZFTFaQy3rIPYKm8Kx2LYuodD+EFSu7Yr
 fHGF4ijZW8+zjdGbtmBo0qAleKuiyQJsFEJws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFpFWPozOzmy1DYe8ZLU7j6QoXqHuTATAw+aImmNdlM=;
 b=5HKXwHXKOiA+FKcyTfrxv6Z7Y4gmvYV5SKry0a3GmFBgruAPkFUHZUZKrQa7FKc2Zy
 K6hm3ytacMB1x1rNii+XaBnELOgg7RRhSudceMdhdB8iegXVRO5hQwh+tE8a1oIZnh+8
 qsMnAUvmwOqt1ZM8ol1k1gueBj8Zvok2DH93j/vQ8kdN9LDdRny40SKNUBV4hJcqnwk/
 RdhLr6mJqAan6MtJTM1AvrAu5SGF7naEbOIrL362qguWOr4RyK6hfWL2UnDuPA4TzMYa
 3ka9PoAw8TnL9zXCOo5oqcva0E9nWi/SDFXGYDP2LIIX9boSnBsafDXdXZwqlcsDnwOb
 CPfw==
X-Gm-Message-State: AOAM531aDXqCZwn1oDipyIypuoSAfj9BLuUoG14e6jGlQhZ5OMw0Bs+r
 qm7nSq2spxviNMbBqrwgptsO7eSmNqdRDA==
X-Google-Smtp-Source: ABdhPJyZp0tzYGkW5Se1POV4ouM3VXk0hM9wnbQTUnbk89IdzQNv6XhqoWjTDpDMwqUtpEQMHE/eLg==
X-Received: by 2002:a17:90b:1806:: with SMTP id
 lw6mr25650086pjb.222.1633364528836; 
 Mon, 04 Oct 2021 09:22:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5ca5:f2e1:5fdb:e20e])
 by smtp.gmail.com with ESMTPSA id w5sm14334476pgp.79.2021.10.04.09.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:22:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: geert@linux-m68k.org, oliver.sang@intel.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: Fix crash with zero/invalid EDID
Date: Mon,  4 Oct 2021 09:21:27 -0700
Message-Id: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
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

In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
the EDID") I broke out reading the base block of the EDID to its own
function. Unfortunately, when I did that I messed up the handling when
drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
when we went through 4 loops and didn't get a valid EDID. Specifically
I needed to pass the broken EDID to connector_bad_edid() but now I was
passing an error-pointer.

Let's re-jigger things so we can pass the bad EDID in properly.

Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
Reported-by: kernel test robot <oliver.sang@intel.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9b19eee0e1b4..9c9463ec5465 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1911,13 +1911,15 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
-static struct edid *drm_do_get_edid_base_block(
+static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
 			      size_t len),
-	void *data, bool *edid_corrupt, int *null_edid_counter)
+	void *data)
 {
-	int i;
+	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
+	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
 	void *edid;
+	int i;
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (edid == NULL)
@@ -1941,9 +1943,8 @@ static struct edid *drm_do_get_edid_base_block(
 	return edid;
 
 carp:
-	kfree(edid);
-	return ERR_PTR(-EINVAL);
-
+	if (connector)
+		connector_bad_edid(connector, edid, 1);
 out:
 	kfree(edid);
 	return NULL;
@@ -1982,14 +1983,9 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
-						&connector->edid_corrupt,
-						&connector->null_edid_counter);
-	if (IS_ERR_OR_NULL(edid)) {
-		if (IS_ERR(edid))
-			connector_bad_edid(connector, edid, 1);
+	edid = (u8 *)drm_do_get_edid_base_block(connector, get_edid_block, data);
+	if (!edid)
 		return NULL;
-	}
 
 	/* if there's no extensions or no connector, we're done */
 	valid_extensions = edid[0x7e];
@@ -2142,14 +2138,13 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 	struct edid *edid;
 	u32 panel_id;
 
-	edid = drm_do_get_edid_base_block(drm_do_probe_ddc_edid, adapter,
-					  NULL, NULL);
+	edid = drm_do_get_edid_base_block(NULL, drm_do_probe_ddc_edid, adapter);
 
 	/*
 	 * There are no manufacturer IDs of 0, so if there is a problem reading
 	 * the EDID then we'll just return 0.
 	 */
-	if (IS_ERR_OR_NULL(edid))
+	if (!edid)
 		return 0;
 
 	panel_id = edid_extract_panel_id(edid);
-- 
2.33.0.800.g4c38ced690-goog

