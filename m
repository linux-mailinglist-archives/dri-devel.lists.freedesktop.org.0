Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733B45082F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E48892E4;
	Mon, 15 Nov 2021 15:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0D89276
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:23:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="294279316"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="294279316"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 07:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505955812"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 15 Nov 2021 07:22:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 15 Nov 2021 17:22:57 +0200
Date: Mon, 15 Nov 2021 17:22:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: pre-fill getfb2 modifier array with INVALID
Message-ID: <YZJ7UcXdNIvk918E@intel.com>
References: <20211111101049.269349-1-contact@emersion.fr>
 <YY0RjSE7mI4kkKNJ@intel.com>
 <D-6FSEcdyTRAZxrnW6mcb0iOVY3NfKMbT8WS7-f9Wn4i9jQ0YbmInyMwZRwb_aLzPvUSWz_KPs34RQ1tkCb3xuISVkTyjkmV5aMfGcdkQl8=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D-6FSEcdyTRAZxrnW6mcb0iOVY3NfKMbT8WS7-f9Wn4i9jQ0YbmInyMwZRwb_aLzPvUSWz_KPs34RQ1tkCb3xuISVkTyjkmV5aMfGcdkQl8=@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 09:18:42AM +0000, Simon Ser wrote:
> On Thursday, November 11th, 2021 at 13:50, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Nov 11, 2021 at 10:10:54AM +0000, Simon Ser wrote:
> > > User-space shouldn't look up the modifier array when the modifier
> > > flag is missing, but at the moment no docs make this clear (working
> > > on it). Right now the modifier array is pre-filled with zeroes, aka.
> > > LINEAR. Instead, pre-fill with INVALID to avoid footguns.
> > >
> > > This is a uAPI change, but OTOH any user-space which looks up the
> > > modifier array without checking the flag is broken already, so
> > > should be fine.
> > >
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Daniel Stone <daniels@collabora.com>
> >
> > Isn't this going to break the test where we pass the get
> > getfb2 result back into addfb2?
> 
> Shouldn't be the case, since the kernel will ignore modifiers if the
> flag isn't set.

if (r->modifier[i] && !(r->flags & DRM_MODE_FB_MODIFIERS)) {
	DRM_DEBUG_KMS("bad fb modifier %llu for plane %d\n",
		r->modifier[i], i);
	return -EINVAL;
}

-- 
Ville Syrjälä
Intel
