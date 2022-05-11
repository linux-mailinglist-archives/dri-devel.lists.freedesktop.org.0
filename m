Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F45231D4
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA0010ED68;
	Wed, 11 May 2022 11:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6712010E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:35:23 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 185so2020498qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onb5iDrr9AZU/Apv2XZLPoTcQR9Y3vPO5TDtvXQcOxQ=;
 b=oVqrjx29MINK52QwG0IJPDvlqXIqV1zPBJuiMpjtBXE/hIPoGg2X0+50kTplBxthYH
 D8vgtq7PprMfds50WIs0tN7TVvobuqfjnLIvdWXISuIiqeyE14SDl6KP700a2MzxgN9U
 KmHV6SKRcvfFxc5H0gQFg8kXvtmVCbsfGZAqc8bMksmhSlQaFXrPcvPZBevEYfcwda2m
 jHnGyRIfPk7F7REPHZz6eG3+tIEv+Cpt7/NgiuVGUr8fWtzNw+WwdCOKvKoZ2RXTTMxv
 mLVsvIBTP+s6aq5z94/ajvYjXSudDUOeXLMEHNAvjE26Ie5qRTNfXMVAcxU3Li5u7xdI
 vKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onb5iDrr9AZU/Apv2XZLPoTcQR9Y3vPO5TDtvXQcOxQ=;
 b=ejSFRnXMTi0Jtmyp6AKWR1Y+qhC4o8yEkWJPKleZS83HwJIOBb4jU3B4cFDts+MC/D
 dzRDF2TKr73Z+M1pAXpQo1RlOfm78bt64fMXqeWdpK4gzQM4Fh7lXGXzY7IPGUllWNkw
 uuZNluJaf0qZ54AbzCgQor5SxxLenRrVdfPNKlU4Q389TNFOUYdW5bqMVBCWruHvaDK7
 TEP6//uDLFeQWvMsDu5e3y1g6mBKgvh89+D6qPwnYKnmA46E0iiXw6OhG6wMBl291qBO
 qQN/rnXEtHo4GU20oodEW2o/9y7JF2VoXcwEMgb16x8ML0nQIU+iwauuQoKQShYOKJKZ
 vwtg==
X-Gm-Message-State: AOAM530YWKCBN/OiuKRJox3QPzUsbKbyucxDZKrzYmXHl00Vdwi/AL96
 yzCD/LUU6Lrz5SuwdHv0sXQ=
X-Google-Smtp-Source: ABdhPJxvEn0z8OWVAW1knWQ+gSB6bMqF0l8ZwTwgkUjNFMazkzowO+pRO9zxox34S+7OYWmauNF4wg==
X-Received: by 2002:a05:620a:2407:b0:6a0:5027:f4d5 with SMTP id
 d7-20020a05620a240700b006a05027f4d5mr16378491qkn.318.1652268922439; 
 Wed, 11 May 2022 04:35:22 -0700 (PDT)
Received: from master-x64.sparksnet ([2601:153:980:85b1::10])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a05622a099a00b002f39b99f6basm953377qtb.84.2022.05.11.04.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:35:22 -0700 (PDT)
From: Peter Geis <pgwipeout@gmail.com>
To: linux-rockchip@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/panel: feiyang-fy07024di26a30d: make reset gpio
 optional
Date: Wed, 11 May 2022 07:35:15 -0400
Message-Id: <20220511113517.4172962-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511113517.4172962-1-pgwipeout@gmail.com>
References: <20220511113517.4172962-1-pgwipeout@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some implementations do not use the reset signal, instead tying it to dvdd.
Make the reset gpio optional to permit this.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index a9cd7135cb51..ee61d60eceae 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -209,7 +209,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
 				     "Couldn't get avdd regulator\n");
 
-	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
 				     "Couldn't get our reset GPIO\n");
-- 
2.25.1

