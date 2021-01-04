Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783922E841A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jan 2021 16:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E857B89B12;
	Fri,  1 Jan 2021 15:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FEC89B12
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jan 2021 15:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A22vUZnle2B8NGywwCaT/iQ8aMfMqWRJKGWG9B69Nw9Qzo7q1hPYIztsvyxJVKIGLpswjjy21xSDJDA9X3aMA6m8r9GUsOsn8y0hoO5h7C378Ozz5hY1KysY0kAnw/XFOf7CU8Roo7a6Is3lNELrbbBUFJI8kn+PZ8PJV1cYPTSnDFArIR+b8RHo1t6Ya2iOAhpeakzUW/6FWDnmmrWRezzWQhZURyQ0rAWPuQsRdCnAQMsx4toXZ8R0ywn0eQf9P4ib75dDe5LoKsWXOgmIThsTz6V7/mnM6vRdmHYmfgmZJn/XIFecvq16LiFCNuIV1wqE4FK7pgONW0IJR8Jr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPKekUvUaJ94PaLFBpOhBlWDuSft8bV/TBdE72JzcF4=;
 b=MSBg+dv4GedZ62nykxV8WAKbs+q1KsSJNdAeGhfRdHzZZ4rYD/lMgkM9sWd0w5HiaiNAaaqlmm4c+1T5uftvLksdTeWM6Pn7alvrEhgg22GgpO/edrXSbcW9/0cneAzPUNLUfV8MbXiISoY6QAhFDMxCgY98Yoy0LgMyXH1qxXwibhahc8d8eRIAJ7uj8EZyvL/kGGRt9hoIWNeusviPSugB29kvcItfwYUkvDS/oIonadFcgJMbhs3IwCkDhIn0qt0E7B+j700za/aA4wfQM5RwWHRGjeO2KwV69LyZ/XVZs1IyRUSHBS4lF+8p6Sdu5Xcx/I7sLkIL+Mt86FdPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPKekUvUaJ94PaLFBpOhBlWDuSft8bV/TBdE72JzcF4=;
 b=auLvTCrjz9cnswtIodI5trQ8B6E2wa7sUFDg4I6JcbPRgeijP3ThUQg5uxwY4gTQAGP2BK+B2Gk1eF9GvB4uywbbcTdiXVdIuw25Y7n7U8vUlVjmL5A+UttiqC5umWRBwWXWjft2YX3YB+b2mkEqhkBkkJkx+4F9nKAzDU3gfoc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Fri, 1 Jan
 2021 15:48:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.020; Fri, 1 Jan 2021
 15:48:20 +0000
Subject: Re: [PATCH v2 1/2] drm/radeon: use writel to avoid gcc optimization
To: Chen Li <chenli@uniontech.com>, dri-devel@lists.freedesktop.org
References: <87wnx6wne6.wl-chenli@uniontech.com> <chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <457c6bde-88ae-13a7-f04b-1e8e6f4e4e9a@amd.com>
Date: Mon, 4 Jan 2021 12:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0120.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0120.eurprd02.prod.outlook.com (2603:10a6:20b:28c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Fri, 1 Jan 2021 15:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87ba0afe-b35f-4225-ec8a-08d8ae6caa23
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440EF63579FA76F9155629283D50@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wKZN+A9WDbHpB+mR0GuzIVyUguVlSJlKkDU5CXzJdE3gOBJKLvaAkgCQa/NgTm0B1BHXSIxBRGvMR737LNdAUkz0uSfbzgs23fdjE/+EcPu1X/dZXZDJ1zcJXbqQUi44/uApV/yMEB7R3GuV/drKXiH6HIftFcquMx5nhBEiapWFQFQOn8Pmdp2YgKB+WcL98QWUUNLp9pELRIGpgUMomylCPDtD0HeQQF5Aagsc9YdklNKeEK2njBv8ug76bstDri6mA4+Hk2oi1sOy+elbdOHe1Va92DetcZcJK0e42EW9FTZKfu4Msjgim+5gtxKnpK8yyoj0c90+yXkLhy1vFoT8dDbMY7UXqVwudgTTDUMxv/00+aBVDKdZKxGexJ0GM6GKXeoJRrfeHhHS4IKKqear6kNPuQ6A24lb6KvUsdNU1Mbqul5dv25LgIhN/X5zZPZTO3GxOsSD2bObN2l5nc9M1XLHvu/4YHcLVMVJCro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(6666004)(16526019)(186003)(31696002)(86362001)(36756003)(6486002)(31686004)(8936002)(5660300002)(2616005)(2906002)(316002)(8676002)(478600001)(52116002)(66946007)(66556008)(66476007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjZKYTNIcktMeWZ6c2Y4TnBMbjh0QWxKaGppY1VkWFE0T1ZHMFM0RyttUGVl?=
 =?utf-8?B?QytvVE13RERzdW9nRUdDbGdTbFlKMVBiVVlnS0hJNzlmY1VYOUhVT2pJbTQ2?=
 =?utf-8?B?bkdpMXNqY3c0L0M2MTIxZk5EM3E1ODB6TXdzZjVBcjNIVVhNYk9uSjZJdEVD?=
 =?utf-8?B?RkdZdDZUa0pVS0NKWFFhQ3RUNU5zSWFNMEVmR0dEbHJCbzFzMy84U3NXc0Va?=
 =?utf-8?B?bmtpYkNrbVU3THc3eEpFbnJoTnV3aEg5RkVpM1hReWNZQlBSRVhGaGZSZjBX?=
 =?utf-8?B?WUhKbVFjajczUFRMWGZzN1Zja2JjZFdKYTNLWTFtTVdQWmEyWm5wTVFnL2NV?=
 =?utf-8?B?RnR3UlJjNTl6SmNFa1hwcTZUN0VMeVAyQ1ZCUmpFSnlqRFdvR3Y3eWpZdXlE?=
 =?utf-8?B?cXNUWVFxcTJKQm9kYk5uR0oxY2xrbVhtNXd1R3dxUFBZRGo2NkN3aDgwa3Zi?=
 =?utf-8?B?NXpkVm5DT1Yyd2JIQlE0eWlZQytkV0ZHa3VHdXhxYTgzVlBZNGdnRFhDdEZM?=
 =?utf-8?B?NDNWNEhHZFQ5US8rdHpiTW1tMkRtMzJFcmRtRUNTYXdncHJtLzBiTnRpVWFY?=
 =?utf-8?B?aDllR3YxK3FsSnBpeEF5SEY1VDhCNmxqQXNXcEptSytxU2FUcFhYVXNkMTM5?=
 =?utf-8?B?cENJSVhMMlo3WEsxdFJUaURpdVQyclBXSHViQndiWUdjUEc5ZUxaZityRGth?=
 =?utf-8?B?eEtxTCtLZ01NU1RtaTkzeng2QzZXWW5jemd0MGVOYkk2cWR2OC9nNGt1cjZT?=
 =?utf-8?B?V05sUFRINkVvak5zVjBsMVI4WFQ0eS9wMGMrZ2p0YlNFdGcwUW5VZzlKZHVE?=
 =?utf-8?B?RGVuY0NERU1TRHdHK3pEa1RmMmJWSENueGNlS29Fd3hWK0Q0Z25UaDJMYmk0?=
 =?utf-8?B?MjdRQWJ4cWYwcVlLdWdNendtZkM1NHdHUDNXUjdhdFlOMlNHaENXS25ZSU9C?=
 =?utf-8?B?MzFxR0FIQkd6ZXFqNGVWR1doYnJQandqa0cwL05ZZUc2NGNEUXRiQ2pPckRB?=
 =?utf-8?B?YjJWMzJabjBvSUdjY3o1SmIvRXlaMEZvWVEzR0JickdiSmlhTjBRWlFkaCtp?=
 =?utf-8?B?RE51YWxEZ2JEVHU3YkJjbUplL3owMFBHWmFTVDJVbzdmSHV5NHc5SFRnbGlD?=
 =?utf-8?B?djZuQksvbmQvVkNDWXFTVDRCT1N5T0dTY3cxQldxYWgzOFZwZWpMNFF5SXhs?=
 =?utf-8?B?aE1hWEhnWlhpWVM1cVFUcXAvT0d1Z2hQYzdFREpMRXkvNmFYcEx6WEIwekFK?=
 =?utf-8?B?Qit5V0p1YitXK1dWV2VqZ1Z0RDlteUpyNHhEcUdwMklKV24wVkZpditONkk4?=
 =?utf-8?B?ZjYvWm51VytNYlZINWVMb0tucFgyV3VzRmRWL3hJS0o3dFRJUGdtMC9XMFJQ?=
 =?utf-8?B?dTh2TWVNV0JKYkpjTWVRYmZSQnF3R0xHYXhFSFNXaWF2UmRFNUhvazl6TzZE?=
 =?utf-8?Q?jFtQAhAV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2021 15:48:20.6417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ba0afe-b35f-4225-ec8a-08d8ae6caa23
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9qYz79mN7eCE6ov8lOqlk1RaQ+MLg/DZJv8PlcjyK+lsdGuY7ddBMS2ly6Kw6my
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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

Am 25.12.20 um 04:54 schrieb Chen Li:
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
> v1->v2:
> * Convert the other assignments of msg as well.
> * Casting types to avoid static checker warnings.
>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 34 ++++++++++++++---------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 39c1c339be7b..e576470402b9 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -791,19 +791,19 @@ int radeon_uvd_get_create_msg(struct radeon_device *rdev, int ring,
>   		return r;
>   
>   	/* stitch together an UVD create msg */
> -	msg[0] = cpu_to_le32(0x00000de4);
> -	msg[1] = cpu_to_le32(0x00000000);
> -	msg[2] = cpu_to_le32(handle);
> -	msg[3] = cpu_to_le32(0x00000000);
> -	msg[4] = cpu_to_le32(0x00000000);
> -	msg[5] = cpu_to_le32(0x00000000);
> -	msg[6] = cpu_to_le32(0x00000000);
> -	msg[7] = cpu_to_le32(0x00000780);
> -	msg[8] = cpu_to_le32(0x00000440);
> -	msg[9] = cpu_to_le32(0x00000000);
> -	msg[10] = cpu_to_le32(0x01b37000);
> +	writel(cpu_to_le32(0x00000de4), (void __iomem *)&msg[0]);

I made the minor change to apply the __iomem attribute to the msg 
definition and avoid the casting here.

With that done I've pushed the series to our internal servers. It should 
show up in 5.12.

Thanks for the help,
Christian.

> +	writel(0x0, (void __iomem *)&msg[1]);
> +	writel(cpu_to_le32(handle), (void __iomem *)&msg[2]);
> +	writel(0x0, (void __iomem *)&msg[3]);
> +	writel(0x0, (void __iomem *)&msg[4]);
> +	writel(0x0, (void __iomem *)&msg[5]);
> +	writel(0x0, (void __iomem *)&msg[6]);
> +	writel(cpu_to_le32(0x00000780), (void __iomem *)&msg[7]);
> +	writel(cpu_to_le32(0x00000440), (void __iomem *)&msg[8]);
> +	writel(0x0, (void __iomem *)&msg[9]);
> +	writel(cpu_to_le32(0x01b37000), (void __iomem *)&msg[10]);
>   	for (i = 11; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +		writel(0x0, (void __iomem *)&msg[i]);
>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);
> @@ -827,12 +827,12 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *rdev, int ring,
>   		return r;
>   
>   	/* stitch together an UVD destroy msg */
> -	msg[0] = cpu_to_le32(0x00000de4);
> -	msg[1] = cpu_to_le32(0x00000002);
> -	msg[2] = cpu_to_le32(handle);
> -	msg[3] = cpu_to_le32(0x00000000);
> +	writel(cpu_to_le32(0x00000de4), (void __iomem *)&msg[0]);
> +	writel(cpu_to_le32(0x00000002), (void __iomem *)&msg[1]);
> +	writel(cpu_to_le32(handle), (void __iomem *)&msg[2]);
> +	writel(0x0, (void __iomem *)&msg[3]);
>   	for (i = 4; i < 1024; ++i)
> -		msg[i] = cpu_to_le32(0x0);
> +		writel(0x0, (void __iomem *)&msg[i]);
>   
>   	r = radeon_uvd_send_msg(rdev, ring, addr, fence);
>   	radeon_bo_unreserve(rdev->uvd.vcpu_bo);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
