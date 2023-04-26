Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531C6EF7FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F29910E08B;
	Wed, 26 Apr 2023 15:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBCC10E08B;
 Wed, 26 Apr 2023 15:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGS+N85tPALxX0c17YbMb8XFHUItjsCTUPAOt1Skiog2G3Ow1bVKxnPi8WmDT5dtE3c1z6I/jOeKr4W9hOZmnCGoxi8prdBOXJAjCxwIMCh6n9VP832W3yguiDFpSIiLTzmnOID78Ci5ya68agXjKJcW+H8ZJX1EJAV+l9S8U11oBxTFP/FZsnucRfTiTouaOGAQsHkUguCvC9d1g4aiZciX0SOmZxgl7iZU4QBxm8ZzVGIfvm5vrzIIpRpi7LfPgkImB7QT8NwgvQxpYoz/sq7OUne0ZBsl6N+6P5Jo/9Qs3MGOuBJmtKBBiqS3OBq6A8NXg7MqM3uHjdKYxl8mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjxDWEEUlBcSlhV0ijNDIXUF80A5EMSxZSWEX5Ioi6Y=;
 b=DXXUu7CGCXdehK4MGK8FDnUYo95DV9DtgTkZpqcNEOkDBeFE3PcU9O7caGU2LPxJxseUWBvnSc17Ancg4yeaHDoMROrXjzl4Pmtr0vgtyrN9SdQcd7W/Um0NWnTXIpVz3T4zboX0WhthJGRxUxm+dIN2/LNQk73enFK2YqzhbKD+M6SUx4d0XRQWhQYPn/JfZ7OYHNs7g6DnLO2Hle7AzvpO9fqEfWiWJKE8HvCIUOzfQ0Y6nhUu8FHcweeaDHT3XFsnMtaAH6OHAEIcLinL+tVRgMXw/iAAdFlhf5VaPa8xZqadHtW54nR979JBEwWc7aNuViHCg95S+8ZMAEmwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjxDWEEUlBcSlhV0ijNDIXUF80A5EMSxZSWEX5Ioi6Y=;
 b=ZDe9g13DnrL7gW3qGoGjlzvCWy1Zw7bGN5aksGonjfJgZ5OhbIKDNWqwo0rU5hDF8Osd5zty3+ou9c3R6fDEUz2Zbh/PsutZ/BYtX/RsPKzf/mRj4qTo+O3u7OvJlakowRpPW81dH/gN55tAB6D+Xj1Wtp/sOlacwC3wPJALIRU=
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 15:52:10 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::e19e:fb58:51b2:447f]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::e19e:fb58:51b2:447f%5]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 15:52:09 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Wed, 26 Apr
 2023 11:48:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 11:48:57 +0000
Message-ID: <989d7a71-ebfc-d245-9e05-a5a46085234e@amd.com>
Date: Wed, 26 Apr 2023 13:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Keyword Review - Re: BUG: KASAN: null-ptr-deref in
 drm_sched_job_cleanup+0x96/0x290 [gpu_sched]
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
 <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
 <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
 <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
 <CABXGCsP+LSPE9fH4TW781w67ju=HrNMe9s0kigqBarketr_Qog@mail.gmail.com>
 <CABXGCsNSqJVv4Cerc3_P_59ioUZU2M7Z_TMp2yZKqe3si0QqyA@mail.gmail.com>
 <BL0PR12MB2465BE82A18038353E48E025F1659@BL0PR12MB2465.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <BL0PR12MB2465BE82A18038353E48E025F1659@BL0PR12MB2465.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7800:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff4191e-d52b-4b06-f95f-08db464c3794
X-Moderation-Data: 4/26/2023 3:52:08 PM
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpLglJKHIDCu5ojL+W0tTgrh3OlGYWB+x3TO2TXJRLHjJ+iZddeyjlmudJYFCXXK5+IwuKSOGt1uO7YABSxWqOIHYSItTte5EOue9RWJ0FVfqGjQ7cun4ImVATXUf80HJ3W9dCxvP0qutZJvNoiFrg/zN19vDyAfpRWkAMh9lToHvaZ4F1ZGQo3mztAYksZ1hO8h2uZhkitdQ7Lq33zFgYbToMXHt+8Eq1xbo7hhcb0aOCV9Z4tlVsG4ZFwodIeA0qaAv3PPJpazRamEtbh+Q02/5/6KIUp4Ds/ztDwbNqtIxfPzaBpmMrYSdUuE8UfL493LXnZ/cPyg4Z1Gi722qZahAuK0j//UeTIjzRciGAf6NU7dd1KYdJk9mTZA7nblseP5VfKfJvKKQ2/8NknPEhlgXXo1tBc9gzz1nCZOuYWTbYz2KizDWEP5vzrqPTZedFKFm+8JmucU5uDK8UQ04SqzCRNW3L6RURI7QDb6FtIAeVkvsDF/owBJZAh9/nyOxJNgTOm3dqe6QAPoXPyCfKnh9AhdUGgFIUwA7DHSZG+blI3wKdf+YwGB2q7BhXFz/WZe9LniuhECoC7ExiQG/O1kq3foJTiGCVvqptIK8/cpK5l0GtZAdZsIdYLxRcNYRse2Gt3nA5/bb1z6eHG8Ryig1rtto5HYMz1P4Pzr+bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB7982.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199021)(478600001)(31686004)(66946007)(4326008)(66556008)(66476007)(41300700001)(54906003)(316002)(110136005)(5660300002)(6486002)(2906002)(966005)(8676002)(8936002)(6666004)(26005)(53546011)(6512007)(6506007)(186003)(2616005)(83380400001)(36756003)(31696002)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WERqRHM2Y0hrcnJuc3QrY2t2SmptSlNPMk1VMzlseTJtQWVZWTJSYU04blUx?=
 =?utf-8?B?TnJ3dk8vNHlPeVNnQktLdXJvcjNkd0VSQzRNbkRaMWpDdG5UalBVY2oyMzJw?=
 =?utf-8?B?NGlFSUhveUZPa2x6QVNjVk9BWUcrdzF1RFJKdDhlNk56NEVDUkFHRG1UNHhK?=
 =?utf-8?B?QnZsWVRTbjRDeWdwRU9JM1V6d1BycnpTTVJGOTJVbWVINWUvS0NaakJzaVl4?=
 =?utf-8?B?RE5YYzJsOVRCTFZZL2NMRjRsL0NyRkF3Q3dmSU9FRUxVTU1HNGcxL0xaQjNY?=
 =?utf-8?B?MnFmazRDQ0VCSGNRbmcwK1ZZTFM3b2k4N2VBTm9CakdGc3NJUkU0Y1F0cGZG?=
 =?utf-8?B?aURlTGdadnRHcUpNUjl1K1c1U2h5M2hjVFNieElGYUEyaUg5ZnkzVzZHUmJZ?=
 =?utf-8?B?ZmNIdE5HZW5VSVBlZC9nRVliUXNjc29UUG1OWklMWGxVMU81bWlxNHFTbGxp?=
 =?utf-8?B?MkZtOHlEaUJ6WDhCUEJiaGY0QlpscmpnUFdReFowVUVQVnFiR2luSmhNSDBh?=
 =?utf-8?B?Y09IWm5BZHVxYS9aN253WW1FVS9xSUJha1cvU2czcDlIcHhyQWNnVXBPK2Er?=
 =?utf-8?B?cVFQblY0ekJQRUczQlZCTW55YndKbnlqN2Q1UllwdEQxbkpwMS9UWHJzcTAz?=
 =?utf-8?B?ZC94NTl4WEc5Slh6eHJnY0FrVDl4dTJLRHF2eGxqWGFYSGpDd1h1N3hJZFVY?=
 =?utf-8?B?eGFaTXJaZS9NVld0bzdtTHNIWkYwZEpGUXBST3hpNlpsbE9IMEZxOFZnT1U4?=
 =?utf-8?B?U05CTFdMMm84aWRxeTAweS9tTGphR3E3ZHZPMG9VSDdwakZMT3A4cnZ3amxM?=
 =?utf-8?B?bzBzdnlHNFZHKy9UV09FMjlyaWxZT0crdVIrZVlKZWxiYzBUaTJFZUwyTEpN?=
 =?utf-8?B?SG96N2krQjdTbUlGRUYzcHZhQ2krRzczQUJlVU9YS1FkUjFxTTdLM2dCa1ZG?=
 =?utf-8?B?VW1YOGJHdHNwT2lWV21KRExRYk9NdFovRGpGMHFYOSthSmlkUTVYQ0FYL0Nr?=
 =?utf-8?B?dWttM2NMaUVsUWV2Y0ZiUWJ3RUFYUXFkUGZYMjRsMWFTVmJLVjNTRlBYbVdL?=
 =?utf-8?B?dXVEcEdyOUIwR0pwVmlDTjFERmM2TWVxNEpoYW12WjB1UEpsVFdldS9JckpN?=
 =?utf-8?B?QTkvUDZGbG84YXNhWlNDSlE4aXBhbFFtQUM1SmJCSUJWVVdmbmtXdU9rRUdt?=
 =?utf-8?B?UkV4SmJuOXpSc1pFWmNnc0ZkNTR3ME5rME8wcHA2Y1VsQldkeDg2bE1HbGpq?=
 =?utf-8?B?cE90dnFheEJkckFPK3dWN21xWWszNldIVFhISVVUd2luSnRLMWgxMVJ4a1cx?=
 =?utf-8?B?bjFVMm5HZGRVVS8wd054UFMvOThKL2loWnY1cmEySDduSFFIc0FiOGNzYkpq?=
 =?utf-8?B?cmlIbzA2SXJlby83QWh2VnR5b2QybzRBaGpycExrMVJCbmdNajZjVm1ITmtu?=
 =?utf-8?B?WWRWenEzVllYMjVhR1JnbVVVN3ROL3MyeHFSaloyc2x3WkN5blhXWWdsc1hJ?=
 =?utf-8?B?dndQNnR0R2lNV1VqUWROTExNeVlCcERoUFpPNUZHbzJwVThDVXd3bHErMUhW?=
 =?utf-8?B?YURTR1ozS1JvcytYaVNMT1VZY01wSjJyT2hGdHNkRVExQ0pQSUhjckovNXJC?=
 =?utf-8?B?MWtwRjBoSnoydlljNlNjNUhHNTJvR1o0Ny9XQXZ1YmIzQS83MkkzSzUrL2Zw?=
 =?utf-8?B?Vmx0MU5TOVJlbDhXNXRKaE5zWExPc3BKZmRBSmtKZVZYNG9HdVRyMlVSSkEy?=
 =?utf-8?B?Nm5ESFRaa2owODAyQ0MwaVJGWmt4WlVUckRsWndjemFYL3k1MGtUQnIxWlBy?=
 =?utf-8?B?L3RLc0ZKNXlXTFRnV3ZKVFFBOGVYcDJka1RnR0pJSzM4U0hKenZ1QjNGRUtv?=
 =?utf-8?B?dE1kR0J4L0hyZjhMcXhjY2ltV3g3Y2ZXT04xQ0orQVJBY0wyNzc4STNjcDJZ?=
 =?utf-8?B?Y1RxZmJoVTJhNlUxZWhBRnVvcGQ0RFp2RWVsS2hKd2NySk5tT2FvUlpuTWZo?=
 =?utf-8?B?b1F5NUpxNm5kZFU0ZGJvaWwvdlhjSlYxcHVGcDlBbmRjZ2lhSWFvWnptWjBU?=
 =?utf-8?B?WTl4OHQ2M0p4cStqeEZjOW1jeFBLMmQwY08rNGN3bkJjMEhLREhNN21NcXlG?=
 =?utf-8?B?cWlqenErcWNxQUV5cUtIb3c0UDVGenVMNFMyL2ZNM3V0bWdLcUIraWgzOStm?=
 =?utf-8?B?NWk0ZWFjczJMbGVkSXNOdWkrWDFoTWU3dHVZWjZXOGwrYmRWbHl4d2F6RFVi?=
 =?utf-8?B?YXpLWjJYb0tnaThPYTQ4VEJBU0JNSGFzZC9Ud25lRkRYMEZPQXVXT29HZzd1?=
 =?utf-8?B?NHhoenFLRWJ0QlM0Wkg3MWtpTFlSeDF2U3ZKSkFNMXlydDlPNHZ3SU9pTk9Z?=
 =?utf-8?Q?4LAVItxsNuptA3tCwFnt+Y4J/I1W6q6ZVt5QS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff4191e-d52b-4b06-f95f-08db464c3794
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBFunP1DXZSIT03/W2ttqQIiwl48AoIVpNAb9iBLJonDijYiyoMu08Xhe+sf5G9dxBX48SmULmbE97UDegsnD5qMptvnIHRs3lA971wOxFQ8sTdsps2yx2CkOGRWN/K6jQ7mWeZRFtkTzgfbKw4O/RZzU8IiCdFXAfFPVV/t68Xo+Ya7gTtgADmAE14CyAqJfy0/ClCP5Ka+ttVTm5MJeK4EUXQKajeNAu3LqS9oeClTcShuOLuZGC1fkSOo6YTr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 15:52:09.7468 (UTC)
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WTF? I own you a beer!

I've fixed exactly that problem during the review process of the cleanup=20
patch and because of this didn't considered that the code is still there.

It also explains why we don't see that in our testing.

@Mikhail can you test that patch with drm-misc-next?

Thanks,
Christian.

Am 26.04.23 um 04:00 schrieb Chen, Guchun:
> After reviewing this whole history, maybe attached patch is able to fix y=
our problem. Can you have a try please?
>
> Regards,
> Guchun
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Mikhail Gavrilov
>> Sent: Tuesday, April 25, 2023 9:20 PM
>> To: Koenig, Christian <Christian.Koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; dri-devel <dri-
>> devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.or=
g>;
>> Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
>> Subject: Re: BUG: KASAN: null-ptr-deref in
>> drm_sched_job_cleanup+0x96/0x290 [gpu_sched]
>>
>> On Thu, Apr 20, 2023 at 3:32=E2=80=AFPM Mikhail Gavrilov
>> <mikhail.v.gavrilov@gmail.com> wrote:
>>> Important don't give up.
>>> https://youtu.be/25zhHBGIHJ8 [40 min]
>>> https://youtu.be/utnDR26eYBY [50 min]
>>> https://youtu.be/DJQ_tiimW6g [12 min]
>>> https://youtu.be/Y6AH1oJKivA [6 min]
>>> Yes the issue is everything reproducible, but time to time it not
>>> happens at first attempt.
>>> I also uploaded other videos which proves that the issue definitely
>>> exists if someone will launch those games in turn.
>>> Reproducibility is only a matter of time.
>>>
>>> Anyway I didn't want you to spend so much time trying to reproduce it.
>>> This monkey business fits me more than you.
>>> It would be better if I could collect more useful info.
>> Christian,
>> Did you manage to reproduce the problem?
>>
>> At the weekend I faced with slab-use-after-free in
>> amdgpu_vm_handle_moved.
>> I didn't play in the games at this time.
>> The Xwayland process was affected so it leads to desktop hang.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D
>> BUG: KASAN: slab-use-after-free in
>> amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu] Read of size 8 at addr
>> ffff888295c66190 by task Xwayland:cs0/173185
>>
>> CPU: 21 PID: 173185 Comm: Xwayland:cs0 Tainted: G        W    L
>> -------  ---  6.3.0-0.rc7.20230420gitcb0856346a60.59.fc39.x86_64+debug
>> #1
>> Hardware name: System manufacturer System Product Name/ROG STRIX
>> X570-I GAMING, BIOS 4601 02/02/2023 Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x76/0xd0
>>   print_report+0xcf/0x670
>>   ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]  ?
>> amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>   kasan_report+0xa8/0xe0
>>   ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>   amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>   amdgpu_cs_ioctl+0x2b7e/0x5630 [amdgpu]
>>   ? __pfx___lock_acquire+0x10/0x10
>>   ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]  ? mark_lock+0x101/0x16e0  =
?
>> __lock_acquire+0xe54/0x59f0  ? __pfx_lock_release+0x10/0x10  ?
>> __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>>   drm_ioctl_kernel+0x1fc/0x3d0
>>   ? __pfx_drm_ioctl_kernel+0x10/0x10
>>   drm_ioctl+0x4c5/0xaa0
>>   ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]  ?
>> __pfx_drm_ioctl+0x10/0x10  ? _raw_spin_unlock_irqrestore+0x66/0x80
>>   ? lockdep_hardirqs_on+0x81/0x110
>>   ? _raw_spin_unlock_irqrestore+0x4f/0x80
>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>   __x64_sys_ioctl+0x131/0x1a0
>>   do_syscall_64+0x60/0x90
>>   ? do_syscall_64+0x6c/0x90
>>   ? lockdep_hardirqs_on+0x81/0x110
>>   ? do_syscall_64+0x6c/0x90
>>   ? lockdep_hardirqs_on+0x81/0x110
>>   ? do_syscall_64+0x6c/0x90
>>   ? lockdep_hardirqs_on+0x81/0x110
>>   ? do_syscall_64+0x6c/0x90
>>   ? lockdep_hardirqs_on+0x81/0x110
>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>> RIP: 0033:0x7ffb71b0892d
>> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
>> 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3=
d 00
>> f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
>> RSP: 002b:00007ffb677fe840 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> RAX: ffffffffffffffda RBX: 00007ffb677fe9f8 RCX: 00007ffb71b0892d
>> RDX: 00007ffb677fe900 RSI: 00000000c0186444 RDI: 000000000000000d
>> RBP: 00007ffb677fe890 R08: 00007ffb677fea50 R09: 00007ffb677fe8e0
>> R10: 0000556c4611bec0 R11: 0000000000000246 R12: 00007ffb677fe900
>> R13: 00000000c0186444 R14: 000000000000000d R15: 00007ffb677fe9f8
>> </TASK>
>>
>> Allocated by task 173181:
>>   kasan_save_stack+0x33/0x60
>>   kasan_set_track+0x25/0x30
>>   __kasan_kmalloc+0x8f/0xa0
>>   __kmalloc_node+0x65/0x160
>>   amdgpu_bo_create+0x31e/0xfb0 [amdgpu]
>>   amdgpu_bo_create_user+0xca/0x160 [amdgpu]
>>   amdgpu_gem_create_ioctl+0x398/0x980 [amdgpu]
>>   drm_ioctl_kernel+0x1fc/0x3d0
>>   drm_ioctl+0x4c5/0xaa0
>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>   __x64_sys_ioctl+0x131/0x1a0
>>   do_syscall_64+0x60/0x90
>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> Freed by task 173185:
>>   kasan_save_stack+0x33/0x60
>>   kasan_set_track+0x25/0x30
>>   kasan_save_free_info+0x2e/0x50
>>   __kasan_slab_free+0x10b/0x1a0
>>   slab_free_freelist_hook+0x11e/0x1d0
>>   __kmem_cache_free+0xc0/0x2e0
>>   ttm_bo_release+0x667/0x9e0 [ttm]
>>   amdgpu_bo_unref+0x35/0x70 [amdgpu]
>>   amdgpu_gem_object_free+0x73/0xb0 [amdgpu]
>>   drm_gem_handle_delete+0xe3/0x150
>>   drm_ioctl_kernel+0x1fc/0x3d0
>>   drm_ioctl+0x4c5/0xaa0
>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>   __x64_sys_ioctl+0x131/0x1a0
>>   do_syscall_64+0x60/0x90
>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> Last potentially related work creation:
>>   kasan_save_stack+0x33/0x60
>>   __kasan_record_aux_stack+0x97/0xb0
>>   __call_rcu_common.constprop.0+0xf8/0x1af0
>>   drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
>>   dma_resv_reserve_fences+0x4dc/0x7f0
>>   ttm_eu_reserve_buffers+0x3f6/0x1190 [ttm]
>>   amdgpu_cs_ioctl+0x204d/0x5630 [amdgpu]
>>   drm_ioctl_kernel+0x1fc/0x3d0
>>   drm_ioctl+0x4c5/0xaa0
>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>   __x64_sys_ioctl+0x131/0x1a0
>>   do_syscall_64+0x60/0x90
>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> Second to last potentially related work creation:
>>   kasan_save_stack+0x33/0x60
>>   __kasan_record_aux_stack+0x97/0xb0
>>   __call_rcu_common.constprop.0+0xf8/0x1af0
>>   drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
>>   amdgpu_ctx_add_fence+0x2b1/0x390 [amdgpu]
>>   amdgpu_cs_ioctl+0x44d0/0x5630 [amdgpu]
>>   drm_ioctl_kernel+0x1fc/0x3d0
>>   drm_ioctl+0x4c5/0xaa0
>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>   __x64_sys_ioctl+0x131/0x1a0
>>   do_syscall_64+0x60/0x90
>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> The buggy address belongs to the object at ffff888295c66000  which belon=
gs
>> to the cache kmalloc-1k of size 1024 The buggy address is located 400 by=
tes
>> inside of  freed 1024-byte region [ffff888295c66000, ffff888295c66400)
>>
>> The buggy address belongs to the physical page:
>> page:00000000125ffbe3 refcount:1 mapcount:0 mapping:0000000000000000
>> index:0x0 pfn:0x295c60
>> head:00000000125ffbe3 order:3 entire_mapcount:0 nr_pages_mapped:0
>> pincount:0 anon flags:
>> 0x17ffffc0010200(slab|head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
>> raw: 0017ffffc0010200 ffff88810004cdc0 0000000000000000
>> dead000000000001
>> raw: 0000000000000000 0000000000100010 00000001ffffffff
>> 0000000000000000 page dumped because: kasan: bad access detected
>>
>> Memory state around the buggy address:
>>   ffff888295c66080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>   ffff888295c66100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>> ffff888295c66180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                           ^
>>   ffff888295c66200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>   ffff888295c66280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D
>>
>> --
>> Best Regards,
>> Mike Gavrilov.

