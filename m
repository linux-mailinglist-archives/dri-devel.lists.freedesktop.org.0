Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B9184220
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637AD890D2;
	Fri, 13 Mar 2020 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A1E6EB31
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 19:33:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z25so3421919qkj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=is+aAM3kx5GKU9icuIhwFwERZb/T1GECd3Vc+iyHsrs=;
 b=lRxPbdASo0evc/F+Ip6xqFmx6SR5Ep4C+HmDXCsADxBM/3Ke9ZrSnd8OLI9/+Ba18R
 N5a2wgvLDNxgULstqz0noI6VPXtVwUu8JngxGZs1UC5YPlq2H93z9xSfSOPdldqeSa4/
 hatJPBEgZOOseMT1S7YUlHG2jZYe0YM1TmYEuk89SVmxTdNfqS3h8ICchbxaNu8Q/cAZ
 aEAKi7bYJ81g9JwKnY6ybmslylnp+c5JRQ3G98ykTev743ZLpqbGtV9REVg+YL86yupH
 DXUhmmzZuEPGZDN7VLByJzgabZZQxQjNYMoTm2pezJL4F/dgTXcrObPWfXS38ruNqv42
 nl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=is+aAM3kx5GKU9icuIhwFwERZb/T1GECd3Vc+iyHsrs=;
 b=NchFqyVGUMWteP7MWqFvm4ty7XSaWP78HIqE6Wqxt9vO05kDJG9F5D76zy66NgqB9T
 mpCmaRhNMDYRFSiulZmXREnopf47olz4o/7CURLoRf7FKppvaZyrjja1cXnAYkIif+LJ
 xAWYqN+cD8bwidaqlLg7AA0YRqhXLmQfb863XqKCi+lv/VK/Z7nyLP2hrnuC44+oAqlJ
 8IrgK0pBihZ7FFLCgPwyvPnVKYXizs+V/RBNqWKoTOXl7w8ZVv09MdwwIfnUAPV+WB4F
 rU1VkwsRCiu8dJRUPL2Lvm7XxqLULTrx07ymIkKunnsLVswTv4WqhIVGyOVpjAV8+ZQp
 0LTQ==
X-Gm-Message-State: ANhLgQ0TH5MCac23d2/ykGjF9fcqN31G8eQTCyhvvgCep0XVRerFeR5J
 9DDBAayvpM2qI1N5nc8+IBe7+bISAGI=
X-Google-Smtp-Source: ADFU+vtXZiDTvpbqkqoe3aZfzQFFBVJratdXNcqXhW8TtJt9L1GxnDlVMfvoDpoJhcH5PsM3O8V7Jw==
X-Received: by 2002:a37:5b81:: with SMTP id p123mr8518904qkb.284.1584041591327; 
 Thu, 12 Mar 2020 12:33:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id o16sm28188049qke.35.2020.03.12.12.33.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 12:33:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCTZu-0000QR-65; Thu, 12 Mar 2020 16:33:10 -0300
Date: Thu, 12 Mar 2020 16:33:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Felix.Kuehling@amd.com
Subject: Re: [PATCH hmm 9/8] mm/hmm: do not check pmd_protnone twice in
 hmm_vma_handle_pmd()
Message-ID: <20200312193310.GA1190@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311183506.3997-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pmd_to_hmm_pfn_flags() already checks it and makes the cpu flags 0. If no
fault is requested then the pfns should be returned with the not valid
flags.

It should not unconditionally fault if faulting is not requested.

Fixes: 2aee09d8c116 ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Bonus patch, this one got found after I made the series..

diff --git a/mm/hmm.c b/mm/hmm.c
index ca33d086bdc190..6d9da4b0f0a9f8 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -226,7 +226,7 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	hmm_range_need_fault(hmm_vma_walk, pfns, npages, cpu_flags,
 			     &fault, &write_fault);
 
-	if (pmd_protnone(pmd) || fault || write_fault)
+	if (fault || write_fault)
 		return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
