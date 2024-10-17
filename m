Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4139A26D3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C48010E053;
	Thu, 17 Oct 2024 15:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t76RP5Jy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB51510E053
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 15:35:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so775567f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729179337; x=1729784137; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqbcP7dK2aMJ0XNQaLg26ntovAXTjd5n1xguqyfCHr4=;
 b=t76RP5Jygxe+L1wS8vdeeu3lT0ISMmWFIPwigX4lx+HO6tw0Ermwn/ESGVQvLNZGHS
 he0Zg8scuWHvxvZ41eGgfiB6seEmul7hKw/cT0hlqR1IMsZwF1GNldkOzxQY8KT2ISe+
 1Oc2GdTga4F5+DvSF+xXaZHdgtUDQQtac0lw6B9C6qxyp0yuJ4ulBpqG35KC+aOIBaik
 swxiv8I7LSciDEPK+I7101B473pSkm+5Eu3BmwWN/9NnkXFbfCw3wwQELnK6v2JgZNgX
 3LXQwj3BAr67IGfSmKe+tL8vKdNdiDJEgu+ZM2OGzjt6xwYfKEB89BPo2OI+ozPOcIiV
 mfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729179337; x=1729784137;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqbcP7dK2aMJ0XNQaLg26ntovAXTjd5n1xguqyfCHr4=;
 b=FmH/8zOijhlCwGITh+/l70mWkwNdXTWYb5iESsVoqpt6mwyCnnjfU4MeGaev1+33y0
 nqukYXdZESeXAHci7asyzMZbJklPUqHHlYQwAsudNt/Kc7FFnjLrk/PjZXV/jNvYVBxi
 IZms68b/nwpjq9DWntawjtamF175koVr1UIqZahuFAOBE4bP7XTAfJorLJcZMInoMJ2u
 Cen2qA+FhhGeF2agbnDR5S8gbs94e/EfiyKGQCLSR/eRD+Ik8l5y3zithaXplvPs1lWO
 95JHih9vzxEMeL5yAetwHgXCI9QE+UEfG501XsqRKeV5mUDeMNGMYqPzHe74GpSlWF5Q
 vbXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRVDb9/D65BCZwMa1ju/53enU+JgOLcI1jkINypit4thh5kT3fhaw5722cWR8JpDXCCG8Efb8cKW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaLnBUcnmUDB0bMi0SWojLKIMOe7fLGf8BvatU9WpgMXK7mFB5
 HWyX+Dg6jAHJnemEKxgc9Z76NFBwhZeOaXoK4AtHz7VRZ2dkEGT+puAi92GSULc=
X-Google-Smtp-Source: AGHT+IGjWzA1J/qNb3pu7nTg6gpRfLQvB/Lxros9VoMUt1p74jGUDKAkWTtuNyFTXTsTiI/qZNI/RA==
X-Received: by 2002:a5d:5192:0:b0:37d:51b9:7f3b with SMTP id
 ffacd0b85a97d-37d86ba44c4mr4689309f8f.11.1729179337047; 
 Thu, 17 Oct 2024 08:35:37 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c359casm29796145e9.8.2024.10.17.08.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 08:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 17 Oct 2024 18:35:26 +0300
Subject: [PATCH] drm/bridge: Mark the of_node of the aux bridge device as
 reused
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL0uEWcC/x2NwQqDMBAFf0X23IUkWKT+SukhdV/aRUzKBosg/
 rvB4zAws1OFKSqN3U6Gv1YtuYG/dTR9Y/6AVRpTcKH3zg8stnBcN36bSrNLtJlL4lwEbFgrhO9
 TAIbepeQf1EI/Q9Ltmjxfx3EC373dpXQAAAA=
X-Change-ID: 20241017-drm-aux-bridge-mark-of-node-reused-5c2ee740ff19
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=h9uykyfO7ScfnJqg9/bvlXoGMVQ8+VTobz4GllhZUUI=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnES7CiAGU32p57bHQLiiz0jEimNZ5o5hlcba3q
 uMdixGM9pWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxEuwgAKCRAbX0TJAJUV
 VsUuD/9Lyl7mb7MVnlV/bdmPb2jofWDLNNw990TrN25CZMT+6Xey4jyj66fPIsAvCQuOuLGK0cw
 tntfPGjUDUKhTwEprWx1ncGs9YHR/NPVE6yf16bCFovaMaPAKb4V07nzSq55Hv+outtijYjqVh3
 MKcmL9wmvkFSC9B89girNOV2SCH/oW0/oOCZ97UVXYRLsMx3MJ5+bEQSBgNj6VLrfrTAkSbvbZ4
 t5T3IPRbkj490bx8dTMNK8+HwmU4GehktikcASgWXIrc3x7pUU3D2Ilak8K6DBp21981MbZyNpN
 pzodZcrp8lR2peDAYGvKpSLLydwZQOTx/ZjTxt4w4dQyqmiiWzs4mCtniOhoZmX7a+zZgr8kKtO
 GZlJh0CRlnQuBcTmwH6oRd59m2ELukq7l1L+FTcPFdh0ZDixsOvwuxIsJzvfHObX+0ATZOWA635
 XQuGVKb3GM27unPpOoeiizlZ7zIVYmQcvsCfdBiPG/lGg2wuHa6TDK3jqUvEWzMv4aCMb1ci3D9
 JUDjyre3uERimQLS2TgbX7na7WfyqgW+0ClRAgLJO860ee9Bi6R10u/aYsHl1zxjmYtwukx/Rqi
 eCxLoyU458FrWNEBAoVUjWAhRWKKcXeUHOZGBrwT+1pLCEGlza1Q9dmsa2sHaXkntxwTuzpsAFK
 TxMqU3ZDBr0tLVw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

There are some cases where sharing the of_node renders different resources
providers confused about the same resource being shared by two different
devices. Avoid that by marking the of_node as reused since the aux bridge
device is reusing the parent of_node.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b29980f95379ec7af873ed6e0fb79a9abb663c7b..ec3299ae49d6abdb75ee98acfe0682f1acc459f8 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -60,6 +60,7 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_bridge_release;
+	adev->dev.of_node_reused = true;
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241017-drm-aux-bridge-mark-of-node-reused-5c2ee740ff19

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

