Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BBCEAC43
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 23:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352310E571;
	Tue, 30 Dec 2025 22:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uAvcTXId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44B210E571
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 22:20:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C552A60097;
 Tue, 30 Dec 2025 22:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE644C4CEFB;
 Tue, 30 Dec 2025 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767133233;
 bh=oiaT6aLlR+Lw7QjGCokHCw+7kOpOxkIL1yAAgjdQAoU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uAvcTXId1+g5SoDSBHxwipcS05pcotNbHjxY0/gUbt85pfEuo+DqBzQso++znZBvy
 RDbJ901DGoC74xAsh+we+FSPRnbdkMWa4bYvrI3yITFXQ2PQFZ7Pv7mnAJQ2iseZ8W
 lAB/cVUsQmkskCgEyP7IKbVXDZbi7EsjkDMt0r7q48DxLfng8X8wBBbTcYY8hGqVky
 G5hxHGcSbIjrazxelbyAQ4JsHzyMHdizIFsFOJTF99uZ2ill1rA5RfMC3kBEP7rP+9
 AL+Zx6KjSzX7VGMODH/jU3h/xAKHoG1Wm9xSiFYGnf2vMe9vyQuZ2pAJEgmCyDwkNS
 0HZ0gsUYjX5cA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Tue, 30 Dec 2025 23:20:01 +0100
Subject: [PATCH 2/6] video/logo: add a type parameter to the logo makefile
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-custom-logo-v1-2-4736374569ee@kernel.org>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
In-Reply-To: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=oiaT6aLlR+Lw7QjGCokHCw+7kOpOxkIL1yAAgjdQAoU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkhAZLRHmGmG87kxcWFZWvMZ/ycbma37f8Ji3dZKbbHu
 vwflV/vmMjCIMbFYCmmyLKsnJNboaPQO+zQX0uYOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UAfIZODiFICpdp/MyHC5qZ99WXhttc6c14G70w6UfzS4s++PNJ/gu1lzz0ntqZ7GyNDiYTvh16x
 rHzRfnlD8xxL9ZG2S1pnnjE5iBpNX+diUnOQEAA==
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

Update all the individual targets to provide this new argument. Note
that this transitional: all those targets will be removed in an
upcoming clean-up change.

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
2.51.2

