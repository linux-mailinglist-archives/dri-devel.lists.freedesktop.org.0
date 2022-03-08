Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D177F4D132D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681110E461;
	Tue,  8 Mar 2022 09:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435F10E3C5;
 Tue,  8 Mar 2022 09:17:05 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id c4so15602915qtx.1;
 Tue, 08 Mar 2022 01:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmFT5oX5WhVCf23K5lxag7wmD3+cmFNslYfO7qqS0x8=;
 b=O81yMp+25f3i4Ba9tRiFQz+DjxkdQvAuD7tM0reOk09HYPu27Ez//y0oCxFyKkVdbX
 R/sSoBoeDiFo9s4tYx2XUwDDcYv11O60isHjmVp68H+cDOTvi8MFquadaAVoClk9ja+v
 tgqVtJBnuu5sX6ALII+KxtdSdNG5YJKvNgNsV1Ul3e8zr5lBnLNM1T5puAZuTVFRO7fD
 ksosDAjF0UEXLdmjHrelsegsOtaPWnWvGdg7sUT57j0chxw3HyjuLjYpPYcdYKd6K5Sg
 VpzY5pDcfNa8suOuQoEaU1G9l/32J/ptGF+spDzNB9CfSYivKYkjoiflodvPIwrU+pjK
 AQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmFT5oX5WhVCf23K5lxag7wmD3+cmFNslYfO7qqS0x8=;
 b=CY+7BUzJhvfStFKTjP1Nyd3XDxDb8tkQf3JSif6Ou2l4mzylDufXPLORaURXjHx4o0
 2Oup1NPgGoNkreGCi8lmoOT+hzfnIm4y8X5NkwUiS54Ajq2bLoRUj6Lt1z/3TYymHpMN
 9dQ/FrwEPSDdwW7cHlSrGiMAx7CgbNtUNczrs8aIqyDnNs/Hpg63csqPBk4DghpmQSUD
 +9L9buaoyY092hKg7LSiqSLWJR4J5DdQvb2I3NIEMMu9LWmcjN9Bpu4TBvda+TiX8i0H
 VcpUc+W8Ihmp6s0Ax5JGm3DPEFg8Y7eZ8Lvh4g5o+KnE6QGYOD/bPDQ+Atw3TJnSD13j
 kFVw==
X-Gm-Message-State: AOAM531j8yPBgRj+0f0kZ+HDkmxf2sfylJEyfhfCQ0B9q+Uy1vD9Z223
 LCik4Vypx1mp3TJeDw+e/WM=
X-Google-Smtp-Source: ABdhPJxfpMw9rImA2Ik5e7BO7RxSWcCdqoCiOk0uGbtELOW0XSZkacMxARR5CzcafSh1EaJcCfPZNQ==
X-Received: by 2002:a05:622a:13c6:b0:2de:8901:e3dd with SMTP id
 p6-20020a05622a13c600b002de8901e3ddmr12911101qtk.16.1646731024127; 
 Tue, 08 Mar 2022 01:17:04 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac87d86000000b002ddd9f33ed1sm10976726qtd.44.2022.03.08.01.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:17:03 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: joonas.lahtinen@linux.intel.com
Subject: [PATCH] drm/i915/vlv_dsi_pll: use min_t() to make code cleaner
Date: Tue,  8 Mar 2022 09:16:55 +0000
Message-Id: <20220308091655.2078825-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 deng.changcheng@zte.com.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use min_t() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
index df880f44700a..f801f7ec3f9a 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
@@ -393,10 +393,7 @@ static void glk_dsi_program_esc_clock(struct drm_device *dev,
 	/* Calculate TXESC2 divider */
 	div2_value = DIV_ROUND_UP(div1_value, txesc1_div);
 
-	if (div2_value < 10)
-		txesc2_div = div2_value;
-	else
-		txesc2_div = 10;
+	txesc2_div = min_t(u32, div2_value, 10);
 
 	intel_de_write(dev_priv, MIPIO_TXESC_CLK_DIV1,
 		       (1 << (txesc1_div - 1)) & GLK_TX_ESC_CLK_DIV1_MASK);
-- 
2.25.1

