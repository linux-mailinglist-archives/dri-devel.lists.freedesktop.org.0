Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6FD98F193
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0510E867;
	Thu,  3 Oct 2024 14:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WjfNOFyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC9F10E866
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727966219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI8mVTxRq9+4uYAIpXAcCS2+3TU6mZp+IJtI0Y38Lhg=;
 b=WjfNOFyUO13mcRCrWdk6Rn49f9LJ5qVg1HLGXJ4mQaKmOvuaCsr1BvGO4VqLB+7Z7l7wwV
 rF44HYQ8C+phq/Y5IExGwLuERG3HOT6DzeeuJsoh/7TgcVxto4tTNswJ0HJQPAM7JON+LF
 I6eATncfnTp9ANneT5fIWiFXR9dQn2Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-Qu2bmOGbPnauKM-tM01thQ-1; Thu,
 03 Oct 2024 10:36:55 -0400
X-MC-Unique: Qu2bmOGbPnauKM-tM01thQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BCDAD1977006; Thu,  3 Oct 2024 14:36:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.112])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 60AD21955EA4; Thu,  3 Oct 2024 14:36:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>
Subject: [PATCH 6.12 regression fix 1/2] drm/radeon: Revert: "remove load
 callback from kms_driver"
Date: Thu,  3 Oct 2024 16:36:39 +0200
Message-ID: <20241003143640.14932-2-hdegoede@redhat.com>
In-Reply-To: <20241003143640.14932-1-hdegoede@redhat.com>
References: <20241003143640.14932-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Commit 90985660ba48 ("drm/radeon: remove load callback from kms_driver")
causes my system with a R7 250E card to hang at boot, reporting
the following (abbreviated) oops captured by serial console:

[    7.512157] BUG: kernel NULL pointer dereference, address: 0000000000000050
[    7.519149] #PF: supervisor read access in kernel mode
[    7.524309] #PF: error_code(0x0000) - not-present page
[    7.529474] PGD 0 P4D 0
[    7.532024] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[    7.532200] ttyS ttyS0: 1 input overrun(s)
[    7.536930] Hardware name: Micro-Star International Co., Ltd. MS-7C95/B550M PRO-VDH WIFI (MS-7C95), BIOS 2.L0 07/18/2024
[    7.536931] RIP: 0010:drm_dp_aux_register+0xbf/0xf0 [drm_display_helper]
[    7.672486] Call Trace:
[    7.674951]  <TASK>
[    7.698208]  ? asm_exc_page_fault+0x22/0x30
[    7.702417]  ? drm_dp_aux_register+0xbf/0xf0 [drm_display_helper]
[    7.708545]  radeon_dp_aux_init+0x91/0xc0 [radeon]
[    7.713401]  radeon_get_atom_connector_info_from_object_table+0x63d/0x9e0 [radeon]
[    7.721021]  ? __entry_text_end+0xfe4dc/0x1025cd
[    7.725680]  ? srso_alias_return_thunk+0x5/0xfbef5
[    7.730501]  ? rcu_is_watching+0xd/0x40
[    7.734359]  ? srso_alias_return_thunk+0x5/0xfbef5
[    7.739182]  ? __kmalloc_noprof+0x2b6/0x420
[    7.743386]  ? drm_mode_crtc_set_gamma_size+0x31/0xb0
[    7.748467]  ? radeon_modeset_init+0x3f1/0x4b0 [radeon]
[    7.753730]  ? srso_alias_return_thunk+0x5/0xfbef5
[    7.758548]  radeon_modeset_init+0x3f1/0x4b0 [radeon]
[    7.763632]  ? radeon_device_init+0x6ff/0xbd0 [radeon]
[    7.768813]  radeon_driver_load_kms+0xd1/0x230 [radeon]
[    7.934843] Modules linked in: radeon(+) drm_ttm_helper ttm crct10dif_pclmul crc32_pclmul crc32c_intel video uas ghash_clmulni_intel i2c_algo_bit usb_storage sha512_ssse3 drm_suballoc_helper sha256_ssse3 nvme drm_display_helper sha1_ssse3 ccp nvme_core cec sp5100_tco wmi hid_lg_g15 hid_logitech_hidpp hid_logitech_dj scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables fuse i2c_dev
[    8.067943] note: (udev-worker)[688] exited with irqs disabled

Revert the change to avoid this crash.

Fixes: 90985660ba48 ("drm/radeon: remove load callback from kms_driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e5a6f3e7c75b..695367c22b7a 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -316,10 +316,6 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, ddev);
 
-	ret = radeon_driver_load_kms(ddev, flags);
-	if (ret)
-		goto err_agp;
-
 	ret = drm_dev_register(ddev, flags);
 	if (ret)
 		goto err_agp;
@@ -580,6 +576,7 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
 static const struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
+	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
 	.unload = radeon_driver_unload_kms,
-- 
2.46.2

