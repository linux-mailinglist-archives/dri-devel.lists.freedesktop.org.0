Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE63211CB1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964D16E51A;
	Thu,  2 Jul 2020 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7418388130
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:43:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b25so22177582ljp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vapTfDZ2f1tAvfpKmc+ZWDOZuBAyLK5G5gnKE1dsXng=;
 b=p2+CyBm3hryTHrZxURLXskWjQ/8tBPFEijkMuW7RW0ZeOWlUihpvWBa1f0/goGST4d
 /eeRaDMtMkY6I2Yx+CUMG1HaF9YPolELljK8KUxLZqnvpGxescuIgYoYrMsBENXKMnoN
 +DttfWVwAzh/o1j2XVIRrM8DxvRCnZAuO9a092SPAT4IztiLlF13xo+iHk1prupsrHi+
 I2YLTgUM4mUfmsN+P66YuZb6qJc/dN7fZvl0DbCHQHJEq1RujEWdiZ+xRmn1/nbTGcco
 8vdwMsb3m4SHR2tOaLylWAj9buhyOyS/jhoe7ZTXGZfFZ38GdmLpeWaZ4uiKw7RsqeyU
 BeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vapTfDZ2f1tAvfpKmc+ZWDOZuBAyLK5G5gnKE1dsXng=;
 b=DovR9gXFfyIyGnZuuZIeJp4jQjlo8AC3vWjXG8BBHgCYh8rExgi3pOBTI2QX74Og+5
 l0o2iQEIikxGIi3KbUErV6taTzWZkn1LumiJfwoZq3urJrV7qXTgJctrZeqQYUpKQCWu
 Bghe+bDlwymq7dyk2Za8upQpjaaM454a1ixP5drcgUt+xdnoCkLtQwl7R4IaLRLR/7G0
 QZyTBvtAGTndf/+eK6IuGtB4AC6SW87r67NIVmq5I3DfzBaWJG6EjDwujo1xd3pCipX6
 7g0ucB8fZinKKkNkiFRZf0gVNFhTmFUhI+6eXAKxhFcbGGQBIvVsWEZsV0wxeSqVAByp
 Ohyw==
X-Gm-Message-State: AOAM532BFCsGfG3b+vGo7LbiBqn3Biy3x5uS3QX8JD1vd3XWeiZx5K1G
 m/Pa8s9agUE/v4+UGBtWy28=
X-Google-Smtp-Source: ABdhPJzQnoAy8VMG2guQ6rxw3JWQlodP3SToyfFNxeaRO3AZp9mee0BT7uQeSlEZTyyS++KM44v1lA==
X-Received: by 2002:a05:651c:1057:: with SMTP id
 x23mr11651351ljm.116.1593589382903; 
 Wed, 01 Jul 2020 00:43:02 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e10sm1520881ljb.118.2020.07.01.00.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:43:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v10 2/2] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Wed,  1 Jul 2020 10:42:32 +0300
Message-Id: <20200701074232.13632-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701074232.13632-1-digetx@gmail.com>
References: <20200701074232.13632-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
index b50b44e76279..fdb05fbf72a0 100644
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
+	if (!of_graph_is_present(np))
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
