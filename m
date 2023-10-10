Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6717BFC34
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D0F10E353;
	Tue, 10 Oct 2023 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D097210E34A;
 Tue, 10 Oct 2023 13:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANiozpusKLgYa3vmMY8ERnOnvhzdvdHLiPIJ4ILPRQ07VXUe0dWpjutbeZroEbFJCRNlwkWxxE5dau2vDWQt91mgIwkmbk/Hi7EOdl0ikraQmJsI/CPMWsTgKSzAbfn2pOk24o8AAQAw2Up3P13k8BymMZ1tosdTpDamfdUtjrzotUqrQG28FgvKPtoM4aQIOHPbAFRn/ldCYjtvJo3qWaXRdfD+Zwm4Zz7jxwhDiF8sHD6rzQJgC5y/bmghER70nCrD1rRvUVDnIsltBlUPp5XzeNL336AjAsfRbSMPJUyvlCgaAFN1gtz46FWCYnicZpqv8J7TrOCuM45+q0iJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/MN46odpG1U34heSZ7L6T5YxiJE8wmcHaRHXePh92g=;
 b=bKpQjvQR0fAI29YKSySJkLdUDahSxrDHGZ4TVM9m2PJ5wfc6DBx0O6/NbK2ZOAu9L0vLRNIfruQd20/8lnFlADMaPBMz3BPNnqI6SmoP4aLOxwGJE++AcxRkF5LsRPd+YtQ1ltx+w+8+iSydpjF4fJ+umqqVCDHUBUZoY7et+kDFTohwruUc32qN7mHe6GscuITGHzvoAebALgBZ/wm89F5CS/oZxbMhM0K8SU/McqD+XH3YATzAkXm7aImUsPk2hhlwoCKw4carbIW+d5Jgd3ZDQB9y7ajqSDOS6FuszvfSDp8zI0ZCNatagx593AsVGN/s3nohh/zm3ajZrSvuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/MN46odpG1U34heSZ7L6T5YxiJE8wmcHaRHXePh92g=;
 b=s/G+LOv1wxKff7E6wFfzzMaeUaCfBWG5yqasPhvwS037EQyBeCMhAHI8ltUVAdzy68kodDz65uq5uRyAOnILfa2nug2vQ3zUR1JXVezUm8as4YGC1AjTpoM1JBqcUVLcxCwLCuyxVW4H4XxQme2VekflkPwjmSHkht0Jq6PpQJY=
Received: from DM6PR04CA0010.namprd04.prod.outlook.com (2603:10b6:5:334::15)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:00:28 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::a) by DM6PR04CA0010.outlook.office365.com
 (2603:10b6:5:334::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:22 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 07/16] platform/x86/amd/pmf: Add support update p3t limit
Date: Tue, 10 Oct 2023 18:29:08 +0530
Message-ID: <20231010125917.138225-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CO6PR12MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 264650c0-7474-4c57-f179-08dbc990e027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvFiXbKQl2/sTvtBMIFI3+91L92VyAZBurOBY3i1HQWkCzYngtnT6N7Rph6OBdxkD8L+rW2fWRmJsYTLgxGHPBGhfSnKi92V9wIKLmoe8Uqebu7O4dWJpTQc98essCjRWs/Ez5ZCTv4GwFzgQOcSjlYRZyt9OkqwsENq5wSmaiJMCyaPgEvJaK8+mi/9Ic3i3AaoZLBQV+vRwgaVyVQbfPTDW0kJAH5ySfdJgD3pUXy6KtjRp3S5r7KxT+gPjkXqPEXYskDtmy1pIe4RFmRnFasIPQx/6IwAMmG6R6ah7nvEsjiftuNODjgPYudPWm1EO+hAZDoA7hqVJfahjqES9qUzz2QYWySlTed5AHIQ4HSBKYpL/+UyDQtodcVcxlH72+30WiA5cSW+OcwMEtPvD1N4b/YLj9aWE1QDOLXW9Ym6IgkntqqCDMdKT3HdEpmnySRmqlT4tNzfrJrqoyoiCRNJxx9JSy7OxiN8igi3y6ZMIKscxB4Qtb+4pg5PzNfjklog4FT+jsPtb6OLJNaIeTBy54SBiMn6W4rznqvcyy2u694tEbES05n+KD8/UNljOubWDjfBOSClAtv0U2rUmYP2UXun2ktxHs1n2fPi358Q/gwzyOfghBolCjmY7NQooZy6UAzZigKeLP67wK5pQtUjKAMBY20h14TzCK8poqoYFNsmIiwKypFHedlHb+jKll5WNu5q6AOCmOS17foHFdpc1RlcD7UKEW0cFmGYvOc0dkSSR3WeZmqMxLa6CYh4iMIKCtkuRaSt+CGGWDCz/SPQFv+btXIUab4miT1m7oK50mAw4a5HyfpPHQhdl43t
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(40460700003)(7416002)(86362001)(15650500001)(47076005)(2906002)(36860700001)(921005)(81166007)(356005)(82740400003)(40480700001)(70206006)(70586007)(54906003)(110136005)(7696005)(316002)(26005)(1076003)(2616005)(478600001)(16526019)(36756003)(6666004)(41300700001)(83380400001)(5660300002)(8936002)(8676002)(4326008)(336012)(426003)(42413004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:27.5463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 264650c0-7474-4c57-f179-08dbc990e027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
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
index 88ee3c705913..20f3e16b0a32 100644
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
@@ -476,6 +478,7 @@ struct pmf_action_table {
 	u32 stt_minlimit;	/* in mW */
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
+	u32 p3t_limit;		/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 277103e4346d..92879ae4f8f0 100644
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
+				dev_dbg(dev->dev, "update P3T : %u\n", val);
+				dev->prev_data->p3t_limit = val;
+			}
+			break;
 		}
 	}
 }
-- 
2.25.1

