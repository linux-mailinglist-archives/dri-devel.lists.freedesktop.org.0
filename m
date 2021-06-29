Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51473B6EE5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4386E825;
	Tue, 29 Jun 2021 07:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E726E821;
 Tue, 29 Jun 2021 07:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2ZwhowxOuBVW/yRVjQ0EVOrsHvrYNUcPYUcyGt6XfiuGtJ4r4Q6/Hz0WlNsyqfnYdhOuqHFPACvrIKT1/bJzRKcIfZCfCDm3zQD99WFc/1ZZT0soV0e17Zt5Mq/6BWhUPJcBU39CsP0re1kajgmJlEK2vWhldYvc6ZKc8GB5pJ16ce5CA2D7DwvLsp6TVzCOzG/UoEoXxWbARDrZlOQVgYzUuez4d854B865Xqi8zQ15/pGt55tku378pm+ec5vibFne9CCaMrToSjdcjpfUmxxkmUZiEKEZaQO9FXb4mcE6YNr2s8NRDoU20rqxMm5FR0/yTHLoRhHKAv+j5npIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFO2+pA68h6YQxh8eWjTLCU5H753JJKrjuFE0xrohog=;
 b=MXGe6jTTZuI/O2Dr8GoNScIF7fW/SdjTJysoKJNW8Tri/WGLOMjSQFDfkgLFN/RqXNFwH5nbcP8hX9GACPNQXzoD+ku5+xxRO0CSY5mBuQrqxB5FRQqWXM99yNbO/5i8FCnBEK+auSamZIzT0NkeWyFQavjTg1riYYqRkJs3TX1o5bCMiSngIi2SPpSsOSjaqN7OQ3rnUDZcoPWE5ni93IfEBEICOktlmhhUFZwnEHNBtF894tqYGHoIwHzBrA476mKxKdT1EgVF40LybEJ3HbwA6NqKl7U3Dj7wm1KpR1iRgaQL0uD4pW88VEn6dWg+GrccCZuMJdAfwVysJ3t+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFO2+pA68h6YQxh8eWjTLCU5H753JJKrjuFE0xrohog=;
 b=q7oRjTCppsrDBRO1sjx4JJQ89DEisjDFkydogLo0BvnqAZ2dF9nth3abxSYGI7GrGMFj6EqwnKy/Vu+Wc0IMUsyMjHhWRiw4/Ye2CgNur+JIKi1DDQg1SEv+ICnTrUFoECStvpKdvd8W3UXY1GcV/jKC9/NV/cTkfARxX1jiU3o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5341.namprd12.prod.outlook.com (2603:10b6:5:39e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 07:36:47 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 07:36:47 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/amdgpu: return early for non-TTM_PL_TT type BOs
Date: Tue, 29 Jun 2021 09:36:28 +0200
Message-Id: <20210629073629.3069-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.86.118.245]
X-ClientProxiedBy: PR3P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::14) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.118.245) by
 PR3P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 07:36:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53501ed9-ebd8-48d5-2011-08d93ad0a682
X-MS-TrafficTypeDiagnostic: DM4PR12MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB534171DEA9061D3FCB08A8058B029@DM4PR12MB5341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMJ0OstsorthpqyU+kzGpYfgwK+YnnschC4U3T7p7zX+5gRCAynf/F1OJ88GCLEuy9Lt54iZDrIHD14RX7dkIjms4x1SJ3nLQBgklaoBmk9nkjRv5moiDVUom4RK/qCGT9Be5TaHTXeyUQF7075MsRtvb6X3elyuE8lDBOMjtL1bnI66sML7TaqNoXqI2rYyxR2vBkwux66q6Nc2chKJeNBZyJVyJ/Ne0gMgBu3xjp0xa+ZSRyPGHcBK7r3LVjve7cFiDGYZ5PWmhv2TFdowcent9XXAjji6sIMoXIy4KEosEEgxmkQzU0Q/hULqbqVdA3wYTTb7+8N4J/a8Zf3T0jsIpg0vfCrKtRh7ny+CUALie5YbCypeJuzGvQLIMW5dsFRsQzB0qwuNN7d2U0SjyEBNFzP423wpbSOpWW+Nrap0Ic+R3K1S3PxP3mW2v/btnZxk4Hg7+GoxC8auiK+BlNEJuMTt2C4UGfvWuyoyNsFER0Fy3VwUl3NA59v+QHRI2t2gpZ0dHwD8qlIvy2BL2qUz3ZVph17yPjSIifMNo6vqsMUxN2u6eQ+v2z2TnkK3oCF+3nlksRmF4croiWOMH5JMiAHVOJ+JHzV5m7xaHKEGNrfaD5iLeRe1LUljAfByLb2kXg+6iUB57/0DdVzhkER4NnpLUDUWqHDonG1YA1/YnJWjf8AO2355wxqMIDnSkje8nJR8FvAOd20ditEYiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(4744005)(2906002)(83380400001)(1076003)(450100002)(4326008)(66556008)(8676002)(66476007)(8936002)(6666004)(66946007)(6916009)(44832011)(6486002)(5660300002)(86362001)(6512007)(186003)(16526019)(38100700002)(38350700002)(478600001)(26005)(36756003)(316002)(52116002)(6506007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE996EBS5Gd8mAt8/3wYm2WX0A71vazD1mkbnyxqvoOfBtl9G6dtWifCK3Ws?=
 =?us-ascii?Q?x4IUwU3CaYnucMxnwovWy1gEEr2b0hdNsesO1+9mrt3qSHJ5yGWJ594SHBpW?=
 =?us-ascii?Q?ZoHtVDwYEXCjQvpBSgrAlxg96yDYBNG9MdnvAe4iUygSVj2wufLvtbHX3TKM?=
 =?us-ascii?Q?CSU9d9ZLK9ked4+If95YeeYeX6vzz4aJD4mCPznl747ft0SZTNe+ttcBforG?=
 =?us-ascii?Q?LASWviNn07Q33SBWPYypZasBRc0Cg9sXa1aQOFqAgzuXaQ+RBB8ucoR+g1NW?=
 =?us-ascii?Q?fjYP6Gx513H5PuSCquPS00nAnEKSOvRf4dd4WpGegRsGtowYfDdGwIWviPIB?=
 =?us-ascii?Q?2r0I/TafTuVV9Nn0RkvzOyg038qVWLlcxf0WfQQXXHPDJXg53VyGfal5EeII?=
 =?us-ascii?Q?Y0uEyGaSc69FqSB7mpNPwfiHAjxwA6hC+6mMrPfsbAiFfblvXH+ORynj8Vik?=
 =?us-ascii?Q?qGro09vPVZw0nCjo6uOAbbUcG82j0D9PE8vqfOqLWfH0zDUzWFeOOgmT6bnE?=
 =?us-ascii?Q?XUqWUlr5+qWRtrVmT/mBy3pFMhbteXEQ2fDj5PSzAYZvfF3YuykI1GJf8b33?=
 =?us-ascii?Q?d1+y7X2WG9xQiJUndwAkdUdQjSYAbezrBe993+WE1DzNWaKz1xOf6oQArzw9?=
 =?us-ascii?Q?S9JXnGe2dwbmfAcR759a5SRB5F5bP784iwA7BWhssCj2zoY5JGRq+QXTeLJw?=
 =?us-ascii?Q?utSXFTIAI7PhAWP9LpPBZnBxkqHyFTJYycVCx09y4VVIrDqedGHGbpj4bmM7?=
 =?us-ascii?Q?8dyZvPde+ezOmdGscGP29jfVlVBvNBg+U0wk577BUzO338Bri7/XMBgmbZmD?=
 =?us-ascii?Q?Mn2TZ7HOOQ6SpYFmGcd0+4vDXte/BTG5nJRuRVc9KDgVUyB/Dl6Y+N2Hgq6S?=
 =?us-ascii?Q?RRVgRQhsXUzVrKIw+t5L0KWhCOwgojBTuyeg/7UjD4hLxdSrnVArGuJk8aOo?=
 =?us-ascii?Q?P+Zhm/pgSJZqzEY0sMPnZifB4ASqAPanegcGofIQBhH128OijEizKZAQtBVx?=
 =?us-ascii?Q?h1x6u0K0PuzUMcAj5v2dcNJRy8B4k4ULPCbQrUNgHmIgxNFNXCtHI/QvoRGq?=
 =?us-ascii?Q?tZkFY0CHobZ/4JBFhYL/S/guC2upgHq2ycTgD3oklqjw6484zu0T2jkt0G8q?=
 =?us-ascii?Q?/2XRzOFODAcjiuvJcAns95/kXQiVzQGYsOHKo1Vy/fUoHYE8kVGEO1fbYEdN?=
 =?us-ascii?Q?jNJBmdgwtPHh5/YR5WCoJMw4iEBDyEwp8igadXYCfS7LhEpLRqWF/UyITKPn?=
 =?us-ascii?Q?5LsepLApQqnhptSSwI+KxjBJc1YrpAfKVhsNe8yDN338gSo0izYyyDIZfEsc?=
 =?us-ascii?Q?E3ck550PUOm12cuIAM2LYIJr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53501ed9-ebd8-48d5-2011-08d93ad0a682
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 07:36:47.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEVIL4ky6iPQWvdRThpIS2AAr3BhFNq+vro6t7BvvWg+gJG5uZcLZo3ibRaONpgQQh4KDE7Gziy8YqrVGlN5Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5341
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
Cc: Felix.Kuehling@amd.com, Nirmoy Das <nirmoy.das@amd.com>,
 Christian.Koenig@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return early for non-TTM_PL_TT BOs so that we don't pass
wrong pointer to amdgpu_gtt_mgr_has_gart_addr() which assumes
ttm_resource argument to be TTM_PL_TT type BO's.

v2: merge if-conditions

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b46726e47bce..208bc3ec1aff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -926,7 +926,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	    bo_mem->mem_type == AMDGPU_PL_OA)
 		return -EINVAL;

-	if (!amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
+	if ((bo_mem->mem_type != TTM_PL_TT) ||
+	    !amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
 		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
 		return 0;
 	}
--
2.32.0

