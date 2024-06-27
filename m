Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E714491A366
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87DE10E1C3;
	Thu, 27 Jun 2024 10:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGAEUdU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CCD10E1C3;
 Thu, 27 Jun 2024 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719482646; x=1751018646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cu54Tk2zebV8/VPaAZuwCN5IDWznDXVc0BnQGYT2nNo=;
 b=dGAEUdU1iWWf7KOQEi/2ACNjccpR6Br7DoSZl8gHrbFc1oOwTYkdPzXb
 WbolO9HcAn25/F0mdI8ppz7YDPv5jOgdy4fIMs3VvaX+ZI+GzRnY7nGFs
 KP2R1EcIvrESfFHFdpJCUqeM1s7bTBySgaL9D2oxztn9zwj8lsMdI3P1F
 gYwP/eIvfou/cfEoVRKAraY8cWdTOvRUXUgeVr7lQmOrWLzPpmr1h2gq+
 HBnnv7HOiVqRfgcqDsYMrm394YUtmyKG4Kwi6YmvRuRD+0ro5goJBBo+/
 6qzKeb7q/+Mnr2UhNkVsH2nm0MCqeJN35H/Q1imagoTh1RZhfeVldhFxg Q==;
X-CSE-ConnectionGUID: cjnYDZwxTTGjSqTNHhNaKQ==
X-CSE-MsgGUID: 9/TwV4PAQCW5s1obHlemNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20366737"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20366737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 03:04:06 -0700
X-CSE-ConnectionGUID: RnwO2tHURqCmMgSSUQ4eqg==
X-CSE-MsgGUID: ttXRkAx8TmmbhmsfyQ8Tkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="45076340"
Received: from slindbla-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.151])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 03:04:04 -0700
Date: Thu, 27 Jun 2024 12:04:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM
 to userspace
Message-ID: <Zn05EPD0PRLdUmuj@ashyti-mobl2.lan>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626143318.11600-1-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:
> We report object allocation failures to userspace with ENOMEM
> so add __GFP_NOWARN to remove superfluous oom warnings.

I think this should be the default behavior. ENOMEM doesn't
necessarily mean that there is a kernel failure. Most of the time
we just run out of memory, deal with it :-)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
