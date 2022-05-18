Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D440852B528
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 10:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ABB10E10B;
	Wed, 18 May 2022 08:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C906910E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 08:54:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id en5so2115998edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 01:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NmakBTu/yOyy+SXgm2S0IBtesj4DDqTwypdR4z2zMUA=;
 b=KEz4Bfyh0z1RizjUSsJ/8CTRYSpajI+zNYxQ01gkSHN/0/3A+AfdT3/4ghmoOnHgvk
 9rIaBHU16WWuEpAjx6IMmBKtkD8+VLM59YIrx8m1UzK9HVyM4dPZ8nDOfxUrIRI8wyFj
 AyaEit+RDj2uSN1DzdGcuKR5zRmdtdEkcyhpVtgUaWfagBiINDG7WXmJxLrVbnCFChqA
 SG+J0yRnkL/jGE4i6dba2XRZ+t/IP8f6Zp5w8BTAoyHampntK0UGTEMl49rWIKtPCNC7
 /X21EGM594pLwxJ8TJn1AB9rk7DNP4E0hw8ad73ftcNWl4meyDyroyt0RMN9VTJ0I1bH
 Jy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NmakBTu/yOyy+SXgm2S0IBtesj4DDqTwypdR4z2zMUA=;
 b=fJaCd9NjmsvXxYufNGA+5AI+5g7fxwel2c0Z2UY6hEzLQn/QIwld6KcNjP0OG3ofYZ
 rv3EeXyW5gagr9lbymaCX0WfmjZaimM4jYI2xXjbouMD4qQpmzgRaRfHDJ4Edrjh7x5p
 1frVgR8vGur6AJSJ3atOP+JK57J67ys4hA2AAdwVnmZkK2/JIW2h6FNZ+8ulrKp3csMY
 W9A83TJbNoMV8HR6nbOeuAgQDm4ozrkXO4PtOxaxfztClImFVlcpb2LCFj199c21Vf1d
 GDjkSYPP1nwDmbwFILYsipTdhlkWoguRkEtyKDFuIjMyVGKhurfhQSoHe0cg+/rMQIuq
 DVdA==
X-Gm-Message-State: AOAM530z1IGLa/Sv98HwdZ8aVxnnczbdm6VkLpTFmFMQQ7SPweBcq+Wd
 xZHGVT5e6EeDRWlM3dyYKH0iGPrRAzg=
X-Google-Smtp-Source: ABdhPJxDonz8lzrvTV+KHVl0KiPlKtNFlPmtROdCUy+WJuAexza7caYRXnzxmG8UipUDKo4MqaZrIQ==
X-Received: by 2002:a05:6402:354d:b0:428:19be:2447 with SMTP id
 f13-20020a056402354d00b0042819be2447mr23188331edd.308.1652864088372; 
 Wed, 18 May 2022 01:54:48 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 jl26-20020a17090775da00b006f3ef214df0sm699275ejc.86.2022.05.18.01.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 01:54:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: cleanup dma_fence_chain_walk
Date: Wed, 18 May 2022 10:54:46 +0200
Message-Id: <20220518085446.31338-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use unrcu_pointer() instead of the manual cast.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 06f8ef97c6e8..a0d920576ba6 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -62,8 +62,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 			replacement = NULL;
 		}
 
-		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
-			      prev, replacement);
+		tmp = unrcu_pointer(cmpxchg(&chain->prev, RCU_INITIALIZER(prev),
+					     RCU_INITIALIZER(replacement)));
 		if (tmp == prev)
 			dma_fence_put(tmp);
 		else
-- 
2.25.1

