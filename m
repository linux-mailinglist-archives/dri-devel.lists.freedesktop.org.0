Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C29213FF3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3119F6EBBF;
	Fri,  3 Jul 2020 19:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361466EBBF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so38141503ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ObiJeIgdv9WzwB+UhsBPZAoG1cdWF1/TS/yoSc5/2o=;
 b=ha/LA9jWYLfHjypVxguJPj2Ytf4A9jmeF/D77ikcfVEeY0halDbQRADS9KuWMa/6NB
 pWkc4WgMkj6CmUdbCPcSdX94cZ2K4Gt8zTizYQKbN2BSb2LWakt6K47jow+UzWly5bFD
 jkpJnEal07NVCAfqsoq95xJnSTG/teFFoJOf/+clpJ76nCtwjkKtIfbPGqTwPqwF6E+Z
 OkUPDJ1k4f6QddpfuKh8qaQkJp4E3Wbva/89QsJ5oJnIDF0E+LLAG+pjSF+tr+tRTV53
 H+dB8tDl1qdZlw5lyNk5bx9BvDd++az50n57M+kbDmzaFqe3rnygsyH6jZUNgeOOyVIv
 YxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ObiJeIgdv9WzwB+UhsBPZAoG1cdWF1/TS/yoSc5/2o=;
 b=rwJ9MKva9AfeGK82j4wVGs2p4JZ5Xz9LLlVugM5XkRKYvr0UWy3GTH2WUeJb8myVOp
 e0oJxzQnxWs8tRWnoNpg0LaPqQZEBcAwowRBERSwtfSByGm6JJBX2P1XaoYsQjI5JjzL
 6ZGBROrl+StHePJNd3fp2ObSiced9ALzOm8SbjWYdrWgQHhcSOjUojPJ5SKtrvhTCn/r
 ouBeLlWblWoUteYNRjfmi/5fFwhEE4DP3/z+zSDiETIKgy5P/+Fyq3egWDAuDoZHOlBl
 fH+xkxAOuGnDGvbt9QfUvgXyZoTxAUHapO5jnli2v0p1kg79kthD6kf6beOoUPgY1Q6s
 /Zxg==
X-Gm-Message-State: AOAM532/HRV1eO2H37roP/1hcBXdXkGTrQVchhw8kWneCHBZp6Bo+QhV
 0Mt1GFLJan80nPj6iG0H9ktWFmJfe0g=
X-Google-Smtp-Source: ABdhPJxZhWKyaTy4T1gJsIM/jLbEjXlB0cQcpDJLjwxeTqWLLg/BsotLDKyI07lgPsAgprUvgOtjYg==
X-Received: by 2002:a2e:9c95:: with SMTP id x21mr13741855lji.234.1593804281444; 
 Fri, 03 Jul 2020 12:24:41 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:41 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 16/21] drm/bridge: megachips: add get_edid bridge operation
Date: Fri,  3 Jul 2020 21:24:12 +0200
Message-Id: <20200703192417.372164-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for a chained bridge setup add support for the
get_edid bridge operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 78a9afe8f063..5f06e18f0a61 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -131,21 +131,29 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
 	return NULL;
 }
 
-static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+static struct edid *ge_b850v3_lvds_get_edid(
+		struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct i2c_client *client;
-	int num_modes = 0;
 
 	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
 
 	kfree(ge_b850v3_lvds_ptr->edid);
 	ge_b850v3_lvds_ptr->edid = (struct edid *)stdp2690_get_edid(client);
 
-	if (ge_b850v3_lvds_ptr->edid) {
-		drm_connector_update_edid_property(connector,
-						      ge_b850v3_lvds_ptr->edid);
-		num_modes = drm_add_edid_modes(connector,
-					       ge_b850v3_lvds_ptr->edid);
+	return ge_b850v3_lvds_ptr->edid;
+}
+
+static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+{
+	struct edid *edid;
+	int num_modes = 0;
+
+	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
+
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		num_modes = drm_add_edid_modes(connector, edid);
 	}
 
 	return num_modes;
@@ -270,6 +278,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
 	.detect = ge_b850v3_lvds_bridge_detect,
+	.get_edid = ge_b850v3_lvds_get_edid,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -324,7 +333,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
 	/* drm bridge initialization */
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
-	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
+	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
+					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
