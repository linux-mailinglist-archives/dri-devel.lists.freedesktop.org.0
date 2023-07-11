Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D774E6F6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982AF10E311;
	Tue, 11 Jul 2023 06:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209EF10E311
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:13:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso5466551f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055993; x=1691647993;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
 b=ua13UnqckABF68hPbE6UQ667TIjzCruxMjbB+tXJdXEa5EnCIObMJPMAD1R6ih5FN+
 JSDlVQCQB2uLnwfDQ7ZFI5078E/gjT4swVWLVME+lexeTTp9f5Nwu5uD7ed0ZC9kHlun
 gOdU13Q336J1sSiOeGR+RIDHdUGw6fQ8WVZn1eFK++9PZA8LTuITH/cSh4tyuQURLHY5
 4uDMwuPJIyBzzcKmJurnxSzpG5uLLkRHUJoOjKBxHPVNihrOHgvrHyq11YOWUG9TuFUZ
 caxybXwFxRLKvH8iExuZLD6a9ctf4YWj3ODfdf2BSKfn4lu9qpFDOuTZOpcxRWapfihS
 iZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055993; x=1691647993;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
 b=FROtoIdkdggGhf/UXqc7dMOVU25nf5yzOy3KqG6ioQi//M8oPcPJoTV0w08Z4XRffE
 SOZEBNUTa7ViC63sNV+PwFM4RWur/quUJPo/o39JgM5U/GPEeC1ZOdz8L8OQ9Oe7Hn1V
 IaG+YVv86F6RMIWjszZC0BcAs1XAyoyvyWJbRbeyDOSk7zIBQHVVPGx/9BVs/YptSUcX
 oyz9XhQAwkARJLpvTcgWhAYb9z81NKnL43ObvGXr86bIgDfp+TjG/7R1KHAUZ3c2VtFL
 q+PQhuM0fMyEYrRV9ImOhkHlQ7o5Glp4KeG3zSvDzCjgFxyDMGadm6eawjORQA1mrd3d
 yBxg==
X-Gm-Message-State: ABy/qLYQ4J+oL8qiQ7niIFcXMUqsrqNZtgzo5uVcXPQA+Kj6B6q+Qncz
 WoM/b6E/c/k7sGxIl7ePs/e0tQ==
X-Google-Smtp-Source: APBJJlGcVeS8URI28QoRPtrIWEWXAZd+Ufs2ZNLU4RJde8pqFYDhqzEmnE1m+xncQYFNft/X/DotqA==
X-Received: by 2002:adf:e682:0:b0:315:a17d:dbc6 with SMTP id
 r2-20020adfe682000000b00315a17ddbc6mr3020069wrm.14.1689055993304; 
 Mon, 10 Jul 2023 23:13:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b0030ae3a6be4asm1263546wrs.72.2023.07.10.23.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:13:12 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:13:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 5/5 v3] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
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
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If get_user_pages_fast() allocates some pages but not as many as we
wanted, then the current code leaks those pages.  Call put_page() on
the pages before returning.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d5ce36cb351f..9a6f80f31c65 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 	}
 
 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
-	if (ret < 0 || ret != nr_pages) {
-		ret = -EFAULT;
+	if (ret < 0)
 		goto free_page_list;
+	if (ret != nr_pages) {
+		nr_pages = ret;
+		ret = -EFAULT;
+		goto put_pages;
 	}
 
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
-- 
2.39.2

