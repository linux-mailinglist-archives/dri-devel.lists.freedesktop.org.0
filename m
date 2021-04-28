Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973F36DAFC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5666EB7A;
	Wed, 28 Apr 2021 15:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C466EB75;
 Wed, 28 Apr 2021 15:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcroSFWPYOc08gzEasYvlbcxvPgzvp+FlayonchB94aC8X2v1H3dZhiuXyOdGWaynYdX99p2W4U3y6YEt7HNCRyOnmJGZuBPeaRgdw2u9TmIspx6mMEceohtFoM+zKoa1oWABVWxZ5ZAWZfjqB0DmTQ66AhgmXXROrbVSv1CUQi+6kA2QG2Gz4A2TGMGBgsuqA0vkc7rWua3FhfxnTGAZKn0RGRww6IspHYsCDElOhV3VWAvnJGw5clRAqlxIsiCPvulmEBG/jbGYrd2YeLZ0OGBb+DwuhLk+sE6JjTOmjQSCHt43EcO97ut7SyuscVIgljvzk97EtapbsAPVpb16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOwkjT7+g+P7X9KE+MhAHVmjtjutqkkv/Olu4nEjCzI=;
 b=k8amwkmBGI50/cvVjEDmgXRbDZAMulfcX+8NEq0klFZr2hv+KWrI36Fkv/94dlf6L1A4W47CLBVH3R0UQr4Hpe5pYJA4OEbpuraztxjs51/H7t2z+gbS846hSrLDA6xDwXAq2Yk0lJjZT1HOdOZEig1MmKyoja9u7w7vjQkZkCz1Mc062SwuDstGb6CCq23pur4Iwnoz041cCpFdbJQq0yCuaHGxAzGqxRmSsHp6HtXEonLrz7yXExhbNujOUSV+I+0K0L427DAVXcxnehlU972ENvJBsy3iHcGgyAxvN1DJxPid0dbgSsplgnsJLKmK5Vk4G0hJ2s+y9YV0K9NGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOwkjT7+g+P7X9KE+MhAHVmjtjutqkkv/Olu4nEjCzI=;
 b=iiuewlepIIbpaIM/7SW9cLySS9qoBm13KxH5xGljeFgSgs4mnfcWT7WTNzq16GBpyYnoNF2vFa4shqboi6Xj5QkNRQPczgJWp3sCub/bg7Vu+M3sClQ3iU6/tB4N5D95CYBT8fVA118UZyHTZann/s8ywizfr6qWms6av6V5sdw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:18 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:18 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 26/27] drm/amd/display: Remove superflous
 drm_mode_config_cleanup
Date: Wed, 28 Apr 2021 11:12:06 -0400
Message-Id: <20210428151207.1212258-27-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 776e3725-2352-45d1-f083-08d90a582769
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB274950B5A29C5C0A52A64F30EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:25;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvKVH3tjJyf6MBKmxdadxmPIbZKRKiWpT+wa7qDGE0tHWJtVQAQtgAXMXAh1vOH2/l2FOYKnPyehdrmBgXu8/tRuK3u/zvETCkhjVNSuSGrI4jlUeEUBMVZaIlw3/Ln3tGrPMTcp1YQOevnZwKia5l3h5UqUVrHffJaOWEMa+4OB9hGwiiTBnMwv6yhOR+9pCAFyGKr1lNzLFAaxS+2KelA76HsH8EuXuKj7bapgq1vkn7uZgeGNuXHjHufCFmyRIk9mNfYyV7hwrPilJDQVMAsQdJS9tj2PHh3Sobt0EnKZP6DRadwy+uLVnELFybtYBHv7E4g8pr3otOgeVcbXYgQOUgVFozqqjZ+IZv7KEGlDOkZ9LR6IcYNW3HQ6s9AAQ39FbIHxJDwGCyN0rXGAAuinh7rutRYu/Bq0RTFJx7W0XUKonVYZDFYX4+AZ3OMOrsJq5CC9CUuKZ07suzFJg9Q0OT4paHRHql8phiJViXoY0IuicimsnHVyXP2Pv6f9wLubxVHKdlIf0Vvh6Gpsl6tla3zCtcQOoWrL+FPCG5+aMCmYJvHJgt0kkpMqSP7SrZHoo3ABKms1NgnF8otf1+yxjeYw/emhoQPRT1ZGS/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(4744005)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hKveRRbaOauvQ9omh08SvW27oGvQeHarmCMSPTPLHPpAO5XHBm/b70F/m4Nc?=
 =?us-ascii?Q?Wz+I5KE0lm7HGjvTEM8LIFNBYESrvSA+CiOVoIB2qNIC3FI0G3hoF66Wc4z7?=
 =?us-ascii?Q?46imhWSpPXUwzUHUoC9mUNdBdl8NG5Bm8vJO+nHwCBYKhjb9r/Fx/vpCyM9c?=
 =?us-ascii?Q?bzjk6rdrwpgwRzquWvdYj2Np/7rOoaVOoFGjU6gEyBcmobEX2k6/VpIztDMd?=
 =?us-ascii?Q?FsnvcoFPNnIfybc8MnwG7Fi6xAgzmVm3VQG7e7mUz0tx9aDuqDP13/0p0MQg?=
 =?us-ascii?Q?cJVDDRDuuKNpmlDIt3IbAUgmsvdxR868h/TuTdpn37myB4/QtNkf+mMh+WRp?=
 =?us-ascii?Q?3ZQTMoJ6vx3nJJ10V/ahg1kpRTNr75LJZQlfszrgx1VgOlGre8x5x0p0MJap?=
 =?us-ascii?Q?NuEQSOG4BAbJzZMfca3j8sFLFPpVHyRxbD962ZsrcN5Lb4MLy0+N5PgglUrb?=
 =?us-ascii?Q?RDI7yZX0qPk07ZKcIJtsBKM1ZfR87QD348sdVLWC+ibN+8knJL8jBTIT5+TS?=
 =?us-ascii?Q?AWv9FnMYIbd8vf7R617MfB4vpTG7LbNhpNtyZADhgg/eRKNulI7Qvvlq2GPN?=
 =?us-ascii?Q?DTWwoUhNuqCeLGNgkGxUqKJ3XZWE927pnDwT5zzf1QTHTsrDg8geUIvyOs0C?=
 =?us-ascii?Q?2N4LbbSD+EZgZEEgW/a0TyN4otpVcBZQFgSqR6/uzakUTGAagOW7iZqeBXQE?=
 =?us-ascii?Q?Ynw3TrWvm47t+VBj6pfFSDXgxGOggAXLc1So1qL2xtZYDFW3nj3NnUQsONb7?=
 =?us-ascii?Q?DdcauNjkJUuWPksfmbxYG/XIZHcECxViZ7BTPWRtatJKF9f4M/NjftOyj/A+?=
 =?us-ascii?Q?juUI9a2ZizFkQOWhT3KssKcDvYdxUgJntUumLxEx34A7nVlVFecWuLqtPqAJ?=
 =?us-ascii?Q?sXrRwzm9HvtT0BBSBk5BFKIxZcGfvpX9+cCadOKLzSjDUcYgzMzWh1v+QT7d?=
 =?us-ascii?Q?ZhVivO4W2oIY2U1LTtbVVMnZQHl0f8QRHcw9t3vsewR80QPudDtB8dglHbef?=
 =?us-ascii?Q?VudUrMuIHZDssEAWElPaozWX77UcCjxV+dHwIbzSTKR6E5gpWCOlNeYGJ3CG?=
 =?us-ascii?Q?/3gHgqbat6jMYc7DWon2fRt3mzznkJCRqp+ulmT4PELYFuH1ShiNgIPndC5F?=
 =?us-ascii?Q?hi0Tb5jFvQP+WYeSXiJSy2sWZbhuLoZ/rxNtdyYFuO1Rhi+0n/XOizN83jWG?=
 =?us-ascii?Q?xtIIXFFLlnZzImrmlVIbBZw3owRZ03wdQiHDVZ+7yoJXuPzVGweZKaqQj3Zs?=
 =?us-ascii?Q?weuMQm0m3CudD13hQqrTyxK5fwuu2latB2r7VKfE0tRa6rMYHauWnfZQzRTw?=
 =?us-ascii?Q?x9P57okeVE+hm57dJBuwPA1Vw7OFxMnK5UU7EHtjsmJ4oTzY45b+KkrXc2/f?=
 =?us-ascii?Q?TBOeBkfdkN1H76QuytUFeGVwBk3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776e3725-2352-45d1-f083-08d90a582769
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:18.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8AhbSkPZTjXltqmYFmv44lt3gN0KfmfDmYtGkpPJASH3S/bNuJ4/ZEsuUK/4zjw9S5VvQkLvgcUKcspA6SJUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's already being released by DRM core through devm

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c0b9abb773a4..b9aa15f22cfc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3590,7 +3590,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm)
 {
-	drm_mode_config_cleanup(dm->ddev);
 	drm_atomic_private_obj_fini(&dm->atomic_obj);
 	return;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
