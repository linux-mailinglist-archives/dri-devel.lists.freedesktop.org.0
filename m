Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC49557857
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E710E2B5;
	Thu, 23 Jun 2022 11:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185CE10E2B5;
 Thu, 23 Jun 2022 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655982282; x=1687518282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uvRiXn0RqPUIUKiZwsBd2d49wVVCGlUjadwpX0J+dbo=;
 b=PTg5kmxvz10PFSQIqdtbyzXA7zfliRJX7z7mAPWvvYlaQSByAfBEpj9O
 f9yg/5QRXT9IP4m61dzHZtnil7S+brRu76ZuH//zOb3cCdkI4tU7L2S2h
 nZ+zua6oNz5HGBGqfc7NnkfeUZOqmnfNoJs8F4nN+MiOj5xsvIkpGHlX3
 Mp1TRCcuRxYwJ6l5mFeTqrzKu3nn2awCuE7RsmPHwIRP7/syFot9NcZUv
 BfNE+xLCTK9Rcs7qaqkCl/EpQERl6CO0aLEedqJi4mE4rzB6YyKJPnDc+
 uLdD3bUkVLj1S2EZWahFHzlrhIHgNWCUIfHTBSKnS1yoDymvmFLbhIL86 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="278238672"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="278238672"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:04:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644684867"
Received: from hazegrou-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.121])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:04:35 -0700
Date: Thu, 23 Jun 2022 13:04:32 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/6] drm/i915/gt: Ignore TLB invalidations on idle engines
Message-ID: <YrRIwEXMvlXlXBX2@intel.intel>
References: <cover.1655306128.git.mchehab@kernel.org>
 <ce7ddc900a5421e577ef446b6834ee69663c2d9a.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce7ddc900a5421e577ef446b6834ee69663c2d9a.1655306128.git.mchehab@kernel.org>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Wed, Jun 15, 2022 at 04:27:35PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> As an extension of the current skip TLB invalidations,
> check if the device is powered down prior to any engine activity,
> 
> as, on such cases, all the TLBs were already invalidated, so an
> explicit TLB invalidation is not needed.
> 
> This becomes more significant  with GuC, as it can only do so when
> the connection to the GuC is awake.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
