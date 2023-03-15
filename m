Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7E6BBBFB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 19:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88910E2EA;
	Wed, 15 Mar 2023 18:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D48010E2F0;
 Wed, 15 Mar 2023 18:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3EqU6VmwSGDNtvnoIkpxpfgwSGll4w8VI1tlqwTd7PoaUF97DfN4GroJlileH2OqVyzI2LgH9kT8DSLbyCBKUvUFCsJq60L4QBf2WSf6R5t7wL9szWbu4FD7eNyKtNcgmIDbJSHZ3RFdFzEvG1sOsEqseQ8SVE3q2WHPBCfPuYQTmTPqQ2FswRrJZSwIBoZ8NvHlcfJrrHiEj4An3W6dlABVnwPYTmIo3jWj1TExD/enjWlQbaGlp7ljA0iFBWVhDp7HFheYFVkPzLeI3+jE+Rn+GepfkGpiQ6qrKVUbJOYTWLcrSN7AHFVWoI18CsrYejYTX3dMyAxVctHxjm5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQelrKUWDmQuL7+HVX/agfF1gbMSenf7ZSmdpX0fiFU=;
 b=bEctHTnQsRrZLAiqITN5VBRufhGtZxhxB7QL17AQ3ozYXSDMzOfm18zx2aG0X/yBMbUQnVn/WbrodK9T/j6aZbKIzFsH4BHPYg+8OLla60pPYMz7d6jxFw7ZFypdMy5mei0khydnWrt3JchYfuchZ5Mb+ou5RNguIweQsLHMjeHz9YLiq9I+GNGSX52CKu5VtWMTp0cr7CtPdQDdMxtQXFSuvcJp+muAo9RXN/bCsyVxiXfmaqHZ5RRI3hY/akFQ9stfPQ3kgbPFPDwYgrJm0Tnrd+qOifzugq6pilObKowXZv+mzKsR/IYsg7Srghs5Uzg89fc0XGbFODD0IpzNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQelrKUWDmQuL7+HVX/agfF1gbMSenf7ZSmdpX0fiFU=;
 b=oQqqUFBodtWcpix42IOahz1ldgADlNOFbWcfa0l5uSxy2e5hmkSd9lVbn/gjPFv8dFn1gJuA4DbO79iCUuhjxJnn36POA9s3PEXiyANo2Ru0iCarMUgxEYoSLLA92vYHnRsimh2lLVa7Ap1QJ2QDj3uE3Cpb1OwyRSHrz7tbbHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5134.namprd12.prod.outlook.com (2603:10b6:5:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 18:25:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 18:25:16 +0000
Message-ID: <e57ee708-c289-76d3-b3d9-25cace5b3070@amd.com>
Date: Wed, 15 Mar 2023 19:25:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230315110949.1e11b3aa@gandalf.local.home>
 <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
 <20230315115712.56b3c21f@gandalf.local.home>
 <20230315135451.1f7b5e06@gandalf.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230315135451.1f7b5e06@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee38db3-c278-4092-6ba6-08db25829fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7VtE3zPee6LmdSFd3rQDf3yp50rcncSqD4MW1Cs5AdWhdDPzrNrHRFqNAF2vtONk4lWRPWkEympeA7NoxYRdzyZociSYUE3TXzMvoAI0cwOSjpR3GrOq1M8maLEnES2mV9iML19TPCPLPv+uMf6CKMdRzAurBxOSZjrHL1Q+cVYDIpwczICNrkBZMLc5jd70wGiQdClEV4JkbhafiqREyJCbesu2TKdZUsx1B4FtFsB7b6cqbTsGNmNYJaYhLUTIzaTb71b7Nq1xqHJ3mJ5TNNgqu5YKyA6hppDqW4EwTiNZGNcpb0YFbr4+UFWD0XJwTorXDbWXgwD+Dm8fmOVWfjy2nxR5Pew1N5CaekKFM5w92sxIEXlngnmLmrCvo77SSfOXbYCBuJ0DLf+BnTJ/8b2VFTjRqkoOUFntaOjWmMwHLK+yWAWuMm7J/IYs1fj+UnIq0KM4ioQtLH0ciyFzW6ZXz/KLt89Q4CystsPNS6dxA2La2ActgRVWzgTiCu9RLNW0+UcQjVwAtp0654XHAIM+XI8AqMj2YEpdZ2Is+vS8hxDGRilzZAYtQRoxclqkvyt/nGzkDt8d4tcomwEDAzOqPgsUXtG9fbjATtBhjIWZlzLDybEPjtGlRM0k9yn8LidyXuerwz1bwtMnww/MiS6sO6SFRCLbVhWKl2XSaMTnei6u655wVANBvPtpNQmRWoXygsQmLZh+TwRsV9cbXiShQ+ONFn6dCxV9juih1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199018)(316002)(54906003)(110136005)(36756003)(8676002)(6486002)(31696002)(478600001)(66556008)(66476007)(66946007)(8936002)(2906002)(41300700001)(86362001)(4326008)(5660300002)(6512007)(38100700002)(45080400002)(6506007)(186003)(83380400001)(2616005)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFBclhGWHhBaCtwQ3FLUzVmcFNZTTJHNFBTYXAram1lZU1ZMkNoTmNub1FM?=
 =?utf-8?B?d0dzMmd4SzBFU1lsQTdGSkdqRlVmTHhVTHBMQXRmQ3EyQ3RrR1c1c2pXR1FT?=
 =?utf-8?B?MDFEYzIycGNWOUZxbEpucWZZM1pQcytDbCtyYlYzVUpiK0pxQXJtNlprYmxC?=
 =?utf-8?B?T1RQenNCVlVISU85TklKSWRQUkhIdExUUFZEMVdueEpLbXdHN1dnekhtbEgx?=
 =?utf-8?B?Z1FGZlJYb0VEbHJSOFBGUWcrN2xGaDkxM2c0aEtmNG1VOGMwOTJXS2x4eGxG?=
 =?utf-8?B?ZXBvSjA1WlM4enBva3U1Q2VkL3dWT25wSDhvUjlXMnQxMTRETS84Nzh0bmVo?=
 =?utf-8?B?UFRrb1JTMzFYTGJOMW1pSU9hOEpRVkx5eGhSeXBQdnIrWis4YXpJZUpvSjVH?=
 =?utf-8?B?VGtCOFdnQ2NqM2pkOTU0bldVVnN6NmNRSklYR1lIb25mcXNSWHV4c3ErNXB0?=
 =?utf-8?B?bXFRWEprUDVRT085bEFnR2R0TUwyRzZjeW1UQ3dwczc2Ym9EdUhqbkkxYWYz?=
 =?utf-8?B?OTF1TldEMlpSTC9JM25BSDE5d2VUUy9MZlNMTnoyTGpEeG1JZTRqRGxUd1NG?=
 =?utf-8?B?U3JlZEsrS09NWmFUOFc1RXlRK0JONUtDbU01YlV5aTJZRmtMQkF6eDI3WGlJ?=
 =?utf-8?B?ajVyVG5ZWFlrRkdOYVpadmNQUWNJd1RKU2p3YlFhQzNhMzVEU1BTdDZDaTV1?=
 =?utf-8?B?SlZVUytmcUpqN28xYkNub1NlQkZyK3FMcVlndGcwd2MxVGNRZURMV1FVUTZ1?=
 =?utf-8?B?RVNkemcweHU0aVFCQ0VuUnJjQU5tdU55M1lrK1pwVzRNcFRsOHIzNU5rVFFB?=
 =?utf-8?B?S2NwaUtrSVhQYTVuM0V6TnN6Mk5rSGU1aVJYc3VhUnZudDNnWm16TjZWU2l3?=
 =?utf-8?B?YkxURklpWHQrT2Y1aDMzc1BWenJpbDJ6dFhrcU5lSjZ5WFhoOCs4eFcrN2p1?=
 =?utf-8?B?WmpXRUM5WTNnOXF6a0lKVHZ5RXlKZHEydU5nOTlTaW9Ybys4MzhlQ3NlYUpK?=
 =?utf-8?B?dFFtTHBzVkthZC9rN1VoUlVFaGZkUWxyTGNFR0huMGRDT1Rkc09CSW5udFpY?=
 =?utf-8?B?MEs3bkRVcmJtcm9uTCs4OWFLUlMwQ1hNWlJ2eENldktXMldad29GTnZhbjNk?=
 =?utf-8?B?YWQ1Q1M5aUVJR3NUN1dLb0xKMFE5VkhTMTZCc0t3VTl2d1BpSSs4RWwyblA0?=
 =?utf-8?B?b29UZnNlelk5eUh4eWxxOWg2NWNCeTNvcVFHTGxqc2ovakZQcXhGM0FNam85?=
 =?utf-8?B?VmJWbFg3M3dFMSsxZE1kUWl2Zjk3VEFjbkVhRTZ1b2t0TUJIdU1HTHE1V3Ny?=
 =?utf-8?B?NDkxbEozakpqR3Q5S1NnV0Y5YlNCTndOVEltb3ByVjZEMkVnbGl5bEloNGZa?=
 =?utf-8?B?b0xINnFSc0xWQjM3S0VmV21rWkxXSjg0V3ZTcW9QSVhKTHN6eit2Ni8yRFA3?=
 =?utf-8?B?T2x3dDg2bXJkcHF4UnRxditTS1VqZk04TFpPVXZuOC9HUzMwTCtZR2NsQXlM?=
 =?utf-8?B?Uk9RLzFqaWdSL3RvZ09HZFVJWXI5cStGWHNSa1RhV3lKU3Q3c1F6cmlJQ1lx?=
 =?utf-8?B?KzF5M0FDWDZMNDJid3ZjREM2a0g1bXRKV29vVkg0emxkaTBjKy93Nk84bDlP?=
 =?utf-8?B?Q1dqUVNSR2d3ZnZybTBpMGdCeGx2b2JRTDhhQ2U1K1llR1RaNk54M09sMFRF?=
 =?utf-8?B?RitVRDVjMWtxeDBmQXNwUEhpSlA0TnN4ZDBZUFd2RVRIQktvRXhkcnMxQWVo?=
 =?utf-8?B?TW5UYzFDOFBrWDZxWjJrUDBPeUZuUlJsZjE2MTlRR3l0Qk1jckV6b0NSZ3pq?=
 =?utf-8?B?NEFDb3NCelRWM1NKUUJ4alZyQWhZWUtVNW94Y2tHbWFZNkVoR3BMN2FYaFRM?=
 =?utf-8?B?bkhCU1l4OVVwalFEK0hObk14RElTaTNkUGJWV1dHUjI4czlHL29zK2l1MEx6?=
 =?utf-8?B?MFdnY2o2d092QkhnU1ArckxNamI1TzFFVEdrWW5NSWZ6UGNGS0lnUlBZLzdU?=
 =?utf-8?B?VDRYUXFZZE1sNmw2cTdEeDEvc3dwd2pOdTM5d0RPaVRIZVZGQnF1ZWRTcHBH?=
 =?utf-8?B?d2E3S2dxNGZZZHpwSE1sVnczbVFmQ3o1dEJhRlFlZ08xREw2dm1oVGh5cmEx?=
 =?utf-8?B?ZjBDYU92aDZ0K1ZmU0paLzcvUzQ0OTgwTGVONnJ0WmRGWVRvNVZ2VUJkRkU3?=
 =?utf-8?Q?EC5yrHCowyagQmWNNGWlZ1JmSnulsVGHr9xjaXqdiG7v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee38db3-c278-4092-6ba6-08db25829fc9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 18:25:16.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffVYJDXsdmOVKBBiSeV5eGXbePb9PnGsuZIiERXWZXtElVGxcqznSkNzrCh61O6B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5134
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
Cc: amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.23 um 18:54 schrieb Steven Rostedt:
> On Wed, 15 Mar 2023 11:57:12 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> The WARN_ON triggered:
>>
>> [   21.481449] mpls_gso: MPLS GSO support
>> [   21.488795] IPI shorthand broadcast: enabled
>> [   21.488873] ------------[ cut here ]------------
>> [   21.490101] ------------[ cut here ]------------
>>
>> [   21.491693] WARNING: CPU: 1 PID: 38 at drivers/gpu/drm/ttm/ttm_bo.c:332 ttm_bo_release+0x2ac/0x2fc  <<<---- Line of the added WARN_ON()
>>
>> [   21.492940] refcount_t: underflow; use-after-free.
>> [   21.492965] WARNING: CPU: 0 PID: 84 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
>> [   21.496116] Modules linked in:
>> [   21.497197] Modules linked in:

The problem here is that two backtraces mix together. So it's pretty 
hard to figure out what's going on.


>> [   21.500105] CPU: 1 PID: 38 Comm: kworker/1:1 Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
>> [   21.500789] CPU: 0 PID: 84 Comm: kworker/0:1H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
>> [   21.501882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>> [   21.503533] sched_clock: Marking stable (20788024762, 714243692)->(22140778105, -638509651)
>> [   21.504080] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>> [   21.504089] Workqueue: ttm ttm_bo_delayed_delete
>> [   21.507196] Workqueue: events drm_fb_helper_damage_work
>> [   21.509235]
>> [   21.510291] registered taskstats version 1
>> [   21.510302] Running ring buffer tests...
>> [   21.511792]
>> [   21.513870] EIP: refcount_warn_saturate+0xb6/0xfc
>> [   21.515261] EIP: ttm_bo_release+0x2ac/0x2fc
>> [   21.516566] Code: 68 00 27 0c d8 e8 36 3b aa ff 0f 0b 58 c9 c3 90 80 3d 41 c2 37 d8 00 75 8a c6 05 41 c2 37 d8 01 68 2c 27 0c d8 e8 16 3b aa ff <0f> 0b 59 c9 c3 80 3d 3f c2 37 d8 00 0f 85 67 ff ff ff c6 05 3f c2
>> [   21.516998] Code: ff 8d b4 26 00 00 00 00 66 90 0f 0b 8b 43 10 85 c0 0f 84 a1 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 9c fd ff ff 8d 76 00 <0f> 0b e9 92 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
>> [   21.517905] EAX: 00000026 EBX: c129d150 ECX: 00000040 EDX: 00000002
>> [   21.518987] EAX: d78c8550 EBX: c129d134 ECX: c129d134 EDX: 00000001
>> [   21.519337] ESI: c129d0bc EDI: f6f91200 EBP: c2b8bf18 ESP: c2b8bf14
>> [   21.520617] ESI: c129d000 EDI: c126a7a0 EBP: c1839c24 ESP: c1839bec
>> [   21.521546] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [   21.526154] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [   21.526162] CR0: 80050033 CR2: 00000000 CR3: 18506000 CR4: 00150ef0
>> [   21.526166] Call Trace:
>> [   21.526189]  ? ww_mutex_unlock+0x3a/0x94
>> [   21.530300] CR0: 80050033 CR2: ff9ff000 CR3: 18506000 CR4: 00150ef0
>> [   21.531722]  ? ttm_bo_cleanup_refs+0xc4/0x1e0
>> [   21.533114] Call Trace:
>> [   21.534516]  ttm_mem_evict_first+0x3d3/0x568
>> [   21.535901]  ttm_bo_delayed_delete+0x9c/0xa4
>> [   21.537391]  ? kfree+0x6b/0xdc
>> [   21.538901]  process_one_work+0x21a/0x484
>> [   21.540279]  ? ttm_range_man_alloc+0xe0/0xec
>> [   21.540854]  worker_thread+0x14a/0x39c
>> [   21.541714]  ? ttm_range_man_fini_nocheck+0xe8/0xe8
>> [   21.543332]  kthread+0xea/0x10c
> So I triggered it again, and the same backtrace is there.
>
>> [   21.544301]  ttm_bo_mem_space+0x1d0/0x1e4
> It looks like the object is being reserved before it's fully removed. And
> it's somewhere in this tty_bo_mem_space() (which comes from the
> qxl_bo_create()).
>
> I don't know this code at all, nor do I have any idea of what it's trying
> to do. All I know is that this is triggering often (not always), and it has
> to do with some race.
>
> Now my config has lots of debugging enabled, which slows down the system
> quite a bit. This also happens to open up race windows. Just because your
> testing doesn't trigger it, doesn't mean that the race doesn't exist. It's
> just likely to be very hard to hit.
>
>> [   21.544942]  ? process_one_work+0x484/0x484
>> [   21.545887]  ttm_bo_validate+0xc5/0x19c
>> [   21.546986]  ? kthread_complete_and_exit+0x1c/0x1c
>> [   21.547680]  ttm_bo_init_reserved+0x15e/0x1fc
>> [   21.548716]  ret_from_fork+0x1c/0x28
>> [   21.549650]  qxl_bo_create+0x145/0x20c
> Here's the latest backtrace:
>
> [  170.817449] ------------[ cut here ]------------
> [  170.817455] ------------[ cut here ]------------
> [  170.818210] refcount_t: underflow; use-after-free.
> [  170.818228] WARNING: CPU: 0 PID: 267 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
> [  170.819352] WARNING: CPU: 3 PID: 2382 at drivers/gpu/drm/ttm/ttm_bo.c:332 ttm_bo_release+0x278/0x2c8
> [  170.820124] Modules linked in:
> [  170.822127] Modules linked in:
> [  170.823829]
> [  170.823832] CPU: 0 PID: 267 Comm: kworker/0:10H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #998
> [  170.824610]
> [  170.825121] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [  170.825124] Workqueue: ttm ttm_bo_delayed_delete
> [  170.825498] CPU: 3 PID: 2382 Comm: kworker/3:3 Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #998
> [  170.826996]
> [  170.827367] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [  170.828839] EIP: refcount_warn_saturate+0xb6/0xfc
> [  170.829842] Workqueue: events drm_fb_helper_damage_work
> [  170.831325] Code: 68 50 ab ef d3 e8 76 ce b2 ff 0f 0b 58 c9 c3 90 80 3d 4e e0 18 d4 00 75 8a c6 05 4e e0 18 d4 01 68 7c ab ef d3 e8 56 ce b2 ff <0f> 0b 59 c9 c3 80 3d 4c e0 18 d4 00 0f 85 67 ff ff ff c6 05 4c e0
> [  170.831670]
> [  170.833138] EAX: 00000026 EBX: c2aa6ef4 ECX: 00000002 EDX: 80000002
> [  170.834080] EIP: ttm_bo_release+0x278/0x2c8
> [  170.834910] ESI: c27744e0 EDI: f758eaa8 EBP: c3083f34 ESP: c3083f30
> [  170.838453] Code: 00 90 89 f8 e9 91 fe ff ff 90 0f 0b 8b 43 10 85 c0 0f 84 d5 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 d0 fd ff ff 8d 76 00 <0f> 0b e9 c6 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
> [  170.838714] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> [  170.839872] EAX: d3835cf0 EBX: c2aa6ed8 ECX: c2aa6ed8 EDX: 00000001
> [  170.840546] CR0: 80050033 CR2: 005ce01c CR3: 03afa000 CR4: 00150ef0
> [  170.841669] ESI: c2aa6e00 EDI: c11333d8 EBP: c3b15ca0 ESP: c3b15c68
> [  170.844583] Call Trace:
> [  170.845738] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> [  170.846732]  ttm_bo_delayed_delete+0x7c/0x84
> [  170.847766] CR0: 80050033 CR2: 005b59b1 CR3: 03b12000 CR4: 00150ef0
> [  170.848761]  process_one_work+0x18a/0x350
> [  170.849177] Call Trace:
> [  170.850250]  worker_thread+0x136/0x378
> [  170.850942]  ? ttm_resource_free+0x57/0x6c
> [  170.851928]  ? _raw_spin_unlock_irqrestore+0x25/0x40
> [  170.852583]  ? ttm_bo_cleanup_memtype_use+0x5f/0x64
> [  170.853002]  kthread+0xda/0xfc
> [  170.853608]  ? ttm_bo_cleanup_refs+0xbb/0x1c8
> [  170.854266]  ? rescuer_thread+0x340/0x340
> [  170.855058]  ttm_mem_evict_first+0x324/0x3a0
> [  170.855840]  ? kthread_complete_and_exit+0x1c/0x1c
> [  170.856341]  ttm_bo_mem_space+0x1d8/0x1ec
> [  170.857056]  ret_from_fork+0x1c/0x28
> [  170.857702]  ttm_bo_validate+0xb3/0x13c
> [  170.858393] ---[ end trace 0000000000000000 ]---
> [  170.859167]  ttm_bo_init_reserved+0x12e/0x1cc
> [  170.863261] systemd[1]: Starting Create System Users...
> [  170.863964]  qxl_bo_create+0x14a/0x1f8
> [  170.892037]  ? qxl_ttm_debugfs_init+0x48/0x48
> [  170.892043]  qxl_alloc_bo_reserved+0x39/0x98
>           Starting ESC[0;1;39mCreat[  170.892047]  ? kmalloc_trace+0x22/0x84
> e System UsersESC[0m...
> [  170.895826]  qxl_image_alloc_objects+0x91/0xfc
> [  170.897122]  qxl_draw_dirty_fb+0x159/0x440
> [  170.898207] systemd[1]: Finished Set the console keyboard layout.
> [  170.898329]  qxl_framebuffer_surface_dirty+0xfb/0x1cc
> [  170.901528]  ? qxl_create_plane+0xc4/0xc4
> [  170.901533]  drm_fbdev_fb_dirty+0x129/0x1ac
> [ESC[0;32m  OK  ESC[0m] Finished ESC[0[  170.901537]  drm_fb_helper_damage_work+0x8f/0x158
> ;1;39mSet the console keyboard layoutESC[0m.
> [  170.905435]  process_one_work+0x18a/0x350
> [  170.906578]  worker_thread+0x136/0x378
> [  170.906832] systemd[1]: Finished Load/Save Random Seed.
> [  170.907195]  ? _raw_spin_unlock_irqrestore+0x25/0x40
> [  170.910267]  kthread+0xda/0xfc
> [  170.910271]  ? rescuer_thread+0x340/0x340
> [  170.910275]  ? kthread_complete_and_exit+0x1c/0x1c
> [  170.910278]  ret_from_fork+0x1c/0x28
> [  170.910282] ---[ end trace 0000000000000000 ]---

That looks like an eviction is racing with finishing this BO. Let me 
take a closer look.

It would help if you replace the WARN_ON(bo->delayed_delete.func) with 
an "if (WARN_ON(bo->delayed_delete.func)) return;" and disable the 
refcount warning.

This way we should not get other warnings except for the one we are 
looking for.

Regards,
Christian.


>
> -- Steve

