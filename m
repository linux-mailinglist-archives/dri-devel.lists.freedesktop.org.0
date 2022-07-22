Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998E57E11B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 13:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834A492F20;
	Fri, 22 Jul 2022 11:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8C91FA8;
 Fri, 22 Jul 2022 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658491052; x=1690027052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+MHMFB3/SyMilPDULCXRco5YPvAqDbWUS0FUtek/FcA=;
 b=UQhUlN2VUuEjYoMoiSiGVLFgAB97UUOP0QiLky6eMlvOoI7PF+x2ySUT
 QM0NxAz+TIBD8K82BC+GXGEm5JsM0+8K45pQcy1epVoFBnZ9HgajbBKUr
 Ktes7ftyiVuCq2JA8IE7997c0l5R78jqsV+6Gc9pBp7EN1soSz6Un/gYz
 qe3fYPsS2DsTLDjLRn2Hc2KV6lFOD/3rrR3ejC/b33VKox5tqbPa2X1Pd
 Tpq3JkKoZdVN4wsQq2RiciVTXq95S8qz9659BfguevQvSRSNu/NNewb8A
 zhoIQKHTC3FSWw/Svf1T3saEgP07qmuBtHk96wXF87bKt2ugti8bbEBKz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="373597778"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="373597778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:57:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626536572"
Received: from dstoll-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 04:57:26 -0700
Date: Fri, 22 Jul 2022 13:57:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 03/21] drm/i915/gt: Invalidate TLB of the OA unit at
 TLB invalidations
Message-ID: <YtqQplx6IwYvpw6V@alfio.lan>
References: <cover.1657800199.git.mchehab@kernel.org>
 <44ec6a01ef2e82184abbb075b9c8a09297fa120c.1657800199.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44ec6a01ef2e82184abbb075b9c8a09297fa120c.1657800199.git.mchehab@kernel.org>
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

Hi Mauro and Chris,

On Thu, Jul 14, 2022 at 01:06:08PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Ensure that the TLB of the OA unit is also invalidated
> on gen12 HW, as just invalidating the TLB of an engine is not
> enough.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
