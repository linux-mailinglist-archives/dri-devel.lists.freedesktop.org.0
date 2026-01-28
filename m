Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBJQNf2Zemms8QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 00:21:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94FA9F2A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 00:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3F10E23F;
	Wed, 28 Jan 2026 23:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HoqwOzwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2210E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D7D7C43C95;
 Wed, 28 Jan 2026 23:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464CC4CEF1;
 Wed, 28 Jan 2026 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769642488;
 bh=Gr4t3B1tqgCoEK96h0WSs3SbBJgDd9kUcab5OUuwJSk=;
 h=From:To:Cc:Subject:Date:From;
 b=HoqwOzwNUew+Rn/PHZBdSGkXdaqb3YgmIlp8joF3Ml9qQuH449w4GikGSkv/PGFt+
 ZUNRYuEscIgjVbaeoSTYVDBUiiOfcrkVg6x23YU161gh0IRJ71Vrp+Ycjd/qE5X2Ji
 +TnMWBLERTlID3hiYYeF1+QAYNmDTmdM5ldzQ5H1ls9RgTMy/2uECxFrLa/uCTN+FY
 ka59RuiQmg+eoPrHNPzFZP0Yzv2UiLumBILfCelEZnTXouFPDrSIQtWmDZoAZeDsWG
 w5hZ1vdmbYMx2zXxmpv0vB6sfbNO7FSO8dsComeQBK0/+OE8+2yWSuy01yXaxM9v09
 66q9eJ8awV87A==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, louis.chauvet@bootlin.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm: vgem: do not use devres groups
Date: Thu, 29 Jan 2026 00:20:33 +0100
Message-ID: <20260128232038.2399-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: 5A94FA9F2A
X-Rspamd-Action: no action

Using devres groups in vgem is unnecessary, as the corresponding cleanup
happens automatically when the device is unbound through
faux_device_destroy().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 260c64733972..d75f2ee56cf6 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -133,11 +133,6 @@ static int __init vgem_init(void)
 	if (!fdev)
 		return -ENODEV;
 
-	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
-
 	dma_coerce_mask_and_coherent(&fdev->dev,
 				     DMA_BIT_MASK(64));
 
@@ -145,20 +140,18 @@ static int __init vgem_init(void)
 					 struct vgem_device, drm);
 	if (IS_ERR(vgem_device)) {
 		ret = PTR_ERR(vgem_device);
-		goto out_devres;
+		goto out;
 	}
 	vgem_device->faux_dev = fdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
 	if (ret)
-		goto out_devres;
+		goto out;
 
 	return 0;
 
-out_devres:
-	devres_release_group(&fdev->dev, NULL);
-out_unregister:
+out:
 	faux_device_destroy(fdev);
 	return ret;
 }
@@ -168,7 +161,6 @@ static void __exit vgem_exit(void)
 	struct faux_device *fdev = vgem_device->faux_dev;
 
 	drm_dev_unregister(&vgem_device->drm);
-	devres_release_group(&fdev->dev, NULL);
 	faux_device_destroy(fdev);
 }
 

base-commit: a50007089e078a1b7a826559a02277b1601ee189
-- 
2.52.0

