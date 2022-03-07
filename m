Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078924CFEF3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 13:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60510F0C7;
	Mon,  7 Mar 2022 12:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BF910F0C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 12:40:03 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id z3so5154273plg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 04:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=dHsR3ao0+xiXYz+qySp/eO6Jeo43rF2+fndDyCDm5CI=;
 b=Rc0lOw3FgFRLAsd7u/DZJrhDJcbnYhMJ/edMTz2xVyQIeT0FJq00ihuiveFiTc8z1G
 iMfvs7k+Lw2IHVlSyq7jCRsbeTHobIFuiaEUPH0sYlNERgv/qTA+s5h/feUQVVammIqB
 jCx5gxtn0oICvoNEMKRnVgXMkKHJ6oW6Bb2VeJSOTd/Sovq6oyCc6y+Oqj3zzXX3v+UR
 R47BD4fM6PuDJtwYDSIV12jd8oSksmffC8nATaB3VogSj5Gk3PetfwqoRtbkb1H7yLHv
 tsWP8oZnkfxW8TNf8N/b8NFPdx2wmzKHhvyeir+LhwdAagZTpr9JcbUhL6/VX7znWUES
 bCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=dHsR3ao0+xiXYz+qySp/eO6Jeo43rF2+fndDyCDm5CI=;
 b=OLAMex2uKWfSmJQEvjQDuD1J6wUZoB8GeA+Pfm5kV9gW65BjEGWr03rzfc2Quu4rEU
 QiPYvI2FrHH6G4A8CeoqSf2x/yspoo8bqw8tE3Ns1Ru/JSN8gYRm65fqIHnqFCwZ8Lie
 LVuzH0GjlNZCvoQZmN+tjNhkrS3Ij6frAipLG/v4FYF6k1m8pAZQbIS/BKd2CPZh6f3n
 uwmcfSgkl8NMK9vlnXiX8zyty/kvT7GFzscQ89HR83K+u3oghw+O/ZVtrE+uPYfOgOEX
 OKDIFKH6gLef5uljMEiV/bg+YJLC9n0qyqSI5Eeef3D4ZtVy73Ak9kO0GzzX2vSNGb0v
 lnww==
X-Gm-Message-State: AOAM531+Jk2/3jgEuW5WXx/v1x5Z4l1cQJFcsqA2vtJHR8oUChm1uN1W
 yq33Rb+yUy4WPCMDj5oUMjc=
X-Google-Smtp-Source: ABdhPJznGIbMiQ2zK8bIDsA3ZjDX9lSU/OOB0ngOTGlZjuFIN3Qa4EfVixbTbjo+6MMS4ZEfjCq9ZA==
X-Received: by 2002:a17:903:291:b0:150:4197:7cf2 with SMTP id
 j17-20020a170903029100b0015041977cf2mr11633351plr.173.1646656803121; 
 Mon, 07 Mar 2022 04:40:03 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm4687093pjj.39.2022.03.07.04.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:40:02 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Helge Deller <deller@gmx.de>, Miaoqian Lin <linmq006@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Dave Airlie <airlied@gmail.com>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] omapfb: Add missing of_node_put() in dvic_probe_of
Date: Mon,  7 Mar 2022 12:38:12 +0000
Message-Id: <20220307123816.31888-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
index 2fa436475b40..c8ad3ef42bd3 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
@@ -246,6 +246,7 @@ static int dvic_probe_of(struct platform_device *pdev)
 	adapter_node = of_parse_phandle(node, "ddc-i2c-bus", 0);
 	if (adapter_node) {
 		adapter = of_get_i2c_adapter_by_node(adapter_node);
+		of_node_put(adapter_node);
 		if (adapter == NULL) {
 			dev_err(&pdev->dev, "failed to parse ddc-i2c-bus\n");
 			omap_dss_put_device(ddata->in);
-- 
2.17.1

