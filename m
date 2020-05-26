Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE061E1C36
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFAB89E32;
	Tue, 26 May 2020 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8F89D40
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:22:43 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f189so19246490qkd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 20:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
 b=phARGkuLZUYehpM/d2KMBVBv+kPH50tL7EaDIKPedz9VnKE/uo7g88SvQ0ya2SMR2V
 /EoPXB52tLpEU6++KCQ/2MaM7SqcTSxWIkbirnoD6jus+eBielNWV8g5qCjOx/cfHCAU
 iSUSPR5s4+yZqBcsL0WR7lVd2wOqKM0UOtgIpQ9rljOYfvevAprbF2089/Y57pIbk+dZ
 51ceW9zGJDqBrubv7vDkOQUbDoBKJSI9qgh6WZBeeGN1uXcvTRFj1sPKr2vVGT0Ccsxp
 SZpznyIKink68buJUl93sIPpTP85K//SiaEDUhkzAfb1YN5drOKqTvZDti9D+RljnsVX
 HvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EqGVPzCwYn8DVvhE6LVcxMlICfwfg+X8jSsAedeo4EE=;
 b=T4OSd6dagbb7ZvrDbzTKGWIVt70iwFnjXTZPkeQQ9EPzPrkBKwCpBbgUzEyedjzpNy
 B8LrOPCFnpYdtUWOgFJEzvf9rxfaThVBoM4kR8lDlzOnFeBivf5hvBGJwVGzYUFORsTU
 MJmFHIhhgXEzAdK8Hy9NtFMSTTBeWimktEJCb2Qy/OJfjNhigutT/FDa4ozqe8+n/mSG
 zknCS73abP1plwJNIVvQc2F3faJdSW08Xc7Xi9QHWxzv4IgPFsnQpXyR0aRcsoH9NJR6
 ockiFFaEStBVfxRYlPAlZo+ru8ImZXjtnTvq2rG1DRfaxTPl3161NZ7NIIUE0G12ARjK
 SwTw==
X-Gm-Message-State: AOAM5333WN3Hiodp5AHF/oH/D78RzUCBotFBxdesFyyw6wR3C+KaJWNL
 mOmalKrligk+WR9TRhQduj/+iQ==
X-Google-Smtp-Source: ABdhPJxHwkI9byKgEUj3ejcFaK3cCkToltc+6OW/ingZP4EQhU7BbTrM40I8+svqwohGSvqEOaIedw==
X-Received: by 2002:a37:7984:: with SMTP id u126mr8678321qkc.73.1590463362982; 
 Mon, 25 May 2020 20:22:42 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:22:42 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/8] drm/msm/dpu: use right setup_blend_config for sm8150 and
 sm8250
Date: Mon, 25 May 2020 23:22:08 -0400
Message-Id: <20200526032235.21930-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All DPU versions starting from 4.0 use the sdm845 version, so check for
that instead of checking each version individually. This chooses the right
function for sm8150 and sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 37becd43bd54..4b8baf71423f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -152,14 +152,13 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (IS_SDM845_TARGET(m->hwversion) || IS_SDM670_TARGET(m->hwversion)
-	    || IS_SC7180_TARGET(m->hwversion))
+	if (m->hwversion >= DPU_HW_VER_400)
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-};
+}
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
