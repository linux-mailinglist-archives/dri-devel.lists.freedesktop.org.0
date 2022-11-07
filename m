Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896ED6200F3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E6D10E1D1;
	Mon,  7 Nov 2022 21:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6C10E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5BFoT40YekqMxrXQzWS43hzaGh8Ad5MMW9ZWstnh5L46GzFtLDHhPX4HTJLIsUocP60yJLOTg283SpcRtfxRrcymmISo0tzVPfMupAabFnfyIJM5aQ3jlIZeAraQ9xF8W/MfolRzWHD8D01KQV8RttI/r+0b6AiNuhQsa8rGZckJO1PyF6DO9WvJvkGOubWSZY70bZnD3t5UlTBeSWMqOmFVMTt7xc9qXrXKiSg13rVecJxevW/AD6ZTRldaWyntNeoWitWevDCH8zA1cx13BQZmbzFJsczadmkDTZn0fGSlzpKvQHUQsXJLd6F+MotNVO3/lN4nuCY7MHPROTtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZOGrFR7He+7ZwWxwxvtCmPP3fTP1dZJT1Ocv/ACfos=;
 b=jESrCeEDGUgijfBGvuE0e/X2AFyuWXpN4D5TOOeTH9bJ+5u18BUcFEscQxReIicPeBfkbP4sZQpRbua5637LTY7T7On9LcjavYq0wtf8EFoLRh9q54eqDrz0O7ppCL8e5Lr5PvoPrxX2GiewCxsgH4xMzdPk7zV+UnpWyvIQ6sAxX/bR9i9owk25VwQaIZp9Lb9eb1SjOudr4/XFyduYc6lihTPfky2ESKddFJk2ejZIaQNYZCyng38exq5vxGX3DVVRGzwb/e0nQ+VH9uv4J2B5kmsfY/OWoBPyhBDxh619hL5APAGKR7kZYPfMjjFrK2vkYhNmR6U2oogNUqMZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZOGrFR7He+7ZwWxwxvtCmPP3fTP1dZJT1Ocv/ACfos=;
 b=m60b7WoxJK5KtqQUNu56DUhV6zc3HfLhlbV4mWtIasAPL/7AsjCK2V9VytLd6h3wIsVox+hXjmTFgBQqyacXTKYUGkrlZcPEEKYTy/MHOrotrnRKabJIQ/pm03363Z6ZL3EckbRDOU/l9FXUsVNlrpekzQKG98pbjVfr7b++1SCH5dCSN/aM8IPqc9jQNALuoDkd85NaH+aX0iEdk3rX7CBR+qJw1LGINGNIDlq1BPTuKpsr6+dmjqMXilxr0IfPKlXKzRO/U9X3PQKNlxLyjIlfeB+jifvpSjBgiVMHgJ3zhDFd4j8/wJtS+XV9gHWfIoSNifT1BpjqCO657MiWOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 21:21:20 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 21:21:20 +0000
Message-ID: <a9a30bb0-6ed1-56f2-620a-f0c8233d8378@nvidia.com>
Date: Mon, 7 Nov 2022 21:21:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] gpu: host1x: Avoid trying to use GART on Tegra20
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <39c44dce203112a8dfe279e8e2c4ad164e3cf5e5.1666275461.git.robin.murphy@arm.com>
 <a494905d-129d-afe9-1b06-5b35e67aad6b@nvidia.com>
In-Reply-To: <a494905d-129d-afe9-1b06-5b35e67aad6b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc47e5f-44ca-4986-6cf5-08dac1060372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRJZjTSptMbul4NggvNvhZCtj/iaQ0nQcv2g3x3k6LF54j5N5wr2uSCY6hoLgfQXKzJHh1RJxsoLa41i9e6kDGeqWVbAA27RYkvQrEmXXxCY3P3xuW1JnLRAHjqSDfrZxCFx5mzQgy25Om0Kzy7XPG1feKWB0kYiVm1buDFXIOMC2LLe6+2qfwKwCI4yYAd0yfyVD+/8Uplh6AdjL43ZvuwQOerIDuheTuEG+4ecIQHJpF79TU37XIADQRUJhBR8YjiydDurwl7p5bKfEZmQWDlg0CZDu8a0YlLOs1Uf1RfNLo0+uIqmNn+etgi7fX0Xf12vwcWeMLjxDfQOdXBtMHb2ESiuMPYKO/IcJIaKStiJrNdfoy2OmCo1EmKg9xXEUQ3R9d++quZSD8VqJ0MbENYAWzZS/binkjhjmMXKC0VNR7KFgMvVvuHziCa4dS+U+jMMC58OdCFOo2LiUi84KzyJJF/YODtiSYGlROPvLGmyVhhfX4uWs2fVSAFt8n4T9uanF+5AaPt1yHmzaA22dnQBeJ4dO4ttK3ZDcVIU9ytxWvQsnKjcWJm826rxhNw9TLyqiq+mcrpXzvJn2gD8a8mV7lTABk9n2ZFMCzTqjMoed0BOglFcgZLCeJrMdP2D2znp8hkfF7TI3n+M9w5a5vgayI2P/WZGL2YM7mM8c3TvsmD7UVsJcZr63vzyKC+S/3eZlgI+nPEDkV5rmTzbEetniQJWTFedgcSRx7Kr2SHGXkSpyZkxIAu/BtK2kcnjA+H8DG73/+6keeJK2kT4rCaSz7mJWe7g5oOZj95oSluW8bWc4GIzYfkWpADRe8mGSq6Dyi5gOxTxGizpSehJjDdcTKVq8aHSPbQ/YjpY2IE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(5660300002)(31686004)(66556008)(41300700001)(4326008)(8676002)(66476007)(66946007)(36756003)(2906002)(478600001)(38100700002)(6486002)(31696002)(6506007)(53546011)(86362001)(6666004)(6512007)(186003)(2616005)(83380400001)(316002)(32563001)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxHa2FOYk1kYnZvcysreE1HVGw5ZGlvb08vUUcxNmxqWkdwaTBtU0Qvc2d6?=
 =?utf-8?B?dzRicWxmNU9TU2lRZlY0YjduaUVWSHRHQXQyYXRNcENPR2UxMEc4U1c5bFlO?=
 =?utf-8?B?NTNnMDRZWkswd0FKUWVsV0dxdmZhT0RkWXVSYzFZNmkvdXJjT3pLNEZYZUlC?=
 =?utf-8?B?VlF6aEQvWDdxV3Bvbk82bnlvRnFvOVhlS016a1RPME1QMjFLb2xRd1R3dE5N?=
 =?utf-8?B?cWZRZ3dWeVZVVDNCVHBTRnphbkc3UVQveUZpb0lLR3ZjdTAvOTBlS1JsZ2lD?=
 =?utf-8?B?T1p4R1JXUTVROTBJYXR2RXFybVprMnd5N1cwR2RQLzUrTFgxU0RwSXRKTCs2?=
 =?utf-8?B?SVREU1ArMzdOcEVHU3JadnBsMTM3eXFPMU9kWERwMEh5akJKTHRnNXUyaGx6?=
 =?utf-8?B?Q0dxaEhLVnhUU3RXYjZ4eVR2bEtwRDJUd1ptSDFtcGV3a1lJS2RFQ1lrZkl1?=
 =?utf-8?B?bldKMkM1eEF4cGNncUJBdEEvdDJ6NGdOWUF2R2srWmY1dlZwTHVzeEp1SlFG?=
 =?utf-8?B?cDc0a2dYZTk1ZW9PdWUrUkpJLzNwVWxPMmZxdHN3Umd1YWZuMmY2UTUrVEpY?=
 =?utf-8?B?ZGdZZExVc1lPSENjMmtSK0loblFpR3JVWVhLMXhhR0Q5MEF1eTFrYmIwRGRJ?=
 =?utf-8?B?Y2pCOFBtYkM0aFZidUFwOXI0elNLd2Z1dzUydVpZZlY3SUhHQm5Kbk1BM3d4?=
 =?utf-8?B?aTVKeFZscWlXY3pobDIwMWlIYUUxZUxZQ1ZhRnpRakxiUzRoSjhWTTFIQkVE?=
 =?utf-8?B?U093VGJ4S3FwcG1VZ3ZwRjEzOW5zSUZ4cXdKbHlxMHVENG1mcHgvK1dkcU1N?=
 =?utf-8?B?UXJ1Y3pBTXpyYVZyN29Sd0hNZmhJdU9zVzVkSFJwM2dEK2czRkZscWowZU56?=
 =?utf-8?B?NFU0TFdMM2o2MlFEZGFFUndZT2x4dmpGNCtGMDNRRGJyY1BMTks3NC9rSUVS?=
 =?utf-8?B?Y0RaOTZ2VDV4K2ZRbDFMb2dtYytBRzZJMVhGek02SFdxeXlrMFdoaFp5WklG?=
 =?utf-8?B?TDFMbUtidjBxYUpjSE1Xam9uREQ0U1duY2h4Wlp0SGZxWVdhZGhMbXNTdExH?=
 =?utf-8?B?RTdkRTdhREJLZ3RuODJ3RWRkY1lMYWpuZWw5a252c05rOUdRNFVMWW50WmUw?=
 =?utf-8?B?d0VNczVKVFVGcDlBeG1oRXBmSkhVU2k1dExDWFFEQ2xidkFmaEJEVzVzU1RN?=
 =?utf-8?B?U0lEbGpIVGEvZU9mOFFzUWJpRUZ5TTZERjljenVTN21tYkZYZWhZa29CcXl6?=
 =?utf-8?B?T2JNdFI5VmhBYzM4NTJJTWg2S1MxRWRQRHZIUHl0WWZhamRCUGNiOUJ4TG9S?=
 =?utf-8?B?MWRPWHVtcTZaby92TUwwM2FYdS85clFZZXFncjlmR0NvVDRab01rUlIwQ2s2?=
 =?utf-8?B?Q3NsejVBdUhITUY3RER3SFRwb25zSTd6WW5Fc25CMlhVS2dXVENlWGszTm9M?=
 =?utf-8?B?dWVLbW5oVFhMWmhtbmFwZEQ5aDRXaXo2VWRKd2N1U3NacWhDZzlFUmJKV3I3?=
 =?utf-8?B?WVhnbDBXRnBzVG1SRitQVkV4aUhsZ2ZWRWQySUVrTzM4NkhoaE1KcGc4dTB6?=
 =?utf-8?B?VGJNK2NianFsUjJEV3M3cDRXWGJFalBFcjB1NThuRXVxbSsyVUc4NS9mTUNY?=
 =?utf-8?B?dmFUOXBRazFwME16aVlCV3NTTlRVMWlDemdFMFhCUk15WmMvcGdzRHhXU3Rj?=
 =?utf-8?B?YTg4bWN6SHJtR1dvcHRBS0I2WnhLaWxhSmVwWmhDb3pHZ0NrdGcwc3Q3Nytj?=
 =?utf-8?B?RXV4R012MFlKMjdia0NEV3kxMG1WaTRzeFZOS2NxUWR4T3JMVkxmdk9NRlg3?=
 =?utf-8?B?OUNHTlNpa0ZRTzhMd1pXSVIxaUNxcnMyMDliWEFqZVJPTHNvTmFjTkEvWUtr?=
 =?utf-8?B?bVcwazJQNWdFSi9UV1duZW81cmVlaWNaYk5UWmY2Q0FtemFwUzdoWkJ6RHU2?=
 =?utf-8?B?UnV0akg5MHRBMXJoV1QyeWdFYktqMWVad3Y4ZHRLdzNxdEx2OTJsUWcreHNB?=
 =?utf-8?B?TTc3NURYSTNZZFlxcnRuUDlqVERlcU9uRUltekVoK1k4dzlUbXdZZkJKY003?=
 =?utf-8?B?MHRhNVljd1R1V09MSDB3ZnZoUFBJNG1MZVdCSlRHbzJ2STdHUjMrRUc4OEhD?=
 =?utf-8?B?R0JoeDBRWkczRkRIdEhIVTlWYUZGa1BxeEhhdHdEY0RTM2t0ampHZXQycXFi?=
 =?utf-8?B?ekExOEw2dEwzMmI5eEwzMEk5b3NaRWRET2RTNllZczVjK0hMb1owbUZjZm4z?=
 =?utf-8?B?Z0g1bjJuMjQxM0VLNkZOMkNqaEN3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc47e5f-44ca-4986-6cf5-08dac1060372
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 21:21:20.0953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdHzM+yon0JnuT1OuaRQlKJ++Hjfb3XNbg4ABlIxgCU4HKZ23OSoN31/UbrqBCNzEDZbycIDWFQyVMPPfHZB/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thierry,

On 21/10/2022 08:41, Jon Hunter wrote:
> 
> On 20/10/2022 15:23, Robin Murphy wrote:
>> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
>> bus") quite some time ago, the GART driver has effectively disabled
>> itself to avoid issues with the GPU driver expecting it to work in ways
>> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
>> IOMMU device registration") that bodge no longer works, but really the
>> GPU driver should be responsible for its own behaviour anyway. Make the
>> workaround explicit.
>>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> v2: Cover DRM instance too, move into *_wants_iommu() for consistency
>>
>>   drivers/gpu/drm/tegra/drm.c | 4 ++++
>>   drivers/gpu/host1x/dev.c    | 4 ++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 6748ec1e0005..a1f909dac89a 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1093,6 +1093,10 @@ static bool host1x_drm_wants_iommu(struct 
>> host1x_device *dev)
>>       struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>>       struct iommu_domain *domain;
>> +    /* Our IOMMU usage policy doesn't currently play well with GART */
>> +    if (of_machine_is_compatible("nvidia,tegra20"))
>> +        return false;
>> +
>>       /*
>>        * If the Tegra DRM clients are backed by an IOMMU, push buffers 
>> are
>>        * likely to be allocated beyond the 32-bit boundary if sufficient
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index 0cd3f97e7e49..f60ea24db0ec 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -292,6 +292,10 @@ static void 
>> host1x_setup_virtualization_tables(struct host1x *host)
>>   static bool host1x_wants_iommu(struct host1x *host1x)
>>   {
>> +    /* Our IOMMU usage policy doesn't currently play well with GART */
>> +    if (of_machine_is_compatible("nvidia,tegra20"))
>> +        return false;
>> +
>>       /*
>>        * If we support addressing a maximum of 32 bits of physical memory
>>        * and if the host1x firewall is enabled, there's no need to enable
> 
> 
> Thanks! Works for me.
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

We need to pick this fix up for v6.1.

Thanks
Jon

-- 
nvpublic
