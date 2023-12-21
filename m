Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FA81C10A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520B10E722;
	Thu, 21 Dec 2023 22:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABAE10E716;
 Thu, 21 Dec 2023 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197694; x=1734733694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tL8NDVg4RLLrNjGICPg5VaR/lBc+sCQgEXLb05HhDAQ=;
 b=MWRdNz9I9RK1ePXUoopO6UxVbsVz7+NgpGm+y+ZYaV9zljOcXgWGf3Xw
 iUS8Cabhk3aIuotdqR0EJjd1kvAy+YalJF50cFEUm3Dt6VdTK4igAsVGf
 WBtRB8/RjFK6vNrJPnwFwX1+auE51Z9rQa+6WhH8glbud90LPm3OWWpmd
 +LqcYidKcoeitFla3BzdHQQJ4+QgGSN77pPK//M0aHoqKm/xZ5CVPrnot
 zOjbPCCDx+wcDV5knOmGRdYTQWN05Zzp7f4Z5iw7hmWOaMB66kEb9/PGQ
 ciI5Wo329YnF40Hzuu1HIyM+g/r9jNdsmSAa6ZtLeUR4tblw14TMIzvsZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876509"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876509"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458207"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458207"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/xe: Fix 32bit build
Date: Thu, 21 Dec 2023 14:28:03 -0800
Message-Id: <20231221222809.4123220-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
Cc: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few fixes when building xe with ARCH=i386. If getting the whole lot,
we can simply skip the first and last patches. However they probably
need to got through CI and be reviewed to avoid regressions. For the
current pull request, simply disabling 32bits build is an alternative,
so we'd apply patch 1 now and let the rest come later.

Lucas De Marchi (6):
  drm/xe: Disable 32bits build
  drm/xe: Use _ULL for u64 division
  drm/xe/mmio: Cast to u64 when printing
  drm/xe/display: Avoid calling readq()
  drm/xe: Fix cast on trace variable
  drm/xe: Enable 32bits build

 .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++--
 drivers/gpu/drm/xe/xe_device.c                             | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c                               | 4 ++--
 drivers/gpu/drm/xe/xe_trace.h                              | 2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.40.1

