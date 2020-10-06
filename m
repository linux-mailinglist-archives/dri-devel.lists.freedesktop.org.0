Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C19285966
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9A6E8A2;
	Wed,  7 Oct 2020 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41466E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 13:21:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q63so16579256qkf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YRYuE1oST5rCsSRo3ftJBgKrW6I4XszeRlUEeyGTNfA=;
 b=BFD//pwAX/64KPt0LEII7XnZhATo+5u4Ci1QUGZnXAvcyoZpf216nBIukB8S0lNR+o
 /SBnsKFNycdO4FaqhrrvOl8q9yUCUD0kMtxCFrm+T3BuOtGJqNoq/vuatu/yUwFaui3W
 wG/q9rVWqGvQF3DH1sF8weJvvvE2/FsOJioQK368BV9SL2poAmn8GeN+if4sevucB6tf
 8BV+2/e4V/R+9zg6ETBTYxp+Q6woapII4/lMg/2r2Ql9+NA7asVIWxgARtsMmyYoMq2K
 YKB5J7l4MgFdsyryEbJBhC2DmC2IwuvI3od1/Cu2zgJfsaaVHr58x1zSeFV0fZQiWrdf
 Hg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRYuE1oST5rCsSRo3ftJBgKrW6I4XszeRlUEeyGTNfA=;
 b=ikTqGqgD5Y2apVNIMbsXAMHcV0x7u83naM68dgxV6vS9T8WMRML78v9ySwJUUkHcRk
 vVNY0eJcUlIvXaQ8i8qG3kiZpFbeDeppWbfWVRJTqEPksHFIrJCpo+EofqFMPpKqI67f
 V37sCP3MY7QBt+f1uUBg52sok9nE75tH/ZgY5eK+4DjW+TnwGbddjGMB+WHgpFR4fVsP
 E3B2FO2C4WMYIcO2BUuIQbO5Nt6ZfhJXOgxg14dRoa9I0QNkd9dAyRgfwDAyDujXC9lu
 6jN/gapgubcDHcYg94uHxQgPsxAxN2WaxmtNvE10Y7Et6EC4RZPMLzYF58pVxfq9LnEL
 oYHQ==
X-Gm-Message-State: AOAM532QM/v8g02oj0i/QIDMvLlHAIP/M5rjzx7HqfA3hVY8lVkDKQG7
 kzDe+p6ijyck9Xu9NIGCP187vg==
X-Google-Smtp-Source: ABdhPJw4Z7YWS8t/L1IK8utu6wKe+vRmf2v1MdzI4qau8wJptX2TFHJ6aQoGZURrxgM6eCoWFpwqPw==
X-Received: by 2002:a05:620a:1287:: with SMTP id
 w7mr2490783qki.335.1601990468080; 
 Tue, 06 Oct 2020 06:21:08 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 192sm2477887qkm.110.2020.10.06.06.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 06:21:07 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To: Christoph Hellwig <hch@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
Date: Tue, 6 Oct 2020 09:19:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201006072306.GA12834@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/6/20 3:23 AM, Christoph Hellwig wrote:
> On Mon, Oct 05, 2020 at 10:35:43AM -0400, Jonathan Marek wrote:
>> The cache synchronization doesn't have anything to do with IOMMU (for
>> example: cache synchronization would be useful in cases where drm/msm
>> doesn't use IOMMU).
> 
> It has to do with doing DMA.  And we have two frameworks for doing DMA:
> either the DMA API which is for general driver use, and which as part of
> the design includes cache maintainance hidden behind the concept of
> ownership transfers.  And we have the much more bare bones IOMMU API.
> 
> If people want to use the "raw" IOMMU API with not cache coherent
> devices we'll need a cache maintainance API that goes along with it.
> It could either be formally part of the IOMMU API or be separate.
> 
>> What is needed is to call arch_sync_dma_for_{cpu,device} (which is what I
>> went with initially, but then decided to re-use drm/msm's
>> sync_for_{cpu,device}). But you are also saying those functions aren't for
>> driver use, and I doubt IOMMU maintainers will want to add wrappers for
>> these functions just to satisfy this "not for driver use" requirement.
> 
> arch_sync_dma_for_{cpu,device} are low-level helpers (and not very
> great ones at that).  The definitively should not be used by drivers.
> They would be very useful buildblocks for a IOMMU cache maintainance
> API.
> 
> Of course the best outcome would be if we could find a way for the MSM
> drm driver to just use DMA API and not deal with the lower level
> abstractions.  Do you remember why the driver went for use of the IOMMU
> API?
> 

One example why drm/msm can't use DMA API is multiple page table support 
(that is landing in 5.10), which is something that definitely couldn't 
work with DMA API.

Another one is being able to choose the address for mappings, which 
AFAIK DMA API can't do (somewhat related to this: qcom hardware often 
has ranges of allowed addresses, which the dma_mask mechanism fails to 
represent, what I see is drivers using dma_mask as a "maximum address", 
and since addresses are allocated from the top it generally works)

But let us imagine drm/msm switches to using DMA API. a2xx GPUs have 
their own very basic MMU (implemented by msm_gpummu.c), that will need 
to implement dma_map_ops, which will have to call 
arch_sync_dma_for_{cpu,device}. So drm/msm still needs to call 
arch_sync_dma_for_{cpu,device} in that scenario.







_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
