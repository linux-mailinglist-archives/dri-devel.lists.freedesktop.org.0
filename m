Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36F5E5C4B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78C10E0B4;
	Thu, 22 Sep 2022 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA7910E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 21:51:08 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b75so7323528pfb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 14:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=7Ccja+Ag2s+Qx2euqE4TqyyHiW0JG6WL4KMv9BkP7TQ=;
 b=o27w7GMus1TONUU/SoB082WN/uf+lNQ2Iym3idx65q8KoSHVUQQI8jsvxpawcZrJci
 k8NDe2y3UPCg8TbAVh6bLPDvuqVEd+QBeGxByeSpsAVQ6Uan8L7A/5nNjU67BJ5uDBUZ
 uf8lNM2DETblxnOdpYo9fo9/XXJ11XvrVlp3DyGl9XHicGA14ZFW+dzMO/YFe88QE4OC
 UfrtYOlByYtcvY4n+Cx8lB0v/pTQ5EFIUDx2B4vUm8Y2lPAqKLKurwbdsqXTzrI4T0c9
 VjhxcZ/exPeRS35ntaalmQzh7Rbvxm3jL2HnKbbwvHb/K5VD8QBzART3+A4Sc65Ba5oa
 cp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7Ccja+Ag2s+Qx2euqE4TqyyHiW0JG6WL4KMv9BkP7TQ=;
 b=dPP0oDjrWAQxTdaKu5bbskrjURuJe3/xLYb0Ynr++QPXbA9PsjoLwSnhHzGFxsNC5w
 NqPMRvcDNvogSCKWa0QfVLsWc/GfMUjsibxw6Pw6PH+xVFGggTr/XXzaBNY4snCrikPD
 FWV/gt9Be9QocHnegDyvCMox7ZIasY9RglPI/33Si0WER/86QK+NAttw6r9R3InGm/JZ
 WRXg9OaI4nwiv8Iyz33Yb6ArULv1rGw1aueZrvpzpdCbgcjC+vS4wHiTeoNRym0KbJI/
 kimX5Qc+C1iFaAjIpMa/x+5gsGjP8Hc78uVBcGwgpeS8y2nw3f/JyoLeJwYUWT/Zcx6J
 +ttA==
X-Gm-Message-State: ACrzQf2NdpFFrwItVAs/qEXFJntnlfeTUUV4nldfqMb5HlB9IOKRNmAT
 zh55hQdfTfkohS0rj26G0UY=
X-Google-Smtp-Source: AMsMyM4amkubcVbp27k9HQ0LdyI21SlkbR+waW6/7V2e5QqwqFFQ6NLWGW5B04PVH9BcWFGZQ/CMLQ==
X-Received: by 2002:a62:8403:0:b0:540:c1e4:fb31 with SMTP id
 k3-20020a628403000000b00540c1e4fb31mr239166pfd.85.1663797067443; 
 Wed, 21 Sep 2022 14:51:07 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a170902684100b00178a58f0ad5sm2582707pln.33.2022.09.21.14.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:51:06 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drivers:adp8870_bl: check the return value of adp8870_write
Date: Wed, 21 Sep 2022 14:50:49 -0700
Message-Id: <20220921215049.1658796-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 07:24:23 +0000
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
Cc: jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 daniel.thompson@linaro.org, Li Zhong <floridsleeves@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check and propagate the return value of adp8870_write() when it fails,
which is possible when SMBus writing byte fails.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/video/backlight/adp8870_bl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index 8b5213a39527..0eb4ae2ff592 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -567,9 +567,13 @@ static ssize_t adp8870_store(struct device *dev, const char *buf,
 		return ret;
 
 	mutex_lock(&data->lock);
-	adp8870_write(data->client, reg, val);
+	ret = adp8870_write(data->client, reg, val);
 	mutex_unlock(&data->lock);
 
+	if (ret) {
+		return ret;
+	}
+
 	return count;
 }
 
-- 
2.25.1

