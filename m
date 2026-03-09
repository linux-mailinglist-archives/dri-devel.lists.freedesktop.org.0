Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3oKnjDrmn2IgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:56:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F43239439
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FF910E4E4;
	Mon,  9 Mar 2026 12:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dPFD8XO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E210E4E5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:56:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4853bcdefd3so550225e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1773060979; x=1773665779; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
 b=dPFD8XO8vTcyd8L1o/+B0vHtQqRMZ41ez1q3vdP5bL46PSKsRvq2Xb+TSuhGVXUH+2
 AI3QDx8n+sk5HBwFNdq+sEyfUJdO5234KRL4l9leLtybEtUFdIG68J6T/ETmh8b/T5ni
 KtY42e/1UCCjudFQ4SrsxJSUoKJFbT7aBImM+Q/h64cAzZMASep6lky2e819vBLPeO+Y
 PqbdEWNiabTa4rbDnQAYRMDN3z5QHnms//HgH4RcEvD4R6E5hYyKMK9HW7bgX7bmYzkj
 tYnivF0zJo2HmYXZ21jwj7xgXl6lBHms4fDziNFjH43y56NfdMg/FYeTKBaGkE1VICuo
 hQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060979; x=1773665779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
 b=SzHSKJ3U2QOhN1jr5LqvEitjsENjmFcBmnYIsSyEAVNY81QwlCmBHn0aaSxZjSVvki
 TnAgfaA92IWDvKSGBpTzg1x09wjg4BoZQYWHxQOMqaj5Yf0RhdAqfg1CNHjVktMXDqzH
 ZlEin3tlFFUXrIExFZW9BF/stkO5tLKtTuAwnG0rvaCBmURoseWjn4LgjxD6N7+uP1Dh
 KIZAnc41w91x5HixtCtA1jf6Ea9SJaxlrzRvwge6EN/2Oh9cv+avPgKTPOz5i6TGSgx/
 NH429mPztOYheLSNLn51pjWTt/ykx7jA/K8gQfzh6CDpm4jCnX6hXCNx/e10Vp8v4gUD
 nY4A==
X-Gm-Message-State: AOJu0YwG8ugcE6v3AklUSkAY2Y0HHo80gP43klTMU2rd2PwZ8SNt790U
 fiFRbq0Ea1LI6x9tlkhDLfpkxoMd2LRgr82UUy0dK6IQ6RdI3bGNa7RFGdHbBcXep4g=
X-Gm-Gg: ATEYQzzZRUArbJDS5sk8pTE114NfPLjyv40MNhM6GbfuQlcaV4UUL5iLK4h/+6fQ3tc
 QEydUdqrx/rSX+ZIkeqZ6HueDmeb4/HpvchPr/0IejTzcDptK5dh1lBH/Jug8QDa/gCXl9ame46
 O9nw2+Ps3DOpsNsNZDLf312Thkzqz2qwOA2uba2zASqYNSNcNnGv9+Dp9X3L3CXkoj/hNbgor/N
 SI6iWRWtXnrTC4HtqbNViQF5tL2XCVlNq4r5n3uun0FG0QYMJHYf6tLDuX9few2e3xSZgHtUSJu
 1H0YH1yEfs3syfn21YNoTQTjJ23PN60oXAZDFHFGm/sUa7UHuMDO9Z4HOKET2+h2Lv/QoJv8AQ2
 RbT8603oWdDCYKtPClYufktjrAzuGl487MHzomjR392wKy9kz8w5LsSZxgQ6Tb5wGfdntpZSloV
 cxiX1WnICjLrZWohSRmR2bz9ZMfCWeWyFZJx7svn+QTPJqdq/XCrAm3AwwqpsfMVNPi/x+lpsA2
 l5ZccA0WZqybEQ7qmNDjhnSOyk=
X-Received: by 2002:a05:600c:871a:b0:485:3bc7:a224 with SMTP id
 5b1f17b1804b1-4853bc7b582mr27768635e9.6.1773060979410; 
 Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Received: from mordecai
 (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz.
 [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae3a20fsm26118577f8f.28.2026.03.09.05.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Date: Mon, 9 Mar 2026 13:56:10 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309135610.1f81d2df@mordecai>
In-Reply-To: <20260305123641.164164-2-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 19F43239439
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ptesarik@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ptesarik@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:dkim,nvidia.com:email]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 13:36:40 +0100
Jiri Pirko <jiri@resnulli.us> wrote:

> From: Jiri Pirko <jiri@nvidia.com>
> 
> Current CC designs don't place a vIOMMU in front of untrusted devices.
> Instead, the DMA API forces all untrusted device DMA through swiotlb
> bounce buffers (is_swiotlb_force_bounce()) which copies data into
> decrypted memory on behalf of the device.
> 
> When a caller has already arranged for the memory to be decrypted
> via set_memory_decrypted(), the DMA API needs to know so it can map
> directly using the unencrypted physical address rather than bounce
> buffering. Following the pattern of DMA_ATTR_MMIO, add
> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
> caller knows what kind of memory it has and must inform the DMA API
> for it to work correctly.
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
> v1->v2:
> - rebased on top of recent dma-mapping-fixes
> ---
>  include/linux/dma-mapping.h |  6 ++++++
>  include/trace/events/dma.h  |  3 ++-
>  kernel/dma/direct.h         | 14 +++++++++++---
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 29973baa0581..ae3d85e494ec 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -85,6 +85,12 @@
>   * a cacheline must have this attribute for this to be considered safe.
>   */
>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
> +/*
> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> + * (shared) for confidential computing guests. The caller must have
> + * called set_memory_decrypted(). A struct page is required.
> + */
> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)

I don't want to start a bikeshedding discussion, so if everyone else
likes this name, let's keep it. But maybe the "_CC" (meaning
Confidential Comptuing) is not necessary. IIUC it's the same concept as
set_page_encrypted(), set_page_decrypted(), which does not refer to
CoCo either.

Just my two cents
Petr T
