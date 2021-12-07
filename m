Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965DE46B29E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 06:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE017AEF0;
	Tue,  7 Dec 2021 05:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968DA7A4D1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 05:49:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id x7so9501933pjn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 21:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oI+jB1Oj81gXS93Xi29AaslGAFYJbNNV4lBDuspdSkg=;
 b=aD7fgD5LTK8MWJl4lGl9/zRHzyFMuYTjK9vhN/DHaxea9kN80NfS9CBIiWBd2QF0uj
 /OFuKR87C0jT18REyVVVYFBTuHbQUprfLfQJ7I84hDzDCB82OKlc8nQp6pKkWXESNOwo
 tkd9A3NCuRXTQ8UP/yjWLJOfIk9Y6ENffTUGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oI+jB1Oj81gXS93Xi29AaslGAFYJbNNV4lBDuspdSkg=;
 b=kuBPdp+pUQUORGdXYrGU1vJew8PPB4GMEJQkPGGJO/n5aFe+2F4bNns9g6kDvdsdXM
 US9NjMMszEKW8WkcD6gV3PmXHI4Dzp3JuW10YavvYOyOOdr8kUVdsgZ4lRxKVKrhnWQi
 17BWJi4CjUabUozk2/nBHoK2mvZuI6gci33qiWwPhWDetARkK0C6M8sp8KnS65Oix90p
 0ec9Dc3H1lQKyh0H2ju4JYFD3ecdykptHkHpHx/SrQG4Ga7s3BirvcDsrbd7iT8w3x3b
 9SO72PNRA8DFMPMxOG3ZiYwE8pJIuxflxUhiUm4x4sTTA79OzwnCuu9sYABU9g59h6sN
 8hjQ==
X-Gm-Message-State: AOAM533TLXDx/7izkrLeBhauYfxhEtspC5V+vDuBylql7/NUOsc17GOQ
 jdF0XHQ5E+qSqoz77TW1SVWOag==
X-Google-Smtp-Source: ABdhPJzqYAuDg9SPTB9iVcEKJRtHJqbkNJOZt+mrbWxaDzG706lJJJpliN0ULvEdQTq0pYRt1Ij2ZA==
X-Received: by 2002:a17:903:285:b0:142:21ba:2191 with SMTP id
 j5-20020a170903028500b0014221ba2191mr48896433plr.28.1638856161190; 
 Mon, 06 Dec 2021 21:49:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:ac1e:ca0f:5f0a:c85a])
 by smtp.gmail.com with ESMTPSA id f7sm14496352pfv.89.2021.12.06.21.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 21:49:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/2] drm: of: Lookup if child node is panel or bridge
Date: Tue,  7 Dec 2021 11:17:47 +0530
Message-Id: <20211207054747.461029-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207054747.461029-1-jagan@amarulasolutions.com>
References: <20211207054747.461029-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_of_find_panel_or_bridge can lookup panel or bridge for
a given node based on the OF graph port and endpoint and it
fails to use if the given node has a child panel or bridge.

This patch add support to lookup that given node has child
panel or bridge however that child node cannot be a 'port'.

Examples OF graph representation of DSI host, which doesn't
have 'ports'

dsi {
	compatible = "allwinner,sun6i-a31-mipi-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	port {
		dsi_in_tcon0: endpoint {
			remote-endpoint = <tcon0_out_dsi>;
	};

	panel@0 {
		reg = <0>;
	};
};

dsi {
	compatible = "allwinner,sun6i-a31-mipi-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	port {
		dsi_in_tcon0: endpoint {
			remote-endpoint = <tcon0_out_dsi>;
	};

	bridge@0 {
		reg = <0>;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			bridge_out: port@1 {
				reg = <1>;

				bridge_out_panel: endpoint {
					remote-endpoint = <&panel_out_bridge>;
				};
			};
		};
	};
};

dsi0 {
	compatible = "ste,mcde-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	panel@0 {
		reg = <0>;
	};
};

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/drm_of.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 59d368ea006b..1c4cb809d7bc 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -249,18 +249,34 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (panel)
 		*panel = NULL;
 
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
+	/**
+	 * Some OF graphs don't require 'ports' to represent the next output
+	 * instead, it simply adds a child node on a given parent node.
+	 * Lookup that child node for a given parent however that child
+	 * cannot be a 'port'.
+	 *
+	 * Add precedence to lookup non port child as of_graph_get_remote_node()
+	 * returns valid even if OF graph has 'port' but that OF graph remote
+	 * node is not register panel or bridge.
 	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
+	if (!of_get_child_by_name(np, "ports")) {
+		remote = of_get_non_port_child(np);
+		if (!remote)
+			return -ENODEV;
+	} else {
+		/*
+		 * of_graph_get_remote_node() produces a noisy error message if port
+		 * node isn't found and the absence of the port is a legit case here,
+		 * so at first we silently check whether graph presents in the
+		 * device-tree node.
+		 */
+		if (!of_graph_is_present(np))
+			return -ENODEV;
 
-	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (!remote)
-		return -ENODEV;
+		remote = of_graph_get_remote_node(np, port, endpoint);
+		if (!remote)
+			return -ENODEV;
+	}
 
 	if (panel) {
 		*panel = of_drm_find_panel(remote);
-- 
2.25.1

