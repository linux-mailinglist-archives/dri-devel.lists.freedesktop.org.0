Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8117B117FB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2E10E42A;
	Fri, 25 Jul 2025 05:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKb4ifQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ECA10E42A;
 Fri, 25 Jul 2025 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753421706; x=1784957706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oNjux5fWuHFBJxbqch7+57lX+zFS67GQoyIbWaZhuj0=;
 b=NKb4ifQXAZNp0p6F8vjl3tZrS2PNdhCBCy9D+2X6vQOfVBKxHod4yNRS
 CvTv4OPtGh+o7SwI3nZpsucyMi08n7I+DAEIcKHLo3amLVcrzA5TGlX9B
 eGgPsyj+kCZrD65l6dkNkKudjR4ZNNS95Krsc9l2ft2qqPChnv/7jKflD
 eIob42HosXwU4kZGOhp5yj/8ClERxKn3IXbSj2sXCNIj8xqSx6Aw+p6TE
 /iRNFAhOfz+oBGvdzUJBOiqpcY+T6pfAduUCmyQat6hgCAslkzUKQEfy3
 KUvCRDUElldsGaGZYtjYlHGG8/MC+SJyZ/a+/vjTIbLHgg6EFLa6CAu7a A==;
X-CSE-ConnectionGUID: l2K0PI1gQsaJJFpXqMPzUg==
X-CSE-MsgGUID: tjTipfxlSSmdtq02AHiy7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59405738"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="59405738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:35:05 -0700
X-CSE-ConnectionGUID: DENFmczETu6Niz9Wf3mPYw==
X-CSE-MsgGUID: jLkxgPoaSoqdl5lK+9pKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="166126528"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:35:01 -0700
Date: Fri, 25 Jul 2025 08:34:58 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: Re: [PATCH v6 3/9] drm/xe: Add a helper function to set recovery
 method
Message-ID: <aIMXgiWjqqXYO_-a@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-4-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-4-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:32PM +0530, Riana Tauro wrote:
> Add a helper function to set recovery method. The recovery
> method has to be set before declaring the device wedged

If no method is set, the core helper will defer to 'unknown' method, so this
is not a hard requirement. But since xe has its own "default ones", I guess
it's okay to mandate it.

Raag
