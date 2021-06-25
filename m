Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826313B4835
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCBB6EE1A;
	Fri, 25 Jun 2021 17:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413C6EE19;
 Fri, 25 Jun 2021 17:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzs9NY1vu2jl/9rgH9CoyCWGMvp3rNYUHsJaFeVhmO+7EMEe5S3lIYWn4W8vY40PLy3J0Nk54I2kW6qBZ9tdkqjlWQ3cLlelpnumfpGkVV2wuinFqMEfbsJFFBlWGu6pMVNV3d/wSrT/uEbWgL/72+XcY6M+PeZh007a7fZkdWMp1n6uGmMRi7vKfnkfeeZPZkhPluDQHI1SKUnrcfFv2II0pVH0rBnmeaoo7JyFWccTsHdx5cZORuaM/7xfibXqN5DGYdMqm+9xdaNG0pQt5DU9ZVOO4ftEUevLE98LPkOOfEkh7AHpKUYorMC4cXzQNkkLBNwFKHgLPE17jx/2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/VvQQ1MLM6R9li8oKcyvzqQ8aajy6NZ/0NdYTt9/88=;
 b=gJSyrbr4HuUkSuS/exc3v0ZAylp4WFyjivuINDioSkFnxT10+T/BFI1bTyO490yBTbRyO7HZhlB3Ixk5marJyk8JKHACmN3xkk1nM4eZttrftzn+bJ/6QHihScmpbwTi+TdPH+kGJOH/Y5oWlxIJeMhBE4OQeYD2S+e5Y4D/KTiwcelraMWLZmGzkgeH1hgjoDBdRQNc9iYpniQv01pRHQTLM95HQ7C9H2P1WrHLTAU1RT5vV9qu0SQZLn5dF4j44hTjYdJYlNULlYA+dOUz6sbint/0Fj2FDdPzE5ng3NvxOH9UJTrMKPqYlu4Ct+dnFfQTqcrFK4yOqUk+v7SRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/VvQQ1MLM6R9li8oKcyvzqQ8aajy6NZ/0NdYTt9/88=;
 b=S4NuaAm3yMeFfaJZ1ZgOeQNGtSO1daaob8p5izrTBrjtjIdlytA07bAKLJcXSdybPcEUr7+YufDYdRVrcf2rccgw2GvbbxDESldIN8SS07ALCFghOLCpy23Gj/vBMM57jniKt/b5R5Jv1Y3MZVJecJdTTk93uzk1GmrKbeCWiWs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5493.namprd12.prod.outlook.com (2603:10b6:8:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 17:28:23 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 17:28:23 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: return early for preempt type BOs
Date: Fri, 25 Jun 2021 19:28:03 +0200
Message-Id: <20210625172804.3193-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.86.118.138]
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.118.138) by
 FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Fri, 25 Jun 2021 17:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd84a602-0789-4363-ffd3-08d937fea22f
X-MS-TrafficTypeDiagnostic: DM8PR12MB5493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB549325A989148C8DDF8197338B069@DM8PR12MB5493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNOkueXtoBxOd/S91RxpWqhUwyDln1B1UcEGfyhsZpHL3IAO3Mm5T+Q2FMMCitOo4VdQsRHw8SHYcVHMAXQ+KS3kQFkXozV+XOyF+bS50lIGjcFhF0GFgJzVuyXbQZezzOQdivIelxhnfZd/UU/fZ4meOFwETVn6TDC+mmzvvVxa4zvUkkyLOGcPqaP909KXYExdL0RG7nZr5fm7P8hlaU4V5GXdLKJDvFDeIVtCNPEylE1dUtf4FTRYcSv+8rBM3lGvegLVB4TBlK07wlkQklCg5dPnRU2yg9AqkVPbhDnFd9CWKJL67Z4Oic6YWB7QUEp2cy3tWHlH0Kt7PNYKdJja/yEpGQ+J8/wgkylydq9xa1KtV6uSvJdsEGARWj65Z3BkIsiXO0iQRNxuWhYGay31nEdx2a86Ws5UwhpJwYcra7xIqilWtNAH0w3ioQELjk70C0JUPi1id0oAQaynOn/VjBAOLtt9Hhnh4kABKf1KNiEZzi6QUYEEJTbnWweEGJ8Rj6/RZzz87T8KYaB0drZWDvXccKYA9ToB7XOsDSKoEADnPu0EdDXmzNmbef/cWv/Gm/OEG2sCr4i2j4bXxQqEfJqVGhr4LP4Lib6ImXukcOqkE/pyE4Rb6MXZ611ErriBwH445+rtRO2tbs0MJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(66476007)(66556008)(4744005)(316002)(186003)(26005)(16526019)(956004)(44832011)(2616005)(52116002)(66946007)(1076003)(6506007)(86362001)(450100002)(4326008)(6666004)(36756003)(478600001)(2906002)(8676002)(6916009)(8936002)(38350700002)(38100700002)(5660300002)(6486002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NgjUrzhrWqPP1pPgiJQV0q+BkytUP4yRXfcOW0LUyxqdqR3xrvKmLy59wXv9?=
 =?us-ascii?Q?tl8FNl0pM+yaelbgJ6tauBcM10cfnYDCsdvFChngjNHwoelOjSFZBCMuy0e4?=
 =?us-ascii?Q?Io+wRObckeh9V9T2fXKFfsr9OlFjzl8DNWk3KGi4joIcc07dzgmLeIiUDBlZ?=
 =?us-ascii?Q?U1PNDurPw6KnwVoDu/pAd3ZcHhc78SyhRghjaM8iYRnTZGMCsKb+scJrwIdn?=
 =?us-ascii?Q?xU2BYkWnyafEv0egJaj/pFClZXivPB7uWPyH8FmchcmhW4G5Ye/MLCQfrMid?=
 =?us-ascii?Q?VLv9Vl5dc2/yTj/KpoyNWyRRmW3llF/LFeJM21OcCnB0ouKCwSb5D13QHX3o?=
 =?us-ascii?Q?FAT48PbUr3V38WWtc+qUkOsOBe/17HNDZI5mLlieKiCIwK66nI1iXkmfL7hd?=
 =?us-ascii?Q?235JUY1EklpPM1VugrZG6GW+Pc53f8i003eSLexUloSM8r37M63Re4T1ujMm?=
 =?us-ascii?Q?xKUrLdaeF+zPiD8XW45a3Vlk/Q1P40javhN1ac4/IIuCIsV5uI5Uq9njeUVT?=
 =?us-ascii?Q?F2Tiihb9YRmwfe1aRbftJG3Gv6fvgpFUnnZC0wdzYNNh0jXGEjMZMEJYTN+w?=
 =?us-ascii?Q?GD/y3plR1m9oBsYIT/CJOt7NEW4/4sN9xXR0oRk8Wl/sNXEhiMGbGTy5H1Ji?=
 =?us-ascii?Q?6dMcixOYW4ovoHT4inPSpdewfaliZNejDqkV/QS/7lOByBKkcSc001YayD5z?=
 =?us-ascii?Q?kreY91sQNMx76/sCoCcW/LMrmvnuTq+cVRE0A7SAmXnimc/U6kN611rV8XKG?=
 =?us-ascii?Q?2EDRW2hrzctb9ECWRuhI0WdNpjIdSkll3TZcj51NHFuRUFcBBLMeuGamf+B7?=
 =?us-ascii?Q?nN68VsasnRBTnHq6uIcaul3kMxxGIVWMggaCl6XroLRFz09toUvDb2vVNp73?=
 =?us-ascii?Q?H2YsVJZnAdUOm3Os7EX2yW97UufCKZMfpPnY0urCXW5eLXUqiYWRH+7ZhnwE?=
 =?us-ascii?Q?BnVxZuv5ztUk2TsYt2HILHx9D1xrEFprvWeTBcsazxT0I7BzYNdII4inMgps?=
 =?us-ascii?Q?RY/LVH8GWnqxUGldpv+4Z1DkavabisQYen1SrfH2imf6fvpECHpXnh10lbCR?=
 =?us-ascii?Q?8VoyQzhzB1XNoS1turJuBVCPy2ljbm8XSD5lGoaajvewKBIcLD3c//gKE+0a?=
 =?us-ascii?Q?+DWoz+FzfY+g+gsxmPQ10mWSy7eEB5cSwkjzVlweB+XdXyWP/IXSBAORxH6g?=
 =?us-ascii?Q?lh2cAV6OwutRpK/ErlDh2CjIkz+w2iivneBAKxJKuq0ehicg4aLVv1O7ChnB?=
 =?us-ascii?Q?qlL7FQ5yQ2mNTpnaeNaeaEMnBOM1Pe6q9G/PPpjwjxNHvolWsTm354d80e5y?=
 =?us-ascii?Q?XGNvua9sd0e8hMitsjk/gdkj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd84a602-0789-4363-ffd3-08d937fea22f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 17:28:23.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPMQoPloAsbgoMqAVyPiazSWWV8UZkHIi8HWODmErFkneeHt1FXgKAJsxURieVLKvUvAATbXDGbsmr6uubQ/DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5493
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

Return early for AMDGPU_PL_PREEMPT BOs so that we don't pass
wrong pointer to amdgpu_gtt_mgr_has_gart_addr() which assumes
ttm_resource argument to be TTM_PL_TT type BO's.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b46726e47bce..3df06772a425 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -926,6 +926,11 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	    bo_mem->mem_type == AMDGPU_PL_OA)
 		return -EINVAL;
 
+	if (bo_mem->mem_type == AMDGPU_PL_PREEMPT) {
+		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
+		return 0;
+	}
+
 	if (!amdgpu_gtt_mgr_has_gart_addr(bo_mem)) {
 		gtt->offset = AMDGPU_BO_INVALID_OFFSET;
 		return 0;
-- 
2.32.0

