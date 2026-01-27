Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PkmAxGXeGkWrQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACB930B5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19510E51C;
	Tue, 27 Jan 2026 10:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ovdPJImi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743710E51E;
 Tue, 27 Jan 2026 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769510667;
 bh=8k1knDjmTySyw7ZGPkl+PripTkXl+ZQ0RVPekZtLf28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovdPJImiDu34OGf0iZGBId/tNMCq2xrdk6D5or+cjMUx6afma9RK2n6bM/SvFBXyI
 +N1/JWv2Nmf4Jl7IC6bOLcEmrKT5ssCBLVYvSBmY9ZlgIEuTFey/Be1+/Tx70KY2If
 SdlFsAoUG1uBFeAEpu/0MyiUteaK0v4XVL2oaRguhlG4ZI/iWdbK9jgw3l0TejCnVz
 up+otSBFooml21DrmPxnQkhx4JpC7QKLiRe9PAXVgHzfOCt3eM6lSgqcDBiMl3gYzL
 YNEMDCaA3Q9P76QR1l3SqldotHEOpyDBRuiSzKMMHafD5lUZ21GxjlYliAKUK+z72V
 BH7HxHkUcu3PA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3120C17E0DB7;
 Tue, 27 Jan 2026 11:44:23 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] drm/ci: move qualcomm baremetal jobs to lava
Date: Tue, 27 Jan 2026 16:13:57 +0530
Message-ID: <20260127104406.200505-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.865];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inject-4k:email,memptrs:email,force-edid:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ring:email,qualcomm.com:email,forked-move:email]
X-Rspamd-Queue-Id: ADACB930B5
X-Rspamd-Action: no action

Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
farm. So enable these jobs to use lava and update expectation
files.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
 4 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4d2493..b850b88787ad 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -83,6 +83,7 @@ CONFIG_SC_DISPCC_7180=y
 CONFIG_SC_GPUCC_7180=y
 CONFIG_SM_GPUCC_8350=y
 CONFIG_QCOM_SPMI_ADC5=y
+CONFIG_QCOM_SPMI_VADC=y
 CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 754db71049f0..84153aa2ad68 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -67,31 +67,6 @@
     - testing:x86_64
     - igt:x86_64
 
-.baremetal-igt-arm64:
-  extends:
-    - .baremetal-test-arm64-gl
-    - .use-debian/baremetal_arm64_test-gl
-    - .allow_failure_lockdep
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-  variables:
-    FDO_CI_CONCURRENT: 10
-    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    S3_ARTIFACT_NAME: "arm64/kernel-files"
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
-    FARM: google
-  needs:
-    - debian/baremetal_arm64_test-gl
-    - job: testing:arm64
-      artifacts: false
-    - igt:arm64
-  tags:
-    - $RUNNER_TAG
-
 .software-driver:
   stage: software-driver
   extends:
@@ -149,34 +124,37 @@ msm:sc7180-trogdor-kingoftown:
 
 msm:apq8016:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8016-sbc-usb-host
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-410c
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8016-sbc-usb-host
+    FARM: collabora
     GPU_VERSION: apq8016
-    # disabling unused clocks congests with the MDSS runtime PM trying to
-    # disable those clocks and causes boot to fail.
-    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
-    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
-    RUNNER_TAG: google-freedreno-db410c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-410c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:apq8096:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8096-db820c
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-820c
     DRIVER_NAME: msm
-    BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8096-db820c
+    FARM: collabora
     GPU_VERSION: apq8096
-    RUNNER_TAG: google-freedreno-db820c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-820c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sm8350-hdk:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 72c469021b66..4546363447ff 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,5 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
 msm/msm_mapping@ring,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2893f98a6b97..0d5cb2a87e67 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
-- 
2.47.3

