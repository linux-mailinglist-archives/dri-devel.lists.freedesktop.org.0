Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DEE743984
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19D10E29D;
	Fri, 30 Jun 2023 10:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A851B10E29D;
 Fri, 30 Jun 2023 10:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtPMvlnu0h2B2fUiZjCmC9xwqk8wOFRmkpKU0k3lvEWuRx4rxHMSLg8r4o72wp4I2An6yeti8UwHsPWdRy58WheHLZGeSqvzmxQw1YvbMP8caLl6vtOc9m8PUO7vvYAnYMxeNB6p3zYPzQ5hxA+Wx4I89Yw10DzYDnKYLfOT0QApxQuNnD7Yx2KbwZttCJugj5F7yk8TfvtJjp7+X1XFvvAXYsHG2J/fxhDaRIIpb6Klr/HiOQW5o4GhUQ2c56CfhODaB4LOqe9+PTFE0R0vRgbAv26oC+z9GJZifd2qNBdpXQ3XQheHF4irgwb5XAGXX3n8lqqHnC0yapv5zTlA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ucv2D8bHZwMRnkFoviWKHtr5t08ZHdG8lQ3sb1FmBI=;
 b=ilIf0V6owmMSIoxA2dJnuZYUKHLQ4mEUDL5/Jo7GwKcP1ZHO3u9HTxCfQ1Ziq7su4893BmxgJgeVtTjy80aZb85czOWvRh1pRYr/5dPD8J116QEV1LTnJrkvpgoAlVP07FUJzzWvld7vOGlsUmYJah7J3sESP/pBdD6gHBLpNvxrSS1U1zpxfsmgbDabDsGEa+sB4QoP9nqBpC23vEjnHuDkfxLhTSkzlVnzUFfbJ78m1mRz48XqMomaRJNK7mBZp25gAYF9uCoatHzaXJv6/nuqdS4eL2Y+lGIspjfLJc1GMixbOxhlO5czE2Tg3P23dGEUwNrBVOAxtqNWD01NEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ucv2D8bHZwMRnkFoviWKHtr5t08ZHdG8lQ3sb1FmBI=;
 b=CC56dxcR8NsOpeQYIf5YDFekWRgbQJSelLaTgjum/wMKH9651caiTkqXEjIOuxcDj0ECfY/PQTv0bXaB7+Fk29Lp2PHISJTp2V8bkIivrSAcvKV8ZQGtAYzniRySa3zyyRLHFBwVZDpMK9XleOg2ZG0TEW2AkHjyfKr7kzCF69o=
Received: from DS7PR03CA0006.namprd03.prod.outlook.com (2603:10b6:5:3b8::11)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 10:34:40 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::2c) by DS7PR03CA0006.outlook.office365.com
 (2603:10b6:5:3b8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 10:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 10:34:39 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:34:32 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
Date: Fri, 30 Jun 2023 18:32:35 +0800
Message-ID: <20230630103240.1557100-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630103240.1557100-1-evan.quan@amd.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT025:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: b6499c45-de03-4627-2136-08db79559c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5wrxH+SJ8IL68G6g26asHmsDACSsJ4fg4BSc2JS9/g1X//OKh48q3TIHaERW4DKRKTk0KlzOrtNqmNw1Hx8zdpp3Ge613AQcBbP0HTT+0wh6vcTxZ/7OeDPGJ/moQ6J+Lhb1v/bMdC1kfooJ8mDQ5mPWHK0bnAkcmm4lCC5aHHc/i8HGdXEr4OTeEl10QqC5AA0xk1yxttXh5vuUj1dCVDC9qq1cI/rBHm3RKpsJ5DFY1FpQfdM/6upTHTry1Eohx20DsvkhQOXFJ6p9YVcSR5o7Envc8j+gjSbsoXus4GDgX960jXhVzFKw9LygDzUMvN9dqZz8VXkj904DvZW6d2in9Ptq1ZDnMWzME3AayCxxevYY13Ulee7lmzouTngsmvQ+t3Tw/6QCScmlb8bCQMIqxBmKbyaBfyO4nL1mgYrYKZe/9a6OqGMON/j9apiSpGz25tub4NtYL1IO8frX8ip+3ekQE6a4mH2LnoMVNsmkZHXLYZ4z17RTT4NW+kbedoV+p2K7pw0E5M1ZXXfwl+XHzEWNGwHP85ToMszgj1UH79btiF/bWgMdBEtjc6DQL1Epl0CRb3l3TmXRHofnIp6hx2rcAjg7NU30kejYByWy8v/jcZ2uRWPoucb5pqDUCA+JX7JRjGGQOeFy23Izav1Hd8s8M3xHBTCDKB0/EABhgBTf4okjgbIz0XtqvzSkTeDLiWoCFfGy1aBi47hoA+3RkAyiQDv70X1mLwniLzqRvZIYg34YDXqa4PCLnVfshvmcHYuXrV+CnOnIUrwZnLyoK9rc5RJ+gCDAqc4LCn6RgTsGC92m0qRw3zYRv+E8kkTO+MYIClA18JOjWjSIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(7416002)(316002)(70206006)(70586007)(8676002)(44832011)(8936002)(2906002)(41300700001)(40480700001)(40460700003)(82310400005)(356005)(81166007)(82740400003)(921005)(86362001)(36756003)(36860700001)(186003)(26005)(7696005)(478600001)(1076003)(16526019)(4326008)(110136005)(54906003)(47076005)(2616005)(83380400001)(336012)(426003)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:34:39.9563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6499c45-de03-4627-2136-08db79559c0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support AMD's WBRF interference mitigation mechanism, Wifi adapters
utilized in the system must register the frequencies in use(or unregister
those frequencies no longer used) via the dedicated APCI calls. So that,
other drivers responding to the frequencies can take proper actions to
mitigate possible interference.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - place the new added member(`wbrf_supported`) in
    ieee80211_local(Johannes)
  - handle chandefs change scenario properly(Johannes)
  - some minor fixes around code sharing and possible invalid input
    checks(Johannes)
v2->v3:
  - drop unnecessary input checks and intermediate APIs(Mario)
  - Separate some mac80211 common code(Mario, Johannes)
v3->v4:
  - some minor fixes around return values(Johannes)
---
 include/linux/ieee80211.h  |   1 +
 net/mac80211/Makefile      |   2 +
 net/mac80211/chan.c        |   9 ++++
 net/mac80211/ieee80211_i.h |  19 +++++++
 net/mac80211/main.c        |   2 +
 net/mac80211/wbrf.c        | 103 +++++++++++++++++++++++++++++++++++++
 6 files changed, 136 insertions(+)
 create mode 100644 net/mac80211/wbrf.c

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index c4cf296e7eaf..0703921547f5 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -4319,6 +4319,7 @@ static inline int ieee80211_get_tdls_action(struct sk_buff *skb, u32 hdr_size)
 /* convert frequencies */
 #define MHZ_TO_KHZ(freq) ((freq) * 1000)
 #define KHZ_TO_MHZ(freq) ((freq) / 1000)
+#define KHZ_TO_HZ(freq)  ((freq) * 1000)
 #define PR_KHZ(f) KHZ_TO_MHZ(f), f % 1000
 #define KHZ_F "%d.%03d"
 
diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
index b8de44da1fb8..8f8ac567e7c8 100644
--- a/net/mac80211/Makefile
+++ b/net/mac80211/Makefile
@@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
 
 mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
 
+mac80211-$(CONFIG_WBRF) += wbrf.o
+
 ccflags-y += -DDEBUG
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 77c90ed8f5d7..9887471028dc 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80211_local *local,
 
 	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
 
+	ieee80211_remove_wbrf(local, &ctx->conf.def);
+
 	ctx->conf.def = *chandef;
 
 	/* check if min chanctx also changed */
 	changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
 		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
+
+	ieee80211_add_wbrf(local, &ctx->conf.def);
+
 	drv_change_chanctx(local, ctx, changed);
 
 	if (!local->use_chanctx) {
@@ -668,6 +673,8 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
 	lockdep_assert_held(&local->mtx);
 	lockdep_assert_held(&local->chanctx_mtx);
 
+	ieee80211_add_wbrf(local, &ctx->conf.def);
+
 	if (!local->use_chanctx)
 		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
 
@@ -748,6 +755,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
 	}
 
 	ieee80211_recalc_idle(local);
+
+	ieee80211_remove_wbrf(local, &ctx->conf.def);
 }
 
 static void ieee80211_free_chanctx(struct ieee80211_local *local,
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 4159fb65038b..ffe00c55304e 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1591,6 +1591,10 @@ struct ieee80211_local {
 
 	/* extended capabilities provided by mac80211 */
 	u8 ext_capa[8];
+
+#ifdef CONFIG_WBRF
+	bool wbrf_supported;
+#endif
 };
 
 static inline struct ieee80211_sub_if_data *
@@ -2615,4 +2619,19 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
 				    u8 eht_cap_len,
 				    struct link_sta_info *link_sta);
+
+#ifdef CONFIG_WBRF
+void ieee80211_check_wbrf_support(struct ieee80211_local *local);
+void ieee80211_add_wbrf(struct ieee80211_local *local,
+			struct cfg80211_chan_def *chandef);
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef);
+#else
+static inline void ieee80211_check_wbrf_support(struct ieee80211_local *local) { }
+static inline void ieee80211_add_wbrf(struct ieee80211_local *local,
+				      struct cfg80211_chan_def *chandef) { return 0; }
+static inline void ieee80211_remove_wbrf(struct ieee80211_local *local,
+					 struct cfg80211_chan_def *chandef) { }
+#endif /* CONFIG_WBRF */
+
 #endif /* IEEE80211_I_H */
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 55cdfaef0f5d..0a55626b1546 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1395,6 +1395,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	debugfs_hw_add(local);
 	rate_control_add_debugfs(local);
 
+	ieee80211_check_wbrf_support(local);
+
 	rtnl_lock();
 	wiphy_lock(hw->wiphy);
 
diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
new file mode 100644
index 000000000000..7ddb29d128b1
--- /dev/null
+++ b/net/mac80211/wbrf.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface for WWAN
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/wbrf.h>
+#include <net/cfg80211.h>
+#include "ieee80211_i.h"
+
+void ieee80211_check_wbrf_support(struct ieee80211_local *local)
+{
+	struct wiphy *wiphy = local->hw.wiphy;
+	struct device *dev;
+
+	if (!wiphy)
+		return;
+
+	dev = wiphy->dev.parent;
+	if (!dev)
+		return;
+
+	local->wbrf_supported = wbrf_supported_producer(dev);
+	dev_dbg(dev, "WBRF is %s supported\n",
+		local->wbrf_supported ? "" : "not");
+}
+
+static void get_chan_freq_boundary(u32 center_freq,
+				   u32 bandwidth,
+				   u64 *start,
+				   u64 *end)
+{
+	bandwidth = MHZ_TO_KHZ(bandwidth);
+	center_freq = MHZ_TO_KHZ(center_freq);
+
+	*start = center_freq - bandwidth / 2;
+	*end = center_freq + bandwidth / 2;
+
+	/* Frequency in HZ is expected */
+	*start = KHZ_TO_HZ(*start);
+	*end = KHZ_TO_HZ(*end);
+}
+
+static void wbrf_get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
+					 struct wbrf_ranges_in *ranges_in)
+{
+	u64 start_freq1, end_freq1;
+	u64 start_freq2, end_freq2;
+	int bandwidth;
+
+	bandwidth = nl80211_chan_width_to_mhz(chandef->width);
+
+	get_chan_freq_boundary(chandef->center_freq1,
+			       bandwidth,
+			       &start_freq1,
+			       &end_freq1);
+
+	ranges_in->band_list[0].start = start_freq1;
+	ranges_in->band_list[0].end = end_freq1;
+
+	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
+		get_chan_freq_boundary(chandef->center_freq2,
+				       bandwidth,
+				       &start_freq2,
+				       &end_freq2);
+
+		ranges_in->band_list[1].start = start_freq2;
+		ranges_in->band_list[1].end = end_freq2;
+	}
+}
+
+void ieee80211_add_wbrf(struct ieee80211_local *local,
+			struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	struct device *dev;
+
+	if (!local->wbrf_supported)
+		return;
+
+	dev = local->hw.wiphy->dev.parent;
+
+	wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+
+	wbrf_add_exclusion(dev, &ranges_in);
+}
+
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	struct device *dev;
+
+	if (!local->wbrf_supported)
+		return;
+
+	dev = local->hw.wiphy->dev.parent;
+
+	wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+
+	wbrf_remove_exclusion(dev, &ranges_in);
+}
-- 
2.34.1

