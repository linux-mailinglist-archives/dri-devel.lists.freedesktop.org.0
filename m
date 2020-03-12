Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D61826A7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FAC6EA0F;
	Thu, 12 Mar 2020 01:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510826EA0F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 01:33:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6991070000>; Wed, 11 Mar 2020 18:31:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:33:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Mar 2020 18:33:22 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:33:22 +0000
Subject: Re: [PATCH hmm 4/8] mm/hmm: add missing pfns set to hmm_vma_walk_pmd()
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-5-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <8dcf74fd-84ea-d233-bb19-81f8dd1da026@nvidia.com>
Date: Wed, 11 Mar 2020 18:33:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-5-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583976711; bh=U1rl/UiabWfnOWXl4vCuGxodlfNhgrYhMzFJH5JLC5I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YxQcvPK/mWR4Apm9cuq2r3rAKnQkzHAu45B/ITC8KV+03Vt602vlTt6wbkFfwbkgO
 WQo6CtjlzjXmlMbfEPrED8EaUxSPapFKtsfUAHTArULW0WyiyMMz9Yf3uKxTqhwHh9
 ZDikR1wIskm+aeFCD5eOPsPkf50zSS7IohQtwaTfT/Igunp6KKjQOFVY+wvvvkkZjx
 2GVwTkmCH3Pc8Ghz9rf3YPI0mrUZd8WQ45qO7Sr6hamKfRVnZJ1KVKZSt7eynJudej
 /bt//OtYxgGchG+PUjKiiRPxZ5Fw6puFRSQB2P8EAThMwLdYySEuRvGGyKD8KhU8qK
 9I1b0pipWo+JA==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/11/20 11:35 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> All success exit paths from the walker functions must set the pfns array.
> 
> A migration entry with no required fault is a HMM_PFN_NONE return, just
> like the pte case.
> 
> Fixes: d08faca018c4 ("mm/hmm: properly handle migration pmd")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 32dcbfd3908315..5f5ccf13dd1e85 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -394,7 +394,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   			pmd_migration_entry_wait(walk->mm, pmdp);
>   			return -EBUSY;
>   		}
> -		return 0;
> +		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
>   	} else if (!pmd_present(pmd))
>   		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
