Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF319A4933
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17610E9C3;
	Fri, 18 Oct 2024 21:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A1XjI/J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDDB10E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so2706771e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288165; x=1729892965; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gaBPMg1AmxsxPM/D5Hee5JcN9a25p5bXN91ymYiIy5c=;
 b=A1XjI/J+sm+t+aDK1wIoogJ+h+ePemaFdERES5EOks+hmuhaG9j8MdfqjdMkay5dvZ
 gGf1/xht/ijwvwpyVH08cWlFrQ6ddXo+y9ARqwu4fp3/U8/1EDDA2MrM0ciOWFNBrqZ9
 e1Ju0K32wWtXDsAOtjdXzq5Va4DVLsipyJj4yaFH482sghY3Zm/jO/Vdr5Z3wJLfpujA
 Yk66LNDEzONyzQzEvDFKKgaYkkPahf1b9Kq9BC52EnfhhXSbrd8CO3pxl29DPv7SCANO
 TPWl65dN7Id0EufipU8DhiyxMrTdhmRRegqbY+S5s2owa8KuvbH0k7roXzOYDpBEIp6P
 RZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288165; x=1729892965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaBPMg1AmxsxPM/D5Hee5JcN9a25p5bXN91ymYiIy5c=;
 b=na/jb+k/LuuUaYEsU14oSVZxHL0kPZvnkykB4v7KZgpcy8WS5aJC0mAbFbJmNw/i4M
 AptSwBxyjwr1zGZD5u2HcC0fsM/PVAG7y15uNIGEo5TcMiZBmVNaEC7A7HYQY0wzqIsN
 WOldCYlRjXJMbh5SWS/BAbmC1Kag16GJiBoMlqKtCvOOSccpKQdZKrR3XQ6O12xhq/P2
 n4eKx6rFzKgUBYSeYVvnNg0Q1NpT95qesgmio81rXOEPoZs4qexWGObH8oSeEbPEqycr
 i2SJT2AINu1hteEqiNWIgdXQWH8QsfwZq6pbOyI4h/MkHvIToi+/M7pECS341Qmfrl7h
 pDBw==
X-Gm-Message-State: AOJu0Yy3DMzivIXOpJVxaAW3AT6TKN+Sz6dzRJ0tjHYUoM93G9bGz6V3
 X83rXZK+g0+pb18ZXlLBv8A81HzZ8ju7/1CAkEuxy3yUGYiztRm+iJZj3ABvznM=
X-Google-Smtp-Source: AGHT+IEwsp3DJLispc5Uu+bsLkWA9jEEfNgUg2fe0AkZdKhNFZlyKLrQPTa06UtCmputrUq6ijp2uw==
X-Received: by 2002:a05:6512:1598:b0:539:f886:31d6 with SMTP id
 2adb3069b0e04-53a1520bd09mr2482354e87.2.1729288165534; 
 Fri, 18 Oct 2024 14:49:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:14 +0300
Subject: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pZFlU5ikCJDIckLBlIAUq/awzCCp0+P63uSXEOzs+Ls=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7rQ9bvcVYyXhH4v2nbOrW+V56fz/nM6Ra8qGUUzfkmXz
 NR4wOHRyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ+Gaz/2LKWimrkK2V+Hly
 9qLrbbUCO2cI9V7mf7l3qX6f6v9FgsWWBgt90p1C/+yM65wm/SHu3mEdAWNz/tpN4YYiFU5P1vc
 0LNFboKga0HF5U5fM7Oq8he8cZR9Fnt0edGyC6mfnsgcMTi6zmD7rOf7ilxVcwJA4Y4vzC0HHLd
 MPXdjRzXE74Nnk09ndskoTuzzXxz9uDuWW/r9NneNNSYEmx8q/Byp6Pau1Zh6cd+3RXtHmmmmbc
 rM3H4qPaGu5djjsyMtNhm3VfVzLRRbaaseJJq1Zx7iN3yRoqYnCtKbvZ4+qvz/wIeGu38/XHoam
 8w82aNZNXnNxQqlatk+4mN4BlsZ0H2OThUov9TNsDCoCAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
bridges in the chain still might limit YCbCr 420 support on the
corresponding connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..aab9ce7be94c 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
 	/* All the supported connector types support interlaced modes. */
 	conn->bridge.interlace_allowed = true;
 
+	if (type == DRM_MODE_CONNECTOR_HDMIA ||
+	    type == DRM_MODE_CONNECTOR_DisplayPort)
+		conn->bridge.ycbcr_420_allowed = true;
+
 	/* Get the optional connector label. */
 	of_property_read_string(pdev->dev.of_node, "label", &label);
 

-- 
2.39.5

