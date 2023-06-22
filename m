Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2E73ABA4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 23:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4C310E585;
	Thu, 22 Jun 2023 21:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA8910E585
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:32:19 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687469537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3L64brw86V46M7pEkybRTkOXQNho44VnJg9P89aFHk=;
 b=HL5M7/GXUZoW1POWPH8YUV4TEkUTQDHMWoQO7HV99DKiJQVQucwCilZl1lWP76but/3evo
 aYQFZrlO3V41vOvwCwOClBugbVtm9gDRqNPMLv5+9g14fq71YaSIDfK8rMO2Yxe+eO8iYG
 MuT2zmldu1Nbx/OjK94Y82cSi4xZs/Rt6rDDnrtPXxz8i2UShBeZyyLoo/MqjIOaHANAi5
 D1CuQzo0mPqlZvJG2XjBZRkR6fgALMaRNWpFDZugigh3Ed/8A4n8XVG4kruxjBn0Fu8YeZ
 evQr0h/P6bmNnqFB1GnoN4SbBN1h4QRMSEJO/0ADyclg6Vvj2gzHCw7NdXnSew==
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
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 236261BF205;
 Thu, 22 Jun 2023 21:32:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 1/2] of: module: Export of_device_uevent()
Date: Thu, 22 Jun 2023 23:32:13 +0200
Message-Id: <20230622213214.3586530-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
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
 Frank Rowand <frowand.list@gmail.com>
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
Acked-by: Rob Herring <robh@kernel.org>
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

