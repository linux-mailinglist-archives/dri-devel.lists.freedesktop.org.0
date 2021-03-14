Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163AC33A858
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 22:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F0E89CF9;
	Sun, 14 Mar 2021 21:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Sun, 14 Mar 2021 10:20:12 UTC
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A522B6E342
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 10:20:12 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8F3943E8EC;
 Sun, 14 Mar 2021 11:12:15 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
Date: Sun, 14 Mar 2021 11:11:10 +0100
Message-Id: <20210314101110.48024-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 14 Mar 2021 21:47:10 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Obeida Shamoun <oshmoun100@googlemail.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Obeida Shamoun <oshmoun100@googlemail.com>

WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
Therefore, use the sink address as base instead of the ctrl address.

This fixes the sync toggle on wled4, which can be observed by the fact
that adjusting brightness now works.

It has no effect on wled3 because sink and ctrl base addresses are the
same.  This allows adjusting the brightness without having to disable
then reenable the module.

Signed-off-by: Obeida Shamoun <oshmoun100@googlemail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 091f07e7c145..fc8b443d10fd 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -336,13 +336,13 @@ static int wled3_sync_toggle(struct wled *wled)
 	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
 
 	rc = regmap_update_bits(wled->regmap,
-				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
+				wled->sink_addr + WLED3_SINK_REG_SYNC,
 				mask, mask);
 	if (rc < 0)
 		return rc;
 
 	rc = regmap_update_bits(wled->regmap,
-				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
+				wled->sink_addr + WLED3_SINK_REG_SYNC,
 				mask, WLED3_SINK_REG_SYNC_CLEAR);
 
 	return rc;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
