Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321416FE1FC
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709B810E4D7;
	Wed, 10 May 2023 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882110E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:58:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 121E5D3102
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:48:13 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA6E3C000B;
 Wed, 10 May 2023 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1683733689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiIl6qNilxI/2RMNtfGSfbFmkF8Ao7IWY//F7MAhvic=;
 b=Pu/WyXGfzdCJsrmdb5oy8iGLmhu5ui/4pT0SytexaZmI/s4yZRRNG5oiAo6Hsy7uTKPE6s
 VNX9AuNiDlfNYJULsgEMGfR/K+crTTQVolBSzasPXilC7nEweltsmAsq/CyriYhIBoK085
 vfJf3I5J0xJ8sW2S7X7cI7KuHf/2ZNG0K2/IYu/l/XYg+GXjoXdrIqoUBDQuIoAL4Gy+39
 6IbNTbR8nWI3YIbqwMOqDpbFzlo/RKt5eqiwGnJGmywyrWeY7xa42pfjiq9PHr2pIfZ4XV
 fxqZ5euP0ZvHd8VMEB3OLO3Tl1xy8/IF7N/IxM4xTl9VBxdTYgH3zeI/HHMG/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/5] of: module: Export of_uevent()
Date: Wed, 10 May 2023 17:48:02 +0200
Message-Id: <20230510154803.189096-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510154803.189096-1-miquel.raynal@bootlin.com>
References: <20230510154803.189096-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The content of of_uevent() is currently hardcoded in a driver that can
be compiled as a module. Nothing prevents of_uevent() to be exported to
modules, most of the other helpers in of_device.c actually are.The
reason why this helper was not exported is because it has been so far
only useful in drivers/base, which is built-in anyway.

With the idea of getting rid of the hardcoded implementation of
of_uevent() in other places in the kernel, let's export it to GPL
modules (very much like its cousins in the same file).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/module.c b/drivers/of/module.c
index 874f3fb8220f..8b402a716951 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -132,6 +132,7 @@ int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_uevent);
 
 int of_uevent_modalias(const struct device_node *np, struct kobj_uevent_env *env)
 {
-- 
2.34.1

