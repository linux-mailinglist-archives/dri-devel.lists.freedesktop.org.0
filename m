Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C546DE78
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 23:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077846E087;
	Wed,  8 Dec 2021 22:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E1D6E087
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 22:37:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j3so6671506wrp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 14:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ltEh61NUR5opsmEls4nl8qwF170eYcG3QnbnvsYmLkc=;
 b=Vv1SnbI3Hnmh/yVAYnhqqnaCYZW/MWbUHZQ574aDiL95EWaS9us80hpNVP57iFaGSm
 331JvFk7M8N0PL1+E3v1P0NRDUsDEWGWqoUttdDvUJtD9zVPm0D6J9juH6yLmNYDVpr2
 Uos/3n84IFMmegHCsQQx3NzhrLTTnhLKoWRGa8IZsGZlA16khSgixXfW5qALU7s0QFjw
 1AIGn69RFK+U1rVSib/xnGAaF7wYj1kj2lwZrUgVwuFnDcWtZF6ulKibSybipdjo8e+w
 qXHC7sYYsd5kV+kFkU9xOrVvLMVRIcBLmGVQCKl4v3vrkIfUxhrJs5iVQB8riA5ejioJ
 QKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ltEh61NUR5opsmEls4nl8qwF170eYcG3QnbnvsYmLkc=;
 b=wuf67AtVamNTTKpvRX6E02lDBD/RrpbrrLKhJ36tR3j2Wv0XWYycEf/SS2lXcWeHrz
 EQ5edSmFbsPu1DoQOKUYXxjMg6KG0PkgDJvQL69L/eKkNUqW9hQPaaKKz6rbA99bI5GM
 5A5KkRVvNdhyET7k8u9ZlZQflPkwFEe5CtiwpopoTIntXuktgGrMp2s3w2h99R6EGcfT
 xuUO7cbTwZfj8T85/miT0AMgU1DaCXMljEtssnpyNEDoF5J3RJ5V3xJE5jP0rv9ARgiD
 OuZnzRhsLRq16PvJWrv+BjTBRjca0+io2zx0594CGotHPJMPRoe0N7a9F/6oGx6KWNu2
 zKFg==
X-Gm-Message-State: AOAM531h3JNQk7Jj7xTVvSI8tf0SSZ4u+VN5r/fcDXWz/TT1J/gNodet
 t9bWPd48i7LeLTUNSLeLqEM=
X-Google-Smtp-Source: ABdhPJw14QKUmBDLUvt7AbHOxb6KmnlLuia4Ejrt7gieEu7zj7nD8l/9Pf/+40qNSkKWuBwex673fg==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr1808383wri.566.1639003064320; 
 Wed, 08 Dec 2021 14:37:44 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id n184sm6957308wme.2.2021.12.08.14.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 14:37:43 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: kys@microsoft.com
Subject: [PATCH] net: mana: Fix memory leak in mana_hwc_create_wq
Date: Wed,  8 Dec 2021 23:37:23 +0100
Message-Id: <20211208223723.18520-1-jose.exposito89@gmail.com>
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, christian.koenig@amd.com,
 netdev@vger.kernel.org, haiyangz@microsoft.com, decui@microsoft.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 davem@davemloft.net, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If allocating the DMA buffer fails, mana_hwc_destroy_wq was called
without previously storing the pointer to the queue.

In order to avoid leaking the pointer to the queue, store it as soon as
it is allocated.

Addresses-Coverity-ID: 1484720 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/net/ethernet/microsoft/mana/hw_channel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microsoft/mana/hw_channel.c b/drivers/net/ethernet/microsoft/mana/hw_channel.c
index 34b971ff8ef8..078d6a5a0768 100644
--- a/drivers/net/ethernet/microsoft/mana/hw_channel.c
+++ b/drivers/net/ethernet/microsoft/mana/hw_channel.c
@@ -480,16 +480,16 @@ static int mana_hwc_create_wq(struct hw_channel_context *hwc,
 	if (err)
 		goto out;
 
-	err = mana_hwc_alloc_dma_buf(hwc, q_depth, max_msg_size,
-				     &hwc_wq->msg_buf);
-	if (err)
-		goto out;
-
 	hwc_wq->hwc = hwc;
 	hwc_wq->gdma_wq = queue;
 	hwc_wq->queue_depth = q_depth;
 	hwc_wq->hwc_cq = hwc_cq;
 
+	err = mana_hwc_alloc_dma_buf(hwc, q_depth, max_msg_size,
+				     &hwc_wq->msg_buf);
+	if (err)
+		goto out;
+
 	*hwc_wq_ptr = hwc_wq;
 	return 0;
 out:
-- 
2.25.1

