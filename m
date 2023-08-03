Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B876F00A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 18:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46410E647;
	Thu,  3 Aug 2023 16:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D185110E646
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=i+GBHmGjxjjI566bzcvI6fFRqEob/ynLVXeBw7TfFCFJWoDB7aam+stNIbqpCkmPdzpXUC
 Ri2fM9JHZeqNxSKid5ur5G9WuLHUp1xFpbdtfEpfgxyleA+88Z6H+YG+q0/nJgfSDEFSeM
 XYU5yvvyHYr+rznZs4KwSxIz9NdCbmI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-UTySiR4BPUK-XmNUW54XYA-1; Thu, 03 Aug 2023 12:53:38 -0400
X-MC-Unique: UTySiR4BPUK-XmNUW54XYA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bcf56a2e9so77722166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081617; x=1691686417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=Ty8bzCnRZQ5oLajZXIYr9z4mPGTNn36bV92jf2phq9nYbmTtAz2kUZND+WbcpUsWiv
 Z4mfQCiTAr2Wf38lk4nmQGPEuDhFaHR3yrx6t4cLU6SFuxElS2JCQVQUqgo2Zp9al+ng
 J1c/MMvq4/UinQplC7xO99ysGctGBt4HtfRhdUscv574zG6M2nYEe9Z2Kktv/9K2FH1L
 kRk75YOMZ6i/bOoQDu1qyq5/kQRdx5WsAKRqIVihxZKmMOutC6X2s7L5uEV1BlUR+v2V
 hkkOcq7wociCmHEPc86zgcl/N9zSMnyEvcwrlo3vPUnsBZ0tXd0evtr3WbVnfboAyuLD
 xQfQ==
X-Gm-Message-State: ABy/qLYLQUSDzfQNu+SD+hSf6BPaIos/JUXMOAh8oJylYU/9wYPk3HSb
 FhTi60drjqBNN9vwsKK0HXfOIiu1xUnDs7JFrQpqsoO9NR5QTtBpZezqV6qIpgL+snrRbBjV6gP
 3M79L0sgh9XuJuJLevZXQmDOceyCo
X-Received: by 2002:a17:906:31d4:b0:96a:63d4:24c5 with SMTP id
 f20-20020a17090631d400b0096a63d424c5mr7038403ejf.77.1691081617375; 
 Thu, 03 Aug 2023 09:53:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHRH5ZgjJkQUxJJ+58qKoKTsSHT7S3XigxFOpDntBBMZ19xjhCROTsTFx3KOVVIwi5BUR2bOg==
X-Received: by 2002:a17:906:31d4:b0:96a:63d4:24c5 with SMTP id
 f20-20020a17090631d400b0096a63d424c5mr7038393ejf.77.1691081617197; 
 Thu, 03 Aug 2023 09:53:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a1709064dd200b00991bba473e1sm73096ejw.3.2023.08.03.09.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v9 11/11] drm/nouveau: debugfs: implement DRM
 GPU VA debugfs
Date: Thu,  3 Aug 2023 18:52:30 +0200
Message-ID: <20230803165238.8798-12-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
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
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 99d022a91afc..053f703f2f68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -203,6 +203,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static void
+nouveau_debugfs_gpuva_regions(struct seq_file *m, struct nouveau_uvmm *uvmm)
+{
+	MA_STATE(mas, &uvmm->region_mt, 0, 0);
+	struct nouveau_uvma_region *reg;
+
+	seq_puts  (m, " VA regions  | start              | range              | end                \n");
+	seq_puts  (m, "----------------------------------------------------------------------------\n");
+	mas_for_each(&mas, reg, ULONG_MAX)
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
+}
+
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
+		seq_puts(m, "\n");
+		nouveau_debugfs_gpuva_regions(m, uvmm);
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
@@ -214,6 +252,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.41.0

