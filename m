Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA4638995
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311C110E073;
	Fri, 25 Nov 2022 12:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939B510E073;
 Fri, 25 Nov 2022 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669378773; x=1700914773;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0WtpDVWBG+zhh3Y4Q6BftP2unUL5fItEvjAQ+XxkdzM=;
 b=DW4A2Mc0OmhH0zbhcZG1skcm5WELxqBq028PnD4xX0625ixDlGu8uTam
 p88UdfCJP4MCao2rEgwcTO+UPNI77bXOxZdNHvnQ/34jPMTe0BiIyR2Kb
 2GefoTk+sZFcV/AeCb2Pi/gnJEVqhkYekPxDNKUG6uMLDfRVxAGyfI+47
 UUa49NhKyI4MrB8YJCiQtUyrxsnULWnbpU5MTQkM5e189ieS/V5AvEPs3
 SPercP3+DMGK/08CtXdZ+uQkkOfp/rwu0WA/5sCLkz5Fh5NDUEtMySuCF
 8NA7FDItWz3b7xIqX1ruHn69qD2/LTE6y0ICJDS80KyBKO5EHV7W46DDX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="313171321"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="313171321"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 04:19:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="642690318"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="642690318"
Received: from kbielowk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.128.177])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 04:19:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC 0/2] drm/connector: connector iterator with filtering
In-Reply-To: <cover.1664966047.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1664966047.git.jani.nikula@intel.com>
Date: Fri, 25 Nov 2022 14:19:27 +0200
Message-ID: <87wn7j446o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Oct 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Currently i915 assumes all drm_connectors it encounters are embedded in
> intel_connectors that i915 allocated. The drm_writeback_connector forces
> a design where this is not the case; we can't provide our own connector,
> and writeback embeds the drm_connector it initializes itself.
>
> To use drm writeback, none of the i915 connector iteration could assume
> the drm connector is embedded in intel_connector. Checking this is
> tedious, and would require an intermediate step with
> drm_connector. Here's an idea I came up with; filtering at the drm
> connector iterator level with a caller supplied function. Not too much
> code, and could be used for other things as well.
>
> Mind you, we'd still much rather modify drm writeback to allow passing
> the connector i915 allocated, instead of the current midlayer design
> that forces drivers to a certain model. Working around this is a bunch
> of error prone and tedious code that we really could do without.

Any feedback on this one?

BR,
Jani.

>
>
> BR,
> Jani.
>
>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Jani Nikula (2):
>   drm/connector: add connector list iteration with filtering
>   drm/i915: iterate intel_connectors only
>
>  drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
>  .../drm/i915/display/intel_display_types.h    |  7 +++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
>  .../drm/i915/display/intel_modeset_setup.c    |  6 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
>  include/drm/drm_connector.h                   |  9 +++
>  10 files changed, 89 insertions(+), 26 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
