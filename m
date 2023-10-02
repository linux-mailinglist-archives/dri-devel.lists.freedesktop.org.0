Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E77D7B5438
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C6010E2BF;
	Mon,  2 Oct 2023 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE52892E0;
 Mon,  2 Oct 2023 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696254347; x=1727790347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HYmunqJHbDVk4OzAtHKLKXeJ7xtlMCVzrlRB7rh2N5c=;
 b=iVxoaYC+qVPKQDIsKX93oa//6pGogDax6MieoZE7cWjtUbkbqIFtnqr4
 +Gb7aX3I6M00LL/7PsNsKgsSGNRpJfDEmnm9CxscpJBYLiTLVF2m5PX0x
 212RJcMYfRiDIwuBGOpiJji47FsJ+F/NnRQdYrp7SoKshsNxL9gEwkCMA
 cV4rj2zzuO5P2MQZcP+BrTwLVPGwir81ioVt7oELEOXsZdLSS/QA/w/zz
 c3e5OnxqQ9lSdVzG+dCymp7yVn0rJqodVELUPH8Fk0TzDsrHGpcY0NQ5t
 wc5/1IcQmLCQfdjH+ePwM9/tyDzaOLcyBn4jqveoktEl5ab2OsOM0gCQa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381527518"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="381527518"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 06:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="820884588"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="820884588"
Received: from nsusbilx-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.161.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 06:45:32 -0700
Date: Mon, 2 Oct 2023 15:45:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Invalidate all GTs in flush_tlb_invalidate()
Message-ID: <ZRrJdzaUF9X967Ig@ashyti-mobl2.lan>
References: <20231002122032.23703-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002122032.23703-1-nirmoy.das@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fei Yang <fei.yang@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Mon, Oct 02, 2023 at 02:20:32PM +0200, Nirmoy Das wrote:
> Don't return early if one of the GT doesn't require
> any flushing.
> 
> Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

This patch has been sent already here:

https://patchwork.freedesktop.org/patch/560309/?series=124472&rev=1

Can we take it from there?

Andi
