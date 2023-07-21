Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED475C695
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26D010E664;
	Fri, 21 Jul 2023 12:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B4010E664;
 Fri, 21 Jul 2023 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689941361; x=1721477361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SwrcA9sTJRVaDzGBUug5hrRnJ4Kkdw2wtJDmFY8ttGA=;
 b=bLG/5hiYRzk92Md9B7T08l9ZVL8LgJTvOgyin6dvngxS1lAY5bNGLPI8
 k5YsND207E0ad9U79dOG0Jhv7DyZ606BriyiNkRjySrQZoZTwDHukjkLl
 0/HYZhQSXM6rhVGkI9QqVc6bWnn3nBDW8Y+z21Dyij36Ym+BcphAcx8OQ
 0/NQiU9e7meu+9P8hpWzS56zarh1NRlf5DOE9Yscaw2JgtsCuoU6cjoJO
 0p32HKAc/XRjVZ28ugKBwr5NAa68QQGEQ1CjEUZeE+ARlukl5HuwpqSFw
 CMhA1rHcZRFX2Cs5LMpOCv2gDWdZydti+FnP+9e1nPxZIOOGmVXljWGMA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433238523"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="433238523"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814924617"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="814924617"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:09:16 -0700
Date: Fri, 21 Jul 2023 14:09:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
Subject: Re: [v7,5/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control
Message-ID: <ZLp1aa2lbM3abmBG@ashyti-mobl2.lan>
References: <20230720210737.761400-6-andi.shyti@linux.intel.com>
 <4155037.1IzOArtZ34@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4155037.1IzOArtZ34@jkrzyszt-mobl2.ger.corp.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, linux-stable <stable@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

> > Enable the CCS_FLUSH bit 13 in the control pipe for render and
> > compute engines in platforms starting from Meteor Lake (BSPEC
> > 43904 and 47112).
> > 
> > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> 
> I'm not sure why you think that your change fixes that commit.  Can you please 
> explain?

Hardware folks have provided a new sequence for performing the
quiescing of the engines... that's how it is :)

Thanks,
Andi
