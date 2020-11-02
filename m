Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E222A2BC6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C86E526;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89076E439
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:55:24 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 133so10502245pfx.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 00:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=R1wYyE+ffvxs4bCnVGwncv5nVBCP9InFyCF3KL3GlEA=;
 b=A5by00u83SRdB6pDDoHALM1n+9KiiJRO9b0qD0R/BD+YQV/uWmWeULDRoUDlOL+Vz/
 Tn08HR5JKMXiDgT3Eq7kExHNGa66VUp+A1lxhvt4KENJREsX+k/ZR7XOmGjEStd4baqA
 6C6Ycx0tJ6Clyvt7Vn1gHoxAptGYDe5qjIV+zGQxhAy9XAkmSdgPWMcF0NAYPYL6CmB/
 QMPb6r6tub67uScPs90AjMLUmqg9uSI3bugvT4McGPK8XZAa8GxUiGvvrkgq0I5Umo4Z
 dl+sa1bldXPzqCFNE2E62lvb0W41/EXl56nbMHHz4Yi2KZFVu3FmYXlckDae+9X+mM9M
 /oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=R1wYyE+ffvxs4bCnVGwncv5nVBCP9InFyCF3KL3GlEA=;
 b=XTgTR57uqbqMzknUK5R4bNJUYe9dlsnu1mBLa3oW0z3uJco60CaVTqpFauLXuvixOl
 wNjcQjDBuHzoSbdtTdk3tc0oD8dCYTYkmCxBMvP32jB/7NoW3wTVwC4djXQSsQid9YW+
 K5G4pm9RB/MoBQvXWMo5jcZQIGtMxX3DxlXCOaDEGRFDbZhMhwzlW56WTqb4sMQW539x
 m86pjx8TE4zCnKBgG4BL6tLHtvnuA8zEWzATeYurKfB/8Ag1NhKlLP70icQwhWEHlWs9
 DrpI3IG+doFf3jg6fL1+NGhpxEnPEZE+82DdvH+sta3yFgdy5YtwWATQzoX/+dTiq1Hy
 zYzQ==
X-Gm-Message-State: AOAM5316QOAzlmfseXFRGz57XdYX+U+MjrFf1wkW2PulSSK1NFcv7f01
 EY3bN73gGQoIjNZMjmOP+IXVcCyiYEA=
X-Google-Smtp-Source: ABdhPJwtdELFm9o893MMOfd4FwigdXvNnD3CKVXhgTuQZt6CHZVDtGgDf+djQjYNspocYbQhJLD+rw==
X-Received: by 2002:a17:90a:8007:: with SMTP id
 b7mr16598843pjn.84.1604307324619; 
 Mon, 02 Nov 2020 00:55:24 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id mg6sm11625762pjb.40.2020.11.02.00.55.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 00:55:24 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch,
 p.zabel@pengutronix.de
Subject: [PATCH] drm/panfrost: Add support for non-existent reset node
Date: Mon,  2 Nov 2020 16:54:49 +0800
Message-Id: <1604307289-32110-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yejune.deng@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some dts hasn't no reset node, is should ok.

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ea8d318..a982878 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -18,7 +18,12 @@
 
 static int panfrost_reset_init(struct panfrost_device *pfdev)
 {
-	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
+	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);
+	if (!pfdev->rstc) {
+		dev_info(pfdev->dev, "reset does not exist\n");
+		return 0;
+	}
+
 	if (IS_ERR(pfdev->rstc)) {
 		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
 		return PTR_ERR(pfdev->rstc);
@@ -29,7 +34,8 @@ static int panfrost_reset_init(struct panfrost_device *pfdev)
 
 static void panfrost_reset_fini(struct panfrost_device *pfdev)
 {
-	reset_control_assert(pfdev->rstc);
+	if (pfdev->rstc)
+		reset_control_assert(pfdev->rstc);
 }
 
 static int panfrost_clk_init(struct panfrost_device *pfdev)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
