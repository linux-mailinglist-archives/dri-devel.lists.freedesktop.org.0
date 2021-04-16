Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABE3362B4B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88FC6ECE9;
	Fri, 16 Apr 2021 22:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9966ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id v13so1139229ple.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2R2klhddf27fuauW3a9nuHGD7igaH//2CcQFXLlNraQ=;
 b=W68GHyvEpfO1q+3/O+WzdKvd5+OcVSwuE2lSZnkb74+WZqEEFrJnB442cV84JtH+gu
 ZZ90g6ROhJkBSzon9lsybQgkpuIcwXmRoe25MxkBJouMalRGkxewvuR0YlQ02ZoyH8a9
 hXau4cSfmaZNUzc3qyclV54Cs/OjcfmNE+vX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2R2klhddf27fuauW3a9nuHGD7igaH//2CcQFXLlNraQ=;
 b=qxMu7F+uEmiSRRmF3nFO414yQkfiBDEGQMR5Vy4+/d9RPnZD8UFnaFBjN1NYS2M1L2
 aEu+S5M669BmUKLH9JCaSUUIZ2Zo10PFwSL8cGKvd8qhnpf7q+rbp8GCJLSj+QEPeAv1
 coptMKImW6pjHFzqF8xgMZy3L3K322f5Qhi/cF9qLIlTF47zATj8RqUs2NDu1d8j7POE
 hNh7v1nKUPMyWV8/YcOQ0tORrdIoD/f0ZgM8ZvLAMb8wUhR7KEnb32ZGAKz1BhiQLr9b
 RxpZyyS2X0OSg4h78AeT+rbd8L0mtvL5YUimrzt4JSEwofa4JcvIR1A4xUfA7t/5+GiA
 Lq4Q==
X-Gm-Message-State: AOAM532dIHyGuui8kLkCJdBDGXOpC8zF4aXO8mMV68cffeQZDxPlI3Av
 LO/itsSZcjH0UbhPVDWUNA8Dxw==
X-Google-Smtp-Source: ABdhPJxm/SGUjFbh2/Xar7kdscd7cloDi3lndIKr2gslRNxF3aW7sbGnW3Vz+p2KOu0HjBZz74eitw==
X-Received: by 2002:a17:902:b494:b029:e7:36be:9ce7 with SMTP id
 y20-20020a170902b494b02900e736be9ce7mr11598042plr.43.1618612864099; 
 Fri, 16 Apr 2021 15:41:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 10/27] drm/bridge: ti-sn65dsi86: Clean debugfs code
Date: Fri, 16 Apr 2021 15:39:33 -0700
Message-Id: <20210416153909.v4.10.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's cleanup the debugfs code to:
- Check for errors.
- Use devm to manage freeing, which also means we don't need to store
  a pointer in our structure.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 57574132e200..0c6aa99ddc99 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -118,7 +118,6 @@
  * @aux:          Our aux channel.
  * @bridge:       Our bridge.
  * @connector:    Our connector.
- * @debugfs:      Used for managing our debugfs.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
  * @edid:         Detected EDID of eDP panel.
@@ -146,7 +145,6 @@ struct ti_sn65dsi86 {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
-	struct dentry			*debugfs;
 	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
@@ -245,18 +243,30 @@ static int status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_remove(void *data)
 {
-	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
-
-	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
-			&status_fops);
+	debugfs_remove_recursive(data);
 }
 
-static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 {
-	debugfs_remove_recursive(pdata->debugfs);
-	pdata->debugfs = NULL;
+	struct device *dev = pdata->dev;
+	struct dentry *debugfs;
+	int ret;
+
+	debugfs = debugfs_create_dir(dev_name(dev), NULL);
+	if (IS_ERR(debugfs))
+		ret = PTR_ERR(debugfs);
+	else
+		ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove,
+					       debugfs);
+
+	if (ret) {
+		dev_warn(dev, "Failed to create debugfs (%d), skipping\n", ret);
+		return;
+	}
+
+	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
 /* Connector funcs */
@@ -1310,8 +1320,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	kfree(pdata->edid);
 
-	ti_sn65dsi86_debugfs_remove(pdata);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	pm_runtime_disable(pdata->dev);
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
