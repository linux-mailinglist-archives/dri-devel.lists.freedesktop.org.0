Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641B753265
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66910E7CD;
	Fri, 14 Jul 2023 06:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE66410E7CD;
 Fri, 14 Jul 2023 06:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBVQBol0ToFKeYUhafewFs5boICJTk/E5dTaWAjJUy3uLP9OvU8njWDj5+6/FrO/OMz3q8qjSTuWLmJrp3WPAPP0IA8QoeD9vSkzTJSJkYL+SL7VeC4yttnZwQRqap02RxManzf7rmHQsGR49ioJgySxdo5exxMm6GqWb7vBlq2mH7Fgj3rRYgSWDm6Tnpf852IIIO66/2ZZ2Hw27O2EKhqga7onQFAwzFgzrlF27MdsoN4//UqCeFc5SofWbAG2LGslx8K14qzShA0ngU8Aw11//VbfS4zQP1cePCSpxT5x9/6RblJ5xHuJ1Eg0AMvxVQcEw5if1b/UeaiyTxu+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs85LHT16F6fS7V05zPu+DK6W5w0OtmTKxznLgk8u2Y=;
 b=AwjRdTHifw9xQs6xX9HcZuZ6IB9zuUSGUESdbjUMvvNm4kDGW60VZRrmym+buGMgmOJ/iNU6+hcyYll222ibfUpW7MAdp9hhh/49d/Lh7NxtyHMISutKHTe9EqAqhbjHkeDVc9N8CXmhHzVfz3mwM9v9+ET6aE25EX3H6HuFI1iQ39Ix+6C4eMnqGeBklTvWMC/X/TFBUNN+uCAEY8Z1F6i7PLLwKcIvVmDop4QjMVs0xmRC5ODlD+gZfS6bYxmlGHEP0ttrBmQxhMLS2qYxCTNszp0+CKcaob4J5bi/hAIhQuhpu1bLqdbgc1rGIvrompyIX63+UIcFs8CBrd3lqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs85LHT16F6fS7V05zPu+DK6W5w0OtmTKxznLgk8u2Y=;
 b=lfYkQ6mNJgNcdT8chXaM9kfoA7bG8B5dmptkiJE1c9LFpcd3bahk/PzriMUT9o0wI0J6XFxRYSsEqwbxWq/KK6PcJs0urx9YxEkZ19XrKVav+nQStqApDV2CytIZX3jDpdpbPUmyfwP6wPAU6mjb4tuxEsOhc9Kki3hvxewppk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 06:59:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 06:59:34 +0000
Message-ID: <fda9ce15-2b88-f964-af39-9f8384bf79d4@amd.com>
Date: Fri, 14 Jul 2023 08:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-3-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230713213242.680944-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cad8da0-0608-43e1-1513-08db8437e10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kg5/HGdZ9obTasiOm8DRKk3hl7M5LtBA7q+N5OBCnYuFanVofPCuJFLLBE0eGJH9bPIesknzkXEqbf+1X1t0AqBG4zQvimBpuJKZaP2TeM2jo+DJ+lgYoltJxNw7WpCLuil6ixh5KLfgUk2wjGhHNVuaGD+QVDlDd++JUpisTmw4qPwQzO92eoWgP8wvYp5pbX9dlUPLUshs8joyHGDRF6XNiSW+xwu3gZk60QxagQHYjy7wjMAiuMPGYGLBA0jUXzkpME/Ddds1lhHYLPU0WE8DobT7CC13UhOQQsyvI3cE7A6Hy1Pytnw4C5OPxSA6bkwKmHl3/TilJRnw5+F3TSchfBEl3XkdyhyrvMEtcQ4nU+QG8VfLdt5ZsHfHRJAevs9qolzrP2H5yRF4j2vr2WWtousjByBsAkwhxGbNGiLk04X2xPX3mwLTlWvOVrSyVcQsBLbTXfcBAivkgBmhGLShjv04qQ7ixldYvGmYtQOpKexO3AAidf71WZYQ+iTHl+xBfQgIfeAJeJecHQjIH8ocBrcjacjahQ6e6EsdvvhxyAlbwg6dkoVxesTlWMW9aZft52Xjtkd9jBUKKkzYZxassnhc+UjKk3Rnp+2x2H/u+0rB4X0EcuzW/3zreiXyxXPB7rBDqSoNoSqgL8SwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(7416002)(4326008)(66476007)(66946007)(66556008)(41300700001)(316002)(2906002)(478600001)(8676002)(8936002)(54906003)(5660300002)(31686004)(6666004)(6486002)(6512007)(66574015)(6506007)(186003)(36756003)(83380400001)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RllVL3Q4WHN5VUUvdDJQZXgxNjRFYkZOMDY0bDZOd3JUVkN4em5PbDlFQjlE?=
 =?utf-8?B?Nnp4dnFMWFBzQnNSQ0hMSGIyRzB1V3FCeWlJdlpBMm94WURRY2Z2bEdOWUls?=
 =?utf-8?B?V2JrQjRJWHBnZCtmTzhjR2MyeXU2TUJwRTRZS1pOK2lOaTZib2k0bGlZdUhq?=
 =?utf-8?B?QmI2b0lqMVBXSXJOVHlsREdmcFJTcHFrSC9kNG9mN0hCWWNvbjBidEI0UlF1?=
 =?utf-8?B?Qms3aWQ3bnNHclJyaElHUmQxcnQxUGNYWFh3Z2lIV25ReUxpRlR0MG0vRjZv?=
 =?utf-8?B?Nno1V3ZMQlM4S1lDbkVSRitYc2FVeWs5VG5VY1hrQlJkU1NrbUZvU0pvUU9u?=
 =?utf-8?B?WmhhQlJVSStnS29JUGkrSGNLS3NRWHFDcGt5NTBjYm53eEhtOE5mYzFjTWxl?=
 =?utf-8?B?T1UyVVI4UVlJRmlwd3FicjJiM0xqZDVUbWliUTlDK0ZwQ3lEYjZhS3NSdTdT?=
 =?utf-8?B?bHZJYytJM3Y3SVpmZXo2aVRQZFNlTnY0NkJYVVR2aDRCc1diZ2hRc25lSVBz?=
 =?utf-8?B?MEhsenY1VU5kWGgreDBvNE91ZDArSFM0REhGNVRGR3RqL2k4YjV0MGFRbDBu?=
 =?utf-8?B?THEybFBDbEVrcG9KQ1VtL2lBSTR5VERPSDRJVm1YcXpnblM2VkVDTDdRUFlX?=
 =?utf-8?B?dk9FTzFHY0FoUUx0QW9HTDcvRjE0SHRmKzFuQzFHLytHc3RtZlhHbURzNjdu?=
 =?utf-8?B?RUx3K0dnVE5oMkppSlA2UG5rZWpYU1lKZjhoR043ZStiN3J4enQ3RXYvWnNm?=
 =?utf-8?B?cnQyR1E1RWNoVitubXBVUy9QZG9uK2JUY25yRjBNaTN4Y2lJRXhlY24vZnhZ?=
 =?utf-8?B?NS95L0lCS3hmTUlvaDJOSm1lRFdBeUc2N2loTDg5TWpGdDdhRWc2NWRZamxS?=
 =?utf-8?B?V0tnL2NYV2ZFRE00amNKd2swMVN4cE01R1lOaWIzL3VvRk1TMkNPYVBKSCtk?=
 =?utf-8?B?YWRJSHFrYzlHMGx2RnFlZUtFNVUrU2lKRlZPU2N0djZEclZCdFBFZTFwWkNj?=
 =?utf-8?B?NW1oWDNPdTAwTDlEYlFsRlFaeHZSR1RXZDhwaG50Nms4Z0orcVNYdm04UFdN?=
 =?utf-8?B?NWNtVURsUE40WGRqVG1YdWM5dmU1NzRrTGgvbFhSUHFnZUI0Y0pRR1l2amNI?=
 =?utf-8?B?cHJQenRVWXFrc2loKy9IQ0QrSFMwMUw1bG1EcXNnMzBSMXY5SlhFS2pRZS81?=
 =?utf-8?B?SXE3Y2RrSW5MTlJsNDNtNkZJWW4wU2p2QWsyS0dzR2ZWNm9qbjVWS0RBVWhX?=
 =?utf-8?B?YUNFUytaM2laNkxPM2hja3dSVVplTklUcDJ5OTdDdjZYZTg3V0RmbUlGQ1Zm?=
 =?utf-8?B?d1kxZTREZDdHYmxmOVlKalFPTTVTaHh4Z2RzSUNsazlLYml2OWNZTG84clhs?=
 =?utf-8?B?cDVnVW1BTWczUEw0YWNvSSszSEtmeG9HTW1jMUkxS1hjdHJSMEJpRFAvOW5h?=
 =?utf-8?B?b1BSSEw4eDArdDFyV3dsajNxSEpKQ2V2K2RYVHhtM3g0eHdOTkNLQy8wTmt0?=
 =?utf-8?B?YzcrMVRxb21ucWNqd3ZIb2lGWElnR3B0MTlBK2k0WmlOWDRTZDA0UmVoNk9G?=
 =?utf-8?B?VGtvMnUyeHg2T3JIUnU0WU1OOGhlQ2g5OUN6YUVLekdsK1BDZVNCZ1JkU0lk?=
 =?utf-8?B?MERBRVpnNHlqeWZWbHg2bkhBN1NQNlNFdEtTeTNlM3k1QWNLZVBZVXNUVWNO?=
 =?utf-8?B?UEgvdHVwbUJIZko5YmxOY3NHa1JwMlY5NC9RVkJIOEhtWHR6N0hYS1JjMG95?=
 =?utf-8?B?NElVdThkbXhkL20rUitiQ0ZBbndSMS9nNGFGUGs1eUpOZ2RQSlVQVVhZUUJV?=
 =?utf-8?B?VlJOd3BSZVFwQWVRR3hMWUE3UFBDWEl5eUNXbStaRXVORldzQkN0cmg4Szdq?=
 =?utf-8?B?M2IxblFMYTdZTDJTdVNYM0RlbzRkYkN3Z0FYeVprZGpKN2FMUHJaNmN4bGxI?=
 =?utf-8?B?cDFYZnNOWUVLVmZQT3hLVVZES0wwV2hPakZOTWdYelN4azJjejUwa0RCVytM?=
 =?utf-8?B?Z1orcXFDY0RKOGVuMXF1MUI1UjJ1TldxdCtsZVN6M2NsQTdCRmI5T2RaQWVJ?=
 =?utf-8?B?SGlrM2hnRDdyR3B4V1RvNk51ZjlxbDZnakFQWmo2NEt0Qm05ZVlXRVV0ZWMw?=
 =?utf-8?B?VWRRSlkwWGRMdHRJU2VISXVVbTFuNENNaENhS0ZXWDFzNExKa2g2a3RjdURV?=
 =?utf-8?Q?0TSwQFbhb2VCmAhyCtQGl58snLkk+Mvk9Cxf04U2wx2r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cad8da0-0608-43e1-1513-08db8437e10d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 06:59:33.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTHLRuXErOiiAew72wKqCwFV4Wtv3iYR/MRkZiqdBzRoBs1j78VtlRA8izVOUL4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.23 um 23:32 schrieb André Almeida:
> During a GPU reset, a normal memory reclaim could block to reclaim
> memory. Giving that coredump is a best effort mechanism, it shouldn't
> disturb the reset path. Change its memory allocation flag to a
> nonblocking one.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v2: New patch
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e25f085ee886..a824f844a984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5011,7 +5011,7 @@ static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
>   	struct drm_device *dev = adev_to_drm(adev);
>   
>   	ktime_get_ts64(&adev->reset_time);
> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
> +	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
>   		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>   }
>   #endif

