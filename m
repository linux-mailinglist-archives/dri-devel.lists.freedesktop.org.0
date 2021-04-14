Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51E35ED83
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F206E8D0;
	Wed, 14 Apr 2021 06:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB706E8CD;
 Wed, 14 Apr 2021 06:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0yiZJ2+nGHw3dqzf2BvOKEmvC9qKJPq/XIGURcaTRg3/5FNfeOSDIDJwX3iHADu8PKdYUHg6rh/PAp3jZOQ+BbiixvQUBgfw3voboBB+82Y8UCGtzS3TORKfzI9JjiqzKM6y2uTrQl7kCmi+fXP8SGQSm4mCdCgd3jRwGAGCsb1mlCOgZ28Xe89UYD5k83aucuLCJojhIwfgoQcqdlYp2twJ1ajgBnu33GQtVo9XlWG1ODPpCe2VefiUwabzY075xEPCyBMAunrQwpVvCM/RZRbsokcZoduPwp0IxIGcHLiiNevrg5FUQxrqC5QCvInApzrkC70jPVXuBqcIfcRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9EAxI1BZUjzXHhyeHSp1/oCJve0PjQINPMOATkRqKs=;
 b=U5KhZu+Kh2/FSsmtIYSwpvOS945SS6CeJnXy+B/0UXML28O22XzZZ4GZEzfJ3yMDiGl+pP/plDlBMJvRtZOHYCfPuHTVVrnYa0mRy8zJHFIYgIeAWlnBj32icp5/kgHYG6LwOsnCUmGh2p99U92Olcf+nb8GsbvJYClfwoso5Izwo4X9pfAKbGK9cIkGTyWX1Xz5cPoe3HRIZfUDHTaYRyN0v8yEcNFmu2bENr759vwSpW3hQBlivJ91agtd31mWM48i0OkX9qAOovopUllHn8ibuXDWhKuuQOlw0kUrPuSFj6h9yvu4HD2XqvdrgBpqdQzIKUyqV2ecc0De5MDitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9EAxI1BZUjzXHhyeHSp1/oCJve0PjQINPMOATkRqKs=;
 b=48ChVcA5mIirJw5neTtMnGrJLFy6mPzCdoI+eVxumMrIsNkShsLQLaCr1/w7s5CUFl/yIe+Q7zmVRj2S0nRyIWmEFBnLCP6OL81N/cSck47DT+B+aL0Ykfk3woaSinJYJa4Lp4+DD0twIxmD4TBn+6Sa4G08cuWmdoWEvAnZBpE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:18 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:18 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] Implement multi-GPU DMA mappings for KFD
Date: Wed, 14 Apr 2021 02:47:55 -0400
Message-Id: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c596ee7-1ab6-45c0-90d8-08d8ff114922
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125A1384835BC06F9F1A611924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDllX8If6z0zjFMFqs2vwPfkTvOODT1FwtKiIRh8i0Byx3tPB36K0/j3ghoNv01ZUj9H5JypsNmfqfBCu8856irDjDXySrj8NkeI7kFlFBpmZQ7z6dP/MdZ+1su5g4+zfBP2yTMm7jGPBY46udRiH++flyKQiHJd+K7Mf06dg+QhNRauEdq5PhdB23wgZLFnx7h3gclV4PfcIscjTXMTknGTKlbCwlebki2pVpvz6vLRw6roZPSobyH1w1Jip30ersHF1ZwYH9X/MJJmaE6oCoP7W0uPBSDnF+nMLHI+YxBMgJaYwhyPIJlhB5mCVZNmBxrInB/Fy9dJWnpR3XSsDLw7wzRjPvasPqIUrTveKwC1C7jU8i6RVo9Bm87nr+0uUSCCHmJNRv0V7hdgLaYxW+EphPPPhGAcsmTrnD3rRfFoqLFZbCtFU5MG9TyHvnBXAsXfKidCewEY6W33anGhohOkhnLdRyyGID6QlvJlEBDGqDO++u89um9eA4Ss9lbvEEd68bSn+oUpMRIC58CGUyQ2+/RU9UX5v9laOFkaTIpKneF1Lh5UJ0obIaovDNvbpfjgv5OuFpKkNsEPSeQU2FlKmU+BQ3mTCVHsyQiyGQzEtkSKt9xEhv8FhW7BPp518EWVJvd1x5B92AuGHs8bNptBdVchD3c1Us0K6rD3Z3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rQJMUK0g/wfwMa7X8gmqDTKlJm7tGt3WhRaHxqIkYsg43owcK/QCRYD5DAMc?=
 =?us-ascii?Q?qrCPl+4Lv5HgiWiKSFQfgxK1WlU9jKN+/YYJgxmxBNDUEoi2f+/I64euXVhq?=
 =?us-ascii?Q?i3nFfv7rNqrq5qy0aMpkllkRJ9fOspeaEkihFkGjrTGJobL61Tdr/aYWNoYR?=
 =?us-ascii?Q?WSArA2QKqX616Uualkrnvll5fkb+y9zuBpePoP19wFZwEtUhpa+qlzQVGD8j?=
 =?us-ascii?Q?vNL8Q4oeZnu1Jq+AuWkEkRekAP5prDn9zKWeMtckbAeg6Hy0597RkIS0UjI/?=
 =?us-ascii?Q?V1rIturxQpI1wzgjKy5eszHNHpe0spY8LZhzCFJgM8yzG6T73t8KE8OHGaEO?=
 =?us-ascii?Q?Hd3pQsz57803Ex+PxKXeai+E/l61mqETLKml7J5ZipVjdZjZUeCnhMX2VXBA?=
 =?us-ascii?Q?+dlVa+lDM3/JL4jin3lNtXksuMY9/2edGtaFDfMOpLo/0WTH984rF7Yxjnlg?=
 =?us-ascii?Q?zzjo9Nv35+Eax+GE/5G4OQCZajsOAw0zzBNxQ8kvWaV6fwHNDBUbPsUuJ44z?=
 =?us-ascii?Q?WCZz+f2mmusDSDE163XJ84aPmwAwLqNXrI5a47YitBLh497TLSyfeDnsSIiB?=
 =?us-ascii?Q?Y+AlcSlvFRG95n2mObPbMMOqJzbfwenEyspiL3HaXk2Ygv35iwXUyZIPO3Ii?=
 =?us-ascii?Q?niO9il/hq3szDxbrdPe26GVNazLxGNEYkSEMvz96eZNnoXYLe0uc2FHJEAOP?=
 =?us-ascii?Q?TaZVQQ91JSaOJaFhB+hwR5nsjpnhefpCE81uEurLrpQEjlt1yQ3qVvplFC+B?=
 =?us-ascii?Q?KhZguH5DmG35ZwWFFvsL1uOJi0oAkRsZ7/3M56EkYE0F1TITXPq2SnVvCIo6?=
 =?us-ascii?Q?R89Vw9Ee7FvFRDhYJ6ncQqitLMsNt+zSOiYqMJQPxurIT09xxvnkcoeRlDmo?=
 =?us-ascii?Q?MrA7AsLGGGJ5g4BlAfKJfq2HMdpnHbl6NgSNpcyI9W51e1it+4cR1My+FFSH?=
 =?us-ascii?Q?WpGPy7fc6ZH7eL4pnKBjmqli6mvcr8ucs4h26/jFFTm+rFVoK3145lvZCMiZ?=
 =?us-ascii?Q?0+CaqoJIiaoByDc1LaoqKKUCZg4YBhU3gIt+Lh+gNs5C8dAEc2doQ9qDwkLN?=
 =?us-ascii?Q?XLEqQEM/ZdmWh2hs6va0WXyhLJHh5yGh3NKd57aW7WY2L9WZik1sv+OsJqwU?=
 =?us-ascii?Q?aUHc43/4Au9p42mli3KOrq4qhearyGlZZ5hSa1RTa7XEVaRslC+mkGpoMYqE?=
 =?us-ascii?Q?QVwG0aKAJKanO3ZZCVoQnD8w1b4xtb1hfKrVct9LBcV3ZIOvKEmt/60CQvzW?=
 =?us-ascii?Q?i4qOECiuUQpnBXMvgYMaLcxMSRYGy2bltMDjVXWw+7lwYN4wI62T4VNebR6r?=
 =?us-ascii?Q?AZnMW/GSu+NBdbgwzBTvMq+v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c596ee7-1ab6-45c0-90d8-08d8ff114922
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:18.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx4FiGLqDVatnd1aRcIuaWLWzZ3aXltDStL2WK6hqiz6XdRAAK9M6msXxOkh07n7ZAajLxi2fOJlK2Gn6x0r+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes DMA-mappings of system memory (GTT and userptr)
for KFD running on multi-GPU systems with IOMMU enabled. One SG-BO per
GPU is needed to maintain the DMA mappings of each BO.

I ran into some reservation issues when unmapping or freeing DMA-buf
imports. There are a few FIXME comments in this patch series where I'm
hoping for some expert advice. Patches 8 and 9 are some related fixes
in TTM and amdgpu_ttm. I'm pretty sure patch 9 is not the right way to
do this.

Felix Kuehling (9):
  drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
  drm/amdgpu: Keep a bo-reference per-attachment
  drm/amdgpu: Simplify AQL queue mapping
  drm/amdgpu: Add multi-GPU DMA mapping helpers
  drm/amdgpu: DMA map/unmap when updating GPU mappings
  drm/amdgpu: Move kfd_mem_attach outside reservation
  drm/amdgpu: Add DMA mapping of GTT BOs
  drm/ttm: Don't count pages in SG BOs against pages_limit
  drm/amdgpu: Lock the attached dmabuf in unpopulate

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  18 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 535 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  13 +
 drivers/gpu/drm/ttm/ttm_tt.c                  |  27 +-
 4 files changed, 420 insertions(+), 173 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
