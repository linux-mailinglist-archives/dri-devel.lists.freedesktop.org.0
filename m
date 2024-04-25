Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC938B1A18
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 07:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C9010F5C2;
	Thu, 25 Apr 2024 05:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="dEN3vj22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6516511A0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ReeraV7ufn60/mkW2+TUO0nmEAQXtsBUw1AVORBcKCg=; b=dEN3vj22XsRRFc86Kry143Q83Y
 kuNb/uVgYVubRVM6XqPqnwWG9fOBXAJSMFW1LXXone2PUhFCbot5mJV7UNmwXzrrSKFCx2RMNAwPj
 PXr6CHiSsKBmj0LVAUSrvO1ncFhknLDn45uIlutkL5lkrdFZZzlaIIQuj00SFXkPbg9rxG1q4Ek+S
 LKZ1fDDVBgWUD7CQm0/hTEM7BFQ3BwhOCxY1CLpvpSCgYYWVze/aulNxVpSZCx/cbfkecuTk4txsy
 jCj28R7iJdQYp2YJnZ+wEyW8TisjgtZ4qyTQH9kxRshvhpJdtDfbvskPEA2d+7etyoX2ZaXv14nW6
 6UX6Kp1A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rzrG7-00Fmla-0l;
 Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 2/5] gpu: host1x: Handle CDMA wraparound when debug printing
Date: Thu, 25 Apr 2024 08:02:34 +0300
Message-ID: <20240425050238.2943404-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425050238.2943404-1-cyndis@kapsi.fi>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

During channel debug information dump, when printing CDMA
opcodes, the circular nature of the CDMA pushbuffer wasn't being
taken into account, sometimes accessing past the end. Change
the printing to take this into account.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/debug_hw.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 54e31d81517b..4c32aa1b95e8 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -177,7 +177,16 @@ static void show_gather(struct output *o, dma_addr_t phys_addr,
 
 	for (i = 0; i < words; i++) {
 		dma_addr_t addr = phys_addr + i * 4;
-		u32 val = *(map_addr + offset / 4 + i);
+		u32 voffset = offset + i * 4;
+		u32 val;
+
+		/* If we reach the RESTART opcode, continue at the beginning of pushbuffer */
+		if (cdma && voffset >= cdma->push_buffer.size) {
+			addr -= cdma->push_buffer.size;
+			voffset -= cdma->push_buffer.size;
+		}
+
+		val = *(map_addr + voffset / 4);
 
 		if (!data_count) {
 			host1x_debug_output(o, "    %pad: %08x: ", &addr, val);
@@ -203,7 +212,7 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				    job->num_slots, job->num_unpins);
 
 		show_gather(o, pb->dma + job->first_get, job->num_slots * 2, cdma,
-			    pb->dma + job->first_get, pb->mapped + job->first_get);
+			    pb->dma, pb->mapped);
 
 		for (i = 0; i < job->num_cmds; i++) {
 			struct host1x_job_gather *g;
@@ -227,7 +236,7 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 			host1x_debug_output(o, "  GATHER at %pad+%#x, %d words\n",
 					    &g->base, g->offset, g->words);
 
-			show_gather(o, g->base + g->offset, g->words, cdma,
+			show_gather(o, g->base + g->offset, g->words, NULL,
 				    g->base, mapped);
 
 			if (!job->gather_copy_mapped)
-- 
2.42.0

