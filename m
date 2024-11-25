Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F179D8B42
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6DE10E6D0;
	Mon, 25 Nov 2024 17:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzc7aCpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617D10E0ED;
 Mon, 25 Nov 2024 17:25:43 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id
 6a1803df08f44-6d40263adbaso36789066d6.0; 
 Mon, 25 Nov 2024 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732555542; x=1733160342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UVDQspBi0nK52468djjhcLsHS6suKDvQYTgpSTpGaWI=;
 b=lzc7aCpAIaqD8rI4R/k3DgsipBRbhgooEM6f09wRdGM+eRAyyY63wTay4dp9qedHZo
 OD5EDpmauIkyIE2q4Vbk/NM0KHGymH0v/smq2C3YfGiYlro5ByX6hNS5MmhnkNLmo9pV
 xHKpJDcUUn3zBUsvlAGdU5xnsKJxTPwiEiChtyzAYw/H1HXrYEEoeqrsRwNxUdEHU2u2
 vFdAyYVTEjLXUCjUwNIa4CR2zyZPxW1uoAdiNWsKzSoeRX6MIgXlsSr3IJstw7Rbkews
 PoYeryYbJlxRBfyjMv+kg9v0MDmTm2JSuesY7Ye/2cioUWgwInu1z7YDAsXqxgxblDrE
 1/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732555542; x=1733160342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVDQspBi0nK52468djjhcLsHS6suKDvQYTgpSTpGaWI=;
 b=pcuf/YNQz8jlCn44fetbfn4/kbyGoW7ODO8UFnhER5Ef8e6Ype6XpQyJesozMw0XZI
 nloAN2loQ/HpAkwXqxFY+COhA35ga0cUtDX+JNK88Q4oSLmbAzPOv7MaZFWe1/FHloJg
 g9D04PUCp6ST81PO+hc14jcM3vMQX+dQPMFwZ1XMqWCL/ME8RJx0mspjpemNZ02bBASE
 N0bxlXUKWvWz4rVPKkmP96QWqeVefT+7xUSEXwgGva892LLrdi1DL4O4mu94gIpc4Yvh
 4fxUNMPlFRFx+ghI4D4iA2LrWRxQGeis6Kujh5/0XZhmcrz2a+fFTrPCTk2r2tnybhMp
 /P1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVmaQ3TMfYFrEP7z5BUt+C7UGBJWrsfNtEr24FNoFH0rgON02Ulg/Onx0lsCFSzBxLaDn2FOufjPn/Jrk=@lists.freedesktop.org,
 AJvYcCUXOqDVCb/smkSutHTeNZxb74Rxq6oloz8Mr33E7E6k855gmht6e2YrBJOlxE7aB9fT43OyLBCawio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwrI4dQdzhG6fN7/7DjiKlF6CRV1Y+AD35DsomwT73peqvq8zQ
 3rJvpSZJQm3hCKDHoeUwHlMKmfVzvipVEoV5v2XYn/1Bw7Pmz/AE
X-Gm-Gg: ASbGncuCF13nMNJ/RCJqPdvfQrVppvzzJNw2qLL3sAo/MbhCCmGE81h74Q35bVncuTd
 EVwD57e9MxFSX8NQHHca1jr9n3Z2Tawgbj0PYfLlYbbke0bFs0c+F9eDsiGVOftXDbFY2iTb51a
 YXrbuHSi2J9Esqg9yF8ye4IS7VMi8eWtsedAFnkie1jOKRUtZZywagMn2TY7Mm832rVDMiwlSyu
 ZsD/JJqpGty9vWpjKVq4n/ZIufpZ6f3IyPqhEpCapRghaR96I4fMEw2o7jK+QOMH6VQFODid/B7
 A2LrzvDC88I1hI2/dv9bo48fM1OMw5Ktr00o
X-Google-Smtp-Source: AGHT+IFGvdFBb55MfpIRzxnpds3EDnlB90XnfhZ3sDfgc1tgDF7Qn6XtKH/y7aitBCCp0Ukgox6SIQ==
X-Received: by 2002:a05:6214:1d0a:b0:6cb:d4e6:2507 with SMTP id
 6a1803df08f44-6d450e871f7mr221611656d6.22.1732555542124; 
 Mon, 25 Nov 2024 09:25:42 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d451ab4d8esm44702576d6.54.2024.11.25.09.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 09:25:41 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm: cast calculation to __u64 in qxl_mode_dumb_create()
Date: Mon, 25 Nov 2024 11:25:17 -0600
Message-Id: <20241125172516.9622-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply pitch and
args->height may lead to integer overflow. Add a cast to avoid it.

Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_dumb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 17df5c7ccf69..74076c87a002 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -41,7 +41,7 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	uint32_t pitch, format;
 
 	pitch = args->width * ((args->bpp + 1) / 8);
-	args->size = pitch * args->height;
+	args->size = (__u64)pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
 	switch (args->bpp) {
-- 
2.34.1

