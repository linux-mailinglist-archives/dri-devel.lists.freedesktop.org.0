Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF483836060
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B576C10ED6A;
	Mon, 22 Jan 2024 11:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B42410ED66
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:04:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83299612D8;
 Mon, 22 Jan 2024 11:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890A8C433F1;
 Mon, 22 Jan 2024 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921488;
 bh=/HUcPJ1BjPv5GMtQ1xgKekTdrhD9fVd1hk++uDzgCqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXbOocbLT0ABXMV2bnERsN9uywnmn32QE1DxP0RPGKVWf8/czfcvQdQsXJlpgw3ca
 31LnHSn/3LN0BOPake745sz7M5VbvfBkfzWgF35j3pHzM3A+zJAeQiywh2v+n+dcHe
 VYxdUNsWrsyqxLyNwt172Kbg6KwoAdjvvcfFwbTYywLVH1nGeI6fCQV7sIQuoVB4pZ
 EMuOjN1WBzH86YiQpxGtdzO6XEYj/afiTBkXxWbvJhwRSfBjB6nNakU6Kr8AsKKYJC
 ENNakA+0bkF+/pROEgWKv49RDHnRWCSnSFGU+EN0d5qy2cWOVpOP6Nq5jFkgYf+dAY
 PWP/RL22+7V/g==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 22/47] tty: vt: remove checks for count in
 consw::con_clear() implementations
Date: Mon, 22 Jan 2024 12:03:36 +0100
Message-ID: <20240122110401.7289-23-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'count' in consw::con_clear() is guaranteed to be positive. csi_X() (the
only caller) takes the minimum of the vc parameter (which is at least 1)
and count of characters till the end of the line. The latter is computed
as a subtraction of vc->vc_cols (count) and vc->state.x (offset). So for
the worst case, full line, it is 1.

Therefore, there is no point in checking zero or negative values (width
is now unsigned anyway).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/video/console/mdacon.c | 3 ---
 drivers/video/console/sticon.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 1ddbb6cd5b0c..2ff2c9394d40 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -448,9 +448,6 @@ static void mdacon_clear(struct vc_data *c, unsigned int y, unsigned int x,
 	u16 *dest = mda_addr(x, y);
 	u16 eattr = mda_convert_attr(c->vc_video_erase_char);
 
-	if (width <= 0)
-		return;
-
 	scr_memsetw(dest, eattr, width * 2);
 }
 
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index d99c2a659bfd..b1d972d9a31c 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -303,9 +303,6 @@ static void sticon_deinit(struct vc_data *c)
 static void sticon_clear(struct vc_data *conp, unsigned int sy, unsigned int sx,
 			 unsigned int width)
 {
-    if (!width)
-	return;
-
     sti_clear(sticon_sti, sy, sx, 1, width,
 	      conp->vc_video_erase_char, font_data[conp->vc_num]);
 }
-- 
2.43.0

