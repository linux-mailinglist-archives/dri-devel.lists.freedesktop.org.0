Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60BE65F26A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6C10E7D7;
	Thu,  5 Jan 2023 17:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5210E7CB;
 Thu,  5 Jan 2023 17:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTDE0MHMt699lwATJqLb6AW/Sc9bpc7P8V86/pUw+7yf5MSxYwwTnJs00fQIBkkgDayu6ZK8xZWGjA3DIG7K/7ZAx5H2kXmmCk7o4neMvKvTe5y4Clegd18WfHhRSDDgTi4ts4il1n0WWWFSzgMG6QCwYEWbl3arieL/fHCHfx+pIHpZJHPrTE+vRQjNZRpI7JWv3q/nJRoeN50h25XAO+EyhKtZ36ZzwODg/CTStbUzXPjDLQZ5odpnKMXCv5R/tf3V4tZ1PzMvOvJ7NinbEM2hVsdZcQFBNBkN1ILdimQEHg46aozw4wJ//pmZxhQuh12zF2+rPyVTLogr3HKO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTC07nsprUnfBL+6fk6afNRndjlI8cn5CLrvO3lqnLw=;
 b=Vxm4rjWuE4dWLTidQYkFrJzNm0MNdWtNFnq6XhVPwUKCEzTlpZKT06SUDWYDHH7jbN4mGBwiAWRTlKZDfknRTwLQt/R4iM+VN55hmHR6mdJ8I2lIo4xsfeDshY46KTMBEmZnP73tMvQ18NsU72/r5n4xMLvf0VU5pwfG5iQxEsYe5PqAT3SoxxHxeKqmvwDGOfpQGR2voAU+MTw+IP2/M/mNK4YJ5b+Oh/7N0CIR/hB3vPcB6UWo8END6SWpeycAFI356CpMyoezgOcDuCSopFVnE3eawxLIaLPPCXatZtePq5a4+HCkeflJSXp37mlj/+6+CGoVO299gvfi2rMP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTC07nsprUnfBL+6fk6afNRndjlI8cn5CLrvO3lqnLw=;
 b=EiPLvUqCrCBOLDbG+wizLKHFF4ruAEQK2XGHFOnAwuCliS0DfTzl6Rlar9UHgxCPs0IffagjIPweg6VCEUlFVIhQfZ7ktfaDS0mT4AYrwVouTqc3XMhoZW8TI9e4hih+rOJsikj5fbe9cj+lIXBmTI2Jo0mzGF0IPhcLZpqIaoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7966.namprd12.prod.outlook.com (2603:10b6:510:274::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:17:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 17:17:59 +0000
Message-ID: <96d3a15e-cc34-50d4-93b3-5d5c59e6f40d@amd.com>
Date: Thu, 5 Jan 2023 12:17:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 25/45] drm/amd: Use `amdgpu_ucode_release` helper for
 DMUB
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-26-mario.limonciello@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230105034327.1439-26-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0057.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d63e4a-b962-4877-b1ba-08daef40cb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmfZzv/rEDzFzY83qpbj6+pVUTsxPGTE1q/UwsEVtyyxgcDzYiIVuUtS3YqNfR67jp6apAmJRIOWTGMAFTlYyYrJelUJKOjty3ByoDRf/8cb7wVNsTBtDuRTWseR05Ivleuv0n9QWyx+6NlrJcdCIzZiY5jOuUbnHUZDe8Z+1W/bYhmNG5CVAOr24cjQLlthafIAs9j3B4erJ0/gh/knkh3GZQIw6/poAHZGTt4R1YSLW3B6sbNX5cPfoqYI0af6hBBUMZEZF64QwqforFDuRDpjKGYeTWzjzquQQ0fsLeYu4a6u7+22iSxe48279BLylz24uBrbwDG2c3S6ZyxY3d4zkmEaXn+nUoIpnTi+nyR5x+idml8vGSHd/8cikQ8Hm57bZQeNiI1C+X8TxfcnNJWz6gQW+C3UBnGcHMnFtzQu3M1VQ9s1s3DJwNKcxo++H1Gu6FyMIwfIgBs41nL/oxWDwD8JDekyytgwz85WddaHfpq5Uj3N8slSfoKnQP0X+MczceV6f/SGPoQ6kttwg4YIpk+aS25XOkZ0LPZFelNq7wY7UrLk0ijBjPgGp+N1HZWkSAQUU8yL/jSXbBscJpCIx91mc0Iq0qIdXRsH300B4Q1ghhUJIDWs8p45r3oDFj2cWtNCYO2WfTY2M87k+KDlWpBUv5SlnlbEpE1iO8104FYYSgcn90RKgvRD1t7Hro1xBmIAutrtiDlz9cwfCUQsDrMvE8izFi+N+QnUtUI6cdtXVQHfxKm+BidMbeXa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(2906002)(8936002)(66476007)(44832011)(6666004)(41300700001)(38100700002)(4326008)(83380400001)(8676002)(66946007)(31686004)(5660300002)(66556008)(186003)(478600001)(6512007)(26005)(6486002)(316002)(2616005)(31696002)(53546011)(110136005)(54906003)(36756003)(86362001)(6506007)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFo1UWdGK0trd0RkNlVSTkpNMFdBckN3QS9zQVhmMWlvOTNkc2YydG1EeklD?=
 =?utf-8?B?TERmUzdGVjM4UnBMZXNvYzVvR21oUGlPR1FvZ1JNVzhiY0FiVFNDS2VHODYy?=
 =?utf-8?B?WUtEWWxPYy9xVXp0S1o2V2hla3dMSWJiRFI0UThiVE9wSm1lNTF4aStXQWNw?=
 =?utf-8?B?QTBKaEYyc3d4cnM1NUJ3QUw2cnM5d0RDUjg2QjBDQXluSnNaL2JtZlZlRGRH?=
 =?utf-8?B?L3UvczJ3bjN4b1pUQ25IbU5tNnNLcHRBZWN2SnF0aXBPSy9yeHltN3pYODZq?=
 =?utf-8?B?OXNIclJxSUNCb3h2QnQvbGVZd0lmQk5sWEFJZkp3dkswODlPU1pqNXhPaVEr?=
 =?utf-8?B?RExBQy9WZjVuckNZanVscWJITFVKbnlVeDR2dFMreEV1NWd0VEUxY2ZLak9y?=
 =?utf-8?B?bjRJbHV5TU5tWEhNblhmcXY2VmN3NmV2ZEx2cVhhUVFBMVNtMkVGQ0tLYXRz?=
 =?utf-8?B?dlBRSTNhaHprTjNDUmNKV3kySXBMUkkvdndmN2s2Tk4xSjdyR3hKOUNseVdO?=
 =?utf-8?B?d3VBVTFlOTNpNkxnZnBCRjNLSzBXVFVmM2ZYdDBKTjNTZ2VmVE9BdlZCWGFD?=
 =?utf-8?B?MlFlUVBKNHVWVDArN0haeVYvV1BLM25xOXM1UDU4Sk1NOFZ2dkFGZzFSL1dF?=
 =?utf-8?B?UjRnZU5ubHV5U1dwQWo0MHlmQWxKVU1qajh3dUFBUkRMMlp6eGp4WUVEbDVZ?=
 =?utf-8?B?b0Q0WEl4anh3NnY1TS9mZTQ4ZGxYT2VvSmVBTjJobHZXWnVkY1l2Q0R2TmlO?=
 =?utf-8?B?MlpJeTExTEQ5dEloK0VGNGxwQlFvaHZxZ1JwNkRCdzdEL2NZYUlQMVBoNHp2?=
 =?utf-8?B?V3Vaa29uRXU5d3ZQRnkyemtNWDY0N3lBQWhGVWluVy9aVEhKVE41djNJbktF?=
 =?utf-8?B?MnM5QXNUbS90UHlLL3JjRWh5QlFHN1VTRjllTS81OVM4bXk0Z0tjN1c3ZExj?=
 =?utf-8?B?UjNjaVBIZ1BaZW9VVEtXakVNL2FzdU5BQXVFZEFSUTgxT09lMjgveHpOMUdV?=
 =?utf-8?B?SlZGWjdrWjR2ajV0Ykt1anpzNCtBNmNrd3JNamtlSFdJUUJXSGY2cUFuRUFM?=
 =?utf-8?B?WGhVQ2Rac1BCQm8vR0hmNlY5NjNSYlhhSVVBMjdCcjVxMElKcFc0QldRcmNv?=
 =?utf-8?B?SHRyY3NlR1VkSmZzZ3RLV01wSERlcWFKcWRlSHdIZW4vVGZpb1FXVW1lMW5X?=
 =?utf-8?B?YTJNMk5zSzF6UjhnV0RSZDhQb1ozcDRHTFhLME5TRTBlVG5BY0hIWXR5WjZ3?=
 =?utf-8?B?b1FLRGlnNFhQMkZBdnBnQ2hzNUluWWM0R2tRM2dkd29JSEFzTEFsYUtOM1JY?=
 =?utf-8?B?MUdweGlPb1FtNVdlNk5weUxoSmQ1WE4rUlFFSG1qTjlIWCtBTHNiYk51eTZY?=
 =?utf-8?B?L1FEYjhwS1Vtd3NkdTltRUdFZmhJNHBmK0Jka1JGaXdpUGJoUVdiTUFPaGpv?=
 =?utf-8?B?VFBUQjlQVTJpcVNFL3ZxMDFWd0h2c0ZINU16OGNuQS9HM1NNYnBCSGlJZ1JS?=
 =?utf-8?B?UUdmSUxNWUFQSHhHYWJLVW9weXArQmxuT1JGYllTQlhVZVNnaUd4RGZLbmxU?=
 =?utf-8?B?TkcrUENMR1pSc3ZHd09mOEp5dE0zWjM1NWF5R0tOR0JFc1JLOWJ3N002UGZT?=
 =?utf-8?B?UldPY3krY21mbmo1OVpIZmtSRmZxeFFRblcvWDc1NTdlNEp6TVltWHd1UW1q?=
 =?utf-8?B?elVVWHZlNU5lbHVkM0FFZDJVWVlUanlsTkQ1eC9handNc0o0RHFuSm9nWkZj?=
 =?utf-8?B?eThTOHdIMk90cVVMOEplUXZQb2cyNDZsQk9BNTBoMnMrWTI1U3IzSURPRkVu?=
 =?utf-8?B?aW9uaDcvVmdDSVhQOEhybU44dHM4eW5UQjZEZEJNeldWMk95aVA3OVZCdG05?=
 =?utf-8?B?SE5QdzAvbDZuSFBUZ1RnTS96ZTMzb2dFV0ZWdWc3S2VkUEZPU3c0Z3pNbVMr?=
 =?utf-8?B?MnZBV1NXeE5DS0dSemRTbjBwa3JDRWRQNzZJbEc5eVB0OURFZTY0T2xndE0y?=
 =?utf-8?B?KzRLUFU3VWdYM0lWOVhjVExGU2xDSTEzQVl1aU84bWFoMGh3YkRNdzhkQkRC?=
 =?utf-8?B?YUFYTFRRSGlpTEswaWxGSTN6TXFzRlNRRE1MRHpvNktqaVdXZTBHRlZmZytt?=
 =?utf-8?Q?DM457GdOfjW2rW5dkQVF8EJ3s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d63e4a-b962-4877-b1ba-08daef40cb40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:17:59.5493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Hm62LGRHPB62XmNwGFOfmcIi8Kg/Ecv/RbxuVI+enWnRRyhHsCxDJS7yNbpSfhO02OIt0FFS9dwTNOJnS0QVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7966
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 22:42, Mario Limonciello wrote:
> The `amdgpu_ucode_release` helper is for symmetry on unloading.
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v5->v6:
>  * Adjust for amdgpu_ucode_release argument change
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c8c5d37c8b3a..61c192ead62f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1898,8 +1898,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
>  	if (r) {
>  		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
>  			fw_name_dmcu);
> -		release_firmware(adev->dm.fw_dmcu);
> -		adev->dm.fw_dmcu = NULL;
> +		amdgpu_ucode_release(&adev->dm.fw_dmcu);
>  		return r;
>  	}
>  
> @@ -2113,11 +2112,8 @@ static int dm_sw_fini(void *handle)
>  		adev->dm.dmub_srv = NULL;
>  	}
>  
> -	release_firmware(adev->dm.dmub_fw);
> -	adev->dm.dmub_fw = NULL;
> -
> -	release_firmware(adev->dm.fw_dmcu);
> -	adev->dm.fw_dmcu = NULL;
> +	amdgpu_ucode_release(&adev->dm.dmub_fw);
> +	amdgpu_ucode_release(&adev->dm.fw_dmcu);
>  
>  	return 0;
>  }

