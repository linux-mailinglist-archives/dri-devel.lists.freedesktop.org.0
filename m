Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9857B3F55
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E7610E1C8;
	Sat, 30 Sep 2023 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E810E1C9;
 Sat, 30 Sep 2023 08:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9/W6sw81qYa3117UdvuGsNPusXqVT/EAxhiUdPy+B8lH+yX3MspeLb7NpZ4Iqq5oYcFWuu8yRjXyzQLjLSyoDF9iygsEeJFdBPCWNgyx0DxjiEn9qw6n1HaHzLm1v88aldtXj27/vGqe+Q64KJdt9ysRma1bJgJ+S68SL51x7rJtBr7RIKcsnVROR3wKWLGj+9/x2ZzKj1iiK2k6NYXDJZkzQrZ1m5vIfNElRa9YMaIboo7SpLvFsIj0oilWYhndThPhkRRXj5JaYUFMvNNQBPLbbo1yZ588b6nzju5cntbpvbSb/1KInlkJ1vKvVPKgD4BDxnBhFq5pIJHqB16ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHleaaHMIsPOooV+w8qEmjplzoizISPCEQ3zTMDBSSg=;
 b=Dn77QWjf5qh3RBCaQ6stlTlL/ze4wkQMsRUKjQ+yzXTpxgapD4n+JYiixjloC0UNs2zj2a94CWTjixa0w/OxISM7XJltUPSn8nsREQ1WNVxuoFAJX2tgvpvukPXV2EdZE6fuUvFU8n24bllEf23tbiDIpLf15MP4yGy7TienmMg1i5fB7SE+9S1hcKLHJuQF/z5pA2Tqs9enWS6kMnNkUoLy/AyffoRIQ2o61K8ttVXfq8sXsTarUCW0c/Ox17uW/oSQDtziQ5qTERG9/gQgs8mYzc4ueHRYyIPBUcoOglQGojF8EsEaNGA03w75o6MyPihOmf+5dcbMDMhm2o6uXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHleaaHMIsPOooV+w8qEmjplzoizISPCEQ3zTMDBSSg=;
 b=MtMYCFRcFn6l/B+kyFNvktStCoPqLTfBCLMR9Grp6tkCHgjBsU6obHtxHgIOnHHMVPaKDGxwrNEFUXIwolJg7UBx4N070rAi2HhfqHTZFZ4WnAmvlRGMOtW1oqK+blbm6nJYjIVXm1TR5YdJZlizZopAMNy1EkS7NVY3PJCD8GE=
Received: from BL1PR13CA0136.namprd13.prod.outlook.com (2603:10b6:208:2bb::21)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Sat, 30 Sep
 2023 08:39:01 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::32) by BL1PR13CA0136.outlook.office365.com
 (2603:10b6:208:2bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.17 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 07/16] platform/x86/amd/pmf: Add support update p3t limit
Date: Sat, 30 Sep 2023 14:07:06 +0530
Message-ID: <20230930083715.2050863-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 200b3e93-6498-4c54-b52a-08dbc190b1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sd9k0QqXRpZsR20NCFGXRj8ptcf/Vz9wKt7p/5V+g9RMJCwPyRav/RarhFgs8Jm7YYVcKJgLPAvWQgRoaewoDJwr2immhIM3dwBu2sCmMQiPIUaVwGdTyPDP011DEDK++Afv/5xgr00XnHlJ0e5dIhgNVjQ0RzyW+SwGlaQXf3FmYL/JgkttujmW7HH496qkSqazfkspH2adsiSEpyMyva1+rsNBVoVYOLsabMcdh3jzNRBWTaikI8kX7+vnJ/+43s44ONNiL0Az83YggTLsRVQNlgkFUGWJmlR7mMi/9NdayXn/KNgX+aRN160FjaUDBFvg7lB8OeYmJXyLyNSdPTcknVsugMkwuJl+6pSD3hbRMFK7SeO0diQ/9gB8LzSlzwC+oDzYuK4NIr3IZ1a3W7W+uLQx2So+xTku6RfzEsHDf+IyIjNadEsagKbl+Bqx5rRpY/yhNVZ/QVB+hyDAj7rOqk1C6WH6Zy3aRu+AVZUqyvmz765xN1VuXsr2nOcSV6qse5fQjYFXH2koTzLrDC1s0HPk3gWMf7bh2Nq0mKnY3dXm/ad6iw33ZcSRlIm4iUPQkrjhD6/rhFdF382jF1IqO81ot9pWHJ5SyfI4kIQUQ1jDf917/U27BWuhvCSClSNGrI+pviLMlHlLCC2SbfqMF8Jn+t5z+LBR5TghnmnvQG/dI3aQB2aWm1yrdl1wu+osprJWKZsluH2QnYr3YHH++bXLfX155OVeYYI+PfOQKEZZMIBLhemQe1geuga7GnbnM4Avi3JchClAKPLR68wSVrKaSQjKO+f6XJ4Xgx4O9iJTLylHzMuQTkLb0lY8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(6666004)(1076003)(2616005)(54906003)(110136005)(70586007)(70206006)(7696005)(86362001)(478600001)(83380400001)(47076005)(36860700001)(26005)(336012)(82740400003)(426003)(16526019)(356005)(921005)(81166007)(316002)(15650500001)(36756003)(40480700001)(5660300002)(7416002)(41300700001)(8936002)(8676002)(4326008)(42413004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:00.5481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200b3e93-6498-4c54-b52a-08dbc190b1d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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
index 60b11455dadf..d5e410c41e81 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -49,6 +49,7 @@
 #define GET_STT_MIN_LIMIT	0x1F
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
+#define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
@@ -72,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_P3T						38
 
 /* TA macros */
 #define PMF_TA_IF_VERSION_MAJOR				1
@@ -475,6 +477,7 @@ struct pmf_action_table {
 	unsigned long stt_minlimit; /* in mW */
 	unsigned long stt_skintemp_apu; /* in C */
 	unsigned long stt_skintemp_hs2; /* in C */
+	unsigned long p3t_limit; /* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 1fc3b57f8d78..315e3d2eacdf 100644
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
+				dev_dbg(dev->dev, "update P3T : %lu\n", val);
+				dev->prev_data->p3t_limit = val;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1

