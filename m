Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED8E6E840A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB8B10E204;
	Wed, 19 Apr 2023 21:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC8A10E1FC;
 Wed, 19 Apr 2023 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681941577; x=1713477577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H3hfT42wNnQpz8Qn/bfpfcjSQssWqc4rQrxtf6VaOG4=;
 b=BRdocHOh9ELY+b/AExCHHNo4T4HCUuKezThtmtARgR9Yb83w2byTRHKK
 YrPgKKfiNq7mpDTFbZSs2eeZ0db4kggXnW8JlxREmY1Nxt8z7t2rn289H
 1hC4KWxQVGzX3E2g88sEqB9dVHewiTVP8ZlOrKpCltD/y3fiOKdNKdqWw
 oaFcGhaYfVz1+3pokUA1nsvvycxwz6bssbIIjLinhjOX1m+iqlw69hVBp
 WS4I6WldW/aC3BLXmPqiWMueUBuPFSRQ2Yw/M3eBPUfULHmrkTKp67cEy
 mkHlA9MWaO8l3BBHxuaHlY9jNR8aymhE2ylYUYtrOQqouhhbLGUV9aypm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325180721"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325180721"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835467951"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="835467951"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:59:34 -0700
Date: Wed, 19 Apr 2023 23:59:31 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <ZEBkQ37I4K4uhxa6@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-3-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Wed, Apr 19, 2023 at 02:12:13PM -0700, fei.yang@intel.com wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> On MTL, GT can no longer allocate on LLC - only the CPU can.
> This, along with addition of support for L4 cache calls for
> a MOCS/PAT table update.
> Also the PAT index registers are multicasted for primary GT,
> and there is an address jump from index 7 to 8. This patch
> makes sure that these registers are programmed in the proper
> way.
> 
> BSpec: 44509, 45101, 44235
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

I think nothing open left here.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Andi
