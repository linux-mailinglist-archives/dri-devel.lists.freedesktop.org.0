Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639727290FD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769F310E644;
	Fri,  9 Jun 2023 07:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF2910E642;
 Fri,  9 Jun 2023 07:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdOOd+z/QkdmNC/if2NLFBQrbYU1TUJbXaBaGDOYCSWFGKuZhgqwsLcwHTWxPn+YzO96QhcKpuviP8wqaSbBduKD9UA1dPOzZzBhzBG4rC7RWHugzrEjtPXjp7GDo2IDLDJ52vyPP7O1fJOp/DpkuGZn9ol9a5xtBzm8EsIwlI/AFet/DE+DKEg5C+J3dutjDvz0Rtfuy7UoQQSBpnvFnXiV2BaDPtQcwC10bLB6/K92FR7ICBL3tUSXM9+btRqtupUAEonaE0ewAoo6OARWe3qICg2SN2Ds2G00DiTIM2xFOhy3LjSPRgXX4QFNWalzxrtWaoLrgvlvkabfGEJI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eIlIkPuJFg/F/2KgUp3XTFrZn/NNUZVcwFmqOo0O5o=;
 b=ivAKvnWM6QuJmTGQ7gYjfKclbNUIaug6oZuFu+O4PCaOKR1rPsoXYbzdBjpCJXeMWWZv3j8VBL8+t6WVYIMoMIi3ZnXdpzERVwbdNVbe0TT85jVuZSTt7DFkog/0375MUQAv9VxxT+lRX3GPrXhREqF/DHS0JmFNp61ZsGBFuZyb7H9jKUduUzoHDgSEBRzVj4zys9P2oa9JgTcxVvCnxkREe7Jg2KawXQZGeWpKgFg0QAsIbnlq9+T7hzS4d3Zgp5/sehDeS11cP3bMg4kKiZF7kgbmMq02I3OZv3fAltwlcbFRiU6tDEVg7gJsXtGIuMbmqDTONbA6I4uCYbF+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eIlIkPuJFg/F/2KgUp3XTFrZn/NNUZVcwFmqOo0O5o=;
 b=wGfzQPmJjDk3SPAIh0o20n4mwMRmXybHGgmoEQk+AxvAN7UJcoUx5PM6xmZN5TNzZohWj+J9r354MdgIVZh1HAVOSoWk9wB3cnPfJMVJ7VRtEfSeFvO+NBOaY7EgOlVnUCS21oqgiekC4xc6spKtVla5GlRsMlTuYdI7/yUziOQ=
Received: from SN1PR12CA0043.namprd12.prod.outlook.com (2603:10b6:802:20::14)
 by PH0PR12MB7984.namprd12.prod.outlook.com (2603:10b6:510:26f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 07:29:27 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::16) by SN1PR12CA0043.outlook.office365.com
 (2603:10b6:802:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 07:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Fri, 9 Jun 2023 07:29:27 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 02:29:21 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V2 2/7] wifi: mac80211: Add support for ACPI WBRF
Date: Fri, 9 Jun 2023 15:28:41 +0800
Message-ID: <20230609072846.1552238-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609072846.1552238-1-evan.quan@amd.com>
References: <20230609072846.1552238-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|PH0PR12MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be77f29-63f4-4a8b-9640-08db68bb41de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMX3u2hYnQevk6GM/8bVn41z6zirJuN+t+mqvtg2eZMTIcQaIQUEcy5cGeKIJBL9aiJUU+WtzGu7WD8MyAXNhPvwdM/klSlXg47TtnAMfaBR8qpIESxPZ7yh6TXfytmVbAbaOELptKUCEVvufE0rRLH3HebPHeuGIQZXxn0GuMrLZWiYZD54/bnkWJeov+jT1XPM7+ZkMJ1tnk/GB2FI0mnNXJADMDKZKSaCi0mLL0+2KyRynolEcWWFbfgpLAdgoJgq2Xca/GesiUpaBLzFAtiNBQ45MsY6CuMyayMth3C0Ft35vcR35PHQvwhwX+FuBHGpOFVgDMPJbbHckbdM+7NyUMUGNZLa2C2eCF2UfP992alY603Wb1PlvUwSkQEL58FpfNoMTZLLWgJjGAkP7E5mtFOXY6QrEhQmYkcBBV7U/GI6sgE0FRpawfqbIcL2UF7/DAW5iB5NepH7K/m79xcnBwMUULc3mKqmwm/ugH1AU5s/IUluOw2lbI8iRb5+kd4miLtE1xLxMMe/4IdLHrFc4B0ogv+D4OXas1qJX8QKUWrb2IIz1FIiORLsxbcRsu7wAb2ZVXkCNMprp8NJBwiApKoOfGJgvAMpsj90m2sMGhPLJ5O7GfFyf1aXmpuEohv8eRT/PExJme8AVOgYINWIEUj+DENq8F1eb1VJNjYsR7EwyLQlCz1xOyn8Ix5gCivs42gGp2ArZ1QTck97OUs/AynRLSIi/ZzpM2sSP0by+egICMW0zcP3Vfc/lV6TBqtZPOA/7UUcD4dstnBkM93Aluf+lHjb7OPzDNlLjEo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(478600001)(316002)(44832011)(7416002)(110136005)(54906003)(921005)(356005)(81166007)(82740400003)(5660300002)(6636002)(70586007)(4326008)(8936002)(70206006)(8676002)(6666004)(82310400005)(7696005)(40460700003)(2906002)(336012)(86362001)(2616005)(36756003)(186003)(16526019)(26005)(40480700001)(36860700001)(426003)(1076003)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:29:27.5711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be77f29-63f4-4a8b-9640-08db68bb41de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7984
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

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
---
 include/net/cfg80211.h |  18 ++++
 net/mac80211/Makefile  |   2 +
 net/mac80211/chan.c    |   6 ++
 net/mac80211/main.c    |   2 +
 net/mac80211/wbrf.c    | 183 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 211 insertions(+)
 create mode 100644 net/mac80211/wbrf.c

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9e04f69712b1..d995ba085692 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5551,6 +5551,10 @@ struct wiphy {
 
 	u16 hw_timestamp_max_peers;
 
+#ifdef CONFIG_ACPI_WBRF
+	bool wbrf_supported;
+#endif
+
 	char priv[] __aligned(NETDEV_ALIGN);
 };
 
@@ -9067,4 +9071,18 @@ static inline int cfg80211_color_change_notify(struct net_device *dev)
 bool cfg80211_valid_disable_subchannel_bitmap(u16 *bitmap,
 					      const struct cfg80211_chan_def *chandef);
 
+#ifdef CONFIG_ACPI_WBRF
+void ieee80211_check_wbrf_support(struct wiphy *wiphy);
+int ieee80211_add_wbrf(struct wiphy *wiphy,
+		       struct cfg80211_chan_def *chandef);
+void ieee80211_remove_wbrf(struct wiphy *wiphy,
+			   struct cfg80211_chan_def *chandef);
+#else
+static inline void ieee80211_check_wbrf_support(struct wiphy *wiphy) { }
+static inline int ieee80211_add_wbrf(struct wiphy *wiphy,
+				     struct cfg80211_chan_def *chandef) { return 0; }
+static inline void ieee80211_remove_wbrf(struct wiphy *wiphy,
+					 struct cfg80211_chan_def *chandef) { }
+#endif /* CONFIG_ACPI_WBRF */
+
 #endif /* __NET_CFG80211_H */
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
index 77c90ed8f5d7..d26a3f622e50 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -668,6 +668,10 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
 	lockdep_assert_held(&local->mtx);
 	lockdep_assert_held(&local->chanctx_mtx);
 
+	err = ieee80211_add_wbrf(local->hw.wiphy, &ctx->conf.def);
+	if (err)
+		return err;
+
 	if (!local->use_chanctx)
 		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
 
@@ -748,6 +752,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
 	}
 
 	ieee80211_recalc_idle(local);
+
+	ieee80211_remove_wbrf(local->hw.wiphy, &ctx->conf.def);
 }
 
 static void ieee80211_free_chanctx(struct ieee80211_local *local,
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 55cdfaef0f5d..539f9cbdda4f 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1395,6 +1395,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	debugfs_hw_add(local);
 	rate_control_add_debugfs(local);
 
+	ieee80211_check_wbrf_support(local->hw.wiphy);
+
 	rtnl_lock();
 	wiphy_lock(hw->wiphy);
 
diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
new file mode 100644
index 000000000000..91712a927dd7
--- /dev/null
+++ b/net/mac80211/wbrf.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Wifi Band Exclusion Interface
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/wbrf.h>
+#include <net/cfg80211.h>
+
+#define KHZ_TO_HZ(freq)		((freq) * 1000ULL)
+
+void ieee80211_check_wbrf_support(struct wiphy *wiphy)
+{
+	struct device *dev = wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev) {
+		dev_dbg(dev, "ACPI companion not found\n");
+		return;
+	}
+
+	wiphy->wbrf_supported = wbrf_supported_producer(acpi_dev);
+	dev_dbg(dev, "WBRF is %s supported\n",
+		wiphy->wbrf_supported ? "" : "not");
+}
+
+static int chan_width_to_mhz(enum nl80211_chan_width chan_width)
+{
+	int mhz;
+
+	switch (chan_width) {
+	case NL80211_CHAN_WIDTH_1:
+		mhz = 1;
+		break;
+	case NL80211_CHAN_WIDTH_2:
+		mhz = 2;
+		break;
+	case NL80211_CHAN_WIDTH_4:
+		mhz = 4;
+		break;
+	case NL80211_CHAN_WIDTH_8:
+		mhz = 8;
+		break;
+	case NL80211_CHAN_WIDTH_16:
+		mhz = 16;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+		mhz = 5;
+		break;
+	case NL80211_CHAN_WIDTH_10:
+		mhz = 10;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		mhz = 20;
+		break;
+	case NL80211_CHAN_WIDTH_40:
+		mhz = 40;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_80:
+		mhz = 80;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		mhz = 160;
+		break;
+	case NL80211_CHAN_WIDTH_320:
+		mhz = 320;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+	return mhz;
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
+	bandwidth = chan_width_to_mhz(chandef->width);
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
+static int wbrf_add_exclusion_wlan(struct acpi_device *adev,
+				   struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return ret;
+
+	return wbrf_add_exclusion(adev, &ranges_in);
+}
+
+static int wbrf_remove_exclusion_wlan(struct acpi_device *adev,
+				      struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in ranges_in = {0};
+	int ret;
+
+	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
+	if (ret)
+		return ret;
+
+	return wbrf_remove_exclusion(adev, &ranges_in);
+}
+
+int ieee80211_add_wbrf(struct wiphy *wiphy,
+		       struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	if (!wiphy->wbrf_supported)
+		return 0;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	return wbrf_add_exclusion_wlan(acpi_dev, chandef);
+}
+
+void ieee80211_remove_wbrf(struct wiphy *wiphy,
+			   struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	if (!wiphy->wbrf_supported)
+		return;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return;
+
+	wbrf_remove_exclusion_wlan(acpi_dev, chandef);
+}
-- 
2.34.1

