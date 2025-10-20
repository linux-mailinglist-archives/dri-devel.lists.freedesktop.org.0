Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41371BF3AEA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1113F10E518;
	Mon, 20 Oct 2025 21:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lukowski.dev header.i=@lukowski.dev header.b="fsZmiJ/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Mon, 20 Oct 2025 19:25:33 UTC
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B981C10E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:25:33 +0000 (UTC)
Received: from MTA-10-3.privateemail.com (mta-10.privateemail.com
 [198.54.118.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4cr4s52V1Hz2x9Z
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lukowski.dev;
 s=default; t=1760987751;
 bh=nrgRgNHCDk2InzSXMS2FndXavGmVtBMyfPdak7dPxU8=;
 h=From:Date:Subject:To:Cc:From;
 b=fsZmiJ/XedZgMdFLTAho3wpjBWEeK4tvba9rx2fXhRJRtdXi5bYdq2gL1Z9tqyPyV
 0rlAgETTT13G+Ycz21NWQAP3SzN9oz4Xs1GyHiDj957okFciL6QkUN6gIQwTQb+oFS
 rto5cGulzzqj3b4rk8Y3vz2wWZ2lP1Wd1EVx4O3eVWuHsVjmfyxtYxIio+7kzzxdNa
 SdlINBWlnmZwr0x+91N9MCIeMruCXANqQEf7iYNNc92RVoudEheyguZkabkBEHP0sQ
 G8Usmu3iOtsKpz6Iq2Y02DOzGZpR0iTXT3DNMwOKSWB4HYZ7rQ1qZW+HkBzzOrwsU1
 XnjcyJtkrtfjQ==
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id 4cr4s26mHXz3hhVD;
 Mon, 20 Oct 2025 15:15:50 -0400 (EDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (unknown [150.228.61.196])
 by mta-10.privateemail.com (Postfix) with ESMTPA;
 Mon, 20 Oct 2025 15:15:42 -0400 (EDT)
From: Olle Lukowski <olle@lukowski.dev>
Date: Mon, 20 Oct 2025 22:15:36 +0300
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelay with
 usleep_range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqEIBAA0F+JOe+AWWb0K8serEYbCAvHjSD69
 6Tju7wLhBKTwFBdkOhg4S0W1J8KpsXFQMhzMWilTa20QskucAzox+wzJtf31uBfVqIdrW1UR86
 0zWShDHsiz+e7f3/3/QCE9POSbQAAAA==
X-Change-ID: 20251020-staging-fbtft-ra8875-usleep-77306ea543c7
To: Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Olle Lukowski <olle@lukowski.dev>
X-Mailer: b4 0.14.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 4cr4s52V1Hz2x9Z
X-Mailman-Approved-At: Mon, 20 Oct 2025 21:15:54 +0000
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

Replace udelay(100) calls with usleep_range(100, 200) to allow the
scheduler to yield instead of busy-waiting. This is the preferred API for
sleep durations above 10 microseconds.

Signed-off-by: Olle Lukowski <olle@lukowski.dev>
---
This patch replaces udelay() with usleep_range() in fb_ra8875.
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..d2400bb44 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 200);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 200);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251020-staging-fbtft-ra8875-usleep-77306ea543c7

Best regards,
-- 
Olle Lukowski <olle@lukowski.dev>

