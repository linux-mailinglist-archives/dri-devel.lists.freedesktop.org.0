Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA5876359
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512611386D;
	Fri,  8 Mar 2024 11:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0EvAhbul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664D311386D;
 Fri,  8 Mar 2024 11:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW3JqLiVKxheYsX+WG6CqsvwNvZsfapIzRuDfjRmepf5Zu/jguG2L0SqsvqdqVjwadwBlZxwu8ozpMNAy+pf1eW0qWJbIIYmNhr73f5s8uqER+Jh7FMlk78oCPNUAmKInB3QBq1kw67A8a9TKHA+t1PB/vffduWBjGfZ9jKI2cdCDSLZjvprzD0gUM8z9HaduhUIdBPjAMIRqvqBPFBMqnanZmQ5XAJddhWFo8qJTyo3gAWMHw+l88YZmsCONHBFj4n3C9qauU/w9OGXVZj/09Ycs89fQSsZNiPZdSlM2Hap+Pf8S10F7xwHcbL2/4pHkKWS5UGLgwpUBWMC3MkiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm3MWorQhXNgVwXhZnjE4DI5yxuo1+1koUbalsy2XvE=;
 b=YdvWZvysSr+La9Quo05pQtIx0mT9pcIa3WLpK4OaqdrJ97eGfdgwxYHRKpfVP3u9c3rDs9TMtTHDhBS0i9A15gbNZdO34Elo5H1sT8U398gXKBPlq9jbxgkoscmL3rxEQtOELAYpmIqHTNgDhH6D9xUll7Y12NOycZ/LGMpqtN6iyEuCV1v72oLpnSBT+LtkIefVLifRlF8TQE1m/3guUrJPbG26vkyX3A7VbYQb16+HXRhb7CSl5keY7zcr9N75doPzKea/X6zEIsaZyIEtTCz5ZWt0KZ1/JjGtz8YDvVYErun+bAyDBb/4LNS31fNf8j48++0qLkJBGCS82NeAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm3MWorQhXNgVwXhZnjE4DI5yxuo1+1koUbalsy2XvE=;
 b=0EvAhbulWqVfZxAd2+fMEcku3qKjq5DqUvPDW9qlNoAapeMaD5g9rEOj5uTdg5OZuxiBbL/UBcNV2tti6YOGeRLnba4go0D+RU1q3CXICa7/TuhV3fjQRVj9/6FERw4IAX5QPVdkeZUc6dzdSNx3z1XbqTmqAyZAm++QmoWtU/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.29; Fri, 8 Mar
 2024 11:28:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 11:28:23 +0000
Message-ID: <4234830f-a029-4025-a137-3caaba6a23d1@amd.com>
Date: Fri, 8 Mar 2024 12:28:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240308103130.4124796-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240308103130.4124796-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: bb375513-5748-4301-b906-08dc3f62dd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c25HJQ+ze6Wuhv67c/OuwUx9/WtvWhS4JHd+60dheq4u9q3bfpFiRWI9iYnLYwa0LEcAJqxwvQd34+TefV/eW19uCkUNl3/wezNCwGr0uyKUR5KFjJ9qkziZedqpMfX/pi4bx50pZOjkx7KEMuYJLpQ6vThMCLIi9IZaU5J+DAkeBuZOQ+SmlZcleyVUt2jIiiGMxenpHrViMFczgnlrb286vPhACbG1cFzw3Q3YsBHlNW+JknviuUcbjK0CyviiVV5Lnbwna9FPbtp/4el8biCetyhsm6Rn9nev0/BbX9mT76iFRJnAQ42pxx2t7TT/9IoeuL7Sg2zIrRPCpqdeDZxoS5XB70UUahdizDeFQ0BkUNPPICLh8C9/F3s5iYXSy2LHbJ4Uv3cyFPkcFo8GtDot3NrVn+KODbkFhjFSFSPdncVDTbTZ9oXFfxPfEg5GRNjICHpVY7TkHfROagNYCyfi8fYKrQjMLDbylSvSNOGTpIjW0cMKguD5RYUGdsBiSb4qs/3Xt+ra7Q7vq3igPPluiaJ8l1hUJ4NMgmsPyneUy9qn/+TZmV6ofhBUwDqarddg/1UKA85XjSmgFJBD7j5RvUkvIhL5H3K4njmrrNNFp2vTAfMHfxDUEsHacnI/0OA1i6yf4hd3ZmsS4zuKlHdOGKKSlp9kZU5cWy6jOBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJNcHBuKzlkeUg4Smgya1pUVjNQV1BqeVc5Qm9BeG9HcWhXb0s5RnZtVDZl?=
 =?utf-8?B?ZE9YTy9mRmZsc3ljVVlObkwyZ2NpK1E5NWhWS3VJclMzK0xsZFN1VWV6Z3Rk?=
 =?utf-8?B?VUNJUlZUNTNGVDd5a2F2UzRSM3NqZEc1Vi9rL2hlS1NISkx1OTkwU1dmbHZs?=
 =?utf-8?B?Zi96S0JXOWRHVjRNRDVSa1Nwelhna3p3NVlnUXZBd1ZLQzVUalhEQS9QUFRy?=
 =?utf-8?B?TC9URHUyKzdZWTViQ2xxV3J4SXIwd0MzYUVOTGsrWGZoM0NTYlJmM3FucGYr?=
 =?utf-8?B?cGhlU0h2Nzl0WlltcklnMlRUR285QnJpR2J6YUkrNG1ERkY4eW9SWEtzcldF?=
 =?utf-8?B?WHZ4ckx5ZENzT3JTbTgwdXNLTkpkS1hKMUpGZ1pEeEthT25pN3JHMmtDRDBG?=
 =?utf-8?B?NTN2ZmZGZEs4bEhEQW5KdDRQNXlLMU5IOTRWU000ZDBhOFdOY29BQmR4S01G?=
 =?utf-8?B?eVJkQXNsNXN6MVR3cm5jeE5JUWdCelVFd21md09Ody9SdlVaaStzRUttZVdx?=
 =?utf-8?B?dFhIRUdMTitqT0QvWlUyYWxYa045Um1tTFRWeDYvZXV4bG5wNTlCVHhGYW5N?=
 =?utf-8?B?WXk5cU1xcXd5cXVUMEhHNFZ3OHlORnp3TnU2ZThLVVNWMmpIaHd1U1JraXkz?=
 =?utf-8?B?ZGEyaWJpU1M1b0UxYVZpd1VXaHY4R3psSEovTXByUU5KZW8zSm9xelFkSzll?=
 =?utf-8?B?U04rS3V5aU8rUHJodXdWOUZMQ1pSSE1ZQ2NRWEtiU1A0TDJibktWWlhzNWty?=
 =?utf-8?B?VFdHTVNXZGRiOXIxSVRNQjNIMVBLUUxML3dtQ2VFR04rdklwbWlSQzVzNnI0?=
 =?utf-8?B?MDJwdjZaT3BlQnlvVU5RK0VCMEswVHdjaWlzZ0VxOWU4b1FQbU1WcGJROFY5?=
 =?utf-8?B?NElzK0JJZCs5bk1rVXl4UENYZUZUN2FIOW5veUNqam5CQ2dUNUdLbFkrd1ZH?=
 =?utf-8?B?RkpjRlN3SHE3Z0lhY1JLM3h4WmJRNUwwOWhtTFFvdFZNZ1ZDSVBiZThnZmpK?=
 =?utf-8?B?T3Z4cGpmV1NCOEpPd0luNzZZdVI5TXp3NHdsSTVLVm1rQ2VnRWFPMWlWUkk0?=
 =?utf-8?B?cERFMVFERTQ5bE9EalZqUEpaUm9ubW5WMnhtNUZTUk0yRVpHOFN2MTRUZHBs?=
 =?utf-8?B?SzNCUjlWWFUyL0l5Q2hQaC9hbXRvVWgzVTNkaVRNSjRmMTBTTndMdnU4Nm84?=
 =?utf-8?B?cmdHb3ZpR0RLaDJpSnpVQnQ2RTNkaXdwck03dks0RGhVVEl1bXVoMmJES2lr?=
 =?utf-8?B?cTRDcURhMlJscWlzVklHY2ZsSjJ2RXpFUU5TMGo1eHQ1cmU0eWEzVGpzM2oz?=
 =?utf-8?B?eWhsZWVwbUNvY1RqZ1BFOXFBaDZKS3ZpOWxXNUJVbjRxSTU2dXNKRktBT2VK?=
 =?utf-8?B?VlhwUm1rSEg4bzFQeXltVzhzRTBsUTMyUzBtZk16RkVjaEt3Q0tvSytTaUdH?=
 =?utf-8?B?RkVHL2xlcUFGdkhGV0NncGpDZWRxN2UvaGt4OGloaTdlZFI1NFFtcWt5cDNF?=
 =?utf-8?B?d3BaaWpWSnRqSDVYTWpiWFlkSWhpTkY1ZmNkUEZmQ3I1L2kzdmI5MmZBbTFE?=
 =?utf-8?B?L0g5eWZCanZJZUo4WDcwUzBWVndJa1h3dVpaQyttdk5vR0pFV2tWYkZ3ZHE0?=
 =?utf-8?B?eXBFd0d1Y2h1ZjRlTG5sRE13Wm1aSzJpWWRDWWlGM1k1REZPUHZNVkd0eWFE?=
 =?utf-8?B?KzFjczJCQWFWTy9UU241dW9qY3RlNzRyR3F5RGdLOSt4Z2VNdUh2UGJSRHdI?=
 =?utf-8?B?MG90SCt2TkRLdzhaeDJVNCtMY21DK1dsUHVmc1h4cTJESFFsZ3ZNR3pkSEN6?=
 =?utf-8?B?SVVnOW1LNFlZKzVubXI4b2hSQ0xwWDlCTWJUbnJ5ZVUzR0ZyQVUrV09BTnM0?=
 =?utf-8?B?MHNWV0x3OGYvVjNvaHlDWXowSUYxVExkMlVjd2NoNmlobGNhTFNjV01OUFY1?=
 =?utf-8?B?ZFA5MWVHMCtsSlBDUVJGUGlsdXlwRCsrbmtzTm50NENmZmtwWVdBQmtWVHRU?=
 =?utf-8?B?NGZ0RStYM3VGQWMzb0JTenhNRHhoQ3YvTGo2V24vVWlvNE0wRXlSanUvcHlo?=
 =?utf-8?B?U01KWkIvUjhUSHJmUWhGeG14Sy80Mnp5UEd6VlN5WXdxUnRJdll4NWRPQlFF?=
 =?utf-8?Q?C/leOsEHpZimTkTJ+WwgRZq2V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb375513-5748-4301-b906-08dc3f62dd0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 11:28:22.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REjDAdVbLAFcArZkO2Ubt7YOmJCuxaf1Tfh2ULNY9cWDf0HBvSRNlhqmD0ucQT8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305
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

Am 08.03.24 um 11:31 schrieb Sunil Khatri:
> Add page fault information to the devcoredump.
>
> Output of devcoredump:
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 29.725011811
> process_name: soft_recovery_p PID: 1720
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> [gfxhub] Page fault observed
> Faulty page starting at address: 0x0000000000000000
> Protection fault status register: 0x301031
>
> VRAM is lost due to GPU reset!
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 147100c27c2d..6d059f853adc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -203,6 +203,18 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->ring->name);
>   	}
>   
> +	if (coredump->adev) {
> +		struct amdgpu_vm_fault_info *fault_info =
> +			&coredump->adev->vm_manager.fault_info;
> +
> +		drm_printf(&p, "\n[%s] Page fault observed\n",
> +			   fault_info->vmhub ? "mmhub" : "gfxhub");
> +		drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",
> +			   fault_info->addr);
> +		drm_printf(&p, "Protection fault status register: 0x%x\n\n",
> +			   fault_info->status);
> +	}
> +
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>   	if (coredump->adev->reset_info.num_regs) {

