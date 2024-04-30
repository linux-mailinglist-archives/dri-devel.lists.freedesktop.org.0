Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756998B78A8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4E910F462;
	Tue, 30 Apr 2024 14:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnoV6neI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF8810F462
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714486402; x=1746022402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lelmsBYbONgVYqEn7nVVHP02HO1K0e9/ctQsupwxquk=;
 b=mnoV6neIsWUqCOZfWHl4BbIe8PGP19YEkHtdgfkUGAf6EgjBkOhKNvVZ
 Kb+AohTt6wggmQiGtKxWyy58bX0+8jfM0tJoTeqDiJKiOnzgSAbogZVrs
 PIh5BtNJgG7WmlCqSC+VM7kXVYIO1KRdrPGVYXLeCjhytyhFH4eSyql+R
 5TwpRzNPj/c52oBQgg+S7oXaQ7n7viuC6U/KHVa9DpKPXUbY0gOPbGuiW
 1HeyAzwCyikOcpuyAG7QALiwLNpKcEPAsaQzcK3a7Hl0vAYYcZ9GrQpbu
 cppCaqcZ9nsRT92/REhVekuWnqO5OwhvvxexYHnWNVqeE/0Q46Lxsvyaj Q==;
X-CSE-ConnectionGUID: lR96yAI/QCuNeeg8KraPXg==
X-CSE-MsgGUID: PAnoW9u5Qv6kwsFtJAshrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10415872"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10415872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:13:21 -0700
X-CSE-ConnectionGUID: 7SWS+IY4Rm2nTarWhsdxmw==
X-CSE-MsgGUID: DoelbldRQBW16bD2Dl8VJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="31272374"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:13:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s1oEN-00000002gh3-0hw4; Tue, 30 Apr 2024 17:13:15 +0300
Date: Tue, 30 Apr 2024 17:13:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZjD8eoO3TmuCUj-a@smile.fi.intel.com>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
 <ZiqrLfezhns4UycR@smile.fi.intel.com>
 <b5ffd984-4031-4a8a-adbc-75a1e1dfe765@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5ffd984-4031-4a8a-adbc-75a1e1dfe765@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Apr 26, 2024 at 05:13:43AM +0800, Sui Jingfeng wrote:
> On 2024/4/26 03:12, Andy Shevchenko wrote:
> > On Fri, Apr 26, 2024 at 02:53:22AM +0800, Sui Jingfeng wrote:
> > > On 2024/4/26 02:08, Sui Jingfeng wrote:

...

> > Are you speaking to yourself? I'm totally lost.
> > 
> > Please, if you want to give a constructive feedback, try to understand
> > the topic from different aspects and then clearly express it.
> 
> OK,
> 
> The previous email analysis the non-DT cases exhaustively, this email intend to
> demonstrate the more frequently use case.
> 
> That is, in the *DT('OF')* based systems,
> device_get_match_data() is completely equivalent to
> of_device_get_match_data().

> So the net results of applying this patch are "no gains and no lost".

This is not true. It's only part of the cases, i.e. DT. So, I assume you meant

  "So the net results of applying this patch are "no gains and no lost" in DT case".

> Things will become clear if we divide the whole problem into two cases(DT and non-DT)
> to discuss, that's it. That's all I can tell.

Not really. non-DT cases can also be divided to "fwnode backed or not", and
the former might be subdivided to "is it swnode backed or real fwnode one?"

-- 
With Best Regards,
Andy Shevchenko


