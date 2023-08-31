Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBE78E642
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC1610E58F;
	Thu, 31 Aug 2023 06:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97A710E58B;
 Thu, 31 Aug 2023 06:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibYUEShpAA9SU50H3RoAGZbSnB8XXZLCVQb3OPDsR+i+DcLfKdkC3zFiUIqI3UlvJ4smH9PQr8GNdW409GLbWfUgfgISQgiWujDBQUD9/mgaODxGvU8cDBVBDLxBHZgcauuzp06MwF/foi9RFFhX0uTu/ainTCSwdZdGTVlzmykQl5SGRU7nGYiDi0wV2C6+IsSRIHs4kHwtCSRYXxSoYJY2FR1MNzDqDGex0s1DGubRek8fyYFRqAwHddjQiokx/MGMymmBzvhWHH1ApbopfOx+mTGZlzNn/I2oH2oUu5xK1++3IVvjMyRgRFIJHfkKaSPqn9BiNadRwFh3Z8XUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdVgZLvvokRkEpz6Vd9hjJbKFXH8b+svFNiq5wM+suc=;
 b=oN2afk8RJEjimDZir5mP+PGTZ0yJEHrLUB2hx7L8Eir5uF1N3sxdbuf+6DAFQ6p/NSD88QnwnIYUc9RIIkHi4CEwOqxqW2+RwNZKTk9jVen3Spg2PqVHvj2AH1GQnRzZFMzNJntsvykZ95hwft84kLXtgWGH8BfP6+HpwM1xPh/I9t3wciFEOOcIWJ4IeyRYYdU8ztBcEwUN1NmNcwwmkWgZjV8xBrkR6n9+yzmbIlkGUDToGK/UymmkSEMpR66jtSKxGfcL47+jvf0vEGDxFVQK9z+Qc3neOh/i1ae0rPK0xWJyVrciYYqowIMMhcZUWdfBfGcDcm4OED6nM59png==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdVgZLvvokRkEpz6Vd9hjJbKFXH8b+svFNiq5wM+suc=;
 b=Jnyw3OIMAEl+tLRDwZTKlyZ4dJOrBzjRhmlwT1LkMTnfl7IXBfHclCUIaLaGm9b0la/CCcrNtLeBYvrXwNKUGyEOiRgRtJV/cD+BJQl9Ys6eAiikaFrJLQAJrIDMvXabQtzFi+KX+gCXbK0St2IEd1trsFOutpKJlhHEB2BQR58=
Received: from MW2PR2101CA0010.namprd21.prod.outlook.com (2603:10b6:302:1::23)
 by DS0PR12MB8767.namprd12.prod.outlook.com (2603:10b6:8:14f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 06:21:17 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::34) by MW2PR2101CA0010.outlook.office365.com
 (2603:10b6:302:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.9 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:17 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:21:12 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 3/8] wifi: mac80211: Add support for WBRF features
Date: Thu, 31 Aug 2023 14:20:26 +0800
Message-ID: <20230831062031.1014799-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831062031.1014799-1-evan.quan@amd.com>
References: <20230831062031.1014799-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DS0PR12MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 48917443-7e4a-46b9-7a89-08dba9ea7c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YknQZyBn/116k4pQNUIx+sUzVdNMqvufkbo65h8SJpPtXSJdC6kX4goZSeU4RBcQkKjJDQqf/+SZXgvAFuy8HIFgiQg8JyiQRlZJYn3e6kL2ZlEttfbLLpsiMeaCoNnQoJH8+31C5jfsqNoSYnNNuleuYm/zVEg+4Sxl2fY3/QvqPn8AWpPfoBSFXpKH1PQMgn3xbEyVDObACuREyhb8SJRoJxKSXf8umBFZ8mRRAkwVmYwGrqlhSsmC8Qq2gRf82qQ6zyt8Z91HB0MPNWijCCzEXT0mOMN2cIWBNp5fMt6quD0r23DtYa8ann7x5CuGI0DWPXKp0zpGbLixKKvuU5O2EAoXuCtdAoKisQTz0Cq6/llavSowxwxgPMRBPQbWBqoEJKNM/DgKYmzCQtO1365DPUW4p+TiI0XueR3sfRqxylCDXwqaht9BmKsqgOjzyzEM6mLpkPsF5JJspxuosbSVhj6ILDSaVc+ToOAjrT8suPZW35upc3H+rux0H9scxh1GmITxe1H3HYR6EQSgZK6CsnY9ruFSXtZmGAjlUUxKxHpJlEB40oNn1Ag611Y6c+hcM0wrWhMlwCmlfD/12CPTR3PEgiTh+6a0EHJEAjjqsL2RAE/oPCTSSaeUjSh0J2ayklh7PjI0BdgL1SGih6dgXGp1xtTPJqmzxTvnlZH/DCXD+a3Q41twZrTMj2SWzWPky699ymO4jHSkmZdSzOzmJegiK+8aVRhfst8EKzNwlJecIYH12VwreFS9uhTZhXqySJD4Vhua0PuW7ALht6R25GkeVZ+BJyzITl6/YYg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(7696005)(6666004)(478600001)(83380400001)(1076003)(2616005)(336012)(426003)(26005)(16526019)(2906002)(7416002)(44832011)(6636002)(316002)(54906003)(41300700001)(70206006)(70586007)(110136005)(5660300002)(4326008)(8676002)(8936002)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(86362001)(81166007)(921005)(356005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:17.4388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48917443-7e4a-46b9-7a89-08dba9ea7c4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8767
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

To support the WBRF mechanism, Wifi adapters utilized in the system must
register the frequencies in use(or unregister those frequencies no longer
used) via the dedicated calls. So that, other drivers responding to the
frequencies can take proper actions to mitigate possible interference.

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
v9->v10:
  - get ranges_in->num_of_ranges set and passed in(Johannes)
---
 include/linux/ieee80211.h  |   1 +
 net/mac80211/Makefile      |   2 +
 net/mac80211/chan.c        |   9 ++++
 net/mac80211/ieee80211_i.h |   9 ++++
 net/mac80211/main.c        |   2 +
 net/mac80211/wbrf.c        | 105 +++++++++++++++++++++++++++++++++++++
 6 files changed, 128 insertions(+)
 create mode 100644 net/mac80211/wbrf.c

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 4b998090898e..f995d06da87f 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -4335,6 +4335,7 @@ static inline int ieee80211_get_tdls_action(struct sk_buff *skb, u32 hdr_size)
 /* convert frequencies */
 #define MHZ_TO_KHZ(freq) ((freq) * 1000)
 #define KHZ_TO_MHZ(freq) ((freq) / 1000)
+#define KHZ_TO_HZ(freq)  ((freq) * 1000)
 #define PR_KHZ(f) KHZ_TO_MHZ(f), f % 1000
 #define KHZ_F "%d.%03d"
 
diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
index b8de44da1fb8..d46c36f55fd3 100644
--- a/net/mac80211/Makefile
+++ b/net/mac80211/Makefile
@@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
 
 mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
 
+mac80211-y += wbrf.o
+
 ccflags-y += -DDEBUG
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 68952752b599..458469c224ae 100644
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
index 91633a0b723e..719f2c892132 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1600,6 +1600,8 @@ struct ieee80211_local {
 
 	/* extended capabilities provided by mac80211 */
 	u8 ext_capa[8];
+
+	bool wbrf_supported;
 };
 
 static inline struct ieee80211_sub_if_data *
@@ -2638,4 +2640,11 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
 				    u8 eht_cap_len,
 				    struct link_sta_info *link_sta);
+
+void ieee80211_check_wbrf_support(struct ieee80211_local *local);
+void ieee80211_add_wbrf(struct ieee80211_local *local,
+			struct cfg80211_chan_def *chandef);
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef);
+
 #endif /* IEEE80211_I_H */
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 24315d7b3126..b20bdaac84db 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1396,6 +1396,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	debugfs_hw_add(local);
 	rate_control_add_debugfs(local);
 
+	ieee80211_check_wbrf_support(local);
+
 	rtnl_lock();
 	wiphy_lock(hw->wiphy);
 
diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
new file mode 100644
index 000000000000..63978c7d2bcb
--- /dev/null
+++ b/net/mac80211/wbrf.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wifi Band Exclusion Interface for WWAN
+ * Copyright (C) 2023 Advanced Micro Devices
+ *
+ */
+
+#include <linux/acpi_amd_wbrf.h>
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
+	local->wbrf_supported = acpi_amd_wbrf_supported_producer(dev);
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
+static void get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
+				    struct wbrf_ranges_in_out *ranges_in)
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
+	ranges_in->num_of_ranges = 1;
+
+	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
+		get_chan_freq_boundary(chandef->center_freq2,
+				       bandwidth,
+				       &start_freq2,
+				       &end_freq2);
+
+		ranges_in->band_list[1].start = start_freq2;
+		ranges_in->band_list[1].end = end_freq2;
+		ranges_in->num_of_ranges++;
+	}
+}
+
+void ieee80211_add_wbrf(struct ieee80211_local *local,
+			struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in_out ranges_in = {0};
+	struct device *dev;
+
+	if (!local->wbrf_supported)
+		return;
+
+	dev = local->hw.wiphy->dev.parent;
+
+	get_ranges_from_chandef(chandef, &ranges_in);
+
+	acpi_amd_wbrf_add_exclusion(dev, &ranges_in);
+}
+
+void ieee80211_remove_wbrf(struct ieee80211_local *local,
+			   struct cfg80211_chan_def *chandef)
+{
+	struct wbrf_ranges_in_out ranges_in = {0};
+	struct device *dev;
+
+	if (!local->wbrf_supported)
+		return;
+
+	dev = local->hw.wiphy->dev.parent;
+
+	get_ranges_from_chandef(chandef, &ranges_in);
+
+	acpi_amd_wbrf_remove_exclusion(dev, &ranges_in);
+}
-- 
2.34.1

