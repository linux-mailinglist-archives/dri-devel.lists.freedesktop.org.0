Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C45821A3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81B5B3784;
	Wed, 27 Jul 2022 07:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CF8B1963;
 Wed, 27 Jul 2022 07:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SURFNaRUKPdl/ciMoDO+YG2RhAx6zGj4GloXqa2zliUFDCiOAf9MuQq3wnjFLQ/tOP1rFYCg/rDgiqxGunXrDBwIKKGGse7TdqfJIDZvjIU6erz6YTSQIfo1v9S5lq9Ke5QFVMXQxCzFbM8MJ6JdJToRqpETOcowCG9AWl2vOdjHOEG9oMeNbKMWyY/QlrgY3L53ENyDGlNbtNUooLI8x9dA2qBtjBtPrmUnxqKX7ksQvwkXxDKHkiTPqUTbcWjOjExVNm5gqi7VAIngKFxEu+OtOBzpKeHs6VYLMpjIzymMDGVq+xsRih/XuwVaun4yJawigEomkRR8/EvVhC4xWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6HdarEyEq6f4GDYbMStrWKik1hv3aKo11JTNVpe0yM=;
 b=RMVN+4cFCsV7UfRT+LGoZK5NG25aFqvMmJXeaxiPmFyBrNZaasjWSmCdPJubZMlxyKzGnMP5BSibtk2jRdt6w0Y5LbGYCqDhSveSDBlI40H6lBhQ8p3iN15c9Vz6z9q5ypjC86nbzC0LmDsH4F8NtC3Gq5Vfng0YepOG4CNPfdBKe273gqumnR/sat3J+IR1aiOEMyPlisuQ6wZnRkow0A+bu9qyCV16HfgpO6nNK5+33Gr8sGiAAQhPx25neBWBsWD/nnpTK2tYV8h6dr5DuH/Xb4eBS3ELFZ0+hEZVIpxBtdFL2QGoqNKQMp4swSaAw5oBoXqw0sSpCMMB4a7B6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6HdarEyEq6f4GDYbMStrWKik1hv3aKo11JTNVpe0yM=;
 b=yIR6GRpaLoGh0BA/KH3H/p0D3xNnR32CmqEUg4sU6EHrntj0YWCliPFAYhUHLH3xVVd6IFHzApSXIeUXrYXm+wH+h9m7BminFTRQj6yqu38w5pUfHKa2+0d56DLaq2mZ3E1hlfNcaILZJ3P/uebUmK5mLIZY1JXfMuXk5GTdQ/k=
Received: from BN9PR03CA0934.namprd03.prod.outlook.com (2603:10b6:408:108::9)
 by MWHPR12MB1182.namprd12.prod.outlook.com (2603:10b6:300:b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 07:57:47 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::d1) by BN9PR03CA0934.outlook.office365.com
 (2603:10b6:408:108::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20 via Frontend
 Transport; Wed, 27 Jul 2022 07:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 07:57:46 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 02:57:30 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Luben.Tuikov@amd.com>, <Alexander.Deucher@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <sumit.semwal@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <gustavo@padovan.org>
Subject: [PATCH] dma-buf: use struct_size helper instead of kzalloc
Date: Wed, 27 Jul 2022 13:27:12 +0530
Message-ID: <20220727075712.591488-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ff4bfb-f9b5-4fae-ed45-08da6fa5b1d0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1182:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pf5moXXVxXxX+t2QmcaDbRwW28N9PIdaVWP45mouyYefRvcW3et3mf/cC0NiSl2WA0FxWcyNTLxA64l1+uZsUqf7yQCoTkn7ug18zRsHmNyUdHwoXzNuMQGpq38h2f5vq2RNltbuwDneH/M3Hqy1gVt2jxuCR+Ah/qqWC6OAQeBjRPOml9zLX4TARwUeXJCp3H0cdV1wgXGsdS569ihrbJk89CS810goE6gAlwoBklE7r5x0p0Bp8sdOwu5jlcApT/EI5zDUxyDfIwi8owOtJu7kQzTiEtAFNwyCOjcSS8n0das5RzDZV1ndFN+NbxxW0vCY1WJM+p9nUc2jGsttMA0r4hVB0Vi2DAxQgPREFaUT29UAqQA8C3SaRQeaD/Xmtn9H82U3Zf1hMzFORUSmoRl+ot27h/Ft7ruMb0Y2t33wDSsuYJ0MRt/pFg066ahIeX8gZKxel62lsiVXv0EaafVQbxPeAXJ9Q1PXeaxwCGScAF8xuude+bhCniotFl6EeRldm/z3+258bjK/kw5H5XPNzezat/Qgb3LWIN4ocBPdfpe6ROWnbj/36pYKZNxx9LKRKojW6PWEp16uvJTZFy1Bfb5GbAS5lLGWAhTAhvE6ZrsXIqTJVYvMBY9AWwjTi6T/k+V5SPsQ7o1FF1AjKUsh+UOP7KlC78C/uzZjviB+tmXG/OkvFZJ4A/zddxEeM2GjbIxJo3E1l7G1miDCbuQuWOve0DL7muw7HPAXcFLpEKPwkmFvBzbeA2xT3o1vbB6bUCSbPYD3HCFYgQVcG73sY7biux8AYrZpTneN2oVF4ozEAteHU/QaDxpJ/duXcgVfaGFimfxfZrOc4R46axe1ABQILOP9z5nPxQaYU7tjsM+nuqIv5uYc7H2OKLhaZc0XAokp7RV07ZlZZ/JQgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(40470700004)(186003)(426003)(1076003)(41300700001)(336012)(16526019)(2616005)(4326008)(70586007)(8676002)(110136005)(47076005)(36756003)(83380400001)(70206006)(54906003)(26005)(7696005)(2906002)(6666004)(40460700003)(356005)(40480700001)(36860700001)(86362001)(8936002)(316002)(5660300002)(478600001)(81166007)(82740400003)(921005)(82310400005)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 07:57:46.9111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ff4bfb-f9b5-4fae-ed45-08da6fa5b1d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1182
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
Cc: daniel.vetter@ffwll.ch, Arvind Yadav <Arvind.Yadav@amd.com>,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace zero-length array allocation with flexible-array member
because Dynamic calculations should not be performed for memory
allocator due to the risk of them overflowing. So using struct_size()
helper instead of an open-coded version in order to avoid any potential
type mistakes.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 6 ++----
 include/linux/dma-fence-array.h   | 2 ++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..3ebb6c5fa287 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = (void *)(&array[1]);
+	struct dma_fence_array_cb *cb = array->array_cb;
 	unsigned i;
 
 	for (i = 0; i < array->num_fences; ++i) {
@@ -157,13 +157,11 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       bool signal_on_any)
 {
 	struct dma_fence_array *array;
-	size_t size = sizeof(*array);
 
 	WARN_ON(!num_fences || !fences);
 
 	/* Allocate the callback structures behind the array. */
-	size += num_fences * sizeof(struct dma_fence_array_cb);
-	array = kzalloc(size, GFP_KERNEL);
+	array = kzalloc(struct_size(array, array_cb, num_fences), GFP_KERNEL);
 	if (!array)
 		return NULL;
 
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index ec7f25def392..bd2d2db55840 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -33,6 +33,7 @@ struct dma_fence_array_cb {
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
  * @work: internal irq_work function
+ * @array_cb: callback helper for fence array
  */
 struct dma_fence_array {
 	struct dma_fence base;
@@ -43,6 +44,7 @@ struct dma_fence_array {
 	struct dma_fence **fences;
 
 	struct irq_work work;
+	struct dma_fence_array_cb array_cb[];
 };
 
 /**
-- 
2.25.1

