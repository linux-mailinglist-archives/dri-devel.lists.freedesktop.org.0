Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8D86DCCF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E7B10EA3B;
	Fri,  1 Mar 2024 08:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqLoMibE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A1B10EA3B;
 Fri,  1 Mar 2024 08:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709280858; x=1740816858;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=pwpjYiMv+SKiEf0sR52rY1sdKjzkT3+BbjY5Yly0ziw=;
 b=MqLoMibEejliL/O0UHQ2HcNZy0K8BlCHsIsDZVfrh9TreoFEr5KJ8g+r
 wbHFKg4Ctbpz9duxFUaXlcszVgmDlgMuAyrGcO9oZ4v5/kgdziLF3kI5z
 wBbRDEdW2c/w04e99amNGGyOl5Yk6uttu7gAlQK0vfnSXxfW6fQhb/Syr
 rQsr5Sp6+jxKhwaWmLJJrqZMy0lT8myFf7ZzBCQeuxZlyt7efBH2vKEa5
 crDnABeTZJiSDwj7pbF3sd9D1hU3P8P7yQHJnJIjNr5/+G+js/GAKpPcF
 9CYrLdHsjoT5mYI+W67ytVM+9RRNxwRfdkL3lwcaeMBeAplTkDNm8rJhI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3693951"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3693951"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="45656600"
Received: from unknown (HELO localhost) ([10.245.244.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:14:12 -0800
Date: Fri, 1 Mar 2024 10:14:09 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <ZeGOUTfiA0_FNKLg@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave & Sima,

Here's the drm-intel-fixes towards v6.8(-rc7).

One NULL check for mmu notifier and HDCP fix to read from primary
connector.

Regards, Joonas

***

drm-intel-fixes-2024-03-01:

- Fix to extract HDCP information from primary connector
- Check for NULL mmu_interval_notifier before removing

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-03-01

for you to fetch changes up to 01bb1ae35006e473138c90711bad1a6b614a1823:

  drm/i915: Check before removing mm notifier (2024-02-29 14:14:40 +0200)

----------------------------------------------------------------
- Fix to extract HDCP information from primary connector
- Check for NULL mmu_interval_notifier before removing

----------------------------------------------------------------
Nirmoy Das (1):
      drm/i915: Check before removing mm notifier

Suraj Kandpal (3):
      drm/i915/hdcp: Move to direct reads for HDCP
      drm/i915/hdcp: Remove additional timing for reading mst hdcp message
      drm/i915/hdcp: Extract hdcp structure from correct connector

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 47 ++++++++++------------------
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  3 ++
 2 files changed, 19 insertions(+), 31 deletions(-)
