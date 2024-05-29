Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790368D34AD
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347FD10E4BB;
	Wed, 29 May 2024 10:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dp9sNQ4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0FE10E4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716979103; x=1748515103;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cLzGLezx4OcVFC1h6nQACrdR8UdhITeiXu3SgRIMgLk=;
 b=dp9sNQ4r8tOLN009r7pLWEuIJTXsnvqZtf2uQNP16vBQnuwW144J2El/
 q02L3YI8TbWtdO52Zx06Pfa3nbx/j4NwmdJFZ+B58ygqVHB1zrTsJgFD4
 adERhSNOm+XFjdRQ0BMB9wfsd84rwbY33/T0oRtOc2DIHdpPYgIbI+LvN
 kFUl+76e4uuHEucpdRjNmhUm6tGuEpLbbZ8F4KzOs4a6K7IjWpItHcbZY
 8MW+u/vajGlsWomjmiiHR06qaU/vL+MlC7NxtBhy0PKEoBNdnh2I1lygc
 biyGH1/U3ChSKNhSWfQEIIl+g+aGAoV/z+lc0Sd9TcQFJ9y/tckQ+nXZA Q==;
X-CSE-ConnectionGUID: ANQ0A8mwSaqrjJW/FexTpQ==
X-CSE-MsgGUID: YhEv7vUlS/+GfOib3JNnkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13146008"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13146008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 03:38:22 -0700
X-CSE-ConnectionGUID: sSXEnsC8TeWRCvQdC4vaHQ==
X-CSE-MsgGUID: gHuBiv2OS0m8/eBp7N5yKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="39911241"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.45])
 ([10.245.245.45])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 03:38:20 -0700
Message-ID: <17a8f75e-9ddf-47ba-8cf1-036befa31f30@intel.com>
Date: Wed, 29 May 2024 11:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add a warning when drv try to reserve 0 fence
 slots
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: sumit.semwal@linaro.org
References: <20240529084322.2284-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240529084322.2284-1-christian.koenig@amd.com>
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

On 29/05/2024 09:43, Christian König wrote:
> When dma_resv_reserve_fences() is called with num_fences=0 it usually
> means that a driver or other component messed up its calculation how
> many fences are needed. Warn in that situation.
> 
> When no fence are needed the function shouldn't be called in the first
> place.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

