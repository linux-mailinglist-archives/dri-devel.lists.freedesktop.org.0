Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B11387290
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 08:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC026EAA2;
	Tue, 18 May 2021 06:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8B56EA96;
 Tue, 18 May 2021 06:46:49 +0000 (UTC)
IronPort-SDR: m3xvmt2uVl+gouVlzyD12vNJwL99zQdh5vT+Lk390qDosD8DAIC7Gxc/fLDXdhq4G4Os6J/VO7
 MxeKrmuCTXeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180246715"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="180246715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 23:46:49 -0700
IronPort-SDR: 7AjQz0vdBoc7zosy1+hwE4iToElxnCsfAZ1jqv5LaJhE/OmnEFNuOVwFSp+guyMvNCchRnsLWX
 1noGlrxZc34Q==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="630331526"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 23:46:46 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
 <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
Message-ID: <6adf9658-25b7-16ef-4b88-fa3911d06b74@linux.intel.com>
Date: Tue, 18 May 2021 08:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/17/21 11:46 PM, Thomas Hellström wrote:
>
> On 5/17/21 3:11 PM, Christoph Hellwig wrote:
>> On Mon, May 17, 2021 at 04:09:42PM +0300, Serge Belyshev wrote:
>>> Christoph Hellwig <hch@lst.de> writes:
>>>
>>>> As an ad-hoc experiment:  can you replace the call to remap_pfn_range
>>>> with remap_pfn_range_notrack (and export it if you build i915 modular)
>>>> in remap_io_sg and see if that makes any difference?
>>> That worked, thanks -- no artifacts seen.
>> Looks like it is caused by the validation failure then.  Which means the
>> existing code is doing something wrong in its choice of the page
>> protection bit.  I really need help from the i915 maintainers here..
>
> Hmm,
>
> Apart from the caching aliasing Mattew brought up, doesn't the 
> remap_pfn_range_xxx() family require the mmap_sem held in write mode 
> since it modifies the vma structure? remap_io_sg() is called from the 
> fault handler with the mmap_sem held in read mode only.
>
> /Thomas

And worse, if we prefault a user-space buffer object map using 
remap_io_sg() and then zap some ptes using madvise(), the next time 
those ptes are accessed, we'd trigger a new call to remap_io_sg() which 
would now find already populated ptes. While the old code looks to just 
silently overwrite those, it looks like the new code would BUG in 
remap_pte_range()?

/Thomas




>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
