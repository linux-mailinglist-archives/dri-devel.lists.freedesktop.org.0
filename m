Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6463E158C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDDD6EA40;
	Thu,  5 Aug 2021 13:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301096EA3D;
 Thu,  5 Aug 2021 13:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKnT2tGxqNKiPo4YBstbAQ5ve9uLm+SwzKtJfoNetflePAW/uLN2UAxsHH2oMFr8IsCOGHbSyuP6D28fEOE71nvKUMdoP4tS2gCdJy6EPKyLIwccUnqI1Sjc9w1+Vc/GbbSgCz34mIzakN4vnS0laZcSmXcWvbWvRqQbPyxVvB1yqQII+JDP7IYbEW3gjZG38N+deciPYqyC7H2HVro1a7ZMswYsukIrN1I+ZiXlnpm7kBeprdua0mh7W41Oiu275Sq+Qg24OQ9Q3adNCfytWADTwEg5QEM+K8UWPl62NyUDoFcBZK/+fr3QwsPANmLbAPIQ228fBIiL3xb77lRlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuEKTi6N8/c5qIkp8AJxKCe0WHzp0FaS+iRVsK97O44=;
 b=dlr0s+AuwB+XTeKI8fZwGaJtZwhhZOH1Iofceto6QozHRjve0yRLsGPdXu4nyvQrY2+b7ZDKlcLcAR30Ivtyn4EGv0NYTLj0Qu0/2fDOEnpYNNfgpcJv2x+bglZwRutvH9hK7lPnCEUmao+OjbhtSRP/bfYHecP31Mqg3BX9jm1vmvGUi+xQvvDTEL2zqo6vMNwd+MqmGE2KWcTcEeBEsenb31pjj7OfU8Lf3iQBfua+3tSJEawDxSyrirSYvdVEwnbopFOIv3vzE11hSFIQraeG/GAZDH7JKvTuQ1vCDdfS/kOicTTDSw+Yo34RzI4dllak5KjJ2jvS3Fi2oJvJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuEKTi6N8/c5qIkp8AJxKCe0WHzp0FaS+iRVsK97O44=;
 b=Ha9rOWeZ/wx8bgopznnSIs14pC6p5oZ8J4lhV2wMBCH/1zKbGOvxxnmkE1VSLTPL+yqpBczKNlykFpgW8gDunxOUbOSuQ+qKW+aO++I0F2rQWRiWHZzAZMKsthKTeGwdKcMA625UqKcAYTxFdYgf/lOwfZsWTaf/nzD3aiBltDM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 13:19:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:19:25 +0000
Subject: Re: [PATCH v5 15/20] drm/sched: Check locking in
 drm_sched_job_await_implicit
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-16-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <67fa5409-df0d-df5f-161e-695394bd7eba@amd.com>
Date: Thu, 5 Aug 2021 15:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-16-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 13:19:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 204cf2e7-c9bb-439c-5d18-08d95813a531
X-MS-TrafficTypeDiagnostic: MN2PR12MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43588BD7BEC9457C13BADD7583F29@MN2PR12MB4358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJECRXmFv6+LV5GZ19/DXej49fvltA/jMjI9mrifWN9eQ8WIVec0s2qBqs7P+yvU0Mh8LyNd5Wc7lC2UWKKOFZ7/vbnCKHx+g+9vZkormr/RgtcVZz2SUwmqmJn7Gtn6tJIFSGRmCmDugCi4R5z8nzsXgHCFDPvbV6ZF2z/Yko1VqWhk9Si4ggmdpXwR20i5NksZP8a/FVbVJOT3/dqEsTFvQ2WH+eiRYhk6ywQEuo9uuCF6c7keeHrX7YdKohz8VKGdISFQDA2CtPpWIQ/MWX/KGWgGqMxgV9RnMrJUwhR0pYQV+Kn9kArrXhGFCAbldI90MDOwdbkyLgcLsnsrdf07hASftCfGfvMIhqyussGzOfcecWW3Fmj99rMivD1urlEJktzksICh4jldrcwr8LuMLFJ+mFf49NoZC0An4UoynSAQdInSuoUx66nBRD4frX9DpjqH5bEaMkgDzgV0JfG4l545yWCIkcWhBYuP6R3+GGLc7IN4qsvxlfuici2ZXA9/GRZamUXlOIc5srxI8h9k0EynNWtwNyIOg45Be3A9iHfoZSarUr30FUG+Z+crWFUJfHr6Vy/4VFFp/bi1jPS9f+SsN/mx137XGzlbJHgBJjbPHmb1ONemgBUTbinhxbmwUPbbfENZGFJho0gpZRWnGrJLtqYB6tMK0dNrVrFc81bOsE/6jqpMEcUSjPpdbs3h5ZW4UEP4u5pxChou7sEugQdEKY/vk5aczGt+mUMKKcMPjCZS0K/++4HSBe7d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(31686004)(186003)(38100700002)(2616005)(66574015)(66556008)(83380400001)(8676002)(66946007)(2906002)(6486002)(5660300002)(66476007)(86362001)(6666004)(54906003)(316002)(478600001)(36756003)(8936002)(110136005)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlWekJUZFB1UnNJSHlyM0ljbEpaZW45VkU1cGdrZEI2b0FmZ0xYcC9sbzBo?=
 =?utf-8?B?WllLV21vM3I4dzlBVDV0cm90K2VDaWY1WVZKNzZpVVAwQTl0VXdIcnA1V3Vx?=
 =?utf-8?B?UE1NY1lEc2tMRmpzK2lIelEvcWRCOGQ2N01vUnBHVU5HNFl1MWtrckc4blBR?=
 =?utf-8?B?TXVsTVhLNk9xdFkyYU1IR2RrRFBwTGdMRkNybXNBU3JuZXIrMkJYVEtGcmRt?=
 =?utf-8?B?NEFDUUk3RlBYMWVQZ3poMTJZVG9BQWRHM0FoREdIbitvMC9YRUlNUWZWck1D?=
 =?utf-8?B?OHRXanJobDR5RjV6RUtrT08zREhxZnp3aTZnTWVlOWtKaHlGcmx0VnpWVVFP?=
 =?utf-8?B?bEljQXRRMTJhY29yWEtlVlpJMVBweXhtY0VYb3dkTWhndDNXc3VPa0Z0eXRx?=
 =?utf-8?B?blZSL0lKRTRIL3lMZFNmSXVNWkxMSXU2Y1dvb3VKcE9DbjU4Z3RNaW5HY1JC?=
 =?utf-8?B?Z043SldQWDZTQ0dRRi9UTkQxYTh2R2x6VmJsMVE4cFBVVkFwSlkvZ01YSGNW?=
 =?utf-8?B?QTY4Z2xnRGQyTFBNK21RNU9tc1JGRjVBWm5sTTY4cDlKZUJHVi9KTmpxWFhG?=
 =?utf-8?B?eVZWWHRCN2FUTVJ3SEF4VHhhdzJNekdDN3FqdFhjQ01KQWdzQmdEUm5rSFhS?=
 =?utf-8?B?Q05QZFU0cjM2NEMvVjFYd2xJV2s4bEFCS3FISGpvVVVsTUp3RnlSb3I5R3pT?=
 =?utf-8?B?MDRteHhVdFhzSVRGMUMvSE1GOUZ2cERleXh6MUdJWjhEcjloUGh6Rzd0SEdH?=
 =?utf-8?B?WHVERkI3QVpVTTVOSkdUa1NQYzZXeUNaU0d5SjdMd2hGZitxNG5jREZZRW14?=
 =?utf-8?B?a0NlbEhWSXdtaTkrUjhsc2c4c2VqMVpzWURhdkk5ekViT1ZvbDdwbDdoNUMy?=
 =?utf-8?B?c1dhemo5WGpLRGZYcTBJZ0NaUjB3cnUrdEVmWmdhV2VxSlJBc3NjTkhPR1dT?=
 =?utf-8?B?ekhpQXRVUDdVbzRVK0RpVW9vRDgvNUM0L3NrWnhRbXFzZFdJa1FYbFl6QU8r?=
 =?utf-8?B?TmhOZUEramRTekoyWWdEMlZaVHQxWEFYbDhvWTZOYTEzR1pjNlF2UEhuVFR4?=
 =?utf-8?B?V2Q4TEhLYmZxUDNMUnVFY0hFNXlDdlVPWmNPajJxOVh3TGRPZUk1YndzeXU3?=
 =?utf-8?B?aVJLbnVST0prb1pqUm01bWQ5Y0dxSkFweTZBRktnU1ZXSGtyY2hvSytZTHkx?=
 =?utf-8?B?aTEyaldlVkFVRFZ4aDl4MjdndWk2eFlUMm80cUpUYXVRNzlZcENDd091RUNh?=
 =?utf-8?B?U3BQR3V6ZGJ0Q2gwUnIwM0dwcXRxSmtGSmcxTVpuUmIxZWJWSGVGT1F1aFV5?=
 =?utf-8?B?SE5Dc1NVQ3VTQUtCQThMMEZPcTlRYlhCT0pXeTZia1J6RFRTUDNTbWYwcmdo?=
 =?utf-8?B?UlJIM281M1pNa3g0WDc0SlBjREhJanJOTCtNZ2VQQmlWb1YwcW9OeEJWdzh5?=
 =?utf-8?B?TmFudmtXWW5EUWFabjlJYTA2ZnErNHI0WUI3dTFHZW5uWDJmbHQxSWxleDNo?=
 =?utf-8?B?S1ZFVUVxVnUvTC9oZE1UWDhBUGxrUzl1dWNmVnlhUGd2cisyVmxDS3psd29m?=
 =?utf-8?B?NVprY1JDWVZwNFdob3R2d1VoSDJOOWZjbEdIQXBqVEJ6NzE3b05RVUVuNGQy?=
 =?utf-8?B?U215dUN3aFptSm4yejFlcVhiSmNSSmZmZWU3TFFFTjdLSWsrK0RBU1VyNTUr?=
 =?utf-8?B?WEIxSGFSNXFjQ0RYenljK3dWM2NJczdDUDMvNHFGU1B3ZlZIOG1uZFJpSnhN?=
 =?utf-8?B?TEt2TzRlbkcxNHpNQ09RT1J2V2RWWjNnbld6UXNvb1ZNKzZRd3g1MndwK3ht?=
 =?utf-8?B?c2EzV2t3YVRwazhVb2I5MDBueEJmTWhaeExjRTVQOWV4d21qWXdaVmdQMUtT?=
 =?utf-8?Q?iSD13T8T77Z5I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204cf2e7-c9bb-439c-5d18-08d95813a531
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:19:25.1213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2EdA/EDE+chkghIy95PG6iD9b3CvOLdIPWWjkpMrWU+mdij5QvTzWhw/p/pNSsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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

Am 05.08.21 um 12:47 schrieb Daniel Vetter:
> You really need to hold the reservation here or all kinds of funny
> things can happen between grabbing the dependencies and inserting the
> new fences.
>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>

The function name in the subject line should be updated, apart from that 
feel free to add my rb to this patch.

Christian.

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 49e507f91ec0..1abb40b07324 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -715,6 +715,8 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>   	struct dma_fence **fences;
>   	unsigned int i, fence_count;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (!write) {
>   		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
>   

