Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF974E8EC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474CE10E336;
	Tue, 11 Jul 2023 08:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A16310E336
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:21:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso61561085e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689063677; x=1691655677;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
 b=sNdncJFBQWQQHoBuyDo6nEnrz9dHPFyKME3hzDj1IFW+Oe+v7zgrzJTAL5xygdkm9E
 EDmIrvmOywHsTYUSlT5hMCo+dtaEIp+GAEeAcHtpcD60xyWBARQ8uXJ/hHbV5FIA8lIG
 FTi26w/cmcPxCDxGBzPZnzkX6n890G9ffwdxsFdI7MnSiectzhfLylsg7jW/81IllmrH
 pCg/Lni8M4xbPkNyRfWFmy6gY3ijd7CYyutJZCDL9+uv13+a2JT/If67dNSa9UPMXv30
 +EeMbu/1hp6juM26OoZl5ugUCMk7oxM55pVndPW0YSquNXNB1KF9FgOAUcKR06WI4qFV
 lWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689063677; x=1691655677;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
 b=ZVm8vVADKWGwNGhT8tpxfO+Tc8x+wvEK+4PpG3VRtVPOd7eC74vJXwHeComqPKLvv4
 f8e9oFr0Of3ab5E9/02xVu2fOUf5XExI2oKngwO0dF3k2877urJHPUDdG0MpDQdkCVew
 1lmLaB9iyWHoJR1LPmON1rCW2rIchuNx+SYh/W2DQgUAw5ksKAszF45NFBBB1XTh6SBa
 XguRKS2OLfQomZ2wyVPFvrb0kWHvUyXZ+mveg/pGBg/lRsmX2ffUNXGQ813ucvyVEQsd
 Hsd1eWppjbYXxMdvkk69SYXdWyOk060FHr15uZXAbC7CjK0vd/EVDq+TqBFJr25IslKZ
 soCw==
X-Gm-Message-State: ABy/qLZdj7aDRf2IHV2+21GuR8FsCWUgn8LXxtBqml4PSxxS+z0GFNeY
 IYAi1sNzjEnRo4VeBRCmPhNtSQ==
X-Google-Smtp-Source: APBJJlF0sfiUbbYqGKeYHW/O/nho5Vvwq2P2b8qilFz9LEbAguLpt78XKqS7uFSN5tRMm3Cd+LFlrg==
X-Received: by 2002:a1c:f706:0:b0:3fb:b637:22a7 with SMTP id
 v6-20020a1cf706000000b003fbb63722a7mr16076656wmh.4.1689063677747; 
 Tue, 11 Jul 2023 01:21:17 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc012000000b003fbd2a9e94asm1825480wmb.31.2023.07.11.01.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:21:16 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:21:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 5/5 v4] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <ZK0Q+ZuONTsBG+1T@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
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

