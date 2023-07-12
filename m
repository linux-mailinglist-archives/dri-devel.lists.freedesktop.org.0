Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B1750E81
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2410E591;
	Wed, 12 Jul 2023 16:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC45A10E591;
 Wed, 12 Jul 2023 16:27:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso656836f8f.0; 
 Wed, 12 Jul 2023 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689179221; x=1691771221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AJl3fVvqTxy3IObvOvAgC+gdEFfujxGEicBja5DSSB0=;
 b=eGCqYBfaMuQ8WVXZMIZVYMkG+d5n4J3s3WcyOCnT7z32dIPqy7ulZyaRFvXkZlztcK
 fF0Lxw5ZoraBKfuNmAbDkbx6jhjZokijpBya1OaXcy1nyfjW8Yi4cz2HhGaxnbpfrKnj
 rZ7D6sNZNslILlhis83+MNuRKSEGlzbfE/QbG60mGYMWceHoMDYQqu0QVFKz3zX0ZC6s
 4yIjcsu2WmvrzdaREe5wbf4DqYFcyOSxTLdv3fRn6knKhf5o68e30EhNclgoVIKuWUIT
 fdaQmV44r8n3fRlOm4YwBco69CqXm/hOFRkykAK21p0Dk9IVhG8k6rUdzQi/jzFPJ48Z
 gP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689179221; x=1691771221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJl3fVvqTxy3IObvOvAgC+gdEFfujxGEicBja5DSSB0=;
 b=fxkq5p3KJ+jyaRodQ4rpteqs+iW5mdv7r8xD47eJAAzwD8xFalLAqr0sDZBETm1vC+
 Xal8XGD8TnR1mAbqU1piMw72FV+qJbltQ/pAZ7Q4pumbcVUMt4oIOEeqvYqqElc0Olml
 SBiNHeYlYUyWa5XYcll20Uv77C6jo+vjQR4gMTEOY7H0Vnmbw1Dh0+MgdlZx8y+1HhzQ
 P+C9LKbm1FgX0CgdbXRiarp0JE3iIw7vH6ZuzmV+EhQJ1nVsTdenE6c/5lL+bHj5Ws0f
 OItCSmEsGjTg6JSVLNnCvF8RrVh5HvUosad4cInH5o0B2oN2B6GngyWGNPnUCawee8IJ
 +paw==
X-Gm-Message-State: ABy/qLYEU55N+lEr4SmttdHENIAsPvRxBMLyBRO1mdaDSD06BQg0cDmB
 S6PnHZNdcN4jjNaaO47m2/w=
X-Google-Smtp-Source: APBJJlH97hOCkLm8PPVqZF2Coy2xKx+azmJ0CZdE9BOK4pQs/hbtIQBURLff589nnhwPHM72vaexsg==
X-Received: by 2002:a5d:67c7:0:b0:314:2f3e:dca5 with SMTP id
 n7-20020a5d67c7000000b003142f3edca5mr2280473wrw.28.1689179220809; 
 Wed, 12 Jul 2023 09:27:00 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6790000000b003112ab916cdsm5538291wru.73.2023.07.12.09.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:26:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH][next] drm/nouveau/bios/therm: make read-only array duty_lut
 static const
Date: Wed, 12 Jul 2023 17:26:59 +0100
Message-Id: <20230712162659.466996-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array on the stack, instead make it static
const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
index 5babc5a7c7d5..31fb20cc5a9b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.c
@@ -156,8 +156,10 @@ nvbios_therm_fan_parse(struct nvkm_bios *bios, struct nvbios_therm_fan *fan)
 	u8 ver, len, i;
 	u32 entry;
 
-	uint8_t duty_lut[] = { 0, 0, 25, 0, 40, 0, 50, 0,
-				75, 0, 85, 0, 100, 0, 100, 0 };
+	static const uint8_t duty_lut[] = {
+		0, 0, 25, 0, 40, 0, 50, 0,
+		75, 0, 85, 0, 100, 0, 100, 0
+	};
 
 	i = 0;
 	fan->nr_fan_trip = 0;
-- 
2.39.2

