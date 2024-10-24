Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EB9ADF82
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 10:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0175C10E246;
	Thu, 24 Oct 2024 08:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM8x/wCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BA810E246;
 Thu, 24 Oct 2024 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729759979; x=1761295979;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DNf5vyaAy97cBjT+9ncS9FQcr815rIqZqus+axexMjE=;
 b=dM8x/wCzWjv3ExYtNGZf46WS1zrJwgUNhi+6/O+TkJdeI4uXNKyssM8g
 YozYN49fpAK18CB7gXnKoCigptcMcsbg7XHHmyGDKnY2R0kuWwqJom7RU
 dBwyed6valELfQzNxHxGS8C0s6Wx2wEhFuDcyL5xoR93is1CsjiNaMJOz
 NIA/CkZ2bSxJqh44V4yqeQRhmSN8fCWjH44BaOB4/5/2DguWnZjDpD0/K
 TIyEQtkl4vqNHeN8MFxAMWtIOcsjuW5OOliLAaJlmn7jfohHXj/VegZOh
 +8xEsBmS7rvbWVjMSN7jaaIx6ycfyHM27b0ZmTEaexjfDMOKBKLEaKInX A==;
X-CSE-ConnectionGUID: 9Pz8tHjPRcyG8cFkEMy5Yw==
X-CSE-MsgGUID: zgsgL1V1Q3GX/jW7YHfwNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="17005894"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="17005894"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:52:59 -0700
X-CSE-ConnectionGUID: lJ8oE/ByQqCLQwUyO1mlJw==
X-CSE-MsgGUID: R3VzJx5LTI+C9Y1GJIVkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80699083"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.216])
 ([10.245.245.216])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:52:57 -0700
Message-ID: <e5eb5da0-5d8b-42cb-90f1-ab2bbba09d5b@intel.com>
Date: Thu, 24 Oct 2024 09:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm/xe: Add xe_ttm_access_memory
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-4-matthew.brost@intel.com>
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

On 21/10/2024 22:18, Matthew Brost wrote:
> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> VRAM easily be accessed. Add xe_ttm_access_memory which hooks into
> ttm_bo_access to access such memory.
> 
> v4:
>   - Assert memory access rather than taking RPM ref (Thomas / Auld)
>   - Fix warning on xe_res_cursor.h for non-zero offset (Mika)
> 
> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
