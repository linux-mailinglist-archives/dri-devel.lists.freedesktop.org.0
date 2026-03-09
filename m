Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLmpKXKLrmnNFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:57:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF329235BB7
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916A10E12B;
	Mon,  9 Mar 2026 08:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="tDa2gSL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5F710E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:57:15 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48540355459so836095e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773046634; x=1773651434;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QhSAyhARBfFioIzUhuKz22/Ga41Sv7/6kPpVPO+u0Ts=;
 b=tDa2gSL+jfI6kWyUjvMUv1DxPG0EsOavzyCHL2HAsNAF9eZSnlhqm1wKrTmlYRk1UW
 M9dYG+kxxxa9XBoFYEptv0EfslxEMAL6h4VmLvRSSLZTaPbyAQQi7KvMS5aH2j7GZJWh
 P3r7jZV5rJlrDsWml+luzANTPLoptwNjGmwaPWOXhZNBtOI2CKQYDz+Ugh/c2bUDDiR+
 vPXoFBQoImt4Q3t82i9raetol0gQTt/2+jM1e6UKQrRWmtKpjMaGvX/hrhL535W9NAR/
 QabjP9amZi6zWVh4QUGYA16/tzwDIUIPgwQwY3d65ObPzV1J+FiOn1c3monWTKYOkj9Y
 joEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773046634; x=1773651434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhSAyhARBfFioIzUhuKz22/Ga41Sv7/6kPpVPO+u0Ts=;
 b=odwqtwn1qjHOrojgECafevpnVFAe3sT1RXiEIF6NIWQXHPJMOjmOg55wjtJNPIBB7P
 cMU41OfYGFzLovs0gBabGvAdZaKZwMUWOSe4a/eJHCS4l5TWbg5AFaTIC8pYTT2aAUOw
 dib2Zqh7zf9ajN/g3+8AHwty+UHw4izO8wOndvyWM9ySplN2CbCDlOq6ydnKFI831WZ7
 UDxSznCH3saYra+ykETHxTc9lvwgCJ59m/fTztOzSmgbvNZNKkgAJ1MC4ZbvxSiQkw7F
 Iq7G2bfbKFmaYobpCrdB8kqbSKR8YHy5cAWKF4SruwJiVqmQ9fDUVqbE2Jei1kIt3TVj
 4lCQ==
X-Gm-Message-State: AOJu0YxK9YzP1tNt5WlfSS0gjtxmOA6uWAxYvuPYvPF29kzRBReOrpmX
 tPZMybcUcKueRXVMYolrbadJODVHrlovgpGLEkXG4P59yrHgSt9LW5sART+SAZvHoT8=
X-Gm-Gg: ATEYQzz7cgCwQIAq2JSWmVbbt1oLp112fyCZ5+EtCW2oj+vqWzx4BJ++0iah2ylEr2S
 ZwGRxNq9Opfgj2Ju4thSElHU8uXc1CE4/PnLpb2OD/XoGOdt1kYsAMtt6pBUO3ywNxl9dwP+ckL
 vKJM7R5xaRTJwy6V++2ZiJHCiL3IJp0CHPrnsrfN4YfMtSAeCz6Csv5c0R6bhD5MKjYj+cBudWB
 Po4c68RZJRe9yJgQWY59PTF6Xgm1IOxlCJTJxeiED+SzTxQJO0xHT5uwwMeD/v01juxZkB5fCY3
 T3cFh1oRNPT0PrSvw/6zy/PXsShcnXa7unT8YyDL1pqeK+7pvr8BB4i29psQxuz9UpAhMeR1m1U
 FB3265k9muu5yuSTBNLBM3RTcD6Af1ghJdCi+STYFstWoZy1wMVYgQYuuYUitfWHk2EFA76esoI
 06U2KwqO2YkrHk7kQ2nqnL28Ve49PM1a4=
X-Received: by 2002:a05:600c:8714:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-48526957d50mr167626995e9.22.1773046634085; 
 Mon, 09 Mar 2026 01:57:14 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b7547sm260786625e9.12.2026.03.09.01.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 01:57:13 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:57:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, 
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
 thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
 suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <dnb4khhvpmwzxkp3vuihukfaztjvy5oxsjunbgixyebwonfeyi@goxt6ahopcwi>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308101948.GO12611@unreal>
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
X-Rspamd-Queue-Id: DF329235BB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

Sun, Mar 08, 2026 at 11:19:48AM +0100, leon@kernel.org wrote:
>On Thu, Mar 05, 2026 at 01:36:40PM +0100, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>> decrypted memory on behalf of the device.
>> 
>> When a caller has already arranged for the memory to be decrypted
>> via set_memory_decrypted(), the DMA API needs to know so it can map
>> directly using the unencrypted physical address rather than bounce
>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
>> caller knows what kind of memory it has and must inform the DMA API
>> for it to work correctly.
>> 
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>  include/linux/dma-mapping.h |  6 ++++++
>>  include/trace/events/dma.h  |  3 ++-
>>  kernel/dma/direct.h         | 14 +++++++++++---
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 29973baa0581..ae3d85e494ec 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -85,6 +85,12 @@
>>   * a cacheline must have this attribute for this to be considered safe.
>>   */
>>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
>> +/*
>> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> + * (shared) for confidential computing guests. The caller must have
>> + * called set_memory_decrypted(). A struct page is required.
>> + */
>> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>
>While adding the new attribute is fine, I would expect additional checks in
>dma_map_phys() to ensure the attribute cannot be misused. For example,
>WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>that we are taking the direct path only.

Okay, I will add the check.
