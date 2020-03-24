Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A2190727
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5C06E456;
	Tue, 24 Mar 2020 08:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B5289E35
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:14 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i6so8642821qke.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtjvXIRl7JvjxGCCwhwKty2zmKTxYCK8uhb2/phXd0E=;
 b=j2Fj9mGGXkb0s5jfx+PaOyQglxSKvi9DzQ14cmVcTgbF31/1q+wroCRgzrwp6o0lQ/
 PMrHTYwMUGlLwsiNJF2XuxvJX4Aj6pKrULOtMy1PyM1vypcNPVUYzBmwCBJNESpWOsyS
 JOkIyj3fbVfemR9nxyftNMco7DJxkZ6NYasYiV3jSGP2jWoKOaqJekhfAVS0HndDoMRY
 sEKvbkkAiciWAwNov/v7Qg1GYL8sIHnYstAwrJO22Txcxgv2IyW8RiB5s9/XVFJogf6L
 DJNCkbc11+nvZK7Tq18ykvSovfN4GbCtjxmOr3RGIWx/7vmJWd3LSencrwufu6ElenGz
 CxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtjvXIRl7JvjxGCCwhwKty2zmKTxYCK8uhb2/phXd0E=;
 b=ljmEYQ6s8gDJVrKddhZs1al86rvsEc6VZHD+iYmOv45tMs18HTke2w7Bo3gTIF8zuO
 DagTvBo/weOAKztISZCrgJI+YnWZ8q6Ky13yHoQwCS6k+8yUAjrwEEfu+2Cf9chuoG0v
 COQVO2tUTa0kaKKMauKWuLe/X5CEkMP7T2t0tuB3er+iy5dmEo6DL75k5TrndQMQYKVu
 W3JH9riBO2TmRlOh9KhBto/t+uhk52omHY5TRFozmZykp0wh+6bapLdezkAy49hZajgc
 oHILdoRsjGB9yWTnllUI27rVOAv9M1Z7YXoTO4FH3D5FUHq2118thGNg1VUhDepAhj6W
 5vpQ==
X-Gm-Message-State: ANhLgQ3fxFXExuuu7jLvXgF418OMK1NtaIjC//2yp890/fbKTVQaGcTY
 +hBC5YiFeGw7Msyy0npDRzFbeg==
X-Google-Smtp-Source: ADFU+vuqtjILT193yy1E1b2Co21btJLxUdSeIXs67XJc39y6GefW1zq10kzN67rE1jTtVo2ZUkW7VA==
X-Received: by 2002:a37:9a81:: with SMTP id
 c123mr18495488qke.176.1585012513991; 
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 199sm12325170qkm.7.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000rI-Aa; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 6/9] mm/hmm: use device_private_entry_to_pfn()
Date: Mon, 23 Mar 2020 22:14:54 -0300
Message-Id: <20200324011457.2817-7-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324011457.2817-1-jgg@ziepe.ca>
References: <20200324011457.2817-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

swp_offset() should not be called directly, the wrappers are supposed to
abstract away the encoding of the device_private specific information in
the swap entry.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index f59e59fb303e95..e114110ad498a2 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -266,7 +266,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
 			*pfn = hmm_device_entry_from_pfn(range,
-					    swp_offset(entry));
+				device_private_entry_to_pfn(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
 			if (is_write_device_private_entry(entry))
 				*pfn |= range->flags[HMM_PFN_WRITE];
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
