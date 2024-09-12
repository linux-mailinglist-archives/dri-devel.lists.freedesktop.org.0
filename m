Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6A976A96
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1710EB7B;
	Thu, 12 Sep 2024 13:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QhwrdRL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50910EB7B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:30:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so9180205e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726147805; x=1726752605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=31vuczscfrohitTr22PmxSxpLT+YhLOaIZ8Pw2lBn5s=;
 b=QhwrdRL7HLobnWK0NSsV2Ukj0FWk8TztDlTBtRrNoJaAdP7UYvlAvUYkcXlf+zrUIE
 fNkxwniKxyhCQtFH2fwvVqhQ294Jt0W2rVevSHBuoAOgUeXnMffmueGrG/ic8Rlswr7r
 G7m7wfCjlKgyd4FF/hOiSSNeMpcpp0CoiefUT5sHc0Mn3VxdOzWKL6YF7togUGoUaO+2
 iPXP1fiXBzTS9AAy+t/Xi9Wrj8ymJC6wAkM01StzA/qoF+duu9l9I5syqMAcQLkGcEe+
 EXfAv7tTlVUHltw6PqSIs9PgCQS2jsR7wrMHvq/jz1Yb1YjmsqK21jNqex6K1LKs3g7C
 OEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726147805; x=1726752605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=31vuczscfrohitTr22PmxSxpLT+YhLOaIZ8Pw2lBn5s=;
 b=GT8kU3urIu/IabHVxXzJj79QYCRBrQ8JRY85ePlqXwbOVyW1STst6n0p8FZcViz+8F
 xVaTiPJ8+6Fh568S2FxvHHV2FTDZdl2+bgxjS9IS/spS1a+DNYitSngHGgdenDBTYK7p
 6+JyzFanAcAIUHAxl7nb13EyHHWvk3sLzKW9YZ6kxZYGEz2d+5/ZheaDtHqXRSIh7SiK
 WWlI3tVOooKODUNPT2RrIthRm+wjGQJL383UkZQmJ9XVZwvF0m+STB3SUvcJ5Es5v5Da
 blUsVNS6kL1rRHxws65MUkydufAUTJh0nrjDfaHUbAZY37Cpc+FR7lL0mRY0CYAsbSrf
 LsGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpF5OVv6afRkRURdNfBpn+MAi28fmGfZiVmexpSI38xiv5akBNpYHpG4D/sYqKVV7Ow8NEhDW+/ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQJhari6aE9qmPCZrXjCQx1HKSi55GDc8/hMbjG2mHVr3wL8b
 uIiQByLntoUNLaPzjWpQUq43zJWMqafYn8+NojTOm46904R1B1Zw
X-Google-Smtp-Source: AGHT+IGzVzLXofsdgNNXgFJHkQ58sJOkqe1BUUgZwCpXjNdePvaiYdfkXqFXBFazbMIOcP73wP/qvg==
X-Received: by 2002:a05:600c:3b15:b0:42c:bdb0:c625 with SMTP id
 5b1f17b1804b1-42cdb539d15mr24385645e9.14.1726147804722; 
 Thu, 12 Sep 2024 06:30:04 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc137556esm83578455e9.1.2024.09.12.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:30:03 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] accel/habanalabs/gaudi2: Make read-only array
 edma_queues_id static const
Date: Thu, 12 Sep 2024 14:30:03 +0100
Message-Id: <20240912133003.589686-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array edma_queues_id on the stack at
run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..1e401f42eef7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10304,10 +10304,12 @@ static int gaudi2_memset_memory_chunk_using_edma_qm(struct hl_device *hdev,
 
 static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 size, u64 val)
 {
-	u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0};
+	static const u32 edma_queues_id[] = {
+		GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0
+	};
 	u32 chunk_size, dcore, edma_idx, sob_offset, sob_addr, comp_val,
 		old_mmubp, mmubp, num_of_pkts, busy, pkt_size, cb_len;
 	u64 comp_addr, cur_addr = addr, end_addr = addr + size;
-- 
2.39.2

