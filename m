Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01FC74D026
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F810E232;
	Mon, 10 Jul 2023 08:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6210E231;
 Mon, 10 Jul 2023 08:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA/b0xbuBiw0Fn3CZbPWz9GMgzR4y4jVqW4wysdzeZ/RpjTyYtZUIHdu2go09DgHAGkqKxBw6/418Fj/CJAdKZIAlwceMmhmXSU28AVZscuAFZ5P48oIa0q1VYxh/AppzB+O9Y52hvD6xvSs8S0ZS3Szo9Evl8dYBzv8BqSGTfEI2rGUnbZ4Hk/W6tGGgN+m+Ygn1DtZaSkO+xu4BIt2uVnJhF2axM7seXfCYX9apRr1gDg/wNgOj/MxcPg8yOiz7FeCmLUjZ2lipjSJqzQe3iKlIWowWJZu3PNHmm/SHonzjdxaqvsLAM3FHQCm6RMCyCMeNCcTTOKHVU423iiLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=QcyuRM1scEM1Fni4a+P4z3b/Svu3cqw/Wgn5JNlfQRH+3VGa5Y0u8KvsUjqXep6e4doSqtz7FX9ehgXO7BD9Ih53HsR+Ijhjskb11m4F68QpotZD5giTMdK54O9YivaspDSo+bMiTIV5k2u8pnMj9+g+bhZ48ypPOZteuXqmwnh0H2Wb66qSnLU4qZN4aWVUNqtY+U7FoYqb5PiPjdIMTFwKiZZe+sN4d2iGtGPRxnpQiPA9h8df9vLaTJH94IC/pZuQkYl3sJLV03hi6D2YQA4rlv4kzMfpfz/0Cb8zn8mOs4Hn0s8o2wRJ9M6FeJIPlVi8WmDLED318CLYWAK3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=0OLXTQmXsdYdi4B7TFsrJWO6NCuuRt6kaCip5cXeEQtd5cLNn0xZvTBFl5ghx3aXieR+54n1f2v+Mhn5Wl4p2azedVzgDtUWa3qi5LgqKSiQatkhto6CPaSxDRPYRvGJ4ssBvjBp0i5ShtL5oLFgrRx3guCqfkMHktSjz3ppENM=
Received: from MW4PR04CA0186.namprd04.prod.outlook.com (2603:10b6:303:86::11)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:38:52 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::1c) by MW4PR04CA0186.outlook.office365.com
 (2603:10b6:303:86::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 08:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:38:52 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:38:42 -0500
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
Subject: [PATCH V6 3/9] cfg80211: expose nl80211_chan_width_to_mhz for wide
 sharing
Date: Mon, 10 Jul 2023 16:36:35 +0800
Message-ID: <20230710083641.2132264-4-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a6e668-1e33-441a-84fe-08db812116f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zIjSeS22b8aeBlhBP+2yKjV3pMs8RhwpJFO7tlMvHwFCY1r/SBd0aNV1U9QnRBl1I+OCsNQwJ6TP4eZhS5p7rA+fCKC7S0ZCaKKeQSQplGOAN5XP3bZcuARogIYnV8SpKwJXrm4LRi+7pteZCUNPKzekwTOLXSeztbL14YGlk4NGEqV2diFn/OqCTGM/bvbTDyUi097tH/QaAYzY+Zim1RHCf6A+0Ak+0rka60qc5HG9cO8nNWAFYA7EuwmLD4bn8vNpA3k65GiEVR6oKGAe/U0+ThZL/B7EuEHmzWRgqPUlloG/IxdXSQdJWAyxzld/uIa/TeGDPhx6RPRAcDmanVxnVwhriwfInziGccUj43cSmu/pwvnoHSTYdYQg8+aAQvCkTBkS/louKCIfzCJJLLgJKruHYzIWp3SP3Wui3migZGoosOddOltbL6jVmuCAn0JsEahspzrsEhqIWmLefIgtxwY9roMVoL/t53xUlSKG+IyGyvi/AkNgnWL1+ML6Gcyfe4F7++tM+mASUKzyQzUh7XW62+D0KEDb9afmR+mIdRMHvNo1rl1taBi9KV/PJJaZjsvNPFxgFkSR1pf01/bWLLH9oYDDUafzwLF4zH46neT+JQ7ileHcOufjPRTMLW6Q0l/SstFcgR669SE9f1ju+pppG0B5LeRZplapV9/oNUmWSRcUQCAfaIeMtoeZbN+V4gWKGhbGfVunMcsZclNMuyofIbRSyrRuFkh0kjHUKWELuNgoFZAYbglgElodA11jeEwOR1pDFj7IiAuDzxN4b3a5s0yXkSbyu1ZMK5FGuQ2CNv2UXh537nyTxi8EyiVBrYdjx13klGklS7QNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6666004)(7696005)(478600001)(110136005)(54906003)(36860700001)(47076005)(426003)(83380400001)(36756003)(86362001)(40460700003)(40480700001)(2616005)(2906002)(70206006)(82310400005)(70586007)(16526019)(1076003)(26005)(186003)(336012)(81166007)(82740400003)(921005)(356005)(8676002)(4326008)(316002)(41300700001)(5660300002)(8936002)(44832011)(7416002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:38:52.0628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a6e668-1e33-441a-84fe-08db812116f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992
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

