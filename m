Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E78526024
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D0710E743;
	Fri, 13 May 2022 10:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DE210E743
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 10:42:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1qjM1Vr2lvFMc5F2Qh6f2/pEqgXBgCodn+tN0rLvdg3u63DqYl8kkBRpeh7mSlPm2GfWMl8yQLkcxEA9f3tRVqirZ9X6+BEEccGDzIB/e2IcRj8Q/0mAItoYOuFmEoaapZ8+T+1sjXgl8PRmAGDn5P9iR51R2Uz5zjoqQUk16JztyS4CRIBFVBK3yJWwuIfiE2Si1vUQiPTgcKDFGJeyEaxhgY1B7WhZyVk6JHNhEN6c32Jup+zhO9/k5PczYNrgMZBQaKRpnuMb5poF6YvqazJfJjdCVGQi/f6oIl5Th2rbcGuxkRgfbQP48ZEz6fV5/XcZ4ogdwMbymN1GavhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W650cH49CSygHgTeS2WzM8OJXujGk0QvkyK3pduOLFs=;
 b=JO68NhoZtCfG2o7Nabd8NziomXoCZ5oxI7VStsJgDlkzkwjkBD39AvqWVep+m4vtONH8ixUI0eSOcEsZez6gJAyQFRL+D9HNUrMfns7AWOYQHnw4AG0nwNWEwf3fPruxgcEYIzuDe4mxclagg824Y6zcDv00EyAiVYsPXQnvuB47T9Xz/YNqJrzKivX/sWAEqFuRqCtj2rZsDzFEC4Mr57qBX1p8ErXnCQY2kzfu1XP6aAwrIvm7EIRsBaNg0aoNJFZ3WlExjys+Khbr2lkYJTK6n36w+gZCogOKkF6kRnXE6dhHgIyNXvyvdNaJLOlbclGXpqhpYZlJyhjhJE7h1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W650cH49CSygHgTeS2WzM8OJXujGk0QvkyK3pduOLFs=;
 b=chvSVGZGU/wh0zdubD/481GB4uTvOmOoGC7kUmwv9oYpo9Dzb4w/I4edUG7UXkjKpyHtFVlEDMdYLgfVpzuY6YkK5917JV10OcEfG2KdnJSd2l4y+bJ1RnRS9uIN47Q9pjub0bk+BQMg/yyfiHFu0QGPeJxI1OnCPyh/3avdV6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 10:42:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:42:07 +0000
Message-ID: <4947c9e9-ec52-c6be-9f81-e341ddac4e54@amd.com>
Date: Fri, 13 May 2022 12:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
 <Yn4u0AG8iC33S3jO@kroah.com>
 <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
 <0071e117-1d91-b086-7cb1-976b2a1c3498@amd.com>
 <f5988884-ba0a-643c-e920-6ae626bb67a1@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5988884-ba0a-643c-e920-6ae626bb67a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0774.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6569a305-f697-48e3-bc89-08da34cd39ed
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43203BC7EFDE51A92192AB2D83CA9@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58MMRLOWSmy/7y1h58p922dfml0SdYebGICEZlL2lruxPl+4KPMzljWlwCzEeF8ZbXsmaJch3SC67vK0lhb3ZZTsqeNpRIrZoDad6MBquYUGw2Lxh3dO1q1C9qxD6qtYXms8OrCuUN+rNJaMU8GinOoWRTIYamKcBG81qhKGlkbPZDzcRnMzZLLFkNSrxnEmXKCU5Sou6mHx2mDBIjBp0x2i8rkiOKDY85Q6wEPrvFwRu4Qrs5R3PeC6fmEe7IwZVDm7aoW5hzANHzGin1hZ9Q90fa9VMQgQhEfqYLQtBF09JiCYR48FhG3A6mlMt+SnKIYAXD0TjBDOwX4rrYNVj4gO5YFdqz5xgTcsfn3taeNxyGOFCt72pclVbQ0evdvH0FBFs3V+KkWNNH2saVeIN9k6UQJ52acclLQPMCBmyNOOvYw55IZ83/hZZQP8sSLRu8PspwT1PjmDtKGqIU8LzdXD4Gpp4Fcnjmfp0ujpr87zdzAGNjyX5G6mVTsPeSzQYXcpjEbPlli3yqUJOKky5DIWwid7T2ZzcjMkQXJUuXXdi4/qtV/ypfTyPvbVc4IXZnGLSdSsXtqbyBzUr3V23zn/Ql/DSmGhYFvjlzK+NAlN2TNiwaqp6M5WtB1A5c04pM0BAvuAd3Wes0MfAloHRSQqVMVinfXUdtFXjlc6sKU/8fn9Kp+VyFVz4xKvJYCgESzQuBZQ1nqWXc9H/YdNIxgay1bp1fTn9N+BXameEDIk4IGtxSz8OWdKAVwRsK4c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(86362001)(66946007)(4326008)(8676002)(8936002)(31696002)(110136005)(38100700002)(316002)(36756003)(6666004)(53546011)(2906002)(6506007)(2616005)(66574015)(186003)(6512007)(83380400001)(5660300002)(6486002)(508600001)(7416002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJpejFVYmZSSlYvUDBEM3lnQU50TjErYzc3S1kwNmViSUVFcHlUWVRqT09L?=
 =?utf-8?B?ZnJocjJLNHc5WDhTb1A2UUVhZmhKK00yaVVMb2w1VkFQV2x6Um16ZERqR0p3?=
 =?utf-8?B?cnh6ZWlkSWRObnVPS01jTHNVRlhycGp2djhvelpRZU40NG1sQ1QzelJmbE9h?=
 =?utf-8?B?SnZxMkZwcDE3dnFDck1TejJGaHFlRGM3dmhQZ052dDcwODRZN2psa0tTU2Jy?=
 =?utf-8?B?Z2RhQXgwb0VNdm9YS0E0eE1FaHZqaHFxaC93NE1tSjMvemlwdkd2ak9RbWZn?=
 =?utf-8?B?SHd4emlyaTdhMFg1NEVJSDUzWW1nQ3pVeW51T0RSQWtHNkxSb3FtRGdUTlJL?=
 =?utf-8?B?SXZmQ1FhWFdHWkgrc0hRR3plT1FhS2JsWkRPaVNtYjMxd0dabSs5Q0VmZ1BO?=
 =?utf-8?B?YVFZYVA4UFJsckc3WFZTZTk4V0FDUzJ4VEYrMFNZa1hycnZnRWh3UVNZMUZ0?=
 =?utf-8?B?WGNjbnFKSHRiS2g3bXgwS2hkQURCZStTVkdVdnk2L1Vvd2VaVGsyL0ZTSzRW?=
 =?utf-8?B?cjg5eVl1aFVtaHArb251Nm9ldzNUYU9oSFRYYmhjTlQvRjFPa1IyNXdPWUFp?=
 =?utf-8?B?bDMwOUQwbWNBYUMrdEZVTThEcHdiS2VQQUEyMlNIQmo1M2l1Q1o4VGZOM3hV?=
 =?utf-8?B?akREcGVacmxwZnMrMVJPcEdxblZGRTM1MmUrbVdnZlp2L2t5Umhvc005WWdl?=
 =?utf-8?B?RkpIcFRmMGlHV0pva1lCRHordUloZ2FrTU5pei9NbjhwNlloSTM5UEtxOXZt?=
 =?utf-8?B?ZmQ1dkI3WE9GQUFKRWF5SGlRSU8yRzl4bUk1c2xOVHlsY1FYSnZDaEdrOERG?=
 =?utf-8?B?L3dHZThKZmk3M3FQT3gyMmIzU1o4YXNHNGlack9EWGVoNVlmNEg5eFVEUjJr?=
 =?utf-8?B?VndEandvRG54VWtKWHZaYlVDNU90N3Jidjh2V1BITmtTc0dwclZFek04bWJG?=
 =?utf-8?B?alZGZEhwTy95U0NxdmEwVzFFN3VBWFo0TEtoS3UrNDlxczhHdGlrZjMxVTVl?=
 =?utf-8?B?MnRscUR6RUl3ZGxWem1KaG56NUdEemVNN3VocHpUaXZiODBRNUJnMUx4NVV4?=
 =?utf-8?B?dTdVZDJFaEdwa2dnT3lQL0pMeFVkS1BPdDhMWTVDVDR4RHoxc3ZPUUxmUTlv?=
 =?utf-8?B?WHpQaldWMzgwck9OWG1jdkMwLzNlZkpjUTNtanBLVGlMY0czdTFmdk0yaC9s?=
 =?utf-8?B?TW5paWhWTVNPWjFjMGtWbW9kZGZrekJsTU5BTVY2aWpVRUZXY2dmZGtIa0t0?=
 =?utf-8?B?akFpdWJ3WjgxaGIwWE5iL1AzMDlGaHQxY0F3WWdmVmRKZ0tSWklGRm1TcENa?=
 =?utf-8?B?NU9vTTExeTJHWGZzOERuS3dBeTFpY3NlYjF2MXJTbHBJVThmQUZwWU41WXhO?=
 =?utf-8?B?MmV3Njd1QnROWVV5U09sWHFLbklrNlB0NVhOWWJmczhYRGFSSFFzQjlUM0VC?=
 =?utf-8?B?dHJndUdtdVY5c0JFK2cwdDl4QVNYVmM4NEFmMENxb25EQU14b1kzSGp1NlNS?=
 =?utf-8?B?LzVNalFpcmYxMVRuejJpZjVGaGpXM1BIaDlPNUdLR1dHR29mWEN3Uzg1SnBY?=
 =?utf-8?B?Z1lYL0VQUngrTnlqWmdqRUtkLzM0aXBaSWt1aEw4UlVWdDNsQmlTdThsN0JV?=
 =?utf-8?B?K1E4bkYyZVYxU0NrVkZQdjNPdzcySTQxT1RQdUo3eXh5ZVNEeHUwV2dydVB4?=
 =?utf-8?B?Rk5aVXlMaHRQc3phL3VIYTlBem5kWTRjeXhleTB1NFNPMzR4R3J6aStvQmlM?=
 =?utf-8?B?T3B4T3hHZ1VYQTNKNmxHT3Q4WGhzaGJSNStjWnUzbW81SVByb0NKN1piRTha?=
 =?utf-8?B?TmdxQ2ttb1IwdWxhenNlQWM3SGlwbXpVRDhaKzZDRGtQZWJzZ2o2ZkdnMG5z?=
 =?utf-8?B?blduTE5DQldndVNZZHVQQ1ppR3dtUkM2TlpjTFQ4bEd2bC9Ra3VvU04zcVVa?=
 =?utf-8?B?T0Nsc01yd0FhRE92djlIWmhnVmZ3Si9MRzExTE1EMWdSZG1LVWJqcW5QVGhM?=
 =?utf-8?B?SXp1K25EamczV0hVMWQwWUJYTFBUeWhSOHR4L0JmdE5Cd3BJRy92WTMwMkhE?=
 =?utf-8?B?S0J4MVkvQTBic3RzT3JJcVFlY0VOdkJIOTBVeFdHTzdpTGUzTjM4b0lyeG5S?=
 =?utf-8?B?TUxzMkpiUGJsNmRPN1I4Ui9Qc29YeVhUblVycS9ORkdvWW52bFFHeVozUzAz?=
 =?utf-8?B?V24xSW5vK2xOQ3R5alF6RnEyeUVBN09KUEJJejlIdUlsd0swWGFZVFE3QlhQ?=
 =?utf-8?B?K3pCdVlvaXFtS2J4L0NEc015NTVQN1N3SlhtQ1RrSXo3V1VaRXJrK3E3T2t4?=
 =?utf-8?B?UFRsN2l0b1lBTzY0SW1LbXRPWW9yZWY2SFlIUW13Q3h5STU1a090RVQ1NXdz?=
 =?utf-8?Q?Zu36Mv4wkaYCn5aH6BcZe71f6PmuSINm4TpPx/iEImujC?=
X-MS-Exchange-AntiSpam-MessageData-1: kiJX5s3c5jokzg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6569a305-f697-48e3-bc89-08da34cd39ed
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:42:07.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0TXpPI8KrapUGKRXGxFE/x1VmyZ4SXowZY/qwFOFjeHBV8lpnDwsJidBy4vJ6md
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, hridya@google.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 13.05.22 um 12:38 schrieb Charan Teja Kalla:
> On 5/13/2022 3:59 PM, Christian König wrote:
>> Am 13.05.22 um 12:18 schrieb Charan Teja Kalla:
>>> On 5/13/2022 3:41 PM, Greg KH wrote:
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> The trest robot did not say that the dmabuf stat name was being
>>>> duplicated, did it?
>>>>
>>> It reported a printk warning on V2[1]. Should we remove this on V3?
>> We only add the kernel test robot is report when it found the underlying
>> problem and not just noted some warning on an intermediate patch version.
> Noted. Thanks!!
>>> @Christian: Could you please drop this tag while merging?
>> Sure, I don't have much on my plate at the moment. But don't let it
>> become a habit.
>>
> Sure. I am also thinking If it is worth to add stable tag? Though it is
> not crashing the kernel but definitely making the dma_buf_export to fail
> for no reason.
>
> If yes, I can resend the patch with all these tags.

Yeah, sure.

Christian.

>
>> Going to push it upstream through drm-misc-fixes now.

