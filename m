Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A61AA912
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10296E9E0;
	Wed, 15 Apr 2020 13:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65A6E9E0;
 Wed, 15 Apr 2020 13:53:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 2so1467721pgp.11;
 Wed, 15 Apr 2020 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k2adAloEblHJhyp5jzo7dtGYvlSpgiWExtgTI5q+0+E=;
 b=Eyn9aRp1vrVi8Hf69/4pK/MRqQVQ46G7A7tpRqeMOceuF5BJpoPN0DLeguOORzyEX8
 phgmoGBvvHNO9PE/3+CiYoWK/dxonl2wjzUPL35KMpoM+XwtHCvb2tZRh8mHdBxMSMrt
 HsYZ3xg0ESpmJxUGPFPEdK9yRX+hqH2gWms+oxo0j11WDeybU6Q+g1XdsNivcthg5yEZ
 6EgEvsuJ/ZK7FC9G9s9psj5aBKCfBR4rJciZW7MK9AItdWPqbdBbCLPgEhLKadOshCXJ
 0na9C4vJubWLuRk/XWrRD9pgwqNhpmNgS78IbwqfgBJ938aN6cqq2UACdVHQRNwX6oxx
 Rjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k2adAloEblHJhyp5jzo7dtGYvlSpgiWExtgTI5q+0+E=;
 b=C03Wdkgfv5IaNuiKvdg7sJ6oqIZR5N1ZT6anAwK9FJFuZcB4Q/8vIPm0gJ/I4xPdJq
 nMEiVsdYgQ72Mn74O/7O1a2zF67ZDPc4LbbA9CgPvegxvtvDmxmVFBUXFy2RTznlyN2m
 Hy2RoPOyvWWhc+3wvhdf91HEYMXULr9ehNWIm4VdH6QgftYhxPLvLHx8yoLtbENtkUFr
 cTpLhHpmzUOaqOz8UM01YZcO48bL1FTnqLfuAVN+xHboFa2WKycon8J6SRrpfvQetJlK
 oFawLnbc7hktppcZqb+v3wuPwLlLeMnIyJMpCgBPmqJTelx8R2pvYrhj2x0dKQ0C6CoK
 MZHw==
X-Gm-Message-State: AGi0PuYGdGATECOG3zfxv1Gfu6Jldy9aNq1QZK/YDoPT3bRYHAZ6/QEU
 ldQlFsZtmrK4L5+JBuhsXvtm5uJ8V7uLFQ==
X-Google-Smtp-Source: APiQypI+XLHLaFtXq4UKHwh+i0nOfKKap6K9NIBA1tb/7QG/4WtzRzBZNNT8wGaPjyz2dwU4EIxHZA==
X-Received: by 2002:a62:686:: with SMTP id 128mr26832999pfg.152.1586958824877; 
 Wed, 15 Apr 2020 06:53:44 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id z1sm3331069pjt.42.2020.04.15.06.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:53:44 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/lima: power down ip blocks when pmu exit
Date: Wed, 15 Apr 2020 21:52:06 +0800
Message-Id: <20200415135208.8960-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415135208.8960-1-yuq825@gmail.com>
References: <20200415135208.8960-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare resume/suspend PM.

Tested-by: Bhushan Shah <bshah@kde.org>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.h |  2 ++
 drivers/gpu/drm/lima/lima_pmu.c    | 43 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 06fd9636dd72..1a5032b08883 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -64,6 +64,8 @@ struct lima_ip {
 		bool async_reset;
 		/* l2 cache */
 		spinlock_t lock;
+		/* pmu */
+		u32 mask;
 	} data;
 };
 
diff --git a/drivers/gpu/drm/lima/lima_pmu.c b/drivers/gpu/drm/lima/lima_pmu.c
index 571f6d661581..7f26bf384e15 100644
--- a/drivers/gpu/drm/lima/lima_pmu.c
+++ b/drivers/gpu/drm/lima/lima_pmu.c
@@ -29,6 +29,40 @@ static int lima_pmu_wait_cmd(struct lima_ip *ip)
 	return 0;
 }
 
+static u32 lima_pmu_get_ip_mask(struct lima_ip *ip)
+{
+	struct lima_device *dev = ip->dev;
+	u32 ret = 0;
+	int i;
+
+	ret |= LIMA_PMU_POWER_GP0_MASK;
+
+	if (dev->id == lima_gpu_mali400) {
+		ret |= LIMA_PMU_POWER_L2_MASK;
+		for (i = 0; i < 4; i++) {
+			if (dev->ip[lima_ip_pp0 + i].present)
+				ret |= LIMA_PMU_POWER_PP_MASK(i);
+		}
+	} else {
+		if (dev->ip[lima_ip_pp0].present)
+			ret |= LIMA450_PMU_POWER_PP0_MASK;
+		for (i = lima_ip_pp1; i <= lima_ip_pp3; i++) {
+			if (dev->ip[i].present) {
+				ret |= LIMA450_PMU_POWER_PP13_MASK;
+				break;
+			}
+		}
+		for (i = lima_ip_pp4; i <= lima_ip_pp7; i++) {
+			if (dev->ip[i].present) {
+				ret |= LIMA450_PMU_POWER_PP47_MASK;
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
 int lima_pmu_init(struct lima_ip *ip)
 {
 	int err;
@@ -56,5 +90,14 @@ int lima_pmu_init(struct lima_ip *ip)
 
 void lima_pmu_fini(struct lima_ip *ip)
 {
+	u32 stat;
 
+	if (!ip->data.mask)
+		ip->data.mask = lima_pmu_get_ip_mask(ip);
+
+	stat = ~pmu_read(LIMA_PMU_STATUS) & ip->data.mask;
+	if (stat) {
+		pmu_write(LIMA_PMU_POWER_DOWN, stat);
+		lima_pmu_wait_cmd(ip);
+	}
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
