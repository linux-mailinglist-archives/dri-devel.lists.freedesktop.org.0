Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AD249449
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 07:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C730789FD9;
	Wed, 19 Aug 2020 05:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E54E89B12;
 Wed, 19 Aug 2020 05:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXG81a/rK3nz6U2UZP/AUtoiPi8dyTTQPkhLq+wzPkM7QwrmTQsJeMBwd2TKlWL7pOfMivyp5N+yXGHU5gE/dQzmSOU//LNNNfxHJM2NBWdJosUJCUmHKit76wCAMY+0wlEXLu0CCGZUPSzo9al8dDvGL+1MqUkMd4LNwnL7Of78qynF7crRAYxDvpGPuLkvNVpv/mKPQqajnRJMRE93TgXrHbG0WjDxttzu7u4yN6Z+VVfgEdt2dEyEJOcAQaggKwXmpnH+IIQ7YZ1eLuUOsBZhYZB3HjTPkDMy5ey3MgnOgavJRgbrC9fzcaEVc3P5INkDF7iNo4/6GX1gHnxSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XmyULn2pfl8uVHeBYcGqBxSoAWwOay9anDszPAo2nk=;
 b=aOPo9CRPmMbs7PHxqgB7IiPqv+FfuUK3Afsr79v/xLVrUgRFMZIydVEy7ZnBh7fWmX/1L5M6qmnLAXAy3fFWCKpe53UGBXW7yJuLPszS2023HE9RRvvvqgLOIICq+ROWpQFk2ptnBVMnzrL4oK+WWee1d+NyASKM8JOYocZTxGYlmMLn96HMjpl9YbWcE1Yr52+iRjEXsCnZiPs8WO+wnoeVQlVeuIar8vl0tfYI6fErjDeb14T6xIzff5Tjd+sPU8FHY1k19/P/WLTjABFYWybN+AUhyquZGU99CM/2CvuEA0MkfXEkYoZnqrgp+3ukVTE1T/o+eNa3z9+OAPpDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XmyULn2pfl8uVHeBYcGqBxSoAWwOay9anDszPAo2nk=;
 b=pOD7xbkefc5+8F3yJJdJ3SJQWuzs69lPph6KY09kCh6g2552ENmo4kA7Wxa26XkJq7L7ZmWizg+IRDM/PB5twv/5sr/hKHAiAzDTQ+QcEZZ67OeBi7mMROUEmeeQacSUJ52p107YmaVZOc/XkGWR6HRVc3duWz6X4GT6QOJqcoo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 05:00:57 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 05:00:57 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Embed drm_device and eliminate use of dev_private (v2)
Date: Wed, 19 Aug 2020 01:00:39 -0400
Message-Id: <20200819050042.7370-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 19 Aug 2020 05:00:57 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54a01104-eeb4-4f87-5ddb-08d843fcdbfe
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2618590950B533B124F6330E995D0@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsXqs1GQ+oQF5tf1kYe1gNjpNpkMwhuj8/lhNrcAAM54A8ajR33y3BHSl0k2l1uXtlOGE7yziZlbhueRNOmvPEXBzb2rm9uzD+yqS3t+Ao2nZn2h3I87Cma/v9tM75VFx8LDNwp/lu4JQegkHiYiJkVAWQM0IjxMtcYzcyFTw6iqxSmFAATJFgjl1nRdJzoNV6+5jN1HmECjdtxXzx2fF6wPf+LYgEW4jitmmcQKmh/goBajbBacMdq/TQUd5jrg3BXJ2s1LhtzjClB0DditxDrCqi5kxVf9HLA3NoL/zHVaRCBu+YaqTg8jDGZ9h0e6TjKcfVoCS7o0B+jx2ChwHd6EZF5Ru8dRQdB5iI7he9zbmcu6x7a6l0CkSjzvCbTU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(110011004)(83380400001)(16576012)(316002)(2906002)(4326008)(36756003)(54906003)(8676002)(1076003)(478600001)(186003)(66556008)(66476007)(6486002)(44832011)(66946007)(5660300002)(52116002)(6666004)(8936002)(86362001)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4Ux+UCSDnyrq4uup2mdy+2iP/+3sJZoZynsGnEjjkbRVxdCjTRfFywr/L5wswDKHP6hV5Y6cztA2OTeQk0n5g7wtaQL43Lmixh9IIkcYtdq2x9SpIbJmRf7Q4Q8HXZb5w0j4zWmZX6827Tev3uD1WJXYr8Z5mrOQ1W19BvM2bF1oGKvAJns0ecRWgC38oe71cVMGRwzrHPq9NqmIdc77ryzZhm4Tp+WEplCJ7XQiOnz6wIz7hg8tz/KgtegqoTZtLUzSa3OpULDYaaneD4CNGtXBHNFptHXKJ8E4soo2ja85NvTyotDpUdNU+nRCFgx5kM4nFIAWHTpVujQIra3qPvgP+4zml/hmGHFg+8+tZ6mBKx4nwE3rJJ4tcx7GT5hzCNLGWSp0I0kfULwNx3sEc9b+Yb6byoNo2FhpLAw5nAFEdCaTo8s/9easn1NA1Ji4NIfsc/WBeffmNm/f5AwhWsWvlzu51XqmVPexnsr7MXIIg5/+bGL+yFNvIQwZc6xVbJMEUYH5/Z/TzWoClmjP6rIbTe+xm6WBabnjIWMZthWJntYQyjy2ADJornvr9DLxYRmejdfGPU0VkEJeHJ83FWVqquHNcIav4ES/pgKpOv0w+zAxC9IjmqQUymPJ8nl3l+hRnkFc8SuGF/RUG9d9Dg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a01104-eeb4-4f87-5ddb-08d843fcdbfe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 05:00:57.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7Hr3O2wbvQoPPdUyocJm2Zl+jrmE7ZnEHfP6yhIrCzWSp9pK56ZpjDuADVtiB/G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the comments in include/drm/drm_device.h, struct
drm_device::dev_private seems to be obsolete and it's
recommended that drivers embed struct drm_device into their
larger per-device structure.

This patchset embeds struct drm_device into struct
amdgpu_device, adds inline functions to access both
structures from one another, adds a DRM driver release
callback to free the container struct amdgpu_device, and
eliminates using struct drm_device::dev_private.

v2: Split out patch 2/2 into two patches.

Luben Tuikov (3):
  drm/amdgpu: drm_device to amdgpu_device by inline-f (v2)
  drm/amdgpu: Get DRM dev from adev by inline-f
  drm/amdgpu: Embed drm_device into amdgpu_device (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c   |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 186 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  61 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  42 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  53 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  36 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    |  22 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   6 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  36 +--
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  94 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  96 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 104 +++----
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  94 +++---
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  40 +--
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c          |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 145 +++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c |   4 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   8 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |   6 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 274 +++++++++---------
 54 files changed, 774 insertions(+), 768 deletions(-)

-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
