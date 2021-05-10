Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C604379409
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDD66E89C;
	Mon, 10 May 2021 16:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D806E8AC;
 Mon, 10 May 2021 16:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQV9iUMCxqOKhtAsOR+uaTWWPmechG103HPlWN9QNdroRoQ5NjLkbm/RzgibckDN9RlAAA3U9ZtlcZRxrtwvLhE0sjwfX+B3KFTrWXlsJXPy0GO2TGJHUuUWLBzlyM8IQ2q+tFBfpFPxvY2DjeKEtCX0bQ6E+uglWKXL0CpTef4V9NWziy955XT0fIKSMmreRKaUQ8nzl63F2NCIpXQ9ih1Ni/6tTu9ZSLbKChQvVxUQ9rvS0afqC+BGz7k0Iyf4lYm1U83l9w+8N6HH3DeEFJ9okbqjVWwMkt+0Cl5qDWYKVoalfojVkhux8TpPlGrBtllkreIV0Rap1PiM5Wtmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUKus8UfUiKGKixY69zLZagZ3iEboaQcf3OLBd+5uo=;
 b=U+KUouJruF6iv4GXsBgcSUzYhmHCKUfL5NGJNLkbPUHRnpqk9TWXXqdQyeSVUAWgffboB0dJHftcw7qiGzCyxEZsOPsNVa/gduNoRmcUJJ1qSvxGpvHXaMLUMfKrVH2MW3zotyrLJofeMyhiEo5khsP4qR7tv16Ad7g061ZSbQ+LVQvXDLE8w0Ja6BY1IWx+6h3l05yurYDU4IOH8+SRynwHqcRKVt4+ls53CCew/ZsMkprsTCdIGldfZLOMpJr1u3FruMxvfasmk6auDPyb2R23ZT2/H+s8zdu92+9vMVJ9KKhYO5AAb+9+yijsggDRgj78l7Cg/Wfyt+8Q3p8UBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUKus8UfUiKGKixY69zLZagZ3iEboaQcf3OLBd+5uo=;
 b=KOkWf5CKi2GRJR3PYi1xU0pwRDn4wRMY4wu2c31vxdXTMxozhZspBPGCBPj/X4qhCRLVPCPcntUk+9IDqMQS654Nr+umR1v6ZWfUiALKe1cJ7dlLcmIreRTj4toDHMFb1AM0ArZ3B/bCYvC7xtbF36MvWia/yQcwzwLmKE3ElTg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:45 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:45 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 02/16] drm/ttm: Expose ttm_tt_unpopulate for driver use
Date: Mon, 10 May 2021 12:36:11 -0400
Message-Id: <20210510163625.407105-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 015c91f1-5c66-42bd-7447-08d913d1cccf
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44623129A4F85D599DB15E32EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1Z800tohbKW7zvn4Bbh1XA7Fftu3U5Amrz9uyWw7SKDQ7lfKhrCA4dDddHSUHbRnyCxc/piArC0L3liubpcRgdni9YaC1FRa7tNusmMlRhhHXynnK0PDtH+2XmLbKeR3NA/ZmURLptvDo17HMaqFv3vfRv4lDJ4kD3vlIx44qdWQVx14EqWvnbta6g8HDVhEkCml3BiXdQ4LKpzTk17afRJsvueaCXpbIkUlBorML4sGZ7QpyE+FEGOo7Fvo20E/IhBjck5M5vh1iQle03TbwKlsQ92m4364cgXHTSLaLvxp018kOmkO6Rln2zSA/9u6XwAmjN+F1gPo9ZrvYXQSDFyfv7WbJgdb0gMD6nzSrJZeiMPojBqlyA9W6s81lcE1pK471u8MGxs9ONYZD5+I569nhllqRC1YZH+MtMR57Ni+BRdO2qrs0mAFsO0OaFSFVN1ocmAG/Ne32Vhfuux/AHqbnnz2rSQYHq9j2KLABLliCfkZ6UYZ0kjONNxUMiOYQBUnOpKIASzs+dchSWQ35Yxg6CNNP0DGgoDjHkP25JOSYwoMfIiE+S6MsDY2MMFVmSsJ23AkI0o1QPzLVyqnVDwxj1RKfWy8R2KvrqGGGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(4744005)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HmudEYT8XJ81BJAeUtRMYGEf+SXkrhMkGC7sxN+XsekuG+Q1GmdYFDrMB7YM?=
 =?us-ascii?Q?nmABSdVyLAi4gPpZE32g/rzxX8J2cDEYPlazN8mUL7+o6rKDXbCABzLKZ6s4?=
 =?us-ascii?Q?eiVrUxWlwT2W3y3LSqalKY91/SZGbjM/UnIm9/r/QwP2RaP6zQX4p349eBVE?=
 =?us-ascii?Q?1MYNfHxNlxZq2abSY9U9Mnz+fLUYYarSCMvr7KLxajDueG3Ve3NpO/M66HVa?=
 =?us-ascii?Q?x6stCfREVtRMn8fCQs3GgoTRt9fyQY2rqOHVRyg8qa50Z2+XsKVcbfPYjayz?=
 =?us-ascii?Q?6jJU+ugOz98YkAdklB4dibDF5zbPpA1cleHtdkKpodk1vNrmKkLICpbwjncY?=
 =?us-ascii?Q?3Y5vfFGUk+wl+XaNwCgEy/C42ydflMnUxZWzzIhYIUHfzW5i5GjQG4QivRua?=
 =?us-ascii?Q?JOizZvnmcBMX4gdrxjq1C9BpnpCbkU+fHyWEJGr7Q0f0P5R2FCrk87xyN2Be?=
 =?us-ascii?Q?iZgBv6PPMiSCaShRtw/f3OY5mG2BgSS/CMzRMMXfo9OP3BeYdfqxwnrkXlG4?=
 =?us-ascii?Q?QVwonYjS4/wt7mXzn4R2uKSZlaFBB3q+DQJwdqXkbEDWXtliBEn906aN2EmM?=
 =?us-ascii?Q?VnWmImjvn+rTSogN20FUVfMqtyvbgzlOYuZMZflMTEmYkx1dB7C+UcK/hiVc?=
 =?us-ascii?Q?y0gHw77BMu/9NxwYZ24K5Ev/GYaMC5YH34IiJfiiAr4cxG35jxm0mKh35I3J?=
 =?us-ascii?Q?5kfrtfreGxt/cMooYNW3XDPZKe7wOtHwj2tHbQ55ZkxPZUxHVXYNlQu6V9hq?=
 =?us-ascii?Q?psr/J9vkSj+eWbgXpgW2Ni1Sn2e1OQyXQCr9o2EE6UKr2BZF49vNCDSCNnOq?=
 =?us-ascii?Q?nU6P/QhrVR1RLPG6O+OHHjIZoQl6FZ5VBcAnpFywFtOldIa4oZc17Izk3Chs?=
 =?us-ascii?Q?MxdlggdyZdyCIS0ET3FKqKty5Nu4q0czEIC9StbONDbZcTfCOq0CGTKhds7P?=
 =?us-ascii?Q?uSlSQnZgjCePKwqyilSN2wHXjzFwGyH5HPMtxZk58tl2j18yZIPOJ5ppx+7N?=
 =?us-ascii?Q?lfuL1qTNEUEPd3erIo5YnevdKoOLGJkHLQYS8c+89cbh4WVYXc+souVxwG5p?=
 =?us-ascii?Q?mM0ZK70q1OUdsvRfQ1ZAO1M3LUJd9dEBbVSsyVoyVN0vOCX1H5RiquCYSaPN?=
 =?us-ascii?Q?wMmuGhkETEXylk99HI4k0iYLVG2JenUgcM8qFkxJYto2zjDTDkzV3oM38t1Y?=
 =?us-ascii?Q?l612Qj5VroUcrMMmqt4SgnxpuMrNkAji/K5Z+zuGiYW1DRQskx+WSjNt2VwH?=
 =?us-ascii?Q?lJlLc/PEKJ7SYt6ATWuDAoKaxurIGK3dRjWJzEzfrjh2GU3iD8VVs59NV2J4?=
 =?us-ascii?Q?HezCaNwCNV9IkYgFUe2OWMNXirlLCTYEGIZ5WwRwaIzbwHoEbRqYFU0TvU1I?=
 =?us-ascii?Q?JvY/dkCdmrXCPTb8fspDeE5IhQ28?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015c91f1-5c66-42bd-7447-08d913d1cccf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:45.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBWfBQ3Q3dFKR0PaerZXYIbOO8wRaOI2BvOadpf/U8rLOQnCHVHUidcP4+C5cvGXAaH3cSX5ixtMt04uERtJqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's needed to drop iommu backed pages on device unplug
before device's IOMMU group is released.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 539e0232cb3b..dfbe1ea8763f 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -433,3 +433,4 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 	if (!ttm_dma32_pages_limit)
 		ttm_dma32_pages_limit = num_dma32_pages;
 }
+EXPORT_SYMBOL(ttm_tt_unpopulate);
-- 
2.25.1

