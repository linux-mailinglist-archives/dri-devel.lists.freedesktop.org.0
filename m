Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43DB92AEC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EF610E1D4;
	Mon, 22 Sep 2025 18:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rl/E4Fec";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gEgV47wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C50D10E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cVsng0t9Dz9scD;
 Mon, 22 Sep 2025 20:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hcu5k5ai10lzphumbKNHNQxaBPSc+Si1GFipX97Y+TI=;
 b=rl/E4FecMc5RmdbqrGfBlydRlahqKrel3hij38nP8/v8kHARJBF0I9B/pvw/HvCodkD7q0
 mtU8MBvvf4NyXtztMREN9G8dSKaQX/udb3a3Uqj39NDg2OqQLlBsJj1DE+Dwu1/y1u4Pp/
 iTPb791Bnoyi/1L/wXe9fVY/AdoPR2duREHS2G6wd65d1q44Oot1u1w8rNk9kZTsskfP2f
 HN4NAKjSF3tgE1OlD4Bs0S/CTglozONCW8Roas0PkmxYnP6zBLkri0pedzFg5dHQ2oyBUW
 FVK7ujXva7L4EP9mxy1X9/1T/OdFieg3w5VRBf3rWmoFqJjJSwpoPXl7jIwWIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hcu5k5ai10lzphumbKNHNQxaBPSc+Si1GFipX97Y+TI=;
 b=gEgV47wtKqPFiVL18vOSp83PIrx6k2RgvxU9rpBUcSVi2+v1nA0cq0AZO+OErbSF7Ey02Y
 bM/Gvm2aKCWJWOPVFDVle439w+1TnsWFxiodFNdUuDDnsL+ZLg+Ixu/qLDvUeqWncmMJWf
 AgeqMQyPMEF1LO7AXfbKxcldXM5Fsol4itBZiGfAKQQAMEw+E6ltZ/cuhivYPUsMWavh11
 ukd+g0/xr3OZKt0jC2+DYaLaAk+R0JbM93ad36OqZFnLnQkUea0ZL35nW+x2HP85oI7+se
 8Od0piSu47UAsIOG7DY4Lygt4DX0/Z/SOYQrkViy2CDxmWP8O9yMrgsi5GBmDA==
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
Subject: [PATCH 0/9] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
Date: Mon, 22 Sep 2025 20:54:56 +0200
Message-ID: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b07ed5262dbc42a4cd
X-MBO-RS-META: bnm9bqd3z9fttiyzsymdm4eq8p6sya9e
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

Marek Vasut (9):
  drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
  drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
  drm/rcar-du: dsi: Clean up VCLKSET register macros
  drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
  drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
  drm/rcar-du: dsi: Respect DSI mode flags
  drm/rcar-du: dsi: Clean up handling of DRM mode flags
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 101 +++--
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 362 +++++++++---------
 2 files changed, 237 insertions(+), 226 deletions(-)

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

