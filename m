Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0EE397B15
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0F06EB08;
	Tue,  1 Jun 2021 20:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4F6EAE2;
 Tue,  1 Jun 2021 20:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh/yLdDC/xyuky4l0jVXNlrPdl6PLBGMSTCHzCvXWUxPvolKQ15cClX43xVmcU003kow4GuAjLPj1V7JLVt9J4Q/pdknnrbVRI8UEnkc0UKjmCMdLLxsI5tlxtlwExU/BMbmK6m6W8qqAncJFLIU1RS7MSXcTooRcK/KFpSF6sDNS1TuOeMHOwrPPdw/L1dRU5ErEoxOdzNerZan4+Gz6QOQyDyQ14nJ3+iOL7bweDf2+3Lz2IlmSDM0f4gRZAJMNSL+63Vxri9z4o3uXeDG9vHtpqo+M+U5xZ0bWmIawIQfNW2BqbxMo9BzpAqzd9oVBGYKYf6BF4hgbuiB/lpQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iQhP4nRjpQD/qYKvZwANUDp4dzNJyRYmbfuEz9rFL4=;
 b=Or2xE6FoffmmDqSORmd/aqYYVQFqeMC7/9eHNtayMUmSe2VHrDPD0gu4rjFMnxstvoiB5sgLgxUTlERWQBUuYPuRkvEp/PH6B7ptqSx0s1nt5DUOIZP7mBRFAO07gZ+mxSRDQxyFCNk6qnTfD8z6Qm5voPADyXBqC4xSQx/NRQj1QBu6zhz5qtWL/fbdQKSiG1ktHqNEBmZDkL9ZPcUkbSLF9WCH8fwpNGhsiRlc7GIrd0INdLbOh2SB32yr1VWHC2ZGmm3cQ2qumG99TTM/xN+0oPisZWM5LMDUtRScw+gbZcPCGvrDsUrN7O0GxYAY+nm74McPEoYGblPF6yxYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iQhP4nRjpQD/qYKvZwANUDp4dzNJyRYmbfuEz9rFL4=;
 b=keq33Jmq7WfiVbnHhOw/oBPQoVb4my4W+yfBXNDz7FOwdfJpc/2md7vlakzYgP/M5YYaZqYmuyi0n2nlI9dMGi9q38ihTPFOpCPpEWNwPJfpteBIyfZcVtyEoWlBAUE5BHYBgtEzLtIjg/J+aW7obpUiSYx/XhnvQI1TOkOPyKE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:26 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:26 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] test/amdgpu/hotunplug: Add basic test
Date: Tue,  1 Jun 2021 16:17:00 -0400
Message-Id: <20210601201702.23316-6-andrey.grodzovsky@amd.com>
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
 Transport; Tue, 1 Jun 2021 20:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0217fb5f-b3ad-4273-d873-08d9253a45cf
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2702579FE5FE261B29138C3EEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxaQgxEAJS0Q1Ugb2FxrZBvNIoXaIIEjUNUsZkzL4v3nxE2XiABUGWrYga6LEMsCnthNjX0m8ieQA/s03XoqnD8EkQ99dvfuSEFUycHH95DneooFW3OS/DHZbC25bbv0BWanPM9unhEQ9kPbfdsissOaIg+EoZcck7T7Cv+MvXQGeiBoDgo/ymIf1WBbADpcJvN1Zxa8H+QInSt2dixML1g/q/ajgSYqIS0gdC3M7YU65vhVMWP01PU/hwqjA/+1dwiE0RjdX9SymmLfaxuKksdGfa+JsYNdoSV3TXytjC4Ggvlv3BdwVY9pXdpEAweLin3orepaxrQtOVcu1TqldV50Ui8e0QRFntZZzF72P8JMvcBWps0/RgqO/fkVsFccBR634KSWb/tE1HH6xZbwpdxzK9tQ52N1kjESZA+mLlNtKpFSqHivgmYCG0FbPsbFbuF3xE89kXjXj0iPcUb2i/LMcuvFISNLmSSWmRGcAYWe2vTiig8jwyz2BIQfuB1COlcnMY6M/cjnQIyar2whS/mzGoXQbOf3IsQN6TexsZYws4FVo9t7d8MRwm6kOt8kQjcpJ0OPn+CwYKsv+i/YkqW3mbx9t0ZmfMfZ8cNH5kk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jdSx6etN+OVro/yga/yQCGsMtm7YbsYP/+SJqilSp386iBhquZ0I00BX5GPd?=
 =?us-ascii?Q?DMmStR+dpncCSZhF2aG961oYUkL/kaLVJ6pmJ5x6TXa0dART615vnSWrrk/I?=
 =?us-ascii?Q?lP5uZ9vQCJQEolZIwW7JZ5mWfEoNIXIb1jj1ze4MTwHa0LfOU0Bv8O6nAE+k?=
 =?us-ascii?Q?KWrHf6WUQVDjZxmjQ4v1ffxvBMzItGeCA79kg6fOuSpvtz5rgtF2fdgCDVQK?=
 =?us-ascii?Q?qO94XgGK5klf6kosuLWgDueBCcf+b3HaJtJDLyXhrDxxclcQJO/a0V+gC1P5?=
 =?us-ascii?Q?YE46bJWhJH2fHGWvcR8xk+DqsY8Z0sE3/WOejGAbY/0UaxvQ0WFk3B32rC3a?=
 =?us-ascii?Q?HMT5SImgkk7+1mvJw3YYdaz7azkzcDyV1IpyrbQPU39Kgx0xCPN1qUSGr5yY?=
 =?us-ascii?Q?e720ez1QTxpuegZTF/oKHBUv+N7JESGwgYXgySSUHHJ2pEqxXjn3nR3Uhrmi?=
 =?us-ascii?Q?v7QhWSQZRaiKMzIbsaoBCvkNydAKCkNraorx5vKef0TAjh2B1mEIJhilywqj?=
 =?us-ascii?Q?Ch5H3bm/BKVcSo+ojxSknOrINsMzIPBn72A3VVm5HgtQQN/K/k3WvnT3tBCy?=
 =?us-ascii?Q?DpPagWf0a6k81+juq//78sU5VxxX6REZbXt1Mi8aHE6bHdopgQVtdaiyMUYe?=
 =?us-ascii?Q?M8dlJDv8S3nGH6b0ep/EPWMk0UAf6AMrC8lpQk2yULlATjUC0rVccEhgjURF?=
 =?us-ascii?Q?JmXvuIvmHlVU8W5CdkAfZqzhXddQ/y5PG1gF2iXa+Myq0I+LC4d5Nqd1qPoh?=
 =?us-ascii?Q?Qrny1KSF4FlmttgGh2Uanpc56vMpYxwDhEMtgpQDKiISlcdrVNvlLDECCZy1?=
 =?us-ascii?Q?/dWUpxvUZEORH/9epuMdTdgebVfgfFbSk+cZh+5nHlPtoNn26YzzBnYLsFFC?=
 =?us-ascii?Q?KWRf08mBLEDIyiHqHplTyf1SoNcZIqQBRr4bldjqjy+NWPO26UM9McsAWrql?=
 =?us-ascii?Q?qcYcxOHvDlpaOoMxOa2V4Zvr2rDtOk7zxYRP1nt+hY/a4EYpy0V0PUwv8Mgy?=
 =?us-ascii?Q?kPJFmeg8R9PtuJkcFpWRuxoFH/fp0QqrhzBjZ7h6Ygn2dKn2Tlf0u4ALKwXw?=
 =?us-ascii?Q?hw14hgjTPw89Crsq6OAiv9zQYKCG+V7bZ4unVScg2DBeGL0PsUR/G6O+oFWI?=
 =?us-ascii?Q?S1titWwyu7pD8+NBbbXE0JeHeDL4NGmMikDTHzrHxj+uUmbEyvRi2yVrcqx1?=
 =?us-ascii?Q?pDIZEKB7TDLXyf98BXRYEIv+zJiHk1CIoz0ivIC0MdDUumyzDHE601ZZWE/S?=
 =?us-ascii?Q?kUUKKGZ4UQmwvLorpb+RzU0xhyeafV8KZpL734HQLE8fRdg52lOZAEzfO85/?=
 =?us-ascii?Q?wB2q0pR8TNYrSmBJ1UkEREMwQqnU73MaoIiJmDBAiydW6Gh6wPxxqB9D1Bif?=
 =?us-ascii?Q?pZy+pq+KktV6r3Iv8Oi71Jo00++C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0217fb5f-b3ad-4273-d873-08d9253a45cf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:26.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGjvacX+0uHnB8i2wmZZSOvClPExjuG++O89LatFr8YBYAesCTtURC17yf6+naUVNlDdZFmBYM6iTh0K8vxz+g==
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

Add plug/unplug device and open/close device file
infrastrucutre.
Add basic test - unplug device while device file still
open. Close device file afterwards and replug the device.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/hotunplug_tests.c | 135 +++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 30 deletions(-)

diff --git a/tests/amdgpu/hotunplug_tests.c b/tests/amdgpu/hotunplug_tests.c
index 9d11dae4..c2bc1cf2 100644
--- a/tests/amdgpu/hotunplug_tests.c
+++ b/tests/amdgpu/hotunplug_tests.c
@@ -21,9 +21,11 @@
  *
 */
 
-#include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
 #if HAVE_ALLOCA_H
 # include <alloca.h>
 #endif
@@ -33,40 +35,40 @@
 #include "amdgpu_test.h"
 #include "amdgpu_drm.h"
 #include "amdgpu_internal.h"
-
+#include "xf86drm.h"
 #include <pthread.h>
 
 
 static  amdgpu_device_handle device_handle;
 static  uint32_t  major_version;
 static  uint32_t  minor_version;
-
-static uint32_t family_id;
-static uint32_t chip_rev;
-static uint32_t chip_id;
+static char *sysfs_remove = NULL;
 
 CU_BOOL suite_hotunplug_tests_enable(void)
 {
 	CU_BOOL enable = CU_TRUE;
+	drmDevicePtr device;
+
+	if (drmGetDevice2(drm_amdgpu[0], DRM_DEVICE_GET_PCI_REVISION, &device)) {
+		printf("\n\nGPU Failed to get DRM device PCI info!\n");
+		return CU_FALSE;
+	}
+
+	if (device->bustype != DRM_BUS_PCI) {
+		printf("\n\nGPU device is not on PCI bus!\n");
+		amdgpu_device_deinitialize(device_handle);
+		return CU_FALSE;
+	}
+
+	/* Disable until the hot-unplug support in kernel gets into drm-next */
+	if (major_version < 0xff)
+		enable = false;
 
 	if (amdgpu_device_initialize(drm_amdgpu[0], &major_version,
 					     &minor_version, &device_handle))
 		return CU_FALSE;
 
-	family_id = device_handle->info.family_id;
-	chip_id = device_handle->info.chip_external_rev;
-	chip_rev = device_handle->info.chip_rev;
-
-	/*
-	 * Only enable for ASICs supporting GPU reset and for which it's enabled
-	 * by default (currently GFX8/9 dGPUS)
-	 */
-	if (family_id != AMDGPU_FAMILY_VI &&
-	    family_id != AMDGPU_FAMILY_AI &&
-	    family_id != AMDGPU_FAMILY_CI) {
-		printf("\n\nGPU reset is not enabled for the ASIC, hotunplug suite disabled\n");
-		enable = CU_FALSE;
-	}
+	/* TODO Once DRM version for unplug feature ready compare here agains it*/
 
 	if (amdgpu_device_deinitialize(device_handle))
 		return CU_FALSE;
@@ -75,8 +77,46 @@ CU_BOOL suite_hotunplug_tests_enable(void)
 }
 
 int suite_hotunplug_tests_init(void)
+{
+	/* We need to open/close device at each test manually */
+	amdgpu_close_devices();
+
+	return CUE_SUCCESS;
+}
+
+int suite_hotunplug_tests_clean(void)
+{
+
+
+	return CUE_SUCCESS;
+}
+
+static int amdgpu_hotunplug_trigger(const char *pathname)
+{
+	int fd, len;
+
+	fd = open(pathname, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	len = write(fd, "1", 1);
+	close(fd);
+
+	return len;
+}
+
+static int amdgpu_hotunplug_setup_test()
 {
 	int r;
+	char *tmp_str;
+
+	if (amdgpu_open_device_on_test_index(open_render_node) <= 0) {
+		printf("\n\n Failed to reopen device file!\n");
+		return CUE_SINIT_FAILED;
+
+
+
+	}
 
 	r = amdgpu_device_initialize(drm_amdgpu[0], &major_version,
 				   &minor_version, &device_handle);
@@ -89,27 +129,62 @@ int suite_hotunplug_tests_init(void)
 		return CUE_SINIT_FAILED;
 	}
 
-	return CUE_SUCCESS;
+	tmp_str = drmGetCharDeviceFromFd(drm_amdgpu[0]);
+	if (!tmp_str){
+		printf("\n\n Device path not found!\n");
+		return  CUE_SINIT_FAILED;
+	}
+
+	sysfs_remove = realloc(tmp_str, strlen(tmp_str) * 2);
+	strcat(sysfs_remove, "/device/remove");
+
+	return 0;
+
 }
 
-int suite_hotunplug_tests_clean(void)
+static int amdgpu_hotunplug_teardown_test()
 {
-	int r = amdgpu_device_deinitialize(device_handle);
-
-	if (r == 0)
-		return CUE_SUCCESS;
-	else
+	if (amdgpu_device_deinitialize(device_handle))
 		return CUE_SCLEAN_FAILED;
+
+	amdgpu_close_devices();
+
+	if (sysfs_remove)
+		free(sysfs_remove);
+
+	return 0;
+}
+
+static inline int amdgpu_hotunplug_remove()
+{
+	return amdgpu_hotunplug_trigger(sysfs_remove);
+}
+
+static inline int amdgpu_hotunplug_rescan()
+{
+	return amdgpu_hotunplug_trigger("/sys/bus/pci/rescan");
 }
 
 
-static void amdgpu_hotunplug_gfx(void)
+static void amdgpu_hotunplug_simple(void)
 {
-	printf("Hello!\n");
+	int r;
+
+	r = amdgpu_hotunplug_setup_test();
+	CU_ASSERT_EQUAL(r , 0);
+
+	r = amdgpu_hotunplug_remove();
+	CU_ASSERT_EQUAL(r > 0, 1);
+
+	r = amdgpu_hotunplug_teardown_test();
+	CU_ASSERT_EQUAL(r , 0);
+
+	r = amdgpu_hotunplug_rescan();
+	CU_ASSERT_EQUAL(r > 0, 1);
 }
 
 CU_TestInfo hotunplug_tests[] = {
-	{ "gfx ring block test (set amdgpu.lockup_timeout=50)", amdgpu_hotunplug_gfx },
+	{ "Unplug card and rescan the bus to plug it back", amdgpu_hotunplug_simple },
 	CU_TEST_INFO_NULL,
 };
 
-- 
2.25.1

