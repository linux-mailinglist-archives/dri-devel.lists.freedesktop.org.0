Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44884E459E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 18:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B1D10E040;
	Tue, 22 Mar 2022 17:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99DB10E03D;
 Tue, 22 Mar 2022 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647971859; x=1679507859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y/SVYNq3OgrSl0T6rsz7bBi51HhC4nf67uCMOIz9LTQ=;
 b=SusmEXx39K5GuaxOPRlkBd+0SfPi5mrhlaim+BuHYy69BPEaNnGDB+es
 5fvOuR7WKFliICeD1sYj6alLiUPyTubNGfAW8K08S875E5fsO/3qPHy4y
 EeIn0vIvMTuW4OmJc/4dy0z7dq+AJ7E38QXirlW3dy3HRnLHrawXt0eiU
 2nOsQMhuNrZeH7YUeXm82xtLJVZqaLgpfDZnm0D3Kel8GAgGMzOkIKKAh
 LFJydCdbV7XHbtZC/+wqeiJtz6X8ZfPAPXZOgBvOv2/VaCgehpze+/6hw
 Nv/sOi2+mEPIKQobFrtbD2nW40dE/n6PAlbCwGqlIIDC1RrKNFBMzUie/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240060815"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="240060815"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="647134671"
Received: from rtsao-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.134.54])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:57:38 -0700
Date: Tue, 22 Mar 2022 10:57:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v13 00/13] Add GuC Error Capture Support
Message-ID: <20220322175738.nsnodgjurjqj4j3s@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220321164527.2500062-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220321164527.2500062-1-alan.previn.teres.alexis@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 09:45:14AM -0700, Alan Previn wrote:
>This series:
>  1. Enables support of GuC to report error-state-capture
>     using a list of MMIO registers the driver registers
>     and GuC will dump, log and notify right before a GuC
>     triggered engine-reset event.
>  2. Updates the ADS blob creation to register said lists
>     of global, engine class and engine instance registers
>     with GuC.
>  3. Defines tables of register lists that are global or
>     engine class or engine instance in scope.
>  4. Updates usage and buffer-state data for the regions
>     of the shared GuC log-buffer to accomdate both
>     the existing relay logging of general debug logs
>     along with the new error state capture usage.
>  5. Using a pool of preallocated memory, provide ability
>     to extract and format the GuC reported register-capture
>     data into chunks consistent with existing i915 error-
>     state collection flows and structures.
>  6. Connects the i915_gpu_coredump reporting function
>     to the GuC error capture module to print all GuC
>     error state capture dumps that is reported.
>
>This is the 13th rev of this series where the first 3 revs
>are RFC
>
>Prior receipts of rvb's:
>  - Patch #2, #3, #4, #5, #10, #11, #12, #13 have received
>    R-v-b's from Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>  - Patch #1, #6, #7, #8, #9 has received an R-v-b from Matthew Brost
>    <matthew.brost@intel.com>. NOTE: some of these came in on the
>    trybot series. https://patchwork.freedesktop.org/series/100831/
>
>Changes from prior revs:
>  v13:- Fixing register list definition styling as per Jani's request.

As in v12, the CI failure in display is unrelated to these changes.

Applied to drm-intel-gt-next.

Thanks
Lucas De Marchi
