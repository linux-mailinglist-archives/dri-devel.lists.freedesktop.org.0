Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBgGMTErqGnJpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7B61FFE23
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E52A10E9D2;
	Wed,  4 Mar 2026 12:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AD1nrJrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F3210E9CB;
 Wed,  4 Mar 2026 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772628779; x=1804164779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=suJDybSf2bJqRVbjzEF27konpZySIM4+uxLXQPLFNOQ=;
 b=AD1nrJrriJsyK2rvRdGDJlMTgVKz58pKqC/Jhqilscmii9XmVFDChR2d
 FWg/xCjHwBk+HZFPnFFDAjFidHPmvL6OzWRB2BU1HJG3B7iQyhVnKTbpd
 gJ2pK4g3xkLTfJQuo2J4nxoJgk+BhgIcfJbShMufRZ08wESwuaKbTK8zy
 PxRqZqzuo6GGTW1gZmXfwclwn/4mxL3ZlDln2o/EFA9vPPOVe0+KrW4w1
 ggaxISX7J9oJKd5Kt+hX/vnbuyRG7z0g7+Gtfid049QkiGOYDaSuzyvig
 FEVSv5E/uv/Bi4gbtCFPFiZ6HpXLi1i23JI970rcDlUEi4CdOgTccd0LN Q==;
X-CSE-ConnectionGUID: FtH6b0UgRlqiO199Ab/JCQ==
X-CSE-MsgGUID: TXrLUpgORKGb+Ygb9qlJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73594469"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73594469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:52:58 -0800
X-CSE-ConnectionGUID: Wku4HAYwRY6xJbr6gXhpgg==
X-CSE-MsgGUID: zsHdnq19RSemhlsEpbNdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215705485"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:52:56 -0800
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
Subject: [RFC PATCH 1/2] watch_queue: Add a DRM_XE_NOTIFY watch type and
 export init_watch()
Date: Wed,  4 Mar 2026 13:52:19 +0100
Message-ID: <20260304125220.165004-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
References: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 2B7B61FFE23
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Action: no action

Add a DRM_XE_NOTIFY watch type for asynchronous error notifications
from the DRM_XE kernel module.

Also export the init_watch() function for use from kernel drivers.
Use EXPORT_SYMBOL() to align with other exports from the same file.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/uapi/linux/watch_queue.h |  3 ++-
 kernel/watch_queue.c             | 13 ++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/watch_queue.h b/include/uapi/linux/watch_queue.h
index c3d8320b5d3a..c800c153989d 100644
--- a/include/uapi/linux/watch_queue.h
+++ b/include/uapi/linux/watch_queue.h
@@ -14,7 +14,8 @@
 enum watch_notification_type {
 	WATCH_TYPE_META		= 0,	/* Special record */
 	WATCH_TYPE_KEY_NOTIFY	= 1,	/* Key change event notification */
-	WATCH_TYPE__NR		= 2
+	WATCH_TYPE_DRM_XE_NOTIFY	= 2,	/* DRM device event notification */
+	WATCH_TYPE__NR		= 3
 };
 
 enum watch_meta_notification_subtype {
diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 538520861e8b..701b5c388808 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -445,11 +445,17 @@ static void put_watch(struct watch *watch)
 }
 
 /**
- * init_watch - Initialise a watch
+ * init_watch() - Initialise a watch subscription
  * @watch: The watch to initialise.
- * @wqueue: The queue to assign.
+ * @wqueue: The watch queue (notification pipe) to associate with the watch.
  *
- * Initialise a watch and set the watch queue.
+ * Initialise a newly allocated watch object and associate it with @wqueue.
+ * The caller must subsequently set @watch->id and @watch->info_id before
+ * calling add_watch_to_object() to subscribe the watch to a notification
+ * source.
+ *
+ * The watch queue reference is held internally; call put_watch_queue() if
+ * the watch is not successfully passed to add_watch_to_object().
  */
 void init_watch(struct watch *watch, struct watch_queue *wqueue)
 {
@@ -458,6 +464,7 @@ void init_watch(struct watch *watch, struct watch_queue *wqueue)
 	INIT_HLIST_NODE(&watch->queue_node);
 	rcu_assign_pointer(watch->queue, wqueue);
 }
+EXPORT_SYMBOL(init_watch);
 
 static int add_one_watch(struct watch *watch, struct watch_list *wlist, struct watch_queue *wqueue)
 {
-- 
2.53.0

