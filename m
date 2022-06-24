Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5D5593C3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A8110FBCD;
	Fri, 24 Jun 2022 06:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F68C10FBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 06:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWjsPq60ME0rI9Ky/3qp6s1Hq3SFgfCBgmdnJGqG6FNWkK5mdPXI+2qzcOm1e3UMlnHM5NYCh54LWvFxTE2RZWwocBMbtPrmGGgudnVyAzIdgrTDgjkTC0/kFNgLpWBBQRMhDqN/MReUepKszskKibo8PhgYBHiVl1HVMYt+cu+hW6CUCv3JQeXkxg/JDl67TCbnnJvP416I+sxze9gYkaIewVQohz3H9qkesX4hI4JYrjTMtNcEWTKcQt/nUfNdCrqEohwtHeAuTckelY03nexqCEtvTLwR4rP3M5Byx9OYiwn8SFLG6RfBs3eLJ6Rcq3OU+UGPX0FhqeKRj4g31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiEc9QWWV+Zo8Ktg3d2841fkJMztwMW+MqxM5/4vjEs=;
 b=YoSdgsCyJK0099RIshLWpm20aYQUiPGCiDgbstSaafAT7oID+CPMPaBFS2cP+HZwp93c4+FFmU55p4O4SVGTcM7kB6Wf74qP7AlLuIdDAqW6aRkk32a2hr2jl+MN9CCzXprsjLZ0KrGrbYBjNEd5imIyFKiVSjQY6v6Cpe5xydw7erQn/Ly7nhZA4Mi3NXKKyrbUpK5IMg1eqar12I6bWY3dO8bOtR1t6cSdo72E9Zpr9mWF3ZaliIworU6q/f2IjBlG85P8AiG+Jlhy5WtyiQEs2e9rzy5bpPDd9l1ekOu/Wextv9j3tmagCoBnqIltrONPqZJHimQnhE+8W3Dzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiEc9QWWV+Zo8Ktg3d2841fkJMztwMW+MqxM5/4vjEs=;
 b=XscHDrX/stVh4Tz0bGqYcP9FWWC/sAmRGiMUscLq8et4rAt/FBQBR4FpItwEIGwXowk6FymCN2rNxm9fNee0U+lYvV1TW4GKQvIup69R4rJCkYJbR7FZBl1Akd0U4I+yCBTJ1RMhCoueKRcVMJSLpMN++1qFWyW/Je+pqK/ETIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5235.namprd12.prod.outlook.com (2603:10b6:610:d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 06:54:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 06:54:24 +0000
Message-ID: <a3d783b4-4d38-c5c1-12d1-80496c1138c0@amd.com>
Date: Fri, 24 Jun 2022 08:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Pekka Paalanen <ppaalanen@gmail.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
 <34a1efd9-5447-848b-c08c-de75b48e997e@amd.com>
 <3c088a9a511762f7868b10dbe431942d3724917a.camel@pengutronix.de>
 <4ea37684-5dda-94e4-a544-74d3812e8d9d@amd.com>
 <0edd288595cb53768822c3d9dc18b8506e07a244.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0edd288595cb53768822c3d9dc18b8506e07a244.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0054.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b503f5c4-2572-4f63-632a-08da55ae5f82
X-MS-TrafficTypeDiagnostic: CH0PR12MB5235:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhiLnC8rsVo0E93oRRJI3lWkBQklqZ7Vyw0aOP4vbu+jO1fh721RkKps2DinoFIyfidcOCdQNL0nYS4j1cY45ySuzR9KXc1+XyVg0u3Ja9rV4cTBCybDgnZ8MRI0RIJfMcr1Esl3g658wjEuUiMO+OR7S3rHbbvENdyGyoOhu4jQpx4dG3DFZVC9uotZ2RMo59JR2K4zrkV9Rb99jIcWl848oMNVLRzJuFankGlLvTct1vubnkicaoh8bJHP2ex3XZVCmRPjsHytG0kWStqzK//3urg5H1q2w+S+SBKbDrkXVMFOiOjuIk7DRCxJ139HfbbctcJW85IcA8o2QQW4CcqSxoIvr7YjUh64Aot18KcV7N6mBhLlmT33QBnQn63SHlfVKXpOMayIslo6X/FZoOe7xilPV4itzTzNDaQ16g44vFz23F9JP1JpzS5aABlvZVcIydlmhkNB7BioXboiPQ7QcrdEo1MyCk6JzLxupbjwNIROa7MtDQTs0iGAlRen6uMeyRJVdNGRm1qH+ExRlNrXENjRZzRmevawzBZlqFTqeIJto84VVryemJ0+RRD9nyK7P4pGMxW23xvGZRKfwxiqbL6skijasAGrcu5VBZb6xF6S4d/NvvMQyqYAvbqLy0lLv2OhLnzzUxswQy2hb6eX8z4cN8qodB3BowElmJAC6tfg/Rr+/RimsB/trrkkuKCgs/UiEZuqPkSL4sXY1lSe8GFeTQNTQSHkum/sky0MbrzSyVsfBHkTeeh5tmQbrcMhhvoUGkHAP8f32iXO1LHnOiEGv3ZkA1aFLIVtqwumeE/23uM88TG/JIJqjrdS/WeJqVVSC/EyXM1TgLkhCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(2906002)(38100700002)(6666004)(41300700001)(6512007)(86362001)(31696002)(26005)(2616005)(6486002)(8936002)(478600001)(6506007)(5660300002)(83380400001)(66574015)(186003)(66476007)(66556008)(4326008)(31686004)(36756003)(8676002)(316002)(66946007)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJzOHVmUlRWT0Ivb0ZDVkZsU3BDYUhYeS84OUY5K0UzZzVNdHNYRlBRM2Fa?=
 =?utf-8?B?Y1R0TUJzZWtSb1VWd3R2SUs1ZXMwSnY2aGRFQkcrdnEyWEpGQ283QTM1VW1D?=
 =?utf-8?B?SHZuY2R3WFNJTTUxL244WU9HRUtxUjZDR0dIaVNiYmZDNitvTlo2RXROTytx?=
 =?utf-8?B?RklSTzIydzBTNGU3dlNjcDk4akh1cU1FbnJzTWtHYmN4M0h5aTZTNTlpUHZo?=
 =?utf-8?B?SHVuOWhYQkVyc28yZ3BvNTNtT2dubjJaeTVhbEJiWGVpZVRVTVBPMGwzRllv?=
 =?utf-8?B?UHBLR1NBMVZUWGhrYnpJb0NsSXJnYytjTmtPZEF2VXlQMEI0aHE3WGFuTVQr?=
 =?utf-8?B?V2tpV1dxUFJlYkVDYWVtbFFqY2RiRTQ4UVlYSXA4UjNwNnVHSFFNcVpLOW5t?=
 =?utf-8?B?bmRQZFJKMC9IanVIcXNvdWlrMTB0enVPTEk0Q2c0cTh6Q0o5ZXVuaUNkdmxN?=
 =?utf-8?B?d3F1UlpvMGJqQXhlOWN0S21NV0w3V3FwS3JsWXh1TEErc2twNXZWbDBUWlJK?=
 =?utf-8?B?YnpvSlYwRFo0cU1pVXZERkk4Q3RlZ244ZnRrWUFOZ3d4MmRWMVdCVXduWGJO?=
 =?utf-8?B?WmFLWkVKaEtXYnk0UnRKMUE2bDN3SDdJN1VWbmNjck9WMEVaL2I1OVBXTGZR?=
 =?utf-8?B?M2xEcjZVYkxZNisrUWpmSmZ5WW1LakRaempwdktValhJRDhFbCtwZnBUajYr?=
 =?utf-8?B?c2o3VkxsUHgrZmlqV1N1eDcwM0NyNHpBcXpKK21HQ1pKRWI3RTdDcUtKa090?=
 =?utf-8?B?SzdnT2tsamE5Z2I4WkYzUWdoRUpVYVp5RGZzeGFQVEN0ZDJEL0RqTWdxTHp2?=
 =?utf-8?B?Smdwb1dwKzlaT1ZNNUh2QmFNM2NMVThURHVIZENsNE5lMHlabjBPRkpLNnpM?=
 =?utf-8?B?ZG5hOEZCN0ZqSGJYeVlsUlJJSHIwMHVseEplemtraXJvUFg2REhxV2RGVkpv?=
 =?utf-8?B?Tnh1NVFRV3d1VzZmblRva3ArUHE0ZTgxNHAwV2RkQWNUVWVFUExSKzJFbmRT?=
 =?utf-8?B?UHA1RmhMTWYveHdldmoxVnBIb3ZicHpCZ1ZMbTU2aE1oVUVLTEIxMFlhRGVo?=
 =?utf-8?B?ZjVMdlFhUjhFUHB2Umg1dDcxcGZMYUtMQ01rcWJQSkZuUy9GcWlhN3pkWGNl?=
 =?utf-8?B?VkxXOGVuR1lnVXFoKzhzQk9FSFM2SGRwUDFOZmFvM0VhNElTdEhlTFhjRExn?=
 =?utf-8?B?eWFER0xFYWh6UU52RC9mTVlPWkY0SWswRVJaUTFSZVNYMUQ4SmtOeWJSTm9H?=
 =?utf-8?B?Q1NPcjFKeFpOS2s1eWVZYXZ4dzFPRytUUVVpTml5elZ5NUxzUzBTbjNPM05E?=
 =?utf-8?B?RTdZRVVTRGRPVElabHhGTUlNQVpIb045d0tSZm0ySUdXTTRmc2IvUi9wNGZE?=
 =?utf-8?B?eURHeXdNLzRINnJacTJQOTFleXFmOGwzSDRXdVc2Sjg4RGQ1V09NZkR1cDNT?=
 =?utf-8?B?VURWY2hXR0cyRW5MNlNUUzVyM1lLWWNUSkh0a0VJR3Zxc3o2V0xtcHg3aXJX?=
 =?utf-8?B?d1AwUENkTVJDSGl1a2lxUVlTL1RINXhEdTFZSndwTFo1QW1Ednh2UStrbG9m?=
 =?utf-8?B?RVhmMTVNN2lZWGYyb1ByU3lxWk1mUXozV1J0TldPYkg5SVpPcHhTSWVNMVQ4?=
 =?utf-8?B?blhIU2RIVTdOSHE2UHlZdzdRTHo3d0hJMGQ5S1MyejRYZmxNYzJubzU5NmRS?=
 =?utf-8?B?RmRmVzlEN1NGcVdmdk51TzFrOGtNV0llazVKL0lFdm8ydE92ZTBZNnBITXkv?=
 =?utf-8?B?QzJKcktPbXpLK2NjVFNpMmFKSlNVSmtEZ2JnMUhWVm94WlFvQlhvdlNhWUgx?=
 =?utf-8?B?Z05nUnN6RThOZzBuYTNybElTTWtaLzNpUmxhUmtQaGk0SjhPak5BYTd1c1M3?=
 =?utf-8?B?Sm12SjFtbDZPTUFtWlVLMk1YdE5xL2VIeFBWd1pVS0FQVUEvVXh6aldWb3lj?=
 =?utf-8?B?VTFuRzhBaDQ3Q3FwenM4VkRqbjAvQVg1RnVEQTV6YkEyalNCR2k3VDc3S1Y2?=
 =?utf-8?B?ei8waUNnSTFIREhXN1pQVnNUN0FJbDV2SUIwY1lyS1dJd3FON3EvZytLZjBP?=
 =?utf-8?B?VmFFN0NFcEJ1UlJjSjNMUnl4dkkrYmNZQ1psUWoyL2h1cXlwcS80RDQwYmg4?=
 =?utf-8?Q?kIE4uvY0Ft/uBED5Pt8o+FWqp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b503f5c4-2572-4f63-632a-08da55ae5f82
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 06:54:24.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGhxm7reYlqte/1x4rnbwN2ioeTFi4T1dVJzASD2o+m/ElU7hMXWEK2gVZDxtneQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5235
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

Am 23.06.22 um 17:26 schrieb Lucas Stach:
> Am Donnerstag, dem 23.06.2022 um 14:52 +0200 schrieb Christian König:
>> Am 23.06.22 um 14:14 schrieb Lucas Stach:
>>> Am Donnerstag, dem 23.06.2022 um 13:54 +0200 schrieb Christian König:
>>>> Am 23.06.22 um 13:29 schrieb Lucas Stach:
>>>> [SNIP]
>>>> I mean I even had somebody from ARM which told me that this is not going
>>>> to work with our GPUs on a specific SoC. That there are ARM internal use
>>>> cases which just seem to work because all the devices are non-coherent
>>>> is completely new to me.
>>>>
>>> Yes, trying to hook up a peripheral that assumes cache snooping in some
>>> design details to a non coherent SoC may end up exploding in various
>>> ways. On the other hand you can work around most of those assumptions
>>> by marking the memory as uncached to the CPU, which may tank
>>> performance, but will work from a correctness PoV.
>> Yeah, and exactly that's what I meant with "DMA-buf is not the framework
>> for this".
>>
>> See we do support using uncached/not snooped memory in DMA-buf, but only
>> for the exporter side.
>>
>> For example the AMD and Intel GPUs have a per buffer flag for this.
>>
>> The importer on the other hand needs to be able to handle whatever the
>> exporter provides.
>>
> I fail to construct a case where you want the Vulkan/GL "no domain
> transition" coherent semantic without the allocator knowing about this.
> If you need this and the system is non-snooping, surely the allocator
> will choose uncached memory.

No it won't. The allocator in the exporter is independent of the importer.

That is an important and intentional design decision, cause otherwise 
you wouldn't have exporters/importers in the first place and rather a 
centralized allocation pool like what dma-heap implements.

See the purpose of DMA-buf is to expose the buffers in the way the 
exporter wants to expose them. So when the exporting driver wants to 
allocate normal cached system memory then that is perfectly fine and 
completely fits into this design.

Otherwise we would need to adjust all exporters to the importers, which 
is potentially not even possible.

> I agree that you absolutely need to fail the usage when someone imports
> a CPU cached buffer and then tries to use it as GL coherent on a non-
> snooping system. That simply will not work.

Exactly that, yes. That's what the attach callback is good for.

See we already have tons of cases where buffers can't be shared because 
they wasn't initially allocated in a way the importer can deal with 
them. But that's perfectly ok and intentional.

For example just take a configuration where a dedicated GPU clones the 
display with an integrated GPU. The dedicated GPU needs the image in 
local memory for scanout which is usually not accessible to the 
integrated GPU.

So either attaching the DMA-buf or creating the KMS framebuffer config 
will fail and we are running into the fallback path which involves an 
extra copy. And that is perfectly fine and intentional since this 
configuration is not supported by the hardware.

>>>> [SNIP]
>>>>>> You can of course use DMA-buf in an incoherent environment, but then you
>>>>>> can't expect that this works all the time.
>>>>>>
>>>>>> This is documented behavior and so far we have bluntly rejected any of
>>>>>> the complains that it doesn't work on most ARM SoCs and I don't really
>>>>>> see a way to do this differently.
>>>>> Can you point me to that part of the documentation? A quick grep for
>>>>> "coherent" didn't immediately turn something up within the DMA-buf
>>>>> dirs.
>>>> Search for "cache coherency management". It's quite a while ago, but I
>>>> do remember helping to review that stuff.
>>>>
>>> That only turns up the lines in DMA_BUF_IOCTL_SYNC doc, which are
>>> saying the exact opposite of the DMA-buf is always coherent.
>> Sounds like I'm not making clear what I want to say here: For the
>> exporter using cache coherent memory is optional, for the importer it isn't.
>>
>> For the exporter it is perfectly valid to use kmalloc, get_free_page
>> etc... on his buffers as long as it uses the DMA API to give the
>> importer access to it.
>>
> And here is where our line of thought diverges: the DMA API allows
> snooping and non-snooping devices to work together just fine, as it has
> explicit domain transitions, which are no-ops if both devices are
> snooping, but will do the necessary cache maintenance when one of them
> is non-snooping but the memory is CPU cached.
>
> I don't see why DMA-buf should be any different here. Yes, you can not
> support the "no domain transition" sharing when the memory is CPU
> cached and one of the devices in non-snooping, but you can support 99%
> of real use-cases like the non-snooped scanout or the UVC video import.

Well I didn't say we couldn't do it that way. What I'm saying that it 
was intentionally decided against it.

We could re-iterate that decision, but this would mean that all existing 
exporters would now need to provide additional functionality.

>> The importer on the other hand needs to be able to deal with that. When
>> this is not the case then the importer somehow needs to work around that.
>>
> Why? The importer maps the dma-buf via dma_buf_map_attachment, which in
> most cases triggers a map via the DMA API on the exporter side. This
> map via the DMA API will already do the right thing in terms of cache
> management, it's just that we explicitly disable it via
> DMA_ATTR_SKIP_CPU_SYNC in DRM because we know that the mapping will be
> cached, which violates the DMA API explicit domain transition anyway.

Why doesn't the importer simply calls dma_sync_sg_for_device() as 
necessary? See the importer does already know when it needs to access 
the buffer and as far as I can see has all the necessary variable to do 
the sync.

The exporter on the other hand doesn't know that. So we would need to 
transport this information.

Another fundamental problem is that the DMA API isn't designed for 
device to device transitions. In other words you have CPU->device and 
device->CPU transition, but not device->device. As far as I can see the 
DMA API should already have the necessary information if things like 
cache flushes are necessary or not.

>> Either by flushing the CPU caches or by rejecting using the imported
>> buffer for this specific use case (like AMD and Intel drivers should be
>> doing).
>>
>> If the Intel or ARM display drivers need non-cached memory and don't
>> reject buffer where they don't know this then that's certainly a bug in
>> those drivers.
> It's not just display drivers, video codec accelerators and most GPUs
> in this space are also non-snooping. In the ARM SoC world everyone just
> assumes you are non-snooping, which is why things work for most cases
> and only a handful like the UVC video import is broken.

That is really interesting to know, but I still think that DMA-buf was 
absolutely not designed for this use case.

 From the point of view the primary reason for this was laptops with 
both dedicated and integrated GPUs, webcams etc...

That you have a huge number of ARM specific devices which can interop 
with themselves, but not with devices outside of their domain is not 
something foreseen here.

Regards,
Christian.

>> Otherwise we would need to change all DMA-buf exporters to use a special
>> function for allocation non-coherent memory and that is certainly not
>> going to fly.
>>
>>> I also don't see why you think that both world views are so totally
>>> different. We could just require explicit domain transitions for non-
>>> snoop access, which would probably solve your scanout issue and would
>>> not be a problem for most ARM systems, where we could no-op this if the
>>> buffer is already in uncached memory and at the same time keep the "x86
>>> assumes cached + snooped access by default" semantics.
>> Well the key point is we intentionally rejected that design previously
>> because it created all kind of trouble as well.
>>
> I would really like to know what issues popped up there. Moving the
> dma-buf attachment to work more like a buffer used with the DMA API
> seems like a good thing to me.
>
>> For this limited use case of doing a domain transition right before
>> scanout it might make sense, but that's just one use case.
>>
> The only case I see that we still couldn't support with a change in
> that direction is the GL coherent access to a imported buffer that has
> been allocated from CPU cached memory on a system with non-snooping
> agents. Which to me sounds like a pretty niche use-case, but I would be
> happy to be proven wrong.
>
> Regards,
> Lucas
>

