Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7588388704
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 07:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876D76EA38;
	Wed, 19 May 2021 05:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8A56E928;
 Wed, 19 May 2021 05:52:01 +0000 (UTC)
IronPort-SDR: Ydo+obfDwQnFdFOcxXD/7N4nPoW/cUmckvg7QDWebIfzf/Xh/0ZzxjNT6InivmSJKJ3C4tyDxX
 Ux9WN2V7/O/g==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200591789"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="200591789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 22:52:00 -0700
IronPort-SDR: bsmntiYDgDjdyOsRgCHKijC45Hwgr2cG1dWGAJjSezNCb8JW+Qm4sMcYZIyvemyybZIoOT7s80
 qJZK2t3ie0OQ==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="627483643"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.222])
 ([10.249.254.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 22:51:58 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
To: Christoph Hellwig <hch@lst.de>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
 <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
 <20210518132333.GC2617@lst.de>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1d6cc36a-cce9-92d3-4ca9-67d1450232a3@linux.intel.com>
Date: Wed, 19 May 2021 07:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518132333.GC2617@lst.de>
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 3:23 PM, Christoph Hellwig wrote:
> On Mon, May 17, 2021 at 11:46:35PM +0200, Thomas Hellström wrote:
>> Apart from the caching aliasing Mattew brought up, doesn't the
>> remap_pfn_range_xxx() family require the mmap_sem held in write mode since
>> it modifies the vma structure? remap_io_sg() is called from the fault
>> handler with the mmap_sem held in read mode only.
> Only for vma->vm_flags, and remap_sg already asserts all the interesting
> flags are set, although it does not assert VM_IO.
>
> We could move the assignment out of remap_pfn_range_notrack and
> into remap_pfn_range and just assert that the proper flags are set,
> though.

That to me sounds like a way forward. It sound like in general a gpu 
prefaulting helper that in the long run also supports faulting huge ptes 
is desired also by TTM. Although it looks like that BUG_ON() I pointed 
out was hit anyway....

/Thomas


