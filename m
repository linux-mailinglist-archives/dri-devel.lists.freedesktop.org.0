Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD61A4E36
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 07:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176036ED74;
	Sat, 11 Apr 2020 05:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD56ED74
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 05:41:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i19so3764489ioh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 22:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbhTq4qHCTksR6oQAJveSfFw7jxUl+wvefeSj00JCLM=;
 b=kzy2yr4Dmx9NuGCeaSsu2gzVwIJ2EHeCtmw1x9dUxPY1eA5JomXZVILNeOPEJqyZn4
 jHoiqFwE/DTPMFm/QecbFJqxy+HTUxQl/Z8Ht+OyYbHuppHrCoqqtiH+tthWu/mVKCe/
 r5IbpHgA80vQuvWB5wuVQK/DWhnzZmJECk0GyhQ6OlVVYB6P6TnlJ10YIPKlF5deUJng
 u+wDc0QnFJOk+AfJ0tJ4eFmBXJrtoHtQp2pW+DqM/4Ltb4uRgH4ZeNEvu4+dt3bKRP8u
 JZG0Az6O8HXo6eZ3T5tW4PmBxuDZZ+8kkItOrxbuNrwx2rvzt9LpgOZ8v3e1YKakbRh+
 Xxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbhTq4qHCTksR6oQAJveSfFw7jxUl+wvefeSj00JCLM=;
 b=AVPOTrQWMTgXax7Jcq1rlM9CwN+NFXvPCP/3lWGe/Nt0sWYc1cT7tdBTizVDfdzT6E
 cap1YVdhu6c7RW6W4d+Azkwj4J0IZOljLUQ+dsKHGjV+ne5HnG9slG6JB3IEQE8vB560
 MJL+KcY7oji0IwuF8Ou7HXNoowjB3/orx4iz0hzFjdb7UUeyIk2ov5ZrBQU9LL9zhiCC
 BrdwUYUj4GylrRxU/OeaXJRGuC5LXkn1N5MckLsp3Pb2PjRFaDoxMdIP17PY+/ZV/b1b
 Pxc127jLzZqVUU1XiPmddNQNvtleMQSeOAZbxsrhgGUICf7szV+dlhktAFD5ddX372rp
 kCQg==
X-Gm-Message-State: AGi0PuYBV7vV4/QRO+DX4plVD407EXY3352YvZC1qqme2aVk/Yl+n4mP
 PXA+zCRPNGo17ZyC5iitvXdNXZv2
X-Google-Smtp-Source: APiQypLqwxq/a73h8fxo8w3kbfd3+Vckw7Tzg5z7HxJi1eg50lKzsiGHM3926fu34oXzQTJg0F0sPA==
X-Received: by 2002:a05:6602:2342:: with SMTP id
 r2mr7285961iot.177.1586583708599; 
 Fri, 10 Apr 2020 22:41:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-253.hlrn.qwest.net.
 [97.118.146.253])
 by smtp.gmail.com with ESMTPSA id z17sm1469137iln.34.2020.04.10.22.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 22:41:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] component: Silence bind error on -EPROBE_DEFER
Date: Fri, 10 Apr 2020 23:41:06 -0600
Message-Id: <20200411054106.25366-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Hilliard <james.hilliard1@gmail.com>, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a component fails to bind due to -EPROBE_DEFER we should not log an
error as this is not a real failure.

Fixes:
vc4-drm soc:gpu: failed to bind 3f902000.hdmi (ops vc4_hdmi_ops): -517
vc4-drm soc:gpu: master bind failed: -517

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/component.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index e97704104784..157c6c790578 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -256,7 +256,8 @@ static int try_to_bring_up_master(struct master *master,
 	ret = master->ops->bind(master->dev);
 	if (ret < 0) {
 		devres_release_group(master->dev, NULL);
-		dev_info(master->dev, "master bind failed: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_info(master->dev, "master bind failed: %d\n", ret);
 		return ret;
 	}
 
@@ -611,8 +612,10 @@ static int component_bind(struct component *component, struct master *master,
 		devres_release_group(component->dev, NULL);
 		devres_release_group(master->dev, NULL);
 
-		dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
-			dev_name(component->dev), component->ops, ret);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
+				dev_name(component->dev), component->ops, ret);
+		}
 	}
 
 	return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
