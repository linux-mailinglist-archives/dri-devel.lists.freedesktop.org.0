Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B3BB938D
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A8E10E029;
	Sun,  5 Oct 2025 03:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gH65xBKn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yVd5azXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DBE10E029
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:24 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cfS124qxpz9svm;
 Sun,  5 Oct 2025 05:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnqZ7gdNGXjD0CLqH5Zyd8pfzI37ICi49VhUV/Gv0Wk=;
 b=gH65xBKnOKmSuM11Se2os1i7dSx1mK9x2Yrwlvno9RDgV5JfLXVnXhFEv4Igqu6EKPjRTN
 r4pTj6BO00/N2zn1bvwP1rvCd1jrP8IZhbcTYOIm5+PUYIaw/MhbaRvy5HZ0aiYZ6oBgOE
 WiCu3f8kYRqZY+7TtY7Z6ZW5VEJzzQrVpfA7eMQuyj2yUR4+uxN3ovJD64wWL/cNw5QudC
 e51jw6GtkdaGE6MzsQYKJ+N+pZvDGtc0rMvZ0H3OqBVSli5zvgH1I3D7YLmANqRuZosjJG
 qzMwsvEHs+ZPspghmhUijZcTe6AqNp62N1BMloWY6q/siLLtdpwMC4SLxhWtMQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnqZ7gdNGXjD0CLqH5Zyd8pfzI37ICi49VhUV/Gv0Wk=;
 b=yVd5azXFBEQ+zyHf3ymCLch4nVwmkFSc+4RGSdbkr2mEPfpOOhXGm0PFiVRSNBeJsaQnFa
 qNQqP8T3y0cWfnUnkKdLCKNdQncw64Rc47h6K2KI06+/L9IQYalqgPbh741zxl8iYRLFX+
 x7dJRhbNuMwppTkNooodRWw5hypBoZJ03IsOJo5zpLh3XAGIe4rb75K4XIxWHC4Kzvs/E/
 XWTsIrx3Th+zvko+8A2wSlgCAKusu97nGqThLYXZo+FyFF8r0ZgpiepTWpmwHc3VpNLAKb
 qw85GnUntLb3sQphBc+DrHlPZQN63yr8sbhNz82dSaihdRf+t6hyhf9//LhFLg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
Date: Sun,  5 Oct 2025 05:02:47 +0200
Message-ID: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ktqnpc1ub98ipe4xirfje8f79b4fqnmf
X-MBO-RS-ID: b5cc5bb6c2042bb8f9d
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
Most of this patchset is boring mechanical conversion.

Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
should not have any adverse effect on existing hardware.

Marek Vasut (11):
  drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
  drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
  drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
  drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
  drm/rcar-du: dsi: Clean up VCLKSET register macros
  drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
  drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
  drm/rcar-du: dsi: Respect DSI mode flags
  drm/rcar-du: dsi: Clean up handling of DRM mode flags
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
 2 files changed, 237 insertions(+), 200 deletions(-)

---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.51.0

