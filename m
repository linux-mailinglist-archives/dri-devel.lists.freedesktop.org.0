Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4705E5BA4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 08:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335EF10E2CD;
	Thu, 22 Sep 2022 06:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B028D10E0D1;
 Thu, 22 Sep 2022 06:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8gaaZxH6JQFE3lRl4jTOKSAXBCmIZa/IprLOm72MQb1RcrWJPwMC20k+ZzLPmMoFQWXdtDnNjIPQHqx8oQ++1ofczc6AksWhHDcTd5pvsfMw1oP4ANeUwdgEvdBKuvIoAn9e67uRGcY+3TPleJ3WUc2Ls1MTQKab6C7MNCVYrPbfO9CV7C0bgbRUyMLmWpHBKFpWzutm32k9ayzPCcaOnfccgiyTD6B3M6hRuxnGxdKtIK4QLb7CYA0UlHebbbZHsszIWq0El5Z55iwIzEQXwA6E1if/8PLHsg8d2WNGiUp8AdxgPX/2Vh94wPe5wq74aSxQ6p2IAWYCEHLicOu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MbmXOvFM3SBbp7FQvuiblwO06tOk/PhqmoC7zKcG7s=;
 b=b0vXL/IQjht1+M1OghVmkBdsSMFRk++9l0HlZ5ImRVMAY6qgGyeKtsvcw1GDwIFvOBHoxjiT4Y+tLIbN1/WtaKd4i+0HmWXCGl20sruMHv5iGmXx+mVwfGpNjmBiPh9RSms64EhanGGZ5yHNiwlmaAS0YCWFvb/8DWJSOrR3g0+NJroOQIBsqkqBGveRerSpqEm3XlyprPNMu10CL0UvzAHhlXuZAW5rArcO0I/qefmvQX9VltMl8iEQEpRQjI3biJUW2Shg1ny6MWMHUuaiZGl/wRc0oOEYT/3sTy6rm8QHi/KgOewPQuWuhx3kms7moeVJ79aigbF04Kxf0fa7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MbmXOvFM3SBbp7FQvuiblwO06tOk/PhqmoC7zKcG7s=;
 b=LfYbRAXuBfhT4JXPH8JYU9UyQS3habDOAwlFc9Vj+4eaZO5j038u5qTO/zyPp0eRfnK7qOjvyr8VSusm1CzcByxvygVDFWeRWdSib89IKl4+e3NQv1bP1rNd1NGQN4KGJgZePs9efAiIc3I9GTndYH0UVcKbSt4MOPZtL5S+YIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 06:49:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 06:49:26 +0000
Message-ID: <a103064d-b213-5b8f-2a72-039236777c57@amd.com>
Date: Thu, 22 Sep 2022 08:49:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drivers/amd/pm: check the return value of
 amdgpu_bo_kmap
Content-Language: en-US
To: Li Zhong <floridsleeves@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220922041756.1681845-1-floridsleeves@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220922041756.1681845-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c182c1-3418-4fd1-7393-08da9c669752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghqaGzu7qCDXcb2ABshz0Zl6Wgw3ifwDKjSC9h7jlGMNtcY74WiCfOsc7u+c0O6YDUX+N4MMFKUWADHCM4tSmspeUlSQR4dlGS1ibLtFxjtfM6nc6XGmfpX9vkS8GuLrd0qwk0fb2dgHQ1K2bpULs5/2MxBMB5TdyjtMOrLuilk8zllwJ6Es5Z9nslWFeqBks6tSrvq3UcWC8Z5Zv7BgvzEiMi/WMwcJb5EWMwAOgjxiR3QrkNjPOtXXTnEFASdmSetQkLb5ZgQrQFBrc0fbr9hS2iOz2vTVibvFAWVIyBmlPbRO04ofV/UN1ACH7pxVJA8N1btneoeXDxWPxxD69+VYlXAQoAIQPJEN6TUx7UjLMmUhkC/gLAOGC3zG3TbXQ8jUm1J29WyHyGehZNHOISmBvAdAU98c49815z0FwOLLiUFkt78F3l+Z+Qk1hvKa7dNjBz3aLZQjNYOPlbcrbWY45A77slnxmn3FsBWQiog5AYjMBpHzwivx0yipDuf01NnLA3OugFsL9cCr+Bxe/MyrNodEeZjJkl6TJaTXrF9F8plOAWyr9cNwihpgkOiw+4eJxX03LfBoebUSUD/pk8RssdeScPxTslQqsrgdAu1oNx2kKVyCJE8L41KJ/lFnQ3GRk0SDuv6VaF31Z/USI0E1hltd++HiLWpsw7324Kg8wc3EU8o6Y/tl36QbBAjmFtk9/T6uFD5m0hQnv0OTaBxLKwmvJlJb7MOkVlErYPaKYlYIke2uX+RDKjzXm49UW8Y5q5DJo6aBODIH5f7BdoRRDm0k20CZzycn5o1w+qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199015)(8936002)(6486002)(478600001)(66574015)(2616005)(186003)(6506007)(6666004)(6512007)(2906002)(36756003)(66476007)(5660300002)(66556008)(8676002)(31696002)(41300700001)(4326008)(66946007)(86362001)(83380400001)(316002)(26005)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVyb2NkTG9ZVzZEZGRRZ3gxQkluVktqTmROS2IzeVR1cENKOFR1TGtRai82?=
 =?utf-8?B?dUJaYk9WNktBQ2pJZ0lXYmM1eXJQcTdpVEVuZ0cxSTc2M1lkTkdQQUhoQ2Jw?=
 =?utf-8?B?UlZWMjlnTGJ5MVBaT0F4YnlJRE0rVGRxbHB3Q0t1TkU5akxtaUlLWStWL3M3?=
 =?utf-8?B?dm5TaFF5cFg0Y3ByQm95UVZGeVpOcW9tVlFhUG1uVE9zODArYUdiNTU3ZzNw?=
 =?utf-8?B?QW9BaTYzWU9qMU55ZW1UbzBqUitQaVNWd2NYY3pJSFRRWmovMk1zV1BaVkNz?=
 =?utf-8?B?V2lhdzNkcEpxUkJoVlQzSTRnVk9vQTJvZzVNZ05rcytVWXJmMktGdEt1OEVT?=
 =?utf-8?B?TFpGYzJpc1U4SGNjQ1FWbzVNa3ErL0tNbi84dHFWOElHRE9HUWZ5ZG0yTFJw?=
 =?utf-8?B?dDVGNWhwdTE1L1hQU2FQdnRoU1F1UDhNZW5YZk5QMXVDZDVMYlE3Q1kybDNJ?=
 =?utf-8?B?UURDbnV6cHVYMnNHNXBJTjFNUWd0UmZXZ0tHMzVYUUdtVWtTbGdpRnByL0tL?=
 =?utf-8?B?aC9Ra3R4cEw1cHFWNjBXUWRuaXljMStsV1ZHRjQxREtTeXZyVlo1Q09zTlNI?=
 =?utf-8?B?Y3NMSGNEU1dRZkd2UnR0TFRLbXlBK0JCU0xpNXM4ZWZBalpXdFZMWFMvNGd0?=
 =?utf-8?B?bldDTHZodHJWbTU4ZEFtdktFYVNnTzBMMExiT0NOWm5KSjNPMUtibEprQlJz?=
 =?utf-8?B?QmZnVTQ2OXpOVW82dCtaY2FCdi9Ea0cxMjZDMjNpdXdUaURkLzdxSUdsWWlp?=
 =?utf-8?B?UlRoVUlaUkE5cE1PcEg2eENwNXN5R0NtRElISkkzM2tZYjFSWm5uNWlKclAx?=
 =?utf-8?B?aEJvN3k3WXZ6ckxXS2dsZVRqU2p4WUJrZFY5WnNlV1BCNzRHL3NMNnhHVHMw?=
 =?utf-8?B?MnFjNWNnSkl0elRvSXkzcElZVnphOUd2Zkl2QVBydmsyeEFOdy9UYmxqbHlZ?=
 =?utf-8?B?WWFQZFEybUczQjYvOHBqZHFLUURKMW16OEo5Q0NFZ213WFc4aGlJYVlJVDlM?=
 =?utf-8?B?bW5oNXh5ZUJiaWdBQUJiWW9Ec2NUQlhMcGdWWWhMQkU3cFFPa1FBdFRZUE5j?=
 =?utf-8?B?MEk1MjFDQXNyTGc1dlA0WnV3SWl6aUxFOHR3YTM4dDVKeGxNQjdUMW55bm51?=
 =?utf-8?B?UTdVcDllZWJZZWY5WkhNZlNtMzlON3dLRE1kUGhZV3lyYzBmQy93WC9wc3lR?=
 =?utf-8?B?YW5pMTlyRm9mc0RiWWVMWVgxVEJGbkEwYlVZdUIwMENCSEVTUHE1RVFSRDZ3?=
 =?utf-8?B?cVFYcFZhVEt3KzhhOWZMbXh5c2puNzFsSnF0a3oyM3NtajB4TnpieEZTM0Fo?=
 =?utf-8?B?UExKUFd2TldvKytpeDAxMldYVWt2S0hOenVpWHZRV2RScHViV3ZDK2FLN2Rp?=
 =?utf-8?B?RWUxSWxpVXRWZmRjQkZvcmhycFJJZitxRmEraHBEeVEvQWNaNW51RmtLTmJ1?=
 =?utf-8?B?bTdrS1hINXQ5Qm9pNklGeGhtd2Q3aWgxNllGRHk3NmJXQjlSdjJ5djc0eFlD?=
 =?utf-8?B?Z1pZbDhTdGRQNHZiZmVaekpZL2RsSmo1Sm1mTmV5YkRWTDlEdWR4UithYnZi?=
 =?utf-8?B?VXR4OHhoSXowYjZyWmhjZ2plcFN4Rll2T1RZRk55UlRJenlBdWJYVC8yUG81?=
 =?utf-8?B?VTdWUitMZE5CMmtnU1JtRkNCcXFEQjhmYlNCd3BINGJUaFp3c1RCSEdoekI0?=
 =?utf-8?B?U1NHZStoSG1tY3p6K0lBS3JTVUhkSGpyRWtsU09CTjVYNEJGYTlMTnpEMXZi?=
 =?utf-8?B?Z1Y1NGptMTJCbEdTYUZEYm1VL1I1SGV0STJiNDB4K2VQZkVxbW5XaEMySVR2?=
 =?utf-8?B?K1N2bUFiazdTYnhhR21BNGZmMlhOMkJEYjNmZXNqZERUNEo1KytkcXFhMHV2?=
 =?utf-8?B?Qy9XRjFTY3J3NDNmNkwwMld6bDdnczFEakxGR1hwLzVpZEJ2VDhLOEdOLzV1?=
 =?utf-8?B?enVxQ0JDNm5SMllFRVBBRllSc0UzUys0bEZpSzFXRDJ2bldYL1ZqcCt6UXEv?=
 =?utf-8?B?OXNZdW83bjNlMVNrZjZtbDUzMDNtWHdGOVlybDN3WndUYlRES1Y3YUhPbUhR?=
 =?utf-8?B?R2xxU2RvUmZGT28rRFdVMEo5RnA1VkNZZ1RRM3BodGd0bFF5UWxmejNxNnJZ?=
 =?utf-8?Q?qW4G7EHGSl5R9/cLR+mc1qMaH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c182c1-3418-4fd1-7393-08da9c669752
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 06:49:26.8206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tgZ+L2bAlmjGGEh/T+bT5ut3jj+OfFATDy5TU7UaWMVke1/wPCSiJ1+zpZpDVr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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
Cc: jiapeng.chong@linux.alibaba.com, Xinhui.Pan@amd.com, guchun.chen@amd.com,
 airlied@linux.ie, lijo.lazar@amd.com, mario.limonciello@amd.com,
 darren.powell@amd.com, alexander.deucher@amd.com, evan.quan@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.09.22 um 06:17 schrieb Li Zhong:
> amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
> error check and propagate the error.
>
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>

We usually use "r" as return and error variables, but that's just a nit.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> index 1eb4e613b27a..ec055858eb95 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
>   {
>   	struct pp_hwmgr *hwmgr = handle;
>   	struct amdgpu_device *adev = hwmgr->adev;
> +	int err;
>   
>   	if (!addr || !size)
>   		return -EINVAL;
> @@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
>   	*addr = NULL;
>   	*size = 0;
>   	if (adev->pm.smu_prv_buffer) {
> -		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +		err = amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +		if (err)
> +			return err;
>   		*size = adev->pm.smu_prv_buffer_size;
>   	}
>   

