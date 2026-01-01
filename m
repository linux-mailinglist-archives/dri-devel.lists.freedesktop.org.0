Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EEECED1E4
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 16:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25810E5D0;
	Thu,  1 Jan 2026 15:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XHpt5GHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719D110E5D6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 15:25:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2766A4449D;
 Thu,  1 Jan 2026 15:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D26CC19421;
 Thu,  1 Jan 2026 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767281155;
 bh=fijsGqE9CnSJQ1VoVakwrwO9lmzv42xMh3DZyoM14fI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XHpt5GHvJM5qyOMGNvH8tFwBLclultMO+0e9mRiefgmeD2oRld8Mc2vrErss3UoPu
 PPYy953ONhx2hrS7ifHOJ9SwBUU/eJo/q+v82ieqe6BuKdwcS3N07kOh/SFgUGV8wy
 iOmAUs4X5UT703wn91pEaDq4H2G1qU2WocAPEgJ4a6EU278Pvvyz62hFEZXr14sZlh
 UJgqeiFV5jFCIsuMJX+FqeQE556eL8Ja1YZtUc5CEaJrD1SWSbwSmIMm/Ydg+xXWvc
 mXB2MNjF9Pv2P79ebnxX4ce6nDInnsVvIhtBBOJJeOIcdmba5Z4bvG55eTQtpbJBU8
 7RextR4pm4HXw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 01 Jan 2026 16:25:16 +0100
Subject: [PATCH v2 2/6] video/logo: add a type parameter to the logo
 makefile function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-custom-logo-v2-2-8eec06dfbf85@kernel.org>
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
In-Reply-To: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=fijsGqE9CnSJQ1VoVakwrwO9lmzv42xMh3DZyoM14fI=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlhE1+Fm9nU2cT9XLwgRuHtadbvBxLyQrx1Mtt/SuxkO
 16nVMXcMZGFQYyLwVJMkWVZOSe3Qkehd9ihv5Ywc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oQ6QycDFKQBTHXCb4X8Jz9zP1V3KPS9kDSLmPUu/6Bdr/E20sINR8NMuXu9NiisYGZqX+e+zcD3
 uvuL7icv/LL3lZ04MnLOov/zM15q3ni6fz3AAAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

When translating a portable pixmap file into a .c file, the pnmtologo
tool expects to receive the image type (either mono, vga16 or clut224)
as an argument under the -t option.

Currently, this information is stored in the file name. Because we
will allow for custom logo in an upcoming change, it is preferable to
decouple the image name from its type.

Add a new $2 parameter to the Makefile logo function which contains
the image type.

Update all the individual targets to provide this new argument.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/video/logo/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 8b67c4941a4c..3f249e9dcf37 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -22,13 +22,16 @@ hostprogs := pnmtologo
 
 # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
 quiet_cmd_logo = LOGO    $@
-      cmd_logo = $(obj)/pnmtologo -t $(lastword $(subst _, ,$*)) -n $* -o $@ $<
+      cmd_logo = $(obj)/pnmtologo -t $2 -n $* -o $@ $<
 
 $(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo)
+	$(call if_changed,logo,mono)
 
-$(obj)/%.c: $(src)/%.ppm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo)
+$(obj)/%_vga16.c: $(src)/%_vga16.ppm $(obj)/pnmtologo FORCE
+	$(call if_changed,logo,vga16)
+
+$(obj)/%_clut224.c: $(src)/%_clut224.ppm $(obj)/pnmtologo FORCE
+	$(call if_changed,logo,clut224)
 
 # generated C files
 targets += *_mono.c *_vga16.c *_clut224.c

-- 
2.52.0

