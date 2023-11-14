Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78F7EAF87
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 12:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641510E203;
	Tue, 14 Nov 2023 11:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871A710E203
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962838; x=1731498838;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=HtTZEK+gEN4iqqJvS2DZKzn621HxO4uqTPhcz9tCZDQ=;
 b=I7QwDrrvRf3CKqe5Km+Dmm1PMt7WhUDkLc1WZ6MXBtPRLhwdQr3z4yZM
 Kou5Jf/03nlDlLx95bdXG0JHA0rmbY2GAzVe8LB9fILjNfLe24PYEbonR
 GrdnQl3Jk1sBJXFj42Jf57znUoKzN/vqogIjukmLM0l3wXoaJCPQsLr/I
 kc3y6b8L6LOzWBPT7+XJlERAzbPsd3uRCWagmN7iQZKV4iCpZdz2mip2B
 8JGXuOdeq2xn3hm7+RHZyZ+IqEbN6VvPhJhNWVZpSgxRerkyeic6tSeRJ
 EOvHkOf9dmcQEdm5aoaRNAacvYfRDoEOvZrN8zsgJb3OpyTzMZsFtgKsc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3744678"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3744678"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764640278"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764640278"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:53:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
In-Reply-To: <cover.1698312534.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1698312534.git.jani.nikula@intel.com>
Date: Tue, 14 Nov 2023 13:53:51 +0200
Message-ID: <87jzqksg8g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> This is just the first two patches of a lengthy series that I'm not
> really sure how to proceed with. Basically the series converts all of
> drm/bridge to the new struct drm_edid infrastructure. It's safer than
> struct edid, because it contains meta information about the allocated
> size of the EDID, instead of relying on the size (number of extensions)
> originating from outside of the kernel.
>
> The rest is at [1]. The commit messages are lacking, and I don't really
> have the toolchain to even build test most of it. But I think this is
> where drm/bridge should go. Among all of drm, I think bridge has the
> most uses of struct edid that do not originate from the drm_get_edid()
> family of functions, which means the validity checks are somewhat
> inconsistent, and having the meta information is more crucial.
>
> Bridge maintainers, please instruct how to best proceed with this.

Ping.

The two patches posted here could be merged, to add something to build
the later commits on gradually.

BR,
Jani.

>
>
> Thanks,
> Jani.
>
>
>
> [1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge
>
>
>
> Jani Nikula (2):
>   drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
>   drm/bridge: switch to drm_bridge_read_edid()
>
>  drivers/gpu/drm/drm_bridge.c           | 46 +++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_bridge_connector.c | 16 ++++-----
>  include/drm/drm_bridge.h               | 33 ++++++++++++++++++
>  3 files changed, 86 insertions(+), 9 deletions(-)

-- 
Jani Nikula, Intel
