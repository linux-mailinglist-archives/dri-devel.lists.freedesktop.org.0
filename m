Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAD397B10
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CA36EADF;
	Tue,  1 Jun 2021 20:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E1C6EB03;
 Tue,  1 Jun 2021 20:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDyuRx7H/Y2rsd3vV8OxHBBViFi9/O7lWTq+JhZy2h0F4SBLPuVFA9YevdySk7o1YSx1uOlSPiUA/1U3XfmFelFdUn+8N5nf242gam1vf2PEle7Z4WTlCm+IQ/g4L3OUM/sWcBkaeV142CoE7ocH52b54AkYpOM43iVTMkBtutWVMi6zd0cmmqD2o/WY4+/z634fUeshHo13+ag8Q/+R2rzePcSGnr/+piJ5nnViG6dgSk+SA8XRahH+Xi8oDsr8AKp1Q6MqCwxk4TdpFxCJ1SSQdvdY05solY7azCvoE98jZvJ/5IdkZUGLiwyH4pW2hHnYhOB8L2YpaNKup/aNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GWePhC9ioBhzvmoZWFvdWcZ1henrPcTa+uaVi1tY4=;
 b=eOBhlreKZTk7/ElHMbfXkkU5z+HwFnmgorbM4w81dkROUgzq50RsrK7A5iSmR7Nyiddbx6bMdGtfEoQ4SiGkVCk1QWjs9IcHscOLb8EYno5oVJEl0mEvndnalHpR5UugMMIsnvZuiNOJolcjYom3ugjb6GCxVl5Bdfq/rBKEaxIPjQqbgfVq1l8zDe67VJUrb0EdhLgok7jcHEEgzQwMiGg7H7CsbX2TSt5n9pKHY9687JrL1NCP0bHMh8BY9JxjAyP1EpKHHjQuxL/BGIqQPJBd9qEjl0X467VjQ3M7ULfl4Ms7/Degi7vzGk4WTp1ybU9cUnsxzqpRBAhzT68KSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GWePhC9ioBhzvmoZWFvdWcZ1henrPcTa+uaVi1tY4=;
 b=gSXYKBDYxfv/HMSkctnrjws8aC9BC9EjNW3Z+w11O/Wj+j8HQ3KuIRoxPCXHDbNydBUIPuD3PSZ+rO7nY9kv8jupGfGlwAJUH7jktlH8M1wZw4t9hrAYv25yQdw+pBqxM6MzdVBBTAPvSvE6f9/NIxV42KN8EJbwz6d1Ekkzqwc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:23 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] test/amdgpu: Add helper functions for hot unplug
Date: Tue,  1 Jun 2021 16:16:58 -0400
Message-Id: <20210601201702.23316-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5b64:13a3:c94c:964b]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5b64:13a3:c94c:964b) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24 via Frontend
 Transport; Tue, 1 Jun 2021 20:17:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d1b68c-220a-4095-f73c-08d9253a440d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27022606C8F5A0727F4C68FAEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hE62sgBnNXTixygBdZaPK87Zx2llHFuaRq1KKZsK8KrqWdzt/RP9f4zcgv0ErhL4/srNHKvkiK0GbHOBwQp8VidInnsSGEwa4Yq2EkOW/RBnq/EnJyc/6T0VvcwMHs0K4dCHsJxDsRmxur0DDeeutChTOkMzX0zEssepcm/JyZUm/sIwZZFC800Z2d0ZpdJ/jmthHUegLS6KY8PTy4PmxemaiX+VCAH8b1FfW2VaQhm966txS/6nEWsPSEWEga96Lf8rQfYKyZMWYahunNSAn08MBKkWqbj2kOTfHDzZVKwGSXFKrroL054ik1OVMsnF7j/BYER0tfmWrBeFiaQr9djmj+uYT/BmpqiGlEuApiyXKaSPbCVylqkFVb/ZprcqTjFbzjn7MQdBg5wHXWyIpoWwLOgVdw9Sx4uRpC+4gVBLuzXrvnUYXHrL0YZXCSV49XCj7+31lxzlWSDkZNB+2Y8txQLpIpQ+3p9iWSuRHG2rakrpXpVf87fGV4aBbGaposKevh+ktOAndCSxSNbN4eQYULNRz/YVC6AE9K/32k1fwo+NyBawF9m2O9Uv5S/5cKylu5t4CN2zX9e2FESlZPsUlHpAErcMFhhce4wCxPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R7eSsNKBI/PhK3TIJkKHC2qQIncAe1bb9vwTr4hwnuiij8rGFp1JV+vdadLI?=
 =?us-ascii?Q?/IYPshAkRPml+ZJFYdGgcmFPaLdS9GMt0zqgY9Nssi7+Hj09pvQaLrfMwZxk?=
 =?us-ascii?Q?53srBKM1cZloIQYTIGUEbFz57hNMYHM/QuQ1Nz8EEkzuyBhonYhQ2EDn0yZ9?=
 =?us-ascii?Q?rzqUOBfSIdel/vECN/59QVIW2bCDkTSzoUbxIoa1GzisWrwttzKnjdpUoO/B?=
 =?us-ascii?Q?zhElPqQVkr8/5ThHEjMt34Z9TZT2/MUrUHzEUtQfatqN0xU/ENJmABqrru7v?=
 =?us-ascii?Q?jk4XNXNfJwV/vDH1W41Cyqn+i93wNEv+JU7H6hImOyNbY4q0KrqjMnuvylMo?=
 =?us-ascii?Q?payAtf9YecCqoHsGX12+QCsWJbO8O2z33D9959fN1Nk1AJbIjKVdDmu9NIPL?=
 =?us-ascii?Q?A3l2pJSJNNV6oQdb4NWTpn8h3jLZHMRpo0KuF0WCJI0Tpj9hb+jxPxkcIB30?=
 =?us-ascii?Q?HX23bkjJz+BMXjj2dKrO0hmU8MtTsK9v1Y4YK3bRcfJaTOKvgeQodAUM2wwW?=
 =?us-ascii?Q?6ZNCRA5wFY9aMnLyxa3H6zG+PY7nbsIerT3GZKCikOanjLYHQjRrPD6RMIyI?=
 =?us-ascii?Q?VMzMo9wx7nMyJqOPw/zpPCsx3odDRzgInSsMfJeDZTbizGtMN7HI4Ec602Na?=
 =?us-ascii?Q?Sos3PHxE8XDicSKAFLb7DTgW0YAPmLvD8Wiz5iM821/tI1be1r3D+3l23ETd?=
 =?us-ascii?Q?Nl5jof1SAiRZH78iq9uy6CvFOm6HRh/TCljEowNEpGogtOwd1Z/JfSTHSynk?=
 =?us-ascii?Q?v/zLmP9944B6p85Gb9qzTrfyX/qrNP0DivtxejRZpu4k/lnoMOdeQQzBo5LU?=
 =?us-ascii?Q?sYfia2t9EJuUyC1oTDpHWQwd2j6kiYtgTNUw8rEYDSJGhwkslIS+/T7ntDUi?=
 =?us-ascii?Q?iG/ho3F+gTWhX/GCZ0gZZRwKnjXd34TPkgH1NIl3ySIip8SG7W7PhOU0B85o?=
 =?us-ascii?Q?j+ZmjlhzY+2C4OueOieMJ6XfLkf5icnDtImKgRxhr6z4j/9tZvX6y4BRa/aR?=
 =?us-ascii?Q?a6sNIBVXpx7tpT6shw/IjCE4KD1Ns6Y5u46/i076ceSmHjt71AwdeFeR0tVR?=
 =?us-ascii?Q?JGR5VIDMHCPWLUHpGa0P4QpOHInBp2BOwBr/2mezgXdV8EDuPLVB9WTL5zKw?=
 =?us-ascii?Q?64jmKu2yyyKT69mf4JP4T6/kxoQ7OPeCP8LCsItSpwkA0MrnWQfCpzucPgKA?=
 =?us-ascii?Q?hffeCNzMa4Dcv7Pr2qb1qbTTOXrxRQfqRdGRHhFnqt+E4C1qBDgF8uG2glJ4?=
 =?us-ascii?Q?v1cYt/9rQMOJLuIDSLZvuVLalJIt0squhB6ShcGeu2MumVcHxv2pvpEc/CTs?=
 =?us-ascii?Q?t8GTBmp8xdAfZubNJDwlt/KMmvz7srXA97YBfLN8m5OcmlzOjFr5mgPu49K4?=
 =?us-ascii?Q?y3qSuiHU3+SK9BjfbAWx4w+uiVUE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d1b68c-220a-4095-f73c-08d9253a440d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:23.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbtpkqhXRjHmdF9Zi6qKs5liwIsMupCBSxZiNxZXhq0pR2MU9dsAUagDUijpEi0qYRqdru/1N8dXhcsC6KjFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose close device and add open device wich preserves
test index.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/amdgpu_test.c | 31 ++++++++++++++++++++++++++++---
 tests/amdgpu/amdgpu_test.h |  3 +++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amdgpu_test.c b/tests/amdgpu/amdgpu_test.c
index 60f3a508..2864eaff 100644
--- a/tests/amdgpu/amdgpu_test.c
+++ b/tests/amdgpu/amdgpu_test.c
@@ -339,12 +339,13 @@ static int amdgpu_open_devices(int open_render_node)
 
 /* Close AMD devices.
  */
-static void amdgpu_close_devices()
+void amdgpu_close_devices()
 {
 	int i;
 	for (i = 0; i < MAX_CARDS_SUPPORTED; i++)
-		if (drm_amdgpu[i] >=0)
+		if (drm_amdgpu[i] >=0) {
 			close(drm_amdgpu[i]);
+		}
 }
 
 /* Print AMD devices information */
@@ -520,6 +521,31 @@ static void amdgpu_disable_suites()
 			fprintf(stderr, "test deactivation failed - %s\n", CU_get_error_msg());
 }
 
+int test_device_index;
+
+int amdgpu_open_device_on_test_index(int render_node)
+{
+	int i;
+
+	if (amdgpu_open_devices(open_render_node) <= 0) {
+		perror("Cannot open AMDGPU device");
+		return -1;
+	}
+
+	if (test_device_index >= 0) {
+		/* Most tests run on device of drm_amdgpu[0].
+		 * Swap the chosen device to drm_amdgpu[0].
+		 */
+		i = drm_amdgpu[0];
+		drm_amdgpu[0] = drm_amdgpu[test_device_index];
+		drm_amdgpu[test_device_index] = i;
+	}
+
+	return 0;
+
+
+}
+
 /* The main() function for setting up and running the tests.
  * Returns a CUE_SUCCESS on successful running, another
  * CUnit error code on failure.
@@ -535,7 +561,6 @@ int main(int argc, char **argv)
 	int display_devices = 0;/* By default not to display devices' info */
 	CU_pSuite pSuite = NULL;
 	CU_pTest  pTest  = NULL;
-	int test_device_index;
 	int display_list = 0;
 	int force_run = 0;
 
diff --git a/tests/amdgpu/amdgpu_test.h b/tests/amdgpu/amdgpu_test.h
index 4970d0dd..107134a5 100644
--- a/tests/amdgpu/amdgpu_test.h
+++ b/tests/amdgpu/amdgpu_test.h
@@ -476,4 +476,7 @@ void amdgpu_test_exec_cs_helper_raw(amdgpu_device_handle device_handle,
 				    struct amdgpu_cs_request *ibs_request,
 				    bool secure);
 
+void amdgpu_close_devices();
+int amdgpu_open_device_on_test_index(int render_node);
+
 #endif  /* #ifdef _AMDGPU_TEST_H_ */
-- 
2.25.1

