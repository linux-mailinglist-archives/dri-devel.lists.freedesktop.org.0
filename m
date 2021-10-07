Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E27425F13
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 23:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4806F4DE;
	Thu,  7 Oct 2021 21:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A206F4D4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 21:34:06 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 277B63E857;
 Thu,  7 Oct 2021 23:34:04 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] backlight: qcom-wled: Pass number of elements to
 read to read_u32_array
Date: Thu,  7 Oct 2021 23:33:49 +0200
Message-Id: <20211007213400.258371-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007213400.258371-1-marijn.suijten@somainline.org>
References: <20211007213400.258371-1-marijn.suijten@somainline.org>
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

of_property_read_u32_array takes the number of elements to read as last
argument. This does not always need to be 4 (sizeof(u32)) but should
instead be the size of the array in DT as read just above with
of_property_count_elems_of_size.

To not make such an error go unnoticed again the driver now bails
accordingly when of_property_read_u32_array returns an error.
Surprisingly the indentation of newlined arguments is lining up again
after prepending `rc = `.

Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 8a42ed89c59c..d413b913fef3 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1535,10 +1535,15 @@ static int wled_configure(struct wled *wled)
 			return -EINVAL;
 		}
 
-		of_property_read_u32_array(dev->of_node,
+		rc = of_property_read_u32_array(dev->of_node,
 						"qcom,enabled-strings",
 						wled->cfg.enabled_strings,
-						sizeof(u32));
+						string_len);
+		if (rc) {
+			dev_err(dev, "Failed to read %d elements from qcom,enabled-strings: %d\n",
+				string_len, rc);
+			return rc;
+		}
 
 		for (i = 0; i < string_len; ++i) {
 			if (wled->cfg.enabled_strings[i] >= wled->max_string_count) {
-- 
2.33.0

