Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB8B16D59
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 10:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD82810E38A;
	Thu, 31 Jul 2025 08:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XUAzixgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E010E38A;
 Thu, 31 Jul 2025 08:19:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so1070875e9.3; 
 Thu, 31 Jul 2025 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753949971; x=1754554771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5BJ99XtInyXvA2uGwOyO0qKj3XQHqCW6pENyhyNWAo=;
 b=XUAzixgXMIB2kGqIRmVwHYB0HoMOEhFiJgLnOJ9pBfzuuOQ5R3YSF5LZCLBp22nsf9
 dWl5xjyouIGoYvbm9Gep9NX5apNd3fUz6EwY0RqE9xJ4DrAde80knxdxdY0WRG7NF4g/
 chppmrVV4ay4nalc0ozCPPUL6W4KF7fwLlwVqoxfZ5LOxH6p1RIUF3DiezOZw5vQtCcB
 6GapoIwZRupoyme01Wcn00uO0796vQQzxEcx/y9ly2IKGckajlVwpJslQm5OqW9gYNok
 4nHbIfoej3FO98BPPqRtdcB4T7Hjv8v63T6vyymMnDIX2PveFPcGTHe2ad7DD98m6dyy
 EmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753949971; x=1754554771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5BJ99XtInyXvA2uGwOyO0qKj3XQHqCW6pENyhyNWAo=;
 b=aqdn/tN6LBHLo6HX91WUA6nTn4s6OMXgBx0rwOx+ePTmkzxFFRdrc38ZBAlBcLjOWu
 pVrc0JpCL2MEuv07Ivn1D3xpsuSTQcgf7OjypaZijkdAassqVMInv2JrTSJ8XTMurgOr
 JnBRH5nXArvLM5hhjOp5QWjrt+o7aunPcmaQ0uEE1Uom6oEhcxY5UIibDjqW9m0ZgVFC
 LYdEHqreylBY+Him3pERhXtONmqitzQaaBS3WiEfMPM/nTXk67bxD6k14fibPW542Sh/
 7Zmmtief5mpPD7ehNL8/1glhmull+IY8NoDP7qEMVflybVSwEhL5/w5xIZ2u0x+JDo2m
 6RpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvvbjpMJryAv5GW3xmoVHUoqvJuBi3pLrj5IHdIUJHucrXvFS6WkxzpUfPVnQJIHJz+jGOS/8krtM1@lists.freedesktop.org,
 AJvYcCWZc0zC5qMXvCTfcXlkB5wnFYmAscMeHeVOmAWcASzPIolQoZxhKxF+0uD/MTNHA9PsZg/TRXVSNtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxErfy5Emt9Xf9nMWzFrxJV8FNJ2OWM1dj8haB6l+jjdA1xCrw8
 lcZpmiEq5nky2SpqaG+CFNDn/BIkf1JrdwSSU1bx8oRu/fh0cPBoSxNW
X-Gm-Gg: ASbGncvSy1MUU6qAYawsX8koVcfWJ+j+AvUxqVhyR87vn5I+iX9gmEg7YpY3gZ923GT
 BvGa1rL35JaFwiFQiHW21lY9BQoyupnoOIcMV2Mu96LFlkef2zgURPljJFAfsjpOiAnUsqisXHJ
 3UPnM2AvWe3Ki70ULXbExxaNlK/yxfMikXeoEHVY5tQ8zmjZAfPMJtQs55HIV7ft5dm51GO3D70
 3nUfGk2H3NfpHT0N5usGvUf8jkYnRmNuLDS0HQyOt02T2abl495lf54zJQU4qbOF0SULjO8Syw2
 5YRGT4ka4nmHhllsibgBAzR5n9/kkizj36XSmcoBLy6a+hKC7Zj9c1m3gw4+vz0akghmgegucXA
 heLB/Zh/r4p1gp7RFwzb3
X-Google-Smtp-Source: AGHT+IFbDfRA6dDUCEXiNfEp5FpmNjxnhIKo5DM7lrIVBOPA+AS808AJxq+ydd9KurP8GljLbDj9xg==
X-Received: by 2002:a05:600c:3e0b:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-45892b9c21fmr66788295e9.9.1753949970938; 
 Thu, 31 Jul 2025 01:19:30 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4589edf54bdsm18154945e9.6.2025.07.31.01.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 01:19:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2][next][V2] Fix dereference of pointer minor before null
 check
Date: Thu, 31 Jul 2025 09:18:53 +0100
Message-ID: <20250731081854.2120404-2-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731081854.2120404-1-colin.i.king@gmail.com>
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the pointer minor is being dereferenced before it is null
checked, leading to a potential null pointer dereference issue. Fix this
by dereferencing the pointer only after it has been null checked.

Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index bbda865addae..da618720cf8a 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,13 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	dev = minor->dev;
+	priv = dev->dev_private;
+
 	if (!priv->gpu_pdev)
 		return 0;
 
-- 

V2: remove changes of minor->dev->dev to dev->dev, put them in 2nd patch

--
2.50.0

