Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F4B86F8E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 22:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3610E905;
	Thu, 18 Sep 2025 20:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4YzXKc7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD4510E901;
 Thu, 18 Sep 2025 20:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758229162; x=1789765162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jnK6+B9ddsUgwv8Le0upLeCswhfyFEJ3xy/dYjG0+fI=;
 b=Y4YzXKc7ykLPmLJjHLjL9+a1y3PjQ5XkUZaS7mDOukiy4kr7EFgdwcAU
 AXonkp+OdzqHTT3H2ql8fe0ndNUeSdulEhHdHzVEC55bzYQAvapAdGK15
 GXxylnoeEiNQwZi9BPDXC+PnC55RQCxdwNAvbpmGe1Ul+Tj0w2RbclWCg
 7gjomqLuP53v7mzDsLzyB8+j+PD2+9g9Ez7tLjSJINo8ADy3eB7pNE0L4
 qB6ypX6XebMqShuIBqZp4zNkaPR/EauwT7l0bpdUTNGhI5z1gKQpSstbQ
 xeUBeKGy4Hggsbdzhe6srESzvyqmKGOaxlAxrL74hnASX/FwfrckVZhBC A==;
X-CSE-ConnectionGUID: PQ++fivdQOiBtCm9gWpibA==
X-CSE-MsgGUID: +rAM3E6hTv6FbpiTX0qq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="63205055"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="63205055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 13:59:21 -0700
X-CSE-ConnectionGUID: Ub4ULYcdST6rMWJdFXubpA==
X-CSE-MsgGUID: zDQ0MTx/QveyY2BRHqGSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="174915014"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 13:59:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Simon Richter <Simon.Richter@hogyros.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 0/2] drm/xe: Fix some rebar issues
Date: Thu, 18 Sep 2025 13:58:55 -0700
Message-ID: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
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
in https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
and https://lore.kernel.org/intel-xe/wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw
I'm bringing that commit from Ilpo here so this can be tested with the
xe changes and propagate to stable. Note that the use of a pci fixup is
not ideal, but without intrusive changes on resource fitting it's
possibly the best alternative. I also have confirmation from HW folks
that the BAR in the upstream port has no production use.

I have more cleanups on top on the xe side, but those conflict with some
refactors Ilpo is working on as prep for the resource fitting, so I will
wait things settle to submit again.

I propose to take this through the drm tree.

With this I could resize the lmembar on some problematic hosts and after
doing an SBR, with one caveat: the audio device also prevents the BAR
from moving and it needs to be manually removed before resizing. With
the PCI refactors and BAR fitting logic that Ilpo is working on, it's
expected that it won't be needed for a long time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Ilpo Järvinen (1):
      PCI: Release BAR0 of an integrated bridge to allow GPU BAR resize

Lucas De Marchi (1):
      drm/xe: Move rebar to be done earlier

 drivers/gpu/drm/xe/xe_pci.c  |  2 ++
 drivers/gpu/drm/xe/xe_vram.c | 34 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vram.h |  1 +
 drivers/pci/quirks.c         | 23 +++++++++++++++++++++++
 4 files changed, 52 insertions(+), 8 deletions(-)

base-commit: 8031d70dbb4201841897de480cec1f9750d4a5dc
change-id: 20250917-xe-pci-rebar-2-c0fe2f04c879

Lucas De Marchi

