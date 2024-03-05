Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B876A871904
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4173112960;
	Tue,  5 Mar 2024 09:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7LnKbRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0B1112960;
 Tue,  5 Mar 2024 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709629670; x=1741165670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PabEaAApIOF3LC4I0w3XQzRUcCJojJ/mkgkUqmFHPHU=;
 b=U7LnKbRBQOcrHzN7pkxX1cYyzaPKHcU22Q1FMdfiuHO5+ifvyQPYLY1f
 FRXb5emnsxTg1uUJ3lU1/8BFTZ+jccCClptjcxItWJGTLCDs/TBU4rU4V
 gqNdThAv/uctjoap17lsBoox38JhDxS7OIjuV/Wl41ZE8sgkAvg2VOzQS
 mbQZoQEvX8R11Pv6WCbQ9nVLfJSFbTDg4UsLdsVuOo10Be9kYexCknRLl
 4JSkmcZvgIZIiGNy/fhVS88HDjqSvAzRLjQMwwt5DWKmHIRfE+IDbiEmG
 xmSvJ0m9X88HFAVVecCCvWXyzCB6QjMYkU7HKBLVlHmepuMZxe8h7Ev7E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4026997"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4026997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9427335"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:07:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [RESEND v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
Date: Tue,  5 Mar 2024 11:07:34 +0200
Message-Id: <cover.1709629403.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

Resend of [1] with an intent to merge after the CI results come in. This
is aiming for v6.10, so we'll have maximal time to find all the issues
my configs didn't catch.

I built this on x86-64 (both gcc and clang), arm and arm64, and
everything passed.

BR,
Jani.

[1] https://lore.kernel.org/all/cover.1706797803.git.jani.nikula@intel.com/


Jani Nikula (2):
  drm: enable (most) W=1 warnings by default across the subsystem
  drm: Add CONFIG_DRM_WERROR

 drivers/gpu/drm/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/Makefile | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.39.2

