Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79151743980
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D306510E2BF;
	Fri, 30 Jun 2023 10:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242C810E29D;
 Fri, 30 Jun 2023 10:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWtMc0Zaw6/Pth9VSmhIJF3J0wD802OpLVQrVAfJZ6j1NLPm5k2Qo8EtlVXQHC2m3U0c081fIy2viLe+I9cu6yec10hT/aeXa9myLPRyszN3Td2Cxa6LQjd6E4N+DHsFr10S9rMFToEHqu9OT3E915a8QNRpIjvL3/uuEKxVb2vdk90CslTjsxtvjwCRg5zfNMe3NYoZ1icqdIH8dj4KGBv8pd4LPzD9cQrYNfd2Mpsru1P4LE7cMu88X1j3L2ANVOxM5CHYuEv4YZ8KVjISAZYKOHFcYzkMrDTPaMs4RCGA3DvMZA3SsUQv84BOywsvt/yoJJb0PUjZGX6+gXq6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=cAycHEny0G5gxvP2lDPK7jeIKjQha6nSEg2dlVZiamO2sQTQ70Lj/IwSfvjp7mAddTqZCpT6dhXma3CLMu7y+sXuDMN5CdLnMz294H16AXmkL4FtspHTZ/ndOXWo8gwtAAFWDKpJLPJodNoIJ/nzFX8hsCrMvg366PfYB3Ms9Jk1xPdV9lBUhhvn4stKUDYoGDiVI3WE3j81x+CX5/B63TOXUoojQfoPj4gimddn87XjV8pT1KnH2xdllHIzg3e4utR8EaRb9ZfejdmcaT46ScjC4zfZSik7bZqyjj1nFSLllK7g/7gieYBgoUnVMWa/OfGu12C4OT0NJrknJR6Qpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2W7MeeYoJAjHpnZBPrbz+KWPIKBQOAP/ttwqdtMG0c=;
 b=rTCowzhnDQoiPYBFFq5s9WBfTp3gJWfxLdkdKy/hZnnUAbGCBGamVYnCktst80NRDCyTy3QNbyPDbJbX9NRhOmp8XFnEUUE1/RTqyjEmotJ5FDraMZ7zJNGw5E8gFQLYrs2k9gYlPZohvLcfnv2c4B98ybaAOE3BHEHBbwREMZw=
Received: from BYAPR05CA0085.namprd05.prod.outlook.com (2603:10b6:a03:e0::26)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 10:34:33 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:e0:cafe::ab) by BYAPR05CA0085.outlook.office365.com
 (2603:10b6:a03:e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.10 via Frontend
 Transport; Fri, 30 Jun 2023 10:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.50 via Frontend Transport; Fri, 30 Jun 2023 10:34:32 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:34:09 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 3/9] cfg80211: expose nl80211_chan_width_to_mhz for wide
 sharing
Date: Fri, 30 Jun 2023 18:32:34 +0800
Message-ID: <20230630103240.1557100-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630103240.1557100-1-evan.quan@amd.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|IA1PR12MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: f455329f-e084-4063-cc58-08db79559797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIJxXKLc0HPVNAoT+yvortIcRzQkHoI047h52HmQX4N1GcrapD60p6ejfoy57QEBBXVaPZ424bsYWpgDZvUl0LrzSnELnUPQfR/GXm52nxQ9OHHeH0cGUqB3dgVFZ/jCzBjxxrbxOcX3ABq91/lRetW5zrOLGa72R+yV8YLW6k6q5Uf1i/W7Xjr9MSXDiscrZjZB+Z+U5E6FvFMHRl9r4dM4gNVPogOiP9gQHUejg+UK7lW9eLg0+kiEbv+I8s6I67DDGwLBdbQForl94G/fyFM9cigqKmrIDPMFGdEYpYi/iBqnRpvMQXCtb5bLLhho9VhFLALWhKPeKwylGGw97W/emW0UdEFXWpJ53mrVMwi+7D+HMrL8GrNt68WDzW8WXzZeKbwABQjOFlEA3jK3yo31pZXUDJEwlmCBvwckub8dsoxpXBF+bZp1VCPtXiauqgn7fmq709NEzqmcKF2mdclBuJNjO8pz6UpfIpe/PvzIwfcbH93VjTK5ODi6GdYwDj6M4Lv4sNUpkXuOgO62P0S/96mAYw7XEW1icwecqkTS7peRgrtbFer8sRx9bABPOnpIoYAgO7rLYom6DYb8ELvVINNA0xt/9y3xTNfnpIUO78g557OF0slvI76Yb3GxUnb34RkpX/RpB05oI3IklEY1jK0jepZGKaMQN2+91O2Cp0tfNTDNeq7AdwKrdrpGHxmL9S3wqvaXXSbMzDlAZU/Ld4IbTxRb8EB5lUu4A85VFeU/8QEGLOfpIdKgoFdcAPmtFoVYYFVRvnpAEgBXGRxhc4o/0Iym1LtWwiwo5xP8BsA3I78zysEQkPIIUljo/P50AVRmi7CzPFq9h/x/Wg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(1076003)(7416002)(44832011)(70586007)(316002)(36756003)(4326008)(478600001)(70206006)(8936002)(8676002)(86362001)(2906002)(26005)(110136005)(54906003)(40460700003)(41300700001)(36860700001)(40480700001)(7696005)(6666004)(82310400005)(356005)(186003)(336012)(426003)(47076005)(16526019)(82740400003)(83380400001)(921005)(81166007)(2616005)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:34:32.4764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f455329f-e084-4063-cc58-08db79559797
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140
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

