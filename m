Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA8B20531
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D1F10E419;
	Mon, 11 Aug 2025 10:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+27CZLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9410E42B;
 Mon, 11 Aug 2025 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754907807; x=1786443807;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=65eJZSSRt3cPTXm3JAK0M0pCUEwDjIvntc5u4VBmOjM=;
 b=m+27CZLVxGIl9zivEkQ+9aPwYpg2hDehlr1he2xO6AkjgKKx0rJaHY6Z
 ZSSlu8impTejnfnQ8c7a4uGqdn24FCCnmNJwpe0jkNsZdWfdRMD3kiOh/
 Zsx/cTTjKnmQXGOuxZWnMWjvx0j6pk5SKZE9p35Rj7XshMtvXFObKHEuT
 cZ0dpGN1SJSvQJCik8/gsd1or4j6HoajD9jy3C8yaxIMU28ai7cwhEk4H
 p2N5F8XBcgRJ6sJfvYdU199aDU72OlrwFirFZSrtE+KgIK2n3kZ6qSI1g
 XT80DlMQ7s+oyky0FtiSASRHuBThm6kvLoDwuzXwOX3k4DZVVXOESLVtJ g==;
X-CSE-ConnectionGUID: gzfIhYXkQ3+VLP/EMamfWw==
X-CSE-MsgGUID: nKBGQnfURjWHq26o8Dvk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74743356"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74743356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:23:26 -0700
X-CSE-ConnectionGUID: JnG1p0lnTE2t5fF6MXUH8g==
X-CSE-MsgGUID: LB9fGSCRRVSJd5nqNdgLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="169989246"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:23:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Brahmajit Das <listout@listout.xyz>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, simona@ffwll.ch
Subject: Re: [RFC PATCH 0/2] use new debugfs device-centered functions
In-Reply-To: <20250808225226.30465-1-listout@listout.xyz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250808225226.30465-1-listout@listout.xyz>
Date: Mon, 11 Aug 2025 13:23:20 +0300
Message-ID: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
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

On Sat, 09 Aug 2025, Brahmajit Das <listout@listout.xyz> wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which centers the debugfs files
> management on the drm_device instead of drm_minor.

Please base your patches on top of drm-tip. They no longer apply.

BR,
Jani.

>
> Refer:
> https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
>
> Brahmajit Das (2):
>   drm/i915/debugfs: use new debugfs device-centered functions
>   drm/i915: use new debugfs device-centered functions
>
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 ++---
>  drivers/gpu/drm/i915/i915_debugfs.c                  | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)

-- 
Jani Nikula, Intel
