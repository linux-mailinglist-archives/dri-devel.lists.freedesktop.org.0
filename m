Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D278672BB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559F10F095;
	Mon, 26 Feb 2024 11:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7JlBQ5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7282410F092;
 Mon, 26 Feb 2024 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945948; x=1740481948;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4XWaAgwx7oFr2VXWZiR9l2/lMcqy78gc1Riyt5vZYbk=;
 b=O7JlBQ5uWp+wL609zoAOCuAH4jhCtqs9Q0xQoGpghpgb+5MdgpbcC1PU
 V5BlO64+fAgGSwV7hx8LxEbwUalW5GNNm7UwQYTAWFCU6yEi70t2dmVBr
 ACf861lTYbk/gN9VMycidmzwJmiS6cmbJjsSLH7bsW3Z+1qLomVok/jof
 nateQkQ3Z+i0q451iwk76KbIemTWdB6OIq+p2N9K44trM/phvhQUPu6dN
 gzQdBgYp/y8P6iux0kCEykjABVvkOH6/RHs7FKnvf1C6ARUsBoJ7IFuOR
 ipyhbtglyuJeUlXUSaK5Q3lG89mOCoaLvodj/QETuIh/4uVWFBNL37k2l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3066020"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3066020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6560445"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:12:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, hersenxs.wu@amd.com, magalilemes00@gmail.com
Cc: kunit-dev@googlegroups.com, tales.aparecida@gmail.com,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 javierm@redhat.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 7/8] drm/amd/display: Introduce KUnit tests to
 dc_dmub_srv library
In-Reply-To: <20240222155811.44096-8-Rodrigo.Siqueira@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
 <20240222155811.44096-8-Rodrigo.Siqueira@amd.com>
Date: Mon, 26 Feb 2024 13:12:17 +0200
Message-ID: <87jzmro4xa.fsf@intel.com>
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

On Thu, 22 Feb 2024, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:
> diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
> index eb6f81601757..4c5861ad58bd 100644
> --- a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
> +++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
> @@ -4,5 +4,6 @@ CONFIG_DRM=y
>  CONFIG_DRM_AMDGPU=y
>  CONFIG_DRM_AMD_DC=y
>  CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
> +CONFIG_AMD_DC_KUNIT_TEST=y
>  CONFIG_DCE_KUNIT_TEST=y
>  CONFIG_DML_KUNIT_TEST=y

A bit random patch to comment on, but this hunk demonstrates the point:

Should all the configs have DRM_AMD_ prefix to put them in a
"namespace"?


BR,
Jani.


-- 
Jani Nikula, Intel
