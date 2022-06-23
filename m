Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70055791A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADD410EF0F;
	Thu, 23 Jun 2022 11:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2C10EEBF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbkWH6lFf/f5lNHaEVsFN3WTqx1eOgb9rD5IPob3qJcLuK4sDijEPaH5FvM8hNFfQS28dwTeEci3Qsqifrq6lO0ovEf9IQ83jRNyUZfdb+9/W00CBZJkc4CD5vYs7k8D+dwzgjAt6cg1iXl83me5RPBktbRl6KNdVDNx74qq5Nq25zUfnhYj05+XT65VUxeMnCqw5WSlbHcy9vMDHWnSETDj43aPAKGR8ldmg4p4IZU+zgtp+vxWidGBVTpVdbqSxZGD2/hReGd5tG2Yulqxf+Q6lBaUg6QhgghfwXPN+W3kE4iP3F4Ji7BvD4jadVtRJujKJVPWGX6tTL25fEcyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fgCymumiqq0uJ3fFkFKiyAC51RQGxnkh41SJ7fkFqY=;
 b=P6MQNBJjw7XW9zTjrtYhXZ0OXNcuAgFS4flhq57rIagptG3QBF57cYhq/tqZBM+4XiqYmTiEqfnsGha3VOTs2Oi5kp7CLpuFARcump3toMC701hCqxR5SDnMhV5p8ux416ltGTsG97DLRdIsSMkFFkSh5ehNEgN1OaqRSgy4kMfBmxacM4RHch3K7Vpcp0Y+KkXNGrgHjmMIvvyYcaUkgMn48lDP3HnBSjSxkX1A2wH21YtzHwrIa5jkwwpQx1Jh1UvoRat9fZ8QYJQ9zn5FDwgRZIt1tc8iS1rD7GsHyCCBBckMcIgCRjGaa8M+K+IcF/SZr/56Frp2fUKpSIzdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fgCymumiqq0uJ3fFkFKiyAC51RQGxnkh41SJ7fkFqY=;
 b=ZoIjBurMkU64ksb0VW9+Mr7kvbHg6PItGi6tjvjaP0y8Skh0fhW6YdTPKyyvgW32wPVj2uu7a5k7m2G+yWIITOB933oYq5dbZk9yeJuhd/wXaGYkGiQQUNYzM+h2pl6Wcy08uVWlkiO6OQsw/pPmYTTm+Iv7YncuL/aHtyYGUR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6481.namprd12.prod.outlook.com (2603:10b6:208:3aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Thu, 23 Jun
 2022 11:54:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 11:54:34 +0000
Message-ID: <34a1efd9-5447-848b-c08c-de75b48e997e@amd.com>
Date: Thu, 23 Jun 2022 13:54:28 +0200
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
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0171.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dea20d8f-bc2f-46fc-d300-08da550f2415
X-MS-TrafficTypeDiagnostic: IA1PR12MB6481:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6481CDB7F878ED6299F3845D83B59@IA1PR12MB6481.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSoedSG+TV+BzYyLYh/IBUX3k3IRJ+Du2XnIVwAp5yVDvOA7fuJC7wYk0NRhPIqa2lHwD+ELwUZ1SzlGBd1anK3Vm91ATc/jKTjk/iVXUa4nP5WE14PWlW92u77hQz0JskdBtwJj9UDT0Nb4OQMMJOiZ9AboodS80wmDQRte7YQsjVhKw76iOlRzawxuEyTU3S0TpUppXUiftEBPcMKg7V7aPriWvv6dzSUnRi32jiICm3XFfTTDoQxsRMll9BzqT3j7IiyKKyYnojDLh9DDpOUS4pb0S08rKkjg96KcWrPD0bG+czLyyzE0V+5Mlyk7xSE2NzzoeV+JWNohcanVmhEGAgmctsViIU2MWG1aqwJyZUPtyNLRb7wcGiDNdf9vjNwDEnHtKmusmxeSrBjf6jfX/1GSjcPwtKFOC3HarcIRtCucypLYR/pnwQJzOL/hROhlQfuWB3spxNFfQytBkn+ax4r8E2W8bJ9+a1dXciT6Ig4ZYIITd3mHOliVcmifCk68SdTiEUjGKEEyjJExJ+MYwdGe37VTTA+z72zS/fXY6xHoXM6DSA3GRdVt2YwfLvS3o4WzJL3XnxzbkA7usOyu67R1rXKjsYw1fGkHv7DyOBKPW5RV/AIH7Od5yK5Gf2SB6X23w8R/JrRamW7ghDWsbgQscPjgLr3E413+4FSgDHrFd8t/hO/AzptdI6+vK3W5G30hccno95NVvUxWwe/CqhsRlVxYSp8Wi0JEhBLzjYJkEoFXnIOnzARWAKfcTAgtvVeeCGLmnkyxgmtluCP96vMIlrfKdqWU/ZcC7H0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(316002)(54906003)(5660300002)(4326008)(8936002)(478600001)(6486002)(110136005)(86362001)(66556008)(2616005)(8676002)(83380400001)(36756003)(6666004)(66476007)(31686004)(31696002)(6506007)(66946007)(38100700002)(26005)(41300700001)(6512007)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZsaUZYYlRTVlZ0M2c3ZHRTd3RaZDVUaUdJNkM5WmhTQ0E2c3NueC9oQzVr?=
 =?utf-8?B?VmZLcitxUXMrd29IZEVWOE05cndmNERZUG9ya2RWRVdvZkRxQ0F4a0M0T2w1?=
 =?utf-8?B?N2hueWtydmZxM2U0eEwvQnJkSXUzODRyc1FaT1hEYmtISUpvdkF1ZGZ5dEF0?=
 =?utf-8?B?cTY4ZmlVc1YrLzQ3U0ZjdVJvc3RQYlhsYzduTlRnVkdHZmhLMUhUeTM3U2U0?=
 =?utf-8?B?R2dpM2hUa00xeUNvTjFpNzZBR001emsrTjNMRVV5dWEzSEF0TkVMMEZnUitq?=
 =?utf-8?B?ZFU3eWE4NnJkUU9ucVRtdWVJdVE1b1A0eWx4d1ErNnh1VXQ2YW12dGxuS0pk?=
 =?utf-8?B?Z2tKUDNuZzFtcUNuU3pTNDBZQXd3WTkyZDh4WTlWbjdSK1dvYkpWTXlVWVpH?=
 =?utf-8?B?SWhYVWZHREtHa3ovRXBFNFBlOVExRlpmb0Z0OFdIM3QrYjhqYW1uMU9WcVdj?=
 =?utf-8?B?VUVlamY5aCtVNkFINXFYZ3JXazFtYThsK09CR3ZUZVk2SkFlS2VCcC9uckdr?=
 =?utf-8?B?bTdYWm9CcE1qdnhQNVRORDN6aTVld1RydDc5eVc3YXRJcUM5SUJoRUJWaGpk?=
 =?utf-8?B?MytZdVV1NUtLdlEwL1VmamtlRzFrWU5kSTNDUzlQMVgzL2QybGVZU252ampR?=
 =?utf-8?B?blcyemJKSC9EZWU2QWhMSUJvZW04WGFBd0VHUVJXVHY4TW1qOFZEajlWRHdW?=
 =?utf-8?B?U1ZIR0RMOW1JaG1uOFdaZjhVWGNLSDFUNjFHSVlzTnE4TnJIdnVraUFJTUNW?=
 =?utf-8?B?N3BMZWhXcGtlT29rN3Q4cy9KR2JiMUJyc1VIQzA0L2F2UFdHT1NhTVJLRzBo?=
 =?utf-8?B?R2w4c0ZMUnhSdGJZQU1nMkdDUU1pRFFUUzV3SW9UMUdKTTdHY1Y5Y2tXNk1m?=
 =?utf-8?B?NVM0a0pQaWI4ZTRZMVFjN1k2MUFuUDg0ZWRvZ3RCSjdaNEdZVVVra2toeUpN?=
 =?utf-8?B?M3hTNFdIUVZlcUxTSUd6aDEyYXZvUUZiNnNhWkNRaVp0cGhDRWw2Tk9LSGF5?=
 =?utf-8?B?bnFybmMzeDVTK1FLNGtLRG9SdTRYaHlqSTJrV0x6VGE2cVRscnpkTWV3Rmph?=
 =?utf-8?B?VkV3Q0x6VDYvK3A2aTE4RXJhcW9qR095R080enBhS0h4VHhxckxiV291UFJq?=
 =?utf-8?B?NGZmaWR1ek0zeFMvQ3JzSlRFVUVnRzhRbldLTklqaTk3NXFyNS9zVDl2NU9Z?=
 =?utf-8?B?TkN4WXppUmV6MTQxbm1KQUsyU3VZUVptNnY3MkxzT3pMNmJ2STltTlZOYzFu?=
 =?utf-8?B?UHRFWmZIaTJ4aTUyM0hMRzd1N29NOUlSazFHZUpHUngvQ3RXWWRWemxRWG8r?=
 =?utf-8?B?UkxOTXJtci9aYy94eEdGcnVGd1NjbUtiZzhTa2U3R29CMnVTRXJ5SXd0S213?=
 =?utf-8?B?U1pNdThySHArVzZ5RTRmdGdadmUrcSsvVU9ZUXBFWEYzTUlQanM1UUpjNUNy?=
 =?utf-8?B?UVY1T3Q3YTNHcDErYzZPalhyTjUwR0dVS01tVEdSY0NiZjBSL1VPMkNSWFha?=
 =?utf-8?B?UElJNWJLdVBzRHZ3ellEbDhQa285c0MwcXFaZ3FwaHlKY2lLeStteHc2dUp5?=
 =?utf-8?B?S1FuNzFtYlR6azJEZWxVckR4UG15bnRRRmVTNU1ZdFFNN0M2UWhmVlFRUFJq?=
 =?utf-8?B?UHc1d2dKZC9FNnByMW9Ic3dkdk85UDNBYjJ6a09jQll3R3RLdm9BSFB4Nm92?=
 =?utf-8?B?a29VL2lNMVlxL3FaajZKRytMTFZubzNWNFZOQjNEWWs0R3NjTWliajdJeTV0?=
 =?utf-8?B?dEtMbDRzY3IrZEZOL0RSUEVNOXBRYVU3Z3pOUU92REduMk9QenE0aFdyakJy?=
 =?utf-8?B?K1dzaEc1UTR4TmJuYjJ1ZFRwbTUvdTZ1ajZRbTl6Q2gvL1prNGxrMkNqRG5N?=
 =?utf-8?B?b1pia1NGR1Y0SXZMSWJGNFVBNUpDYVRLRnJzS2pBM0hzVHhCRzNPS0NtSzZM?=
 =?utf-8?B?RVBQa2VrcVRkMG4xNDVQb3YvQUh2azg3aUFBbmNRU3ZWZWEzd2YyWkY5cFVh?=
 =?utf-8?B?UUhIY2h3S3ZpdU9VN1JpNStRZmozcTVvZ3p2OVJCODN1aGF6LzlXL2FYQkRu?=
 =?utf-8?B?Q3pHdGlZTXlxUld3TWp4ZXg2SzVWbmk1cDhGNk5tbnEySzFmbDdvK1ZGazNV?=
 =?utf-8?Q?97MZu7KRt6Ari6TJJDm0Bvra4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea20d8f-bc2f-46fc-d300-08da550f2415
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:54:34.6501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsBz0Ezlce3jNYhNwD9flk6VYMOSxOnEFllZXrskL9jayc19mgYNBQ4oKCbMv5CF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6481
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

Am 23.06.22 um 13:29 schrieb Lucas Stach:
> [SNIP]
>> Well then the existing DMA-buf framework is not what you want to use for
>> this.
>>
> Sorry, but this is just ignoring reality. You try to flag 8+ years of
> DMA-buf usage on non-coherent arches as "you shouldn't do this". At
> this point there are probably a lot more users (drivers) of DMA-buf in
> the kernel for devices, which are used on non-coherent arches, than
> there are on coherent arches.

Well, it's my reality that people come up with bug reports about that 
and we have been pushing back on this with the explanation "Hey this is 
not supported" as long as I can think about it.

I mean I even had somebody from ARM which told me that this is not going 
to work with our GPUs on a specific SoC. That there are ARM internal use 
cases which just seem to work because all the devices are non-coherent 
is completely new to me.

I'm as much surprised as you are about this lack of agreement about such 
fundamental stuff.

>>> Non-coherent without explicit domain transfer points is just not going
>>> to work. So why can't we solve the issue for DMA-buf in the same way as
>>> the DMA API already solved it years ago: by adding the equivalent of
>>> the dma_sync calls that do cache maintenance when necessary? On x86 (or
>>> any system where things are mostly coherent) you could still no-op them
>>> for the common case and only trigger cache cleaning if the importer
>>> explicitly says that is going to do a non-snooping access.
>> Because DMA-buf is a framework for buffer sharing between cache coherent
>> devices which don't signal transitions.
>>
>> We intentionally didn't implemented any of the dma_sync_* functions
>> because that would break the intended use case.
>>
> Non coherent access, including your non-snoop scanout, and no domain
> transition signal just doesn't go together when you want to solve
> things in a generic way.

Yeah, that's the stuff I totally agree on.

See we absolutely do have the requirement of implementing coherent 
access without domain transitions for Vulkan and OpenGL+extensions.

When we now have to introduce domain transitions to get non coherent 
access working we are essentially splitting all the drivers into 
coherent and non-coherent ones.

That doesn't sounds like it would improve interop.

> Remember that in a fully (not only IO) coherent system the CPU isn't
> the only agent that may cache the content you are trying to access
> here. The dirty cacheline could reasonably still be sitting in a GPU or
> VPU cache, so you need some way to clean those cachelines, which isn't
> a magic "importer knows how to call CPU cache clean instructions".

IIRC we do already have/had a SYNC_IOCTL for cases like this, but (I 
need to double check as well, that's way to long ago) this was kicked 
out because of the requirements above.

>> You can of course use DMA-buf in an incoherent environment, but then you
>> can't expect that this works all the time.
>>
>> This is documented behavior and so far we have bluntly rejected any of
>> the complains that it doesn't work on most ARM SoCs and I don't really
>> see a way to do this differently.
> Can you point me to that part of the documentation? A quick grep for
> "coherent" didn't immediately turn something up within the DMA-buf
> dirs.

Search for "cache coherency management". It's quite a while ago, but I 
do remember helping to review that stuff.

Regards,
Christian.

>
> Regards,
> Lucas
>

