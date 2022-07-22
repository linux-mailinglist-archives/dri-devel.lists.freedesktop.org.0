Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50157E120
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 13:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363CC94CD2;
	Fri, 22 Jul 2022 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2D594CBA;
 Fri, 22 Jul 2022 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658491111; x=1690027111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bx69r+an13lTpJ7/4ygY3E3BfF7Z3MEC+MOG/HYjIDA=;
 b=MeRbiRbkYwJna6MxPHWJky4IVASGRKpBxMvlHF8r/jxHxkFPu6YK9XXv
 Tiy3yEqBZgblL/kxCskKthFthMYILiOMVGViVCQa225B9OXgjAwPgT+M1
 qhaMfw0kcpZnVQsmCqNckJ2dA+8U3A5gALWtNSn95dCmzPUxU7SP+k9ke
 AgJksSQgMbzXVZKvYhVhVjdj0VFCnkMCiLJbMQo0o35ti+6qcdERhDE38
 GlldeAkCUSiu7Bxp2jHKmU7fmyhYXeYKOAmM2lSIhn0TERYmELrpD44OT
 WQmA6zoKCas8kscEVoEk3wgEHGkL+ChYbt8jchQJB6F5c6+oo1ty39ImX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="287302430"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="287302430"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:58:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626536717"
Received: from dstoll-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:58:26 -0700
Date: Fri, 22 Jul 2022 13:58:25 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 04/21] drm/i915/gt: Only invalidate TLBs exposed to
 user manipulation
Message-ID: <YtqQ4dxg2SRVToN3@alfio.lan>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
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
 Fei Yang <fei.yang@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Jul 14, 2022 at 01:06:09PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Don't flush TLBs when the buffer is only used in the GGTT under full
> control of the kernel, as there's no risk of concurrent access
> and stale access from prefetch.
> 
> We only need to invalidate the TLB if they are accessible by the user.
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

Please, once you have sorted out Tvrtko's question you can add:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
