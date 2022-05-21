Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316553097D
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F142010EDDF;
	Mon, 23 May 2022 06:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044A910E196
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 23:41:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id jx22so8447124ejb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdrJqIo/GRKMDgYhFgAuTcMLyKx/q5317mexMjLYVS0=;
 b=d8XkpI+YxfkV4Dw3nPfsFZpiK74vtJiPOovBqNX+AW0KMvzT1e+YXKtkOb1Rd0Km7a
 9wGJ8Iuv8juOXVWjTzfcSX+SLlVgES0DKzIvNzDQp8fykHEEvgoRc1hQKZVGCmDaceJy
 JVoXW9YODaRJ/lhOy+0haQ/B8PcbJddrzj3KvBPJwc5D+3vn86O8Ni8HilILhsCAJzup
 3rEB2k3H4tmdedK+C93DogzwWGC11pwjO1hYWcREyqUfwW51VXJ5eMzUuM7L2hrEYhr1
 4jhUM/j4oOsol6LlUHzTHy7Aydd4cYwM2ZXuNweoM7nywGsr4IuMKXxJCCjetspeKZli
 mdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdrJqIo/GRKMDgYhFgAuTcMLyKx/q5317mexMjLYVS0=;
 b=LO4v9osuJF92jaKcKhypi+aVqOjd6KhO6TcLRNAMrO9OMOVkuOq1/ocLtnFvFf4oRX
 se0fQ/3DjQLK2vnNjrv9MYOYyFCzjO3zsLircPzBZ4cFlChEhHnIaZIrsfRrnALzhuqA
 x2vXiszJna19NQoTwtyJ8WW6+ekHSVOyG6kcNBuxN0BOwcf9Au9knLeSqQh0vR7+N8jk
 +bgBvIv0tYwM5j+go8SS2nc085q7CLri6CRzQDY9oCMh22HHI/OTmasAbwfF4Mgb9xPA
 OE0FNTI1va9z4U5FP0+uSFLrHh/sf3lJ7p7grtC7UBf6t8jOs/4+Hq42hQiv6mMqdRue
 D9EQ==
X-Gm-Message-State: AOAM533gy6eixzakdXwdLA/dFKbjQ0dIA98DOcfFYjFrcI4ZtH9q+FNU
 Oi3SVN6OLV+bM5KYWXoTngDql8iEKHQ=
X-Google-Smtp-Source: ABdhPJwd4P9NiYWabjK8Evcbeg4SsC/KRlpM5+KS0WbfHvY6ONvWlU9XJwCO365EF6cskSYDwDJqaA==
X-Received: by 2002:a17:907:3e11:b0:6fe:cce4:57e5 with SMTP id
 hp17-20020a1709073e1100b006fecce457e5mr1052773ejc.640.1653176481204; 
 Sat, 21 May 2022 16:41:21 -0700 (PDT)
Received: from nlaptop.localdomain (178-117-137-225.access.telenet.be.
 [178.117.137.225]) by smtp.gmail.com with ESMTPSA id
 k9-20020a17090627c900b006febc1e9fc8sm1245562ejc.47.2022.05.21.16.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 16:41:20 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: use ENOMEM for drmm_kzalloc allocation failures
Date: Sun, 22 May 2022 01:41:04 +0200
Message-Id: <20220521234104.88410-1-dossche.niels@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Niels Dossche <dossche.niels@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other callers of drmm_kzalloc already return -ENOMEM on allocation
failure. Change EINVAL to ENOMEM for consistency.

Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---

Note:
I found this issue using my experimental static analyser on Linux
5.17.9. I compile tested the patch on x86_64.

 drivers/gpu/drm/drm_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 72e982323a5e..a940024c8087 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -226,7 +226,7 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(-ENOMEM);
 
 	encoder = container + offset;
 
-- 
2.36.0

