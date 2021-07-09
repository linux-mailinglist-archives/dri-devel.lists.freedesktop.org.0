Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAB3C29AD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E386EA6F;
	Fri,  9 Jul 2021 19:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CB36EA6F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id w13so6986398wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdLcTRIWBNsI6B28xgdufoW2tJ7+hChXLZ6LrUe2WGw=;
 b=cyPTUDOINofC9gk2QIHwy4LVVdGvEaXD8Qdygp0jgNILRlWaANqbKToIOMWfkkSASs
 6DvyaYpvZPAa1B21oa9zeasMrixPKK/EmrfiN0YA32xJC9FVrJEgOEGK/QKOX691WCBz
 xA6rz387EFwPquer+pRl67YWpsi3YnprcjbNTQLCEsfzarnZ+aRvbOuBCvsOvn3vpE04
 It/whpV46PX/ksxUG0Uk5PUPphOctGEANZQxibRgRlgra5qL4PomSrIvUjy3v+5Atpk1
 7KCo7yQd78J2wXBR5OQBgheXn87mnnpgGBoqEZWybp+Vq3mwBrjARhKEDBFsSJ5+If0i
 2ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdLcTRIWBNsI6B28xgdufoW2tJ7+hChXLZ6LrUe2WGw=;
 b=tqHTR47NkIwkvG3WglU7brlG0wKa2m/WPYPcvqYdKUopHHbfaWXKG6hcmAMPhtJmaV
 twMJFqlrAvQlJlhQltLKCmQ20n6H8OQC3vSjZCC8UvejOVnWiyyN0i+sfMl+PQAjEWkJ
 rCCDpMCSBkIuNx6bh0fe0JnszM0GFdkcND4Nho3maqfhfZZEJRtjQApLbeCNjwQYbdFG
 7Gb4tu0LJWUj8noENIUan+r5q7eLLW0Mn6KqplSBJgAyZboRRmsLMmAVwyjmoNb1Zw5l
 Nvj8f+uVWvD2RVapfeHAuvMMZnC4ATutXaX9VICQRAlCIMZMH9+90xCKcJI3+TyiKmgr
 Fw9A==
X-Gm-Message-State: AOAM530d5vNwrQls7b4tPF6wuegCc8/CC6mS5t+RA5/fHbb4603q8iW9
 ErF8cqvrjPrWyDEfbdualPU=
X-Google-Smtp-Source: ABdhPJz3OWweGn3OR8zd7DEwqR9tFVenHuC7VNywboQIBKxV8uSe7j9G8yOGGb3BgQh1TBRwWh7xeQ==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr536046wml.140.1625858979234; 
 Fri, 09 Jul 2021 12:29:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id s24sm6426081wra.33.2021.07.09.12.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 11/14] drm/tegra: Implement syncpoint wait UAPI
Date: Fri,  9 Jul 2021 21:31:43 +0200
Message-Id: <20210709193146.2859516-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement new syncpoint wait UAPI. This is different from the
legacy one in taking an absolute timestamp in line with modern
DRM conventions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- rebase on top of latest UABI changes

 drivers/gpu/drm/tegra/drm.c  |  2 ++
 drivers/gpu/drm/tegra/uapi.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 18aee825a1ff..082d520bdffc 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -732,6 +732,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_WAIT, tegra_drm_ioctl_syncpoint_wait,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index e91394e7264e..0ba57697706b 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_utils.h>
 
 #include "drm.h"
 #include "uapi.h"
@@ -363,3 +364,24 @@ int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct drm_tegra_syncpoint_wait *args = data;
+	signed long timeout_jiffies;
+	struct host1x_syncpt *sp;
+
+	if (args->padding != 0)
+		return -EINVAL;
+
+	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
+	if (!sp)
+		return -EINVAL;
+
+	timeout_jiffies = drm_timeout_abs_to_jiffies(args->timeout_ns);
+
+	return host1x_syncpt_wait(sp, args->threshold, timeout_jiffies,
+				  &args->value);
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index e4e498facf61..12adad770ad3 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -49,6 +49,8 @@ int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
 				       struct drm_file *file);
 int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_wait(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.32.0

