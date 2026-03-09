Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANLhKEDsrmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28223C105
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD80210E55E;
	Mon,  9 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Yo4U1JQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 746 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 02:35:12 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5FE10E22A;
 Mon,  9 Mar 2026 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YM
 d0+Wp/o+zkTTLjkBVKHAkw64/YlBP0XcUPa1Rlkb4=; b=Yo4U1JQEoeAWln00la
 9OwgDsyVQH3AH0G59asyOIfpWi5y/4Vnk+PiRjA3wgfeX5f2AefY5nYKcJ9CzMEk
 CH7/wD6vVhTsdnocXwfSeR0MpaTsk6p+APTlQeIKTKGRCyIQWNVcdr/CMbUOITn5
 qcHL0zUcBTYaNMnL/r1p7VBJE=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDXV5TmLq5pRMZoPg--.11725S2; 
 Mon, 09 Mar 2026 10:22:31 +0800 (CST)
From: Chenyuan Mi <chenyuan_mi@163.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/amdgpu: fix use-after-free in userq signal/wait IOCTLs
Date: Mon,  9 Mar 2026 10:22:27 +0800
Message-ID: <20260309022229.63071-1-chenyuan_mi@163.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXV5TmLq5pRMZoPg--.11725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF43Jry5Kr47GF45Ar1fJFb_yoW8GrWfpr
 1rJw12kF4UXrn7Za47Ja48WFWkWFWfWFWfGF1xW34ru3W5X3Z8Zry8KFyrZrySkrs2ya9F
 qr1kX3y8JF1q93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jaZX5UUUUU=
X-Originating-IP: [124.70.231.40]
X-CM-SenderInfo: xfkh055xdqszrl6rljoofrz/xtbC9gfK3WmuLuco0QAA3R
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: 7B28223C105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenyuan_mi@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Both amdgpu_userq_wait_ioctl() and amdgpu_userq_signal_ioctl()
access user queue objects obtained from xa_load() without holding
userq_mutex. A concurrent AMDGPU_USERQ_OP_FREE can destroy and
kfree the queue in this window, leading to use-after-free.

The two bugs have different origins:

- Patch 1 fixes a wait-path regression introduced by commit
  4b27406380b0 ("drm/amdgpu: Add queue id support to the user queue
  wait IOCTL"), which removed the indirect fence_drv_xa_ptr model
  and its NULL-check safety net from commit ed5fdc1fc282
  ("drm/amdgpu: Fix the use-after-free issue in wait IOCTL").

- Patch 2 fixes a similar pre-existing lifetime bug in the signal
  path, present since commit a292fdecd728 ("drm/amdgpu: Implement
  userqueue signal/wait IOCTL").

Patch 1 adds explicit userq_mutex coverage around the xa_load and
subsequent fence_drv_xa operations in the wait path.

Patch 2 moves the ensure_ev_fence call (which acquires
userq_mutex) before xa_load in the signal path, so that the queue
lookup and all subsequent accesses are covered by the same lock.

Chenyuan Mi (2):
  drm/amdgpu: protect waitq access with userq_mutex in wait IOCTL
  drm/amdgpu: protect queue access in signal IOCTL

 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 25 +++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

--
2.53.0

