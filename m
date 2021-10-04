Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF89421779
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE386E876;
	Mon,  4 Oct 2021 19:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4506E207
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 19:27:49 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 85F901F6A2;
 Mon,  4 Oct 2021 21:27:47 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Date: Mon,  4 Oct 2021 21:27:36 +0200
Message-Id: <20211004192741.621870-6-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004192741.621870-1-marijn.suijten@somainline.org>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When not specifying num-strings in the DT the default is used, but +1 is
added to it which turns wled3 into 4 and wled4/5 into 5 strings instead
of 3 and 4 respectively, causing out of bounds reads and register
read/writes.  This +1 exists for a deficiency in the DT parsing code,
and is simply omitted entirely - solving this oob issue - by allowing
one extra iteration of the wled_var_cfg function parsing this particular
property.

Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 27e8949c7922..66ce77ee3099 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1255,17 +1255,17 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
 
 static u32 wled3_num_strings_values_fn(u32 idx)
 {
-	return idx + 1;
+	return idx;
 }
 
 static const struct wled_var_cfg wled3_num_strings_cfg = {
 	.fn = wled3_num_strings_values_fn,
-	.size = 3,
+	.size = 4, /* [0, 3] */
 };
 
 static const struct wled_var_cfg wled4_num_strings_cfg = {
 	.fn = wled3_num_strings_values_fn,
-	.size = 4,
+	.size = 5, /* [0, 4] */
 };
 
 static u32 wled3_switch_freq_values_fn(u32 idx)
@@ -1520,8 +1520,6 @@ static int wled_configure(struct wled *wled)
 			*bool_opts[i].val_ptr = true;
 	}
 
-	cfg->num_strings = cfg->num_strings + 1;
-
 	string_len = of_property_count_elems_of_size(dev->of_node,
 						     "qcom,enabled-strings",
 						     sizeof(u32));
-- 
2.33.0

