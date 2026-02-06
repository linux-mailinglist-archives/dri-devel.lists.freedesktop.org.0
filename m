Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHt3H4hphmnwMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:22:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15F103BAA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B3810E943;
	Fri,  6 Feb 2026 22:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sclpwADi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DEB10E943;
 Fri,  6 Feb 2026 22:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BDAD6013D;
 Fri,  6 Feb 2026 22:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28699C116C6;
 Fri,  6 Feb 2026 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770416514;
 bh=oQRJiNUzubJ19Wx1XgCCgnTsTPuzcvWNLC/cnrc8QvA=;
 h=From:To:Cc:Subject:Date:From;
 b=sclpwADixRMuZ09rsS1t0+O7jiwtqiALgjAvTpNzHJe46dn1GLZrEVe3OQvWi8zaN
 eewMrCWCfW1ix2SlZaTLQ+8a41A5GFAREv+8nLah3M5n4njJDFD/m2Pvx2qwhs0atX
 pncuF/CBxCE3EkFBzSqESpEcfpBXD0eBYlczOdytUiYHpniryUqydOaCir4QefkFwl
 C2Dm9kVkfUNqvPhOe5NiPR5Q3vJrlTEV+nyb5vKdfK0l6CF/XCivVgsvLA0lwpe7z3
 mXkOEWFoGnMprJGcq3gnn3IzFN7zJecQMVYdQG78RB1rt4djxPRxhG2RQ1QNFsue9R
 eu6i4u3Y4IQbA==
From: Kees Cook <kees@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Kees Cook <kees@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Date: Fri,  6 Feb 2026 14:21:52 -0800
Message-Id: <20260206222151.work.016-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=kees@kernel.org;
 h=from:subject:message-id; bh=oQRJiNUzubJ19Wx1XgCCgnTsTPuzcvWNLC/cnrc8QvA=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDJltmfU7n93tvD9HSCh32WPFpydTev27djntL71dv6nLQ
 klTZkJRRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwER2/2Bk2G3cZGIa2u5sOuf5
 Dob2quKXmfEX/ITi5S9Mm8FovvlIGcP/muT/Cwseapy52xnKmXqkIFVl1sqSU/vVRAUVd/HFNLs
 yAQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 9C15F103BAA
X-Rspamd-Action: no action

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "void **" but the returned type will be "void ***".
These are the same allocation size (pointer size), but the types do not
match. Adjust the allocation type to match the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <linux-arm-msm@vger.kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <freedreno@lists.freedesktop.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d5dede4ff761..271baf4dc4e8 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -332,7 +332,7 @@ msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_preall
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	int ret;
 
-	p->pages = kvmalloc_array(p->count, sizeof(p->pages), GFP_KERNEL);
+	p->pages = kvmalloc_array(p->count, sizeof(*p->pages), GFP_KERNEL);
 	if (!p->pages)
 		return -ENOMEM;
 
-- 
2.34.1

