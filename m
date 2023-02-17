Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3869A920
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C1310EF52;
	Fri, 17 Feb 2023 10:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF2F10EF6F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676630113; x=1708166113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CdhAXIvYTOKL/PsZqets42lPIRlWgVDbIaVVP5Yek3g=;
 b=HsSyfpzUOhReSSjjbZ1AyQnsQquzPTpIBZ/kk6kbdJgEuRwpo4H4lKSA
 aYXkehKElyMQRYt7Jo2UrPkVhaoAPJB91WhVreDe50z2e5ymNrG0Z79WC
 YWB2Redpckg8BHjV21K+uMWeuGHOLpVxmAxadyla3LWFqryx80Igfq/J4
 GloGHy4JX8f9AjzT4M7JMZ/DEcmpp4O117S9TnUKGC5O1fHjI222m4dNp
 piqDUVExTsNvm3RAZl/gFebAjeqJfGbR/dbvkzX6TiK48cRddyUGn7gL5
 nLIJJOJcMggVL6r+Xg9FzixAJqevx1aBietv4XRnSyf0AoSUDtAWYgCOS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394435983"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="394435983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:35:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759311077"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="759311077"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:35:03 -0800
Date: Fri, 17 Feb 2023 11:35:01 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <20230217103501.GC2862577@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com>
 <87lekxzgih.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lekxzgih.fsf@intel.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, daniel.vetter@ffwll.ch,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 07:06:46PM +0200, Jani Nikula wrote:
> >
> > But should not this the driver responsibility, call drm_debugfs_add_file()
> > whenever you are ready to handle operations on added file ?
> 
> In theory, yes, but in practice it's pretty hard for a non-trivial
> driver to maintain that all the conditions are met.

Hmmm... 

> In i915 we call debugfs register all over the place only after we've
> called drm_dev_register(), because it's the only sane way. But it means
> we need the init and register separated everywhere, instead of init
> adding files to a list to be registered later.

Isn't this done this way in i915 only because it was not possible
(and still isn't) to call drm_debugfs_create_file() before registration ?

I think it's should be ok by i915 subsystem to create it's debugfs
files and allow to access to them just after that subsystem init.

Or there are some complex dependencies between i915 subsystems,
that reading registers from one subsystem will corrupt some
other subsystem that did non finish initialization yet?

Regards
Stanislaw
