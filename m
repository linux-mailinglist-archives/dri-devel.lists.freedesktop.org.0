Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC970D6E9
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46910E3E5;
	Tue, 23 May 2023 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8910E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:53:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3311691ebd0so15249645ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770814; x=1687362814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GcASE1OrQyQi7q41P2SNchLMQc2DgftSxURxly3Px4M=;
 b=NB4tWHOjxmpjqH1CavStoHfHO7gwuRZAoxBoRJ1E77Kjapa/DvQ2f3G50SC2sEyA0v
 E3SHK90R8Jh4Bqsvbzudu/ufN9eGMDq8jaUjs/jfryNSvLFZfdJ34axmzRExKCLFocnb
 2hyXX536tpiSEK9nfyyZVbWky6Ta4VVNjhusop+i3pXs0s/bhgv2yJeYpSQE2mMiWgNd
 SoldQsemhEvJNDeyuk0F0uPU4hu8Qb0+zbrZPpP7ZyM+snhYQGDtDC7q016J6Prp29DQ
 U4hvFTRUQ5BKMU1pN2ZTLHsSQj7sm9d1+9Cy3sM2x4D8m1e5DBXo/lbVaIk/X22E7omc
 nZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770814; x=1687362814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GcASE1OrQyQi7q41P2SNchLMQc2DgftSxURxly3Px4M=;
 b=WxCxEdUC9tfE84EPssZrszCzrW7Vu9ORdKzC1e1LD9yO7rnXr/xupiwwgnSWwQqfSx
 /B7Z5n0i+N1vp0Lwd3qIG9L98QiwWrDOP05C8WNncQFU1OcvnOwQERi7A2eybLsxeIpX
 kcZ/upWrPLbMxVz4qsdMFRR3nYUsnRtMDyDevXbt8/Ucv0AI5ZaraR2/HAMm3BtUKNMA
 YiSmBAyg6YAFpE2vDpTlZ33LXnlPFfrQnHi2QkvpBRcclkp5taI8RNzNXW1Z6DMQIkY0
 wFI1ZKpggku8URovySqjiNRwpbz6pGuKfrCPdQ3Xo86xUo8yjAG/NJW9FmpxEEthWW/g
 xz/g==
X-Gm-Message-State: AC+VfDwgsZkKN4e6nijWjYXDEhYI/977jp+0ZjnDjLIzJkSSlvFUs6y7
 vQbk1ofqewEtJw12buEUW0k=
X-Google-Smtp-Source: ACHHUZ7ooSC2UtbAlM8vlneO+IMFO5YP+L0irn37IABBL9D6o/vm+eTQElmw15bt80zcMfBWO5nZ4w==
X-Received: by 2002:a92:da8b:0:b0:33a:6a9:6568 with SMTP id
 u11-20020a92da8b000000b0033a06a96568mr2007278iln.30.1684770814344; 
 Mon, 22 May 2023 08:53:34 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 cn6-20020a0566383a0600b004141ce991aesm1787491jab.179.2023.05.22.08.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:53:33 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with
 strscpy
Date: Mon, 22 May 2023 15:53:31 +0000
Message-ID: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-hardening@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index c7d7e9fff91c..d1a65a921f5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -304,7 +304,7 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
-	strlcpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
+	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
 	ret = i2c_add_adapter(adap);

