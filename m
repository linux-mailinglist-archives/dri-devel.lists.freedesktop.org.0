Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6344134C4A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 21:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4396E32F;
	Wed,  8 Jan 2020 20:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3476E32F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 20:04:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 456F920021;
 Wed,  8 Jan 2020 21:04:18 +0100 (CET)
Date: Wed, 8 Jan 2020 21:04:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Message-ID: <20200108200416.GA32453@ravnborg.org>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
 <20200107160852.GD43062@phenom.ffwll.local>
 <20200107181752.GA20555@ravnborg.org>
 <20200108184920.GI43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108184920.GI43062@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=z3XEeJo_DTYVsUXuRXcA:9 a=CjuIK1q_8ugA:10
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
Cc: Jani Nikula <jani.nikula@intel.com>, Joe Perches <joe@perches.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.
> > > 
> > > I'd replace the entire block with a "This stuff is deprecated" warning. We
> > > have at least a corresponding todo.rst entry.
> > 
> > We have many situations where no drm_device is available.
> > At least when you a buried in drm_panel patches.
> > 
> > So it is either DRM_DEV_ERROR() or drv_err().
> > Which is why I have pushed for nicer drm_ variants of these...
> 
> Huh, drm_panel indeed has no drm_device. And I guess we don't have a
> convenient excuse to add it ...
> 
> > The todo entry only covers the nice new macros that Jani added
> > where we have a drm_device.
> 
> I wonder whether for those cases we shouldn't just directly use the
> various dev_* macros?

We would miss the nice [drm] marker in the logging.
So [drm] will be added by the drivers and the core - but not the panels.
That is the only drawback I see right now.

Which was enough justification for me to add the drm_dev_ variants.
Feel free to convince me that this is not justification to add these
variants.

In drm/panel/* there is no use of DRM_DEBUG* - and there is no
reason to introduce the variants we can filer with drm.debug.

There is a single DRM_DEBUG() user, which does not count here.


We could introduce only:

drm_dev_(err|warn|info|debug) - and not the more specialized variants.

Then we avoid that people make shortcuts and use drm_dev_dbg_kms() when
they are supposed to use drm_dbg_kms().
This was one of the very valid argumest against the patch that
introduced all the drm_dev_* variants.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
