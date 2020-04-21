Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBA1B2820
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1056E96A;
	Tue, 21 Apr 2020 13:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B0D6E966;
 Tue, 21 Apr 2020 13:37:46 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h69so6762573pgc.8;
 Tue, 21 Apr 2020 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=heflTtIWlDgCdrkpY0GpyDbRrtx8bAEMI94sj04Xy/4=;
 b=iOvby6INOMaPgxnHyr9N1zLJvCtplEFqXveCtLZycZ01hLF1nvWyjfqiNlUrOB3/mg
 r43BDs2pe7TwB2MS4NwkRn4cPJrmMgnxgSX3TREC9G+UfyfdSV9PYNGKTn5yV4PSieup
 lgLy6S7ZaJ/li/J1MUoFjmvpI0/kk1TiiQVYx/dUuKRgCoecIAb1ka7ISbN6Uasqn5AN
 C71nqFdCk8KPnK+kafYgWiDzZQPfwVHqUIY2wzf9xtMpEKTSEw2PTMo2Kxolww4TDUr8
 tCUn6PJyYb8Yr9SdiQfSbUJogg1wr1MdBS9/CkshAwjj3O/y6pRS+EOPDqgVNPmb56KI
 0Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=heflTtIWlDgCdrkpY0GpyDbRrtx8bAEMI94sj04Xy/4=;
 b=KvtnbmonuywkiXCpHGDd03MDLpTwctvn5Kh/nb9f9DlKy91+qCg5D6ZwsKOEtPvrAD
 AwYKcPgKi1rw/Y4bC85hN7jq7b4ufkRn8XBgzedSE21pPWVYqMlpSM4rTY+ja6aBIKkn
 1gAlFiXQeow2PxjRykpW1NYOyOy1FSotHOQ6ikORmSKKT/ezrjwC6rMjOqfcygKR2qjY
 VIIvVmsr80rJPiXG0v4KlP8ITWPlHTBuQ1Re1VtUPTX9Ml+FYzviORnGSz780BRG0zb6
 TQ/xjMyaOmUUYz6kKe2OPKjfQ7EpJxQ3aXZuDRVK7zDm5tIHpk5zLIpQdMhXMJzz1704
 EmgA==
X-Gm-Message-State: AGi0PuaZx4Hx8YRS1lLVnRyhkijtipJCJniwOBWKIKzN1+ks14ghYFjm
 HSi//GE0qYTa5Q1XSrvVjnxjA1hA5puoxw==
X-Google-Smtp-Source: APiQypLZ6+IYPSKZft3kAWu5xyzsljzByJzf/GiKlC9QUkP6M8bFiZ0hBMw+rNbgjnEXSdL627MDeA==
X-Received: by 2002:a62:3784:: with SMTP id
 e126mr21921270pfa.303.1587476265333; 
 Tue, 21 Apr 2020 06:37:45 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:44 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/10] drm/lima: power down ip blocks when pmu exit
Date: Tue, 21 Apr 2020 21:35:47 +0800
Message-Id: <20200421133551.31481-7-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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

v2:
Fix lima_pmu_wait_cmd timeout when mali400 case.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.h |  2 ++
 drivers/gpu/drm/lima/lima_pmu.c    | 53 +++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

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
index 571f6d661581..d476569f2043 100644
--- a/drivers/gpu/drm/lima/lima_pmu.c
+++ b/drivers/gpu/drm/lima/lima_pmu.c
@@ -21,7 +21,7 @@ static int lima_pmu_wait_cmd(struct lima_ip *ip)
 				 v, v & LIMA_PMU_INT_CMD_MASK,
 				 100, 100000);
 	if (err) {
-		dev_err(dev->dev, "timeout wait pmd cmd\n");
+		dev_err(dev->dev, "timeout wait pmu cmd\n");
 		return err;
 	}
 
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
@@ -56,5 +90,22 @@ int lima_pmu_init(struct lima_ip *ip)
 
 void lima_pmu_fini(struct lima_ip *ip)
 {
+	u32 stat;
+
+	if (!ip->data.mask)
+		ip->data.mask = lima_pmu_get_ip_mask(ip);
 
+	stat = ~pmu_read(LIMA_PMU_STATUS) & ip->data.mask;
+	if (stat) {
+		pmu_write(LIMA_PMU_POWER_DOWN, stat);
+
+		/* Don't wait for interrupt on Mali400 if all domains are
+		 * powered off because the HW won't generate an interrupt
+		 * in this case.
+		 */
+		if (ip->dev->id == lima_gpu_mali400)
+			pmu_write(LIMA_PMU_INT_CLEAR, LIMA_PMU_INT_CMD_MASK);
+		else
+			lima_pmu_wait_cmd(ip);
+	}
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
