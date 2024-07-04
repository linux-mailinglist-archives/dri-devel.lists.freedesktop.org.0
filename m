Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDE926E90
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 06:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C8610E2A4;
	Thu,  4 Jul 2024 04:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="PSZAJ7md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB5410E2A4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 04:50:34 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6519528f44fso2215947b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 21:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720068633; x=1720673433; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KsBn5YIFgQujACGaG7/CDDGw57w//+UBPY3qWDxgZNw=;
 b=PSZAJ7mdzz1tfFlBqTh85IRrbLoc8RpYO7WIhv4brE9EkixRRLsgijhQENUAVNd8de
 RSu45Re8J/VACpIhvkyzdqAF40gM9Yt+IgMFR66p0E4bIWyAOKxzc5yXmFIBEua+z7/j
 65wVht7tDZZ3l5TRmtk7PaZdBg7XxoX0naig0t7DbKCcES5bKwyyHypQZrBWHl7w8dYx
 PBlFFMSjQjMeevvrXNlBOEsEmLtoWt+zkSgxoy5be103yN7qq+7xQuIQrmtlSZHch+bt
 8U/+wTSvjSjdcKO+0l49lKTDE/LO7kOYRY+qcopgeKv/hGOh9isOoUDvNy5290h/Av69
 +Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720068633; x=1720673433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KsBn5YIFgQujACGaG7/CDDGw57w//+UBPY3qWDxgZNw=;
 b=ScBwzRuw4hw01nD5oT6MT82ZwyNdfu31HXptX9I50VMqCYRpHjrXyLn5/EKSI3ZpFA
 tN5yz1ziNEuCUHMc/dbOYHj2guS3w63saw+RgcYlQW2Nx6ulzUOCv/3sViAHrHrH0SmI
 0Wl+sRRNSj/vR7vs9vLBV5HLi+gZ3ZQbdRp/slj16cpJjAZzCl6TZscdzM2PfT9iUfDO
 53oybPkfJM9PcAK+wIn5vLbs0ZGfL6rBw7u/R71fCyoOdJUMpWgALDxGo5DxTdOLJFhC
 uXwefKArNIaiC1+wj+a0RUyOx+DXEYup+lyV0L70kXNBHW8yjlPvsSqrktrPrOPvRJ5F
 aafQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgOFk3PtlyaxjATQIx/eMqlu2wf9WP/4GgagXY0N11KEi3M+EBquB0enH++43d5Ozol0l8u8VHU4TYgcxPvCjj4/h/QNWMGWw9aTPdE+pQ
X-Gm-Message-State: AOJu0YyDzbYnz1bSTIjLhFLDQ4ldOyInAS1kvbhjJAd5peI+2rxes8H0
 h5XsyfrU9mtKww3os4vdlO3ovjjAHM9zZSKU2p7VQoqB3jU+MO10JzO5g75CvN4=
X-Google-Smtp-Source: AGHT+IGwWXLEPd6j1SIUqzU+gfofpiqClC0+U9lppd9lNrJyoW9Y+Q7h2ChaL82zLrx8UHmV9t1tHg==
X-Received: by 2002:a05:690c:45c5:b0:61e:a26:c1b2 with SMTP id
 00721157ae682-652d767d0a7mr7287207b3.17.1720068633205; 
 Wed, 03 Jul 2024 21:50:33 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a8ec1asm11291826b3a.188.2024.07.03.21.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 21:50:32 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add compatible for melfas
 lmfbx101117480
Date: Thu,  4 Jul 2024 12:50:15 +0800
Message-Id: <20240704045017.2781991-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
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

The Melfas lmfbx101117480 is a 10.1" WXGA TFT LCD panel with jadard-jd9365da
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 3d5bede98cf1..b8783eba3ddc 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - chongzhou,cz101b4001
           - kingdisplay,kd101ne3-40ti
+          - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
-- 
2.25.1

