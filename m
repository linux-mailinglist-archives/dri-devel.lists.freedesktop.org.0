Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E1732819
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857210E5AC;
	Fri, 16 Jun 2023 06:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1CD10E5A7;
 Fri, 16 Jun 2023 06:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLaxa5IQ6OyHMSPNSbD8ZwUa4w3mWxcjYeQ6UuSArACUSv4H4H/bitKLJuBRhMhWFNB9WD9JI4FS6oW5ypMIq3ez/zHnxmbI7k0HuDyuyW4GjkfyFNQbErOFYY71ZDXXLTCEGjpJzvdG7OF3vgdHhnSOH9GXccE9lmbgiVKaxxRT81YRLiAUQza1Wm7lG4oab2daIz5Bcu4X6HwJVCAs2FgaW3i1gM9JCxrZEG0y82a1lFBKNvIciKKpgxNGJkwFrJY/c+knw9AgrdYgT/6f/9a0oBZ1ZM33l5ls2uQxNqpLDQpps4Iqakaw8DqMGtDdcHFlQtpxmKWs2MFMaeA7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+6jQuEYLGrZR/ujVS8LA8GFLexxjeUFqmVpzlOBpTI=;
 b=B7oVpGbXB1cCCc+ZPFXwh62ypQwqDeUN4MQ7/mDE5fOXbinL5w+6Kq5ekJ/VWczGLY7dCOE5B7qq3ywFBiQvb/9VrD7k9FPVKknLEfFHPGJGbBvzBCrTIUiiwIta8C11mIFmSlHTzI0yi2xvQMfxc2giCTuhBYQ7x9AP1NkbdBGniPxt0na6AouqQwZzFH5NxGEaVF+3R4e7BL2RNnMTAafOCahhkkF77kZOoQhIw/ilkHkoNHzfGyMzS1RFVVFfHvIa88p9ggTZWiuGvFI8jNxcbbEuW3+FkTseJ4VTYNVi6nBC0x0/Nkx5pEDX1V/pLDHqchLv3edhu1OuGNY4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+6jQuEYLGrZR/ujVS8LA8GFLexxjeUFqmVpzlOBpTI=;
 b=RBNE1bInT9D3A36ONdYW4kSpLRb1p1zrGOMq3Nla3bOcyXRfbqRvXPE/cvFKGfXOTIxiUZOYrcKakQuS+9NMKO7Cre4V4iW+QRreQIppadb0LbkT2wCP25g3LELSHLiPkfIBFi6XtXrjeGIf7SzPg1jFdSxxGzETHFwBwQmzkYY=
Received: from BN8PR16CA0022.namprd16.prod.outlook.com (2603:10b6:408:4c::35)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 06:58:55 +0000
Received: from BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::8b) by BN8PR16CA0022.outlook.office365.com
 (2603:10b6:408:4c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Fri, 16 Jun 2023 06:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT106.mail.protection.outlook.com (10.13.177.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Fri, 16 Jun 2023 06:58:55 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 01:58:48 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V3 2/7] wifi: mac80211: Add support for ACPI WBRF
Date: Fri, 16 Jun 2023 14:57:52 +0800
Message-ID: <20230616065757.1054422-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616065757.1054422-1-evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT106:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c6e550-01ce-43b9-0d14-08db6e3726d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEaMSC/8/I8uHcec0RT74Imr5oyU1MTEhWvpgtSMjBMF1vxnANQ3IE+fHH/U688mzf1/t7qQhrkobHaD0wYrd/5ixOfgroOeU3kIlwOHyPIwYMf+rQdD/DzazyRZq9mScIElUGijvXFItwXZ+XPhJnzdhFG+6pcWj6ZlqBrWuoj20NSLEdNewBxQw8pOM9BiY6TaEAXhWvPyrb2Dlc+bgu+E0Vuiy3d7PHrROuD9p7BOMByWJdmmfgWwUKBjuBZY3wKe6SUqhTcUfbItE1mtQsGr3o/54mmYkUGb7VTf0mPxxOM8f9wLjd8RjU1pPrRJq/goLmIxAiEqM5cTpEh4hELevZBesEhCpH/3ytxq6v/fikNDV7CRSo8Tzdu8dHHwKT549ckQT1/RgQh5iRf79us7+A120nalf+M5ooSoIJErAwJm/ni/eaGhOceG+pTgd6f2C9p6/yLXPcBBvrEHsY4qYX5v9Ly+LXjD6EKMsZmDS4e3H1vB/IS1iILpHl7Ns0jCZNKxvzfgMT+XeoJTfNTm/bSO1f9xPDmtkl3XoorIbOeAYAJ40mrrNm3a4CXqhSDsjdkT8t/7JVhEwkhhap//eng6eZy5QzSsAjrUWnw8QBsvkuO/xEiQSu09OzDzuoTyXYIC7gEnfzGIbEFa9gr1JOAguZKrqR2gGiJ39RnkswoGZk+a+Bcufuing0+EP1qxZUrD3W/f8NcT0qerGwMeFh/ho+dClF8cOkSWpS+zd/XXF+f/d/f7qdSe+NFS2AFmb75VtOb7cDtjHHYoax0vg09GDjDWP876u3ZdI+U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(26005)(1076003)(186003)(426003)(336012)(16526019)(2616005)(36860700001)(40480700001)(83380400001)(47076005)(40460700003)(110136005)(478600001)(82310400005)(54906003)(356005)(921005)(86362001)(82740400003)(36756003)(4326008)(41300700001)(70586007)(70206006)(6636002)(5660300002)(316002)(2906002)(6666004)(81166007)(7416002)(8676002)(44832011)(8936002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:58:55.6563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6e550-01ce-43b9-0d14-08db6e3726d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490
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
--
v1->v2:
  - place the new added member(`wbrf_supported`) in
    ieee80211_local(Johannes)
  - handle chandefs change scenario properly(Johannes)
  - some minor fixes around code sharing and possible invalid input
    checks(Johannes)
---
 include/net/cfg80211.h     |   8 +++
 net/mac80211/Makefile      |   2 +
 net/mac80211/chan.c        |  11 +++
 net/mac80211/ieee80211_i.h |  19 +++++
 net/mac80211/main.c        |   2 +
 net/mac80211/wbrf.c        | 137 +++++++++++++++++++++++++++++++++++++
 net/wireless/chan.c        |   3 +-
 7 files changed, 181 insertions(+), 1 deletion(-)
 create mode 100644 net/mac80211/wbrf.c

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9e04f69712b1..c6dc337eafce 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -920,6 +920,14 @@ const struct cfg80211_chan_def *
 cfg80211_chandef_compatible(const struct cfg80211_chan_def *chandef1,
 			    const struct cfg80211_chan_def *chandef2);
 
+/**
+ * nl80211_chan_width_to_mhz - get the channel width in Mhz
+ * @chan_width: the channel width from &enum nl80211_chan_width
+ * Return: channel width in Mhz if the chan_width from &enum nl80211_chan_width
+ * is valid. -1 otherwise.
+ */
+int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width);
+
 /**
  * cfg80211_chandef_valid - check if a channel definition is valid
  * @chandef: the channel definition to check
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
index 000000000000..2e1a58cf4dbf
--- /dev/null
+++ b/net/mac80211/wbrf.c
@@ -0,0 +1,137 @@
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
+#define KHZ_TO_HZ(freq)		((freq) * 1000ULL)
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
+int ieee80211_add_wbrf(struct ieee80211_local *local,
+		       struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = local->hw.wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	if (!local->wbrf_supported)
+		return 0;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	return wbrf_add_exclusion_wlan(acpi_dev, chandef);
+}
+
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef)
+{
+	struct device *dev = local->hw.wiphy->dev.parent;
+	struct acpi_device *acpi_dev;
+
+	if (!local->wbrf_supported)
+		return;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return;
+
+	wbrf_remove_exclusion_wlan(acpi_dev, chandef);
+}
diff --git a/net/wireless/chan.c b/net/wireless/chan.c
index 0b7e81db383d..227db04eac42 100644
--- a/net/wireless/chan.c
+++ b/net/wireless/chan.c
@@ -141,7 +141,7 @@ static bool cfg80211_edmg_chandef_valid(const struct cfg80211_chan_def *chandef)
 	return true;
 }
 
-static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
+int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
 {
 	int mhz;
 
@@ -190,6 +190,7 @@ static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
 	}
 	return mhz;
 }
+EXPORT_SYMBOL(nl80211_chan_width_to_mhz);
 
 static int cfg80211_chandef_get_width(const struct cfg80211_chan_def *c)
 {
-- 
2.34.1

