Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C8A98EC59
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6A10E7C0;
	Thu,  3 Oct 2024 09:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="fS39ckIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECB210E7DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:37:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241003092900euoutp02cbb4c85a9a5ba84ccdd187afb9e5d6ef~651CtjdYl0307403074euoutp02S
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:29:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241003092900euoutp02cbb4c85a9a5ba84ccdd187afb9e5d6ef~651CtjdYl0307403074euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727947740;
 bh=b+sY4M2Lm+Vxr30NniNpscgNlYElLQh2+ZLf9+Vmr/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fS39ckIQDNqqpyDZkOZMlH0DsYQ8a+Fksl+pv4YGgNjyxUdulGgAr2/P1Bp/UCLkR
 GgXPgPbOHsiGpTiQhwXUSWU7kPbGPZoTliOhAhtJAeQs7sbPbo1sEXSzxvoD/q5e3l
 dNZUFPguqjVxiJZz5/pENDQZgD8F0x9rfmsUbv7I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241003092900eucas1p10bb65e87ef86d0a3fb0afd81e971eb40~651CWqeEG2406024060eucas1p1i;
 Thu,  3 Oct 2024 09:29:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6D.D2.09875.CD36EF66; Thu,  3
 Oct 2024 10:29:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241003092859eucas1p242fdefaa83bae892cf523019cb7c7003~651B3UUA21289512895eucas1p2P;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241003092859eusmtrp1676d6803c9dc1328e99669aec0d0040f~651B2tlbG1370213702eusmtrp1d;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-9c-66fe63dc1014
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 68.57.19096.BD36EF66; Thu,  3
 Oct 2024 10:28:59 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241003092859eusmtip24df80fe60325fbb20c24239c3695535f~651BMgdIu1782517825eusmtip2J;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: [PATCH 1/2] drm/fbdev-helper: fail if driver provides no fbdev/fb
 probe functions
Date: Thu,  3 Oct 2024 11:28:25 +0200
Message-Id: <20241003092826.1942901-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003092826.1942901-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7p3kv+lGdydIGhx4voiJou3cxez
 WFz5+p7NYuG05YwW72dOYLa4vGsOm8XaI3fZLRZ+3Mpi0da5jNVi9rv97BZb3kxkdeD22Ptt
 AYvHzll32T02repk85h3MtDjfvdxJo/Wo79YPN7vu8rm0bdlFaPH5tPVHp83yQVwRXHZpKTm
 ZJalFunbJXBlLH53jL1gEXtF86Q1TA2MU9m6GDk5JARMJE4+n8fexcjFISSwglFixfzdLBDO
 F0aJh1susEI4nxkl1v69wALT8ut9HxtEYjmjxJ8Jh1jhWtoOn2IEqWITMJToetsFViUi0MQo
 cXZlM1gVs8ADJoknUx+CVQkLxEhs+74f7BQWAVWJiffvgtm8AvYSyx/9gjpRXmL/wbPMIDan
 gIPE5huvWCFqBCVOznwCdhMzUE3z1tnMIAskBL5wSDQ3rANyOIAcF4nfe9Uh5ghLvDq+hR3C
 lpE4PbmHBaK+nVFiwe/7TBDOBEaJhue3GCGqrCXunAO5ggNog6bE+l36EGFHiTPfprBBzOeT
 uPFWEOIGPolJ26ZDreWV6GgTgqhWk5h1fB3c2oMXLjFD2B4S078cZp/AqDgLyTezkHwzC2Hv
 AkbmVYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIFp7PS/4192MC5/9VHvECMTB+MhRgkO
 ZiUR3nnb/6YJ8aYkVlalFuXHF5XmpBYfYpTmYFES51VNkU8VEkhPLEnNTk0tSC2CyTJxcEo1
 MAVsnXVBfv+eFf+/1PzYXxR3dOm/PckpN0y8e4zVaveECE3c9VqebaKSrax/0AyW08YNNz8s
 /lymfeLfnO/b5kRUZ7fbPazwPCi7QPVv0+210v7voguOJVk5MVq7bwjq2qxmYPZ5A09UkEcZ
 01aZX4t2HfRcJiHzR/L5mYYW6ceNmz4GL/j57Oi3jxIh1+W0Ct95dCYEtXozXgoSYw6+fHiu
 RPVklgMLbxWcnCDuGFP7tf3Yh5Jk/mmHFh3c/LFSlDWVc+bDghwxFqWoT18ibhTLCSxQdnos
 e+2Fx5z0T9uPW8WyH9/E+qa934qfo6toVVWGOpuweJ/xztgYVtFn1+7vOHdphvahOv37At3T
 tymxFGckGmoxFxUnAgCmKWmd0gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7q3k/+lGVzcoGNx4voiJou3cxez
 WFz5+p7NYuG05YwW72dOYLa4vGsOm8XaI3fZLRZ+3Mpi0da5jNVi9rv97BZb3kxkdeD22Ptt
 AYvHzll32T02repk85h3MtDjfvdxJo/Wo79YPN7vu8rm0bdlFaPH5tPVHp83yQVwRenZFOWX
 lqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlLH53jL1gEXtF
 86Q1TA2MU9m6GDk5JARMJH697wOyuTiEBJYySjw+uI4ZIiEjcXJaAyuELSzx51oXVNEnRolX
 /56BdbMJGEp0vYVIiAi0MEoc3fibEcRhFnjCJLH021ZGkCphgSiJG78Wgo1lEVCVmHj/Llg3
 r4C9xPJHv6DukJfYf/AsWA2ngIPE5huvwFYLAdUc3vSXEaJeUOLkzCcsIDYzUH3z1tnMExgF
 ZiFJzUKSWsDItIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw3rYd+7llB+PKVx/1DjEycTAe
 YpTgYFYS4Z23/W+aEG9KYmVValF+fFFpTmrxIUZToLsnMkuJJucDIz6vJN7QzMDU0MTM0sDU
 0sxYSZyX7cr5NCGB9MSS1OzU1ILUIpg+Jg5OqQYmax+5l/svLuo6xTDpRitDoerptiXNT++L
 SEZvVTrExf4lwMzQSt+aSzPH2yTpv+RVs/XmIkfq2Of0pOearugqnP35198a+WfrL+lPOzPr
 pI9X5IXNOgUzj2bvT+XcpByaZjBb7XGMMveRqL11Lb/NXt9WLAnZv+tCtf5neyHRk/sPsCqV
 /bz0d/v6aavvRej2n0/Ud2IRl7my7oWpgoBm7Pa/b3asWR5y7ojs4YqTV9/9OikeXp+Yf63j
 zYX0fUu/NU6KXnkrSO/xe8dtimoXtb6FfPt1u2WSINslnqKJJns759n9swueHdVsq+S0z7F2
 Q3581rVvsUsqNr/efSepcmqpi/i+SfdXhjSzby27psRSnJFoqMVcVJwIADPOiBlAAwAA
X-CMS-MailID: 20241003092859eucas1p242fdefaa83bae892cf523019cb7c7003
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241003092859eucas1p242fdefaa83bae892cf523019cb7c7003
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241003092859eucas1p242fdefaa83bae892cf523019cb7c7003
References: <20241003092826.1942901-1-m.szyprowski@samsung.com>
 <CGME20241003092859eucas1p242fdefaa83bae892cf523019cb7c7003@eucas1p2.samsung.com>
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

If caller doesn't provide driver->fbdev_probe nor funcs->fb_probe, then
fail early instead of causing potential NULL pointer dereference, because
fb_helper->fb won't be initialized in such case.

Fixes: 5d08c44e47b9 ("drm/fbdev: Add memory-agnostic fbdev client")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d5e8994345bb..fc260832326c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1635,6 +1635,9 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
 	else if (fb_helper->funcs)
 		ret = fb_helper->funcs->fb_probe(fb_helper, &sizes);
+	else
+		ret = -ENODEV;
+
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

