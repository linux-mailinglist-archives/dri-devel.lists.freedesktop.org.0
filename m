Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E86B17A9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 01:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505DF10E768;
	Thu,  9 Mar 2023 00:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A090610E768;
 Thu,  9 Mar 2023 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320661; x=1709856661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dQkCKAuKvGv0Y6AoZTHOwCb6LMN3RatJ0LTslTXRxC0=;
 b=HnknNlAKIQCztILqXZSiup7o9/syAOo28TWJ0KoFdaKfjxBdRu2Ikjro
 qk2d8fi072bNNVziQYxJunVBFvDJIR/AkCRrAI1Yj0VzxOsRIRS029f4O
 nRrc5zuBlNWDjxB1rD/azGePJr6wrXV4neIYS//mhXAT4NcJ1mHVWIVQt
 lu08QTsQ4RppyDYFaG5GW6GH7xPDxx7e3KQHqs3pWhQepy3yWlG6bl2es
 DITgydlPa4bRWo1JEnCBNGPOeVTDDlF3ygcVRsgWo3uFSxV+UFSKXAfZc
 Caxw7cWuwu0v4Xyq5lHiiaG+Wkic4EZyymT+MC80Dkp2M+d6SMDtN4AdP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333782467"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="333782467"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787343179"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787343179"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 08 Mar 2023 16:10:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Mar 2023 02:10:57 +0200
Date: Thu, 9 Mar 2023 02:10:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC] drm: property: use vzalloc() instead of kvzalloc() for
 large blobs
Message-ID: <ZAkkEXlE0nwdFTYy@intel.com>
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
 <ZAjvc7jjKDNSJcjq@intel.com>
 <CAF6AEGvMyDb7kwZU5Uk14nRNOe1-eFUVmXEsnLiGKL7R0kOjPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvMyDb7kwZU5Uk14nRNOe1-eFUVmXEsnLiGKL7R0kOjPQ@mail.gmail.com>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 03:33:48PM -0800, Rob Clark wrote:
> On Wed, Mar 8, 2023 at 1:23 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Wed, Mar 08, 2023 at 12:02:42PM -0800, Abhinav Kumar wrote:
> > > For DRM property blobs created by user mode using
> > > drm_property_create_blob(), if the blob value needs to be updated the
> > > only way is to destroy the previous blob and create a new one instead.
> > >
> > > For some of the property blobs, if the size of the blob is more
> > > than one page size, kvzalloc() can slow down system as it will first
> > > try to allocate physically contiguous memory but upon failure will
> > > fall back to non-contiguous (vmalloc) allocation.
> > >
> > > If the blob property being used is bigger than one page size, in a
> > > heavily loaded system, this causes performance issues because
> > > some of the blobs are updated on a per-frame basis.
> > >
> > > To mitigate the performance impact of kvzalloc(), use it only when
> > > the size of allocation is less than a page size when creating property
> > > blobs
> >
> > Not sure how badly this will eat into the vmalloc area.
> 
> Normally I wouldn't expect this to be much of a problem, but we don't
> appear to restrict CREATEBLOBPROP to DRM_MASTER, which seems like it
> might have been a mistake.. so perhaps we want to either restrict
> CREATEBLOBPROP or put an upper threshold limit on total size of all
> allocated blob props using vmalloc area?

Surprisingly few kms ioctls are master-only it seems. Dunno
what the use case for all those being non-master really is.

I think blob limits in general were disussed at at various
points in the past with no conclusion. I guess it's slightly
problematic in that if you limit individual max blob size
then they just create more smaller ones. If you limit the
total size per fd they just open more fds. If you put a total
upper limit then it's just a slightly quicker DoS than
without the limit. Shrug.

> 
> BR,
> -R
> 
> > Is there no GFP flag to avoid the expensive stuff instead?
> >
> > >
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/drm_property.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> > > index dfec479830e4..40c2a3142038 100644
> > > --- a/drivers/gpu/drm/drm_property.c
> > > +++ b/drivers/gpu/drm/drm_property.c
> > > @@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
> > >       if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
> > >               return ERR_PTR(-EINVAL);
> > >
> > > -     blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> > > +     if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
> > > +             blob = vzalloc(sizeof(struct drm_property_blob)+length);
> > > +     else
> > > +             blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> > > +
> > >       if (!blob)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > --
> > > 2.7.4
> >
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
