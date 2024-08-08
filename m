Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A794B96B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 11:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66C410E694;
	Thu,  8 Aug 2024 09:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ck4NZpMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091110E1E3;
 Thu,  8 Aug 2024 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723107712; x=1754643712;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uZMzXGydL3z2UbihJa1je31JGvQYBJxg1XffOKS/+QU=;
 b=ck4NZpMrzBmqNV+j/a82Q7VBlcRgThvMM+defD/P/XiDt1WSSkssWJ8l
 Ope1Ru5Tt/yX/msPYJPbOFcSn0ZIsrgdAyQyLDMVEs5ncVO/TNcBx4WjP
 AgmBCDXPgI6gWnrv3eX6OvY6FxVQukEdt4sjySMeHCdZfZwvawUqPGK0C
 dTiub4bSMZZTMhVaffw/PqDxnmnsaki9nrd1K9pxytkRiEVFVPwbrHbNt
 lCrl0tvc2U/YFGAsKLbmTBhOXftMvjC6hAw/x35JpgKoLvCtbq/92h4QG
 b8QTOO7Hdm2sg5bdNb52Sa1CrwdxBpT2Z46UimwVDJPYCpzVJleC3zz2P w==;
X-CSE-ConnectionGUID: QLK4MEB4RN6WgqwPbR3sAg==
X-CSE-MsgGUID: CWtUqEJPThuZxp4Fmvssdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21192000"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21192000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:01:51 -0700
X-CSE-ConnectionGUID: n4eEOtS4QkiiFz/s7EoJQw==
X-CSE-MsgGUID: U1dlyy+9Qqmzc0CORz6FiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="62101659"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:01:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
Cc: Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, kernel-dev@igalia.com, Melissa Wen
 <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/9] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
In-Reply-To: <20240807203207.2830-1-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240807203207.2830-1-mwen@igalia.com>
Date: Thu, 08 Aug 2024 12:01:43 +0300
Message-ID: <87a5hn4cco.fsf@intel.com>
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

On Wed, 07 Aug 2024, Melissa Wen <mwen@igalia.com> wrote:
> Here AMD display driver migrates from open struct edid to opaque
> drm_edid. This version works on top of amd/drm-next branch since
> amd-staging-drm-next doesn't have the commits that support
> drm_edid_product_id[1]. It's mostly addressing Alex Hung's feedback
> from the previous version.

FWIW, I glanced through this and didn't spot anything out of the
ordinary. That said, I also didn't do detailed review of it, so I'm not
providing my R-b.

BR,
Jani.


-- 
Jani Nikula, Intel
