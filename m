Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5C7CD502
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED94510E39A;
	Wed, 18 Oct 2023 07:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EF010E398;
 Wed, 18 Oct 2023 07:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd2nVx8B5YPruwRiNHCft5Z/ChaRz8n8xepajYEa5+f+pICfV4Oh4LXL4+6ZImAPOABfamV1INn38KFwMPKsc/IguIHn0C3hwNdCacnNqyjPj8Jc/Ozn0Xn89tOHI7taW5fFGLV2QMVBsjQSnoQm0VFhTpQy668NjNyTpU3J3mEbgkkUjSJZwp1XLWj+kdZVFnEXp5g//a1RFAoi1rTk3570sOuSI49VnHOUhA2LBy+7CqNpm8RIQJcWKvWAu2hWhsjGFHRF+eohDRCUuAmTVuKL4442jDw7IVDCj/UjCVGriWGAQ7aB3/yYaj6rYa0JMd4od4XVtlK45oKlphzr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRnV8D3E0uYtd/DpXul8m5iYsefn/BT3C3rU9K0Un+c=;
 b=b2u/u/UEf0wPIpa9vk8QR6UwmLbJPeiXd1vksl3QzV9BJA95S5g1c7LeEYLm5VLCOvOnXtjrL29cm8w87Jf2Ka/UfwPaPvXsNq1/HqnYKb6PnSseoQL51tkcYJZVYSOKuOi7ICg8uQviXYeQFUne8WvjQsm21p1jArpUrL1P9zGGT4ZFA1tFYGSD/WQ8Y8OuoQ2t49B2PTDa74FckUjprIJ+o14pyJBP/Yqg4DzYRwt+Nb6nlAuTx1mXpVzAUhJNEF+7/oU1m4kiNPHMoObKiTwqugn+e3+xXSCh8o0BN+yZ7hU+D8Wvm0NsoazXh5/Of5bmXaAU99Z39N53MiFLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRnV8D3E0uYtd/DpXul8m5iYsefn/BT3C3rU9K0Un+c=;
 b=3ID96Kf2DqLNyvAo8GyRWDx3sYq9DxpyJMy6J4JJ/H7hjhxFzVZGKV9EvvFmtYe3401RFha/J1TgWCAq9DPGcQsLk4iyk3AH0UuadUG6cEBJBCPVS8f05QEr+h/Eatmu+A3vpcvQCE8JWlJgd/wcbxa+NAnnjurYIxrYqmodt5I=
Received: from DS7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::8) by
 DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Wed, 18 Oct 2023 07:04:55 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::36) by DS7P222CA0016.outlook.office365.com
 (2603:10b6:8:2e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 07:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:04:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:04:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 07/17] platform/x86/amd/pmf: Add support update p3t limit
Date: Wed, 18 Oct 2023 12:32:31 +0530
Message-ID: <20231018070241.2041529-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf0bc29-e305-4c3e-1312-08dbcfa88846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0wWyKz+xBJa4TnniBNPMec7Oji+5277F7OayjQA4GKrp63/Vjhyy3zT6QlROlA/u8hpsljhld248fCff3Ewafzh1bVuHvjcdgulW2TqVecaz5p7N/0LZ0pv6Wuj7usIWDrLW7rsi356z3c+1wV98c/NT6G7VKO9YO/bCuE8boNjkRx77NjPKAfXoIKKBfoR6Ylfj0EPllKKHCZhErK7nx1HqWNhSwSA3skUJCw3pGrPsG6KdCq0Ck3sMi1QPlLziib7Q4ROspLIChvpQn4acwmzZsl9cDKYJhFt4Uoyy78RYOj/28a6EMvobsw+C5OpRpBaLWM0ghd6VHKk8wr4U3mkHxIgs1ur+8ArZbLNzDOV1hSo5BrXdA0Vd3Z3METN2DXzA9OFNauLM2okELexXo7A1Rmws02d4X7njCpgJbH4T0WVNtIRrwmIGcESzIHGKWPumznOzzQTwYW7xyqGWrtmXWuWr4RlfIXdmnwes6F4h4sYpOD14tkeHXDghNZ1xcWZY3LOxrm18usvlD8pl7K/pO/wuXggi8+jTp2AhtWnZ2MJFRjdQ+hCzALZV9o4J1uoR2zsHDRS8bXlNaxQOe9mkpz4hJ39lsXeHTmpUdUeUup1sHrSKI3agxNlPaO4BZ4BCmDYXXuTMZAIrziX3V4cGTLSonmnhsM13MTOxBz2VJ6P6JEsBHhdYa/D6Pz18W54Tg/Q0QeNrOLHNs+kHSPwa944z+1ynS/xtbawpsS+UZczgpYZDDjVv+1/KgVWGz/YyY9jYOzatd/dGQpmob0B7CzJTbgFkctjdAoG0ocYMJxErWWzQgQSrpzPzUcY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(26005)(36756003)(86362001)(921005)(356005)(81166007)(336012)(40480700001)(82740400003)(5660300002)(41300700001)(15650500001)(478600001)(2906002)(8936002)(7696005)(8676002)(2616005)(83380400001)(4326008)(1076003)(40460700003)(6666004)(110136005)(426003)(70206006)(316002)(54906003)(7416002)(47076005)(16526019)(36860700001)(70586007)(42413004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:04:55.0025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf0bc29-e305-4c3e-1312-08dbcfa88846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
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
index a4a73b845c09..781989c7dddd 100644
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
@@ -481,6 +483,7 @@ struct pmf_action_table {
 	u32 stt_minlimit;	/* in mW */
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
+	u32 p3t_limit;		/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index da6520f202e7..6f4a59950b27 100644
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

