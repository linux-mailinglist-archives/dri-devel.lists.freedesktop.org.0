Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C039FE56
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 20:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392106E85E;
	Tue,  8 Jun 2021 18:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83F86E85E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 18:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0X7Ox0u5m2UB6xjCHoNa4gDuiit6+VUd4b3wG10ELzLC0cs2UrwzvaPgmZub6qXZOLjZKLEOXDZH+mNBKqZIE6uSOoMqUaDkdSfxdG4CfDz5/D+gA/InjYndGMsOqUtL9jOAUrkR9ZFPUreAFxDDPo5615QmQXkzkmJVEH3hzj6vYGVKG6I+7Is0pYAhhtds9QrcnR4YXe6iJa4A0glZKvPQo1Ccqn43jAbLrZS4xHA4nTTd8uYZ9A1j1j3RHzhO3LPxPcTzTu1kK4gWz3tIB7enwkDCPUu6MbnJhGx4AMxQNASjTO8I0yJEETbFtkr96C18vuhcQ+i6AWWSPM/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkB9Cupe1AQ4C4htq+uXhQAJhuOZwwSMucwg01fuPy0=;
 b=cXM0H7fwkY8tIxPba/zYhsLGA4DjRIR5kpn2xleQq0zesS989p6GQjQHcdxUXfqQKDdNRzB8iZv+/oOg13YVjCLZUpG+/alNjwwBnxADYVVMKtM4lFQulHiMFwNz6LiRdLGdtNJao9D+DGMYZVD4OeFm8NwSPdITySPEau7Nr38PETbWjlNlHyMJqDRNcMUQcie6usPcgsglEjKNUborXPUlpeEvfjXZO3wDmNnudRPJlh6xfuiLDBIxpM8VoMwpwC5kbdVJMs/OmXV9T/PUhbPsIEwZAwHU6e+q+hOd0cOwqLeIqibV5gi6NdDvbSPBWQeaSqFJcrnDUW2tgi40vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkB9Cupe1AQ4C4htq+uXhQAJhuOZwwSMucwg01fuPy0=;
 b=33G4wkoImi/8Ds566gBS2geJg4CZfebgCZ1/WTyHgimljkmKJAZCqFvRmOvfRS+3TmeNNKvuo15gkaaOjZ1M7PaWxVn/Ag+L+zzFnThZpGBn8wP72mWzsHmkBiSde5ckQFCwm3T876K5Rg3WYury2bJrI4HdHnUp3Dly3kKhKdU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 18:01:51 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 18:01:51 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/vmwgfx: free bo resource before assigning new one
Date: Tue,  8 Jun 2021 20:01:35 +0200
Message-Id: <20210608180135.10953-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
References: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:408:f8::34) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.amd.com (165.204.84.11) by
 BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 18:01:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85ae317d-7be4-443e-5bb3-08d92aa77dd7
X-MS-TrafficTypeDiagnostic: DM8PR12MB5464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5464D1026DB593E4E58ACB9D8B379@DM8PR12MB5464.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3Db2Nh5f9FqOmJgMHUkJGRAbP+Zl6uOHsv1/loAR9qdNvQbNaU9vCxkYq2G10Mv7OO8Dc/o6QWU4OvtCaPv1nhpDQfKa4/x6kAUz8NOirrwz6aYm7IHpW9H2B9s4+84A4Z2VLxJKE1bpPoN93To7NQRIGzaO9ClhnxKAoOIyVAbcA4zNca1ZOTQ1cqKnX6J99XwYV8ATCpuGEEBCLOJiMYoJljiBPkeP4vSxcGr2FnTzMCBWUoZDW2cU8oM+zHjuC4/XQvCB9z04IjAwCjROQTW0ZiIkwt7aajh38jmD72OBVtbldP8vBPkGTW309fpO5xNPDzvOY8o8ikROGjXLDXzI/JEVHVPkt7yb4eZzd+klpC2QZ6awBKlt3S3YLSAjAZJ8VtX/fRAZPMjvB1sJUqy1t/daNAkiCMXx4jRVc24Ua5asAWJwYtErr5M9oP17QyBSUstn81JRrFof0/IP3yduzpi9N/sWFPThAfnz3Wq81gQSTCgV/P9J8ONwz4Jl/JyKJEp5hhOIS9te7MlB34FiXywC7xkQ10S+ViM9fTv2QVbzHAewYjRy9yzaVBpeWnPSL6teoqrDUpFdl0Gx/IgJKDs9W2VuAiAKW/11/8/j9WSuWw/RyxySaYWL9Ck5aBv2U71M/rNaOipAZG2wXdqLqMigz/pSQe+JxoE+VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(1076003)(4326008)(8936002)(6486002)(38100700002)(66556008)(66476007)(66946007)(16526019)(36756003)(8676002)(7696005)(4744005)(6916009)(86362001)(5660300002)(44832011)(2616005)(52116002)(956004)(2906002)(478600001)(6666004)(38350700002)(26005)(186003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAmJ+F4K1bfNLFbEFDVb/V+Lv8ChC6prWQBcDaVZy1kNdAEZhZTUfv/pffha?=
 =?us-ascii?Q?eJ5ksO4Gk1Ol3uf4Tiy36vguKpgzUpPbuxiWooQ0//y7kK86rNsam2lq+1rr?=
 =?us-ascii?Q?lkLw+M0w5y4JbBSV/bmWpb3OjtdU6c8pR3M4N9s0uCXJeox1PFPR+m4t03xP?=
 =?us-ascii?Q?AUIervQq3rlxXTUXw8Hz++33t2Uc6yao7ffhwt/sLXqrn9h2Yw2CTzcIEvcj?=
 =?us-ascii?Q?QaVVzVCpCP6Lyo3QcssFnyZ2s3YzIWM9AHDLw9hSOcL8Hyoaflc2ByzFQPY0?=
 =?us-ascii?Q?8fBvzy2qP3PBOho3SPQSrWxi4rNlwGBu4jRppi7Q2Rl8nm6kowDHJpf/GuVe?=
 =?us-ascii?Q?jle/mEnzMAzvOFCQi3B8updCwc6xcMJTprZ48foxbv12miFHmYkl50nzv797?=
 =?us-ascii?Q?VXTHFUn/5/eSZNUrD54fJxuegssuH0+DqvzbvHF94/XeraQ2oWns4zPqpfXh?=
 =?us-ascii?Q?JZV7fxF1In0yC6a1ya6bZFxlWBUdDEiX+c6zTe2tcUFLgV4MirQMH7JEnz/Z?=
 =?us-ascii?Q?Dt8T5lZRhSMSyZwLr2eCc0xuI2yTvPSDfXWDwn5QUWkbJJetApNtVuH1a/Az?=
 =?us-ascii?Q?LSvqhUktfs+JGY8oyrvNYaP1SSqJIRtNGAESZfiqnqHOvauMQ0hyghnGNATe?=
 =?us-ascii?Q?oRmgHN7VAdEB5VNQI9HD+0yHn5WRjgkwIFid2/BqdJW/8rFDncv2bpwMSRr2?=
 =?us-ascii?Q?hPrl4EH//LBoz9MvrzqJ9Pf/AoiY7I7O6ztCTIttOCxmtLwygfjHpHrI5Pie?=
 =?us-ascii?Q?nYjTaxebWBUK78kGCQMS7ZaIepnSWm8dNRu8yLUFnR3IFClmcehFoV4weY2Z?=
 =?us-ascii?Q?c95t+wJnVaRVE9rUi/UrVgz8YsJ4ESq4vEwYTMeZgw7obNh/rf1vstY7Nl+q?=
 =?us-ascii?Q?ZvJ/GObZ8yZGfmXQOqZ3KxfAPO59dRTIvOgCYIYR2bUOQLNVfzXiaGK2/qku?=
 =?us-ascii?Q?D6dpdBTmxA19DA9q3T+tn/XnfyU8hyTRZBX9YjjksbOsBhxomX/7cjedku8l?=
 =?us-ascii?Q?bGRf/kYr2HEIvdntxnib4mGU6TOPI2CpxdrYjlB+xpZvn0Mciy04Y3/wG+Q0?=
 =?us-ascii?Q?xOicKiAO+S5h16h6Tq/+GhsrkIp90CE9yaYK8PlHmsnhfyT9omy3p/1+SW0G?=
 =?us-ascii?Q?KPPTPETIQaXN8HfrG0dmEwXlm4USW+PHH5BNDlLOZ0mCzSG47QB5Xvrbd5sV?=
 =?us-ascii?Q?MV8HneZ3TQWTPF/vV8KazJPhCuR3i3NmLvq4Um21ax9X3gDoOU/A5EqkU1u1?=
 =?us-ascii?Q?wpJmvfBnA7FpdKJS8mcVIf3nhVOuxlI7K3kaSMBaXy2z494hq/Ljrm/EZrJq?=
 =?us-ascii?Q?+Xb03EW1yeVgMBEIDe9GJzXS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ae317d-7be4-443e-5bb3-08d92aa77dd7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 18:01:51.1275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvEUi/9INnaUtTZWMQqyTYPPJ1FvUzFECz4mZvxosZ8nrbcpJ7eVJkqEO4Fm39cZ3REXvGAAdMmaM8tapN3+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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
Cc: thomas_os@shipmail.org, Nirmoy Das <nirmoy.das@amd.com>,
 linux-graphics-maintainer@vmware.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_assign_mem() expects bo->resource to be free.
Fixes: bfa3357ef9abc ("drm/ttm: allocate resource object instead of embedding it v2")

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bfcf31bf7e37..7281912436bb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -733,6 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
+			ttm_resource_free(bo, &bo->resource);
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-- 
2.31.1

