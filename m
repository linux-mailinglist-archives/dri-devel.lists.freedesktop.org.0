Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D17EA220
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E1890BE;
	Mon, 13 Nov 2023 17:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014210E3DC;
 Mon, 13 Nov 2023 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699897083; x=1731433083;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tQwJKn5GMbmfpgON4rV066EJD/Pxhm3hDl+bMUfR99A=;
 b=ZSbt/tRJIGljSPyDYuzHe/B0EeVvAb0VKlB40Hc7zJVB2xPfEhG00sd7
 6AW9FfW6QS8R3zAdsXsWQ92zN20yb9iwqjZTI1ZOizlqvvumhWnGtVjmR
 c3Ng/CgKxFG9qDTsIwmqDlXmmPKkeACgRcJ8/SlDW4v/pI6EFUWJVWuyN
 5AmhbT7mSzIh8XxpWUC4WjOsQF9ndQlr+Nosl9Uzps4Z6Q4ZEdz7jS5eL
 SMluRTkY1S5h6EXIqP+ewuzWU8H3P8QsRnfTyRkGp4uPyoZdTsUiE6V8v
 kVK9X1er2na3rpBQH1Cx/OVj+gVafNZsQvYo9BRMukxt4PhxJz+1o5mxd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476695456"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="476695456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937795819"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937795819"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:38:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/i915: Fix LUT rounding
In-Reply-To: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
Date: Mon, 13 Nov 2023 19:37:57 +0200
Message-ID: <87cywdtuyy.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Oct 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The current LUT rounding is generating weird results. Adjust
> it to follow the OpenGL int<->float conversion rules.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Ville Syrj=C3=A4l=C3=A4 (4):
>   drm: Fix color LUT rounding
>   drm/i915: Adjust LUT rounding rules
>   drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
>   drm/i915: Fix glk+ degamma LUT conversions
>
>  drivers/gpu/drm/i915/display/intel_color.c | 70 +++++++++++-----------
>  include/drm/drm_color_mgmt.h               | 18 +++---
>  2 files changed, 42 insertions(+), 46 deletions(-)

--=20
Jani Nikula, Intel
