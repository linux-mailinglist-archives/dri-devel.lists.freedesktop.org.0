Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LE0MS8rqGnJpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8F1FFE1C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D54F10E9CD;
	Wed,  4 Mar 2026 12:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKEYeB8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C81F10E9CB;
 Wed,  4 Mar 2026 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772628778; x=1804164778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wpmWl8JXhcrDRQRZeCzdfUncqnEqDUn2pypVoJbIjHU=;
 b=kKEYeB8KjN0LnOT8d6PhR2YY/T2b6ZNEeVTWg7xHJWqGXRaaluI9R4wM
 FX4nqrtcz7IYLCHdvQ9SFVVt0iUflxh7NgdThkd4bHoP35Voi+NI04Hu3
 Uk3QcFYyugwQaZW/jt4yxCdZHIFjJIBTqek7GDyDPnAqPsIz8wnj4I+Ld
 Q7v0CngEtCwXlh4/o0mlCScr0PN8PYbjtotkAVIoZdqbKoYOVtZsV5TsJ
 QVbJjn6z07RrpppZVidZCyZMgZ0x1uEUR0moFTKbcOgy0TPIoOJr/BMAL
 8vG15WZkLwY724hXhzLZKLKpy1uuyq5TB3tOSuAHJvc7z/AAmBqNIrxKi w==;
X-CSE-ConnectionGUID: ognxHZ1fTjuArsMOr6AZdw==
X-CSE-MsgGUID: 7owSBxtrSUevVM4FS11QVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73594462"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73594462"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:52:58 -0800
X-CSE-ConnectionGUID: zZb18boAR/y5etB0LN8I3A==
X-CSE-MsgGUID: PUTmtYyqQXOXLBbydRPU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215705480"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:52:53 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>,
 David Howells <dhowells@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Xe driver asynchronous notification mechanism
Date: Wed,  4 Mar 2026 13:52:18 +0100
Message-ID: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 33A8F1FFE1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,redhat.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Action: no action

There is a need to inform user-space clients when a rebind worker
has ran out of memory so that it can react, adjust its working-set
and restart the job. This patch series aims to start a discussion
about the bet way to accomplish this.

The series builds on the core "general notification mechanism" or
"watch_queue", and attaches a watch queue to each xe drm file.

The watch_queue is extremely flexible and allows filtering out
events of interest at the kernel level. There can be multiple
listeners.

Another approach would be to use drm events, but then there
could only be one listener per open file and no filtering.
Otoh drm events would probably have the shortest delivery
latency.

Finally there is eventfd (man 2 eventfd) but doesn't appear to
allow carrying metadata.

Any feedback appreciated, also on method preference.

Patch 1 extende the watch_queue interface slightly,
Patch 2 implements delivery of a VM rebind worker error.

Note this is to be regarded as a POC at this time. No need for
a detailed review.

A user-space igt user is posted as an RFC here:

https://patchwork.freedesktop.org/series/162576/

Thomas Hellström (2):
  watch_queue: Add a DRM_XE_NOTIFY watch type and export init_watch()
  drm/xe: Add watch_queue-based device event notification

 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   7 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_vm.c           |   7 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 drivers/gpu/drm/xe/xe_watch_queue.c  | 107 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_watch_queue.h  |  20 +++++
 include/uapi/drm/xe_drm.h            |  46 ++++++++++++
 include/uapi/drm/xe_drm_events.h     |  56 ++++++++++++++
 include/uapi/linux/watch_queue.h     |   3 +-
 kernel/watch_queue.c                 |  13 +++-
 12 files changed, 263 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.h
 create mode 100644 include/uapi/drm/xe_drm_events.h

-- 
2.53.0

