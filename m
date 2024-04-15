Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53448A4982
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 09:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D751122B0;
	Mon, 15 Apr 2024 07:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5+qFl8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0ED10F879
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 00:40:22 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-36a1b0777b7so12274315ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713141621; x=1713746421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJzHJYqm9cEleo6og2FxZikBNx9MbCNpwTRyUR9B8k0=;
 b=W5+qFl8uSequ3xAJsJLSN0Hk87stvGdOjK61K1xSH2erp7ouA0iqXB9LdyCm9ITQeQ
 TCBuwloh++8Suv1AKlCe3ZUesdUJslfPIafRtHsrGUtu6tnzfhSGnl/liZHaP/v+FtTa
 yqRirO/CgSnYdMvOWGK9MEvIrjJzlH2iKVVFeGCc7CzfPzMPGlki4qqt+t/MED3gEQvZ
 KTlhb7vx+OK+VFYiK0gDTfZK6UooE7USx4NbKyFsKAHX4HLTy4cVH4d51I3n9I8b86aP
 d9GMR/F+wJUwow1hIcLPhUqkDgDAv41jQTtA2hADzX0nGXbApXhHfWw3zAzQrRdw2LZG
 e3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713141621; x=1713746421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJzHJYqm9cEleo6og2FxZikBNx9MbCNpwTRyUR9B8k0=;
 b=qNVao8iTT2/eQgV9Vp/T9patmrpVeGi2EdQVDYykTnaetwDXJKG55l2zGvv+XduQ4C
 ZffAxjKYMh0YNAcA9U5zShvhbGLL0UUKPCAo7iOHePvGiyPY89U3ofKzARNwHjXrMz4h
 tvAAdwGU58VrSwVaiNHCQGqGIDn39a0aJRpJMAzhNXVzTPEG5DXoa2JIkU1fzUNacrtl
 YE04UP0oorqb64VGraryv82d54fpDp884lu18PhmyvCDYofYEBqgX2KXt0AdZFuK8AQ8
 hC/9LQAUuW66pGFLBlAZwAMWIl0qPb6KToq+zUmXmSE4tBi9PMLrx8bXHlWRBoq/yaQM
 KM6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlPcvUHHrEhfgPku6hVzWERY5v2pYNRKF6qarvLnG3/1OkfW+BoizIpIsmldn7We63GosbRREatXmFZqZHFbgHQ3ResgqfQ7zkopruQE9N
X-Gm-Message-State: AOJu0YyFMymLNykR1W8qUD4TKXuDlhwiTb9MXglMndGtvi64eiQgPyd1
 9dEHXvGPTbkaIvzo18adnU4knagBhUnq1hXek7XIUrjvGWHRBrk7
X-Google-Smtp-Source: AGHT+IE7TLQRmn6MQvbZZQ4KmVzPFc/46RGTaTcbSYdprI+Y5m9b8zWk0XjVhcZ3KdggzpTwOHk0BQ==
X-Received: by 2002:a05:6e02:170b:b0:36a:20be:bf89 with SMTP id
 u11-20020a056e02170b00b0036a20bebf89mr11365073ill.16.1713141621359; 
 Sun, 14 Apr 2024 17:40:21 -0700 (PDT)
Received: from shiv-machina.. (c-73-169-52-138.hsd1.co.comcast.net.
 [73.169.52.138]) by smtp.gmail.com with ESMTPSA id
 fg7-20020a056638620700b00482b2dc023esm2730851jab.18.2024.04.14.17.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 17:40:21 -0700 (PDT)
From: Shivani Gupta <shivani07g@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Julia Lawall <julia.lawall@inria.fr>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shivani Gupta <shivani07g@gmail.com>
Subject: [PATCH] gpu: drm: exynos: hdmi: eliminate uses of of_node_put()
Date: Mon, 15 Apr 2024 00:39:58 +0000
Message-Id: <20240415003958.721061-1-shivani07g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Apr 2024 07:56:04 +0000
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

Utilize the __free() cleanup handler within the hdmi_get_phy_io function
to automatically release the device node when it is out of scope.
This eliminates the manual invocation of of_node_put(), reducing the
potential for memory leaks.

The modification requires initializing the device node at the beginning
of the function, ensuring that the automatic cleanup is safely executed.

Consequently, this removes the need for error cleanup paths that utilize
goto statements and the jump to out is no longer necessary.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Shivani Gupta <shivani07g@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b1d02dec3774..a741fd949482 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1919,10 +1919,9 @@ static int hdmi_get_ddc_adapter(struct hdmi_context *hdata)
 static int hdmi_get_phy_io(struct hdmi_context *hdata)
 {
 	const char *compatible_str = "samsung,exynos4212-hdmiphy";
-	struct device_node *np;
-	int ret = 0;
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL, compatible_str);

-	np = of_find_compatible_node(NULL, NULL, compatible_str);
 	if (!np) {
 		np = of_parse_phandle(hdata->dev->of_node, "phy", 0);
 		if (!np) {
@@ -1937,21 +1936,17 @@ static int hdmi_get_phy_io(struct hdmi_context *hdata)
 		if (!hdata->regs_hdmiphy) {
 			DRM_DEV_ERROR(hdata->dev,
 				      "failed to ioremap hdmi phy\n");
-			ret = -ENOMEM;
-			goto out;
+			return -ENOMEM;
 		}
 	} else {
 		hdata->hdmiphy_port = of_find_i2c_device_by_node(np);
 		if (!hdata->hdmiphy_port) {
 			DRM_INFO("Failed to get hdmi phy i2c client\n");
-			ret = -EPROBE_DEFER;
-			goto out;
+			return -EPROBE_DEFER;
 		}
 	}

-out:
-	of_node_put(np);
-	return ret;
+	return 0;
 }

 static int hdmi_probe(struct platform_device *pdev)
--
2.34.1

