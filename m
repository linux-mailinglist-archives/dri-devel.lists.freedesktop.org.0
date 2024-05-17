Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CE8C8CD7
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259110EF5A;
	Fri, 17 May 2024 19:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIW6oGTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4124610EF48;
 Fri, 17 May 2024 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715974482; x=1747510482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U2uvOSMVvYWNr41TW0YeBIcZUiwalMj2dRR+y0sGUJM=;
 b=gIW6oGTOA2MJ3VoDhO00VnMu03YXEcvKtR1tJpR9nthefSxykyUzmoef
 2rFT8JeslfX4PBus9JZ0qPnTom9leIaqe6zlcR4kGY5cPdF4VkRHppzol
 BA900alCh7DxDc0GABGrkb/mGabVKxNPUwaBo1rwhHy9068GAu/zTOHBG
 dRW6MVq04uZhCWgmfmz3BWxRnjIok8cHEly5p7I4hCzyuKfglAeVSqV5+
 Q2eVKnDvBEYr80FiKBufLOxXAnBRbHkUoEanIJzQrY71QViPEdiaT4IRz
 gi6+cyUAd4EORJMl6PwoIh1pTEHg/pQebTTFu0hO5FrzUzl2LYfjPbNda g==;
X-CSE-ConnectionGUID: J1OwmHTcRE+IqzsnYJXUiA==
X-CSE-MsgGUID: vsXz2FzpSs+8MzLBIkOQ0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16002645"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="16002645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 12:34:41 -0700
X-CSE-ConnectionGUID: VEhkQ4JFQ+iNHZayhBq11w==
X-CSE-MsgGUID: SVU7IF3zTXmKG65SgAPIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31908495"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.247.118.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 12:34:37 -0700
Date: Fri, 17 May 2024 21:34:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915: Don't treat FLR resets as errors
Message-ID: <ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan>
References: <20240517112550.251955-1-andi.shyti@linux.intel.com>
 <20240517112550.251955-3-andi.shyti@linux.intel.com>
 <e2a23879-c69e-4b57-a0a0-4c1ac81d9403@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2a23879-c69e-4b57-a0a0-4c1ac81d9403@linux.intel.com>
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

On Fri, May 17, 2024 at 04:00:02PM +0200, Nirmoy Das wrote:
> On 5/17/2024 1:25 PM, Andi Shyti wrote:
> > If we timeout while waiting for an FLR reset, there is nothing we
> > can do and i915 doesn't have any control on it. In any case the
> > system is still perfectly usable
> 
> If a FLR reset fails then we will have a dead GPU, I don't think the GPU is
> usable without a cold reboot.

fact is that the GPU keeps going and even though the timeout has
expired, the system moves to the next phase.

> This is a serious issue and should be report as an error.  I think we need
> to create a HW ticket to understand
> 
> why is FLR reset fails.

Maybe it takes longer and longer to reset. We've been sending
several patches in the latest years to fix the timings.

Andi
