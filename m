Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2828D5613
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC6410E865;
	Thu, 30 May 2024 23:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bsfFbike";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5793C10E698
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:13:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52b83225088so715586e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717110778; x=1717715578; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9MDjCsFEZ1HcOeGBvBo6CqtfbFIZh3loCrt4ShZMr9A=;
 b=bsfFbikefrIGM3CMhP1MQAeYXH3ljVfk0oa17zBc8AOws5TI7Vf65/2JgfmcRJI7Wj
 2feA4Ks2e7O/JAXXec3LOChWu+42sAH2n8h2wqKI9YPa/QcWoE4KW/BwLfK2ewqZIeEP
 EkxGYcWiVLvFjWRtYJte6ErRjSFStg7TthPDAdoPeLMxF/dQL1mB4hpNrzEKiyfmG5Lf
 Oaeg8eofegNbFdbr84HT11BsVAgDIE9dbnHsmN9IDQKEWCy28lnXO/mS8yH2PTzgcC6g
 pKJHkGuZ3A7PaC3jsxWYh7E16yqX766GVh+ck2/XV2qqmhnjF2e6Ah0VCj0X99+xG1ro
 /i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717110778; x=1717715578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MDjCsFEZ1HcOeGBvBo6CqtfbFIZh3loCrt4ShZMr9A=;
 b=irICGrokEiL3WjUG8xJJdJbF+4ky/KcupWiNvxfohsfMB4zGoD0lCsvo2yaIiKDwHZ
 HD4BbaJIzAPxsLpS73UZbe2hN7sEd4uFqD+msGw9iPAnuwTY9/5+dqGGnI1RhFw4y6j6
 4Bi11Z0SF5yrwj8VoWvEYVYBQ3rdWdsECtJFGD2Vm0x36y3KWbljBFC+G6mbiugenBtv
 Maspc0yi2xVDDY/RYJdMP9LsuVgMykXjyUAMpZZhU7jN/+xu6BHyLNUIkQldRESby0PL
 jnt2BtDMmmL5P1jOufXzxYAMICGJ7oWPmgLTt7PyOrccl4Ef/TD++oAmTSoUgmxbQRey
 Dsnw==
X-Gm-Message-State: AOJu0Yw+b3/foaHBeR2nDFaS8VzsWdJ2gYv0tOIs9DAJGCa0iDT9oiCK
 D1bSy5pella9YYgpvazxJuhriAOKbf1rzUUIUlXTej0/fvP0GGJjg8RO3hWeV3wNaFJDE6hqMUm
 Q
X-Google-Smtp-Source: AGHT+IHCDHK4srNC/bDT9MhZqbsXJoODdHwGipAby7uMsyyVOOryiOsA8heWPcUKRMYQXg7XBalJbg==
X-Received: by 2002:a05:6512:39c5:b0:516:cc2d:f6a1 with SMTP id
 2adb3069b0e04-52b896dc4f6mr55540e87.51.1717110777989; 
 Thu, 30 May 2024 16:12:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75d96sm119005e87.120.2024.05.30.16.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:12:55 +0300
Subject: [PATCH v3 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-edp-panel-drop-v3-1-4c98b2b95e3a@linaro.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4lQZmh/WvHEEtNKJULb6yxMuO5RvAavVpXvzoItg+EA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWQf4M0YInguykUXTyMqVJtog/s/TjQywd/DDP
 akfvNNiTlSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlkH+AAKCRCLPIo+Aiko
 1XozCACoI/M4YGZsyLd+SYKu+kRIbTJFiN7yHHoXU5cPCqg2X/+3kZgtkcWXK818KF48F17uK7/
 Z60m/kj7JmLjRJQz4g38OKf6BBSasiPJLvQ89Fywc5eN0eXlnvkMsMJWOHSZvmzRZb9iJS/wM44
 Os2BWDA88429zTZaZTNroO7icIk7Mt60YK6cg5vuiQaw0IJdRiAy7h7RT5wL3jbm7mSqHmhtXB1
 G/el0ZqZ4DJmLPH9+5uNXUi0vMSYIopCpwu3VXievEE1ynyAh9agsecAjuzgFwQTtKwT5dDqzBN
 qB84Xt/VVYqp9cQ6NLyDUwMH6bUW8bsnRv9DeNKy4V6qExLx
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
index 6db277efcbb7..ce2ea204a41e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1776,7 +1776,24 @@ static const struct of_device_id platform_of_match[] = {
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

