Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9955A86B876
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 20:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7448F10E209;
	Wed, 28 Feb 2024 19:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lErPlaJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D3F10E1FF;
 Wed, 28 Feb 2024 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709149450; x=1740685450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V0ilXmhRKxli9jjfPc07HZw+QOYaraP3+0PgQZD1VWc=;
 b=lErPlaJcaPgnuhAgCzPdqHdKiF0xncXldjv8qwR1unrCDL72PYpa17Dr
 zZ7OsZucQYZECKyLXTUA2XheKQvjnIfs+Y2SOWqOMYSm9vqQ+tbmMuZlF
 pv2er91q7WcatHcFyxHLsDf9SGrEc9WywCwagq/myHM94FNEso/dWkD4+
 KPZL1A3fek5izm+UjIikfHOxbvBgt88de8EaULSnarybIa1uI/MR2Wfw2
 sbCsTZsTTgF2bSDj+/38Bb2d0AIQUxxBwsIVvLihgSPiDN2ayVSqxGeQy
 al00KE9aZmDLSujnzMM1p82QcKW/he89/mWF8C3BcSh2ZcbUZC0RLDzh4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14216823"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="14216823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 11:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7502494"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 11:44:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] [v2] drm/xe/kunit: fix link failure with built-in xe
Date: Wed, 28 Feb 2024 11:44:35 -0800
Message-ID: <170914939984.3691978.2185510121426316962.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226124736.1272949-1-arnd@kernel.org>
References: <20240226124736.1272949-1-arnd@kernel.org>
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


On Mon, 26 Feb 2024 13:46:36 +0100, Arnd Bergmann wrote:
> When the driver is built-in but the tests are in loadable modules,
> the helpers don't actually get put into the driver:
> 
> ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!
> 
> Change the Makefile to ensure they are always part of the driver
> even when the rest of the kunit tests are in loadable modules.
> 
> [...]

All 3 patches applied to drm-xe-next. Thanks!

[1/3] drm/xe/kunit: fix link failure with built-in xe
      commit: 0e6fec6da25167a568fbaeb8401d8172069124ad
[2/3] drm/xe/mmio: fix build warning for BAR resize on 32-bit
      commit: f5d3983366c0b88ec388b3407b29c1c0862ee2b8
[3/3] drm/xe/xe2: fix 64-bit division in pte_update_size
      commit: 1408784b599927d2f361bac6dc5170d2ee275f17

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
