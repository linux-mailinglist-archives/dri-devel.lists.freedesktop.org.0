Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102029CEA1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ACA6E48F;
	Wed, 28 Oct 2020 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789D6EC3A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:00:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s14so2434958qkg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CVbP6x6GqhbFdX3SvBtVLuaibpsey8Z2kthNc2qn85Y=;
 b=b6xNoHNCcqQ6iZUrN6FudWHoKff/SeoAiEzMcYFT9+/VtUC7pQ3LuxCoyR+nEK9eE/
 XdcNrv8ysE+MTfrEhG0jts7JRtOx19ChU/Qqb1hqj9ZtB0rAyzVa2Q9u1XhhHd8n0E+1
 dWJDJCfielErNYrBZPnpk6l4K86U4NvUIrEl+mRM/Hlml8FvUajH6qOhfIe/FgCz5JQa
 2yV3BfI4tPnPJyLolwYeVnfHDQhUn+dIOLM8MkMBqr3aVSll+ZklZl+2PFMwwRIM+4dn
 U2LiElMP3ag5Ny28BLiHp/m4F/yJvegH40XdeBIvrSJZ+1gFX2pOLoOWt/MF5npglDg9
 TMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CVbP6x6GqhbFdX3SvBtVLuaibpsey8Z2kthNc2qn85Y=;
 b=DLHbJQoIuUce671MmGvk4FLsPrKkpDBTsQD0HA2KsObnguY3lAbw2QVQfs+ZGmBWlk
 1IEqYjCYf1FrKKktFPx91siynlrcQoRbYvuCiix8CSwSuOc/JWjw7KcIHLAMLtVq6RTM
 YzC/0QmGJ7EoaDH7p1qrwnPmjnMSGvxGKopXPi8PgTNWJ/2PmpX4PlZKzjU3ufaoz9qt
 8qFm+jHN9x/S6TdFmumFvsBFe9Ne2CAil7zUJ4aqPR7f8JAZZrkvVO2cnhLnLR7Msf6i
 NeyJmZ4jWi9+vSXxSmItk+vcrKBWIxlKctlwv4pti09iUH1LTUxUF28v99SDRNlbqS61
 6Tnw==
X-Gm-Message-State: AOAM532DrwjoSw2spJx+nNZSMiyMFns+EHEttuKtIqFFV8ye+9YQwc82
 4ToGAf948OUfA5r3bZBAWThP2g==
X-Google-Smtp-Source: ABdhPJwtgyMNvAoGXqOUUW6O2zP3QFbdm3IPJDOnLnfti11DiqNucDutXZi21XVsAmyglZKaoSiw0w==
X-Received: by 2002:a37:67c3:: with SMTP id b186mr3780543qkc.26.1603828812127; 
 Tue, 27 Oct 2020 13:00:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y77sm1361941qkb.57.2020.10.27.13.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 13:00:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kXV8c-009fFB-LK; Tue, 27 Oct 2020 17:00:10 -0300
Date: Tue, 27 Oct 2020 17:00:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201027200010.GW36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 09:39:58AM -0700, Jianxin Xiong wrote:
> +/*
> + * Generate a new dma sg list from a sub range of an existing dma sg list.
> + * Both the input and output have their entries page aligned.
> + */
> +static int ib_umem_dmabuf_sgt_slice(struct sg_table *sgt, u64 offset,
> +				    u64 length, struct sg_table *new_sgt)
> +{
> +	struct scatterlist *sg, *new_sg;
> +	u64 start, end, off, addr, len;
> +	unsigned int new_nents;
> +	int err;
> +	int i;
> +
> +	start = ALIGN_DOWN(offset, PAGE_SIZE);
> +	end = ALIGN(offset + length, PAGE_SIZE);
> +
> +	offset = start;
> +	length = end - start;
> +	new_nents = 0;
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		len = sg_dma_len(sg);
> +		off = min(len, offset);
> +		len -= off;
> +		len = min(len, length);
> +		if (len)
> +			new_nents++;
> +		length -= len;
> +		offset -= off;
> +	}
> +
> +	err = sg_alloc_table(new_sgt, new_nents, GFP_KERNEL);
> +	if (err)
> +		return err;

I would really rather not allocate an entirely new table just to take
a slice of an existing SGT. Ideally the expoter API from DMA buf would
prepare the SGL slice properly instead of always giving a whole
buffer.

Alternatively making some small edit to rdma_umem_for_each_dma_block()
and ib_umem_find_best_pgsz() would let it slice the SGL at runtime

You need to rebase on top of this series:

https://patchwork.kernel.org/project/linux-rdma/list/?series=370437

Which makes mlx5 use those new APIs

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
