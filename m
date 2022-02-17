Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40354BA36F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A42610E304;
	Thu, 17 Feb 2022 14:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5E710E304;
 Thu, 17 Feb 2022 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109305; x=1676645305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/a6kPOmK1R4gkycE4EvBWHz/vCQFwiKnu48Rd4yVAA0=;
 b=bq8Li+M+5XvE2/GEJvUgXXA5WUhIKCOp9ZR58Cp1J2buuXAxX89sPwFx
 5q+0bNPZjuVxY1hRyTyDCcjAuninWC+caHcQ28Kajfv/L3AZaSq2K5xbM
 KkTh9u5Rs5YFHbh9DnX+60DAU+zZz8dVKGRLNaIsdiN/qf/UMYCQQaNE6
 VkcUYE0rlr4FbML+t4N+pTdFG1ssdnfLRtqIpJfsztjUcherqEP2W8i3q
 K4ZVLBr9k4YDB7nEsiHM80nZD7elPGan7zlq2YQuIMLMtpV9VOmM9Budz
 YgP6MOeu65nSkRx6jq35tssC8ES85y87scFovcwb8oqzO0Z55kZWi1Xu7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="251085921"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="251085921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="502480195"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 17 Feb 2022 06:48:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 16:48:05 +0200
Date: Thu, 17 Feb 2022 16:48:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/9] drm/i915: Separate wakeref tracking
Message-ID: <Yg5gJfSJCCaY5JYs@intel.com>
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-7-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220217140441.1218045-7-andrzej.hajda@intel.com>
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

On Thu, Feb 17, 2022 at 03:04:38PM +0100, Andrzej Hajda wrote:
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

no_wakeref_tracking != available

-- 
Ville Syrjälä
Intel
