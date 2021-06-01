Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E62397B17
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF566EB0A;
	Tue,  1 Jun 2021 20:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACBB6EAE2;
 Tue,  1 Jun 2021 20:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/mhUKj4lU0XuHCzaDuJjLV9CATvXjckcmgN9DxAmfs0VhSPAoGmJV4SETFxkNDPHKzL4XX0sds/Pp1mi5lQMlMF5fn6ZDEzNERu0LGrKgnKoDgxHUGUyjgQ7bZb4lxl9ZIM+xOnWnkIXGEsjroHN0fbN/wDwEDobIoEq61oy5ex5U+p2niQMfnYrvzs6GL/t1aUM6/9FE0z68xJ2ogppQFac+XixrvsijTPeQreHMYjWWJdrIZZydYuEjAqwIMZkTORKv6hRM/cditB7sV2rl8z/z8MkxBMyo562V4XoRldkdNEz9/toJoLTDD77ojC0KhT6LIMeGNa07RdAu+9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KuXxkA7rHvayWhCGh3oLlIwj1eONOIedrRNrO4Wuyk=;
 b=GwEm3d5ClUAlcGEy9zbigYXjhJKbhvJgHQQ8jexCsT2Ja7RVxYwzJE6DpHj7tBo/ev6uoN3XQIpuB5lgK6msOcYCEM0AtBQDKs+BjcZQ33kBSpm2jL6RkK6ll1qUbSrllOSbT3sqbMo5B07TGzSHc1rGN9MKRYN6UAY2/OIg65BDp5HogZX3bH6wTeR8Q0GSskNTA+vBsOt+30iPmyQyq5l8Y5j8UevCdnJbBlMUxkc1p9b8gtJceM/CPrs9tZDxYlYT+AxYJu9uqG3qltnVB7aFp+z0qHoEyqKBeXjIVZMtVivYAoWFV2eW+PIgMoh2Mtt7vFBaX7iE7ImsojWniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KuXxkA7rHvayWhCGh3oLlIwj1eONOIedrRNrO4Wuyk=;
 b=XKLGgr3HHgyfjVx1ed2tuhakgjl3q5oZFPj59jy0Ckv5Bg/jFQLp0ppFS/0jTBZA+Szcl1CbVPEYajQDV6fetko/3g1sMZXfXqAuZeGUQxUXvrLbaDuX+ECKsi1yeq7kVzlcw2PAO8OMqT+IbzWTnX6ZhpNs367R5GibUZFdBoU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:27 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:27 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] tests/amdgpu/hotunplug: Add unplug with cs test.
Date: Tue,  1 Jun 2021 16:17:01 -0400
Message-Id: <20210601201702.23316-7-andrey.grodzovsky@amd.com>
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
 Transport; Tue, 1 Jun 2021 20:17:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18f3b099-ec71-4aba-2d83-08d9253a46a7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27028D53604EEF8F2AC68D5AEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDlEACAIguesX3U5nt5lsB1ROshorPFsRlPWIyK07mTcLT5tNTRHLNbm5rFafpaakjOpZkTyEapPFfw+AklTbIKOjHCkRCKomYQNDi6jgIwS+xN05GNiKR3sOW0Mu/9ygQtOPEG5QEI2nZkP8Tm5NhziN4YXvoL75aEf4hrf4Y/EGBtaFXSkT6EcI4Mm02w4/2LGPcX0abt9SC8GkUM79uKehaiHg8BKZ7Y/iJwdz2/MKC53rmvrf8gUMhwt16kLY9SQOD9+6KNC1eoZEd4rcVXpYBElJKKRaarfxDwZcqTP1AvZqeiQk+5ki7Y6UPdKzTPuhYH8mYwxo7fS3SjB70X0H+fmAHPx35xzKWGFURshl8sxKdaXAc8l0AmxmJiD439tTw9APRDlDAhTqgmMOYM91JJ/bibyzv/dUXPXrEDS71zRAPrduu40FIO1ayMKCUyukAzYr57nlkqi8wxEE5LM3iJ1gvisFqYF7s4p4A6h3jusBJYih8SWKP2dF9mhumgWz07LM4TENjlkVtLY1GKDxyqWVsS31YFnuqfqKYJK/pT9Jl0I2a6URUZ2ENGCvLZ/uSGRpXe/zS16JdhsPOe5J2czwYx/EjlneNLZR6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?POsXb/xygh8wenVYOFTMn3/N5nsgOrGveWTCN3T+ZKuEr5ITg45oqG5GrQte?=
 =?us-ascii?Q?LEF/ELoNUxwFpt/wg5lgOUntfzq/IMb3vTG6UcVhputo04cvR+8HnLreIXLk?=
 =?us-ascii?Q?0ZzSIyRqGiW5FhRpWFDYpf5E4UTIZv2ttHStj9LPb7e3dQVt0SQeQ1GwSd6E?=
 =?us-ascii?Q?dE8tscHW0ca2ipXNte9XigsZvh4710wIu8JG7Tu7T3xd9GuljxC8LnXP+iZI?=
 =?us-ascii?Q?avuozFsiGuk5eG92kxeIM8r8Oux0bTi9luOOjAosceciiKuCz6ZQlzbxnN6f?=
 =?us-ascii?Q?DdqOE7quT+s0HhrnXR8Hpg5PxGbeqhjrtQ4RyWenIt3iJCEMAtEwxZS0KCLs?=
 =?us-ascii?Q?PVeBsr0L54RJ/kX652ScgCNTKqWYHEBFmR/8st+j/uDQm5ISlcxOg62dPQGD?=
 =?us-ascii?Q?b/3UrgEGQ/dTk6SKPTzIY1ogQ6+hUxCr4cB7ATPKAEVVeGBkV+NNCjN9TQU0?=
 =?us-ascii?Q?VKQPwhub9mx/Ciybx5WNroSbH5upYvz353kLy4mDaGXo4dYvvK+MUTobY2YR?=
 =?us-ascii?Q?Le/Tpc7Gi/4M4LO3+lZ2jBc+KWKDZ4Jlr/umsvDEf2iwRGScyrW45TyM2zUO?=
 =?us-ascii?Q?3Voy+WxhJjnXBpe+vnYs7U+Jxu9JWVxLBx77QTXCWQmCYuR5PxOBBgf2IjuV?=
 =?us-ascii?Q?G5473bBw1NHxKY9rnSfvFEv+0VXRHC7+6N4zWeGa8iULTXJvobUzZN1mVPEE?=
 =?us-ascii?Q?NAQ9NiF15+FT7ObQ3XfWHCPMHy/rL56I6+ptUgtTsWTjPUQUxquLCircYNLy?=
 =?us-ascii?Q?vO+nqVNrvt8qNCB4w17ad5rk6kecYoxfqP5OLuMK0VcaRaQjrrAukker66Dt?=
 =?us-ascii?Q?lnOwGvbVxP35TI+zvVB5ESBoyOdA2yKqFstsshAgUs8s7aOkaeThZbln/w9/?=
 =?us-ascii?Q?7TYDWvc8hhHBw9XwPFWiCawXceli728M9INr/U6RzzSiDMsrKTENZ2JAlwbh?=
 =?us-ascii?Q?zsP3mpgG3J4TCmdY64L/0KyjhhSLG7wEhY6lmTbCoOu75ZarrkjCU9FEx/DI?=
 =?us-ascii?Q?fhp45NEki21C0Hx26J9TP/zp2ht+h7n96OZuNUwPGQ//F9LHigXDAUv7MCxf?=
 =?us-ascii?Q?CaP1CCoC3tzXNHNmGT26eZsa/jZaNVlQQwG14NnhsYRC0EahFc5ZxTasMsu5?=
 =?us-ascii?Q?CPKLxevvtYFYGHCrvFgPIe9Fm28t+kwEOspdnR6njzMWns0+26iFmxqBDHnV?=
 =?us-ascii?Q?UDmQJQ8ZJ2mAoJ9SnTTMREQbL6Ef3CFxxLhc10jRZ2c3AIubMfiqfDrvVh79?=
 =?us-ascii?Q?5ML+fYNZkbv19f+N0OO6Bu/vNb5VYtld09MC9SuLcoPGwyiX08FyjOPKtS+r?=
 =?us-ascii?Q?f7evEAxtASS3gQCigL8DYg4NVditCn99J4H3P5c67rMCadgOo/Sh2n6CNG78?=
 =?us-ascii?Q?iFTVaFUXOjH3KF3HrXjmRChScbUY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f3b099-ec71-4aba-2d83-08d9253a46a7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:27.5886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0QXRSzD4qSNoozXccfaiP5/R6AOR3HTXciBvpRnB4l+jrlYi0OMUvKO/WS96zdvy7gwW7iUV+TO6wjbO/bRPw==
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

Same as simple test but while doing cs

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/hotunplug_tests.c | 128 ++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/hotunplug_tests.c b/tests/amdgpu/hotunplug_tests.c
index c2bc1cf2..6e133a07 100644
--- a/tests/amdgpu/hotunplug_tests.c
+++ b/tests/amdgpu/hotunplug_tests.c
@@ -38,11 +38,13 @@
 #include "xf86drm.h"
 #include <pthread.h>
 
+#define GFX_COMPUTE_NOP  0xffff1000
 
 static  amdgpu_device_handle device_handle;
 static  uint32_t  major_version;
 static  uint32_t  minor_version;
 static char *sysfs_remove = NULL;
+static bool do_cs;
 
 CU_BOOL suite_hotunplug_tests_enable(void)
 {
@@ -110,7 +112,7 @@ static int amdgpu_hotunplug_setup_test()
 	int r;
 	char *tmp_str;
 
-	if (amdgpu_open_device_on_test_index(open_render_node) <= 0) {
+	if (amdgpu_open_device_on_test_index(open_render_node) < 0) {
 		printf("\n\n Failed to reopen device file!\n");
 		return CUE_SINIT_FAILED;
 
@@ -165,17 +167,128 @@ static inline int amdgpu_hotunplug_rescan()
 	return amdgpu_hotunplug_trigger("/sys/bus/pci/rescan");
 }
 
+static int amdgpu_cs_sync(amdgpu_context_handle context,
+			   unsigned int ip_type,
+			   int ring,
+			   unsigned int seqno)
+{
+	struct amdgpu_cs_fence fence = {
+		.context = context,
+		.ip_type = ip_type,
+		.ring = ring,
+		.fence = seqno,
+	};
+	uint32_t expired;
+
+	return  amdgpu_cs_query_fence_status(&fence,
+					   AMDGPU_TIMEOUT_INFINITE,
+					   0, &expired);
+}
 
-static void amdgpu_hotunplug_simple(void)
+static void *amdgpu_nop_cs()
+{
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	uint32_t *ptr;
+	int i, r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	amdgpu_context_handle context;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+
+	r = amdgpu_cs_ctx_create(device_handle, &context);
+	CU_ASSERT_EQUAL(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	CU_ASSERT_EQUAL(r, 0);
+
+	ptr = ib_result_cpu;
+	for (i = 0; i < 16; ++i)
+		ptr[i] = GFX_COMPUTE_NOP;
+
+	r = amdgpu_bo_list_create(device_handle, 1, &ib_result_handle, NULL, &bo_list);
+	CU_ASSERT_EQUAL(r, 0);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = 16;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+
+	while (do_cs)
+		amdgpu_cs_submit(context, 0, &ibs_request, 1);
+
+	r = amdgpu_cs_sync(context, AMDGPU_HW_IP_GFX, 0, ibs_request.seq_no);
+	CU_ASSERT_EQUAL((r == 0 || r == -ECANCELED), 1);
+
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+
+	amdgpu_cs_ctx_free(context);
+
+	return (void *)0;
+}
+
+static pthread_t* amdgpu_create_cs_thread()
+{
+	int r;
+	pthread_t *thread = malloc(sizeof(*thread));
+	if (!thread)
+		return NULL;
+
+	do_cs = true;
+
+	r = pthread_create(thread, NULL, amdgpu_nop_cs, NULL);
+	CU_ASSERT_EQUAL(r, 0);
+
+	/* Give thread enough time to start*/
+	usleep(100000);
+	return thread;
+}
+
+static void amdgpu_destroy_cs_thread(pthread_t *thread)
+{
+	void *status;
+
+	do_cs = false;
+
+	pthread_join(*thread, &status);
+	CU_ASSERT_EQUAL(status, 0);
+
+	free(thread);
+}
+
+
+static void amdgpu_hotunplug_test(bool with_cs)
 {
 	int r;
+	pthread_t *thread = NULL;
 
 	r = amdgpu_hotunplug_setup_test();
 	CU_ASSERT_EQUAL(r , 0);
 
+	if (with_cs) {
+		thread = amdgpu_create_cs_thread();
+		CU_ASSERT_NOT_EQUAL(thread, NULL);
+	}
+
 	r = amdgpu_hotunplug_remove();
 	CU_ASSERT_EQUAL(r > 0, 1);
 
+	if (with_cs)
+		amdgpu_destroy_cs_thread(thread);
+
 	r = amdgpu_hotunplug_teardown_test();
 	CU_ASSERT_EQUAL(r , 0);
 
@@ -183,8 +296,19 @@ static void amdgpu_hotunplug_simple(void)
 	CU_ASSERT_EQUAL(r > 0, 1);
 }
 
+static void amdgpu_hotunplug_simple(void)
+{
+	amdgpu_hotunplug_test(false);
+}
+
+static void amdgpu_hotunplug_with_cs(void)
+{
+	amdgpu_hotunplug_test(true);
+}
+
 CU_TestInfo hotunplug_tests[] = {
 	{ "Unplug card and rescan the bus to plug it back", amdgpu_hotunplug_simple },
+	{ "Same as first test but with command submission", amdgpu_hotunplug_with_cs },
 	CU_TEST_INFO_NULL,
 };
 
-- 
2.25.1

