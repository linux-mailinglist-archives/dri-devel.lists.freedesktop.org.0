Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476CE7FE9AC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 08:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C63910E0A7;
	Thu, 30 Nov 2023 07:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86CB10E0A7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:26:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-332e7630a9dso450533f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701329194; x=1701933994; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fxfaT7Lx/SLvMXZ8BIazUPMWfseGLyrbhSm3CqW4/u4=;
 b=vuKGpcy9eJnfs2PHUX8kZs+1G5qZ/ye90yZzOqonog40+FNzA3Oa+FUrzZRYEPRl+V
 w+JUfXiTmA6wrZNjZEyPRBqJRNGqZ8iyBRA3RWOZWDUcO1yeu7YjZrcTmocW4xpe9h8e
 TiqDSB/dROQz+e2KqALAfvpgg3zZFZRz6zqcdoLEzQJftUz9ZhE1eUg3nDxLAm0T3NXx
 KAFLoL0WhX+oiZLCt4Uib4ZFXHoAywUDv6rRRya0lbRH0nsws+12GhzjzTdSMW/1J7S8
 up/iFe4wgkrda8VLn3QzDAGPuFEmAKmhEiba4aSSNSmoY2YyWV4jI3PJXw1WXGuRQDHZ
 69lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701329194; x=1701933994;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fxfaT7Lx/SLvMXZ8BIazUPMWfseGLyrbhSm3CqW4/u4=;
 b=bPWcdzRLL7AslQ7rhTt4CoMwdqGVyEL/8tglV7KtHhSQHva3ZHzTYdSNvpaGOXxLvZ
 oE5XoY+0LC7UkW636bu0SZQRgB5G2Z4RxZZ5rih7gcr75DJUuqhM4/Mz4Aoy8CwnE+3E
 XmzNiVaGsFDDweQZoEfM4BnfRtX/Y12hJq8a2BMhpIjuJ6YKgMXEM/UPI6OhtoBNa2p3
 Ml+kVfXODbv16ee/Yn4LM2xg1+scglHG8lVEfcSUE37CTtPRO8qe8VFvIJKTqGX4nOaz
 Sb8Sd5jBZuWHPESlMG+tAiTI7idXUzxSF/kLc/9WomLFK2Cq36GSQFYLQJMDlqSFJWBO
 GkZw==
X-Gm-Message-State: AOJu0Yz0Sa/7bqTb6jO3krq5aCxobvds4rZSxBU59L+D2+eFBvq4cnEL
 W/oHXv0V3Pn51XKscQ3j05SIrQ==
X-Google-Smtp-Source: AGHT+IEvR5GCRaBK6/l20FiBKNUdxPm6IPz8FnTeJNAeTaKjXHHuuKIh2lHQQWfzA51hiC4R/SwnJw==
X-Received: by 2002:adf:f88c:0:b0:319:7c0f:d920 with SMTP id
 u12-20020adff88c000000b003197c0fd920mr14168970wrp.57.1701329194008; 
 Wed, 29 Nov 2023 23:26:34 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c6-20020a5d4cc6000000b00332f82265b8sm702358wrt.4.2023.11.29.23.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 23:26:33 -0800 (PST)
Date: Thu, 30 Nov 2023 10:26:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: [PATCH 1/2] drm/imagination: Fix error codes in pvr_device_clk_init()
Message-ID: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a cut and paste error so this code returns the wrong variable.

Fixes: 1f88f017e649 ("drm/imagination: Get GPU resources")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..e1dcc4e42087 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -105,12 +105,12 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 
 	sys_clk = devm_clk_get_optional(drm_dev->dev, "sys");
 	if (IS_ERR(sys_clk))
-		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+		return dev_err_probe(drm_dev->dev, PTR_ERR(sys_clk),
 				     "failed to get sys clock\n");
 
 	mem_clk = devm_clk_get_optional(drm_dev->dev, "mem");
 	if (IS_ERR(mem_clk))
-		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+		return dev_err_probe(drm_dev->dev, PTR_ERR(mem_clk),
 				     "failed to get mem clock\n");
 
 	pvr_dev->core_clk = core_clk;
-- 
2.42.0

