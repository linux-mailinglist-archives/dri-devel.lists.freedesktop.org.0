Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960134BF42A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944110E583;
	Tue, 22 Feb 2022 08:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656CC10E583;
 Tue, 22 Feb 2022 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645520230; x=1677056230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WEQ+a23JfXj8381jlANFpZbfSt6ysjl+D1/uRYig71s=;
 b=dgT3Z/47JlY4FeKe9Nkgh96hYxJbsAjn8TNnXEPICenOIIOOTfDwvjyE
 kSASvMZZpDxd7c82Pf5Fq75n79h45zcMVaIquUko+05fZytwcEbheE7/Q
 YGKA6Q/SGbSbzEs70t9MO7Fr1KP9YE/Qi6IhdfPAh/fpvc7f5ZAbkfWo4
 w4OPPeRKW88V11OQuDTJz1jz2Hp/xviRuYe5jyFozBHXh351wumBrNxzu
 WzfDDfRZr+69OMg3noetdyAh5PFKaYlvo8fspUDfAiyz9j3zHSugyAt9g
 L0xFD3D2gwyM2X30c8JPKROkJXIr/3zgqpzmQMleXi5blCVg2YnYMlSSz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251410782"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251410782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 00:57:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="547650327"
Received: from cene1-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.62.215])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 00:57:06 -0800
Date: Tue, 22 Feb 2022 10:57:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <YhSlXprNK2Wp5dlh@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
 <Yg5vlgoTEfJRWP9U@intel.intel>
 <164518120389.6218.14670990912373168491@jlahtine-mobl.ger.corp.intel.com>
 <02fe43a4-0cb5-54e3-cd2f-b4bc128e7161@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02fe43a4-0cb5-54e3-cd2f-b4bc128e7161@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko and Joonas,

> > > > > Now tiles have their own sysfs interfaces under the gt/
> > > > > directory. Because RC6 is a property that can be configured on a
> > > > > tile basis, then each tile should have its own interface
> > > > > 
> > > > > The new sysfs structure will have a similar layout for the 4 tile
> > > > > case:
> > > > > 
> > > > > /sys/.../card0
> > > > >            \u251c\u2500\u2500 gt
> > > > >            \u2502   \u251c\u2500\u2500 gt0
> > > > >            \u2502   \u2502   \u251c\u2500\u2500 id
> > > > >            \u2502   \u2502   \u251c\u2500\u2500 rc6_enable
> > > > >            \u2502   \u2502   \u251c\u2500\u2500 rc6_residency_ms
> > > > >            .   .   .
> > > > >            .   .   .
> > > > >            .   .
> > > > >            \u2502   \u2514\u2500\u2500 gtN
> > > > >            \u2502       \u251c\u2500\u2500 id
> > > > >            \u2502       \u251c\u2500\u2500 rc6_enable
> > > > >            \u2502       \u251c\u2500\u2500 rc6_residency_ms
> > > > >            \u2502       .
> > > > >            \u2502       .
> > > > >            \u2502
> > > > >            \u2514\u2500\u2500 power/                -+
> > > > >                 \u251c\u2500\u2500 rc6_enable        |    Original interface
> > > > >                 \u251c\u2500\u2500 rc6_residency_ms  +->  kept as existing ABI;
> > > > >                 .                     |    it multiplexes over
> > > > >                 .                     |    the GTs
> > > > >                                      -+
> > > > > 
> > > > > The existing interfaces have been kept in their original location
> > > > > to preserve the existing ABI. They act on all the GTs: when
> > > > > reading they provide the average value from all the GTs.
> > > > 
> > > > Average feels very odd to me. I'd ask if we can get away providing an errno
> > > > instead? Or tile zero data?
> > 
> > Tile zero data is always wrong, in my opinion. If we have round-robin
> > scaling workloads like some media cases, part of the system load might
> > just disappear when it goes to tile 1.
> 
> I was thinking that in conjunction with deprecated log message it wouldn't
> be wrong - I mean if the route take was to eventually retire the legacy
> files altogether.

that's a good point... do we want to treat the legacy interfaces
as an error or do we want to make them a feature? As the
discussion is turning those interfaces are becoming a feature.
But what are we going to do with the coming interfaces?

E.g. in the future we will have the rc6_enable/disable that can
be a command, so that we will add the "_store" interface per
tile. What are we going to do with the above interfaces? Are we
going to add a multiplexed command as well?

> > When we have frequency readbacks without control, returning MAX() across
> > tiles would be the logical thing. The fact that parts of the hardware can
> > be clocked lower when one part is fully utilized is the "new feature".
> > 
> > After that we're only really left with the rc6_residency_ms. And that is
> > the tough one. I'm inclined that MIN() across tiles would be the right
> > answer. If you are fully utilizing a single tile, you should be able to
> > see it.
>  So we have MIN, AVG or SUM, or errno, or remove the file (which is just a
> different kind of errno?) to choose from. :)

in this case it would just be MIN and MAX. At the end we have
here only two types of interface: frequencies and residency_ms.
For the first type we would use 'max', for the second 'min'.

But the question holds in case we want keep adding interfaces to
the above directories.

Andi
