Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA077350147
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B036E1D6;
	Wed, 31 Mar 2021 13:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7756E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:33:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z2so19707078wrl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2rYQv8UMxtthDH+iX/JM/A5G1eiIfqfNLQuBKpJ088=;
 b=eixBvlLigVIMl6bR9qxr3oF+b/gheT1yoa3niB/ggkcsPdbQIjr81HrwEFwKvv/wmu
 bRz+Zl6eQ8A8T8gSxy2qCG91gtWR0JedbnghZ3e41ELPJwC7vJqf1p0CXwASQ+FA+58x
 WEgrgOq2uJvNCiofjEbK0SLTp+Hum31Re95tQLbxpuI1uG5nvAvBoIImhb4ASHMFlGPL
 8bKhXTRFMppTHNF/B/IN3wOF6q60pUlPS15AAk0vMaJgqM0RWQu21LiPY0gs2pyTqKP0
 u562PjMdZbAgr/vg3/KcpOhXOLo9iR+sNNOEHlq1d2ftVyCzAmAStr2VTMf2kAkFx1YE
 i4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2rYQv8UMxtthDH+iX/JM/A5G1eiIfqfNLQuBKpJ088=;
 b=PWGuSRVhQKszQk9t0FPkf4WXG1PaEQ2ZwDwn66gHEH8ooTdLSCa1izDbFxBdDCx/sF
 Ugg/x0OY4eK9l+jc+pUM9hNWgPBqxCguXXDs4z0kkVkWn/biB8/X44HeS9kIN31ntJpr
 807LwdxaN01IcshtiPOOZsYcQPnwa7enXI/Uqt2y9Na8ExMFAfFlag4FYUHuLSuVMcgg
 6JogWEKFGwp0oEOYLDHAtSvMKD4mzujXlRZ7TTWmn6rjkJ9x4L1SYWKMHEMwRXThajQm
 /R7coyqruT+XdpNsJsbwlDox8fFyLVNBUFLHtCT7BOoVCqfjjfrX4mSRZmHlAmtNXtIL
 kw1w==
X-Gm-Message-State: AOAM533xMmVIY5cz5uHyMcyRLgPyxTOSiD1/SuYqbykG7rBbXAlcg3Xv
 cXcmeIivCctl8IByI5Kg0uA=
X-Google-Smtp-Source: ABdhPJxDpIhTzDNkKM66NUjo2v52dU752KEJd0uK6yh8Mg2j4hebMickhDv3hXVlapaoodrs6Hx53w==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3740330wrn.17.1617197596597; 
 Wed, 31 Mar 2021 06:33:16 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id i17sm4567100wrp.77.2021.03.31.06.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 06:33:16 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v5 1/1] drm/bridge: lt8912b: fix incorrect handling of of_*
 return values
Date: Wed, 31 Mar 2021 15:33:13 +0200
Message-Id: <20210331133313.411307-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331133313.411307-1-adrien.grassein@gmail.com>
References: <20210331133313.411307-1-adrien.grassein@gmail.com>
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
Cc: a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 dan.carpenter@oracle.com, Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A static analysis shows several issues in the driver code at
probing time.

DT parsing errors were bad handled and could lead to bugs:
  - Bad error detection;
  - Bad release of ressources

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Dan Carpenter  <dan.carpenter@oracle.com>
Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 32 +++++++++++++-----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 61491615bad0..55d8aa22c882 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -621,7 +621,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 {
 	struct gpio_desc *gp_reset;
 	struct device *dev = lt->dev;
-	int ret = 0;
+	int ret;
+	int data_lanes;
 	struct device_node *port_node;
 	struct device_node *endpoint;
 
@@ -635,19 +636,21 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	lt->gp_reset = gp_reset;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (IS_ERR(endpoint)) {
-		ret = PTR_ERR(endpoint);
-		goto end;
-	}
+	if (!endpoint)
+		return -ENODEV;
 
-	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
 	of_node_put(endpoint);
+	if (data_lanes < 0) {
+		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
+		return data_lanes;
+	}
+	lt->data_lanes = data_lanes;
 
 	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
 	if (!lt->host_node) {
 		dev_err(lt->dev, "%s: Failed to get remote port\n", __func__);
-		ret = -ENODEV;
-		goto end;
+		return -ENODEV;
 	}
 
 	port_node = of_graph_get_remote_node(dev->of_node, 1, -1);
@@ -658,24 +661,23 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	}
 
 	lt->hdmi_port = of_drm_find_bridge(port_node);
-	if (IS_ERR(lt->hdmi_port)) {
+	if (!lt->hdmi_port) {
 		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
-		ret = PTR_ERR(lt->hdmi_port);
-		of_node_put(lt->host_node);
-		goto end;
+		ret = -ENODEV;
+		goto err_free_host_node;
 	}
 
 	if (!of_device_is_compatible(port_node, "hdmi-connector")) {
 		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
 		ret = -EINVAL;
+		goto err_free_host_node;
 	}
 
 	of_node_put(port_node);
-
-end:
-	return ret;
+	return 0;
 
 err_free_host_node:
+	of_node_put(port_node);
 	of_node_put(lt->host_node);
 	return ret;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
