Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0494AED8D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8CC10E678;
	Wed,  9 Feb 2022 09:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCCC10E672;
 Wed,  9 Feb 2022 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644397504; x=1675933504;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k4hLpxCP5zG4YqnamMN0O5VXPbh5iT9Em3+ShBxtEzQ=;
 b=SVon6oegi7wCjyaGgsL4YUxyKUPTo9RscT65P3T8K9P8DUaYCN8Z1nA4
 z8xnnCHsM4x7PzbEBuYxlUCyGenyDIB22AMExxHlv4UZNqNEmXCFGXJcW
 eGq6MC16k+JAM6LRMkVgx9DRzLjzPCqRyKx/iB/qWR6LEznxE3s/wXhUl
 Lm6usHKjDSwGSV2AOR9UuVbtvxVy08xH2u9JI9ygjQnj85YyVBQuONLws
 QsrKByz3mlSbt8H3pp5NmHyf2XV3BG0R3X5bg8EMh3Jgn106sOjMWBPkg
 BXuqjlYC6j6lNw3zjGzE58NSX8vYoplcS4guALb0AyH4aXTgWOwEfotMi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273695793"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="273695793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:05:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="485168645"
Received: from rcallina-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.18.41])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:04:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
In-Reply-To: <20220209072805.GA9050@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
Date: Wed, 09 Feb 2022 11:04:57 +0200
Message-ID: <87v8xopg06.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 hch@lst.de, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Feb 08, 2022 at 05:15:00PM +0200, Jani Nikula wrote:
>> >  #ifdef CONFIG_DRM_I915_GVT
>> > +
>> > +#define D_BDW   (1 << 0)
>> > +#define D_SKL	(1 << 1)
>> > +#define D_KBL	(1 << 2)
>> > +#define D_BXT	(1 << 3)
>> > +#define D_CFL	(1 << 4)
>> > +
>> > +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>> > +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>> > +
>> > +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>> > +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>> > +
>> > +#define D_PRE_SKL	(D_BDW)
>> > +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>> 
>> If these really need to be in a header in i915/, I think they need to be
>> longer with some namespacing or something. I do wish these could be
>> hidden though.
>
> I think we could actually kill them off entirely.  They are used as
> arguments to the macros that setup the mmio table.
>
> Thefunctions to build these tabls are already organized by families,
> so we'd need relatively few conditions to just build them the right
> way.  There also are some runtime checks in the callbacks, but they
> seem entirely superflous as far as I can tell.
>
> Only the cmd parser is a bit messy.  So maybe we could keep these
> constants just for the cmd parser inside of gvt for now (and clean
> that up later) and remove them entirely from the mmio table.

I'm fine with cleaning this up in follow-up, provided the follow-up
actually happens! ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
