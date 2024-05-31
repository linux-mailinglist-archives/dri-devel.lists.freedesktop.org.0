Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A758D5FEA
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 12:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872910E281;
	Fri, 31 May 2024 10:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="wjEgyRqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6C810E281
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:46:45 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a66e9eac48fso127037866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717152403; x=1717757203;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WMWnkmBtFZXXX3I47gpNP4mWpXGqK4R1nikBku4RkBk=;
 b=wjEgyRqwSxZwfpH2BO9EK0wWSv7yyp4eLcbxY8gzAM1f4c7OPmjprgPbHqsQuUuwcE
 rjqjCW5vHnwLV+C+6qIUkV9lsvJxnsTSqnWx0BSJqBMga1KsEYksaLUmbTc9054C5nlB
 vcS5VnqVykf12vdAZ3uEEFwRbzl/1WVh77Ui3X4DfVBCRYAo+c2MG9/jvymqtCzEkT0Y
 5nVGtCLSJaKwnkQdrJJ41ap89WGDDs5rOlNYEYF1bAKXFlR+cjQJNX015eD09xlRtAFZ
 wfAz6vlbQLNhG5Y6Ewi+HscOBaWpY0zfNl0aj9YYjMNiX7wMXpFPHqNOZGVXg4gadz2/
 Tccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717152403; x=1717757203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMWnkmBtFZXXX3I47gpNP4mWpXGqK4R1nikBku4RkBk=;
 b=EKI8aeNbzNOz1+5AbPVItvzg5a0ARLai7StrpDM+6TAcQea52I39rTWCcEInnIO7Pm
 /RI/TUMlbWIoLwBeZYwxZLmZywqHwDGvrWKkpz0WofWcK1jH2w8taLnP238qtD2Q8TBO
 8CG+DvXJ6/xY9hW0k6EBc077omdTdyYLLP0jIPhaeod97TVUJ7CiZMJeyUZ1BTLLZ63T
 dsEvBi36hPgN9P+favQ2aDTMLyrH7szFcRbcPPNtRSMgFU0Ua4GAMP08sltuH9yOzdUN
 AgT6mgAsFA34B2jwaVJlE8YQmvY0H8lUOqjnH/k+iH+ni1CfsMb7f4KSHDD/BGXwbe9A
 7okg==
X-Gm-Message-State: AOJu0YwhI0h4bQT5bzQhQC1awLqMjvQGCFxuQVu3yC3M30i5DyM7BBmS
 nxCh1Vu4nQ2kgUmwvXmU40emdGxxNDj1qOhbxyyZebMXO4x08kLqMAP6bsHI2hM=
X-Google-Smtp-Source: AGHT+IHwz8F4YsOxCoVyVgxPSwfloqZY14sdnu2nUYWH+snrNLWB7uClqMFZJyHAj9wrQ4oqtxQn1g==
X-Received: by 2002:a17:907:6183:b0:a5a:88ac:fbbe with SMTP id
 a640c23a62f3a-a6820be9589mr98501966b.46.1717152403391; 
 Fri, 31 May 2024 03:46:43 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-160.dynamic.mnet-online.de.
 [82.135.80.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eb6214efsm72928666b.220.2024.05.31.03.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 03:46:43 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Oded Gabbay <ogabbay@kernel.org>, Tomer Tayar <ttayar@habana.ai>,
 Ofir Bitton <obitton@habana.ai>, Farah Kassabri <fkassabri@habana.ai>,
 Dani Liberman <dliberman@habana.ai>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Koby Elbaz <kelbaz@habana.ai>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Date: Fri, 31 May 2024 12:46:22 +0200
Message-ID: <20240531104622.564778-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
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

Use kvfree() to fix the following Coccinelle/coccicheck warning reported
by kfree_mismatch.cocci:

	WARNING kvmalloc is used to allocate this memory at line 10398

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index fa1c4feb9f89..8024047962ec 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10489,7 +10489,7 @@ static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 siz
 				(u64 *)(lin_dma_pkts_arr), DEBUGFS_WRITE64);
 	WREG32(sob_addr, 0);
 
-	kfree(lin_dma_pkts_arr);
+	kvfree(lin_dma_pkts_arr);
 
 	return rc;
 }
-- 
2.45.1

