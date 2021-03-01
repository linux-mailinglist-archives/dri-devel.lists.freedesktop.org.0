Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B103294FA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 23:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658B89E32;
	Mon,  1 Mar 2021 22:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFFE89E32;
 Mon,  1 Mar 2021 22:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKgsHmlHhHV9aXmz08MHgxJx/TJc521f681URbiFrFW7CK0lsk/T+InPH8GHmSGkxNOjqPWiXxJP0muUKQAR8urVw2DKAesKU7sRjZ566ipmdmCjLHOw3rKjE+8GiW59qE21FZ0o+7fbMio6E5Iv/vTEa7y+E0fvjEwtoK0lP2TibrmxlRCw7fFOI/+33i0ECNSfjMC8DpgncQn4BNCcwOMHQiXaY4srn+qbYifoxMUqYLcjIRVXgysCGw3pFdOU4zI8qvRkPFcDeIHc676V56v1TRgxIoqpsUYDXjCVUx9bSzBvG9S9KTUslj4bC2oWge6XrknudLP3J8oZyrTwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=467TCT7/Hk6Piag2xX2XtSEFfo4I2U0/JbdrlbeaYcw=;
 b=CDPK0C/fEoc+92QXRoXABo/WXJ/6+QwsOpc1F8ghXHupLghs+ftM1PLwccJO/nLPCOA48kZcge/5NJx3w1SBE0RH/1o8yixw4umK4c0Y41YpVa1sFqiZ9V63ewEkeW9IPuXNzQjmZhNaluvwSZRbRYmxQ08hNMud5SrssBYEgVTca0j8bxRLeV1qX7pdTUXBGKlK1NLH7kgRi6i3o1NwgjaTMvkk9UE7yGicKQFwnROchGDY3PupKC2rfD0sCkJJeznpT/EhacjrHKBqYuOEIMy4rmmBJGgkOV0dwt7EbIPtUN0BIiEXvdaEMd0lqrtV7y2QONYQe7L/zwzK+cA21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=467TCT7/Hk6Piag2xX2XtSEFfo4I2U0/JbdrlbeaYcw=;
 b=ZSqyGipT8LS3PyB9xlKyK/2Qje9en/euCD1Y5Q0Fv90snXu6hqYAhOGrdlQLup8uO/9/DRbvwxrYb7aTRxWaTPBR9AAzd2z4xBQHeTRbARcgYpfqSYav2p6a2AGemLkpomsuViEDiyPPCsvCA25tJRZ5tzdIToZf+5PXHFgvtrM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4734.namprd12.prod.outlook.com (2603:10b6:805:e2::20)
 by SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 1 Mar
 2021 22:43:57 +0000
Received: from SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e]) by SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e%3]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 22:43:57 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching setting
Date: Mon,  1 Mar 2021 16:43:48 -0600
Message-Id: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To SN6PR12MB4734.namprd12.prod.outlook.com
 (2603:10b6:805:e2::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.25 via Frontend Transport; Mon, 1 Mar 2021 22:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34bd2f6f-7aae-4e87-58a0-08d8dd037fa0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26219D057D2CCE8C84232277809A9@SN6PR12MB2621.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6N1kQ/mvtviSzL+XvRai/nnHTW/tJ7P2qyE54jfubNvRCLRM+E2H0zZFuxb7SjUCTSKf4kl7+O4MgbaK0/eXdKh8P6n5JNLFBp1QwhcPxdCYd+ZuCqgQVqeolzWYD3w0WsjTex87q8442J8MVLhhXp0rXKqaxzrLFnh3ib1d2gb9yzpNgUcg04YoG2oy+8QJdLst4PeQZ4g0wvIxekWNkRCzM+YrPPaTUnDlAS+B+p5XWachz9JQbRhYOeLKd2sp+gldBArJxOCgzjn/OI6a2z3muu6wJ9BdO00IcBQutAVjZpovXgKSHrwCNO5wV0Yh26Mi/AympWQBpoF6Pgg4lpdP67HqA47eK04WJZGsiSo4A7r2qXBIOf5kxEQb5KmFqh5GFU++tKsTCnzEq2oqkWwskjrxhcrkjqRxUfy3f74qsKA9UpeAAAuQSovThcqlLUn0OO3AtPzaT6U1MZqwvnXMNCjBQGp3QSKg9wUkPUYhD/mqDTA6pYe5Uez9otYWKSVYMp8yusbcdeHlnD8aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4734.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(4326008)(5660300002)(6666004)(66476007)(36756003)(66946007)(316002)(86362001)(6486002)(478600001)(450100002)(2616005)(66556008)(186003)(2906002)(16526019)(7696005)(8676002)(26005)(956004)(8936002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NzSJJtL5+RISc/bUkZS8ssscwEHSl6OOirjP9gYJ0SI6nmZH1CgTWdpM3kM5?=
 =?us-ascii?Q?ZK3n+bG406CKv9mjE5RNFyfRpoxbCllP4EwbdAviIz0HkyZMOh8bxdmcC0C1?=
 =?us-ascii?Q?OZzToTbUApuEHfjKx9INPDZeO9gyO1RykzN05U5Jtkidvf/JksLXKFojblAR?=
 =?us-ascii?Q?W7LcMhsfMYsEWjmc17Ag6oohGwZu9ApblbAP8KqmLp7A2ci029xsVYykBU/N?=
 =?us-ascii?Q?lcWxaqnKKv/q07PThN3uTCCdm97kE4HhiGFq0bEIMdMJduZZqomMFA8A82gZ?=
 =?us-ascii?Q?RfUtqUvlctAJTay6ufmX0+3C/yyigMFKtZCofHMsi1nrzlntFnoeGR+146Iy?=
 =?us-ascii?Q?UkHPcbZLLlTpaeC8r/oj9rVl7z5A3Cp7WKwRKkYxfFjy7O8dpJhqylq9eBtS?=
 =?us-ascii?Q?lEpV2GHB5f6FvPW0fZeIBte3dC4/IrtYfEyAFpVKyzFTBclc6I4b3MORX2vU?=
 =?us-ascii?Q?UbVsgHKCWRCzzClix/j/OneNrlNsy0ZnG53LeJ/qDYyJkXv4PGQd9fTk3y6a?=
 =?us-ascii?Q?5pE8Q4h6UFJug+9QqtLype70I/E0Nb8Rh3CsQj/qIaZ3OjDB0DFo9brHGwSz?=
 =?us-ascii?Q?7rFT0nO+AHwIy6aL7Vr8/D/EP05FgGnOTlPrAMLjofU10ImBs6GCf0FI9CsD?=
 =?us-ascii?Q?row2l8knrN6S3R9A7+b/Fq7neME7nJW/kePMjlOBTIySFEN8VgqPUB9lcmwK?=
 =?us-ascii?Q?6fEN9zeDlr9CczbAVP/Z4S+jwHkCgIEMQqG6ojR7NDenbZSLwVj+sLiaJ8Hx?=
 =?us-ascii?Q?FDVtM/O5K/k2i6odoHOxz9eSBCdbGmG0MQRask3QpY3YsWwOZMIZMk1TOoJR?=
 =?us-ascii?Q?z3fpohtZCpSFiDyMUP4isboRKgwlk6W6Uy9WnEkvcyBq+B0sQvCqNdh84QoH?=
 =?us-ascii?Q?ZEk0JAtYX+QOT/NuUc1vG1u4fUEIX6+yVSOU9dD19e3vBH+Y+atBPZ2O22T9?=
 =?us-ascii?Q?V3i6gIBrcjxvkUWzAGQ24ZR1CKapwRuSl1fwCOSCqRd9b8in4vCUmOAWq694?=
 =?us-ascii?Q?1wFVpLpkunji/H+UGswBSW/yr0ScMRuR2XvbRbaiSwEWVjy8DjuN9lk6zf8f?=
 =?us-ascii?Q?Lr46PAj1XqauQheLLmkqz8dna6aWpd09X3wv2GVE5s6DbgbQPWdTe9uZ+sms?=
 =?us-ascii?Q?lrGDRl46RFNghF6djYlPywlfO9WWKaYyL8ZLqPxcy1ANqVxExgGxq2zOaHHE?=
 =?us-ascii?Q?4tvSeVsYO2OUz+LgohqVdiB/Qz6uewITeMehpE/CG9QHIwloPhkrzdsXNhmt?=
 =?us-ascii?Q?aQOjQCl/xXhWfuUfHCe/ybiRKc8cF0UMHX7HWkDmPKeyv6DgGZun9OZEXv5R?=
 =?us-ascii?Q?JxWK7eIpgWkqNYDZK//+6gVO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bd2f6f-7aae-4e87-58a0-08d8dd037fa0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 22:43:57.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCWlSBvgw+Ux6qDW7uPWfnqQWa8fJ838V57qUoNuvHcofqWxUa5/uMlJy/0uesES
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2621
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
Cc: Felix.Kuehling@amd.com, harish.kasiviswanathan@amd.com,
 christian.koenig@amd.com, jinhuieric.huang@amd.com, Alexander.Deucher@amd.com,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If tbo.mem.bus.caching is cached, buffer is intended to be mapped
as cached from CPU. Map it with ioremap_cache.

This wasn't necessary before as device memory was never mapped
as cached from CPU side. It becomes necessary for aldebaran as
device memory is mapped cached from CPU.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 031e581..8c65a13 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+		else if (mem->bus.caching == ttm_cached)
+			addr = ioremap_cache(mem->bus.offset, bus_size);
 		else
 			addr = ioremap(mem->bus.offset, bus_size);
 		if (!addr) {
@@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
 						  size);
+		else if (mem->bus.caching == ttm_cached)
+			map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
+						  size);
 		else
 			map->virtual = ioremap(bo->mem.bus.offset + offset,
 					       size);
@@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
+		else if (mem->bus.caching == ttm_cached)
+			vaddr_iomem = ioremap_cache(mem->bus.offset,
+						  bo->base.size);
 		else
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
