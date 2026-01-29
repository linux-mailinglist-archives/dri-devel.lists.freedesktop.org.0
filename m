Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEWhKZR0fGkmNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F570B8B93
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494710E96B;
	Fri, 30 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMPj84j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859510E844
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:07:37 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso436015b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 02:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769681257; x=1770286057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sz2uU6hd9uouWC2Fb9WCzlVE7j6msZQUQaAAumPyPyI=;
 b=XMPj84j+tD/YLZYcUUXEFquYCyOG3ZYrHz378+UacVZK3GIVn2smjGGbroOWy8iQFg
 bsMBsi9By8Em6+fpM5WAH0kDhEEHIdZK0nEC9yWiXk1IATHWHGJIBRDRfl9OZ4rFrT29
 tajtQ7C/4MkyFWeP6g9Tu+pUkXO7NmhgSj8UDmCu9ZS/MAdqgGa3N72t5lKqfzqc+xcP
 G7bqGdgy+gsTYhxxmrhxotPo/YQon0CrBN4tVyxNdyh7/f1hks60HD2CeTZflzaX2Kv5
 k9/t7SxF7v+N8i0pQp+4q2I0xlPWs5M2JkfMboI+y6u9lSB7QMUdmSL0u2TCrO+RXjni
 /pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769681257; x=1770286057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sz2uU6hd9uouWC2Fb9WCzlVE7j6msZQUQaAAumPyPyI=;
 b=PZ6KW2NZWbqFhMj7Qt1M1I8Mj3R5qFfrc8WXnfLcUwVUdTM9l7PSRXqOfQZYmeteBU
 X//RpqirvpPk/1ImGzs0zN/cGnLcPyAXBw7K7eBSoKwGw4/PvIDEksrmGSie5S5vhWAt
 B+LFzD4MhmNSWFRfJc+ayuyrPTyBwBjMtiMJ7TfA8vPCS1wpfOqEfb3S/IBvTe7odLNq
 zo/2H+RE8VCU3ynsqjA0/tsPdX1M71KQ4wjEe9OpQUp4r1cv11wUO+U8l8sVD40HDnSy
 qS3kOByLDuA6yKWQ14GyFGg0Z6zXdsso5OoZIh0DK7yU3Kkp6m/t995BZh9rrGtFNEg/
 K8mg==
X-Gm-Message-State: AOJu0YyhTav+1SlirC78P0DqyiWgCi7WlplpDiPcf6zqj3Zbp4uAF8Za
 AxX/zbjgf0rd+ln4if843Qw7yh+j5moSke84v446PHcHBHlfYGXCTMch
X-Gm-Gg: AZuq6aIhSvbiClwtqJTLovM14L41xlSdYawyt8WnHuOmSiYeWO8CIv0R3rcWVnfzv/X
 zFdWWiQ/hsc0brSTCnxWNjq+qAbE18YG0RWiPOTILtCIAH/a67wtGh3wBRCOmEjUnV/84K+6CbV
 xrfmxNEhzSogNRvUftcPdsfeW9vQAXQ6zW9UwOXo4qpoULwJX92sIry4pVUsu/roBn6TLlAtb0J
 HpgQIlov/jb1aP6Gr+mn/41b9g9ShkFspWV5Sv7Izv/gEEhFy9g0EAxrH+MmpenO2Ixas25/FAl
 QpPaRFnbHPh9QESa18QLPbTR78KCimjVJRZgpAIjFNkFX7P8OE6NzNAH0bjAuNFsfg2x3i7iQxA
 HJ901+d6lSFJZ6H+7N6Pfr33NyZhqREC5o2lhTOd1lLo3h+tDs6IrqNTRPK8JR00Xk33gLyrdcN
 5UZlgpk45c/yWzzR+DOQ==
X-Received: by 2002:a05:6a00:418c:b0:81e:f623:ba04 with SMTP id
 d2e1a72fcca58-82369148d2dmr7497094b3a.13.1769681256847; 
 Thu, 29 Jan 2026 02:07:36 -0800 (PST)
Received: from localhost ([2404:7ac0:6ed1:1f5d:ea62:4a2b:e100:6492])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379bfcaadsm5375349b3a.37.2026.01.29.02.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 02:07:36 -0800 (PST)
From: zishun yi <zishun.yi.dev@gmail.com>
To: Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zishun Yi <zishun.yi.dev@gmail.com>
Subject: [PATCH] accel/amdxdna: Fix memory leak in amdxdna_ubuf_map
Date: Thu, 29 Jan 2026 18:07:31 +0800
Message-ID: <20260129100731.56116-1-zishun.yi.dev@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:linux-kernel@vger.kernel.org,m:zishun.yi.dev@gmail.com,m:zishunyidev@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zishunyidev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zishunyidev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3F570B8B93
X-Rspamd-Action: no action

From: Zishun Yi <zishun.yi.dev@gmail.com>

The amdxdna_ubuf_map() function allocates memory for sg and
internal sg table structures, but it fails to free them if subsequent
operations (sg_alloc_table_from_pages or dma_map_sgtable) fail.

Signed-off-by: Zishun Yi <zishun.yi.dev@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ubuf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
index 077b2261cf2a..9e3b3b055caa 100644
--- a/drivers/accel/amdxdna/amdxdna_ubuf.c
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -34,15 +34,21 @@ static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
 	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->nr_pages, 0,
 					ubuf->nr_pages << PAGE_SHIFT, GFP_KERNEL);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err_free_sg;
 
 	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
 		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
 		if (ret)
-			return ERR_PTR(ret);
+			goto err_free_table;
 	}
 
 	return sg;
+
+err_free_table:
+	sg_free_table(sg);
+err_free_sg:
+	kfree(sg);
+	return ERR_PTR(ret);
 }
 
 static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
-- 
2.51.2

