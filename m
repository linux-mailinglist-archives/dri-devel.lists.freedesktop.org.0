Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UODeMZLilGmjIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0715105F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80BD10E52E;
	Tue, 17 Feb 2026 21:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="htTQ26al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-13.smtp.spacemail.com (out-13.smtp.spacemail.com
 [63.250.43.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE9B10E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:50:01 +0000 (UTC)
Received: from mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFtNJ4yN0z6tkL;
 Tue, 17 Feb 2026 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771364418;
 bh=Qo/jLa8Ma2FOndLpihsjh6g9gmv48ZIBli5wYJ9gg6c=;
 h=From:Subject:Date:To:Cc:From;
 b=htTQ26al3LR/ohXcZ3e8N0XMgSRakjGeJ2ZP7LL/XhokQ3UIu6fzMGKJimD0Ihomc
 8jVi3JRDS1Ck71gluAFReDsfoenIkRw5PKKFeAE0FzHWRBL9ue+AN+Ho90E1ZdkcDr
 YIFJaM+SjgHHi5ptJv1JXpgJQ2n+CMOKnrXBxqVgz19ElEhBHMRmUL4PFNZqVwx6To
 ZNqkC8744QHj+NYCVj4sTAC7eDZNeLRweYTv0FEVbgem5mgcCR2bUp30nWGIOeypog
 5fUhl9D+hE+G1FsNVH7qtTbmDMIvprbMQSnhpZiDpwa8clO0Pyl+3tsqTPGzocmQF9
 HA80W0CVU/3rA==
From: Ross Cawston <ross@r-sc.ca>
Subject: [PATCH 0/5] accel/rocket: Support standalone DPU/PPU tasks and
 pipelined workloads
Date: Tue, 17 Feb 2026 13:39:48 -0800
Message-Id: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDuQBIyhVyku4vRvHQxRkiKCe
 HdDl9/ivZMqiqLSszupYNeqa26wj45kjvkL1nczOeO8cXbgKILEZZUFP5aEmHmKFdwPYhCC7y0
 8tXor+OjxP7/G67oBelIx/WkAAAA=
X-Change-ID: 20260217-accel-rocket-clean-base-57c0e88651e6
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Ross Cawston <ross@r-sc.ca>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771364416; l=1823;
 i=ross@r-sc.ca; s=20260217; h=from:subject:message-id;
 bh=+HW60++zZgm+CdQIuXBfWSgJ2xzF3207WAPL1PMXe8s=;
 b=G8K6aT43k8Mw0JlZErarkO5IPzgEQIj5hluZO7r6YErKRr7oNpMBUkZRD2FMCnbx15GK2tCuM
 3zjzsG+/XttBm4glvG9IMTha/4JEPfI2si8cFmHdFwTKmIRBa6gFqgQ
X-Developer-Key: i=ross@r-sc.ca; a=ed25519;
 pk=c50mfTDLKsgS2tlqXEZEvb/VGiLvxjsLOw5M50DxhtM=
X-Envelope-From: ross@r-sc.ca
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[r-sc.ca:s=spacemail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[r-sc.ca];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ross@r-sc.ca,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[tomeuvizoso.net,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[r-sc.ca:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,r-sc.ca:mid,r-sc.ca:dkim,r-sc.ca:email]
X-Rspamd-Queue-Id: 9FD0715105F
X-Rspamd-Action: no action

The Rocket NPU supports multiple workload types beyond convolutional jobs:
- Standalone post-processing (PPU) tasks (pooling, element-wise ops, etc.)
- Pipelined DPU→PPU workloads

The current driver has limitations preventing these from working correctly:
- CNA/Core S_POINTER registers are always written, re-arming stale state
- Interrupt handling is hard-coded to DPU only, causing PPU timeouts
- Ping-pong mode is always enabled

This series fixes these while preserving backward compatibility.

Patch breakdown:
1/5 Fix error path in BO creation (cleanup/fix)
2/5 Enable ping-pong mode only for multi-task jobs (optimization)
3/5 Add per-task int_mask and flags to UAPI/kernel (new knobs)
4/5 Skip CNA/Core S_POINTER init for standalone tasks
5/5 Use per-task interrupt mask and handle PPU completions

Derived from vendor BSP behavior.

Tested on OrangePi 5 Ultra and Radxa Rock 5B (RK3588).

Thanks for review!

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
Ross Cawston (5):
      accel/rocket: Fix error path in BO creation
      accel/rocket: Enable ping-pong mode only for multi-task jobs
      accel/rocket: Add per-task flags and interrupt mask to UAPI and kernel
      accel/rocket: Skip CNA/Core S_POINTER initialization for standalone tasks
      accel/rocket: Use per-task interrupt mask and handle PPU completion interrupts

 drivers/accel/rocket/rocket_gem.c |  2 +
 drivers/accel/rocket/rocket_job.c | 80 ++++++++++++++++++++++++++++++---------
 drivers/accel/rocket/rocket_job.h |  2 +
 include/uapi/drm/rocket_accel.h   | 25 ++++++++++++
 4 files changed, 92 insertions(+), 17 deletions(-)
---
base-commit: 17f8d2009367c3da82882f70ccbdca9f8c7b5f20
change-id: 20260217-accel-rocket-clean-base-57c0e88651e6

Best regards,
-- 
Ross Cawston <ross@r-sc.ca>

