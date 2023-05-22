Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FF70D6D7
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD3410E3DD;
	Tue, 23 May 2023 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD0C10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:51:54 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-76c5558ba95so68307239f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770712; x=1687362712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BqOE5x2+ni1n15spyoB1Lf2HOj8Vrz/keawyBSdQh6Q=;
 b=FeDPVWKX1y/A+/QN/GgyITdBkWKhzQmBXtOAeveM9fakQRw+0yCSiYgtoP3FdEHP/A
 OQpw7FZ2D2R7+5M7D+epBC9QXCtZWDUbXwtAa3HDGSK3FX9KobZHcA0ewL2ThRfwrJtL
 NeJkQ4kdJ1zHLLgH4Ai2bulcF5EyuHLk7wan0cKr3v+JIQa1veewHE/Yq9LpCND12YUt
 3i6UpQIY/gh9EmgYuvIROAW9HaYXBKsbshfCoL1aFxneOx+qtzwUYmcxvHJNCtXWGav8
 53CtWiKN6P4giZYGPfQuhz7zps1qF3XLoGMEc2VQ5ZdAPXyY4cXv73X5kYAMJcF9evxi
 Mqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770712; x=1687362712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BqOE5x2+ni1n15spyoB1Lf2HOj8Vrz/keawyBSdQh6Q=;
 b=jVlz2WDhhL3pgdccTOreU8JED61bVmS1FuuBT86XKO7JO7BQ+Lw/JbhjeIK9a1725e
 HEH43rDw9td5ULetMjKJBwQ1K36WAK8R751Z5N1KC2iGoCyiI46JPhHYA92g5+CgQEkt
 7zpBCXcjhRDVdDb4lFtHbQmaylbS8Asd62PJBilYeufvH5gjuT6W1WuqChI0SfhbCQW7
 yY16NOydy5Tv+MkpzVRZY/zZCJU9qPaFfPnpGCi7C3ABNZf5iC2YXHwdrJUt/rvmnxtm
 XYvTuiSXVz0iR0Zd02KGWoq04cL0cLb/eDFVYAlR8ETICPTXS0BRn+HF+hMG8ofgfsKW
 0Eng==
X-Gm-Message-State: AC+VfDylT6pQJcJfFs3hp8U2eKw/FjdjMf7nxMsNdak7qHLDklsVLVf7
 mQc2I+DmHWGf6dSKXRvd+gE=
X-Google-Smtp-Source: ACHHUZ7g1TMkvP1QL7x3isKwGwC18gojdks6P7npooE82OjMS3tbyVL8pfNYyS+woUW674ZPdO+mUw==
X-Received: by 2002:a5e:8912:0:b0:76c:8cbe:c8fc with SMTP id
 k18-20020a5e8912000000b0076c8cbec8fcmr7928967ioj.3.1684770712392; 
 Mon, 22 May 2023 08:51:52 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056602220f00b0076c6f5b8db5sm2083125ion.16.2023.05.22.08.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:51:51 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] drm/rockchip: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:51:49 +0000
Message-ID: <20230522155149.2336620-1-azeemshaikh38@gmail.com>
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
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/rockchip/inno_hdmi.c   |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f51774866f41..9afb889963c1 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -797,7 +797,7 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
 	adap->algo = &inno_hdmi_algorithm;
-	strlcpy(adap->name, "Inno HDMI", sizeof(adap->name));
+	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
 	ret = i2c_add_adapter(adap);
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 90145ad96984..b5d042ee052f 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -730,7 +730,7 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
 	adap->algo = &rk3066_hdmi_algorithm;
-	strlcpy(adap->name, "RK3066 HDMI", sizeof(adap->name));
+	strscpy(adap->name, "RK3066 HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
 	ret = i2c_add_adapter(adap);

