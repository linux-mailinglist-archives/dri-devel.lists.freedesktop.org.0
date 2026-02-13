Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N9fO/03j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C244137267
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A28E10E812;
	Fri, 13 Feb 2026 14:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="T0g3LpV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E041B10E803
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770993647; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dYFVHs4wdrVX4JL43+YjJrx7t5YxfLb0I8ZVfHtcwRUS/sjhDwHGrqA8LDVlO+BwwXzHsEJAUK0oMDCAMLC0FAALBy/Y01wZSJbpgRc0jnhNE0Y1bjSg7DTH3TEvGbhQal1UpHC262mz4z5lTkZVfqWxeF4NvjfGwIOlQBr7Pjk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770993647;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MwopX7j5ihXNvjDClg1KESjjTuHvu9bwRGuLCUOFTvU=; 
 b=R0GWz7TKEt8HOjtKKByIBwahxx4z7yS8/UWY+g5DRdYTcJOGDk2a1SWazZAkY/nIpb31TNuRDaKPPhC84i4vkuIgodBRzYDpeezrSXz/rpWa3o4eOeN78HcMIfBo58Qy+DbXXYm7qZRV+F1hUjKogf3jJ69vAD+I+opzFWlSQdQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770993647; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=MwopX7j5ihXNvjDClg1KESjjTuHvu9bwRGuLCUOFTvU=;
 b=T0g3LpV+IPbTYd6rGHcK1ulruIwSsQqqaaRQBCNkLEMAem9OJbnB9vs35bFlxTMw
 m2JUWAfzwjBdsOhnyBYswdv1bgRvmkszuw7VBFNWRRSathfFNMDSdGP1VbryEQR2NiQ
 OkVoWBveJdmThtme6MoMG4d/PMnVFh3gIDDpD+1Y=
Received: by mx.zohomail.com with SMTPS id 1770993644954930.0867705532204;
 Fri, 13 Feb 2026 06:40:44 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v3 0/2] drm/vkms: Fix bad matrix offset component
 multiplication
Date: Fri, 13 Feb 2026 11:40:29 -0300
Message-Id: <20260213-vkms-composer-fix-matrix-v3-0-2dab74293a23@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN03j2kC/4WOMQ7CMAxFr1JlxihxKZBO3AMxpKmBCNpAEiIQ6
 t0xrVgYQB6sb/u/76eIFBxFURdPESi76HzPopwVwh5NfyBwLWuBEiuFWEI+dRGs7y6enbB3d+h
 MCtyMQVvpcr+oVCXYfgnE2xG93U060PXGCWkaisZEeqM6l+qip3uCKUVp8TYcXUw+PMbXshod/
 7/ICrik0StNcolSb6w/n03jg5nz/QjO+IEtJSr5A4YgoVXUSm0bLGn9DRuG4QXgTEB/QgEAAA=
 =
X-Change-ID: 20251223-vkms-composer-fix-matrix-aa2c593f4515
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nfraprado@collabora.com, pekka.paalanen@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770993638; l=1652;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=/7846/KkZ3k6Rcbv1LgHDxZKGXULOU6DfTNwKyr4pvE=;
 b=gqMnNThBmLw0aVbFTbSPEuorWmqJAUljBWU1WkX2jN9b10xAVul6JVydt9TirJuHOGp2M1JtY
 0V+U5q8tUf7AdYau7ikqtAfeU/QJi4pEyiAtFtybq5GGr80SpQj3cib
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:nfraprado@collabora.com,m:pekka.paalanen@collabora.com,m:daniels@collabora.com,m:kernel@collabora.com,m:ariel.dalessandro@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5C244137267
X-Rspamd-Action: no action

This patch series fixes a bug in the 3x4 matrix multiplication for BT709
enconding/decoding, where the offset component if not handled properly.

Currently, BT.709 encoding matrix kunit tests don't cover the offset
component multiplication, so a new set of tests is added.

The bug was found while working on the IGT tools CRTC (post-blend) color
pipelines, see submitted patchset [0] (patch [1] in particular) for the
full context.

[0] https://lore.kernel.org/igt-dev/20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com/
[1] https://lore.kernel.org/igt-dev/20251223-post-blend-colorops-v2-7-f40aca9795bd@collabora.com/

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
Changes in v3:
- Fix 16-bit UNORM encoding for value 1.0 as 0xffff (Pekka Paalanen).
- Link to v2: https://lore.kernel.org/r/20260210-vkms-composer-fix-matrix-v2-0-d1ed09cb23e8@collabora.com

Changes in v2:
- Added kunit tests for alternative BT709 encoding matrix.
- Link to v1: https://lore.kernel.org/r/20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com

---
Ariel D'Alessandro (2):
      drm/vkms: Fix bad matrix offset component multiplication
      drm/vkms: Add kunit tests for alternative BT709 encoding matrix

 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 146 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |  13 ++-
 2 files changed, 156 insertions(+), 3 deletions(-)
---
base-commit: b96bcfba104c65db41378a04f5ccac186f79578f
change-id: 20251223-vkms-composer-fix-matrix-aa2c593f4515

Best regards,
-- 
Ariel D'Alessandro <ariel.dalessandro@collabora.com>

