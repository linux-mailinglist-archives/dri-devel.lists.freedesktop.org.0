Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E438922DE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0291127FF;
	Fri, 29 Mar 2024 17:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNRg1UI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691B3112803;
 Fri, 29 Mar 2024 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711733929; x=1743269929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2hBaQawS2DQq+hSZa4nEoohpdH7i4ouzg4+WFmp/jBs=;
 b=hNRg1UI+eVZNDxxXYiftHMg5kKw2lf6aeGsAveGIJM77CcaflDKkgWkq
 gr2hCh+elJKUrzaKgUAriy9eUArACJHS4AkSToyOATmEi3c/xJMqUfgxI
 AYL8ThfGDUXyibZU7fI0XyPew9T3sYaEtd2p4yKig8P+TNZ5l03BE/wxe
 ppmE5Z67HI7mGzpw9GzwcAzCH/IAneJr06KTNqSK9oxlVsPeH5F40PLGt
 bd4fmEZtPqa+TRaRfTdajHlQLqvqphEjqbz/5MC8qs2gmy+SA4ky3bpGD
 aMqAdDHhBAu+zUD3D1QXsJxSpPKks5/7X3Fk3mAeTM1c4vNcao8pGq9ht A==;
X-CSE-ConnectionGUID: P3zD8xdyTb6rVdwNn0nM2w==
X-CSE-MsgGUID: yDAZj9W7SBaqDv/jm27RZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="29413581"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="29413581"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 10:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17669687"
Received: from unknown (HELO intel.com) ([10.247.118.231])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 10:38:17 -0700
Date: Fri, 29 Mar 2024 18:38:10 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
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
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Lewis Huang <lewis.huang@amd.com>,
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
 Yang Wang <kevinyang.wang@amd.com>, Darren Powell <darren.powell@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology
 more inclusive
Message-ID: <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
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

Hi,

On Fri, Mar 29, 2024 at 10:28:14AM -0700, Easwar Hariharan wrote:
> On 3/29/2024 10:16 AM, Andi Shyti wrote:
> > Hi Easwar,
> > 
> > On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> > 
> > I don't understand why we forget that i3c is 1.1.1 :-)
> 
> That's because it's a copy-paste error from Wolfram's cover letter. :) I'll update
> next go-around.

not a binding comment, though. Just for completeness, because we
are giving the version to the i2c and smbus, but not i3c.

> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> > 
> > The specification talks about:
> > 
> >  - master -> controller
> >  - slave -> target (and not client)
> > 
> > But both you and Wolfram have used client. I'd like to reach
> > some more consistency here.
> 
> I had the impression that remote targets (i.e external to the device) were to be called clients,
> e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
> I chose the terminology according to that understanding, but now I can't find where I got that
> information.

The word "client" does not even appear in the documentation (only
one instance in the i3c document), so that the change is not
related to the document as stated in the commit log. Unless, of
course, I am missing something.

I'm OK with choosing a "customized" naming, but we need to reach
an agreement.

I raised the same question to Wolfram.

Thanks,
Andi
