Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7358C82C8
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 10:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33E810E9E2;
	Fri, 17 May 2024 08:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWTZNyTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8753610E155
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715936016; x=1747472016;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=svsHKvuGdbupY/mwuao5EtigRi0g0dX4+ltOW+GcCgs=;
 b=gWTZNyTBjyDP6DHEDY30zjdzPbrrj84fiab+R4JvUXfQZ4i74sbXmx6/
 QYU2k4CYWwCU4qvC1Vvuy9m1Nr1L+4ABEBiZewCFA785NBorMOmYugKja
 gCGwzN0elwRVb1MSaN/w5nnZV4ubbKvK98r3vPguD2B+wbRV15uer5rXd
 Ggpr9umu7OZNz3/qscGfiHGVR5VUREWyFqaggqQ/TNa6CVEhpQxI+xCeP
 lNsLArv3IMySsuviFNBBah6CKNcsoLIcrFtMnszm1G/kXOPkTvTLMxHDp
 fZAN7b7x5p+gyr5GZ45fAxkslch/rrfOwz2YTcT99hsrxq1wPqA8h5+IE Q==;
X-CSE-ConnectionGUID: /ECKgyRbTvSrqa8hE4h/tA==
X-CSE-MsgGUID: moDjxaT/RkGa/Aub3Yqqbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12043987"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12043987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 01:53:35 -0700
X-CSE-ConnectionGUID: fSpAwg2jQxCH/jb1Gxfo3g==
X-CSE-MsgGUID: 5o4zXKHeQJqnNjRlmeAmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36629444"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 01:53:33 -0700
Message-ID: <3ef0fe56-f488-452a-9d35-dc081bf59816@intel.com>
Date: Fri, 17 May 2024 09:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
To: Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240229105112.250077-3-matthew.auld@intel.com>
 <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
 <CAPM=9tyNrCsT27bvAVUcee-UME7568hZvU18m0k3OSopzUGaCA@mail.gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CAPM=9tyNrCsT27bvAVUcee-UME7568hZvU18m0k3OSopzUGaCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/05/2024 02:11, Dave Airlie wrote:
> On Thu, 29 Feb 2024 at 23:48, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Thu, Feb 29, 2024, at 11:51, Matthew Auld wrote:
>>> The drm_buddy minimum page-size requirements should be distinct from the
>>> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
>>> least 4K.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Has this landed anywhere yet?

Looks like it fell through the cracks. I think it still applies, so just 
needs someone with commit rights to push it.

> 
> I'm been testing 6.9 on 64K pages and the buddy tests are exploding so
> I wanted to pull this in.
> 
> Dave.
