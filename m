Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3E37940F
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251F6E8AF;
	Mon, 10 May 2021 16:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619236E0AC;
 Mon, 10 May 2021 16:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQJB6kRWnfk/qa9n5dU2mlcBeMQyCeY8j5zs62D5vN/0o17RcU8A2hGd8ECxoS6xyxZS7ljHbWFnq+cHwmWlNm1PpOnVrP4YTBQIHh7W8f1i9Ibj3p7zNhod93Nsm/4AG3c+5ZOrzTub1jSDYRc6Gl5O+ZomG0ZqsOL6t2saZmkQ+o6xdEIgcGKY9lSOgfoaGhWoo5nJWA3w91i6Ep/szIJkco6pfbakXFQhpYmaxX7dgKSY3Vzp3o6/gMeTeSv1/uXwC8b51GTd0JfdUUEaqS9euSE24/CEIMET4yBsizGdSieTFc/VShr5XtH5zbGSFz+1sgQzIXSM9ztmpoN5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ub1TT4Why1wfUTgqnHi8urBMdsD729TcqEvDbve44=;
 b=Gokryek0pmhOtSGc8HtkrdKxsL1vX+RV48Lj45xzDqW2wCwE+AfcZcMaGOlnlVEOkzKPAMNmJPVerK59Y4oh7l+mbSmpNTTYenCNQ1iB+Ha3SsnVLDvjMJ3OkQ8s1UlLZwajLoCyzs4EV3/argcp8G8C/aoajNs3qIcUL5Nv5lUvXyOJLgS8jl3vIxGFVzi1lY0u8b3PGsmQ9UsmsK2IPFtxEaotoJ86AVMDMpIADeLaQrgEAbJDN8KQaLB8NTQ2JQy+5Z2VlkZ8hPpHf+ks69shP2LoaH4CGuXAHEdJtsVowMMrmNcnulFOddEJjU1/Be3tw8UHRk5g4jYnthnrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ub1TT4Why1wfUTgqnHi8urBMdsD729TcqEvDbve44=;
 b=JQdVYKYD2g4fvoEM0JTnXUyY6CW08s+SmeDu6ayHiTeJ4Hjrur2hbukO9d6BeL6VzaCEuWuqgyi+uefFlYRmmWPx9C3tTtrlKUhEFPa7nSQtsZoFj3Prdq1w9S1c1H3cAx+dFheAtC+qoRnmpDAk/c93LovDOmFW8komxO3RFAw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:49 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:49 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit
Date: Mon, 10 May 2021 12:36:13 -0400
Message-Id: <20210510163625.407105-5-andrey.grodzovsky@amd.com>
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
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2489ae-498b-47f2-152c-08d913d1cf05
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446264F93155228D5EDF4F32EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWM+hN349McEyOKV1Sw84YoBN7wZWNZREnlAdBzX3K+xAwZeFK3wRwJgkUI5fPV/uuvvCGD2xiUDT0Tl4TfPmGyfidz9Y2/v5Tg6BCuyGCHeQeyccapzQK3tMdi5gnkWuAPipurUBIKUBzvRncgsZqopnHs0cr8DJFUkDaguQ+LIFBP75e3CDbej6Sa1jfxbBvWaMCml5v5LnESX/IO8ZJEXU3aWhDgHZ3IccB3pvRVJiTT98dKHxYZkFC0luOa3l7SaOxXKjDZPS6+/zOkZ1Dy06XD08aAxQWx38IDwn5allMv0fgepidzuSl6s+OaRbPik3Q2tC7nn4uieXuBgYZjd4dy0Rq6+XONAiX4kzr6IYAL1A4VvviaPBKAzchErMewaZ/x3+0vgT6buVH7GNGBahYZsOwAwn0Xio1/vX8Z/RLOTscvz4XIrCoLTbPUoZzQaKP1JRmfmfKzjAU0NH2ABVuQAq+h6SALi+alWkqyhSkIyMvYBF/aCI4NRvxFsup7DQ4JWriUNMh1f36LtSiGjy7rx5XixWAHG5krsC/aA6ZfbRNwlPmokH9XWUGmIbOq4glHHjDqFx57NzrkfE4g9SdgIRdf/D3RgMtg6vsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+KXj8mFm173VQufNManNabSmaSu1k2hO0gbBuuCaPDb/Gx0o6Jben9AXzfRm?=
 =?us-ascii?Q?r2ilxwtBN5rlYElYfT2shyiVERk0lipnjlUer8OOfTz0oKLOPXrbvTPL18ky?=
 =?us-ascii?Q?SSpc6I+CTC9egVG0jZunGkxUw3MfzYIBzITeDnuq4nTaeHWaXGkhCmdXvHpw?=
 =?us-ascii?Q?0kYaHUx0JjYCWcE2rlSw062DdpzOfF0YgHC38spRl63lwggQZXo9D+yH5BTY?=
 =?us-ascii?Q?wwxs9jw6qvPFTM5Y1dqvHjiyEvZ+NLfDlI/fvlscKNT74SgdZfo5PvMAd4TF?=
 =?us-ascii?Q?fV/5L278BVrOvC7Idxb+/hxUu1PjnHzITvHJ1REldbyjpCaKXhCFclflprT2?=
 =?us-ascii?Q?vuxN1Pd1NDWgFyPntydKZpqm+V7kAyUXzaqMAwHJ05hN9rVO6TVwXyrvtL7X?=
 =?us-ascii?Q?21M+AGYzNHgK3owqzcWlkgSkfBrWp18tI1UH8NO9PtwL0cdT4YDCNBDP1vLC?=
 =?us-ascii?Q?+i+/cjHnai0b5If37myzqFKrAEBrtlEIc3uzxMRgB8yhAEx30EkbM5DC9FLB?=
 =?us-ascii?Q?pJ3+P+upErEMCuay1yAhuJ0TkPcAsiRvfRDUIePCXRi5jjrI/9DISubnjZmS?=
 =?us-ascii?Q?TcGf5srWTu5zXecJ/UKSR+mek3Gvf4erqxLwGYaILgbiESByiB+DZAZknWKX?=
 =?us-ascii?Q?eYvarOplRxfU7NEyWwmybTrvMVMdzz5Jd//jd/QYNv6/2l4k7nwDr2r8eLs+?=
 =?us-ascii?Q?cRa33rL+PLUHhp0hYRDADWaFQc00zUMiiwmAZW7ao2zLbUqcHrDhHnNU8r11?=
 =?us-ascii?Q?5RO3u+diMtHUwzxGV8kZRhyqOUe/0nqu+5ZWWebLYLWdUA3kBNmj+NK0lsMB?=
 =?us-ascii?Q?Lb+yRg6Rer4ki+Lo2y2QQjMa8h1MLnSg1QsoJ6zWmvw1hjPpXefFi7zwXylr?=
 =?us-ascii?Q?Yq/UR8y7aqqe3X8zYR8gg3ZrscpcnSbZiS+R2QLU+iLr+1b9oD3aAKZxBKTD?=
 =?us-ascii?Q?j4kZpiCWWJPgaya3jj663xMxIVPhyAvn1QdC9aVVDp+rcmcUA6jGVkuQm9UR?=
 =?us-ascii?Q?2fR585DHm9H9Sbvgkl2FKWvFYUyN8opjiZy7ec+9Zquq9gufGHTfPNLfRKQt?=
 =?us-ascii?Q?1lc6QhkTCpthf5iuqbxPq3Mh6VkUho0PaPI099ctec1Z3TXCb/4L6rRu9Kfa?=
 =?us-ascii?Q?pKrNoSq0LUHGAP7XstBqiOzZndlCufkMVc1+aCaTzTMZ2VyZabzFEtN7DQHW?=
 =?us-ascii?Q?lfxrCw+zjWSlFHDsDGUbt9/GMciCCCFaujksDW/UplaO5PCAofTBGhM57OmX?=
 =?us-ascii?Q?hHTK9POTsmroGcu2pFLhmroqp23yQ9DD6vDJKDKpUv23XHECmfxj74C4bXpb?=
 =?us-ascii?Q?Isg6W7WPWJ6anEv8jzYXY/F1XLpkm0KPE6yjYPicchGTbDf/OeaE28PvM5ig?=
 =?us-ascii?Q?NXHLGqiRPigbru7THKiNR9Y0JHwe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2489ae-498b-47f2-152c-08d913d1cf05
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:49.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39Zlf1dLoYZ/0knZyd8EgoM8NrA92vRi63R6C5R54A5RzyNJorkN7ZkLBQ4YiMPOje0Qmahg0fVWwKEEcNRNJA==
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

Helps to expdite HW related stuff to amdgpu_pci_remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 5f6696a3c778..2b06dee9a0ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 	}
 }
 
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
 		kgd2kfd_device_exit(adev->kfd.dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..f8e10af99c28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
 			const void *ih_ring_entry);
 void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
 void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
 int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 				uint32_t vmid, uint64_t gpu_addr,
 				uint32_t *ib_cmd, uint32_t ib_len);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 357b9bf62a1c..ab6d2a43c9a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	return kfd->init_complete;
 }
 
+
+
 void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
-		kgd2kfd_suspend(kfd, false);
 		device_queue_manager_uninit(kfd->dqm);
 		kfd_interrupt_exit(kfd);
 		kfd_topology_remove_device(kfd);
-- 
2.25.1

