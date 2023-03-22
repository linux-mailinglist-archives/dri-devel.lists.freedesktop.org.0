Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1826C45AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38C410E8BF;
	Wed, 22 Mar 2023 09:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6FD10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:07:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v4-20020a05600c470400b003ee4f06428fso1388958wmo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679476035;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sgoPZHhwzWdFKXnDcAIhowUCI5lnMebfejYcdgL1dJc=;
 b=LZ1aEKYA367XVcEFCBHSX7A56UANMixln7g0rnLRfR6BoPNgn2rVDaAIO0szGTFBGi
 yYs2FaG8oxss1eKST0DW5gMX4OEMlTOGDDI6eGfTZMCLLd43z8jih7qE8u+LoyxuN3Gh
 ZnhibhSGs5u0Gq9xQ0CNDCu98U3DVeNZD9nyY+IOhgyMSfn65bRy6mz0WVTiszLZi9LO
 nybtrV9h4EaSEy/Oe8V1yiJkekduW3XQnTAi+TudKjkw8yez/mN3QaPExmJTsbpGPCMo
 7ZX6NCuk1UtIXRihZUtlp5qmJSg6973rnORIDEUSKkvCVuKs5jT4D1KQ+jRPG0KEeC9u
 j78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679476035;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sgoPZHhwzWdFKXnDcAIhowUCI5lnMebfejYcdgL1dJc=;
 b=5jASmQe3vG3JR96A7jqITGtpWT4+t/5StqkKmE9s6SUwQzsGcEZ3OTKclMKdIOIpwA
 3madyRR5RUtTin0EpF7d9RXs3V+DAPJNqydLhvWaimOENn/61Plq381AIg3CnaiNcq8W
 7+Zng3boPAxnTifHVo4ZUunSxiuywwJQF9dR/Y450vV1oYhuBQv9E0eLeLTOB0iKoRYD
 ZeDSNH/qbfdhzqXZ7/F0lPG4ZPz5DCoOElNZdgHnsEqO5OPYWXuSkIXNckkm3Fhmg5ex
 Js2gThT3N9Q0x/ZNm2E9Ao5hwgIz9jWGhhjtNH48JwVXh1fPWcG29xl41YUrdWqNgZWG
 M5rQ==
X-Gm-Message-State: AO0yUKXDiflNG7lcoPAWsQ/9fG7KQDNvmh9x1u6sKjw5fbsL3F68DxK4
 IgVHXHbXMFRbw4tpJf7OFAI=
X-Google-Smtp-Source: AK7set9jgPjUxqGQ6jwxmB0a217WhVojsK9yGHhtU6jvRwV5m1Yl5QO4gQ+clKQvKwBfsRLF5Y4urw==
X-Received: by 2002:a1c:7c0b:0:b0:3eb:2e19:ff3a with SMTP id
 x11-20020a1c7c0b000000b003eb2e19ff3amr4578635wmc.7.1679476035162; 
 Wed, 22 Mar 2023 02:07:15 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c204200b003e91b9a92c9sm16050285wmg.24.2023.03.22.02.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:07:14 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:07:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] drm/panel: magnachip: Prevent error pointer dereference in
 probe
Message-ID: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't dereference "db->dsi_dev" when it is an error pointer.

Fixes: 249a4f5e663c ("drm/panel: Add Magnachip D53E6EA8966 Panel Driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 8c362c40227f..26d358b9b85a 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -418,7 +418,7 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 	if (IS_ERR(db->dsi_dev)) {
 		dev_err(dev, "failed to register dsi device: %ld\n",
 			PTR_ERR(db->dsi_dev));
-		ret = PTR_ERR(db->dsi_dev);
+		return PTR_ERR(db->dsi_dev);
 	}
 
 	db->dsi_dev->lanes = 2;
-- 
2.39.1

