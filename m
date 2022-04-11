Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19754FB80C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19710FA06;
	Mon, 11 Apr 2022 09:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37BE10FA05;
 Mon, 11 Apr 2022 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670480; x=1681206480;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M71gBGGg3XR4HT6P8C26gvTsRIXuF9IEkb2c1AATyX4=;
 b=gLfrDFQ2FVw3KYp2Sj+BzIYg+xfgxmTTrcJp2rbSVdHdOpGP4DEeMiKO
 sXDrJrGbhXw6lXfPW3e3017AmVQ6Li1g8tpNYWt6q4IIi44kbCvOB+9Wl
 ZDWX2QcG1j2NEdUpKQ8C7psa3it/6Gf4fU+BQXqKLygRuaRHXGKLA2phq
 waQygwvg+4OHguSjhQ5NhAWnXxe0hK6tF0kg4w938od2khhi4qX4QJUHL
 zqaTbxkTuO6v0TWgk3ZJ5djRv4aAvDMiqtdUEVbpcVaJsqe/Vw2hdir7x
 ZNe7gIrhrDacdywKnc8IADPfBactwX4vltUAIFndcs0dElnUb8yurOxX1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="287085159"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="287085159"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="644022554"
Received: from dxharrix-mobl.ger.corp.intel.com (HELO [10.252.1.119])
 ([10.252.1.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:57 -0700
Message-ID: <9ecac65c-84d9-9965-4fd3-f86ea572bb9d@intel.com>
Date: Mon, 11 Apr 2022 10:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm: add a check to verify the size alignment
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 08:38, Arunpravin Paneer Selvam wrote:
> Add a simple check to reject any size not aligned to the
> min_page_size.
> 
> when size is not aligned to min_page_size, driver module
> should handle in their own way either to round_up() the
> size value to min_page_size or just to enable WARN_ON().
> 
> If we dont handle the alignment properly, we may hit the
> following bug, Unigine Heaven has allocation requests for
> example required pages are 257 and alignment request is 256.
> To allocate the left over 1 page, continues the iteration to
> find the order value which is 0 and when it compares with
> min_order = 8, triggers the BUG_ON(order < min_order).
> 
> v2: add more commit description
> v3: remove WARN_ON()
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

