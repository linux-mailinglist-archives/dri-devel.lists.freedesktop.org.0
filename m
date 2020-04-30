Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A886B1C0EB8
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5FF6EC04;
	Fri,  1 May 2020 07:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE96E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:25:04 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x77so347324pfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
 b=zvIhEeo6o5Oci/1eDGxIxa70cqZyoYJPXylX1Jz8dm4uPN+VdUMi5dd63F1duzrKjf
 RbDbL4orJsgYwq7Nj0UTh3yQbN4K0xHm3MIzvy5ZD3vZU2dEZ4WTK5ZSvBz/KhNhDNRi
 iq4ZR0E2/FCU5UX9o2YRqOluF3k9408xQAXoHNf8e9LxoECnH5HXqwOJ0rv7LjXnhyyW
 yS/J0pcItyBpgwidW4/F9usyFm2BZPVgghgNjxRdQThOIQoH0bSYmBNCHOuxLIXuzZaE
 8kNRwr8BxYU8I87WPqhv6VIAhcrOvoocf9qPGC8gtHNJf58mlCE62qWRAmVLrpUHxnod
 A6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
 b=pGtzF/FfMfE4Dvyui1mmRTDx5T6ACFMDQECXU6n68dUdJ3Z+KUf+4gs693ZzcNGgDt
 TaP3s3SlHkSMLDFIg6iSyNjRO+qqAsTQ07Nrg0iBLOBu8qiI5oW4/8nupWChfHP6zw1M
 LP54LZ97m/fEWZvAY38HlbH2K18NfEqbpxBaYhQTV6oet9MM9T+3XehVCHlF+SqDvi/7
 GNXD2ZnwSrxgEjIh6p6DK3tqPCzsJcK8PpiwQCckp2pZcQDcbowOxR4U2Ti7Q0Sl2gE+
 l1juG2jxsmY8EQYkqn9fieZyk6bwOWSSoltqe6dagRAlOGabo5zXhmO4L+LDkoFhSEvL
 AgxQ==
X-Gm-Message-State: AGi0PuYtzx3H1iqe0qn4s0FRfBaNpj4jbaSinM8nwZcQgS8LYS8Tbe3D
 1I/X75rof9ibQ3FdMNIn/rFE0A==
X-Google-Smtp-Source: APiQypLCsVX9Nh3B0wNo8iNCW3Dh7d+/91P/QFHKJM1aSTI3VdeXI7wM5INe9jYGfLmdFCvuIRM2Ow==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr271949pfd.81.1588274704103;
 Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id v26sm463594pfe.121.2020.04.30.12.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:25:03 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] drm/msm: Fix undefined "rd_full" link error
Date: Thu, 30 Apr 2020 12:24:27 -0700
Message-Id: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rd_full should be defined outside the CONFIG_DEBUG_FS region, in order
to be able to link the msm driver even when CONFIG_DEBUG_FS is disabled.

Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 732f65df5c4f..fea30e7aa9e8 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -29,8 +29,6 @@
  * or shader programs (if not emitted inline in cmdstream).
  */
 
-#ifdef CONFIG_DEBUG_FS
-
 #include <linux/circ_buf.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
@@ -47,6 +45,8 @@ bool rd_full = false;
 MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
 module_param_named(rd_full, rd_full, bool, 0600);
 
+#ifdef CONFIG_DEBUG_FS
+
 enum rd_sect_type {
 	RD_NONE,
 	RD_TEST,       /* ascii text */
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
