Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555F89BBA2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1EE112357;
	Mon,  8 Apr 2024 09:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vb/szwYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1A3112353;
 Mon,  8 Apr 2024 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568299; x=1744104299;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wpooisrpbJrHs59ZusHkqO1uExKk/XaTFIsOq2w7muY=;
 b=Vb/szwYWcq0UR03i8o3yHAO7fw8fxYmH2t5gFOG5HwgQTkYX1oiiaDtu
 UeJWN8+i9KcqbslPZP4qqxWLnmSqNrnVwKWZRfYpX54nXTO5AOkL3kVHm
 mUETh8Zpz5UEQ0+k7AvvLr210NtPYq6ovouujagLnV5DMKAlfM2x8CJv0
 AzUeu/7pVe267oEPhilnP1Vj+SLtDDLXZbXsAuRaZJ6w2oKPzHTMc28iu
 8j2vmbgLM+2bXsgEonTHOW1V9fHFtNtarWxwM7JF7fVI75XlVEY1oaV05
 LpDXpG5yR4sqhbdS6uHE/xUTQNRFrI4/5EkxhJj9DtWcYvpYXCp+YUmMZ Q==;
X-CSE-ConnectionGUID: swuIXck3RYuw5NRBgTveBA==
X-CSE-MsgGUID: oekBehXdSxiDp10oWTIrEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7702328"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7702328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:59 -0700
X-CSE-ConnectionGUID: jgrTQdY5QLey8UgiYrcKHw==
X-CSE-MsgGUID: T+SQNRRUQne4ltFXHE+DlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19861677"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/modes: add drm_mode_print() to dump mode in
 drm_printer
In-Reply-To: <ZhBG36AFIbFQ3dYk@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709843865.git.jani.nikula@intel.com>
 <54199d36993bfb00e29cc059ab9a215495405a99.1709843865.git.jani.nikula@intel.com>
 <375332cc-5d12-4afb-b00f-a9ef08209038@suse.de>
 <ZhBG36AFIbFQ3dYk@intel.com>
Date: Mon, 08 Apr 2024 12:24:54 +0300
Message-ID: <877ch8b40p.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Apr 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Apr 05, 2024 at 10:45:42AM +0200, Thomas Zimmermann wrote:
>> Am 07.03.24 um 21:39 schrieb Jani Nikula:
>> > +void drm_mode_print(struct drm_printer *p, const struct drm_display_m=
ode *mode)
>>=20
>> Could this be a printf function with a trailing format string as final=20
>> argument? The printed mode could then be part of another string instead=
=20
>> of just at the end of it.
>
> All this seems pretty much redundant. We already have
> DRM_MODE_FMT/ARGS so people can include the mode in any
> kind of format string they want.
>
> I would just nuke drm_mode_print() and all its ilk and
> let people format things themselves.

Fair enough. Did just that in v2, for all the non-driver stuff anyway.

BR,
Jani.

--=20
Jani Nikula, Intel
