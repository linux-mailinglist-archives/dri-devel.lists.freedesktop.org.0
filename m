Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911F69AD03
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE2610EFF6;
	Fri, 17 Feb 2023 13:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86F910EFF9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGtWB8otfeqdskrUgWVgT1wxpbtVBJjmwPhyWCdCJZU=;
 b=TbTGVs2fcTC3L77jAad5aHjgRNbeevzzA+n+Tl1OpgzeIW15dwtCoxD7d7pfDVDMc3sSWJ
 xTLMaBXUWCAxOmWnr+FhMu/TGxUVfpionUlKWbmrScT/sSrHJdQvp6u5rnRlFqd6NgBHvb
 x8biDxz4KXGA/bnWPFYUO5WOM8wM4Yk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-_4_eBZDXNFmYq2G3fpGd5w-1; Fri, 17 Feb 2023 08:49:07 -0500
X-MC-Unique: _4_eBZDXNFmYq2G3fpGd5w-1
Received: by mail-ed1-f70.google.com with SMTP id
 d9-20020a056402400900b004ad062fee5eso1742274eda.17
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGtWB8otfeqdskrUgWVgT1wxpbtVBJjmwPhyWCdCJZU=;
 b=Jn/j9FFgVzBIYaQKsPq548IGo9GZfwCVYAzDaTCKP2MSl/a83uHi4yInbZcLktD2i6
 gPWIMNnlfdts3fxqB+0mR+a5M4lFwcSVdxU5vTupHvZKmRSE8G0w7+oN+VAoRBBM9kT8
 QNJlRJ5RHeEeD2namp5ucHN8HVOxTdJjACzOs1Qc45BbR70L50dPIct0VwkdbnHKdfkF
 sxj9N4iieR4zMyIkl3+k99feNVyZQv24waqpnrSbCXon+GxQDrKcJea5gR0PKDmNt/l2
 9NCJD5yOhtC3Lf3nBQGyuwxNeQMOtXh8EAdOI4W+OsqJN+TEswv/j/HarMO2JI0Fw6qz
 ozWQ==
X-Gm-Message-State: AO0yUKW7FVgt3JMgFnfl/x6tywzdD0nJf5K8GupOp2/iNt/EaK2QmiMk
 BVc2rv/9XblSBbtptLUjYby4XyCfMS2A6kvXnFllqtY9JZ0MFQWhoQPe4+oeOSKw5D/47DGJ81c
 5q3H8zqyXVwaX64DWJYTX3PWF/JX/
X-Received: by 2002:a17:907:a508:b0:8af:54d0:181d with SMTP id
 vr8-20020a170907a50800b008af54d0181dmr10190307ejc.35.1676641746800; 
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9vd30xGC9ziQLVSo9CH8dMbfP5K/22/ulKcpKmlY9Tzn88e5jN0KhVGuEzFC+li22riHt+gQ==
X-Received: by 2002:a17:907:a508:b0:8af:54d0:181d with SMTP id
 vr8-20020a170907a50800b008af54d0181dmr10190298ejc.35.1676641746605; 
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a1709060b5a00b008b1787ce722sm1516323ejg.152.2023.02.17.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:49:06 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 16/16] drm/nouveau: debugfs: implement DRM GPU VA
 debugfs
Date: Fri, 17 Feb 2023 14:48:20 +0100
Message-Id: <20230217134820.14672-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..7f6ccc5d1d86 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -202,6 +202,29 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static int
+nouveau_debugfs_gpuva(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+		if (!uvmm)
+			continue;
+
+		nouveau_uvmm_lock(uvmm);
+		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		nouveau_uvmm_unlock(uvmm);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	return 0;
+}
+
 static const struct file_operations nouveau_pstate_fops = {
 	.owner = THIS_MODULE,
 	.open = nouveau_debugfs_pstate_open,
@@ -213,6 +236,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.39.1

