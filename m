Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF92DBC5E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 08:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500D689856;
	Wed, 16 Dec 2020 07:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD8189856
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZqDaX8SLxrmRfoIXL/ulb6CUdtpND4I2SkZ0tfBjUltIaXy9nCtaV2I8z1nWSpevwc0QGOnXqEEI9KOEXf9YN11yU+BW9HObqYAswz5ZVFHYS6FoUhjk2M13xymzRMtQjVuO47wJnEC6uVL2zvujFIeD0amnEndnOFwT+UGEUGHAh6rw33VlEsVd/mdjSFQlvC+WRlvF/sym1kUDQlheBW97RqSGc2UtdTT61d0rWfYAr6p7hWWI5i0hAIhmXTjKh1CqBy7/JfJhmOTKT7N6AaAxMb7yxcPOkwwMW3cAQpxGsff//JXK8i/OPqIrWiEgI3kOnUpRlAmCEFHuKx0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c3emRU9i3DhBwaQUtz9ZSuZyl4jGG9t1i0MQr3C0EU=;
 b=InRVsGuyJ9CiGLYRZcX4MoHWR2bFydboqkfrtvJu3tz91eX6sCDATJDM6DMktL8NxdaBEHuZt0NWmdD2zCT06ZQqnjoGyC1w1iHbTRpYZOHolTdMfMMSFJJ10qxmpxyohMMDbSNLdmTjMjt/5UM1av7q6LWCgdnkx3JmhL43lY2k0JFtoqnhC3Dt4E+nXimcVU5n6ATZTprjJr4m9EgJOoyGgHTbFcLTPatL9Ir515Rhswr+wdCrC3949LNaIhJ1X+Pcc5bI/1r3rtrcRMiLNtKecAzGv+AC9ohose6+dsoYs86C2yOp0T68kDNNY2Mzqm1bmea9FKny2DCK5EesKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c3emRU9i3DhBwaQUtz9ZSuZyl4jGG9t1i0MQr3C0EU=;
 b=hjyrn1MwwrL77z4BMOYc4SHv0Na7W6DS6AVeA2uuEF4rRb5pJspmv6T5HZ1A9Ja5DVbHK7cVkdHDejZRDVlf9YIOA0K3221ava/0HSRsdB7uOaroSEvvOv50/7jSVmrNbbeIreTgf9zHPrh6m0yfptX5q6Kz74N5OxLPruJPWdk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Wed, 16 Dec
 2020 07:59:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 07:59:43 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>, 
 dri-devel@lists.freedesktop.org
References: <877dpiz4sf.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
Date: Wed, 16 Dec 2020 08:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <877dpiz4sf.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0165.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0165.eurprd02.prod.outlook.com (2603:10a6:20b:28d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 07:59:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6201e70-0eb9-44ef-6cbb-08d8a1988c17
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933CEE5E4AC4C39AD8FE17A83C50@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFeXUBlP1SRHNM5h7BKGcKj1fRDtc4hmvn/it1J/ts4gQaH5AIqe6rYeDJAXjuvaAaIcviVCW5EJlQtny6mZVuESv2uFUgJiCajgPbpGuCDqHPzurwMZxBk4hh0AbhBI4hexnw+6g/X2b3JIsRjYJH3BUMihlSDxhad2OWbGfBGIqcZpwLZQLQqRwwwJt7AKrvpDp8Mhh4jFhRHA6MWNDPl5UQe138J2ke7GYGMCmwiPG5pVsEQd0H4cMNkDyoOWvC72IrLos5m7/xsMBctUUObTu8TMBSnideCIkcfoqmjp1BqzyrKVEch93tRBsn0VM1EHiBI7tAnjgdPfQaF+5cJVcRXUSX2D07QoW8qb30/etXCjnWvRTuDOAQAtGFqFkYDlpvYpeO1w2OLuHUYB20qOi6XLUacPLx5wtI+hzhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(316002)(110136005)(8936002)(2906002)(83380400001)(5660300002)(31686004)(86362001)(478600001)(16526019)(6666004)(36756003)(2616005)(31696002)(6486002)(186003)(8676002)(66946007)(66476007)(66556008)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmpHcHQ2UDdGRlMxRUk4V0V1eitzUHFodEV2d2Y2eGM3VEl5Tkk0TlRiZkxZ?=
 =?utf-8?B?WHBGZ1gybFN6TFJWWHp4Vkg4YnZUZVY5SndxanRQR0tSVTV1QmxNbVI1ZFc4?=
 =?utf-8?B?VDNlSEdocDNqUWFYNzNaRDJwTTFCWXZNUlM2MndWWnNZeWRObVpLb1FKNE1p?=
 =?utf-8?B?TGFEQTY1WXExemxVSDI0ZVZvNnZWdnFoUVVjZkNWUWxrNkRJOVlaVU1DTlBF?=
 =?utf-8?B?emZoWlZFell5clp0YVVqY29BZlpUa3dRd3REUG1HR2dUSmcwWjN5V0pxdjFp?=
 =?utf-8?B?OWtlM29yWll5M0ZMYzFRNEdzNkl4eWlRSU92NmtXbHVianE3cDA4WU5TMDZZ?=
 =?utf-8?B?OEJQdXNNZXlxL2FEZnRsTlZ6SHdDZjhoSE9za24zUkdXKzYvbkJ5bWhWZitm?=
 =?utf-8?B?cU5wVGFYbjVkem15a2JtWjI3azJLSW9JQVhzczMrUEY0Z1g5ZkVqcW9pZ2ow?=
 =?utf-8?B?aytuOU5yY0kvTElPZG5jUW4vcUlHbXR4RHRibGFYNzFhSTN3RlVtSlh3QVhK?=
 =?utf-8?B?M0NEVHBRZk96dllseXE2aVduNE1kRm84SUZ5SmNpdHdqYUFId1ArY2FLS1hZ?=
 =?utf-8?B?V25Vc3VyQ1UvQWhkcWNrVmZxMnRBOGJ2eVZTZ3FGRVlLNDVxRW5rRm85OXZC?=
 =?utf-8?B?Rmxwb2grbVdPUjFOWUpFanJSUEJuMlcyMTJFN0tKNkVEc3VpR3QzTmtlcVVT?=
 =?utf-8?B?MDlrZkFmRTBIOUZXL2lLSUYrNE9JL254cUErMXBGeG9oZVpFNWUvdC81eUxw?=
 =?utf-8?B?KzdjT2NORjFFeXdQbDBsa0Q0N1crNzZtOXJDSHoxMmEra0UrV080ZWFnVkFC?=
 =?utf-8?B?eDd6WnA5TWE1KzhPUjJ2dnZzR2ZnejdESlRNQUtmSFdsN3lUMlpTRDhLV05q?=
 =?utf-8?B?Z1luYVg5WUw2TEJ4czdtV1B4a0MzMWVxN1ViN0MySmlCZEtGUitTS1BtSzd3?=
 =?utf-8?B?NzFycW1La2UyQ0MwSFpZa2k2Q3J1VHRFS3RvYkJuNC84aDQ2eituZTZnTU9w?=
 =?utf-8?B?WFV1TldLbnBRN3J5TWhtSTREZTlVeWIra3c5cGVGb2kzTGwxcm1yVGhNUmhY?=
 =?utf-8?B?VHZyNDVnTEttM3lrYkxYZW9iRnFyUU9TdkJuRzhuakpZajFKQUVnTjRzZi9q?=
 =?utf-8?B?UjBTQ3pnSFZKS0hNNForYi9CZGhPVWVCaWZ4WmRUb1lmdnpRbTNOY3lNS1VT?=
 =?utf-8?B?WWRJNUFpT2VWR0VJWkMzZUxLblBjZEZOdnp1VXZhSlZYT3NUSExxRHhEUmk1?=
 =?utf-8?B?S3hEZ29rRU9kN2NrYjFRWllqK1puK2pwTE5uV0g0QUt5N2NDWDNQVEpVMnh4?=
 =?utf-8?B?Z3hkaEFPOXVWOCtPWVlPblh1SjN4U0V2b0daNE5keUVXQXJ0ZjkxVlNwTW1t?=
 =?utf-8?B?NEoyUnFqMVBmcUVNWHFnaUxCL1ZsTHBJSnpBZXNNSHRNNUluYUhrNWd5dUcx?=
 =?utf-8?Q?Qka0CZrq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 07:59:42.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d6201e70-0eb9-44ef-6cbb-08d8a1988c17
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceJy0vF+SB+2WZAxyuGsj4UT589EzW9C26lji+GBlOtXDqxD/bMMyEJbhzHA9o2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
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

Am 16.12.20 um 06:41 schrieb Chen Li:
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
> this for loop into memset. But this may break, because dest here is
> cpu_addr mapped to io mem. So, just invoke `memset_io` directly, which
> do solve the problem here.

Well interesting problem you stumbled over here, but the solution is 
quite a hack.

For amdgpu I suggest that we allocate the UVD message in GTT instead of 
VRAM since we don't have the hardware restriction for that on the new 
generations.

For radeon I think the better approach would be to convert the direct 
memory writes into calls to writel().

BTW: How does userspace work on arm64 then? The driver stack usually 
only works if mmio can be mapped directly.

Regards,
Christian.

>
> Signed-off-by: chenli <chenli@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 ++----
>   drivers/gpu/drm/radeon/radeon_uvd.c     | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 7c5b60e53482..4dccde7a9e83 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1187,8 +1187,7 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	msg[8] = cpu_to_le32(0x00000440);
>   	msg[9] = cpu_to_le32(0x00000000);
>   	msg[10] = cpu_to_le32(0x01b37000);
> -	for (i = 11; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +	memset_io(&msg[i], 0x0, 1013 * sizeof(uint32_t));
>   
>   	return amdgpu_uvd_send_msg(ring, bo, true, fence);
>   }
> @@ -1212,8 +1211,7 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	msg[1] = cpu_to_le32(0x00000002);
>   	msg[2] = cpu_to_le32(handle);
>   	msg[3] = cpu_to_le32(0x00000000);
> -	for (i = 4; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +	memset_io(&msg[i], 0x0, 1020 * sizeof(uint32_t));
>   
>   	return amdgpu_uvd_send_msg(ring, bo, direct, fence);
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 57fb3eb3a4b4..2e2e737c4706 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -802,8 +802,7 @@ int radeon_uvd_get_create_msg(struct radeon_device *rdev, int ring,
>   	msg[8] = cpu_to_le32(0x00000440);
>   	msg[9] = cpu_to_le32(0x00000000);
>   	msg[10] = cpu_to_le32(0x01b37000);
> -	for (i = 11; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +	memset_io(&msg[i], 0x0, 1013 * sizeof(uint32_t));
>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);
> @@ -831,8 +830,7 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *rdev, int ring,
>   	msg[1] = cpu_to_le32(0x00000002);
>   	msg[2] = cpu_to_le32(handle);
>   	msg[3] = cpu_to_le32(0x00000000);
> -	for (i = 4; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +	memset_io(&msg[i], 0x0, 1020 * sizeof(uint32_t));
>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
