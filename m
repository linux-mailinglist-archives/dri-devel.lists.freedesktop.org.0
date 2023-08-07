Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8E772719
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78510E16C;
	Mon,  7 Aug 2023 14:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798EC10E29E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:09:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe48d0ab0fso7058646e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417379; x=1692022179;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsspjBTz0WwJAyfi3IrApSy8tFr5Y4cShd2ZcDlW/hE=;
 b=sJ5QZe/dQJU0F49lMYomQFRCKVKAIm6XBxvx+oz2A1tOeMRBr9LWlfTiRQIMM1tBt8
 FOBMLosgPXNIZPGlarWpREN9BTV7ffWSzePe07TwXE2h9nbYjbU+0xZXvo+Ko0wmNyJ4
 8ODzVflQtfoP5ZRC6u9qoL0GOPxvfBJ8eKcjcMlLga/msVf5rPwmoQZIFujW1hP/3Q5b
 dPcoN3c0m0/sQ/1vyLGDpg913WW3Abnujo8d8EynTmfdhaXhGAXOUwr+IiDigxy68KMF
 B/bTjvh2XJ2051/wSASwyav+pRjReepVdOhJtNIj5rJ2iOf47KzO8L+WiqjhYrWTieO8
 ATJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417379; x=1692022179;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qsspjBTz0WwJAyfi3IrApSy8tFr5Y4cShd2ZcDlW/hE=;
 b=leEIUOHhXhy+putTW8FzUrUSs35Kh8ygj6OZphRsIrb4eUSPKR7k8x6Mit3DGOyHPY
 cPcV7B1rDO+uVJxBUTBaQwn2NOKGxfDnZm3VE7htjqZj8ZkP5gyWIWXlKynrEW/LNpVB
 NTi751U0Lv/3HblIjk341WzxxqmcO1W2y0OHJhSERZrDggxizIWthj8LLG5MDy3NMByw
 AsYxXUxuCfwa2VHV2QfDuCuvo7kG30xzfdv7fI6Ll5r8zD1frPPhY4g/fvQEaXSvdj/h
 eolBvmRSXWBHXxBjDHNHSAT2pv4jplWorD3fUz0f6NX8wPMR17lrxVRMMAs+HDeXEvrU
 aUSw==
X-Gm-Message-State: AOJu0YwbwCoFE/y8OtenVr4f8DC7bwKxr/65Z/OLJJ4LxvjbarV0MhxQ
 e8uGSRghiTW3bjIt+i8kRqIq8w==
X-Google-Smtp-Source: AGHT+IHMJ0PCpSkNtWXzMTB9tXGBROu0Ysj4j1KeULOhjSuIWf8Yo6PoiNgJ2dCppoLG4q11CHvdpw==
X-Received: by 2002:a05:6512:3e29:b0:4fe:4e2c:8e52 with SMTP id
 i41-20020a0565123e2900b004fe4e2c8e52mr2204489lfv.42.1691417379532; 
 Mon, 07 Aug 2023 07:09:39 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
 by smtp.gmail.com with ESMTPSA id
 h12-20020aa7c60c000000b00521953ce6e0sm5213951edq.93.2023.08.07.07.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:09:39 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:09:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The encode_dma() function has some validation on in_trans->size but it's
not complete and it would be more clear to move those checks to
find_and_map_user_pages().

The encode_dma() had two checks:

	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
		return -EINVAL;

It's not sufficeint to just check if in_trans->size is zero.  The
resources->xferred_dma_size variable represent the number of bytes
already transferred.  If we have already transferred more bytes than
in_trans->size then there are negative bytes remaining which doesn't
make sense.  Check for that as well.

I introduced a new variable "remaining" which represents the amount
we want to transfer (in_trans->size) minus the ammount we have already
transferred (resources->xferred_dma_size).

The check in encode_dma() checked that "addr + size" could not overflow
however we may already have transferred some bytes so the real starting
address is "xfer_start_addr" so check that "xfer_start_addr + size"
cannot overflow instead.  Also check that "addr +
resources->xferred_dma_size cannot overflow.

My other concern was that we are dealing with u64 values but on 32bit
systems the kmalloc() function will truncate the sizes to 32 bits.  So
I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
systems.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is re-write re-write of the previous version.

I am not necessarily sure it is correct.  Please review carefully.  In
particular, please check how "total" is calculated.  Maybe it would make
more sense to write that as:

	total = remaining + offset_in_page(xfer_start_addr);

The other question I had is should we add a check:

	if (remaining == 0)
		return 0;

 drivers/accel/qaic/qaic_control.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index cfbc92da426f..d64505bcf4ae 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -392,18 +392,28 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 				   struct qaic_manage_trans_dma_xfer *in_trans,
 				   struct ioctl_resources *resources, struct dma_xfer *xfer)
 {
+	u64 xfer_start_addr, remaining, end, total;
 	unsigned long need_pages;
 	struct page **page_list;
 	unsigned long nr_pages;
 	struct sg_table *sgt;
-	u64 xfer_start_addr;
 	int ret;
 	int i;
 
-	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
+	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
+		return -EINVAL;
+
+	if (in_trans->size == 0 ||
+	    in_trans->size < resources->xferred_dma_size ||
+	    check_add_overflow(xfer_start_addr, in_trans->size, &end))
+		return -EINVAL;
 
-	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
-				  resources->xferred_dma_size, PAGE_SIZE);
+	remaining = in_trans->size - resources->xferred_dma_size;
+	total = in_trans->size + offset_in_page(xfer_start_addr);
+	if (total >= SIZE_MAX)
+		return -EINVAL;
+
+	need_pages = DIV_ROUND_UP(total - resources->xferred_dma_size, PAGE_SIZE);
 
 	nr_pages = need_pages;
 
@@ -435,7 +445,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
 					offset_in_page(xfer_start_addr),
-					in_trans->size - resources->xferred_dma_size, GFP_KERNEL);
+					remaining, GFP_KERNEL);
 	if (ret) {
 		ret = -ENOMEM;
 		goto free_sgt;
@@ -566,9 +576,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	    QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
-	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
-		return -EINVAL;
-
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
 	if (!xfer)
 		return -ENOMEM;
-- 
2.39.2

