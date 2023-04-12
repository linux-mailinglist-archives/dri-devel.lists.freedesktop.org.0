Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A20E6DF3C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F042010E795;
	Wed, 12 Apr 2023 11:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DD510E794;
 Wed, 12 Apr 2023 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681299236; x=1712835236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DL3MgYnzKAEXsAUQPyglUiDH5LIQHjqJDKbmsnSxR2c=;
 b=iGqUShfJNso8amxKg6c52WHt7sbyeq0Kh+CT93W7nmk+TK33JvTU72//
 rMa+lS2cFeLceVRdphvsCTg+/6QxgN3CwM7jCJBuiFJsaThnsgsKTyT/D
 Vk9hXDxCKo1MhnieqpbDVpKQ4tgWjCl3RDehwlounw0kzHZTo6euGeDLc
 /t+QhDeeaRbvmfuuerbytgfHllRb8fWkWRVIIQYNxsthQL/+XQhgtDIlR
 r2mdCLF5xa0Bt7kMlk7c9HD8AyBk+ecSHI3+n2ddSGhUwUYCpOv3uG2UM
 vrS0bFlMaFEKeuZMHcHYGJE5j9FjeCJrDzr/rATHzvZ6K3da4fnrC7d8P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327978204"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="327978204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778268708"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="778268708"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:33:51 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v5 0/5] Fix error propagation amongst request
Date: Wed, 12 Apr 2023 13:33:03 +0200
Message-Id: <20230412113308.812468-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series of two patches fixes the issue introduced in
cf586021642d80 ("drm/i915/gt: Pipelined page migration") where,
as reported by Matt, in a chain of requests an error is reported
only if happens in the last request.

However Chris noticed that without ensuring exclusivity in the
locking we might end up in some deadlock. That's why patch 1
throttles for the ringspace in order to make sure that no one is
holding it.

Version 1 of this patch has been reviewed by matt and this
version is adding Chris exclusive locking.

Thanks Chris for this work.

Andi

Changelog
=========
v4 -> v5
 - add timeline locking also in the copy operation, which was
   forgottein in v4.
 - rearrange the patches in order to avoid a bisect break.

v3 -> v4
 - In v3 the timeline was being locked, but I forgot that also
   request_create() and request_add() are locking the timeline
   as well. The former does the locking, the latter does the
   unlocking. In order to avoid this extra lock/unlock, we need
   the "_locked" version of the said functions.

v2 -> v3
 - Really lock the timeline before generating all the requests
   until the last.

v1 -> v2
 - Add patch 1 for ensuring exclusive locking of the timeline
 - Reword git commit of patch 2.

Andi Shyti (4):
  drm/i915/gt: Add intel_context_timeline_is_locked helper
  drm/i915: Create the locked version of the request create
  drm/i915: Create the locked version of the request add
  drm/i915/gt: Make sure that errors are propagated through request
    chains

Chris Wilson (1):
  drm/i915: Throttle for ringspace prior to taking the timeline mutex

 drivers/gpu/drm/i915/gt/intel_context.c | 41 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h |  8 ++++
 drivers/gpu/drm/i915/gt/intel_migrate.c | 51 +++++++++++++++++------
 drivers/gpu/drm/i915/i915_request.c     | 55 +++++++++++++++++++------
 drivers/gpu/drm/i915/i915_request.h     |  3 ++
 5 files changed, 133 insertions(+), 25 deletions(-)

-- 
2.39.2

