Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBB3B6EE3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056A76E821;
	Tue, 29 Jun 2021 07:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00126E823;
 Tue, 29 Jun 2021 07:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALc1JcusZklCA/FfukBVaMx8Gny7K2MJs9C+VH0zQPW4dyRLswZAdITDIs7cOtU6vmVS7bkNOELvt5ZOqfDszGNMnBGFg+MiRBWSHY+4XLK8Q2hm1XFfmpgnPhTGDPCmA1nSPUV6Gg2+HdoxMQIjW+Sto294XsFd8XlptuBLYa6MKRhENU6bLPryxST81iFsRxKYVKs1FMQ9sawcW/fw7p+mL34SPnNuu9yF1f7AE5isLGZ2gEJtgOhCBDK/oiq1vUGdP64Pfl3LWh1TEuOX9WWYVX3MC0ZRdpHIHEsZEqGwj3N0ZZz8ODl+B0UuwcqOK4hgT873thUgPu8vBNGBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnBiqDIGazLas9alx1hBxUyeyXlZxxobdElOUAsv5/o=;
 b=gsGMHsEdIqPUonfOqhC6dE9zBOkUuS66gznJSaeJQtwQelut1mmhTkhN2ygdzaww0JTZ+NE9HIS9MNhFc9Cv55tgbOgSb0SeWqEJikPK8WYwwwG0ARfYDPoVJvcWWw2+UGMmuob1Jx/dbcdg+2Yx9q+H/poFJcP/UsJVaenDaeZwDX1CAoj5tG4vPjvNUio+qiZmDGDVfvaA5BsF5N6iAq0eT3p0GKlppSnmAAa9fJ3RtI8Dl/OqyCUdTOylehwGoh6fgn88EaOBjpdCHJ18D7JnVxktSHu3Aqgz3X7EaZ07gmSgXvKLhfTmgybjXl66cGFScJlZTSoxObfGQWfViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnBiqDIGazLas9alx1hBxUyeyXlZxxobdElOUAsv5/o=;
 b=Jkm7WNYQxKNphGCiaQReiZphihI/Rzy1B8u3N23ILqWRLBGqBGYlSlOTx+US0ODt6GFNTEIBrZIuNhwqKrcJW6Smi3uHF55ZnQ5/Hm92tgyQZIsiHOGHB5tgUswMIK+xL25T148HynUyOrFyAWANh7wxRj2BMB5C2FjN9O6fKZc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5341.namprd12.prod.outlook.com (2603:10b6:5:39e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 07:36:49 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 07:36:48 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: raise error on incorrect mem_type
Date: Tue, 29 Jun 2021 09:36:29 +0200
Message-Id: <20210629073629.3069-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629073629.3069-1-nirmoy.das@amd.com>
References: <20210629073629.3069-1-nirmoy.das@amd.com>
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
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 07:36:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfca8f3d-7670-469d-193e-08d93ad0a765
X-MS-TrafficTypeDiagnostic: DM4PR12MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB53415C4EABAA062DD2317AB68B029@DM4PR12MB5341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJ7R6X0vEJ1SZRQKVSoiAVUY98ln9vwt8kkwzJpSqSAQnJRkLVBJDHGtJUjLqtSgMtFUb6DwTOHCVuz3Vzj5XARaxvumr5ihG9kBTyd3M1WwwLYnSq7bvEBb0ULQcrxz14nxnRXJqBwkIdBmPEY1h5vWsL2qZzoEGDfLN0WhvpilAmgfYw6cgJWikEr6sdY9QG1//Mc7ByGrd0Xe7L4Lzh1y0rg7jUpK7U0AXtDgVS43PW302WbgLOHD5CWpN7DOY4sG68KAQSnSFEy/0NbqLPDHYYia4GcvbA7PPCigyEhAiWmbI8P9SzVQBDIPQPnucbYRv6cNRZDGWidOepowPJRdqPQcPjG4f0Tfyw2TA9/54mx5YIfSnLRYzNeMlhBMe+knA5lbJIW3x994ew5/UfcouZssYyE5ftLS9i2ZRy7iKi1OLAuqLHL/QkP2Nl7CCel168VtCBEpUW0bNOa047UkRY1sxMYJx6cyQUs29tlMkz7fbLxx9PMp7dXXoVyIWm/v1BlkF+qNwSZ/QcCWIraLTkmFGTr3dMmEvF1pNHIlloZhu4pE4IluC1uJqvG6OH5mNuiuzX6ykWPuRrfmp899Cc1nLYjybWIufOGon3owUhjOn6MvRm5D8N1AqbrMa5Ga3trM4L3L0AjO8taHVJLmJOSA4EsxrRIwPi+wu0V8buCSODMXqUCwKRjLikIvlX8b+UOWdaIqWJvSj59SOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(4744005)(2906002)(83380400001)(1076003)(450100002)(4326008)(66556008)(8676002)(66476007)(8936002)(6666004)(66946007)(6916009)(44832011)(6486002)(5660300002)(86362001)(6512007)(186003)(16526019)(38100700002)(38350700002)(478600001)(26005)(36756003)(316002)(52116002)(6506007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c4lobB9pV4l6PayJRV4gdGEwRdnDrS18FVcH+ukLcVfNDDxLn9T5is8Zge3C?=
 =?us-ascii?Q?k6fsEnWz7bTd7UQkZwmWRW2ep/KVejDtFYrjcI8Xb8t4jtKUvjlRM1XyhAQ+?=
 =?us-ascii?Q?IUY803zHMmwjKvG4D3lLFjGsw5rHyVITbtUA/84O9hSlcyGtWlceT/INjo4A?=
 =?us-ascii?Q?Ch8QwREKZqARbdiCWyfv6HwHHg3o1SuMMolPLpTenKTFwJWOnVfQboSaqb3A?=
 =?us-ascii?Q?YDweWuT4umJefK9AfPZiRPd+tc2iETiY+uerRi6gOZ0H3s8PsdJDS5wOXINp?=
 =?us-ascii?Q?O6h5WiEVvf16NFn8YmNPNC7Sxn1L5Jbo/Pii/Gr3Gdmoda4mHpbbNdt1e7T9?=
 =?us-ascii?Q?mntWa61Q6y6YbIQZ6iYogHqwnXkua8f6pxevL2iTUjGz0rEjUNtXvHzczUdI?=
 =?us-ascii?Q?EEVHMRwpDtekJQEmsDzWTbNYA23BMK0LwLGDMbDOBMcxLftMaZXcT7ZRQsK5?=
 =?us-ascii?Q?zkAqdTB4Wh0a+O194pdXKZ+2fukT6L3NmuLVd4yl37In3N8i1T+TlAMiRSMm?=
 =?us-ascii?Q?KR4IYhuPGDNKiqm+SWmf1QD/alZxyGu/y8wQAcjnVRbU8hNN2IYhHurxMGuh?=
 =?us-ascii?Q?FTFLmwuPUAXlvO+qTbKuDqxK2OpmIOjpTrh+ih0kcgdLQ49A7m+zTpn/qmS8?=
 =?us-ascii?Q?kqK/8V5aNojPIl+Mmr69qMTWZTf1UZ5Gv3ZgccYwmr6OWecgxUlqKvoRGbtN?=
 =?us-ascii?Q?jP2OUHVdu7a2nDUKtK26yU3JHJpipfABqK/fZnvb6rWVu3okWf8hvGljavzI?=
 =?us-ascii?Q?/eBGGVeKairWLID/V7GikfTLAjShGHAaS8auuechJUWyiG/0zyyBZLMSNwzN?=
 =?us-ascii?Q?rBL3EeVjFW56eihY5BF0LqeMwaQ7v0jpZM5WIBWDK0wo9y4vFvJJ9QprQ7+e?=
 =?us-ascii?Q?P3LfmXeXINBBZw0vz2U3F1fZs//G/FxO+GwI4XCCHi0hf7bsZevVcV9jg3B6?=
 =?us-ascii?Q?jEgAVcSE63+3f9xIiwsOHoGM4FW+GVyyjdEH/tsJe3sk8ySPf8dTPSmn/Nsg?=
 =?us-ascii?Q?pyc41ujenz7MX7RPgNemrHFlBUgm/KDaB7SM1zgXPxe27vD4hfRlhtv+WIrG?=
 =?us-ascii?Q?fO+nWXupFTY/crSnsktWIbd8cyxeRLhyXApvXjrxnmWWFbqmoL7XQhVJv1eR?=
 =?us-ascii?Q?4jxWAli4IzUwb4SYmdhfeisKJ2jAZMkpyvxqJrowJwMJR7xT5lM5YNeNO/+4?=
 =?us-ascii?Q?z7WH2QbiTbmn+WEDDNZ14BePiitp1hLpMlugdHFaH23hjqCwYfdUQzlpQ2oh?=
 =?us-ascii?Q?6GFjAoy3pqtD6JBdGKRkIDoe3cvo3pLnITQQW5xqeFGAjJLi56Q4X6FDb2MS?=
 =?us-ascii?Q?+u1GSPsfS0NolmAe7NKIb8Jg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfca8f3d-7670-469d-193e-08d93ad0a765
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 07:36:48.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tM72+phMTxCLQLn6xQGtqyYj6+LNuGIzzmrQTKxTynCnJvZFHHYrf212ZWou5dACraylNLCMXgypStHRk13ZBQ==
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

Be more defensive and raise error on wrong mem_type
argument in amdgpu_gtt_mgr_has_gart_addr().

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 543000304a1c..0b0fa87b115c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -107,8 +107,12 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct amdgpu_gtt_node *node;
+
+	if (WARN_ON(res->mem_type != TTM_PL_TT))
+		return false;
 
+	node = to_amdgpu_gtt_node(res);
 	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
 }
 
-- 
2.32.0

