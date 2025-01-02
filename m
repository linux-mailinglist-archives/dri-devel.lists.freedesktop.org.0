Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407E9FFA42
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 15:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C537510E709;
	Thu,  2 Jan 2025 14:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lTML897h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DBA10E30A;
 Thu,  2 Jan 2025 14:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFpthS2DllDWUFltPqk4QM6zHm43eub3TgJuhkBniY47qbzXl+iGfpwlbLPXoRZRG8ss1DPnAjVrRBConuPJGkbLTDm57LMrU547Y2Tix9AQNaLudSTT/ajcvW5e634ocZBkjNWfKZuXZussoOtktUMbvSRHjTcwvaLSqAdCGSEAp6qMfUrb44mqsVzJ4lZQ/CmfhA1k5LaSBq/9YI3MKiVCjRKMBipe7Oy0/1YVlwNqtO4dzNEoL14HHPyE1vtQqV6XpCojn7NX7zt6acEv3ve2eNVrpLnqwHxDacpRCy1DicdITnmxIcrt0fYmLSpQvErqgDhEI324LpqnppdLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BziGl1j9qbSYT3lGK8ciA85QrZyj/87ZhPIpDI9A6FA=;
 b=MnlTNEmmnzH9i5HhcRhqWnTv2t1nkNXRwq/0uVFDFYwb3ZjZAY1KXT/LzZddwYbOKsA3hzjZInlnkimVTw82THww/dZVNsx/wP/BLQ2UCSTpbbFvRzdpLZxOISKW27u8rC2V7OmvotxFJoEpQgtOl4DQJP6MofTekgPtt7kD7K7clsdYEb+X2tfqJpYFHKAX8NplHm8DmleLe28MBsqb3gKMhAKCiGvKRia0WUxeykyQXKxf35nl0QBvPogn8UbBiePk/OKeypvAIHkwayHSnK/7Gc1Hc2Op/n4csK83wjPcgEGX6w6Zt0MXMk8dqrx8nIUDjNt+9fes5oM0s7k/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BziGl1j9qbSYT3lGK8ciA85QrZyj/87ZhPIpDI9A6FA=;
 b=lTML897hKOtIabt449rYaJzVncGdUJyLTAnvqvm3lkasLHQDHolX8omwzcIUl6XLq5CF6bfj5kzcnxMo9Uad04QgCKXdf8uURzQF2zK2jtzjtHoAIccclN6au31zc5dHDLr7LeisDhgnptjFnNQaEOTyV2lM+GF4qpUiP490E9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 14:12:20 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%2]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 14:12:20 +0000
Message-ID: <3c9bd4c3-80cb-4c9f-9658-64283789599c@amd.com>
Date: Thu, 2 Jan 2025 15:12:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Add null pointer check before task_info get
 and put
To: Lu Yao <yaolu@kylinos.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: felix.kuehling@amd.com, tvrtko.ursulin@igalia.com, zhenguo.yin@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250101015830.63570-1-yaolu@kylinos.cn>
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <20250101015830.63570-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 73aaea28-7fef-4d45-4f9a-08dd2b37788e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEVOVXZmaEYzeGVoR1oxM0cwSEVVZzc3VVdPeDF6ZVRnNWx4aitzTkxtaEJs?=
 =?utf-8?B?RTc5aEhVanFOZnJyaGpqamhYRjJTM2RpRzdRSWc2YWw0ckIrMU1jbTh2RFNr?=
 =?utf-8?B?NW95cDZ3RmI2UGdKeml6MzllUHFYSUY1ZU9sa2NWMzQ2d09DVk9rVFpaUHUv?=
 =?utf-8?B?T28raHYwTHJOa2trSVlmelF4OEkrZ1ZyOHdFM0lTeSsxK3F2NGZCTWxETjFo?=
 =?utf-8?B?YjA4N2tXZk4vU1FXMXlUWjhUYm5tT2lGQlJKcmhKYzBoRE1jdUljRndzTDV0?=
 =?utf-8?B?YkZZYkh1R0cxd2YzU2x5RmhPQkloc3VhS05GZnBmc1BmeE5HZzZLR1QyczlI?=
 =?utf-8?B?RzR1TVVFWWlSNHdFUzBSdGhFOVdMK0JWQW16dllLM3B3Mk5FS1grSStlMXRR?=
 =?utf-8?B?dGFFN2dlSUgzZllnRkNJUnlvcGhyZGZNTjhDSXBXZkdGVXBubDcyY3JLa2U4?=
 =?utf-8?B?b0dEa2lSdzRwS3loRkFEQ3lleU1ZcWJsWXhjT254dmgvWm02ajFtQUU1Vms2?=
 =?utf-8?B?M21ENHYyUVBjKzlPQjl0RkZXakx2eFhXSnFyZ0pRKzg3SUxIRDJYV0ZieDJW?=
 =?utf-8?B?TG43NTcrajJnNG1QVmxvTEc1SmE5dWhKM0hMRjhYbk15SmMxUk0wWTZsWnZn?=
 =?utf-8?B?NzdBbGNPVnN5TkpYNnAvWEZTcld1bCtrZUc5Q2ZCSjRVdkdFcUNpcW1zeitw?=
 =?utf-8?B?RTZJWHpPVTE4L3EwZGRLRHhEOWk2c0JzekVVUkN0S29lN0NuVS8wSDVhc3dM?=
 =?utf-8?B?WGFiWUN1WXhWbjgwYitvYTdLWXpaaHV5ZWFLTlRmNGx1Yi9mTm9RWHFwcDhX?=
 =?utf-8?B?eXBGTHUxWHpBTjN6SjNkQ2ZneGpiY3VoNFZCRVM5aWtGZlhQVmJJRzhNUU5v?=
 =?utf-8?B?MHhycERIR0MxRkszT3BwazRhcWlKREZCSmhZaXdSTmNxejk2Tlpsd0c4RzJU?=
 =?utf-8?B?dFNzZW1GTGloNUVsL0RrS2s5aFJlZkwrZlBFakFMdmtVYm9wQUdOQlc5U2pN?=
 =?utf-8?B?UnZBd0U2VmxSbmlCTThnNVE2TUN6eVVpdFloVFZmeDBXcEJ0cWtzU3N4bkRL?=
 =?utf-8?B?bnZSU2l4S0VONkJ3aEpqUGFHNTdPQ1AzYnNpbFBHYlhPN3hnNW5pbzR3V3dY?=
 =?utf-8?B?ZzFjSmRPVndtaTF2a3FVekNJcmNaeTYyVkVwNXlwQzFLZXBaTk5LV3I4ZW0y?=
 =?utf-8?B?dThQOWpMbGo3anNEb09kVm10SWNYNEpEd016WGRncHJCYk5Bdk1YUlVUWGZr?=
 =?utf-8?B?cTdvcVBrNHZiNlQ4Z3ZIZFc4Y0hlTzV6NFh5TmY2M0Z2NGNUWmlTc1lCV2Fx?=
 =?utf-8?B?RGhHTjNTMUZwQ1hXa1ZUV01MNFZubWV4TmJZWjdEeTBVZFNGVDRqTjFGbHBF?=
 =?utf-8?B?M0pHQ3dEbWlUek01eGxOeFdLeEJ5dUM4N0d4VFcwZzlaOWcxN1hsZkIyRGsy?=
 =?utf-8?B?MFZFY2VmYVVyZUlHelJBRUtsQ0hmVS8yVytiN1JxRGRFVWVheXNrTGtqcHpy?=
 =?utf-8?B?em9ub2cxZmhDcWVSdnJZK2h0RlBoeFlONzhHaFhkYUJaY3lpNE5UTHdqc0ov?=
 =?utf-8?B?NWRjL21ndm9RYzFMSU5VNFpOU0Z5S2xEY01pQ0gxN2xSN2d1cm9OLzRUNzFT?=
 =?utf-8?B?ak9yTlBYV0F6UTJhTEVKOEhUcms4TVBiY1FJWGZ6VHdxcldqazJDWlB6amFL?=
 =?utf-8?B?VENoeXVBdWNQaE11Q0RnZWFBU083MXMzSS9WNUozenhoek9nOVc2YTJHeXhO?=
 =?utf-8?B?ZGNGbEp1d3B1UEkxN2RlOFlSVlRFL2U0azBOV1FJdGRWU1Y1dFE3alk1RTls?=
 =?utf-8?B?eWVqNmtVRU5wWXY3VHV6Vi9tOEx1ZnZzNzFabGpKdXBXWHNlaFN2VjB3K21Y?=
 =?utf-8?Q?igwplNVHmwnxA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdGaHBNTkNtOE9YOGp4T1VhdlRTMGlzZjBNNktPUTh6UmRRY0lENzJkUkty?=
 =?utf-8?B?OXcvWDZReWlXMUE2OGVadFRJdFAyYTdOUTFRbGgrSFhGbTBsUURUd3Q5K0Nr?=
 =?utf-8?B?Y3hTOUZOeC9pZ203elIwZXlxQkgxRlJHK29pWXJWMUoyT1JyOGJxTTVuTS9H?=
 =?utf-8?B?a09LR1VqdExoSXBqYVUrSXRMa09WRG5ZU2tFR2dmbmd4M3VqOWxvWmNyK20w?=
 =?utf-8?B?T3h1RDZ0YWUxbVA4bUpxblgvTnRhbGk2dWd6aUJQZHM2VlZRSzBkVkxNWEsw?=
 =?utf-8?B?K2syUmF2MzZuc1diMVp1WnRxbWxmek5VQlJHejlFQ0ZDMjFuTHh0aXYyYVVS?=
 =?utf-8?B?YUtkZXBydnhDanhGbGNkMVdBKzBhTDFmek5MVVBiekFqREwrUTlVMlNLdDIx?=
 =?utf-8?B?MG02STBSMU5qSXpNRTlid0l0aWQwaUJkM3J4UXZuMEM2c0RTV2F1SmJSUHpG?=
 =?utf-8?B?Wk5sOU8zeExpN09zdHdmWFcrTDFqSE4zZHhpQXRQaTRvbjNUK2lSSmhXbTlo?=
 =?utf-8?B?QnZ4Y3RXWGhoTkZUL050ZStIK29aUmpuMXVlNEhNdkZqWnVocVlVU1Z4Z1R5?=
 =?utf-8?B?bWdyeEc5U2ZWNlpjcjRod2tTLzlxdU0zTnZ2QTJ6T2Q2Rkl6dHVad1E1UzVS?=
 =?utf-8?B?SDBrS3B0WGVkSmtjWmV1SXZ6R3ViRTkyMnowbk9xVlNaOERtTDB6YXNja25R?=
 =?utf-8?B?SUcrOElKQlpnbm9nc2xvbVRlWkZ2d2lNeks5WkdET2ZpMjc1eWRyVVhjaXFQ?=
 =?utf-8?B?azBBaEVwajdnK3FONzluUWxMd0h0dk1MaFk5UEJrS2pxTFdZK3c1dVpRWGpp?=
 =?utf-8?B?Umw4REp5V2RtdWlmODBhYXk3OXBmZzUxUHZEeEZRNjY4dWwycFM4RStVdlQz?=
 =?utf-8?B?SDZveVVtUHFCRDJYTk1mY2J0ZlN4OEM1MG5kVklHby83MHZDcVV4SEl0T1lp?=
 =?utf-8?B?eE8vZVlSN245V2JQQUhxcmQreDRueDFYY0tlQmNjcWZIaDVSeDZZS3RibXpY?=
 =?utf-8?B?cFowZzlaQmpVQUFZOTRaTDI3WFgrYnVTelpLRjdjVjVBaGZBOFdDVTlkcXdy?=
 =?utf-8?B?Q3ZPNXkzSVdOcS9mMTRiR2NlSllVSmlPVDVUKzhwbFZWOVFKaFdMTHJNS005?=
 =?utf-8?B?VGRQclVBcFViUkdyTW9zeU5wSUNISnRKVXA3Y2Q4anBILzVmWjRLYnpTWW85?=
 =?utf-8?B?S0NSOE9mNHdOTFpuNnFrcGZkdUxJYlJFbTJYMkJmMkZVcDlPZjVyR2RXY3hj?=
 =?utf-8?B?TFAzdnFYcmJYWXV4WGltSHZJKzRMRE5IakZIeWR1eTdUMEZKajVlV05CYkk0?=
 =?utf-8?B?ZVBJQ0lXZ1VqL1Z6QllTK0NsL0dpMmFJMWZrYzlOUGxzQnFkb2kvUFgwN1dQ?=
 =?utf-8?B?ci9WdDJHbHhBLzJxVjhCUjBaNmduWkl6RVBxUVdWQjRINzVraGtRQVFyNWF4?=
 =?utf-8?B?WVhWS1RwcG5lTzlXbmVDWTV4S2RNeXQweG5kZVRoT3lxYzNxTG15aUI4UDd5?=
 =?utf-8?B?UGQ1ajA4NjFhR2F1Q0Nyd3JNMzJ6TEFuL3lZM1BlZVkzT3F0NEVJQ2YwTFFt?=
 =?utf-8?B?NWpHQzhLYUM5bEc0S0I1b00vc0M4d1VGRFhwdFl2UmUxZ2dFUUtHL1BmUUpr?=
 =?utf-8?B?SjFQQnl2eFVZUTlKcVJObFpVTmdTbDRMdWZuUFBQREtPeGhzRGJqTHdhUFFy?=
 =?utf-8?B?Z1lpQ0J5UmtPOHRrems5Qk9iaGZUY3Bndnlydit2ZURESUtHd1BnS2NBVGdz?=
 =?utf-8?B?cGtSQkcrSmNjUEdEVndBc2NReWFET1JCRUkwdkMybTR1SFdVWXRLTzU4NjRE?=
 =?utf-8?B?TWRGN1lNWTVtS1Z1VUZ0ZFVTV0RKUnVJM3hSbEVzSkw5NDNLdmZqMmFYTlla?=
 =?utf-8?B?RDlqNnhidnM4ejVyVzgzOHlOcUoyeUx6WnFLNGMxV1BoZEg0QW9uR3lJVHhD?=
 =?utf-8?B?cTFvRFhKd1RwbEc4RkZ4eEpON0ozaUQ5dEw0R1NDVmFEMTE3bnRQZlZtaEQ1?=
 =?utf-8?B?N01COHVNTTlBeFJyM1JmQ1lBbjQybmgzWkltWnVnVDNEb1BEMnBXUlNVY1ZF?=
 =?utf-8?B?T2szMi9wdGZERkFtOExESDA1T0RHZGQ0WFY0a3dTMXRKUUlUb0Z2a2hPaElT?=
 =?utf-8?Q?KogBDpPpMYhz2sMOo1MqKdNq9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73aaea28-7fef-4d45-4f9a-08dd2b37788e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 14:12:20.4950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyOPsLyvSuw1/+g7wycS+1pOQp2sbt9RticdWf0AvhR1inY17SugB5eDJKJlPL6gRb3p2IgtJ9SizIHEE6exHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
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

Lgtm, Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>


Regards

Shashank

On 01/01/2025 02:58, Lu Yao wrote:
> This patch add null pointer check for amdgpu_vm_put_task_info and
> amdgpu_vm_get_task_info_vm, because there is only a warning if create
> task_info failed in amdgpu_vm_init.
>
> Fixes: b8f67b9ddf4f ("drm/amdgpu: change vm->task_info handling")
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index c9c48b782ec1..65edd74bd944 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2336,7 +2336,8 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
>    */
>   void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
>   {
> -	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
> +	if (task_info)
> +		kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
>   }
>   
>   /**
> @@ -2352,7 +2353,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>   {
>   	struct amdgpu_task_info *ti = NULL;
>   
> -	if (vm) {
> +	if (vm && vm->task_info) {
>   		ti = vm->task_info;
>   		kref_get(&vm->task_info->refcount);
>   	}
