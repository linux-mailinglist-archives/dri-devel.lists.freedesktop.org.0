Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F633BEF5C6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 07:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111A710E254;
	Mon, 20 Oct 2025 05:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="dQsa4Vv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E2210E254
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 05:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760938551; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g4FzZx1aEUrBK7K003fUF8PgjPlQJxGYbbJI24vXc7jYiNIjNhoQ/Oa86cJ0lYdO27mPOE3AMIUm3pUjmgnjjDDwGV3QvcciIC0K+nlBTorvFamCDKxQ4CUSJetsR63+SM8q2OMP3ohhdPuooi3bfqbQrzOHm+C6Gyj2Rba7bhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760938551;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0YW2HMr2DUsmn8ceqO8yT15Oj+U8v3tq38CvBsexo1g=; 
 b=OtSAdLQxoXCrhsHnf06YpGKNAN4mnbuFW2R+Sy3ShPncxRnUWJJhRje5umqbKba2fi7Ba2hrNvtFaVFgE/ejP5dtz2dRVnV0ot3FJ2WECIfjr25rg5P2cMRgVDEZsUCdIIR+LG97kEdsBJBFnn+86p0q3IsV7TgwiaOw6Rrx+io=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760938551; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0YW2HMr2DUsmn8ceqO8yT15Oj+U8v3tq38CvBsexo1g=;
 b=dQsa4Vv1mXp1rYp/bkxqvxGadouSynDbPaWhNBMiE6UbhRfDLKpSNUPKniz55VTP
 Xv4qb8Vfn/tHf+k8i9cB9EQl+nEkL/icsRv+EoT33NvvQJ1Hqe26rfKzSuCSjdvVloI
 McaDMpDF1dk90+9gd+qIy9WK5BUFEukfBVXBrNYpIKoBgwgTbwlNPG+qSxXp93V9kGI
 hFtR+nFe5GwT/9w8TbLpa5aigEeKhQrsy5SBEqNZ/G8/4S9xVLTGZM3U6zrCbHLg/Kh
 E0oRbfUSYCqEHev8p8ijP1Rl+dduFKyenT1w/55J0z5MY9TeMwkSdsDg6yeTWJY9Jpx
 mJfS9F6/eg==
Received: by mx.zohomail.com with SMTPS id 1760938548786142.3683573948715;
 Sun, 19 Oct 2025 22:35:48 -0700 (PDT)
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
Subject: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
Date: Mon, 20 Oct 2025 13:35:23 +0800
Message-ID: <20251020053523.731353-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
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
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
Changes in v2:
- Added Han Gao's test tag.

 drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index b3fffe7b5062a..aa137ead5cc59 100644
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
2.51.0

