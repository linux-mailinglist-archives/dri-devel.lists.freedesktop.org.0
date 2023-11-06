Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F47E1DB7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 10:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38D10E2A9;
	Mon,  6 Nov 2023 09:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8910E2A9;
 Mon,  6 Nov 2023 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699264688; x=1730800688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TkCxKcGNYdznfqT6795v5EotFRAa/oQht+6T7W3URj0=;
 b=LrElxFClg/heFhBtULqBBZ6J1e4/t5IMDX1Tds1/HdVtSjlLaZSwTHo7
 jIc7pb3bnZzhwFlYQikHUtbVFQElcitN+5iIy2f284vY+6oZ/1LBbxzei
 jxQxxl66eGPa5lTslkzqVUypz+3FXooFkVUxrUeA0ME6rKVB0in5aa/7a
 ONPUKOeNhMXlwiJrI2kQ+dzihdbrtC37GEeJ6TZeemf2vEEspcRdlAO40
 o99SVg+nh9mHRtEtxSaGOaQMC2DfGFJP0StVuK8vLSTwj1horQb9JmzSA
 n83uEnZdyAQ5SXfYL7DeTNyLgI/S5coMRoQW5Wrut42wyWWlLNFSxN6dA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420357287"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="420357287"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 01:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755803698"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="755803698"
Received: from chareli-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.31])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 01:58:01 -0800
Date: Mon, 6 Nov 2023 10:57:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH v2] drm/i915: Fix potential spectre vulnerability
Message-ID: <ZUi4ploYfYyZvmO7@ashyti-mobl2.lan>
References: <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
 <20231103023257.58199-1-chentao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103023257.58199-1-chentao@kylinos.cn>
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
Cc: tvrtko.ursulin@linux.intel.com, andi.shyti@linux.intel.com,
 alan.previn.teres.alexis@intel.com, kunwu.chan@hotmail.com,
 intel-gfx@lists.freedesktop.org, jonathan.cavitt@intel.com,
 linux-kernel@vger.kernel.org, chris.p.wilson@intel.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org, robdclark@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kunwu,

On Fri, Nov 03, 2023 at 10:32:57AM +0800, Kunwu Chan wrote:
> Fix smatch warning:
> drivers/gpu/drm/i915/gem/i915_gem_context.c:847 set_proto_ctx_sseu()
> warn: potential spectre issue 'pc->user_engines' [r] (local cap)
> 
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Cc: <stable@vger.kernel.org> # v5.15+
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Link: https://lore.kernel.org/all/20231102101642.52988-1-chentao@kylinos.cn
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 9a9ff84c90d7..e38f06a6e56e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -844,6 +844,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
>  		if (idx >= pc->num_user_engines)
>  			return -EINVAL;
>  
> +		idx = array_index_nospec(idx, pc->num_user_engines);

you ignored my comment, though.

Andi

>  		pe = &pc->user_engines[idx];
>  
>  		/* Only render engine supports RPCS configuration. */
> -- 
> 2.34.1
