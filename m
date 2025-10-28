Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92BC175D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E45610E6B6;
	Tue, 28 Oct 2025 23:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hR9JnKj6";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="scAC9O98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7AC10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cx67J3xcdz9tfy;
 Wed, 29 Oct 2025 00:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vKTAkp7yzvbujdNyd1mfFzuW3XqBbk624kP5QrCDkY=;
 b=hR9JnKj6QH/KNAUa1OuWpcHE3ee+xKaYJTQNkrgg/onkv0MJUuGLA/TIGebWTDPvn64J1j
 lrtgjvj1PRlqVL3PXrN6KogOkJIA662iWtZ3/yw/lEdlSG4pwxD/OR3+11DtApjtcJu8c3
 //5veqDoAarl283/0CNmOHr0ZhcuO3A8Zgubwb3BSShIJkV88yhhB2BUjck3BM9wJo5iUY
 k/hW6Bxt3Ab6JeSL5btdmsGlZDWSeqCuBX6tlavCV/UvTgJXEiYfxhZn/WVx2FTgD7a7fJ
 mYtGerNZy/ScNA1N6+ck7kcMjjKhNaVhdWf9uK43yOo/MSKPMvdbkDPOmAJepQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vKTAkp7yzvbujdNyd1mfFzuW3XqBbk624kP5QrCDkY=;
 b=scAC9O98Bicm6g7cyC9HzEWYMged954GorbRkbK0/9mNzPUFXeL5ULyqRKTlmvpdV1HiGh
 jMGCD0bylZAHMoZyIScl6oWjWyRf8M79pIsKsnuhtPByUnwcbznrlK85HBd8Ygsjn5rawT
 cQt4TlWQ6IYwPFf20lOiOzPqEhLEItY8PYawuMovtAMMBwnHorlsAGQgOHaR10VLaCdReW
 LbBlKIHd7DsavIRZ+QF+CYvKlbhe7uC6p+pwI1gShlOajcacCSScuiBEDu6oHgxvcggjWR
 a4nKWx2HiqrFtGa3iKGOWeXjcC0XMSS5dq7uQy+ULMjNYmaTY+ovI0nKTEYLrw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 10/11] drm/rcar-du: dsi: Convert register bits to BIT()
 macro
Date: Wed, 29 Oct 2025 00:28:20 +0100
Message-ID: <20251028232959.109936-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 60fb1977ce62a5b5ba4
X-MBO-RS-META: ydzsouky5h669fd9qngx7oaftz9be91h
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

Convert register bits to BIT() macro where applicable. This is done
automatically using regex 's@(1 << \([0-9]\+\))@BIT(\1)', except for
bitfields which are manually updated to use GENMASK().

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
---
V2: Rebase on previous changes
V3: Use BIT_U32()
V4: Add RB from Tomi
---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 252 +++++++++---------
 1 file changed, 126 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 88ed427f6dd2e..d3a1b91637ed3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -9,37 +9,37 @@
 #define __RCAR_MIPI_DSI_REGS_H__
 
 #define LINKSR				0x010
-#define LINKSR_LPBUSY			(1 << 1)
-#define LINKSR_HSBUSY			(1 << 0)
+#define LINKSR_LPBUSY			BIT_U32(1)
+#define LINKSR_HSBUSY			BIT_U32(0)
 
 #define TXSETR				0x100
-#define TXSETR_LANECNT_MASK		(0x3 << 0)
+#define TXSETR_LANECNT_MASK		GENMASK(1, 0)
 
 /*
  * DSI Command Transfer Registers
  */
 #define TXCMSETR			0x110
-#define TXCMSETR_SPDTYP			(1 << 8)	/* 0:HS 1:LP */
-#define TXCMSETR_LPPDACC		(1 << 0)
+#define TXCMSETR_SPDTYP			BIT_U32(8)	/* 0:HS 1:LP */
+#define TXCMSETR_LPPDACC		BIT_U32(0)
 #define TXCMCR				0x120
-#define TXCMCR_BTATYP			(1 << 2)
-#define TXCMCR_BTAREQ			(1 << 1)
-#define TXCMCR_TXREQ			(1 << 0)
+#define TXCMCR_BTATYP			BIT_U32(2)
+#define TXCMCR_BTAREQ			BIT_U32(1)
+#define TXCMCR_TXREQ			BIT_U32(0)
 #define TXCMSR				0x130
-#define TXCMSR_CLSNERR			(1 << 18)
-#define TXCMSR_AXIERR			(1 << 16)
-#define TXCMSR_TXREQEND			(1 << 0)
+#define TXCMSR_CLSNERR			BIT_U32(18)
+#define TXCMSR_AXIERR			BIT_U32(16)
+#define TXCMSR_TXREQEND			BIT_U32(0)
 #define TXCMSCR				0x134
-#define TXCMSCR_CLSNERR			(1 << 18)
-#define TXCMSCR_AXIERR			(1 << 16)
-#define TXCMSCR_TXREQEND		(1 << 0)
+#define TXCMSCR_CLSNERR			BIT_U32(18)
+#define TXCMSCR_AXIERR			BIT_U32(16)
+#define TXCMSCR_TXREQEND		BIT_U32(0)
 #define TXCMIER				0x138
-#define TXCMIER_CLSNERR			(1 << 18)
-#define TXCMIER_AXIERR			(1 << 16)
-#define TXCMIER_TXREQEND		(1 << 0)
+#define TXCMIER_CLSNERR			BIT_U32(18)
+#define TXCMIER_AXIERR			BIT_U32(16)
+#define TXCMIER_TXREQEND		BIT_U32(0)
 #define TXCMADDRSET0R			0x140
 #define TXCMPHDR			0x150
-#define TXCMPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define TXCMPHDR_FMT			BIT_U32(24)	/* 0:SP 1:LP */
 #define TXCMPHDR_VC(n)			(((n) & 0x3) << 22)
 #define TXCMPHDR_DT(n)			(((n) & 0x3f) << 16)
 #define TXCMPHDR_DATA1(n)		(((n) & 0xff) << 8)
@@ -53,63 +53,63 @@
 #define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
 #define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
 #define RXPSETR				0x210
-#define RXPSETR_LPPDACC			(1 << 0)
+#define RXPSETR_LPPDACC			BIT_U32(0)
 #define RXPSR				0x220
-#define RXPSR_ECCERR1B			(1 << 28)
-#define RXPSR_UEXTRGERR			(1 << 25)
-#define RXPSR_RESPTOERR			(1 << 24)
-#define RXPSR_OVRERR			(1 << 23)
-#define RXPSR_AXIERR			(1 << 22)
-#define RXPSR_CRCERR			(1 << 21)
-#define RXPSR_WCERR			(1 << 20)
-#define RXPSR_UEXDTERR			(1 << 19)
-#define RXPSR_UEXPKTERR			(1 << 18)
-#define RXPSR_ECCERR			(1 << 17)
-#define RXPSR_MLFERR			(1 << 16)
-#define RXPSR_RCVACK			(1 << 14)
-#define RXPSR_RCVEOT			(1 << 10)
-#define RXPSR_RCVAKE			(1 << 9)
-#define RXPSR_RCVRESP			(1 << 8)
-#define RXPSR_BTAREQEND			(1 << 0)
+#define RXPSR_ECCERR1B			BIT_U32(28)
+#define RXPSR_UEXTRGERR			BIT_U32(25)
+#define RXPSR_RESPTOERR			BIT_U32(24)
+#define RXPSR_OVRERR			BIT_U32(23)
+#define RXPSR_AXIERR			BIT_U32(22)
+#define RXPSR_CRCERR			BIT_U32(21)
+#define RXPSR_WCERR			BIT_U32(20)
+#define RXPSR_UEXDTERR			BIT_U32(19)
+#define RXPSR_UEXPKTERR			BIT_U32(18)
+#define RXPSR_ECCERR			BIT_U32(17)
+#define RXPSR_MLFERR			BIT_U32(16)
+#define RXPSR_RCVACK			BIT_U32(14)
+#define RXPSR_RCVEOT			BIT_U32(10)
+#define RXPSR_RCVAKE			BIT_U32(9)
+#define RXPSR_RCVRESP			BIT_U32(8)
+#define RXPSR_BTAREQEND			BIT_U32(0)
 #define RXPSCR				0x224
-#define RXPSCR_ECCERR1B			(1 << 28)
-#define RXPSCR_UEXTRGERR		(1 << 25)
-#define RXPSCR_RESPTOERR		(1 << 24)
-#define RXPSCR_OVRERR			(1 << 23)
-#define RXPSCR_AXIERR			(1 << 22)
-#define RXPSCR_CRCERR			(1 << 21)
-#define RXPSCR_WCERR			(1 << 20)
-#define RXPSCR_UEXDTERR			(1 << 19)
-#define RXPSCR_UEXPKTERR		(1 << 18)
-#define RXPSCR_ECCERR			(1 << 17)
-#define RXPSCR_MLFERR			(1 << 16)
-#define RXPSCR_RCVACK			(1 << 14)
-#define RXPSCR_RCVEOT			(1 << 10)
-#define RXPSCR_RCVAKE			(1 << 9)
-#define RXPSCR_RCVRESP			(1 << 8)
-#define RXPSCR_BTAREQEND		(1 << 0)
+#define RXPSCR_ECCERR1B			BIT_U32(28)
+#define RXPSCR_UEXTRGERR		BIT_U32(25)
+#define RXPSCR_RESPTOERR		BIT_U32(24)
+#define RXPSCR_OVRERR			BIT_U32(23)
+#define RXPSCR_AXIERR			BIT_U32(22)
+#define RXPSCR_CRCERR			BIT_U32(21)
+#define RXPSCR_WCERR			BIT_U32(20)
+#define RXPSCR_UEXDTERR			BIT_U32(19)
+#define RXPSCR_UEXPKTERR		BIT_U32(18)
+#define RXPSCR_ECCERR			BIT_U32(17)
+#define RXPSCR_MLFERR			BIT_U32(16)
+#define RXPSCR_RCVACK			BIT_U32(14)
+#define RXPSCR_RCVEOT			BIT_U32(10)
+#define RXPSCR_RCVAKE			BIT_U32(9)
+#define RXPSCR_RCVRESP			BIT_U32(8)
+#define RXPSCR_BTAREQEND		BIT_U32(0)
 #define RXPIER				0x228
-#define RXPIER_ECCERR1B			(1 << 28)
-#define RXPIER_UEXTRGERR		(1 << 25)
-#define RXPIER_RESPTOERR		(1 << 24)
-#define RXPIER_OVRERR			(1 << 23)
-#define RXPIER_AXIERR			(1 << 22)
-#define RXPIER_CRCERR			(1 << 21)
-#define RXPIER_WCERR			(1 << 20)
-#define RXPIER_UEXDTERR			(1 << 19)
-#define RXPIER_UEXPKTERR		(1 << 18)
-#define RXPIER_ECCERR			(1 << 17)
-#define RXPIER_MLFERR			(1 << 16)
-#define RXPIER_RCVACK			(1 << 14)
-#define RXPIER_RCVEOT			(1 << 10)
-#define RXPIER_RCVAKE			(1 << 9)
-#define RXPIER_RCVRESP			(1 << 8)
-#define RXPIER_BTAREQEND		(1 << 0)
+#define RXPIER_ECCERR1B			BIT_U32(28)
+#define RXPIER_UEXTRGERR		BIT_U32(25)
+#define RXPIER_RESPTOERR		BIT_U32(24)
+#define RXPIER_OVRERR			BIT_U32(23)
+#define RXPIER_AXIERR			BIT_U32(22)
+#define RXPIER_CRCERR			BIT_U32(21)
+#define RXPIER_WCERR			BIT_U32(20)
+#define RXPIER_UEXDTERR			BIT_U32(19)
+#define RXPIER_UEXPKTERR		BIT_U32(18)
+#define RXPIER_ECCERR			BIT_U32(17)
+#define RXPIER_MLFERR			BIT_U32(16)
+#define RXPIER_RCVACK			BIT_U32(14)
+#define RXPIER_RCVEOT			BIT_U32(10)
+#define RXPIER_RCVAKE			BIT_U32(9)
+#define RXPIER_RCVRESP			BIT_U32(8)
+#define RXPIER_BTAREQEND		BIT_U32(0)
 #define RXPADDRSET0R			0x230
 #define RXPSIZESETR			0x238
 #define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
 #define RXPHDR				0x240
-#define RXPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define RXPHDR_FMT			BIT_U32(24)	/* 0:SP 1:LP */
 #define RXPHDR_VC(n)			(((n) & 0x3) << 22)
 #define RXPHDR_DT(n)			(((n) & 0x3f) << 16)
 #define RXPHDR_DATA1(n)			(((n) & 0xff) << 8)
@@ -128,39 +128,39 @@
 #define TASCR				0x514
 #define TAIER				0x518
 #define TOSR				0x610
-#define TOSR_TATO			(1 << 2)
-#define TOSR_LRXHTO			(1 << 1)
-#define TOSR_HRXTO			(1 << 0)
+#define TOSR_TATO			BIT_U32(2)
+#define TOSR_LRXHTO			BIT_U32(1)
+#define TOSR_HRXTO			BIT_U32(0)
 #define TOSCR				0x614
-#define TOSCR_TATO			(1 << 2)
-#define TOSCR_LRXHTO			(1 << 1)
-#define TOSCR_HRXTO			(1 << 0)
+#define TOSCR_TATO			BIT_U32(2)
+#define TOSCR_LRXHTO			BIT_U32(1)
+#define TOSCR_HRXTO			BIT_U32(0)
 
 /*
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
-#define TXVMSETR_VSTPM			(1 << 15)
-#define TXVMSETR_PIXWDTH_MASK		(7 << 8)
-#define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
-#define TXVMSETR_VSEN			(1 << 4)
-#define TXVMSETR_HFPBPEN		(1 << 2)
-#define TXVMSETR_HBPBPEN		(1 << 1)
-#define TXVMSETR_HSABPEN		(1 << 0)
+#define TXVMSETR_SYNSEQ_EVENTS		BIT_U32(16) /* 0:Pulses 1:Events */
+#define TXVMSETR_VSTPM			BIT_U32(15)
+#define TXVMSETR_PIXWDTH_MASK		GENMASK(10, 8)
+#define TXVMSETR_PIXWDTH		BIT_U32(8) /* Only allowed value */
+#define TXVMSETR_VSEN			BIT_U32(4)
+#define TXVMSETR_HFPBPEN		BIT_U32(2)
+#define TXVMSETR_HBPBPEN		BIT_U32(1)
+#define TXVMSETR_HSABPEN		BIT_U32(0)
 
 #define TXVMCR				0x190
-#define TXVMCR_VFCLR			(1 << 12)
-#define TXVMCR_EN_VIDEO			(1 << 0)
+#define TXVMCR_VFCLR			BIT_U32(12)
+#define TXVMCR_EN_VIDEO			BIT_U32(0)
 
 #define TXVMSR				0x1a0
-#define TXVMSR_STR			(1 << 16)
-#define TXVMSR_VFRDY			(1 << 12)
-#define TXVMSR_ACT			(1 << 8)
-#define TXVMSR_RDY			(1 << 0)
+#define TXVMSR_STR			BIT_U32(16)
+#define TXVMSR_VFRDY			BIT_U32(12)
+#define TXVMSR_ACT			BIT_U32(8)
+#define TXVMSR_RDY			BIT_U32(0)
 
 #define TXVMSCR				0x1a4
-#define TXVMSCR_STR			(1 << 16)
+#define TXVMSCR_STR			BIT_U32(16)
 
 #define TXVMPSPHSETR			0x1c0
 #define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
@@ -171,10 +171,10 @@
 #define TXVMPSPHSETR_DT_YCBCR16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2c)
 
 #define TXVMVPRMSET0R			0x1d0
-#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17) /* 0:High 1:Low */
-#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16) /* 0:High 1:Low */
-#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4) /* 0:RGB 1:YCbCr */
-#define TXVMVPRMSET0R_BPP_MASK		(7 << 0)
+#define TXVMVPRMSET0R_HSPOL_LOW		BIT_U32(17) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_VSPOL_LOW		BIT_U32(16) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_CSPC_YCbCr	BIT_U32(4) /* 0:RGB 1:YCbCr */
+#define TXVMVPRMSET0R_BPP_MASK		GENMASK(2, 0)
 #define TXVMVPRMSET0R_BPP_16		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 0)
 #define TXVMVPRMSET0R_BPP_18		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 1)
 #define TXVMVPRMSET0R_BPP_24		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 2)
@@ -199,51 +199,51 @@
  * PHY-Protocol Interface (PPI) Registers
  */
 #define PPISETR				0x700
-#define PPISETR_DLEN_MASK		(0xf << 0)
-#define PPISETR_CLEN			(1 << 8)
+#define PPISETR_DLEN_MASK		GENMASK(3, 0)
+#define PPISETR_CLEN			BIT_U32(8)
 
 #define PPICLCR				0x710
-#define PPICLCR_TXREQHS			(1 << 8)
-#define PPICLCR_TXULPSEXT		(1 << 1)
-#define PPICLCR_TXULPSCLK		(1 << 0)
+#define PPICLCR_TXREQHS			BIT_U32(8)
+#define PPICLCR_TXULPSEXT		BIT_U32(1)
+#define PPICLCR_TXULPSCLK		BIT_U32(0)
 
 #define PPICLSR				0x720
-#define PPICLSR_HSTOLP			(1 << 27)
-#define PPICLSR_TOHS			(1 << 26)
-#define PPICLSR_STPST			(1 << 0)
+#define PPICLSR_HSTOLP			BIT_U32(27)
+#define PPICLSR_TOHS			BIT_U32(26)
+#define PPICLSR_STPST			BIT_U32(0)
 
 #define PPICLSCR			0x724
-#define PPICLSCR_HSTOLP			(1 << 27)
-#define PPICLSCR_TOHS			(1 << 26)
+#define PPICLSCR_HSTOLP			BIT_U32(27)
+#define PPICLSCR_TOHS			BIT_U32(26)
 
 #define PPIDL0SR			0x740
-#define PPIDL0SR_DIR			(1 << 10)
-#define PPIDL0SR_STPST			(1 << 6)
+#define PPIDL0SR_DIR			BIT_U32(10)
+#define PPIDL0SR_STPST			BIT_U32(6)
 
 #define PPIDLSR				0x760
-#define PPIDLSR_STPST			(0xf << 0)
+#define PPIDLSR_STPST			GENMASK(3, 0)
 
 /*
  * Clocks registers
  */
 #define LPCLKSET			0x1000
-#define LPCLKSET_CKEN			(1 << 8)
+#define LPCLKSET_CKEN			BIT_U32(8)
 #define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define CFGCLKSET			0x1004
-#define CFGCLKSET_CKEN			(1 << 8)
+#define CFGCLKSET_CKEN			BIT_U32(8)
 #define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define DOTCLKDIV			0x1008
-#define DOTCLKDIV_CKEN			(1 << 8)
+#define DOTCLKDIV_CKEN			BIT_U32(8)
 #define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define VCLKSET				0x100c
-#define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
+#define VCLKSET_CKEN			BIT_U32(16)
+#define VCLKSET_COLOR_YCC		BIT_U32(8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_MASK		GENMASK(3, 2)
 #define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
 #define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
 #define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
@@ -251,24 +251,24 @@
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-#define VCLKEN_CKEN			(1 << 0)
+#define VCLKEN_CKEN			BIT_U32(0)
 
 #define PHYSETUP			0x1014
 #define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
-#define PHYSETUP_HSFREQRANGE_MASK	(0x7f << 16)
+#define PHYSETUP_HSFREQRANGE_MASK	GENMASK(22, 16)
 #define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
-#define PHYSETUP_SHUTDOWNZ		(1 << 1)
-#define PHYSETUP_RSTZ			(1 << 0)
+#define PHYSETUP_SHUTDOWNZ		BIT_U32(1)
+#define PHYSETUP_RSTZ			BIT_U32(0)
 
 #define CLOCKSET1			0x101c
-#define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_LOCK_PHY		BIT_U32(17)
+#define CLOCKSET1_CLKSEL		BIT_U32(8)
+#define CLOCKSET1_CLKINSEL_MASK		GENMASK(3, 2)
 #define CLOCKSET1_CLKINSEL_EXTAL	FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 0)
 #define CLOCKSET1_CLKINSEL_DIG		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 1)
 #define CLOCKSET1_CLKINSEL_DU		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 2)
-#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
-#define CLOCKSET1_UPDATEPLL		(1 << 0)
+#define CLOCKSET1_SHADOW_CLEAR		BIT_U32(1)
+#define CLOCKSET1_UPDATEPLL		BIT_U32(0)
 
 #define CLOCKSET2			0x1020
 #define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
@@ -282,16 +282,16 @@
 #define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
 
 #define PHTW				0x1034
-#define PHTW_DWEN			(1 << 24)
+#define PHTW_DWEN			BIT_U32(24)
 #define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
-#define PHTW_CWEN			(1 << 8)
+#define PHTW_CWEN			BIT_U32(8)
 #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
 
 #define PHTR				0x1038
-#define PHTR_TESTDOUT			(0xff << 16)
-#define PHTR_TESTDOUT_TEST		(1 << 16)
+#define PHTR_TESTDOUT			GENMASK(23, 16)
+#define PHTR_TESTDOUT_TEST		BIT_U32(16)
 
 #define PHTC				0x103c
-#define PHTC_TESTCLR			(1 << 0)
+#define PHTC_TESTCLR			BIT_U32(0)
 
 #endif /* __RCAR_MIPI_DSI_REGS_H__ */
-- 
2.51.0

