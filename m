Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0840DCBF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D026EE04;
	Thu, 16 Sep 2021 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E128E6EE05
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xtxY+cXT8XfPoPIGlZyiPeXDXul2zQL4SqWivDuepj4=; b=QV15Ac0XhHrt5pDBOkpviaHDeu
 lKoPCHIrQh5xpfB2IzNL+4Sw7Qnow9KyDZ1xtQYDZwnNvHux8UYRKptD64nQJ+WdLtPZM2BQhAh0W
 KONWoXth4fs6j7Z4pp7p25R3wQzBPoy0ylhX3gSCYFu6T035vt/TSDDrabzn1NLVYkTHOA+KcawOE
 pDDmwXD4xJjGNqqiC/N7qHd5rqy80ozxwzM+1Ce0emf4ozIgiUxnDLJ68iZC0dUFG0N4VcmyYAvS4
 wOg4oE85Uud9uB5RE0bNL31rbK/IOK8FHThsvR/mRUw2NG0SLRDWDE5pxniss5PUlQNa142+IKI/V
 lYTEnVSQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mQsRw-0005Xx-Dm; Thu, 16 Sep 2021 17:33:16 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 8/8] drm/tegra: Support context isolation
Date: Thu, 16 Sep 2021 17:33:02 +0300
Message-Id: <20210916143302.2024933-9-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916143302.2024933-1-mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

For engines that support context isolation, allocate a context when
opening a channel, and set up stream ID offset and context fields
when submitting a job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/submit.c | 13 +++++++++++++
 drivers/gpu/drm/tegra/uapi.c   | 34 ++++++++++++++++++++++++++++++++--
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index fc0a19554eac..717e9f81ee1f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -80,6 +80,7 @@ struct tegra_drm_context {
 
 	/* Only used by new UAPI. */
 	struct xarray mappings;
+	struct host1x_context *memory_context;
 };
 
 struct tegra_drm_client_ops {
@@ -91,6 +92,7 @@ struct tegra_drm_client_ops {
 	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
+	int (*get_streamid_offset)(struct tegra_drm_client *client);
 };
 
 int tegra_drm_submit(struct tegra_drm_context *context,
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 776f825df52f..b6008246bebe 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -469,6 +469,9 @@ static void release_job(struct host1x_job *job)
 	struct tegra_drm_submit_data *job_data = job->user_data;
 	u32 i;
 
+	if (job->context)
+		host1x_context_put(job->context);
+
 	for (i = 0; i < job_data->num_used_mappings; i++)
 		tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
 
@@ -572,6 +575,16 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	job->release = release_job;
 	job->timeout = 10000;
 
+	if (context->memory_context && context->client->ops->get_streamid_offset) {
+		int offset = context->client->ops->get_streamid_offset(context->client);
+
+		if (offset >= 0) {
+			job->context = context->memory_context;
+			job->engine_streamid_offset = offset;
+			host1x_context_get(job->context);
+		}
+	}
+
 	/*
 	 * job_data is now part of job reference counting, so don't release
 	 * it from here.
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 690a339c52ec..bfded46b974a 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -37,6 +37,9 @@ static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
 	struct tegra_drm_mapping *mapping;
 	unsigned long id;
 
+	if (context->memory_context)
+		host1x_context_put(context->memory_context);
+
 	xa_for_each(&context->mappings, id, mapping)
 		tegra_drm_mapping_put(mapping);
 
@@ -76,6 +79,7 @@ static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra, u
 
 int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_file *file)
 {
+	struct host1x *host = tegra_drm_to_host1x(drm->dev_private);
 	struct tegra_drm_file *fpriv = file->driver_priv;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_tegra_channel_open *args = data;
@@ -106,10 +110,29 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_
 		}
 	}
 
+	/* Only allocate context if the engine supports context isolation. */
+	if (client->ops->get_streamid_offset &&
+	    client->ops->get_streamid_offset(client) >= 0) {
+		context->memory_context =
+			host1x_context_alloc(host, get_task_pid(current, PIDTYPE_TGID));
+		if (IS_ERR(context->memory_context)) {
+			if (PTR_ERR(context->memory_context) != -EOPNOTSUPP) {
+				err = PTR_ERR(context->memory_context);
+				goto put_channel;
+			} else {
+				/*
+				 * OK, HW does not support contexts or contexts
+				 * are disabled.
+				 */
+				context->memory_context = NULL;
+			}
+		}
+	}
+
 	err = xa_alloc(&fpriv->contexts, &args->context, context, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
 	if (err < 0)
-		goto put_channel;
+		goto put_memctx;
 
 	context->client = client;
 	xa_init_flags(&context->mappings, XA_FLAGS_ALLOC1);
@@ -122,6 +145,9 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_
 
 	return 0;
 
+put_memctx:
+	if (context->memory_context)
+		host1x_context_put(context->memory_context);
 put_channel:
 	host1x_channel_put(context->channel);
 free:
@@ -180,7 +206,11 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 
 	kref_init(&mapping->ref);
 
-	mapping->dev = context->client->base.dev;
+	if (context->memory_context)
+		mapping->dev = &context->memory_context->dev;
+	else
+		mapping->dev = context->client->base.dev;
+
 	mapping->bo = tegra_gem_lookup(file, args->handle);
 	if (!mapping->bo) {
 		err = -EINVAL;
-- 
2.32.0

