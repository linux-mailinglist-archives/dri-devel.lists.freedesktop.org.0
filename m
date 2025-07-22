Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D68B0D80A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 13:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D7810E070;
	Tue, 22 Jul 2025 11:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TZ6myj7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786CE10E070
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 11:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753183273; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gv9oGH68zKdRkIgjVM1zHmhUNikzYByusvfpbbSI3qQrbR6dy7qMYYwdrP+vfVtzjqSY3lUQygV2QTV/Hu1Ti5IJpeQ8rKdG22+0BAYZr0tNvlz9JqyAZ2y3T+rbZe50Mi4MhWEO14deO3OcSdCjzpt1BDVU2sZDspacWWB7heg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753183273;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FmEk2snejcbJWJ/01YuvjfvZovqB2NJooCH4yUHlJEc=; 
 b=B24BUEmKFJAz5yfFZeg5er2Np9zSmQYtrHTHcIqcQYsKrwpBi9jthCB1aH6NLfP4KhDQaCqUOCBndWWI7Dqq5GoTehMGhU3aQGETCOCjahgK9BGvZqk+P3460BfoA1nGGNLGBB1p1KTuBTHVTozOORhc6563ExzGPRN1d9cc5tk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753183273; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FmEk2snejcbJWJ/01YuvjfvZovqB2NJooCH4yUHlJEc=;
 b=TZ6myj7noYo/vloSK0+qJn14TElPvDkOLnV5/7kic+HAO8Qdthw7GMjZEZUJJdFi
 qJJkpLbCew9GtF4j3OBAD/EGxtlgqClS9ltt3MBSM9G9vlJOXqXdZEUOM2DANShjwF7
 wibTDBRYgilWN6uiJ9RDRtQDh91rdmrG/UzFcbEC/+Un8X5Pc+VkmXnuTB3OCZtF2o7
 xFQkdSYwDrlaT63t9a0R+dH5TenGOie2A50uNZl56lSj7hRUScy78fNMR5wSyFOHkDV
 sQZ4bnGxMt9GxW22cVKDGfEaUAHnPcE/EuIio2MJ9gjZavtajc7SNeF70S8TpHczmwY
 sjw4Lxro0g==
Received: by mx.zohomail.com with SMTPS id 1753183268062183.51689612735777;
 Tue, 22 Jul 2025 04:21:08 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>,
 Yao Zi <ziyao@disroot.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] drm/ttm: add pgprot handling for RISC-V
Date: Tue, 22 Jul 2025 19:20:50 +0800
Message-ID: <20250722112050.909616-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The RISC-V Svpbmt privileged extension provides support for overriding
page memory coherency attributes, and, along with vendor extensions like
Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.

Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
access attributes.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index b3fffe7b5062..aa137ead5cc5 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
 #endif /* CONFIG_UML */
 #endif /* __i386__ || __x86_64__ */
 #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
-	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
+	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
+	defined(__riscv)
 	if (caching == ttm_write_combined)
 		tmp = pgprot_writecombine(tmp);
 	else
-- 
2.50.1

