Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241075A340
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49910E54E;
	Thu, 20 Jul 2023 00:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814CF10E541
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=Pz5iTKJHa5/hyPNzFIH419XJwpi6P1kRw6MMKY0QAtQJaumwFPYFighIIEy9P+khODzPqX
 NgTRYL9D/JxaIXyltf3B8KmJBOuenZQxVZka/9R/ekyf2pRk8tDR/a2Of6XHuA05HK5cTS
 4LfGk8PxOtkC18D8MN88OcdgoEJnbl0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-D7v47hVdOSii05eHzWLMrA-1; Wed, 19 Jul 2023 20:15:49 -0400
X-MC-Unique: D7v47hVdOSii05eHzWLMrA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-993eeb3a950so14914666b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812148; x=1692404148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
 b=OAmjTTVrydz527BOlCaeItAqcCAtIsQ6fPhkk4Fzec+w+ha2TiF1DrSZk7XAx3+RwP
 gjb2MkVVRezoY9rlWsH1ZZmf+AVbQCm6uQnihEWAKwTsb8mYzmIjuGNfmCfqwrORPWph
 17qfW9U6oPFoOKfOsTuF+au1kSVFGGZA0n6jQi4sAXJmBpIpOqmBRTB8huiWixBiOdA0
 dvQsPlxF9UlNb+0+LUStraUKrnYet9KikYpUfA3VKOp3pFcnWbPDS+y1VTakncvtUdb9
 c8HBONncG0LduDxVvw1AqbN/BA904UZLZPSlJrkB7U4ky4KViaXnau2vB5svnTTZK6Sl
 zY3g==
X-Gm-Message-State: ABy/qLbNqvPeI2Z3MtKVyeFABLc3iOl1+032ITxIDwVVJX53C/yRd77s
 8pLWo+n+l5ReijvVSq/xcTn3XO4oagZd92tzdkLr0Xmx8zQet+nNfY5wiLGlepG71ptQfG0osUv
 ZfkPRrJQRSRV2STEw/pQFBJ/hWLcF
X-Received: by 2002:a17:906:77cd:b0:993:f2c2:750b with SMTP id
 m13-20020a17090677cd00b00993f2c2750bmr3700360ejn.17.1689812148710; 
 Wed, 19 Jul 2023 17:15:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzOuzg80y3Uq2LukZtvD62EiHLsA7vDYQLnsDf52HmHve2LBpBPIr9ba/hVWknmAApd73phg==
X-Received: by 2002:a17:906:77cd:b0:993:f2c2:750b with SMTP id
 m13-20020a17090677cd00b00993f2c2750bmr3700343ejn.17.1689812148501; 
 Wed, 19 Jul 2023 17:15:48 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170906a28a00b00997d7aa59fasm3077515ejz.14.2023.07.19.17.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:47 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v8 12/12] drm/nouveau: debugfs: implement DRM
 GPU VA debugfs
Date: Thu, 20 Jul 2023 02:14:33 +0200
Message-ID: <20230720001443.2380-13-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

