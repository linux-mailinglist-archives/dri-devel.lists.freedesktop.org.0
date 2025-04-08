Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49245A80D51
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F60A10E6C2;
	Tue,  8 Apr 2025 14:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQMuxA8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8610E6C2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744121336; x=1775657336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NOfEbOF5rTnvpjJIT1xnv2/oWd63tDLrRFEpwfkEAf4=;
 b=WQMuxA8b5Rq6AYwTlmtNoxDekaFn3Wt9UbdpHRVpzqXaGzDs/XBSyZFx
 gl+5/Oywlv4+BJb2rArKNa2RVFTbKD1L2goWPYAvJPc8nltAEcYSH86YF
 TFMVKfMM6f1irFvS2AyYSCrtM9p/lMUpOULcU4AnC02hxRSprfsQFTO2a
 ZrozJwA73vuB2covQDdhKJHLUe4zAu2UOM8p5WudoWX35ESmcDditzPuo
 d6XLB2A7M+2AsT/J/A9E9rAD2JwrVU0IhvSmqWxM7NXEHRUG+DzFyNMFT
 dKUPB4axoqwLKXrX4ffUy4zEMgFWcosE2s+ipIIPfbRxGHTtQFeVLW6Ia Q==;
X-CSE-ConnectionGUID: 3VMbi6qURP6GQFNyqxsQwg==
X-CSE-MsgGUID: 3HetPZhuTcquIOKkcZDLtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56195453"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56195453"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:08:55 -0700
X-CSE-ConnectionGUID: 21bM2bdYTy6O5WqypJnt8Q==
X-CSE-MsgGUID: fKhuY+rfTcG3uXLZpW78GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="159272350"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:08:52 -0700
Date: Tue, 8 Apr 2025 17:08:49 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, christian.koenig@amd.com,
 andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Fix the length of event_string in
 drm_dev_wedged_event()
Message-ID: <Z_Ut8UwQigTLXqKr@black.fi.intel.com>
References: <20250408112728.244146-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408112728.244146-1-jiangfeng@kylinos.cn>
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

On Tue, Apr 08, 2025 at 07:27:28PM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> When calling scnprintf() to append recovery method to event_string,
> the second argument should be `sizeof(event_string) - len`, otherwise
> there is a potential overflow problem.

Thanks. Perhaps change the subject to reflect this as well?

Raag
