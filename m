Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45901182A83
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E986EA43;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E16E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m33so2354932qtb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XocowDuniR0hmNfpL1nEDZsX1TOc8gKZoEyeLoQxAU8=;
 b=On0nSMgzQD/BpXWJeG3hXripgnyMnySf+BC95POCcQqeO/TzGQajxSwEOoyuXJtnu9
 Cfx3f+Xjjn9Ee1s/v/MuIMr+SVLx7H7b1hMWPBCqfg+l6JS+9WMRPfQEczcnGusZzh+Y
 15/zHItu4eJaxFNVJYFq9I0qdDWF7UHAcr9ha3NYPnbyqFNembAnXROws9f7wDW67p0y
 3upwjd+YZigMo3GnsOPgN9fKtEQuJn8s/S9ZJefjtE7nRs8HH5QwgQTYKapfTZpgpWeD
 4n+8FpA3t8sOWGh/aaUkNXcy9C0l9AZdjs7ES4bsrq1pMQMtujg25B3xc3/zgDG4pype
 JtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XocowDuniR0hmNfpL1nEDZsX1TOc8gKZoEyeLoQxAU8=;
 b=kLJgUrQvm/YtFTP9jeki2tVIEdD+ws2aVBukyHJT318NCtiXg++sDDdnRFzR28r+Lq
 lkl39csEcxmeRt/+wt/aaXqtJMi0yAncC8C7SKRmScGHqWIlw1PYFUokb5U3qufL4gfy
 U5VDaHvwZUb85K6O+cgncstYdxE3hG3/C+NH0u8Q/5t8xU2Nrzkmqf4yPQwuZlvYL5kU
 Hf5w1jEWBMgnk8hclPAt+8W1yox6T4B/On1qlE8ywAriSDEnqSAHjf8iPOCsCvxWsW3c
 JpUWFaFuQ1Rb4nPBCLfJZf9ysJz8rm/ro2SqlWxxl/cykTmdJIR2NGuu4beuSMQqFjrW
 n4vQ==
X-Gm-Message-State: ANhLgQ2jEDkSNQoXgAAxvrnB6M21H16EEHHpAO42PhaFLVW7lz/cpwe4
 iXHGE+AhDU9qGYccmV+9hPwLNQ==
X-Google-Smtp-Source: ADFU+vuHlgD4b9kXT5mtcSVhfQ4qfz45k/hdWlhMqHwFglRZBRjT/lnkg+9CGQkkuoKUS5C0N6Ncpw==
X-Received: by 2002:ac8:6685:: with SMTP id d5mr3989843qtp.170.1583951716238; 
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id h5sm9213171qkc.118.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CI-000163-UO; Wed, 11 Mar 2020 15:35:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH  hmm 0/8] Various error case bug fixes for hmm_range_fault()
Date: Wed, 11 Mar 2020 15:34:58 -0300
Message-Id: <20200311183506.3997-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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

The hmm_range_fault() flow is fairly complicated. The scheme allows the
caller to specify if it needs a usable result for each page, or if it only
needs the current page table status filled in. This mixture of behavior is
useful for a caller that wants to build a 'prefetch around fault'
algorithm.

Although we have no in-tree users of this capability, I am working on
having RDMA ODP work in this manner, and removing these bugs from
hmm_range_fault() is a necessary step.

The basic principles are:

 - If the caller did not ask for a VA to be valid then hmm_range_fault()
   should not fail because of that VA

 - If 0 is returned from hmm_range_fault() then the entire pfns array
   contains valid data

 - HMM_PFN_ERROR is set if faulting fails, or if asking for faulting
   would fail

 - A 0 return from hmm_range_fault() does not have HMM_PFN_ERROR in any
   VA's the caller asked to be valid

This series does not get there completely, I have a followup series
closing some more complex cases.

I tested this series using Ralph's hmm tester he posted a while back,
other testing would be appreciated.

Jason Gunthorpe (8):
  mm/hmm: add missing unmaps of the ptep during hmm_vma_handle_pte()
  mm/hmm: don't free the cached pgmap while scanning
  mm/hmm: do not call hmm_vma_walk_hole() while holding a spinlock
  mm/hmm: add missing pfns set to hmm_vma_walk_pmd()
  mm/hmm: add missing call to hmm_range_need_fault() before returning
    EFAULT
  mm/hmm: reorganize how !pte_present is handled in hmm_vma_handle_pte()
  mm/hmm: return -EFAULT when setting HMM_PFN_ERROR on requested valid
    pages
  mm/hmm: add missing call to hmm_pte_need_fault in HMM_PFN_SPECIAL
    handling

 mm/hmm.c | 166 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 79 insertions(+), 87 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
