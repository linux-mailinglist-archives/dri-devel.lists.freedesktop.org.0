Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77C6713B1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3310E6AE;
	Wed, 18 Jan 2023 06:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEBC10E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
 b=H0u23UQbGRpNRrttuq8XADBuYqACGVoMRuK4rNrD8o4G/uayo4pv9pn73VXR/DtqqFruWx
 vs066pqRkxxSb3MgPFdGbPARTcSrdl4CrYITl9LXKlZYi4MmsGM0Hud97kQwAfj3CM4O9n
 wl5ml+kBpNoIKOL6IKDq2M5JxP4M2gY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-vK_LWe3yNJeru011SCmuLw-1; Wed, 18 Jan 2023 01:14:24 -0500
X-MC-Unique: vK_LWe3yNJeru011SCmuLw-1
Received: by mail-ed1-f70.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso22962409edd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
 b=mY3CbbQkpPdT0IoCbr/nUPwWafB8zKygMhPwrfhzdSGEY7ZtsT+m5TdQj2dihlH8E0
 pm09m7eKhAYznQb0Pm06M2lAYqJRO57N7E01RG2bF97r0m+/XhTgGtOvNUxMjCXV9G17
 dhHVtf1LdT5brZmdC3qFk1DBn5uIpSdtB049uyg+HBt2CSRFN330UhWj73ktobCN8KkN
 oJh9wzF/vbPY3OvEY+6qC9JpJ2ZfirPaSwbWXjwB0qyDUEGbf57UIhyJZ1OK8tMAqFpZ
 yRNLr+dWicZ4I9+M1LGHsABN/kutUUcE1tc1Q4LBP9jYooqA+FeD8gHKBOP+tkaiRT/m
 GHnQ==
X-Gm-Message-State: AFqh2kqnk2H8Enh59WI9/OwQJ/Ajv/KpG35QermXk1hSptGoYj0u1iCb
 h/v7I42Qo5CWC7sXGbfUDyQegMB8EZaURRUyvmz0QQr8+W69jES6lmEBHNHdO1D4xYt+4ktox3O
 OJjfqaXH0/lClSeOVGfJ/msShXHF3
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id
 d14-20020aa7c1ce000000b0049e089e3b36mr5877846edp.30.1674022462952; 
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRQZOK3N/r5iyFAQ3K40aM3jSUaK6Mlg89vmZUZhLYBBDqIPzyzq48oNYdtZTi8SPf5PDyyg==
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id
 d14-20020aa7c1ce000000b0049e089e3b36mr5877825edp.30.1674022462771; 
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b0083f91a32131sm14105071ejh.0.2023.01.17.22.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:22 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 14/14] drm/nouveau: debugfs: implement DRM GPU VA
 debugfs
Date: Wed, 18 Jan 2023 07:12:56 +0100
Message-Id: <20230118061256.2689-15-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
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
2.39.0

