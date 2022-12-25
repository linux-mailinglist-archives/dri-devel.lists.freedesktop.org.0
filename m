Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2888655C8F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Dec 2022 08:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C92F10E051;
	Sun, 25 Dec 2022 07:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504210E051;
 Sun, 25 Dec 2022 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671954340; bh=kIWqE+E0JGmITgwgejM1umauZcQEjS6DlPrgkewDNns=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=hT8MGQHcwFZ8TaF+9tq5nChzLggDwzzja91VJqbvKNvCKAnhKui11JMSsW0i8q1If
 qsBUW+1m+HS40TMC+Ur9SwupmyqUbU+jln4fxsedC3RMtpzbii5+Vj6BVnDsBNGC+H
 rd+0L45mbwqUrYooK1GF0t/9g9Cr/75Ftu7UytgM=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 25 Dec 2022 08:45:40 +0100 (CET)
X-EA-Auth: SrvNuKhM0jsdFEciaDSFOfF6CMnwpo7D7zWfDAnDFd1e6Yf782WQEAuKphbmRKBT0KjVVog75FmD0Hxg2u8fWFVw5HseKqx2
Date: Sun, 25 Dec 2022 13:15:33 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] convert i915_active.count from atomic_t to refcount_t
Message-ID: <cover.1671952191.git.drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Transition the reference count member variable count of struct i915_active from
atomic_t type to refcount_t type. This proposal is based on issues identified
using the atomic_as_refcounter.cocci Coccinelle semantic patch script.

Patch 1/2: proposes to convert the base implementation of variable count from
	   atomic_t to refcount_t. This also includes the transition of
	   atomic_*() API calls to their equivalent refcount_*() API calls.

Patch 2/2: proposes to transition the atomic_*() API calls in i915 selftest
	   use cases to their equivalent refcount_*() API calls.

Please Note:
   1. Patch 1/2 should be applied before patch 2/2 due to interdependency.
   2. I did not enable to the selftest and debug configurations earlier while
      building the i915 base driver. With the build failures reported by the
      Kernel Test Robot, I have now included those changes. I did not find any
      other configurations that required additional atomic_* API call transition
      for this member variable of struct i915_active. Please let me know if there
      are other related disabled configurations that I should be enable for
      additional code coverage.
   3. Any guidance on working with i915/selftests would be very helpful for my
      learning.

Changes in v2:
   1. Patch series introduced.
   2. Handle build issues Reported-by: kernel test robot <lkp@intel.com>
      Earlier a standalone patch was sent for the i915 base driver only. The
      Kernel Test Robot reported failure for additional atomic_*() calls specific
      to i915 debugging support when enabled. This version now includes those
      changes as well.
   3. Handle build issues Reported-by: kernel test robot <lkp@intel.com> for i915/selftests
      Include changes for i915/selftests use cases for atomic_* to refcount_*
      transition.


Deepak R Varma (2):
  drm/i915: convert i915_active.count from atomic_t to refcount_t
  drm/i915/selftests: Convert atomic_* API calls for i915_active.count
    refcount_*

 drivers/gpu/drm/i915/i915_active.c           | 28 +++++++++++---------
 drivers/gpu/drm/i915/i915_active.h           |  6 ++---
 drivers/gpu/drm/i915/i915_active_types.h     |  4 +--
 drivers/gpu/drm/i915/selftests/i915_active.c |  8 +++---
 4 files changed, 24 insertions(+), 22 deletions(-)

--
2.34.1



