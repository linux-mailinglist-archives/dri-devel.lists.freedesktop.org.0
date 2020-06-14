Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025091F8FDC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1D6E2B0;
	Mon, 15 Jun 2020 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110C889E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c17so16383036lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyQqkmAqCRmhebVrr7VbOeFm0zvD99iAEoTluAvbJX0=;
 b=E7gvBJJiMDzQ/hN1Q+zOkceklOE1WVsx+l7Iy9oVFXo5YdbJGaqXM1qt5YZ3j3zBoY
 2JmV6Ixn9GR6yhMc8rvT1dcmt//FSyhkSfcqF1GebqLgCpUiZLapr6jsTRYRJTRq5d/C
 Z/HR33BZUAVEKxTTJs0RdooZEqN7qmnRgfJngaqFt6eEzh0F4qaKRJPSp61zuzhwCF0J
 1OwGlGBGStNgq2Qh39E0tSs83Jmil03qwcc6RJpD1uus/SQSm4UVPvfisEahbNDFaOp+
 HbW5eowMmTX36XcBG7Wdqhz0kOdKepyD3Rznmh9qZzafTkX2MVWIr6GcWMoclqep168B
 +EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyQqkmAqCRmhebVrr7VbOeFm0zvD99iAEoTluAvbJX0=;
 b=KQNVpnxlwgkOK2EzDebRfqiNrfY8Y8FrkaUcKqTt0KogY/J6wz0B6pXJMV1VRzwct3
 uLR9fUB/5rQPbjgvlyzOdIMZVjo6ZUkQJ4lB5fw0gLDlymTFayEUkzhZ3d+kNSRkiN0U
 SmjdE+n7vFG+uNjjy5Jv7aKcDgKY5uzQMXd4rkDYKe/4xTM5dfguyHXJkTAp1GBzQL9n
 uJeLOjHI562Nh153G1VxYr2qweIM3k+q9Gh0UAJGf1ZwB8XDtfHpsDJHZZTqbvIKOdm8
 KdbWeDTDkXlcuajVJUXsONIjuMxjKuS5V6xJr40SLQ4sMHdYzIAwg0TjopZdoplIpQ8p
 2ucQ==
X-Gm-Message-State: AOAM530YHib5QtH9zr5jdTCHSIHXSEepqAgou+WBupp5QnwvvwVMZVjK
 7wcSN/cB1bJKiZDNUa1/HYH67784
X-Google-Smtp-Source: ABdhPJxjKu9bib2Y/FR5d++QXjDAXCBR7MA6OqR8H3NBmnRWIAqCA7uBRZPeT0pH9/ki30A+N3Wr1A==
X-Received: by 2002:a2e:954c:: with SMTP id t12mr6303730ljh.287.1592155400529; 
 Sun, 14 Jun 2020 10:23:20 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 2/6] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Sun, 14 Jun 2020 20:22:30 +0300
Message-Id: <20200614172234.8856-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614172234.8856-1-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
