Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD13D4127
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE026EA8B;
	Fri, 23 Jul 2021 19:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DBE6E9D0;
 Fri, 23 Jul 2021 19:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGRNTTP2ylXnng1n7nWZFG8hdNk49YXxdmD+62Yd9wridNUC1+SJ0Ug1hlvBJ7EEzxMTT1bh1xOL1IMpB7/IUzXmt2gCgTvvLnNeo79+J2wnRchzqekCEX+Z6Aqe1vCc/g/FRHfZKTSr/0qF6AlpM4VLq+UMNJW9ZCdbd+8cEebYCK7i2HCjDObI4QRQOA1h/MYqD2+O1KPlhWf0nLeN9qX4VYMwW6BlAD6yKtUjQcJ/s51SEq9PLu71IJt88W1GijF1MkX9alsOxviLnXgyHXPXaiTchQE8HH+onVFaTQG+DxmG7cRmAPKbdz2bvoaBTqst07ifxriAr/S2m86TKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1lqFbWotTb4Zt5rcxRrMltR8mTNsb3ffbQ6PzFMTQ=;
 b=MgdqUsTliK3pXQdBvceIZLerNeMHhGti9NZ0G2tCUIPvuyYTFOZT/BN3IaQTHKAT+Xil28WNMRqAQ6B+jM9b+JiKc/6XeI0LUfN8N8M4zfzq6742B7W+evE1Is97DzRwPyQlPvyc3kBq/s7FRcuP7xv2w5+bdS6XalCuZv3WWLM0VadR+M70HES6xHi6SqL7N7lKC/BeATw5WPSuWO19txVd1lQtR7I446SdQ94MZI6pKiUcUTfGRI6vU0kyyISIjcO0DrnNfdQHjV0nuRqYSwEFJyJo5sYNgawYfbiMd4ZViW0LPym2VF6aLf6QP/s/BNM9bEYCy3uic7AxQygjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT1lqFbWotTb4Zt5rcxRrMltR8mTNsb3ffbQ6PzFMTQ=;
 b=QTnXXUxYz5zgQhwpYPyJyT5jBN/8B9wVjjRUuqJxSI9NjZGVUEitI3aqrjjpFEbaEGr+feT3RT52lYR9gDLarO6M0XqrPahSxKP9TQ21F9FBaDR/XoU1YdNmls1mDE91qemYmMfd/xN65CGSY7XHFpRHglMt1NBHtE48f5nmv8c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 19:54:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%5]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:54:10 +0000
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
 <YPre51p6TirescUu@phenom.ffwll.local>
 <DM5PR12MB467963EB0A4E98B2182C6745EEE59@DM5PR12MB4679.namprd12.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <d59abe80-ab45-1b66-48c9-1d56075232d4@amd.com>
Date: Fri, 23 Jul 2021 15:54:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <DM5PR12MB467963EB0A4E98B2182C6745EEE59@DM5PR12MB4679.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3da0:edb0::4137] (2607:fea8:3da0:edb0::4137) by
 YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 19:54:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 587c873d-627d-4554-5284-08d94e13a37d
X-MS-TrafficTypeDiagnostic: CO6PR12MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5425CCD677A391D95CA8923A8CE59@CO6PR12MB5425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yLomdrMFtgAL5iYesuggg5er0vuCwMBvZkHCaKywrK4AUBtz9DdaN/6b3ZLzV3pcHgK6r6lcvFotXztP4gso8xyROJJQ752x588q7JzqVDnfVc4Q7pOER77GnWmHQTYs1ogvVH11NFQYE0+x/qjCCg6ZksDTmQtth9AUGtP9cz9Vg3Mp0X5lFUv/UzufwUeKLUK4J9UdF7FUBmX/sD5pRVioaklGvgoBySoc8Lyv/khgzvWcogS6HpGPh3baXkvjWNkoNp1DiYs97oN/arpLmUAu/89sQJE+y8jIqwN8bCE6BFDQsamdjIy/U1FB43MT1uCTN8lHmd0GH3+8ZtV6190TAjHPe0fOPwIFtMEczUAQP+RxJK4oCUXUaCxNARHAZavyiZaexj1ufoW/N3u9/duR7j5F0nV3lEbQJRD7vW1Nhta84hd1xxTcepH4YzANmWqO5ltu3JP+qKCtyV1TywV1SZ9fb6GCawKug+ionTkl1vSICY8kaXADv0Ids8BSdZKeR5Xw6k6j563g45wYP0couyC8ZclPgP7JYf4xf27lYJq1hEvo5s7a39DB/8SyBebSgXrhIxcfCFZJqI1amFkrBfhvJznKwaN76dcaRT+YMZgrf4NiMaxE+64yTfDA13r9agyVPy35ZmFRtWZWlfkoZt6r0PSbRUP1ZnvBqPQ/A6bEUR+2xUHI70VKTuW3d3bfwkVQNTJLhwZ9tmRnqVxiz3Wa+aUuFECFGsyk1pqGVaJbo9BvnoRHwKm4+ZivckLND6TlK6F4UXdqXTeuE6QhtAk9jOmfCguPXibF7EPSVPrtgF+oq5GNF/tYkNC8VzYG7g0JXxWd1btXVnGAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(53546011)(508600001)(54906003)(31686004)(31696002)(83380400001)(86362001)(966005)(186003)(6486002)(66574015)(36756003)(2616005)(7416002)(110136005)(66946007)(2906002)(316002)(38100700002)(66476007)(44832011)(5660300002)(4326008)(66556008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHJIcWlzOUlyWnZxQUNkV09iVm1XUURtTWNlcVFET0tSeEdQengwaWw0a3d2?=
 =?utf-8?B?K0U1SHRNaG80Nkc2eHdrblBsRnRJZ2pHWkNjNHpmSHFhakF3bGJlR0xxTmQ4?=
 =?utf-8?B?dlA5Tm91bHd2KzJyNTNQdmMwKzk4Tm1pcDM4ZzhZZWhKaURON1V3ZTZvcHBy?=
 =?utf-8?B?eGRUZlp0aXhtOG5pc0paQkRCOGZkSUZFSmkxMXJudEpvaXFHVk9GUWpQcStQ?=
 =?utf-8?B?ZWF3SlFuNGpLUVNYeUFPTmxhemptSDBkNGp6MFB2cDZ3TEkva0pkVy9qZDJF?=
 =?utf-8?B?eFJNZ1M5ZUVWNGFEbmQ4NkF2L0ErSXpnU29LYXVxMFBPNjh4Nk1zYjRWeVIr?=
 =?utf-8?B?c25DQUlnUWN4M3RuT1dVMGNhaVo1SXdBTzQ1QTFWZzFNdDQzc1Via3NDeXh6?=
 =?utf-8?B?WVRRUGY2TlJtSE5KQ3RRazVMTjk5dm95VFNIMGd4bngvMDk4S2hOUkc4THhz?=
 =?utf-8?B?aGNTbmJKSFQ0RVgzV043NDJyN2ZjbTg5L2VJUHVNaXRZOFNKa3g3QmpTVGMx?=
 =?utf-8?B?SHg1VzV3b1hQTEY3bWhucTdLOVdLWHpubjdBU1kvaG1jT0ZHS3B2ZW42MktV?=
 =?utf-8?B?UDNqbkVQeWJZZGZXdk1XN1hTektmMWFtR01jR0ZNU2hRd3VaMU1qNXlpT29o?=
 =?utf-8?B?eFlocEZrQXl6UnpFVFlUZksxN0V1cWFiK1Z6ZXZKNUNxSHlIdjNxYWpjWE5a?=
 =?utf-8?B?RUpYZFVKN0FHaWxOUkVEODJoR3cxRjE5R1ZXZUNUQ2U2RnU5QWx2citQbERw?=
 =?utf-8?B?Qk5EMkFNN09BbXo5RW5URDkwWE9na1hYd1ljcjEwenpSdFpIYkdOMU0vM0Ro?=
 =?utf-8?B?MkdNRWo3NE1tQSs5ZTdpN1RMM0JtQkJ5NSsvM0x3RWoxRU5QK3hSYzZvazda?=
 =?utf-8?B?K1BFaE9icmxaN0d2VnhObkxveVlhZjlrc2JoRXA4M3ppYjlrZVFIWUVTMzdz?=
 =?utf-8?B?WVU4UmtjeTFmTG1nUlZISnpzR2RvaExBTllweGx3ZEIyNHBtWFJYUzBsWVpE?=
 =?utf-8?B?UnRLK0pTNzYrZnR2emc5VmNsNVN4SDAzcUx0NHorV05icGVRekw3OEZ0N0Fs?=
 =?utf-8?B?d0w4K0tlVWxJaGQ0YzFKbUJKSTh2UXA2akxzRFk5K3dDSkhhdlhmWDIrcTAv?=
 =?utf-8?B?L2JaWElycUpBRm9iR0FZWXBSZ21vaGZBcVJpdzBTY3pIMEtmQXY3ZWhMNEFj?=
 =?utf-8?B?Ynl1eHM1WnFjMCtsWTMzM0RKdVVqQUgzZnpUb0tFSlQrTXV2SnNqYTJKektz?=
 =?utf-8?B?anpET3htRUJDNkJUZmpNNzZ1U1pIdjA1SE5ncFEzQXJXQXB5WktwSXNkcjVK?=
 =?utf-8?B?a2ZrZDJtU2RadXlVVUFOYWp2clhsc0o5UVJuR1NhWitzbFM0SVlqY2p2VkpF?=
 =?utf-8?B?ZzRESzcyQWpDR2xOaFl4b2xNZkxLSnVJNnhUeUYxWXhMN2lyVnhGcnpsVmVP?=
 =?utf-8?B?b0RjRFpaR0p1L1NzcDNyZU1qTGNwbENYcm9TaUlNYmRXcGJHdDkrU0lnVmFa?=
 =?utf-8?B?eTNPN3g4cktRTnA5am5HQVcvR2xweHRWQlZvTFBMRXVEYk9BUkY3OEIyUmRq?=
 =?utf-8?B?Qm1ua0xtcjRLM2pOcjZEaUpvb0ZyaUhuWHU2MzJ4c0twbVB1VmtPR3QzZFBo?=
 =?utf-8?B?bTdVVkhvUEdWeVRPandIWkZpY042Rjd3M3RnbC9tTjl5SExROTEyY3RHNHRU?=
 =?utf-8?B?dTFpWktrN1M1N1dJMVRTWWJBWkdjbzNMZXFRRys1eHhDMzNremV3S0Q5WE53?=
 =?utf-8?B?RnFOVzdaSFZlN2VqdEhPMThDRmtRZ1BubFBMT2h1UmlzRWdaU0IwdjI1NVky?=
 =?utf-8?Q?UAokL/OzqgO6v9ctbMdnFAN4bhcwlCZJVjIFI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c873d-627d-4554-5284-08d94e13a37d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:54:10.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX4T7zHbQVvpsjEiV4wy5YFR/997qnqmQfjXWnQFVV1MRZgl/G1ell/K1sF8EEdEVBJzfDRcH0087P1x4B7r3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-07-23 3:14 p.m., Cornij, Nikola wrote:
> [AMD Official Use Only]
> 
> +Harry
> 
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Friday, July 23, 2021 11:23 AM
> To: Arnd Bergmann <arnd@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Ben Skeggs <bskeggs@redhat.com>; David Airlie <airlied@linux.ie>; Lyude Paul <lyude@redhat.com>; Arnd Bergmann <arnd@arndb.de>; Ville Syrjälä <ville.syrjala@linux.intel.com>; Cornij, Nikola <Nikola.Cornij@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>; Nouveau Dev <nouveau@lists.freedesktop.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with CONFIG_BACKLIGHT=n
> 
> On Fri, Jul 23, 2021 at 12:16:31PM +0200, Arnd Bergmann wrote:
>> On Fri, Jul 23, 2021 at 11:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>> On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>>>
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> When the backlight support is disabled, the driver fails to build:
>>>>
>>>> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
>>>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
>>>>  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
>>>>       |                                                           ^~
>>>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
>>>>  1670 |         if (backlight && backlight->uses_dpcd) {
>>>>       |                                   ^~
>>>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
>>>>  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>>>>       |                                                                ^~
>>>>
>>>> The patch that introduced the problem already contains some #ifdef
>>>> checks, so just add another one that makes it build again.
>>>>
>>>> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD
>>>> backlight support for nouveau")
>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Can we just toss the idea that BACKTLIGHT=n is a reasonable config
>>> for drm drivers using backlights, and add depends BACKLIGHT to all
>>> of them?
>>>
>>> I mean this is a perfect source of continued patch streams to keep
>>> us all busy, but beyond that I really don't see the point ... I
>>> frankly have better things to do, and especially with the big
>>> drivers we have making backlight optional saves comparitively nothing.
>>> -Daniel
>>
>> Yes! I'd definitely be in favor of that, I've wasted way too much time
>> trying to sort through dependency loops and other problems with backlight support.
>>
>> Maybe we should leave the drivers/video/fbdev/ drivers untouched in
>> this regard, at least for the moment, but for the drivers/gpu/drm
>> users of backlight that would be a nice simplification, and even the
>> smallest ones are unlikely to be used on systems that are too memory
>> constrained to deal with 4KB extra .text.
> 
> Yeah I think we can do this entirely ad-hoc, i.e. any time the backlight wheel wobbles off again we nail it down for good for that driver with a depends on BACKGLIGHT and remove any lingering #ifdef all over.
> 
> If you want maybe start out with the biggest drm drivers in a series, I think if nouveau/amdgpu/i915 folks ack this you're good to go to just convert as things get in the way.

Sounds like a good idea to me.

Harry

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch/>> 

