Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C91C907FFD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 02:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9E810EBEF;
	Fri, 14 Jun 2024 00:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t/ZtbNOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBE010EBE7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:02:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52c32d934c2so1787253e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718323349; x=1718928149; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vkpCvK5EJTTZ5JzjKWIiKlKTNiomLgsRfQupOZcIcJE=;
 b=t/ZtbNOxt01nHUChmcZhfHLFj+zT7b/8UExG6gKov5YC38CmVsNVnvOlQQkd/sFQBD
 jbRI6MjnxWKl+IFdVD+sekF0NqFUjxQGUWRzU3CyQhBD6IQoaNYzfD/Yo/AnWP4+L2kN
 usVJLtJkvsoftMwbKlJJnVxfgqHvMxfXjYTcojx1xkC+H1LHqU+qHjKC6lVkYbNN81BM
 QrxeJg/YazqO2T8VKuP+b1pv13Uc3Vf0tF+4hfcr0qRtXU3lLPrgDDvU2aIzj1pN/f/N
 8YNqjQt20PJpo7dXwb3Qc7x6pYvSs1uWLw/yve/3ObQtG3jsapudCe5EmyUL8npE152d
 jeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718323349; x=1718928149;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkpCvK5EJTTZ5JzjKWIiKlKTNiomLgsRfQupOZcIcJE=;
 b=Ya5jGkMyeBu6DUfmUThhEB8mKpc10AWKYfS/fsw1WUtFKfkeG9Xg3qSbZv92ms+AC4
 ybb+9x+UAhRjHRVWflai4OA0LleJ/iNB6YJmfIkGLE0/Z+kyfNv4OAQhsFHEr9sBOW84
 MP8p8PCvGhuizmT4G9k65GEmuGBCsq7mzoQa0XfwTHP0whxpuDNNdp+3IL6vg3XG3wei
 q8T8/PUCdWw3/LTGrg2ZuYDW436r3CcSCfsMAf/Jn7ulpF7MSWkRy3V5lhQy3/VTmH+F
 U0Ng6pDGJq8NnIrip+Ol7DiO5wifDVNhYBAB8Ou834qhvrydOtREEAjqWJwB7ohObak3
 5gnA==
X-Gm-Message-State: AOJu0Yygy0FgR4e48Z04Pl2gw8ScHUvXmcjKNj2u/Pkx7WJvOh3Ec/a4
 wIjS+LI4tZ+wXZkuY1w1WHRM861dMoT2Yk0JrcULaNdCwbFzekgFPWlD8B63jFI=
X-Google-Smtp-Source: AGHT+IE9BLBhYpbu8JV4xf74wnBpCPiJUBFcxX6WNhMf1mJ+tJupZI8mMcrVtFEFb4OG5G8Qwnt76A==
X-Received: by 2002:ac2:4ada:0:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-52ca6e91627mr570592e87.55.1718323348734; 
 Thu, 13 Jun 2024 17:02:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 17:02:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 03:02:20 +0300
Subject: [PATCH v4 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-edp-panel-drop-v4-1-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ly28wJZAdwzm4TkEnW8cpppYMs8mXFFUqZf4RJIpHsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iSY+Yydhiuir67MsMxJdnd2Q8Ogxxf/FjtW
 28+90lvPdOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkgAKCRCLPIo+Aiko
 1XGACACfi39l6OxtT8igatdQccpf9x3vBJq5skcjoGrat0PbMc8DgVkX7morDBPARu7RHfFBkNt
 xzWrqoHmJ9vkgMf7bWLP2q3A8zQ9SMJGxTBEbsmVRyPuslO3LWe1HlYzG36+7MGTSUMqB5Hy1Hx
 9uBx2CMq2UeA9QgOBhA+ma3H99VPMjzDcGsN9fQ+hj3l3CmSou4/L5TgjBBBTSi1ppdHYEWX/xj
 2ZQ6qOZNY8Ob88E8By6lCDov3+bjsItFrHkDGkCDE5ru1jQO3LRIVz9/+h7VZHthy9Mw3jHCMuJ
 BpSaGD4Fr8p5MkT4mxWughrf3EM4IMkuvAdfwd1kPYbMMGAV
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

Add a fat warning against adding new panel compatibles to the panel-edp
driver. All new users of the eDP panels are supposed to use the generic
"edp-panel" compatible device on the AUX bus. The remaining compatibles
are either used by the existing DT or were used previously and are
retained for backwards compatibility.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 67ab6915d6e4..85edfd3d59f3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1762,7 +1762,24 @@ static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
 		.compatible = "edp-panel",
-	}, {
+	},
+	/*
+	 * Do not add panels to the list below unless they cannot be handled by
+	 * the generic edp-panel compatible.
+	 *
+	 * The only two valid reasons are:
+	 * - Because of the panel issues (e.g. broken EDID or broken
+	 *   identification).
+	 * - Because the eDP drivers didn't wire up the AUX bus properly.
+	 *   NOTE that, though this is a marginally valid reason,
+	 *   some justification needs to be made for why the platform can't
+	 *   wire up the AUX bus properly.
+	 *
+	 * In all other cases the platform should use the aux-bus and declare
+	 * the panel using the 'edp-panel' compatible as a device on the AUX
+	 * bus.
+	 */
+	{
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {

-- 
2.39.2

