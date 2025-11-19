Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD2C6D659
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7C010E5A9;
	Wed, 19 Nov 2025 08:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ncQv555x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B55610E5A9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8547660123;
 Wed, 19 Nov 2025 08:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D67BBC116B1;
 Wed, 19 Nov 2025 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763540780;
 bh=jcPepnZLZgpDua5txvocFEmcFpPGA3RIdeogtsflON8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ncQv555xAkzsNq2E8THOD/w5ae5i9Vr778lCVxm6zsdvcDRuydmic8J35CTOIQbDQ
 Cjz0+BieySvLVT9Qa1oDXyYYSM1ZNxwVxHBZI7OV6FpTwiAa98TYgDtMLqyQiH9DkW
 r+Xgkg8YjVirW7S+sOHqoLWEd7Pu+LVQgq9ApRnHTudpvOhzKNGNCEI6jIi0R9b9iL
 DFH8QwU7zjfhpSD6KZ9fnuik1d4iKzHInsTHwOWWm0cGgBgPRtJ1YM1/JDcvFSTgUz
 P3dk94qSyZ4f48+rM1YNPOSugSnB9zLNGGxwC08y7DpP512ah1Ou2nmZwFGSlkQV8M
 Rv8pVr4ixh3Hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A4A8FCF259E;
 Wed, 19 Nov 2025 08:26:19 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Date: Wed, 19 Nov 2025 08:25:47 +0000
Subject: [PATCH v2 2/2] mfd: cgbc: Add support for backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cgbc-backlight-v2-2-4d4edd7ca662@novatron.fi>
References: <20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi>
In-Reply-To: <20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi>
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763540778; l=730;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=KPNSZCbWidPbzGQwgMCbuFj/C6Dnnhi7zAXThQ+Pso8=;
 b=A7+u4KN5Q5OzUvkb74yRsfjSwPDVsYz3jVlv1sGdlQe1+mLVQgad1xROxS1PTS1iZ1WxiMgXK
 3nCRWzu6gzTCiIKkZwybI23Dy0+poEOu0GLUs3La79VILxRSokKxgXM
X-Developer-Key: i=petri.karhula@novatron.fi; a=ed25519;
 pk=LRYJ99jPPsHJwdJEPkqlmzAMqo6oyw7I421aHEfDp7o=
X-Endpoint-Received: by B4 Relay for petri.karhula@novatron.fi/20251118
 with auth_id=567
X-Original-From: Petri Karhula <petri.karhula@novatron.fi>
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
Reply-To: petri.karhula@novatron.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petri Karhula <petri.karhula@novatron.fi>

The Board Controller has control for display backlight.
Add backlight cell for the cgbc-backlight driver which
adds support for backlight brightness control.

Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
---
 drivers/mfd/cgbc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 4782ff1114a9..10bb4b414c34 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -237,6 +237,7 @@ static struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-i2c", .id = 1 },
 	{ .name = "cgbc-i2c", .id = 2 },
 	{ .name = "cgbc-hwmon"	},
+	{ .name = "cgbc-backlight" },
 };
 
 static int cgbc_map(struct cgbc_device_data *cgbc)

-- 
2.34.1


