Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B01FEC47
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48B6EB1C;
	Thu, 18 Jun 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A446E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:27:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so4856554ljv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2TQMn0dQ091Nqq+EmKWvf4EfULgSTe0SpqhYi3GcPk=;
 b=isbpr2SxlqW0J3J2CicBxq53fq28gMmg7YC/eQiXUTn9g8m1Gd6Or6C46Ub3yzaEPf
 BcvWGAqobcTCh3f4tPMWdWA5ME0RP5TJ/6+67rSMdNS5OTaIYhuE2RrZ5cFC8havF97R
 duxVfwbCfPK40vjgiyD7IodPZS4NJ0Ngbe4qBkzSovstySRusBj7BsUNLLw4my3yrnSu
 tc1sF0fwqJgDMlfwGql3o0WQmtsDmtjsXFFA2Yk3SzBQDfj21q4KL4adVx+IOSlLguQm
 FBeDVj8+86w0ZVNsJqIaJD7OTEhUItm7Zw3z94Bft5UE1kuH3XHlkDux1vIZr2AQJ3Gh
 Qxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2TQMn0dQ091Nqq+EmKWvf4EfULgSTe0SpqhYi3GcPk=;
 b=Bug03G/RB6e7Ma/D1Y5NoWRDkS+BeqVChzCCIhpnOIvVH886vig9neXHbFwRpVxs9a
 v5Ht0y25Kceg8dw4O7S/ezSmx9cQ5lc4RCBHbhJmpUf4khxqdsD0o009xJFv5VZrz0d9
 nY0gB2KpcY+3XjlRpY9VQ8NungCGpbI8JYRqP94oiRlHlw2WXpLHMa1PpwkPfe030gJJ
 GcLvfCsjzUibCznml2ldDqTbznezlmdR7PFrHVHmYw2xgpdwSRKDSr8iv/MHrxiVp4sk
 VQ0v+0Ewzy3T6+c8YUIljs5v05R8IMja+cYygBQTtClM8kxouInjxDPCAIT89z2GE7mt
 A/3w==
X-Gm-Message-State: AOAM530YfbZy5+DUTAKwc6JeNVW7gFkE6vNwrxKPfmw57o8FAJeEeTTj
 m/L8JIu3AxJokVy7CZf8Zz09C+MQ
X-Google-Smtp-Source: ABdhPJxKn69Kc7DDNBEVuTIu09JjZKMVsMFj3derjbFs4KULA24ehv/AJiph5bFIewzvvXMssVFclA==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr674285ljl.254.1592432876539; 
 Wed, 17 Jun 2020 15:27:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:27:56 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 2/7] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Thu, 18 Jun 2020 01:26:58 +0300
Message-Id: <20200617222703.17080-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
is a valid case. Let's check the graph's presence in a device-tree before
proceeding with parsing of the graph.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index b50b44e76279..cbe65efdae39 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -246,6 +246,15 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (panel)
 		*panel = NULL;
 
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_presents(np))
+		return -ENODEV;
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
