Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3202397B0D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80C66E220;
	Tue,  1 Jun 2021 20:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254246EAD8;
 Tue,  1 Jun 2021 20:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6tT7TzKB63qwC6qK4dClqXrmZIUx5lxQGnB5YlYsqO+kkBRP/uytazSRPaz4VrIra7MBmCnkN/mUTJUjwFJT5qWQ8DhhcPpTIntNFdRVLZrrK4h0pKz/5woayccof+M9/cbmK9ofgpS/sGos8nay+KsyUOrTS5wuxJlUcG1wu6Y2RXyX6gwHL1/JNnisr3VlL762zqUGsS94xEJEIyozhnZMHV6gdaSh73GSVbszWs5HdLmpFXKiGYmnze17dK9Vne+JKFT0sBKrqEpdLnVvSx9pWw6bCQB4622mHX37WPxSyBVYRlr8WhryiT0Pu+FdldOh46t7oa3yCMl4oj2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZI0z8BzFFTtJeqSbs5mhjq+O4xyTOFSrNntgokBzBQ=;
 b=f6uVKngcEoxYrMh42E5/MbZ+79eg/YIWvDC+UVWYcipXaPRgM56qB6V2SMYNoBJRzlfm+dkef7g5EpHNDUTSXXbbpAxo10O7ezD24dn9M/Sbn5xiZB25Dhoo3vQZLGsJvm5e0e8+9Qp3SiQLUIA+Ffi4u/gpws3Sv7PU9l/c+a39ERYrJLcK7P0kun3nqe1Qbmfv93SbbjguNXemm5RTLrgidQwD3fr/Z3GlcF2eA7/WvbBW1LQ3TwJ+9ybQjNe37oN0hj6ksAimOHSa6N43vRCqU3Z5Y86Uc4rmEHnQMx4dkh/o+dgNEb7WVX91bvb4H20Cgl9OqRXXMRZdq4hGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZI0z8BzFFTtJeqSbs5mhjq+O4xyTOFSrNntgokBzBQ=;
 b=GuogSd7pBE9/D6qAF/1qHS6vNiwTTPEJ6UtvU2NhKXs0vcnO1M2XJAuV3/4mD7UUFG74pxa5aI9lf3J4hfxLLv4iuQ4UozQbayOS/tg+wiU43V/VGQKXfBwFXqC8RrJmaGsbmGjcWGDkVZDdDalhb/EwvObb/OksJdRBFX9rO4w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:19 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:19 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] tests/amdgpu: Fix valgrind warning
Date: Tue,  1 Jun 2021 16:16:56 -0400
Message-Id: <20210601201702.23316-2-andrey.grodzovsky@amd.com>
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
 Transport; Tue, 1 Jun 2021 20:17:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdaeb58a-6c87-445b-9f54-08d9253a41e3
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2702567D20C0AF565360725DEA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWMVbsrIYowdKh1QmRai6AtpRapzsibqQYtBMIwenxpAvNwG4QJZsQTr9s7PXtFIFwzFlyQiokZ99V7wKo/F3LOrQcwi1dRWABkx9738HB6RDTtxGwl/My9h1jIMDbatc2aSW92kRVzhjMJda3h1PhFPq3NzGQaee1gjFPdM4iY/JVmrIUvWRQHFZ78yTSw0WAvSvOPNu7zQUkyB8Z+8VaUmucb/bCSCxRVzPaTOUlNNzmTJBzTcrtn/uMQDUlaQZE3aY8svVpq2vnNUrckQ6CBcmY7OSNWHkr+R5tIs/JIjrbP8O99+Gi309ZzwL9CQ/un0BUxx68Iylkg3FPNEo40tE1y4NsM0P5wyYReqwv4hwVQr2Mb0juGDI+3lRp7Yvab/yLNfHtFXML9CJkQm6Cyn1iLIdxDogN+YbJ5Tzd37HokKVLaHuKxMRG8Jdl+h5gaPLwLv96X06QLVILQjFzXPilMpJa63ckcu5+XHr5az2Yhr/srNGXS7PujibhRZXreLzoC1FxW1VYBkcHxgo+V6GPOFU17VfXJaP5ARnCw7K0hur7ixQGrNEcf4+4TwW4GnB4Lqla+fpNWamDQVe0NnzhSMoD7eAeKaYjw1rkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(4744005)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1+/zHQr+oKDLC9001zdI/QX1L8wyipuMIcSwC/hWpwZdLtQcseQTPNYXSWlJ?=
 =?us-ascii?Q?3iX3dVqZfsT/+5T2/6siCn+tNbrpvsMG4UZhr0TIzixrC7PF7uo66zTO1BpG?=
 =?us-ascii?Q?qXnQkWRbjTwiA4a/UxmY6xP5B9Emw08GyMPy6ormtkfKdgTIzl4cMLEBbDqN?=
 =?us-ascii?Q?ejqSOPgeuOtKXtz9lHNGq9kzml51bmHNtQ1Gt8rg0eRcl1udTFL/l/YZwuCj?=
 =?us-ascii?Q?741QxrV4vb6yQDc7vl6M4BIaUzNFlOpQqO+u3qRYEr4jmhFgzQ08UbBedkQf?=
 =?us-ascii?Q?YXw1dtUmEo5MZNb+8QlRlgszK9paL9zsTkZUHIhd+AlgJnp3NVXSJ1HBF0O4?=
 =?us-ascii?Q?QkcxZVjns+FZe+7MXvWM8sSyi9e4/hhRa57hG860KRIHf39gbz7axolG6b2U?=
 =?us-ascii?Q?JYjXhuEEDvxNaS00RAedzY3kdyyMdQVCOmdlIdBYdTzcwgyhbr1wnqYFoxyF?=
 =?us-ascii?Q?Fxcw/nV58feVc5OrAhVbNQNzSDDIRl0vh2r3O7xPLqPe12b2OilwQNcETz/W?=
 =?us-ascii?Q?vhtFLD1Tx0n6mXPyypDuNeUZjsJI/b/LX4tfWXNQ1Gc7n3rqBq+cUjC0EtgM?=
 =?us-ascii?Q?8+C81cq3uwSy2qNJCLqBuX5YDWYKdb9C3AeOKG70UHWi+jcDBUi/5v71Qa86?=
 =?us-ascii?Q?MHr5LFItWLM35EVfneR61hmveeIaE5D9P3fbGSskTfk4yTKL7VWrN4kGV3Wy?=
 =?us-ascii?Q?L1Sh5mX1OXtdIzeRF5yKrcyEMewM74zYnFEX07AdZMDp+SZ4CyYF+9FiVrMV?=
 =?us-ascii?Q?RndXZSRUCEJwV/AjQtVlgVb7IQne96rxA6b2zJ+kURAHPMRXLC1NtLfJYgQD?=
 =?us-ascii?Q?Ps0H+SbSTYgNyCRuLW7a4DT23F/UF6DdBbA72z7HPjOV+29MyVDXjijM+Y7/?=
 =?us-ascii?Q?F6XRkbZTukOYmh1ZPTHPtdpBaewPCi7O8NB/1AAYYMQgliZNRPgaIvXwk8JR?=
 =?us-ascii?Q?rh0LNDMnz4qdEqJ2JDxI7XFuGqXkMNniOQj0MPV64LwKsn94dmlsaWi0mrqk?=
 =?us-ascii?Q?uljtwChl1wo+MtF0WytENDh3Z63DjmFOZXgLNDyrLPYiHH/u2byE8qnigUM0?=
 =?us-ascii?Q?iH6Us3mjV+Miq+Ji35TTZonINa7i74HgX+rdK3E06OOH5vCQdU5C6h0RVHys?=
 =?us-ascii?Q?SAi3dpZbihOcxj0a0b4k/i/JGRJZUYbIuaYlrOE3o2xObby7Nu9qX7yQ+X06?=
 =?us-ascii?Q?blxhbU7dyHJ6bUn7V7HL4ffO9RLmDSJmBZv/cuK6ty/6bufZe9VMiolnCZvD?=
 =?us-ascii?Q?XK737V2C4qWhIgd5QCbnMSqyWpHImPM3X7amr5cAUmaXUhnAC48t1a/Qrcxb?=
 =?us-ascii?Q?sjfQ7VEUzyYvtUd6l207nsC3LUsXiytEKvw8Q/cWUIo8cZhzdLlrqE2oZzIy?=
 =?us-ascii?Q?IsTp/DwlbfQOXtOGwP090H4oVTMZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaeb58a-6c87-445b-9f54-08d9253a41e3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:19.7550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRTY2aovdltbGQRUI9Ci/ZQ65sA5kwJSUc+5EwPMsohYe3tcSPhNFqPk2DP5/R+hYAvBvpReJnJAmYviibPLVA==
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

Struct access after free

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/amdgpu/basic_tests.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
index 8e7c4916..8b7fd0f6 100644
--- a/tests/amdgpu/basic_tests.c
+++ b/tests/amdgpu/basic_tests.c
@@ -626,13 +626,14 @@ CU_BOOL suite_basic_tests_enable(void)
 					     &minor_version, &device_handle))
 		return CU_FALSE;
 
-	if (amdgpu_device_deinitialize(device_handle))
-		return CU_FALSE;
 
 	family_id = device_handle->info.family_id;
 	chip_id = device_handle->info.chip_external_rev;
 	chip_rev = device_handle->info.chip_rev;
 
+	if (amdgpu_device_deinitialize(device_handle))
+		return CU_FALSE;
+
 	/* disable gfx engine basic test cases for some asics have no CPG */
 	if (asic_is_gfx_pipe_removed(family_id, chip_id, chip_rev)) {
 		if (amdgpu_set_test_active("Basic Tests",
-- 
2.25.1

