Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD8896EED
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 14:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A5112AB9;
	Wed,  3 Apr 2024 12:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Re8F0gky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB2E112AA4;
 Wed,  3 Apr 2024 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712147822; x=1743683822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Gz4IMh43tlqJQMtkQNAmSURtoItRp7LuOPT/d9igbhs=;
 b=Re8F0gkyxNMG91bQSCmM+sumsuhc/4ehQlP89bNusxXv2SWnXzgjJPFK
 CLz9kMrGiZewa9C3EdKrNDfRcCrYpPbsat1ytgRlBd62M2VDY1LD+Ppia
 NDTPfLXiUyQLLgXOSSqOQNJyk3X5i0ksIV9GXnhbegDabHOVxRjkAl+L9
 1ZUb0wesnfVDgV3xE0Vkh7pPrQZ9rTHY/OMJpRIVlgvpfqVym6UYOocSe
 3WRhKo6d+rlL8wZsHZRVd2l+HJsOaVAjR7TIu82r0UCES6uFWFbRoobwk
 thIu8GRCft8GFjQQxP3XI20hTDJmOw5HsiI8BC9C8GmiaPYY0NQsXtZx4 w==;
X-CSE-ConnectionGUID: 9buRWh2zSkumz/QaT0a9MQ==
X-CSE-MsgGUID: 3jpF2ZTeT7mDQpkXQ84gEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="32764450"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="32764450"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="827789899"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="827789899"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 03 Apr 2024 05:36:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 15:36:43 +0300
Date: Wed, 3 Apr 2024 15:36:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
	Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
	Alexander Richards <electrodeyt@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, Alan Liu <haoping.liu@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>, Charlene Liu <charlene.liu@amd.com>,
	Sohaib Nadeem <sohaib.nadeem@amd.com>,
	Lewis Huang <lewis.huang@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
	Dillon Varone <dillon.varone@amd.com>, Le Ma <Le.Ma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Darren Powell <darren.powell@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>, Wolfram@freedesktop.org,
	"Sang <wsa+renesas"@sang-engineering
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology
 more inclusive
Message-ID: <Zg1NW0jqwFn4lvEP@intel.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
 <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
X-Patchwork-Hint: comment
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

On Fri, Mar 29, 2024 at 06:38:10PM +0100, Andi Shyti wrote:
> Hi,
> 
> On Fri, Mar 29, 2024 at 10:28:14AM -0700, Easwar Hariharan wrote:
> > On 3/29/2024 10:16 AM, Andi Shyti wrote:
> > > Hi Easwar,
> > > 
> > > On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
> > >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> > > 
> > > I don't understand why we forget that i3c is 1.1.1 :-)
> > 
> > That's because it's a copy-paste error from Wolfram's cover letter. :) I'll update
> > next go-around.
> 
> not a binding comment, though. Just for completeness, because we
> are giving the version to the i2c and smbus, but not i3c.
> 
> > >> with more appropriate terms. Inspired by and following on to Wolfram's
> > >> series to fix drivers/i2c/[1], fix the terminology for users of
> > >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> > >> in the specification.
> > > 
> > > The specification talks about:
> > > 
> > >  - master -> controller
> > >  - slave -> target (and not client)
> > > 
> > > But both you and Wolfram have used client. I'd like to reach
> > > some more consistency here.
> > 
> > I had the impression that remote targets (i.e external to the device) were to be called clients,
> > e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
> > I chose the terminology according to that understanding, but now I can't find where I got that
> > information.
> 
> The word "client" does not even appear in the documentation (only
> one instance in the i3c document), so that the change is not
> related to the document as stated in the commit log. Unless, of
> course, I am missing something.
> 
> I'm OK with choosing a "customized" naming, but we need to reach
> an agreement.
> 
> I raised the same question to Wolfram.

I don't know where that discussion happened, but my opinion
is NAK to "client". Life is already confusing enough with
these renames, so let's not make it even more confusing by
inventing new names nowhere to be found in the spec.

And let's especially not invent names that don't even fit
the purpose. "Client" makes me think of "client/server" or
some real world analogy. Neither of which seem to have any
resemblence to how the term would be used for i2c.

-- 
Ville Syrjälä
Intel
