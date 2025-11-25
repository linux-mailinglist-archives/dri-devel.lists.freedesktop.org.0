Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87217C85C6D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92C910E434;
	Tue, 25 Nov 2025 15:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XoQiSWSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CD510E42B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:29:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0640A440BA;
 Tue, 25 Nov 2025 15:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB119C19421;
 Tue, 25 Nov 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764084582;
 bh=jcPepnZLZgpDua5txvocFEmcFpPGA3RIdeogtsflON8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=XoQiSWSVHxLGHYaAdWTvLl++ltfS1eG4agD3Ppo39x/Abpr+aOF5b+aWwMWJ/e9/B
 zJlzffkru96yaA+HNCf+DWpNgT8Z/BXTRSDVbmS9JVGa03cy5OKsDvyGxEqHr5j7U7
 hms2TtZaRXwe+4zgFMxEZ+Wb3oqThQmsOGA0mkCg02uDjktolAiH1Xb9C5fTQOL7nC
 ZCoGHCbiPrB/pyFkyOLzTeE+sdLBvRX04bYFreizcRkVZEGxG7ZecHZ55oyz5xIzyj
 +f2su8v+Hrz6YdJIVJq9RYmZVsCkBy9HkdRrJ16gkTgybPmzu0KE9eZEtO22TQW9V0
 /zUQruyTu9kMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BC1A5D0E6FF;
 Tue, 25 Nov 2025 15:29:42 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Date: Tue, 25 Nov 2025 15:29:40 +0000
Subject: [PATCH v3 2/2] mfd: cgbc: Add support for backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-cgbc-backlight-v3-2-18ae42689411@novatron.fi>
References: <20251125-cgbc-backlight-v3-0-18ae42689411@novatron.fi>
In-Reply-To: <20251125-cgbc-backlight-v3-0-18ae42689411@novatron.fi>
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764084581; l=730;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=KPNSZCbWidPbzGQwgMCbuFj/C6Dnnhi7zAXThQ+Pso8=;
 b=LpEWfHvJDbCn5i+1PgHPCWq4Z60NSVEjj08sTAhBtFSZ32lpxMLPAnI3Y2pN0oXo6yUDfEaEX
 bpSQoV2m3fXDHbXdcDyOwVyQuwBVoXPdTrHBT6I2HO9PVZFEyR9TYRw
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


