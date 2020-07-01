Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4052104B4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101186E81F;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86F6E3B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:16:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t74so12671827lff.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vapTfDZ2f1tAvfpKmc+ZWDOZuBAyLK5G5gnKE1dsXng=;
 b=XwBpvJCtsnnsnuaueMAfzetWsRY7ZOzou4jP71fGDWF3pG796loCN0qXhchF2sgu84
 edWAmjAvruo+Bs0X8kE5aDgm7DD2IzGRyhEn66nySzPGXYTgAu331v/qx8sx0mv03iFV
 sdQtshunNKY9AYMqCIZrfxtMv+N1zXb29khQh5iJo8DEf9ZfEXqMjTGqawmDqwh+JB1E
 ZKz84KGiwitlYGRQ7OyP1Knp+MMRs3jKRCPiE1dQWOINtvy4os+twMHyAfg8OAohSJwI
 pLnP0JvMUjxvtYIiAyMeHVqofEI6cEwhkPc6anWD8ODFk5KdlbA1C9pI88zjI3teKNpK
 RIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vapTfDZ2f1tAvfpKmc+ZWDOZuBAyLK5G5gnKE1dsXng=;
 b=FRrcC6TDBPECMRSfgOOSLZQ374LlV30e1quFgOi+r1M587ebAN6YPxHgqtWkW5t2Mk
 PEG3ngbL9uHC3EvPKyHgbVmFr07Z0Yj2ufiw6b1qrYHpjLgKFHWt4c/BHfinI6X8/WnU
 vGGOEWdZpaf4OlkG+11vv3p7aU7VraDC1g6nCmi7PSLYndSRCwwwSHJ128myDg5NLug4
 DLY+ncnCcvbBkOqGOpG+897m6bNhqfdBZVTIST7XoPJpEotM3q3BOwgL2nsKHWxXfPq0
 Awo0Y3yqpG1L41/9hOAiMLIJLBmKuoPWmdLEb8FR+BbXfSgIq6dpxlRWxjxL8rxqdEh5
 lSTQ==
X-Gm-Message-State: AOAM532/Dc/25NSxZb6HGeujBSdLI9JoPvIg8HwLgL6KmgElPOdESpCQ
 Kua14lp7aPWVoveh1LjAQdI=
X-Google-Smtp-Source: ABdhPJxhbSKKq0FhmJrE9dy8QVFhZlrI2NTNt76+0Z8xz5UeHKJ8xcWUitnVVvXISrjygrzzMjHiVQ==
X-Received: by 2002:a19:f20a:: with SMTP id q10mr13842463lfh.89.1593569793367; 
 Tue, 30 Jun 2020 19:16:33 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id i2sm1296892lji.59.2020.06.30.19.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:16:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v9 2/2] drm/of: Make drm_of_find_panel_or_bridge() to check
 graph's presence
Date: Wed,  1 Jul 2020 05:16:17 +0300
Message-Id: <20200701021617.12030-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701021617.12030-1-digetx@gmail.com>
References: <20200701021617.12030-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
