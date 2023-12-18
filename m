Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1D8179C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE910E2D6;
	Mon, 18 Dec 2023 18:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40B410E1D8;
 Mon, 18 Dec 2023 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702924011; x=1734460011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TzdFWiBNAuwVCR3VsBKJShUDeiTYi+ArmIN4iuzwbj4=;
 b=F67g2NXVphs6HXUI1yVO/PQYR/T4Zo97yvQHmeLFrcaU7WSacbbE6cyN
 1Y9D5N53/iDVz1OzMtkdzGyxI6TVEjMJKYe/tPon8lj9/PxlTvEFjROji
 JpVGcg7EtgL+sQ5J/cVOJ+bNV9TJMBXuuzreDZJg49uexmcrrRORKajQx
 s8eDQm1I55qargTVYwgZtqngMt8JweMKQlYKyLghjUGeaW3TMC37khNth
 Bo8dS3vUtNvw9pyzVOaN1bbPi9dOXLWQwIMroGYDDpUxjxKXt5Qw8oDmv
 APhe3j87Kw/bsZSHXN1VkbeaCR/8K1uvuNIiCkevOvlOm85Tgf1A96Csg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="395234540"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; d="scan'208";a="395234540"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 04:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768832440"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; d="scan'208";a="768832440"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 18 Dec 2023 04:56:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 14:56:04 +0200
Date: Mon, 18 Dec 2023 14:56:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/mm: Allow CONFIG_DRM_MM_DEBUG with DRM=m
Message-ID: <ZYBBZNAab1fyKPoJ@intel.com>
References: <20231215111129.9559-1-ville.syrjala@linux.intel.com>
 <87o7ern1gn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7ern1gn.fsf@minerva.mail-host-address-is-not-set>
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

On Fri, Dec 15, 2023 at 12:34:48PM +0100, Javier Martinez Canillas wrote:
> Ville Syrjala <ville.syrjala@linux.intel.com> writes:
> 
> Hello Ville,
> 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The original rationale for
> > commit cd456f8d06d2 ("drm: Restrict stackdepot usage to builtin drm.ko")
> > was that depot_save_stack() (which is what we used back then)
> > wasn't exported. stack_depot_save() (which is what we use now) is
> > exported however, so relax the dependency allow CONFIG_DRM_MM_DEBUG
> > with DRM=m.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 31cfe2c2a2af..4b8b8f8a0e72 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -42,7 +42,7 @@ config DRM_MIPI_DSI
> >  config DRM_DEBUG_MM
> >  	bool "Insert extra checks and debug info into the DRM range managers"
> >  	default n
> > -	depends on DRM=y
> > +	depends on DRM
> >  	depends on STACKTRACE_SUPPORT
> >  	select STACKDEPOT
> >  	help
> > -- 
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks. Pushed to drm-misc-next.

-- 
Ville Syrjälä
Intel
