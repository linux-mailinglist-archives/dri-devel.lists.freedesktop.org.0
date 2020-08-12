Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8E24318F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 01:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BFF890BD;
	Wed, 12 Aug 2020 23:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752D4890BD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 23:55:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597276562; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jmWOs7dUstJ+xpaEhBZheCFEL5CtWJqUMAkhh10xqGo=;
 b=incvs0rMJuhKqsf3rTCy3tPOpea0m6KtFbVkLI0ryx4PhSZCIcmoF3HaDUO8tt8s35MdfsGL
 lDK4fJmFGDKtDEFJjmHA6dafCK2AoovZo5lhImsyqxVzxMfnHZW5mAVem7ikb1noYODUgnZN
 o8/7utw92cmd2XECzKeYTzutzjg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f348186440a07969abe9d76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 23:55:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0B32C433C6; Wed, 12 Aug 2020 23:55:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B14B0C433C9;
 Wed, 12 Aug 2020 23:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B14B0C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v1] dma-fence-array: Deal with sub-fences that are
 signaled late
Date: Wed, 12 Aug 2020 17:55:44 -0600
Message-Id: <20200812235544.2289895-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC because I'm still trying to grok the correct behavior.

Consider a dma_fence_array created two two fence and signal_on_any is true.
A reference to dma_fence_array is taken for each waiting fence.

When the client calls dma_fence_wait() only one of the fences is signaled.
The client returns successfully from the wait and puts it's reference to
the array fence but the array fence still remains because of the remaining
un-signaled fence.

Now consider that the unsignaled fence is signaled while the timeline is being
destroyed much later. The timeline destroy calls dma_fence_signal_locked(). The
following sequence occurs:

1) dma_fence_array_cb_func is called

2) array->num_pending is 0 (because it was set to 1 due to signal_on_any) so the
callback function calls dma_fence_put() instead of triggering the irq work

3) The array fence is released which in turn puts the lingering fence which is
then released

4) deadlock with the timeline

I think that we can fix this with the attached patch. Once the fence is
signaled signaling it again in the irq worker shouldn't hurt anything. The only
gotcha might be how the error is propagated - I wasn't quite sure the intent of
clearing it only after getting to the irq worker.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/dma-buf/dma-fence-array.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..b8829b024255 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -46,8 +46,6 @@ static void irq_dma_fence_array_work(struct irq_work *wrk)
 {
 	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
 
-	dma_fence_array_clear_pending_error(array);
-
 	dma_fence_signal(&array->base);
 	dma_fence_put(&array->base);
 }
@@ -61,10 +59,10 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 
 	dma_fence_array_set_pending_error(array, f->error);
 
-	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
-	else
-		dma_fence_put(&array->base);
+	if (!atomic_dec_and_test(&array->num_pending))
+		dma_fence_array_set_pending_error(array, f->error);
+
+	irq_work_queue(&array->work);
 }
 
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
