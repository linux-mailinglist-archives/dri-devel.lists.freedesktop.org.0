Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB516F0B92
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4978710EBC1;
	Thu, 27 Apr 2023 17:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27210EBA6;
 Thu, 27 Apr 2023 17:54:11 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so6797437b3a.1; 
 Thu, 27 Apr 2023 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618051; x=1685210051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGLJmibW87WAJcS5t0uIh72jCVPBIb7Gj0WXUx1P9zU=;
 b=QMXQRPIdXA5q5Km0eEBU7rKyuFO/cgMrtoDCMJdyNqAiJII2NpWeJLh5tHe70Cy232
 Sm5bFKWRn1oSSzIdYYglEqg8J6RUhcSkcWnMH7d4qgcvGCmFinBCuh81eI4k4yWHVpvx
 ZGSfIBbB+9WYYIJU6QL3JOedPPhjgrhrXsvSGBPHyj1zrMv0q578RG/AT6Ue8xSs2fL3
 VqFTs5aUbk2lfTToiCebxdTsxyY8QfQ8af5msEFx2/6VxM7sz1Mj6jn3ZRQ6NcpfhnBz
 smFVLkXfhebsJulsoQqEEQZQriQbsmux38e2ELM+/aEBKnk7Y2f+FUt5q8Q7P6pfwUeA
 1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618051; x=1685210051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGLJmibW87WAJcS5t0uIh72jCVPBIb7Gj0WXUx1P9zU=;
 b=kVdLKSX9rinbJ5+VJYrohR/1CP0U35hyOXe3ygUdIgD7wb92wOpzd3cZ6dqXM5dtjX
 1FWB9QW2JFIFWaRInISH7Mw7nU4u1YMoDnhFMCsmoXdCU6cvNAoPP066E4hXV2ONHbdM
 edYWcHl+ddrufJ5JHtuu0xkzd9qAC8TarGZ7Fhjca/hmCoq48XPnog1wiFqAkSi0nfEt
 b/lumOJeoX++L1hMA66Qw+cnRXhSM9zXDeztpjZDIHxdH+SGO3CeOfZAqdKKHCEROoT/
 JznVU7DWj+hoXTm/eaD/SHpgqHnt2vOZa8uL2/eqrCa1PdwKXskVE9aGKq0TWIBn4zF+
 bQkA==
X-Gm-Message-State: AC+VfDwTVW1Uf9Sw1N2X/e+vrsZu70+EQSphFow2zI+Qr9pnC7Uf2ijK
 mYi9QJ8f2Pjv7zPl4Fy5peHjLlUgs6w=
X-Google-Smtp-Source: ACHHUZ6Nn15Zn+c1Wo6Qo1HTjwDdKmVdH9HihAreo97OXBbuOLvs3ki9YVei3t6pb2Epm77vQyXY1g==
X-Received: by 2002:a05:6a20:918f:b0:f0:3fc4:744f with SMTP id
 v15-20020a056a20918f00b000f03fc4744fmr3333199pzd.8.1682618050907; 
 Thu, 27 Apr 2023 10:54:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 y189-20020a62cec6000000b00640defda6d2sm6860749pfg.207.2023.04.27.10.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:54:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/fdinfo: Add comm/cmdline override fields
Date: Thu, 27 Apr 2023 10:53:32 -0700
Message-Id: <20230427175340.1280952-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These are useful in particular for VM scenarios where the process which
has opened to drm device file is just a proxy for the real user in a VM
guest.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
 include/drm/drm_file.h                | 19 +++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 58dc0d3f8c58..e4877cf8089c 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -73,6 +73,24 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-comm-override: <valstr>
+
+Returns the client executable override string.  Some drivers support letting
+userspace override this in cases where the userspace is simply a "proxy".
+Such as is the case with virglrenderer drm native context, where the host
+process is just forwarding command submission, etc, from guest userspace.
+This allows the proxy to make visible the executable name of the actual
+app in the VM guest.
+
+- drm-cmdline-override: <valstr>
+
+Returns the client cmdline override string.  Some drivers support letting
+userspace override this in cases where the userspace is simply a "proxy".
+Such as is the case with virglrenderer drm native context, where the host
+process is just forwarding command submission, etc, from guest userspace.
+This allows the proxy to make visible the cmdline of the actual app in the
+VM guest.
+
 Utilization
 ^^^^^^^^^^^
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 9321eb0bf020..d7514c313af1 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -178,6 +178,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
+	mutex_init(&file->override_lock);
+
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_open(dev, file);
 
@@ -292,6 +294,8 @@ void drm_file_free(struct drm_file *file)
 	WARN_ON(!list_empty(&file->event_list));
 
 	put_pid(file->pid);
+	kfree(file->override_comm);
+	kfree(file->override_cmdline);
 	kfree(file);
 }
 
@@ -995,6 +999,17 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->override_lock);
+	if (file->override_comm) {
+		drm_printf(&p, "drm-comm-override:\t%s\n",
+			   file->override_comm);
+	}
+	if (file->override_cmdline) {
+		drm_printf(&p, "drm-cmdline-override:\t%s\n",
+			   file->override_cmdline);
+	}
+	mutex_unlock(&file->override_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 1339e925af52..604d05fa6f0c 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -370,6 +370,25 @@ struct drm_file {
 	 */
 	struct drm_prime_file_private prime;
 
+	/**
+	 * @comm: Overridden task comm
+	 *
+	 * Accessed under override_lock
+	 */
+	char *override_comm;
+
+	/**
+	 * @cmdline: Overridden task cmdline
+	 *
+	 * Accessed under override_lock
+	 */
+	char *override_cmdline;
+
+	/**
+	 * @override_lock: Serialize access to override_comm and override_cmdline
+	 */
+	struct mutex override_lock;
+
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
-- 
2.39.2

