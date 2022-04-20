Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB9508257
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDF710E704;
	Wed, 20 Apr 2022 07:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8810F08A;
 Wed, 20 Apr 2022 07:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CELdDIJxkA7fGxd5/Rj0HNpFEsLrkGuNHxeTRzyPR8j4HnS93JhnXJOdzOLykaU7YAI4zA8efy59UIYXaQ4/IYVSFYCSajyaxwqjVm27889vs2KJkhcHunURxzUOKx1HxNjVmU1ZgD2Q/VJBF62MkiNqQzUNBt7mSlORfNVOCsb1DJAQHPiU7uW94cfRkP1AExSj6W93632fYQkQHWdK/Qg3RtJ7NByxu5cVvDiv8oS78u3XQyutlgMCwTMoFaUxcaGjXMgkRN35+PhEs3LytiFNFS8yHvNgHyzoGse5wVB8otBt27AZUflL3YhFgbJj9W7ho8DXdX24cb7D88Rs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ8WpUiugs/8svHRw5QRc3k2URCvwyQcTmBTkZAPuQM=;
 b=fo5th5TMeKIV7hXRqokJudWgUOvZUd91DhJihQTsSE3MRbr9e7M5RRqK1VTd2xi3dIzVzOEYnrd3LFFFPZOhm/qjSH0RlP1bo5WgBvvrikV3fjByuNPmB52FFHtK7hz+idgBEalsmzD8rViAelew8Fu26sJXdhX6VcgSG0CJ6tBaiAOzHBP5kplGC160jkj7es7EelO/2ayW6TnvwjR+YUPrQgp2XnoEZivNxNacmPJwHVgiqH3cceLrIAtmJOYXHAUrT+yI7CkmLYtmWLstZoOlfjMP/oOeE0T2zAuKCFk+rHQXKfizC8OQD0evWTmvZaW7avFZH9PCYDEe/LEGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ8WpUiugs/8svHRw5QRc3k2URCvwyQcTmBTkZAPuQM=;
 b=CE+rUiVWARVoCKSfnF49PQHaQAZstgeXbv+eTlZARt6M0BbBPW87ohcaztyZNgsiVAqqAhqmhO41t8HhLY8eKfcx3LHYm12SLWzQS8t5M22sQSaT+NGfd+kgOa0y4Paj+Lf/0H90emFYbVfoELLge3o9l5eNu/wqW/lqmWUYNkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5177.namprd12.prod.outlook.com (2603:10b6:408:11a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 07:38:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 07:38:05 +0000
Message-ID: <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
Date: Wed, 20 Apr 2022 09:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffcc2d01-82ce-4951-74dd-08da22a0b4cd
X-MS-TrafficTypeDiagnostic: BN9PR12MB5177:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB517782E929574FF5B976219C83F59@BN9PR12MB5177.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoIuKFZPsK5r25hfRBZ14LS8J43qHzANji17Zz1CtI4BNhlL/uUsIi5oO8pUye7UEYfqrD+pjZugR+a0l/Lj2Z76tCbHPPLRRabUWFGmIqktNiEf5+2J/DUP+fY22yfd7YNY9dhu4l92Z162urgXKk4V3o6HiBuDG4Qnl7nTfrx6v4rI7jY9m17boypPfdu1o3r6SQqq5ldXH3ywDkdYoXZJA4LisSU/S3EzMWA0kT0S1hehSN+zgW/NezTsVBSD07mV1lo7FTxlBAQnac/E5ZHORlwFVhHoH9XF4AOniWJi1ykdD+ZCtP/wWp8U9+UfaBUGELdZ+071hvRqSHvS3ERCl59sAB1XwcZu/Cw2vckriy96edZ09f4zrza4V6KBik+vCdFd33SPxXS6f4qXek4ncdkZ8K6LBeT3D8KbvBfqoNOhGJRevlhlOjdJH2gE0g/pa76yetixti21XZDXEwjaihsgDNP1umxf0PTh4Kmt5w68nvZcs7keY6u6VYeBnuTYujIM3QPQFbtKTsiNKlX/pIcfBWB8B4fW+nz+NmOrWjJbBqs6OEylMJe9Rgnf7F4fVT3phMgRkLlysRCDglqs6iCw8lr6aaEpp7lEd2Sk/yyZzdQx4imz5nd9/JjW1Q5JQIh/VSOYUKmdljnjMyGQMLsALtxB9XBG9KBRLuASUAXVc+onS10gvZYPhnTO+me4As83WG2uxtTsD58P2fbzPHwdAQuncjesaDGyVoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6666004)(6506007)(6512007)(66946007)(45080400002)(508600001)(316002)(4326008)(966005)(6486002)(66556008)(86362001)(31686004)(66476007)(110136005)(8676002)(31696002)(36756003)(66574015)(83380400001)(186003)(26005)(2616005)(5660300002)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndPQVlhYW0zNnlHRklJd2pDSlE4NXJ0YjFaT05HdlVucXl0dHFsSDRSaitP?=
 =?utf-8?B?OFJQcFlhZkZBd2trQWNSR2g0YUhRTzA5MEVweWlVdXc1bXMxZmMvaEF6bjI1?=
 =?utf-8?B?QzU2bHRGRVlUT25rdm9HOHdkYitUcEVGSmZyT2dKUnFkR1ZGanhXei94aVhN?=
 =?utf-8?B?K2E1Zm90Szlza0NoNFQ4R1VCdUlrQXZJV1pESUpwb2U3UDZqN25XSmVBbTRa?=
 =?utf-8?B?K3NaaVpURU5venlEZjU1Wm9HanpYTmVvUHlEUTRpbzBKYlMvZmpJQ2dpSXNw?=
 =?utf-8?B?MUlteG9Xdm83Um15cGszM0pLalhlS0Y2Nk82aXkzb0V6KzliNlh4Z2ROVXVs?=
 =?utf-8?B?TytCVHNNMmVENmtpVU03cFkxU1lEYmpOS3Y5clVMU1B4dFBIdC9hQ2xPL096?=
 =?utf-8?B?aXl2cjd6OE1jU3J5ZnBXbkJHVUJsV00wWWYycXdMQmFoQUNIWXFMenhxcDFE?=
 =?utf-8?B?b0RLR3hKbzZRS3NzK2RHaWpZTWMvNTlOUWMrc2ZhMlRaT2xLQ3VyaWtvU1hr?=
 =?utf-8?B?am1LYXhTSFRML0MvbmQzRmg2OEpOcC9raGJDZndkQnVaUlI0LzFDb1krd2Qr?=
 =?utf-8?B?UmVZM1cwTDJQREx6UmtvRjhZbXpFNWMzb0QwM0JuaG5jMWpDT3FPUzBITG9p?=
 =?utf-8?B?SzlFNm1Ca2J3a0dkVUdETm1zVS9DalVuL0c1VEE1WFBmUnczK29MdElVeC9B?=
 =?utf-8?B?VS9BcjNncjNYajBDbGozTld5eVJLM1hFbzRaMFZ3bU5KVlExSFV0SVhCMmJs?=
 =?utf-8?B?VFJrVGlZSkljNnU0NXpZb1YwUUJycGN2ZVVQeGRjTzY0R1JWOTAyT3R5YlFj?=
 =?utf-8?B?anlEU0dFcnJ6Z3ZpN3U1MWtveDJLeG91QllIZEoxY0VVT0Rnb0FaWkVKaVRS?=
 =?utf-8?B?ekNJckcwNHpOeXpqQTFZZVpRcGhINUVkbFFSVXN1bWM1UkV5T2gyVzVmbnEy?=
 =?utf-8?B?RjZBN3haNW5IaG5pb1ZDdFgvakU1MmxJUjExcHFVQlpuNkpkSDNVTE81emJK?=
 =?utf-8?B?WTMxQjlBcDJqejNGK1NvU2RtM2ppRGY2NHkrYkJ0aTc5bGoydDdmUW5ITSsv?=
 =?utf-8?B?NTRXRm9tZ203Sm12eTVLSk5DbkFNbGlMaXFSTU9kNjJqZitsRkhhMVZFTnZY?=
 =?utf-8?B?WTVaMWRZVGIzQ1Z1Q0w3d2pnb1JmdTNtS0QyS3p3Q1BQaGhSbGNHTkpBUmds?=
 =?utf-8?B?eFl0My85anlrZk80S0diRUpkaUdjRXFmS0tmMHkzTkRTMyt0c0IwdnhsVndz?=
 =?utf-8?B?bGtiSDVCZGlEbFF3RWZtb0lBN01NdlBWR09BV2tuM01JeS9qbDR2L1FmUkp2?=
 =?utf-8?B?dFRYV0xRSVB5OE9jQzhtM1FzL3JFTVRpd1M3SGl4dUdqd3J1WEZqc1Nuekh6?=
 =?utf-8?B?dEZ0cWFXUVh5bmNoSHhkendWd1FEUktPeWpCanRnTlhvaGZ6M1RJbjg2ajhG?=
 =?utf-8?B?dlhNTFlIaGVrMzJidjNKSmZ2R3p0NGJEUlRvMjU1UUJQUTRBQTZjbmRZa2FC?=
 =?utf-8?B?NzBwZ1dvb0pPbHZ6TUtuVm00QVVhTStZdUlaRTRNU1dCa0o0WDVPZ1h1UlA3?=
 =?utf-8?B?bHJja1luYUx1RlFmUFRsbks4dVQ5WnJ0TE9yM05nRExuRE52aEpaNm9zNkZH?=
 =?utf-8?B?UVF6WVRKQURiN1dMS3JoR3k5R1ZwRnRFbExBTlZRemlCQ0dlWldaSVI3SGJG?=
 =?utf-8?B?ek8zN2VPMkN3VitFY0NjWFFNYkFkL0ROL2RjVElVeSsrU3B6SUxDRWtaTmdD?=
 =?utf-8?B?dHZhOHdIdlhNNFVrUEJOWFptM2tXWmxtR1pRaXJLNWtwK1Q4Q3d6WGVpbFJx?=
 =?utf-8?B?b2RNRFZWbzBuaUFsT1RibmxPYlVLa1dSbGVkVlMvRENkUmxEbUJlUXVobXdI?=
 =?utf-8?B?VGZscWYrK3VBT2NpQ004Lzk3VVVYRW5lVkx4RGlwaFJiSVVYSzNmL1o3L1pC?=
 =?utf-8?B?Zi9LQzhER3F1aTFFSkZ4ZG1XTGxYWnByenhMbmRHMWM4STRZY1BsVDY5NWhJ?=
 =?utf-8?B?ZVhoYW12MEFnWkd6Umk2bzRURlhCSndBNWMzQ05heTQ1eEpKaDlPTllyWlNp?=
 =?utf-8?B?NlpMZVU2ZXdQcjAycXVXSEtJMUkyNGJsT1VNeldRS1F6SGI1SUl4QVo0Q1Zo?=
 =?utf-8?B?akpsdElIb0c5eTBpL0cyUk14S3FibmdLR3VrTHE4L1hKNVpKakl4VE5NWDhq?=
 =?utf-8?B?Sy96QzB6TWVEK2RvVXdUcGFXOGkzb0JHR3VxTHBIa0w1WGZHOEVLVktsT3Nx?=
 =?utf-8?B?OUNpdXc4bjNrWUFuOXloajFnQ1BOckNYQXdMOENzWHFSaVlXMk9DUnFTdXFD?=
 =?utf-8?B?TUJIOFBFaE9pUWR0SmFLMU1ROEdkVEJzZHpWMi8zTkUrNENqU2hVUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcc2d01-82ce-4951-74dd-08da22a0b4cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:38:05.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEC4bEKE32r6p+k/nmh2jZydxfftm/79v5a36QHJsLX95X+g/I7ZN0tGQh6ZB/kd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5177
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

Am 20.04.22 um 05:56 schrieb Zack Rusin:
> On Thu, 2022-04-07 at 10:59 +0200, Christian König wrote:
>> Rework the internals of the dma_resv object to allow adding more than
>> one
>> write fence and remember for each fence what purpose it had.
>>
>> This allows removing the workaround from amdgpu which used a container
>> for
>> this instead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: amd-gfx@lists.freedesktop.org
>
> afaict this change broke vmwgfx which now kernel oops right after boot.
> I haven't had the time to look into it yet, so I'm not sure what's the
> problem. I'll look at this tomorrow, but just in case you have some
> clues, the backtrace follows:

that's a known issue and should already be fixed with:

commit d72dcbe9fce505228dae43bef9da8f2b707d1b3d
Author: Christian König <christian.koenig@amd.com>
Date:   Mon Apr 11 15:21:59 2022 +0200

     drm/ttm: fix logic inversion in ttm_eu_reserve_buffers

     That should have been max, not min.

     Signed-off-by: Christian König <christian.koenig@amd.com>
     Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot 
mandatory v4")
     Reviewed-by: Matthew Auld <matthew.auld@intel.com>
     Link: 
https://patchwork.freedesktop.org/patch/msgid/20220411134537.2854-1-christian.koenig@amd.com


Just a stupid logic inversion. Sorry for the noise.

Regards,
Christian.

>
>   ------------[ cut here ]------------
>   kernel BUG at drivers/dma-buf/dma-resv.c:306!
>   invalid opcode: 0000 [#1] PREEMPT SMP PTI
>   CPU: 1 PID: 1608 Comm: gnome-shell Not tainted 5.18.0-rc1-vmwgfx #18
>   Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop
> Reference Platform, BIOS 6.00 11/12/2020
>   RIP: 0010:dma_resv_add_fence+0x2ed/0x300
>   Code: ff ff be 01 00 00 00 e8 31 7d d9 ff e9 80 fd ff ff be 03 00 00
> 00 e8 22 7d d9 ff e9 ee fe ff ff 0f 1f 44 00 00 e9 bc fe ff ff <0f> 0b
> e8 4c cc 45 00 66 6>
>   RSP: 0018:ffffa1e6846c3ab0 EFLAGS: 00010246
>   RAX: 0000000000000000 RBX: ffff94c5c5507138 RCX: 902bc24e7b7c70ae
>   RDX: 902bc24e7b7c70ae RSI: ffffffffaaf7f437 RDI: ffffffffaaffde66
>   RBP: ffffa1e6846c3b08 R08: 0000000000000000 R09: 0000000000000001
>   R10: 0000000000000004 R11: 0000000000000000 R12: ffff94c5cba90578
>   R13: 0000000000000000 R14: ffff94c5cba8bc00 R15: 0000000000000000
>   FS:  00007f9a17c6e600(0000) GS:ffff94c6f9e40000(0000)
> knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 00007f9a14113000 CR3: 000000000144c003 CR4: 00000000003706e0
>   Call Trace:
>    <TASK>
>    ttm_eu_fence_buffer_objects+0x54/0x110 [ttm]
>    vmw_execbuf_process+0xcae/0x12a0 [vmwgfx]
>    ? vmw_execbuf_release_pinned_bo+0x60/0x60 [vmwgfx]
>    vmw_execbuf_ioctl+0xfb/0x160 [vmwgfx]
>    ? vmw_execbuf_release_pinned_bo+0x60/0x60 [vmwgfx]
>    drm_ioctl_kernel+0xba/0x150 [drm]
>    ? __might_fault+0x77/0x80
>    drm_ioctl+0x247/0x460 [drm]
>    ? vmw_execbuf_release_pinned_bo+0x60/0x60 [vmwgfx]
>    ? find_held_lock+0x31/0x90
>    ? __fget_files+0xc5/0x190
>    ? __this_cpu_preempt_check+0x13/0x20
>    ? lock_release+0x142/0x2f0
>    ? drm_ioctl_kernel+0x150/0x150 [drm]
>    vmw_generic_ioctl+0xa3/0x110 [vmwgfx]
>    vmw_unlocked_ioctl+0x15/0x20 [vmwgfx]
>    __x64_sys_ioctl+0x91/0xc0
>    do_syscall_64+0x3b/0x90
>    entry_SYSCALL_64_after_hwframe+0x44/0xae
>   RIP: 0033:0x7f9a1af1aaff
>   Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48
> 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89
> c0 3d 00 f0 ff ff 7>
>   RSP: 002b:00007ffd833696c0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>   RAX: ffffffffffffffda RBX: 00007ffd83369780 RCX: 00007f9a1af1aaff
>   RDX: 00007ffd83369780 RSI: 000000004028644c RDI: 000000000000000d
>   RBP: 000000004028644c R08: 0000000000001248 R09: 00007ffd83369808
>   R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffd83369808
>   R13: 000000000000000d R14: 000055719cb629c0 R15: 00007ffd83369808
>    </TASK>
>   Modules linked in: overlay snd_ens1371 intel_rapl_msr snd_ac97_codec
> intel_rapl_common ac97_bus vsock_loopback
> vmw_vsock_virtio_transport_common vmw_vsock_vmci>
>   ---[ end trace 0000000000000000 ]---
>
> z

