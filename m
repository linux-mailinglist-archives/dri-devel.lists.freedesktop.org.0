Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAF7069DB
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D804F10E422;
	Wed, 17 May 2023 13:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9810E414
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684330278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qLttclHj7hHhcC/wb0vN9cazD/0VuMDK2HeUMirb6Q8=;
 b=VeLNIEGF/3i8WwXiyvLAH73xkL4rSZqtEx6mnFaICbh02euPDKFtvMZJ/prZrN0usiP5UN
 G8HqFdSzJMyfu4pLiLlRfXklgpsFyjsIvToWCs7gGp/syt97iJE3eBVsuxkKGoSWqYdKfV
 8f2IGKeAHwBMYpKhzNJWSL4shRB6JS4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-7Ue6czg4MrWRjcwcEO2OCg-1; Wed, 17 May 2023 09:31:17 -0400
X-MC-Unique: 7Ue6czg4MrWRjcwcEO2OCg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-62386d1f3ecso3989296d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 06:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684330276; x=1686922276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLttclHj7hHhcC/wb0vN9cazD/0VuMDK2HeUMirb6Q8=;
 b=llKcAVDqYVkukxV00piAguTLaZ280COPwZu2axRZjUZULxX3NtLwKa31pjmKlXjkJx
 hkqYhCWhGK/Z0bHAyyvhYJCpVo27sPScoP8u2EbDKaul3+DHjN8/KRR1TYLB8XvhtHOw
 Zy+1WPdlZpMyGFoXTJ7jGgI7e2JaCM56XvKmagFeDIs8Ismr/QZBONZilzU6jnoC2Wc3
 DpXwlLIOs08uvk6uGQqQ2tq9Rx1MWyiLXIRxH8SKJzKsTX78hQ6z7Y7A+wuzsbn7Biml
 QKKFAeW6Io70HHWGIydGH/W0cAkUYo5vV+WOdCCO5VqhL2GLz1vdRYvNT+iRdmV8/bVH
 2eEw==
X-Gm-Message-State: AC+VfDxhoTbVgWtHB0q6shbVo1mRrY1R+xDry6GBH7BFR6f4lBu4Azop
 EMdQe5gpB/Epv65gpa2YOoJs6ddJd9DNn/bWTr7MeRe2vZcdxKLIn07o60MVn4KP5hF1reS9uzc
 xmNPnkfONHvJFdjG5Yos4Wd3cOlXk
X-Received: by 2002:ad4:5cce:0:b0:5ef:8c35:296c with SMTP id
 iu14-20020ad45cce000000b005ef8c35296cmr59457579qvb.44.1684330276114; 
 Wed, 17 May 2023 06:31:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pTwMVj9jWn4rorpVRcw8fHanBa08ioE8BoJ41Rc+agDBnPWOfYwP+DUBx0MafDcOonzskyw==
X-Received: by 2002:ad4:5cce:0:b0:5ef:8c35:296c with SMTP id
 iu14-20020ad45cce000000b005ef8c35296cmr59457545qvb.44.1684330275723; 
 Wed, 17 May 2023 06:31:15 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a0cdd8d000000b006215e9d0503sm4691777qvk.21.2023.05.17.06.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:31:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Subject: [PATCH] drm/nouveau/acr/ga102: set variable ga102_gsps
 storage-class-specifier to static
Date: Wed, 17 May 2023 09:31:12 -0400
Message-Id: <20230517133112.873856-1-trix@redhat.com>
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
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: warning: symbol
  'ga102_gsps' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 525267412c3e..a3996ceca995 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -45,7 +45,7 @@ ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 	return 0;
 }
 
-struct nvkm_gsp_fwif
+static struct nvkm_gsp_fwif
 ga102_gsps[] = {
 	{ -1, ga102_gsp_nofw, &ga102_gsp },
 	{}
-- 
2.27.0

