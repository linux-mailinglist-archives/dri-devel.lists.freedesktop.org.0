Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B55B6DDD48
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673C910E0F9;
	Tue, 11 Apr 2023 14:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345D310E0F9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681222137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FoWYY1/c70BQuziZUZwE68OnqBVL6gacC0azpYIo4ao=;
 b=G4EWCKjhU+P8MgY9b6urVzSAIqClc4h7ikEAKvDa/gfw77+k/pcKVobGEXyVCjXebkOWYp
 Np+jgJoVNTScz1hzOMk9CoU4ASk0+bahoQmTJpOGAqiORYXa3KdgYWHtVXGsA6n2qgcEIF
 TiqgAGwBiI+kC6lc38npTkwSJrjbxBs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-WMVgPRCyPZm0XMcq06F73w-1; Tue, 11 Apr 2023 10:08:53 -0400
X-MC-Unique: WMVgPRCyPZm0XMcq06F73w-1
Received: by mail-qt1-f199.google.com with SMTP id
 r22-20020ac85c96000000b003e638022bc9so24202741qta.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681222133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FoWYY1/c70BQuziZUZwE68OnqBVL6gacC0azpYIo4ao=;
 b=uVzYvAKzVg23UyraVGg7wk03mkvIW0+JPJ41W+YIXKCQbipwKedQipbOkdgSd87QUn
 yltpgw9N8Re6eL4vYK5Z76EGq0Orv4pzwj7x75Hedsr4W9PSIygW9DfTOqMkugpW+TWP
 uIljGwMLjAHGG/qGH7FDmomdCmJLnQhcNlp3beiyy5bMO4dt0ChFI9xi+AT8dpFvXvtJ
 h0kp8hjk8zvqulm4YtEnMbro1fiW9l7i03YIIVAGEf8+tRzfxDkwHTl3Mci6yCGbf47j
 iwn9m+NLP1zAsIlCuzmSr8eqaOy2vgBmTOQSJzXhJGzVk4T2WQxD01hDSnqlNg13XDu6
 DPPA==
X-Gm-Message-State: AAQBX9eMjNkWW3uh4x1eG24wOd03GKlPPNZFvkN2xabPCUo4Ad8Rfskp
 nLWU5eOwNIzn9JVjH4CfEx9Vt62rKs2Gf28FPMDCg83XQJRxDpI+cSp2heqw9iJDofTKgRi4L0s
 PltUNXqWGuUUWsx+NXvwNlFKNb/TD
X-Received: by 2002:ac8:5907:0:b0:3e3:7e53:9a8f with SMTP id
 7-20020ac85907000000b003e37e539a8fmr23833398qty.50.1681222133446; 
 Tue, 11 Apr 2023 07:08:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ydzw7KBrtGDwEv60Ql5TM3aG88TVjfKTHmQBAGbNhhzKJpSvnJavXOUu8cMXR2+sUzUX42jg==
X-Received: by 2002:ac8:5907:0:b0:3e3:7e53:9a8f with SMTP id
 7-20020ac85907000000b003e37e539a8fmr23833352qty.50.1681222133095; 
 Tue, 11 Apr 2023 07:08:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac846c7000000b003e3921077d9sm3596208qto.38.2023.04.11.07.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:08:52 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ogabbay@kernel.org, gregkh@linuxfoundation.org, osharabi@habana.ai,
 talcohen@habana.ai, dhirschfeld@habana.ai, obitton@habana.ai
Subject: [PATCH] accel/habanalabs: remove variable gaudi_irq_name
Date: Tue, 11 Apr 2023 10:08:50 -0400
Message-Id: <20230411140850.3129374-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/accel/habanalabs/gaudi/gaudi.c:117:19: error:
  ‘gaudi_irq_name’ defined but not used [-Werror=unused-const-variable=]
  117 | static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STRING_LEN] = {
      |                   ^~~~~~~~~~~~~~

This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/habanalabs/gaudi/gaudi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index a29aa8f7b6f3..a1697581c218 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -114,13 +114,6 @@ static u32 gaudi_stream_master[GAUDI_STREAM_MASTER_ARR_SIZE] = {
 	GAUDI_QUEUE_ID_DMA_1_3
 };
 
-static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STRING_LEN] = {
-		"gaudi cq 0_0", "gaudi cq 0_1", "gaudi cq 0_2", "gaudi cq 0_3",
-		"gaudi cq 1_0", "gaudi cq 1_1", "gaudi cq 1_2", "gaudi cq 1_3",
-		"gaudi cq 5_0", "gaudi cq 5_1", "gaudi cq 5_2", "gaudi cq 5_3",
-		"gaudi cpu eq"
-};
-
 static const u8 gaudi_dma_assignment[GAUDI_DMA_MAX] = {
 	[GAUDI_PCI_DMA_1] = GAUDI_ENGINE_ID_DMA_0,
 	[GAUDI_PCI_DMA_2] = GAUDI_ENGINE_ID_DMA_1,
-- 
2.27.0

