Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA4B11C76
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C6810E9AF;
	Fri, 25 Jul 2025 10:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpELQOKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67910E9CD;
 Fri, 25 Jul 2025 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753439641; x=1784975641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LevBNGaMRX+QUpJe2xBfUDEytZ4F0l9p2h/+vmJ717s=;
 b=RpELQOKpgBGIf85HqPZL3cK8nBPpNQnbRJn/vxO7dNsTfj6OKbwbvEV4
 fuJgebmEX5aYscNv6H0InH/KYcWQvbBP1X5gmG/SwaPPep3Vf2krshO2+
 2T9YQxqEbtAuBTgA7Akp2d+fFAzIiRxxU+csP4KeQjadzxGGtNDA3ux1a
 Rdb6soApjQH+8R8TN3PxAt2GRWJtEfu30JVNpLFe7RqQymduKG3NYnecs
 zUeTcW3bl4zhx07TnJqg6BEkkDYjrZmdaGIz723qlsEUOaXzpNaCi9kgv
 vROjib8Y9OsqWC5h9F78zjQLBmcLLEcUVoHJeUKKW2A6f83F2kP7yWKmM g==;
X-CSE-ConnectionGUID: sTcHviZESTC8BbKBLwaaSA==
X-CSE-MsgGUID: l5SQed0DRZySvGjKelrQWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55922467"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55922467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:34:01 -0700
X-CSE-ConnectionGUID: WUbpCxUmSXOLSoW/oEPyFw==
X-CSE-MsgGUID: /MVd6Aq5T5Cja4u1NkBbiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161172371"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:33:57 -0700
Date: Fri, 25 Jul 2025 13:33:53 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: Re: [PATCH v6 9/9] drm/xe/xe_hw_error: Add fault injection to
 trigger csc error handler
Message-ID: <aINdkd0-liNN69Qn@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-10-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:38PM +0530, Riana Tauro wrote:
> Add a debugfs fault handler to trigger csc error handler that
> wedges the device and enables runtime survivability mode

With punctuations,

> v2: add debugfs only for bmg (Umesh)
> v3: do not use csc_fault attribute if debugfs is not enabled
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
