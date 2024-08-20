Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925AB9590E8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 01:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D450110E53F;
	Tue, 20 Aug 2024 23:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="QZ9yVlUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE510E53F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 23:10:44 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5bebcdc75e9so1080657a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1724195443; x=1724800243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SX1ezoSJDugDwPOdGtHosBZWeg1iz+1d1+OhQfBUV7o=;
 b=QZ9yVlUH2i9nf0c+FPxDog3NyJmMFwh83cy8qSH5Fd6npMG4WYszCtYoflIan2xvkq
 wHBAEGwlcaLXgzXMbQck8lxc+H321KvLGqpRv9cHTvq3I/BkyXbl08K4+eioDX0+6oaM
 dbpve+JVmks4Jb4ohSZS68IA1RT6A3MXcjjK/L54N85oCXjTrkYkD7I+0s1lvL4uI63x
 3r8b5Rp8gVxY1xkh3jAj0tN8l9E516FZeOAB4CKt8I5HuQuy2+fpRE0bANH4fBRJ0bLN
 SC8X8DOppQKrOHHsOvrEXMN2kOnDclXDwMpEsQHNzFz8EnjjGybdoc7BKV0anxVpZ0x3
 TKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724195443; x=1724800243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SX1ezoSJDugDwPOdGtHosBZWeg1iz+1d1+OhQfBUV7o=;
 b=k1AzWxgXWmjmLtTAO5EfGiwKmUL4oPCAkYu8s2PLUzrSBoXBE5OiT8f3zcbXenbWtu
 iF+VgmVBjKEfB0Vw24sw1JBz8tzGiwDKlv8PbLPsx2DMC6pdjyOaOAzUc3zh34h1iq78
 b3NZvkbOhBhDqTzbzSE1NE6FBoU2hHI6EYaG4kYFOSZr9d2sVxgMkY7yv3bSop7lq4BW
 XLB0YIqAiIH1qUhCQFuILkT+RRS08z0WeuVBGG5tkNpPGUmNF7bTN78yJs5dFl47oqjt
 lXvMAOuE+XHX07iKz/xH75aEO97qkIwVNjZ8bPy1gUWAA8kR8IEH0Irez8GA6FOkXXZK
 wbVw==
X-Gm-Message-State: AOJu0YxxH1RStQxs3s2MDQABliCD22rgCNlKCDLyMZr9O/udF3wBc6ED
 NoWxmZyMI/Lx5A+1pxXjJ7126LfugI4yAhWXCSo1kwy5GR4cxvZY63YbSH5Onrg=
X-Google-Smtp-Source: AGHT+IHd9wFtG5D4Yy4a6ZJj8Q6kNR7yCZjSUshvttK1guXdXKAD1IWyRtKuhTvTSIFJnSPmC+d5Iw==
X-Received: by 2002:a05:6402:51c6:b0:5af:6c44:6807 with SMTP id
 4fb4d7f45d1cf-5bf1f2c1ef2mr86786a12.6.1724195442641; 
 Tue, 20 Aug 2024 16:10:42 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-228.dynamic.mnet-online.de.
 [82.135.80.228]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbbe2623sm7280801a12.9.2024.08.20.16.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 16:10:42 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: obitton@habana.ai, ogabbay@kernel.org, ttayar@habana.ai,
 fkassabri@habana.ai, osharabi@habana.ai, dliberman@habana.ai,
 quic_carlv@quicinc.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Date: Wed, 21 Aug 2024 01:10:28 +0200
Message-ID: <20240820231028.136126-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
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

Reviewed-by: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..5722e4128d3c 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10437,7 +10437,7 @@ static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 siz
 				(u64 *)(lin_dma_pkts_arr), DEBUGFS_WRITE64);
 	WREG32(sob_addr, 0);
 
-	kfree(lin_dma_pkts_arr);
+	kvfree(lin_dma_pkts_arr);
 
 	return rc;
 }
-- 
2.46.0

