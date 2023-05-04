Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEB6F645F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 07:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CBE10E389;
	Thu,  4 May 2023 05:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4EF10E38A;
 Thu,  4 May 2023 05:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvSb8CkNEg/s7re3Uzltj50W6J140ur7+lCpkraLfiJA/zOH4ZcRpGtZKgmLtr6YQnZNmvxwKnbNZ00C72KG9eorfodSWToOhR1uds5dkE0cIM1Orada52a3LYfy3IoPgKcLut/JNtmXhtUGPfOS6AZFVLugspcfnWMr1TSbI+CxEWoR+amEjRwmvDjetcTFQseg+PasC/UDItcCyZdH6htm8zdONjGlatWxMBD32mEFfUPOQqpmKl64iSfeI1IvEC4FmQ+YENKr9XxNIcLRFTsw42f5BxpqHy6kAUa8rt9UNuwOPui3Kvq7Xu8cXsWpXqO7Evin9Nnw2z2RmVyvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wghjdrtnYoQfGsIo/6WBYlgLHtCOJo/aNXXHD2HEXkk=;
 b=lm9E9FQbCjrNFcCXuxjx16Yns8+DffukLGpyWORJllB6BLLCKg5j2YY1LPHxLzWZ0hBXss3sT1D9b54KBM+DCso/1kGvCashyydgcTQxOzi3geWYK6mdZL51vXJhQE33XhfXr2dhFjx1pOan6IZCaBFfiJaTQ1vl0nh19+y1DgFNlIdYTDotIKCvxbsYCU+uKDQd+3ElTTCjnjwNeTn7O85x5HWrCKr8eqaI2j9UtOrtpiCY0q4AZUknx4x1KbxKHN3vXkWSuueZG9tbzILUh29ma3wn8gDL0BWiaLot7lPpnmacH9KRHHDWpk7qZkTE4zevw1CdwDEdTl+bSZGVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wghjdrtnYoQfGsIo/6WBYlgLHtCOJo/aNXXHD2HEXkk=;
 b=nsHmxUQR1tYS0xKMa6YRhpwvbYS/wxaG8LYILi9B8rwOPlL8OzEZNorq6Jk3mlMeldLT8pJPtUHS2283R7RNfhRzYTnAbmeZhklg5/gLFdaiq1O3MHGjpYonVeMLZN/5/l5m4N+QqnFJ+Yjkw5D6RAoE5wu+k+e5YaUsF1j8wrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 05:28:15 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:28:15 +0000
Message-ID: <4b35059a-4a98-13e3-29f7-83d309b721e5@amd.com>
Date: Thu, 4 May 2023 01:28:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-8-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 07/10] drm/sched: Add helper to set TDR timeout
In-Reply-To: <20230404002211.3611376-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc261b8-3cf9-46cc-e86f-08db4c605c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EnDl6Dt8NNYu6bS8QEaE6S1ZGBlJqzy3rdKwm0pCIhK9NdaC5B2Uq9kWGRYHzVsyiOmyKpF5plkHkKATf7sM1LqLa6luyMtCqwr06DzQY0vwvKUHxRj4YaZCVf8Sv1K/8zzwLu0kNqA5Aq8vLEMpzO2/C1n9TnOEAI6nrFFGgsYqJSbIK30xDOKluoXvlJ1nmM8CYSvyxT9rIdZaxVnAh1/iqiHhAQvyXHyFU/C104G4MvUX7j5eLtj/A/bL77WiFJxc/5WzOGuHHHIthdBUpzK2ybpwQ/XJvDYV9edFFFA7fQJhbJuln+a5QlIWJLJ8A8fcf+2RoHIgFvkRub5Di8xh5vpt2nVZpzsFuhYTsLN7eHFJcs5t2gCP0Uw9iHsPjgJOGqMhVUXmdl+ZgWDm6yE1SCOzen1sc2mrdjNBwuNG2EY95Iz8HDoldHImWBv6FXWplAPnEEsXwJgEh0Iy7xBS8WSGPo6ISS0Wh9NQfFfqZI8KxMbRSm8wRXD0yBzlSeiOK5l5XGQGAST668TXZ5YSpzkUOmwg0vO3zXPj+hln8Ue69LzF4c7FvxxOSxeP/OdQdLdS5yCiFZVDB5vBJe+fuwLX/I5n+VX3Gkd6s6E4wWT5CX/jBJ27Pr/tInvhFVC1LW3BeuIoW58Ls0V1LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(31696002)(86362001)(6666004)(41300700001)(6486002)(478600001)(36756003)(66476007)(66556008)(66946007)(4326008)(316002)(44832011)(5660300002)(2616005)(31686004)(83380400001)(6506007)(6512007)(26005)(53546011)(2906002)(186003)(8676002)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGM0dm9TbTVVWjFnQ2JLTGVERHgxYjAxRjVzVlJQRTJoVW0zRmgwY3BoV04w?=
 =?utf-8?B?N3V1dUlOYjJZdDNHNE9JdjhFRkVVSEFwRTVkYlVzbkQ2SjNGUjNqb09CQXo1?=
 =?utf-8?B?MEVxcTdBa2dXK0t5RWdGek5PanRaYVYrajBBeHpDdlJtMUFKMmFmU3NEWUpi?=
 =?utf-8?B?Nm9yYUxONkRza1pYVnVxbFlPRWRZdTN6bzhiMG0xbFBMZ0pzbzZsYnMyc0Jz?=
 =?utf-8?B?eUkxTFlEYWhxcG54bjZ2TjhzYm5NR0k3QUlNK1BmQWJQV3VjQ1ZXZDhkTDhV?=
 =?utf-8?B?TGFHY3grNitVOHFVbSticlBMYjVvVWpGSlhHWDN1ZWpvZllxWkhZZ0hlZ0Fr?=
 =?utf-8?B?UlFzblllUndMSVR3TWNDYnhoUEcyQ1VaWk80ZFMvS0g3SUVYMGlBM3ByVnJy?=
 =?utf-8?B?SThMYW9HTEFJTkhudVNhdmp2Q1FTSTFlMk1ab2xRSkpKbFFQbjF4Y2FUc01a?=
 =?utf-8?B?U2Q0NmVrZmZEbndjZDUySkd4M2RGNU5hRGhWZ0JEdDJEclRmMnpmbUpWYmJ6?=
 =?utf-8?B?M0RmSUlXM3ljWVAvSDJ5UTVIOTRIMjNML3MwWFJQSzhiVWE5dlEwbVhRaUZT?=
 =?utf-8?B?emozcjQya3JQNEF3Vkg2TUdHdEorVUl2TjJwcTJGUUxYK3JPMnFraGJLbnlq?=
 =?utf-8?B?L0NqWTcySHNKb25wZkptY3REdnVEeklhTWhOc0kzTDVQSDlrQVhsa082S0RO?=
 =?utf-8?B?bjB3amx3anZ6ZTlIdnFUdTFkWU9ZRlRnK2kweWc5MXZkQkJyYkZHTkcwczg4?=
 =?utf-8?B?cFhtZDUzVERaaUVqZEczb0RDRHVRcjlnUmZvV1pSd0NOUGdpZlZUUmt5d3FR?=
 =?utf-8?B?cVpyNDh1amJuakxGVDVoTHdIWXZ6L3lLOE9KYU5ZNTlKMmVDTG1Gb3hxTHkx?=
 =?utf-8?B?VXU4N2I0dDJabXYvejBoaEE3ZkZkUlFEcVk2RG5LN1k1MnB1MnZnalBqZWhn?=
 =?utf-8?B?NUlwaU1BdjJMemJtWnFpTGdsNFExcmI5QnVlSDJjaG1hMkpURDR5Y0lwMjRS?=
 =?utf-8?B?U0N1MFlNb21zOEFleURabjJNSWlnbXdTSW10eWdJeFVGdDJqanZSZXVKS2kz?=
 =?utf-8?B?a3p0QXpZdENGS0M3bVhKZG80dVhTeUU5eXpWVG9NUVpUR2FMekI3dGN1U0Vp?=
 =?utf-8?B?OXRoS0R1T1E5T0Mxc05QY3lGdTRaOEhWd1JIYzJKZkYxaE90MXhEd1FqVG15?=
 =?utf-8?B?Q0QrQnd3V1BHa3hYdXpiOHVrNlhxbjY2R2RaRzF6NmFjTS9JMG9tb2J6dC9K?=
 =?utf-8?B?OTdrbjFRdER0YitqNmVwbld3Q1BOT1VQUTc5eFlkcHl2cGYrR3ZDZGNMTm80?=
 =?utf-8?B?T1IvTlF2L2UxNDJVdE9yN0wzZzZPUm1yQzFRUUl1UThHSTZFNkxIZzIrSEkz?=
 =?utf-8?B?V2QzZTVZSHZ5NUdPTGp5RDIwTDRFYXVqdGFVeWFrcFlvU1JGR1VEWkFFSU13?=
 =?utf-8?B?c2RjREcxUzR5RnZBZkVFcGp5Q3dscUozV29HdWw4cFZ2a0FEV1pIMHhxQ0U4?=
 =?utf-8?B?KzkxRmtxSUhuQlVxbFA5WlkrM0N3MEpqcnZBRUpRcGFRVDBycG1ZWnJqUUlZ?=
 =?utf-8?B?bnBrOWJ5ajhBaUJockF5QTBVNWJiVGFEclI1d2FHV1pRSmhsNnhhWHZnQ3BW?=
 =?utf-8?B?V1ZIYk8wSnFscjdCb3JFeXRncHUvNEJBTG0waWpUZUlOTXdrN2tiZGlQWVRV?=
 =?utf-8?B?ZjlOUXpPc2pIUmI1ZldlT0hsM0ZLMSswTjhwZjh0Yy81WmhnRUYvY0hreDhX?=
 =?utf-8?B?MzFkeWphZXRKWFZsVGRyUVpkR1lBRnQyYWwxYmVPb0dxYU9PckRYZHZHWUVa?=
 =?utf-8?B?N0ZnMVRsbElhdXBEeXAwWEZBdEdlV09RdWZ1VUZ6VWFQTDdjUGlvZHhlVzhz?=
 =?utf-8?B?SnJ2SWlNV2M5MzRKd0VZcWlxcmVNc1doQXp5UVpPVXFwSUhxempIWUJNdGZE?=
 =?utf-8?B?N3RoeTRKRHB0emk5Rjdic3AxUkF5MlVYMlhSdTZCZlFXWW9FTVVnQUZHa3Y5?=
 =?utf-8?B?OU01S1hhRHEzKzRnVHhjS3JNYVV3UHdyV2dRRlZGdzkyeGhJd045ejA3VEoy?=
 =?utf-8?B?eThQbk1IUG9sU0JsSkROSDM1d0hOL24zekYrOXNqT1VmdFBqVVVwS3ZMdXUx?=
 =?utf-8?Q?gL+3e1/NCym+H+0ASARIYo8gx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc261b8-3cf9-46cc-e86f-08db4c605c4e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 05:28:15.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fzDBW3QXfFtxh3Ck0y1RhSSOPEM+rPFku7FunxzEWoPN/y/6IUetn9qCUvAb1hm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-03 20:22, Matthew Brost wrote:
> Add helper to set TDR timeout and restart the TDR with new timeout
> value. This will be used in XE, new Intel GPU driver, to trigger the TDR
> to cleanup drm_sched_entity that encounter errors.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4eac02d212c1..d61880315d8d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -370,6 +370,24 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
> +/**
> + * drm_sched_set_timeout - set timeout for reset worker
> + *
> + * @sched: scheduler instance to set and (re)-start the worker for
> + * @timeout: timeout period
> + *
> + * Set and (re)-start the timeout for the given scheduler.
> + */
> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	sched->timeout = timeout;
> +	cancel_delayed_work(&sched->work_tdr);

I see that the comment says "(re-)start"(sic). Is the rest of the logic
stable in that we don't need to use _sync() version, and/or at least
inspect the return value of the one currently used?

Regards,
Luben

> +	drm_sched_start_timeout(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +EXPORT_SYMBOL(drm_sched_set_timeout);
> +
>  /**
>   * drm_sched_fault - immediately start timeout handler
>   *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 18172ae63ab7..6258e324bd7c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -593,6 +593,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
>  
> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>  void drm_sched_add_msg(struct drm_gpu_scheduler *sched,

