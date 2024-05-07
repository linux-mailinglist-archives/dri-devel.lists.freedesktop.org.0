Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CD8BDD33
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599BF10EF3D;
	Tue,  7 May 2024 08:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9AxKNSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AFF10ECAF;
 Tue,  7 May 2024 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715070943; x=1746606943;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=adPecvh6XicHiVlJ3l0V8IW7dQhEFqjHV+LGw10si6s=;
 b=P9AxKNSvqtLBJgRABIDth0kGf/9jXNKCFCOXGWfv29o7facslrNpyYNJ
 J9PvrYTOi4UpU3MGKuJto/yZ82QV9D7p3EKNXrd4zaBS3vFJ5Geg/tKQ5
 iP1M+vECK9fqrQodQef4ZNJR9Hx5PvRUhAulUf7ah5tWAJ0OztNIN/4KT
 ddl6TP/aK5GxSANFiHxXnLq+MP4k7ooBaxUebjhYeKSfG1p7xDaSEipx/
 wE2mUjM8DbpairSMCr5SlNrNxtYykfbuRwfEk+MLB3v+Ypawi57WKW54O
 8dfQohLJJFJuZNQK4il6PH/vL1d1wjwk2oc+QU2eIas2Z+5mO8jiir6QI A==;
X-CSE-ConnectionGUID: uMg0OxS8S/KpUuO0o+tmpQ==
X-CSE-MsgGUID: L5WrhOV1T16rYA2XtGbLgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10780352"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="10780352"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 01:35:42 -0700
X-CSE-ConnectionGUID: uMKiV9m3TSGNF12kNkykIw==
X-CSE-MsgGUID: JjOMukMdTUudQw0V0LoYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33274432"
Received: from unknown (HELO [10.245.245.158]) ([10.245.245.158])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 01:35:41 -0700
Message-ID: <47cf36e6-024e-4c65-9317-2e8abe40bd2f@intel.com>
Date: Tue, 7 May 2024 09:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix the range bias clear memory allocation
 issue
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com
References: <20240506133846.4362-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240506133846.4362-1-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2024 14:38, Arunpravin Paneer Selvam wrote:
> Problem statement: During the system boot time, an application request
> for the bulk volume of cleared range bias memory when the clear_avail
> is zero, we dont fallback into normal allocation method as we had an
> unnecessary clear_avail check which prevents the fallback method leads
> to fb allocation failure following system goes into unresponsive state.
> 
> Solution: Remove the unnecessary clear_avail check in the range bias
> allocation function.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


