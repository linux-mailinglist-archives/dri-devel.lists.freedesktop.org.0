Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABE1F4F10
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1CC6E092;
	Wed, 10 Jun 2020 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465389F85
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:29:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x18so8559205lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyQqkmAqCRmhebVrr7VbOeFm0zvD99iAEoTluAvbJX0=;
 b=CIAk2MfPqSQmdCUuQCgNDKahaE/vsRM0XdOjTzVjv0eIHVz/7YGvl4ZBWOIsbIEiEp
 F0YWveupWoIbRDD0vm0jMMq24Im00dNFHkqoppPcK5wVvLP55rBx+pAdazj/QChMjIHB
 4BlGkOjESv0CkG1jnoLlAvYb19XndAFhH76io3uizAeHQ8VKuAVko6l+32vb/u8+nAT8
 j+JkxEo9B+NspuoZYh/QJ7WFn97Xk4QrZEeVo9strAmn9dMq9X8RweFSjAKVqFeLACGq
 1OAs5nu3f0wr/a/xzgAFp/pjwQvuSgZefIPRMfx5KaiIOi6O9zHLkRPQn9aWqhK6IRRH
 evXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyQqkmAqCRmhebVrr7VbOeFm0zvD99iAEoTluAvbJX0=;
 b=KPpsl9ACwW2fmgQLNyqBZsVY2RObdp6QwaJV0S0ZMuSP27bT3dtH81HGyV3I7PPdA3
 poDLO+TVJV6Q2N3ICrh6iDAmVJJlwNkycXiJq+3eX6Lo8aw7BPKS3vw3YH62bPUjBBFd
 RnxoDely7RCGBjzukuWtWP5pRVE8OYNUNI0ijwf8VdoiDAKVqHQnOCb0pteyStJ/RcNz
 7Fm+IwV2ofrFQgMKtwIqE4obM/pMJt/VI5UGhda9qbK/jJ9x4JBVZGDhfC8Gh8xV+zKd
 m1uRivt2KTJiXtdNc9H1xz0eeHcuItP6b53TG51dDqTLxgk+vXZ4ArbasP6sqSelwhU2
 SFLw==
X-Gm-Message-State: AOAM532JCjcgvYoVP8zHDI7jiKsnfrI2XiIgXRlsoNfVIMElvPkBc/rZ
 sTulrfA93VNg4vaXWFD7FnA=
X-Google-Smtp-Source: ABdhPJzbKrzIKoajQPdCZLcQ+VPt3ZjJhuXrc0D2alUYPYU30yDhBVt4EOUseD8KsWPRpYm4RdY4+Q==
X-Received: by 2002:a05:651c:54e:: with SMTP id
 q14mr12329916ljp.279.1591709352921; 
 Tue, 09 Jun 2020 06:29:12 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id s8sm5069821lfc.83.2020.06.09.06.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:29:12 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 2/6] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Tue,  9 Jun 2020 16:28:51 +0300
Message-Id: <20200609132855.20975-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609132855.20975-1-digetx@gmail.com>
References: <20200609132855.20975-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
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
