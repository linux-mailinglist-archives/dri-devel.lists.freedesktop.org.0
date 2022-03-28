Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E461D4E9808
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E597310EAF9;
	Mon, 28 Mar 2022 13:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE210EAF9;
 Mon, 28 Mar 2022 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648473974; x=1680009974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UyNq+meujktTNUT60/zoORREQWF3X7pQ8Rx6UC52WsY=;
 b=JFar2Bl23ZZMk0S3CTE2ywXBxc2YrHAqZ4INUwq/E5rmFsir7jbAl9IF
 FCRAfTao0PwLPclRVMg8bomm34lX3yW25NSynnnLoNZded0UAK2juvlBi
 0ZUcAtpi30m9Tb+s3MrWRlTaIaOgpJVxF8MsjQxmwclwh8xZCfKPH6+tu
 o1G4ue1r6xY5CE1JMO0r2liQPuVRJPk3VqOTXMGuhBgdbEpYIU8QQgGbm
 VIEYWVtx2qxhNcH2C2jrDsXbyu6GFgshHG4rA+isDdjEElSkqxeUG9h2c
 myp8OYbUGLI96z5tFnv+Bi95jIl8jpnUeQQu8/R1HmISiXbOtuPVcA4cK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258963886"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="258963886"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 06:26:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563655110"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 06:26:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/11] drm/edid: constify EDID parsing, with some fixes
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648458971.git.jani.nikula@intel.com>
Date: Mon, 28 Mar 2022 16:26:03 +0300
Message-ID: <87bkxqdx90.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/101787/ addressing some
> review comments from Ville.

Please ignore this series.

>
> Jani Nikula (11):
>   drm/edid: don't modify EDID while parsing
>   drm/edid: fix reduced blanking support check
>   drm/edid: slightly restructure timing and non-timing descriptor
>     structs
>   drm/edid: pass a timing pointer to is_display_descriptor()
>   drm/edid: use struct detailed_timing member access in is_rb()
>   drm/edid: use struct detailed_data_monitor_range member access in gtf2
>     functions
>   drm/edid: constify struct detailed_timing in lower level parsing
>   drm/edid: constify struct detailed_timing in parsing callbacks
>   drm/edid: constify struct edid passed to detailed blocks
>   drm/edid: constify struct edid passed around in callbacks and closure
>   drm/edid: add more general struct edid constness in the interfaces
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +-
>  drivers/gpu/drm/drm_edid.c                    | 287 ++++++++++--------
>  include/drm/drm_edid.h                        |  19 +-
>  3 files changed, 174 insertions(+), 138 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
