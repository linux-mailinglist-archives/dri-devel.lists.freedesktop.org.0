Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2435A0A09
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A87D90EA;
	Thu, 25 Aug 2022 07:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B0D90D1;
 Thu, 25 Aug 2022 07:22:01 +0000 (UTC)
Received: from BN8PR12MB3426.namprd12.prod.outlook.com (2603:10b6:408:4a::14)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 05:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk0FeJXZspU2IsynjBlAMVcZmEFlX6N5cGB3Ir7YVTKUB6/TsHHqrNDxo5ZYT2FDhtGCLqJm2+TjswPytN9DXbA0UPPQ8TqZxZrtGd5df0SiI4QBk9QbL7fGiNbqQMbnM2lFwh2KUwnUoBPYHbk7ZBZSdO3+MDc2j4YTybvQRcxq8DDap9FP+2reouTjMrwhTb6sMv34t9Sy+p51qjFz7jUubY0W/Exu1mXmewfWsTEe/JY1HYSkLaWS+X2Rn/cW88JP+fHp/qO/SZ1TyBBcVAJFit0EldxSDkJce7wSdLzC5ObtMK/DawRx4Zc/ppTNJSpvr8Aqx9yyh+I0CMdHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GEB4Gmf8gYzYzw0SauFbEYt7He09/ibyOEjSkXO9CY=;
 b=DDt3k5QJvEbQ7XmTsFzzTJIV4feVrOlVExqDFZ8CahUfZouK4EpTh6K8IH2br4tQf+lhLW/jD6cx+suhj0AuGIPQIO7JhWsHodpd2DXuEb9eDcdLBdqJNZApWQidCWDHefGcWzDxaF5BDU9Tay2rKVCf4NZz3d87T7HqYHd7HtY5M9rFt97FMwy9tDcnFuaGaGdCDByZi/YKYUlsKOI/GB9Q25Ht8QIDhtt3hqmzfEggWVu/rjvO2daC3+C9nOcXYarQdwxgEFnWNvUgOi6pxfF2SDhQ7qpa7oTN2fZ+cPAc7k73PTcdDpSCPhj5J2BMHaogrDNUX0SZFmu5So8ltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GEB4Gmf8gYzYzw0SauFbEYt7He09/ibyOEjSkXO9CY=;
 b=YerBgSf/XFpE4iZnDoi4PdcU89++Ab5YebBHtep9vpBfkO9NM95ZkO1zvEUZJww/ZyfP8KYERR9PlBKxYEYes3oej/siq7tlxUslb8sSAOM8c9d7sUTm9n9ug90Hur0jH+cvmne2MSfenSiPCyESZmlr5K6BftLWA8CRo3gqGM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3426.namprd12.prod.outlook.com (2603:10b6:408:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Wed, 24 Aug
 2022 17:45:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 17:45:19 +0000
Message-ID: <e7576ab7-ff1e-e6da-b0fd-0315f1b37ed1@amd.com>
Date: Wed, 24 Aug 2022 19:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v3 6/9] dma-buf: Move dma-buf attachment
 to dynamic locking specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-7-dmitry.osipenko@collabora.com>
 <055c3c05-ac4c-430e-f2b9-08f000acf435@gmail.com>
 <25d6b7e7-bbcc-7613-42d1-13c2b9ab2937@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <25d6b7e7-bbcc-7613-42d1-13c2b9ab2937@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f7c82e3-68ba-4b44-e526-08da85f86966
X-MS-TrafficTypeDiagnostic: BN8PR12MB3426:EE_|SA0PR12MB4478:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkEyVwKuUGqaWjF1MugYM3eqay2SkldryTEYCa8fcn8T+/ffBrdLrmie2jlarrGb3vL3WTSkS80Slp//Lk6V243xs1mHY6JS/zL2HG4LIwbxU22EXbp8NPRkXQW8qysi/1rmwapGb8BjDbsIFxSPc0h1HwTXaTMQWSRj0zAXHqp1wQXuquisDWUTp1WMN4ahcZBfsD1HSOzmVUjOfSjPKXqMOkscLRODHntcSmvsgYiKZJAI37cnKT1KuiJMzVaCSFn0VUtKNbZKeD5Zi7x4Hei6LcDUDRoYnPv4Kzhm6eExFFwds3MApBRXe4MYUaE3/OgBygkQ4xXaysIfyg/9umsRz79tbWhoInrPG3O5M91HdUbHHeBvV8h8uEXrci9x+3COgA8ZAgxDi3hH3rzfXRBaQFNSKTRP3QZVHXCUJG+r0ceHhsmw6EP+fIrdjzn3gmkwh8VuQj9WVFUQoILkq7Jt1ei24BxcIJYyuAFXpto2tM8kyGl/Hz0tvLgO9dNUZoTuBb0JVq9mZ13cXmG5j5nHSqppmUqY1ENIjKIyrMR6sKyEMTJtLIC4ztLjQosmUUTI1Z0T64AaV+EOh+GuXwmWcDvb/lPbAjczo2Vs6nhfNgC4h2d7V18ZEmSPouJ5g2ejXDZBcf4I12GbE8Ej44ga0Kb+NmGJhttT4qYvHV9lgDFHtZDOnZcfX41e/R1NlIE02aNFBjc7reqg3EyJsg3hq6vYx3ySE9LAKALdeXOiMx1nI23q7Si2pSynsdup+A+Lv5DyAAY048pYM1TTEZxp1ZsXn2JeH/Lo/fXQEJpaGZZFzz9QiLF9gtUG6JLh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66556008)(66476007)(8676002)(110136005)(66946007)(316002)(7406005)(5660300002)(7416002)(4326008)(2906002)(38100700002)(8936002)(6666004)(31696002)(86362001)(921005)(478600001)(36756003)(6506007)(53546011)(6486002)(41300700001)(186003)(66574015)(2616005)(6512007)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QitJVWFodnhyVEVnVHM5VUErc3UvdnpzRWpWbTFOQmNBZE1zU0c4VytTRXhY?=
 =?utf-8?B?cXdaeXVaRWZZNklnNkdjdjJSUjRsQlYyM0xDTjNFNHB0Y2hnSE5xU2docGtJ?=
 =?utf-8?B?S0d3ZTh2UG54Znk2S1RJQW9DMXpsWDZRcytwN3JMZzdXdHpQOFVFNkhKRlVX?=
 =?utf-8?B?anNMelBVQ1RtZGVuUmxyMHRKWnVnYlJrbHNuMUhFamhBelhJRkJxaDN6Nk4r?=
 =?utf-8?B?OGp3QU0wVlIxWlZyL1o5UFQxNDdVNEpBK1NPQkplOEZ4RFFldVRkejJWOTFn?=
 =?utf-8?B?UURLMVdzK3JJTGlQZzZiaHFVaHpsOXdrNE56MktTakxlUG5maDFEQ3FKZzR0?=
 =?utf-8?B?TVZ2NHprdXZYV3IweExFZzR0dDZuckJtVllIcWFhM3B0QWwxWU10S0lzR0pB?=
 =?utf-8?B?UStTYUFMdENrYzN5b0Y2anNDOTBmbXZFanNLbnM3dXFna1dIbHNoQWZaeGJu?=
 =?utf-8?B?Njg2UnFIZHdpNWZsY21jQmVpSDV6ZG5iRU1jMjFkMlZxRGRJQld0RDY0dzBO?=
 =?utf-8?B?YlpaZ3UxbGVNa29rdVJMbDJVYUxYZWZpSUEzaEp6bzd3VSt1azVnT2JTb3Ux?=
 =?utf-8?B?VXNuMHN0L1BvS1FuUjdHS1lMeVNUM3FscFlYNXZjN09XbmsrdzN2OWtBT0hu?=
 =?utf-8?B?TGN2Tkt6MnRCemMzSU90T3krYytyQzJDbVpDc2FuQmhyZ2VlVFJRQjBQcXBo?=
 =?utf-8?B?d1dTc3FKWWVPMFpxK0JzVUpJQk00T2FxOTNyWHkwYUdOajBPZDFjeFlZejRr?=
 =?utf-8?B?MWQ5ZzNSdktOMkNONGVuR01sRUIzc1JNUFFOKzEvVWl6QmFZSlpYNXJqU3k2?=
 =?utf-8?B?b2hPRHpsTEhPTjhXbUpZajc2M3FPMUNpbk5Kd3cxQndsRmhCeEY3QkNaL0xm?=
 =?utf-8?B?U1JNRzhIYkR4SWZIbUZUb01NTWtMY2JyZEsrNlM1SnlXb2dZYk9SRGVnZitZ?=
 =?utf-8?B?TnczWDJrSDNUK3I2Q3FSUXIwN0dweHJ4dTA1aStVOWNiWDV2NWdIUGtzTWFV?=
 =?utf-8?B?UnJGMDB1S2NrNWxYRW1SZ1hNbXhFTVY3UkVoQU1xM0Y2RGlRYnlnRE9GbXFq?=
 =?utf-8?B?c2NhcW1lVm41eXFBVXlRT25Jc2krenA0Qi9TVkhDOXJadUJGRVlPZmIrbkVJ?=
 =?utf-8?B?c3pXaXFyc3QranE4TUZDcElEdS9abHZZQW43U0tmcnlJd1R6Z2twUDB3NStR?=
 =?utf-8?B?NEJaNDU5cTJ1bU5MYmVKS20yTGVYaklNZC9GRnBUd1hQcm9XdkJRR3o1MGFk?=
 =?utf-8?B?Z21zdzg2L2NOY3JYQ0ZVcXg0NS9mMTNWWmJ4YTVzVE1SVnY3ZjM5QndYRERu?=
 =?utf-8?B?bE9lSkMrV2FIQnd4NEdRNEN3TGVLdU15aVAxQVRwekJ6M25oZmpNY2VVQlBV?=
 =?utf-8?B?ZUtZQ3B1NDdGazRIVFI3eEZnZW0yNFRMTHhyb2d5TTZGQlNXbllzZlJ0bmFx?=
 =?utf-8?B?bERkaDNGRldTWWkxUXY4Zi9ScktsZE1NY1RwdGptRU9zNDRRalRYY2RWSVdW?=
 =?utf-8?B?TjB2cmczZnB3WVpzWlRpcktVTVBKYWZYdDB1eDZiTEhtcnJNOW1BNWcrVzBu?=
 =?utf-8?B?azkzdnVUcExOd0EzemJaRjZwUzgxVkVnUzZwcnpoSVUvNWpPenJ4K3E1OWd3?=
 =?utf-8?B?TWtMNGsyN1VCRGQ4dUZ2cXhrenh4Qk1yQjdEZFp3U0N0clJaNk11U1RscitW?=
 =?utf-8?B?MFc3N3B1a0FXMXJzdnI3L280UU1NREE3Sk5GeUkwOXFUYWl1TURPOStlQmZu?=
 =?utf-8?B?SDhDR3c3N0FzTWtSdkhYSUxyVmo1Uk1vUXRwR1VMZEp2cE1iMUxSRUNzN1dG?=
 =?utf-8?B?M2lJMS9odjUwbUliMnBpUnMzaDFSRzd4RXNhd01hdVhhTFRKVzFqZzNxLzVR?=
 =?utf-8?B?MjZzbjJTcmhES1p1dWV6ek8zYm5TOVlaTGlRdSs5U0xMQlQybWNKYTl0dlcz?=
 =?utf-8?B?bG0rdXlnamM3UEFBS25LbGJyM2d6cG5EaXZMdW5kWVFaN3FoczAyY2d0dG1p?=
 =?utf-8?B?S2Mzb21hREdWTXZOV0tKUkIvd1JlZG0vQlNxUHpkMFVDQlZmTGw2cEtpa1Rk?=
 =?utf-8?B?cDR3RE1LV1Fjc1hDdHZPZTVaWnE3Y1FqOGJPSFpHMHdLa0tNY2dtTlJRTHps?=
 =?utf-8?B?Q2ViSWtjcXRlRFJUSlpIeTZjRXR4cFlvcVV6WWZ3S3kyNVNia0VkeFh1QjQx?=
 =?utf-8?Q?+q0X1NCwY9F7xJQvnm9ob74uSjJfdZphK3Sy/3p4i8L7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7c82e3-68ba-4b44-e526-08da85f86966
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 17:45:19.5580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPrGMwPHue4l/e7DGFyu0HCfpuG9Q1fJZsvvjg1IoIJ2DIdvG62xn+wC2RVbMS9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3426
X-OriginatorOrg: amd.com
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.22 um 17:49 schrieb Dmitry Osipenko:
> On 8/24/22 18:24, Christian König wrote:
>> Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
>>> Move dma-buf attachment API functions to the dynamic locking
>>> specification.
>>> The strict locking convention prevents deadlock situations for dma-buf
>>> importers and exporters.
>>>
>>> Previously, the "unlocked" versions of the attachment API functions
>>> weren't taking the reservation lock and this patch makes them to take
>>> the lock.
>>>
>>> Intel and AMD GPU drivers already were mapping the attached dma-bufs
>>> under
>>> the held lock during attachment, hence these drivers are updated to use
>>> the locked functions.
>>>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>    drivers/dma-buf/dma-buf.c                  | 115 ++++++++++++++-------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   8 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c |  12 +++
>>>    include/linux/dma-buf.h                    |  20 ++--
>>>    5 files changed, 110 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 4556a12bd741..f2a5a122da4a 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -559,7 +559,7 @@ static struct file *dma_buf_getfile(struct dma_buf
>>> *dmabuf, int flags)
>>>     * 2. Userspace passes this file-descriptors to all drivers it wants
>>> this buffer
>>>     *    to share with: First the file descriptor is converted to a
>>> &dma_buf using
>>>     *    dma_buf_get(). Then the buffer is attached to the device using
>>> - *    dma_buf_attach().
>>> + *    dma_buf_attach_unlocked().
>> Now I get why this is confusing me so much.
>>
>> The _unlocked postfix implies that there is another function which
>> should be called with the locks already held, but this is not the case
>> for attach/detach (because they always need to grab the lock themselves).
> That's correct. The attach/detach ops of exporter can take the lock
> (like i915 exporter does it), hence importer must not grab the lock
> around dma_buf_attach() invocation.
>
>> So I suggest to drop the _unlocked postfix for the attach/detach
>> functions. Another step would then be to unify attach/detach with
>> dynamic_attach/dynamic_detach when both have the same locking convention
>> anyway.
> It's not a problem to change the name, but it's unclear to me why we
> should do it. The _unlocked postfix tells importer that reservation must
> be unlocked and it must be unlocked in case of dma_buf_attach().
>
> Dropping the postfix will make dma_buf_attach() inconsistent with the
> rest of the _unlocked functions(?). Are you sure we need to rename it?

The idea of the postfix was to distinguish between two different 
versions of the same function, e.g. dma_buf_vmap_unlocked() vs normal 
dma_buf_vmap().

When we don't have those two types of the same function I don't think it 
makes to much sense to keep that. We should just properly document which 
functions expect what and that's what your documentation patch does.

Regards,
Christian.

>
>> Sorry that this is going so much back and forth, it's really complicated
>> to keep all the stuff in my head at the moment :)
> Not a problem at all, I expected that it will take some time for this
> patchset to settle down.
>

