Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52798B443
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056410E0C9;
	Tue,  1 Oct 2024 06:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="TLI22kcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7BA10E0C9;
 Tue,  1 Oct 2024 06:26:13 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4911te6b031730;
 Tue, 1 Oct 2024 06:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=corp-2023-11-20; bh=ynm5UubeZN8/05
 jyHZV3Mzy9wSlSyMLNZm6kc6piD7s=; b=TLI22kcqJ2TwT43yzz/LCEqOT61md1
 ghpl1u30R6CUd+0Jk24j5d/DhNxyXpxPzXz/uJvNAmQ1oq0OuzkIYT4OCIrWGKYH
 V8eSUgfbhs2ZD1UO3gbDSVJkstStI3u+manIWCjOuZTyT9y+HmtpQ80qP7CI1+GN
 xOVmOq5JBBLXCiTFrESxKUUsRzBifH5g57PAGOFlgZ1Ew55MKFR4iTKFk4BAdJzs
 +uZyRusWP4LuFOF5mykYav+zIJgkGqbLQcG7QqIhZSnEZ4BvDRzeBcSz3bcje2Fy
 +aCs9uBdgGSato8t8JcM4/eAIPoqJlhLElTBnwjV8R2zxL8vHOXh0Lmg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8qb5e53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2024 06:26:01 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 49162Qlq012578; Tue, 1 Oct 2024 06:26:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 41x886usvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2024 06:26:00 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4916Pxcd017923;
 Tue, 1 Oct 2024 06:25:59 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 41x886usuf-1; Tue, 01 Oct 2024 06:25:59 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vegard.nossum@oracle.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/i915: Rename functions in the docs to match code changes
Date: Mon, 30 Sep 2024 23:25:54 -0700
Message-ID: <20241001062555.1908090-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_03,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2410010042
X-Proofpoint-GUID: z_dP0EpF79RgKrDIG2aJ8fVG7AvxDQlH
X-Proofpoint-ORIG-GUID: z_dP0EpF79RgKrDIG2aJ8fVG7AvxDQlH
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

make htmldocs is reporting:

drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_interrupts' not found
drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interrupts' not found

intel_runtime_pm_disable_interrupts() is renamed to intel_irq_suspend(),
make documentation changes accordingly.

Fixes: 3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241001134331.7b4d4ca5@canb.auug.org.au/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Noticed that Stephen also reported this so added a Closes URL.
---
 Documentation/gpu/i915.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index ad59ae579237..7a469df675d8 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -35,10 +35,10 @@ Interrupt Handling
    :functions: intel_irq_init intel_irq_init_hw intel_hpd_init
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
-   :functions: intel_runtime_pm_disable_interrupts
+   :functions: intel_irq_suspend
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
-   :functions: intel_runtime_pm_enable_interrupts
+   :functions: intel_irq_resume
 
 Intel GVT-g Guest Support(vGPU)
 -------------------------------
-- 
2.46.0

