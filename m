Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0707AF482
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92110E183;
	Tue, 26 Sep 2023 19:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128EC10E183;
 Tue, 26 Sep 2023 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695758122; x=1727294122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6ZD6ZOraW4P9JXiRThDkZSRy6fe+ak1YSDkgsBqwrWY=;
 b=FvEmLI7pN5xsxqCRtghr0l4UqQ8mQwHAITc7PEwp9NDN0KnrgPl7OAbA
 wz0U5Aq5GAkW1MDqzKURQk8scBepLd2O2wBEx0mMLA7niRsVlqQnspvGp
 R+j/GQI0pr74nNqnRjL53eKDmkNJaTqmP7iNR8ymqRFXBqv5pIXdMbYh9
 w9CsrJJulo0dltaVBnoxSZAAl0kZxO3z4AvZrzXWP/V/3BAIiPG98Hpt9
 WiG0F1lqryDiT/SxaCkIBF+eAYtGRsPExmjH+fAl7dS5AMj0IBO3haZLO
 yUcoeiKaB9/MHY7k5clhpVYf72Nqsy+97jcBSgp3lS7B2eiWIyk3VYInX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378936915"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378936915"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892326710"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="892326710"
Received: from yeehernc-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.104])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:54:05 -0700
Date: Tue, 26 Sep 2023 21:55:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Message-ID: <ZRM3GImHFI7zevz+@ashyti-mobl2.lan>
References: <20230926142401.25687-1-nirmoy.das@intel.com>
 <ZRMAZgM+0Gg6Sbk6@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRMAZgM+0Gg6Sbk6@ashyti-mobl2.lan>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Janes <mark.janes@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

...

> > PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
> > so don't set that.
> > 
> > Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> > Cc: Tapani Pälli <tapani.palli@intel.com>
> > Cc: Mark Janes <mark.janes@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> looks better :)

this was supposed to be:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
