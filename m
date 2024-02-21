Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C785D356
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A2910E4E6;
	Wed, 21 Feb 2024 09:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIi4y1i1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECAC10E4B4;
 Wed, 21 Feb 2024 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507289; x=1740043289;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IfIFt7mNYdvSQFxn1+hm8ApCRXU2kEobnuEsdtr9wlA=;
 b=mIi4y1i1akE1E+kOwz98fy7VGQm5s7xjYfEdIF30N1ss1qodVxyntusO
 15ibm6kmY6WI2kSFjoWHOjn5o9VKAYGFa8xI9pZjx7cunUPeV/ZYWwRGd
 D5wap/RIEFb0LG26s/FevkWAnzk+sjd1l4gvQm5I70QIJq2wHePRH7fVL
 S2wC89oIi145XlEl+nY+U1LvrWMiEsVIJR7fdDol0uvJqTWRMkcOza5Zc
 a9Lt2ATGz8rGWl74iC6gtKMlW62HEhMZiJM6rM7VoBGgSBBzf2d1s/2n5
 Pj9ejgIH/nAi9Ck8lRLtyQhh5T8mH6DCRWZrIqPqiaegw3knmGFRo81dZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2525444"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2525444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5434789"
Received: from conorwoo-mobl1.ger.corp.intel.com (HELO [10.252.22.137])
 ([10.252.22.137])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:21:16 -0800
Message-ID: <47925d46-60f1-406e-93e1-88105075ebd9@intel.com>
Date: Wed, 21 Feb 2024 09:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix an invalid freeing on already freed page in
 error path
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
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

On 21/02/2024 07:33, Thomas Hellström wrote:
> If caching mode change fails due to, for example, OOM we
> free the allocated pages in a two-step process. First the pages
> for which the caching change has already succeeded. Secondly
> the pages for which a caching change did not succeed.
> 
> However the second step was incorrectly freeing the pages already
> freed in the first step.
> 
> Fix.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.4+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
