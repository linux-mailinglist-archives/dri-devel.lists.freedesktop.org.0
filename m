Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F4803ECA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9610E3EE;
	Mon,  4 Dec 2023 19:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A08F10E3D6;
 Mon,  4 Dec 2023 19:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701719531; x=1733255531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=27npVB+j2+ARf1uiu/AJqOrP8BaYKMiRdMQ4RyAYwLM=;
 b=S1zXpWIf/D7voVX/bROvSsOC3JET0RJynjtkjtcHJdor4Zm62gZWon6v
 CtOW6eZiJCmMQD5Gz4/q3P8Pzm2jOycI21wxQyzRavlJ4jEZ1gzYr/2h/
 9Lu6guSTmUMbGj0XeYVNhX5W5jsK8lbe/7ZDsPHA7kL7/vwu96wMGtmFX
 zUYt2UynGeEGTJeSxBkqT2oaIhV1KacK3FPHYnRH6zXJitg1WGpdH4S6A
 IjXOo+4/TVfKj4Zg8ekFOfZJp+atCGxCtqprqUvcxNcb3Fitl6Eqt1IzA
 y2lZ3gSkN/nco04e4aPREGMaqem7DQEJ/riaxLw6v5Q2RJ6KfUY8Xy9NU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="684470"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="684470"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 11:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836703277"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="836703277"
Received: from anikolov-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.241])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 11:52:08 -0800
Date: Mon, 4 Dec 2023 20:52:03 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Reduce log severity on reset prepare.
Message-ID: <ZW4t485KNGFaOTwq@ashyti-mobl2.lan>
References: <20231201154443.16660-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201154443.16660-1-nirmoy.das@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Fri, Dec 01, 2023 at 04:44:43PM +0100, Nirmoy Das wrote:
> gen8_engine_reset_prepare() can fail when HW fails to set
> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
> error as driver will retry.
> 
> Let the caller of gen8_engine_reset_prepare() decide if a
> failure in gen8_engine_reset_prepare is an error or not.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
