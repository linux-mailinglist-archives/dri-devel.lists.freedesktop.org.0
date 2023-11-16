Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF07EE738
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005DF10E67C;
	Thu, 16 Nov 2023 19:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A2410E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:14:12 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5b9a7357553so953323a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700162052; x=1700766852;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eVfmF+WaYqBufuKhkvOgsH1LmjL21XWKZ2k2AqPWwJc=;
 b=KNtfYMNsc8Wj+wsTibowQXdz5/VNc1GTk5VVuxlQ56SFUabAftkSH4dmJmZ80jK02S
 1jxjG44axuWxozuhLCyLUs6r2f6vBQjChUoxWaasyXawVDz3RZ7W9IgHlirim6IPKz03
 KPO49uvHRn9FAoxb2YiIWHSKrqQgQhUJK+RR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162052; x=1700766852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eVfmF+WaYqBufuKhkvOgsH1LmjL21XWKZ2k2AqPWwJc=;
 b=OB/Yx85dmYpEmUMnwLNqlURBYv9ZGG9mrSOcUiq0BK7fFv+pkEIvWiYQ6HWsu0STeS
 csQn1jg2y9Br/IrGdm7K0tCU3qhjppNX5eTSaqQcEEh+Ef5agUwj9REh3OFj5bckbQbH
 YnAbvBYOhBq5A4+TlUZq5ei+7iwYsYLdfkIn29y/1pbnoaeyexDbU8CgIMDiLNDAyyuD
 K8fBjqdiIeb59OB1PxQE0564GgaTCpYW0GisIoBtB0bAXNs9n4bYA/CY4GTgdES2nch0
 Gc7wupRnbxMKIRLw5zD/pbKDsKtjayBzF2FiOqJShUQkwo2eNoflOeRcSbO/E4Tb8VhY
 9IOQ==
X-Gm-Message-State: AOJu0YxdaizCgSL6Zgm8oMhQ2uNtQo8Q4WweABU8CA6M5r9EKNOmTQKo
 SQVfWWs1cEaCwjv+ZMK8whXPtQ==
X-Google-Smtp-Source: AGHT+IEhiV51XKMD1zOBA5sD1OXQnyONH1asnHIR7eOg2pPSelrDFt5DBTV7MXEVihwsOKosOCrQ0A==
X-Received: by 2002:a05:6a20:8421:b0:185:876f:4f4d with SMTP id
 c33-20020a056a20842100b00185876f4f4dmr20888854pzd.32.1700162052390; 
 Thu, 16 Nov 2023 11:14:12 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 it14-20020a056a00458e00b006c8721330fesm83721pfb.74.2023.11.16.11.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 11:14:12 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf: Replace strlcpy() with strscpy()
Date: Thu, 16 Nov 2023 11:14:10 -0800
Message-Id: <20231116191409.work.634-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=ujMUNo3RU3wpVThFuzKIZ2gb6sD3uJtU27PlSfCQHtw=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlVmoBZbJJwqB7WG04tbh2/UJo2fxHw9dAlFGyu
 eEfMPCM8D+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZVZqAQAKCRCJcvTf3G3A
 JtT+D/9ZzA0yA7kvOO/Y+64NFTRleFpB8MdlXKFS7ysgcMx4Q/lTBKhkKLD6qvD9NiIXGTKSGrh
 3GGTQlSXtD3gnP9vhfnsdQPxm7Nme0HfgCADjlK12TQqmzTEluquxp57OqhgDPqrFwjp8zEkEHB
 Hznzi9UF9cqj/T63wcAuGjXC8mx550cZDOzWaKfsxIIwENsPZLrbekUNeZsgQPN8un/mTeTasXh
 Dim2vXCq1wg+zmIYt4wb3MFHvAeNDMdbudLjwnaxS7KH4SAhXIV+iQTJjOW5gj+CnOEliIjO0eP
 fctBuohDOYWiyPZ/b5LKRsaNIaNLhlsKrsXW7qpvTi8NTdNME/ndlbETv7KqumwjSQtiDoIqNmf
 t4ZH9yrrcuYCaDcaA0D5Mh7Z3fyLsNgiO5WZ5JDwGOfxsVz5Ux99LctSgV9M1T6ygM6fYkp3X5/
 jHoeIUVCzQ/rFkZqtLD3RMj0C94i6hEM9oWm1/HyfB+sFVvdNn7zG+RyuryDoT2rOjrig1Y4IES
 i8Zu0UB9f03CJHQeC9RkPMDoG4U+ZEA9wgMwqQ2eNX8M3t3UGzFepxFW11XLyXTfEq8GKLh8Qxd
 qYRKZLWDQkcbtBf6aRIGrTkqc3Xw6N6aymKwpizpCz/BphPJrIy5TIkEpZI9xYTbwzO+eW77/2H
 cTml0Zt rnUC/efg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first. This read may exceed
the destination size limit. This is both inefficient and can lead
to linear read overflows if a source string is not NUL-terminated[1].
Additionally, it returns the size of the source string, not the
resulting size of the destination string. In an effort to remove strlcpy()
completely[2], replace strlcpy() here with strscpy().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy [1]
Link: https://github.com/KSPP/linux/issues/89 [2]
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 21916bba77d5..8fe5aa67b167 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -46,12 +46,12 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
 	struct dma_buf *dmabuf;
 	char name[DMA_BUF_NAME_LEN];
-	size_t ret = 0;
+	ssize_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, sizeof(name));
 	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(buffer, buflen, "/%s:%s",
-- 
2.34.1

