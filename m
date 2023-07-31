Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54583769C0B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBFC10E2CC;
	Mon, 31 Jul 2023 16:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D93310E2C6;
 Mon, 31 Jul 2023 16:14:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6LbSL46Rwk7EKIAAo0P3FKhAUhQbijkZXzpcqqA2y0YQtiviUNl1HaJjPqKt9rtupS5NBqxuJ6eJy5/6NuxA3uBy8JwUTORbywEcuRz4L7unWfMIECsQaRtJctJeXlDtC8khjCRPQLNHESOtI9oOcQi5xInrqU7xyZeSTsDGyIsW9pjApThVwEgSU3koPDQYQnUIyHz3M4UhooujtsC/SLTi91Hw+GEz0PXu+/1P0x/OF2e/Vo01kRmkWVSqJ00UQ+j5xacQcLPXMW9EtVyBY6+7lI4eIdYdzbxtsXNt9mv5N/rJ/rvnG9Y3Y8qn7s76NeI7t5geB2gJs38CuKosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W9+BccaYyzKc1i5Uh78Gsv6qDVhcebOYcc4A8Ba2xY=;
 b=i4e4t7mxeY79teiktJfx6THJu162YVDdaPLccdX7uenEB6cGYgqMiX8iHr91ZSsqIITeKSxUGYzVNgLBS1zxGTQsqcL/9vYg1mcQRlPerc7zuRL0dWzbcC0vpEwiYEDVDWio6t3RUVWIpB/jaORuS12DodA0GaokXCJOO7wk4dLVwjSkhlP6mYFWO5pYlAwl4JhQBd4DrVZdBzfXIcbpLjrr9m1ZmOULSGdVqMLdeUL0w4zn6HWn1sTHMqwKDezh1VIcBkohzxoj/Tfc5d4PByqldlDP3W4UeTvs7JrGpUnzuajoyzD5voSULMwIt+0byMFJ3OB/1QElpO5NK2z6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W9+BccaYyzKc1i5Uh78Gsv6qDVhcebOYcc4A8Ba2xY=;
 b=uRjkZjdTOOzZuAWRQisv+XLjq7Pvx2zV63BaiaL5Mun5lX2hsTkyHywdymwZ6fR20DAW6083F7bsPdQrmFtb0DCwVc8FKmJ82Urika2KJyZhDx5fHf1ltE6SKfeGdBfnL1DxpXZYnUr/ZN92+7IWt3Nku2EAadCwp0+sKrU8U4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:14:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 16:14:06 +0000
Message-ID: <75d409e6-5ab8-97e8-44c3-a71e5ff1724d@amd.com>
Date: Mon, 31 Jul 2023 11:14:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, evan.quan@amd.com, srinivasan.shanmugam@amd.com,
 wangxiongfeng2@huawei.com, Hawking.Zhang@amd.com, James.Zhu@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, saleemkhan.jamadar@amd.com,
 le.ma@amd.com, tao.zhou1@amd.com, Jane.Jian@amd.com, Hongkun.Zhang@amd.com,
 leo.liu@amd.com, lijo.lazar@amd.com, Lang.Yu@amd.com, ruijing.dong@amd.com,
 trix@redhat.com, Suresh.Guttula@amd.com, David.Wu3@amd.com,
 sonny.jiang@amd.com, wenjing.liu@amd.com, Jun.Lei@amd.com,
 mripard@kernel.org, tzimmermann@suse.de, drv@mailo.com, Shiwu.Zhang@amd.com,
 aleksei.kodanev@bell-sw.com, ye.xingchen@zte.com.cn,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230731132610.2675314-1-ruanjinjie@huawei.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230731132610.2675314-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0023.namprd12.prod.outlook.com
 (2603:10b6:806:6f::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: aae58fef-4e78-4456-1594-08db91e129d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHKiErb1FYwMsK2MZApsJpMYN5t+TZHsaAI14bLH3swlDTjoyjbELBThzcdr9pXYgd3coG4//NVlVlC9KqsHG8gPQqCZHbN6Yo4lDFMR0ZZP3y3zDltHB4fwJEaaKNEiMVUloa1RHrxS5QnidqxPrP566x9Jofe/gtTWN120YIDRpkGU4KBwIREJR2ou3arixT8WS+R+7PTpsVOS/+4CsrRhuvD500AT/U3MWS/TyWbJKjGJ6riSwdbGuntxsuyUQK46jP8vEc7jRArz+FgZNwZ/ik8lqXBbKCqO6iIHeEem+QkYWylWcadbgAtaoHrSajEg9xASUholLoLAtHe4Og3J+o3iT+HSNaEK6mE4inSYdmfrlxSRqLeZr8sYcl9rsDwsiRlF7auV5gg15JR1l9AS3TuoSx06+vjERasqre+w/eJUaqgStdLHnD6hprnpGdTmWghKFda3WbLjeIvLCWDbPKGP/PkhWwhL2HID5o2u8GD7ElLOUuppxff1WxUs1Ov7Nwfmk/8oRuAaGuZsG7MeTSQnCS3bV6EN5JjQSWbUj7CNYLq6nHRM2p8cf7WI0x6LrJjYiIu0kH06Py8Ho1M215rKlDLeI+16zDDkimGVSmGrDtP3dtj+wX9NRHzrhuriqntvUFF/t9HXWlMqExPeMT/kSqHwjPq0aFb/WSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(38100700002)(921005)(36756003)(86362001)(31696002)(6512007)(478600001)(6666004)(2616005)(6486002)(53546011)(186003)(26005)(6506007)(8936002)(8676002)(7416002)(31686004)(5660300002)(66556008)(66946007)(2906002)(66476007)(41300700001)(30864003)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklsZFBHQkZGNW55a0R5MlJubFlGLzIzb0tTUUN4UjV3VjNseVRNSTQ1TjJ5?=
 =?utf-8?B?MEdqRHFVME1aY1VRQXB1dEgxaGZqMTFXNmJmUzlwdERrT0htb1cvN2k3b1Nt?=
 =?utf-8?B?MDV0Z0h1UUJFN3hpWEVoemthRUk2VlYrTmZpTklONHQxZUdqbW1veDBaTE85?=
 =?utf-8?B?RXpwSjBQTFkrQ3NTdTh1Q3VJNWRMWDNrcGNqRGFvN3JlMVJqMVZpSWZwampq?=
 =?utf-8?B?aStrVkdKeFIyY2pGQW14SmQ1K0thWkVQU1l3RXJpT0lENWtKOExWZDh4NytT?=
 =?utf-8?B?cWFiUEJIZzlkb1Bjd1JGZUZCV3JTa3ZOV05BR0tLOUVsbjhHc3VXaWhMTnJ4?=
 =?utf-8?B?MDVWUzlHdDZWdzNXOUtSUVBKdEUwYzJEQUxUL1FVcUVNVFg1TythaFc0bVEr?=
 =?utf-8?B?d0wwcUxBeFBNS2ppRGd5RTdWbml3N0x0U0hrQUozNmN3Nk5ham9nQmVQS2lU?=
 =?utf-8?B?LzcvV09Za25CUDlKVEp0QjNjU2JYSmo1RGtmZWVCTzNRa0lOSHJOVE1MLzVD?=
 =?utf-8?B?NW9kTjdzYnJtZjhKdGhpY1lKa21VNHhaWDhxSkJRZHVyc0dHQVpjUkRVcVgw?=
 =?utf-8?B?VnVtSHNpR0RhUElENG51YkVSaG1xQ1dTc3lTK2JOSnB5THg3aWpaaUVUNmFX?=
 =?utf-8?B?aWwrbDdGYzhEQW8xdm5YRjhyS3pPQ2hUSUJvNk1nVGxFUmtVOFM3NU1pb0dF?=
 =?utf-8?B?M2NLWklOdjk2Ry9waDdPRjZNejFXWjd0ZXduaU1qOGxQeklPL1YzVXAzRXAw?=
 =?utf-8?B?czF4MzlmZ3pCbmkxT0IvOWpYTTQxUkNyblM0THlFL3dyVGZ2NUl3aDBPa3Q1?=
 =?utf-8?B?dHFabVppYURKbWpWYWs5VXc5WFAyY0dSV3R2ZjRCY0dpekZPYTh3RVd6dEcz?=
 =?utf-8?B?M1lJeHJ6amVzWkZSQ3I5ME16dVlldlRZWHhtY1ZCWHRFMzAwb1pOcTI2eTFM?=
 =?utf-8?B?RVBHVCt3c1E1RjlQN1NPT0VvaEZodmVteXdUTlVrQUZCenRXNU03ZlRVRC9H?=
 =?utf-8?B?RmlwMllGMTh0dmFmbmFZeE1PYkh4TDV3WWZhMVkyM3Z0bFErbUh2QlR0V3g4?=
 =?utf-8?B?S3ZyNUdZeWhZaFJKczQvcDhFZHpJL2c2djJid2dEVTlpN3ZKUXdBOGJTQ0xw?=
 =?utf-8?B?V1JadnZKb2pzMTBJWERMQjZSd0lONlZITE53dUpiS1RHS1JaNHZBWG0wR0NG?=
 =?utf-8?B?VU1JY2d4TTNUUTdId0JtUHZqZm5NQ09VRXF4L2I3TUhBREVOVzZxWEVHcnVZ?=
 =?utf-8?B?U3U4aXl0dWZlakNjNzVCWGJoN3pqVDh3VGVJU1BvU0xDV0huWTdOdHpjZnRQ?=
 =?utf-8?B?Tk1iL1NPT1B4Sk1GTitnc0tMdDNQa0MrL1Y0b0x4dERsMTFDbmNLSUtIeTln?=
 =?utf-8?B?VU1FYkdLaGdlUlMyNWRjcGF5SldIMUNCZER5T3BIOHNkVTNYUlFvZ2NUMXBz?=
 =?utf-8?B?UWw0SkJNVU5WRDNpckdVb0tmMlFrc0RjSWlrVkNYeWpCcDVpYk9QRkZPM0dB?=
 =?utf-8?B?WENRYWprb0lCNGphQlRiN1oyazBxSjR2TlBlb3lPZHY3eUZjbTc0czREazhN?=
 =?utf-8?B?ZHF3dzN6NkFDTkdlZ21wWGNIZkhSVXJqQllQSUJwbWlmVU1kbzFZNTllUzBZ?=
 =?utf-8?B?UHhHZVFORFUzTlQ1anRsclJRaDgvSTBCaFl4MEoxU3RsejlKNHlXcmVJb1R4?=
 =?utf-8?B?amV2Z21iL2Q4R1cydExNdzRwYUpaOVI4dHhyQ3FGUGozc1lOQkxDN29FL2Nm?=
 =?utf-8?B?eEh0c3lpb2trREV0alRQODlTWVUvZkw5MjhpWjFCVVozWVhMVVZsRkZRQko2?=
 =?utf-8?B?Ym9qcDhRWWtKL0o3Q2tPTTNud1JXb2x6cUIzR3ExMmxNSEFjR0dZdmYyQzNC?=
 =?utf-8?B?K3ZqZEJHWUplUkR5eG01YkpDbTVBd3lkTmw2dkV3RVJTU2h0K1JLSUZOUjF0?=
 =?utf-8?B?ejlrVnZJUTVlYStXYVdTRktGZUsxSkw0QVQ1dnpVNTNqNzFxVXRPTDVOOENF?=
 =?utf-8?B?Nm43L1U4UEh3ZGJ2QXd2b2FSZEpxeHl5Y0s0eHJPcUttczI4RUF4dGtEMGxS?=
 =?utf-8?B?eGQ5eEEzMkZiWkh5eXNVTUxvdi9QNG13L3dFanhIZmVYSU1zT00vMTVNOXNa?=
 =?utf-8?Q?BEa13qeqCtED7j29YKV5Ok5XW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae58fef-4e78-4456-1594-08db91e129d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 16:14:06.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ttwj7YJbpyIhvrFZbZ+BQIHdAMUU5FaQkvm0hpZFnFn4h3W/rpASOTVUyPF1v0ILvsBnZrzWBmkhmOXuLq3vDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/31/2023 8:26 AM, Ruan Jinjie wrote:
> Ther are many ternary operators, the true or false judgement
> of which is unnecessary in C language semantics.
s/Ther/There/

Unnecessary; sure.  But don't they improve the readability quite a bit?

> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c          |  2 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c          |  2 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c        |  2 +-
>   .../drm/amd/display/dc/dce/dce_link_encoder.c  |  4 +---
>   .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  6 +++---
>   .../amd/pm/powerplay/hwmgr/smu7_powertune.c    |  2 +-
>   .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 18 +++++++-----------
>   .../amd/pm/powerplay/smumgr/polaris10_smumgr.c |  2 +-
>   .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c |  7 +++----
>   13 files changed, 23 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> index b582b83c4984..38ccec913f00 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -460,7 +460,7 @@ bool amdgpu_get_bios(struct amdgpu_device *adev)
>   	return false;
>   
>   success:
> -	adev->is_atom_fw = (adev->asic_type >= CHIP_VEGA10) ? true : false;
> +	adev->is_atom_fw = adev->asic_type >= CHIP_VEGA10;
>   	return true;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
> index 79791379fc2b..df4440c21bbf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
> @@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void *handle,
>   					  enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   
>   	if (enable) {
>   		if (!jpeg_v3_0_is_idle(handle))
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
> index a707d407fbd0..3eb3dcd56b57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
> @@ -626,7 +626,7 @@ static int jpeg_v4_0_set_clockgating_state(void *handle,
>   					  enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   
>   	if (enable) {
>   		if (!jpeg_v4_0_is_idle(handle))
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
> index ce2b22f7e4e4..153731d6ce8b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
> @@ -785,7 +785,7 @@ static int jpeg_v4_0_3_set_clockgating_state(void *handle,
>   					  enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   	int i;
>   
>   	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> index b76ba21b5a89..9b662b105cc1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -2095,7 +2095,7 @@ static int vcn_v3_0_set_clockgating_state(void *handle,
>   					  enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   	int i;
>   
>   	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index 6089c7deba8a..7c486745bece 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1918,7 +1918,7 @@ static int vcn_v4_0_wait_for_idle(void *handle)
>   static int vcn_v4_0_set_clockgating_state(void *handle, enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   	int i;
>   
>   	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> index 550ac040b4be..e62472e6e7b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> @@ -1287,7 +1287,7 @@ static int vcn_v4_0_3_set_clockgating_state(void *handle,
>   					  enum amd_clockgating_state state)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
> +	bool enable = state == AMD_CG_STATE_GATE;
>   	int i;
>   
>   	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> index fa314493ffc5..e4d65de2d0bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> @@ -941,9 +941,7 @@ bool dce110_link_encoder_validate_output_with_stream(
>   	break;
>   	case SIGNAL_TYPE_EDP:
>   	case SIGNAL_TYPE_LVDS:
> -		is_valid =
> -			(stream->timing.
> -				pixel_encoding == PIXEL_ENCODING_RGB) ? true : false;
> +		is_valid = stream->timing.pixel_encoding == PIXEL_ENCODING_RGB;
>   	break;
>   	case SIGNAL_TYPE_VIRTUAL:
>   		is_valid = true;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 1cb402264497..8c73016d2d17 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -904,7 +904,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *hwmgr)
>   					dep_sclk_table->entries[i].clk;
>   
>   			data->dpm_table.sclk_table.dpm_levels[data->dpm_table.sclk_table.count].enabled =
> -					(i == 0) ? true : false;
> +					i == 0;
>   			data->dpm_table.sclk_table.count++;
>   		}
>   	}
> @@ -919,7 +919,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *hwmgr)
>   			data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].value =
>   							dep_mclk_table->entries[i].clk;
>   			data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].enabled =
> -							(i == 0) ? true : false;
> +							i == 0;
>   			data->dpm_table.mclk_table.count++;
>   		}
>   	}
> @@ -1833,7 +1833,7 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
>   	data->enable_tdc_limit_feature = true;
>   	data->enable_pkg_pwr_tracking_feature = true;
>   	data->force_pcie_gen = PP_PCIEGenInvalid;
> -	data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK ? true : false;
> +	data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK;
>   	data->current_profile_setting.bupdate_sclk = 1;
>   	data->current_profile_setting.sclk_up_hyst = 0;
>   	data->current_profile_setting.sclk_down_hyst = 100;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> index 21be23ec3c79..d6eeef3c58f7 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> @@ -1103,7 +1103,7 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
>   		PP_ASSERT_WITH_CODE((0 == smc_result),
>   				"Failed to enable CAC in SMC.", result = -1);
>   
> -		data->cac_enabled = (0 == smc_result) ? true : false;
> +		data->cac_enabled = smc_result == 0;
>   	}
>   	return result;
>   }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index c51dd4c74fe9..dfb9573e3f55 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -135,13 +135,12 @@ static void vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>   	}
>   
>   	data->registry_data.clock_stretcher_support =
> -			hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK ? true : false;
> +			hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK;
>   
> -	data->registry_data.ulv_support =
> -			hwmgr->feature_mask & PP_ULV_MASK ? true : false;
> +	data->registry_data.ulv_support = hwmgr->feature_mask & PP_ULV_MASK;
>   
>   	data->registry_data.sclk_deep_sleep_support =
> -			hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK ? true : false;
> +			hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK;
>   
>   	data->registry_data.disable_water_mark = 0;
>   
> @@ -150,7 +149,7 @@ static void vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>   	data->registry_data.fw_ctf_enabled = 1;
>   
>   	data->registry_data.avfs_support =
> -		hwmgr->feature_mask & PP_AVFS_MASK ? true : false;
> +		hwmgr->feature_mask & PP_AVFS_MASK;
>   	data->registry_data.led_dpm_enabled = 1;
>   
>   	data->registry_data.vr0hot_enabled = 1;
> @@ -1375,8 +1374,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>   						dep_mm_table->entries[i].eclk) {
>   			dpm_table->dpm_levels[dpm_table->count].value =
>   					dep_mm_table->entries[i].eclk;
> -			dpm_table->dpm_levels[dpm_table->count].enabled =
> -					(i == 0) ? true : false;
> +			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>   			dpm_table->count++;
>   		}
>   	}
> @@ -1391,8 +1389,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>   						dep_mm_table->entries[i].vclk) {
>   			dpm_table->dpm_levels[dpm_table->count].value =
>   					dep_mm_table->entries[i].vclk;
> -			dpm_table->dpm_levels[dpm_table->count].enabled =
> -					(i == 0) ? true : false;
> +			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>   			dpm_table->count++;
>   		}
>   	}
> @@ -1405,8 +1402,7 @@ static int vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>   						dep_mm_table->entries[i].dclk) {
>   			dpm_table->dpm_levels[dpm_table->count].value =
>   					dep_mm_table->entries[i].dclk;
> -			dpm_table->dpm_levels[dpm_table->count].enabled =
> -					(i == 0) ? true : false;
> +			dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>   			dpm_table->count++;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index e7ed2a7adf8f..ff6b563ecbf5 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -1888,7 +1888,7 @@ static int polaris10_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
>   						(avfs_params.ucEnableGB_VDROOP_TABLE_CKSOFF << BTCGB1_Vdroop_Enable_SHIFT) |
>   						(avfs_params.ucEnableGB_FUSE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
>   						(avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
> -		data->apply_avfs_cks_off_voltage = (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
> +		data->apply_avfs_cks_off_voltage = avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>   	}
>   	return result;
>   }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 7d024d3facef..34c9f59b889a 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -295,9 +295,8 @@ static int vegam_process_firmware_header(struct pp_hwmgr *hwmgr)
>   
>   static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
>   {
> -	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
> -			? true : false;
> +	return 1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON);
>   }
>   
>   static uint32_t vegam_get_mac_definition(uint32_t value)
> @@ -1660,7 +1659,7 @@ static int vegam_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
>   				(avfs_params.ucEnableGB_FUSE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
>   				(avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
>   		data->apply_avfs_cks_off_voltage =
> -				(avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
> +				avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>   	}
>   	return result;
>   }
