Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD332BBEB6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1342C6E9AE;
	Sat, 21 Nov 2020 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22736E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 18:30:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l2so9882288qkf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qS9ZqheXF3qXlYveFf6+vMdNm1LP9a7sCRmU5tIj0vQ=;
 b=DrFYWt+1hb4WfINS92U5IVQMCB6WKF5xEz75W+ZSkpzKVYZw8JxEaaLRhFgpFsX1Rs
 XUxXlb8HtK40tSfGjjunkX8SU199oPuB/G80+Ihj5S6pCKGr2HFJlL7MHo65gDiv8c23
 ofoLjjtqKLcM53/YSHMQnD2n64U/s4LGFx0MXmrxSwtmydzCFFOGbOgl5AefevNt9z4B
 /AzLhrlEIRoOx3a/FI6xZiykdYU/2XpV/SH5UXKmuao5MFBbsI3vKTIdga3hvHSW64qo
 Z/90o2IZQUfzW0ooGr7K6UIiRhh4E1F7jHOF81fznndZO1wpQBiuooGayp0HJjzgftiB
 hUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qS9ZqheXF3qXlYveFf6+vMdNm1LP9a7sCRmU5tIj0vQ=;
 b=NAEAvMoog1H1fN65DqvsDhc5PgOFYz/S06+FgR0o4tncuhCYgiWXgAN4kGHQF2WDBs
 cF4K1MdYiDz480kJVUTqYzsjGlRhrb8asn+QAGtkOvUZcQbHfCOrNl5cSVdW4bfGuq7l
 y4LK3wz/+QMQBk1yudSVn6vJ+HYo26TxoEiTegYGzUYpeFtLYIR1a+UY7g+HFZH+/taR
 sRITgV/vkTVRtUv3HVueNghTEfJ4ct3XX0i/ep4lwHqOBrHvaLEOJssy99F44tCgHNYA
 YzsPrJNVinY6Ec8X6ZbT2nygUvTGj8T4LoRZFCgp/+oGQmSS0jv/J19Clv1MRluT9LON
 rZAQ==
X-Gm-Message-State: AOAM5339+8JrPWFi21Hmwz8ja0u2CK7hZ/huR/jw4bF84bgDz8SG1zRr
 UKQG9ipHgm5v29lbDyB1N/9m9A==
X-Google-Smtp-Source: ABdhPJz9SdUwITc+pZGgA9oQw0nYR0dAsKTieY7dxiA1OR9ilvjUimdkoUQjm+gMpnpYWVeoTDxPfg==
X-Received: by 2002:a37:9441:: with SMTP id w62mr17877583qkd.474.1605897030779; 
 Fri, 20 Nov 2020 10:30:30 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id f14sm2400142qkk.89.2020.11.20.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 10:30:30 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kgBAz-008ujM-Ig; Fri, 20 Nov 2020 14:30:29 -0400
Date: Fri, 20 Nov 2020 14:30:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201120183029.GQ244516@ziepe.ca>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
>   * Return: zero and the pfn at @pfn on success, -ve otherwise.
>   */
>  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> -	unsigned long *pfn)
> +	unsigned long *pfn, struct mmu_notifier *subscription)
>  {
> -	int ret = -EINVAL;
> -	spinlock_t *ptl;
> -	pte_t *ptep;
> +	if (WARN_ON(!subscription->mm))
> +		return -EINVAL;
>  
> +	if (WARN_ON(subscription->mm != vma->vm_mm))
> +		return -EINVAL;

These two things are redundant right? vma->vm_mm != NULL?

BTW, why do we even have this for nommu? If the only caller is kvm,
can you even compile kvm on nommu??

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
