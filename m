Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAECCA40A0
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D08610E1E9;
	Thu,  4 Dec 2025 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a3Orrx4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC010E1EB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:35:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62C0A40B32;
 Thu,  4 Dec 2025 14:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CCA5C4CEFB;
 Thu,  4 Dec 2025 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764858928;
 bh=lLVclWI8aKJ6C/SzCVMRPXeSdT2Og1oCcOJ4yEa2BEI=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=a3Orrx4ByjhGwawEhLItzd/docva392ZBL/hWJG3yKYDmOBZoVvA211hPY2eQkKtG
 a6FMTcTcBL2Nmsnr4ZkgF3rG/JTqalgOcO9xzIzOfLJpjmgRTqUCyqRrWRa/9mODNE
 P9xT+1Q1h7vt8gjSWvjTW1maL92jH+fHE8EME8UmdP+DRjMWFbo/T+CFxGrQPaM8LQ
 j7am9GHrj55ILICWZ4GxmL9vr1Z9j6+hKmdvPP5OHT1hcTKCHZ29wAmg+GOuvhqrjI
 B+n8eGo+k8sLP8PaWTnkaZ9sqw3fo2ie75RWSGN9rDSNJpXqVV0DdJGzIDn89PWmhg
 IvWyr6bCM/sRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 29D5DD1F9AF;
 Thu,  4 Dec 2025 14:35:28 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Subject: [PATCH v5 0/2] Backlight driver to control backlight behind
 Congatec Board Controller.
Date: Thu, 04 Dec 2025 14:35:25 +0000
Message-Id: <20251204-cgbc-backlight-v5-0-26f1be6a69c3@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC2cMWkC/3XMy6rCMBSF4VeRjI1k71zanpHvIQ6SndgGpT2kJ
 SjSdzc6qgSH/4L1PdkcUgwz+9s9WQo5znEaS+j9jtFgxz7w6EszFKgBoOXUO+LO0vUW+2HhUhO
 A6LwTrmXl9J/CJd4/4OlceojzMqXHx8/wXn9SGThwImNJSwFCquM4ZbukaTxcIntjGbdAVwHIB
 VdeBe8bssZgDcgNgLoCZAGgtUGhaTsFUANqCzQVoApg0GiUroFG+m9gXdcXs7vILHEBAAA=
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764858927; l=1655;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=lLVclWI8aKJ6C/SzCVMRPXeSdT2Og1oCcOJ4yEa2BEI=;
 b=B6dFIzaNwfEif/FlvO0zjYuXO4Lz3oSLFRx/EYBet2+3f0lQcu5SlqVz41s6njaAVp5nDg2k+
 c04olMITHRPDP6chKxqoUg1BIA5jY1FJKWA5WNgxyhwiqtNvfgcUfha
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


