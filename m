Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551994CEE9B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 00:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E07810E058;
	Sun,  6 Mar 2022 23:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896310E058;
 Sun,  6 Mar 2022 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646610121; x=1678146121;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=ms8fEHLgOxSSRVUWFcxRUAylSAFNrqV0pk+t2bhqEvo=;
 b=H9A6S1Xz2shq/6CtvJYfHnx3hv7W+VYWttrBVbzWPk8bJ3LPPwwk9xl1
 MgRwgakynUElW9RTDoQzFLBXTIWhQNYdUalJK7zepP7zVmdyPz9eddEpO
 lKaKaSZLfx+CbBXUllWa5AVvZm4etTxfp5Su6UQnT/m8022vEmYy0glcp
 LFU1AWAdSOy7Cu71fDW+R3PbS4kHYSPh8vgLblL99v/qgMGcH67NyAT9u
 YTxygB4rObiQx52hz/jEeZjeZA2wbA11pNkTZsf9JNctBJndU3XBjCHrl
 3tA+mqlxLtMnyUl9fDRNQo+TIYIw45kR1Ck9cLCN9HtPGaTmgmYHQvfB7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="241698545"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="241698545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:42:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="552917258"
Received: from nraghura-mobl2.amr.corp.intel.com (HELO [10.209.12.153])
 ([10.209.12.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:42:00 -0800
Message-ID: <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com>
Date: Sun, 6 Mar 2022 15:41:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Jarkko Sakkinen <jarkko@kernel.org>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
In-Reply-To: <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: codalist@telemann.coda.cs.cmu.edu, jaharkes@cs.cmu.edu,
 Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/6/22 15:24, Andrew Morton wrote:
> On Sun,  6 Mar 2022 05:26:55 +0200 Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
>> Sometimes you might want to use MAP_POPULATE to ask a device driver to
>> initialize the device memory in some specific manner. SGX driver can use
>> this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
>> page in the address range.
> Why is this useful?  Please fully describe the benefit to kernel users.
> Convince us that the benefit justifies the code churn, maintenance
> cost and larger kernel footprint.

In short: page faults stink.  The core kernel has lots of ways of
avoiding page faults like madvise(MADV_WILLNEED) or mmap(MAP_POPULATE).
 But, those only work on normal RAM that the core mm manages.

SGX is weird.  SGX memory is managed outside the core mm.  It doesn't
have a 'struct page' and get_user_pages() doesn't work on it.  Its VMAs
are marked with VM_IO.  So, none of the existing methods for avoiding
page faults work on SGX memory.

This essentially helps extend existing "normal RAM" kernel ABIs to work
for avoiding faults for SGX too.  SGX users want to enjoy all of the
benefits of a delayed allocation policy (better resource use,
overcommit, NUMA affinity) but without the cost of millions of faults.

That said, this isn't how I would have implemented it.  I probably would
have hooked in to populate_vma_page_range() or its callers.
