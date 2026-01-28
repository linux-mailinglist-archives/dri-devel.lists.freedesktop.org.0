Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJRNHwGaemms8QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 00:21:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA9A9F32
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 00:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A985A10E77B;
	Wed, 28 Jan 2026 23:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFc9Ym3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E9F10E77B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:21:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7C5560054;
 Wed, 28 Jan 2026 23:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E736C116C6;
 Wed, 28 Jan 2026 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769642492;
 bh=pGn6tRlh76X1LRm+QzdGvJqlCD9cubRsIBiMDtmr1PI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFc9Ym3kShJhBmWe8au5S8aGw2WePaEVwhY+GvA7SFa35Bj1a1EhIDxgrby3LYsM1
 kW/7rpWaf5WLaGEb+QVAPyHH7Q6WI5xlejag+Z/USUxeLx8wMP1GOSBQBnubZ/TA5v
 tcGqf7uz1K6kZNEswl3Jq3WgHOq3xIePnuRrwOK4BhsYU+gfmJEO8YTe+sZTI7iC2t
 9k0M+bHdVXkvAty96ArvT6JtcYRNw61HEq8C5nCt8rIqH1qcqkqxeaBSH8TabmCIWj
 j0axxGhdLXiAnu0z5gZSNO5LvAvT7Milu5Jk48VftPXBbekc1U7xMBixj3LJR8cswp
 6tkfPPNY0riVw==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, louis.chauvet@bootlin.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] drm: vkms: do not use devres groups
Date: Thu, 29 Jan 2026 00:20:34 +0100
Message-ID: <20260128232038.2399-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128232038.2399-1-dakr@kernel.org>
References: <20260128232038.2399-1-dakr@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:lyude@redhat.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,redhat.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 52BA9A9F32
X-Rspamd-Action: no action

Using devres groups in vkms is unnecessary, as the corresponding cleanup
happens automatically when the device is unbound through
faux_device_destroy().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 434c295f44ba..585fd642281c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -169,16 +169,11 @@ int vkms_create(struct vkms_config *config)
 	if (!fdev)
 		return -ENODEV;
 
-	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
-
 	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
-		goto out_devres;
+		goto out;
 	}
 	vkms_device->faux_dev = fdev;
 	vkms_device->config = config;
@@ -189,33 +184,31 @@ int vkms_create(struct vkms_config *config)
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_devres;
+		goto out;
 	}
 
 	ret = drm_vblank_init(&vkms_device->drm,
 			      vkms_config_get_num_crtcs(config));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+		goto out;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	drm_client_setup(&vkms_device->drm, NULL);
 
 	return 0;
 
-out_devres:
-	devres_release_group(&fdev->dev, NULL);
-out_unregister:
+out:
 	faux_device_destroy(fdev);
 	return ret;
 }
@@ -262,7 +255,6 @@ void vkms_destroy(struct vkms_config *config)
 	drm_colorop_pipeline_destroy(&config->dev->drm);
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&fdev->dev, NULL);
 	faux_device_destroy(fdev);
 
 	config->dev = NULL;
-- 
2.52.0

