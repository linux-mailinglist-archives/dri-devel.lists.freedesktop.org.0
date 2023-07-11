Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE0774E6F3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C764F10E310;
	Tue, 11 Jul 2023 06:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724810E311
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:13:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82dc7so54808215e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055982; x=1691647982;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
 b=FV97CtS+b2ivv2YRoRawAvvKMw4aLDa7Rm7BXE7rE3Rx9oKkP0hKVpGnlanhx9W4Md
 UNeGoquhfb66TgF0NvxLwG3gU1FDIa0WerFojuDRIocUcjdhpj1vTd0fPWnlilKDfdSY
 /di9GEWJlzXRPiTucNo2ocij0y/7vgoWuSqI1HAFtC7y5NqX/awQYh/ttw+QyI256Kz9
 1CqUVF0EdRS2WUj/HgHJ706fE8dFJPrrVSDb1OoNeQzRIxkFDn86T4JLJ372TGBBeXaa
 nNfik6T6DJ80R9Tx0TlnbzsIk2rVCMI0Apym+bBILOB4qR9VZZerFRyqa5+ZLbw9WmH9
 bi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055982; x=1691647982;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
 b=DUZoDqe44DuMMJ4yT/Rv+kPfbDKoTc3BXkMHKAtEhAVSmkgY39kTlcVvTwHYXMl3k4
 Alwsjr8Bdox+3BVOWvlyORQ3xr+Z46r8Jh77qaL19hKjSA4aFukEOtKu1+X5HaZRHo1W
 LeHGeJJCbvIEIFN6bbyDvGNFyC6UW9SgQdV62rf2R7Y+Z5naDkQwcILaAAOXuINsXNoI
 aA6HwGhvYCDYFQkUMf7Cp9HaCnrIkm2Ovc/4tDEzsxJHHQC4/5SFxm8+rp8+D62BF3G5
 b/toWAvVP0GSpV3uhcnKAbsB8g2/g8jUblxscfiDmuI8brdAVuVoYxihp6S3PIkTrJe8
 gRLQ==
X-Gm-Message-State: ABy/qLYGVtMU7JkbQAP0RYIkhwLp6VkD+n9Sj1VoohBwUfVa9ZymteI1
 PLkuejRBoBsbqmb3C24PM3RByQ==
X-Google-Smtp-Source: APBJJlFf+n6TNNYgruOps7eyqyNXpCn3snxsTrK5DfRFZuDu9k9jIoV4xxu6En2qffZVVMji6acx6g==
X-Received: by 2002:a1c:ed07:0:b0:3fb:d68d:4c6f with SMTP id
 l7-20020a1ced07000000b003fbd68d4c6fmr15023175wmh.14.1689055982600; 
 Mon, 10 Jul 2023 23:13:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm10890231wmr.46.2023.07.10.23.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:13:01 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:12:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 4/5 v3] accel/qaic: move and expand integer overflow checks
 for map_user_pages()
Message-ID: <2efbbfb0-ca61-49eb-9347-04d8d00f87e1@moroto.mountain>
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
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The integer overflow checking for find_and_map_user_pages() was done in
encode_dma().  Presumably this was to do it before the allocation.  But
it's not super important that the failure path is a fast path and it
hurts readability to put the check so far from the where the variable is
used.

Move the check to find_and_map_user_pages() instead and add some more
additional potential integer overflow checks.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 23680f5f1902..d5ce36cb351f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -402,6 +402,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
 
+	if (in_trans->size == 0 ||
+	    in_trans->addr + in_trans->size < in_trans->addr ||
+	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
+	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
+		return -EINVAL;
+
 	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
 				  resources->xferred_dma_size, PAGE_SIZE);
 
@@ -564,9 +570,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
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

