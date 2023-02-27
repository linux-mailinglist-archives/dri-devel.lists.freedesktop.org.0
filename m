Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF956A4B05
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8790C89C46;
	Mon, 27 Feb 2023 19:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8010E3D3;
 Mon, 27 Feb 2023 19:35:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c10so3610548pfv.13;
 Mon, 27 Feb 2023 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=IofvGIg7v0q9/BHZLXdPmLDeSmgAtoZVqG+mXihE0S+0d+qzirH8kedP8BKu0RTXuS
 WitWaOJO2oIKRToZhZxyd9wfcHC82ufAnF8BC1jYHBhTOCrgUCwZ4ptcZAvi4AQE3Jho
 uSUaWKJ47rWHnfrdPF27UTTBvFW6YWQKPyGJISNQVvqlSHEMJnl34ew7vgnQtnuud02E
 Vvv4F3PAHKsRk48IU6rqkQEXl2FbUk8tfca4hYVLqCiHaMiQl0lzKCm4xPEHk9idCJo0
 BCfdvtnlDzG9WDnQcGETWzgxa8HYgHzqqquhYqHSFEnFDZfi7its/fdPp4JVw5c1M529
 DeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=s/1+BdWrzKdHxRw1xPKUs5HkN764B318sPzYq7xe5acTQ38FExTF043SP2Pj+4Kngx
 6ttNKT1mFAjeeeMXUF0R1yssszJqEQv5wVhyMMvnKbnBFFDnjH9C3nm05okMnnp2ebXh
 piaaZuFm9JcenCm5Ctgkh61wqL0lxjfBOmVX/dHrwChqW+kQVFVWLL4a0gmqWG4QjCI+
 TJI0F20u9JC0r1jTnu2eaMWXaOuwK8OsZv95w6SO9H1NYHorsWHdZsuPiR15XOCCs+h+
 OMntNEauB4rzPj7bsgEqBs+KEwPqLL+R7TrKxKsg+lotK1FxLPd3A9MlhNk320Q1ZOat
 Liyg==
X-Gm-Message-State: AO0yUKWoRNSvF4S+QaphNkDvlYpPTWHaE3pERzxQv6RCN+S/BaWpxwgm
 /bhEb2ZvbMUlFjaYetlaridI9HHaL4k=
X-Google-Smtp-Source: AK7set91F4YWA4WtPX00cj5zkJ/hv6gTn+7Cs9PmKxfQ7w9oL83mOhSoeAYEpaP9wrPMrjVVEWI2vA==
X-Received: by 2002:a62:2903:0:b0:5a8:ab3d:3fe with SMTP id
 p3-20020a622903000000b005a8ab3d03femr47064pfp.16.1677526554748; 
 Mon, 27 Feb 2023 11:35:54 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa7868f000000b0058e1b55391esm4697531pfo.178.2023.02.27.11.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:35:54 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 03/15] dma-buf/fence-chain: Add fence deadline support
Date: Mon, 27 Feb 2023 11:35:09 -0800
Message-Id: <20230227193535.2822389-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the chain.

v2: Use dma_fence_chain_contained [Tvrtko]

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
---
 drivers/dma-buf/dma-fence-chain.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a0d920576ba6..9663ba1bb6ac 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -206,6 +206,17 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence *f = dma_fence_chain_contained(fence);
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -213,6 +224,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.39.1

