Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5F1F24DD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250116E9C4;
	Mon,  8 Jun 2020 23:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F066C6E9C4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 23:25:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 263382074B;
 Mon,  8 Jun 2020 23:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658704;
 bh=jB0JHajaiSD8nMrmh1e+MEqgjkNC208Fvh9HNwxgcUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d0Pmp4Vv0v5zT4DATm5TqvhvYJjX/1ObkjUGgNYosrAz6+EFMp0NGJXLOMVrTQkIs
 wsWjFjRD565lyrfldCKHY5be0v4QBEZ1YsLoRbH/IfBVTYEXfBAIS2gXcZ1xDRx3DS
 iHnmZXcZMkjeyrbZNhtS6ydQisEFTq/6VrY1dB8Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 03/72] drm: bridge: adv7511: Extend list of audio
 sample rates
Date: Mon,  8 Jun 2020 19:23:51 -0400
Message-Id: <20200608232500.3369581-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232500.3369581-1-sashal@kernel.org>
References: <20200608232500.3369581-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bogdan Togorean <bogdan.togorean@analog.com>

[ Upstream commit b97b6a1f6e14a25d1e1ca2a46c5fa3e2ca374e22 ]

ADV7511 support sample rates up to 192kHz. CTS and N parameters should
be computed accordingly so this commit extend the list up to maximum
supported sample rate.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200413113513.86091-2-bogdan.togorean@analog.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 67469c26bae8..45a027d7a1e4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -20,13 +20,15 @@ static void adv7511_calc_cts_n(unsigned int f_tmds, unsigned int fs,
 {
 	switch (fs) {
 	case 32000:
-		*n = 4096;
+	case 48000:
+	case 96000:
+	case 192000:
+		*n = fs * 128 / 1000;
 		break;
 	case 44100:
-		*n = 6272;
-		break;
-	case 48000:
-		*n = 6144;
+	case 88200:
+	case 176400:
+		*n = fs * 128 / 900;
 		break;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
