Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AB70D6E1
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E310E401;
	Tue, 23 May 2023 08:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2397010E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:53:10 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7606d460da7so91385839f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770789; x=1687362789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sLmTrczoZ4J6h066r40/h6RRWtVqrmn9y6L7z99mhDA=;
 b=lpf/KCk2o5YuPZx1QBrkgf1w2q7/f7AMacPCaayBzf0ydgnri8mN4UPzfhfTEkoH9g
 Hiv8S4T5u3nWXvti74xZiSj5Up4Q7GDop3mGqtiO87mKHzrWX5WznpPrPp0r0ynzZXZz
 pqMa/67Z5Nxj8aYsAeweBTxyes/LbbbPrjbZd1KRBcxwidCrTVz3vWow0avbSOsknIFt
 cwu/wuM2Oimy1eKg2Ksa3NHd0csEdRQClR+WZ769yhGOk8d2Top9MW544F3qyyD+ccqh
 IefbqvVrMmrA5hnsUsFyQD1toOeR0mtOHtCyg3npZWsab1uH3/2IZbhmh0NEjwyT9+qk
 KZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770789; x=1687362789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sLmTrczoZ4J6h066r40/h6RRWtVqrmn9y6L7z99mhDA=;
 b=GTcmfoDxnxhZxvUYOWMl4p2BAOi4B+3b0zNyafagQ3NmyVlOZ98NqPBbS56ghar/W+
 H8murMlKadFWYbKf7a54kukWuqn8HtwrE053Ys3XLt0pxcqOQvHcV+YpjniMesrd9zvJ
 omxJPuHsX0R2RvNfJ1M835sHed6iasd1BK31PqSbcmqQsiccii7jMVq2098bC7Dl0dAd
 hsLJHe1XNbNtDi4NcjFULcOBtewKOEzlJmlSXJBmrSmEmcdwQi5ANew8vvcUDTouLfMm
 CW09vb5QpUYts7WwULOfapvuCarwgVCa1bGHBzMjWjrTymDVAmwm4twP0zWGmodB4CVS
 0VKA==
X-Gm-Message-State: AC+VfDxE0FpNjLPEUsP5XLR+yhE9/9eBn3/RfgwGGuxE3nTeDuVyCKLq
 nwpdSRInNzruyDEifrC5jBM=
X-Google-Smtp-Source: ACHHUZ7Oyjj1q6eLDUndWseC7ayiIC4Ona7A2tWc3SNYqjyQ+KripQZ9DB1twIxrC82af0kBQVhI2w==
X-Received: by 2002:a5d:8ac8:0:b0:763:a8a0:c7c0 with SMTP id
 e8-20020a5d8ac8000000b00763a8a0c7c0mr7033861iot.10.1684770788928; 
 Mon, 22 May 2023 08:53:08 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a6b6601000000b007596db3874dsm2016483ioc.35.2023.05.22.08.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:53:08 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm/mediatek: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:53:06 +0000
Message-ID: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 2fc9214ffa82..4d39ea0a05ca 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -295,7 +295,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	strlcpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
+	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
 	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;

