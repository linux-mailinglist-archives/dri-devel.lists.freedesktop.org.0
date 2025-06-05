Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7AAACEFF7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D0810E9B2;
	Thu,  5 Jun 2025 13:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2pI3C2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B6210E998;
 Thu,  5 Jun 2025 13:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749128794; x=1780664794;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=cfYbvRU+LUNssok2ACE1jD36mdawH+Pv04X8EAQrdVg=;
 b=L2pI3C2IYCDG07Cg7lHvjS6llWaECi2nZE9SZMJsZYB2RAuN0m52lbnf
 0qJPTNp6A6IGXHrQUMj2nssiJbNox/wZv4lg+bCwbD+EUiVzI9gTKNm2x
 sHc6iHgP/t7oNykr8YkgZ5TK1WsS9e9hOtUhnMlBFr+EUUhtMddi/Qe4a
 DEnviDIk1SDpyyFp4YxbzlhMK2Q+mvILjiSOvutSyuLioGbvd0JEPiMQp
 rB3oeBnSMrmG8HpKCJQarg+EMulX1JSYbL3fwBPwvscEF/xvsbjpq2Qxd
 i5WXrDhDaXABrsF+IMrVahyjTd/zIodfx177x161VlyMfiIAcrZq8xy3p Q==;
X-CSE-ConnectionGUID: r7CblO3vTRCFoZ41K9mUQg==
X-CSE-MsgGUID: fl0uKWBdSsGI5VDAIujnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51391654"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51391654"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:06:34 -0700
X-CSE-ConnectionGUID: p8pSwFgtRkyYnXdXU+BOTg==
X-CSE-MsgGUID: rXZZk8mATVi4ndUZfEHRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150659448"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:06:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] drm/edid: Define the quirks in an enum list
In-Reply-To: <20250605082850.65136-3-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-3-imre.deak@intel.com>
Date: Thu, 05 Jun 2025 16:06:30 +0300
Message-ID: <a2c150380f827d4a4a6ebb6b9a71d0280293d7dd@intel.com>
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

On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> +static bool drm_edid_has_internal_quirk(struct drm_connector *connector,

Nitpick, this could've been const. No big deal.

> +					enum drm_edid_internal_quirk quirk)
> +{
> +	return connector->display_info.quirks & BIT(quirk);
> +}
> +

-- 
Jani Nikula, Intel
