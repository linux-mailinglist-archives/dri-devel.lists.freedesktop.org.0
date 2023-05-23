Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120D70DB98
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 13:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8710E057;
	Tue, 23 May 2023 11:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0417510E055;
 Tue, 23 May 2023 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684841998; x=1716377998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fW/1EfmDsaqMEJzKbRG2zdKnBeWcG6DLkMT9agfNSQk=;
 b=RnQeY7FsW2pFSQ4wzUl1+4LJ0TAb0HgXVQf9Nee6udMdp7UpiRaaF+e9
 zUkXUrHTyKrTUqtnKsBlDKn3l2sGQhjPMsDBQPwMfmK0hIOyC2ZAqAAp6
 OHs/oC+JcSp31e2NOqDR64CmDNrd2PTGNA6UP7JhoyuH6rAEgB7o3LV3+
 meuaHFUGR+4TintnGe4nfaLJTwEWkW82uY7ySmWSZ73ls2TbnFHl2C30+
 FsYHT974hlXHKt4+ess8S9caBFinDkdm3epVDguKPpLYvvdVrvZJ1Oc58
 Qfp9rLoRQNe2z9dDk7dBEeLQ8UiRMQmvjVe5ETzEum2oGQ6UHAeoh46+v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337799476"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="337799476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 04:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="654337836"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="654337836"
Received: from vkutovoi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.197])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 04:39:55 -0700
Date: Tue, 23 May 2023 13:39:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Add helpers for managing rps
 thresholds
Message-ID: <ZGymCawKjAuOCwjA@ashyti-mobl2.lan>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
 <20230522115928.588793-3-tvrtko.ursulin@linux.intel.com>
 <ZGv2J0t5XtMnYaXt@ashyti-mobl2.lan>
 <f3402477-2880-a312-c6cc-bef79d7c2f57@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3402477-2880-a312-c6cc-bef79d7c2f57@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > > +	/* Force reset. */
> > > +	rps->last_freq = -1;
> > > +	mutex_lock(&rps->power.mutex);
> > > +	rps->power.mode = -1;
> > > +	mutex_unlock(&rps->power.mutex);
> > > +
> > > +	intel_rps_set(rps, clamp(rps->cur_freq,
> > > +				 rps->min_freq_softlimit,
> > > +				 rps->max_freq_softlimit));
> > 
> > why are you resetting here?
> 
> I want to ensure the next calls to rps_set go past the "if (val ==
> rps->last_freq)" and "if (new_power == rps->power.mode)" checks (second one
> via gen6_rps_set_thresholds->rps_set_power" so new values are immediately
> programmed into the hardware and sw state reset and re-calculated.

thanks! makes sense!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
