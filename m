Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061E343F36
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCBB6E413;
	Mon, 22 Mar 2021 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6E6E11F;
 Mon, 22 Mar 2021 11:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU3WA0U8ehH+3kkU2kEwFkUsQxuztpkXTgWVb4L3wCCU949EoK0ztaD/aSMiDteX1w64mHxVg/Qz9dYe4ueTDp4FgfQMxXjrObusp9FOQe44j0bIX4LEUDf9326cctxn23xn5sYFRcTfnIBqAuHOx+1Owhb7KKk66TnCOAV3sRBkadgzfhbrUBmkB069NpsyPjS+s4kJ+9VEhLuWOZUdLoicU+g8qQqo/wsQmkRx6LechIzTUpESRVuzBYrp4G7BSJ7l8gJ2zETiT1bTNy5Z8Al/PHZM2v8AJYAl28WaFvoPbZNJ4t7bTH438zGwwiDm2PUvM5p54z3lkrB/NoXcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGDertcs7Fvzjb8Z2jqvjc2mhUdSVMOse2sccDSUFQ=;
 b=JU6qfg/iNbOf4bj9Y84Xz2Jvdmw7kUaZH/MDFpr0CyTN/i00OdEyGYF4VOD3cEt2fDNwo3YvbALDYAW3KGlGsavrGbVCqGaicUPeFGkD3Rflm5tGEUnjkcWie3rRHafzvvlzg7EbAFioZA3ldnU2Oiq4zhXKUmZXi4PBQ9MZNnNOdvP7BHtt+04ihX39eYGOwPUt40ln55UegiddsVdGyHIFhTdFSR8YtltfSS9OcDA2Z4MBcmkMV3g95WeMb5ySTzaidGB/xPQnEdUiLQo3hvFzSjGPiswWPLajaaYbixPfzgNVz4dN68F6Dbg8q4XBRRZWfWALRtrVPRc9Ktv2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGDertcs7Fvzjb8Z2jqvjc2mhUdSVMOse2sccDSUFQ=;
 b=Ou+XCPPbILxZCBRm0W/t6y/hTzlHVAl0bm0JBggfv5vmBYZXFNIJwT8CYiTsS76RF4Id7w2X1vjPYTpJH1Ub33jaKrmH0e3CACq+8AGv49zNI0x9i6bKpcMwk9XKFEKO/amhcoEzdI5mgVtL6lNdVt39CZrXV8SFoyC0/xXw4i4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 36/44] drm/amdkfd: Fix spurious restore failures
Date: Mon, 22 Mar 2021 06:58:52 -0400
Message-Id: <20210322105900.14068-37-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8bb80e8-a8dd-4f46-b867-08d8ed22ba70
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB425568415374CDDB9786B05D92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbEJ3QipaMRdVZpVkd3PYkaZ8DqGgLGujnZwzzMT4uSY5wc9r2eCIk6hj0Hp9nvlARHwqtekTfGkKAVkpbUxdDe41zVPfuXlTUgMoO4295D1PYZSfPJEhRrxiO/vl/paBsckZ6u6wCDnrcmN28kpJj3F4ozuX0jRHHJJAe4dULqjFXEmbjPrvb6iolEK1uu/6bsNRyiLewzW1rKxMyMbb1POzRdrLrt3snkDsHlFgvZn6rTmbS7RHDGZokrhWUfMSjfuX9FKxW45C84okcAEp5iuXJ7+0mOJV4qROiODKptLX+EOSaX3JtTYGoHGOWug8cAQB/fuTKy/t6tUyXTIcL/d6dhBouYYHOXPGO2eHMcJqiIVrTjMgqQpSVII1M9PLTHI433H/J5nTTyugG84mGYd3nvmdIMWP2x3/AJI0JL4adp29UpR3scD2sXchnj8+PRdBKLR5Ss1Tbc9h9u+vy65kwBlLb9DmQYsAJyI7AufXTz7iQcZm4FL1lbw+ibMQBGU0dbVcEof7K64+7NYR5FEsohZD1EQFJ41Y8JqvUTgOBHmENQIC/5E/o8TGqk7BR9S764zkC4oOSXx361EIox5Lr0K8lLq3VVt2VqOEXIhF3jBNHOgxLSvu+z3trGCLqkmoupsSPCbumalzPIyetOPrYSxkab3Yqs2tbMvoOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(4744005)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C7N1o/jsodyAbNqBRbVejvu/cQVXCsF4uMugY2XSEObqufIa5Jg1M2alEsLQ?=
 =?us-ascii?Q?hFqWuRyXovskWSLCaffXI7B6uhUKQDCHmqa2TkRMT38x/GBYYewAUR4hOpYJ?=
 =?us-ascii?Q?oC0pGRshLXcl/msSd7vzdKX6SbBF0mbHbWcghFydzR4/qYa1gYip8H6rVsJe?=
 =?us-ascii?Q?Pk3I/DeSqywb4LckeYtKzOMG36ZTsfgbJMGG5inbN87nPpXroMmIoIXuzfQo?=
 =?us-ascii?Q?NC1aqMDWJkYJleCu7g0Yk4ma4YlUOuiBCpWe9i7uRmvWA1nTcvivQfZuW8NY?=
 =?us-ascii?Q?pJ9LlX9vReG1kiajGXVfNADycp47haJ0nq3+XrtR2u0cHtScn11V7l5nTs8+?=
 =?us-ascii?Q?jnySi6XPdUrbTe5c1lKGkZZUl6N9x+vmWXUzaY2Ijc/89AY8roanIa8UEykf?=
 =?us-ascii?Q?5oqWwp/Skua0ZML5ppvHIVsrpd4fQ3EFg7QCo6k6DI4En1BISWHh947a2H57?=
 =?us-ascii?Q?b3Vb9vOOAOk/PZ0JoJWEu17lIOqODC8C9DOFyr8YBdtxorB9jOPdCRPijRCr?=
 =?us-ascii?Q?17Lqb5wKYsL2SzDLZM9xyFGmKLOTQ6ep0CuWvKzB5DtJzVl+tpJdLqayGsLJ?=
 =?us-ascii?Q?5UW9W1Fg+XKabADBUvD9cNBj8Vrudy9M8Gp6r5CHJLesUMo4NdU5j2eW5f8K?=
 =?us-ascii?Q?/nfCJRCyn9iYzjktaRbWEXPS/3N9bLWi5UZa6mD0nwxBkYBpTDeWKJpDlnDc?=
 =?us-ascii?Q?MBOtQMfJW+jP14wT2FoD9KHuDRZ96Fo+6r9TXH6JZ8+PrYyjhXaAuTIB3YR5?=
 =?us-ascii?Q?ROVhypL/KUFqg6RnnTEh5tZxVjixOGFAEPMqQBnrBiJFBtmpCx7zXyVD/F52?=
 =?us-ascii?Q?WzxrITtc/ldIQGJ7iXiotUwzTtb/dRs3yKlBEEtDCg6g8hW1JNb2qT8Q+FqI?=
 =?us-ascii?Q?nDwCHj2F8XzXI7BCuGT8SGpLaIiV9i1YdCmzhTLbZwxBlRXX+4sVWjRGXDaj?=
 =?us-ascii?Q?dr9XCrmz5lp7sbv3EMLQ/ygIfBw4JTB+BmZP5XuRXHfI2lP8GAJe+uD7Sdrr?=
 =?us-ascii?Q?f4vF5xh6DtNNrUa2cTaqTpM+m0D40seBU5rNQXg37CU/40ZNffUnaKlCaApq?=
 =?us-ascii?Q?inWr+I0euYF+SBqKTCEirqv9supqKwUYu5YqDteXtz4BvD8WPV/77QAjlODp?=
 =?us-ascii?Q?xgq+wrhrVCgOgYCs6YFGO4t86Lu8HJ6jpwyO8/gNHa2pN4SHUI/5iZOjczTz?=
 =?us-ascii?Q?D4ZVGLY7/UDtNNqynI5PAUFURQVrrl1UovbVdAhmqZa1/2Jz8rjFQw2sUHm1?=
 =?us-ascii?Q?vEYmCiiVplnAHoC/32hbkLnnp1cXYx4H5LsrL/FDt9WPTcqLZnxackoPYJsj?=
 =?us-ascii?Q?LWkW7uGQN7gzQBLxjPAiQJnJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bb80e8-a8dd-4f46-b867-08d8ed22ba70
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:48.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxWpzpLqdiCYOPB41wIDdY9v2Ei/w4iomLSG0pM64ZN7kYkuhQi7tA47zylM5Rf4Eaqx3W3s4Bf2FemcJrcqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore can appear to fail if the svms->evicted counter changes before
the function can acquire the necessary locks. Re-read the counter after
acquiring the lock to minimize the chances of having to reschedule the
worker.

Change-Id: I236b912bddf106583be264abde2f6bd1a5d5a083
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 0fbc037b06e3..49aca4664411 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1429,6 +1429,8 @@ static void svm_range_restore_work(struct work_struct *work)
 	svm_range_list_lock_and_flush_work(svms, mm);
 	mutex_lock(&svms->lock);
 
+	evicted_ranges = atomic_read(&svms->evicted_ranges);
+
 	list_for_each_entry(prange, &svms->list, list) {
 		invalid = atomic_read(&prange->invalid);
 		if (!invalid)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
