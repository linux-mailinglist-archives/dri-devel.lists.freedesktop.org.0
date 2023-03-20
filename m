Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584736C2400
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA110E068;
	Mon, 20 Mar 2023 21:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6310E00E;
 Mon, 20 Mar 2023 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679348489; x=1710884489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oeKevs+7uBdgf9TveRIO8rb5EqAt1nSpJVJ0BTjBkMU=;
 b=UKB0frv/v8/c9nWb/01rQT5Kn933nH6ygtcVF8ST2ZzPK1srMYHioHt2
 PMTACz0CPNk089thtBVAfEO3uAzPgSAYpsEvJPD4/XJsFg4KcHlF0zxDS
 XdJL5PlyqwB33GIKFEX4DfI3tz+wkj3aaBFznKYxg+C14WLueYGgcl9Ct
 Y6AUM2tXZW0ND/8GbtcE2fLdhKXV0tODm3dvmbmf2eWTiSPH2jchHcxFq
 NQV+tFtxq42D1+YfxZpf/TGWOscYzu73yQ2iJkd92G9uWgoni1aLPTNZa
 aXHcaHHvriaiwIl0hz3RPSv6F74k9Bv4uhGJu8DO5X2A4Z0Z1CpCYxf3S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327160821"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="327160821"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927120131"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="927120131"
Received: from ivolodix-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.62.92])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:41:26 -0700
Date: Mon, 20 Mar 2023 22:41:03 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: limit double GT reset to pre-MTL
Message-ID: <ZBjS72wX5Aq6Cumb@ashyti-mobl2.lan>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

On Mon, Mar 20, 2023 at 02:10:38PM -0700, Daniele Ceraolo Spurio wrote:
> Commit 3db9d590557d ("drm/i915/gt: Reset twice") modified the code to
> always hit the GDRST register twice when doing a reset, with the
> reported aim to fix invalid post-reset engine state on some platforms
> (Jasperlake being the only one actually mentioned).
> 
> This is a problem on MTL, due to the fact that we have to apply a time
> consuming WA (coming in the next patch) every time we hit the GDRST
> register in a way that can include the GSC engine. Even post MTL, the
> expectation is that we'll have some work to do before and after hitting
> the GDRST if the GSC is involved.
> 
> Since the issue requiring the double reset seems to be limited to older
> platforms, instead of trying to handle the double-reset on MTL and
> future platforms it is just easier to turn it off. The default on MTL is
> also for GuC to own engine reset, with i915 only covering full-GT reset.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
