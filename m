Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93247D1EF8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 20:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C3E10E09C;
	Sat, 21 Oct 2023 18:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6931910E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 18:44:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ED03C6607337;
 Sat, 21 Oct 2023 19:44:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697913870;
 bh=PREi321JkX/C3dlUZw8RUfqKwYZTabiYJQ1u5AFX0vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7n0BBpbWhvQm7vWkO6S4Ipg8U1RKiN4r2YtIO8zYtlsankzlAGWfxg9pN31GrbVQ
 lFVFF7cr6rsHtFKuddqCrfNd1RNxI2gNDX1uo1spTU4zR63kfrmifAAQCGYabTCXK9
 QDkMsYWFuA30XXIUUrLoshweXRx3zgw6+uNZzgJBP/pQxa9Jg8eBCQQe8Zz7mxJvR/
 JbpPh5vfbw9Wr9G0IrrAU0vLQpzAiUbT23hUja41KhOYp9bOqhHygT/nijdmf4m8Il
 +8ExNI1drKf6GUJO4uIa2Y7HXAborrNS4fBMj3m5f7HLeZmfY/qZruKlWWNt8ylnCi
 4ep+pq1ei2/Cw==
Date: Sat, 21 Oct 2023 19:44:28 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Remove incorrect IS_ERR() check
Message-ID: <y5k6fhinzwd6yhbskvkaeiywp7vcsri3macjlwz3s7ug57erth@5foiaaf3hkr7>
References: <20231020104405.53992-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020104405.53992-1-steven.price@arm.com>
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.10.2023 11:44, Steven Price wrote:
> sg_page_iter_page() doesn't return an error code, so the IS_ERR() check
> is wrong and the error path will never be executed. This also allows
> simplifying the code to remove the local variable 'page'.
> 
> CC: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/376713ff-9a4f-4ea3-b097-fb5efb685d95@moroto.mountain
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Tested-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_dump.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
> index e7942ac449c6..47751302f1bc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_dump.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
> @@ -220,16 +220,8 @@ void panfrost_core_dump(struct panfrost_job *job)
>  
>  		iter.hdr->bomap.data[0] = bomap - bomap_start;
>  
> -		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
> -			struct page *page = sg_page_iter_page(&page_iter);
> -
> -			if (!IS_ERR(page)) {
> -				*bomap++ = page_to_phys(page);
> -			} else {
> -				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
> -				*bomap++ = 0;
> -			}
> -		}
> +		for_each_sgtable_page(bo->base.sgt, &page_iter, 0)
> +			*bomap++ = page_to_phys(sg_page_iter_page(&page_iter));
>  
>  		iter.hdr->bomap.iova = mapping->mmnode.start << PAGE_SHIFT;
>  
> -- 
> 2.34.1
