Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFED18DF8B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257816E2EF;
	Sat, 21 Mar 2020 10:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903A36E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 16:58:58 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id p19so743928qve.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plnR+AZUQA4jCFYWVdv/wzRwNH8DzG0o2FQjh9+mrVM=;
 b=Lmt+5Qnlb7tZ275uEF6CrSndb1nH26tPFDzh2G1CUyCkxbm+gfTR/9UE3crQdDlJQh
 zmDaHW+IgXVtcdbAmv4hoLUSr5lYkwBNwHpy0XvkP82YNW5ma7lMC3aBxDeZeT2kmy1U
 2nAs/Opt9M0EKy6+Kh7fhaf32m2Di4KqjejRG9g0z4FnY2Pat8Htb0koubS/nf9KAPFs
 PSI4nUpk4CKGkqKtCWfJHuhhF+pADywPoMWjBRV3PCt6hQfR0Dgo7gdQXneMMYC7477Y
 ca/pQG/eWdcoGxoPCQJSbqxDMQwRysQoyM3BtxSKQP6+VSgziwwAYZeerX5zHFkfh2Hp
 cLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plnR+AZUQA4jCFYWVdv/wzRwNH8DzG0o2FQjh9+mrVM=;
 b=AULQ8GdutXN1Ug1OSfIbkrMo7uNRCDkn+i/35RxdtAgzUdDLEGKdgPodw3Zzm/JoC/
 TZ+C2CihiRwoO9SiY8RW3tB7NPvhV4brUwuPFvM/el/o/HmlhaQX9zA2ncpnPIcxN0RY
 2iFJFjzpUzk6vAGMyQyqnOF5Jgltrp84rEbJb+SL/1XaXVBIrelUJ9pk8WXcw7RBipu+
 uqC2rEsaty8KtavlHR6rq+aoOWpVPr8xBTDx+lqCmdaO7nAW3u+mV3mmpgp3MhDhd2wS
 Z84Spbq8fLXqz0nARarsp9LIc7jYXnIPj7kVnq1uVuRaHCfGTRgirtzzTHPF97c0ZuS6
 jOnQ==
X-Gm-Message-State: ANhLgQ13a4aJRBV9pHDSXoNYrNMck57JzunUYVJdK+6Vv2qBji4ar26+
 mDG+u9ecDG6wpoV/v4uJDMFEEK0OytLb7w==
X-Google-Smtp-Source: ADFU+vtu5OS3SdeDn9uwmE+9CRkN0K3PbZf2rBY2gGT27gwYaZlGzWtAypX6nlEbkEhbBrccm2MO7w==
X-Received: by 2002:a05:6214:364:: with SMTP id
 t4mr4400809qvu.124.1584723027047; 
 Fri, 20 Mar 2020 09:50:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 69sm4435782qki.131.2020.03.20.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005kO-Dn; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 5/6] mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
Date: Fri, 20 Mar 2020 13:49:04 -0300
Message-Id: <20200320164905.21722-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
References: <20200320164905.21722-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:30 +0000
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

This code can be compiled when CONFIG_TRANSPARENT_HUGEPAGE is off, so
remove the ifdef.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 7f77fb6e35cf78..a09b4908e9c81a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -192,7 +192,6 @@ static inline uint64_t pmd_to_hmm_pfn_flags(struct hmm_range *range, pmd_t pmd)
 				range->flags[HMM_PFN_VALID];
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, uint64_t *pfns, pmd_t pmd)
 {
@@ -215,11 +214,6 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	hmm_vma_walk->last = end;
 	return 0;
 }
-#else /* CONFIG_TRANSPARENT_HUGEPAGE */
-/* stub to allow the code below to compile */
-int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
-		unsigned long end, uint64_t *pfns, pmd_t pmd);
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static inline bool hmm_is_device_private_entry(struct hmm_range *range,
 		swp_entry_t entry)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
