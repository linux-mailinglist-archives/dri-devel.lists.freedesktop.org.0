Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3963690D5A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5303B10EB33;
	Thu,  9 Feb 2023 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDA110EB31;
 Thu,  9 Feb 2023 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675957409; x=1707493409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yUxaVyOttCF+S0o7lkih7Kt4RQxuND25MupPhCYfjrs=;
 b=LqUAuwU8ZIhzuXlEf99NuyluycL1nZydfB8250I2+PbyqHK7WVrXxW0E
 SzHdpOUAWzVbTnCx+BKzZ5C1wywOi5YDzyA2YtoMN5zC9VsPlWWUjBynO
 1LymJROxwZPEmofiXooYTHBIJlCTHaSSaG74gKMTxOlTFAM4iATcuRYY/
 UAsj0DW0rG3kNxXRioEGDK8curF1xdPw4kAXvqZ6oG77XdMk/d4mm3IN3
 Yj6qZ5AxyXhMhU/PO6A1MASYfD/msnUJPiCpq5yKGRS/y+kFYDjWvub6r
 XS1WqV86nrhiQrap6RBiInm36u2T0Xe1c0AD01Dnhb2Q6Cb9Jx0U6nfjB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="331440704"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="331440704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645308786"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="645308786"
Received: from jptoner-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.192.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 0/3] Waitboost drm syncobj waits
Date: Thu,  9 Feb 2023 15:43:12 +0000
Message-Id: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In i915 we have this concept of "wait boosting" where we give a priority boost
for instance to fences which are actively waited upon from userspace. This has
it's pros and cons and can certainly be discussed at lenght. However fact is
some workloads really like it.

Problem is that with the arrival of drm syncobj and a new userspace waiting
entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
this mini series really (really) quickly to see if some discussion can be had.

It adds a concept of "wait count" to dma fence, which is incremented for every
explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
dma_fence_add_callback but from explicit/userspace wait paths).

Individual drivers can then inspect this via dma_fence_wait_count() and decide
to wait boost the waits on such fences.

Again, quickly put together and smoke tested only - no guarantees whatsoever and
I will rely on interested parties to test and report if it even works or how
well.

Tvrtko Ursulin (3):
  dma-fence: Track explicit waiters
  drm/syncobj: Mark syncobj waits as external waiters
  drm/i915: Waitboost external waits

 drivers/dma-buf/dma-fence.c         | 102 ++++++++++++++++++++--------
 drivers/gpu/drm/drm_syncobj.c       |   6 +-
 drivers/gpu/drm/i915/i915_request.c |  13 +++-
 include/linux/dma-fence.h           |  14 ++++
 4 files changed, 101 insertions(+), 34 deletions(-)

-- 
2.34.1

