Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0C4940F5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 20:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3E10EB29;
	Wed, 19 Jan 2022 19:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D2E10EB17;
 Wed, 19 Jan 2022 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642620910; x=1674156910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hA5pSNQjxDTLN0gQu3qfl7xtlPzKT55FdGnVp2YHmjo=;
 b=F+enoCSUhhxOnKi67uwq9A2rDFl53ZOc/oHnREgt+wBSoY2mOpNxmNXQ
 kiieHGfaQxJAzI+Tu/mVc0GFwt45XRZ1Mw6x+n5zd94rrKb7ol1SZUryu
 ixIoE2xwbHT1aaroMYQ0f5aeU2N660KejvPn7VO33cOT49CKKcyPj98D1
 1am9B8fWWJRFqOV9x7/tLmFiRz/cn8oU4SJ54JICVQ5bdJHFh3YxWuyYY
 0GrwZsRD5tJ1Q+7qFsiy3gcc0K/xi77RABh4YRYdp+vMGD8vOXuHbNcK3
 C1KB1S+l9Xy+Hm8WCjwhZUmtirETyazLFJUNcbTDGVFvPMSPHQb7xox/o Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="225151213"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="225151213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:18:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="530741414"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:18:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAGSd-00CETd-Sx; Wed, 19 Jan 2022 21:17:35 +0200
Date: Wed, 19 Jan 2022 21:17:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [RFC PATCH v3 2/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <Yehjz1ixBKqL7Qw+@smile.fi.intel.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-3-etom@igel.co.jp>
 <YeGFugZvwbF7l2I/@smile.fi.intel.com>
 <0cf405a1-0d2d-ed5e-abdf-be645e7a9209@igel.co.jp>
 <YeaOHqfTcf+evbVC@smile.fi.intel.com>
 <94bddda6-9823-6479-bc1d-cbb8c1079877@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bddda6-9823-6479-bc1d-cbb8c1079877@igel.co.jp>
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
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Takanari Hayama <taki@igel.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
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

On Wed, Jan 19, 2022 at 11:35:22AM +0900, Esaki Tomohito wrote:
> On 2022/01/18 18:53, Andy Shevchenko wrote:
> > On Mon, Jan 17, 2022 at 02:15:48PM +0900, Esaki Tomohito wrote:
> > > On 2022/01/14 23:16, Andy Shevchenko wrote:
> > > > On Fri, Jan 14, 2022 at 07:17:52PM +0900, Tomohito Esaki wrote:
> > > > > The LINEAR modifier is advertised as default if a driver doesn't specify
> > > > > modifiers.
> > > > 
> > > > ...
> > > > 
> > > > > +	const uint64_t default_modifiers[] = {
> > > > > +		DRM_FORMAT_MOD_LINEAR,
> > > > > +		DRM_FORMAT_MOD_INVALID
> > > > 
> > > > + Comma?
> > > 
> > > There is no mention in the coding style about adding/removing a comma to the
> > > last element of an array. Is there a policy in drm driver?
> > > 
> > > I think the advantage of adding a comma to the last element of an array is
> > > that diff is only one line when an element is added to the end.
> > > However since INVALID is always the last element in the modifiers array, I
> > > think it can be either in this case.
> > > If there is a policy, I will match it.
> > 
> > Indeed, but there is a common sense. The idea behind (multi-line) definitions
> > that when next time somebody will add an element in the array, there are will
> > be:
> > 
> > a) no additional churn (like in case of this patch, if the item will be added
> >     at the bottom;
> > 
> > b) an element that may not be added behind the terminator, which will look
> >     weird.
> > 
> > That said, the question is if the element is terminator one or not, if not,
> > comma is better than no comma and vise versa.
> 
> Ah I see. In this case, DRM_FORMAT_MOD_INVALID is terminator, so it
> should not have a comma.

Thanks for pointing this out. In this case we are good and any new item, AFAIU,
must be added before _INVALID one.

-- 
With Best Regards,
Andy Shevchenko


