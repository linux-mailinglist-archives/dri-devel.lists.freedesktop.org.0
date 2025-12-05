Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F338FCA78D9
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4A410E26A;
	Fri,  5 Dec 2025 12:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t6jgj9fC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A2E10E26A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE3EA44487;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B16BAC16AAE;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764937190;
 bh=jcPepnZLZgpDua5txvocFEmcFpPGA3RIdeogtsflON8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=t6jgj9fCeMa0/Csw4Ha3dekc3fKmiEtasNWdlFzNiHYPCIxVzkt/FmQdTpGuzIdSz
 K5zPoINTZH3y0rjNs2KFiAKUP/p2ah7dwy514WvRbF2NgdJB7Ulz3kAHSoROoM9Skl
 /LZ/LPcVZ8h5X24rB3W1n8+Fg0t/1/96r81t14SbUeXukV8uf0lHFgKPqoLByFbs1k
 tXeVkd/MJo64GP/0MVXbubS7W2WeGU9uCKjYKO6wgShwelzfXq1hkVk+lLUlypuDH7
 mKmFnXKCYK2NZHrXX+9kr4x3aNK4l7zfJEdXXz1e2k+ud1lPLDzgtkB0e00UF9Z9qK
 K47ZR+7EL2saA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A0D6DD2F7EB;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Date: Fri, 05 Dec 2025 12:19:48 +0000
Subject: [PATCH v6 2/2] mfd: cgbc: Add support for backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-cgbc-backlight-v6-2-e4175b0bf406@novatron.fi>
References: <20251205-cgbc-backlight-v6-0-e4175b0bf406@novatron.fi>
In-Reply-To: <20251205-cgbc-backlight-v6-0-e4175b0bf406@novatron.fi>
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764937189; l=730;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=KPNSZCbWidPbzGQwgMCbuFj/C6Dnnhi7zAXThQ+Pso8=;
 b=Yi7moofqQcbmddXD6FGj979QkC2EfgDx8hONE6czwuiqUrrRllPRru9oRtY18aIZspfHZ70Nr
 2o3sudaAVSeAgIkLNRcBLg+jFQ0MS8lnNRgQ3VNhJQB94+aKlYq01Hp
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


