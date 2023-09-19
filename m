Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB367A623F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 14:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10D10E3AA;
	Tue, 19 Sep 2023 12:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4CE10E3AA;
 Tue, 19 Sep 2023 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695125549; x=1726661549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y9qE1CKFWEcSC1M4C9MoDMAu2wFdsnpOviSStjBeZds=;
 b=aY/Kn5m1iiRJ4AVwUfVIi/GOCPYEmgxBTVRDYy2+wltm1Z2/48cZrBxh
 16WIi6ibZQAu+/tO/FnLQpf8e5lXV4lePAEZHa6uy2U6wX65/x00t6D4D
 WeQIMI1GJC27RN3M1f8zrb9JqMoU/mDaKnac0De9E5r+lpAajRo9cxV0i
 pmsZXEHzleYhpXinhIVrI2DK/T2PBU3sY8FVuhbwKC1dNy/JPeWuaTLgz
 Nw4OSemTQ+moJeFyVrYZMaM+6JvhnAjYDHBVtHQfd97dTmVycJwyBO2S4
 CXKztVy2tAlJInRrCs8+fNGp3Uvji73n14H6Orczg5+KopTSSeM7nLM9j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="360180614"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="360180614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 05:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="816416756"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="816416756"
Received: from chiawqin-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.240.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 05:12:20 -0700
Date: Tue, 19 Sep 2023 14:11:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Fix aux invalidation with proper pipe_control
 flag
Message-ID: <ZQmP+IWIcu1yUkSC@ashyti-mobl2.lan>
References: <20230919114716.19378-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919114716.19378-1-nirmoy.das@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Sep 19, 2023 at 01:47:16PM +0200, Nirmoy Das wrote:
> The suggestion from the spec is to do l3 fabric flush not L3 flush.
> 
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before
> invalidation")

please put this in one line.

> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

and I believe

Tested-by: Tapani Pälli <tapani.palli@intel.com>

Thanks,
Andi
