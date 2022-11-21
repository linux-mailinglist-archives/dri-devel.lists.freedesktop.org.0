Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929E6324A1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6EE10E2D1;
	Mon, 21 Nov 2022 14:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C77210E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 09:42:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id vv4so17863159ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 01:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
 b=cq8m6/mJPVrF19T4WTdu7gvq/nVLWRDjsh13J+Xr+Nn2iF4Hy9OD9nI54bY967FWG/
 3UOVhClJW4x4n2d97tfeDtKj/uthmhp699BqkgzMipcAj7tJSDny5vG9BdCLomnktnEj
 JLHLZjM0+76mx9DOq+ZPhDpQbUs1EjdA5A8QskH4ttK1DQdid4KKDe5WnlGyued2Rstr
 Jr5nh/9uT/4QkkPRzvI8bD+mOl9SVJHzqYG1WEKJvRVndpiMXm7cxc7b5miDOmV6Uxx4
 nj86LC1IOU+6NmDxVUZhIhYSv6YkCgpUu0klxQEKrS1S9MHECaNaSDIhEyK/W8FZe9Tk
 t+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
 b=Fsl+YVoPQ01woztoTWL4MquFiUU/sUY2MiI55kgCzTy1uJESiyjJV/rSyoiZxVFidj
 oMhFJmuT5SZd4jVMVOOLDBCMj0vudKo658mkcD117gZTpPQ7aNzYMKSZaB8FclDdzHxL
 xOSY60w9v9jqhSh9F4Rth3HI77V+9PfnxoCqL9Bw1w058Hfi0kBahaGQuZCfNzPWO45R
 D8xsDpxJ8PhttEIRM7pCAT0VBKiD2oSyyeP6GPFb43KJvAyWZdL/c13QcAX06VXh+6it
 oLLXWSSRJoV/wAAEnAXsTJw9kWU9eHnzd8BuvuHGAxk4v2uxN9xMl9wGfMxLkBvSwSl/
 zGyQ==
X-Gm-Message-State: ANoB5pnzssjNLQp+ZYAuM0uUdaplgyoz9M2SEXtTwgdm5CvqQpdeK4ql
 9pZSvt/U+1KjCXqdGKd781dMtk1uXPvD8DLz
X-Google-Smtp-Source: AA0mqf4iGDXMlAJ1h8pqCDx2Am2EQUjsXM5qy6Z6ikSWJyeR7/x1T5VoUQJXLLJdiXSkQzAYW6nAog==
X-Received: by 2002:a17:906:a259:b0:7ad:ccae:a30d with SMTP id
 bi25-20020a170906a25900b007adccaea30dmr15189830ejb.704.1669023760591; 
 Mon, 21 Nov 2022 01:42:40 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:c97f:bc5d:82d3:1a3b])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a17090632cb00b0078d3f96d293sm4822240ejk.30.2022.11.21.01.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 01:42:39 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 21 Nov 2022 10:42:30 +0100
Subject: [PATCH v2 1/2] drm/tiny: rpi-lcd-35: Enable driver module autoloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Mon, 21 Nov 2022 14:01:27 +0000
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
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
Display (rpi-lcd-35).

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1bb847466b10..bd37dfe8dd05 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1
