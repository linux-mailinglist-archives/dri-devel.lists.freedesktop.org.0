Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70878B5417
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 11:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E810FE15;
	Mon, 29 Apr 2024 09:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeBcUTjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F210FE15
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382410; x=1745918410;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y4bDuRSz6TSLz3mVCCjXzVCR5pym+nGoMR5ch9kpkR0=;
 b=JeBcUTjG7BEFUqrncqvszHvEVjDqfNylQP6nYHEsy6FWZGmJd7T2IrzQ
 W4XK6g+fPRJrbZ2cDJYEhk63lfTBBIYh72lGjtGA+qb8l1lnO0U0whkom
 Q7/8sV7JYbLICwOnBQ+Hp5aualkd5wLK3ZTNXNwFN5qjadx0mDS+Gc4Nh
 ZMM1ajDTJQR9j5I+LVZwgIRTIECM5imPPIl1CaW4xt/OGn+LjZwRUA8pn
 OOr1DayFa0FxITbFqmfsxVWL65B7i4bt10L3sunib/5S7hQQevISIPpic
 vsd379jrfdxgX6KI4SKCA4btaMYipy2TQLPHHuV36202xbmdsa00OKXuR A==;
X-CSE-ConnectionGUID: UYpKnnM9RH+McrMcAtSJ5Q==
X-CSE-MsgGUID: ZDRYYqpdRW+V7N0+SDCSYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9958805"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9958805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:20:10 -0700
X-CSE-ConnectionGUID: whTviabCQ5apEoLo5b0/eQ==
X-CSE-MsgGUID: dKioqKMaQBq/p9WyJJh/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26461169"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:20:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang
 <hsinyi@google.com>, Javier Martinez Canillas <javierm@redhat.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Sam Ravnborg
 <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] drm/mipi-dsi: Reduce bloat and add funcs for
 cleaner init seqs
In-Reply-To: <20240426235857.3870424-1-dianders@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240426235857.3870424-1-dianders@chromium.org>
Date: Mon, 29 Apr 2024 12:20:00 +0300
Message-ID: <87jzkg4jb3.fsf@intel.com>
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

On Fri, 26 Apr 2024, Douglas Anderson <dianders@chromium.org> wrote:
> The consensus of many DRM folks is that we want to move away from DSI
> drivers defining tables of init commands. Instead, we want to move to
> init functions that can use common DRM functions. The issue thus far
> has been that using the macros mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() bloats the driver using them.
>
> While trying to solve bloat, we realized that the majority of the it
> was easy to solve. This series solves the bloat for existing drivers
> by moving the printout outside of the macro.
>
> During discussion of my v1 patch to fix the bloat [1], we also decided
> that we really want to change the way that drivers deal with init
> sequences to make it clearer. In addition to being cleaner, a side
> effect of moving drivers to the new style reduces bloat _even more_.
>
> This series also contains a few minor fixes / cleanups that I found
> along the way.

FWIW, I like the general approach taken here. Thanks!

BR,
Jani.


-- 
Jani Nikula, Intel
