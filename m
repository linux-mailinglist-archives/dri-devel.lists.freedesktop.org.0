Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B81516BB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414BB6EDCF;
	Tue,  4 Feb 2020 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D20189622
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 15:45:04 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8C5C6A26405F764AD096;
 Mon,  3 Feb 2020 23:44:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 23:44:49 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Ofir Drang <ofir.drang@arm.com>, Gilad Ben-Yossef <gilad@benyossef.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Sumit Semwal
 <sumit.semwal@linaro.org>
Subject: [PATCH -next] crypto: ccree - remove set but not used variable
 'du_size'
Date: Mon, 3 Feb 2020 15:39:21 +0000
Message-ID: <20200203153921.45273-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Hulk
 Robot <hulkci@huawei.com>, linux-crypto@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/ccree/cc_cipher.c: In function 'cc_setup_state_desc':
drivers/crypto/ccree/cc_cipher.c:536:15: warning:
 variable 'du_size' set but not used [-Wunused-but-set-variable]

commit 5c83e8ec4d51 ("crypto: ccree - fix FDE descriptor sequence")
involved this unused variable, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/ccree/cc_cipher.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index 7d6252d892d7..b5133f57bc87 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -533,14 +533,6 @@ static void cc_setup_state_desc(struct crypto_tfm *tfm,
 	int flow_mode = ctx_p->flow_mode;
 	int direction = req_ctx->gen_ctx.op_type;
 	dma_addr_t iv_dma_addr = req_ctx->gen_ctx.iv_dma_addr;
-	unsigned int du_size = nbytes;
-
-	struct cc_crypto_alg *cc_alg =
-		container_of(tfm->__crt_alg, struct cc_crypto_alg,
-			     skcipher_alg.base);
-
-	if (cc_alg->data_unit)
-		du_size = cc_alg->data_unit;
 
 	switch (cipher_mode) {
 	case DRV_CIPHER_ECB:



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
