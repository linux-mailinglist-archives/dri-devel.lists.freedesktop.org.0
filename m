Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119C1D8F37
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 07:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28836E183;
	Tue, 19 May 2020 05:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982C6E183;
 Tue, 19 May 2020 05:30:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so1658127wmb.4;
 Mon, 18 May 2020 22:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWDo42nhd4sqFdF5voa++LZ2U/jNdAL9z6XA6dzl6uE=;
 b=lyoVSu9rXYV0z0/+Rous+Dp3s7nEhkenGZzIKs1ZkqzeVNnzUhZcV3wJk5agDUJWbq
 rcMHz/OC6/O9K9mRBTR4etcp+DUNsQGvLrwM7631Ph+y5HupMNjZ6YJP9pwXyFcPTQ3n
 rpeHKC6bentSXGu9z8YeO6/i5banBuwyfNSzFDnamYwrBYT6tr6ewd2oejfZ198De8Uo
 oMbwLHNjlSyaSrXA4ZVCfOuElXeeqPDEsTNsgsri89E5veLZHoregF69qi3u2F//PP2O
 NFh616lyMXgCUGQIZIIVM4dqr9jCQaHnX6JII1Cn+qy9RPqL/ESxxK0FrwBOxEyQbDQP
 mlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWDo42nhd4sqFdF5voa++LZ2U/jNdAL9z6XA6dzl6uE=;
 b=TphLDy4AA+dw+GXrICxaWwGOVRDwPk8u/lLsS7+aNdDRkPdIHiVq98QOvzqH9EsTlS
 ear0z4UVaRCVFl9il7WFWpgzvEmjjycwAkSIfQSgNBLLIaD0N4EqKJ+aRsCwE1o2H9mu
 bihdwtNt1UaDf1qinRWgh0XNmoLwPgi08N2Pt788AmA2w9aQVlHjS01cczREaOENzpBn
 KjuPyY7sxMVRr8nEgnE0JXIwfdAX1u3tfrMmCc2tXL7KDNXhGr+EuVCabdMrYJzHwoVU
 7pTqkm38SqHCzYSjmweABfFQeqj1yuq+atP6cqIP+cfMQ8q+WeQ+23TOJQNkxeniZjsn
 CW+A==
X-Gm-Message-State: AOAM533sqfFcDNvYvFWMX9B0qHzRRBU65vZm8fOwGj6CfTWbWQuFjcro
 dMZbRSVZEcxw7EwXjZxgMzM=
X-Google-Smtp-Source: ABdhPJyq7IUvmim5jAxuLmb0uu1FuRmT4ZBQmSjs1Ixu/wTOC9lspqVblmVqEC+1r4ogbwM7wq2uPA==
X-Received: by 2002:a1c:2e4d:: with SMTP id u74mr3310071wmu.145.1589866222870; 
 Mon, 18 May 2020 22:30:22 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id f123sm2312114wmf.44.2020.05.18.22.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 22:30:22 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: fix perfmon domain interation
Date: Tue, 19 May 2020 07:30:15 +0200
Message-Id: <20200519053019.48376-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GC860 has one GPU device which has a 2d and 3d core. In this case
we want to expose perfmon information for both cores.

The driver has one array which contains all possible perfmon domains
with some meta data - doms_meta. Here we can see that for the GC860
two elements of that array are relevant:

  doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
  doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain

The userspace driver wants to get a list of all perfmon domains and
their perfmon signals. This is done by iterating over all domains and
their signals. If the userspace driver wants to access the domain with
id 8 the kernel driver fails and returns invalid data from doms_3d with
and invalid offset.

This results in:
  Unable to handle kernel paging request at virtual address 00000000

On such a device it is not possible to use the userspace driver at all.

The fix for this off-by-one error is quite simple.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>

---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index e6795bafcbb9..75f9db8f7bec 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
 		if (!(gpu->identity.features & meta->feature))
 			continue;
 
-		if (meta->nr_domains < (index - offset)) {
+		if (index - offset >= meta->nr_domains) {
 			offset += meta->nr_domains;
 			continue;
 		}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
