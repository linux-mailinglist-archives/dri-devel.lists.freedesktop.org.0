Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C189923C9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 07:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52910E300;
	Mon,  7 Oct 2024 05:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="B2I6YJoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D35D10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 05:06:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6cb399056b4so33431526d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728277564; x=1728882364; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c05QmqKO8Yo45LGADbAWzf+kRfAr29i9++XErp7UJmk=;
 b=B2I6YJoiSi/Dc3kepdyccPY+Yz+6x6+vEOoY0TV/ubj/YueqkNAaEYmY8BisBDc1Et
 2q2AIP0IMk8/GswXkBNskXVWyIKPSRyEmzgBZUpNaDhbI3fsmwitMDmSi790zw2N+EDQ
 aVBhnOyLYZx5m0pCk0KcwJ3B6vyyhRFypclpMF/Ug5h2p5dt+k788fs3TAFTozcOXjzj
 7ycA2YKQMRDkKe2acdoTXziuvDm1XvCEEjPs46wAeNEAqg3LxbwMSVwyvq8e8Ull5WF9
 bAWXIpbbYTE55oanGdmFDWTp+un3Qoc8sUvWC6OVyue3CqW572BdE7q8lO+a7loA/KWR
 HwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728277564; x=1728882364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c05QmqKO8Yo45LGADbAWzf+kRfAr29i9++XErp7UJmk=;
 b=cJuAyzpgLLEvHIlTeEtYN7GFexAjDy9K6GuS7ZVfJXscJHKs+Nf5yG1ufhQwzlbGWd
 k7wkmkUu1HDNPSQ3p5/+yGx8JsCwj8OzNCIpOqHzCBuH8XRWTAdepLLg29W5HIih917j
 SZw6PwaU4+33OM06h/HP3QYKGNsWaoFsAJgWEz1RH4khNMHwVzjS0sXLi9/qb0d64CAC
 H8xnLF0Reunmi6BLGMC0emllDZovBBbDhI+Dh+krJkE5yLdQCvE+C4zSziwEHX0BhlgV
 IUKVrpeDbTpUKJ9VeVTVPUk04YjwpP5VEP8PuQELh1z6fZR0SL258TxB7tO/vs2abajv
 lwGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHkG2nsVWQhpf7nckIY0Su/Lh4vtVoMtT0803QN/N7dqdkX04A47pFif7+nkrSegPDhpqh/4IAz2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMxfY1kw0X11dqzQFGVTCZweUfTa8FthJzygLvnEUeFsU1eDHn
 J5O6amtw7g8AHXQyfIuHWG86s/Rg/2NYDMqcBsHjAHeBf+5lV/roGdFeg7FGm78=
X-Google-Smtp-Source: AGHT+IEWxrxm89ar9oCXwy8ju2UWdzVDET69V1sE10TCiENXP3CF9q530YGphHlLEbICHowgYDYfMA==
X-Received: by 2002:a05:6214:3bca:b0:6cb:2242:df32 with SMTP id
 6a1803df08f44-6cb9a2ff311mr159433696d6.20.1728277564552; 
 Sun, 06 Oct 2024 22:06:04 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba476152asm22452216d6.126.2024.10.06.22.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 22:06:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/dsi: fix 32-bit signed integer extension in
 pclk_rate calculation
Date: Mon,  7 Oct 2024 01:01:49 -0400
Message-ID: <20241007050157.26855-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
References: <20241007050157.26855-1-jonathan@marek.ca>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
conversion will sign extend the int to 64 bits and the pclk_rate value
will be incorrect.

Fix this by making the result of the multiplication unsigned.

Note that above (1<<32) would still be broken and require more changes, but
its unlikely anyone will need that anytime soon.

Fixes: c4d8cfe516dc ("drm/msm/dsi: add implementation for helper functions")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1205aa398e445..a98d24b7cb00b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -550,7 +550,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 {
 	unsigned long pclk_rate;
 
-	pclk_rate = mode->clock * 1000;
+	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
 		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
-- 
2.45.1

