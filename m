Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D030737AB4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D76910E3B4;
	Wed, 21 Jun 2023 05:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7C10E3B4;
 Wed, 21 Jun 2023 05:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Refr58cvqrJFU6+4aA6hNN16815N84AxWM1kIfUylIvfgyNXK6bh3yeIBoUrAHUdaoHGMuNWXR3tLRJ7saaLsN76JpIBnoV4fTWeD40ocTQIKMGNvl88xVMZonKvmfuEs1GIkPlscTLQoFdaZrBkdQim4xDSITY3lF/cRnmtnH5cMw1Pg6J5ZQj+YXc90i3OFn8HMso7/YmWiM28ZohPY18BBVx/c/JEZkqJkyqijW4No0V9wmCiTds/vq0WGwBsSLYYE4u0WKS10Ix3NZCf/xD/lqYzQYcs3wzdJiTbLrZopX/h88jUV6Wk+OdL8iZ8eaSS9c1HOy4vff0jew0QAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=aT2nTD/1vqR7FmZYDsAd//KmVNa2NhSPFOHCjcFJKZlMFZlJyJJA9db9tJMrJrYeVpS1Qp7t0+QMH4dPSaRWotVJdpZeFquc9Ubzmu0qMv7CongixFml9wx+envEnE0MEh/QZD7/u7uFQgSLviG8S3q0jdrqr4Q601zzPRI2GKJUanJbZCR/HRnHpa6i3UID/q8NMZ04RMYG6UqGmAOo07+9MRw16AWfN93ugD4Rbsfsvx+JqTh7dtMEmV0v8hhlzOrs4oCLhyxDEIaS/LGsNgWmruQI6/raCREVkBcJQGuBE95JOzsYRTfci8E/+IVYkrHpRiaNE/jWHqj1iU2N6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=HLOWVUKEdQ/s+VVBNZ6cIuj3QDdqj7dFaydXbVB7eDhaPqZMd7CP2XOH0hCDY2t1NwEabwrwmgnMX/mtSYwmqK/q/1RV2ch1+P5XlPQAKQ6e32nOUPnx+hl3TFEyatEuve7MFi9Rw6GJOXCRWatmgHdmcxHCz1Fcd0sWxzB0Qd0=
Received: from BY5PR17CA0035.namprd17.prod.outlook.com (2603:10b6:a03:1b8::48)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 05:47:44 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::57) by BY5PR17CA0035.outlook.office365.com
 (2603:10b6:a03:1b8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Wed, 21 Jun 2023 05:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:47:44 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:47:35 -0500
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
Subject: [PATCH V4 2/8] cfg80211: expose nl80211_chan_width_to_mhz for wide
 sharing
Date: Wed, 21 Jun 2023 13:45:57 +0800
Message-ID: <20230621054603.1262299-3-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c50bf97-b33a-451c-ea4e-08db721b0900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6D1F66XADojQEHzi1ZXWJdKTHLhBoVRdWgIj8ntD2cEcEO3yzuSMOyU0zik5S5hDbGs+HQXuutBgx2wnYWbHBlY94ZtpoBPO4LmmcZ6DnbvcezgxUuiTOfl2IR/C5E3HF+IHO+BkuW0JWfblDLwF4NTljWWSAbIfbwxP5T0B2cj5mJo3V5x8HO10d+aprsi1YO8yJICqWXGOCvZVrdCIaPrEA95wABBPAgVT9qhqjxyp1qEBAGfTNhXijdNb1eodwrelTWCjpNqzZLoNEDlYDrD9YIi6Mxz1/aht0oxbQxY01bDU5lxZ/Kf0G9kt+jy79Ia0lXM9HHPyj80lrVyxOx5Aq+BwZ4ARUQ2ehWQlqTV8F20q4Reh1+m8Slx4z1P3Xz2KhQ/AsSGAdFM33zPEdh6gt3M6V5aoy1CIPONbLLVyvaltgaCBF98+dWZaeaEd2+jAM9enIBliF29eu4mWf5rSQno4WQhZ3ZfuKbm95/T2IwQRx1fKLq/MWvZ4HrjhV0P5B/kr6vp99pxYgg+ZT/5xu/60aNC9wphhWIfIFhdmo2GfK6EI067oD1J0h1kqXFyK1RKJjqqRPNRxa90lu8trDIB66K2RDFlJMXy/uEvzWwWAduA3IhJwq8/HWVECkIii5jfldGZUZzyWnNrHn65QKVrIw+Hd6xn4DwN5k7bkZ7RC2ozpmQGD7nwTTw7NJj5HsO6UaEeWiO8wwe9KWprjzItVUVZLyg70caB0tz6X12EctpbpmnaJLHqB2SGkJS+z/4me4VsZ5B659xGGfFAc2slGQMk0F4msZlsE8nYfKLG9qmZm75pddxEQl0hIEBXllUx4vVWkS4ecxzII2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(110136005)(54906003)(6666004)(478600001)(82310400005)(70206006)(70586007)(16526019)(26005)(186003)(1076003)(2616005)(336012)(40460700003)(7696005)(4326008)(5660300002)(41300700001)(316002)(8936002)(8676002)(44832011)(7416002)(2906002)(40480700001)(81166007)(356005)(921005)(82740400003)(36756003)(86362001)(426003)(36860700001)(47076005)(83380400001)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:47:44.2858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c50bf97-b33a-451c-ea4e-08db721b0900
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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

