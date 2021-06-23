Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2303B1BEA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38E6E8EF;
	Wed, 23 Jun 2021 14:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEB26E8EF;
 Wed, 23 Jun 2021 14:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Laatx25QNTeML8NFIoTP2rdryDSN9pkR+a4m/paytCepE50Ccn9lltsq0oNRvfszyqyt+MvCuLjaPamS4z1bJWHFMpkCRWu1ZqE9pe4eVN+rKhhGqZ7YWIqjIq8mZ0hQGw/jqCAzTVx3Iq6HY4M5s2hP6McnyO8SrOSkHdt7KPLJ+0KvlOb3sWAWNZDvUb9w1bgAPVRL9Y++ojIPhwRNSfUTeOY+wk1XghDHvx/vfeb0R0ekW2bFcNgofo5oChI6Ii7R1H4B1WcxTZnGzKrGK4R2loYMTH1OvnJkviQS2eLE20zLhrsnFqMaJlEjFTG+naKhijgjf21RI2pXaxNRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj/mz8hNtbodQSqe3wZXFR5Z5vUYsc2sBVBJi+EnV2M=;
 b=fEyjQNIVlrFhvff9WlP2vJ2+jdGbV29Iw0ILvqQda/Y8I1OCeobVSh2wMkb2OqDRJdjpy4M1Y7csmxABIPLIi23SPaMcE4+QNBmffVL+5xA0gL+7zlOVpRkJhr0jYXcIUp+PRfIbkZggUSgS4CoJDXKl6W9pX0GhJvaVFtUAkBBWnOpblM+tQkpg88Ll7+3A9p0/ZWl4RGHeZf12o+20Q8TmnbwwiaaN4n4HYP1tYQ4tDJbWo3Fp6501gaSnCAA+UJI7Yq77tYleIIBpuM4jkvAWta6bomnhrXJpIPQ4k7ZmpR/nUjNmvEy402kGx2ltjPCHFJQz1gSuk5Ip6teJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj/mz8hNtbodQSqe3wZXFR5Z5vUYsc2sBVBJi+EnV2M=;
 b=O1dSyFIg0cGoQfnbRlyT43vdk8gpQFoOy/IcqGk3I3p86EBcQrO5wq5LTRGIDWsRV/KBRPS3XPv3ZCYSxf0CPCt0/XbU3hNFDapTUEwI7fRTxNaUNtTezIL39S2C3ncbnryQocQivnVwWbwBRFNCKaaYIWxcAWDFhuWlAiRbFig=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 14:02:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 14:02:31 +0000
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
 <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
 <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
 <CAKMK7uEjc+tZCKB8Yu3_zAjOgYLPBhnYebHOXgxpFaSunuPCfA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <682d2f3b-8ba3-cccb-1385-1f74f0b06ada@amd.com>
Date: Wed, 23 Jun 2021 16:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uEjc+tZCKB8Yu3_zAjOgYLPBhnYebHOXgxpFaSunuPCfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:871f:87e2:f394:e667]
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:871f:87e2:f394:e667]
 (2a02:908:1252:fb60:871f:87e2:f394:e667) by
 FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Wed, 23 Jun 2021 14:02:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce169a59-1e12-408a-dfbe-08d9364f8b29
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3968E678BAC7766F579A971B83089@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipUOXL7E6hz6FM343luKW3RKHUHX41nAbZR3PKj4ue0yeswdc52A6tkN/dfGDrbsD+sl6JYRdT1B6VixBjai6EabCI7/5YvBG42/EIF4ZYe9iHKfnOizUKKRkA3eyQK4BXSFgKEss58zp5owrjLKxvAQQGOeXHckEmpj9QlElQ0g2N6fqNK0LVutc+r1wsyaEmFHde8cROh5xjvRTUIchsvfSiGTTHHAd6uwx2/nSbvrviYpKT5yJ3Clc57nqCd7mmO3K/7kTL9UVzGtWA3NKXPoq7X6yzLhJj7mSfQPPFcszl0WYQ8Zdhzh2SULKUF76AQvG82FzncRparYm4gQ3qzHgYeL+u11JRCiWM/gzsasZZuhqYGWRm6JiSxIgjcOmsY8Q05FyqxVTeDbOPIPEiWio/eXlr6k3PmHs8nC/4tMiLKnr1d+/HJqrhCA0k8LTyaaeL1kgHSrr2TTIAaQYGC4ANCJgszvNw5sgZ+O8SS+V1qh0PWoz0GrMRj2reQ9N2s4GivcS7o3RKVqpPBZOiE6mcRlZOMjdJthSYsRgwrpziUrtx4fm1ELLasi4NKXWvuglT+4eumyXUC2U2QMbv1BRDXLfUEIJyS0FQKRLkCXahjz0TPDlO9jcFc7qL/udI5Je5ROiKY+4i8kxNozPHeKpIlVB1HOPPJUWuiUhPc5XadwCMXPo8RnLjDBjrbzOx3INoXtCTmuUEARGeC+OeMlDiBl+CZp66gPxstBVR4f6N9R7AaogNtzAK1VZXh0OimsIbZdlIdARWd6rw6PpKcmQO546U3xyzXngLwAh9ZzMvblhx3REIbSC8qF+ThkA2+Vk5/kWn6LUECjHbIi/X0gGGQvFyu2x8R4pVk7g9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(54906003)(66574015)(2906002)(66556008)(66476007)(66946007)(4326008)(7416002)(53546011)(186003)(5660300002)(16526019)(30864003)(6486002)(478600001)(83380400001)(38100700002)(86362001)(36756003)(6666004)(8936002)(31686004)(6916009)(8676002)(45080400002)(31696002)(966005)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVErVVJGTUVtb3krWk8zdGF0dVU0WkppU0YvaUMxRS9sZWZnYkZzK2g5NnhR?=
 =?utf-8?B?RVhabEkvc3V1OWV1SkNjT1RwN1dqUzJvMW5JMVBvUytnTTVEY2pZdjh3K3o3?=
 =?utf-8?B?TVlZdXhXNjB5ZkhiT0JUbWc5OFh6VXNMcXExVHJQM3FGZlEyMzV1YVF6YmVy?=
 =?utf-8?B?MTc1MnF2ZVNhRE9uYkJPTmdGSWZTNFZYaW5pdjhRRnlyY0lhcjMzR1BFMXdn?=
 =?utf-8?B?RUdSbG13L1BqYVJkRE9zcDFoekl2QmxSb0xqQ0Y5Ymh2aWFERStGMFMrd0NT?=
 =?utf-8?B?K0R5U1BTbGtSWENza0VuRVNLT0VLY1B6cDhlcXQ4Q0FXY0tsd2RCVlFwK1V4?=
 =?utf-8?B?N1JZOVFMdkpPeDBDYnlLdnVrV3d0Wi9iWDNKUGhhR2tBc1BEQmRUcnVQK2wx?=
 =?utf-8?B?Z3hBQkhhbEI1c3VvMHZndHN3R1pKazhDN3c5MTFiZmhMZVhSODJUZVh3R1RQ?=
 =?utf-8?B?Z0hHdjlFSkQ1S1hDQzVxSVhGVEcyNDRDWkVsT0o4Z2dLclFBcVZLaS92aU92?=
 =?utf-8?B?N2ZpTWZuamNBM01XanVJNHhtOWVNUjRqRGZleHBCTHptZXRHL3BPa1VyZE1o?=
 =?utf-8?B?Ukp2aGoyYm1Sd1dyVnpCdTh4Q2ZMMDhIeWtXb1pHNGxQSk5KTm1tOHpYbXBK?=
 =?utf-8?B?SDVINFRvalhzaTBnUi9NUVFJTGtBMHQwOFR6OGcvRmV3akVoUkY5MFRQZDFj?=
 =?utf-8?B?aDdWNUpMdExYUlcwV043Lzc3WnlXVVp6R3YvNlAzbitaNWcyaVNuVUx2ZzJR?=
 =?utf-8?B?QUV2akNpOHFseTFya3NBaXdKVHU2c0IyK1h2aVUrZnorVzNoRWl3ZklsNmpT?=
 =?utf-8?B?VVhSN1ZHZmRyWjVLckdPR1p2VXhaeTlEN0pzQU84Nm8zejBFMFZ3TXU3dkVw?=
 =?utf-8?B?S3F1dzhkLzFDRHFmanVzWHRoKzZaai80VWFTejY4dGRJVjhYQUt0OHUzL3lV?=
 =?utf-8?B?d1hleHdPTlNNYUcrZ2w1ZEFZU1BVRjNUeUV1Z2R0MHZLK0pmUUh6V0xXVWU5?=
 =?utf-8?B?MnR1UXBFV0lVayt6djdxajdOZUh6UmlKUnlCcU1DR2Y1YWx3YTFOZWN0aWZV?=
 =?utf-8?B?ZzhOUHRpVitjQWpvWW85V2ZTQmZOWTVUaEF1dDNPMkxHTTRrcVBGdHQ3OGE5?=
 =?utf-8?B?ZElkM2VaMDBhVVJSVmd4WjhmUzNXbEJCbGlMWEg4WCtLQXIraENvVGo0YjBP?=
 =?utf-8?B?T1Y3RVU5Q3Nlc1daOThDQVNkSmgyZk9zMTBpcXNDb2xHWnZ3OE9TSGlnVng5?=
 =?utf-8?B?S3ZNLzZFK1R4c1FNRDZsN0k4NmQvZFVMYXJvMmorcWc2Z09PcmQyVG9Ock03?=
 =?utf-8?B?aFhkdTJDbmxKQnZNamt1YUZheFUyTDdOK1lqVTdUMDZna3hEc3dPWmkzeFhp?=
 =?utf-8?B?SW4yM1FFTzZQUnloOUFwN0tFL3VlWWhSVmdwa0hzSHdzeFJkL3VrcVZDSlVH?=
 =?utf-8?B?ZFhabzk1SlRMVU9iaE5kMlhSSXFzWThmZXhxU0FwQmJueFF5UVNhT0tQNUZ6?=
 =?utf-8?B?NmdDd09zdjJnci8xTTZIMkpTdGVkWFFCOG42Vi93YXQvbFMya01KV3VGTTk2?=
 =?utf-8?B?bnlEUTNMNkYreVJRYWUwRWN5eG9HOE9uMXUwZG8raURJVCtZYUVyci9BUnY3?=
 =?utf-8?B?Rm1nM3N5NTJWbVE2UGIrMnpacVlFMXpJa1ZGY3pPSHJ4K0ptOWljSlRVV2pH?=
 =?utf-8?B?QmZHQW5tR3NKbkZDYjlNQkpaRTgxaUx6cTdmWDkxdEdEbHdxL0t4NzBWeGVm?=
 =?utf-8?B?THNNUFM1aUhONHhQRm96WGxIeWp1ckIzSWJvWTJMamhBdlpYUi8yc0R1MFdo?=
 =?utf-8?B?YjlyTEpQVEZQdVlKdEk4VGpJSlRveGhWbkc2MFNlSEd3TlRxZVpYVWNZSDUy?=
 =?utf-8?Q?tu/GJZhIcJIBZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce169a59-1e12-408a-dfbe-08d9364f8b29
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 14:02:31.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZYHkF+P+MIrF+zweu5bkq09CuxvHGFOurj+r1P4ANxdRPnr8BeMB/1y/K3xyL0B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.21 um 15:49 schrieb Daniel Vetter:
> On Wed, Jun 23, 2021 at 3:44 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 23.06.21 um 15:38 schrieb Bas Nieuwenhuizen:
>>> On Wed, Jun 23, 2021 at 2:59 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
>>>>> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
>>>>> <bas@basnieuwenhuizen.nl> wrote:
>>>>>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
>>>>>>>
>>>>>>> Implicit fencing done properly needs to treat the implicit fencing
>>>>>>> slots like a funny kind of IPC mailbox. In other words it needs to be
>>>>>>> explicitly. This is the only way it will mesh well with explicit
>>>>>>> fencing userspace like vk, and it's also the bare minimum required to
>>>>>>> be able to manage anything else that wants to use the same buffer on
>>>>>>> multiple engines in parallel, and still be able to share it through
>>>>>>> implicit sync.
>>>>>>>
>>>>>>> amdgpu completely lacks such an uapi. Fix this.
>>>>>>>
>>>>>>> Luckily the concept of ignoring implicit fences exists already, and
>>>>>>> takes care of all the complexities of making sure that non-optional
>>>>>>> fences (like bo moves) are not ignored. This support was added in
>>>>>>>
>>>>>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
>>>>>>> Author: Andres Rodriguez <andresx7@gmail.com>
>>>>>>> Date:   Fri Sep 15 20:44:06 2017 -0400
>>>>>>>
>>>>>>>        drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
>>>>>>>
>>>>>>> Unfortuantely it's the wrong semantics, because it's a bo flag and
>>>>>>> disables implicit sync on an allocated buffer completely.
>>>>>>>
>>>>>>> We _do_ want implicit sync, but control it explicitly. For this we
>>>>>>> need a flag on the drm_file, so that a given userspace (like vulkan)
>>>>>>> can manage the implicit sync slots explicitly. The other side of the
>>>>>>> pipeline (compositor, other process or just different stage in a media
>>>>>>> pipeline in the same process) can then either do the same, or fully
>>>>>>> participate in the implicit sync as implemented by the kernel by
>>>>>>> default.
>>>>>>>
>>>>>>> By building on the existing flag for buffers we avoid any issues with
>>>>>>> opening up additional security concerns - anything this new flag here
>>>>>>> allows is already.
>>>>>>>
>>>>>>> All drivers which supports this concept of a userspace-specific
>>>>>>> opt-out of implicit sync have a flag in their CS ioctl, but in reality
>>>>>>> that turned out to be a bit too inflexible. See the discussion below,
>>>>>>> let's try to do a bit better for amdgpu.
>>>>>>>
>>>>>>> This alone only allows us to completely avoid any stalls due to
>>>>>>> implicit sync, it does not yet allow us to use implicit sync as a
>>>>>>> strange form of IPC for sync_file.
>>>>>>>
>>>>>>> For that we need two more pieces:
>>>>>>>
>>>>>>> - a way to get the current implicit sync fences out of a buffer. Could
>>>>>>>      be done in a driver ioctl, but everyone needs this, and generally a
>>>>>>>      dma-buf is involved anyway to establish the sharing. So an ioctl on
>>>>>>>      the dma-buf makes a ton more sense:
>>>>>>>
>>>>>>>      https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C83dbdd0a1eb8442cbf7108d9364db51e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600529684040802%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fbdwtutEj93anZp6Pshs277QoMTHZxIy0Yl54T95rCw%3D&amp;reserved=0
>>>>>>>
>>>>>>>      Current drivers in upstream solves this by having the opt-out flag
>>>>>>>      on their CS ioctl. This has the downside that very often the CS
>>>>>>>      which must actually stall for the implicit fence is run a while
>>>>>>>      after the implicit fence point was logically sampled per the api
>>>>>>>      spec (vk passes an explicit syncobj around for that afaiui), and so
>>>>>>>      results in oversync. Converting the implicit sync fences into a
>>>>>>>      snap-shot sync_file is actually accurate.
>>>>>>>
>>>>>>> - Simillar we need to be able to set the exclusive implicit fence.
>>>>>>>      Current drivers again do this with a CS ioctl flag, with again the
>>>>>>>      same problems that the time the CS happens additional dependencies
>>>>>>>      have been added. An explicit ioctl to only insert a sync_file (while
>>>>>>>      respecting the rules for how exclusive and shared fence slots must
>>>>>>>      be update in struct dma_resv) is much better. This is proposed here:
>>>>>>>
>>>>>>>      https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C83dbdd0a1eb8442cbf7108d9364db51e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600529684040802%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vv%2BREnWorjoTOwrD1jH1GHVQcjPy1oesaophsz056aI%3D&amp;reserved=0
>>>>>>>
>>>>>>> These three pieces together allow userspace to fully control implicit
>>>>>>> fencing and remove all unecessary stall points due to them.
>>>>>>>
>>>>>>> Well, as much as the implicit fencing model fundamentally allows:
>>>>>>> There is only one set of fences, you can only choose to sync against
>>>>>>> only writers (exclusive slot), or everyone. Hence suballocating
>>>>>>> multiple buffers or anything else like this is fundamentally not
>>>>>>> possible, and can only be fixed by a proper explicit fencing model.
>>>>>>>
>>>>>>> Aside from that caveat this model gets implicit fencing as closely to
>>>>>>> explicit fencing semantics as possible:
>>>>>>>
>>>>>>> On the actual implementation I opted for a simple setparam ioctl, no
>>>>>>> locking (just atomic reads/writes) for simplicity. There is a nice
>>>>>>> flag parameter in the VM ioctl which we could use, except:
>>>>>>> - it's not checked, so userspace likely passes garbage
>>>>>>> - there's already a comment that userspace _does_ pass garbage in the
>>>>>>>      priority field
>>>>>>> So yeah unfortunately this flag parameter for setting vm flags is
>>>>>>> useless, and we need to hack up a new one.
>>>>>>>
>>>>>>> v2: Explain why a new SETPARAM (Jason)
>>>>>>>
>>>>>>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
>>>>>>> need both, or this doesn't do much.
>>>>>>>
>>>>>>> v4: Rebase over the amdgpu patch to always set the implicit sync
>>>>>>> fences.
>>>>>> So I think there is still a case missing in this implementation.
>>>>>> Consider these 3 cases
>>>>>>
>>>>>> (format: a->b: b waits on a. Yes, I know arrows are hard)
>>>>>>
>>>>>> explicit->explicit: This doesn't wait now, which is good
>>>>>> Implicit->explicit: This doesn't wait now, which is good
>>>>>> explicit->implicit : This still waits as the explicit submission still
>>>>>> adds shared fences and most things that set an exclusive fence for
>>>>>> implicit sync will hence wait on it.
>>>>>>
>>>>>> This is probably good enough for what radv needs now but also sounds
>>>>>> like a risk wrt baking in new uapi behavior that we don't want to be
>>>>>> the end result.
>>>>>>
>>>>>> Within AMDGPU this is probably solvable in two ways:
>>>>>>
>>>>>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared fences.
>>>>> I'm not sure that works. I think the right fix is that radeonsi also
>>>>> switches to this model, with maybe a per-bo CS flag to set indicate
>>>>> write access, to cut down on the number of ioctls that are needed
>>>>> otherwise on shared buffers. This per-bo flag would essentially select
>>>>> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
>>>> Yeah, but I'm still not entirely sure why that approach isn't sufficient?
>>>>
>>>> Problem with the per context or per vm flag is that you then don't get
>>>> any implicit synchronization any more when another process starts using
>>>> the buffer.
>>> That is exactly what I want for Vulkan :)
>> Yeah, but as far as I know this is not something we can do.
>>
>> See we have use cases like screen capture and debug which rely on that
>> behavior.
> They will keep working, if (and only if) the vulkan side sets the
> winsys fences correctly. Also, everything else in vulkan aside from
> winsys is explicitly not synced at all, you have to import drm syncobj
> timeline on the gl side.
>
>> The only thing we can do is to say on a per buffer flag that a buffer
>> should not participate in implicit sync at all.
> Nah, this doesn't work. Because it's not a global decision, is a local
> decision for the rendered. Vulkan wants to control implicit sync
> explicitly, and the kernel can't force more synchronization. If a
> buffer is shared as a winsys buffer between vulkan client and gl using
> compositor, then you _have_ to use implicit sync on it. But vk needs
> to set the fences directly (and if the app gets it wrong, you get
> misrendering, but that is the specified behavour of vulkan).

Yeah, but that's exactly what we tried to avoid.

Mhm, when we attach the flag to the process/VM then this would break the 
use case of VA-API and Vulkan in the same process.

But I think if you attach the flag to the context that should indeed 
work fine.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>>>> The current amdgpu uapi just doesn't allow any other model without an
>>>>> explicit opt-in. So current implicit sync userspace just has to
>>>>> oversync, there's not much choice.
>>>>>
>>>>>> 2) Have an EXPLICIT fence owner that is used for explicit submissions
>>>>>> that is ignored by AMDGPU_SYNC_NE_OWNER.
>>>>>>
>>>>>> But this doesn't solve cross-driver interactions here.
>>>>> Yeah cross-driver is still entirely unsolved, because
>>>>> amdgpu_bo_explicit_sync() on the bo didn't solve that either.
>>>> Hui? You have lost me. Why is that still unsolved?
>>> The part we're trying to solve with this patch is Vulkan should not
>>> participate in any implicit sync at all wrt submissions (and then
>>> handle the implicit sync for WSI explicitly using the fence
>>> import/export stuff that Jason wrote). As long we add shared fences to
>>> the dma_resv we participate in implicit sync (at the level of an
>>> implicit sync read) still, at least from the perspective of later jobs
>>> waiting on these fences.
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> -Daniel
>>>>>
>>>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
>>>>>>> Cc: Michel Dänzer <michel@daenzer.net>
>>>>>>> Cc: Daniel Stone <daniels@collabora.com>
>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
>>>>>>>     include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
>>>>>>>     4 files changed, 42 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> index 65df34c17264..c5386d13eb4a 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>>>            struct amdgpu_bo *gds;
>>>>>>>            struct amdgpu_bo *gws;
>>>>>>>            struct amdgpu_bo *oa;
>>>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>>>            int r;
>>>>>>>
>>>>>>>            INIT_LIST_HEAD(&p->validated);
>>>>>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>>>
>>>>>>>                    e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>>>>>
>>>>>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>>>>>>> +               if (bo->tbo.base.dma_buf &&
>>>>>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
>>>>>>>                            e->chain = dma_fence_chain_alloc();
>>>>>>>                            if (!e->chain) {
>>>>>>>                                    r = -ENOMEM;
>>>>>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>>>     {
>>>>>>>            struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
>>>>>>>            struct amdgpu_bo_list_entry *e;
>>>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>>>            int r;
>>>>>>>
>>>>>>>            list_for_each_entry(e, &p->validated, tv.head) {
>>>>>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>>>                    struct dma_resv *resv = bo->tbo.base.resv;
>>>>>>>                    enum amdgpu_sync_mode sync_mode;
>>>>>>>
>>>>>>> -               sync_mode = amdgpu_bo_explicit_sync(bo) ?
>>>>>>> +               sync_mode = no_implicit_sync || amdgpu_bo_explicit_sync(bo) ?
>>>>>>>                            AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>>>>>>>                    r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
>>>>>>>                                         &fpriv->vm);
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> index c080ba15ae77..f982626b5328 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>>>>>>>            return 0;
>>>>>>>     }
>>>>>>>
>>>>>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
>>>>>>> +                         struct drm_file *filp)
>>>>>>> +{
>>>>>>> +       struct drm_amdgpu_setparam *setparam = data;
>>>>>>> +       struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>>>>>> +
>>>>>>> +       switch (setparam->param) {
>>>>>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
>>>>>>> +               if (setparam->value)
>>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
>>>>>>> +               else
>>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
>>>>>>> +               break;
>>>>>>> +       default:
>>>>>>> +               return -EINVAL;
>>>>>>> +       }
>>>>>>> +
>>>>>>> +       return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>     const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>     };
>>>>>>>
>>>>>>>     static const struct drm_driver amdgpu_kms_driver = {
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> index ddb85a85cbba..0e8c440c6303 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
>>>>>>>            bool                    bulk_moveable;
>>>>>>>            /* Flag to indicate if VM is used for compute */
>>>>>>>            bool                    is_compute_context;
>>>>>>> +       /*
>>>>>>> +        * Flag to indicate whether implicit sync should always be skipped on
>>>>>>> +        * this context. We do not care about races at all, userspace is allowed
>>>>>>> +        * to shoot itself with implicit sync to its fullest liking.
>>>>>>> +        */
>>>>>>> +       bool no_implicit_sync;
>>>>>>>     };
>>>>>>>
>>>>>>>     struct amdgpu_vm_manager {
>>>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>>>>>> index 0cbd1540aeac..9eae245c14d6 100644
>>>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>>>> @@ -54,6 +54,7 @@ extern "C" {
>>>>>>>     #define DRM_AMDGPU_VM                  0x13
>>>>>>>     #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>>>>>>>     #define DRM_AMDGPU_SCHED               0x15
>>>>>>> +#define DRM_AMDGPU_SETPARAM            0x16
>>>>>>>
>>>>>>>     #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>>>>>>     #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>>>>>>> @@ -71,6 +72,7 @@ extern "C" {
>>>>>>>     #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>>>>>>>     #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>>>>>>>     #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>>>>>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
>>>>>>>
>>>>>>>     /**
>>>>>>>      * DOC: memory domains
>>>>>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
>>>>>>>            struct drm_amdgpu_sched_in in;
>>>>>>>     };
>>>>>>>
>>>>>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
>>>>>>> +
>>>>>>> +struct drm_amdgpu_setparam {
>>>>>>> +       /* AMDGPU_SETPARAM_* */
>>>>>>> +       __u32   param;
>>>>>>> +       __u32   value;
>>>>>>> +};
>>>>>>> +
>>>>>>>     /*
>>>>>>>      * This is not a reliable API and you should expect it to fail for any
>>>>>>>      * number of reasons and have fallback path that do not use userptr to
>>>>>>> --
>>>>>>> 2.32.0.rc2
>>>>>>>
>

