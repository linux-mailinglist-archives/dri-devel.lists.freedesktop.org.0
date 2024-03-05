Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B956872014
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D510E8C3;
	Tue,  5 Mar 2024 13:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW7R7ZRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF1810E070;
 Tue,  5 Mar 2024 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709645207; x=1741181207;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yXNm14NxN++hrLExbM8fzKn8NTqUH42Iaz49C2BIFwY=;
 b=AW7R7ZRdYCFtdhJV7xLCz4QsPJL2luSncPkFmXTjsmlbxr9RXcn5O4Ns
 Z2CqSLKzn7dVRkTUzYiozZ6d76RoQoPE9yHm4gu8SPLzRU1CKq3y3smtA
 ayM4lJqVUfJr6UPjhGQWvgti5bEdrwOekcVb4+ryGUznYR+KCMot0P3Iu
 Ys8riaZA4dtrWDvd6AzSRXe9jesYREMsqXsg0fJFF1NA3PzsL+nENueH6
 9iA8iO7EEe4day959G5W7Rajxhyl7YWk5bWfkrqOhgT5aoh/4yOgOXTS/
 vSlcU8QPBvMaeyjbADUrcQK/Xt2G+gWUKrLJOqOQALOjxoCgnZjuat1Ve g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7140296"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7140296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="46909850"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:26:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: duoming@zju.edu.cn
Cc: Timur Tabi <timur@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/dmem: handle kcalloc() allocation failure
In-Reply-To: <601512f5.b287.18e0ebb25d4.Coremail.duoming@zju.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240303081330.61091-1-duoming@zju.edu.cn>
 <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
 <87y1ay42ir.fsf@intel.com>
 <601512f5.b287.18e0ebb25d4.Coremail.duoming@zju.edu.cn>
Date: Tue, 05 Mar 2024 15:26:41 +0200
Message-ID: <87a5nc3j3i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 05 Mar 2024, duoming@zju.edu.cn wrote:
> On Mon, 04 Mar 2024 14:14:52 +0200 Jani Nikula wrote:
>> >> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
>> >> the physical memory has run out. As a result, if we dereference
>> >> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
>> >> will happen.
>> >>
>> >> This patch uses stack variables to replace the kcalloc().
>> >
>> > Won't this blow the stack?  And why not just test the return value of
>> > kcalloc?
>> 
>> VLAs should not be used in the kernel anymore. Building this results in
>> a warning due to -Wvla. See 0bb95f80a38f ("Makefile: Globally enable VLA
>> warning").
>> 
>> Error checking and propagation is the way to go.
>
> The GPU is going away. If the kcalloc() in nouveau_dmem_evict_chunk() fail,
> we could not evict all pages mapping a chunk. Do you think we should add a
> __GFP_NOFAIL flag in kcalloc()? I see the __GFP_NOFAIL flag is used in the
> following code:
>
> /*
> * _GFP_NOFAIL because the GPU is going away and there
> * is nothing sensible we can do if we can't copy the
> * data back.
> */
> dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);

This is all up to the nouveau maintainers, really. All I'm saying is
that VLA isn't the solution you're looking for.

BR,
Jani.


-- 
Jani Nikula, Intel
