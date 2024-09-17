Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1670B97AB7F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 08:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C17D10E41E;
	Tue, 17 Sep 2024 06:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cyt7RJFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8281910E41D;
 Tue, 17 Sep 2024 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726555135; x=1758091135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ovakHI+5hxMM6lDBdLL5PtuytVZMVZ9K7kitq+za504=;
 b=Cyt7RJFwGmCpssVP8nA2Rbr+3WV5YbWyhDxPqvQcyl2rkY5DgAVWLV6H
 L/xR3Wf+1ULgYFC2BZ0umz5/QHuznx83RR65ZOu34aW/GKh/NCfu5J9iJ
 8a2my9gUSUOVhOGurK0ti/2ZTvJ39GdpLqU9AJGfgQVLvKp6j4av04+OL
 nLJPlxkRtHpRHLzgujgcIIYvKAUT6ED6ts6gPXg5MkQ2tV5x24ffu6OIj
 nIt+lvwcoLjRezYAe0JQWtMsdGiLDGBR4nlblwqiz8AQ4CD9PingDd4Og
 syZL+a/Dccp+/oQYDtVGwnJN71bq3bNXCOKSK42uNFUBGqLIf2injHzWw w==;
X-CSE-ConnectionGUID: tyXL4ZdFSQO9HCS+O9RkrA==
X-CSE-MsgGUID: woUhfn6uQyuSwKsQMzbheg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="35978456"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="35978456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 23:38:55 -0700
X-CSE-ConnectionGUID: Twmu32d6TzmzT2NuZs1V2Q==
X-CSE-MsgGUID: D9li99gzT2+xXU84s6XKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="99780153"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 23:38:50 -0700
Date: Tue, 17 Sep 2024 09:38:47 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v5 3/4] drm/xe: Use device wedged event
Message-ID: <Zukj9y2oZve73NLy@black.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-4-raag.jadav@intel.com>
 <86908889-2628-44b8-a2e3-af700217df50@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86908889-2628-44b8-a2e3-af700217df50@intel.com>
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

On Tue, Sep 17, 2024 at 10:11:05AM +0530, Ghimiray, Himal Prasad wrote:
> On 17-09-2024 09:32, Raag Jadav wrote:
> > This was previously attempted as xe specific reset uevent but dropped
> > in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> > as part of refactoring.
> > 
> > Now that we have device wedged event supported by DRM core, make use
> > of it. With this in place userspace will be notified of wedged device,
> > on the basis of which, userspace may take respective action to recover
> > the device.
> 
> 
> As per earlier discussions, the UAPI was also supposed to provide the reason
> for wedging( which is supposedly used by L0). IS that requirement nomore in
> place ?

Wondering how does that contribute to the usecase?

Raag
