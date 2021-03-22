Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F270344A27
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8920489C5E;
	Mon, 22 Mar 2021 16:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48A89C33;
 Mon, 22 Mar 2021 16:03:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B49F619A1;
 Mon, 22 Mar 2021 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616428980;
 bh=443r2a53XZrLPy3VFDNzKFCONnuuJaVZhGXWFTRxMGo=;
 h=From:To:Cc:Subject:Date:From;
 b=Wm1CETPpBfKZZ3lkNCemLWeIZGtbFVmw4nKK+xzlHh6SjshNPJfKJvKmWNXvf1K/F
 5o2Ww58tt6oERHDBipAS4BwOz2CJOvMh/uBNklODZ0dsfVzZt5cj7OrnLB7U+iYnI+
 V9LYQbKfb8Z/fsl+P+r2cUIk2R08rZtGx280ke6EJyn8vt+7YkwV0naEM1o/sQwiUN
 Si9atqBgkFPNOL0NiRMLIEOjWWQ3UF2GIm92tB+iawDYiaDCLVZNub5gpWn3V4pP25
 Ov3hZNHbzywOnT474a9kxX7y+Z8vSF7APRLbZu9IopXbelGoOeiLfQvjhYZz099ogD
 8vEYHTLGBXuSg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Martin Sebor <msebor@gcc.gnu.org>
Subject: [PATCH 00/11] treewide: address gcc-11 -Wstringop-overread warnings
Date: Mon, 22 Mar 2021 17:02:38 +0100
Message-Id: <20210322160253.4032422-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.
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
Cc: dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The coming gcc release introduces a new warning for string operations
reading beyond the end of a fixed-length object. After testing
randconfig kernels for a while, think I have patches for any such
warnings that came up on x86, arm and arm64.

Most of these warnings are false-positive ones, either gcc warning
about something that is entirely correct, or about something that
looks suspicious but turns out to be correct after all.

The two patches for the i915 driver look like something that might
be actual bugs, but I am not sure about those either.

We probably want some combination of workaround like the ones I
post here and changes to gcc to have fewer false positives in the
release. I'm posting the entire set of workaround that give me
a cleanly building kernel for reference here.

        Arnd

Arnd Bergmann (11):
  x86: compressed: avoid gcc-11 -Wstringop-overread warning
  x86: tboot: avoid Wstringop-overread-warning
  security: commoncap: fix -Wstringop-overread warning
  ath11: Wstringop-overread warning
  qnx: avoid -Wstringop-overread warning
  cgroup: fix -Wzero-length-bounds warnings
  ARM: sharpsl_param: work around -Wstringop-overread warning
  atmel: avoid gcc -Wstringop-overflow warning
  scsi: lpfc: fix gcc -Wstringop-overread warning
  drm/i915: avoid stringop-overread warning on pri_latency
  [RFC] drm/i915/dp: fix array overflow warning

 arch/arm/common/sharpsl_param.c         |  4 ++-
 arch/x86/boot/compressed/misc.c         |  2 --
 arch/x86/kernel/tboot.c                 | 44 +++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.h         |  6 ++--
 drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
 drivers/net/wireless/atmel/atmel.c      | 25 ++++++++------
 drivers/scsi/lpfc/lpfc_attr.c           |  6 ++--
 fs/qnx4/dir.c                           | 11 +++----
 kernel/cgroup/cgroup.c                  | 15 +++++++--
 security/commoncap.c                    |  2 +-
 11 files changed, 69 insertions(+), 50 deletions(-)

Cc: x86@kernel.org
Cc: Ning Sun <ning.sun@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Simon Kelley <simon@thekelleys.org.uk>
Cc: James Smart <james.smart@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: Anders Larsen <al@alarsen.net>
Cc: Tejun Heo <tj@kernel.org>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: tboot-devel@lists.sourceforge.net
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: cgroups@vger.kernel.org
Cc: linux-security-module@vger.kernel.org


-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
