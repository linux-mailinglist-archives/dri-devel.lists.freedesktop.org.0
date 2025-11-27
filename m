Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E8DC8F3E3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 16:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B35D10E78E;
	Thu, 27 Nov 2025 15:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DMnmiUTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0712810E785
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 15:22:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D03C40125;
 Thu, 27 Nov 2025 15:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71515C4CEF8;
 Thu, 27 Nov 2025 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764256920;
 bh=0DYPf8nCWVRUOaNVG3Sdtd4XAtoEggEvVG8k3t7HN0Y=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=DMnmiUTRERyX55lKxSZ6OgwZt5jBGbiVtEvHWa7TizcF7T7YpjfKdfjPbVSmjWWXn
 aaY9glhwZUSb8NUFjq1fSqx1BrmSYxofcDmUJhvXpNe+3DReklfPrxCxm0GiucZYQ8
 rzRdcPHqEzkX2pqYFJ000Ggl3D0JgjvtCQwUM9D0KnvvOvrt2J7bovofEF6LCVOZnF
 yuMWRWuUJSon60ootwr3fU9i6m3yyWZwdU5TxUZFVtXcl4jz12LrfxTuXxMJ4Iadx2
 lP3q2XMPrFp06gPYjw+3d7fIMmAi460OIzg8PReC3WTGIMznQ56xp3z5m1U8RoxMhw
 xuh2YwQ8ifafw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 65B7AD111A8;
 Thu, 27 Nov 2025 15:22:00 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Subject: [PATCH v4 0/2] Backlight driver to control backlight behind
 Congatec Board Controller.
Date: Thu, 27 Nov 2025 15:21:58 +0000
Message-Id: <20251127-cgbc-backlight-v4-0-626523b7173d@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZsKGkC/3XMQQ6CMBCF4auYrq3ptAXBlfcwLsq0wERDTUsaD
 eHuFlYY4vJ/yfsmFl0gF9nlMLHgEkXyQw59PDDszdA5TjY3k0IWAFBx7BrkjcHHk7p+5KpAAFH
 bRjQVy6dXcC29V/B2z91THH34rH6CZf1LJeDAEUuDhRIglL4OPpkx+OHUEluwJLdAvQMkF1xb7
 aw9oylLuQfUBpDFDlAZgMo4Lcuq1gC/wDzPX9QhonEwAQAA
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764256919; l=1467;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=0DYPf8nCWVRUOaNVG3Sdtd4XAtoEggEvVG8k3t7HN0Y=;
 b=5BGt3s3TPKHC72VXiw9Ebb2AuFW0gTrHlmAvfcGWm27oYv6CcuWocLtVK0HdOk7BExRn3cZTg
 2d2ZeqFlGV7AbpkRpdQ4i5v4b98tUwXDtDOQSLIyxGVlMClbbp/PPbq
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
 drivers/video/backlight/cgbc_bl.c | 179 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 192 insertions(+)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251118-cgbc-backlight-35c1109db0b8

Best regards,
-- 
Petri Karhula <petri.karhula@novatron.fi>


