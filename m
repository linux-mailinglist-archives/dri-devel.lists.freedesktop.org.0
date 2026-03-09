Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOh6GLTErmn2IgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:01:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F48239572
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135BF10E4C0;
	Mon,  9 Mar 2026 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="UIYUH6Y4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B1210E4C0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:01:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso3213855e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773061291; x=1773666091;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
 b=UIYUH6Y4uZ+X0Dy4GqLMAtFmrMSZ/A3mKq87bLcvGbu8mCc0D6sYXFXFkg57A+h7Du
 fZ69vHCQ1iMunN+3JnBQDqs300nI8I3JzEHpZOEp/tEqHUPoWe01twQfH3ZzvvQ4Cr3w
 AU0zC14I858QEm/gQJIn8+Scuf/VsqhqV4n0/gjL4M9SKkoCtcIUsGy88PiaCC3Kst1h
 tRFLswfq+qtAmyydQIuNX0rbPReC0hSN5k46Cak7onXcm+ypsWi7h3oVLRt461CwnV59
 4P8xOvGHQmukI8ZGZSeeian55tzk3JRmQ9pc94al0FDVU0urUg+YxWIYkjlvu3F0KZLW
 L7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773061291; x=1773666091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
 b=LJtCA6pDErtUA3+2NfHDGrVJix0pYr94YRfneUsFaMTM7xW6SrXE02JXwiU0m2dVEP
 Z4JB/mY63oKCvoYA6avULSmKJ+OkwxGKA3VZp8+20c6hHhl7UAqqNaIt16EYCxCGys/h
 tn941ygIP7EkqmXUX7UgU0j11GuvnWrXEuGch3TEqFGnq1fb7TArxVI9y0dA6UoLA+KZ
 Xi429JnPaNDQLJFBe+Xr8kTtINO3sWCYATISYQ3Y7HGm9DzQVb8d1yNQ5gmsmRX9wMEY
 vNAUm+BWYmxALIwW0LYfmb8OxDiCUNTifQ5OplTjOazmwM0ZShZgP5ur6Hw9LbEuAJr6
 3lyw==
X-Gm-Message-State: AOJu0Yzj1+j/LrN6ktRu2bE4/JagtfxXaFrDffppWGLxVNApxW7HQtGu
 /Ba8saxYSGedtJMIFBzWph8dYqJbfzkEjclIwOT9Erh0LmpMqzH2hePPtRUKejIbLLc=
X-Gm-Gg: ATEYQzzvoWKt/4Ntd1h81RRVqk5RMYyo6ErdSUzebBLGkuzaPerLM5oDpd8fPmNyRaz
 DSQfUTKO9RC9df4QpUA/lbaakDEWYVGjzg7zdmh6K6vr9hmlKqWaRKUaHUJMlPjx91lwkJtYotU
 ULTKRAhnKYzDI+oFmSxbK62+sdcD6sOp+9xG1DfXmjiLf8fUGwb9zmBkQEeBR9szAParTnUngif
 urQtk38uGBqXdgqZu/ARCY4iskzbEU6uAofyihGMJNppZDlW5O4nBBUm82lg/NmbAM6PxWcrw/J
 KHCZCG0v15LfwFDMIeGtMiQGnzIr2NxC5h/O9wQaNnDYA5X4XBhvNgk1haJIPeIump2IXb+bQ+8
 b+jlbAYzddZQXIIooFgKFfmwYbrVHs0+0/MsdbBdU2BJsqiYFoB85LOAU+Zm5jX2+DkDrfBMqEA
 c8AT/uMmk/+AGlDN5DW3NdFDFR+Z9jXXTpezfIMzYkIg==
X-Received: by 2002:a05:600c:8218:b0:485:3692:e8f7 with SMTP id
 5b1f17b1804b1-4853692eaf6mr73833215e9.25.1773061290855; 
 Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a498afbsm64496685e9.0.2026.03.09.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:01:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Tesarik <ptesarik@suse.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, 
 leon@kernel.org, sean.anderson@linux.dev, catalin.marinas@arm.com, 
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
 thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
 suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <byfhwrnq76ylztrjc67ia5tlzgpihh3ycv53je3jekkbqltcad@sslumibsz23v>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309135610.1f81d2df@mordecai>
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
X-Rspamd-Queue-Id: 81F48239572
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ptesarik@suse.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,suse.com:email,resnulli.us:email]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 01:56:10PM +0100, ptesarik@suse.com wrote:
>On Thu,  5 Mar 2026 13:36:40 +0100
>Jiri Pirko <jiri@resnulli.us> wrote:
>
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
>I don't want to start a bikeshedding discussion, so if everyone else
>likes this name, let's keep it. But maybe the "_CC" (meaning
>Confidential Comptuing) is not necessary. IIUC it's the same concept as
>set_page_encrypted(), set_page_decrypted(), which does not refer to
>CoCo either.

Do I understand that correctly that you suggest DMA_ATTR_DECRYPTED ?
It's not uapi, so this is flexible for possible future renames.
