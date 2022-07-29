Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F4584C57
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E1D10E837;
	Fri, 29 Jul 2022 07:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A66210E0E4;
 Fri, 29 Jul 2022 07:04:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09AE8619FD;
 Fri, 29 Jul 2022 07:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65564C433D7;
 Fri, 29 Jul 2022 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659078239;
 bh=fzCBMgJfZnLfcaUhqg9JhjJadviES9eqpXWT+njnHTg=;
 h=From:To:Cc:Subject:Date:From;
 b=Yyf+039YkXdBICHTs98ag+yEw6yF8QT8bAC4OODtkBlfhp67tCKgZ0MU0tvVTt3P7
 ztzi//nINQlNfrWF/sRHa9IbEpSr8xHs3szShKGlnKD4Xz+GlZJuL2podux/40S7O2
 rFAtudqi+0tdIV3mNkmc3BFMRyETo55M/BW1I/jdxu/k+Af2/lexXThSYjJ4HhFWtC
 K1LXYO7FQZVrvJKw+k0j6lgO7zEU3Fyrfl8/mKhqGproj2TD3rF9LvN05xkh1zdPRr
 YzRUBYS7UWan8d4R0g6R3WI67B3G6Br3q37o9b7fkn0Cmsmm8DwsjyZcZUbzCVg5BN
 MYmUuL6/R7E2w==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oHK2O-005nBq-Vd;
 Fri, 29 Jul 2022 09:03:56 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 0/2] Move TLB invalidation code for its own file and
 document it
Date: Fri, 29 Jul 2022 09:03:53 +0200
Message-Id: <cover.1659077372.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are more things to be added to TLB invalidation. Before doing that,
move the code to its own file, and add the relevant documentation.

Patch 1 only moves the code and do some function renames. No functional
change.

Patch 2 adds documentation for the TLB invalidation algorithm and functions.

---

v2: only patch 2 (kernel-doc) was modified:

  - The kernel-doc markups for TLB were added to i915.rst doc;
  - Some minor fixes at the texts;
  - Use a table instead of a literal block while explaining how the algorithm works.
    That should make easier to understand the logic, both in text form and after
    its conversion to HTML/PDF;
  - Remove mention for GuC, as this depends on a series that will be sent later.

Chris Wilson (1):
  drm/i915/gt: Move TLB invalidation to its own file

Mauro Carvalho Chehab (1):
  drm/i915/gt: document TLB cache invalidation functions

 Documentation/gpu/i915.rst                |   7 +
 drivers/gpu/drm/i915/Makefile             |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c        | 168 +----------------
 drivers/gpu/drm/i915/gt/intel_gt.h        |  12 --
 drivers/gpu/drm/i915/gt/intel_tlb.c       | 208 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h       | 130 ++++++++++++++
 drivers/gpu/drm/i915/i915_vma.c           |   1 +
 8 files changed, 352 insertions(+), 179 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h

-- 
2.36.1


