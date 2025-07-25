Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5CBB1180B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4F10E429;
	Fri, 25 Jul 2025 05:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8uZJPP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D11D10E425;
 Fri, 25 Jul 2025 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753422288; x=1784958288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hf7co4+BNRg9vbUf2PfMJgsNLmvttu4Qf6xUlSeh10k=;
 b=j8uZJPP7mp1Px6WLEb7gEW2x+1/PTBbau7iE5EKdpUCoQ9t8NYKQI7yF
 /59ZoPda46Y66j+4MAFbKOwiiUe2p36oIIWyxgHz1AiYppkmPVXdTxiJ3
 jc67DTr6FH39K7QIFZYLwvsZa2MLnzVbYJld2mW1xqnhAbV5ZddNXH5Wq
 n5POKzKQcRDG5/BGYhuSou/sgzD/nxDPGjuq+a4+gIZmG3zaKw+JYDEPE
 UqCUVNWa+FyYFEI6CaqAmoVg8AU+lG3vLuYgg6HRbh4Ti+xSNp9U8zUFe
 mtN0KxTfRKYG6Ocy0PXAfdxoIf8z5n/E4DXRNph1S2kLFnwEWhoftAVbo A==;
X-CSE-ConnectionGUID: 0hhBUKA+S3Sl6L8XzWwPOA==
X-CSE-MsgGUID: 4fUQy6sqSZGRgqjUmpcExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="81190975"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="81190975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:44:47 -0700
X-CSE-ConnectionGUID: eFkmCWvZQ6Oysujb3K6gvQ==
X-CSE-MsgGUID: ouGMEbDrRVCq86BOJCj9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="166240121"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:44:45 -0700
Date: Fri, 25 Jul 2025 08:44:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: Re: [PATCH v6 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <aIMZyWaRdaIWG00b@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-6-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-6-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:34PM +0530, Riana Tauro wrote:
> Certain runtime firmware errors can cause the device to be in a unusable
> state requiring a firmware flash to restore normal operation.
> Runtime Survivability Mode indicates firmware flash is necessary by
> wedging the device and exposing survivability mode sysfs.

...

> +/**
> + * xe_survivability_mode_runtime_enable - Initialize and enable runtime survivability mode
> + * @xe: xe device instance
> + *
> + * Initialize survivability information and enable runtime survivability mode.
> + * Runtime survivability mode is enabled when certain errors cause the device to be
> + * in non-recoverable state. The device is declared wedged with the appropriate
> + * recovery method and survivability mode sysfs exposed to userspace

With punctuations,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
