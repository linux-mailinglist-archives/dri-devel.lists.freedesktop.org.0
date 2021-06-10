Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20A3A2823
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8286EC9E;
	Thu, 10 Jun 2021 09:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5D16EC8F;
 Thu, 10 Jun 2021 09:18:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o3so1411976wri.8;
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3a/i/Xi+c5m0afcasaoynqq1ok0Yws0jZdSKhj7thXs=;
 b=Cjoz5iUAWyabHz2NF7E35GLGCd8e3pJLjEbV8g1Bnv3UJEP1XZtz5MYv74y33sBuI+
 +cH6B442Jle0S1nimKZJoy78K7eSPuzHcsnS6tMv8t/A+AFfiR5X4stx2fEPcHmuRBXC
 CZpMjznvccE8UipdUf/GgI4Ul8fRpUoMsA5AE9PRBusJpUTDWE8l/+wHfIFbSsqffFmD
 2zLwAt3wW31nV26+jBN2Amuh8TeBbf/qyWLuSYZHeVdcxKohKRzLnajCvY6d6Xn94XPm
 7rt7K5om94Y/LkxMGBfdFBsNB77wi93bVLzwtA7yXhrWyre5Mt/HjCnfQgfWufAqzt4I
 RXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3a/i/Xi+c5m0afcasaoynqq1ok0Yws0jZdSKhj7thXs=;
 b=d7d4p8peK+/TfFx8c6/7o44MXlS+unXxQ1O0mXjVD1mniBO6jNTwM8R9EEZOMElzY4
 z0/01jtNh7+ZCKkb2CfYIaCFxtG0FxrgrpQ/lQn7tSeRMmie7UiCBQa5zwYHgG0w/F+H
 Zhad5cVErMX0rf+TNeDwbV+78Tek0Gzj/aHQB35OsxNKxntX2/vzm7nTFBLNVg4YcoJI
 lgokW/gDodI7r+dklGUwnj01XoUw6gIqlLmsZ0e5kS5BiXl8ezKNDXH+79XmCtj5PmWV
 apXh13fMjtPnV0xG+oAVkUNm3etitHebzdT4VjREt8zfHdw8bDAXCvqoCHThRgt5xzoU
 Q54g==
X-Gm-Message-State: AOAM531XlXxg82JWgotxKNMoL8y2g8HNkSg8Usd8UBWEP/zTKkQ8PTun
 a4Hy5/NaculfwsJTTlMkWrtXyIRWRd0=
X-Google-Smtp-Source: ABdhPJwdrFEpaRTP3/l4f5jojr7XkftDaE9q6zzVkIPmtDfNS9UJaYkXvmJvs+CCw2cKGrOfDqbrLg==
X-Received: by 2002:a5d:5182:: with SMTP id k2mr4182514wrv.381.1623316684384; 
 Thu, 10 Jun 2021 02:18:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] dma-buf: add dma_fence_chain_alloc/free self tests
Date: Thu, 10 Jun 2021 11:17:56 +0200
Message-Id: <20210610091800.1833-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exercise the newly added functions.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 8ce1ea59d31b..855c129c6093 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -95,6 +95,53 @@ static int sanitycheck(void *arg)
 	return err;
 }
 
+static int __alloc_free(void *arg)
+{
+	atomic_t *counter = arg;
+	int i, j;
+
+	for (i = 0; i < 1024; ++i) {
+		struct dma_fence_chain *chains[64];
+
+		for (j = 0; j < ARRAY_SIZE(chains); ++j)
+			chains[j] = dma_fence_chain_alloc();
+
+		for (j = 0; j < ARRAY_SIZE(chains); ++j)
+			dma_fence_chain_free(chains[j]);
+
+		atomic_add(ARRAY_SIZE(chains), counter);
+	}
+	return 0;
+}
+
+static int alloc_free(void *arg)
+{
+	struct task_struct *threads[8];
+	atomic_t counter = ATOMIC_INIT(0);
+	int i, err = 0;
+
+	for (i = 0; i < ARRAY_SIZE(threads); i++) {
+		threads[i] = kthread_run(__alloc_free, &counter, "dmabuf/%d",
+					 i);
+		if (IS_ERR(threads[i])) {
+			err = PTR_ERR(threads[i]);
+			break;
+		}
+	}
+
+	while (i--) {
+		int ret;
+
+		ret = kthread_stop(threads[i]);
+		if (ret && !err)
+			err = ret;
+	}
+
+	pr_info("Completed %u cycles\n", atomic_read(&counter));
+
+	return err;
+}
+
 struct fence_chains {
 	unsigned int chain_length;
 	struct dma_fence **fences;
@@ -677,6 +724,7 @@ int dma_fence_chain(void)
 {
 	static const struct subtest tests[] = {
 		SUBTEST(sanitycheck),
+		SUBTEST(alloc_free),
 		SUBTEST(find_seqno),
 		SUBTEST(find_signaled),
 		SUBTEST(find_out_of_order),
-- 
2.25.1

