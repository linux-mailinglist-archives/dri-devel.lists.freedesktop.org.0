Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D5913EFD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 00:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DE10E15A;
	Sun, 23 Jun 2024 22:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kbYjg6Ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78FA10E15A;
 Sun, 23 Jun 2024 22:26:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421bb51d81aso30947035e9.3; 
 Sun, 23 Jun 2024 15:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719181564; x=1719786364; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3gQk/oUu6SEUrWcMlUI7v/b2a8RoP0ZC8zDXKyAf8bM=;
 b=kbYjg6Ot9SE8EuZr8/8nDho2FeRJGsM86wtckgJDmTm8Awps2YxglRF1QkD+6jzVVB
 23On9hhN1abI+8lhdh9WsaGNtzhS60mbrYSJMdMGtOvXK9Pm+siJWCPjXlvOhWs1tY3I
 j6zfQ5FseNQTG06s4Ljt0wHpNdCVuQJl9kOapw0K+wERVPsI1UTN/4nVHQEDI/2HW9Ta
 VJVh+nge65NhPjODkl7OpbOMIyijaz6f1uNJwCGLtvCmDEfEQbF8dL3KFBU27xlGQg52
 K82B2p4HRir1eMoV4gKJ2/z+qaxGAG11UGOZ5qXmsz2WD9o61o2429qtYAztFfvIseLd
 iIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719181564; x=1719786364;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gQk/oUu6SEUrWcMlUI7v/b2a8RoP0ZC8zDXKyAf8bM=;
 b=C68Lcwl/bfGaeOn5E3ct0+in7+87ZIewPkGfOFi9404AzqRMuLHaNcQLC1ZlMQ3ugd
 48H4RXPDW61hNu8X/llBxLrYHcLK50BVBym6Ji/ZN69dsCysnGdvNAY5CpPJdWuhgzdQ
 t3FqvxW6WAEfx9NLv6lyv61Palcg+7Nbvgzyj7kQNTRCIi4Z3zvlmRZHrT2Z1n9QG5uk
 ayzAio45boHrcncqni/b/qRn8a/poS+346m4RjNBGKF+CSuqWo+JIlrsEatvLMfE9QqJ
 w+R4ui25vrikYX9DXT2SHE7Quat1M2e3U1/NS590DFxGLb5Z6oQE+lV6y9+ru3e88/4D
 gkBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBbo/KIQzSZugCfJWYguchW+LUgMgGkaFw/JYeJviKRs9UVpnvr8Pel85glWPhsPKNYsh2QhibnGFc1CLN2gdx6/I9Up8m6+/fo3FjF3nyDp/u2BSihXzA6pE3kqS4L80QtkG2F4KjtH2BHDEQSpG+
X-Gm-Message-State: AOJu0YxRdG8Hq1yFsUdgEscIj1cC4RKRvMGJrOUhcJFy81xGmFjk6MDd
 poJXoFQiaPeNikpD0Njad+pW19e+nCJUNYc/OVPbOBFfpaqngT/E
X-Google-Smtp-Source: AGHT+IFuLGS5VXiY8gWVaO57f37QjPUM9TkmU9oDjUF5Scuicyy01NZzE1pEN95APiSxY+wXB8af3w==
X-Received: by 2002:a05:600c:5690:b0:424:7992:c21f with SMTP id
 5b1f17b1804b1-4248cc18c65mr20456165e9.3.1719181563531; 
 Sun, 23 Jun 2024 15:26:03 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d982sm117663975e9.1.2024.06.23.15.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 15:26:03 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Mon, 24 Jun 2024 00:26:01 +0200
Subject: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPigeGYC/x2MQQqAIBAAvxJ7bkHNQvtKdIhcaw+aKEQg/T3pO
 AMzFQplpgJzVyHTzYWv2ED2HeznFg9Cdo1BCaXFpDSGEowdBwwuoecHzeY17XK0wihoVcrU9H9
 c1vf9ACnzRGlhAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sireesh Kodali <sireeshkodali1@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
it is not referenced in downstream.

Fixes: fb25d4474fa0 ("drm/msm/mdp5: Add configuration for MDP v1.16")
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..92d06b7faa0a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -837,8 +837,7 @@ static const struct mdp5_cfg_hw msm8x53_config = {
 	.name = "msm8x53",
 	.mdp = {
 		.count = 1,
-		.caps = MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT,
+		.caps = MDP_CAP_CDM,
 	},
 	.ctl = {
 		.count = 3,

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-msm8953-mdp-fix-8af4ec159082

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

