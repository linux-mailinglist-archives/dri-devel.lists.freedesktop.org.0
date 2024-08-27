Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B830F9618B7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 22:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296CF10E41B;
	Tue, 27 Aug 2024 20:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEs830M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033E910E3FB;
 Tue, 27 Aug 2024 20:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724791602; x=1756327602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTkJp8Iu637uUW04s6GokQ8p6QADcNEF8Mi8hZB4CEs=;
 b=aEs830M2bxe75vcH54ZQfxID41FnJ7CNgeY+BVzkCNZXRNu6zKgYbH1y
 yhUXXVeUkBAchNra7NULZhvklxH8hLmdTzd7ns2SPEe8sJ6m1SQZCbvZn
 auEJlDxfehvj8H8LAO73ELFfPeHWBHIFSsN+EaAQ40gmdHGbmNP3ec3aS
 SkLiYgc5w/udHrEYRhUlBSynN9cul5cQqw9ClqsTGWezK0GcMf+I2R5O3
 dhEY1r/RQIdK3AvtLnVxpn8IrpfRj06XvBZEBDtJmjqM6QlWDdGYIGJgZ
 VIyqhg07K+dpjQx53VMRz85PguZR+tgxd0bDF5i5usRIRrgNQ/Bq0XJFH Q==;
X-CSE-ConnectionGUID: xDsrKe7xQW6QviQrFgnQxQ==
X-CSE-MsgGUID: OOUDdhFgSdyosC0jM1nVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45813032"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="45813032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 13:46:41 -0700
X-CSE-ConnectionGUID: LoZcVP5GTL6zaBH5/GiZWQ==
X-CSE-MsgGUID: pnxoaLPqSXCBV+p+igts8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67350699"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 13:46:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gustavo.sousa@intel.com, jani.nikula@linux.intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/xe: Support 'nomodeset' kernel command-line option
Date: Tue, 27 Aug 2024 13:46:32 -0700
Message-ID: <172479156026.1724247.3114758407435759625.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827121003.97429-1-tzimmermann@suse.de>
References: <20240827121003.97429-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 27 Aug 2024 14:09:05 +0200, Thomas Zimmermann wrote:
> Setting 'nomodeset' on the kernel command line disables all graphics
> drivers with modesetting capabilities, leaving only firmware drivers,
> such as simpledrm or efifb.
> 
> Most DRM drivers automatically support 'nomodeset' via DRM's module
> helper macros. In xe, which uses regular module_init(), manually call
> drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
> the driver if set.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Support 'nomodeset' kernel command-line option
      commit: 014125c64d09e58e90dde49fbb57d802a13e2559

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
