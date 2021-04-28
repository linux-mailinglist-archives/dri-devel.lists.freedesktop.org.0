Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03236DAF2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759BD6EB6E;
	Wed, 28 Apr 2021 15:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2246E0F5;
 Wed, 28 Apr 2021 15:12:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIa7MFyDbsSgyo6DGs6QxD88NY8lg6yU4j7nU4uroLxixlar09ok51jWyO01+71khvWjDx6yA3Ry5zTO0d+sC+VSMAsSSTUXP0iqzxvkVMwRfV5PN5ELyGpHHTY9DOkwwWfg3GmQKjAYGUelk4oviXdXFJFVK9rDRA5UwbMk8FDOQGZ5Nc8IQJH+VAf4VMQPadPCUqOjMpWA30HkrA/5NxS2LsnpGcXl4KYDkvS1GmTW74ABygjuC8PnQgwalWDzxnnBCyK6sC07xqBlrrs7OrhQK+6l/uo5fpcNlbbZZlG2/+TgEHKsufSMU1ncszT3w42HMlOzTBY7uSDIQH5XXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es/qJ4QTkAKw88gvzPMX0HWHJcL+QYwFsXAz0XffHkI=;
 b=mb7ClGyap68mkhFMEVdoxP6x5zRNokCB/Cp30gGVRz83FsPBLzobEl+1LBynuf13v+y3P0ZaWE/a9ALkWAou6F+KF7Ggt2NhCX1b3vDGfyCqrZpcgyquM9nkz5iGI7UOTAWVgt9PmIg+FpVsPVsEh6/JHHwE5Ia/LwxbqsOZAW0nRBGS92TLf1CtLAAAsGidl2+ebfQ08zQW7bycyeax0LqSnYJyQmBKzQ1nor5jpHgqPJo7RhEuaJa7a/NFFOarautPGZlVVGY2ioUuT8WZGFgTnqIdND/CVv56b9wCV4FN4ksSO8nH7T2xuTqxrLs/84xr9ZufA1hzuvI4i4aN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es/qJ4QTkAKw88gvzPMX0HWHJcL+QYwFsXAz0XffHkI=;
 b=4FM7Fb4bFiByGmiZ2a2KTiMVbwvjeAmOK5t5muSsHYJvex++QXOLswN11RwKyA2kteyiCMxvJhNNy7IyIXZK8C/iTcLDkKe+ECAgAVgcYKQlUbcU3B2m7UnMaE4lei/iZPNW1jMGlY8gy2eopMFD2UOPeSbUV4QaZLaKjbUnTXw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:39 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:39 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 04/27] drm/amdkfd: Split kfd suspend from devie exit
Date: Wed, 28 Apr 2021 11:11:44 -0400
Message-Id: <20210428151207.1212258-5-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb5c4f32-e8b2-44ba-5290-08d90a581000
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446280ED2A25AC689BF88C31EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xu1+BjEcWeBvAC/5Vfw4afm0GTz5nOMyXTax+t+QCjNIUTSOESVMA/s20OtUhIiPpZC7FpeeDW20uQJWqh9NIQeaFu6UALW7RBMO5KRulElzt1QcF8wiZgmo87nEz/PIQtiStD4BmAmQWeSzNzo+5VbgXdOihoVWVtMVaDu/J4g2FoY+1pVvogCY6z39aIta8Jykc6lRHJK8/Gh//ezPenleejIiEJWhMgQKhUD3xwIbAiEPwOXi47TV5DQ2rj6nlbU0sJRlqn3FAqSe15gk0GMhcQReSV7jgGnkNKHmU0sxFMyWq3vfLHpVOOS8T5+G+XPbHurBByNE3+PIX4loDJe+p+YNOVf1XIMChy2sLbe/gu4xAxyfjwBMUH0x+Yqd7HGvzZ/IQAobpbhmDIQjxRbEstYa6DacJDubUWp33rAuerxLhyNXe58+QZONq72Z1QoM0qbIIXDCqrd8osJLVnR0ZFraXcq+S9wzX+gtaADHNRAC9P/nfzMEZ2Z9lEe2bwg1cNkiSoIoyiiZYtyua9TbFGVxzxTBjiTjWxGwRuBkWDcVumn2+vDDU6//BMhpMzhvuXLJenhiNYV9VxD4TI2bF+qYfIkeVRsst60Ap0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(6666004)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iyxBW4r590bw/ZOWfrckcGCxHnmigetSSink7tq1ZXx0Gev4UrJizRDbtAPS?=
 =?us-ascii?Q?0i2GW8wvIreKCiuEbyAYnTdFmYJF+NOQXOsWzq/hXNTlmMriHROwSQyDi/S6?=
 =?us-ascii?Q?eY24QMQ0hEvZ0K9VpT51fCCCfaAYXlaAORHs1Twqrz/oCr45goz5HZBUOBzz?=
 =?us-ascii?Q?CjTTb1kb5v44XPxgNvCot/Qv3jEznqmEN24imVN1Ip57NM2qqf1yUC1ggfB8?=
 =?us-ascii?Q?iqHUlQux0DSgHN9sy5I40pMbx8tR6NDNF7BmrFLXrOvUrMgM2WMAuWp2rROh?=
 =?us-ascii?Q?GAyhB9zkircT5bXzneLfi3kNe2R+g/OQzQB1dzFyR1SGN0leVJgrB6AyMIQG?=
 =?us-ascii?Q?z0lYcfDxiKRlQAAkvybCDoQB4V9VV/DSd5SLg5RszkadxmefgTd8r85rlnBu?=
 =?us-ascii?Q?RzBnht5MwTshxkwU7p9AxYJfyjKcg6TpuSYN7w0IUnR+P/je6DYVJ3sIe+Am?=
 =?us-ascii?Q?7UR4Jv8bEyro2ChkEq7OGybAS1dz9GXrkSxC1z+h1Pjr+OPfl6CSbYaoUXKl?=
 =?us-ascii?Q?xmZbSxdJ0XmWokxsnj+OZHRnbg0SHfeqA3SLVPG/mF78YiiLqgYBkzXouR7l?=
 =?us-ascii?Q?V6ampHg77heISplPJy2aLTcoYUrhM1AupFe1LmDChhJ+9aRiQkPsH77sVrEZ?=
 =?us-ascii?Q?6zV8abg1GvmWv5CnV/DRSDsVzlD3vcxbdn6XkDSXlG22BbGoLO1/ULe74Uhg?=
 =?us-ascii?Q?LCrG/QJFOs40HqmN3f83RPBZh6IVpLmoGtqoBxFeo6sgCA/pgwHnsK+DQ2sO?=
 =?us-ascii?Q?rY3tw2Veg/KgyUpGTXEX1lqU4vLByhB0Quz4j1TLGBpkOEe2+TwLeTcomJIs?=
 =?us-ascii?Q?BDOHpfcwk/F52JMC9Dah4vKDdhevsz5ScU4Hm33TfgunjhTn9yCf976h8Tzt?=
 =?us-ascii?Q?GowmvUWQh1OCsFG+dg9kbaGHjGWfAWA/Q61VPTuEsamkn5i4K7S5nhUbxib3?=
 =?us-ascii?Q?6xJ6A06gu0SD/Cc6oW5/PyFDGXGy2XShYw+ofWEmFWIUiDk3pyifZKKAHqAB?=
 =?us-ascii?Q?9hu/p33jr9tlxt26vHwDoK75KK0DsBVyBQzZRuGO33vyzj1IeMl6R07v5/cM?=
 =?us-ascii?Q?UO6WJZ69ua7aDV59cz5hXi+HLYqUAxAONQNFo+uyWPUXnJkdP3ltOOEZlZdk?=
 =?us-ascii?Q?Z/hLs3Q+C4AYM7p2PzQP2kxJf/2yrisvrpcqwzPYLZMOy8LnP8eZgT1f8yfL?=
 =?us-ascii?Q?x+Lx0BRaOBgdmEjp3/pB6RjdpGCNeF7y7VZmZjgj4F0VODEIjiI1gCMbVLQv?=
 =?us-ascii?Q?655MBQBXwiv+MTxDPZKs9XPO2WXeQe/DLU/MrIRkK26ybKr8zHCEo75GYomm?=
 =?us-ascii?Q?ddKfz6TooOUhLUSshh3FntTg7O6Q6WMuPltmSwi4KH/aBanvcBj7YcP34apE?=
 =?us-ascii?Q?ZVKKgbBqrX+oOeuNCdUjaN16YJbT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5c4f32-e8b2-44ba-5290-08d90a581000
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:39.2581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTbQfk4jD4YOs3it6LU+0u5P3O8Q4eEHBYUqjg/jXwm7i5k1JZeW0e1ZoOjuT6xPFC58lruClwY+iUPGUNVQYQ==
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index c5343a5eecbe..9edb35ba181b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -169,7 +169,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 	}
 }
 
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
 		kgd2kfd_device_exit(adev->kfd.dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index a81d9cacf9b8..c51001602a68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -126,7 +126,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
 			const void *ih_ring_entry);
 void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
 void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
 int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 				uint32_t vmid, uint64_t gpu_addr,
 				uint32_t *ib_cmd, uint32_t ib_len);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 72c893fff61a..1bb8bc6d85f5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -833,10 +833,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
