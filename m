Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235970D6ED
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB410E409;
	Tue, 23 May 2023 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A751D10E361
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:53:53 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3352b8b9b70so10067085ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770832; x=1687362832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qp7s6eO/AiGsCaE5OfeXuT9L6GmJOAFNtZ50/pn9Ms0=;
 b=JrLSlq4qpxv8uj+F8ZuAqFxqWGTX61pCjBbHzCPqT0cXJJ/+aFK9npAbkH6A0zI67F
 kvUfVgkLs6KZsAzZSfxA/9kxXQMoomeTQq5RogFzJLUjmYBORGzhCIWXJh38Ped0Qkbo
 B3lZwR7stSz4ujI9sN1eNv3A1o35X+hbXuCdYYxMnbZRPUFXXS4NA8uikjvSSr1e7q44
 efdDrGxw6yk+kJTD/Ef1555kvCLtygx1xDv2wG54k/qkYSgAaGQD/QdEPqazML7x6jAT
 AEn6XD97sMmTOqcOnf3NXwP06/FU2MJ+0k8JzRyJj4MZ+q7hce3Ri8DrPLuIMgRE2wzY
 NNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770832; x=1687362832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qp7s6eO/AiGsCaE5OfeXuT9L6GmJOAFNtZ50/pn9Ms0=;
 b=ixAYz6Y50kMktxCWtgnXXtCf9HKRtlKrzTHpPSYgVQoOpCAvAFwNTMuDm2LMVEeIu3
 OJJrNzZimfJK2V6/+XdFCcU2Bk2/WvF7zz49ClCR1LvCzqN4rfRd8KV9dsogsyY8/bEv
 cMUorcmfZy5/6/y7PI7PRt2SdU+c1HTStPY4KEGOa4+vXfW2bpBHulpONZ1NVcxYCe4a
 4LcMOasZOSgO4j49jfaIdOcbMRJ6LG+23Iqy31vZPniVoumyRPCGu3mp+3LNUgtneq5Z
 bpIFZPuvdsZer5VT9mtgodcb+arW3H7oOwjGTO+0gklxEKs5lJHzwBoZL2G/0Jo1c4iW
 lm/w==
X-Gm-Message-State: AC+VfDy0xsWWb58rnxg2ZPfgZi8TFKsZ2Q/xAMcTNe0TUyd2+etgoZHJ
 PKI311+u9hlVsLGCF4JzrfLr0RLarGHDhg==
X-Google-Smtp-Source: ACHHUZ7aBJVz1KLJlwChQfgNPLVGLNp5UND/JIzA4bLkEOU4EweDrbrS5F+10LrjJ6X1nAYVpiIgUw==
X-Received: by 2002:a92:cec4:0:b0:332:b948:9097 with SMTP id
 z4-20020a92cec4000000b00332b9489097mr8154249ilq.4.1684770832620; 
 Mon, 22 May 2023 08:53:52 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a92d786000000b003376eedd0c7sm1817889iln.45.2023.05.22.08.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:53:52 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH] drm/i2c: tda998x: Replace all non-returning strlcpy with
 strscpy
Date: Mon, 22 May 2023 15:53:50 +0000
Message-ID: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index db5c9343a3d2..0918d80672bb 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1951,7 +1951,7 @@ static int tda998x_create(struct device *dev)
 	 * offset.
 	 */
 	memset(&cec_info, 0, sizeof(cec_info));
-	strlcpy(cec_info.type, "tda9950", sizeof(cec_info.type));
+	strscpy(cec_info.type, "tda9950", sizeof(cec_info.type));
 	cec_info.addr = priv->cec_addr;
 	cec_info.platform_data = &priv->cec_glue;
 	cec_info.irq = client->irq;

