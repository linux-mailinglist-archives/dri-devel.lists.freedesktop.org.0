Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95494BB8C1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6A610E4E7;
	Fri, 18 Feb 2022 11:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB6810E391;
 Fri, 18 Feb 2022 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645185423; x=1676721423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mP4AAe6GEPELC8qa7HPpCq/3z8XeScXVNdFcHpVrhbg=;
 b=B+n7Wa8WvWl2hN0OJHxvungEeufXL13aenEkmKYMUGgjsMXTc7uPY82+
 N0rh5CMpk7jF6QNuTcmDaydq1G/DKHIsqwNZFbGyNHtpcnjLz03KPi66Y
 3KNgkK825tiRzQP3776vn9fFcnYCfvcM6vVvvTYaSKCKlRXewVvm+prAG
 HsWLSY6kwyQumBPe2ooHQWWQZ9df+0YXVxWNCxjP0LmcScFsQWbJ5rxys
 0aHMz2+u6/QJeH877d59GdswWs4dVfQ0oK4134DMKFOH43mS5wjuZOaU3
 boW2pfUql6paKKuQTIMaVPR12rWk4PjVScT/OnOq2rybXYtmbi3K00d/I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248708365"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="248708365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546253500"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 18 Feb 2022 03:56:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 13:56:58 +0200
Date: Fri, 18 Feb 2022 13:56:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 01/22] drm: Add drm_mode_init()
Message-ID: <Yg+JivyhsNufopPc@intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-2-ville.syrjala@linux.intel.com>
 <0e2baaab-6a38-5f80-5552-57326d781c43@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e2baaab-6a38-5f80-5552-57326d781c43@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 12:22:44PM +0100, Andrzej Hajda wrote:
> 
> 
> On 18.02.2022 11:03, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Add a variant of drm_mode_copy() that explicitly clears out
> > the list head of the destination mode. Helpful to guarantee
> > we don't have stack garbage left in there for on-stack modes.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/drm_modes.c | 17 +++++++++++++++++
> >   include/drm/drm_modes.h     |  2 ++
> >   2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 96b13e36293c..40d4ce4a1da4 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -892,6 +892,23 @@ void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *
> >   }
> >   EXPORT_SYMBOL(drm_mode_copy);
> >   
> > +/**
> > + * drm_mode_init - initialize the mode from another mode
> > + * @dst: mode to overwrite
> > + * @src: mode to copy
> > + *
> > + * Copy an existing mode into another mode, zeroing the
> > + * list head of the destination mode. Typically used
> > + * to guarantee the list head is not left with stack
> > + * garbage in on-stack modes.
> > + */
> > +void drm_mode_init(struct drm_display_mode *dst, const struct drm_display_mode *src)
> > +{
> > +	memset(dst, 0, sizeof(*dst));
> 
> Why not just clear the list head? Or maybe poison it? It would be more 
> cleaner.

Then we have two places that need to be updated if some other field
gets introduced that needs preserving. With a full memset() we only
have to care about drm_mode_copy(). Don't see much point in
micro-optimizing this thing.

-- 
Ville Syrjälä
Intel
