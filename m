Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744127AB845
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470B010E6E2;
	Fri, 22 Sep 2023 17:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7471D10E6DD;
 Fri, 22 Sep 2023 17:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebx0AKk8MgsXQnc0F3A/7vNVKXWhFvQVLbym/4AFKRH7NLlo3oIuEVm7o9YzTRA8aZnQyULk3IyI6BtK6Q+tjLewCY+3eFAJaHkugu0himZzQbHxAMhDh+mig/aDzHe3/ARuHMlWRLzwyFN2e4zSCSiaSTU6wG7e/AGxX2Op5S/g3in43vBQTAiSIlMEX8i8tzg8l+L+7pPEeFpiJx83RkagPfW51K/+OHTPHLJMfvu5h/ZWDh/b62knD/zE04ELvf8wnHAWMmGVV15ZU0CNq1M0rM3hJhLCcBlkGYmuga3rY+4WwCkN9f2L+s1xG1VnIqMWVzM0eutguAf0PWGxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0k2MpGBmfTzY01G99nNKlUwwK+Tm3MjEykFfBDj+NVk=;
 b=dnTB0gAFDxeK0ERcUdt4nb9q5p6p3gwcBzVc1tEmtQG55/Uu4CsnVBjb8x7CT/LMyAS1cj2CEKRojCmMcmZ9WoWRh9NN6E8GgfZ9TqKgETNIM+fhe9QU+GxrV0gCgpZ+WurruIr0GbSGOIIEbRqzlCVvTl/mtc78CKKcT9DEfpOE+7Cy6eclXpePRGFpBxCGIrftviAxqrW/XYsLLnJXdPMX8OVJqagcqoSSOQsscbMNN6Xd0eQAy5o+g4vWnDGDS5QcjSf4rH1wr9J/hdbyDi8kw1opY07wtkoz9bgMllCyB6Zs+gdsH/LRQkIyNy6BmBGQUm5rlU7Plsq8vblKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0k2MpGBmfTzY01G99nNKlUwwK+Tm3MjEykFfBDj+NVk=;
 b=aKcy/maJRoJgzrglH6AuJe3PxMw2za7yGdvyvLEoMu8hcXb7Endn3KUoaqsGmFRTAjwyF/tKdfb9TwJlUNAzyKDIK73YBPDiQ13zI3YOnMWZOx+69Yfw+ZSrsIuKD7jrtp6NTulhRP/Ph8bGNuxSuFOW4f75s2Hu5uc/u4Td60c=
Received: from MN2PR17CA0032.namprd17.prod.outlook.com (2603:10b6:208:15e::45)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 17:52:17 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::60) by MN2PR17CA0032.outlook.office365.com
 (2603:10b6:208:15e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 22 Sep 2023 17:52:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 07/15] platform/x86/amd/pmf: Add support update p3t limit
Date: Fri, 22 Sep 2023 23:20:48 +0530
Message-ID: <20230922175056.244940-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a3523d-149e-49a2-0263-08dbbb94a944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8K+zskcFcmp3ThbeEThCF0WpMR0tZHUEuGUY2WhqAn6HYYUp4k2xpcx71OE1rHj87uBX3/Kzes71vAwIRL2YVyWiZgZ/pbUqov1c0mtjIoZcY0As8Dk7evz+32e6hF0ha2KIus5RL4PUOHKN+m2JBC7/1oyUH5ZtpRTZ4DgUNVFfmv9CNTWejAXFUg+thz+T49nziS1PHMpPSkNF/75mdqUCrAanlBw4xCRVn22Sk8d+mEJSaafsW46Oo7lKVmxFHrhzG2SOL1wFPyFejPvHTLC2dBgkuNOOhTD0xj9kg/lA+Muf6qrlBcNgBY+/VJtgkoRKeRepkUtE/mQeqEPQckS152sRyqmn2miekXwoB95l1ppFIJJ5TcnPvNgomkHIgvWpDeyieNerwTmIm7Gz/17KwEEW3TjIdGaZ7Zc9gp1W+q6GG7QdEW07w67FELuEIh6xY0p165MZHujjYOvrnB9Pc6LbHUKHcbz24JpIxfpCHEQqepwLdIzKKveAHKsRD8BP2L8/g5i44D3AnjDq3XIG499BZGveiRiJu/GinPNbdwtS856fHrrCyrpOfzez6J70fVOsRcw5NpDBO8KMJYfyeEiKgycn6WNI/N25zpDIKUwKLAhjT5P+WBZYb8yPo4Ay2cBVJCmWn81m3C4DUOw0ySKKOJKj9brGCgzdZiTFp6uDIX7nMhLbWLn8TpCPjnQEka7aZAW3CsK5SS8wNeJ8tX2SakOGodEhP7Kh7+fA7ShtEPpo6F/1DzJvXMEdIv1zBkX3QAn0emwIO47opXFh1KtKeC2y+dcRGiON0q6/8lhj1Ph++SMlb9mjrNOl4/7sL+BUkVxamUNSxFaxZbexgKgd179ZquFEoByHe68=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(186009)(82310400011)(1800799009)(451199024)(230921699003)(36840700001)(40470700004)(46966006)(36756003)(40460700003)(40480700001)(82740400003)(7696005)(2616005)(6666004)(921005)(356005)(336012)(426003)(26005)(1076003)(16526019)(41300700001)(70206006)(110136005)(54906003)(70586007)(478600001)(47076005)(316002)(81166007)(36860700001)(83380400001)(7416002)(15650500001)(2906002)(5660300002)(8676002)(86362001)(8936002)(4326008)(42413004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:17.2105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a3523d-149e-49a2-0263-08dbbb94a944
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

P3T (Peak Package Power Limit) is a metric within the SMU controller
that can influence the power limits. Add support from the driver
to update P3T limits accordingly.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 3 +++
 drivers/platform/x86/amd/pmf/tee-if.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e64b4d285624..897f61b75e2f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -46,6 +46,7 @@
 #define GET_STT_MIN_LIMIT	0x1F
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
+#define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
@@ -69,6 +70,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_P3T						38
 
 /* TA macros */
 #define PMF_TA_IF_VERSION__MAJOR				1
@@ -472,6 +474,7 @@ struct pmf_action_table {
 	unsigned long stt_minlimit; /* in mW */
 	unsigned long stt_skintemp_apu; /* in C */
 	unsigned long stt_skintemp_hs2; /* in C */
+	unsigned long p3t_limit; /* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index eb25d5ce3a9a..883dd143375a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -105,6 +105,14 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->stt_skintemp_hs2 = val;
 			}
 			break;
+
+		case PMF_POLICY_P3T:
+			if (dev->prev_data->p3t_limit != val) {
+				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
+				dev_dbg(dev->dev, "update P3T : %d\n", val);
+				dev->prev_data->p3t_limit = val;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1

