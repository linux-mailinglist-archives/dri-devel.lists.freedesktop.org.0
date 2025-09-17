Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9CB81FCD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 23:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143E10E1E3;
	Wed, 17 Sep 2025 21:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxvJL4+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740E10E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145073; x=1789681073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JhtPfJaQiCKSIX/TuTfrAD7OYsN3RQ0tOkgWbfXy8w=;
 b=BxvJL4+CJJOfk4gIJL3rLzYA7Vqdg5mDQBJR0vWKo5Ndef2C29uUOzJ0
 0DxZYacP7CKACFTCE+NuNWYbUDNuTyr7OxjVg7gGbIHCbX0q1mRBiFH6P
 5FUbVhog4RJrVrA4R/B4ja78M5okV+qjX4ZrZusnqL/++tppjfiJo3Ay6
 s6EYPwUZ6n27Z76+O1AZhBuFP/HLk0wIN/5TEBcmPBuintWvWfgU9zXC1
 l0QKiaERIg4R5JtVif5C4JwaHlEfx042kyK7vKZuZg/Oo418y1bsWZx8a
 pvKqRGPw9EVuM2N03HsXxVahGFAQct0jlfcu5f3loZfkQEFiKZkFR8kF9 Q==;
X-CSE-ConnectionGUID: HXBUhuBsQOCqXQOneIohcA==
X-CSE-MsgGUID: GUGV5gknS+OXPS2VkrBnbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522746"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
X-CSE-ConnectionGUID: I48fL1SaSAelzkyZZOGSrA==
X-CSE-MsgGUID: 70k54UhfRkOchs8AuyH1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643051"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 0/3] drm/xe: Fix some rebar issues
Date: Wed, 17 Sep 2025 14:37:29 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250917-xe-pci-rebar-2-c0fe2f04c879
X-Mailer: b4 0.15-dev-b03c7
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

Our implementation for BAR2 (lmembar) resize works at the xe_vram layer
and only releases that BAR before resizing. That is not always
sufficient. If the parent bridge needs to move, the BAR0 also needs to
be released, otherwise the resize fails. This is the case of not having
enough space allocated from the beginning.

Also, there's a BAR0 in the upstream port of the pcie switch in BMG
preventing the resize to propagate to the bridge as previously discussed
at https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
and https://lore.kernel.org/intel-xe/wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw
I'm bringing that commit from Ilpo here so this can be tested with the
xe changes and go to stable (first 2 patches).

The third patch is just code move as all the logic is in a different
layer now. That could wait longer though as there are other refactors
coming through the PCI tree and that would conflict (see second link
above).

With this I could resize the lmembar on some problematic hosts and after
doing an SBR, with one caveat: the audio device also prevents the BAR
from moving and it needs to be manually removed before resizing. With
the PCI refactors and BAR fitting logic that Ilpo is working on, it's
expected that it won't be needed for a long time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Ilpo Järvinen (1):
      PCI: Release BAR0 of an integrated bridge to allow GPU BAR resize

Lucas De Marchi (2):
      drm/xe: Move rebar to be done earlier
      drm/xe: Move rebar to its own file

 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +
 drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 103 -------------------------------
 drivers/pci/quirks.c              |  20 ++++++
 6 files changed, 162 insertions(+), 103 deletions(-)

base-commit: 95bc43e85f952ef4ebfff1406883e1e07a7daeda
change-id: 20250917-xe-pci-rebar-2-c0fe2f04c879

Lucas De Marchi

