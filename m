Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C47590E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8E510E44D;
	Wed, 19 Jul 2023 09:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EB010E438;
 Wed, 19 Jul 2023 09:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr3GRnIjecA5ZkCRS1clnePbbdRkCtTaVQmS0ixJNq3Wj27UufElnKftn1e+ihCO7jj1UBsSLXpIPEwbaDgyhW580ishR3zjjt5jkPxpDnLRNWF/YElE2DaC2yZPSbT4y0QTLdAnRWx0VQXzXbLzAuvNm5FHkfQ3QlvQQ7XNEchpjb2pXgOQz4YP3prZFcOGuqUBNi0MMnbB3uD9S0rWlmu4iB0dZdj484ye6YI6aHL4s4ozN+l2xnY9ZftHrahoGHRlayq6qhTGjSntD+15KbWQHE8q4zTnL0LbFSgi7YbsSWI+u4MON1iNMd+mvt6hQB25jhRYhrHm0Ub9AdlmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=c1Q7ToFbfZjBprJ6hIqirOeEh+bMZEoCjdUOEI5SBUyJlinpIBcROkIwnDLX9oQBPNpMlfDJPWJLy9PqHhvLbfgU+XGkLUoqUAc7MnhUhbgpn6QXovFhiwRQzNq3TomesETI+Tx4Iw0AUF7cYfjvzRC2PA6H2NUWuIdlGGacUYVyeUISlIJoXhz5Rgjp6fvxOGajvz5JSB4dtFTbEfG7dR2h4ocz89ZHI1xyFSCNTitNoqrtBfZ0rlqKJejEg1MvlG/OR5R88kMBP+oA0ryahtmdTAvgSYvf7h+XxtIJIMC6BK1VetjSh+ooEOctNrfKhfD9bgUv4cjxgkSGgg3+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=pvXT7HyrCiS2MaTiL95EYKwZ+h4t2kKC+59z69pSLo6VUC1aPpcFaUoLFHU41oRFc9koTkzyElzpUqBY+7g6CiLr0V9AeQzq8yg8V7Gg2EguCmuGHmj7fnFhEnVnHZisowgcNUTL2RRoj7eSG7+X/fVeQIuATGfd6tSIpwDqLj8=
Received: from DM6PR02CA0134.namprd02.prod.outlook.com (2603:10b6:5:1b4::36)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 09:02:11 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::32) by DM6PR02CA0134.outlook.office365.com
 (2603:10b6:5:1b4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24 via Frontend
 Transport; Wed, 19 Jul 2023 09:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Wed, 19 Jul 2023 09:02:10 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 04:02:01 -0500
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
Subject: [PATCH V7 3/9] cfg80211: expose nl80211_chan_width_to_mhz for wide
 sharing
Date: Wed, 19 Jul 2023 17:00:14 +0800
Message-ID: <20230719090020.2716892-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719090020.2716892-1-evan.quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT008:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e64922-df82-4643-0409-08db8836d65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XkqYWIHyvW+yhVC9sD+wM6uRybl6on0CtwZxllqw1pLj2+/Ih1aey9A39IT/bIaILEDSqt7TnhuZKn2UO4RvWb3w9ebgYXL5OUK93Gk2VpLIR7g6Juvs7njz7GtaJ2+C043rtkpZug834uV8yDszbLpqz5uqpqsKFO40H23qe3Z+e4i0TlThwAtNw1voUJ5nLpgapGcRG1o4y7IQmg/JkGsMEJfOkxBNog4bR54/tsAHetWSp5VXz0t4czIW3q8IFRcb2vdX6PCwYdZwUiXjjfZ3EZJQaLF5SaGpQ9VfKu2fWBeAqsvZwnpuoIPzeS+lPqpB0CTkAdEiXfHMB3UEO849HkPwVNG+LJINIXPLe4eP9xVdFNvOPq+sozsydrvSv3aAVbwpNWc49eD2HoHGUedl+KTMvVrWirD1K4QMFq797dM3TMitBgsoNTBsiSelqQdJT1DMLdp4SGg3AfLThAKVujROi3uE+4xjaZrNuFk3Pt2JJ9/z5Esg3cG1RuMX7sL491+6ov2swLhCwT+gH+j1qnCwBJCq/dtVxNAmzSQs9NcCKil0GhO7BF0C0uAu9HX+Hh2PLvcqRgW0uFzHdzWR8+e7Jz0VnHw1onOoxoZMtcGEfvXHqs9Zq/+msxGbaXZ9etohLw7GjP76mqA1be9vPWyO9J2Q7+OrGNpljeSNNPalqlx+/bgUqMy28kVSkdLHQxwiSEp9moC/ZABshWwg7LD7pvmE/xiX3HegSrI1yDBZOFkLwjE1Si7uQW7GP3FFsxLovd4h9h7REWb12ql/p2Gjwo4F93fQBwKxeN2ZLFYSYR/Kn5gJZpvc2WB7yBA87w+V/RXlOPp+b3Y+8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(2906002)(110136005)(478600001)(921005)(356005)(186003)(81166007)(426003)(82740400003)(336012)(47076005)(16526019)(2616005)(83380400001)(5660300002)(1076003)(36860700001)(26005)(40480700001)(40460700003)(86362001)(36756003)(8676002)(4326008)(44832011)(7416002)(7696005)(54906003)(6666004)(316002)(70586007)(8936002)(70206006)(41300700001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:02:10.8216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e64922-df82-4643-0409-08db8836d65e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
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

The newly added WBRF feature needs this interface for channel
width calculation.

Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 include/net/cfg80211.h | 8 ++++++++
 net/wireless/chan.c    | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

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

