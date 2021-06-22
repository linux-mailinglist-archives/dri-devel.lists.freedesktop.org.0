Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826C3B0A43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A1D6E5D4;
	Tue, 22 Jun 2021 16:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD706E5C1;
 Tue, 22 Jun 2021 16:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuZV6j1Klcwl9TT44X68jLaKBhLLwr/d5E33jY9IADG4hgTXz91j85gtH9+RsOOkaA+pBclJD1z0Wgs8qgjbIErhzK+ltkMpLfbw/mjGDkF9mpftGXS/dbTk2fPygnNGTjpHuY+1Efwxn3IWcxGDMkMKItcrzb6aX/xQiDeG4lEsHmggiU9Bcw1If13vrPE4iUoIxu8DBsXsOYspwSkyc6tIYHTXYzrYcYMYDcXfxo6MsZQRuCbBQiG2FcQF7/jUGhqBNdiB8Fys77Q6Z/cAF2elb3Tm7ATqZXgBimqYuBgdrsmqdyA2rSEnuQF3KecFtzBMXzDFsMjxvMIfaIxjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C94EjJZFq56JM4fuN39uPzqAcd7PXMxK+uAZIKGoG6A=;
 b=UiP5z6PkyHZNHMR9BZ6FF2h1OZKE4QV8Z/135CA5ni+aJQMeTqNbCkgPxy94gzz0M+V6ZotRiUTLxhsKWHTBsRsI0eDg6EmxqE/4LyfpOETxTlRB/ICIQL5CKLPkF3WleF8OzhXjA9KdpHGoKMSJPy6PVXDMqrRvVLM0Mm/dAy5iGuPJKPQNw9Wn5KgaZaw1Vjx3BiTRELR2/VnuJablhrW6btoyFkTqwboWxvj5uPbeeVfPCMGyJ5Jfv6vNsR9hSByNRXE7WQ/+bjvzlc0TxzrTBct+GhVeo2tsEP8mnRCoYGyrMgzij/uv7AeZrF4PudNdWd+K6Gjfe+GCctOgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C94EjJZFq56JM4fuN39uPzqAcd7PXMxK+uAZIKGoG6A=;
 b=1uvG6ewE4MTjmpAm5ZyrU4cgqBhwXVJXvlheoUbTZ80VvV3H09IZbzGwESfr3v1HQOYVYSfIwYcX3mfkLIDz+q3hCt/747N6Nd9qvkMR7+HLqFckU0DP8oMnH7G/MpuelAD7MTl4KRuWlBN7BTmi8hBrK60X5tM47j0EuWEk3yg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 16:24:14 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:24:14 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: Fix BUG_ON assert
Date: Tue, 22 Jun 2021 12:23:38 -0400
Message-Id: <20210622162339.761651-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 16:24:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dce55385-2e68-431a-4a11-08d9359a2d0a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4399CE43B4B991FE7B5DBF81EA099@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sJQnLnTVteKJLexe2lGQTD8k9cLNnU+TUh1yCSaauLDJMyV5RaxzSzlGRN0oCIei9bGRscTAeS4tfzGDrSKiQbmQXjs9x33Vv3TwPL+lqzXgtTqmpkJNN8hDrSa2qyzHcfiYgVWvOBXiX5sWEcwWbY+KdjO05Q2KZkVcftvANf8IA5CBAB1En9gQ52dMxQxljImtGqGVrrg/8RQgJdREHQwjm04l5XKPbga6TWHbe5ZkGxrLCe47ol4Lp0VH46OJPBnX3JZSN9y9dwqNKJmH8fjLw1xWMWnu8mUkQTzZyksVz+i1/s89jbqq6+rXsVGeigkUeumHbkIPERF8iM3P8i2RJZsvB2LcS+F374y332+QDvoFE/hVd23Uj7zU1fcCg0+WaOGynCc/D2uFdiG8DmHb39wa0lV/CsbUKbk7B47JE4/E93ZDZ3vkYieVxEyFBEJS0xxxowNelvZs2azpgcwsLJ3aNDn5uveDVVi/gr79YVqp9kio8HQAZBnTlwdDj4aSKJwYHCmwHMYkzxyc+CEd++J15Me4z74sLYBbBNov6wxNMh/nFxYcr0MTJov52GsFYTPl9k3Syu+SCL3/Z/L1ACFpwPIYQSpoYaCnRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66476007)(66556008)(66946007)(2616005)(44832011)(2906002)(8936002)(8676002)(4744005)(5660300002)(6666004)(86362001)(6486002)(16526019)(186003)(6512007)(6506007)(83380400001)(1076003)(52116002)(38100700002)(4326008)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01Y33H60xy+0Z5C9YV146cMb63lQX+mk2JI2/0uqXRXo17VNxqyv2x5CYlOd?=
 =?us-ascii?Q?Dp2RblEECTW7bMDZl9cIg1H/4poo5ZZTGff3f/InrkIgWjTxlBuZrwBp7thr?=
 =?us-ascii?Q?DOS8WFKtl4qdc8bGGAmCPyA5ckW7SsErGGQF7pFA54Ae8r0BKjWNW296/MG/?=
 =?us-ascii?Q?DHFvvslaQ7YevuBk6gOcbg5lC9WUaxvS89QaDYfE4LmotgQjOcsxM8VqKymj?=
 =?us-ascii?Q?4MtKOl3R0gFOW8xnK6gA+1suu5Robvvas5uhjCZ4FBXKi7R3SqVbFbFWhE0w?=
 =?us-ascii?Q?Gh9PiIck+1Q3OHaZ1FjvIKq8XlYzB6jHg1ZTXKW85ge4GsO+hGzUrpmejKZb?=
 =?us-ascii?Q?GR0AnX1fVQHuyLJumVcGHFP18HcuBgO+LmnraQqmSjnsQkRkUjAoVK7oFl/+?=
 =?us-ascii?Q?AlX4Jg0IAsL34cdcEhtMIgwyUauDTsiKQaNP96o1a/akN13WugyrptGHwVmV?=
 =?us-ascii?Q?Tc9LfRgbWvmBdLdDnZxamGLFDithB28u9WCZewYi/o46U/17JirNHyQy9jiA?=
 =?us-ascii?Q?q4CRCNeleo+IxMHXx/JojqdFFrg+S2qRvG7SnD7KAxVPPNBoevVZhHn15Ncr?=
 =?us-ascii?Q?oxpE7hSIUgloRq8uPXxUeLT6UFl42HfXxbkOuiPm2ex8xNfABqKRXtzIfcMp?=
 =?us-ascii?Q?QNhVtWRPE6MgkynK/RrEi51RLIMIGfSgKVl+89GjtuYrQfBhvtout6DMPWz5?=
 =?us-ascii?Q?wpLaVNlyEvvwDthkJ4MXEEot8HFYflwhTmUEebYfBMSkdQaztCc4oDOGiAJE?=
 =?us-ascii?Q?1kQOyCmKRfRDMNYxl6B0RJ4C54AUc9xaxwtg70g4usA2tq7RjNYgfBWxZVpP?=
 =?us-ascii?Q?e70Vrh88UyQjKX2wGyeQGBJRxF5fS3YDv25YEo2LcJoZ1qkQ3WxFx0NNJSEM?=
 =?us-ascii?Q?VDafz7w3lCjUtYCswbKu1tD2yxROCRH/mJAgNJjrkliYFonyENn7I0jItLC9?=
 =?us-ascii?Q?a6jgo+0PFf/vWVt0SenkqyqMrJLQ07UdUdZc9XhNr56pfezLxOVVyEyv+OOt?=
 =?us-ascii?Q?SP8gjLllLwI3EY86aCK+bv8/eVCpLl7mGHpxdnH6QeNVojQUYUn8FW4+czWo?=
 =?us-ascii?Q?ksIEK+WZfikoK7wrtNZmB1tBNPrv3soVvzSfgtGiJTbH1Erw+f6eUeX3PG6H?=
 =?us-ascii?Q?ApeHZ3EbALALxpjo9qNX89lI7JI2RE7jn8mwUShDuIbn596eoTRCmCvwTzXY?=
 =?us-ascii?Q?ws4/06QPnB+YB/gZnNKVode1xUhoV4P3TvpvP7s8Eo5ul2YWR8f2U271dCpy?=
 =?us-ascii?Q?xJFjSmtmrxIr98mp3AosxrBAFZKxdlMldOjmE1UZc2kH8a9gzWfwySO4JSCZ?=
 =?us-ascii?Q?KAwEdIdBynJVGHOkWtauVFGCs8m3cki5/9pWBNxDus5dhBTnnOfXvimdpTsH?=
 =?us-ascii?Q?5G0EABv+eieWXiS0367nLcBAuCa+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce55385-2e68-431a-4a11-08d9359a2d0a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:24:14.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daZA+BWBSq+qnu2OiTEy4z5hM4Rm0Rjc+zSnrrClrbNG2G9y8MDqxfxfQbG7MrcrED9EdrRVc41mVyiCLx2t4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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
Cc: ckoenig.leichtzumerken@gmail.com, Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With added CPU domain to placement you can have
now 3 placemnts at once.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index b7a2070d90af..81268eded073 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -180,7 +180,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		c++;
 	}
 
-	BUG_ON(c >= AMDGPU_BO_MAX_PLACEMENTS);
+	BUG_ON(c > AMDGPU_BO_MAX_PLACEMENTS);
 
 	placement->num_placement = c;
 	placement->placement = places;
-- 
2.25.1

