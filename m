Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CE822B0C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374A010E2F7;
	Wed,  3 Jan 2024 10:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C4110E2F7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276727; x=1735812727;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=1Ohq92M45n7tnua1yF5LE1RuAOsMqFIxQOuHHS8pOOI=;
 b=b93po0Z2vmKo2MZylnYXO5boRTUrx4cDqsbdL6VKWjNayKnwqcTQ7crC
 lsQSAItIa5a95E+JmTHEOcUOjCokkkL8wxl5TCZeR9ekYmxWGmVpZzFkt
 jJTvoTJ9JaRNanbGJItMb2jVcXVql8j8UK3lfChf28B1YQowxU2hOHUgL
 vugt40yBPFo1Pm8695IOu5BWePJSgBdTEKuuZUvvK/xSVD69mCBECA5BQ
 nibDigEO3TiE89mOJ8S5BXb3MgZM/8KXPQYYYGBdrT4mFodfnLoZck6eU
 xorCN9g+akAOhupDxfpArOOh2McNfO8/cX4dnmiN6OwpM093/4vgLmv7M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341940"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953185033"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953185033"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 00/39] drm/bridge: switch to struct drm_edid
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704276309.git.jani.nikula@intel.com>
Date: Wed, 03 Jan 2024 12:11:50 +0200
Message-ID: <87cyui20bd.fsf@intel.com>
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

On Wed, 03 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Convert all of drm/bridge to the new struct drm_edid
> infrastructure. It's safer than struct edid, because it contains meta
> information about the allocated size of the EDID, instead of relying on
> the size (number of extensions) originating from outside of the kernel.
>
> Among all of drm, I think bridge has the most uses of struct edid that
> do not originate from the drm_get_edid() family of functions, which
> means the validity checks are somewhat inconsistent, and having the meta
> information is more crucial.
>
> Only build tested. I'm sure there should be more Cc's especially in the
> patches towards the end of the series, but I just wanted to get the
> series out the door now.

PS. It's also available at
https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge


-- 
Jani Nikula, Intel
