Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1281B01E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1564B6E1BE;
	Mon, 20 Apr 2020 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A96ECB6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q22so5363934ljg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GmbaXDj6/A2yy3AR+sXi1M1Zh+o7hArk00ZH5b0F9ZU=;
 b=IQ9EFc/970LojBwLiW62BzGPBnOzmy32A9jVWoWDsei2DhVR8dy4ffZK8x9F8N/PT9
 wz+97rXX+dPMgbFLEKEgQdx3eKpfxvKbKVItMhwDIZZM4azyCyXkzGwkA1cOCVO16rZW
 ijs5x3KGwycbHCNqt377mxeBk5RpP4qSU/hhCb8VoluNtNwpdZk0fRsstUZ/wF6uSkIP
 cH2DfNt7s4OhUz9VQoicOILzpbPXRXEOJ9miVMZ9abM3msVEBkoUeDljv5312QK5ipCx
 mV4h5MQAtt6gTz0k6nhyJvwz5ONJBG8xfvHxyizNXWX3ekQx+Z2N98hMEt1qNfcYdgBC
 FlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GmbaXDj6/A2yy3AR+sXi1M1Zh+o7hArk00ZH5b0F9ZU=;
 b=K880XfWuQMtgMYVwwL0DJvxjW40d2KZLu233Kv9Y/nagrP2Gz4jzyVbOcp9d1aQaXt
 HIp7i8SghK25alObVSEHvbD4tTJEnJuAAhY1QxVrTM2CXJGoORX0OkI7M0ZmNNAaG07k
 kNEuJakUNamt2eusVp5Lgt6foTyFvQ5RiPuDFv4n/iNpVlkDE43oJjON4Oackt7Na58c
 +eAA1cNEbaeSeLSmz1pjwMSHm5gQtTmw+wqNdjJDPYPikAy1KiekOE0S9EBji84DsXzX
 aEQWrs1wwEp60gh1Oobe46AvqM/1fS2Pf8sva9WpiZI2qoHcVBinryAM+oSELQSIEEmH
 4mfw==
X-Gm-Message-State: AGi0PuYc+N7X6BNd++XXUtfdSQks1src1RFaAgCZoKH/sqrQhu9VE8Qs
 /taHXWc2J5xZLBQxExyLIdY=
X-Google-Smtp-Source: APiQypJZeGBXci/SYfTR0hCgDyYACwvrJkNlkiEL97tY/h/8Q5HyrC0kRIAH1vune5hFb+wviydGyw==
X-Received: by 2002:a2e:9a4c:: with SMTP id k12mr5235920ljj.189.1587229639769; 
 Sat, 18 Apr 2020 10:07:19 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 2/6] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Sat, 18 Apr 2020 20:06:59 +0300
Message-Id: <20200418170703.1583-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When graph isn't defined in a device-tree, the of_graph_get_remote_node()
prints a noisy error message, telling that port node is not found. This is
undesirable behaviour in our case because absence of a panel/bridge graph
is a valid case. Let's check presence of the local port in a device-tree
before proceeding with parsing the graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index b50b44e76279..e0652c38f357 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -239,13 +239,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge)
 {
 	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
+	struct device_node *local, *remote;
 
 	if (!panel && !bridge)
 		return -EINVAL;
 	if (panel)
 		*panel = NULL;
 
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check presence of the local port.
+	 */
+	local = of_graph_get_local_port(np);
+	if (!local)
+		return -ENODEV;
+
+	of_node_put(local);
+
 	remote = of_graph_get_remote_node(np, port, endpoint);
 	if (!remote)
 		return -ENODEV;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
