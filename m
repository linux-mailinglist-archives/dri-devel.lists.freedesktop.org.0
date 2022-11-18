Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E262EED5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 09:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228110E6F4;
	Fri, 18 Nov 2022 08:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24D10E6F4;
 Fri, 18 Nov 2022 08:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg04FOS0xEUJGA19iLFTY20+ex2fdrKKr4Ss5dDxtsyknZ/nmh1mBU+YAwFdW6zE40lT2tazrkieJVZDggJQwhjsvrAGqYdMV9hKQyIrbwll8gq9vdUOb/jtI/v1BoVjMvLuP0uofbXcsB4dhCODDi+lNnCMBTO15wZaq75bwwf2yCqyf0n4IAZYDPJtHG3e+FgsrMEz3ue9ViGfgxqQssDXB1v/bWyRixng4Evxab5DKxnNE6DJ6FdMUCL9eUHNARtNhqUgNASml4n8rpekcg8Gm7Wa2Odw81fM8mq8xHMpA9zLOMUmeSZB3P3NT+lq716iAYtQJZOZgg02fmL2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mrz2Hu8jyqfvR10pCEwwG44XSfuiGrIBT5O4gZOQuBM=;
 b=IWpICiNgAJmqOink9nUrjb2SdvZp8ROElspV7v2XTyvYZwBvPV/4PLiHSrYmrDP7LcmqbkOIMFXt+UTG5pFWWzjlOYlx24yH1plaEDVMvenUuv7OI9jNCcpOWnBeins9c6MnJ6+Ul5YtYq3QApCNcxWoEnTS4PViY+gEhi0h77OOScnk4D+6kQB7I+mnVmq9Ys++N17L8uQS0svBb5rDDY0Qq3hM3Bz67SLAF56Nm92lc52W2HL2HnPVGMZmwszZrkpgHxF+uhErRBFFju11dBWtfX3keJi91wmqr1z+XHXeKcl8eZN3gYyQZU6uWxWam1yTNcBzUAV06hCoZiMPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mrz2Hu8jyqfvR10pCEwwG44XSfuiGrIBT5O4gZOQuBM=;
 b=gafECpnwQndS3omUhPGWVVhTeGMBer5v/IQyvQQP+M5rZ3nXueXKKE5tEJwtXVwkUultmil4B2CUqlzzW8FBV9U4SzqDXWSIfUhn306s34MHenLK2nrTjvrucWfMNokg8X6X4llzgzy4vcvqHQ8t6O6+8YZmDKeMfXclZ/gL2KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 08:01:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 08:01:48 +0000
Message-ID: <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
Date: Fri, 18 Nov 2022 09:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: en-US
To: Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221118074810.380368-1-lizhenneng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4512:EE_
X-MS-Office365-Filtering-Correlation-Id: 8798576e-7372-4cb0-db23-08dac93b249f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8K31cEpY7Ser3hFPTUENhbu3/7QJkmLJsaSO4WGhhrjyYymqGPVYUvKcg/XKV8eliKnyCUqMPuNmhqvZu0HjuDxLWP9lkIS6gMrSGB2NvAxsA2W+KKpwTg9tUBqx7e4I+rl9geyXxysFS8TdJ2LA4uY+jw2tMM11RxgXuGBqGhSXmtYSI52gq6SFiB7xNTSdvhPjtj1Etkh0L9gIE1woVjWpe/29ERbpSm4J3bD64WUKClJ8Orws2w+YeBSkk7GZpYrMtGqVpb532Iesfs5TA2u6QvTk42kX4ja74CJfnG00jWTZtd07Pi+S69OtJbNEPKxVFxn2YfVStWtpX7Le8VtNMQlsylnUzJJVP57VUF6/fycgj4FeSgwXNypHlx7sHhhdGbfRlUsig2CZFfluMbGur+ZWdVFhAoh0I3W/kDOcwNdGM61oSMwrOjxpcqHi01Z4LqZvg1h+F0ZmOAuh8eyydhDGStwhhrR1paTg5HZpQfmNpJ01SSitiX1L3XvRTPEOqTYzhsDEJVhGdrOfPytUuZecu5pNd4d+GF2Sip7rYZ2nr0jTPTK+AMvozXo4ouKp7N7s/WNnl1Ncsm8uO7OhLxbYy7slmdY+YJoybvLTwZsWQrpeesLF8OPTU3uMfmnqUTH5sDGCnEzoGabWkX6hBd2kPaZb11La0z71Mgi8+DeE2qQj90WOMOZOeMzj37e10zDQk1eMeCg83kWZtMPI8Z42aurlWegUnT65t0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(6636002)(316002)(31696002)(6512007)(8676002)(38100700002)(4326008)(66476007)(66556008)(86362001)(66946007)(83380400001)(2906002)(36756003)(2616005)(41300700001)(5660300002)(186003)(8936002)(31686004)(478600001)(6486002)(6506007)(6666004)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVo1VW94YkF1N1l6ZDljZ055dzFmMkMzNGV1Q2ljQWx6NHJ4QjVmWUFqK01j?=
 =?utf-8?B?QUxYZzREQ211bmt1Z3VLRVRXSlNNRGR2cSthZnNoeEJnb2dVSnhUaEZUb09X?=
 =?utf-8?B?KzZJbVhzZ1NlRjhHOGczMXp4NFk4cGkyVDZ5bERKaXpnZFRMNkt2REJtak5V?=
 =?utf-8?B?c2svZXJJT2t1N2VEeXJXdndHcHlLYW8rancrdWRrQ3B4bDEyWGJxV1g2cXY4?=
 =?utf-8?B?cVpaUWd5WHE4WkRmWnpUV2hNbjR4anE5YnVJVHIvV0lqNjNMeXRlSUJNRU1w?=
 =?utf-8?B?aUlmZTRKU0lZSnNjYUZmTVB2dDAxZHUxTFV6MG81SXVLL3lIOGxEUk1zbjhF?=
 =?utf-8?B?KzNuem5lTGpza3NyNjlCdWtsYzZycDdqYU1taXk4UHVTQ3FYTVRQY3JBaE85?=
 =?utf-8?B?ZUhxMlVCci8vd3lTWE9ldFc3NElkUFdvUXdSZld1amg5eU9iQi8zUGZwRzk2?=
 =?utf-8?B?R0UwLzNUMEVlVkJGVE5KLys1UW1CNVBFQkpLdlR6NElGWGxHV2dwMkVtMWVP?=
 =?utf-8?B?KzE0RzR6Qm1zSXZFdndRQkJLRmZKaXcyd3dhb3pBMzc5Z3JzZ3pKaGVvdTFu?=
 =?utf-8?B?V2dWMkhhV1JnaURUTk9yWGlhdHZFRmRIQm0vVE5yZXVlNzlaQlZBNlpjSnRu?=
 =?utf-8?B?SEZTUHZyN2ZTT0NIRHFYSWNqVTcxVDE1THFxMHBvWXAxbnN6eDNOTVU0NDN4?=
 =?utf-8?B?WXdsRjVtQ1NEUUkyVDF2ZEZZVkhqSmpiV2NNbUd2ajNvaE9HNk8zcm02SW1t?=
 =?utf-8?B?dEx5SXRhbEcwWHRaRUpISlUwd0x2bmQ2d1d3ckhxcFI5TlhvTGVYUDhKWFJ5?=
 =?utf-8?B?UmRlWUFaYmFyOUFSVGZMU0Zvd0IrSjE1WGdsTnViZCsyMTBKV3ZVM3BMQS9L?=
 =?utf-8?B?YXVoRStLSUdVZ0VDY1JkOU5ya0tXbnRJUmx0R0lLSzM3ekhXTGhFdjZuaG9p?=
 =?utf-8?B?TzJobC9kcUloZmQ5ODlWeTVIajg0dEtxV1lRbWJXejZkeitONVVnOXJWNHo5?=
 =?utf-8?B?V3RqVUE1T3NJSHpMb2pqTUJoRXpYaUVVOXZHTEJBUEhXK3R5c3ZQS3cxbTNV?=
 =?utf-8?B?c21KN0FDa1oxV1hyYnVIa0ZpZjZMQUFzTmJPblRtUmpZcTB6UzM3c3BNWEFY?=
 =?utf-8?B?Ym9iQ1dsZzFnZGlZeDhick1oQS95eEtZYmhsMVFJVDRqdUNrMlJ3TXo4VlBU?=
 =?utf-8?B?akJhdXR3TGJxS0hUQWJZd2htVEFDcWhDdUxURU5QUFI4c3VVYlFRNGlVU0JZ?=
 =?utf-8?B?RVA1N0tkTm5XZW53M2FFZ0ZVVVNmZmt4L2NLTWF0V1NJUHBoWStkRzgxQmRK?=
 =?utf-8?B?cVZNNTVRSFdYNFNrN1hlMmMyZHBlTGxieXdNVkxMbHRSME8xdkw4OS9SVDQx?=
 =?utf-8?B?c0lBOUhhdmptRFVLMGtlcm14U0lCcGJuT1hZMkUxTUwrcDVFeGlrck15L2Nl?=
 =?utf-8?B?bFM4Y3hRSWM3cHN5cEsyZDJUU0M4WjJ6aytGUlcxN2k5Z3VyQy9CZVpMZVYx?=
 =?utf-8?B?Tkc1N2dEODdWTklBa3lRdk8rUVpmdEsxQmhVQjhWa1gwSDRRUUcyL3RHV3gx?=
 =?utf-8?B?OUNwSWp1bGVBNW9rOWQzeWN6VHh3WjlBT3RiTmt2bXBXL0NhMEM4dGEyUzNy?=
 =?utf-8?B?Z1k0Vytic3dLSTVYTU85SmE4MmErR0IwQWlKcTBRTlpaWXpFU0xUTmlHeFc4?=
 =?utf-8?B?U2dZcnpiQllDOTluSnh3Z0hnbTFYODJFaU1vbFhqV2N0Y0RoOWd2T3pMbUNG?=
 =?utf-8?B?YjZ5NVJTVzNuZXBiNGNzQVk5ZGUrZFBQZGFDOTVZdUxzcUVOR0NRWGJ6SGRk?=
 =?utf-8?B?YVNVb2ZPYnlQTVVhbEt1bXViRVZTU0E5THB6ZTdzM3RYbTkyWjY4Qkh3VW1n?=
 =?utf-8?B?em8wbnBiSHJpTGU4enhLZE8yQ1liQkhNRzdmVFUzZUFxZytOYXQ3S1VtYVp6?=
 =?utf-8?B?d055Q29VdzE3VGxPUnZRVjdDK2xQcElhazR4V1pRN3hqSFJnYzhQUWRVTUdY?=
 =?utf-8?B?UXpoY0Zxek9ZYTRuR0N4Q2JZQWhhc0xZZ3RvWjlCMWxFV1Nkc0VBczZ2dDE2?=
 =?utf-8?B?M21Fbk5qUVRzUFlmOUtxTUxFaDBNNnpBZ1BDY3pPU1pzbFNpTjZ2MnYvWHdV?=
 =?utf-8?B?ZXVDeXlzd0RtV09teHo0M2tMQmgyV3JyTitQM2QzT055L3lINU1BYllIeUI3?=
 =?utf-8?Q?ufEEJitXRphcph4nJ/8re4wrb0p6sMjwF/x5x/0IYAfA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8798576e-7372-4cb0-db23-08dac93b249f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:01:48.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGtT/rPP/p/X8V4sCVmhPns9uQRJsx9PR5m/RKwuEJsOWuNRRSDSjw/WViRzWx94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.11.22 um 08:48 schrieb Zhenneng Li:
> During reboot test on arm64 platform, it may failure on boot,
> so add this mb in smc.
>
> The error message are as follows:
> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR*
> 			    late_init of IP block <si_dpm> failed -22
> [    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_init failed
> [    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU init

Memory barries are not supposed to be sprinkled around like this, you 
need to give a detailed explanation why this is necessary.

Regards,
Christian.

>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
> index 8f994ffa9cd1..c7656f22278d 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct amdgpu_device *adev)
>   	u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>   	u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>   
> +	mb();
> +
>   	if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>   		return true;
>   

