Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451734DD557
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 08:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020510E726;
	Fri, 18 Mar 2022 07:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95AE10E722;
 Fri, 18 Mar 2022 07:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpN4BoTj7tamLo/xWONQryq8SJ9i4+LsZ2kbN4fIf4s4adongcGRalo572tmYQVBbyfGTX0GXsVQwrbAP/PIYyuAGgPu25U+aDFNJQObHRBAm7gGFG/nWyTUc4rG8pR8q+psk1FrD90XHRa9aHs2W2L+RJDtmW7il3vAvmGHAXguCaSxXzazUPceK0fEQpnM6E+mktaUn89yf8mXzStZu/Fg8qkkuLP4plBGNreXHrZNmxoHZmNYAJBfm2IerUUZQf5OPWEZbXwuS+OGzVHPo4He1dBj8R8xJ49Z9794aCqh2s3mEnlFvE0tVTqCh9YTHGBjie3YhFdWtTuvQfhlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo60inHq7JgRQgm5YXifEdW5JhL8UZFa8aDQLPf3Wh8=;
 b=aUQSDkQQ7dodLk6WF26sU+JWTjtzwNegUUbKNaqcXgLbhGb9mmRIYoijnEZKG4kUgPIer1NFMTz00TN1x+PnKno9jRVcLBU3BRYuEMpS7nHHQqmEw+69GfWnLvQzdkmMlLmYANl/fyQaM+k6qmzUn5Oast712aAftJI0s5W/qsxUdJrLQtOFBWimYLbWQUp5KD23syX/Pol2Or4uhPobE0tFd2HL1jtX+kww2sD5+kO3Tlv0rxclxnC9vuYOK9d5Xjk547kN2vIsCy767tB2FJDcu/N/WzeY2JgNzzVrJYaYPf0G1KT9BdfB23T25nTlfMFoHOIuWoAkl4a9x24uYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vo60inHq7JgRQgm5YXifEdW5JhL8UZFa8aDQLPf3Wh8=;
 b=h2InElcqY7EL8Vkm83Xwt5HeVNpFkG0IJQTFFl71qBj1/fvnZ1yL3zxUkfAb5YIFZAaBwd/flend5xVrqmdlEM2/OHc6+lFcZGe2WIE2iCfxvxewQMqat8bzaJIPvje4jOXUaGdDijoX3m9s9MiYDnu50D8cgR9CVGIA/ZzO7sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3451.namprd12.prod.outlook.com (2603:10b6:5:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 07:42:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 07:42:42 +0000
Message-ID: <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
Date: Fri, 18 Mar 2022 08:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f0b9fe-36f9-4212-aee2-08da08b2e27d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3451:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB345136C96191DDFC78599E9F83139@DM6PR12MB3451.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wIQ9j5vhxqz1w1YF+D7k5Zt0OLLhX8/XPYC/j2Vubp1DEgA/fzv+H6Y2pMpCVvEbxJiF5shiLYgjZQkcXj5K/jq/kAq32+1oGoRKKGVyJx+JxAt5awMFxupZ1ZzNKKxq/36y7b7piAV9UHMF+f/FrEn2PQKVvHUDJyJc+VkeMeP2NlQemnnJjKeHTJTT/vTkgM7awZk51+WiEiEfuOKoxLjdJcZA+f22Ln+At/EL/A9RPQKe7dJ/ZFPEqPDaoIbHfnMdDE9+m0GPVLXeA3/dnZKwwZkQDloswBg0L4M43WMJg2UwpKcXu0re4VeZtqHoVQ0BBHt8658WtyPGXvensd+mS7MGxMrvvqp9k1KxxMXrYwt4c0UBaZKY2kiAMeoqsut58GInoiEFXXQ05SziHRSMV8cD1UoNwrE8DJUoKz5YqtUVGpc2vhqnDNnp46ogPA/mdTIbnFcyqvXT6RSYix3i8F3lxxHgH0OjPXeMNIMhpLfwU4uzfT2klqUTa1jLdofaoSsrAyPx0dQFXjHJEPJGhxsk8jnqR8yhS8/OcxoFHChk/wak0j98DOrgYOexJfwwDY+4rQ+CwVQ/2JYrXiiMVqtfFmGLzvlsUHCrQKZHG/CkhhmjjMT9DNw45rakVa2dzkBBe4VlBhx29D2CqMnM/uvPxGDuMqcXSEMHyG0+hkZw3hcYj2dbbMTl1AryDHkUWodNC4Y+V1vleE0QgaYukXe3EcJISvHgpfw+piNtJokWW7Ka8iga5EWPyEH6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(2906002)(316002)(86362001)(36756003)(31686004)(186003)(31696002)(6666004)(83380400001)(5660300002)(508600001)(38100700002)(66556008)(66476007)(8676002)(4326008)(66946007)(54906003)(110136005)(8936002)(6512007)(2616005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STgyRkJpeW5XK2VzQmZJM2MvdWpiTVhMNkpIK2pHMk4zUXYzM0tPeE5NaWxm?=
 =?utf-8?B?ZHdaRjZ0c1BMM3Z5YTBXTEtwREpUM3R2NHA3V2ZVZ2Y2Sks1cWcvdFFzQ21p?=
 =?utf-8?B?emdPSjBjWi94b3lnNStkNzVsZXMxQ1phL1ZiUzJlZzZEM2NodW1TNW8rcU1G?=
 =?utf-8?B?NGJUcm5SekcvMTVZQ2VjZzh4MWlObDdRSzhRbTR2SHU0K2lmVEowOTY3eU1E?=
 =?utf-8?B?U0RKNFdySFgwZFdiZm9QTHlFSzNtM2haRjZCUzlOdlQyb2FtcXdGU2QyeFd3?=
 =?utf-8?B?YU9VcUU2amdyejM4WDkvT0Y0YjBiZzJlUkdiTlhpMkNvQll5V01MMU5IeFRH?=
 =?utf-8?B?SG1oVXk5TG45NXhVblpMOXQ3bENMYUpBaWFDZzFoYTA0VVI4RDVpeEEyNHVZ?=
 =?utf-8?B?dUhLSCs1cHpISDdnR1laNUsxek84VWdnRWR6Q1lQTXhldjhZLzNHVnZveHlV?=
 =?utf-8?B?ZW8wZ0VQUC9rVWpBSjB0eit2WEcyNG0wdzlkRk9od05OdVRpeFlZNi85Qlk2?=
 =?utf-8?B?UXRrVmZSeVNZWnBkM3BzOWN1ZGsxbHM4akVlQ0hVdHh0cWpMdjluQlM2TS9o?=
 =?utf-8?B?TFVpUjNMMjNlcmVJTHVHZmpJbHNjcU9tU3NYNDE5SDlTa1czQXB4ZHhTRDNn?=
 =?utf-8?B?Y2EvZGlKT0xZRk1PM0w0K1VPRnlPbThZMWpyK05BNk1jNzJDZ2ZTL2JrOTkw?=
 =?utf-8?B?WEd0bER3dTA5OTlhakNPdVhuRldNYTNDWEU3NFlhUXREQ0RKV2kxVXEyNWoz?=
 =?utf-8?B?RG5YYkhhUnpiTURONjV6RXlidE1tVC9rRzRGNVZad3FNYTRvSVhhQ0xwTzFx?=
 =?utf-8?B?RFZYOEtidFZNc3hIaGpkTjJVQ3lNR0lxSk04SVJCUzAyMmNNRDI3NG9Yci9S?=
 =?utf-8?B?anFTL3A2ZzFhTldXSDV3ckp3Um9WNWUwNjFiVUxEcGpjS1MyMDVJclFZT2l1?=
 =?utf-8?B?YXRGMEJMVTJCT3Zwd0taeXRvNXh2WTd0cC8xTUwrQmh1YzdITUhtUHdZWTNP?=
 =?utf-8?B?dkphbWZXZjcxOXorVS9BOXNCdm9FQ01taVFiSDl4M2htQ1ZOUzZmTyt1eUNn?=
 =?utf-8?B?R0ttQ29TVVA5S2ZXTkdjSkVhRzlnMDR4d050Umk1dlBEbGJmOWF5TWdTVi8r?=
 =?utf-8?B?eUJ3MHFmOUw1OWlSYmxOMnRKNVA0NzhTR08yM1hNaG00bFlJR2txRU5lSGx3?=
 =?utf-8?B?cTY4WFY0M095VjFvK2xrbjRpeEZkcE02dnY0eXJRMEN4eTdNMXc0eVMydGRC?=
 =?utf-8?B?NlNQQ1A4ZGhkTXQ5RzFvQ2VnUkdiK09ucXRscHgweUtJSGZCaW9uQWtldDVq?=
 =?utf-8?B?RUxTN0JEUm10bzdVRWMvN0F6UmQ3dE5tSEF0b0o5eVl4YUp3UFpPekY3K3py?=
 =?utf-8?B?ckxnNFZ2eDZHWTZWQUd0T0x0L2tiZ0tTMmw3RWs2UjJ3WVEvdTRGN3ppZXE0?=
 =?utf-8?B?cmNTMGhaSlNNcnE3R3BFQ1V2S2xibEs2VVVLdnZ1Ny9yR1RkbnAvTW4yVEw0?=
 =?utf-8?B?c2VtQnc1SHZBbFBKNThibjJRNkVMVDI5cWRrNVdPbnUvNjZiTVN6ZS9wZmRz?=
 =?utf-8?B?bmtNaWRtcmJZMkVWNzdkWEwvMEliU0lFL2cveXA2V0RSbklDUFN6SWEycUZ3?=
 =?utf-8?B?d2t0VFB4UDNLbXdqUFNZU3RUR3dKU2xkVGpWak1PNjVyb2lJQzN5cUhzUlRk?=
 =?utf-8?B?MWNvb0MwRU45V0kxNXF0dWhoSUtDZ2tpcWZ5N3lONWZES2kyOTR2VUZvVFRt?=
 =?utf-8?B?YndqazEyNmNxdmNJeVUzOWtzdUFsYm9DNDlSdFZoT25nandmMDRiNWFsYjFI?=
 =?utf-8?B?aE9ZUjZqbHNIeXRoMFY4Mmd6QUhRU0NXQUJGQnFkMW50TURmU053L21iUHhz?=
 =?utf-8?B?R1dkUkNrRHUzMFRnR2dHcHAzWGVJWXI0MHVCMExuNk5KWGEzcXdEOEN2amZz?=
 =?utf-8?B?S2h4akZleitqRnRWaDllT2ZoLyt3d3F5OEg1bEJvUHVRUHBLY1Z6YzkrbGlz?=
 =?utf-8?B?QzdIZmNZV05CbCtLREhtS3J1WDNGN09RN1JIZWNLVVpSUWl5NVlxSXo0MnlV?=
 =?utf-8?Q?FZXYSv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f0b9fe-36f9-4212-aee2-08da08b2e27d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:42:42.7340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kmTdhhLmdJoDp0jVPkvQTbKo7u2j3ZtZ+k6Vp3vcsb37ofhxUiZ2U2mFGgklTO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3451
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 18:31 schrieb Rob Clark:
> On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> [SNIP]
>>> (At some point, I'd like to use scheduler for the replay, and actually
>>> use drm_sched_stop()/etc.. but last time I looked there were still
>>> some sched bugs in that area which prevented me from deleting a bunch
>>> of code ;-))
>> Not sure about your hw, but at least on intel replaying tends to just
>> result in follow-on fun. And that holds even more so the more complex a
>> workload is. This is why vk just dies immediately and does not try to
>> replay anything, offloading it to the app. Same with arb robusteness.
>> Afaik it's really only media and classic gl which insist that the driver
>> stack somehow recover.
> At least for us, each submit must be self-contained (ie. not rely on
> previous GPU hw state), so in practice replay works out pretty well.
> The worst case is subsequent submits from same process fail as well
> (if they depended on something that crashing submit failed to write
> back to memory.. but in that case they just crash as well and we move
> on to the next one.. the recent gens (a5xx+ at least) are pretty good
> about quickly detecting problems and giving us an error irq.

Well I absolutely agree with Daniel.

The whole replay thing AMD did in the scheduler is an absolutely mess 
and should probably be killed with fire.

I strongly recommend not to do the same mistake in other drivers.

If you want to have some replay feature then please make it driver 
specific and don't use anything from the infrastructure in the DRM 
scheduler.

Thanks,
Christian.

>
> BR,
> -R
>
>> And recovering from a mess in userspace is a lot simpler than trying to
>> pull of the same magic in the kernel. Plus it also helps with a few of the
>> dma_fence rules, which is a nice bonus.
>> -Daniel
>>

