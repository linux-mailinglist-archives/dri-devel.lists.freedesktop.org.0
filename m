Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8A743F7F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2AE10E4AA;
	Fri, 30 Jun 2023 16:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75A510E4AA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688141614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDzqJbvPB3+ncS0JVgMogsHg0szcNxLVo0nvRHNMeoA=;
 b=cIonQwLupCxlbH5M+6Imd8Xi1czbw/1tcOq9oWB48qfGkl3toEljjsVpPzcDb+OxyWQPGW
 qryd8IhkdhT91cjh8NXV1mFA58j8+OeKWjfYVnrVBTqSe6ilV2833gGUhiR/yQq30wfwjT
 E2zykA3yFfoOckFnhBrEnrPtzjIBFnQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-U9Obd7ZTOtuU1nfSsdNC8g-1; Fri, 30 Jun 2023 12:13:32 -0400
X-MC-Unique: U9Obd7ZTOtuU1nfSsdNC8g-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-98df32a8bcaso27524266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688141611; x=1690733611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zDzqJbvPB3+ncS0JVgMogsHg0szcNxLVo0nvRHNMeoA=;
 b=F7CN1crOXemWyhY2FvXdrZjtVnykDwe38wmMDSQj7/AG4+hyXHdzS5itTUH77vJn74
 CHrl+eVzVrqEXoj2081bvQtxhdBMnQoKlmDJIIicVRFjyZKUYSFoaU37ishO8KvXUkSv
 nM+StwNOnq5B+RK+TgKLhVwAgpiWQJP17MlkVgR926HIXSNrY13RJL2KGcy71hidE8pP
 YRhhZOe6KfpstQ6A2+bdG6u9+w5I3Y/111ucFXbrW91oXvIZFJVes/unngRm7LMmYtoy
 42rU6D6HY+0d+CNSWDr0c+MZ2YMIdBqIrgn5fOOnlY2QDImYwF+07LGdmEauBSoIQ7QG
 jJMg==
X-Gm-Message-State: ABy/qLbBj0HcZFjNcLTb/KJDRupWveD4Rd0QAs0l8nMXFIfanY5W9FKO
 Hny+9qCWUuHzes/GZ+pr61ALx5uuz/M+OfL7X9WxTlfu+1bHokEV/MtPZrvXLUKbkH93Fl46REJ
 4KjUSo5FNDhdQ6uZwivT5IGE4lTDa
X-Received: by 2002:a17:907:101d:b0:974:5480:6270 with SMTP id
 ox29-20020a170907101d00b0097454806270mr2221311ejb.0.1688141611100; 
 Fri, 30 Jun 2023 09:13:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHboVEA9uwXPyVU1Q8VvIf0AXphxjPZ6dsb08b1Lb3IKDCnNo6XzcKAR3OcUmRaH9Lq3IFlhA==
X-Received: by 2002:a5d:4a91:0:b0:313:ed10:7f53 with SMTP id
 o17-20020a5d4a91000000b00313ed107f53mr2727668wrq.6.1688141208961; 
 Fri, 30 Jun 2023 09:06:48 -0700 (PDT)
Received: from kherbst.pingu (ip5f5a301e.dynamic.kabel-deutschland.de.
 [95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 cw8-20020a056000090800b00311d8c2561bsm18551755wrb.60.2023.06.30.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:06:47 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp/g94: enable HDMI
Date: Fri, 30 Jun 2023 18:06:45 +0200
Message-ID: <20230630160645.3984596-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
index a4853c4e5ee3..67ef889a0c5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
@@ -295,6 +295,7 @@ g94_sor = {
 	.clock = nv50_sor_clock,
 	.war_2 = g94_sor_war_2,
 	.war_3 = g94_sor_war_3,
+	.hdmi = &g84_sor_hdmi,
 	.dp = &g94_sor_dp,
 };
 
-- 
2.41.0

