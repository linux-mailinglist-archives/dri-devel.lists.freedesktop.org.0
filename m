Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDE397B19
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95C36EB10;
	Tue,  1 Jun 2021 20:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743796EB0C;
 Tue,  1 Jun 2021 20:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMRf9ogja/lJODhHAIM4xeuFd23qInC1RmOMtw0G63qVf8B0Luh+PAHHCiaqA5WPg8rbxSRVERa2hj/C4LmwbaJwae3CRIQNQ1TsezWnAt2JcVkr/KgB5W3yQbyRxbcMeXnDYQUszDyw6bYK0bP1YQqqXfyrxi9zx/Pf2QRWOLqRaBy38t3t1guMc3Q9f+tM2HuWnU8YEm7bO9WRwWFTPp2ELJOyotM8UlJ2LSOAwv2Et3LS8QvKlm4iP/LdNP7uxgVZtG6+tewdjWwCA+zgq7RTD619Neu4cc6PwxgqP66pui4SPQpnFWNf7+vXvfVWLU60GwGJSwUKpVxDADTJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1uQUDa+D9HISb73PbP87cu0bwgx6Mc5NImfIpUN6qA=;
 b=dmJtJ/Nu6FsjJt0bW5go87ilK3Q5lzSq9e/OPdoZB6yvKfoycmowRNUy1Dydl+D5MmjDKpxmdLiLRsc/iksTC68I4eh6Mwr/LMEVpwEhEC5WLAco9NzeTxseRkoOdFTzLltQ1k2ZcXoYtFzhsQBYPumWPoqOw8O/xaARlWuJw7ZBP1t+A61oNt6kde3d2m9NuhPR4/NstoTGNHb7yo04FatHz1gAy1BOAV/pe1xzaHLSBN2n00pjAIvDoxKFTPEBJ4hJ0daw0rYg8bbF2LddVSoTNYSVdeU5Wzj6cj/JumB2F7ZSEpg+Au1K+eU76YWWD5KncRNbA6iwf7yTk7DNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1uQUDa+D9HISb73PbP87cu0bwgx6Mc5NImfIpUN6qA=;
 b=a6dhbvdZJcf/1j4CenwZ8m/kQB8PY0PHJB4r3KmcrF0az5fQFCC476dSZvhygTmJcO4NL47SncDVkfVGVrtkeST5nzPXQpKGv3LEH2YYdADmkSp27VFE8kLlXh/QKssRjSHmxIEzXNW7UxYd8ws1oD700L4Eu/euPATimL2I1pA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:29 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:29 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] tests/amdgpu/hotunplug: Add hotunplug with exported bo
 test
Date: Tue,  1 Jun 2021 16:17:02 -0400
Message-Id: <20210601201702.23316-8-andrey.grodzovsky@amd.com>
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
 Transport; Tue, 1 Jun 2021 20:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee54789-4be9-4cb8-3ed5-08d9253a47a5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27025FD389FD964499F611BBEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQgBTnE+ZOQKtHvEzaw0TKBM3QZWt5LzcL1tHYVnSZQNXmIjA1N6WkC2MGuvMB2H1XtHAm8+CkF9xWQ88rvcrQbJFrX8HTHzxukWVxNPLLbbOPHSUM7B24Kf90EEMw/bVcIWFFtmn3h0wdi2W146Dai8AJag9SLVnXEX6EmP3hkmFlhPknwbUAjM9hgr9wWin+c0wCggaWVeft6Vva1scmE8oZgjtpUqY6vDpIeFUEhvNJ1GWkfMLjnhlvXK0I6VWakbkHeNgjAy0DSsm0TYT0wNce1ZqlQRSPQ6vNzTaHb0cjC2fMwhsY8UUFk48EVpmuSZASb2vWKKxLxsXok5wVJWFm1S8hpv4U6thsKnTcxtNCrsQj/qv/Jx6Tl8blZDG06ATnAB8sS/Un+xReRyVRyU5xqEXLxanj036nFQuk2v4/Z3JKh8OAp7E1lNJiUpCHFCT5Vu1l/NXWf/ly/VrW2WMVvqu3i99RnxLApscHRRar4rNbJ421wNNfoK/RmmXaNC3sFBzLkXPgpBV3vQyovhn9d1CSMYNbWTkQyeIHXL6A+sOiJt6iWfzdKgfVezQauZWapHdXWQghnt1RL+ml72GTkYJD96hUXVqIqbICI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CilxtRXf8rCeiDkY3CTno+Ph0vmI63iBKoLxYLZoVpNCS4OsfwJem1hGrkM6?=
 =?us-ascii?Q?KHYVDNQAWN8ST2uMIYgIsuTxRSWWB1I8ywDMISQUTNZl9T8yQ6OdFFYaGQWT?=
 =?us-ascii?Q?fWAy8pV6zZ0+rTLgmx5kgtczwr5ex5XowDYVah72Cr5XvsgCOMlBZ2yHEXCt?=
 =?us-ascii?Q?DGHZovNPmEGCJWc2fxgeHs3IDNCHbKp4znXqDxiYQ8QWdqHsAxB9ajbqL85M?=
 =?us-ascii?Q?vWiltdDXmWEtIJWJDm9r7z5gqZQH7XKuaOjbP3AGod2/zsE1CSZaKejuMx2w?=
 =?us-ascii?Q?+mNw3ffOCnwWVuLAWXRkb9wFi+QzWvBgudUu479A0/kkJSYPgsjN8aol2500?=
 =?us-ascii?Q?Si319ya8MIelqSbDFGjiXtfh3eSqfdVyyEernEy4oZlu0yq3m1rbuySOxzO8?=
 =?us-ascii?Q?agJKCaQMG1jUWQhQgP6I6IwkAftmZNjhoF+ak8sXgMXATi90eRcpb5jgx5u9?=
 =?us-ascii?Q?i9R+E3TX0S6qUASAtqV5WZDMcXaZYVnknKX3oZ3xUA72O05IwBKdnrGjuijH?=
 =?us-ascii?Q?z/XH75gdJqnXO3Sc6sEIelwHMHBHGoquuQkAJuOeU3x/GJnylL8HkMvLje0M?=
 =?us-ascii?Q?vvrzlnewQVkZPf+zsF0jy+Zfgt4KowpcjC+0d8Kda/4hWWTTYVQGoR26js9f?=
 =?us-ascii?Q?p27cH3wIOPnPdkQOCVvReyYxQjZ4t5eaIDGMduYuoSRoJ2pMj1iWbZnCsnQc?=
 =?us-ascii?Q?4MRrz0WXn/4iD21TcBVa6uNEsKKw4PZSLXtfA+A93TwsA6DaQdks0zeBBDpz?=
 =?us-ascii?Q?fOe6mIsPmwXAVwT7Yx3ejA0MTq4xabJKY3fv5yzlAbxiCikpd2jhd5KZeFyn?=
 =?us-ascii?Q?8uFy6MtNSirQzLaWWtkN1af5SlUfkaM+rcWcdSEjAj1AYM3uEKfe+FXvQ78r?=
 =?us-ascii?Q?O9yveLUMye8kKWxqRQsSOcNMDTE8w6u9sUutdXojZTSPJbuT12Zv0R/yb6n1?=
 =?us-ascii?Q?bqfsdLbljZ2k+1iaeHIYUPAhUv2rvDyKnRuWn0epKHTHEUziaJw55zeQ0xbP?=
 =?us-ascii?Q?Jy7llaySZ/iGaN6Siybqo5F0qV3qHxnxACfaOm8g2lHez9wOpaA+Kk6fy3Uy?=
 =?us-ascii?Q?KaExDEt71LGZ2p04w9RsgeJiRLNx1PFIaawT0fBkvTaVPvjOFArq77cu5o5e?=
 =?us-ascii?Q?4qKDCiqONflgyaTmH2MzgmB4Rb7IBCDYl8dTAQAKOr9F9K6E9MYsLWI3ovWI?=
 =?us-ascii?Q?0M0fEt7v/FR23kTATPE1ovbrnRVrWralXuxmChRbhYHv9k+9DjNyRwgQZOGJ?=
 =?us-ascii?Q?29v1s8n1fMiyGnds4c37CrJvb32GbCZDwXvNcYqNINXuH2VFzAQcn+qv0RQR?=
 =?us-ascii?Q?BRg3iGJbJJcFUizv4tWN+YtwLhrkvKIcGYxmixKiWrQ0Nf/ygNg+QpkcVjWw?=
 =?us-ascii?Q?WxelfIzMBvMJgJ/i2WggfitX0vQm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee54789-4be9-4cb8-3ed5-08d9253a47a5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:29.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivg46NFGQSuYp0GRCau/wzz4k/2ObOwiE5SKYLCnqNMkhSwQyc32RJB09rwWuU1GhQpNiT4dPnCdzXQ9DsD+xw==
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

Disconnect device while BO is exported.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/hotunplug_tests.c | 46 ++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/hotunplug_tests.c b/tests/amdgpu/hotunplug_tests.c
index 6e133a07..01ac6c62 100644
--- a/tests/amdgpu/hotunplug_tests.c
+++ b/tests/amdgpu/hotunplug_tests.c
@@ -306,10 +306,52 @@ static void amdgpu_hotunplug_with_cs(void)
 	amdgpu_hotunplug_test(true);
 }
 
+static void amdgpu_hotunplug_with_exported_bo(void)
+{
+	int r;
+	uint32_t dma_buf_fd;
+	unsigned int *ptr;
+	amdgpu_bo_handle bo_handle;
+
+	struct amdgpu_bo_alloc_request request = {
+		.alloc_size = 4096,
+		.phys_alignment = 4096,
+		.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+		.flags = 0,
+	};
+
+	r = amdgpu_hotunplug_setup_test();
+	CU_ASSERT_EQUAL(r , 0);
+
+	amdgpu_bo_alloc(device_handle, &request, &bo_handle);
+	CU_ASSERT_EQUAL(r, 0);
+
+	r = amdgpu_bo_export(bo_handle, amdgpu_bo_handle_type_dma_buf_fd, &dma_buf_fd);
+	CU_ASSERT_EQUAL(r, 0);
+
+	ptr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	CU_ASSERT_NOT_EQUAL(ptr,  MAP_FAILED);
+
+	r = amdgpu_hotunplug_remove();
+	CU_ASSERT_EQUAL(r > 0, 1);
+
+	amdgpu_bo_free(bo_handle);
+
+	r = amdgpu_hotunplug_teardown_test();
+	CU_ASSERT_EQUAL(r , 0);
+
+	*ptr = 0xdeafbeef;
+
+	munmap(ptr, 4096);
+	close (dma_buf_fd);
+
+	r = amdgpu_hotunplug_rescan();
+	CU_ASSERT_EQUAL(r > 0, 1);
+}
+
 CU_TestInfo hotunplug_tests[] = {
 	{ "Unplug card and rescan the bus to plug it back", amdgpu_hotunplug_simple },
 	{ "Same as first test but with command submission", amdgpu_hotunplug_with_cs },
+	{ "Unplug with exported bo", amdgpu_hotunplug_with_exported_bo },
 	CU_TEST_INFO_NULL,
 };
-
-
-- 
2.25.1

