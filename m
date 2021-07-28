Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0A3D8EB5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7994C6E183;
	Wed, 28 Jul 2021 13:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925AF6E183
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkxtlxJYMjRYwNV4xT5v6x3Ls/mOIIt1y6becji2+muULL4bjtXXDWkO1XFRqzLtZl9TKEgq2f5ymkgIe31SZp2aT7t1KvmzYnp8ZP4MRhKQwKZU1Tx0BSrFdfjfKTNKhf8WzHVAUwo/1lsuxMKO1E/dTg39jKUW8m2+VYDVT4BqHDVg/OC3qISyMOzofH549bnzYNj9049IAPUo5IyAPn4B8+VCJ8ELXmQShrV++B+OUZhd3h8YTUROxPNpDdJu6QP1caQrAQQGoty7RRj5eX7se5beqKKq4OFP+GO59jAsYJRcMDjTg1ANDLVWJ3x6TVgSHb2gVyA9RSr3nwd5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N82mV6rA4m4gW6sClwqacQfhN31dxUKxzeYfq7TRgto=;
 b=Nuk7yB9VtNm3HhXJCbogtV3CBDVYX/AVli/iIW4CtDHE6CFpjvOpmdLEla7lK0rfoTQMEG41GfR74oYZMuQS2D+rpWkPa+lR3pZCBaaPRbbdoJwkXOdrb+YZkafpbLw+doTmDRC3eCIbprWzwcoW3YNI46Hv7AWflbFBzGHxCPoKPLKQLbysd4tEYKu5UZENpWqF37AMepIiCW2QUaapCVvEDXLFd7ombyoj2xu+TM0NYpO4oRTcKH+trDKBFmhgo/iOaiwuEuXx92cbVBn7OPFgdOCUlUgeyUqQ7KMP+HI/ZVYGNyH2mBisRFrm+5Hgj/jHk78B2IJyypOUhgKDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N82mV6rA4m4gW6sClwqacQfhN31dxUKxzeYfq7TRgto=;
 b=Zr/Zz8GFj+JmVdAQ5d7P50kiWjT+l1JU0ddO/1CfAnSbGKVg+/pl53YUBVBSmo5Mf9HlzHCsK+o+mIYhgZn5iVNbWM52cA3JV8xKnP2GJhOgPlkSgoo+nfoywqz3889/DUZ8NhqT62v36xDRYZ2E3u5My8hm5hu76N+A/4fqvvE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 13:13:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 13:13:33 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
Date: Wed, 28 Jul 2021 15:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0204.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:af99:e30a:2b7e:eda8]
 (2a02:908:1252:fb60:af99:e30a:2b7e:eda8) by
 AM0PR02CA0204.eurprd02.prod.outlook.com (2603:10a6:20b:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 13:13:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bddc64a-376a-454f-d7e8-08d951c9801a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB484732E62E037EFA805B031B83EA9@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /68wkhdYgd+fS4mtNztX6NPhz6k3vN3NqDZidkvUCqtWuthW7q5QARwXB2XW9SsCEcJQRisq/pZcEGG25cMxzMGLifDT4riDrHT0hjTm1heHtuo9IU2V7TR9QJeGI4IKu31fuFl0PJ2nIeZSRr/cjwp+E9o9+3h7VXK6B2g57vWMDIGUu9FlriN2dsi/U3NuWHijFqHWr4qLlr6MfjeqtZTY//cAmtlAxk7c629bedbJYT2O3MT04jTkh7eYZJHY3B4oFOox/MSbRIdbsuwuNMFOBvdhXTun0+Cyj4z1jnnA4Y2m0FXGImNWqnU1tpA1PsW+Y9AdXujvZ3caFjaVoJWXYxewKXKrj3bBFcvbe63sCjzSW5GwnSpkGeKUlRlhyXOC6/6f3i9Z+j7KeKgPVohADO+m1rRXOtcp9SPNYTCsf1zRT051UZHs37qkz1+yQNFzeaqaCZHAkclTuxVj/QwnkkGqBLBsRY76ztD3eJVLOPD753k2ZO1epQX+ovbVCmAbGsZkVxDvdXxfR7IPfgEmqAiiipeMfFWjvLqdLEX6ItFJVnHwuhs0ZE62WVaHzsv8sjtHL+GaeSFoq5a/i8S++5L9PuVIGz+AToDz+8VdJxbLO1gTUS1cGbio0gwfk+aGqJj8lbhSx1tAum5B+gRM6muAgZuurIiclxOVWzzjL686qt59j1ZP+YckNapsFFIPXQkE5u3a2knhcySHtEjKCraKs8jEKI7fU44/ZGb1kx3lZIWaynWaEp1xbjiar/FjjJmrxelmCKnKhmQKgbTvEHH3bF7VIi21WqT/+byugwRmU0T7a4CNoZAKEFzF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(6486002)(4326008)(36756003)(2906002)(38100700002)(8676002)(66556008)(2616005)(83380400001)(86362001)(8936002)(45080400002)(478600001)(966005)(31686004)(186003)(66574015)(31696002)(6666004)(54906003)(5660300002)(66946007)(66476007)(110136005)(53546011)(7416002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05kMmFraFRZeHlVbVFtYUtEcjdEUncrbTZBNnJpMTJUVEJuaExDRG43eC94?=
 =?utf-8?B?cjBORmo5QngzRmhlcXQwL25MQ1ZsbDdRMHoxM0ZnZmlzZmZOMFNUL0pqSUxj?=
 =?utf-8?B?bENqZmNCblJzSTh2OHlCZGlKaTBEUzVFelkzQno5R1ViZVBxbnVSME51U0Nt?=
 =?utf-8?B?ODRLclhCN0x4QXVSVVZJWEk1S0RlN1dHaEVxUzRBcUwrWWlqRVgzNzA5Q2lG?=
 =?utf-8?B?Y0g5Y25ZbzZ1RzJYclFYRmJGNjdmbTBJU0tpQ0tYYUxEQ2lsa09Pa04vait6?=
 =?utf-8?B?Y3JkRUQwUDFxNnFrTTBJU0Z4ZG9EVjFBUHQ0QUNuS3MvNFlndDh3SUQyNzN5?=
 =?utf-8?B?Q2sxRW5iOEw0MWdXY1F1czRhZG5jeVZ6TTJBWnFZTHd4UWMrRVNjV0tuOWJo?=
 =?utf-8?B?S0VIWUtvR0RxNVEyRUpkbEp4MlhpN1FvNHFoWG50Z0tTenRWL3Z5cVBlc2Vp?=
 =?utf-8?B?bm9EZW9ZY0hLdlZJTFh3UkV1SWlPNFdnZkNEaGJEdTFsaTFjemVRc0FpMHhN?=
 =?utf-8?B?RDFGd01xb3U1NFZ3NmZ0NWVKVWFMVlNyZWl2MGsrdGtld21FS1lrM21jWmNB?=
 =?utf-8?B?K014Y2dTYXJtdFMyZGZRT2toU0k5dFlLVnlkQ0xGUU92MXNBMWZYemdMbGlt?=
 =?utf-8?B?WlVSM2h4ZUNzUi9OL3FWdnNnU29ucDdNQnRYK3ZsQVg4UHpNelNEUUtxcmFp?=
 =?utf-8?B?WC9aRWs1SWZQbVl0eDNVa2Z1Tkk2Q3U3dm9JMGc2SDljaWZ1Rk1CY2NMQTJw?=
 =?utf-8?B?UGEvNmJsd05zUDR4Qy9mbU5vNmJnTmU2T2dhc2o5RGZSQk9lK25xdDlwTTI5?=
 =?utf-8?B?aVBBUkpBVmpwemtYUWlObWVKbm1Ib3o2emQwOFZOTGtzenM2ZVhNaXFxZlR3?=
 =?utf-8?B?S0ZkemRWR2FnM3lKamZPTnlLbFY3UFFnVkNCelRodERvdGpJdUd3enFFWm5X?=
 =?utf-8?B?bUhIUTlpUVB5YnBaTkYzeUtrUmtRQ3JyQnJ5Q2lrRzlOV1F4RkRKS0lRRXRV?=
 =?utf-8?B?Yk5DMCsrd2IvSEN4N1lueEZXeFptOHJWRkE2WmtncElwN2NhQWllbFBiMktJ?=
 =?utf-8?B?V0NtUHB3NVhpOWhXUWVrMS9hVXlQWG9RdzN2U0I1dHA4NlVVdTJLN2I1RXRs?=
 =?utf-8?B?eVVaaWRjWVI5bU05RE5nWEM0YitKNFIyV3RjQ3pLM3JuOUJTTEk4UlhDaHRw?=
 =?utf-8?B?YlBZVjk4YUFnTVMyN1FDakNNbWd5c1ZNUHpWWnZPU0wvSVZ0dUFjeFVTamJ2?=
 =?utf-8?B?cDYxUUNhTVh0U0RIOWk0Tkc1V1NyeXg1UFBVdlQ4Z3lBMHcwTUt4LzVtTGRn?=
 =?utf-8?B?bDBqWVdFaGtFZHI0eXFKNjd5WEJwUitqeUdBVGhZK256MDZXRmMybngzTWpi?=
 =?utf-8?B?clM3bGRWR1FMZEMwUys5ZTBKallCZXhoMXlDZTZEYkFaejV2RW1TcklKd1N3?=
 =?utf-8?B?eENBSWYyOXRiZE50VWVlcDUzMGVSVS9oUzNwOThOZk8wSnJ2TlY5QW9lWURn?=
 =?utf-8?B?MWp4RERub2xKaThJRDdVaHN6OGxSczVDeE5jK2lPcFppdGJQQ1kvbUorWWJk?=
 =?utf-8?B?amhCUHREYzMvVHRlYXZ4eDRiUEh0QkYxSlFZUU1YdzhpVzRMZE11TnR5REVj?=
 =?utf-8?B?ZHZXZi9DVUdUOERCb1JYK3JUSHlkeHVVMUd2eEJWemh2TXRwWktEZWV2dmFu?=
 =?utf-8?B?N3d2bEwyR2xmZGdVUHlINW5vR0FGeGFyTVJqTTZNaFJyV21XaHhwbzdmWjhz?=
 =?utf-8?B?UzU0ei94RmJpMk5RekN4YU5xaStIUDFoVzdsb0NsQmJvUHZQbHNRdklhaDZC?=
 =?utf-8?B?eHRqbEtsTWZ4RWx4eGZZRmhYTHZybGdWVVdCQ2pLdHhoTEhTOWkvVmN1d0xG?=
 =?utf-8?Q?kwr2QWkxbmXVE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bddc64a-376a-454f-d7e8-08d951c9801a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 13:13:33.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9NLR0cpz72hr8y93UXSoRfr3b/dBcZOTArZT5r13mvdi+Crvdg0aDSw6f7JeGlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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
Cc: Matthew Brost <matthew.brost@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.21 um 15:08 schrieb Michel Dänzer:
> On 2021-07-28 1:36 p.m., Christian König wrote:
>> Am 27.07.21 um 17:37 schrieb Rob Clark:
>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>
>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
>>>>>>> which the waiter would like to see the fence signalled.
>>>>>>>
>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
>>>>>>> wanted to send this out as an RFC in case I don't have a chance to
>>>>>>> finish the drm/msm part this week.
>>>>>>>
>>>>>>> Original description:
>>>>>>>
>>>>>>> In some cases, like double-buffered rendering, missing vblanks can
>>>>>>> trick the GPU into running at a lower frequence, when really we
>>>>>>> want to be running at a higher frequency to not miss the vblanks
>>>>>>> in the first place.
>>>>>>>
>>>>>>> This is partially inspired by a trick i915 does, but implemented
>>>>>>> via dma-fence for a couple of reasons:
>>>>>>>
>>>>>>> 1) To continue to be able to use the atomic helpers
>>>>>>> 2) To support cases where display and gpu are different drivers
>>>>>>>
>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eYaSOSS5wOngNAd9wufp5eWCx5GtAwo6GkultJgrjmA%3D&amp;reserved=0
>>>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1ZkOzLqbiKSyCixGZ0u7Hd%2Fc1YnUZub%2F%2Fx7RuEclFKg%3D&amp;reserved=0 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
>>>>>>
>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
>>>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
>>>>
>>>>
>>>>> I'd perhaps recommend that wayland compositors, in cases where only a
>>>>> single layer is changing, not try to be clever and just push the
>>>>> update down to the kernel.
>>>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
>>>>
>>>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
>>>>
>>> Well, in the end, there is more than one compositor out there.. and if
>>> some wayland compositors are going this route, they can also implement
>>> the same mechanism in userspace using the sysfs that devfreq exports.
>>>
>>> But it sounds simpler to me for the compositor to have a sort of "game
>>> mode" for fullscreen games.. I'm less worried about UI interactive
>>> workloads, boosting the GPU freq upon sudden activity after a period
>>> of inactivity seems to work reasonably well there.
>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>
>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>
>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>
> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)

Well then let's extend the KMS API instead of hacking together 
workarounds in userspace.

Making such decisions is the responsibility of the kernel and not 
userspace in my opinion.

E.g. we could for example also need to reshuffle BOs so that a BO is 
even scanout able. Userspace can't know about such stuff before hand 
because the memory usage can change at any time.

Regards,
Christian.
