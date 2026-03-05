Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIGPL9ReqWlc6QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:45:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC220FEBA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3ED10E23F;
	Thu,  5 Mar 2026 10:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="RAF/z83a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 10:45:33 UTC
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C50710E23F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:45:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772707200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FD1c8dWV5+6VqsbjY0c8AD7ho4tdjFdPaw+cN63q3So=;
 b=RAF/z83aRL5u+eAX2wIOFOjQvBG7MFAqq3Yv9Es460M5PB6b07KDBjUIRRZ+t1l3nfBQjf
 WRPpS96NCQ0Mjk7M5bWKUyh4Knj8FPH/tNn5ftJFeCjwG+g05bGWrR4BqfRhOGbFHrdli3
 HzzWAFvPDI6xvyMPRl2dJRxDCj+PTsU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Helge Deller <deller@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: macfb: Replace deprecated strcpy with strscpy
Date: Thu,  5 Mar 2026 11:39:15 +0100
Message-ID: <20260305103919.158067-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: 20BC220FEBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:thorsten.blum@linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy().  No functional changes.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/video/fbdev/macfb.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index 887fffdccd24..ef3d2304e2f4 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -668,19 +668,19 @@ static int __init macfb_init(void)
 
 		switch(ndev->dr_hw) {
 		case NUBUS_DRHW_APPLE_MDC:
-			strcpy(macfb_fix.id, "Mac Disp. Card");
+			strscpy(macfb_fix.id, "Mac Disp. Card");
 			macfb_setpalette = mdc_setpalette;
 			break;
 		case NUBUS_DRHW_APPLE_TFB:
-			strcpy(macfb_fix.id, "Toby");
+			strscpy(macfb_fix.id, "Toby");
 			macfb_setpalette = toby_setpalette;
 			break;
 		case NUBUS_DRHW_APPLE_JET:
-			strcpy(macfb_fix.id, "Jet");
+			strscpy(macfb_fix.id, "Jet");
 			macfb_setpalette = jet_setpalette;
 			break;
 		default:
-			strcpy(macfb_fix.id, "Generic NuBus");
+			strscpy(macfb_fix.id, "Generic NuBus");
 			break;
 		}
 	}
@@ -707,7 +707,7 @@ static int __init macfb_init(void)
 		case MAC_MODEL_Q700:
 		case MAC_MODEL_Q900:
 		case MAC_MODEL_Q950:
-			strcpy(macfb_fix.id, "DAFB");
+			strscpy(macfb_fix.id, "DAFB");
 			macfb_setpalette = dafb_setpalette;
 			dafb_cmap_regs = ioremap(DAFB_BASE, 0x1000);
 			break;
@@ -716,7 +716,7 @@ static int __init macfb_init(void)
 		 * LC II uses the V8 framebuffer
 		 */
 		case MAC_MODEL_LCII:
-			strcpy(macfb_fix.id, "V8");
+			strscpy(macfb_fix.id, "V8");
 			macfb_setpalette = v8_brazil_setpalette;
 			v8_brazil_cmap_regs = ioremap(DAC_BASE, 0x1000);
 			break;
@@ -729,7 +729,7 @@ static int __init macfb_init(void)
 		case MAC_MODEL_IIVI:
 		case MAC_MODEL_IIVX:
 		case MAC_MODEL_P600:
-			strcpy(macfb_fix.id, "Brazil");
+			strscpy(macfb_fix.id, "Brazil");
 			macfb_setpalette = v8_brazil_setpalette;
 			v8_brazil_cmap_regs = ioremap(DAC_BASE, 0x1000);
 			break;
@@ -745,7 +745,7 @@ static int __init macfb_init(void)
 		case MAC_MODEL_P520:
 		case MAC_MODEL_P550:
 		case MAC_MODEL_P460:
-			strcpy(macfb_fix.id, "Sonora");
+			strscpy(macfb_fix.id, "Sonora");
 			macfb_setpalette = v8_brazil_setpalette;
 			v8_brazil_cmap_regs = ioremap(DAC_BASE, 0x1000);
 			break;
@@ -757,7 +757,7 @@ static int __init macfb_init(void)
 		 */
 		case MAC_MODEL_IICI:
 		case MAC_MODEL_IISI:
-			strcpy(macfb_fix.id, "RBV");
+			strscpy(macfb_fix.id, "RBV");
 			macfb_setpalette = rbv_setpalette;
 			rbv_cmap_regs = ioremap(DAC_BASE, 0x1000);
 			break;
@@ -767,7 +767,7 @@ static int __init macfb_init(void)
 		 */
 		case MAC_MODEL_Q840:
 		case MAC_MODEL_C660:
-			strcpy(macfb_fix.id, "Civic");
+			strscpy(macfb_fix.id, "Civic");
 			macfb_setpalette = civic_setpalette;
 			civic_cmap_regs = ioremap(CIVIC_BASE, 0x1000);
 			break;
@@ -778,7 +778,7 @@ static int __init macfb_init(void)
 		 * We think this may be like the LC II
 		 */
 		case MAC_MODEL_LC:
-			strcpy(macfb_fix.id, "LC");
+			strscpy(macfb_fix.id, "LC");
 			if (vidtest) {
 				macfb_setpalette = v8_brazil_setpalette;
 				v8_brazil_cmap_regs =
@@ -790,7 +790,7 @@ static int __init macfb_init(void)
 		 * We think this may be like the LC II
 		 */
 		case MAC_MODEL_CCL:
-			strcpy(macfb_fix.id, "Color Classic");
+			strscpy(macfb_fix.id, "Color Classic");
 			if (vidtest) {
 				macfb_setpalette = v8_brazil_setpalette;
 				v8_brazil_cmap_regs =
@@ -802,7 +802,7 @@ static int __init macfb_init(void)
 		 * And we *do* mean "weirdos"
 		 */
 		case MAC_MODEL_TV:
-			strcpy(macfb_fix.id, "Mac TV");
+			strscpy(macfb_fix.id, "Mac TV");
 			break;
 
 		/*
@@ -810,7 +810,7 @@ static int __init macfb_init(void)
 		 */
 		case MAC_MODEL_SE30:
 		case MAC_MODEL_CLII:
-			strcpy(macfb_fix.id, "Monochrome");
+			strscpy(macfb_fix.id, "Monochrome");
 			break;
 
 		/*
@@ -828,7 +828,7 @@ static int __init macfb_init(void)
 		case MAC_MODEL_PB140:
 		case MAC_MODEL_PB145:
 		case MAC_MODEL_PB170:
-			strcpy(macfb_fix.id, "DDC");
+			strscpy(macfb_fix.id, "DDC");
 			break;
 
 		/*
@@ -840,7 +840,7 @@ static int __init macfb_init(void)
 		case MAC_MODEL_PB180:
 		case MAC_MODEL_PB210:
 		case MAC_MODEL_PB230:
-			strcpy(macfb_fix.id, "GSC");
+			strscpy(macfb_fix.id, "GSC");
 			break;
 
 		/*
@@ -848,7 +848,7 @@ static int __init macfb_init(void)
 		 */
 		case MAC_MODEL_PB165C:
 		case MAC_MODEL_PB180C:
-			strcpy(macfb_fix.id, "TIM");
+			strscpy(macfb_fix.id, "TIM");
 			break;
 
 		/*
@@ -860,13 +860,13 @@ static int __init macfb_init(void)
 		case MAC_MODEL_PB270C:
 		case MAC_MODEL_PB280:
 		case MAC_MODEL_PB280C:
-			strcpy(macfb_fix.id, "CSC");
+			strscpy(macfb_fix.id, "CSC");
 			macfb_setpalette = csc_setpalette;
 			csc_cmap_regs = ioremap(CSC_BASE, 0x1000);
 			break;
 
 		default:
-			strcpy(macfb_fix.id, "Unknown");
+			strscpy(macfb_fix.id, "Unknown");
 			break;
 		}
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

