Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47B565B97
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA99710F0AE;
	Mon,  4 Jul 2022 16:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B2B10E063;
 Mon,  4 Jul 2022 12:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFraxbJhleDVBejT3KW/IEdYzm6Tor2Mu9dbpd1oi3lgHnrsWZYrbYVrTT59Ein22/EqW/2u8APv4oDg5UqqJkmObjR+34PyzXZwfIR+/SIjBctQacttQSVxngKt3NPyEqjyhgp7HNwNU/DR4qGpowtmPZqo7Bv5fEVnOtSDVzzklXhZt9KHRafrHlmfX3cRVZ8QI0C7z6G7kTzbO/g5rlV9U+dtjR95l+nJ+KNzOR+6RTPUNKgb4wMR3NtsUMK0KQK2lFU4GMBnKlt24UqalTumj+ONq8GD1buEyjgx6xeEwKsEUCLC5KtG3I7dZaQxyB8JGVP92CMVgyUu3H/BDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbgHmTXn3+v9HYnad/3V1STrJHMw0NYfwlfzJZmXFrY=;
 b=hz1D0s3084dXOZl3GF6yqlkEd++akO9m4foqbnh+UwjCjl9rIU4STbqD2xBXHUe4W22SVzO7BJwdjijOMICb0AY5it4s4fHnf3sdsQjesyhui02kUYl7oChUMNM5J9EF0oXyKmNB3fLwuKZmiZkzH230U8jaOLfDQHSrEkP3FMZBuZs+VweaJywK/gcbZv0dDIl/hPuFHnAO/89xi249tomhHWOlTNw4Z3TAGPb/PSkS59YAmZe7Q1WQzj7w9Ro8Ug2B74eGhoQ4HpAJ9cHSHd+4e6alrvhuRSEpq9k07Mqv5Biv3XUMrhDdOVnGEatCRcYJ9ezqbbPK/CwBpkUSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbgHmTXn3+v9HYnad/3V1STrJHMw0NYfwlfzJZmXFrY=;
 b=zQR+G2iCvEhg78uVhMePel3JXalIkLupTtTyvt2Elr1FirATQP948T5/VeLpFzI37vqHmcRTc5UFeuyn2qBxlYmJhqOcNiELWSP2JZCUZyM/RTHNn/3XNETvyCaycBJDuchpxh8koCRO8SzKqAmcPpcjLKurCq5cACLiJ36iXGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 12:33:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:33:29 +0000
Message-ID: <0335814b-dc11-4a54-9f24-bb4e9dbef35c@amd.com>
Date: Mon, 4 Jul 2022 14:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH v6 02/22] drm/gem: Move mapping of
 imported dma-bufs to drm_gem_mmap_obj()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
 <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
 <c0273ac2-c87c-2612-03d4-dc52510b22f7@collabora.com>
 <b4086751-9bff-ea5e-93fc-ce2c513b129b@shipmail.org>
 <467a1cee-ba8c-98f3-0398-2a7a5a90b5c3@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <467a1cee-ba8c-98f3-0398-2a7a5a90b5c3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02f79fa1-b173-4a91-0a85-08da5db96648
X-MS-TrafficTypeDiagnostic: MW3PR12MB4570:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqM9tTqsq1qNBqPrPBfeqULoxXfM7jDY/dFSkJliTiMLOdISylOSsJMz0OGMbWpJK45+sQRXb00W7H23YnobVm+W8COMnUyXE9A2334GWNbcCS8fadxdOhtwxBVyis4oZOn2TnCjCs1QWhWmr4hgNj4VKVBUyCgHmgwylTkyYV1ruFHYHNBXtl1LtOLQFjzwmOq7hWWU96Vf42og6zaXhcU39XvRYB32z/mYE7X2535rcYQnmlEUid63ZH/ivQQBQOtChJr/Sz3/10wLuYbTQwj43+bFEpnHw25bcFOeLGYYSTh+JxrjCkDp03MOw4BXkT3XRxiRHwfP6/0R5f6mT9pPQynB7Zp6Eh1vy1lYnvmhkh8nvHl2r1J2Rl9xP8JtnbcgpmybQRiQZOw+mklZh4u1YUCI/s7PcQzY4RDRdzHzTgLU9FOWJD68N5O/XTQ6Y5BajB8D6iN6Wdo5axSOdiI19nRv+fCwh1d6jAt06jsRhQKQkSQXfUEkuTBNObyLUPRwl1jbYa3Y3X5bc4ZI20TjVWzSrFHiP50nBgrlPkHi0r3C0GZk6ColTaCdr8A9RczsGYl93NRazQtNt2E6krwIXem/0AxaLEgquHal7jkU8C/nmeAR7mlvdUJlMRMm2bGETb9gqDx9GiXEeMw9VFk/zklUQeSwelTA1a/7+5bLivaiFB4KmSyhtI90Tqu5PXfcoAbfnB2gg9+r04l1U9YJ/YqDUbrCP7Jb00z7rmESLf/OPJBk/gq0u3yeWGU+DlzFugU4XBk9dSZojY/1gOf/OpavThcBp0n5X+0U7fWoxM1XakpZh2XYiISdUO2RwtBdXge8d6Of71uHODXOq+iGCCTlBB/wIsiR281noDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(6512007)(6486002)(478600001)(66946007)(66476007)(66556008)(316002)(54906003)(110136005)(8676002)(7406005)(5660300002)(36756003)(31686004)(7416002)(8936002)(6506007)(53546011)(2906002)(2616005)(4326008)(86362001)(31696002)(66574015)(186003)(83380400001)(38100700002)(41300700001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1Ftb2x2QXlWQ1pWZFlSWklBandRWEhHVDVXbXljTjVNc2FZZmVnM01qUVJ4?=
 =?utf-8?B?bXpTNUN0dWRNZE9yOGN2d0NSb0RqaUhVTEovaTJNT1VVVEZWWnB0TlhWdnZo?=
 =?utf-8?B?THJhL2VGZkJVMTF0LzJvZG5kTEMxdjd5cWtwWi9wdlpuakhWYVRycmxHb0o1?=
 =?utf-8?B?d3p3bU5ITDQxb0FJV2tGTkVhTlhVU0U4dFdScmR0UmZheURMdkRSOSs1cFJm?=
 =?utf-8?B?VFFwVm1VcFZFU1AzS1RXc0FWUjVlODUyS1hBa1VWWCtYVStIcm5VTDdHWE9n?=
 =?utf-8?B?eDN4UmhWc1Z2YTAvaWthL3g4dDJmRlRFVlNSMVV3Y0ZTYk5rRjg1VFE5WGNF?=
 =?utf-8?B?bks3TjNBZzZrK0tPQWsxSWs5OEhrZUVibEhNbklIR0RWV3JvU2JpQmhFcURJ?=
 =?utf-8?B?bFZhMS8wRDYzWmJ4MWt5Y2xGVTJ1OGJMYU5GcGhGQVhDTnE2dTIvZDc4dmFP?=
 =?utf-8?B?K3BrL21xNFY3dlhza3ZhWDhiWGRjYkdRQmU2YU53UHFGVStueWtTYlVwZnVC?=
 =?utf-8?B?MlFkb1pjTXlYcHhITVg1U0czUlpTdWNtaW5PdG9jb05rTXJOS1pSS1BNRFlW?=
 =?utf-8?B?c3Mxd0dobDlrbzB6N1VYSklzQy9KaWN4N1NlbHljUUk3TnB4TTAwU2tjdG9Y?=
 =?utf-8?B?d1Uxdk5EaHNlOWdDaW9uQXVhZW0xWU0yUGlPSUJXanBrVVVLVW9yeFN6VDFp?=
 =?utf-8?B?am0wKzhmSk5KS2FHTWRCeklqWlB2V2c4aEYvWHQyUXFWTGhCc2hiMHRicmxB?=
 =?utf-8?B?L0E5ejFNb3ZEV0srcWZyT1ZiditlL2ZQYmJHMWtOTGplN3ZtcExuc0xyNGZM?=
 =?utf-8?B?R3AxUjMrV1hVSkcrYlBBVFdzQkJwRk41ZzZmV3pmQjg1YkhtUnl6Z2RhMzBr?=
 =?utf-8?B?Y0RESUhFdXluUlZ5eUU0SUdHMmViWUVtMzQxOUMrTUtQV2tZRThaanRnVS94?=
 =?utf-8?B?Tis1SlkvdFN6WE9ST2ROeVFFR25raWlyNUtwbGt1SWl6Qk1FVHFES0hiUVpD?=
 =?utf-8?B?TlU4ak9kTWd0V1I2SEhDL1c5S0VSWkorZHREMVoxV1VrY2dlRFdzQm5lNmhz?=
 =?utf-8?B?UnkzT1hENXRWbXBNRDdURWgwd00yaVZBRy9oNGhoQU45ZVhaQnFnMzJNVXg1?=
 =?utf-8?B?ZEo1R2oxLzhhYjlDN3VRSWtkNms5djNINmIzMThPZXRCSWpkSlg2c2FqY3dr?=
 =?utf-8?B?d3Jra2tONUZ4aVlEZytJMU9zaUhHcWg1cXllS3owM1hrbEF3QUQ3TVFkVVVr?=
 =?utf-8?B?WThObVRwcHBZOFdNUDBySm9tTG1hZE9UZnk4OXhOYjhQVjhwSmZvaDE1MEU3?=
 =?utf-8?B?SGhMeWJuNTV5Wkl4ZW51RDVhQUlqeWtpZ0lvOW8yK0dVVjdNbW01MVNTRy84?=
 =?utf-8?B?NFQzK2cxK3JQYlFBOThicXFQczhndHQwZDlFNnBOT0FLQXJaT2FuZTVIUzRW?=
 =?utf-8?B?WnhJa3Rrbm0wdlJIWkF5SmZzRjhYQ1BTdjlzV3gyNUllZG9aQmU5RFU2aGty?=
 =?utf-8?B?T1VUczdUdkwvWUpKTjh0ZU1RVytJMW5oQWpYVkNpaWVEc09jeEt5d25ZMDYv?=
 =?utf-8?B?YkdGblp1dXJxN0N3NjJGUDA1RnZNTmNGWXpCZUV4SXQ1TWdaaWozeGppTG9z?=
 =?utf-8?B?ZzVhVGZFWnE0MEN5aEd3UytkWE5kUERMREVlazhRb2pOd1crN2swTkJPR0Fp?=
 =?utf-8?B?UlZSVWVWNXZCWFc2aTJlVFlXbWpxYk5BMkhsWjREV2Vrd0RiSjJycUg1Zk9D?=
 =?utf-8?B?SFgxUHB3dUplOG4vWlZ0UkRYRkhDWWVuazg3TFphREswSCtvQjVlOHg4QWxB?=
 =?utf-8?B?TmNjRzh1S1JLMHo0MTRuUTVCTG5BTFB3S29TQVkrbVhoeU5MQ25heXorY0Ry?=
 =?utf-8?B?em9HQklwaGJaQTU2cWE0dFJJNzdPWi9VRVF4b2doWjRLdUwxVzhIbTc2L24y?=
 =?utf-8?B?OTJSa2Yrd2x3TXpPcHNsS3lLelN6OVgvcE5ISUZPcUxITlQ4Tmw0TWNVZDVI?=
 =?utf-8?B?RmRKWTc4d1JSbFN1K3ZGL3dCRzJvVTNybVFEa09ON25pSUNKVFZ1YlhnL09s?=
 =?utf-8?B?T28rL3FQSlZxUVFzOXdGZWp0UmhvTmRvWUlGdXJKT1E5Q2FSckxhcDFYYXBZ?=
 =?utf-8?B?K3QvWHhUU0JjUm9MeWU2MnEzZ2ZZdUY3YzRWbE5pQzQ5N3ZyWGtoVWdnTkJ3?=
 =?utf-8?Q?5mVXfs7A2BtRTpaDL9AHgWfHfHL3fAqBbEUXDLGOg4eJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f79fa1-b173-4a91-0a85-08da5db96648
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 12:33:29.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBFwRfZ7S+Sw+Y8ldEK4wFdvCCjNTtRSBt0dRwaOuHWKymgM6p6Una73A6CCTvGb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emil Velikov <"emil.l.veli kov"@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.06.22 um 01:06 schrieb Dmitry Osipenko:
> On 6/29/22 11:43, Thomas Hellström (Intel) wrote:
>> On 6/29/22 10:22, Dmitry Osipenko wrote:
>>> On 6/29/22 09:40, Thomas Hellström (Intel) wrote:
>>>> On 5/27/22 01:50, Dmitry Osipenko wrote:
>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>>>> handle imported dma-bufs properly, which results in mapping of
>>>>> something
>>>>> else than the imported dma-buf. For example, on NVIDIA Tegra we get a
>>>>> hard
>>>>> lockup when userspace writes to the memory mapping of a dma-buf that
>>>>> was
>>>>> imported into Tegra's DRM GEM.
>>>>>
>>>>> To fix this bug, move mapping of imported dma-bufs to
>>>>> drm_gem_mmap_obj().
>>>>> Now mmaping of imported dma-bufs works properly for all DRM drivers.
>>>> Same comment about Fixes: as in patch 1,
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_gem.c              | 3 +++
>>>>>     drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>>>>>     drivers/gpu/drm/tegra/gem.c            | 4 ++++
>>>>>     3 files changed, 7 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index 86d670c71286..7c0b025508e4 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,
>>>>> unsigned long obj_size,
>>>>>         if (obj_size < vma->vm_end - vma->vm_start)
>>>>>             return -EINVAL;
>>>>>     +    if (obj->import_attach)
>>>>> +        return dma_buf_mmap(obj->dma_buf, vma, 0);
>>>> If we start enabling mmaping of imported dma-bufs on a majority of
>>>> drivers in this way, how do we ensure that user-space is not blindly
>>>> using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC
>>>> which is needed before and after cpu access of mmap'ed dma-bufs?
>>>>
>>>> I was under the impression (admittedly without looking) that the few
>>>> drivers that actually called into dma_buf_mmap() had some private
>>>> user-mode driver code in place that ensured this happened.
>>> Since it's a userspace who does the mapping, then it should be a
>>> responsibility of userspace to do all the necessary syncing.
>> Sure, but nothing prohibits user-space to ignore the syncing thinking
>> "It works anyway", testing those drivers where the syncing is a NOP. And
>> when a driver that finally needs syncing is tested it's too late to fix
>> all broken user-space.
>>
>>>    I'm not
>>> sure whether anyone in userspace really needs to map imported dma-bufs
>>> in practice. Nevertheless, this use-case is broken and should be fixed
>>> by either allowing to do the mapping or prohibiting it.
>>>
>> Then I'd vote for prohibiting it, at least for now. And for the future
>> moving forward we could perhaps revisit the dma-buf need for syncing,
>> requiring those drivers that actually need it to implement emulated
>> coherent memory which can be done not too inefficiently (vmwgfx being
>> one example).
> Alright, I'll change it to prohibit the mapping. This indeed should be a
> better option.

Oh, yes please. But I would expect that some people start screaming.

Over time I've got tons of TTM patches because people illegally tried to 
mmap() imported DMA-bufs in their driver.

Anyway this is probably the right thing to do and we can work on fixing 
the fallout later on.

Regards,
Christian.


