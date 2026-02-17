Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MldEI7ilGmWIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A2151027
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446E10E2B6;
	Tue, 17 Feb 2026 21:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="HxDxg4Vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com
 [63.250.43.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3689F10E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:50:01 +0000 (UTC)
Received: from mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFtNP1yfGz6tkL;
 Tue, 17 Feb 2026 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771364423;
 bh=oTz3oWFK5OfP2qYkAaOru18NOUe5Uc5v0FwjeqftcXk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HxDxg4VkycB2TqNC+bUIRp4nMiYINiBSVkq80kIhsOZ7ilCk6Jfxi3RYEfi6e45pu
 HYHVxxpQ0eeqbLMohzrUUYeh7vBTesqisaass1NA8mXBeUEu9Wei6Ojqpzh0LQrTX2
 pG3l12j/V/yxU98KgkpX6wapBAMHNM/YIZlJerVFhx0lq+ehLJEqM+KjtBowuez0xh
 8AQTunrWCHk+6eJsKVEqJk3D555553BuWkCHsab2SQrgqP2RTDqE8xM6Y0hO8jaKve
 VayHMHx9KmGReyY1kl53e4wX57jr+rhnsz+gOkXfdw3N9f2jxHuAWyclogg5yFYHIi
 AsWLprdXsUlvQ==
From: Ross Cawston <ross@r-sc.ca>
Date: Tue, 17 Feb 2026 13:39:50 -0800
Subject: [PATCH 2/5] accel/rocket: Enable ping-pong mode only for
 multi-task jobs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-accel-rocket-clean-base-v1-2-d72354325a25@r-sc.ca>
References: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
In-Reply-To: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Ross Cawston <ross@r-sc.ca>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771364416; l=1192;
 i=ross@r-sc.ca; s=20260217; h=from:subject:message-id;
 bh=Cb4+IVDkbQUsrtBc50YqMxFErQMDOR9dE7jYs8FPuWs=;
 b=kgV09ggsxo5ywlguj5jWKWb/WbBAvwB77ZRO5dWWnXtIeQV1nOhqsXh7n4fUUlfxyrg/OTmQi
 LKUIGFFWzzcCK+8X0UtBix1CHw8nPF9FNXp53t0Hn/5B4pdmGsSObB5
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
	FORGED_SENDER(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: A68A2151027
X-Rspamd-Action: no action

Ping-pong mode (PC_TASK_CON_TASK_PP_EN) is required for chaining multiple
tasks in a job, but is unnecessary overhead for single-task jobs.

Set it conditionally based on job->task_count to avoid pointless buffer
management cycles and slightly reduce per-job latency/power on simple
workloads.

No functional change or risk of corruption for existing jobs - backward
compatible.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index acd606160dc9..369b60805d5f 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -143,7 +143,7 @@ static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *jo
 	rocket_pc_writel(core, TASK_CON, PC_TASK_CON_RESERVED_0(1) |
 					 PC_TASK_CON_TASK_COUNT_CLEAR(1) |
 					 PC_TASK_CON_TASK_NUMBER(1) |
-					 PC_TASK_CON_TASK_PP_EN(1));
+					 PC_TASK_CON_TASK_PP_EN(job->task_count > 1 ? 1 : 0));
 
 	rocket_pc_writel(core, TASK_DMA_BASE_ADDR, PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR(0x0));
 

-- 
2.52.0

