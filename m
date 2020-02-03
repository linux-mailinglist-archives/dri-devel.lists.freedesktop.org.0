Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5271516C4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BD46EDDC;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12A6E3AC;
 Mon,  3 Feb 2020 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580742427;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VJnsOBv+HbyyQwVNpnxzDWPoec7REoI1chc1vV9mKGk=;
 b=ctOhKRrrcjUalGZjl0zhxbx1Bjhf2ISVuWzkuKN1u5SkY5F4sbwKxELD
 RYu7Ygoh6JlUZFv6YuA4Odwae28dDkq4ia7JPYLacmMvNH4itSh/HN4rb
 80QPUMdwNdPieuX2ILiM3Rp7v6MS+3McPvkDHBC0gCj1wjXRjLObCtTZy M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n3OuRVe8G9eYufmHAZT/P2q6Wa0Z7PfSRehb4qvjsUHNrmDY7kTjv5xRnF+nprqvB4gH049Amu
 8trAFQQCmgcbK/5Ib1odEq2crfCL+oWZO136igJoPR4+WxBZod7RUdE0tweEhCv3hpEq5JJ3q0
 lM0PQ+W3voIT6R378+qVbizA3ZQK1vpZiIzChRAgzMCM6SB+FQdw5japO6k7ZoRbmttWJgi/L7
 EnhslDdgNFtvrDX39N+oOXaxxbj9hPFNMV2PgVzWqiQ2S8iarz6d01XhFHeKwCWlNVQi8n8d/r
 xHk=
X-SBRS: 2.7
X-MesageID: 11848962
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="11848962"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gvt: more locking for ppgtt mm LRU list
Date: Mon, 3 Feb 2020 15:07:01 +0000
Message-ID: <1580742421-25194-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: Igor
 Druzhinin <igor.druzhinin@citrix.com>, airlied@linux.ie, rodrigo.vivi@intel.com,
 zhi.a.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the lock was introduced in 72aabfb862e40 ("drm/i915/gvt: Add mutual
lock for ppgtt mm LRU list") one place got lost.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 34cb404..4a48280 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1956,7 +1956,11 @@ void _intel_vgpu_mm_release(struct kref *mm_ref)
 
 	if (mm->type == INTEL_GVT_MM_PPGTT) {
 		list_del(&mm->ppgtt_mm.list);
+
+		mutex_lock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
 		list_del(&mm->ppgtt_mm.lru_list);
+		mutex_unlock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
+
 		invalidate_ppgtt_mm(mm);
 	} else {
 		vfree(mm->ggtt_mm.virtual_ggtt);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
