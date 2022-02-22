Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F704BF264
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 08:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B7910E64A;
	Tue, 22 Feb 2022 07:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ED210E64A;
 Tue, 22 Feb 2022 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645513958; x=1677049958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vL8DcslhcdCxYi49Fsi+vRBJ4qnH5U4WDLaK8eziX50=;
 b=Uv2jToA7uEo22fXxl5KSeTvNvJ6x8IM5xIfpliaL4yZIxER8BCTXE3hV
 LqaIxIYtsiRadt5uxqNLPJ5iFfzeaORsS7VlhsDdD4hb7YEVZ2+rzdJXb
 1uwVpqI8E7XWja1rZala9PIt1bBN8YSfBUpZT/bb3WWFjNvmTp2zc/qjM
 9Jv5HBJlASOzYKsPbtXDcmO6E3nUfJVbuN1ROeiR31086xE28NC5PuoY+
 bdervUk+UtyOw/ABBlTlYLKCZC5pfxeJjhvva+ZhbsC7FOBOywqZ+ikz9
 OpcClQhJA45lCroKyBvIvf/Culf6e7nYDn1sx0a8Ipr5f+Wb96WsIPBjs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235169565"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="235169565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 23:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="547615525"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 21 Feb 2022 23:12:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 09:12:32 +0200
Date: Tue, 22 Feb 2022 09:12:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 08/11] drm/i915: Separate wakeref tracking
Message-ID: <YhSM4HFT7UpRYEIg@intel.com>
References: <20220221232542.1481315-1-andrzej.hajda@intel.com>
 <20220221232542.1481315-9-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221232542.1481315-9-andrzej.hajda@intel.com>
X-Patchwork-Hint: comment
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
Cc: netdev <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Dumazet <edumazet@google.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 12:25:39AM +0100, Andrzej Hajda wrote:
> -static noinline depot_stack_handle_t
> +static intel_wakeref_t
>  track_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
> -	depot_stack_handle_t stack, *stacks;
> -	unsigned long flags;
> -
> -	if (rpm->no_wakeref_tracking)
> -		return -1;
> -
> -	stack = __save_depot_stack();
> -	if (!stack)
> +	if (!rpm->available)
>  		return -1;

Still not the same.

-- 
Ville Syrjälä
Intel
