Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A685576F7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 11:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917FA11A20E;
	Thu, 23 Jun 2022 09:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8864F11A20E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 09:46:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZK6igHOncbPBToVCs7pu+pZIPG3qC2kT4itK6rVByw4bclDhDNr8jyjIHOzapRncN0boMA8MQjw8OW1PlfHiCaQWDsWykbcLdbkab/yDldAvcpcxUE60FvHHsVrRrQEil6RQ9eeEoMR62Mo5pPPuW3kfX4hJ7IZDQ+tPN4Bb2IAz4T36RjxupzaWgUrha+Y2BianE1pWv5Zl4YiczGSz758GAI6r1iC/g283Tm+vEmoTzZHXrdrFJWZaLBZYHE3iwLBs1XCaTMAyfyLeJo9bVt9G/fVV110Cm19Q4RHzgqowFazzgbIiNN5YmwDa1Icx1e5bfSOBNZGqUKksSWJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72KnPU5vd6eEO+7TboGsFs/zYg2m5DtKPBpwVRre1I8=;
 b=jPb3+LZhnhRCJG144PVxK6XipWW127aYzYvJBD48NTphEAJM8Y+ZhN41csRN3Qcca1juR6LHyNvwYzlIRFqMxTPpYDgaTE+aUwXIiQ/AccMSbD0esAp3YjYsDIm9b2S+JQPFYvcKHtr9gVZlCNV8irh4IOtnQYXKG1tq3PEApNpySDGof3LtWuu7AOkiH3nS9wUBWChWoUiMrqI07LNHkHFTndpgXXZbFCnluhGkCb119Ld3s+rHiDAaxRjZhHEfASgu5gXP7bgFxCFNf2KPrBq1eqLVX4fB/uN66xavAQ27rNnBliD/T46OA84Io1BoUcpNXRKrsVbFYuhrT1SHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72KnPU5vd6eEO+7TboGsFs/zYg2m5DtKPBpwVRre1I8=;
 b=E3a2QwWeXmT555kbezgy3JPHmLB7Yn8bcDVed2uGTia18AxItRQXm4hQ3saaHq95m6jDZgnl7aUGk3m/daRFcg1W4geJIVmxYDzeN0vAcCCE85zruMDZcp3rIuP9JVSDpklG0gmLvYJaW5h9PBkM1AIzUDetPtfgfVZ8zjd6hUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1808.namprd12.prod.outlook.com (2603:10b6:300:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 09:46:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 09:46:41 +0000
Message-ID: <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
Date: Thu, 23 Jun 2022 11:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Pekka Paalanen <ppaalanen@gmail.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::43) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abdbb0ab-1ac8-4e60-d2d3-08da54fd46a1
X-MS-TrafficTypeDiagnostic: MWHPR12MB1808:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18088E57157691DCEC24277183B59@MWHPR12MB1808.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y70lUBbk0rIFNhYPtBqqKQ9yW8YNPYn/ytym8mvk7ZbNg9Oeinm1l3Qici4rYzWD/jVJhGcsvCxkN5sDhFlX/zoz6wGYIjJ6ss6sU47yIJHlaOyMiovUXt8rBb1SGu14IiUVE+eyyf/i/Nf2XYEwvmrK2Lr8EjWIj4R2BoWc4g7XRcQStqJj/XaXElgn5gf8g8Zu7ILUlEhuv4ywT12/Vth8Vht2LehCyo1+/mf+nMltxPnYXTSFvv8Ie6VCSZhNCTatLU3m7qzyy9neOkjLeZccbUXvgihT+Pj8PyvvKTjOm7212ksMj5t9XK0xjmd0nBe1NPfE5sgQrhNrNEMH/MA0Nqqp41RJRwO5JUzY9tfM15aHdNXWEgXQse9lSwUh2y/yunAd0iZaHY9AY2JxvZNmiNFL8oZnnYoukLoiZD2bLGVtRbJ9ytw2GnRyumSCV1cU3zZwV9vOrpycT3eExgAATw8LnuD/mbZUsDDcgDQoyRGmCP4/Agi3sA9D1y1EHdvtZ4LYj1yicnxodUIAAS6jLVDIinSD2UDGpkXGh8fVOIxjo1IPhA5QLRLF7ii08n+mA3uJbwQsjDuGzRkWgpVRBkwEMK8LkPZJItpqjSEwzXTVkQ96tpYyYuiz8x11W3GzZeS3wi5tLX8OB7pX3h1e3UagaQQKLCPvuRIsb0O6lW6q3sd1vJcVqDcZ3B0Zi66cf4vzts2Nj5PgEa59db6eJD8CtCtESUGhyFvX7GpKGrzqbEuJapXNQOk9vAiouAr6uZ+16E+k5k8aDjeJRBuN0SWzbI1qJ/kxHdn0l94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(86362001)(38100700002)(66946007)(31686004)(6512007)(5660300002)(6486002)(2906002)(316002)(6506007)(110136005)(66476007)(8936002)(31696002)(4326008)(8676002)(66556008)(83380400001)(478600001)(54906003)(41300700001)(36756003)(26005)(6666004)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVuOGIvdC9sWGk0b002em1hcDZqYzJYcFhXd09YSTdGRTBRTG5NMWhqaE9m?=
 =?utf-8?B?cEFtQ201QUNxUm1qbXpNWTFsVVYvRHo0R1Fvb0FqZHo0c1p4VnFMZElPZldY?=
 =?utf-8?B?RnhkT2Z2MVZzRVdXR1Fld21yQ1FoTVVVa1lxQkllcGExaDB4dmV4Z1Y5MUFD?=
 =?utf-8?B?TkpqaXFIZkFYb21jdGRzdXJDYkdJRzYwc1BjT2VCR1k4MFVTaVJpRnRtT2hE?=
 =?utf-8?B?UXdpV3hQbFhmRitXVWE5aWhaT2J5aDc2bC9TbzFHWGFPdDBsL3RUbTB1cSsx?=
 =?utf-8?B?YnI1ZjN1V1ZCUHhiTkp2bWxhcEhwemdhcW5RekxqMFdlNFo4MkZwQnBOdU8z?=
 =?utf-8?B?YUllZW1RQnJVaEgrcFFudlQzU3hPNUpWR1Fkek1SLzRFSzk2NzZmY0Z5Y0hz?=
 =?utf-8?B?Rm1aL0NibzZxeVhvWWhDWGNYWlQ3UE1WK3Nzd3FPL2ZLdjlFNUVNZm5yaDZn?=
 =?utf-8?B?S2tXcFk1WXc2ckxXTHNpenErRGtwY0xsRTVIalJCS3Q3Y1FucmU2a053Vy9Z?=
 =?utf-8?B?MWt5YzN3OVJYcWdQYUdLYWYweElDUEVoWmVnYXNWYzNET2FlMEZIWTlmK3lM?=
 =?utf-8?B?dVprWVZBaTgrSWFJeFpRWlJ2TXpCMDZpZzRYNSt3N0QrclFqRUFXQzBpQ3Yw?=
 =?utf-8?B?WUpNRUJTaHFySm5yanVNZGdaVERmaUJzYThEZEN6aWcxaGwvZzR2WTBkYTBz?=
 =?utf-8?B?eFhXWURoL1F6R2Rlc1owTFNxVUJ3YkhnbzBCZjFJdnlHRG4yOTltYThYR25q?=
 =?utf-8?B?VHcrUXl0ajhINGtEd3VyRXVEYlJma3I0MjFZc2V4YStUdmZQdlpnNlFOYkRI?=
 =?utf-8?B?d0Z5NGxyTWEwNmFOdlBZWU1USG1ZVnFKbGtFS3ozZ0ppemJjaXJVaURta1FH?=
 =?utf-8?B?WDM3V1NLNWhJOER6anFBb3E3V2xQWkZSbStWZUhCQWxYdTlVS2xBUHJoejgx?=
 =?utf-8?B?NndIeVJiZWFoeDl1TmVScDVIenlQOFl2T1RXNHBzNjJoeS9WTXZqWHZRNXJs?=
 =?utf-8?B?N1h6YnNOU0s2VUVsei8vblRVbDQ3WXRQUWNFMU0xc0NsdEhtMyt1VW42eTdq?=
 =?utf-8?B?NlZOWWpXb1ArV24yK0tEMHFWNWU5Y0hyaUU3Ry8rZEt0SDJxR3NuRjhxMk01?=
 =?utf-8?B?ZTNwWHJSekVteUNFbEdiMUtub0xsZmRwV0sxbGpVTzhOaWRxVFd6NXM1M3N1?=
 =?utf-8?B?V21pYUxDQUpyYnk5dW9oQWplWmduNHE5Mjl2WklZUVBLTEIwclVvbi83MDRi?=
 =?utf-8?B?dHM5bitvOTdieUJSU0JZMTRtaGlPMUpCWTE0aGs3ZEszUzcwT3kzb0drc0Jn?=
 =?utf-8?B?OTZRcWFUREN3OHJVcWtRc256RlNvbklGQU9PSEJtc0lwR2JrZ3cwSzNCcTdv?=
 =?utf-8?B?SFM0eW9pV1lUaE1rWnZ5V1dDYmgwaEdVeHYwd1ZQZmR4eEtsNC9IT3A1djVD?=
 =?utf-8?B?cUNhZDJSVTRVT0VLUlVpRGVLSFFYNVRIYmxVT21tYlR5cmk1a0ZQMGNnMVQ5?=
 =?utf-8?B?QktPakUyM3psTC9RNFJpK0gyKy9KZXJVa00xbXVMTGc3TnJYSEs3dllhVlNq?=
 =?utf-8?B?bFMrZ0NUdTZIVEluNmhXQllwUERCclpmV0xPNXpBeHFZdEdhbVRKMUJYNGpo?=
 =?utf-8?B?VEJPOUlWdTM1SkFkbXAxdlpIbXF6QmFYVVJ2TjFEZHFNZkJlNHlranYyNE5C?=
 =?utf-8?B?YlNTR0RzZ091alBqSXVPR3hzSTRYdEFxTEtwTWRjRmY3STBUT2hQOXVTcmk1?=
 =?utf-8?B?bnJxRE5pZ3dnTERycGhiaXI1T3Y0L0R1WUNXb0JzanpaZTZ5elVKQkNwZHVW?=
 =?utf-8?B?ZHpjcC9xYXc5Y0lpa1JrT0R6T0lZWnlGM0pnRWEvbzIyNTVvV0dYTk1WM3hk?=
 =?utf-8?B?MWJuM3h2OW80L3U4U2lEU0FPS3dlemt6dExNdG9oLzQ3ZG5iQXNoaHhxUi9a?=
 =?utf-8?B?QjZIOHRKMXFIMVZmQW5jbU5tTDNnRUhQd3FFWkwwQUZWU25iNXVuY2dLVVBS?=
 =?utf-8?B?dXN4VHZ5Wi9OZnowdUJGWWZVcG1jaVA3RS9EQklOSEtkSHpER0xVK3NjRVRx?=
 =?utf-8?B?OWg4NVRwOHlaS1lBNXhzL3o3UWVlb09QemJPNVBEVS9FV2JiendwRkxPUDFi?=
 =?utf-8?Q?Rkyb+IxlythpHS5dR3gALdtKf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdbb0ab-1ac8-4e60-d2d3-08da54fd46a1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:46:41.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oqnFI7gzuFa5f3KUhtL3ilGM3cslkBt8GetOakgCxwhhkzG0YLXx7zKFz318wPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1808
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 11:33 schrieb Lucas Stach:
> [SNIP]
>>>>> In the DMA API keeping things mapped is also a valid use-case, but then
>>>>> you need to do explicit domain transfers via the dma_sync_* family,
>>>>> which DMA-buf has not inherited. Again those sync are no-ops on cache
>>>>> coherent architectures, but do any necessary cache maintenance on non
>>>>> coherent arches.
>>>> Correct, yes. Coherency is mandatory for DMA-buf, you can't use
>>>> dma_sync_* on it when you are the importer.
>>>>
>>>> The exporter could of course make use of that because he is the owner of
>>>> the buffer.
>>> In the example given here with UVC video, you don't know that the
>>> buffer will be exported and needs to be coherent without
>>> synchronization points, due to the mapping cache at the DRM side. So
>>> V4L2 naturally allocates the buffers from CPU cached memory. If the
>>> expectation is that those buffers are device coherent without relying
>>> on the map/unmap_attachment calls, then V4L2 needs to always
>>> synchronize caches on DQBUF when the  buffer is allocated from CPU
>>> cached memory and a single DMA-buf attachment exists. And while writing
>>> this I realize that this is probably exactly what V4L2 should do...
>> No, the expectation is that the importer can deal with whatever the
>> exporter provides.
>>
>> If the importer can't access the DMA-buf coherently it's his job to
>> handle that gracefully.
> How does the importer know that the memory behind the DMA-buf is in CPU
> cached memory?
>
> If you now tell me that an importer always needs to assume this and
> reject the import if it can't do snooping, then any DMA-buf usage on
> most ARM SoCs is currently invalid usage.

Yes, exactly that. I've pointed out a couple of times now that a lot of 
ARM SoCs don't implement that the way we need it.

We already had tons of bug reports because somebody attached a random 
PCI root complex to an ARM SoC and expected it to work with for example 
an AMD GPU.

Non-cache coherent applications are currently not really supported by 
the DMA-buf framework in any way.

> On most of the multimedia
> targeted ARM SoCs being unable to snoop the cache is the norm, not an
> exception.
>
>> See for example on AMD/Intel hardware most of the engines can perfectly
>> deal with cache coherent memory accesses. Only the display engines can't.
>>
>> So on import time we can't even say if the access can be coherent and
>> snoop the CPU cache or not because we don't know how the imported
>> DMA-buf will be used later on.
>>
> So for those mixed use cases, wouldn't it help to have something
> similar to the dma_sync in the DMA-buf API, so your scanout usage can
> tell the exporter that it's going to do non-snoop access and any dirty
> cache lines must be cleaned? Signaling this to the exporter would allow
> to skip the cache maintenance if the buffer is in CPU uncached memory,
> which again is a default case for the ARM SoC world.

Well for the AMD and Intel use cases we at least have the opportunity to 
signal cache flushing, but I'm not sure if that counts for everybody.

What we would rather do for those use cases is an indicator on the 
DMA-buf if the underlying backing store is CPU cached or not. The 
importer can then cleanly reject the use cases where it can't support 
CPU cache snooping.

This then results in the normal fallback paths which we have anyway for 
those use cases because DMA-buf sharing is not always possible.

Regards,
Christian.

>
> Regards,
> Lucas
>

