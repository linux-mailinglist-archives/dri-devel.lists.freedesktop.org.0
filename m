Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7383139C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBA410E17C;
	Thu, 18 Jan 2024 07:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100510E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 68717B815CC;
 Thu, 18 Jan 2024 07:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945FDC43399;
 Thu, 18 Jan 2024 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564724;
 bh=/HUcPJ1BjPv5GMtQ1xgKekTdrhD9fVd1hk++uDzgCqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FXWNLegctp3Fhf2lVHyLbqQ/aJ29ru/jxnBhXLxcUeG3r4JMtYk9j4xfNlYHd+92T
 TGuL3YICbbpazTOXJvANDqXxsOoEmi2aoiU4SeRjhQA9T3QW9Zru/VJUiaU12dXqmW
 z9zZ/WP7i90YwaMFF/BL0ZPQVCtnXINr25NtGyN9l3wbL6wH/uazpxBY3ZftDPLN7z
 rnwRkY/dAv36z5XYeHWV3ZGq2MCmc9upg7uRifd4yOQMFAM0KK4PoPSnDE5LxQh7Rm
 LH4vI/qbrQliMRS59B2Ex0fQMih+DocftSPCivm8a/hwbWEKElqBbZUcnFZk1ZqY05
 CSonq6VCBsl6w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 21/45] tty: vt: remove checks for count in consw::con_clear()
 implementations
Date: Thu, 18 Jan 2024 08:57:32 +0100
Message-ID: <20240118075756.10541-22-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
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

