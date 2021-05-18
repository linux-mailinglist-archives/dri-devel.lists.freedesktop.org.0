Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B99387A0B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44DE89DD2;
	Tue, 18 May 2021 13:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303289BCD;
 Tue, 18 May 2021 13:33:18 +0000 (UTC)
IronPort-SDR: REJFHNw8bJZMcXmu5OdBqejeleYUWjZhc6lI8KJA3SWV8ViZx3vBmZ3nYujBxrEGXlHEW2up3S
 uPxfTjGCOufA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="221764010"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="221764010"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:33:18 -0700
IronPort-SDR: JD1KVpOLoXzO9+IeWZmr5Vy+CCysqoXN/qIswodanwS1ndGx6ikR3RlmKh+B7FFgVag35gnd6F
 JHMYFcFN+NuQ==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="438664467"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:33:16 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
To: Christoph Hellwig <hch@lst.de>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
 <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
 <6adf9658-25b7-16ef-4b88-fa3911d06b74@linux.intel.com>
 <20210518132428.GD2617@lst.de>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <114520ed-6d61-a2a1-b753-fb169ef6ecea@linux.intel.com>
Date: Tue, 18 May 2021 15:33:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518132428.GD2617@lst.de>
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


On 5/18/21 3:24 PM, Christoph Hellwig wrote:
> On Tue, May 18, 2021 at 08:46:44AM +0200, Thomas Hellström wrote:
>> And worse, if we prefault a user-space buffer object map using
>> remap_io_sg() and then zap some ptes using madvise(), the next time those
>> ptes are accessed, we'd trigger a new call to remap_io_sg() which would now
>> find already populated ptes. While the old code looks to just silently
>> overwrite those, it looks like the new code would BUG in remap_pte_range()?
> How can you zap the PTEs using madvise?

Hmm, that's not possible with VM_PFNMAP. My bad. Should be OK then.

/Thomas


