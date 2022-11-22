Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AA634330
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8F10E198;
	Tue, 22 Nov 2022 18:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0801E10E198
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:04:01 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id d18so7090659qvs.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W7bbvg502GJyTi71welT8fT4qCp26MYzBqtmzcFheTI=;
 b=hxxP9fZ62k/WHlETcVnpO383tcNmRuS7yIx/IpNDUCXAWScuWBJNaAC2vxcDJQhhj5
 +1LaEX37jCer4UQZaGjPADUTUunxG8JLJWtZ4fXZkq1T1vSelmhQcOoaiy0KrstV3AYd
 HjoRnTNrheWMNe6tU682RoIXTv7EH90llcP2Z5W62dMKqkF6zmHG3k94cdmg4ysjUrn+
 qChMzjNimzH5EwpYaivhb4OaFjP9d+ZZWghVvLH5ndeAU0xk9TVLh+Ql5MAZqVwzy4TX
 fscgFDeo4bUZZmPTQFxPHAf1QR9XhOwMtEOyQ7XU+xQTE2Sh5q1PYMMR5YfORC6JJSXz
 VpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7bbvg502GJyTi71welT8fT4qCp26MYzBqtmzcFheTI=;
 b=BrT04xUgDS/0iAJRCzpcSloPk3+6YDVRz4eNThJYKVtG9o3eOdVpTLFSWar6DVP6aa
 e5Rfnl8rU098i6f2H0AfiQssi2xpvbURLQti42OMetJLA3ng2uU+IjWJG8i+PwkVyhaI
 PiPVV9TqSE9VPVuzMxTmFKagbN62wom5vQnj9bBb0NaCIs5hHPocKZ0NOewv/bDcLSsh
 16enmMcJTmirVDHFhrAK+7p8FDhKRF5GQ4/gZJVeajHPmYb1f5pISwK/5FjYXObpyokX
 QG3WXtEi9ZR15mq2xl6W4CjkaJIygYTvSWtStIga0ZjfqJ6lEHo/dbeoBWJhYCq5dhfD
 F06A==
X-Gm-Message-State: ANoB5pkYTbluyIZEvrLkZLq80V6hpjH1pEDZ4DQYrpTElnz71e7OV8uF
 Rq9cYAks522m4+wcJEIcVZWBUQ==
X-Google-Smtp-Source: AA0mqf7pUdu4FJ8e+r980JSI/AIM2yP3chEuRqiXapxgcE+JycWP3gFdESoy8ic1cf1zQoje4UGVKw==
X-Received: by 2002:ad4:4082:0:b0:4bb:6a11:9418 with SMTP id
 l2-20020ad44082000000b004bb6a119418mr6545993qvp.70.1669140240503; 
 Tue, 22 Nov 2022 10:04:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 ff22-20020a05622a4d9600b003a5416da03csm8615171qtb.96.2022.11.22.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 10:03:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxXcj-009wAz-UQ;
 Tue, 22 Nov 2022 14:03:57 -0400
Date: Tue, 22 Nov 2022 14:03:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Message-ID: <Y30PDdsvHIJo5YHR@ziepe.ca>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 06:08:00PM +0100, Daniel Vetter wrote:
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
> 
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
> 
> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.
> 
> Motivated by a recent patch which wanted to swich the system dma-buf
> heap to vm_insert_page instead of vm_insert_pfn.
> 
> v2:
> 
> Jason brought up that we also want to guarantee that all ptes have the
> pte_special flag set, to catch fast get_user_pages (on architectures
> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> 
> From auditing the various functions to insert pfn pte entires
> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> this should be the correct flag to check for.

I didn't look at how this actually gets used, but it is a bit of a
pain to insert a lifetime controlled object like a struct page as a
special PTE/VM_PFNMAP

How is the lifetime model implemented here? How do you know when
userspace has finally unmapped the page?

Jason
