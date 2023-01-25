Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C967BE15
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA2B10E879;
	Wed, 25 Jan 2023 21:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7078B10E756
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 08:38:59 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-50660dd3263so29708207b3.19
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 00:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ralp0YsbeintaJ1+3rV0BJxcsbdnu/jVKuNhvnt0T5Y=;
 b=FpW3ZfeoZ58NaZWfySIfB+f4+MM7GrKuq9uCXe+gfhjrC0bvKaL2kAypJ/pJdIrezU
 Ru0cU0KNklRfuYrJ3SKXkdPgNjMfodaxcsFUMH2z2VP+LqiGmmBZi4WNjYcaaYQLe2mC
 v6uAPWcErh2g6vXcpQB3pwh9XmkkPfWLDi2bI5mgZlrfFBGfjeQ9Wv8iIQeddGuuYJGy
 vGYSJIu//+24XGZjzB+Q3VYOxZ5pJZ/HCGoJ5h7l6e1K0sxINKIjiYRXApyFQ3GXR7xJ
 ZclVjCWVjm/7Pu3pZxJbkPLxrnDwpix1sMzuU+AEqB9vICm+UZCWtOUOt5GLju8+nccL
 rTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ralp0YsbeintaJ1+3rV0BJxcsbdnu/jVKuNhvnt0T5Y=;
 b=DHIyWFvAUAbeOvyU2odpreK8bX6HbbhSKTWm9fWgsQSCd3UxCtm3Ko/n9K7gSyHh/v
 WBa1qW2ZX7lL/Uc5lIchp7GFNaFUhH4AMPUKhefaOvW0yfTVokV6izZD3iGgtvPu7ipt
 qX1v0GzC3Q5IV/Su2HktHd7dHyfC6VQCr/I7mGKAyf+0si1meAK4/QRSKF2jhKADlcUO
 zOXs8hbj/zmj3N7GRTHMIR938wpOEZQErdJJrC73TbGsUECYRjWad8wPrYlOLZb9T6fB
 BvzKyKpAPd+ZdZbopsUR8Oq7ZYLVJGfMbm0DJUvcRkuK3H9Da8ppsqkG+Qnx6ADuX8je
 vNsw==
X-Gm-Message-State: AO0yUKXcwL6/pxOauIwwpI0cX4VFqt9v6fwyf4WNW+wyheWC4iS/53Bh
 JI/qvT4TkpKHMTjULav+B7LVDglcv18=
X-Google-Smtp-Source: AK7set8/stQqnGGz4OB/vqyDOBLoBX54VTTeagu3mMK0HzymWEEvjI0ujOzPLr/zvAsu1DJMDE0YK80W9/s=
X-Received: from surenb-desktop.mtv.corp.google.com
 ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a81:3e07:0:b0:506:6185:4fad with SMTP id
 l7-20020a813e07000000b0050661854fadmr450398ywa.451.1674635938431; Wed, 25 Jan
 2023 00:38:58 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:46 -0800
In-Reply-To: <20230125083851.27759-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-2-surenb@google.com>
Subject: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, leewalsh@google.com,
 dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com,
 arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 qianweili@huawei.com, linux-samsung-soc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com,
 linux-acpi@vger.kernel.org, rientjes@google.com,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org, minchan@google.com,
 robert.jarzmik@free.fr, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com,
 tglx@linutronix.de, ldufour@linux.ibm.com, surenb@google.com,
 linux-sgx@vger.kernel.org, martin.petersen@oracle.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com,
 kernel-team@android.com, jayalk@intworks.biz, soheil@google.com,
 selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, sre@kernel.org, tfiga@chromium.org,
 linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com,
 peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com,
 dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com,
 adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org,
 anton.ivanov@cambridgegreys.com, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org,
 mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org,
 paulmck@kernel.org, jannh@google.com, chao@kernel.org, liam.howlett@oracle.com,
 hdegoede@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com,
 amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vm_flags are among VMA attributes which affect decisions like VMA merging
and splitting. Therefore all vm_flags modifications are performed after
taking exclusive mmap_lock to prevent vm_flags updates racing with such
operations. Introduce modifier functions for vm_flags to be used whenever
flags are updated. This way we can better check and control correct
locking behavior during these updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h |  8 +++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c2f62bdce134..b71f2809caac 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
 }
 
+/* Use when VMA is not part of the VMA tree and needs no locking */
+static inline void init_vm_flags(struct vm_area_struct *vma,
+				 unsigned long flags)
+{
+	vma->vm_flags = flags;
+}
+
+/* Use when VMA is part of the VMA tree and modifications need coordination */
+static inline void reset_vm_flags(struct vm_area_struct *vma,
+				  unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	init_vm_flags(vma, flags);
+}
+
+static inline void set_vm_flags(struct vm_area_struct *vma,
+				unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags |= flags;
+}
+
+static inline void clear_vm_flags(struct vm_area_struct *vma,
+				  unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags &= ~flags;
+}
+
+static inline void mod_vm_flags(struct vm_area_struct *vma,
+				unsigned long set, unsigned long clear)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags |= set;
+	vma->vm_flags &= ~clear;
+}
+
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
 {
 	vma->vm_ops = NULL;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2d6d790d9bed..6c7c70bf50dd 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -491,7 +491,13 @@ struct vm_area_struct {
 	 * See vmf_insert_mixed_prot() for discussion.
 	 */
 	pgprot_t vm_page_prot;
-	unsigned long vm_flags;		/* Flags, see mm.h. */
+
+	/*
+	 * Flags, see mm.h.
+	 * WARNING! Do not modify directly.
+	 * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
+	 */
+	unsigned long vm_flags;
 
 	/*
 	 * For areas with an address space and backing store,
-- 
2.39.1

