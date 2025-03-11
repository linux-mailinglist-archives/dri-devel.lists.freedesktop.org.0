Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D08A5BACA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2111910E52C;
	Tue, 11 Mar 2025 08:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkzzUija";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3820D10E52B;
 Tue, 11 Mar 2025 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741681592; x=1773217592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rE3rxK7gX7D1o0nJHwWclMKXuV7wrcRx91EI3YFk3iY=;
 b=WkzzUijaYaG/Bf/W5LGGu6NmsJYRSlQvAKHkEuxGLW3hO0wyhwZyBbpo
 H40HMGsWHXNf86PG10mKP8aC/yjq0QJMT5VHEBd1wRFkK8kGP/XLVtL3+
 AlqENcFQn/yYLaGPrzEg2RO3hyZmfwQv4BSTyJHVsUAWG3+ujY1IX9lIt
 yt4bwUFpBQea7NL6S0GKJ2yvCRwvYhc8B7FTyIqeWJUt0aJhIHViyHHbU
 pW0gCrN/uj85/4o71VZBY92iPwReQzaiEmXm5eRr0VUtTvKsp6uXDpgKA
 qu1uyadWkLuNPVYTar80f3qbdx8Uzizx8AxatrUPNyAjHGD9e7V6EOclf A==;
X-CSE-ConnectionGUID: 4Qi6wg1uTOKltQQ2xPeJsA==
X-CSE-MsgGUID: 7ryPw8VJTrSqHTBFrL0riQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60256995"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="60256995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:26:31 -0700
X-CSE-ConnectionGUID: 1w8qWQymQliILtaKMYDAwg==
X-CSE-MsgGUID: +Wp5e13xRtidTTFjKFlhTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120757559"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 11 Mar 2025 01:26:30 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3F2B633BE3;
 Tue, 11 Mar 2025 08:26:28 +0000 (GMT)
Message-ID: <a48a7eb7-67a3-4bf1-a2bd-8907ccee4fc4@intel.com>
Date: Tue, 11 Mar 2025 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct
 to header
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-3-jonathan.cavitt@intel.com>
 <74c42086-2beb-429d-bf3b-6093e171aa77@intel.com>
 <CH0PR11MB544460A0C65718325C0B9656E5D62@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB544460A0C65718325C0B9656E5D62@CH0PR11MB5444.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.03.2025 22:30, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Monday, March 10, 2025 11:20 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
>>>
>>> On 10.03.2025 18:18, Jonathan Cavitt wrote:
>>>> Migrate the pagefault struct from xe_gt_pagefault.c to the
>>>
>>> nit: we use "migrate" verb for different purposes.
>>> maybe here (and in the title) the plain "move" will be better?
>>>
>>>> xe_gt_pagefault.h header file, along with the associated enum values.
>>>
>>> hmm, all other components have foo_types.h header file as place for own
>>> types and use foo.h header only for function declarations.
>>>
>>> why are we doing it differently here?
> 
> xe_gt_pagefault_types.h does not exist and would have to be created to satisfy this
> request.  It would also basically only contain the below xe_pagefault struct and its
> related enums.  Is this amenable?

it's about the idea, it doesn't matter not how many items you will put
there. You can take a look at few other "small" types.h files:

$ ls -S -1 *types.h | tail -5
xe_ring_ops_types.h
xe_huc_types.h
xe_gt_stats_types.h
xe_sa_types.h
xe_bb_types.h



