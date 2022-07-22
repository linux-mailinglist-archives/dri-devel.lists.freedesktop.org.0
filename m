Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0E57E127
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEB795186;
	Fri, 22 Jul 2022 12:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9DC9514D;
 Fri, 22 Jul 2022 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658491215; x=1690027215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nRBWTIjqR+EBo83QXnR7YxxBrSXGYH7OV2uGt4ob61E=;
 b=UK5tnF1bJF4MAafHTS53h023yyOiDai9Td1R19AwJYX8KoKZnl4YsSBv
 yNMF5LKIX4uAPkJfCoi2k8tmmvitqVH0eOO4r97J/spCFZFVQQjrnab5T
 M4g7/sb7BUCixn44w1yDsVVUGLhbwlOlHjHGC4CH+VGqP2kd32qjdcUo6
 +7eqzQCD9nZ/I1l/PBkl3PZh6kpELhJpOr3hjWR+9uoUjVHqcW38bAuYX
 uwvoeApFqWUkqICPqotiz20l4T3Br85xI4uw5QLiC654ABI73t3uheOVK
 6/spCJrBVEoYMG7+1vPWMrO7tktfl9PQkLDYpglMQPLgL4AcPdlEJBACP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="349001061"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="349001061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:00:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="657189243"
Received: from dstoll-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.132])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:00:10 -0700
Date: Fri, 22 Jul 2022 14:00:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 05/21] drm/i915/gt: Skip TLB invalidations once wedged
Message-ID: <YtqRSXXiON8Oed96@alfio.lan>
References: <cover.1657800199.git.mchehab@kernel.org>
 <f20bd21c94610dae59824b8040e5a9400de6f963.1657800199.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20bd21c94610dae59824b8040e5a9400de6f963.1657800199.git.mchehab@kernel.org>
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
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Jul 14, 2022 at 01:06:10PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Skip all further TLB invalidations once the device is wedged and
> had been reset, as, on such cases, it can no longer process instructions
> on the GPU and the user no longer has access to the TLB's in each engine.
> 
> That helps to reduce the performance regression introduced by TLB
> invalidate logic.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

I haven't read any concern from Tvrtko here, in any case:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

thanks,
Andi
