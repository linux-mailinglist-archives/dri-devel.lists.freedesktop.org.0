Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F8557896
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEF810E0F7;
	Thu, 23 Jun 2022 11:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4810E0F7;
 Thu, 23 Jun 2022 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655983136; x=1687519136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZDmviisAQFt/A72ntxTrOHQF561xAWJ5eMxmpFohiy4=;
 b=YO6t7LWNyAcziP0pK0eqUpMiBlllpzZFP3qV3pzvFBst5N8jgqdiZDqi
 Z7dJbH0N7azDNnYeGaC0k2DhZEfH0eOtiLbHGXK+ZGTChAzo6dBIREzL2
 FFKCxVZeVTETAVd3pijvHR7WXqHqDWfiHlAKodzpE+RiL1tFtesm8Pga4
 3TEHqzDSADfxAi2kNW4F/RJLYuGMVBtsvm20OYtV9IU27Eu9GIbFwEwtz
 geKxhcvjdTMAk1UWFFMrJI+z0ukccasc1sG+7n4OrNtxZUax+RoTm1f3b
 ySqDUw7BITcOseA1K7CA3eKp73GiH1EEbsMPlcf3g0LWtGWhiYGhfnJkZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279459552"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="279459552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:18:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644691087"
Received: from hazegrou-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.121])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:18:50 -0700
Date: Thu, 23 Jun 2022 13:18:47 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 6/6] drm/i915/gt: Serialize TLB invalidates with GT resets
Message-ID: <YrRMF9fY46KJcMG/@intel.intel>
References: <cover.1655306128.git.mchehab@kernel.org>
 <cd5696e3800fd29114ddf0cebc950b57a17bc1b8.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd5696e3800fd29114ddf0cebc950b57a17bc1b8.1655306128.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Wed, Jun 15, 2022 at 04:27:40PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Avoid trying to invalidate the TLB in the middle of performing an
> engine reset, as this may result in the reset timing out. Currently,
> the TLB invalidate is only serialised by its own mutex, forgoing the
> uncore lock, but we can take the uncore->lock as well to serialise
> the mmio access, thereby serialising with the GDRST.
> 
> Tested on a NUC5i7RYB, BIOS RYBDWi35.86A.0380.2019.0517.1530 with
> i915 selftest/hangcheck.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> 
> Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
