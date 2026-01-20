Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIG6IaOkb2lJDwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC846C34
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468FA10E5D7;
	Tue, 20 Jan 2026 12:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="GGMzYIDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1B10E5D6;
 Tue, 20 Jan 2026 12:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768911308; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YXxwjvWSeLZi6CCwaibn3INm4Vs56XXK6QpR/BbBmLkO99l3JU9K1E/qj6CcFEvwazFoGf6ARxGVQY+PKbYLf8aGkUagRD0EqINLd5b9pIXbfqbRFzn9esg4MI1pGyzgoTqPqQHeM+II+sdJzLLBiYAt8+PYx1nisIybXV6KMNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768911308;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PDhEzQHy8dg1/gKCobx6aIYWb0SnjO8VklaqmQdV+uo=; 
 b=hmL2gGAgl4ANilT+dhZDGyPaOOmKUNnLXr3jTw8HxFhO+I/anwL61GXqwiKUl/R/EeDTb7Nrb4IFmfQjZIUzo44cbhzhLQA6marWjTOQsuO5GWbutKZv50B+255Jnzq041fNu8V11gieYeAHcB7bQqeWInA/eOzqkwTYHj5k1Ms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768911308; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PDhEzQHy8dg1/gKCobx6aIYWb0SnjO8VklaqmQdV+uo=;
 b=GGMzYIDm8lDQG6tGyWJov7FYbDGKDjEOFWJKJgwbd5f7lxJIKkb1ljTY0IHTgV9A
 Xw1XrAaAtujLIUQzDYNh9G2ML34BRZ3PEe/R6KztKdZC9j8clV1wGXEFTjBI8qVaV7B
 0VHOddt7Hwr0JKKg3eUbTYqvfjzASsXJ4ML10L3M=
Received: by mx.zohomail.com with SMTPS id 1768911305047450.0820003082039;
 Tue, 20 Jan 2026 04:15:05 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Li Chen <me@linux.beauty>
Subject: [PATCH] nouveau: pci: quiesce GPU on shutdown
Date: Tue, 20 Jan 2026 20:14:55 +0800
Message-ID: <20260120121455.142960-1-me@linux.beauty>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.beauty:s=zmail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux.beauty];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@linux.beauty,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.beauty:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E5FC846C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kexec reboot does not reset PCI devices.
Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
userspace still holds DRM file descriptors.

Quiesce the GPU through the suspend path and then power down the PCI
function so the next kernel can re-initialize the device from a consistent
state.

WARNING: drivers/gpu/drm/drm_mode_config.c:578 at drm_mode_config_cleanup+0x2e7/0x300, CPU#2: kexec/1300
Call Trace:
 <TASK>
 ? srso_return_thunk+0x5/0x5f
 ? enable_work+0x3a/0x100
 nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

nouveau 0000:26:00.0: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
WARNING: drivers/gpu/drm/drm_framebuffer.c:833 at drm_framebuffer_free+0x73/0xa0, CPU#2: kexec/1300
Call Trace:
 <TASK>
 drm_mode_config_cleanup+0x248/0x300
 ? __pfx___drm_printfn_dbg+0x10/0x10
 ? drm_mode_config_cleanup+0x1dc/0x300
 nouveau_display_destroy+0x39/0x70 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_device_fini+0x7b/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

WARNING: include/drm/ttm/ttm_resource.h:406 at nouveau_ttm_fini+0x257/0x270 [nouveau], CPU#2: kexec/1300
Call Trace:
 <TASK>
 nouveau_drm_device_fini+0x93/0x1f0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 nouveau_drm_shutdown+0x52/0xc0 [nouveau c19e0da7fd83583a023f855c510d9a3903808734]
 pci_device_shutdown+0x35/0x60
 device_shutdown+0x11c/0x1b0
 kernel_kexec+0x13a/0x160
 __do_sys_reboot+0x209/0x240
 do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? __rtnl_unlock+0x37/0x70
 ? srso_return_thunk+0x5/0x5f
 ? netdev_run_todo+0x63/0x570
 ? netif_change_flags+0x54/0x70
 ? srso_return_thunk+0x5/0x5f
 ? devinet_ioctl+0x1e5/0x790
 ? srso_return_thunk+0x5/0x5f
 ? inet_ioctl+0x1e9/0x200
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x7d/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x23b/0x610
 ? srso_return_thunk+0x5/0x5f
 ? put_user_ifreq+0x7a/0x90
 ? srso_return_thunk+0x5/0x5f
 ? sock_do_ioctl+0x107/0x130
 ? srso_return_thunk+0x5/0x5f
 ? __x64_sys_ioctl+0x97/0xe0
 ? srso_return_thunk+0x5/0x5f
 ? do_syscall_64+0x81/0x610
 ? srso_return_thunk+0x5/0x5f
 ? exc_page_fault+0x7e/0x1a0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Signed-off-by: Li Chen <me@linux.beauty>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..50384462723b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1079,6 +1079,29 @@ nouveau_pmops_resume(struct device *dev)
 	return ret;
 }
 
+static void
+nouveau_drm_shutdown(struct pci_dev *pdev)
+{
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!drm)
+		return;
+
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return;
+
+	ret = nouveau_do_suspend(drm, false);
+	if (ret)
+		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+	usleep_range(200, 400);
+}
+
 static int
 nouveau_pmops_freeze(struct device *dev)
 {
@@ -1408,6 +1431,7 @@ nouveau_drm_pci_driver = {
 	.id_table = nouveau_drm_pci_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
+	.shutdown = nouveau_drm_shutdown,
 	.driver.pm = &nouveau_pm_ops,
 };
 
-- 
2.52.0

