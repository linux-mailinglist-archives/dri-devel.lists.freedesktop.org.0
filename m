Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E19782ACD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473410E263;
	Mon, 21 Aug 2023 13:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BB610E261;
 Mon, 21 Aug 2023 13:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0A1nWjCyRmvd3QTDBb57FOFvdg+AcOsrS825WMdZew2pYf9ygQdi/bPCmjnnlNkfW/CKZEJDc7BIuoiWZU5NM0Cy85LjRei9EcqYraT2fJ0JSZNbHwb2zxSAhCmw3Wof7EczjjiZ7DMX8CRizMQv1YfKTsbS6rddRrYjArdJm5s4Pg7mN1IrsNk4K1MeQ88mwTu+2HPksdR9Zx1JpH3k7I5ZnNcLJyMjndHbpuWPxG6+ca8YY4pXe1DLURfVC1CUlnT5ffaoAPdBZpZNQX15KwC9hldZdQZmvGU4zlpJkvA7pl9YUJ3H1H2pzRTz6Zj98TIcRTdEfDQNkJ57QaG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QBEoG0oQ2T8x/bVJ+MQL1iB0yEq87PCIURvhmOMtGA=;
 b=D+stqmD2/NLz6doBXfvgPPYPk/yVr6xqJe+6k+gfWDUqoUPSPZz1UUdnD61KJ5Aah5hjyZW6BwtBwmAyw7IzSAvxRogGaXwHOs5+HmG8Ek8VfFqOAbilRGXEBkEa+lIt2urQiRGs8TemsHlcZy8LFDoMTis7UhyrgB6ki7X03dzZoqnkc5FVvGsopcHLpNHIcPa7hVVIN2Xy5GIBXZFE4GE6TWY3cjBqv2bVTp2Cme0hBuiCENk8PfDINLSt9KRtvezxtoM9o50skApjhWv9uh4MUX/1MT8afLG+YuxpKXpX1gmgskOmbmquan2dzO5g0X4yRABEruIWOWBKFDcXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QBEoG0oQ2T8x/bVJ+MQL1iB0yEq87PCIURvhmOMtGA=;
 b=KwEMmzLYKDrX1OxRgjMFN+l055WpGrec8Ca/MIl0lSs8vbbrVV2ghejFGE9H//oRHfK23wi0ZCo10c3xdQbn+gSDEk8J+Fd3wGxB+k6IBFAB6f2rS4+ddMq1DqzwIwO3antWzGvPoUGIuUcp39Ls/DnPc4D0vzkJPHsx9oXy0iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:47:45 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:47:45 +0000
Message-ID: <6c7bb6f9-ccf4-a763-044f-b795877246aa@amd.com>
Date: Mon, 21 Aug 2023 15:47:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/7] drm/amdgpu: switch workload context to/from compute
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-7-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-7-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0477.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::22) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d2990b-943e-47e6-9393-08dba24d32af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSLKmO7/J7AtoNICWe4Oju27SjyJy7lyXP7LoPak3TCS9rx6zsj1+IF32JVgl4dhUwHZq1wP07gzMD6+18I9HiHfSSFq8V7aa5TtYWNaBuEkbV/1s6M1TKocbmrZdBPD4YFkRuWB1hZblvVU8oAW0J3nQdgTh3vjHMwEUeqZYpbBbL90IfB3wHE3861ys4coo5w0+C7B533iH3jGW+F+tdheMB2D3szlM1c5weiqlzpbf+GmorIzvMNU4cHxfElOqoXgxY/BnAmllPXMX2B+vYdXwQLWV2M5V+nF1nzUY/EMlM5OuZ87iJIUOoPJalYigDEv8s7fESgmOUjjdDZJBOXVGQ9Q8azkF7kUCIzciBsnJHgdbj2xXKpICpkxVy6dXIczWtr+XxqYpuYhWuxW24QQ7yweGYCE8+1qyFCk8kMALAEPQ89xZ4bACJZOtSadsnJ2Vb3C1kuXiKIADjlVcCpffc/cfnjb2WX8Yj+Y4/KO213dFLa1wqyFdLMZxpsZA0ody9CFV0QFt7UuTIV4BiHnwCKgrJGF4et0UwaP5PK4nYRj0bJoUhQV8QU7ubtUZjjLCdplR0IUBQV0ezkL00kigZtkfwcJ9U3H8iwEyZk2153ddpmF/g86QlBmExCdUucYdZzWlKuO7aqwB/2nBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(66556008)(66946007)(66476007)(316002)(6512007)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(2906002)(83380400001)(86362001)(31696002)(31686004)(44832011)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU03QytSUXBCaW9UV1BLMkNmNlA2aGJmOTNpQkRXeW1xR2s3bnkrdFlrN2sz?=
 =?utf-8?B?S0llUUQ3R0RjTHJTa1NzbDhYVmNvTUFIQ2dIenhmdU5mQkRZNEM4c29yMW9B?=
 =?utf-8?B?dUxEZFJrbEFNak05VVhUT0RoYXVBcmxKdGVUNVZBYTB6RlNEWDY2OHpoUEh5?=
 =?utf-8?B?V1dYRXNRd1Jqd0hTMVJNUVg3WDBkVlQraEppK2JKc3BYRWgwamp0cHZnRkV3?=
 =?utf-8?B?WjFoTyt0Vy9Db3M1VVZIQThvV0o5Q0JRMUd4N1prUXNFVk4ydjRORmFrRWxr?=
 =?utf-8?B?dGVZQTBWTVA0UmhiNXNYUWlaVmdENjF4WnJZRmdOVTJDWnNxejcrQTA3OGEw?=
 =?utf-8?B?bmNOSTcrYXc5cjZEa1BWazU1eHluSXRqNFdvbHpvT0wvQmIrdjRUVHJBMm5j?=
 =?utf-8?B?QUYwRSt3blpNdThtRUFwbDl0bkdCZys4NFhubTdnYk9BS2tnRjd4NXZ2RGVo?=
 =?utf-8?B?MVFnb1h0Y3hIcFNFajVpMEZzaDE1TENwR1VNZ0hpcWdXN3h5YlFYaUxRcnBw?=
 =?utf-8?B?WW1yUVBFVGZQMlR4QmZad2RkRklDZlJvdFI2UlpOMG55YjY3SXhMZHNtcml6?=
 =?utf-8?B?VEpyaDl6dlRhenUxZStDdllOaEtQWVZhdDhQMGpJczRDbFJLVzAvb0wzNjRB?=
 =?utf-8?B?SlJrd0g1Q1VYMU15NkRldStVeXlXKzdXTDNiRWl2ZkQzTTZvRllHREVnRHJK?=
 =?utf-8?B?VlJMaUNOTk9wTWVKSWM1MmRaZ1ZlNk04disrQk5CYWF1aS9XNkJmVFZxVG0r?=
 =?utf-8?B?aS80Z04vWkxjcVNiUXZONWFxVkR4bTFUY01ycHhwenplMXBldll5a3B0UmlD?=
 =?utf-8?B?M3IwYnJwZnRiWEhHbmRVS0tlb3R3b2diVVBLbUxjYVJNbHlBcFNTSVZqc3Y5?=
 =?utf-8?B?YzJFdCtDM1dWYUptdENuV2NNckxPMVFJSHh3NXNPVmI4V0VTazRKYWg3ZE5K?=
 =?utf-8?B?NDFJUll2SHc1ZzlCb09rSWxPU0c3VFIyeEppZjZQMG8zeUMyMllKUFZtbnRW?=
 =?utf-8?B?M3lLa1RjRXJSK3NlWXk3Um1jb1hVNm90VmxjYXAzY0JYcnpUWFJJNlBHZ2pK?=
 =?utf-8?B?ODlXaXVOLzJKcmdnOFByOVhxV0xTUGZGWXROK2tXejk0QmZta3VJcEVlMkRE?=
 =?utf-8?B?d1FlcVNVc3FIZWdlTVVtVlhxZ0lBd3RVZnN4VHEreFBIZWJtNmtNODJnZzJ3?=
 =?utf-8?B?UVlrcTR3a3crVWxkUGU5WGdSUHdUWFVtbHVXWjczMTNVZDUvK29DNnZDeWNI?=
 =?utf-8?B?TUlWdldIR2tQNjRiRjN5S1dKVWFKVG04dXMrZmtsY0dFQXErNkluSGNUWXJ4?=
 =?utf-8?B?UWZqdXhIdFBkZ1lzQWtxMTI5YXU3ZHFBNXZycnBsMVl2MnYwTUl4dkoyd1ZS?=
 =?utf-8?B?N3ZkY05laHNlOVlKRkNZMTg3WVBzV1Zha1NkV21Bc0lBeXhlU0dwc0liRFRk?=
 =?utf-8?B?a1UveTI3bmJjSHhYcDFEMlZVb2NsUG5Hbk4rMTQ5UWgwRzNJRTNVT1pkL2l5?=
 =?utf-8?B?Y25naC9KZDYxMWd1akd3RzEyWVpDS1RJd3NCY2xoTHJqeHZEMnU1cVo5Q25G?=
 =?utf-8?B?Y0JUdExtbGhFODQrQXhISjB2QUhuaS9BWkloU24xSk1qZTkzWXFuclRHbFZK?=
 =?utf-8?B?Q1JDdU9JUUhteFBXVjNRZnJiUWErQkFIS1lhMXRBWFNHbWpFemNrYXNUMkNa?=
 =?utf-8?B?WGFNT2Y2U0RKVi9ndlJRYUNmczc1ekNsK1Riekx6dldpakg1U0x5dXZGS0ky?=
 =?utf-8?B?VDU1Nm04dWprTHhQaDRIc2srSEhhUnE3N3JMYjIrRG00T3RCZElzVDM5SnA2?=
 =?utf-8?B?QnZmbm5LV0VYRnVpTGlnNUFUdDdBMHhZYklnMXUrd0Qzd25zZjlmdDZWYnpC?=
 =?utf-8?B?MUI5a1ZwbUpTZ3d3UGNiM3IxK3FLNTlyZExxbmU4ZlE4dHFnM255Wm9lbFU2?=
 =?utf-8?B?TEVTWXlFVHVRMjVpRGtMbHgzaWNIU1ZlWEg5RVlzbktsWG83b2E4MVRvdTlz?=
 =?utf-8?B?L3FET01VYVU3V21mWFhYbEVrODVUMk85OFJLMGRRL1A3bWhibG9GR0Z6VXRL?=
 =?utf-8?B?NUlqaW1DeU5UUVpMQkIwT283UHgxdHdWdFVxcEN5N2IvRXJoV0lQbzhOL0Ry?=
 =?utf-8?Q?RjhwgrVkzqpw7kaodlSuOf9Y9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d2990b-943e-47e6-9393-08dba24d32af
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:47:45.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D77e3SHSGp3PX9uMsTmbiMQ8Ges1eLQoTi5DOnhk/9r/9rRnLEkeScRvVpJpKto6SSNiadtMJ9JYf5kOsK7Dlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/08/2023 08:47, Arvind Yadav wrote:
> This patch switches the GPU workload mode to/from
> compute mode, while submitting compute workload.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 0385f7f69278..1d6a41f8d24e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -713,9 +713,11 @@ void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle)
>   		pr_debug("GFXOFF is %s\n", idle ? "enabled" : "disabled");
>   		amdgpu_gfx_off_ctrl(adev, idle);
>   	}
> -	amdgpu_dpm_switch_power_profile(adev,
> -					PP_SMC_POWER_PROFILE_COMPUTE,
> -					!idle);
> +
> +	if (idle)
> +		amdgpu_workload_profile_put(adev, AMDGPU_RING_TYPE_COMPUTE);
> +	else
> +		amdgpu_workload_profile_set(adev, AMDGPU_RING_TYPE_COMPUTE);
>   }
Please feel free to use:

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank

>   
>   bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid)
