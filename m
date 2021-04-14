Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49B35ED7A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31536E8C3;
	Wed, 14 Apr 2021 06:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722AC6E8C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp8uQylPdFN2nuHXSDkUJ1i4+bWMANlio2UZrfStUqrWDhA5eAe/laEhhBlPhZ2rrCOxWEuEZpDxndMUJ8I4KnmVwuCzcpkZrvvqyy8VSd5auHO8O4jit5ijhOe4fWtvilhs9yAEO6YePBGvC9HdZunEGes/eeA71L6ErC6uVfeHzFFgfiJ6fRLDyR7ppbaZvG/Fydy4aFXNXevqWNgRLn4yubSkhGDm3szjsNBxoBcEBL0tXRqtDtyeskn2nHTesx+ZSjUBTYC/2r6QM/hbhUZXFiSxLspZ80bCDdt2hefg7ptMxIJ0QiivXPqj9Zj2KYyTw92hCR/onW8znVdxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9EAxI1BZUjzXHhyeHSp1/oCJve0PjQINPMOATkRqKs=;
 b=QxwJhQhBRiWih/Nz6CE/MSeRAAepeoTAl04oobK+AZamyouRqj8XdLXEatN93nQ+ZX3P5u4XhPUs4/dat7aHgHVWqNSL8dRGAKsIHj8xYW2je8X27CEBN0hkoMOreLIAX5zxNgSZfL8rGi2pNo6MTjfR5J4WzS6PIB6kNy/FaEL04hYlEj2rR9+6sAUi1SUjfhbUdk+khFsPpCoefYMVaBbFwRNsrOdBtiBI2e8rc7zrE84RPmAbQWmB7zWHUDBd/V3v8oxEmiCRZkXpZMHLCEuzCc4nrlhwdYcR3RseS40aY30b99VU7CwqRTtMITUrZPQdTuKHLbhsr/mhznacjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9EAxI1BZUjzXHhyeHSp1/oCJve0PjQINPMOATkRqKs=;
 b=UYeWU73arbUeVkYABqTECyoTs/pzQUnDzoQo1MK5QFqOWpdDJlTTqkIZtAUPAWMMuQIwwzFP4YD+nO1XfYXdeEH0ALqlhbIA/E4pt1EQGvtSYZn3HIrkLevt6TctO3NDPKgY89FC5Ut2j1OCALvGlK8vnj4Lizui/LX0yxypwoE=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:46:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:48 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] Implement multi-GPU DMA mappings for KFD
Date: Wed, 14 Apr 2021 02:46:12 -0400
Message-Id: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14737691-73da-4779-a091-08d8ff1113ac
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125AB83587341D22B0F05E7924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avOZZwaXWaIa5xPpZw1UayX+hAEgxSHxMZ6Lzg/VzGa26ZA1JEYOrA+iqYMFjggwGq9JymaGC6MhsP+XnGDC3FaJUK9HBkX0UaLx/UXiLqb3plqE9AylTsEZ3IG4ZacaF97es7cpYYLjJIkOmgJOtrocb7EcR9PpIzPEPlkv1gYQqbwSchBkoNtIAmX8UFGJY8GHnDvCDlv6/km6SZwpLqy3yNa4ANsZXCH2SLr4erNPqTOHi41rskM9e9X1v+T8IGf6hIAwHxJ6B5N+tutt97qBMekhIGNx4PVs5v7BZKQuYY2bs6S9QwzyjmLachl2oBBW2Edj5kzy3HS236lloKxNE0wOoTgbocFxHMQHipysefqYTghOot8ysRyQ7Loz+KDFHCbCAZDBQj1YJHAkuKWPAt3iFo72WI1C+61nR7Suj3zJCPUrOI5CmTZVOYsNYlHPx/Z9sMncqGhORJfaIlf/0orvKzWetHi/OeEgrEi15otcEW51kMLJJsqc0n13lF6XmpKTLXr3mjXHvdPJUj9oaiXcld8kaMt77Yf4sVkU9B0muDSBut/PnSnmLlBEYupcIF1h3EQwU0NOXy0iWPzhml3cSCmg2gHO5ou288nD+7OBGXKQqFP9wJbB5ISkMBrma97lSPOCdFhjuegnpNxBxze9Bs1EqUIRMGHle3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(5660300002)(478600001)(6666004)(316002)(186003)(16526019)(66946007)(8676002)(83380400001)(4326008)(6486002)(2906002)(66556008)(52116002)(38350700002)(8936002)(86362001)(7696005)(26005)(66476007)(36756003)(956004)(1076003)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T4GPpQDc0PoWjh5q1ioQPIP8aci6TrLx2LfJRZPQoStY6uW92Ui36oGVEoyq?=
 =?us-ascii?Q?lacDs0uqGWOoh8+xUxpkrHPmTTaYMMCN+E3TYYBYXH3Nptid7vjnGaSVLMQb?=
 =?us-ascii?Q?zmqr9Ho9J/cM9C+rywaosJHd/YdfnI9XyVzqZz/cHxNMo0vOUJvqDfFCeypS?=
 =?us-ascii?Q?tW6SGTHYdwBQI1e+Y2tWU+E3iyCRH4A8cVZ9GN76o6rpJhnMZWsR2X2+0tik?=
 =?us-ascii?Q?YF1vY1c9FOwC4DJqL+PRsQnwyazx2YYwDBi1u7S+BzY5HfgwjRlqyQMz5Txx?=
 =?us-ascii?Q?poM8y+OgPwcUd0Vbmg+w1M02Q2wv+fMX2n3WB8e16zBREHwLOJsmZXmc/oVa?=
 =?us-ascii?Q?J+yTCcCXJdre7GrSUvWMBQhHVFIkhXyXKzYcOnnBFBumAY9wUrO/y3OTP8Ia?=
 =?us-ascii?Q?gEyFo7fpiwvQchFRTe+NPJVrulZa7DyesqSNxzbqsEy4Zk0Z9LDGLH50ShEg?=
 =?us-ascii?Q?vvBPe/CaZgubpCkM7c1+ED2yGEAKQmz0t9bK0n2JWp16zY4JeLRywKYjatRK?=
 =?us-ascii?Q?QLaQ/XitJqIbxYhB8cvEWjPLv4Cc9ureCl0MvaQ9SH4+/XM1ggIrJO82m/FY?=
 =?us-ascii?Q?UU4Vq54etK4fkP7YPwiBiQvitpGesGDSCZxRHJv36+7fwteT9Pt7imfZUSRm?=
 =?us-ascii?Q?Ssixx8+oPSapzMTJCDxLILATY70lCn1RJhxXf4zcmL/9dj5vMhKufyZ4UZjx?=
 =?us-ascii?Q?e2+3BI4QtXGdN9HfK+ovcbQ5xo20zwF8Y0Q1+SYaWri1DkxyjphkTy2+6ujV?=
 =?us-ascii?Q?qeqtd2p1e4w8H4KdtsnMgJtc+kFQRVTD0M3jDCAXR2JYacaWahNd5vOocq22?=
 =?us-ascii?Q?b7ChEGa0Oj/g9H+JPJCgBpDKiaDbJ8Ju1347hvMYplw5FqiTq4+TvK/Y0n3B?=
 =?us-ascii?Q?gat0DO0neLl/flR+8B9phbDQA8nqSs3QciDiNQnmuW9ACly7saU9BakL+GU/?=
 =?us-ascii?Q?kwI/iWvAkAEGg0laKn6RlQHgkpkgNX0fBnXWWGqhFWY8qyLj6h4n4nfwQGXw?=
 =?us-ascii?Q?mKiCaMdWAXbfQ+nFrCarrP5x5z61Fl8Zq9uFHaasEGKVX8sk82MDwqcL/6jI?=
 =?us-ascii?Q?ZeIVPu6DS8Rnfr0fRV6D8VrhedpfdlpoOPQstNNEJVHBSJZFnVdB3SsDfAB/?=
 =?us-ascii?Q?I/rlFprURxdtwrTq6gS8R3mTu3jk6+jBufPgmJF7bCjLySuwBl2/If4YXJcX?=
 =?us-ascii?Q?6qSEeAhsr9MblUiCOEZexYItP50ijnVepxXhaTLZ6wJ0O4Q/SbxG1AbiTVDl?=
 =?us-ascii?Q?TOv0HpZ6sBX8e9kQBDmDM+ychTPdlE0aWJHV3KqQjdSAZdozYwpy6OvBc+Hz?=
 =?us-ascii?Q?FrPdQ3Jo/3pU7nRL7ByGd2Xt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14737691-73da-4779-a091-08d8ff1113ac
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:48.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGIGRFnjnHtgWGn2XRkL92VC8t4EC9VKTcu1NIPvllMtlqcyDtkZ0HdLHI0FfZvFQwbyz0YcTCBFAf3M+rkf9Q==
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
