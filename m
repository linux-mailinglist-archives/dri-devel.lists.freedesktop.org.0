Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBeJHjvBpmlDTQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:08:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A21ED69D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4700D10E0B0;
	Tue,  3 Mar 2026 11:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGRqkkJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581010E794;
 Tue,  3 Mar 2026 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772536116; x=1804072116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OUydxk1A87BAHb2OdMzz6QaOvSZqzAGGAQGqOsolO9E=;
 b=iGRqkkJ7vcOd0KX1MXCJnlbbc5Dr42YU4stRTUs6N69u+FzuiUZmE4CH
 2bbr+7Ak+r8KuPk99PhHUnIZZOuJzfblahHOTY0pOCJQ5pI8hUODFGoG3
 Icafla0E8p9PRul6exHeL+hW+FV7CTwBEgdLqc9ePOffKYqEbsvHrIjAa
 8esuJxX9GYMbyUXJ0buzwq8pnz4WfW2qWYaBHqe+ASCgCWz249mT7q/pJ
 xow/36SYkmGl1K2PAhJZp+nRWRbUG9AP7VCYCNrc0LjAFGiurq0TT8I8p
 tiMTAYbFsdkj5JJSmhJFeSEkArrAHmdRpnDmnecWBntY7g+AReSlGftkj g==;
X-CSE-ConnectionGUID: FG7GUehMQUSR46qBqmjysg==
X-CSE-MsgGUID: Bxh4twJCR5+ZIqTykRaDLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77410060"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77410060"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:08:35 -0800
X-CSE-ConnectionGUID: MS05wu1qQHes5guboMvDgQ==
X-CSE-MsgGUID: VCFfFffoTjWASPAky7FzIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248459979"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 03:08:33 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/3] Update 'none' recovery method for DRM wedged event
Date: Tue,  3 Mar 2026 16:35:16 +0530
Message-ID: <20260303110556.3577612-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0B3A21ED69D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action

Currently 'none' recovery method for wedged event expects no explicit
recovery from userspace consumer but it expects driver to have reset
the device, which may not always be the case. Update documentation and
log to reflect this expectation.

Raag Jadav (3):
  drm/doc: Update documentation for 'none' recovery method
  drm: Update log for 'none' recovery method
  drm/xe: Send 'none' recovery method for
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET

 Documentation/gpu/drm-uapi.rst | 12 +++++-------
 drivers/gpu/drm/drm_drv.c      |  2 +-
 drivers/gpu/drm/xe/xe_device.c |  9 ++++++++-
 3 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.43.0

