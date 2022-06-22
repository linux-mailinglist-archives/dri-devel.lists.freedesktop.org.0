Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C084554BE3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3D910F960;
	Wed, 22 Jun 2022 13:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72D10F960;
 Wed, 22 Jun 2022 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655906105; x=1687442105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BQH0ib7BJP53+vv9qm6VL+9HqIy4C+9f1swlr6W4v7M=;
 b=ctfOvCK9nZZwOi+t3gtXS3pyuNr+5iW7/l9wOFTXQ+l/8b0BaPg8liv0
 OOgsgjvQRxW/Zvu0s4kSW3GDreFbOvwJxEQ/PIQ7Jv+cUg/vBrWxsgzSr
 WzLaPwHgtmO4/wsNwwiGGBKYSbWHOcYPN8ui2z/PnkWymEMNwl7ED+6f6
 tykZYYLzLyTauPx8lhdwvU1X3/uUe+zU7kA1LY399+1fyCPqwMZvL5HHE
 wuvIzCbpXko6Z7nb/Hcgvsw60FlNX0IxBV/RXqjoblrmY8ulkaXQLoEuK
 tIeAPf3tOO1NSLxhcDuShNg5VYHH5KrCN56O2on3jVWCtq/o1T3ps6wKt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="277967374"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="277967374"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 06:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="585731566"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 22 Jun 2022 06:55:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 16:55:00 +0300
Date: Wed, 22 Jun 2022 16:55:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <YrMfNBP4xSnSF+YS@intel.com>
References: <20220621123656.7a479ad9@canb.auug.org.au>
 <YrF3wfumVi3q3bFj@intel.com>
 <20220622110451.27c68263@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622110451.27c68263@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 11:04:51AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 21 Jun 2022 10:48:17 +0300 Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Jun 21, 2022 at 12:36:56PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/gpu/drm/xlnx/zynqmp_disp.c: In function 'zynqmp_disp_create_planes':
> > > drivers/gpu/drm/xlnx/zynqmp_disp.c:1260:17: error: implicit declaration of function 'drm_plane_create_zpos_immutable_property'; did you mean 'drm_plane_create_scaling_filter_property'? [-Werror=implicit-function-declaration]
> > >  1260 |                 drm_plane_create_zpos_immutable_property(&layer->plane, i);
> > >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >       |                 drm_plane_create_scaling_filter_property
> > > drivers/gpu/drm/xlnx/zynqmp_disp.c:1262:25: error: implicit declaration of function 'drm_plane_create_alpha_property'; did you mean 'drm_plane_create_color_properties'? [-Werror=implicit-function-declaration]
> > >  1262 |                         drm_plane_create_alpha_property(&layer->plane);
> > >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >       |                         drm_plane_create_color_properties
> > > cc1: all warnings being treated as errors
> > > 
> > > Presumably caused by one of the commits that dropped includes from
> > > drm-ctrc.h.
> > > 
> > > I have used the drm-misc tree from next-20220620 for today.  
> > 
> > Sorry about that. Looks like my .config was missing some
> > dependencies of the zynqmp driver so it wasn't getting built.
> > I'll cook up a fix.
> 
> And today, I get these:
> 
> In file included from include/linux/list.h:5,
>                  from include/linux/preempt.h:11,
>                  from include/linux/spinlock.h:55,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/mm.h:7,
>                  from include/linux/hyperv.h:17,
>                  from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_rect':
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
<snip>
> cc1: all warnings being treated as errors
> 
> Please do some allmodconfig builds.

Ugh, I really wish kconfig had a reasonable way to enable exactly
the things I want rather than having to build absolutely everything...

Anyways, someone else beat me to a fix:
https://lists.freedesktop.org/archives/dri-devel/2022-June/360608.html

Sorry for the continued woes.

-- 
Ville Syrjälä
Intel
