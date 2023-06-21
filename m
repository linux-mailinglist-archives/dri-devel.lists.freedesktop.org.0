Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B59737AC1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CEB10E3B5;
	Wed, 21 Jun 2023 05:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92CB10E3B6;
 Wed, 21 Jun 2023 05:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijm83pBzdTlZrFlDvtYC/FYVMXNx1L0g1s3icMveV0qmL965kK5CPcR+60g2Qsb5LbjSh/gXX3MwqHpQpeSlHk0FgzIhrARXs/l7kmeZpv4LzGJjDrII5r30GFPOAmHFnq92XIKs0JvwoHMiFqcg0/ZfZEZy+orHsl3lM2ZwV53M3weDS09Pnuiur50EgS922RGlzkwrrEh4KSFfVT9t29co8JCKt/T0VUhaYRTLz9oL21EL1rfzOrdI9ajgIa+/2+wQ1JZQCitvlLmFxaN2irZg4cbxzDPaZGnSD433TxSeGNXzLoQWvBD2UkQBQ/ouW3FNHZPZKrJGY7DqjC4MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjjAbG827nEyTsn7Jg9GyQhKlreYyYVCmvy4usNxypk=;
 b=GQCUwhktK/VM2Ktd7SpOH56azVpktCFZFFKvPDrp90pxbutSFJDH62OaMFFTqXDH/+TM+XYgMclzLAqgrUe0B8CKtntxZFbtFKDFbZ6F6L10KhXi0k474YDkQsmtiek7PuRf/BmTv0eMbKWBINQTH6bEOUMjAenyYtpNhYkZw225O+xpfWPSdf9ew9eyLobqsFHBTDx8ynZcWQMDW/kdIO2Mlb+qji2fc/TYYwNJu/2pCxOy1uoL6PA6x+mjiKqDbAedZKY2lbWlpuVl+wYWf0Y4OrOowKxQNUnwM1ubxQXS2r1fQulipV5Hva9XS/Ga5Znv4F3O1OcJoZITIX6EnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjjAbG827nEyTsn7Jg9GyQhKlreYyYVCmvy4usNxypk=;
 b=T23uxqHcWuGozI+E6tmRTjjxheTmbzn93GkBIUXM7+ethyGcoKAyEsf+GQ8dAFfrVuXxOCLrMpD9TFXLl5Vyq8ysJQ5oJ4JTeFACG//Pxh3fdmxd2YW8N3bnYw1MBoHroCgyAGGhNsSw4B2ZQlAKF1nQIZh2nTKWLxwuuUfsCXQ=
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 05:48:31 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::82) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Wed, 21 Jun 2023 05:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:48:31 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:47:43 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <mario.limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <lijo.lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V4 3/8] wifi: mac80211: Add support for ACPI WBRF
Date: Wed, 21 Jun 2023 13:45:58 +0800
Message-ID: <20230621054603.1262299-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621054603.1262299-1-evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2be76c-66d7-4b43-0c7c-08db721b2521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cAnsYneNy/GP23mET1hy15hNHnoqbWOtunQp8JZp62URbXI1ppfnagEqfQzvwOQ1XYIMk/1JOMmtfNicCeqYIwVBHa8Jl+rSH3Bq5SkOJrYFgEw+OvyOH0uC2tP+BNLnGYo1WGphrwrG/qVDSsYpXfNK+y7ydqO9VMBVOxbie1+wSWEk+/itEWaI7/dENipkyKbIOJh/E5rGNhb2PfWhuxgAOChHQUuCl+jLKzGq+W9gwSpDyUHX18wviLRtfNahFVzsGckKQ223ItR15vwwd2vq8YRYxTdxEX8lzG4eXW1OBMlbny3R4ftpgmhT3k+8S996gXPGJtdefFkk15lfdLuJPY7AHkGA6ih26ZV4v8WcCqnXu5/0ybCPIe+2rH/tcEEfUvAyg/+l0X+qTPo775YRh0LSSyYbu+KoopusGqvp39PaoAQ0QoCMkN8mBKmZZ7+7TPk6hVEK6+KB8nXxSSfyEy/UQFdCB5Ir59gwyn2kR8YVl/Ilh+VZ/H9yWTntxkCGpUhj9fvIz2YmpkUjq15q5IHy0c2oQUvaD9JA5TZwr6FMqEb3SwktSONmwxzp7yJZSM0cCYG4ypOUIeYvsJRWo70Fq7NFB6vVfYtCMXbyp3xQ6tPpQxhj100qZEEBrUa40L7Lgycwo7M1jIKw7NCrQoaLTGn0/gE4ePREcPxNFUpzPAj6T8KXiR9dq/AzEsdIjWFwvZ3N0tMwW/zUBLcASeuifphcr7BJZbwkbE+IEfR4DsYt69TyyM7q46cbjVZqno6bFtHJzNAcz5SEbIRDn5gNZIuwPHKzFo06R2I6LqXv+vIrJQElYZT+V/Q/32pW0jzPQacQBY7M95xsWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(82740400003)(36756003)(921005)(81166007)(356005)(82310400005)(86362001)(40460700003)(41300700001)(8676002)(40480700001)(7416002)(5660300002)(44832011)(26005)(1076003)(8936002)(478600001)(2616005)(186003)(16526019)(83380400001)(426003)(336012)(2906002)(316002)(54906003)(70586007)(6666004)(7696005)(4326008)(70206006)(110136005)(47076005)(36860700001)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:48:31.4726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2be76c-66d7-4b43-0c7c-08db721b2521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527
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
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support AMD's WBRF interference mitigation mechanism, Wifi adapters
utilized in the system must register the frequencies in use(or unregister
those frequencies no longer used) via the dedicated APCI calls. So that,
other drivers responding to the frequencies can take proper actions to
mitigate possible interference.

To make WBRF feature functional, the kernel needs to be configured with
CONFIG_ACPI_WBRF and the platform is equipped with WBRF support(from
BIOS and drivers).

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
---
 include/linux/ieee80211.h  |   1 +
 net/mac80211/Makefile      |   2 +
 net/mac80211/chan.c        |  11 ++++
 net/mac80211/ieee80211_i.h |  19 +++++++
 net/mac80211/main.c        |   2 +
 net/mac80211/wbrf.c        | 111 +++++++++++++++++++++++++++++++++++++
 6 files changed, 146 insertions(+)
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
index b8de44da1fb8..709eb678f42a 100644
--- a/net/mac80211/Makefile
+++ b/net/mac80211/Makefile
@@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
 
 mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
 
+mac80211-$(CONFIG_ACPI_WBRF) += wbrf.o
+
 ccflags-y += -DDEBUG
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 77c90ed8f5d7..0c5289a9aa6c 100644
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
@@ -668,6 +673,10 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
 	lockdep_assert_held(&local->mtx);
 	lockdep_assert_held(&local->chanctx_mtx);
 
+	err = ieee80211_add_wbrf(local, &ctx->conf.def);
+	if (err)
+		return err;
+
 	if (!local->use_chanctx)
 		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
 
@@ -748,6 +757,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
 	}
 
 	ieee80211_recalc_idle(local);
+
+	ieee80211_remove_wbrf(local, &ctx->conf.def);
 }
 
 static void ieee80211_free_chanctx(struct ieee80211_local *local,
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index b0372e76f373..f832de16073b 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1591,6 +1591,10 @@ struct ieee80211_local {
 
 	/* extended capabilities provided by mac80211 */
 	u8 ext_capa[8];
+
+#ifdef CONFIG_ACPI_WBRF
+	bool wbrf_supported;
+#endif
 };
 
 static inline struct ieee80211_sub_if_data *
@@ -2615,4 +2619,19 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
 				    u8 eht_cap_len,
 				    struct link_sta_info *link_sta);
+
+#ifdef CONFIG_ACPI_WBRF
+void ieee80211_check_wbrf_support(struct ieee80211_local *local);
+int ieee80211_add_wbrf(struct ieee80211_local *local,
+		       struct cfg80211_chan_def *chandef);
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef);
+#else
+static inline void ieee80211_check_wbrf_support(struct ieee80211_local *local) { }
+static inline int ieee80211_add_wbrf(struct ieee80211_local *local,
+				     struct cfg80211_chan_def *chandef) { return 0; }
+static inline void ieee80211_remove_wbrf(struct ieee80211_local *local,
+					 struct cfg80211_chan_def *chandef) { }
+#endif /* CONFIG_ACPI_WBRF */
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
index 000000000000..a96f74ef6584
--- /dev/null
+++ b/net/mac80211/wbrf.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Wifi Band Exclusion Interface
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
+	struct device *dev = local->hw.wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	if (!dev)
+		return;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev) {
+		dev_dbg(dev, "ACPI companion not found\n");
+		return;
+	}
+
+	local->wbrf_supported = wbrf_supported_producer(acpi_dev);
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
+static int wbrf_get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
+					struct wbrf_ranges_in *ranges_in)
+{
+	u64 start_freq1, end_freq1;
+	u64 start_freq2, end_freq2;
+	int bandwidth;
+
+	bandwidth = nl80211_chan_width_to_mhz(chandef->width);
+	if (bandwidth < 0)
+		return -EINVAL;
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
+
+	return 0;
+}
+
+int ieee80211_add_wbrf(struct ieee80211_local *local,
+		       struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = local->hw.wiphy->dev.parent;
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	if (!local->wbrf_supported)
+		return 0;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return ret;
+
+	return wbrf_add_exclusion(ACPI_COMPANION(dev), &ranges_in);
+}
+
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = local->hw.wiphy->dev.parent;
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	if (!local->wbrf_supported)
+		return;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return;
+
+	wbrf_remove_exclusion(ACPI_COMPANION(dev), &ranges_in);
+}
-- 
2.34.1

