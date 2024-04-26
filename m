Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA28B37AF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 15:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8509411238A;
	Fri, 26 Apr 2024 13:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ6iEWDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A96112387;
 Fri, 26 Apr 2024 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714136441; x=1745672441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TPvoHDOw8CFxIt1QPp+dGjLmg/3zeloSgEPwTuPDsi4=;
 b=fQ6iEWDuRJNfMTeAZzTMZ/v5qaCkjfkRp7mh8RTwhLeZqC5e2Q822U82
 kJbSDBLkLHA1F60D5ZLo8Z/yEu7VFWlVs0FCEXbpxhV9ce/e7k7PzcrH3
 eetM5ahefH485dFMeqbvVRDQlXZGi2SDlhyRsLUPlRdKAynBn0wKB3sB9
 uEOTa/fMpnX3s1spEeC5EzEfKSRAhwLW/qrztf1NRSjUII96sao1XKa2e
 mVyuRO0KF0q7u5i3K9yO4sNg4L6tTZUMII3vdoGeuXkaimPuRyzS6K2l/
 YaRp0ukh0euNhGfqX9RsO9lLD69OxCG22fjVzZgRlO9HwEr11kmFBkeMy Q==;
X-CSE-ConnectionGUID: Cgfeq6m6SMSPvOWwiZm6sg==
X-CSE-MsgGUID: atL/F68ITr2zRS5eH0PEvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32367540"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="32367540"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:00:41 -0700
X-CSE-ConnectionGUID: A0QywIJQQb2Rhwx6FrVzBA==
X-CSE-MsgGUID: HASdl/FnQ9uBd7jcKjAcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25491521"
Received: from unknown (HELO intel.com) ([10.247.119.98])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:00:31 -0700
Date: Fri, 26 Apr 2024 15:00:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@kernel.org>, Gnattu OC <gnattuoc@me.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine
 resets
Message-ID: <ZiulZZ_X1SEF8vVE@ashyti-mobl2.lan>
References: <20240426000723.229296-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426000723.229296-1-andi.shyti@linux.intel.com>
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

Hi,

On Fri, Apr 26, 2024 at 02:07:23AM +0200, Andi Shyti wrote:
> We missed setting the CCS mode during resume and engine resets.
> Create a workaround to be added in the engine's workaround list.
> This workaround sets the XEHP_CCS_MODE value at every reset.
> 
> The issue can be reproduced by running:
> 
>   $ clpeak --kernel-latency
> 
> Without resetting the CCS mode, we encounter a fence timeout:
> 
>   Fence expiration time out i915-0000:03:00.0:clpeak[2387]:2!
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895
> Fixes: 6db31251bb26 ("drm/i915/gt: Enable only one CCS for compute workload")
> Reported-by: Gnattu OC <gnattuoc@me.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+

based on the discussion on the issue and as agreed with Gnattu:

Tested-by: Gnattu OC <gnattuoc@me.com>

Thank you again, gnattu,
Andi
