Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DB215312
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786206E2C7;
	Mon,  6 Jul 2020 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0116E286
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1593785635; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=MHr/Vx6AifBNxeaJEpwnQzcfqb7ip8S1SAY5xrrDCAQ=;
 b=lNirvIktMvxLeah53ukETpEpZYUmjzjAPoKeb28ku1EYbtKYo994W+14qxyIB9RQESR3OV
 11yzVhd+OIK1XbGwdXS2o4E0C0SVrrG+Hp8Rh6BOu8k2qXU4fDF1kJoqTuYC01NjfHQWOY
 h7gOKmmmxlvKuW28uoM6n5XF3cInT/A=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/dbi: Fix SPI Type 1 (9-bit) transfer
Date: Fri,  3 Jul 2020 16:13:41 +0200
Message-Id: <20200703141341.1266263-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function mipi_dbi_spi1_transfer() will transfer its payload as 9-bit
data, the 9th (MSB) bit being the data/command bit. In order to do that,
it unpacks the 8-bit values into 16-bit values, then sets the 9th bit if
the byte corresponds to data, clears it otherwise. The 7 MSB are
padding. The array of now 16-bit values is then passed to the SPI core
for transfer.

This function was broken since its introduction, as the length of the
SPI transfer was set to the payload size before its conversion, but the
payload doubled in size due to the 8-bit -> 16-bit conversion.

Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
Cc: <stable@vger.kernel.org> # 4.10
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index bb27c82757f1..bf7888ad9ad4 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -923,7 +923,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
 			}
 		}
 
-		tr.len = chunk;
+		tr.len = chunk * 2;
 		len -= chunk;
 
 		ret = spi_sync(spi, &m);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
