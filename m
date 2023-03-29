Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F46CCF92
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 03:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304CC10E4D0;
	Wed, 29 Mar 2023 01:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E29D10E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 01:45:00 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 kx3-20020a17090b228300b0023cfd09ed94so6915257pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680054300;
 h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VYeI/i9wqMGf819/Dh2oVh1hS6IvbfAuYepCeOqr2KI=;
 b=AU/8uFw0OoaqlosQJo0ph1OohbjHec2zHfPmuigUDtW9bS5EhbQqL15VDWZcXD3vMJ
 +DIWbKCegnTi1CSZVSjrIITHUuv7zW3SntW7GR0OfgkXk9H6tHHzg4YtMEbr2v4aiGnz
 juHOOgveV/pDck84w06QOZ4ilULakvYvZmiXup00yGh52BK0aMwsEGaC67bTMDp51JTA
 wC/GujyC9+4sewzNEeAUiCMiMMB9eJ0eLPaqdH5ob3QgprgTq15s9A7eWcOKU5WoE15/
 RTpfWTre4iCJOe9Z2Vqetvj9Rd+w8x7i3dyHJZoL7hFZ4xc/5G6IYffWrDQyApUY7S27
 uuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680054300;
 h=to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VYeI/i9wqMGf819/Dh2oVh1hS6IvbfAuYepCeOqr2KI=;
 b=iURPkw3wFOFqt4N4vOsRSW9JU81hnJWYHvpTOJ0dgy0IgeaZ5hqJ5BV33ql0f+fG2I
 CIiE/rRuddfal20Oh6t7xiaqYeTrS6ozZfSzgkD8A8cmEr0uaOqfZzS0vZq9ZLqo10+c
 HNyZuYLY8TRoM88tApewvtnMMBwlf+ECXH0lsTSHNgAM2EX2FDmYRfBjGdDMw5FzgtxQ
 45I9nNCR4q3GjdOihK8OEljArKljshoT+5Ff+ftuH0WQLCEbiXJSvfWnm3YSE6opxd/h
 DssPb+NIPTF8Qg2MhIAhXAueZF01f5kRK9njb1dkxlLqhgHn3nY4w1Gtp0nMEfuB3NcV
 EtSg==
X-Gm-Message-State: AAQBX9cAuLGmG+bXEbL54LJ8tNCjNQJg6rYqR3A0bX2NNC0XVDHqVpzo
 a0GKJ+9c38l0cGCXol9Yc2FRkZk1UbgcqA==
X-Google-Smtp-Source: AKy350brnWnarSFPKwae/zYAPgBn9U5fdu00oqt47DsoGkrKG6Tsh8itzph/TT7TGkcjjykDpqENZTRzmN50bA==
X-Received: from wonchungspecialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1440])
 (user=wonchung job=sendgmr) by 2002:a17:902:ea0c:b0:1a0:527b:9189 with SMTP
 id s12-20020a170902ea0c00b001a0527b9189mr6492632plg.11.1680054300003; Tue, 28
 Mar 2023 18:45:00 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:44:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230329014455.1990104-1-wonchung@google.com>
Subject: [PATCH] drm/sysfs: Expose DRM connector id in each connector sysfs
From: Won Chung <wonchung@google.com>
To: wonchung@google.com, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com, 
 gildekel@chromium.org, seanpaul@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Expose DRM connector id in device sysfs so that we can map the connector
id to the connector syspath. Currently, even if we can derive the
connector id from modeset, we do not have a way to find the
corresponding connector's syspath.

This is helpful when determining the root connector of MST tree. When a
tree of multiple MST hub is connected to the system, modeset describes
the tree in the PATH blob. For example, consider the following scenario.

+-------------+
| Source      |    +-------------+
| (Device)    |    | BranchX     |
|             |    | (MST)       |
|       [conn6]--->|       [port1]--->DisplayA
+-------------+    |             |
                   |             |    +-------------+
                   |             |    | BranchY     |
                   |             |    | (MST)       |
                   |       [port2]--->|       [port1]----->DisplayB
                   +-------------+    |             |
                                      |       [port2]----->DisplayC
                                      +-------------+

DPMST connector of DisplayA would have "mst:6-1" PATH.
DPMST connector of DisplayB would have "mst:6-2-1" PATH.
DPMST connector of DisplayC would have "mst:6-2-2" PATH.

Given that connector id of 6 is the root of the MST connector tree, we
can utilize this patch to parse through DRM connectors sysfs and find
which connector syspath corresponds to the root connector (id == 6).

ChromeOS intend to use this information for metrics collection. For
example, we want to tell which port is deriving which displays even with
a MST hub. Chromium patch for parsing DRM connector id from the kernel
is at http://crrev.com/c/4317207.

Signed-off-by: Won Chung <wonchung@google.com>
---
 drivers/gpu/drm/drm_sysfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 183130355997..11f98c5d6103 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -282,16 +282,27 @@ static ssize_t modes_show(struct device *device,
 	return written;
 }
 
+static ssize_t connector_id_show(struct device *device,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct drm_connector *connector = to_drm_connector(device);
+
+	return sysfs_emit(buf, "%d\n", connector->base.id);
+}
+
 static DEVICE_ATTR_RW(status);
 static DEVICE_ATTR_RO(enabled);
 static DEVICE_ATTR_RO(dpms);
 static DEVICE_ATTR_RO(modes);
+static DEVICE_ATTR_RO(connector_id);
 
 static struct attribute *connector_dev_attrs[] = {
 	&dev_attr_status.attr,
 	&dev_attr_enabled.attr,
 	&dev_attr_dpms.attr,
 	&dev_attr_modes.attr,
+	&dev_attr_connector_id.attr,
 	NULL
 };
 
-- 
2.40.0.348.gf938b09366-goog

