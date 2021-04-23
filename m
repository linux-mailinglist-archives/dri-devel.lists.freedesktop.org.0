Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F27369792
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0626E161;
	Fri, 23 Apr 2021 16:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64B06E161
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id lt13so14570056pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdcpo4UqRlWs4ocPfX4snuIEGMWz2iUneYKWicWu5Ps=;
 b=UiXErXemW2Z1PCdM9rdxduLgZdKkZp2cJ5UTIOMhKS/ZBUmVIriOjKreGnp1xfCQs4
 vE7OR5LEr7+0PS3EtSxsnORGB1XnMRLhtR/hwozuWTiDGTDzBVc+Z7heZxAXehNhWWu8
 mitoDjp0bgrk9G2vLOxRD91XRxARy41wepVMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdcpo4UqRlWs4ocPfX4snuIEGMWz2iUneYKWicWu5Ps=;
 b=d+VZtfCFm/xO8ni4dQYppgH7Yzcz1ucCVlQCvt09D6VFNjnuMQejZKDshbBFWxC6vR
 7/VChGhAIJwU42ElS2jvTVdmfGnvtGi0N2h5daW2hq1z6iqBatPvMbNxtKUXxJiTafL1
 sFPorZTN7GfxiVywThtuTfLTVC/gY25ttwtSz9+rLUR/y5TzQ941768EbLajX/SEFuY4
 pSxTD9q2pnD8t7gb+r3vupbRtNKVw/mZdUFn8XebFfPLUG06eF0TEfTtGIV72fwYfMzl
 IrwXW4WEtpACdGJjZWK5ne1ByVrLsGj3hInsb5MMV3HdDF22Sepzut3RSaSClX2t/8Df
 WBbA==
X-Gm-Message-State: AOAM5324fChobb28gcVpIhJQmeYX8UfldSTyr6y57aMQSdHc9ej73ZQb
 +K0KCL403OtWRkhUqw0iGPTjZw==
X-Google-Smtp-Source: ABdhPJyAWKVmxvEi9reu/EoUqAW7KcB819hFWrr09EJVcKqxEtEvh/AuypvfPYDZ1yx6Fv3YxVpHEQ==
X-Received: by 2002:a17:90b:344d:: with SMTP id
 lj13mr6661098pjb.44.1619197185610; 
 Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 05/20] drm/bridge: ti-sn65dsi86: Clean debugfs code
Date: Fri, 23 Apr 2021 09:58:51 -0700
Message-Id: <20210423095743.v5.5.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
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
Bjorn: I left off your tag on this patch since I made changes compared
to v4. Can you re-add if it still looks OK? This is now ordered
_after_ the pm_runtime patch so I believe the ordering problem you
pointed out should be fixed as well?

Changes in v5:
- Don't print debugfs creation errors.
- Handle NULL from debugfs_create_dir() which is documented possible.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 44d8395505f0..8aa36074aab9 100644
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
@@ -245,18 +243,31 @@ static int status_show(struct seq_file *s, void *data)
 
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
+
+	/*
+	 * We might get an error back if debugfs wasn't enabled in the kernel
+	 * so let's just silently return upon failure.
+	 */
+	if (IS_ERR_OR_NULL(debugfs))
+		return;
+
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
+	if (ret)
+		return;
+
+	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
 /* Connector funcs */
@@ -1316,8 +1327,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	kfree(pdata->edid);
 
-	ti_sn65dsi86_debugfs_remove(pdata);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
