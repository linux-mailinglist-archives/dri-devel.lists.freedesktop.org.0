Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C371671898
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E1810E62A;
	Wed, 18 Jan 2023 10:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CA510E628;
 Wed, 18 Jan 2023 10:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdarIn1Tc2Yl+VBQ/2Zz+hJpHWjbBB8JhPKF5mWhoFcwfO3+nW+IJr8F3wERndG9pTQCBAsjJq9oD3EaTwnqPhzr2e+Ta6l1EBpxd+E4W2oa6AISYmnNtSaOJGVbCD5Z3/9vizms5RAla19BxZetPEndpuA7GNoLRmGcz/xzw/4p0AMPFme287mUkV5XkLxW73MnOxRE5hoKJacFRxOcQUVhSckOK0uH0UXGcSnm4rzwEOkFp6L19QdMsABMoFXu/zLOCqKFyLQhiYwY4ThdEYLzzaOfUU0TXFO1oTgHGX5gxOM+sERoEHOHDpcI63DkHwpsyb945eFeQiQIKUfTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncpoGB7SRnhmbYIJcI6Lma4xTbJE+QAv6KkXoFHoArM=;
 b=MN6hKwShRquwTQpn5CFszyP8hUbq0d8A4dtcwU0gnjGXOe0DLd/kkvSPaN/x10lg1kGSfmFLkGfWv2DEi1OFKKdqhslHUYaB0U+L3goMOaIHt/QXab9DvRy448Si2/+dP92Ib8r6Ut7OXuCgROn91vNdmzoM4a2dkiX7M/tN4AXvHeh2VuKMMDbR4Ie2fJP8Yns88+Ba0qBVQmPeyOpzwaRRwqRv9WGZqaaY1CYhv3xPl7OYPY2PGN3O9FqqsHg188xnFyqCl33PD4Xdf0MeJnAJgl92ht03o9KtOR9PYIuvJKlAXTnWOuZBMol7+cEC5cFMHint0udcXspmObzDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncpoGB7SRnhmbYIJcI6Lma4xTbJE+QAv6KkXoFHoArM=;
 b=3aL/hOaiC41nBZ9mvEckAKFecEE11NFGZNHcpjrXyGV8WDIpM4SsVlAZLs0bltq0fXd3DZIJjDuoRlq3T11cSWu0Zj5RW6/auGxekExZuVFJWk2rc6vd9do1UerfKMZKIMuC49j9yi6e1vUv6IQsdM53anAJ5CvklRHvQgsGnBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 10:10:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 10:10:04 +0000
Message-ID: <eecef3ed-4307-3f0f-73c1-5102b67c9569@amd.com>
Date: Wed, 18 Jan 2023 11:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Ongoing failure for "dim rebuild-tip"
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
 <b5192a65-274c-4541-e162-cead3339decc@suse.de>
 <d431c824-bfc5-07e6-143b-ed33a3f68aea@amd.com>
In-Reply-To: <d431c824-bfc5-07e6-143b-ed33a3f68aea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f37ca8c-6327-4b88-d87b-08daf93c2b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFiessQkDItIr22ARWt5kDD6yHtaE4+48fWvxBxm5jaUnr3JgdNp+VHg+bzjxFDhSShl60ZqAdg+j9J/WGfzCj90KLRijOfyyvf8Zh0anmi+0u4j4wKXeG5hW1YmPIEvyxreRTkPatjHSqGlbIkEUMmCcCscFSJmR2MejCG1bc740PyungH+AP4Nu2RVdsSkX80J/9HKRTbnCb6YeGbmOCjhu+NicdG274pIR5AIcqnrAjfJU6U4rkq0ciqNTUzAemAt8mdJBAbE7xzaZXRX0HGALuLCuAK+09VaQ31+P5XnzjFOSotL4x2oG74IglyxV4phKZHqE9TbH2YZ5k3jp8UWFS4uvYTw9fuSBZ2t2dt9ZV8yAUev76W6VTjBDrCQaqT3UTDZA2IZmc9rJc7DV9ynLMyv6bUWTrSeT5dRgCPORM70L9cHajIhRLpqGQyohk0mirNQZBnK96FJjY2IPEu4eO4YGIbU2haGAJTBXl8xOd24Dkrqx4B0ClJbJD3EfKHyBAk1qXmYdNUDjqHiowDrU4++Q9771NbMGnjBlUwSJameZqKRvnRxmqHdrB8m550eSPrVsOtt8bBROab+xeijd+hiI5dCaE8Cppn6ovyuUrtJROqDqNhj6LHfWafzCW4FG13wxNDHEFCgXrYSmxiQHmnFO+jltkjlP6sHgmL3vWZEy3JY7r62sgTqceoDJKkIw6GSrpBGR4iuD5e5DA9cjbj6BPtP+0TBqaqjks4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(31686004)(36756003)(38100700002)(8676002)(86362001)(31696002)(2906002)(66556008)(66476007)(66946007)(5660300002)(8936002)(83380400001)(478600001)(316002)(6486002)(110136005)(6666004)(41300700001)(66574015)(2616005)(6512007)(186003)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE5wSWd0TmplaXJ5YWIyNkdpd2hrYlhkU0ZuTGtUTkhRazhMRmdQZkpvT1M0?=
 =?utf-8?B?TUxzWkFBYXBiOFV6SlA4MHkvaEZFTmYweGRQQU1HcGVpbzFmY0E1dXU0VlBG?=
 =?utf-8?B?NzAzdE5oRWM1azFBWXkvR3g3dy90aWJSRmV6UzZwcVZ6OXhCZEJqUzNFT1Ro?=
 =?utf-8?B?YmxaM0tnQzNsZW5OcUFQR1ZFR2NsTjdMeEpqK2w3bDducnJHTVJhWlM5a01Q?=
 =?utf-8?B?NGhMT21xQlA4Z21pYllxbFhScnNEOWY1bit1Zll4TFJ6OXI2Tmcvc3pNWms1?=
 =?utf-8?B?bHFXbWh4RXkveVlkblJtUzdXMXRkK1NkdVZEbXlRTlRDVEQ3eUVOQkxjUUpa?=
 =?utf-8?B?dm9uNWl2Q0FIRnBOSGZXdWhqVkFIYWNBLzhoYTg3QldiWk1IbjQ5RTFDSmdv?=
 =?utf-8?B?d2N4WUw3bFRmNjB2K0lsVmRnQ3krNTAvR0sxTUNkdmljM1A4ZEFiN3FKZFQ1?=
 =?utf-8?B?WE05MXU4UmZCWU94NEpNYmxRYWR6RE94RnZqUE5jNmx4anRyY2VMb2hMK2oz?=
 =?utf-8?B?Y21uZEJoODR2TlB1Q1lOdGJoclZSYnRsWHZoYWJYRnlrcGMxK1plYkM3d1Zh?=
 =?utf-8?B?cW1iSTJRVHk3RzNyb1V1WDgyeHlWSURZUU9sQ2tBQ3FaMWZ0NmwzK29Jbks5?=
 =?utf-8?B?S3N0WGFRTU9GVzhTVFcyM0x2UDk0TjZiMEhkRENHaGQyQmdRdTl4QzJ1dkNK?=
 =?utf-8?B?MEhiREd5Y0QrSU5aMkR5a1I1MXA0dEJpY3FnZTZ4YVVJMEhHZWE3V3phNzdt?=
 =?utf-8?B?M2pJa2cyb2U1RzcrTnFVUzJhK2hydTlRbVMyOExaMFVwOWFvdnF2Y0o0TW82?=
 =?utf-8?B?dTZEL1MvaWZhbzlhb1U1Y2piQnFMWjIwa2tlWGVNV3NtMTY3TnNTeFc1S0di?=
 =?utf-8?B?ZmFVeSswbDNGa0RORUVFZDJkYm9SSURlK3BkeG5vaGZndHFFblFXelA5T3dq?=
 =?utf-8?B?UjhCcHN1c1RhYVNBUFVBVlZVU1k4TnRheDhyeWpDbDJQSVFIUkkzMEc0VnRZ?=
 =?utf-8?B?bzM2SmUwM3l4K0duYzJXaDJzVTdvZGEwK2NnU0JWbFNyeldlYW5oeTJRakl3?=
 =?utf-8?B?cnhBMnZYSUptZ2hjZEhsSzMvaU1NTnl6TnlxSVlLeHJzekdWN1lpOTRjMGZF?=
 =?utf-8?B?cW9aMnc5c0dXbmtHeWdUeHExUHlJK2EyNFZheWpOS091ZnNFckhQZHFLNHBq?=
 =?utf-8?B?bGVLOGd1OXp4WUNhTzZjTTRQU3ozSXIyOHh2NFpYaUdxZzJPSVc2UHB1bjU0?=
 =?utf-8?B?RWVRL0YvR3ZEaVQvd0ovVzEvcUIzdHc5a1V6UlZ5aTl2VnVVNXlFdDlyU3No?=
 =?utf-8?B?OW8xbGtHT1RjMnJzZFRWVkFqcTBWUEpNdGlPenVneTBRTjRnNUpaaStXY2pU?=
 =?utf-8?B?OGt2NkxtNXYvUE51c1JhcmxtVTJwMFoxYmVsQ01lTU9lR2I1d3JKLzlQRE1C?=
 =?utf-8?B?VGlVSGd1T1NhU2VtUmVLQ1haanZ4ZDJDQlhWYk4xdVNIT3NIS3BkaVBLRGg3?=
 =?utf-8?B?bFNlK3lROEYvMjB5OW9ubXN2QmVFOGdpSGtRSzllQmxsaVM1aTAwWE1sRkc1?=
 =?utf-8?B?MXZibHVrNTdrc1k2WWpRWnd5OHlWSE9WMVNtWE8yVE53QUxQOXRxS1VrUmNN?=
 =?utf-8?B?cjdyYU9xaEIzcUFNTk5Sb0RHS3I4ay9UV0hKQ09wT0tTVURYdDlKdWw2c05z?=
 =?utf-8?B?WGRFRWsxelVCZk9SWVVqLzMzL2NKUVp0Rkg1c253NURxaXAyazdpem13OU1D?=
 =?utf-8?B?SDNjMFNoTThBMElzYi9TT0NSUXZwYjdJYlhrY2RIUjBzL0tMcGkvTEtzNmNx?=
 =?utf-8?B?U3NOUmp3dmtVNm15NWcvWlFDVllCcU1uODhXbHNodG1UWXJXUU16V2oxK01F?=
 =?utf-8?B?U2liR0c4R2ZwL1ltcUpXY2d3STFFNTJzTmdqWVZLNldHeE9qR0ZDaExLYks2?=
 =?utf-8?B?RHZiMjY5NVNEL2VDaXZLUEVpQkJuODNBRU43ZzFNKzdsKzNqcXZnUjdhUTU3?=
 =?utf-8?B?RmFKcHhoNmZIR0hUUXlCdmt3bW4rRlJRRGlTRng4bWZkY1QwWlloZDN1a0o3?=
 =?utf-8?B?ZEdURzlGdjY1TExkSUkrMENteThTV0xST1UrL2N0eEllQzRTNnJtbGM5a3JY?=
 =?utf-8?B?YnhXZC96TXlWZXYxYjkvSEhQd3dpVDc0VkRtMjNlT052ZE1lK1h6TktzNkts?=
 =?utf-8?Q?v/QVhdL2Rp32hSN1L1zqM+ZX32uTARlwpJw/Kl6ZJoVE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f37ca8c-6327-4b88-d87b-08daf93c2b3b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 10:10:04.6605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXRbVYLDCm35/ax9g+XT6EGzb8kChEQqgNMPMBUgtO4BXddeYNUVLsGiC9LM4FpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

after analyzing this a bit more I think what happened that the patch 
"drm/i915: improve the catch-all evict to handle lock contention" came 
into drm-tip through both the drm-intel-gt-next and drm-intel-next tree.

It looks like this somehow worked for some people while it broke for me 
(and a few other systems I have access to).

What I've did now is to fix this up as best as I could and then used 
"dim rebuild-tip" to push the conflict resolution for this case.

Fingers crossed that I didn't messed it up.

Regards,
Christian.

Am 18.01.23 um 10:32 schrieb Christian König:
> Am 18.01.23 um 10:29 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 18.01.23 um 10:13 schrieb Christian König:
>>> Hi guys,
>>>
>>> for a couple of weeks now the command "dim rebuild-tip" fails for 
>>> me. The error message is:
>>>
>>> Merging drm-intel/drm-intel-gt-next... Applying manual fixup patch 
>>> for drm-tip merge... patching file 
>>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> dim:
>>> dim: FAILURE: Could not merge drm-intel/drm-intel-gt-next
>>> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
>>> dim: in the drm-tip.rst documentation for how to handle this situation.
>>>
>>> This also happens on a fresh clean install of dim, so I'm pretty 
>>> sure that this isn't a problem on my side.
>>>
>>> What can we do?
>>
>> Just blindly guessing:
>>
>> Are you sure you don't have any old fix-up patches somewhere?
>
> I don't think so.
>
>>
>> I've not seen this problem. But I've found a fix-up patch in my tree. 
>> Maybe the attachment fixes the problem for you? (goes into 
>> drm-rerere/fixups/).
>
> Yeah, I have that one under drm-rerere/fixups/ as well and it's the 
> only file there (except for .gitkeep).
>
> I will try a fresh install once more.
>
> Thanks,
> Christian.
>
>>
>> Best regards
>> Thomas
>>
>>>
>>> Thanks,
>>> Christian.
>>
>

