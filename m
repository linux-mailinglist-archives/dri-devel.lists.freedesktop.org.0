Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A116D5603
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAA710E422;
	Tue,  4 Apr 2023 01:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671610E313
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o823AL8VZ1LMNlMTP6aYg3xJJTWgQdWRn/9lqJMAMBk=;
 b=XEJdG0YR3zdBNrsxFqnuVuFG7QCsxvxrk4bxR4ogMblvc6ymjTDRs4uCLTegRWVFubVaZs
 mCD+22zzH2q1N5TT9OLsXndJlaavIsprvp2IJvKMvfq5livhNWayTPm+Js2Ix1rnF9Bpfy
 vwjtQ3PUMsTe44VyMhOrTy3d9SiJN4A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-iHXEJJgzMGmRQNdP701lCg-1; Mon, 03 Apr 2023 21:28:45 -0400
X-MC-Unique: iHXEJJgzMGmRQNdP701lCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x35-20020a50baa6000000b005021d1b1e9eso43966497ede.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o823AL8VZ1LMNlMTP6aYg3xJJTWgQdWRn/9lqJMAMBk=;
 b=D2a2RF8bDC3HhKfbxD1UgxH2XfYHDWE3g69LdYb09Fy8kW57salfOxeO4moc27iCKo
 Anq8E9AzUZPO1v3NRyuIFxH8V5wsdlYsN0viMnEZrfcpo4nUNOan05Hz5xxqSnmV8sam
 i9rj7fpE76y9VVuHx0VgsdW9uNWEANC7Y6vSkRc8aXgU1MR7m9FRnoysOiXvtgT1Z6lD
 qKiPO6hLW3w4av2KfQUPOLiHks51AGb3khRdW/OQkE1C9BAZ8W95iWPvdvXpPnNDharH
 QbGpFcjOU0aIEmfBonH6QGL7gzdadlCzPFaki20BBso4FfK1/plUxbdMAfFMW7gy+ywb
 gimQ==
X-Gm-Message-State: AAQBX9fpgREK1nC9lFDvzLoIeyn3kdbr4bzk2wp1Coefvo7e3IdTQOCs
 dM24+f3QxvspvIJFr6u0TbqQyqeeJtnbbO+3EIigcsmzKb/82Zyb1ypT86dfU1De65mlcaKX6CH
 p5DDKxqZP4eAkiTfdDV6hoBvcHvdv
X-Received: by 2002:a17:906:9c96:b0:92f:b290:78c with SMTP id
 fj22-20020a1709069c9600b0092fb290078cmr618021ejc.21.1680571724454; 
 Mon, 03 Apr 2023 18:28:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBQbJEEi72BHSZD+4oPg/dW8cv06s9DIHCLme50cSEKLFt5Tzd9CFlGMdi5gzZOM0kcpe/wQ==
X-Received: by 2002:a17:906:9c96:b0:92f:b290:78c with SMTP id
 fj22-20020a1709069c9600b0092fb290078cmr618007ejc.21.1680571724265; 
 Mon, 03 Apr 2023 18:28:44 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 gl25-20020a170906e0d900b00929fc8d264dsm5310643ejb.17.2023.04.03.18.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v3 15/15] drm/nouveau: debugfs: implement DRM GPU VA
 debugfs
Date: Tue,  4 Apr 2023 03:27:41 +0200
Message-Id: <20230404012741.116502-16-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
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
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..d5487e655b0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -202,6 +202,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
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
@@ -213,6 +251,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.39.2

