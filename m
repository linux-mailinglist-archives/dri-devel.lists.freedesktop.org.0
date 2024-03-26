Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45088C067
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B824D10EE9F;
	Tue, 26 Mar 2024 11:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpcAa4jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC0010EE9B;
 Tue, 26 Mar 2024 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451830; x=1742987830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8jb3qSnufiFklEZkNhDR7SohJuFcX5/Hoy/I8AeFY5M=;
 b=SpcAa4jQyfAQmPCr3qPEZnwrU6cdMWN3dGaCJ6y5IiQyE0s3qNXU1JmV
 GByVSAKvjgt0C9K9Vz/bEOR7/r4E0TNAFKa4MpqZEU9MhuOaxz/8v7gIy
 +QHIbNl2K+uP1OsCtgEGBjKeYJWRdoz2K4ZrFml/ufudc+DC5oXg10xG0
 LWcmPKYxSDSw05KTVssP7DBVzJf9F+ZLb3Og+vjgAat7vGlGwwKchjyUf
 krbuH5DB13qUpShnKzeBrz92R4FJD8dM6wC9RcMrPVm3HNPgJLyn7cbpT
 S2zClWmL0YCUNHHuiyqAAuQBjwswjUIhEx7FbLaGoIIJ/ssWFBygRsCnc A==;
X-CSE-ConnectionGUID: ePm2TuWsTuOt1Mi1U63cbw==
X-CSE-MsgGUID: iWQXiDcKRFGPpXDTRUoc8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6604848"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6604848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20585628"
Received: from unknown (HELO intel.com) ([10.247.118.204])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:17:00 -0700
Date: Tue, 26 Mar 2024 12:16:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v7 0/3] drm/i915: Fix VMA UAF on destroy against
 deactivate race
Message-ID: <ZgKupuWGSaAqHxW0@ashyti-mobl2.lan>
References: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

On Tue, Mar 05, 2024 at 03:35:05PM +0100, Janusz Krzysztofik wrote:
> Object debugging tools were sporadically reporting illegal attempts to
> free a still active i915 VMA object when parking a GT believed to be idle.
> 
> [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0

...

pushded to drm-intel-gt-next.

Thanks,
Andi
