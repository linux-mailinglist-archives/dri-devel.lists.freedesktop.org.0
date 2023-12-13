Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC18120B7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1810E883;
	Wed, 13 Dec 2023 21:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3485B10E87F;
 Wed, 13 Dec 2023 21:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8BoR7CeFc65nX9LFjk85/yE0JbNLnfZ3SzW5fEYHSlXsSyoSuBB3Efa4gc5+ob3fiIqO8RkACTnkwhBmEkJ1OSsjuTp9NQdhOAihz859yp0+lcFYS5/Hc9oUDwwiL4zy0uiT6L+drJnsjr4tXD3gIAkrGmP62Lz/drAn2/JhfTVWms8BIiDn00DtYIlhk2/ftxanfN00L6Iikyt7PoGaUj1YIcrypSJpk7LaWqmq+JUXyzsJrd5vOeCY6ZP9MHTX/41FS1OirqEh8uBv05//RAlccqf7f5OPOKqw5UJyD3xMH1SLiUeZHy+q1vxmDi3KcdqpbIev/tPbA/nHaDm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpKXJ09r6vRktf124RSeRrLdCHkBSABdJLPfm88IlyE=;
 b=kQ/oVAXWjBCbNV2/6No3dR748wPz+wJl8GcuSpurpd6COYu9ElWqbFt+w8yeySEQvYSQ5HkJ2u/OtvnmKYqszIJEFUvZsltZqaoEFdkJ37a8eUsElIp5hqJrOLT2vngwpyng7RV1AcgMvfA7UXcafhlIsZKlZvjHtpP8GFBwVEtXTOejbwdt+8LqZen2j1C0m8+OTozDk0Y5aaBvG1AEY//OKdj+5lkrZQBIbaiUYoB/6D9WXCLj8H9XDp2GDc3EkeC0VCBeYSJXAp6kS45+wdKyCTtXX94RKSezY3RHIMbzTdvx2AZ9czt4RpoSDFMApSstyi71eFm7/qegrLPjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpKXJ09r6vRktf124RSeRrLdCHkBSABdJLPfm88IlyE=;
 b=4jpSIk3PFaNMqstnJIopgwyAcKDWgUm4jFCw86MxMuWAQ/ypyFnpO2t7xLUyycVB802hfCC65ceQlpKM8GzAiIhfpVzUK8QugstRJ4xYNPB6VeOGycenW5g47kfmZvIJ0uhyNl2Nu2xaSTH/X7d6RP4eFrt2EQcGP9U13CytqTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 21:28:47 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::ee9b:7998:3d78:78b]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::ee9b:7998:3d78:78b%7]) with mapi id 15.20.7091.028; Wed, 13 Dec 2023
 21:28:47 +0000
Message-ID: <83dc5d87-6374-4558-83c1-202c0b1add5f@amd.com>
Date: Wed, 13 Dec 2023 16:28:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: update drm_show_memory_stats() for dma-bufs
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-2-alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20231207180225.439482-2-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0183.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::26) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcef2ad-bc09-4140-0632-08dbfc227dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/V/Ki8woBucI94cjzXdLt/uq//NsUeZGPg9FghObXGk4vQNs2GouMF941r0tF1i6nrkLKmRPg6nwO2aWzIlfZg6yckokbIW/ATpF9zWp7HKvPVopETQJE5D1xrKsPsjLu//JAfWlcK6BJP871JcC1MfqKK3a+DvjyACDc1Piu8G1bVVwX8wEzpu7/hZGMELiSLGzUXfIyYU+4qQL6zOjdJ1npmAYiXxk15LT0DHtFcab60gtV2hzXey483+YMsEMGlHyRzZNlm4JipO81eewfQPBCKrSJSH/dkK3K2htQbWEUIoBol1K+4Irwiqh9kRvQGMGSv46ehoDDo0sdApQFAWwXQfuqhpMTkgN9ClT2wLhX82tpNVzNOFQLrNdjEOdZU8OCn97mEhc2uWsStj74AWq9perDsYMkGnFZrIDI8pE6DP+Yw46+ZGueQvKDcKNBr85/uK0ohsXznwr/ytFwe48lsSg9cxnjQBsdSY8zpLkw0spK9D/2aS/uerpswUd0SHystbD+dIwejB4/5p2Wk/1UEzQ05/RHq8SQftsGjrHFv2BIBz7QWYR8sCXCGIcde9g/0ZqWRmGdvAz93Wpv9KdVZ6UGg6C8sV0BihgajojI2rPwQT9mKoNJ6PHKao9IZGrDp9HlIKZ5hK6KwH7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(83380400001)(26005)(53546011)(6506007)(2616005)(44832011)(6512007)(8936002)(5660300002)(41300700001)(450100002)(2906002)(6486002)(8676002)(6666004)(316002)(478600001)(66556008)(66476007)(31696002)(36756003)(86362001)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhZWUppOWZZNG4vbEhVZU96eXRKV3FRdEpPNmI0SVcxOE9ScW11MCtFSHBN?=
 =?utf-8?B?WHNUajBUaWJXUnpGMUhDWmJKWlVTR05jeDBHb1paa29teUlQKzB3WWF4aW8y?=
 =?utf-8?B?dGFDUEkzYm5wRHpzL01NZjU1TnB5NlRzUmtJYnF1NTk1Z3dNUy9zSWw4SDBy?=
 =?utf-8?B?bU9TaUJKaHVRa3lqUXYvSjNubVhLdlFMRW0weFhSWFoxMjZ2ZzE2MmU5RnN0?=
 =?utf-8?B?eVdiTnd6bjZkM2JubnVua09nb0FGbzVJMDA0MW5lVFFiRGZFbzRVRE03Y01F?=
 =?utf-8?B?YnJEWDlUNndLeTZBM3hJY2w1MFZBUmQ0NDc0dDBTd0FGTnp2Ty9DYmdyZmdk?=
 =?utf-8?B?VVNpd1ZUTEV0RlZ6RXJIVWdOOVQyVlRPM25lQ21rMFlTTThlTlVoR3l6ZHRD?=
 =?utf-8?B?VDBWeVM5Zy9xcXZ0UFQ2dU5CbXhBRE5GVDl2T2hUeWxVOG92UDN0N3duaVZT?=
 =?utf-8?B?QTJqTW5TOUJuV0tCdHQrME1FSklBL2M4UDliSlliWFhZa3RQVjZHTDdFMXh1?=
 =?utf-8?B?RW5JYkRqTy9NR2o2dUVYNHJUYUpjQ3diR2dVZVlqd0krMFNvNzVnWVNIM0lE?=
 =?utf-8?B?QnRhL3JSM1E4MVNvWlRFeG9taS9BZktBWGdNcEdILy84d0txS2ZKalNzeUp4?=
 =?utf-8?B?Q2pWRmg3OWFubUk3U0l5cXhPb2t1SDRmTkJROTRsR1BDRG14aVJPVWlTRjFR?=
 =?utf-8?B?TkxXNXduaS9pNFZWSFNNZ3NXRVUzZS9VM3NaY0FaWWFXV1NDaEI5aG1XTk9m?=
 =?utf-8?B?NlVoNlBmMjVobWpzdWREU3BFcDF4R2k4dVRheGdzMllVUE9KT2NGVk9oVVhn?=
 =?utf-8?B?QTlObm00VUNyVHROeXhEY1NqazU2amZHa0lkTnkxVm1URGtlNTU3NmE0bWtj?=
 =?utf-8?B?QXY2bXpOM3lTREl5eUFXdmU2bHhBWVlXSjFnaGtaeHkvM1hOaTFjaGQ4WWJ6?=
 =?utf-8?B?alYxWjVqTm1Hdjc0TkRUNHd2bXNpbm9zTXNNQmhCY1dKNGNSbWtBakhLQTVu?=
 =?utf-8?B?QVU1QXplWnJSSEh5UFlOZnNhOFd6ZW8xOW1qR0pFeERadUZKZmc3ankreXcy?=
 =?utf-8?B?SFB5RlExV0RFTEQ2UWhJbmIwTHVFR3F2QnQzZksyaEg2UVNsM3V6VmtYRGRN?=
 =?utf-8?B?Y3I4VjMwbHprd1lGVkJRL1l6NEdWazRuVzVmWHUxNkFUWDFuUDFXYmcwcWNH?=
 =?utf-8?B?Unc0RGVBOVN4MXREUDZNOWpBZmVzMmFoSzBMaU8yditZMSthYlJXM0tLTkVT?=
 =?utf-8?B?dHc2L3ExNkhmeGI5ZUtYRVJIT2xWeEpMZjRia1FXRWpoQWFoSkVSUWkxNkM0?=
 =?utf-8?B?d2pDbnVZOUZ5VThVdmU0aXZneFhwOHlCaENjWHNBaUpCVVdLUkMyVjk2RGh0?=
 =?utf-8?B?dWhYVXJpYXdGcjl3Rm4veXNaa0lobVM1NnZXa3gvajI1M2IxMG96QWhodkJ5?=
 =?utf-8?B?SE5RLzlFL1JnRFg2cDlTblVYd3hiSDVIcGlKNWo4TjBaNHhFWmNTY0g3V0JR?=
 =?utf-8?B?SjloaG01UVVnMVZXeWR6YnJMOW1wd2xEWTdrUXpYZlN1K2wvNStSdk43Njgy?=
 =?utf-8?B?eWx5cDlSM3B0N3RhRE9kdVg0SHltUXBOK0xPKzRZM2k3R0VqSWdvWHJURkRV?=
 =?utf-8?B?RDF6alJDUUwvVFpvNlh2Z0czZ3Y2M2FyeW5GVStRQ0V4Zitta0wyS1B4T3lI?=
 =?utf-8?B?MnoyOXNWbVV1cTFkWkc4QVY0azVJM2pVSzRBV2FjZ1hSbVpxU2RMM2VnNTZs?=
 =?utf-8?B?MzdSZDIwd2tBcEZlTU1US2NiVDR0U2VzQWNKY1RtTTF3U1hEaElIWFR0aTBi?=
 =?utf-8?B?SDdwTTI1bHB3ZFo3TW5kWk8xQ3FQcWNhWDdjUDZyVGtELzh5NjY4MlVYejIz?=
 =?utf-8?B?WnNqZ1g3NWJaNTFlZzkvSDlyNGhEUE5aYmNGZXpjZHBhQ0tjQTBzQUN3RHB4?=
 =?utf-8?B?UWUzNllOZnRmS2JBSmN5NW5vM1ZSYU1uN2loVDNOZVZyUmpZOW1VWkk4aTdX?=
 =?utf-8?B?T0RLRkg3bkpqVUc3V21aUWRGb2kyQ2NVWElLU3JRZnM3bktFdXRIeEptT3Ns?=
 =?utf-8?B?amhxeHVBTGFLd0hEM1p4OEQ5VHNYbTVSSlVKNVRVWld6cHRDcEh3alp4cG5i?=
 =?utf-8?Q?1u/KFMAK1fp7LrxDYOUuC2ZLh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcef2ad-bc09-4140-0632-08dbfc227dcc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 21:28:47.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtBJ29wEK3qppUay/hFoezD2s08soS2yPD6Oc27tTP5pIh5R9R2gozehEuuzKuqJkjqO23W7hcxeUyVdz5npng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
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

On 2023-12-07 13:02, Alex Deucher wrote:
> Show buffers as shared if they are shared via dma-buf as well
> (e.g., shared with v4l or some other subsystem).

You can add KFD to that list. With the in-progress CUDA11 VM changes and 
improved interop between KFD and render nodes, sharing DMABufs between 
KFD and render nodes will become much more common.

Regards,
   Felix


>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/drm_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 5ddaffd32586..5d5f93b9c263 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -973,7 +973,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   					DRM_GEM_OBJECT_PURGEABLE;
>   		}
>   
> -		if (obj->handle_count > 1) {
> +		if ((obj->handle_count > 1) || obj->dma_buf) {
>   			status.shared += obj->size;
>   		} else {
>   			status.private += obj->size;
