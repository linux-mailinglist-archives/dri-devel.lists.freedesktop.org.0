Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E646D9752
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 14:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16D10E271;
	Thu,  6 Apr 2023 12:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE510E245
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680785470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a8vJf32VjBTqhSXC4UaNWwEC2++PydY9gb3nY7Y6vs4=;
 b=bMHaB/R/9Gu7JrZzTLfOWF0A9YDwk0xcK956EmVrYt3TdovRY5VDOw2uE9KyoEZ+rmutz1
 iiGDD3cEoM4h+5onf79CLA48Pev0lB2yQAI4U2Sp060nhAGHRxlx1Cvrtqv6GuNKY+Rde8
 MxQjCffMvvPmJibrMOie+Ta1Ok3PSYA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-dPlPkIUiPsKURTfBcTcfzg-1; Thu, 06 Apr 2023 08:51:07 -0400
X-MC-Unique: dPlPkIUiPsKURTfBcTcfzg-1
Received: by mail-qv1-f70.google.com with SMTP id
 f8-20020a0cbec8000000b005b14a30945cso17815007qvj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 05:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680785467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a8vJf32VjBTqhSXC4UaNWwEC2++PydY9gb3nY7Y6vs4=;
 b=xOYhteObCT3vOxbSmpPVV+RrcR50IiEAzmT5GdXGhWkQC1FKTZf8VC96Gw6IzTYnmM
 Y6pSaKoyYPoFoDhZR52DW1Sgh3ezeiaWmx94Twa2vkBlZMxhh6C/A14VGtOm5QWE2fPx
 jLpju0S/KHJGrBf0Zr0AcXUlk4utF4MgOXBRuBFWLM8uVJHmzGvOj2S3PPXmmXkox92R
 sv6YMaNRRvrMs155OWzLmv9Sbj9q2pf5tml7LS1tWyo130WIOhwvPUhwgjJBGTz2Jn0U
 cfAlVVw/uIk6g5hLOFSJa2eifaMz1R40NXHar3072UMpptBeXsYE/iGPWTc7FdB+MjA7
 VA5g==
X-Gm-Message-State: AAQBX9fjBjExyNgytN74fLy1l9jDFt8PWF1PSAf+xfZnrkiEI8K4/LgI
 Q7fq2csWbvdd3tDsuuGLMlF/kcbnLrqRsyE8Dvg2BI2eN7Esr/iesD5xNki7YRt1Wihmhzil6GK
 7vbCDgG6valUvxySO1tFNsQACow9T
X-Received: by 2002:ad4:5ca6:0:b0:5df:450b:8002 with SMTP id
 q6-20020ad45ca6000000b005df450b8002mr4830654qvh.31.1680785467002; 
 Thu, 06 Apr 2023 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSPMv3nhVaAKMIwGcpzI1WXbVj1KNben3bHvDLvNgWUG5IbK0u6ODiRzBeHNfaFX4xk75FiA==
X-Received: by 2002:ad4:5ca6:0:b0:5df:450b:8002 with SMTP id
 q6-20020ad45ca6000000b005df450b8002mr4830628qvh.31.1680785466773; 
 Thu, 06 Apr 2023 05:51:06 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 de11-20020ad4584b000000b005dd8b93457csm489252qvb.20.2023.04.06.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 05:51:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Subject: [PATCH] drm/nouveau/gr/tu102: remove unused tu102_gr_load function
Date: Thu,  6 Apr 2023 08:51:02 -0400
Message-Id: <20230406125102.1952202-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: symbol
  'tu102_gr_load' was not declared. Should it be static?

This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a242..a7775aa18541 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
-tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
-{
-	int ret;
-
-	ret = gm200_gr_load(gr, ver, fwif);
-	if (ret)
-		return ret;
-
-	return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102_gr_av_to_init_veid,
-				 &gr->bundle_veid);
-}
-
 static const struct gf100_gr_fwif
 tu102_gr_fwif[] = {
 	{  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpccs_acr },
-- 
2.27.0

