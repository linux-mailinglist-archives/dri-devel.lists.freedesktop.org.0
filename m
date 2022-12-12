Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99C649D3F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 12:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC310E194;
	Mon, 12 Dec 2022 11:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABE210E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 11:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9JUy0WWI8gFzbtX27d78RmkIJvDXzYJnRx8PLCOpRfZ3k1jAXbq84lqPjdjtU0JOdTZ/Vw4+uqEM2QX+CHKRS/FqPGVwhczLGikh3w7m4C1zau4ciuMmpOe/JMDnXUL3p9U1xK7TDAGYQVOSJpngVkTcFWtSzT6NhTejajBGX/PBZ8DZn2t6OjoRKyUYvWxAjYmzT5/96wBR2u5M+YrP0SxBnyVaiolYDOhWmRrILqVgSEFQqyo721Bu+DtewrQhuaq1kCP0jjkYhdInVr9j7dbKbNmt4Bn7kSP3xBh/mf8H218F8w+d6SQYtINjgIL9AKGt0ifEIa8zQxuGxLJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGWS3yfX/9gHT4RkD4tbZwkCxi9SC6N75YiV8TEbN2A=;
 b=YmZl0hlzkEbVbv0MaaKbp4koiWn4Y2plGMJ2YRgt+KZIpZtzRvRGIRlPlidR+D6xGMBk897vlFIcTPSSGwYnC7nzJeOi3rXU4oHRAkPorI2NcUt62ITTnGiWGdpOr6/Sr9cf5bZVd1XV/Ku8wqHh7rhhSApYFbN9GRnAMRpYVlNy9MQSloqEuiyLf4f68tpQ5fC+JYindpo+cQG4pO7Dg2nf+dBvkuPFg+DJcnt/7T7xisJ2qsrTy/3ja0MCYEmKRhAwU6HhVmqrsCtXa0C7HpYum5ISDh6nJ9eeG2b192qu1UiYHQuIC1IVxiLbQ89OOtEfx0w+9W03gjEoC045tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGWS3yfX/9gHT4RkD4tbZwkCxi9SC6N75YiV8TEbN2A=;
 b=B8Z1hfb33MYSynC396TQABX8k8Q73UAoV7SG6OUZQUMsLqtlJacu12em0WV3duJ8Yvdk/knaRmO8c6o+bSEJFMqY6mE5704ya+8M99yvEEwEXDvnDnUY+hixJQQ/6/YCgJiO+mT4mh9B6SlU6DqWDPlfJzysNBsi8k6wyTfrtVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 11:15:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 11:15:07 +0000
Message-ID: <b4a96293-226c-e446-f929-5da0bece6cf8@amd.com>
Date: Mon, 12 Dec 2022 12:15:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
 <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
 <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
 <CAAFQd5ATVNQRdVUdiCqJP3kyT4ETP4pvdsSypt89KSEgsH-7Vg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAFQd5ATVNQRdVUdiCqJP3kyT4ETP4pvdsSypt89KSEgsH-7Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b6e147-246b-4d19-9096-08dadc322043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yRSPKWiFCrj2BzUpEBl6sFzsB9gvWV4ZZDXQiUrMURADcQB0JJ9eh76SjDSq9xxoSFPZiHeyuk6DVocoTBX46IKJvmbDl3hAhmoMuzAU0Ebugb9nCVZHSIDzsmpEhw4+MzMm/tPOm64qlp4oLibHJ+z/gH5liS/ImOtiXDpAvzohxk+HJap4LydVIaRCKJhBbE+Y2bvEW4pgn8r0f0jZcGOp6hH6liJqaBmjFBllrSTPzNjdks2QgDVRrPeQCMTLYeq3N5fgJxuDwW7M5OGcQNVdBenrRnlumDNxwqm2rj5pu7vFuin2I6OeaLHi7c/fu82IiXAzHAiNWVnhQ6xWV4cPGodnzfKopCDT0RAU8ewqpgmb9hFoJdvGK8J69oHUC93pV78YMMTpdypeGcavy/X7WCCBsuEkpc4551iFJ9Rzjy/LzdBTP5Sy3X5mLILMPGPyXvucGJHSFLPWMrnEcZ8ws9vq+AbUCsvrG5vJGHMnXaxcWN3WRN+wBPtSoD1xz6IrdoT+6ns1klYumzhJTHURqpf65q/WC3jSYpOhOqV+aqe/TLl7JS22suacLssY31jB9N4JCvDuoN6gmyAB2Ofee7zX6/M7WhaEHV06dr9RV3+KDnO5ciWGFKlgeYJv/+cmkuIctUlAZKLlyOCeFC5oXq+XasLiNTabwhV3vZpzYlI1CNlJ8FY1oPbOF7xLIg7LDLuo4m+0wSBPfmTfmFIiJEPNM7PXq58YUxAbVDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(38100700002)(6486002)(83380400001)(478600001)(2616005)(6506007)(36756003)(6512007)(6666004)(2906002)(186003)(66899015)(31696002)(8936002)(7416002)(4326008)(31686004)(41300700001)(54906003)(8676002)(66556008)(5660300002)(66946007)(66476007)(6916009)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lQUTNYbEczanh4SEFTdHVScENkYy9nOW9Kc2dqdDRZNzBJK3BFcUd2bGgx?=
 =?utf-8?B?V2pyaVNWM24xYnhQUjdBQTJETXd0NTJuVE80cHJobXE3eUR4cWZIZDhhV0VD?=
 =?utf-8?B?d0RJdkY0SFBNTkxpSzVEZU1BeTh4UEhjcVRQbm9nVUhQNk1zcEt6R1hZYm4v?=
 =?utf-8?B?UEdrQkZ3OEZEaC9tTmNKV1d6UFVnMkVkTkd1bDFZYWdBYjlQZ1lFK2huZUU5?=
 =?utf-8?B?OEJlYVcxR1BpWmN4bGtvQVp5UlZ1MWIzc0tmKzlEeFBMZFJQSHp5Z0JyTFZH?=
 =?utf-8?B?STM1NTE1cUJCTnZ3MDF4eGJTcnc3aWM5TjQxVXRVdjhCNkpxd3ArOVlGTDk2?=
 =?utf-8?B?M1NEcjRCWEZxMDdQWmdkY3htTWxIM0NCamQrZ1MwUG05WjRIK2Z6SDAvblJa?=
 =?utf-8?B?ZjAwc3V0OThYNHRsNUJqS1FsSVA5bWZoQWVDbHlHSENhaVdoeTQvYUx5ZmdP?=
 =?utf-8?B?Q0tOWlBTcTV5WldtOG1DQ1hlZGVRRVpacWdGanZ1NWtPTHF4UHhxeGRpY2V1?=
 =?utf-8?B?eGVXWjZiTEcvVnVHVS9SaWIzU1JUSnUyMVk1RTlSZC9MUmtuV2wvc1puZVVr?=
 =?utf-8?B?eVBPaFZNdTJXQ2JDNGpzSTRJMWt2RjJLL2gyd1VVTGdmL1ZHeVdpOGk2YW1X?=
 =?utf-8?B?NDhuRkROYkxIblVKVGV6UVk3M1VZeGtkL1ovcGJEVTlqbkV3cWdMSk1aZDhW?=
 =?utf-8?B?UDNiaFpRR3dYTEFCNWwxNWhvYTV3OHRmMnVTdm11TzdvVWk4eTJ6RVkwRzJ1?=
 =?utf-8?B?Ui9yOC9kd0RCUHI5OUV3Zm1jMUNCclRsS0wzbXFDejBBeFIrL2Q4S3l5cHB5?=
 =?utf-8?B?aVFRdFBXdWNhbk5QRTQvRWhzTTNWQ2RXV0hVTHdjQTJwUVNsSEZmQnZoQ3lx?=
 =?utf-8?B?YWZia1NqbHBTY3BVKzVydllqL3ZjaGtOTVNNU3dGODhnWmpCZW1KUDRXV0NF?=
 =?utf-8?B?YWg4cnlZL2VORi9zMXNSQ0diTVFPWlNsc1FKNGJHM1ZnV3JOc2hkMW9KdFdr?=
 =?utf-8?B?QXdiWmR1eFU0eE5HR0IzOWY2N3A0MW9UTmNQdS9WekRqVmdrM0t6a1J0Q1pl?=
 =?utf-8?B?SzlEUnlhM0duTm1mMy92azRZTjI1dEt3dzR1VC9SQklYaTRsYlVMd0ozWUQ1?=
 =?utf-8?B?M1pvYTdFcWdlRXV6MG5XemMyaUFsbXhxQXRlazhiUFF1aHhCb1Zwc3BrNWFj?=
 =?utf-8?B?RlZHbG04MVhLeUJ6ZjdrYTYvQjF2SkdHWWhEUnR2VWlZQ0xHd0dqMU1hcWd2?=
 =?utf-8?B?YnBwaFUxZjAzc2k3cWNZczlkeWtFeld4RG5zMExRa2cxNlZjd1dEeG1iWnVm?=
 =?utf-8?B?cWRuOGk0Q0V5aEtEWWRMRllRUVVmL2ZDWExGaStNVmozUUFUbUxZZ0FXaDFq?=
 =?utf-8?B?dFF3d2hubktrTUhvTXJZQ3ZtZk9wTnlSbU9PZVpWK0xZaGZQbXNBS3NuV2Mr?=
 =?utf-8?B?TlFWUVh2SENENkNnU29UU1ZsZmtLMkljWko5ZStTa0JtRW96YWdCVUkrbTlv?=
 =?utf-8?B?RE1zZSttOU42aDBrVU10VmR3RVdqR29qQU84OUFteVBwN3hua3VVaEFCMzA1?=
 =?utf-8?B?cEhmSlpKb2tXY3Y2YndkQUREQmtKeitXL1grVHlsbXJEdlpSSk1tUVd6bFV2?=
 =?utf-8?B?a0hZZzgyR3lGY2VDak5pSGxQUEg0blRTWDNtK1BaZnVwUnhNYm1HWWg4ZUdo?=
 =?utf-8?B?SndWNnhYL0p0dUpOWVpsK3EzNy9rRHBjSnZBMGY5S1JwTE8vTVFiRTdEZEZS?=
 =?utf-8?B?cUdIVENFV1JqcXlYY0pZbXUrVldKVFJycUxCK1Fab2ZaSGkrTzlQaW0wLzRw?=
 =?utf-8?B?NC8wMDRHK0c5ZGF5OWNMSXFqd2w2WjRWWm8zTThvbUJUU2pHU2Nib1ZVN2ZZ?=
 =?utf-8?B?dzJIQWcxaWpFZVl3cE1kd3pvRCtLRVlNOExrbG12ekNTM2hqc0hUVUwxem55?=
 =?utf-8?B?KzBHQUZwdW9xS3k4ZzNJQjlpaXhLU2hXNlhlbnlaYktRMlE2LzFscWpVMmJp?=
 =?utf-8?B?cjlKN2ZuVTVkV2toanMzbHkrdVFYZnJBL3pWN2ZacjZRN0JUeFdiK01jRDc1?=
 =?utf-8?B?VitaeU8zWjRweVpXZkprOU9hZm8zK05Hc0U1RC9mL2FJTlFKN0ZJL0dUakJw?=
 =?utf-8?B?VUx6dDRZUDhvTmJvQVgxM2huMnFFRnIzajdCUkpNN2dOYm95Z0RpWW4xZ1BC?=
 =?utf-8?Q?tVzRVuwqgj+/HBsgoXpAuY5Kx2pwd2RZMfmwi+4drTe6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b6e147-246b-4d19-9096-08dadc322043
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 11:15:07.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMpBZplhTHlvvG9BisISfDf5+UTOqFIHrj7r+5DZawFAAdQ7jYC5F7ePflquvrX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.12.22 um 04:00 schrieb Tomasz Figa:
> [SNIP]
>> What we could do is to force all exporters to use begin/end_cpu_access()
>> even on it's own buffers and look at all the importers when the access
>> is completed. But that would increase the complexity of the handling in
>> the exporter.
> I feel like they should be doing so anyway, because it often depends
> on the SoC integration whether the DMA can do cache snooping or not.

Yeah, but wouldn't help without the exporter taking care of the 
importers needs of cache flushing. And that's exactly what we try hard 
to avoid because it creates code in every exporter which is never tested 
except for the case that you combine this exporter with an non coherent 
importer.

That's a testing nightmare because then you everywhere has code which 
only in very few combinations of exporter and importer is actually used.

> Although arguably, there is a corner case today where if one uses
> dma_alloc_coherent() to get a buffer with a coherent CPU mapping for
> device X that is declared as cache-coherent, one also expects not to
> need to call begin/end_cpu_access(), but those would be needed if the
> buffer was to be imported by device Y that is not cache-coherent...
>
> Sounds like after all it's a mess. I guess your patches make it one
> step closer to something sensible, import would fail in such cases.
> Although arguably we should be able to still export from driver Y and
> import to driver X just fine if Y allocated the buffer as coherent -
> otherwise we would break existing users for whom things worked fine.

Allocating the buffer as coherent won't help in this case because we 
actually do want CPU caching for performant access. It's just that some 
device needs a cache flush before it sees all the changes.

As far as I can see without adding additional complexity to the exporter 
this can only be archived in two ways:

1. Switch the role of the exporter and importer. This way the device 
with the need for the cache flush is the exporter and in control of the 
operations on its buffers.

2. We use DMA-buf as neutral mediator. Since DMA-buf keeps track of who 
has mapped the buffers it inserts the appropriate 
dma_sync_*_for_device() calls.

>> [SNIP]
>> The best we can do is to reject combinations which won't work in the
>> kernel and then userspace could react accordingly.
>>
> The question is whether userspace is able to deal with it, given the
> limited amount of information it gets from the kernel. Sure, there is
> always the ultimate fallback of memcpy(), but in many cases that would
> be totally unusable due to severe performance impact. If we were to
> remove the existing extent of implicit handling from the kernel, I
> think we need to first give the userspace the information necessary to
> explicitly handle the fallback to the same extent.

Good point.

> We also need to think about backwards compatibility. Simply removing
> the implicit fallback cases would probably break a lot of userspace,
> so an opt-in behavior is likely needed initially...

Yes, I'm completely aware of that as well.

We can't hard break userspace even if the previous approach didn't 
worked 100% correctly.

>>>> That's essentially the reason why we have DMA-buf heaps. Those heaps
>>>> expose system memory buffers with certain properties (size, CMA, DMA bit
>>>> restrictions etc...) and also implement the callback functions for CPU
>>>> cache maintenance.
>>>>
>>> How do DMA-buf heaps change anything here? We already have CPU cache
>>> maintenance callbacks in the DMA-buf API - the begin/end_cpu_access()
>>> for CPU accesses and dmabuf_map/unmap_attachment() for device accesses
>>> (which arguably shouldn't actually do CPU cache maintenance, unless
>>> that's implied by how either of the involved DMA engines work).
>> DMA-buf heaps are the neutral man in the middle.
>>
>> The implementation keeps track of all the attached importers and should
>> make sure that the allocated memory fits the need of everyone.
>> Additional to that calls to the cache DMA-api cache management functions
>> are inserted whenever CPU access begins/ends.
>>
> I think in current design, it only knows all the importers after the
> buffer is already allocated, so it doesn't necessarily have a way to
> handle the allocation constraints. Something would have to be done to
> get all the importers attached before the allocation actually takes
> place.

That's already in place. See the attach and map callbacks.

I'm just not sure if heaps fully implements it like this.

>>>>>> The problem is that in this particular case the exporter provides the
>>>>>> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
>>>>>> with that.
>>>>> Why does the exporter leave the buffer with dirty CPU caches?
>>>> Because exporters always export the buffers as they would use it. And in
>>>> this case that means writing with the CPU to it.
>>>>
>>> Sorry for the question not being very clear. I meant: How do the CPU
>>> caches get dirty in that case?
>> The exporter wrote to it. As far as I understand the exporter just
>> copies things from A to B with memcpy to construct the buffer content.
>>
> Okay, so it's just due to CPU access and basically what we touched a
> few paragraphs above.

Yes, I've never seen a device which actually dirties the CPU cache. But 
I would never rule out that such a device exists.

Regards,
Christian.

>>> [SNIP]
>>>> Yes, totally agree. The problem is really that we moved bunch of MM and
>>>> DMA functions in one API.
>>>>
>>>> The bounce buffers are something we should really have in a separate
>>>> component.
>>>>
>>>> Then the functionality of allocating system memory for a specific device
>>>> or devices should be something provided by the MM.
>>>>
>>>> And finally making this memory or any other CPU address accessible to a
>>>> device (IOMMU programming etc..) should then be part of an DMA API.
>>>>
>>> Remember that actually making the memory accessible to a device often
>>> needs to be handled already as a part of the allocation (e.g. dma_mask
>>> in the non-IOMMU case). So I tend to think that the current division
>>> of responsibilities is mostly fine - the dma_alloc family should be
>>> seen as a part of MM already, especially with all the recent
>>> improvements from Christoph, like dma_alloc_pages().
>> Yes, that's indeed a very interesting development which as far as I can
>> see goes into the right direction.
>>
>>> That said, it may indeed make sense to move things like IOMMU mapping
>>> management out of the dma_alloc() and just reduce those functions to
>>> simply returning a set of pages that satisfy the allocation
>>> constraints. One would need to call dma_map() after the allocation,
>>> but that's actually a fair expectation. Sometimes it might be
>>> preferred to pre-allocate the memory, but only map it into the device
>>> address space when it's really necessary.
>> What I'm still missing is the functionality to allocate pages for
>> multiple devices and proper error codes when dma_map() can't make the
>> page accessible to a device.
> Agreed. Although again, I think the more challenging part would be to
> get the complete list of devices involved before the allocation
> happens.
>
> Best regards,
> Tomasz
>
>> Regards,
>> Christian.
>>
>>>>>>>>> It's a use-case that is working fine today with many devices (e.g. network
>>>>>>>>> adapters) in the ARM world, exactly because the architecture specific
>>>>>>>>> implementation of the DMA API inserts the cache maintenance operations
>>>>>>>>> on buffer ownership transfer.
>>>>>>>> Yeah, I'm perfectly aware of that. The problem is that exactly that
>>>>>>>> design totally breaks GPUs on Xen DOM0 for example.
>>>>>>>>
>>>>>>>> And Xen is just one example, I can certainly say from experience that
>>>>>>>> this design was a really really bad idea because it favors just one use
>>>>>>>> case while making other use cases practically impossible if not really
>>>>>>>> hard to implement.
>>>>>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
>>>>>>> problem that this introduces for it?
>>>>>> That's a bit longer topic. The AMD XEN devs are already working on this
>>>>>> as far as I know. I can ping internally how far they got with sending
>>>>>> the patches out to avoid this problem.
>>>>> Hmm, I see. It might be a good data point to understand in which
>>>>> direction we should be going, but I guess we can wait until they send
>>>>> some patches.
>>>> There was just recently a longer thread on the amd-gfx mailing list
>>>> about that. I think looking in there as well might be beneficial.
>>> Okay, let me check. Thanks,
>>>
>>> Best regards,
>>> Tomasz

