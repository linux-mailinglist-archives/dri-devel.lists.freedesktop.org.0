Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGJBKjTojmkDFwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:00:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA9134465
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEDF10E0A6;
	Fri, 13 Feb 2026 09:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="PFsH16hx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IFMgoAi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A85610E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 09:00:31 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1770973229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HBjGiadin9K7jCzJsgR1AQK9TwCsTvwqWCR1pRrUqgk=;
 b=PFsH16hx5YJjpN9FQjkZF9p5saNhXpRQ2B54njPaHJOcFFC5ozIwWi9rUgGmBnlDkpziWB
 +l+LClST7Nj4Kr9POj7tfz6ng8q8gMNV+O2swYk9KUBmL9coA14W8oAF/nm01FDzUpnK9g
 El9NZ4in1GBDhJHilw2Cj1Cgi9vRuJZ1xmcLVwArXx/9cbwNVfabPo4gZAYal3h56A/8h7
 lq+BZOKSpCeSQAA4ECmOVk6aI5sxc0SX0lYZFOIYLAL1ktLBnMJuycFI5JWUOr+ll+5C5C
 Zkd0ZTZh2lCxM0QvfYCnNnCfR4B68JWpGxxqOkopv+4jFZzDlcBQn+vmFqnq3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1770973229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HBjGiadin9K7jCzJsgR1AQK9TwCsTvwqWCR1pRrUqgk=;
 b=IFMgoAi+iSys5vU6ZqAnASNkqDADw3CCWYo1oUWptAgtTUcHry/GWxjZ8U3AeqHfrSm7bU
 lQMChSfja6AX7FAw==
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Optimize partial write()
Date: Fri, 13 Feb 2026 09:59:46 +0100
Message-ID: <20260213085946.3673695-1-namcao@linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:namcao@linutronix.de,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0FDA9134465
X-Rspamd-Action: no action

When user write() only to part of the screen, the driver still updates the
entire screen. That wastes CPU cycles.

Optimize by updating only the changed lines. Improvement is measured by a
pair of trace_printk() at the beginning of fb_write() and at the end of
fbtft_deferred_io().

Update type         Before     After
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
full screen         196ms      200ms
half screen         200ms      124ms
quarter screen      193ms       81ms
one pixle           199ms       43ms

It is interesting to note that if the deferred IO's delay time (40ms) is
subtracted, then the time amount scales linearly with the write size.

Signed-off-by: Nam Cao <namcao@linutronix.de>
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

