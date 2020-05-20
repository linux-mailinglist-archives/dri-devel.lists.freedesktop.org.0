Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E081DB497
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4F6E836;
	Wed, 20 May 2020 13:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357226E836
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:08:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o19so2389440qtr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zyqcQ/985qEMsE4i4WgHCoxf63qwfEa8tM8Gdg9yWKc=;
 b=aMMn5Fr6I2G2NwwrbhVXZsfgmpxk8/uQsEMY0uKFdh2OP/S/e+R6Ou0wCmVrrBl8tw
 SAR55Asq3HQq4/YgBbX9oB7bFhu2Tstrt92pxb9WYMECYSqrqoiRCt/DWWdwMm9TISVN
 ycMX3HSlUQYhGeTzbzi3OoJh9ZouG7+X+4pQmUhISp8U7TbylBJeTGW/+JInmBOzkFhn
 AqLPIdl4U+q8rvPDzFRPBeKwEvO9jneANdR/eULmcXSZbDIdHY/WSEdymPg4eiLZFb7q
 JZgtWYkOXj7tXGSIiweJz7sBoyhOvgDxmXR3q+A5nEBJaM2M3ce2nSAZxa9efC/ozKpz
 A3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zyqcQ/985qEMsE4i4WgHCoxf63qwfEa8tM8Gdg9yWKc=;
 b=Q38wTbk8sglSrLyvilEe/ZISsf/iHcambIczunInlV9vDX9b99ir/N2Q5I/vqXsc8y
 5lw/RG0ThEJNtx2OeEswVrLgULH7z1S7DSXDfbXimvR9PaXs1GhZm1MWT5S3SamAnonn
 XntW6ZwY+Xwk/ro4N3GvxgqP/w6SzYWlLqNXQFhE6wC0/c3lb+0MwgrT5h9yEz9RHFXj
 CtHzDb3F3lB36dpN9QtAcLzO1jJGunGma5LpkyRIfeDD0aNIHrmqJbYMGYUjau3PQ/YE
 HbfYjjVu8NDli8g8B/3Jsk3prBx/1UEJX5iYqUTOx96iEXNXHB22tdfvApUIX/tDkyik
 /r0Q==
X-Gm-Message-State: AOAM533U65IXrHZYM6M6H8IX4zs5hcBfSiPge12gKHx+unZH6x/zEsJS
 JR2mJAaY4ANEcyvJ2nhuLtDStaq2CpY=
X-Google-Smtp-Source: ABdhPJxvh4OP5pjq04vaOPim2zzXIIX4UpruAJhlV1I/z9fH4m9YJtL+/uprf1HjPRMt5IVI7njleg==
X-Received: by 2002:aed:3949:: with SMTP id l67mr4889540qte.313.1589980098047; 
 Wed, 20 May 2020 06:08:18 -0700 (PDT)
Received: from localhost (mobile-166-177-187-115.mycingular.net.
 [166.177.187.115])
 by smtp.gmail.com with ESMTPSA id m33sm2406360qtb.88.2020.05.20.06.08.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 May 2020 06:08:17 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hdcp: Add additional R0' wait
Date: Wed, 20 May 2020 09:08:08 -0400
Message-Id: <20200520130808.44095-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520064602.GA20133@intel.com>
References: <20200520064602.GA20133@intel.com>
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
Cc: seanpaul@chromium.org, rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

We're seeing some R0' mismatches in the field, particularly with
repeaters. I'm guessing the (already lenient) 300ms wait time isn't
enough for some setups. So add an additional wait when R0' is
mismatched.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Actually add the delay in R0` wait (Ram)
---

Apologies, v1 was generated from a forward port from the CrOS kernel and
patch got confused and put the diff in V' wait instead of R0' wait.

Pay closer attention, Sean.

 drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 2cbc4619b4ce..3c2d8c0a6da6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -743,6 +743,9 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		if (!wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
 			      (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1))
 			break;
+
+		/* Maybe the sink is lazy, give it some more time */
+		usleep_range(10000, 50000);
 	}
 
 	if (i == tries) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
