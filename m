Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417B584160
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F157F10E5F1;
	Thu, 28 Jul 2022 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9C10EACF;
 Thu, 28 Jul 2022 14:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7R0ww7zzCI/F6j52ucVxEwqz6z54Vzu4lBiWyUiTj0CPwI6rgTGOZNoS/O0X/edkyRCxK6kLJSgkMr6hCreI3o1ySMNI1JfY1BYwLylcHe3BjSckOG/b3ZX441uGedS0IOEY332x6Zvg37ose410B4B6nqnhtA2Svcc3fhtZiPZdZ06aINLdh1V2EfZYUfbfguegZ/EXot5BkOKJV852LXdq22U1bUZ2lUE1DMk+JaX9Vb4sEPpu0oT5mMeZtkQyHeti/umvvjrPgj1JJpA48FYHKc8TbX1qBcdW8quDkm4LaJzs2wXaK33oKhK/dRs+vfjo4Yk9YNEdVoMQJ0NyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNxLChLk1hJrRNqrJ1MUcObLJavpgdriEEAH7q6aveg=;
 b=BCPIgrfGabDDjaXAscohDCAGh5e0RUUxKxAMzof4hMlQrKIUwqwgrv2IrTpAOVN4xaFJNm/aeFiTE9u7Dx9dBYh2xBqc8qiSmmWCFprjZS2jBnbAL6cTcJntxlJ7Xkgb/9J22POI+QaYCZ+gxPmDZiTFBRMvW20DTulDZSX0BuGQWLPYcWJGqY0D/PLAuoYf9L+rHHZV4UvP2gxP5G9RKFRvv7N73eEzz7HuSkS4UPIzdNWmDW1DqMnu+dOUeMWMSK7tp8Uu2BhS+hlOlkP7IivHLZRYa1+p7cUlWlXJSWix0l4/1w0EBx1SNrGPDfaLZ0nNmvBUvCVSrBd1cDYJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNxLChLk1hJrRNqrJ1MUcObLJavpgdriEEAH7q6aveg=;
 b=KlOYwL/Wd3ThQmLkF+v2aKcNccIUdcSvgDSMkRopKqQaQJzCPKPWJ2LJSv5MJ7MhYBcVVoF4xGTQYLWIbsCsbqmOjFWxMhDjvsD3hQJ8TWrFKkIjEjc1P6IlKaLzL4e3fcK3lP1uI8i5wSO8SCwLOgrOG1TsVb+2JViYzWE/3aM=
Received: from MW2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:907::32) by
 CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Thu, 28 Jul 2022 14:34:18 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::2a) by MW2PR16CA0019.outlook.office365.com
 (2603:10b6:907::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Thu, 28 Jul 2022 14:34:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.11 via Frontend Transport; Thu, 28 Jul 2022 14:34:18 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:34:12 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 2/6] drm/ttm: Implement intersect/compatible functions
Date: Thu, 28 Jul 2022 07:33:11 -0700
Message-ID: <20220728143315.968590-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30271769-8002-4937-adb7-08da70a6412f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIltDBrDL2fA9hAHsv3DYME+nlYlO8KIwF7xUiBgRoVJ4Bk2p6+fojUj0C7jBhaJUnzby78tdTl4mE272/gr/T/Cy87o+dn0gBi9MywB/qed+fGrpILvl2RwM6tcZUeY6XXk1CK/JKG5rARS0CjlXC5pIQoabpwUpc18jfDLZMVmwF2BbbsO0EoKrZhtIZwkZRIlRgxVY3ktdO0qa9uxJ1JopV1vWGDu2yrNZU3YgH1nVVflcDlSsAMsQBrfNQkI7z6sJMc6w05zw2tFhcoPSnK26dnkePk08jSaOV9LJlLpUr+VQ8oVgkltrThktKYBXUgogok2zxFRKBFisuDYX8dQQ4cOfdESabU8ivVC1pnmKj6AMsgxr6dz3Ad4ImObCRW3FDzHHZ8uzk+zTdKl9YZX6lxb6TePPFrJzsPDQlyS1v6e+cwzDyyO8w9nk7l0YuksRm7vLsAdTDYHPGb8Rqs2qSngRzd2KZOHEUhoEct2TCqKlnCiolY2WaNZedlb7Xxv5Fwyg3YO382/7I/oWbUw16It8ZMK2J0WBKQLh65zfm6lvJpdhgdiJ5uals4EjshotmhBR2fcYdfKuIjKaZSYwzRy/08RhrTri3gagKa5BgT/+g4Tkrumv8fZnB7Ob0s+UKWfv6wYpxofveqsLETKzWdBeclcBCYmaup1a7W+8tk+09+P13xVt8jSqzoTt9EomdJH8Cgf38S667gv5/EOaqDRHPjgKIO1mQa2NviB8+1I6BYZK9v/NXYdvOCNNB55ph8AJYZzGSpCShSgcF3miI7F6a1uv9f43b7T5Zu4KehEQHAWjw4NfsQVnepWXFow6WANM8kp/iXsKHHsaA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(426003)(336012)(41300700001)(1076003)(2616005)(2906002)(7696005)(16526019)(81166007)(26005)(186003)(82310400005)(47076005)(86362001)(40460700003)(356005)(40480700001)(83380400001)(8936002)(36860700001)(70586007)(82740400003)(70206006)(478600001)(4326008)(8676002)(5660300002)(54906003)(316002)(110136005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:34:18.4997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30271769-8002-4937-adb7-08da70a6412f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback functions
to ttm range manager fetching start offset from drm mm range
allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index d91666721dc6..19247aaeb5ce 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
+				    struct ttm_resource *res,
+				    const struct ttm_place *place,
+				    size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (node->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= node->start))
+		return false;
+
+	return true;
+}
+
+static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	if (node->start < place->fpfn ||
+	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
+
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
 				struct drm_printer *printer)
 {
@@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.alloc = ttm_range_man_alloc,
 	.free = ttm_range_man_free,
+	.intersects = ttm_range_man_intersect,
+	.compatible = ttm_range_man_compatible,
 	.debug = ttm_range_man_debug
 };
 
-- 
2.25.1

