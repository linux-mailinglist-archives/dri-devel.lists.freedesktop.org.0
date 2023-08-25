Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0A788253
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0EC10E633;
	Fri, 25 Aug 2023 08:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695B110E63F;
 Fri, 25 Aug 2023 08:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPARJVD97YlOcfWfvtmM9gbMimpL7ZGG4Cgr5072cqetScHWKmRgoEYr9m9Iu2OM5IfNP9Qj5Yr5I0zP+VPzUJd2dECRT2ThC4589DAcz/DFmd0EUvWyWR4Q5FlGyyszEVIh/9AEu0ax8cLUi0xdNkDanC0DDH82szS1YN1/QTcBs3uVOEhT6V++Z2pxOZihDSA9YwGXzDZpwiKHxzs8Hlh0pA6IbbE1fK5pEfFy9NyB8KRhEqLnjXuVWmFE3RemnRDQauGkNv8ckcg3rSl8Bk1BxIHaogH7AzTw6H6DSnm8VgwSIKdFQXGOdrxZ/0VeULSBD5xAbQ3v3uHT5QxILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu7ufWBfNSNsnpJhj/ftM09iZry5yoIJIMA8q53g9Nk=;
 b=BjWYgWBm62YaOA60F92mTgCBhSBV/SEOKrCU9IlcVGULVh5+XeZmRy2o+5JiWkd/aYdm+F7GAij8HZ/Aj/XCYYmtkdENX3z/Dkoz8g2kJr2HXmYPkwe3IYAdyJ9xA8W/u0lV2PbZVIZRyQl0w+vsZ0ql53q9UMHTtP3k/qs6boM59+77qkeivNdVZV/lPyWw9vOScovyTW5dQF5wD3kh3cjeaAtw6Z8CjPbn+XkxlNo19b6dJpjup4N1xjpTBDItMdPnMiAoiAl3Mfc+Cm2Qa6TQfqho0s6YVK382ZHW9e/1Lt5/6zdu0tGmtAHb00/DG1U99VxFdVB74sZpYPV2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu7ufWBfNSNsnpJhj/ftM09iZry5yoIJIMA8q53g9Nk=;
 b=YVDubcdFJMlQ7BhP5RCnt2TO+icXiz9xeUo4tznUbvdFDtAPttmEcf0XCcziaF2qMUUrwjXGoN+57V8o2Ow+zVp4C8bp4ou9qxJEr/ACDbIDZB26BYSb6BUXtndK7P6s2KCoRjWJ2+oAFHuvncIFWFVBxUTPnZOQLUH1PET++gE=
Received: from BYAPR07CA0065.namprd07.prod.outlook.com (2603:10b6:a03:60::42)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:40:33 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::55) by BYAPR07CA0065.outlook.office365.com
 (2603:10b6:a03:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 08:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:40:33 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:40:23 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V10 2/8] cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
Date: Fri, 25 Aug 2023 16:38:40 +0800
Message-ID: <20230825083846.4001973-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825083846.4001973-1-evan.quan@amd.com>
References: <20230825083846.4001973-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf60b1c-213b-4e46-02ab-08dba546f229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PkRabwbCtM0CL+EtEpK0bn2c2fZSR+6kEOlTu1ycCEeDcidiB0Usl4EPsQeYp0iK+Oom+RTLTYZRUXJYsDiwDUiiCn5SOuKRcwq1+ScvcUKb4GVCUQWtWCTsSc3Lc+26WHBYp4f/LRq+NiSqIhVi9cVj8ebIdOGnnsuoFud49fyEVVFEsg7eEqXmqX5t+h+saYnUOuXO7YNX5EIhwE7BHA01FOn2r+10HroHhwXCQWst4LMCjbmi0+xeIWSp4a1a9NaL8vjprbzUBdZSz4B/VuzB+jzSDBwq9pPIfDf6oGmQ7JhLgXNeh8Kv8Fp8KXZ4yYEUiOWqmVlxvcHcQQ5yA2U4C06xY7CaMKKNQ0wnhyNZJAELPQGixa7H2wRi64bgTMemmVIu5BlpvoYUa6cen4dsjJw7gsVEN4pM/YAL1G8D80cnHrVPo8vDX4HiLN7HI8djVulzmVbcxL6f9PorDMPxKpBV9FR7SJZ9dI7PQmaUvs4NwSCdFF6xMbzbfJ4GR0HVCSjJ5+zX837Z7vu3EAlAIPhgva2mywCGqwP1baejpmamngKjpJ+dacVV2P3cBkiF1yahyizM+0z2IhXPYfG5+QTQ1BG3jysZxL5QptZu2bOOMx2P9Am8mti1IC+KB85U2nGmPEPLsAdU8YMqbUQjTlKiIKF7uQjalLfT/C74/7tiDKnvYEVIcyJoU+W0SKImjuyNKDMlELPDefMbYtKwGagV3NeURcvD3CMWFZ+N3NY/mycaElzfsuo3cZFFkCnO4l8REN3aKa+u+/y8IC++2Ys9R4NsF1AVtpDu3i8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(54906003)(6636002)(7696005)(70586007)(70206006)(316002)(81166007)(478600001)(110136005)(26005)(44832011)(36860700001)(356005)(921005)(6666004)(16526019)(82740400003)(40480700001)(41300700001)(86362001)(2906002)(4326008)(8676002)(8936002)(1076003)(40460700003)(2616005)(5660300002)(7416002)(83380400001)(36756003)(336012)(47076005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:40:33.0562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf60b1c-213b-4e46-02ab-08dba546f229
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
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

