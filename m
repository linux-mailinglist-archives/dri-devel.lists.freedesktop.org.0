Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3648ED02
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 16:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5810E6F3;
	Fri, 14 Jan 2022 15:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2310E272;
 Fri, 14 Jan 2022 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642173563; x=1673709563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gQypZeKb20iK6V4Fo2vqovMOcW37eXRpK9D4ZpMA80M=;
 b=j/smNvKL81Ucm1X0+wRG5Khqh89vg1Exsa9+M6Ch5mSR8J4UBsP3OXIJ
 Soq2ss9Yl0/ftLdfJyf8FrZEwbd8EjHoMvQ1GC9oSDAkTu0eA6JfYpkvc
 UJB8eEBVY2aPT/9ZX+yRf8+saOhhfEal4kPBTaZMBgr5/ZAtyymIXOXBa
 /shOof5NuTl5jLtQemxygyrj+60aFXqoqZ0hZh0l+Jss/RIG2Tsf+zbp+
 NYUGgwkvDUiWjQkkLJTv2bcY4+zFUnColgpzL/T2E/AUl5qRZO/XWBssr
 zreqskLqCXgfh+l1OC97o0zfxxQq+b5TFgC83LxuxkLbJ0ovB4HumZZdj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="307604628"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="307604628"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 07:19:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="594058641"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 07:19:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n8OKv-00AgJa-UJ; Fri, 14 Jan 2022 17:17:53 +0200
Date: Fri, 14 Jan 2022 17:17:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v3 2/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <YeGUIYK3hYo7wLJt@smile.fi.intel.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-3-etom@igel.co.jp>
 <YeGFugZvwbF7l2I/@smile.fi.intel.com>
 <7eljcd3F4aWL2jjBRwr3DISmyt0XPWFIH1_kebFGqZTJXLZRx0bm_8c8yaIuEuH8rS0MaJhU6SY1y-fc6U_zCLaKgoLM124nZpr0H91nSjw=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eljcd3F4aWL2jjBRwr3DISmyt0XPWFIH1_kebFGqZTJXLZRx0bm_8c8yaIuEuH8rS0MaJhU6SY1y-fc6U_zCLaKgoLM124nZpr0H91nSjw=@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Takanari Hayama <taki@igel.co.jp>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Evan Quan <evan.quan@amd.com>, Mark Yacoub <markyacoub@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 03:07:21PM +0000, Simon Ser wrote:
> On Friday, January 14th, 2022 at 15:16, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Why not enum?
> 
> There is no enum for DRM format modifiers.

I'm not sure how this prevents to use enum in the code instead of const u64.
Any specific reason for that?

-- 
With Best Regards,
Andy Shevchenko


