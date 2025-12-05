Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A464CA78DF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA00E10EB10;
	Fri,  5 Dec 2025 12:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hvozc79D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A310E26A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E226560127;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F797C4CEF1;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764937190;
 bh=pEX+bLa7nulKt3xh0uUuF7vt+hghow9zmUReq6+oyb8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=Hvozc79DoqwbB1i0hUVri1O/9bPNsmu9zcUQjkYQwzNBA4T7uM8gYPIj0v4qI75Wj
 NJpoYF4Gt4Hkm+yLJ7KmFZgJ24ht+OMa0vU3CTQHX1/qIq1Qj+bjwlYey+rGFxMjPM
 RTEligIqtfWK4dWW3xpKyA5wTRNxhS+WD8oywn26czQ2dGkm9ymNGpG63W6nsfaE5r
 uVJ0ypvp04wuq4QsVY7Rm+dOwNSqLR3B5xsUqlc7cttvksfvoduTDDEbJoJhlaDcxh
 ntsKS2ZKBFU36TBppxF52SUVlHCrg4DSHelqK4g3xUeTnMX7nEUDQTGCRz2Z2Z+rC6
 lAg9+TTKGi+Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 76003D2F7CC;
 Fri,  5 Dec 2025 12:19:50 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Subject: [PATCH v6 0/2] Backlight driver to control backlight behind
 Congatec Board Controller.
Date: Fri, 05 Dec 2025 12:19:46 +0000
Message-Id: <20251205-cgbc-backlight-v6-0-e4175b0bf406@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOLNMmkC/3XMwU7EIBSF4VeZsBbDvcBt68r3MC7gQluiaSe0I
 ZpJ311mNtYQl/9JzncTW8wpbuLlchM5lrSldalBTxfBs1umKFOoLVChBYBe8uRZescfn2mad6k
 tA6gheOV7UU/XHMf09QDf3mvPadvX/P3wC9zXf6kCEiQzObZagdLmdVmL2/O6PI9J3LGCZ2BoA
 JRKmmBiCB07ImwBfQLQNoCuAPQuGqR+MAAtYM5A1wCmAoRkUfsOOh1awP4CqEwD2AogjeAjORp
 Y/wWO4/gBDZk68bIBAAA=
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764937189; l=1809;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=pEX+bLa7nulKt3xh0uUuF7vt+hghow9zmUReq6+oyb8=;
 b=gLn+8Xttcr+Zg9puF6FZ+9bk8zqLhGLVdWk6ot+Av6CVWYP7On+VC7iXeyOPEwiGoy8fPoRdV
 bu0pi36oTiJAqezsK7Du3RrumqeZOLePNvHMo5HYPTqRAah4Pg5vwT7
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

This driver provides backlight brightness control through the Linux
backlight subsystem. It communicates with the board controller to
adjust LCD backlight using PWM signals. Communication is done
through Congatec Board Controller core driver.
    

Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
---
Changes in v6:
- No code changes, just collected tags.
- Link to v5: https://lore.kernel.org/r/20251204-cgbc-backlight-v5-0-26f1be6a69c3@novatron.fi

Changes in v5:
- Added current and requested brightnesses to verification error message.
- Link to v4: https://lore.kernel.org/r/20251127-cgbc-backlight-v4-0-626523b7173d@novatron.fi

Changes in v4:
- Factor out brightness read into a helper
- Set backlight_properties.scale to BACKLIGHT_SCALE_LINEAR
- Link to v3: https://lore.kernel.org/r/20251125-cgbc-backlight-v3-0-18ae42689411@novatron.fi

Changes in v3:
- Fixed review comments and simplified the structure of the driver
- Link to v2: https://lore.kernel.org/r/20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi

Changes in v2:
- Separated Board Controller core driver change into its own patch
- Link to v1: https://lore.kernel.org/r/20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi

---
Petri Karhula (2):
      backlight: Add Congatec Board Controller (CGBC) backlight support
      mfd: cgbc: Add support for backlight

 drivers/mfd/cgbc-core.c           |   1 +
 drivers/video/backlight/Kconfig   |  11 +++
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/cgbc_bl.c | 180 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 193 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251118-cgbc-backlight-35c1109db0b8

Best regards,
-- 
Petri Karhula <petri.karhula@novatron.fi>


