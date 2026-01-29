Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI8QDc8be2msBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:35:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA16AD8FB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA8D10E261;
	Thu, 29 Jan 2026 08:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="JYCIQQEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com
 [45.254.49.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9B210E33C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:35:20 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
 by smtp.qiye.163.com (Hmail) with ESMTP id 32682fc73;
 Thu, 29 Jan 2026 16:35:16 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 tao.zhou1@amd.com, Hawking.Zhang@amd.com, YiPeng.Chai@amd.com,
 ganglxie@amd.com, Stanley.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
Date: Thu, 29 Jan 2026 08:35:15 +0000
Message-Id: <20260129083515.886112-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c08e477e003a1kunm92e525c1109cdc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUxNVkNLS0weTh0YSk8eQ1YeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
 tZBg++
DKIM-Signature: a=rsa-sha256;
 b=JYCIQQEeT13b0SzJAaVxu3/IOZNblgiFjNemjUkzGXSaHvOTvzGIqedotLFk7VPrGrBT3/tovOhpPIHnUuVp8SFZWr6UDzZiVtibggMP738+D01du7y8VYXozNew4aO4e1cPMBMdIDBhs9dQ7Y5IA5P+EPMQ+D4tANr1XLKdO/M=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=nuTqOxVNmE8t2k0UNGPm5EmQmSMZzZtlqyG00Pd8Dfc=;
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:tao.zhou1@amd.com,m:Hawking.Zhang@amd.com,m:YiPeng.Chai@amd.com,m:ganglxie@amd.com,m:Stanley.Yang@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zilin@seu.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zilin@seu.edu.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5DA16AD8FB
X-Rspamd-Action: no action

When amdgpu_nbio_ras_sw_init() fails in amdgpu_ras_init(), the function
returns directly without freeing the allocated con structure, leading
to a memory leak.

Fix this by jumping to the release_con label to properly clean up the
allocated memory before returning the error code.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: fdc94d3a8c88 ("drm/amdgpu: Rework pcie_bif ras sw_init")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 2a6cf7963dde..8de9f68f7bea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -4343,7 +4343,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	 * to handle fatal error */
 	r = amdgpu_nbio_ras_sw_init(adev);
 	if (r)
-		return r;
+		goto release_con;
 
 	if (adev->nbio.ras &&
 	    adev->nbio.ras->init_ras_controller_interrupt) {
-- 
2.34.1

