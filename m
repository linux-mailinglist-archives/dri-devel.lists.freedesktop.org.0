Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE69E1AB3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 12:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB20010E012;
	Tue,  3 Dec 2024 11:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftp26xns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DB810E012;
 Tue,  3 Dec 2024 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733224685; x=1764760685;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iSYwKSzqksJiVZrwjnKzvyi92xdceEyo2oHtV6lBSZQ=;
 b=ftp26xnsyNuz7COUBAH/yq8YOakp6MkpGoD3j+//cedqQOCA4YrqtKFZ
 gM1YtP4ETQc61jHViMSGvsNXMuvcycTAX9Lsg5z3gTDP71abxe8d9f/Gj
 H020hd1U7hWh5uFY4S3E/Ll4d4OUTd8OluwUr/D8HwI0Z6KMCLN8nnOh1
 4U2OixwVYu7zKmd5rUxobvmoqsjfSg5WbGBTV6auQVhGOHYp4iRMEOCe8
 kYQYu7MfI4rkbIva/3vGio36Lz5nyuW1lZrxX4HiMidKA8IRvG9AIseDD
 /DfCZ735AZZuncDl+n2Fu0vWX10SF8+DhmQJ0GDwME+QB8sONHbN8zl2x w==;
X-CSE-ConnectionGUID: kWOMzAatQeSAK4bJ8E7epw==
X-CSE-MsgGUID: Aqg4loJ4TbC41CvBXnsv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43917327"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="43917327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:18:05 -0800
X-CSE-ConnectionGUID: SVrPN2xYRF2RVOkoLVcaqA==
X-CSE-MsgGUID: 7HF1SWf2RG+A1LaH4U4JkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97482020"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:18:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
In-Reply-To: <20241203-simple-pigeon-of-infinity-babfee@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat> <87ldwy5lvb.fsf@intel.com>
 <20241202-accurate-jolly-hornet-8c2ca0@houat> <87bjxu5btw.fsf@intel.com>
 <20241203-simple-pigeon-of-infinity-babfee@houat>
Date: Tue, 03 Dec 2024 13:17:58 +0200
Message-ID: <87v7w13ti1.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 03 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Dec 02, 2024 at 05:44:27PM +0200, Jani Nikula wrote:
>> >> It's super tempting for people to just get their jobs done. If doing
>> >> the right thing adds yet another hurdle, we may see more stuff being
>> >> added in drivers instead of drm core.
>> >
>> > I really enjoy hidden threats.
>> 
>> None were implied. That's your interpretation of what I honestly think
>> is a plausible outcome.
>
> I obviously misinterpreted what you were saying then. Sorry for the
> whole tone of that mail.

Don't worry about it. Likewise, my mail wasn't a stellar example of
communication either. Sorry about that. Let's move on.

>> I try to push people towards contributing to drm core instead of
>> drivers, and it's not always easy as it is. It's just a guess, but
>> I'll bet the majority of drm contributors have never run kunit tests
>> themselves.
>
> Right, but I don't think it's worth worrying over either. If one stops
> contributing because they are afraid of running one documented command
> that takes a few seconds, they would have done so at any other obstacle.
> We have much bigger barriers of entry, at several levels.
>
> All of them are here for a good reason, and because we have collectively
> judged that the trade-off between adding a barrier and increasing the
> quality of the framework was worth it.
>
> I believe tests are worth it too.
>
> But anyway, it's really not what I had in mind.

Would you mind drafting some ground rules for what you think the
requirements for kunit tests should be? What's the bare minimum, what's
the goal?

BR,
Jani.


-- 
Jani Nikula, Intel
