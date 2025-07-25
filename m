Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56098B11808
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26310E43F;
	Fri, 25 Jul 2025 05:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+RPC59K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8BB10E437;
 Fri, 25 Jul 2025 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753422167; x=1784958167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ENodaYn1KcaOOLI4IK1of2UM/FxetznOeOVcafpTjSY=;
 b=W+RPC59KKls16+SYp544bPIzzr5RWj2Npcs6iQt1paHrt+DJmA5t2kTa
 7K3oGozMc8lVF8ueEvjeBwS3H/TVYaHo8ETrEaOJ6o1XfY6+TnvPigyFV
 JcU6KwfM+MkdLgq+UE3yvR8ADpestxxpK8P55kec4doOYY9pPnYqQ+bLp
 nAeUVoRltDrDMDKR0U385HMb8LYPFp5kMdDU4WUUq3apXEHSijXohiBMl
 d9+5N7ZIMzjmlDEcmzlrGiWrVB8Rc71smGzkPHgPd0EN/Xd9lcX825evL
 K8mrSnlAXRajQpOcknEtRn0sTNHnDE+c3I5riqCzMK2mW33O4fV09rdbf w==;
X-CSE-ConnectionGUID: HxBND2ueTwGSUlrAQkP91Q==
X-CSE-MsgGUID: 6noUdzkAT6S3pVbdaMZLig==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59406057"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="59406057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:42:47 -0700
X-CSE-ConnectionGUID: OSKI6ELWSPuJ4tOcpi5QvA==
X-CSE-MsgGUID: 3wiEoRD9RJG374eAplQaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160304858"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:42:44 -0700
Date: Fri, 25 Jul 2025 08:42:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: Re: [PATCH v6 4/9] drm/xe/xe_survivability: Refactor survivability
 mode
Message-ID: <aIMZUV7-eushHuQq@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-5-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:33PM +0530, Riana Tauro wrote:
> The patches in these series refactor the boot survivability code to
> allow adding runtime survivability.

Documentation/process/submitting-patches.rst +94

Same as patch 1, I prefer the upstream guidelines for imperative mood
but upto you.

> Refactor existing code to separate both the modes

Punctuations.

> This patch renames the functions and separates init and enable.

Ditto for imperative.

And,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
