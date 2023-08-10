Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A2777189
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70DB10E4DC;
	Thu, 10 Aug 2023 07:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB6610E4DC;
 Thu, 10 Aug 2023 07:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8OGs+qUznR9gpn1CsH1fYq9Rf8aP1qiAhR3OWd27zOAwr9guVqm0Nzb4ete/MqijayTyD5hCYfkHpGG2XyfbFCjCy01ed/AmpFRIHgg8pVyByCAL8rdTXudZd+K3j5mjByjd6SD4zwVtI5BdMnfU2b5bjraCNw7uwGGRlAumjVFrqSxspQ6/60lsVHIG//4bGcOKQM6/KY1y+am6Luh/OQDPiuvdDX9HcQQWhPdEHJb3H9ws/NtYtZprbvG5q+4lVLHl13C4nYDe0VYVlQBhNOkP29NynnLoFY55RD+KHg6SASk9/fuoGB1oP1NZOUL5X6GVGyUyxzWy6VcVKGMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiMLnjCApacLG4wsAzcrg+11GjFpwA3RTl1Uo2H/Zug=;
 b=ZQVp9VR16RKYSNMzSuttEgb6KrOA9yc7fN6ZS15DLbWeThDuRFljp5WEpFO94b1hz9SHoxh0pc2qKMUQkK1TID9DR25uEQVyGXJ7vHHMD6V2BzPiv0h1PFjgUhVCpoXbgHLW6cC5eK6iG3fcFymLLnZAEYIWnDUql3T5zekXheQLiRICQdTDhF9DsmLFt/UGr8r8LwKnZUM5D4F8G+cJkX+ilcaElzbryrZBQZUyvP7ZTq4iUf1QILuMhbOrshYn8QTLfjTbDWxqpPhPPrtkIbS9nDLJZhLARm84NUkO4fFidrfTqrcoqQqD+435EL4p3OCxMXMtSyqV0c1kf1hVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiMLnjCApacLG4wsAzcrg+11GjFpwA3RTl1Uo2H/Zug=;
 b=iSTY9X6UnOn1+NhLMG4IYw1H0b0uVZy3YmcmC3zy4LJUgJC0p9qCKIdxYCkzD0Bof1ODQRxp09p8JDRYEru268gNzSQ8rdj6cRIWcqPpUJ5uxIabb1AeANIxsGCLIB/rxJ7Y6Awioix7jwaSmnOyLmrlcbiA+0v7tnq/2k6TvUo=
Received: from CH0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:610:b3::7)
 by CH0PR12MB5060.namprd12.prod.outlook.com (2603:10b6:610:e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:40:07 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::21) by CH0PR03CA0032.outlook.office365.com
 (2603:10b6:610:b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 07:40:07 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:39:52 -0500
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
Subject: [PATCH V8 3/9] cfg80211: expose nl80211_chan_width_to_mhz for wide
 sharing
Date: Thu, 10 Aug 2023 15:37:57 +0800
Message-ID: <20230810073803.1643451-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810073803.1643451-1-evan.quan@amd.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CH0PR12MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f28ec9-575f-49c8-53c9-08db997504f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUVDtO+5RDVSo/qMJM343/EkMPx5Nu9WHLgH26saAnbjQ6PEpW6R/BwhnrFU+3vyOuvJDnVB48Kr/iJp3bgfAAwFVoICLkdkmT5maih3D0IjYDW39x4PPXI4CVhC0KkeyIAyQCxf6ZRyLCYz2MqPP1nXDs04NdWEB25qBYSeWUNVSGA6hYvuMOV4D9DCaTuweFEqCvsN1ZTb3tnLFYZ/zp85402Las8nRh6G4mgZ1arMH0Bj7223/zLF2Uou9IQsL3sZdfRhTVPblAXtmirMwn9orY5lLcO8/yXRwf/ETTC4Z/9jKPYoIVhLpTiXUmTYAdgd6ZCtM0HgX91UOosbi0OUmVctQcM6DZGWSj3WD8YIaXotBD/fmRzREGy1PmRGbSDAOtTLJpGrJjMwpQztQ4YLGFC+6CK09vOGLg2f05NBVEojdzHRTXTckN/5y3iwjpLWntP7VP3VtMbiEZY9VCy4LXs83hV1AxnxSs6TjhJy1mzkqFq9c8fZb8AMIdiOHanLqcKluS0pN1bvRzWh4mKiLoyrFrmkIXTFUXKXrJCXoS6enlc/0UfiABVcDFPVjAhV9xkPAchsX9EpjFOhz+xvVxNevq7wezM9CMOGd234L3ggpfBtFrIVIE8eXUKn+IpTDLHTESST1S4K7R2Vz8fSaofsoi+5ly+LAxBXS83klc201HoAEB4GHNSKcW21Cw/xEMLZ3LGoQgces0nXa0Z8d1S5I0LuMK8ReMovYSphFhhZbYKkHwPS0/fTQb9RyOmlUVvyhWz4aNhWCZc+kLdmK6rDKkPbEslH/EKTLWYsbU+4oUEYPfht3R5/a+Gpgg404o9TI2Kkbbcg4Ppwsw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(186006)(451199021)(1800799006)(82310400008)(36840700001)(40470700004)(46966006)(44832011)(2906002)(426003)(2616005)(110136005)(54906003)(7696005)(83380400001)(5660300002)(16526019)(7416002)(47076005)(36860700001)(86362001)(40460700003)(8936002)(8676002)(336012)(26005)(1076003)(41300700001)(316002)(478600001)(36756003)(4326008)(70206006)(70586007)(40480700001)(82740400003)(921005)(356005)(81166007)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:40:07.5060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f28ec9-575f-49c8-53c9-08db997504f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5060
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
index 7c7d03aa9d06..f50508e295db 100644
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

