Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C867AD03E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 08:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D177510E0FC;
	Mon, 25 Sep 2023 06:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170A410E0FC;
 Mon, 25 Sep 2023 06:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUDUqNxxyBRa+MHxR6y/mCwl04o7nSP+xb/NF5wbMtEgSqcMi3lKTzB5CuYnH7bYvrM4RQy8lh+eDPLGlu6mPsOgF1FnFqFW42mopCThDd9QjMEPc5jQHZ+P3q+tZ1PsWd1XE2JW9ZbKAE0gndUVCDgq+18SLlJX6eJk493gAmWhP7cAlYPtWP88Ak+9gEQBi9wjUTc2LvAFSZE/TCGGbCiBq+ylEnCMir4cK7agcMNUAXuBDT1ygmfruhMkGIl0bjUyd9GlPH9fFEf/eEm7OVSOUCwtKdStP7ahCBF8Y/PCaVArcK0rbuoIPCTx+/k/Yk9Ql/8r7+ZBEOjPPcjWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gCRxrcAdFjNsy6RX6PqLCJtXDEmXoIXpTpedfVBZ4E=;
 b=M1gc8qJvtAvsRC5b+Dwn4bA8erFH7jLDOIQe143upbFv1M7OKbOXIHsNlOXXu2R9wghprft5z7s/UEXyWbFtBCqTyJqt/rB/0tFSZROvfepCYsB/JpQWHbQZUGxhVtKF9ZoRzR7Q62M9C7jBFPylDyK9OjRn2P+HgZEQi8/YbuMm63qDfsqVLOU1mYdC9S0WeQlT2SmGl7fqGXXSkmlb9YQBHNS6V12GAlEB2rKyQtTAfGpxHQ8UwpJZmCibCfBPCyUN8Z84LF3JHehi2E4Ab2j+rpInImLSANgJu2dCKh22aeq3ht85bZT731qKuYjbiAkFoSLV5YmaNtqcKE9nEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gCRxrcAdFjNsy6RX6PqLCJtXDEmXoIXpTpedfVBZ4E=;
 b=K+fcI92Qyrs3NRTLTAjqs5gNenkeZ7CRebfDOPxv+dBcdBq7vR1WfR69hV7gz2v6uACkmGzHO+CSMfpBCUzIXSIzITWrLVoIXsSMUK7dHujf+ifDXidnkJNWXd/eldjP98Rue5MnyvOBWuEVAQbDaU4lMsZ2kLQjpl0Ywsl8x+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Mon, 25 Sep
 2023 06:35:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:35:47 +0000
Message-ID: <c3124377-a045-6458-fc10-f0096fa736e4@amd.com>
Date: Mon, 25 Sep 2023 08:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/amd: Fix the size of a buffer in
 amdgpu_vcn_idle_work_handler()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <d8a9cda0c4c391458ddd63d1be88f2a757f6a5d0.1695410820.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d8a9cda0c4c391458ddd63d1be88f2a757f6a5d0.1695410820.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 155c0234-25c2-48a6-277e-08dbbd91a6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CuZ6XQr171wbeN6c8PudiphJECEvkXZTKBsGwFewZEZPnK/PDTfGbPNmjhZKhMHi3+scppXgRtSEgFO0QW7H11YGc7Cjgq2KIdd1arZRnQodMPtXNm52F92LEDlqBX6/fw8LLFepGBMXMwnWntseEDOgHaEoOx17q4tzRDYkAoUKP7hyCNO5SOQ4d3Ar0U8N/hL1r/jUw/MfCqvBVp6p7N4kPEGmxuJLr/bQuyQUXTKHHFyI8p9HzfpJR9cB6Y4kE8CGShPT7p8W7dmTYZiPjXzdI3H1D7QHLya/501/JaGC3v1OHeVF+2JMTpsYBzNEh4JHD+/kexjEV9qafzrOCbcLRr5/XLLuaTazUb1qVjRd3sBf/YlHkZgNBHfJoHnTG+5117FSrIPQKbYApmiOlPSZSsmFSbTh7M+iZvWm+r/WD0RMuOdicb8RG+r6axfn+uHP6y3u5/n9TOg4knOs06v4AS5JTcHOV7059RgLrS+p1faeFzk4TNDUy3XlOlHm9RjvvKixqV52vayMceuwWvqJTf9uxskxlWoR5fJjXUabG2MTVZtOBEKtQXpk88k4si7S3VYYUhjx3GpX94SZiSzrSEgm5U2wP4oN5BnvICIJoWi1VGKYUKtC0LLAk4aImy9SOrIwjZQD0IsOvONomg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(316002)(5660300002)(6636002)(4326008)(6666004)(31686004)(66556008)(6506007)(66476007)(6512007)(6486002)(41300700001)(8936002)(8676002)(2906002)(66946007)(110136005)(478600001)(31696002)(86362001)(83380400001)(2616005)(36756003)(38100700002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFUUWFhSWFmV1hiUXlMQVhuRmNiT2c5QW8rMytySFZveDYzLzVvT29TQk5n?=
 =?utf-8?B?T2lrRE01WklJV2Qzb3BnamlXenhLRFVXM3owbjZHYzBzMVJ1SnZSQk1SMUFm?=
 =?utf-8?B?YzVxWHhTYTZMelJrRVo1UHQxRnR5N3VQL3VYU1paem1kbFdKNDlMQUtxTkJR?=
 =?utf-8?B?c0ZJb3htUDF2TTJ0cDBoU2twQm1Cek5rOTlqWlY2Sk1WZ2oxWUFLWDIxMWYw?=
 =?utf-8?B?VitYeTV3UDJ3bTl1Wjd5TU9sSDJtbll1dmFObElGM0tQa2U4cmRHbk5QSDQv?=
 =?utf-8?B?RGlaVm9zdFZFK0sveStLOEhySHVySkpBeHVYMGNQNWQzZ1dnWGxVYkU1Y0o4?=
 =?utf-8?B?bEJjd0RETnNVMThBTWR4WEhOR3RMQ0U0TFRoV3JIWmZzTlZ4eC9uMzV1VzZZ?=
 =?utf-8?B?cHVtSHhybFF5MzZ6dHN5dkRadEIzWmMxNWNpRVJmUWdSamg2S0xETE4xWmNk?=
 =?utf-8?B?dStaZHY5bVdWQmJDUkVJSklqeGp0TExIbU5BeFJhbU9qTlhObWVmbUVnV2sx?=
 =?utf-8?B?allQWVFjcmZXSmZpWDNLUUVGQkY2RllDeWNuckN2UzJOZlRSTTlsNHgvTi9i?=
 =?utf-8?B?SzVTbGd2RzJVMEtRcFVkRmFWbXo2K3lKVklwSGNxU1pxRGVQMkVXN2IzWnpR?=
 =?utf-8?B?UE4yRjNFZ1JjMEJEVDEva3I0K01jWEx1SVlYakZSaGVBVzNnWDJpVzFQTVNB?=
 =?utf-8?B?NHJpTFMxZ0dwRVFYYW9KczlaMWlKV2xmLzZKSzlWNTlzVit3cnhSZXNrRjRR?=
 =?utf-8?B?dW1oa1hzWXJkWmdwMjV3bWdNUHI5TDJjd1p1SXdpdk5uZ1U1LzZ6N0xMTmtU?=
 =?utf-8?B?M3JvZGppTU5DdXhqUVZ0NTFsMndTTERlUWhTcnBrUWtNY2Z5SW5JTEdLcTdS?=
 =?utf-8?B?ZkM2N2VLLzU1WmVwQjlEczhQdlNORlRTank0MWk4VFFJR3NyTHNZRkdPRjFx?=
 =?utf-8?B?V0VLT0RvT2NMbEhDcWdNbXdOS21CQVBjbzJtVGVBUTdhdnJVb2xkM005VzBR?=
 =?utf-8?B?VTl3LzF4M0k2eWpFV244cmFsZkdtL05LYVZpNlVmTEREeG82WkNVM2VDbEFN?=
 =?utf-8?B?N1FHTzQvMzVPa1o3dUkzcElSYXo3TncreVlmdmpOMkV4K0VRbEs4cG5mSmlh?=
 =?utf-8?B?SE02elordVVYSjBaL1BPMURCaTh1NkZqdHBSamFydExQVWhNNlVZdXV1ZndY?=
 =?utf-8?B?aEs3VmQ3UkNkekZPWWZUN3VCZkFqU3kweXNVdWhtSVNlSkxHSHFYQUhoSGhB?=
 =?utf-8?B?YnZVdkRKd1N5ZE5RMHVNYStTekk5UXRKT05sU09wTGhHQjBsYS91UXhlcGFq?=
 =?utf-8?B?ZTNoL085cE9weEw0dkp6MExNcnRWbzlnbERZT3FVeUptL29sZFN5eDVHT0oy?=
 =?utf-8?B?Y0t1ZjQrTU5pZU5DTUVmdUs1cTVJWnIxR3ZoN3llRjd0TTcvZ045MnUzSTNH?=
 =?utf-8?B?Ny9WaEhHTGpINVUzclVjWjk0VGRId0d4WGYyUnYyeTg1bmRLbzg0cnZIU0pO?=
 =?utf-8?B?RWVaRklvbnNtNi9DL05vRWNtZDdsZ2xzNkJXWVVneEcrWVZWR0g2K09vTVEr?=
 =?utf-8?B?OHZTa0c3ODZGMVV2bHJXei9mdkVNckZmdjRPUm9MZkVSYmFGRlRFNi9TbUlj?=
 =?utf-8?B?d3QwclpNZDEzNVRBeUMrb0J6K1RnejNIZXdMeWw3WnhndGtRNGZuOUJJT3Rn?=
 =?utf-8?B?eXdVeW1FK3VZR2cya3Y5YW9HN1UwRm9QZ09ZeVNzNnlKYnVwbFpGbWxxUVk1?=
 =?utf-8?B?elJZajU5U2JjK3p1bzN0bXBSQXcxVTlETTZmSXdXK2FEOE05SXYrWlFJVElQ?=
 =?utf-8?B?Yk9ud1N6UDRWOXhWZzRJYTNHMUpVemdSaDZ0K2NEMmp4ZFZ6NmxVNERqa3lX?=
 =?utf-8?B?Y1g5Tm1pSHpOUHU4QUdCQXlmRTk1SDFCRWszcENVWWdZRkZlUDZyR3Y0Y0dT?=
 =?utf-8?B?WVl4NEdScmNzUE5QRkhRb0FhajdXMTdVeTFtVXcwVHZyYUJCR3FxalJxUmdF?=
 =?utf-8?B?OEJKSHRtcURIR1pRUzVlMzdKc0l5VVArNk5jRUpQZWFlMlcrSndCZGFUckxr?=
 =?utf-8?B?bXZucDgxVTRwRXZ4MzV2ZEoycWJaMktrMVp3UGwxeFVlOXdYMUk1dE5SN3B2?=
 =?utf-8?Q?Po8Dk1EeLkzAInp6AtrzIX5Od?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155c0234-25c2-48a6-277e-08dbbd91a6c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:35:46.9524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYJXWPV5lozs0ZD/Z5o2Qv24AY9Xsi7Aj1DDhvyRn9kGMj2ZSqf3GPXB0FQA5hnU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.09.23 um 21:27 schrieb Christophe JAILLET:
> In order to be sure that fw_name is not truncated, this buffer should be
> at least 41 bytes long.
>
> Let the compiler compute the correct length by itself.
>
> When building with W=1, this fixes the following warnings:
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function ‘amdgpu_vcn_early_init’:
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:95:58: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
>       95 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
>          |                                                          ^
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:95:9: note: ‘snprintf’ output between 12 and 41 bytes into a destination of size 40
>       95 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 69939009bde7 ("drm/amd: Load VCN microcode during early_init")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index c93f3a4c0e31..f8cd55a0d1f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -88,7 +88,7 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
>   int amdgpu_vcn_early_init(struct amdgpu_device *adev)
>   {
>   	char ucode_prefix[30];
> -	char fw_name[40];
> +	char fw_name[sizeof(ucode_prefix) + sizeof("amdgpu/.bin") - 1];

When that string constant is used multiple times it should probably be a 
constant.

But I think this patch is superfluous to begin with because the 
ucode_prefix is never fully used.

What we should probably rather to is to define some 
AMDGPU_MAX_UCODE_LENGTH and use that instead.

Regards,
Christian.

>   	int r;
>   
>   	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));

