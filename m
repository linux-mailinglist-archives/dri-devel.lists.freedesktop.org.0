Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500174D02B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD4010E233;
	Mon, 10 Jul 2023 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A87710E234;
 Mon, 10 Jul 2023 08:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cibNossU9NvmovVNz4n5LZY+oxPhK96qEmjTCq7H1AiZGiLJjouJdsXSNHIg9tnOMyKnhmsLZx2QyzlBVoddAh6wx3LMpNKH8iyKbjcw4kxmSx9vm9eYnTAaQARsk4DKnL8SQTCIKubIvzq+e+nDH/Dgh/2H3DwqBYkdgBmrxCGSPIC5Q9aPLD76gT48Q8qpgB22L9/UqA4t4cVA7he4jKQEuCgWjj6qmXp5UdtzcbzTAGnQEoRVdqkt0GDfpb4vToRYo403xa5yNxUok50X3fYHYRySJsXv1oyCVaArcsv0MzNPTuV6Rdlkt4g/T8EDGq3exdS68fmcdscJZlaxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J0Cz5Cadlw65Bzx+SEzLMeK7AP7NhydWrQ7o5Xd/xE=;
 b=jjroFjayqSqgK4ajLBkCuDTHP5M6uhVtxSitBaYjXstqIQsr5pBNaajdnONpBXmGy5dPkRkRjcaUz2bEkZhKJCsQZFrytkDyJ3o4/aMCxDLdxDiWXRois5FYYq3KfKDZ62F3Nu/q2J3b/XHFtxNnznOHL9X/daJ+UaAkIkLdbN/smY4H0rJiMy5nuCWZhHdcmop0TWXmkwObv7SMKm7x6IBkKpecgcmurl5QR0aW3jkd7cGS45rrYn3QZvRfGZwzxF0f4j1UzX+ifszqR+/wZvMuMb22kzE6NCZqg2oyaip/xszU3S0bIUbCbAY55RrnfzUcMpSKhnJwZUA/RQPJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J0Cz5Cadlw65Bzx+SEzLMeK7AP7NhydWrQ7o5Xd/xE=;
 b=GxIDZG1AIsshSsi8CwJYZwNH2Un4Eh93pAI3D1xuyHZe1WrlNlUrdOJUFKlYET9U5Yxt62M0SYIRuCMcVXU+26GJaFuNalB63oVFtBjajqoVv4OhBnz1DgYTYdMjFMQxjGHEkgPWCedCKq8uVLQ5Gl6h/bExh4A+zIxd63PkcrE=
Received: from MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::14)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 08:39:02 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::6f) by MW4P223CA0009.outlook.office365.com
 (2603:10b6:303:80::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 08:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:39:01 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:38:51 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V6 4/9] wifi: mac80211: Add support for ACPI WBRF
Date: Mon, 10 Jul 2023 16:36:36 +0800
Message-ID: <20230710083641.2132264-5-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa167bc-dccf-4fcf-b5d2-08db81211cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FdGQuib2vqbUR+jxDT4W4/NZd2vVp/wnYhsMgUkFQfyUtLxRjqWKUmEsUi8nlR5Fy49Vz6nGT8GwMT3ZZGtXUDbG0vG5IE0Bc8YgRJx9DRe0FZKSnaoFJlog5PyeDA8Q5dPTEA/b3ImPlsN6uSZYmN5KWqrW9wycsp+kGqESg2SsoqQhUxDScmpiHjU2VfWBrO0iNougc1P/CbGOiGMDDvhR/dY1ABcfLPpcgRr5lAMrIS++lGSZqw5Rg8Ch9v1FBLohKeTz5xpPhktLoWXfLl3OKDvvIgUAx4Typ7gR4pEdKgM68AnovNMYygvoQddm1saN/5TR3e13u72NxNTMiUQ9kGomYth+1eiGI+DNbijgKPsWPiv1xRXXX5rN05nnjYTH9FodDosmjmoj3StpHolrDjOywc+UJnSQLiN3UzitOoFKOCNSdyEF9OqCqY1qo0+S8l7ZwFe92ml0jotfWSaM3Ggkp1gwgUcG5OrCXa+btV/LPfhWDdRiN8HCGwb6L11Ft0CUOxBKc77DRII7CCQSGkVhbTSmAvuHp0q2sTYFAs4jGBwJR3fGEULz8kDSNIOSMIIdmORC6RS3W7e4YwXHHp9OKgp7hERB3uBx/mqrS7hZlSj0/m0rga5igbqjbOu3t/wcQfbBq5qi0snNK8eJsyw63A326ePtxcteWnUkqUnPcZBBkmjHq3VJEq+mDGqOoPi/GDIXI/xRhiOu5yLZCtuq8ABtNYaBcWNINWL8k8Qaxc/+Spp555sh661qH45tUH5L4W7lfRtYSt1CwmVSy42Xo48K10lTlw1Np0o3Im2RW/JiIhYt9poKi7EF6smii0SKct4lKo96mrxn+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(336012)(426003)(2616005)(41300700001)(26005)(1076003)(83380400001)(16526019)(186003)(36860700001)(47076005)(478600001)(82740400003)(81166007)(921005)(356005)(110136005)(54906003)(6666004)(7696005)(40460700003)(4326008)(44832011)(40480700001)(70206006)(70586007)(316002)(7416002)(86362001)(82310400005)(8676002)(8936002)(5660300002)(2906002)(36756003)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:39:01.8551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa167bc-dccf-4fcf-b5d2-08db81211cce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
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

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
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
index 4159fb65038b..fb984ce7038c 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1591,6 +1591,10 @@ struct ieee80211_local {
 
 	/* extended capabilities provided by mac80211 */
 	u8 ext_capa[8];
+
+#if IS_ENABLED(CONFIG_WBRF)
+	bool wbrf_supported;
+#endif
 };
 
 static inline struct ieee80211_sub_if_data *
@@ -2615,4 +2619,19 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
 				    u8 eht_cap_len,
 				    struct link_sta_info *link_sta);
+
+#if IS_ENABLED(CONFIG_WBRF)
+void ieee80211_check_wbrf_support(struct ieee80211_local *local);
+void ieee80211_add_wbrf(struct ieee80211_local *local,
+			struct cfg80211_chan_def *chandef);
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef);
+#else
+static inline void ieee80211_check_wbrf_support(struct ieee80211_local *local) { }
+static inline void ieee80211_add_wbrf(struct ieee80211_local *local,
+				      struct cfg80211_chan_def *chandef) { }
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

