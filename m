Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149484067F6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 09:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54E86E980;
	Fri, 10 Sep 2021 07:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D5E6E981
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 07:46:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="208246500"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="208246500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 00:46:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="696993757"
Received: from gjanssen-mobl5.ger.corp.intel.com (HELO [10.249.254.69])
 ([10.249.254.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 00:46:41 -0700
Subject: Re: i915 ttm_tt shmem backend
To: Matthew Auld <matthew.william.auld@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <c5edb73d-72fc-6cef-2735-9e6af55a8bd9@linux.intel.com>
Date: Fri, 10 Sep 2021 09:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/9/21 4:56 PM, Matthew Auld wrote:
> Hi Christian,
>
> We are looking into using shmem as a ttm_tt backend in i915 for cached
> system memory objects. We would also like to make such objects visible
> to the i915-gem shrinker, so that they may be swapped out or discarded
> when under memory pressure.
>
> One idea for handling this is roughly something like:
> - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
> - Skip the ttm_pages_allocated accounting on such objects, similar to
> how FLAG_SG is already handled.
> - Skip all the page->mapping and page->index related bits, like in
> tt_add_mapping, since it looks like these are set and used by shmem.
> Not sure what functionally this might break, but looks like it's maybe
> only driver specific?

IIrc the page->mapping and index is needed when doing dirty-tracking 
using mkwrite and by vmwgfx at some point when doing fb_defio on top of 
TTM buffers. I don't think vmwgfx does that anymore, but it still does 
dirty-tracking.

/Thomas


