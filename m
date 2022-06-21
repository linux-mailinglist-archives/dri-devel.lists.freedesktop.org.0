Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B43552CF3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 10:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1F10F912;
	Tue, 21 Jun 2022 08:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ED310F912
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655799982; x=1687335982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pjTJ5tsuGmNQmzdNqn4s5jOGa6yjUefbNssv4dohUcQ=;
 b=EVn4Z9Vxjtm8kDYhCemoqWQ6RY4vKlj6i6KarVN2U004rR0xQ7e2uYac
 bjT7cRr5LIOVxZNJExtDv3YWMlY6km4SZp6Vkey5dv0U8p/QD10OZKJxx
 SWwmhRO+M6dEUEL4EEHK+ZpocxA4c8bGnVAOgImzbjU/LdpTCYl0wlrM6
 IqrlG1R9BknRTp2P8xFvcEHSrJ2+fzqOUaFu0zWaixRJo/onA/RD8FnGy
 AiaBzC5WYpM+AhV4FAdY8gyO0+4kGP4aWBZzOYbq0zwXKYWIEo3Nu8pRW
 L6j6sDqGCNmX0KUsHcR4cbv1kSGnCF3r6BoRj5mnvGayeq+fFdgk0F7Re w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="281119507"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="281119507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 01:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591553905"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga007.fm.intel.com with SMTP; 21 Jun 2022 01:26:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Jun 2022 11:26:17 +0300
Date: Tue, 21 Jun 2022 11:26:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/xlnx: Fix build failure due to missing include
Message-ID: <YrGAqShFILDRVzop@intel.com>
References: <20220621075648.7717-1-ville.syrjala@linux.intel.com>
 <YrF+J5J5l6UEgPcU@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrF+J5J5l6UEgPcU@pendragon.ideasonboard.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hyun Kwon <hyun.kwon@xilinx.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 11:15:35AM +0300, Laurent Pinchart wrote:
> Hi Ville,
> 
> Thank you for the patch.
> 
> On Tue, Jun 21, 2022 at 10:56:48AM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Dropping drm_blend.h from drm_crtc.h broke the
> > xlnx driver. Make it build again by including
> > drm_blend.h from the driver directly.
> > 
> > My .config was missing some required dependencies so
> > I never build tested it :/
> > 
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 90bb087f6674 ("drm: Drop drm_blend.h from drm_crtc.h")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks. Pushed to drm-misc-next.

> 
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > index 11c409cbc88e..cc32aa89cf8f 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -12,6 +12,7 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_atomic_uapi.h>
> > +#include <drm/drm_blend.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_fb_cma_helper.h>
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Ville Syrjälä
Intel
