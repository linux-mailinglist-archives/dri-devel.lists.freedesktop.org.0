Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BE98835E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 13:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF2210EC17;
	Fri, 27 Sep 2024 11:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fz97s7CH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CB910E1DB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727436801; x=1758972801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XiGaGMDzMCROBQtygORtL0L79RY6kNF9LzCsfsnLfRE=;
 b=fz97s7CHRK8GQzfGe482wZYtsDTyxVMITwrjw8hSdhEFRe2GRDyN+AfA
 I+Wwe0L02hiy0Ha48YkFa9dDyh0m8Xg8gWzMSAewbslvG7X1vwqU72YL1
 W5U+SKqNGDaoBJdfqHa93iZfuXrvkDM0GA2+bF5u+dlW/ApZAAZBXHA9X
 3T/ZmpQHWrqVQ9ia8CqbjBYwcR7lwJalwWf6N8ebgMdXowp3pZay2xT4+
 lfn59HntDIzMbvx9qhG/qXKpnUWJYlaIr1/mhp7zvcHBjGx8g1E+35Hs/
 dndPY/D1EPuWhRJ96FSd5jpMpL3tjSopCmoxVseaO6k6w+2eRo9EfybDR g==;
X-CSE-ConnectionGUID: 6nqGPe7NTWGEzvYrqGnDrw==
X-CSE-MsgGUID: wRxbvsTjR9K0OIAq7rtltQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37958152"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37958152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:33:21 -0700
X-CSE-ConnectionGUID: FvqnjWMkS7mW35SoTdhHmQ==
X-CSE-MsgGUID: 4pBl50f9TN2GCYO+dGacGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="109999360"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:33:21 -0700
Date: Fri, 27 Sep 2024 04:33:15 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm: Print bad EDID notices less often
Message-ID: <ZvaX-0wBGiHd8YHS@tassilo>
References: <20240926180150.2674763-1-ak@linux.intel.com>
 <87frplzboj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frplzboj.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 27, 2024 at 12:30:04PM +0300, Jani Nikula wrote:
> On Thu, 26 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
> > I have an old monitor that reports a zero EDID block, which results in a
> > warning message. This happens on every screen save cycle, and maybe in
> > some other situations, and over time the whole kernel log gets filled
> > with these redundant messages.
> >
> > Make most of these prints conditional on bad_edid_count like other verbose EDID
> > messages.
> 
> Honestly I think merging this would be counter-productive to addressing
> the issue properly.

You think it's a problem on the host side, not the monitor side?

> 
> Please just give me the chance to look into it.
> 
> Is your zero EDID block the base block or an extension block?

It's an extension block I believe.

-Andi
