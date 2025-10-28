Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61041C17593
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727F310E04E;
	Tue, 28 Oct 2025 23:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AM4QN+XU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CnP6OexP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED510E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cx66r54d4z9t3f;
 Wed, 29 Oct 2025 00:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IVXmSERoMI/GZWJakZVcaW0xPhsNvN3gsUyKubEtizY=;
 b=AM4QN+XUlrMp9hwMsAlP6cfup8GDXbO5y/71B/5fFUUZ6S46KrWP0pSQ9Hcse+m8xl8Ifr
 6KS1ItzC+OItW/Ut3L+bBc2o6YhVlhIsAKSTxLfOsNjIiYPW3VZ81jETtT/UERJpIIAh/M
 AAt2hJ9npP028p64+EEMzQOBoYFaJIy3duUOlXhX1XZBEaI8tFgqHJm+wgWO1iOluPlpKR
 mxe4DZovURzyChGtzdht8YUx1gwGnxR30pVutfT8G+up8/4I8VksBecNiEHiIv1JLEVSdT
 vWOnhPbTxTywMCs7s/GSgmDIuoNkLG0dUjEYaWOGffRtQXQ8il3PSuRPyqqHcw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CnP6OexP;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IVXmSERoMI/GZWJakZVcaW0xPhsNvN3gsUyKubEtizY=;
 b=CnP6OexPAgdI9aCBAZ7z0rpMwdLajSYcpPrkJaNT+z4dViXXN5ZNVrPvZtfnvOKLQOBE2i
 suPj09oMm58sgPAvLVdmVq1UzsQh7V1AIzeTUATjlCS4IQYeWe20/5tvFwDmSvfEj5l9aj
 ucaJI8KEL2miUzeZ2D3TWYgKWBWD05yoj6kgngI6orCgoROX2mUQBDibQ/6p50nE9z1a2N
 ABEhARsyOGYJvQl8p4j8I5fLBGlC4E2LGfVP1s/JZoDTe7Ikb82RQWMUkfBCuP3Ml2vD9M
 SL+AP/+55ZmXdEbtqjSzkhHqPqO1hmmPvqwWyUs3P1LjvBzF0iEIB8TfRCPbhQ==
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
Subject: [PATCH v4 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
Date: Wed, 29 Oct 2025 00:28:10 +0100
Message-ID: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rgpp5wccc3ojt99ot8g9rocfb7t5dh8f
X-MBO-RS-ID: 6d346328a035b757927
X-Rspamd-Queue-Id: 4cx66r54d4z9t3f
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

Noteworthy patches are 8 and 9 , those introduce handling of DSI mode flags
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

