Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE49497AB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 20:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5113A10E3DD;
	Tue,  6 Aug 2024 18:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PKrt8LtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7220B10E0FB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722969739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTOhpRVmhZuXkHBiygGH1i2Eclfn36V87P5jpIjXJgU=;
 b=PKrt8LtKqNZkHvO3yf8JQ0ql0v3YO5aibeJ7xhUq6xXfgY788h5lt8SEND1OOYKKSyv9Y6
 ptkbX1piaK58r/KGNv0mOPTQDektEzyV3E4ROd635lx7O5zgFRg9BE9nBcSctjx9luQKKQ
 bDauQIbJpCcAFkMGKrp69IsZCOEe0No=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-kObu8eyDOImRbUUThfCecg-1; Tue, 06 Aug 2024 14:42:18 -0400
X-MC-Unique: kObu8eyDOImRbUUThfCecg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-368448dfe12so50368f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 11:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722969737; x=1723574537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTOhpRVmhZuXkHBiygGH1i2Eclfn36V87P5jpIjXJgU=;
 b=DdmiqQbPTzUmraI/H1M3WX/xgePnJi14DZT50ocXqsoSaMkFjrKcpXMvHTRdjScgrf
 kI50gejgcP3Wf4Lpszbk33BgTJAFXhuhM7JMGXMw0sw/i9aMKGZEKagWP0G537Y64lx3
 RO3ous1bcpdnnolzLwjtZEHe2ZL2/5Qq6STSYthxU07cebVUIwe0CIV6jxyQbWgY5omb
 EOtx0UhRp0k7zUy3bThHN5FF2vs8hvmEJV0aSlTaSjDkamVucRqVWgEf0x+JpOadXR5d
 d9uw+o623LcB1uPQ9V3tIhuhpyjNFPe8Q8EGfsKQtv6ZvZVN4WhMx7KBNwykpVWxvT+g
 gPwA==
X-Gm-Message-State: AOJu0Yz7E1Ni2xahvvikrJWMQuy6PrCVwrTkJttBihU6XdwXzyZQL7HD
 9OW6v9DHPwY47qBECLeGz3q9LKbUVpPc86ufr+E+RdZmFBsTgYkvmXjgixfLIifgbpiWvodpjh9
 pcts9QdSnfrmJsdByaXp1D04c36jk/ksOUuq+H7/QXaI8lgbtcTV4Ub/HRdEY9s+TIX02mKtdng
 pOk297OfJmTLbyNkQLfYDCpt1270mv5bFdVx5Z5xiAiKM6FwhgUlvn1eQGA+MU
X-Received: by 2002:a05:600c:46cd:b0:424:8743:86b4 with SMTP id
 5b1f17b1804b1-428e4713f62mr134423655e9.6.1722969736729; 
 Tue, 06 Aug 2024 11:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr5Jf4uJJrllifZn/qGW9eINl+OCbwq5032Gwf/jPT83g6dT50HU1rINEr2nwgAWfHi7K58Q==
X-Received: by 2002:a05:600c:46cd:b0:424:8743:86b4 with SMTP id
 5b1f17b1804b1-428e4713f62mr134423345e9.6.1722969736214; 
 Tue, 06 Aug 2024 11:42:16 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:898e:ab00:d894:f48:6689:8e30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e3ef10sm196595695e9.24.2024.08.06.11.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 11:42:15 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Roman Li <roman.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "drm/amd/display: add panel_power_savings sysfs
 entry to eDP connectors"
Date: Tue,  6 Aug 2024 20:42:10 +0200
Message-ID: <20240806184214.224672-2-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806184214.224672-1-sebastian.wick@redhat.com>
References: <20240806184214.224672-1-sebastian.wick@redhat.com>
MIME-Version: 1.0
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

From: Sebastian Wick <sebastian@sebastianwick.net>

This reverts commit 63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5.

The panel_power_savings sysfs entry can be used to change the displayed
colorimetry which breaks color managed setups.

The "do not break userspace" rule which was violated here is enough
reason to revert this commit.

The bigger problem is that this feature is part of the display chain
which is supposed to be controlled by KMS. This sysfs entry bypasses the
DRM master process and splits control to two independent processes which
do not know about each other. This is what caused the broken user space.
It also causes modesets which can be extremely confusing for the DRM
master process, causing unexpected timings.

We should in general not allow anything other than KMS to control the
display path. If we make an exception to this rule, this must be first
discussed on dri-devel with all the stakeholders approving the
exception.

This has not happened which is the second reason to revert this commit.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 80 -------------------
 1 file changed, 80 deletions(-)

diff --git ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4d4c75173fc3..16c9051d9ccf 100644
--- ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6772,82 +6772,10 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	return ret;
 }
 
-/**
- * DOC: panel power savings
- *
- * The display manager allows you to set your desired **panel power savings**
- * level (between 0-4, with 0 representing off), e.g. using the following::
- *
- *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
- *
- * Modifying this value can have implications on color accuracy, so tread
- * carefully.
- */
-
-static ssize_t panel_power_savings_show(struct device *device,
-					struct device_attribute *attr,
-					char *buf)
-{
-	struct drm_connector *connector = dev_get_drvdata(device);
-	struct drm_device *dev = connector->dev;
-	u8 val;
-
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	val = to_dm_connector_state(connector->state)->abm_level ==
-		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
-		to_dm_connector_state(connector->state)->abm_level;
-	drm_modeset_unlock(&dev->mode_config.connection_mutex);
-
-	return sysfs_emit(buf, "%u\n", val);
-}
-
-static ssize_t panel_power_savings_store(struct device *device,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count)
-{
-	struct drm_connector *connector = dev_get_drvdata(device);
-	struct drm_device *dev = connector->dev;
-	long val;
-	int ret;
-
-	ret = kstrtol(buf, 0, &val);
-
-	if (ret)
-		return ret;
-
-	if (val < 0 || val > 4)
-		return -EINVAL;
-
-	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	to_dm_connector_state(connector->state)->abm_level = val ?:
-		ABM_LEVEL_IMMEDIATE_DISABLE;
-	drm_modeset_unlock(&dev->mode_config.connection_mutex);
-
-	drm_kms_helper_hotplug_event(dev);
-
-	return count;
-}
-
-static DEVICE_ATTR_RW(panel_power_savings);
-
-static struct attribute *amdgpu_attrs[] = {
-	&dev_attr_panel_power_savings.attr,
-	NULL
-};
-
-static const struct attribute_group amdgpu_group = {
-	.name = "amdgpu",
-	.attrs = amdgpu_attrs
-};
-
 static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
 
-	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    amdgpu_dm_abm_level < 0)
-		sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
-
 	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
 }
 
@@ -6952,14 +6880,6 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 		to_amdgpu_dm_connector(connector);
 	int r;
 
-	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    amdgpu_dm_abm_level < 0) {
-		r = sysfs_create_group(&connector->kdev->kobj,
-				       &amdgpu_group);
-		if (r)
-			return r;
-	}
-
 	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
-- 
2.45.2

