Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004696F5DF5
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 20:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4E10E333;
	Wed,  3 May 2023 18:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300610E333;
 Wed,  3 May 2023 18:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbgviV9zWaBeF+XIItShZ9M5wKng4jBkyLgBZIaqL0nxz2isyLFvd8ED/kFVsgW90Eav3qEAA4hyAbhCdPhgifpSSnvxz8/ZOtEK9GFHKVPlhB4LRZ3+zgaPOgcXrdm8qsnVWCkggDqXlHaTtCByw9GSTOA2B2luHJ/44DYpuwnTvgg1vEXo04N8t4hq/4NxPh9g06KeR9nAFD7mISLgFkLYV6Y0eNG1MZ/KKG8OoDb9nnc6fo5Jo9HbUr75kG2R37uXJ6zshe5aKTZ/d33V0019MgoM5KTfZefCVswQYnjT/LFOwrY9pBjY5WnlcUvIa/sF9LjscUCLLWEpWKuFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJgP9O1tAcu6yClD/oxIz8XRFF2NY86ADhvnNgpa2zI=;
 b=RjImLMBc62z476Ps5rZX3GBGgagcETYyk4zqbhyiPBfc78F71UKldDTFzVs1uXF6tCKIPj62D0E3JHngo4D2ig/fZOQBhueboIe9Ehun5ywHrJ83mm/Xab32wy9JMTMwqSwso4OMjA2PbPQmBzsmkICazMKJYgsS7PDyI+yKgc3xHv2PK8VgN/GQYpYZkyagAi4TewWMWujemKGyUVJZlyx39F6SNUehihi70lXL/7gLEHB4EU5It/WHbX622CyxYDLVcq7OEJ3ZM7tSB1ldkgcyt0W2t8kVYvDRvaDlW1KWu245OKXjRhwj0EG0cEbxKe/3JRhsG5z60CxjLJzTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJgP9O1tAcu6yClD/oxIz8XRFF2NY86ADhvnNgpa2zI=;
 b=sxT7FN++ZEWcwDB07xU/8nHOuTCvY4oLkE3hEF3f9TzffOYd5Esem5SrS06w7EVn3ESPTuMH274FvkWKO2VwxeBDKRWvFwkM4PgCQY32rR8u5lt57klUd5SLrKEymBsX/SVJahd8VqVscSOS2qX4JlHwDDAeSFt1d7DM5dZf/Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 18:30:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 18:30:30 +0000
Message-ID: <bf6c8b74-a9fd-c4bd-9025-9e9702aba449@amd.com>
Date: Wed, 3 May 2023 13:30:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230502165155.200068-1-hamza.mahfooz@amd.com>
From: "Limonciello, Mario" <mlimonci@amd.com>
In-Reply-To: <20230502165155.200068-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35)
 To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 91df8763-1271-4b09-ff0b-08db4c047929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8uokPY/M3f2IxkUKKs3jZZkeUYx7ROxlJeuh59CWmmAbxJewBRpE9K/Hr51XT5DtxQimBb5EQy3KqXontNbd5+9GhXGA0yv5hhpPI2PIhL6NaQsEl9EQisUGf8ipYKl6HS7MY4qfPNRQjXcuLmq8hySC+LqLG79Y+t5vtUAf7UajyOwkLwlnKbFxcIMO16gZ+qSiYsZtgDWmVUl0bJrAY72Wi31uXw5eQSpcXGbPbRr0pO+b88gxIlXZsEsolrIUMY46cpe3+BQSXoa0u676EXFt8zwsyhwbLkFqHMEJJyFDAsOmfE9IRXqR9H7S+v2ITirgZ4bDrKdBSUzHSHgdi+IhltpA0SWh7qWAR4f04srrJFswNoLXR9g1E11SqKAG/WANiS+x1IhzdMwqb9VRI7mcSWGxwGszI2tXhN6+jWiF3T+8limW1QZ5fru8qtjWrPXAv66LaFMoi/iPFzOVIjCBEuBc03WViGcB1nK6MswchYPSCxewrwtXFJz+mtqQIW5GxshLu2Ctrw7IbVjvStRcq2ofc3ySZC12rNb9tQScXhlmjkuMUoIKsgMK+oGf9BhdSCh0xYtzApTSgmQFsa6Of/u5CzkiRNygh0hkyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(316002)(36756003)(31686004)(54906003)(66946007)(66476007)(66556008)(4326008)(2616005)(478600001)(6666004)(41300700001)(83380400001)(8676002)(186003)(38100700002)(8936002)(26005)(6512007)(2906002)(6486002)(53546011)(6506007)(5660300002)(966005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnkwVXJFQk9IdWZheHkzWFcxQmVDcUU5NURIZjNJNXV0RTF6SlJTaWtnU3ZP?=
 =?utf-8?B?OFdKSlJHWEN0Z09MeFlNUHhJNnBuTnh6NjVpcW9hN29PSFFIajM0MFRRQS9v?=
 =?utf-8?B?SVpEaUV2cWpKeVdYZVM5SldISjBWRmZENHNjMWFPWUVEK3hiamdsUWg3Uy8z?=
 =?utf-8?B?aC90L3c1aWk0NC9NMU9RcE43L1ZiK29jTFdJckpDMG5TQ2dFYXN0QTY1cnBJ?=
 =?utf-8?B?czR0czgwcGFlWEdKbzlpcnpVVVk4Kzh4b0RoR1RWVENZQnNIbUNQUWVHNE5n?=
 =?utf-8?B?QVhNQzYwTURUdktlY2RXbFVqOHJXM29Zc1ZBSWxlR0RzY2ZkMmozbWNiU3Zh?=
 =?utf-8?B?cTlRb2owNWZJdVNocmg1dVJiZmVhRmxWN01GUURxeFlrOHVhZ2IrQ1lwQVd3?=
 =?utf-8?B?SVQ5NkV6STZURmVJVG1uMllzTktUVmE2L2d6M29vWVcveWFhU1FLSEpVRnF4?=
 =?utf-8?B?TCtQZ0pEbUpnQzRFVGpJYTYyZHBlOTFDZ1EreU54UzFvT3ZOU2tCVVN6Y0NR?=
 =?utf-8?B?MmlCeDJKN2t6UDYvVHI5UitGVHoxUkk2NlJoUm9EZ29HdnQyRGVySjQyeW1k?=
 =?utf-8?B?ZGxrdFZGQk12bzNiOHpZV0JQM29LRDVPU2ZYVG1pL0lqWEkzT1d2eEszSE5a?=
 =?utf-8?B?bjdNOGQ4WVlVUjdWQ1BtKzVaVG96dHFTRUlFdDJVQUpxOXBpS1ZnTWc0OXJt?=
 =?utf-8?B?cVpRUkJoaDFwT0NidFJWai9mdFJ2bEZSdXE0VDQ4R0syUmtqOWdrTThTNW91?=
 =?utf-8?B?cXl6Z0ZtY09FdzlhS0p6OW1yci9Ja0JsT21PUkNveWRwMGNYQmtsbnRUSVNL?=
 =?utf-8?B?K3hTdlVPclp5bkV2UTMzbGV2Zkt2d1BvaFo4bVRLa09mUGxCWXZ6VlUyU09W?=
 =?utf-8?B?cVRDcHVGcnZEMHhRTWYyaU5vMDhONzU0SWFaa3JNRzdURjE5SFJCTG9RSXV2?=
 =?utf-8?B?YmtOQkFDVUloaXU0YlQ4bC85cEdIVHBrbDZqNFE4Y1pYR0wwVHl4OVJYbVZ4?=
 =?utf-8?B?ZDNlcmdSUjVlWG5aeEFTVmlvS05odEpMWWNBVHQ5N09jN21qUEZyU3VtYTd5?=
 =?utf-8?B?cTRKY1Bsc3FPTDcwRnk5VFBNOWxnb1d0YVBEWTM2YzZnSGNjYlluK1QvVVdW?=
 =?utf-8?B?VzhIdjFKOUNDeGxnRHBpajBpTHA0MFU3MDZScWpuNVNFT04yQUNWeUp1SXUw?=
 =?utf-8?B?ODh0RGdBWlV3Vk9RZ1ZVcTR6ZHFmVkJuT1hJTlF2OUJweUdad1dwaDkrbFl2?=
 =?utf-8?B?b1FtTkpCcWE3N3FmRHB0V1NNKzdESEdoUjZEUm1YQlN2UnFLdWVnZTNnUkdw?=
 =?utf-8?B?c3YyYjZiNU5qcE5FeS8vVUE4UDRzMkRNNnZiV2NEODE0NUQxck9uMVFwL3Bq?=
 =?utf-8?B?V1BqbzdCNmRuaElMV1JIZWQzVHFDOGQ0SXlTUUp3UEhSWGFLWHlIQ1IrLzJL?=
 =?utf-8?B?c0lSNGFJNHNNbVhhSEhieGxNM0VCNWFqZ2ZEbzF6QU90dm53THBBMnlGbE15?=
 =?utf-8?B?ekxNMHVaZks3WmgrZlJCUkN2M0RaaEdxUGNtWUF2bGpST0tHb2NiTmdxb0RW?=
 =?utf-8?B?VmVZT254YkEyRFd4NEUrY1NQbi8zZU9SNFVSYW11MTVwQWt4eUR6L3ZBbng3?=
 =?utf-8?B?aGt1TzVSWU5SendPL3g2a3RLTmdFTURDenhMN3ozMDBpeVpQVER6WUFJRGh0?=
 =?utf-8?B?bXV4RWw4aDZZYnUyVnBxTDd3UkVsbHI1TW85RkpNRTFyQ0R6MTNaSnJ5cmhq?=
 =?utf-8?B?em9TZVV6SGNQaDVnRzc2ZGY4WHJJb0lSeDJIVGpsK1Rwem5HdGtBeHdHQlVV?=
 =?utf-8?B?K283Z2FRR0o0UFVGRGNiVTljdUc3QW8vVlF5eWZvbTRjejlCczd5bHM1NWlG?=
 =?utf-8?B?RUxoM1pQbGJ6ZXFraGtXUXhpRUNEZ2FQVzF2dzJaRFBxRTROQzN3UXRKb3Yx?=
 =?utf-8?B?SFBid0ZZZ2pLd1I3RzNIbFVTVy8vR3ZFbFVZYjBBMGNBNWlpRlNWSnU0K3ov?=
 =?utf-8?B?T3lKNU9vZlZRVkF0c2tiV2lmZkxvRVNqWWVSZ2IxdmN0MUE3M0dyZk0rNXVF?=
 =?utf-8?B?Nmt0UkFzWXRGaGd5QUJZaUpBdDZKWjdLRnhqWFhEeUVaaC9EdFJMTlhITXF3?=
 =?utf-8?Q?0WP8gdUir7EbTaYXvYx4G9Sh0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91df8763-1271-4b09-ff0b-08db4c047929
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 18:30:30.1154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZtR0gYdEl88pOkd6SLwCOzRVuWbLEX0zJNkRhOl2LgJVBKjWB2hmWmywX5qk4b3oaHxZekC9/OYkdKLu9wxAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Mukul Joshi <mukul.joshi@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/2/2023 11:51 AM, Hamza Mahfooz wrote:
> As made mention of, in commit 9128e6babf10 ("drm/amdgpu: fix
> amdgpu_irq_put call trace in gmc_v10_0_hw_fini") and commit c094b8923bdd
> ("drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v11_0_hw_fini"). It
> is meaningless to call amdgpu_irq_put() for gmc.ecc_irq. So, remove it
> from gmc_v9_0_hw_fini().
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2522
> Fixes: 3029c855d79f ("drm/amdgpu: Fix desktop freezed after gpu-reset")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 290804a06e05..6ae5cee9b64b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1999,7 +1999,6 @@ static int gmc_v9_0_hw_fini(void *handle)
>   	if (adev->mmhub.funcs->update_power_gating)
>   		adev->mmhub.funcs->update_power_gating(adev, false);
>   
> -	amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
>   	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
>   
>   	return 0;
