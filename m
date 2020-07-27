Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D822FDEC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E408F6E0CD;
	Mon, 27 Jul 2020 23:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D262D89119;
 Mon, 27 Jul 2020 20:50:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3db50000>; Mon, 27 Jul 2020 13:48:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:50:23 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:20 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 0/6] vga-switcheroo: initial dynamic mux switch support
Date: Mon, 27 Jul 2020 15:51:06 -0500
Message-ID: <20200727205112.27698-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <ba78cd19-45ad-b17e-5174-256cc11f36c2%40nvidia.com>
References: <ba78cd19-45ad-b17e-5174-256cc11f36c2%40nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595882933; bh=z5Jc9i+TiTEi55M4vxDMTLo+EJu+zbC9sADpEVJmrhk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=A2WkCFSLhAfUBKHcaOm/rx5W5AnaQA/omA9OcoEuqBB+paOUwOyLJ9V+Lg/cs5yXC
 olVidr3uZtAX648Swmtxb9nS1ZZH7AzVmOZWA8ML3JvxK0ARLrbToUgkITjyZPZ6RF
 96o9St9btYXZzW5GwMYiznzowP48Nd69CTgdKXr+8w82mnnjz6JpkLuAdL5/EQxoD4
 LMoPf1JKm+n5Zle0v+mtV9pmmzLZoYzO0l7/C16/4dK/HBW+YtohugZwMIDcqt61Oy
 5B1q1KY4DgsoDzXDyfOtlWkvBbs1RKu3PtFlKz/V5aJepooBbzn1cxDtKKkk/SsiV8
 jeOXnDHCTpEGw==
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes to allow vga-switcheroo to switch the mux while modesetting
clients remain active. There is existing support for switching the
mux without checking can_switch; however, this support also does not
reprobe after the mux switch is complete. This patch series adds a new
type of switch event which switches immediately while still calling
client driver callbacks, and updates the i915 DRM-KMS driver to reprobe
eDP outputs after switching the mux to an i915-driven GPU, and to avoid
using eDP links (which i915 always assumes to be connected) while the
mux is switched away.

Daniel Dadap (6):
  vga-switcheroo: add new "immediate" switch event type
  vga-switcheroo: Add a way to test for the active client
  vga-switcheroo: notify clients of pending/completed switch events
  i915: implement vga-switcheroo reprobe() callback
  i915: fail atomic commit when muxed away
  i915: bail out of eDP link training while mux-switched away

 drivers/gpu/drm/i915/display/intel_display.c  |   7 +
 .../drm/i915/display/intel_dp_link_training.c |   9 ++
 drivers/gpu/drm/i915/i915_switcheroo.c        |  27 +++-
 drivers/gpu/vga/vga_switcheroo.c              | 153 ++++++++++++++----
 include/linux/vga_switcheroo.h                |  20 +++
 5 files changed, 185 insertions(+), 31 deletions(-)

-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
