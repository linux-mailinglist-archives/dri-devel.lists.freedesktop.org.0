Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54736BF6DF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 01:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8710E071;
	Sat, 18 Mar 2023 00:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA6C10E071
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 00:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679099016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ro4nhrJ5Zq0SySOEipia8lU7rnzpGPE36NY88ytAvP4=;
 b=avrixyhNmlEQI3EYMYpH4VGlqEjo2d8jfn2bZpK+Lza/DaFWhTYCePrVHYCvR4zd/+GTkx
 VvoeqLxT/LKB8Nh8EGYk+7LQ5pOPa6rBUTFS0vPHOEdovtURHckpqU4E1No4oqbCDL1QSy
 +Jmnd334RHH1Nfje4DukeADEDev/lx8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-bl9gn6ckPyaFeQE2mEQ7YQ-1; Fri, 17 Mar 2023 20:23:33 -0400
X-MC-Unique: bl9gn6ckPyaFeQE2mEQ7YQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 o10-20020a05622a138a00b003bfdabf3b89so3361806qtk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 17:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679099012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ro4nhrJ5Zq0SySOEipia8lU7rnzpGPE36NY88ytAvP4=;
 b=NPWnA2D7xWpk0uSMIJ0+XOsfGe0tablbbzMNBOISaeWklGS379zJSg4UWcIqtIw4/Z
 aoupKE7V0Q0bUV9dBW0/Jk27UWXq9sc1IPiu09WHz0inMKdJ+gG50UegKvuibnY9gxTA
 p50FIGCO2YZlI0UtOTeM0GHtNHxEaiGm3IuYBd4Ac29EYjrn6x1xHhb2FndbO9cdiJWn
 p1gAfsQLJ/dF7aUknGMD8goVXMFbsA65iWY0sOgiNtKxfesO6dFnvQL52dPtQsrX/HWn
 ZvJwwqhJK9teoMd6aprcbJsypwerqsD7usmnvS/PQOYjP7rgrNscWMp9i8c/FprMKCyi
 mNoQ==
X-Gm-Message-State: AO0yUKUPp3HSfasxwyK1RlN1Us+P1+KtO93ifqZDbQ6OZC5sOIwaYiVU
 iBCjDI0h7H8hDJkoHu4KHhaHcUBA3UD5+XX1Q286GWeee9xwLs33MHDwrVBPaPHDeY+Z2eyfOpx
 7bTABvK95JtCedQG2oc70Z/LZwlqo
X-Received: by 2002:a05:6214:e62:b0:56e:9da4:831c with SMTP id
 jz2-20020a0562140e6200b0056e9da4831cmr39485353qvb.46.1679099012685; 
 Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set/fL421Kfl3tq1uEh7Q2OUg4WIgPPxO43SFyqSNmCb+PH/F1uG0zi5qpejfWxe5clSOu4VLzA==
X-Received: by 2002:a05:6214:e62:b0:56e:9da4:831c with SMTP id
 jz2-20020a0562140e6200b0056e9da4831cmr39485337qvb.46.1679099012479; 
 Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 a72-20020ae9e84b000000b00745a3b63569sm2623217qkg.107.2023.03.17.17.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234
 function
Date: Fri, 17 Mar 2023 20:23:21 -0400
Message-Id: <20230318002321.1675181-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/bridge/sii9234.c:870:31: error:
  unused function 'bridge_to_sii9234' [-Werror,-Wunused-function]
static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
                              ^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/bridge/sii9234.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 099b510ff285..2d17f227867b 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -867,11 +867,6 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	return 0;
 }
 
-static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct sii9234, bridge);
-}
-
 static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
 					 const struct drm_display_info *info,
 					 const struct drm_display_mode *mode)
-- 
2.27.0

