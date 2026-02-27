Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLdjFySzomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4B1C1B44
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7985210E28C;
	Sat, 28 Feb 2026 09:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thingy.jp header.i=@thingy.jp header.b="cK5phna4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0A10E189
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 12:25:12 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-354bc7c2c46so1161846a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thingy.jp; s=google; t=1772195112; x=1772799912; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4DTCycSkXD9AMNo6HpXSEpzM+j7SRgkLeP93XH/2s3c=;
 b=cK5phna4b5uge3P1YhTYyHYgPQnGYb1Xxd9BAl0fhzFn4gWt5YO8nTrk5qc0H/ImnL
 AF8Wv5w05Y/5+xl5ymOctRH11ahTxFBxOqUeRHSabjOUOsDfvPgfiYKkhrZiQ5eTcbxo
 hZrIT/fe6LyD+Bmj0FM77XVLYbUrsQN1Yas54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772195112; x=1772799912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DTCycSkXD9AMNo6HpXSEpzM+j7SRgkLeP93XH/2s3c=;
 b=oOnzW0bCvlm51vIZO0XQWXFrXnhauCMKEsYZ/44FxgVqVHCiW/pGgvn7gxXiIkJx6l
 TfMPq/687U8jVaIBlo3hIt9Z3eQpbk2UJNQefSQ7qswZGfdyjfARuyHJ3jKoMd15HXKM
 0gi+f7CYWH9O2PH7EtPk/HO+yWc2iYXVX74y/0NfCQLCOB/YMDS4NhO1i1ZadSDUOuwP
 XSQqm/RwLIFyOLeZNuUEY+tATvGhheP8RdYJS6wa9gO+OgrPQK3kLQ5Yrmy4rhQ56Fvt
 isVTOQPoQyrzJdP2aYF1zDhstyi4u5+0IB4Py42zXFuEM/woBuaKxgGywsFxJ08NJlpe
 xTHg==
X-Gm-Message-State: AOJu0YxncHlIUztRTRPuWo4Fo8ltTqaylCO/YWSi0eoYCSvYfH0y+ERF
 xWjK8MS670niMTPhcXJEOnrVhaTCq2XgCKt3p7oHvzlj+1GiACwxm9kzo0ebzRpEGi0=
X-Gm-Gg: ATEYQzzjLDSD5Q0ypeMrFqk8lGohqHeoyDFYXDeMVX8tp1zizffqWRZqhdYNWNruecj
 iWpSp95NYPY3WKFUPHSmp5SL6GkIEJ+p+TQwPn8y55ef3xGf1JH+ZpayvrahM3aVRyx/ZdPS2UX
 arYYWiu9ynWikDwPbPAxF45TGiJND8I44eKAJzOJXd2UaCEncrw5D6DtYznV/xMDVYl8YhIubqT
 H3QGlWa8AL/HNJ6oPVTBZ19xrf+YTLwbLMKIrZZfrABbAKoY6SE4kMt+D+RrFf9s+VWQ/+0jcxU
 YXdiakdAOMTZWXzEo/PxFYzboc/7y4fK+G3hCpBfEBDnZvVmw3Bo1/wXC4nGvWnfLPD3AG1Ml+e
 DH0Rewqjwk9trsm/c4biz1J0bIy/oD7DQjtNjgfzka5yRuVmTI/H4UesPvSZ6BPK2jwKmTQZeFy
 hcvLO60KEQ82NkrzWJa7RzjSGSzEpPiItGykT/6LWofV6PoNiFQCARw3+PQdBmW9YNGKrk7G6tl
 aPAi2d2JcV82z8=
X-Received: by 2002:a17:90b:5111:b0:343:eb40:8dca with SMTP id
 98e67ed59e1d1-35965cad678mr2014537a91.19.1772195112207; 
 Fri, 27 Feb 2026 04:25:12 -0800 (PST)
Received: from kinako.work.home.arpa
 (p1590226-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [153.227.10.226])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-3591342f19fsm3612094a91.10.2026.02.27.04.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 04:25:11 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: deller@gmx.de,
	linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] fbdev/tdfxfb: Make the VGA register initialisation a bit more
 obvious
Date: Fri, 27 Feb 2026 21:25:00 +0900
Message-ID: <20260227122500.3885069-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[thingy.jp:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[thingy.jp];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@thingy.jp,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel@thingy.jp,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmx.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[thingy.jp:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel@thingy.jp,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thingy.jp:mid,thingy.jp:dkim,thingy.jp:email]
X-Rspamd-Queue-Id: C0B4B1C1B44
X-Rspamd-Action: no action

For a while I was trying to get this working on m68k, for some reason
the card doesn't display anything if it's own video BIOS didn't run..

Anyhow, I spent a long time looking up what each of these offsets
were to work out what the code is configuring and eventually
replaced them with the human readable defines in video/vga.h.

Functionally there is no change but maybe it makes it a bit easier to
look at for the next person that finds themselves in here.

Tested on a real voodoo 3 on x86_64.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/video/fbdev/tdfxfb.c | 109 ++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 51ebe78359ec..7606e024fa3f 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -77,6 +77,7 @@
 #include <asm/io.h>
 
 #include <video/tdfx.h>
+#include <video/vga.h>
 
 #define DPRINTK(a, b...) pr_debug("fb: %s: " a, __func__ , ## b)
 
@@ -591,7 +592,7 @@ static int tdfxfb_set_par(struct fb_info *info)
 		vt = ve + (info->var.upper_margin << 1) - 1;
 		reg.screensize = info->var.xres | (info->var.yres << 13);
 		reg.vidcfg |= VIDCFG_HALF_MODE;
-		reg.crt[0x09] = 0x80;
+		reg.crt[VGA_CRTC_MAX_SCAN] = 0x80;
 	} else {
 		vd = info->var.yres - 1;
 		vs  = vd + info->var.lower_margin;
@@ -609,59 +610,59 @@ static int tdfxfb_set_par(struct fb_info *info)
 			 info->var.xres < 480 ? 0x60 :
 			 info->var.xres < 768 ? 0xe0 : 0x20);
 
-	reg.gra[0x05] = 0x40;
-	reg.gra[0x06] = 0x05;
-	reg.gra[0x07] = 0x0f;
-	reg.gra[0x08] = 0xff;
-
-	reg.att[0x00] = 0x00;
-	reg.att[0x01] = 0x01;
-	reg.att[0x02] = 0x02;
-	reg.att[0x03] = 0x03;
-	reg.att[0x04] = 0x04;
-	reg.att[0x05] = 0x05;
-	reg.att[0x06] = 0x06;
-	reg.att[0x07] = 0x07;
-	reg.att[0x08] = 0x08;
-	reg.att[0x09] = 0x09;
-	reg.att[0x0a] = 0x0a;
-	reg.att[0x0b] = 0x0b;
-	reg.att[0x0c] = 0x0c;
-	reg.att[0x0d] = 0x0d;
-	reg.att[0x0e] = 0x0e;
-	reg.att[0x0f] = 0x0f;
-	reg.att[0x10] = 0x41;
-	reg.att[0x12] = 0x0f;
-
-	reg.seq[0x00] = 0x03;
-	reg.seq[0x01] = 0x01; /* fixme: clkdiv2? */
-	reg.seq[0x02] = 0x0f;
-	reg.seq[0x03] = 0x00;
-	reg.seq[0x04] = 0x0e;
-
-	reg.crt[0x00] = ht - 4;
-	reg.crt[0x01] = hd;
-	reg.crt[0x02] = hbs;
-	reg.crt[0x03] = 0x80 | (hbe & 0x1f);
-	reg.crt[0x04] = hs;
-	reg.crt[0x05] = ((hbe & 0x20) << 2) | (he & 0x1f);
-	reg.crt[0x06] = vt;
-	reg.crt[0x07] = ((vs & 0x200) >> 2) |
-			((vd & 0x200) >> 3) |
-			((vt & 0x200) >> 4) | 0x10 |
-			((vbs & 0x100) >> 5) |
-			((vs & 0x100) >> 6) |
-			((vd & 0x100) >> 7) |
-			((vt & 0x100) >> 8);
-	reg.crt[0x09] |= 0x40 | ((vbs & 0x200) >> 4);
-	reg.crt[0x10] = vs;
-	reg.crt[0x11] = (ve & 0x0f) | 0x20;
-	reg.crt[0x12] = vd;
-	reg.crt[0x13] = wd;
-	reg.crt[0x15] = vbs;
-	reg.crt[0x16] = vbe + 1;
-	reg.crt[0x17] = 0xc3;
-	reg.crt[0x18] = 0xff;
+	reg.gra[VGA_GFX_MODE]         = 0x40;
+	reg.gra[VGA_GFX_MISC]         = 0x05;
+	reg.gra[VGA_GFX_COMPARE_MASK] = 0x0f;
+	reg.gra[VGA_GFX_BIT_MASK]     = 0xff;
+
+	reg.att[VGA_ATC_PALETTE0]     = 0x00;
+	reg.att[VGA_ATC_PALETTE1]     = 0x01;
+	reg.att[VGA_ATC_PALETTE2]     = 0x02;
+	reg.att[VGA_ATC_PALETTE3]     = 0x03;
+	reg.att[VGA_ATC_PALETTE4]     = 0x04;
+	reg.att[VGA_ATC_PALETTE5]     = 0x05;
+	reg.att[VGA_ATC_PALETTE6]     = 0x06;
+	reg.att[VGA_ATC_PALETTE7]     = 0x07;
+	reg.att[VGA_ATC_PALETTE8]     = 0x08;
+	reg.att[VGA_ATC_PALETTE9]     = 0x09;
+	reg.att[VGA_ATC_PALETTEA]     = 0x0a;
+	reg.att[VGA_ATC_PALETTEB]     = 0x0b;
+	reg.att[VGA_ATC_PALETTEC]     = 0x0c;
+	reg.att[VGA_ATC_PALETTED]     = 0x0d;
+	reg.att[VGA_ATC_PALETTEE]     = 0x0e;
+	reg.att[VGA_ATC_PALETTEF]     = 0x0f;
+	reg.att[VGA_ATC_MODE]         = 0x41;
+	reg.att[VGA_ATC_PLANE_ENABLE] = 0x0f;
+
+	reg.seq[VGA_SEQ_RESET]         = 0x03;
+	reg.seq[VGA_SEQ_CLOCK_MODE]    = 0x01; /* fixme: clkdiv2? */
+	reg.seq[VGA_SEQ_PLANE_WRITE]   = 0x0f;
+	reg.seq[VGA_SEQ_CHARACTER_MAP] = 0x00;
+	reg.seq[VGA_SEQ_MEMORY_MODE]   = 0x0e;
+
+	reg.crt[VGA_CRTC_H_TOTAL]       = ht - 4;
+	reg.crt[VGA_CRTC_H_DISP]        = hd;
+	reg.crt[VGA_CRTC_H_BLANK_START] = hbs;
+	reg.crt[VGA_CRTC_H_BLANK_END]   = 0x80 | (hbe & 0x1f);
+	reg.crt[VGA_CRTC_H_SYNC_START]  = hs;
+	reg.crt[VGA_CRTC_H_SYNC_END]    = ((hbe & 0x20) << 2) | (he & 0x1f);
+	reg.crt[VGA_CRTC_V_TOTAL]       = vt;
+	reg.crt[VGA_CRTC_OVERFLOW]      = ((vs & 0x200) >> 2) |
+					  ((vd & 0x200) >> 3) |
+					  ((vt & 0x200) >> 4) | 0x10 |
+					  ((vbs & 0x100) >> 5) |
+					  ((vs & 0x100) >> 6) |
+					  ((vd & 0x100) >> 7) |
+					  ((vt & 0x100) >> 8);
+	reg.crt[VGA_CRTC_MAX_SCAN]     |= 0x40 | ((vbs & 0x200) >> 4);
+	reg.crt[VGA_CRTC_V_SYNC_START]  = vs;
+	reg.crt[VGA_CRTC_V_SYNC_END]    = (ve & 0x0f) | 0x20;
+	reg.crt[VGA_CRTC_V_DISP_END]    = vd;
+	reg.crt[VGA_CRTC_OFFSET]        = wd;
+	reg.crt[VGA_CRTC_V_BLANK_START] = vbs;
+	reg.crt[VGA_CRTC_V_BLANK_END]   = vbe + 1;
+	reg.crt[VGA_CRTC_MODE]          = 0xc3;
+	reg.crt[VGA_CRTC_LINE_COMPARE]  = 0xff;
 
 	/* Banshee's nonvga stuff */
 	reg.ext[0x00] = (((ht & 0x100) >> 8) |
-- 
2.51.0

