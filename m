Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB978E63F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD98B10E589;
	Thu, 31 Aug 2023 06:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7516D10E584;
 Thu, 31 Aug 2023 06:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZzv+Q8zgTMWy2NI4jQvnprIrecJoH2vQ0PywNqsfB0yphG0Pt5JdXSpRGidAC6bdppavNDASZZ5DxXn3fgBtUbuhStFOJldJb9IfuDE3+du+Bmg+JojVZj2P7+WWzFeLv3Z29WsDF8ycn2Y4fx6F1Cdu7GDt6lycQiJKKmuRX1ZXRbY0nTBGRcsrqRm0j3ajGsmAV/MDXwxqGDq68/jeHNZeke4TPoAqlRD8M5dCUiDbV0BxEpm1MlvxC7wHDxDhp/5mAZnNDmdbI5CKkTEXka2tfNY6JV32JTynC+tFNqojLS82m2DdAVxV6aQ9GMqQNZQd63N5pOb1H7fhN2PSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu7ufWBfNSNsnpJhj/ftM09iZry5yoIJIMA8q53g9Nk=;
 b=a5C5skcgzUsYUxIK3FDLFOgQMmM+UPy0cd8H+L9awPbr0wM379Q59WWSjuFvwabCJ7nJo69yTZgAQ/0PIYG7NfgA5eoxnXewgr8sOflPYSeuIItBvw+JgNaH9HwPfz7/SUWCTlZ9+5F+Vcd12MOC5GabWmYYZygUgW6rHCrR3AENlgRkb5rWC5zd3f6whSS6zGeasdJatXvX3LmNXsHLcOxFVifE7Xy/cATOD6G3hWKEkgsWQHWtRymlWNy9lR6LWQEevFBRoNL4/G9lQ50zeTIpuMu5cXShXaKa+iWPfwqwufMwU/NWmXOeL+iTF1j0MzXthUAtnSl9WhY2Jjda3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu7ufWBfNSNsnpJhj/ftM09iZry5yoIJIMA8q53g9Nk=;
 b=3NCNaBn3S05eMtVKqlEFvATZ4mBuDcLuTSFowD0nQzLbcK/WyAc6zFh6HU+WBFzMXQoBNi0WVQNHZqrxMLxCY1Cci9buOIVSRf93uVzZL+pT4s3+Ur3CzL6HVlVeVzzQxOFS9Z/UxIa8rCZLYafMaHzxGDuh3YuB6+X6NSQh6tk=
Received: from MW2PR2101CA0017.namprd21.prod.outlook.com (2603:10b6:302:1::30)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Thu, 31 Aug
 2023 06:21:12 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::e) by MW2PR2101CA0017.outlook.office365.com
 (2603:10b6:302:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.12 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:12 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:21:07 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 2/8] cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
Date: Thu, 31 Aug 2023 14:20:25 +0800
Message-ID: <20230831062031.1014799-3-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: d27f5a3e-762a-4099-7553-08dba9ea795e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/vRdcxyTZGQwZ//vhg5CVR/gRb6meTpToNNuGtHFliDxmsCvubEOFwpACm/kZqRpebHNRHWDVeKBYUUB2PqmAEvLbkZnYKoxpe6X8ThiqX2QWSQUsqPNiSic/U5IH0PrA/kNoFQ11yC60GtWsprLOKm3+MZhQ2y1AiFxntq6CUAh7Sfu7LbGHQYzafVrvHOEEPt13pYPzsn5Y3zMNQ+rbs9fBLlVNLdL+ec6xYmPgljvMQPJ0Jza2r6FzaHPhTPZdKaZlcn3Y7D9T0uFQdNdByXjqUiE4KWT+2HilRoryAe2iUzkY3BFXZqFpln1EXBLfUzPh50GE4hff96lB8m/Mdy1kIP5W6yi5e06bgwqvTEkFG/dBUJeNxKjT5etd7eWh1SQN6iWaeh3BO54ftifAKGxk47wj/7km2PsPLdQ8OAmpllKivb91lQ4uhnjyj0guv0yvnQbBV/7q5nYEERrXDhC5HT43XZlhj39JucHRRdHQpjvDM2zzKXf0YSPAF8uky1izypGs43k/tTQaEcGNQ/mhJKgiKs36QSIWaElJ8fWvNdSgi3y+UL5+qsNNUjIqrXjX+zcxQQsmZ/O6n2McHk78u3dq50Vw49blg90p2+cMKBwWauBYbNTBTu++MuWEdT73Mbv4rUevGDP9sdHpC4IkgJyZuy75yLtLr5lqK51DXbMKNGBeNXy+EfHdIh7tRnWgI1p1seOoaxbDflu5qQJa2wB+aWcIM8fjO9BdN10f18x/penZ0AzlPpQyk4JSitkOHfY5XjrY5719px/2262XIrBgL3C94uzKX0sWw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(316002)(6636002)(8676002)(4326008)(7416002)(426003)(336012)(2616005)(2906002)(47076005)(86362001)(44832011)(16526019)(5660300002)(83380400001)(36756003)(1076003)(26005)(36860700001)(40480700001)(8936002)(6666004)(82740400003)(921005)(81166007)(356005)(7696005)(54906003)(478600001)(110136005)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:12.5169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27f5a3e-762a-4099-7553-08dba9ea795e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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
--
v8->v9:
  - correct typo(Mhz -> MHz) (Johnson)
---
 include/net/cfg80211.h | 8 ++++++++
 net/wireless/chan.c    | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 7c7d03aa9d06..8c2a9b748621 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -920,6 +920,14 @@ const struct cfg80211_chan_def *
 cfg80211_chandef_compatible(const struct cfg80211_chan_def *chandef1,
 			    const struct cfg80211_chan_def *chandef2);
 
+/**
+ * nl80211_chan_width_to_mhz - get the channel width in MHz
+ * @chan_width: the channel width from &enum nl80211_chan_width
+ * Return: channel width in MHz if the chan_width from &enum nl80211_chan_width
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

