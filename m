Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D247E088
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014A10E2A4;
	Thu, 23 Dec 2021 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08BF10E2A2;
 Thu, 23 Dec 2021 08:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV6JDla6lIyJAdkBtY+CABjF4Tz0Odls3IxmycEm9RQgxn8q7q8LNOq+UMeWfnGsz2+rQnfnrtBf6pZIqLQzlGjaozU/PmUV6n55GGTNRcg/3w4xcJPu2PsA57S9t3joPhY0JEPt8GFhGGO1fL3NJrjf4HyU87HWghgZ/v6nIUuR3vd9wuBV8qxZpXjRTYqq/WAZGaHYeKgqpK1eWrPmGxfvZsNw7TDn4koOStcerevOxKgBCzdv7vx19HJAqtAdEZw7uNz0Wp2qUE/l0UfxCh/Rd3fUwMiNO402rxWsEgZ4yE7lLRhqvhNj2MJCnuAUZVOF0zUr4e5SdjwjosI3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/wIK71zGefOd5MECVWvcz/RsACsXRPcZyhri3TRdWo=;
 b=evmsd5/8mdgIbQY5nCPqVg8o/EpHxn3anWb/rcMXF55yvPfgBjkfKcaLVw0jolrwweZYSkS0F9b7MzImCUvvcaM3kvhhCJlixbBw+5k2b9HGDhQC6znQIaOcCaLVSHjtoLKADz5KkuVwt8AeNa6bHTPDyL7CPFCaeKOmjW9fP7/ozPTnEkbrT0wcYYchCfBpqBVAPgm8TapQmxjmERP5Xmr03tDkhiojN3BLejvMlCkCSA7wMTXDoPYrKtd6SjuFbZSJ0oVu0tFAFaFa/ZVW9CtCAgwNNn4UDp+AM1vDO+t4+T/5E5cvyKUJrN6s4dl0vA/+Hx0lyVQJmL65MPeZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/wIK71zGefOd5MECVWvcz/RsACsXRPcZyhri3TRdWo=;
 b=P0HqKmwF8AfsksKSSFkWMyo5Ep45TcwWTLsGtLmdX6tgv8GaDvBIvGXX2Pff66W0tU3gLWV/2nPZR0uIrSys/v/gZJ+GrsghXOyfSFYn/Rl7YI7PNiIFI13ZlYm2Ld83jK1VeV0GmPOXozJwP01GnmC6e17ZQxN4Sp66ZwUf8cM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 08:40:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4823.019; Thu, 23 Dec
 2021 08:40:53 +0000
Subject: Re: [RFC v2 3/8] drm/amdgpu: Fix crash on modprobe
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-4-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2b6c25c5-3420-d904-3256-9a7713035c30@amd.com>
Date: Thu, 23 Dec 2021 09:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211222220506.789133-4-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:206:1::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0146a2-b557-4385-2b4a-08d9c5efede2
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4458D88F89117121415DA125837E9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpOZ/IXq9gwfLeSBDA+rPJ1lsBTaSn1rdWF0ORd5QUkyfwyxeqyYLT2743IFJRibxJj310UufczyW9u8CDvZ/oz6t48834yL6a9zA+JVI+eWvQQ4OWlsM0//3zylpgIzW9oXvXdvdiLfwPHuxbl4EP6WDuMDBxgl8lPPlo4NqDWIBTik0I/lZBQ6PfwXItcXtIFmllExuZ/oDedvH1WwSkjEzRn+sjZ8CGc7wIEwzs/cX0kLYiH3d9XWKfhzjm0ZtlbxgzzOABoHfQINMgYKaLpTw/0cqQCtAH1/34vKztj4ROrJiiZfggGba8PbPGNVQFFzy7/IJeWa03aI2/IfhEITfgeRRTvqLUHr4SGWTF0k4iXfSucUcCesEtytgWG4JA3KPAR1nPNiCIIYtqZnJpGUF4AR6EJ2S5xKwpwRdv8xp32NmUVk41R2k5Bqs1VxSFnGhmTDOb/jByFVHWse5fVPyg+LZYM3tHaS96KJyfYfXsaOagGi86km8KZ8NsFj95ofxivWbt2ICTQaF1Gug/20/dDxSt6Z9xQ+d9MCzWp5ZcdMyop4GbWBJd0GdEwij6JAi+0V7RSm1nZFgcAJqhnSk7ME4JZ/wl24eqD0okRW/pBF7/W/X8ogaQpYhutbs1Uiy9gJaJBlG1D2kD1JEXdsz0Ntdsr0R4mqOvEFevXcojq026X+2HvXhjC7YsNzb3D/tfE5+kgIBZZoLPO45rac6pj5ep+Tpt9cXPxm9Nw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(2616005)(4326008)(31686004)(5660300002)(66574015)(36756003)(8676002)(31696002)(8936002)(38100700002)(83380400001)(66476007)(6506007)(86362001)(508600001)(66556008)(26005)(66946007)(2906002)(6512007)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDIzU1RVdmsrTUNwbTY4Z0JkZnV1RVdhTlg0Y1pBOFl5dExlZXlzcmJMYldx?=
 =?utf-8?B?Y3pldUF4ZTB6clMvTHQvYjZUWUphZmZvTGx3Uk5VbkJpb25kWjc1dXA5NXpY?=
 =?utf-8?B?ZmVzZlpKcUxhbHZ1L3NDQ01HbGVZT1NGY2FmMmlrK2U1K3N1M0RORXBBU0E3?=
 =?utf-8?B?SlhHWVpTSTRBMFJJbVZjcWZnNnl6OTB1NzU2UkJ5eXZ5ZkM2TGJtaU0vdkR5?=
 =?utf-8?B?Rm9lYnovak96bVZWN0tENFgxNlYwQUttRG1FL3laL2RWM3h6bXBMVnhSNGdO?=
 =?utf-8?B?bTZRU3FVT21DK3BBOGZkUWxZZ1FqRm5SdlhIUnIydFp3QzRtcnZmL29nOWRn?=
 =?utf-8?B?b1F4eEFLWXA4SnFodkNkTFpFUTZCMDJxeGRQWERIcTRlVlJGRmUyY0RZbDl1?=
 =?utf-8?B?b2hRbncrVU10aWxKRkJPalNPZklvSGsxVDYxcFpPQzF5RXUweXMzb3AyQWFp?=
 =?utf-8?B?NE12SmthUFJXSjFDMml6YWo0eC9qSExqMjk5bzAxL1Fxd3E0ZnU4N0UzaEFH?=
 =?utf-8?B?Qk5DVmpDcWc5ZG5wblo3eVpSVHZwNDlMakNtZzR3TE15cUc2elgxZ1lnRWox?=
 =?utf-8?B?a2hjOHNhVGxEN3M1dzRPYTU0azUxdGxzVDhyRjRNVzEyTnV0M3J0bFdYMGdD?=
 =?utf-8?B?cVJNODRIYURwRmJncWpFMUZKR0J3UmloY2U2MHJpSVFRYjl3aFZDN0VyYUNi?=
 =?utf-8?B?bjJoZHVQUFdyK29nd1pnL253Q0dWWGkzU05uNHZvdXllK2tLTkZ4VnZWVGtC?=
 =?utf-8?B?bmx4dHRGbnc4ejFUcVEvVmxGamN1RFFibkJaVjV4M3JaVlovN0VuMXlMaDIr?=
 =?utf-8?B?UHJXR3c3WkdwY3dzRUpSNVBSdzkvUkt2QmtlbDZEZ3F0cUdCL3J0Yk82R1Jh?=
 =?utf-8?B?dXBUdUhIZ2tuak5GSWRyVkdwbGN0ZktpWVRFRGJwKzJaQVdlSm00blhqT094?=
 =?utf-8?B?ZHpDZ1YvdlRSTWlVMVJKWk41VDJWQS9YSVg1dXhxVk0wclg2TzJNVS9YNG9M?=
 =?utf-8?B?VTQ4dnV6MDhOVEMrbVVURS9rdTNTbm9yWnBHbnJGSkZqTjlaWm1USENzL0o3?=
 =?utf-8?B?RXAxTEptaVFNNlFkbmZOUDNoNHU3dnl1dWdKYTY4TGlTT3pMQVp1am12RGc2?=
 =?utf-8?B?ZVVnUFNDS01Nb29qRFBiajlML0c0MkpzcEFvaEdRMGhsbkZGMzViS3N1aGhY?=
 =?utf-8?B?ZHMxWEpoTi9xZUlKTGNveUVuT1p1bG9HQWNrYTU2NXVhUXpYUnEvNmJKdjRP?=
 =?utf-8?B?eVFNamxOZUlVazVkaVNXRHpPYW81cE1EbnBBQUY3WElPaXViNFpXandzTXFO?=
 =?utf-8?B?VWE0b0FMMWprd0M4QW1CcFZXOVBvM1l2OStzckVQUERpTzlnVWg5YjZxYUNk?=
 =?utf-8?B?a1BUVjE0QXdJdktYRmYralF3UmM5VTZ6V1hBVm82dERyc044NVJScEY4TUZY?=
 =?utf-8?B?KzRnWU9FSEtBS3EyQUl2dU5qVGp2eDYvRlV5bitCaFc4ZFpTV1FlTnluOVlI?=
 =?utf-8?B?Z3AxZFJLdS9MRE5WVkk3OEhJUlZRMllEQUFHbDRSWmpaL21keXpYazNFL3p1?=
 =?utf-8?B?TG1VYm5TSStZYmVlQjBmbmpwNDBUVFYxWmRnMGNYaGcvRFhWVkt5SitBUzA5?=
 =?utf-8?B?dmxLU3BreFZ2YnpZYUwwQi9vM3JrYU1MRStZbHdlc3phdmE4aFVnTjR3TC9G?=
 =?utf-8?B?Z3l0RlhlRElSeHNLTFdLb3lFcEZsOXFUU09pMnZKMjZ0SG53NHVud2x6VFRP?=
 =?utf-8?B?emt6ZFZpZUxJUWNKQVJpd1V5c1Q5RFhrUGRCdUtsQ3NmZDRQZ2J0aHZRajlR?=
 =?utf-8?B?V1d3T1VMdjJZa1FVc2ozZ2VpV3daRDhDZktuZGVXZjc5eDlQWnJlWC9oMFBz?=
 =?utf-8?B?VTBINVZ5eXlPVmNMVUZZT2RLcktEZWpTWk01bWo2eVNrZDltb0dwS3hVZnFG?=
 =?utf-8?B?VzA4R3U0TUJ6bXVrZU5qVUVheUR3ejllRCs1WEtlVGVDTzRSeSt2UHhHQjlE?=
 =?utf-8?B?M3FVWGlJL0pzS2YrQ1JIS0d3Nmlndk5vU3VZU0tKYURsMXlsMVpDb3R5c01E?=
 =?utf-8?B?RFhjWWV3OGdvTENWV1pYTHBJMXNHZWtNbkJMdEx0SFR6MVFLUS9FK3hEZXo5?=
 =?utf-8?Q?hGaE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0146a2-b557-4385-2b4a-08d9c5efede2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:40:53.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1OGfeJhXXWbsOrIaT+XXQxFdfOJ4MEXewCnvQkdtesZ5MZxK/YRONpGiScT24hd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.12.21 um 23:05 schrieb Andrey Grodzovsky:
> Restrict jobs resubmission to suspend case
> only since schedulers not initialised yet on
> probe.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 5527c68c51de..8ebd954e06c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
>   
> -		if (!ring->no_scheduler) {
> +		if (adev->in_suspend && !ring->no_scheduler) {

Please add a TODO comment, something like "restructure resume to make 
that unnecessary".

With that done the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com> as well.

Christian.

>   			drm_sched_resubmit_jobs(&ring->sched);
>   			drm_sched_start(&ring->sched, true);
>   		}

