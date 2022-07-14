Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EF57521F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 17:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042B710EA31;
	Thu, 14 Jul 2022 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2E10E9F5;
 Thu, 14 Jul 2022 15:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIJkDYL5MYGIrNmPN+JZCygyRlPnhHnkeAKQUC6NJN7Z68ArRdu8GhwKh11brDcLpAyesXebS2blzQTxJGrNtEhsOCE7yu81oDH55cn5DTg+ZnecWE9f7kgvj1p15SETD+LNd3W+stSrJM1CUCP+vpaqn60STOCqWN2FSMGeJq7Fy4YOcjGpvtXVZ+t2KVvaxVgNP2S6Ifi4YF9xzLZo4JNTY0zI3hxHo6WHFhJyM+Xo2YhtsNEQXaK3+jzem+uc8wLr2HzphBcfLBTGvwlN9i9ks/EATogr4Xzw857KQ5JDl4+MyymJaol9nMm33NKhVVQf72ebxj8nt7pPnxghMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuGDH0M9rYWFyQnq7SOzb9wrCj9lBMgBM6qmy5yfgtI=;
 b=KP8zqqdb5H8SXEMjhuVVVAhr4MjUVDFjFQhXqBgGa8OtIgeo6RKhSP7dwNPQxy1YNdHA8Gz5wV1YIDuTNfKDKL3OTJHR/3hLGVyOPulkp4bl2vlX1i6H1gy2r5U2kis/5HIjNb5FtADjuX6gMQfxCqh+0/ZAR5U2m0+Ql2T0d46xqHpj4rXygxbl5bBvQCt+JVYtewKHvLXQf71bfdC3NzHzm33X6iSLKScO1dlWY8h6RRCGa7umFuxNXAcCBJTwTmgDgg14D0cRfI0edGEOAGrTdmVMwp+8dFV3mLq2wLSRdO6wXVgvgCQwDGIjW/8tH76d9iufOtk/5BQHO5h04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuGDH0M9rYWFyQnq7SOzb9wrCj9lBMgBM6qmy5yfgtI=;
 b=kZxhU2tg4q14TXLR0BGm2vq2iuBME99GbL2sYFGUM7cr74THbRl1fsZtdlQaxo1kOeslH7z01Jo+28bmSxY+cHdCcKOhkEhHMO+RHg+ihtOxy8nNOSxIcRxsrziVLlKIJs1s8j13iu3c2Is/vW+EyIrSsFWQp7JijIINzgkd2XQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 15:43:26 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 15:43:26 +0000
Message-ID: <9bfa0ac5-b3da-8682-25d7-b818faf9a1ec@amd.com>
Date: Thu, 14 Jul 2022 11:43:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/10] drm/sched: move calling drm_sched_entity_select_rq
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, Marek.Olsak@amd.com, timur.kristof@gmail.com,
 Yogesh.Mohanmarimuthu@amd.com
References: <20220714103902.7084-1-christian.koenig@amd.com>
 <20220714103902.7084-2-christian.koenig@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220714103902.7084-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75c881a8-3097-4027-5b44-08da65af975d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5094:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sdkamwsqIFnqzZIJ6ZHffTqfjzEsBeRIVp9SVy+sDIwAnL2ufmyQ3tHfr3AXBdI4bSFR97BsTgsjkoWhaiBeKdth/xqIWlwm84t5HX805Ah7Uy/RHSwTupS6Hb4VX8E8cfbmolVlQS9XptuiOTkqhlcUP6ym1t4FDiSx+i1+PZ4n6i9vAuFNOKqYqCiQoPRFHeTZZz7FBoNNmxKefsHP9B9SJJcrtkzvz1aENWl8byyScPQ0Ja/o2Wx9mzrir4G7xjSUDl5M8dBF/4m8uRtkXeUxFa6NRYWI2evnGak2p3KP5DAe2Ee+H+sYEtgPYt3W+KICOvS50auzssWAYGJTuAWdacq6iHAmy2j8oPWocTqV88ZAa0u4O8nTUYaEIHXZIFb7PFEW4quPQNlXwk64xUFcPdl3Uny6v174K1SXRpvRcV0bkULQy5GxMu0bVyEUIazrvohRJsIePvIyB7GumEtHqe53TzqnS3uuzOvCafDoOmwJsjfXZUCJNsJ/x2lZDHtqGn6WF4fY4K0dS08sihYqvd3XdwJFN/6IaWtkMoP2kwhVyTB/L6l0S9j6bqp2ashd7LBj0o5CrkIna7YSJ27bJIecF6IBqUwCPyqdmuBjXVtSBD5KXJiKGQ57S3kPa9eoOMRi0JHZKNdcQbHEnjZvsRqAXbUaD2dkDGzgXMxvHJ3ysf6u5n0Py4T3qqeWZzPnYnJNh75MjG3/vk1dCDNhFNbYcST1T7DJhKxDvWBV5O8wEwHx7RKRQUnESWtpZ6EhtPSKaFpXK53EuLjxHWxYJDC4JA71E6pP6C6kLSpU4AY3GDf3UjENtIedQXK/62JKuPEMDZF95V1by+hstHVJc8SOsaG/KrpwfkPfkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(44832011)(8936002)(31696002)(2906002)(6486002)(86362001)(2616005)(36756003)(478600001)(186003)(6636002)(53546011)(38100700002)(5660300002)(66946007)(41300700001)(316002)(66556008)(6512007)(8676002)(83380400001)(6506007)(4326008)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdVbElvN0JyUDhBR2pvWXU2QTJJdStEUWUyaVh5UHp6ZWpPY2NNVE1Icktl?=
 =?utf-8?B?WHFweE9KcmJEOGQ0TWFndGppeklGLytIR09QNXB4UzJsQmpxZXUyaGg3MFA2?=
 =?utf-8?B?SUk5b0wwNG45Z1F3RThySjMyTnJObjlEV2IzZWxoSmpDdUp3d1J3bHo1U1Fz?=
 =?utf-8?B?RTRHZEVYUnZmU0xBbzBST0pSeUx4ZkNFRDByWmxVZTNpeFFLVkptYVZMdE92?=
 =?utf-8?B?Rkx3US9xS3E2VTMxRWN2MnVoeWlnbHdqMDFhNm5iZVFNb2lIRks0K09rekoy?=
 =?utf-8?B?eTdLMURUQWhqblNFa2FxVVFjTGZaSTRPeFFCdHNscE1PeUNRRXB4dnROcFZM?=
 =?utf-8?B?L0FnSksybTA1ZnI4OHY1V1Y4dzdObEFGRTV0TVlwSHZQWlZHSkFsbGU1VGtt?=
 =?utf-8?B?b1JlWklWd0xBWXZZdm1OeVRRRHQ0cFI4RXpCb0F2SkpWcUhTa3ZxRkhkNC8v?=
 =?utf-8?B?MHlkNm50MDZKZ0tyRWJZMUJyNDZlcmpRQXozci9BS1FndFVrams5Y2FnMTJv?=
 =?utf-8?B?VnJsME0wb3BLVlp6dUUvT05tcEs4c3M4UWcvTlUzcElFd3V0WDVlQ2Z0Mmlx?=
 =?utf-8?B?M2p5RjVqRFR2SXlWeUM5YzJyOVlhazRsWWw3MC9MNzJlK0pxUVYzY29XTWxS?=
 =?utf-8?B?ek1lZURkdTE3V1ZmTW1pNURBUmc4WDh5YzNEOHVEUXIzRE5jT2FRY2NKVEFi?=
 =?utf-8?B?ZDg2UEp0dUgvSFpZUDdXejBqMC9ZU2JKbzVTK0ZLcVAyZnBWY2lIc3dsVXhw?=
 =?utf-8?B?UnlWU3lsdVRtTk9tQklXL3AxSGwxdnpteUJUWnBaZlNUNGR6ejdPakovczBN?=
 =?utf-8?B?SUlKUXNna0ZRSGdBdThFN2ZpTGhKampMNW5tQ2dYMnNLdVh2SFRJM21yZkFo?=
 =?utf-8?B?UnNZL2k0cmRMWFlidTNpTmJ1YXlZeWUxM3BVVU9uT3BnVWhrU1JjUDQ4Y3dj?=
 =?utf-8?B?cS9mZlR2UEQvR1M1Y213b1dpeHlPQzZoZ3MzaGpYM0cwaUE0T3RwcWRQQTdW?=
 =?utf-8?B?TGJPR3hLcThUZ2s3ZFp5THVZNHJjNWVpQW9JVkNRWXJ0VVhlZ0dhdHN1Z0xP?=
 =?utf-8?B?Q1ZycDdIV0JDNU9iRVI2SElDYThvOVZjVk1qQXB0MFpGTjUzMGRubktGTndq?=
 =?utf-8?B?aWIrZktsTkZ0UEpWK0hIWWtINGRudmtnVjFqcHNhekIwbXNJaXY3V2lUMWx3?=
 =?utf-8?B?bUFjNHZsNFo1bmNCV0JTdzNyc05TQUtqSmRNTThJQzc1ZVpMZW9hV1diMWpC?=
 =?utf-8?B?WnlyQ3RWc1hHZjVhTXoyRmVQdXh6cTh3eUVmR0UxdVhpWTI0eVc0T3BiZDVx?=
 =?utf-8?B?S2JTTUdBbVZ1bzd1Z2l3bE5PbjJlQkpFMU9INWt5OEZUaGx3QzJoM2JkbWo3?=
 =?utf-8?B?V2ZRVi80Q1l1eDYwcWJaN0F1K05tTFR5UlM0a1pzcE9oR2kyOUlkYmE5R1Ri?=
 =?utf-8?B?VElTU0RmSkJiQ1VhMDBISXFkdkFXOXl6QldDd245bDFtN2dFelkrcUhBYTVh?=
 =?utf-8?B?U1RLOUhZaWRXQVFybTFxVmhYM2dseWcxQmNLWW9nVnFyaFppRnJMeU0ycWhn?=
 =?utf-8?B?bG41WXF1MjRNVVhranN2eit6Sy9obmp0M2RVKzhzWWorVVYrNTltU2FMdEV6?=
 =?utf-8?B?NVI5V2J3Tk5aN1Y4MlpvOXNobDl2TWYwb1FxRVUvVUtBc0lwWFgwazVsaWNV?=
 =?utf-8?B?UUJJR3lTMTJGMkpKSURRdTJ1WjJQOWZDN2RNdXUvUnV6djJLVWEzNEZIUVRI?=
 =?utf-8?B?cE5zbFNOaEU1Z2FWaVBNVnR4Q29PdklzUm9hYTFuM1hKcDVSTTltN2F0ZzNH?=
 =?utf-8?B?Vy9QN3dPSDQ2d3pKVG9XUjRwMFd4OVNJZC9mSExDbk5Bb3k4ODZEVEhjQkRL?=
 =?utf-8?B?NWtKdGoycW5IMCtWa2ZLeDl0MkxKRVU0VXNLU2tocWRKK3hLWkI3aDF2V2c1?=
 =?utf-8?B?SDhJZnJOZmNPeUtJNEhrS1B1MkVnVHY0OGFjNVB3NU5IOTJETDI1Mm1GbHpz?=
 =?utf-8?B?ZzAvbkxTMndIcytMaFJQdmlzc2pLL0NXU0c5RFZOcjNsQVg5SDlXS0RENWMy?=
 =?utf-8?B?NnM3K3hrdytndEd5cW5XTWZwWGNINGxGL1VWN21MbWZJME5OYU95Vk1PNDNS?=
 =?utf-8?B?Ym1mTmgwWUMyaG5PVjFNTXpQU0NWUGhmRy9TcGhXZS9GMEl1TlprY2p0ZGVF?=
 =?utf-8?Q?4fz8g3KPt9I+u8VNrGxhCDHd5n4AZ9zz/X6Hz21IKx3w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c881a8-3097-4027-5b44-08da65af975d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 15:43:26.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5Hvcs7N3b9O31UFb9dMYWg3vua+hTJ+b19rzwVvmdJRPNn6xaQQjmEv7q8BPB/Q9ato64VQwgG6T/lUt6d+0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can you please remind me of the use case that requires this ? I browsed 
through
related mails in the past but haven't found when is that needed. For amdgpu
drm_sched_job_init and drm_sched_job_arm are called together and amdgpu
is the only one who supports modifying entity priority on the fly as far 
as i see.

Andrey

On 2022-07-14 06:38, Christian König wrote:
> We already discussed that the call to drm_sched_entity_select_rq() needs
> to move to drm_sched_job_arm() to be able to set a new scheduler list
> between _init() and _arm(). This was just not applied for some reason.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> CC: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..e0ab14e0fb6b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -592,7 +592,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner)
>   {
> -	drm_sched_entity_select_rq(entity);
>   	if (!entity->rq)
>   		return -ENOENT;
>   
> @@ -628,7 +627,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   	struct drm_sched_entity *entity = job->entity;
>   
>   	BUG_ON(!entity);
> -
> +	drm_sched_entity_select_rq(entity);
>   	sched = entity->rq->sched;
>   
>   	job->sched = sched;
