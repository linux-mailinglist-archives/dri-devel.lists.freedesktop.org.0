Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68C91447E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 10:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE53810E3A7;
	Mon, 24 Jun 2024 08:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TNK/P0jw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BF010E3A6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:19:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cdd03d6aaso1869110e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719217150; x=1719821950; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jwPwL72m8s93kw/p7VxOEDDmYj0qJsAuA8dl81m3PQc=;
 b=TNK/P0jwsV/rgmqPkIFAQlC3RAkX8R63iHLqehPJOV9n7Y0nl3kkCTXbVC5CweMcAm
 60bwwX/GOIwNr25TtxneQweFFyVXYwY1Zi4K+iJ+Gj5NonN7ANWlaKMF5JQx5zhDWDAH
 2E2oWgHJgglmy2LDfKNQ+Jm4dQMxh2HrShrbsYx0l1rMlOBkTu7X2mPwtN8QDVLKt5/a
 l34kqgFe4ICsODlDLB0tcbUyCQuZZsmD0tkGwhQJBjHVtPdWrJiInv2Hha2S3UY3Td98
 QHodNaLgyf/pYpPplFesTGS6+dzDQok60o8ToLBHC3/G7VjYI7eTwheEua64gZMHk/mF
 Xw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719217150; x=1719821950;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwPwL72m8s93kw/p7VxOEDDmYj0qJsAuA8dl81m3PQc=;
 b=UNgKiiqiY+xEQb+d/IbZXpHkbRtCrpU7bGx4N4oJ0e3poFT0fiMhvpr5OgfujlBF5S
 je/QEFvYZPJCkkJ4i42CxiVCtbf3vfdMhOpnlwQ1lX9AuVZyAwqXnWKBpv9VTJo79dMv
 h/MvdZr/KEdsJAfVS4MpA2BfRlD1WxaIbMz43karXr5QVQP8Her1sMB2+gpnG9xyAk+1
 n9mGpMQVO+jyO2tAwQDlryzU1aKibmsPg8uhm9C0FFHGv36pD/oqFJ1Um7JyAdg8IJYY
 NG7m1lM8dht+Wf6NRq5iCRdukLsIrYkQThFk3rU3+6WIUUvsMfF7S7355XSI0tsUgBar
 6RoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXcmegTIrlZDnsM6YKPJuydQB70YnrauMx6crblKiK1NudOAl7OlRVJ0+NE/oZpNp2SQmao6ZOINEYlh5ZQqEDw/a18OjyaNyn5t9CO1Go
X-Gm-Message-State: AOJu0YwUgFdC07Q3oCwbCqOzoej9gAp3g+aJ1C8FYC1cFOB5OQPtYT7W
 5ZENlbXVrCSKHx7ZQ/m+FUC7/+6P9vpiA3WVVcPIiCyAxel1yf+mccTKi4/2dSQ=
X-Google-Smtp-Source: AGHT+IHpL6UH6p0b9w60yb/Nc8u8gfZQbm7Xx++lCO0XJ1GqYWCIG1rZ3OamjznZPFHcsOt+MHvVSQ==
X-Received: by 2002:a05:6512:78f:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-52ce064f62dmr2413777e87.40.1719217150488; 
 Mon, 24 Jun 2024 01:19:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bcef1sm923572e87.72.2024.06.24.01.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:19:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 11:19:09 +0300
Subject: [PATCH] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPwreWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMT3bTE4pKigmTd3BxdI5Nk8xTT5DTTVPMkJaCGgqLUtMwKsGHRsbW
 1AHdoaQFcAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hrcbm/Drjw9ypN+HcZfxd5WVucStMi5y/7ez75gjaJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeSv9zpf8H4BgKPlJxOg47IlU6qKet0Gdiy2mb
 lK54d+wY2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnkr/QAKCRCLPIo+Aiko
 1dokB/9wFHH32XcKFs1rHJdH5p1yiMiZrguW0qbo3/I8qIMjE2YUjFNtbRxgC+rk2TUs6uP6WM6
 YEzuOuCRLhsffQOueT6cNgwHDNALL63lxA6n6sfbctfqzqNr5homT+myfqRZCGkPo1BBtGBPHKJ
 Pr0Pr5QbXvvEvbJXk4ePerGK3kvMg9RbIE05Hah/c8eYVny9s7Q2NvOfuBQhVF/d0Jl8SxM6xfa
 5PZYnOPJPLEKZ/+O6+8y4U3QsK6aC6k0NzFUirbmtJKknqcmmLb5YiuSwbkpgMuhkwHcKwe4q3a
 l1w+2aJKlNAHjiDSOfSPwcluCidivsn5WvRA/Aa5MLxfp7GY
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

FastRPC is a way to offload method invocation to the DSPs on Qualcomm
platforms. As the driver uses dma-bufs, add dri-devel mailing list to
the MAINTAINERS's entry, so that DRM maintainers are notified about the
uAPI changes. This follows the usual practice established by the "DMA
BUFFER SHARING FRAMEWORK" entry in the file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f45881e982d2..26d628c677a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18621,6 +18621,7 @@ QUALCOMM FASTRPC DRIVER
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
 F:	drivers/misc/fastrpc.c

---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240624-fastrpc-ml-24c7d5cf5e7b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

