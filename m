Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EjXE5cne2nXBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:25:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC7AE1AB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C64010E73E;
	Thu, 29 Jan 2026 09:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="BLIfnR/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com
 [45.254.49.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4F10E73E;
 Thu, 29 Jan 2026 09:25:38 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
 by smtp.qiye.163.com (Hmail) with ESMTP id 326a2d473;
 Thu, 29 Jan 2026 17:25:35 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 mario.limonciello@amd.com, pratap.nirujogi@amd.com, alex.hung@amd.com,
 sakari.ailus@linux.intel.com, lijo.lazar@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
Date: Thu, 29 Jan 2026 09:25:32 +0000
Message-Id: <20260129092532.921809-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c0912888703a1kunmfecbb79410cc7f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEJIVkNDQktDH04aSR4fH1YeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg
 ++
DKIM-Signature: a=rsa-sha256;
 b=BLIfnR/lBXjlW/j9BG7yESi1l6jZ8+lND0IcGx318XgpljYJVYLprh9Yg6tSWxxoH4JArxjP35xuFV17HGfR/r6+xUGQ2SRXg7exRYDfJBWsl90KkONilnZcVta/p14MqzNfG4+u3lyHZDpfdJCkvxorXdenxqHz/sACfnXWwrg=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=CXMwENmzKP+RWsE+LIKSDf98HXtSoCzOeMJnBvytx4w=;
 h=date:mime-version:subject:message-id:from;
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,lists.freedesktop.org,seu.edu.cn];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zilin@seu.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.920];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,seu.edu.cn:email,seu.edu.cn:dkim,seu.edu.cn:mid]
X-Rspamd-Queue-Id: D0DC7AE1AB
X-Rspamd-Action: no action

In amdgpu_acpi_enumerate_xcc(), if amdgpu_acpi_dev_init() returns -ENOMEM,
the function returns directly without releasing the allocated xcc_info,
resulting in a memory leak.

Fix this by ensuring that xcc_info is properly freed in the error paths.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 4d5275ab0b18 ("drm/amdgpu: Add parsing of acpi xcc objects")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index d31460a9e958..7c9d8a6d0bfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1135,8 +1135,10 @@ static int amdgpu_acpi_enumerate_xcc(void)
 		if (!dev_info)
 			ret = amdgpu_acpi_dev_init(&dev_info, xcc_info, sbdf);
 
-		if (ret == -ENOMEM)
+		if (ret == -ENOMEM) {
+			kfree(xcc_info);
 			return ret;
+		}
 
 		if (!dev_info) {
 			kfree(xcc_info);
-- 
2.34.1

