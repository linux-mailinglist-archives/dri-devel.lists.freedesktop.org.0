Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB7459006
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870BE89904;
	Mon, 22 Nov 2021 14:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941B189904
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIF4QD+CtzwhF4jO8h1hFAaZ3vp21U/CYoBC6B4CPILY2MbGvrp7jiVpKQUSllYWeAdGspyoTHc33JwB2zQWYcfqZVJmhn3H1NYAZk7UzrLaRyGo1a2byd9e7ilEypwDcIzeL72yo1/nbKUlG9mNQ1gRJ3FUWjG+bBJQYVlySYJ/m/d0Uflaq0q3IZKXW8bSTJ18lawt4RLxlMb5CsTCg+Pdwp+iA3kRjTbaq7eIIG0hw9+0EfM9zInlfxQY5qGLLOZvzjzmmKtvkCk6vnoWhKtrkR2CFjy56zjt4eOme7GkQJZqfq7+GmFZLEylln+aSFXFmZNPpYXg5FKPa1dBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZET2EVtdE8PTLGCkpanVE16gD8Ak5Y98Tx8BwEitBQ=;
 b=Qq2RZDV7N4Ktsz328kMLzt30zeH/4R6zwFw0S/5Ls/KwVj9xR3VVEMd0UhAHamhjVH/uz0tQ6ZAfnztOk+/l3PTWeJCsYD6yw2MFgBAHT0wIcmgQIRGvcwYowOVViCgNaMLF7KANVAU0YdgCDbqHivChkTkmqdImbVrGYwNnVM7FSVEDfITCCh9PnXIpQW+M/l6BfwSW3PPeSL+iGyTx4JyHcNdBs49vZUbw2F3mmjD/HigNcBptRU8ZtGkKNSnQKd46G3wjh5LzH2hyv8G3Xwjf65ah+UN9PiUTbtUkp/RXL//slCy16vROX0LY1bUnI1fuOKwRauTbz1GgMXL1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZET2EVtdE8PTLGCkpanVE16gD8Ak5Y98Tx8BwEitBQ=;
 b=Ykk0Qb4jozXrxXK7IoxPrUzj2o23s0DDKjTb3ac5QUh9R3FawEwsS8Q5INfgWRvug71ZjU+PsVtt+hixzhIz4eNtbnTo0JzweSPiOSSjeHcLNtBMI44mP6+byvTmlFGknMFL5Pmu9x2IvhxyRPsrXe4NOk45HgZqvICbIHxGrG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1534.namprd12.prod.outlook.com
 (2603:10b6:301:10::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:15:33 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:15:33 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: Zack Rusin <zackr@vmware.com>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
 <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
 <DA2A5639-903D-40BF-AC28-EF091F26AC93@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18eaf730-7f82-9fdf-db94-365de860e971@amd.com>
Date: Mon, 22 Nov 2021 15:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DA2A5639-903D-40BF-AC28-EF091F26AC93@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0602CA0011.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:f689:62b7:dbd1:b281]
 (2a02:908:1252:fb60:f689:62b7:dbd1:b281) by
 AM5PR0602CA0011.eurprd06.prod.outlook.com (2603:10a6:203:a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 14:15:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ad17a6-1c9c-4c5b-0c45-08d9adc28b72
X-MS-TrafficTypeDiagnostic: MWHPR12MB1534:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1534E12EA65F3A789D7E7C9C839F9@MWHPR12MB1534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTpyAqKEXMP7VQeMDgU19BCx81Se+Op41A0Os76YumiJu2PeEgAXidzqnuATxR66J0sN3Lujz3OjE2r5zoq9X18DhVuVrV/o/0t4Q2JaSRgW2Y/FjghJ2/8KXlTxFlWYfY84cvsV/0xzaAKiB58tnWxalAvLW8Bz4VqHTjGOV01+qJDpxLJoO7/VjDZi6bsl6lGiyPzVCIQijKpWnoQnXBJc/uO+plar6LoCPiUWYVpdTrCxK+rJUDlpu8rld+JvkP3g1gSn6Ec6QlgYIhVmMCt0brxpIL46hHhDh8e3ZllFnfcLP36gdHalv7AZX1lmVdjrtm80PTwpz32yO1tl+5nk+EptUX2nAivpIY0sELrfSWIdRZpzvG9/qZX98ptkkWjOQrzYKuPW6V2eq1mjHrl3hDarppdja4g9p7yfcHWXXIjOBbkG6GWc/cJccEi2gkJUy2pGmx+s2ikjZQs4E9ogAWKIhDN1gJR4Zra3J9B7Q9xWo2p7PV3SUrxa4sf8OMAT36SN2gYi9KuHM0kye+liaQStnIHPio2WJNWlT4u6kpTSHksWMvvA5qrvpM8jV2FTTeoXSdgriwK5CcFHSJeGNpsIFb8og9U6vFa7Dr6tH2RhV6xN+pMHVwKUD6bbWv/KsF0Ys3jxZ2nK/uISsz/CN8CnlxMFbuPgHidTndxnR0ppnwUF2tbJaO4OxQ3JDet25JJi1Ht5LmLYXbqhIWowRwGdv9pQuwGUsNRCPBvs5SPm+wZnEcTd2dSOHyckU4WXvtsEazRndPmyNYxcgvia/ORfr5znstFtZuD3giRbTHQuHYAiBGL3wsIHiF5c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2616005)(31696002)(36756003)(86362001)(316002)(2906002)(8676002)(38100700002)(31686004)(4001150100001)(66476007)(53546011)(6486002)(54906003)(66574015)(8936002)(6916009)(66556008)(83380400001)(45080400002)(6666004)(508600001)(186003)(4326008)(66946007)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVhxaUJYNDAyUDNubHJWdnJrNm1KZ0VTVmQzT3hRSVZRQjlRUlIyc0xJbDFL?=
 =?utf-8?B?MzVQQUlWeHE2ajZ0aEx6TWV2Q3dndXlES0d6cUxTWURaVGs2T2ZRVENvMGlG?=
 =?utf-8?B?Rmp5aThUeGlPYm91bllRZ2h3VURvcFk2dlhlOUI0Mng3OHIxL1VKTjUvUEI0?=
 =?utf-8?B?V1IzTkhPc0NOWk1MTWJUV1RBV0NKOExmOVlmM01uM0hBQWpCVUJVSVRZWFB4?=
 =?utf-8?B?bkVyRlRIekxMaGFkU3YxT1hqcURxSGpwRmpmVDkxWkhVdGZHdlRjUTFsUVVX?=
 =?utf-8?B?M0doS3N4bS9hbU5ibTI5L2JhQkx2akk2RlF6Slh6eWxnNkxyWnBFdEV3Q1dB?=
 =?utf-8?B?MjdDUk9pUG5WVEVCTGpoM1ZJM0M2RUpxR3hUSmRFOFVuaFZtSFk2WGVRM1ZH?=
 =?utf-8?B?UE9WUGFjSk1vSHJaemVnWmh2OVE3emlDN3d6N2ZySVdEbkExYnpvZlZsMy9E?=
 =?utf-8?B?ODhRRDBpSGhrVVl0cmxpTThFYXkyVFc1b0k3L0RFOG13MDc4YXhPM0NYa0pL?=
 =?utf-8?B?TDlvVHROY21EWS9GcTR5TnYwKzJRTEpVRWk0V1JUUmxKbU5ROHFhOWNiWUNH?=
 =?utf-8?B?VkZsTE5NOFdiU2JxVmxUeDY2N3JERVZnSDZHWldaaUVkSDRXbjM0UWNTclk4?=
 =?utf-8?B?dHg0TURreFlpY2RNZ243NGg5NE9BUjRwdzkxUHJ5OGFMQk1KR1VYazFnQURs?=
 =?utf-8?B?bWIwUWdYTUtERW1UTll4MVJaKzUvb2ZKcFNpNndkSUttczVkZ2kwZmkwVk44?=
 =?utf-8?B?THBUQ0dlRFpRbDYzWkN0K0lITGFKbUU3UEpVaEk2TFF5cmw1akNEOG9RUDc1?=
 =?utf-8?B?WDQ5VHVYZlFxU05palprdWNoNjRiT0x6TEV2UUJ3VHpWRWV0V0RsOWpQb1ZF?=
 =?utf-8?B?SUwvZnFPZXdaU3hjZ1V5WE9vVVFzWWp6OU56RGNqOVNmelJYSjgvbEwvMDYx?=
 =?utf-8?B?dzFBeXNwdFlHcmtaTGhqSS9zR0RneExGYVdtY3I0S1d4ZFQ2VzRTYmVIU1Ev?=
 =?utf-8?B?SWJkdGM1SGFUZUJ1dDhFTndTMTdIbVR5KzlHcUp5cjVVWkpFZEVzUExycFdn?=
 =?utf-8?B?dldZalU3eDF6MGxlcUhJTXBQRERWZ09YUHRrVE5CTHNjUGIvL0FqZUVPczhG?=
 =?utf-8?B?bndzZHZ2NGRiRFUrOVhkTTMwU3RBOXFKOXk3dXkzQ3NmNlZSVStEVG5pT0Zo?=
 =?utf-8?B?Nk41WTMwQ3FqeEN0OWNHUzdkM0NhYmlCMTRZcTVwNmZWeDJRYlJNdjFGdVBR?=
 =?utf-8?B?NjhiSDRjTjlodWxhSDVXejJ5RmFyTFZTdGRScnVUZVg5dzZpREtRYXJJMGo5?=
 =?utf-8?B?MEsrTzU4QjZ0aUowbnVmQmZONXBmOXpWYUhOZEtoZlFBT0s1ZFBRY1JLTkdi?=
 =?utf-8?B?cm41VmdHaDNaMjBheFdmc2dzanlCdW1xMzFjZHJNUXh6cCtiSkFqbFNqVnR1?=
 =?utf-8?B?aThLU1NOVzZFa09GYnEvMC9FNEl1VmFsRWNLRDlQdjVvS3FVKzQ0ZlBMR05V?=
 =?utf-8?B?amJVOGVScnNHRmZZV2xkdmlsOTJLVmNoMW5JUVJjWGZhNHU2ZS80bk94WlNk?=
 =?utf-8?B?ejl0MkZJRWNRZ0sxZjdydnB4QjBjVFZlcGorVlpwVDdoVnJFQUw4V3lKTnZW?=
 =?utf-8?B?Q0lBRnJuU3QvRld6dlVUdHRXdnVHTlMxUnhHZStYMVg1MmlMTzJzU3ZjaEZG?=
 =?utf-8?B?aEFKc1pwWmttS3NISkYrNjZ4dythR3l1RTZ6dXJ5N0RiVERFdDNZR1BXekla?=
 =?utf-8?B?K1NsK1VsWG1XVDB5V2FyMDY0anowNTR5WEhpbWdmNWVQeEtGcXhzdkxyelFG?=
 =?utf-8?B?TUxpWGdnQ1U1WFoxUk9jY2s4MmFLTHd5TzMvTi9pNVJjWDYzcFd6cWNrdTBU?=
 =?utf-8?B?Y2pRanRRMG96OTR6Z2RGZWxqQnQydXlmamU5bThMcWM0TkRRNVlUNkJjTkRB?=
 =?utf-8?B?NVlnTXhHdklTeWdyWlh6Ni9Uc3pRY2tJTmJDVGdLZVl4OFJIa0R1enJEeUV6?=
 =?utf-8?B?ODN3Vm5Td2Zwc2pjbDlOaFJKMkJPdXUvRkxGYlRSSUxrTFppaHlSUlJwUGYx?=
 =?utf-8?B?cmh3a05MZDdJR3RVVXJOL292cGk3UVhVZ2xRZUt1aEtZTlVhTGJydHRSSW9h?=
 =?utf-8?B?ek8xS3hrbHplMnpHSEdvSGN6OWwzZ2RYdER3aGVhS1V3Wlp1YUhmN2gyZDRG?=
 =?utf-8?Q?m7NyPdmgqOUQErTaWg1dlYE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ad17a6-1c9c-4c5b-0c45-08d9adc28b72
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:15:32.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3RHJnWpJw7lwx+De+35mmirW1NVQhO0VBiVNnea7eSE64P53jmZvqZ0LEyIqUjR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 16:53 schrieb Zack Rusin:
>> On Nov 16, 2021, at 03:20, Christian König <christian.koenig@amd.com> wrote:
>>
>> Am 16.11.21 um 08:43 schrieb Thomas Hellström:
>>> On 11/16/21 08:19, Christian König wrote:
>>>> Am 13.11.21 um 12:26 schrieb Thomas Hellström:
>>>>> Hi, Zack,
>>>>>
>>>>> On 11/11/21 17:44, Zack Rusin wrote:
>>>>>> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>>>>>>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
>>>>>>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>>>>>>> requires the drivers to manually handle all interactions between TTM
>>>>>>> which can swap out those buffers whenever it thinks it's the right
>>>>>>> thing to do and driver.
>>>>>>>
>>>>>>> CPU buffers which need to be fenced and shared with accelerators
>>>>>>> should
>>>>>>> be placed in driver specific placements that can explicitly handle
>>>>>>> CPU/accelerator buffer fencing.
>>>>>>> Currently, apart, from things silently failing nothing is enforcing
>>>>>>> that requirement which means that it's easy for drivers and new
>>>>>>> developers to get this wrong. To avoid the confusion we can document
>>>>>>> this requirement and clarify the solution.
>>>>>>>
>>>>>>> This came up during a discussion on dri-devel:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C57658f299a72436627e608d9a9194209%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726748229186505%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=UbE43u8a0MPNgXtzcqkJJfSe0I%2BA5Yojz7yoh7e6Oyo%3D&amp;reserved=0
>>>>> I took a slightly deeper look into this. I think we need to formalize this a bit more to understand pros and cons and what the restrictions are really all about. Anybody looking at the prevous discussion will mostly see arguments similar to "this is stupid and difficult" and "it has always been this way" which are not really constructive.
>>>>>
>>>>> First disregarding all accounting stuff, I think this all boils down to TTM_PL_SYSTEM having three distinct states:
>>>>> 1) POPULATED
>>>>> 2) LIMBO (Or whatever we want to call it. No pages present)
>>>>> 3) SWAPPED.
>>>>>
>>>>> The ttm_bo_move_memcpy() helper understands these, and any standalone driver implementation of the move() callback _currently_ needs to understand these as well, unless using the ttm_bo_move_memcpy() helper.
>>>>>
>>>>> Now using a bounce domain to proxy SYSTEM means that the driver can forget about the SWAPPED state, it's automatically handled by the move setup code. However, another pitfall is LIMBO, in that if when you move from SYSTEM/LIMBO to your bounce domain, the BO will be populated. So any naive accelerated move() implementation creating a 1GB BO in fixed memory, like VRAM, will needlessly allocate and free 1GB of system memory in the process instead of just performing a clear operation. Looks like amdgpu suffers from this?
>>>>>
>>>>> I think what is really needed is either
>>>>>
>>>>> a) A TTM helper that helps move callback implementations resolve the issues populating system from LIMBO or SWAP, and then also formalize driver notification for swapping. At a minimum, I think the swap_notify() callback needs to be able to return a late error.
>>>>>
>>>>> b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd vote for this without looking into it in detail).
>>>>>
>>>>> In both these cases, we should really make SYSTEM bindable by GPU, otherwise we'd just be trading one pitfall for another related without really resolving the root problem.
>>>>>
>>>>> As for fencing not being supported by SYSTEM, I'm not sure why we don't want this, because it would for example prohibit async ttm_move_memcpy(), and also, async unbinding of ttm_tt memory like MOB on vmgfx. (I think it's still sync).
>>>>>
>>>>> There might be an accounting issue related to this as well, but I guess Christian would need to chime in on this. If so, I think it needs to be well understood and documented (in TTM, not in AMD drivers).
>>>> I think the problem goes deeper than what has been mentioned here so far.
>>>>
>>>> Having fences attached to BOs in the system domain is probably ok, but the key point is that the BOs in the system domain are under TTMs control and should not be touched by the driver.
>>>>
>>>> What we have now is that TTMs internals like the allocation state of BOs in system memory (the populated, limbo, swapped you mentioned above) is leaking into the drivers and I think exactly that is the part which doesn't work reliable here. You can of course can get that working, but that requires knowledge of the internal state which in my eyes was always illegal.
>>>>
>>> Well, I tend to agree to some extent, but then, like said above even disregarding swap will cause trouble with the limbo state, because the driver's move callback would need knowledge of that to implement moves limbo -> vram efficiently.
>> Well my long term plan is to audit the code base once more and remove the limbo state from the SYSTEM domain.
>>
>> E.g. instead of a SYSTEM BO without pages you allocate a BO without a resource in general which is now possible since bo->resource is a pointer.
>>
>> This would still allow us to allocate "empty shell" BOs. But a validation of those BOs doesn't cause a move, but rather just allocates the resource for the first time.
>>
>> The problem so far was just that we access bo->resource way to often without checking it.
> So all in all this would be a two step process 1) Eliminate the “limbo” state, 2) Split PL_SYSTEM into PL_SYSTEM, that drivers could use for really anything, and PL_SWAP which would be under complete TTM control, yes? If that’s the case that would certainly make my life a lot easier (because the drivers wouldn’t need to introduce/manage their own system placements) and I think it would make the code a lot easier to understand.

We also have a couple of other use cases for this, yes.

> That’s a bit of work though so the question what happens until this lands comes to mind. Is introduction of VMW_PL_SYSTEM and documenting that PL_SYSTEM is under complete TTM control (like this patch does) the way to go or do we want to start working on the above immediately? Because I’d love to be able to unload vmwgfx without kernel oopsing =)

I think documenting and getting into a clean state should be 
prerequisite for new development (even if the fix for the unload is 
trivial).

Regards,
Christian.

>
> z
>

