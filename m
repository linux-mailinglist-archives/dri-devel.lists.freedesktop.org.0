Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6C5BA6DE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 08:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D1110ECB3;
	Fri, 16 Sep 2022 06:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067F10ECB3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 06:31:57 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q9so10347743pgq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ZmowVWWRmWocJjPgWDw2ZalH/Av3o/R31s38SjsWoiI=;
 b=K8iwJPV0dZif8U+5GjpaEh333xmUojgSqrpCXhk94yfRb5731bgocIRuX/EDCI9SvW
 rR/zBCM/ZijUHjs3V+//iPjM1dU2wd5Enf/hTOLs32ho/K8A755MsW99g8tQCwhLzwqo
 jt/N8/RlaQW7xAkQwVGWDehT2NpdJtcLTzMbMuVJFsdS7nAp/ikElttEU8BVJpfGbQpO
 m+cjovW/oroujWx+2TCw2PaFVIIE02AOHAeB0tnCMvFzQA1vqE7PiPXvC23M/FR2XFKr
 oQsRj9S45QPZ2bGm7vm2uS31u2elXivEH/itahepzQ7U0CXSVKKLGGPCdNeV2WUroSwW
 VNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ZmowVWWRmWocJjPgWDw2ZalH/Av3o/R31s38SjsWoiI=;
 b=8GZPZRCDrKIEf80imJ81qLlT7QBA/AC3UmNifzWf9AhLuGLEeNCmwTfkVbCJbC6384
 H1QnfPxzOj0aPoft2C4kfLkA80xULevxPwGrk7mZw5dIexG4Xb7kpPdoHMv16xHOcGXb
 zAnHM5vcN67WXt48Abynhr3286GVosoPljDvq6R3FkSZSFuVXX0b8v08AIvUqG0VmfM5
 YmjZi833KOhMxzclm5wdM/JtPTVbmpzRrks2roPYfWRp4QtVjVGU4jLmSyOxul/u71d/
 TeQBSQUIvaMxUbjX4P+1wFNsLoxYXFu6UPtddHlsjHs3d5DHBtdJRY1BNeuOyX5G2ILG
 Id4A==
X-Gm-Message-State: ACrzQf32KYiKECtKMx1o0yrBIExKjLQ2z8Ep/zIZRxmGaQAJEPQg1glK
 ArEGwYtQUstHjru6PTG4S4c=
X-Google-Smtp-Source: AMsMyM6uCFnr0zMkH2Fblyo61mCd4o4GMS/d2jGZqVplmezgaEe+fdsJwx1cUQVqtDOJQYy8wyq4+Q==
X-Received: by 2002:a05:6a00:b8d:b0:545:e7de:78e5 with SMTP id
 g13-20020a056a000b8d00b00545e7de78e5mr3266569pfj.72.1663309916926; 
 Thu, 15 Sep 2022 23:31:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001fbb6d73da5sm735561pjb.21.2022.09.15.23.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:31:56 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: use strscpy() is more robust and safer
Date: Fri, 16 Sep 2022 06:31:52 +0000
Message-Id: <20220916063152.155257-1-chi.minghao@zte.com.cn>
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
Cc: linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

The implementation of strscpy() is more robust and safer.

That's now the recommended way to copy NUL terminated strings.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index dd0f83ee505b..51cdd4060539 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -50,7 +50,7 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(buffer, buflen, "/%s:%s",
-- 
2.25.1
