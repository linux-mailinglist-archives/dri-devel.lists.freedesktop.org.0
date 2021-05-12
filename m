Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445837B667
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466C6EB54;
	Wed, 12 May 2021 06:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33E66EB4E;
 Wed, 12 May 2021 06:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey9WQatdb2wggu0LDOXgRJJPUHu62zoHyASVsDD0HS+afXRC7ck2Qrd2MGX6B0WKwtl+uXPXpCFqKeBxi2YLIhcfGL0yeUSrvz90Wzk53jX5ZyEYxxABDvKnBgaHRESie+6kjvDDvANdGaxd9uf+tFgMgIreBXLeN/yrHKEYkhIogyyfoiHg8zAlRIyVcRm26jFdHAv6+J8e+1Qn/NOZqs/KxkQIOsYL5AKvA4CNshBwunP12UlNZJjNociYarXalpkzrDQiZTr3+HvnaB71B+8QkUwCCAE5Auk0avdB/5kFFnnbdTi5nM/1+jc9f6x5rjfftca1feTFnvvTkmQkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZCqHdylWZaFo1QEDJ+UAfk4ggiAm4ppv2StY0jzN6g=;
 b=Q7yVoWPmjBIF6vi2LCQIps/cKG6J2KyJc8UXJzZaKaAbFdwUTDh1835SCmQvfEephGrMh35SxL9F2b5vd0uHXQytSnFU64a5HjqcN8LJQH3fc6gd4juTuxuD1Kn1IEEZr2Pqsmub86NnSs/l6zVWCQoAKWphxf72p+P6kuAYWiw/HOvglwzSh7419GVI3DdiEAjro3imBCpDm26dNq8WGa3aFPCUHKw9VtRA1OpSoMB+bKMsIdIkOC7xnQ9xVG3We793zkh5bJNFM9k3m3YH8mIazonN+xC4OlfP4WmEWDIwKS//TTdIHZLniQsA9Ao36BTBbhen3PgfpNa7FKonIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZCqHdylWZaFo1QEDJ+UAfk4ggiAm4ppv2StY0jzN6g=;
 b=XfZqW4miZaHgtEaTvz3kjqwe1lhitDjkMs/v1SzqHcQIgq/cGsfZwoeSyhhMGNHNE7wVsveHwkA/8I0sKVuUmcnZ7u/wc+k1QZ8/NXHqhDgKnKBbZmFMT/SIrXljmJ4682/bcBlMPVd/z9vDD+BP+TDcSlE0ngxiVaIxbJ6LCGk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 06:57:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 06:57:47 +0000
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
 <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
 <8551810c-a095-3906-d982-7bc409140c48@amd.com>
 <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0277869-7244-aee0-3359-21dac8f5a724@amd.com>
Date: Wed, 12 May 2021 08:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
X-ClientProxiedBy: PR0P264CA0190.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
 (2a02:908:1252:fb60:bc39:4e06:ac5e:2e31) by
 PR0P264CA0190.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 06:57:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e7de148-11c0-4103-a7d7-08d915133fd2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39508724E2F7A8C49AAFF07E83529@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3KunsyzuYXqZkocqqtuCB4lCGQZ57nVRD9DxuMrg+vkEX3cq0L8TeT1CplH+WSxZaat+XmMHUtEmoARZe3lVN4bDeKk27SMoSFWtzQJmp5OZ262OtTITjc446f6geQixZkaYlSaUJWW45Mw+fCi92mPi0pnRO64ZNTTxMHdyKUox7OBckes2y4WDs1uCkjPipsxsAaCMSrbMgL3CEzHDaLGg3ni2/ZVhvuktczg79pZGjguPfhDztwzHgC70XrqzKXqk8vsaJsJ6urM2SZDag4SX0WDCiKiAy2DRrFWUZTFj8zqB58Ko0h/CQK9kKkmb8a7Ys1ILRrgpBusGhc4YLaFQ87t7Li9z1+XZm2Y99cfPR3vd1Lc/okKsPFQLzyDZcIIVrV5ZZgzsiFlMdHjsX2JeEa/IRwvjlc+8a9nNAUMlvOrMmrrRH/PuFviZPiNOVUXSvAwe9/dYrRUBovlf240b69fhcVPKqwnDryZ2Ud+Ro0Jb4CvWIaYqsc3O8j7gHd5ugu6QhTqGdSog6SKSWHMlI1mzHE+tRw8D869ZnaA5MMtlAAVw2mUHs6kU18c2MpTyWeyrPSaZs0kfYiNsHxyNTA6Gs+Tyy2HRn3kVTHSuswMbeehA2W5x5ALWWKKj3m3fWRonatUCKkcEXKI1YwM5s7cHZB5sDCGzk43SjqHP8ZjaNWT7HJd7rO6fJ89s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(6486002)(66556008)(66476007)(8936002)(2616005)(5660300002)(36756003)(66946007)(83380400001)(31686004)(66574015)(31696002)(316002)(52116002)(2906002)(478600001)(8676002)(53546011)(186003)(110136005)(86362001)(6666004)(16526019)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnlLbGxzdnM5OTZaRUZ3SzhpRmU1RllKbkFvVjd2d0lGWjVmTkZzK082THF3?=
 =?utf-8?B?WCtKSUprdm52ZmZDb05jQ2IwSCs2eFVoSGFTRUZDUGd4UjNkLzRRUkNKSzhI?=
 =?utf-8?B?OGhna2swVjB2VGcvb05BR3V5aVZQT2twQWMyaWgvQXJ0UFlzSHIvSmJ6UllO?=
 =?utf-8?B?c0p5WXRwalFrbWNIdXNUUXBzS2YwSnJ3TTY0Q3lnTUdyc3dnaXFSN0tQSFA1?=
 =?utf-8?B?WTN0QUhkMDdqWlJ3eXZMK0hQVWVWdXMzcU0zcWdTRVFtOGdHRVY0WllvWkx3?=
 =?utf-8?B?WlQyQlRPR2lQc0daS3hjay82YXBWQ3N1RGpyUUxYMHNad1ptaHNjWTRWNCtH?=
 =?utf-8?B?UithYTRqdkd0UWNIWFRqM1pucjdqczhLN2labTQ4YlhLeS8wc0xnRHBKdjY0?=
 =?utf-8?B?T0ltUjNpZjBZaUFKano3ajE5b3pEYmYrdW9jVXQ3c0ZSSm54ZjFhR0k4dHdp?=
 =?utf-8?B?Zmc0ekpmaGE1YXRmNGp3bVQ5WG9BR095M2dPS25sV3F4ZklIMG43a29taFF4?=
 =?utf-8?B?Q0tsR2Qyb0lkOTN1WnFhTEoreWQ1U2xIekJGMEwwRzE1cStKM0ZITGNyeUxT?=
 =?utf-8?B?WlV6YURiUzMraTRMRGhSckJsTU9iSS94TlRFeklqNkw2bkdlMU83dHNqYi9H?=
 =?utf-8?B?Tm5lY1FDcHMxbHJveTFDSC9CY0h3dzk2L0pUeTYxd1ZpbFozMlJ6aGxFYVdG?=
 =?utf-8?B?cG1lNHNvd1JxcCtaOFBkQzljZTVEOUdCbDFrczJ0YzNmL2JOZHRkWEF1WEFB?=
 =?utf-8?B?aElrY0dKdjl1czF5bENHZTg3ZldOb0h3ajNsQ2hMMjlBcFVRRzJhU0x3Wnd1?=
 =?utf-8?B?WFpxcjJ6WmZhc05nWllaUExJVkZQOE95YWlZQTVKaklCdUw1OHg0MDA4cmF0?=
 =?utf-8?B?SVAvdEhPL2FPMERobElrTlJmbGhVK1g0VHRXb3NENGJMNmtiL0NyaU9WeTdF?=
 =?utf-8?B?UjcyeDVrUStYaUJQUDl0bVcrbzhCRGUvYzJDckhSRnlTckpnWmw1OW1kdG5C?=
 =?utf-8?B?UTIrcFU4ME9LV1QvQmJoZk5IVm9haGM4dlhrYjJZQnVWbC9VUG9KRXBFb2dw?=
 =?utf-8?B?TE9kZy9iWi9XLzRQMEZFc0tXcTBxWWtIMERSV0R3Q2ttbEsyMjM3SFpRT1pW?=
 =?utf-8?B?Y1diL0IrcGk1ckQ2cmRxT1U4Q2VxZ2dTcXd2R1h1RkRxVjNWRVRBY0VqQUlW?=
 =?utf-8?B?cXFSRXZhQjF2aFF0ZDJVbXVXd1h2aHBwMjVwNmErdUlqQmtmUnd3SXNsSHZ0?=
 =?utf-8?B?ZlhJREdxemh3V0c3RXZtblI1cjRZUlF2TitvYmdHTWhvSW9QSzdYWklscGVD?=
 =?utf-8?B?dFdXQjE5T0lDR29rbGUyZGdIVVVHUGViZSs0R0hpUWlzQVJ1eGIzZUhFb3FS?=
 =?utf-8?B?NmNLbG5yajVvWTdnakYwVUxaclQ3N3I0bTBFNTdZQXZ4WnJ1Mm13RURlOVpx?=
 =?utf-8?B?TlRXNk9mNU84VWIvWUtEeUczNEJLL3VFd0xSbVgwcXp6MTN6dnBSWFFIajJQ?=
 =?utf-8?B?a0pScVU5SFB6bzJoc2VQREZUc2ZicXVyNGJMUHdEY1FtSEZGWVg3cmFmOG5y?=
 =?utf-8?B?aGpKMlBpZldjQ3ZUUDVCalluVnVUT0R1TW5IQ2dZYlE5NEJodDJicmZVS3pG?=
 =?utf-8?B?RUlraC83TVlOQXRMSllNbE9YZndsUHMzT2hjOHBhMytOdFpGbmRXeEVBYm40?=
 =?utf-8?B?SDR1T2N5RUF6L2NmM1RhMTcyS2Q2Y3puelp4MHZ3Ly9LMGoxcFowekx3S2F0?=
 =?utf-8?B?NUxLOUI1SGZ4SnFYVFgyU0Z3OHV0MTVBNGxUaWUwZlZVN1V2U2puQVU5Z0tV?=
 =?utf-8?B?cFMwaENsMUpGY2dGU1FkMm9UdFRsTVkxYUFzcTJMVnJkWnE1NDkvOEdPR3FO?=
 =?utf-8?Q?EREwFBKkf4z4z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7de148-11c0-4103-a7d7-08d915133fd2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 06:57:47.2276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVvPsWhxsvQyifdkJxKwZiTf3cxCtuiS5/arfNFZINDlIZMvhZyDLdA68D4ef6Ma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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

Am 11.05.21 um 16:28 schrieb Thomas Hellström:
>
> On 5/11/21 4:09 PM, Christian König wrote:
>>
>>
>> Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
>>>
>>> On 5/11/21 3:58 PM, Christian König wrote:
>>>> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>>>>> Most logical place to introduce TTM buffer objects is as an i915
>>>>> gem object backend. We need to add some ops to account for added
>>>>> functionality like delayed delete and LRU list manipulation.
>>>>>
>>>>> Initially we support only LMEM and SYSTEM memory, but SYSTEM
>>>>> (which in this case means evicted LMEM objects) is not
>>>>> visible to i915 GEM yet. The plan is to move the i915 gem system 
>>>>> region
>>>>> over to the TTM system memory type in upcoming patches.
>>>>>
>>>>> We set up GPU bindings directly both from LMEM and from the system 
>>>>> region,
>>>>> as there is no need to use the legacy TTM_TT memory type. We reserve
>>>>> that for future porting of GGTT bindings to TTM.
>>>>>
>>>>> There are some changes to TTM to allow for purging system memory 
>>>>> buffer
>>>>> objects and to refuse swapping of some objects: Unfortunately i915 
>>>>> gem
>>>>> still relies heavily on short-term object pinning, and we've 
>>>>> chosen to
>>>>> keep short-term-pinned buffer objects on the TTM LRU lists for now,
>>>>> meaning that we need some sort of mechanism to tell TTM they are not
>>>>> swappable. A longer term goal is to get rid of the short-term 
>>>>> pinning.
>>>>
>>>> Well just use the eviction_valuable interface for this.
>>>
>>> Yes, we do that for vram/lmem eviction, but we have nothing similar 
>>> for system swapping. Do I understand you correctly that you want me 
>>> to add a call to eviction_valuable() also for that instead of 
>>> swap_possible()?
>>
>> You should already have that. eviction_valuable is called in both cases.
>>
> Hmm. I can only see it called from ttm_mem_evict_first() which is not 
> in the swapping path? Or do I miss something?

Mhm, looks like my recollection was wrong. We should probably move the 
call into the ttm_bo_evict_swapout_allowable() function.

Christian.

>
> Thanks,
>
> Thomas
>
>
>

