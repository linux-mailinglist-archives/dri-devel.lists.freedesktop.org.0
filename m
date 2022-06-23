Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B9557881
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CB710E8F1;
	Thu, 23 Jun 2022 11:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4010E10C;
 Thu, 23 Jun 2022 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655982844; x=1687518844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ajFYZAC8MEA43zYcILf89zu5jxIuV92OVh4y+errMgM=;
 b=UqBUOUfsYgh4l0KJPyekEUgrp5pTVqWFajw/CYTAoI0eGXQzU+BN9rrE
 jroa1otOgctHS2YO59FVrxE4o7ZeM8mFB2mKuVqa0js/fZ9r6kpZg+eAJ
 SIkZcR22OUEB728S9YicMP0lPH9G5QOSu/Q9KbTi+BL/FyaMUZkzEIH3D
 LxvCfeotfpw47reMt3QP7CrKVkjKDa4AOArX1LIO1uzxFpoFpce9fOGJf
 Qc8KuTzt27WaG6EcPEN3ZccJUXCjKmNyap/938U6YnG8S8g8AcgUWYpz4
 67JFJtuVOnc08vIzt8aCtIV33OHTfEzrmP7/ng7TmnQa3FOs0nU7IZ4be Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="306150825"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="306150825"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:14:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="834592683"
Received: from hazegrou-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.121])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:13:59 -0700
Date: Thu, 23 Jun 2022 13:13:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 4/6] drm/i915/gt: Only invalidate TLBs exposed to user
 manipulation
Message-ID: <YrRK9Gaf/G4AXwYn@intel.intel>
References: <cover.1655306128.git.mchehab@kernel.org>
 <387b9a8d3e719ad2db4fce56c0bfc0f909fd6df6.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <387b9a8d3e719ad2db4fce56c0bfc0f909fd6df6.1655306128.git.mchehab@kernel.org>
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
 mauro.chehab@linux.intel.com, Fei Yang <fei.yang@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Wed, Jun 15, 2022 at 04:27:38PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Don't flush TLBs when the buffer is only used in the GGTT under full
> control of the kernel, as there's no risk of of concurrent access
> and stale access from prefetch.
> 
> We only need to invalidate the TLB if they are accessible by the user.
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

Thanks,
Andi
