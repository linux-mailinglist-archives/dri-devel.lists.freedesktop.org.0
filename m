Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7342E1A33
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 09:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1A89E11;
	Wed, 23 Dec 2020 08:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A9C895E7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 08:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaRHG3i9fUTgXc9dAzGfWwKrzAPoxpUGm9UGj4y29rRsGerC3etPyfYdMgNTePcmZQC/95K2xu5XJWmt8n1M8ygdlRiWf1iLk6TgmgmVXMu/Amp6Fcb56Eo9KJ59pib9sVzgMBHBq8FU7lM7Ca+khyMa5ohK+YmOQlLJOBoD+7HnJlFmyr2bf0S4diMMcUHJ7WCqk8NOPLjovqn+zegSflDkQzJyhjE0B+4XiXXapzT862ktb5yy/bbMmxcHiE7Mg+cB6BD363xNTUpwn3mhBo7bOY3XiLVzWClCSHx3zbMy1fn1wuLnJotR8XvghnDUetj0C9sT7IgTCJLiM3adwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7U40+tVGS+uQLpiiP1OaNl957ZMdZ4YmyCJ23Mg4CQ=;
 b=dssyM5R/ETZvzlsTfoVIiHGCxZZTlQF9AFBmBqevmw6MOL2c+ZSmDS7GqIbkruLhesECry8JmY8f95O9C8NvG09BWkA4mHLqUK8wRC5Zjq/I/YilOWeek5K/ODgLvO1AAPed27nRXwr0P4AZuUcrtXAkpL6IraVrawylI9++0GvZZy52Lxpj8H9px8pAaQyKJOLgsBkFHaatA8+0sdSYjAYAUsVWOuuETOGXjenjsV8bxPGmC+1QW3fJBSLJsvbiFBagCo22igA0OMjAGlBIG4l1vi4F2v+YtRlo5nnKIF14v7MVNujjKGT9rKw4AJ4JOUogzxAu/DMDdeo7zX9BOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7U40+tVGS+uQLpiiP1OaNl957ZMdZ4YmyCJ23Mg4CQ=;
 b=WW8n1w4oWm6f9tHGDHPdWdHIgqsxhABYqinCDkRhYAqkohlBhD5nx/Zm9yuObxOSqNKiCa8MXeUKr3LvyMVQKS2oOUQtnmY6XzE13LrhmIznizXvsIUl4FUDQxgbU43tlrbrVfn4xk8cksjoFQSsaP3XXBvwEmD7oGTIC88S6mE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 23 Dec
 2020 08:57:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 08:57:01 +0000
Subject: Re: [PATCH 1/2] drm/radeon: use writel to avoid gcc optimization
To: Chen Li <chenli@uniontech.com>, dri-devel@lists.freedesktop.org
References: <87r1njy1s7.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1e275da2-271e-3663-1a96-d7ffb47782a9@amd.com>
Date: Wed, 23 Dec 2020 09:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87r1njy1s7.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0145.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 23 Dec 2020 08:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1531344-94ff-40e1-5036-08d8a720b6b4
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4947F8CD8B1C9571F51B273A83DE0@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w99C7QfCubBmgo0agiR2NcHQWwTORkAnrVZYO6lmM3Oedtb5UctDkuG7qcARPvQNnexn9U7bj4N2kxAF42+qYg9kaokV/xct5zLsMGGSzMO3I/I/uHJAJ5ECjVskbDY8aNF/WmkKgEih02PWHx8OM8OkPBJenpA/lE/pBQzrXiB5upNxqv0/u43dzXAqSiITzr4VEkI90C1OcDaZx9tpAJR5fhFsCz8AYsZz+e9iRU2ewfk1PVaC8TS3ny64lSWheWVg73WMtEKR3vK11IjgQJXPdDq6akVdIUkglBlWk813hfFUJhBuSxQ2FOyT4T0uhj0mXP06M+b5OBM8GPbPz1kry7dKhqG1d5HJmjTapawXNFQGoZ+8dqrmFsgc+mWjeBLoOCXGdlXrMQRCq2xEkrkH8QQ/APQNyQun09d8eZ+O2Cg2K+eL1ODJswS+/8P2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(2616005)(6486002)(6666004)(478600001)(8936002)(8676002)(31696002)(86362001)(36756003)(66476007)(66946007)(52116002)(66556008)(186003)(83380400001)(316002)(5660300002)(31686004)(2906002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDhCMWd6OFE5WURQQ1Y3WmkwOE9BemJpelJkbnArTjlwcGZ0dFpsU0t6OGlF?=
 =?utf-8?B?UG45VmNra2FwVVlMdTF0dk83b1hkR0dMQVEzYkhCRlR3Y0R1VzhJTzBGZ1J4?=
 =?utf-8?B?U1o1R2wzQVhMNXprM3JIY296NUdkUnQ0Q0tHVHNRaE1HY1dDWWtXZUNmNUh5?=
 =?utf-8?B?d2lVOUZNbnhpZWJPalJGSjRxWE93bHZBWUNlUUR6anVPNTRBOUsycHlRWlVk?=
 =?utf-8?B?Z2tDWGNJTVhLOG5qV3dVT0NxYW5uMGYxRVhrYlpHZld3a1YxZUtvbjNXMGtk?=
 =?utf-8?B?eENQQnJ6MnBIQWFCUTdobnhJUFZqdTJPRDFOTTZwRDBZZUttL1pkVkh0Lzlh?=
 =?utf-8?B?TWxwWVI2bHNWZnF3ZHE1L294c3lPdUtmU0NnODNONWFnUUlkMmloZ3RRcVRU?=
 =?utf-8?B?N2FNZ1hQSXF1NWgzT2hMMzhCL3VPMm1yeTJhUGVDTm5DQ3M0WWl1RmxOVTN5?=
 =?utf-8?B?M2pMTmZWZHoyMGc3Nzg4TDN2Z25DekZRZ2UyeUFHVWt4eEovZmVFVWFQMHlT?=
 =?utf-8?B?VlZjRzVvVi9saG44T0djM3NxcVIyZnZUMEtHT2Qyb0RPVWYyWmdrcTAxS1Fq?=
 =?utf-8?B?ak9TU0N6bjVsdTZkZE5RR2QrSk8ybWptUVgrZFdZNVRLZjZBRkFyRkRSNGNv?=
 =?utf-8?B?UUhkQXVhWHl6Wk5xQzF3K1poRzNQT0xQYXVtNkdkelF0Y0Y4WWlIM1V3K2d1?=
 =?utf-8?B?Z056bTFldnMrUkJ3Q2d6dHltd2dNWWFwb2N4RTAzQk1QWDZlbjgzeExjZk5L?=
 =?utf-8?B?SW1peitTbVM2YWUvUmZrb0ZBckJESWNkOENHRDFTMGRUMzBvTEJNYnN5Tncw?=
 =?utf-8?B?ajlXYlpMUzkwT1hOc1pFbWY3WGc5RjJ2K3phSkg4akYwbVRHNTJRYldOV3Bx?=
 =?utf-8?B?eXpFQ25zV0ljNjcrVFdkZGZHOExBL0F2NmlSb2MrUmM0N25lTVFJOXhMZTBo?=
 =?utf-8?B?cXQ0RmZIYzE5Z3RDa2VxQjlQMFV3OFdFUXkwTjcrazdFUTRSWUF2Ky9oN09z?=
 =?utf-8?B?STRIbXB6NXgyS2NrUTFBZlMrZ3VNRXNXWUZNbS9rLzdpdG83MXI3WXZDT3Y4?=
 =?utf-8?B?L2ZHMVo0eENDUktPWVZ2VVVYUjBiTkt4SnNXeFJhSWlDenV5QlFKVHYvLzU5?=
 =?utf-8?B?ZzhLM3RkSWFzRk1ScVNtWkxsWWREZlRJVmtCcFdySTZmT2tqSHVnbTBhOVp1?=
 =?utf-8?B?bDczcEFkZERiRkxGdzhLSi9rall0aWJrb1RHeHFyMEx3RWRKYW5oZG53aHFS?=
 =?utf-8?B?UFdXVjBIbGlFRENGcDMya3NZeWQ4a2wvWDNhQTdSVEc0WEVRWFFpK0pEYkRi?=
 =?utf-8?B?MkJFREJEV1c2ZXIrdHp1KzEzZnUwM1BraUJsT2p1MysvaUN0ckVpQklhd05r?=
 =?utf-8?B?enZmYmZSWVorUStDV2pEbkdIQ2hEZS9Yc3ZUb0tYWCs1ZUpaQ3A0ZS9UZVc0?=
 =?utf-8?Q?1gK0qOdK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 08:57:01.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a1531344-94ff-40e1-5036-08d8a720b6b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNtTtqTdtLXc24nhN9T+lKW+jyvgpB9i5lBMARY+Qd2c6TxrUOZQ3j0psmCIiOoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.12.20 um 09:57 schrieb Chen Li:
> When using e8860(gcn1) on arm64, the kernel crashed on drm/radeon:
>
> [   11.240414] pc : __memset+0x4c/0x188
> [   11.244101] lr : radeon_uvd_get_create_msg+0x114/0x1d0 [radeon]
> [   11.249995] sp : ffff00000d7eb700
> [   11.253295] x29: ffff00000d7eb700 x28: ffff8001f632a868
> [   11.258585] x27: 0000000000040000 x26: ffff00000de00000
> [   11.263875] x25: 0000000000000125 x24: 0000000000000001
> [   11.269168] x23: 0000000000000000 x22: 0000000000000005
> [   11.274459] x21: ffff00000df24000 x20: ffff8001f74b4000
> [   11.279753] x19: 0000000000124000 x18: 0000000000000020
> [   11.285043] x17: 0000000000000000 x16: 0000000000000000
> [   11.290336] x15: ffff000009309000 x14: ffffffffffffffff
> [   11.290340] x13: ffff0000094b6f88 x12: ffff0000094b6bd2
> [   11.290343] x11: ffff00000d7eb700 x10: ffff00000d7eb700
> [   11.306246] x9 : ffff00000d7eb700 x8 : ffff00000df2402c
> [   11.306254] x7 : 0000000000000000 x6 : ffff0000094b626a
> [   11.306257] x5 : 0000000000000000 x4 : 0000000000000004
> [   11.306262] x3 : ffffffffffffffff x2 : 0000000000000fd4
> [   11.306265] x1 : 0000000000000000 x0 : ffff00000df2402c
> [   11.306272] Call trace:
> [   11.306316]  __memset+0x4c/0x188
> [   11.306638]  uvd_v1_0_ib_test+0x70/0x1c0 [radeon]
> [   11.306758]  radeon_ib_ring_tests+0x54/0xe0 [radeon]
> [   11.309961] IPv6: ADDRCONF(NETDEV_UP): enp5s0f0: link is not ready
> [   11.354628]  radeon_device_init+0x53c/0xbdc [radeon]
> [   11.354693]  radeon_driver_load_kms+0x6c/0x1b0 [radeon]
> [   11.364788]  drm_dev_register+0x130/0x1c0
> [   11.364794]  drm_get_pci_dev+0x8c/0x14c
> [   11.372704]  radeon_pci_probe+0xb0/0x110 [radeon]
> [   11.372715]  local_pci_probe+0x3c/0xb0
> [   11.381129]  pci_device_probe+0x114/0x1b0
> [   11.385121]  really_probe+0x23c/0x400
> [   11.388757]  driver_probe_device+0xdc/0x130
> [   11.392921]  __driver_attach+0x128/0x150
> [   11.396826]  bus_for_each_dev+0x70/0xbc
> [   11.400643]  driver_attach+0x20/0x2c
> [   11.404201]  bus_add_driver+0x160/0x260
> [   11.408019]  driver_register+0x74/0x120
> [   11.411837]  __pci_register_driver+0x40/0x50
> [   11.416149]  radeon_init+0x78/0x1000 [radeon]
> [   11.420489]  do_one_initcall+0x54/0x154
> [   11.424310]  do_init_module+0x54/0x260
> [   11.428041]  load_module+0x1ccc/0x20b0
> [   11.431773]  __se_sys_finit_module+0xac/0x10c
> [   11.436109]  __arm64_sys_finit_module+0x18/0x20
> [   11.440622]  el0_svc_common+0x70/0x164
> [   11.444353]  el0_svc_handler+0x2c/0x80
> [   11.448084]  el0_svc+0x8/0xc
> [   11.450954] Code: d65f03c0 cb0803e4 f2400c84 54000080 (a9001d07)
>
> Obviously, the __memset call is generated by gcc(8.3.1). It optimizes
> this for loop into memset. But this may break on some platforms which
> cannot map device memory correctly. So, just invoke `writel` to handle this.
> Signed-off-by: chenli <chenli@uniontech.com>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 39c1c339be7b..ea5485ced5c4 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -803,7 +803,7 @@ int radeon_uvd_get_create_msg(struct radeon_device *rdev, int ring,
>   	msg[9] = cpu_to_le32(0x00000000);
>   	msg[10] = cpu_to_le32(0x01b37000);
>   	for (i = 11; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +		writel(0x0, &msg[i]);

You might want to convert the other assignments of msg as well. And IIRC 
the type of msg needs some casting or we will get static checker warnings.

Apart from that looks good to me,
Christian.

>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);
> @@ -832,7 +832,7 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *rdev, int ring,
>   	msg[2] = cpu_to_le32(handle);
>   	msg[3] = cpu_to_le32(0x00000000);
>   	for (i = 4; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +		writel(0x0, &msg[i]);
>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
