Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D3594CEED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6DD10E8AD;
	Fri,  9 Aug 2024 10:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf/t3MLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0E110E8A8;
 Fri,  9 Aug 2024 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723200366; x=1754736366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C/bEpF3uJUy0adiwUzePhmER0/b3YSDURgaN+lGaPgw=;
 b=mf/t3MLr5lKq3gytICRirK7ZLFz2Y6uqFbariUO38AM6N3kYMjUUTtqB
 PfB7pXQJpGS5ARXjvjbggk1lPMIguVE6fXzJ9RnxL3xYxzYrMxP8itHZa
 o4q61EpQpV/moPxWkGJAA+C9E2u6bSnFodjFCBZpbrib5VYYXSbNZ57k2
 gzWq7DPvZmF65mxdEIruZ0kQDOB0iXWeCq/fuvxmucQmVZeNsee8/aQ52
 rz7/w9UTaLx15u3VNPWMJMZBU7QHqwaOEjt8XAEQrz2PLLyzXrXTnm5g5
 IudM5dbQ2O/s0KXWPRggwfkdkoFmsKABuQN+RTqlsdO+weCC/rOw/3cy1 A==;
X-CSE-ConnectionGUID: qOC/t0aHQlSr8kG7nn01wg==
X-CSE-MsgGUID: hr8///uWRAqEG1a7rqnSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38875382"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="38875382"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:46:05 -0700
X-CSE-ConnectionGUID: vb79Ctc9Qgydlze82YicKA==
X-CSE-MsgGUID: +E39iGpAS8O3hPOxy/3z8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="80768750"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.147])
 ([10.245.245.147])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:46:04 -0700
Message-ID: <b8a2a796-719d-48db-b474-a39feb50975e@intel.com>
Date: Fri, 9 Aug 2024 11:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/xe/migrate: Parameterize ccs and bo data clear
 in xe_migrate_clear()
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240719095506.4068-1-nirmoy.das@intel.com>
 <20240719095506.4068-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240719095506.4068-2-nirmoy.das@intel.com>
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

On 19/07/2024 10:55, Nirmoy Das wrote:
> Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
> layers can utilize. This patch will be used later on when doing bo data
> clear for igfx as well.
> 
> v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
> v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
>      xe_migrate.h. other nits(Matt B)
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Seems reasonable to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
