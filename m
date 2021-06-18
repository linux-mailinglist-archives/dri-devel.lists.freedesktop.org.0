Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B828B3ACF55
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 17:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E99E6EA3A;
	Fri, 18 Jun 2021 15:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A06EA39;
 Fri, 18 Jun 2021 15:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWM8ZIM7/UEG1oPmRj/5xdGaGC4bHb0WUK1KW6AZb9n6tKH6AKoEleoBNZN7id8jSaAdu7eZ4TxtJPf6+2zqweOju/Wl86+jVwiYyUTBukdBbIcTCwckdJasWPSz0FRubxJ1GfC/NLv4Ud4nRs4HXzVEeVYEXr/BZpNbpGbLauoJAvy4MmEG0TLtEAJBTiCZoMisRtNwFzW9xK27QFNlGjbikRRgc74r00hYy6WJknb47nHGYSiD5EPTiM23y+/dlwH7tSiHOxcuQYTChKr7E85JpPhYjICzJygMdoCAhF6kL/IOrVyMA4semh20YaJrdcOSD4rK+70dSbgZPKYuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TAWZOjpT5bucATXH92Xv9rGIe8N6+rs9b9l8UXk9mg=;
 b=jTTDy6OoWdvC/HmWnkcYERsGoOxpkYErD2UBmBFT+hbl8CVDsLuLb6Sx6lxbqyvwDxm6tqfLkUPjYaxmeGGl7vN/L13MwrmwpaKRhdA5A11bs5bc1ZMX7LQPzQClxGGY5jxl9a0f7oOsxkT8Pxh55PsyDylGgxjzonR2kG08N1M9MxM3hK+8Ya61eu6kq8cNCsjYho1b2tJKRrdjSo/2SvxJw8CsTEo1bYq68SmXTQGElAAJlziOzyrMx1CVMQGSw6XgrUUG2h0dbB4xDUlTXgH7XgB26Jd2hScxyKlmI5/D04ochT+tS2A1NQBMN2esuLPSuRAs+WSIlGoJ7qLY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TAWZOjpT5bucATXH92Xv9rGIe8N6+rs9b9l8UXk9mg=;
 b=PTe/Zlww+W56EbHnnciyfpQbA3tIcvfZohcpPkFMsyyYOYFp2rZfD7BeTB/czuwG9tUNVjo5qOosiStSP6iQbgJ9r4/5rMr1uEF+UJfLRyTp7JzaRIEkqQkuNjxtFtMpSjEazs8Z2kMY6SwEFgllVikzGZtVlu0YJBqPJXpXdp0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 15:40:55 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:40:55 +0000
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
References: <YMxbQXg/Wqm0ACxt@mwanda>
 <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <adee15a2-f531-688c-1121-7504163ae441@amd.com>
Date: Fri, 18 Jun 2021 11:40:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.84.51]
X-ClientProxiedBy: YT2PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::11) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YT2PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 15:40:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aff9dcaf-04de-4c9d-bc5d-08d9326f7632
X-MS-TrafficTypeDiagnostic: BN9PR12MB5338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53386073AEC9A26E5D773D0C920D9@BN9PR12MB5338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMeWHzjrHRUAtrU1u1zuKugP6eUZuVI9dqKSBR4Y9jugpo7xM7D0yXEcI9kQPVVuS8esaWMi0MtHs3abZpBUC1B7GPP2MyVr9FPuYWVCzG4vRgXLqHuE2UmBMvMLODgsChHgOX/C4SCz+0DiQBCHWW6UUgVUR8+cY2Da5bxrE1IyA9sZ3oVLVeMZSOaKNsEw2zJwTt8dzYb/Q8pkPAYTdxI8nGM90XkPrJHLXPmRJ6p3lzb5z9yxvKWKF8Q0qDKG6s4dUGVNcLzfHmDgIahb0b9Q+MgVfBrtB8QVXofGcjYZMKZjKUXnxRBXHhCe+8KyCin+Z4hniXXHmxtWoTBCxeaXL4mONZqsw+ynMftEXoG1UU8hR1rm5NbqRLphp2UkSA+EXK79i40T6/2+UYjjBw2v2imEcYSShcMTaFX7dEgH5wCh+vwkxypTYWbnInzDrlnbvb060COSdHIHnPuEy2er3+n81fxza+N0hEbmZZFiPff931lPfvIal9wvHlFYG+YihCnhcyzdLOJ6KvtM8lXA/owz7lpjrztR3FNc4mm2nfY29pyc9Zp/Bj3NJo5bmHThY/ZKEoxn1zWxt/FhucNS3UqtMvVy4o26MezCE36+fp0OaCRoEwaS1IaCATSbxzy/mTsc9sa40QzAYHnFGhUmLOZWOowz4aOJgviHU1juzeM671diddvdEmnzdInP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(110136005)(316002)(38100700002)(54906003)(2906002)(83380400001)(44832011)(478600001)(2616005)(186003)(66946007)(16576012)(66574015)(5660300002)(26005)(86362001)(956004)(6486002)(8676002)(16526019)(4326008)(31696002)(8936002)(31686004)(36756003)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZuNzEwaEpia0wzNmFlbVFFNDZweHJnRlpUVlEvQUUvTHlvMDl6ZXFlVDd0?=
 =?utf-8?B?VnhVL1lyRkFTS1VGcDYwTHMxOEUwS2w2Umpwamk1TEhwcmtCYTFLUjNwZU44?=
 =?utf-8?B?bDB0NU9ZZElVUWU1dGc4T2V3bUZIeXZjNXRUSlpRcnN1OHpCOVhHaE4wZGU5?=
 =?utf-8?B?TEROQzV5U2NoakdvbXBvU281Mm8yMkpIR2d3ZWdoeUMrQnFGcEkzdFVRM3lX?=
 =?utf-8?B?bmtsdkEyQy84SkVUc3JqVEJhdklMMml4V1pzZTFvRmN2MWNlNUJvSzNrR1dG?=
 =?utf-8?B?ZHNGcHVlNVdHRTM4K09pM0syYUJ2YVZ2ZUw0WVhUSkVxMXVxSWpNcm8rT3Fl?=
 =?utf-8?B?eUtKelJxMEZMNHMwMklyT1FHRm9hSkRnMW9JWkdmaS95bVdlU1FTc1hEOG1L?=
 =?utf-8?B?WjU2REdDYmhjRm9VaVRvWW1FL1ZRSk8xOURmNkxpbjBxWW5rMFVFWDZaK3Qy?=
 =?utf-8?B?cHdVbnhOZjE5dDJsQkFyZnNkMjBmWDlsRXFtb21vZk1IaXplZGJVeVRqY3JG?=
 =?utf-8?B?eEdHUmpYcXNNY2ZBbTlZeEFSYXhwN0szN3hQenk4cEZFWEdwaC9lZzQ2Vy9L?=
 =?utf-8?B?TDNRbVdoOVFEUFF4K3VYQng2aGV2QnRXcUt2RWRldVB3dVJGWE9uOXFoQzh2?=
 =?utf-8?B?NHBwRjdoTW1tQytRZUhFL0VoaFlpSFNYWWJ0UVAwc3hOY3p0azVlaDNPRkN4?=
 =?utf-8?B?Q2FodUpFSTRGd2V0RHVYZVZ4MnVFdE1zZHo5OWpMTzVQb3NtOHMrOUxZOGZQ?=
 =?utf-8?B?N0lmMCswc2Z2cWJFU3VLYTV0SXMrNWg4MWRFeVp2eWdncUpIZ0htdUZNTDI5?=
 =?utf-8?B?NXYrbXdvcS9VdkdVcko1YzNNdnE3OVYxT0F6L2ZKNytVRXlkNGFiK2JaYU9L?=
 =?utf-8?B?SWI0SnpWMDZYYXFaMjNSUWZ2ZmVQQmdWQXpBam1lbEs3WUdMZ1FPOTduU05E?=
 =?utf-8?B?cXFQRzNsNXFEa0FkU1FzMlZtSWFGTm13RFBpQ0prU3U1TFRGc3p1SXFSSGRW?=
 =?utf-8?B?MWNzZjdHS3kyalhpSU1waHNiZXI3MmZ5YUZkT0RFdCswY2MzTCtGTVNqQlND?=
 =?utf-8?B?S0V1NnROekZ2dXJqcHcxWnlINk9GNThKenhRcnJ3VDd5SnJCWUZXZDNldGRs?=
 =?utf-8?B?MDJja2JwcTFuUnNvcUlCUEtrOVBGVndQUUNlUmFqN2ZIT0lJTjJBOTJyNHNn?=
 =?utf-8?B?T2swUEI5d1R1TnhISzFHZkZVVHdWSlVad0lCdlJLWTFrQkF2bVJrbjZTQmdQ?=
 =?utf-8?B?QjBrdHNmbTlZN09idk8wcWEyNUdraU1qZWRST1RPOUVQVGhsZzVLYVVOT0Ra?=
 =?utf-8?B?Tk1tdlRkczNVbitoRSthbVJzenZ2citQTHdnalQwZGpMVmpPTDdYMjA4WFFr?=
 =?utf-8?B?SGI4d0dIaExCR3Bxa2VWRHhwak1ZMTNsQXg2MER1UTI3T0lyY00xOTNSc0c0?=
 =?utf-8?B?djdicHllMk9lY2dIdHdmdmtmSkpaNTR4Mlk0VSt0V0NOcSt4a0hscFptMTFq?=
 =?utf-8?B?YXhkV0lBek51czU2ZEpKNjBCZUloeHpQTFZJNmRpU1lONm45VEdyd3QwMzVL?=
 =?utf-8?B?UDlqNFhpM3dhYi9jVkZZR1BEL3lvQUthN1FIZk4yN0xxUi9lcFBXOVd1RnBa?=
 =?utf-8?B?SElPWEtMV2ZGVGdoMVh1bE1jWGJ2bEY2cGppVEdENHR5UE5URG1CRWVJL2px?=
 =?utf-8?B?bVhYWUpJZjE3MzV6VjFUengvLytJRFpCbHlQdnRiaFE1cmdpL2ZqMFR4NkNv?=
 =?utf-8?Q?+WAnkpWWuOOO8Yi1wfa8otoK0Wjra3/7hUTKP0A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff9dcaf-04de-4c9d-bc5d-08d9326f7632
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:40:55.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJBEImjLaKlItBZ4fHMPG0bOw9ZGoUomMdbbEcipRQkUe8jUxsQ1mPur/A8wykKmQ4HIrkcBhAmbgzG0lBwc5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5338
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-18 um 4:39 a.m. schrieb Christian König:
> Am 18.06.21 um 10:37 schrieb Dan Carpenter:
>> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
>> always returns -ENOMEM.
>>
>> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of
>> git://anongit.freedesktop.org/drm/drm-misc into drm-next")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Most be some fallout from merging it with the TTM changes.
>
> Anyway, patch is Reviewed-by: Christian König <christian.koenig@amd.com>

This is obviously not for amd-staging-drm-next. Christian, are you going
to apply it to the relevant branches?

Thanks,
  Felix


>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> index f6aff7ce5160..d02c8637f909 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct
>> ttm_resource_manager *man,
>>       struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>         *res = kzalloc(sizeof(**res), GFP_KERNEL);
>> -    if (*res)
>> +    if (!*res)
>>           return -ENOMEM;
>>         ttm_resource_init(tbo, place, *res);
>
