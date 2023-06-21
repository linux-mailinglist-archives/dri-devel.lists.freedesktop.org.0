Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAB737BF8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B46710E3D6;
	Wed, 21 Jun 2023 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A6D10E3D6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:22:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f9b4a715d9so21246485e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687332162; x=1689924162;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vz2evvxynfo3GpNLQFS4FwB3difDSTskdd0+liW6jTE=;
 b=DWjFbl9ja+2c9aIXWX3Oh9IqIpBzGQDkRm4zFFdPNcFa8siG6zB+EGrWIJ/7OTxOU+
 hfshTn5wArKKPiOka5N5SqyErZkho7Wb/PY27cS4+26IdiqLBQxEYGb9JeRkQ5rwuUr5
 POi1K2WtPHVwn0DTPek3aPCkF7gNV131a0W/3dAk54eHga883QzJZXegEasc2AaI1UII
 5Sd/Pzl8LWtTfPUNK2eYTxRuq+SXEji6uQBRILIAA8MiX6MTTjQKLfRdrzEyLf0sVRA3
 pNaGgYBwQmIfmIzeYo2PLV2zf1syWNu9FD5Q/V1vUne4VspEv2ud3hntSbFrnvLGWy01
 h+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332162; x=1689924162;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vz2evvxynfo3GpNLQFS4FwB3difDSTskdd0+liW6jTE=;
 b=AEfaBoAAsP49kYQhKnroC5CFwdPNdp684Mha3ZUnM0577NFe691gPIbDtzs22BVgVT
 ZDmgLLspN3jMIAGpStiJCNlNwSODpfmHbiiDzksddlI7wmeFiY8R0DUkSYW0tHXxRlre
 00jTnenEr8mqQj2ZpthAQ95pywLwS6gHITFqCGz1C4x1yceT3tnCg0atnJy9lv1n90A/
 Y5yyr0z32Wc/sqswegHytG1jbRvfZAnVWCmT0nNxfcX9KXjFNNE9BR6JxOHR+pVh+M9h
 aoBrndnzwAtEmJzKpByy5J5RclLXm7uPgWcEOwY2Pd+YFUch321Ggquj/Xb7eLNn+43Z
 wl2g==
X-Gm-Message-State: AC+VfDx5x9UmUCAwKjQx4T2EOfuE9VQ2pBWOj+uKhpGgH+MV8s9/JqNu
 HlGqKXmKIuxv3oNhhmF9Ngva4w==
X-Google-Smtp-Source: ACHHUZ53ONPx1oNStMjM74vkhEhb3eMLUz1J+VK37q5osvP2XR/IJPwufysddaekoV0Ufnicb76YQg==
X-Received: by 2002:a1c:cc07:0:b0:3f7:c92:57a0 with SMTP id
 h7-20020a1ccc07000000b003f70c9257a0mr13018372wmb.14.1687332162699; 
 Wed, 21 Jun 2023 00:22:42 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d4aca000000b0030ae6432504sm3687548wrs.38.2023.06.21.00.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 00:22:41 -0700 (PDT)
Date: Wed, 21 Jun 2023 10:22:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 5/5] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
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
 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 03932197f1ac..7c3f9009617f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -424,9 +424,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
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

