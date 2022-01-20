Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB41494B20
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 10:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D310E294;
	Thu, 20 Jan 2022 09:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16010E294
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642672405; x=1674208405;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qIB+dh1Dk9zzGAwKWBjEXANz77u+32acUfvZG0p9PIc=;
 b=GZkOJ6AHKbpRdRYcruLhGMJxyOAdXLTqQkmBi19nCjm/cSFZxZeeYFri
 6h6WqOSuxn5tuL0wJDtpmCND0j0AV2OYfJ3A1e3iGc/bpXK6a19rfjU54
 9oAC2ULo4krqN80Z3j2tvBvrZPod4DuhUkOatdkergbz83cRjDjRVwbma
 rvoH0FyN0+A09CQkdJMv9Y4twSkVhQxiay+FoETRUmwL88iBOgqTTipSV
 sFvM+J6aZMThnobk0MjUJmErDtBbycXbgdjir2hYhNX2GeMbFg+5nimUz
 MWNOahQyLIxLYZimsCjYWGZE2pKoWy1H4PhZNVniLRHtmTKGsrV2yb8Z1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="245512700"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="245512700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:53:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="518552716"
Received: from davidfsc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.140])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:53:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH v3 0/5] drm/dp: Move DisplayPort helpers into own module
In-Reply-To: <20220114114535.29157-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220114114535.29157-1-tzimmermann@suse.de>
Date: Thu, 20 Jan 2022 11:53:17 +0200
Message-ID: <87v8yeag36.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Split-off DisplayPort functions from KMS helper library and move them
> into their own module. Reduces the size of drm_kms_helper.ko by ~50%.

Sorry I failed to notice earlier, this breaks 'make htmldocs' build
because Documentation/gpu/ has references to the old filenames:

Error: Cannot open file ./drivers/gpu/drm/drm_dp_helper.c
Error: Cannot open file ./include/drm/drm_dp_helper.h
Error: Cannot open file ./include/drm/drm_dp_helper.h
Error: Cannot open file ./drivers/gpu/drm/drm_dp_helper.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_helper.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_cec.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_cec.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_cec.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_dual_mode_helper.c
Error: Cannot open file ./include/drm/drm_dp_dual_mode_helper.h
Error: Cannot open file ./include/drm/drm_dp_dual_mode_helper.h
Error: Cannot open file ./drivers/gpu/drm/drm_dp_dual_mode_helper.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_dual_mode_helper.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_mst_topology.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_mst_topology.c
Error: Cannot open file ./include/drm/drm_dp_mst_helper.h
Error: Cannot open file ./include/drm/drm_dp_mst_helper.h
Error: Cannot open file ./drivers/gpu/drm/drm_dp_mst_topology.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_mst_topology.c
Error: Cannot open file ./drivers/gpu/drm/drm_dp_mst_topology.c

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
