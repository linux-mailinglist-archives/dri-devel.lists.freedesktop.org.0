Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC2C85C67
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2210E2A3;
	Tue, 25 Nov 2025 15:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DXcTgO3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB17A10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:29:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CEA060052;
 Tue, 25 Nov 2025 15:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB8A2C116C6;
 Tue, 25 Nov 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764084582;
 bh=2rgjbNYwSi/bHcaye87kCRwfPag2zLt49KKmzYygySk=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=DXcTgO3k8+pZK2wVNlj24wHW+Q0VAV7NuWpphkD8MF1IiTo5hL81Ofei7CA8ZGVRE
 Vo4s3iHZFJTrhOuP0yRlY6RGoyncN/FT+KLTEDtrBaxLhO2pIM/iZqFVkc1PKwjjmg
 dN43MZyhfej9YTS/Larn///77aqt2spl3wtjrsVaM6/3qTNLLrMCQzTrJYjty1m9Ss
 qYGEdICHDsyw0rEedCj0oszDxBcHn5HQKj6bfAP6jnKxr4ne3QbOz7NbrCcy2JKVrd
 NRDJKPEkIfIhT8roYcS8vkSSZ3aj5xYYmdMZzBIVwQ0l/K9HkokdGWDSqza3CfSYox
 VedophDYW0kPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 96ECAD0E6F5;
 Tue, 25 Nov 2025 15:29:42 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Subject: [PATCH v3 0/2] Backlight driver to control backlight behind
 Congatec Board Controller.
Date: Tue, 25 Nov 2025 15:29:38 +0000
Message-Id: <20251125-cgbc-backlight-v3-0-18ae42689411@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLLJWkC/3XMQQ7CIBCF4as0rMUw0NbqynsYFzDQdqIBAw3RN
 L27tCuNcfm/5H0zSy6SS+xUzSy6TImCL6F2FcNR+8FxsqWZFLIBgI7jYJAbjbc7DePEVYMA4mi
 NMB0rp0d0PT038HItPVKaQnxtfoZ1/Utl4MARW42NEiBUffYh6ykGv++JrViWn8DxB5Bc8NrWz
 toD6raV38CyLG+/wB1q7wAAAA==
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764084581; l=1250;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=2rgjbNYwSi/bHcaye87kCRwfPag2zLt49KKmzYygySk=;
 b=lao2Ya+yCqLl8M6oCk3fndoi1Rf6wx2l4WpFJCQIGsrtYPaRvXFcE9/fvkKPySf4wALWkEVEv
 9avK3eoKF8GDG/Ot7jtle2RfvK4Q6Dyv3koSQNFQ/EoE7QUNB6FGyCr
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
 drivers/video/backlight/cgbc_bl.c | 177 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251118-cgbc-backlight-35c1109db0b8

Best regards,
-- 
Petri Karhula <petri.karhula@novatron.fi>


