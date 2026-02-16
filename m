Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPJQBZZrkmmMtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 01:57:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1E140822
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 01:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5DD10E03A;
	Mon, 16 Feb 2026 00:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="wAlQZ8aF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HiG2Z0iL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5110E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 00:57:52 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771203470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nfa28DuNniAivW25JVgFFGcEoKTD2wIIe6OVumjmOjI=;
 b=wAlQZ8aFcWDlwqfWKb1NGjxD2o+GSP1sZgnUxaS3XOxwI8sAvUa/R8+PQi5UGJhzEg132y
 xDx1+Ea+b4US42ZRlv1/a/I+lPwG3+DrZJXnDfBgSbmfpH2zjSzqvCB/KAb+h0l07UlC6l
 IWCtr1g0M1ywUAlbACsea4VE2RiomKfwRCVjXsygQifjkorgWRFfIwfFLOoSnBWFXkv7rk
 PS8fXNFp07x6YpoxfJWtsyNeycPmNg9YumUT1aBZd8/Xol9HacbRoPxEqOg/NGBGhzh1gb
 eABWIsy4vYxDPteOE5ufQUu8Hm2F42OSCTDJx3t1n6Z4DObEIYGLOs/tiDbRWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771203470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nfa28DuNniAivW25JVgFFGcEoKTD2wIIe6OVumjmOjI=;
 b=HiG2Z0iLSDXgxyxQgn9A/OvwnSVUEDv9sl5SsVOCUKXnBf7JRd9AQvg02Zj5h8ceJuIRl1
 KkQsJqQdWhMJURCA==
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2] staging: fbtft: Optimize partial write()
Date: Mon, 16 Feb 2026 07:57:30 +0700
Message-ID: <20260216005730.4535-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:andriy.shevchenko@intel.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6DC1E140822
X-Rspamd-Action: no action

When user write() only to part of the screen, the driver still updates the
entire screen. That wastes CPU cycles.

Optimize by updating only the changed lines.

Also remove a "special case" in fbtft_mkdirty() as its only user is removed
in this patch.

Tested with an Adafruit ILI9340 (drivers/staging/fbtft/fb_ili9340.c).
Improvement is measured by a pair of trace_printk() at the beginning of
fb_write() and at the end of fbtft_deferred_io().

Update type         Before     After
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
full screen         196ms      200ms
half screen         200ms      124ms
quarter screen      193ms       81ms
one pixel           199ms       43ms

It is interesting to note that if the deferred IO's delay time (40ms) is
subtracted, then the time amount scales linearly with the write size.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: commit message amendment (add extra info & fix typo)
---
 drivers/staging/fbtft/fbtft-core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbt=
ft-core.c
index 8a5ccc8ae0a1..16899b979623 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -300,12 +300,6 @@ static void fbtft_mkdirty(struct fb_info *info, int y,=
 int height)
 	struct fbtft_par *par =3D info->par;
 	struct fb_deferred_io *fbdefio =3D info->fbdefio;
=20
-	/* special case, needed ? */
-	if (y =3D=3D -1) {
-		y =3D 0;
-		height =3D info->var.yres;
-	}
-
 	/* Mark display lines/area as dirty */
 	spin_lock(&par->dirty_lock);
 	if (y < par->dirty_lines_start)
@@ -414,9 +408,12 @@ static int fbtft_fb_blank(int blank, struct fb_info *i=
nfo)
 static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t=
 len)
 {
 	struct fbtft_par *par =3D info->par;
+	u32 start, end;
+
+	start =3D off / info->fix.line_length;
+	end =3D (off + len - 1) / info->fix.line_length;
=20
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	par->fbtftops.mkdirty(info, start, end - start + 1);
 }
=20
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 =
width, u32 height)
--=20
2.47.3

