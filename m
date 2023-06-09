Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E043C729F60
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0E10E6CE;
	Fri,  9 Jun 2023 15:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98D110E6C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:56:39 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686326197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2D1UVa466mb6p7BhoBG3nxwbYR6HCIMlcrR96esoVk=;
 b=SoWNdJBXmqmt6caBgNd7PDmjUVLPB0TYS8ZCzW0abdzw50GOw2uMiSesmhm9E1lWzRaeB7
 H7wqMMm+BmjwKGywl/o5GV3TcI0u8BNaEV2xN/wEjmIw54TFaKb54GfIxqqJvIa9SxRH47
 VnVbyUP+5hFFP3ehKQDoCIZ+UV2p410QrPacDahIy87t5QkQgHxihmLSJInaCD6dLRQrVE
 t+8myaOAoz3kImvhQtZwHjSYIOtzntiC0zd4p+BtEWKdF14UDKYxyu92dk+YAJpcUHQCft
 2ijBT7HhKG89RkmSnYeeSxelNFXp4SGCtBzoengtaf2EFMp6yaWyEaojfzq+aQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 607321C0007;
 Fri,  9 Jun 2023 15:56:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] of: module: Export of_device_uevent()
Date: Fri,  9 Jun 2023 17:56:33 +0200
Message-Id: <20230609155634.1495338-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The content of of_device_uevent() is currently hardcoded in a driver
that can be compiled as a module. Nothing prevents of_device_uevent() to
be exported to modules, most of the other helpers in of/device.c
actually are. The reason why this helper was not exported is because it
has been so far only useful in drivers/base, which is built-in anyway.

With the idea of getting rid of the hardcoded implementation of
of_device_uevent() in other places in the kernel, let's export it to GPL
modules (very much like its cousins in the same file).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 0f00f1b80708..90131de6d75b 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -312,6 +312,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	}
 	mutex_unlock(&of_mutex);
 }
+EXPORT_SYMBOL_GPL(of_device_uevent);
 
 int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.34.1

