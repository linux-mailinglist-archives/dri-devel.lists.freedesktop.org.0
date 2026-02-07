Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kUCBLUgMh2mXTAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284A10568F
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A15610E216;
	Sat,  7 Feb 2026 09:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="Z62Wt88r";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Z62Wt88r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC15310E228
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 09:56:16 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=N6Ab8j1SpCgvGVmORiB+3Xjbux4zd83gTeP1l1ZPmw0=;
 b=Z62Wt88rUmLgOeeTr2PpWPXzUd7+TxsnHtdwuSIrdxouovzqs8sRMKpBe71iqO2M4g5TI3huM
 JAXTb1asaSoXCKaiqBzVJFrNnEYoPOwrth5WanrvkzM5qu6AIXawSl1D/ZV68ThCWciH8WRDmx/
 cwyP5VQyY/4XWX7kGUhs5Mc=
Received: from canpmsgout11.his.huawei.com (unknown [172.19.92.148])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f7RCd0kMfz1BFsB
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:55:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=N6Ab8j1SpCgvGVmORiB+3Xjbux4zd83gTeP1l1ZPmw0=;
 b=Z62Wt88rUmLgOeeTr2PpWPXzUd7+TxsnHtdwuSIrdxouovzqs8sRMKpBe71iqO2M4g5TI3huM
 JAXTb1asaSoXCKaiqBzVJFrNnEYoPOwrth5WanrvkzM5qu6AIXawSl1D/ZV68ThCWciH8WRDmx/
 cwyP5VQyY/4XWX7kGUhs5Mc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
 by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f7R796gWvzKm4t;
 Sat,  7 Feb 2026 17:51:33 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 7AC2640565;
 Sat,  7 Feb 2026 17:56:10 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 17:56:10 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 17:56:09 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <helin52@h-partners.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 1/4] drm/hisilicon/hibmc: add updating link cap in DP
 detect()
Date: Sat, 7 Feb 2026 17:48:34 +0800
Message-ID: <20260207094837.1468985-2-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260207094837.1468985-1-shiyongbang@huawei.com>
References: <20260207094837.1468985-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:kong.kongxinwei@hisilicon.com,m:dmitry.baryshkov@oss.qualcomm.com,m:liangjian010@huawei.com,m:chenjianmin@huawei.com,m:fengsheng5@huawei.com,m:shiyongbang@huawei.com,m:helin52@h-partners.com,m:shenjian15@huawei.com,m:shaojijie@huawei.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,hisilicon.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huawei.com:email,huawei.com:dkim,huawei.com:mid];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5284A10568F
X-Rspamd-Action: no action

From: Lin He <helin52@huawei.com>

In the past, the link cap is updated in link training at encoder enable
stage, but the hibmc_dp_mode_valid() is called before it, which will use
DP link's rate and lanes. So add the hibmc_dp_update_caps() in
hibmc_dp_update_caps() to avoid some potential risks.

Fixes: e6c7c59da494 ("drm/hisilicon/hibmc: add dp mode valid check")
Signed-off-by: Lin He <helin52@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h   | 1 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c   | 2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index f9ee7ebfec55..f53dac256ee0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -69,5 +69,6 @@ int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
 int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
 int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
 int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
+void hibmc_dp_update_caps(struct hibmc_dp_dev *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index 0726cb5b736e..8c53f16db516 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -325,7 +325,7 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
 	return hibmc_dp_link_reduce_rate(dp);
 }
 
-static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
+void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
 {
 	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
 	if (dp->link.cap.link_rate > DP_LINK_BW_8_1 || !dp->link.cap.link_rate)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 616821e3c933..35dff7bfbf76 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -41,6 +41,8 @@ static bool hibmc_dp_get_dpcd(struct hibmc_dp_dev *dp_dev)
 	if (ret)
 		return false;
 
+	hibmc_dp_update_caps(dp_dev);
+
 	dp_dev->is_branch = drm_dp_is_branch(dp_dev->dpcd);
 
 	ret = drm_dp_read_desc(dp_dev->aux, &dp_dev->desc, dp_dev->is_branch);
-- 
2.33.0

