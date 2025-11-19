Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E6C6D653
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A573E10E5A2;
	Wed, 19 Nov 2025 08:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YGDICVXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9810E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:26:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BA4D43602;
 Wed, 19 Nov 2025 08:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3C0BC16AAE;
 Wed, 19 Nov 2025 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763540780;
 bh=QHwp4lY2HPcPahRZXK4LaMFm9Mk6v/c6AOOPuydO0fQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=YGDICVXmnp62M+m/7hr9sSqXloS+MGgedTPrYk/pLl+l2rgjZqFbXBQ5ZosJsUYdS
 i+0G5pfd9uQiLc7YhUXHk8zJpHG9ZSGZ52vZHCyMyqbZnIKLsT4Ig5DbW/lvB0zcqf
 QN1Dsi2gvEnXSFlfIUg/BvKWCtBMhzFqaGApRycYT++8ykzP2Ao1IVveTeBobiz25F
 oTQW2hPd3ma/E8c4/yT36bPI8YyATLqGa5N4A0+FNwb3mooSN+/jxfK72cD68Jye/q
 LxTiMv721Dd3GhzluRiKfPtRA9NC7AgBOElGbsCYRDuN59csbB87sAzN+QbtKDVHGj
 8xJZIsny1RM2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 840BCCF258C;
 Wed, 19 Nov 2025 08:26:19 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Subject: [PATCH v2 0/2] Backlight driver to control backlight behind
 Congatec Board Controller.
Date: Wed, 19 Nov 2025 08:25:45 +0000
Message-Id: <20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAl/HWkC/3XMQQ7CIBCF4as0sxbDtNZUV97DdAFTChMNGCBE0
 3B3sXuX/0vet0EykU2Ca7dBNIUTB9+iP3RATnlrBC+toZf9iIiTIKtJaEWPJ1uXxTASorwsWuo
 J2ukVzcrvHbzPrR2nHOJn9wv+1r9UQYGC6KxoHCTK4XTzoagcgz+uDHOt9QtIFpQwrgAAAA==
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763540778; l=1068;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=QHwp4lY2HPcPahRZXK4LaMFm9Mk6v/c6AOOPuydO0fQ=;
 b=9AC+En9IdiAecmW78tFIvc8DEAPUbK4EcxwsMxWLlAHkyp8BR55ywXRluE6Le3nArv5o2KFH8
 MmL/x2bWw96B8p+bpE4kNLQHot5Ap5+sTkR3z0nXz7slK4d6uuzMZfX
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
Changes in v2:
- Separated Board Controller core driver change into its own patch
- Link to v1: https://lore.kernel.org/r/20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi

---
Petri Karhula (2):
      backlight: Add Congatec Board Controller (CGBC) backlight support
      mfd: cgbc: Add support for backlight

 drivers/mfd/cgbc-core.c           |   1 +
 drivers/video/backlight/Kconfig   |  11 ++
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/cgbc_bl.c | 281 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251118-cgbc-backlight-35c1109db0b8

Best regards,
-- 
Petri Karhula <petri.karhula@novatron.fi>


