Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956078A36D7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 22:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9535F10F858;
	Fri, 12 Apr 2024 20:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PSJdWvrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AB610F85B;
 Fri, 12 Apr 2024 20:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5rLoanEzZgUt5NRVCd9DAZLHxS0sUXgkDsb/6tP4rM4d1eet2u21G1I8jkhWrFdDDanzETWz3rhrdlxMFSC+mc4/xIkTFpZrtk8mFx9Xr5kMgboIN3NK8Iw/ZPWqOKYz6rTVsUfOcR/qinWLzGfAKwA4mwLo/LLKdsxicB9V3anmbUENNS9iPk6IzPmq3EzngDslFfW3bvYdpvD/tUr/pyc+kMFNwKyrRihD5OraS5XUDFSuK22tKj+v+kSb59WL8xGmC82iYAIZmwHWlNFU1xtXFtcPLv90RXVMaJykX2MVG4uRkx1tKiAXM38u+yMgsBWRd4SjIK0mCgQP8He6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDHqW6YYQkJQiLpDdzXsc2fUaxnJFITLQ8CMv0VMSBA=;
 b=e2+wWtCuh4nsi3PCroRtD1Pgx3rM1aegGhuqSZx+M4S6wiV0rVD85DLt9OtiL4COywJhYCJLIcEUyXrAeLbTRGJ0FZA7NV/YT2DKCn/xTqaxz6BOqwU4iaV3m60I70NDIgFBwN8TEWy/L3woA6YcUUq15kNf6kUGfZUugVnlzYQ16rX6zCq4aj6pYU10sCTmodC99Mphreboj4hbQdLFNetO1CVZ0f7S5j7o4T5P6Q96RQtwxmSbonaQKyW2RK7mK7beUMp8RtYG0RCkhU9FLk9+eVtNHEGwKlUWk28j3H2gnxe7hyI0AHpJwX8a0/TdFsVuiPuSpLOA6X+8GOpTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDHqW6YYQkJQiLpDdzXsc2fUaxnJFITLQ8CMv0VMSBA=;
 b=PSJdWvrS0AJLlVXQGzC7g816aOdByKSCCD+IIN3PAg2GGc2I7KVZNhBOjI0btAvUeJ5IAczrnMSWSm274VwUyGYw2Ne45b8MU1GEWWWORyqDfqlM6ZVsz9gVW+YgJ+inTMvsTK7uwjgyh8GHGW1BcBalqEiftcAsg8TJpXWpfc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Fri, 12 Apr 2024 20:14:31 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80%7]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 20:14:30 +0000
Message-ID: <75f2b674-4ad5-4d36-9708-0eea9a9bba6a@amd.com>
Date: Fri, 12 Apr 2024 16:14:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Alex Deucher <alexdeucher@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com> <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
 <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
 <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0313.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::26) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: f850f170-fe7c-464b-4cc8-08dc5b2d2972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ro/dQ8XdffiqsvhrX0qpYOpYablGyXwjcNf5vwKO5LRKK6CdsVdeLGbIIhjuo5HyulSoFHP93OBBJl79dtvJbTavI5e7r3dmKrj7oEySrtQsWg5yVPF/uNtaLJmMJwONOO1oPmxCyIQu7pHXZVxoIX+JQXOcA/QmGhCZAkIG+pDLn4r8uC5ePGVB+S/ZRqKZFqxVDyeYD/ORQL+R3ok6gE7W1YcPnPhJtntQWOuydvIxdM05EiLSoSvzhk3jjtlA1I99dNaIiq5J2YbYmMHQfXjXH05u8Z//V4atvcyHhJbbAAWeoQ/D1/DXlMyc+htSZwS2e9opJFgy31x2UVKKmu2vtBJwNQ8+nYo9RKsyn38nZJkPekhcJ6KVIIb6xB1Sy566tRdSQB4W3ycXNdH2JAFamjQUWU+Mc5jXC3SceIKzDipJojqXiW/oJOVqogKN+9TcF+fJjRiJawjiPercKmHo3956o7GGyIDEZ/z522AbwXtHB5iowsaOgtl7CyPLFymuyWvr/1POhDz8ihbgjkLIsicoKZTRgNZ7hpzP+8q25qgOj9cbXIkN2sHj61ywXUxylcGF8kTaUD+Vu4cnDtX7IiORMSC04oLkzzHolLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lmTDIybEMzdEExVUpWQ2lNUU5kYStCOC8ydVZsMTJrUGRJdC9uRmp6SmJX?=
 =?utf-8?B?dVI1TThvVGIrZk9kSGozR0drbUVxVml6aTZNWk1aSEN0endzY0VCRW5zUmQv?=
 =?utf-8?B?YTBsU2dpU2djYXNwNzR6RXorMVl4NWd2VTByTmNhb21HY2lRd1Y1eWNxVXVN?=
 =?utf-8?B?RStJc1FPRFdzWW53NVZkVU5vc3UyQmY2U2oyUU9xeUFGWE9mVnZuNm5MSDMw?=
 =?utf-8?B?Wi9PVm5Bd25SeHZ5dndHK3VyMm9ndThCeW5BMEMrbHF2YTZjYW9OKzY4WndI?=
 =?utf-8?B?WDhrenRRL0s0R1BueHprcHBncGFxSVZFcUpnaHU4VjRSOG1PQS8vZFdlcjY0?=
 =?utf-8?B?cXBCZjdpMnpobTg2Q2p3ekVnbmxVckxBZnBsWGpyNmVNN0NiQVdtUVBkNURo?=
 =?utf-8?B?RVZ0cjNXQ3V1ME5oSXRsNHViaktRUVY1UkhqNnIyUkFoUEF1R2tjanNjQUEw?=
 =?utf-8?B?dzNwN002eTk2aFUyV1dMeHhuR2lOSW5iSkl3Ull2WWQ2YVZCT1VFSkN5Z05S?=
 =?utf-8?B?c3NOT3BOZi9ZVXF0Si9ZSlFIQzNPYlRXWlh5c1NBcEhPdlUxUU5YVFpUWHdL?=
 =?utf-8?B?UG1LaW9YeGtQREMyUElPRDhnUExIKzdHeEx3MWtSNmJaWStKUzJpd3hGbWxC?=
 =?utf-8?B?VjV4V0ZnUjRUUWJ1UDlNdFlpb0k2djZmYUhnYjBINTZ1SjFvZjJlNGF1dk9N?=
 =?utf-8?B?WHQ4MlN3VjFOWWM1VFQwS1RQRlFGc0xQTXVPb1k5UUhLTnhEL3pRMlpveGhh?=
 =?utf-8?B?Y0I1NC9zSjRqMWNzVGlLc2pqRVFzSmhtSG1za295Y1hXNGYzemFTb1JZR0Vl?=
 =?utf-8?B?Z1pJT0NnSVZLSzZnc3h1WnJqVC9FdjVscEdkU1paZG1EczZwTXlTSHFGZ1Vi?=
 =?utf-8?B?d2pVTzV1U0tGdGlieCsvWFZnQTlTNW5DK0kvYVBJVThnNGJCNzhxd1MyTyti?=
 =?utf-8?B?NXdKdEM1dHVvRk1wakV6STQyTkxFbGE1azU0dmsyR01CTEV5UXpoTEpjanVs?=
 =?utf-8?B?cjA3VjcrbzRCd0VPdFo5L0ZqaDEvNFE3SzFXbGRaMFF5U1VBbGc1anRJWTVr?=
 =?utf-8?B?amEyNDBMV1MvczJ5RDh4QVdBWU96M29QNU40YW9yb0p2K3Npd2V5V0c5cjZG?=
 =?utf-8?B?K3lqNTlUQVZ2bGE4b1o3a3Uxb3ZZaGsyY0pNcEhNSVJ1YnVkK2FDUUd4ZGFs?=
 =?utf-8?B?RmJtZDZXS202cGk4Y0hDR3doWmlMNXZpUzY2YTllMUJJdVFTWXVrMkYzZVpz?=
 =?utf-8?B?QmIvWUwwQldJeEtsMVppWUtmUzZnSS8zdXNBYU90SWlHRVpRQXNEQjFRaXpa?=
 =?utf-8?B?VmlqeFlldVdzWldYcmQ5UVR1OHNncmM3VWh0TFBhTVYzNHBRRmY4MGErSnNT?=
 =?utf-8?B?Z05yNXBDeHpLSmh6ZWJTWnZ4Qmk0YjVoYUljVGwzNzlQSTZhbElBeXZpaVdo?=
 =?utf-8?B?TExLZkZBaCtoN3JDQjdUcHpEMFlmUkRZQ2FYa1VPS1dJUnpIWjA4Um96ejB2?=
 =?utf-8?B?SmE3MklOYmhuNDZsNk1tbU9pM244cFVJcU5KMFp2dWYxMDVpdjFhVnhWbzR0?=
 =?utf-8?B?MUwxNFlwbk1ZTUMzbDdJVC9hVERVQnpJQ1JOUmxUaWZFamNVaHlJNVFGd3lS?=
 =?utf-8?B?aGc3M2lZbnF1MVBJZFdkcDRSeUY4VEN6K0pxOVprVElKbE1yQXF0WElPMG0v?=
 =?utf-8?B?bE9STXBNcEJpQjdSMWwraWU0Qmk1b1JYczdLTU5rTlVESEdDaGNpVnQ1Y3Uw?=
 =?utf-8?B?TXZLcktSM3VEU3BwdW1pNHFEZ2NpUzd2SDlBNUViSVZNTDBCV2ViU0txci9y?=
 =?utf-8?B?OGFJd1N4enhXZmJBTERVRjlSUTZrY1FWTjNzSHF5ODlGVkJLeWJkSVRrZS9M?=
 =?utf-8?B?S1J6V1NhMUZJbStoY2lLS3lnVDRadDdDRlhPdXhTU0tJdUN1SUl0QUttU3B1?=
 =?utf-8?B?elNRVU15WWNZa2Z4NXA0UDN2bnBIVFZsRnFtalkxelJCRUkyeTQweWdCNmc0?=
 =?utf-8?B?RjJGRS9RRGYxS0c0YUphdm1SdGRXY2YySFRWMTFrTWFmUjY5NllTbHE0YnVp?=
 =?utf-8?B?RjhpL3B3Q3RUWkx5eW5iQ0hQS2xsZUFYWFI2MHpkMWVHRDBIRzZJYTFvckNo?=
 =?utf-8?Q?YuD8olF5o5p9VLwEnx1exmjPb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f850f170-fe7c-464b-4cc8-08dc5b2d2972
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 20:14:30.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inFi7+lSrwRlMaSzwxpYY2iGDzSJhPV2mnT5oB7amgb+M4kXYdtkckKvwT+QzRke
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
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



On 2024-04-12 11:31, Alex Deucher wrote:
> On Fri, Apr 12, 2024 at 11:08 AM Pekka Paalanen
> <pekka.paalanen@collabora.com> wrote:
>>
>> On Fri, 12 Apr 2024 10:28:52 -0400
>> Leo Li <sunpeng.li@amd.com> wrote:
>>
>>> On 2024-04-12 04:03, Pekka Paalanen wrote:
>>>> On Thu, 11 Apr 2024 16:33:57 -0400
>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>
>>
>> ...
>>
>>>>> That begs the question of what can be nailed down and what can left to
>>>>> independent implementation. I guess things like which plane should be enabled
>>>>> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
>>>>> can be defined. How to handle atomic test failures could be as well.
>>>>
>>>> What room is there for the interpretation of zpos values?
>>>>
>>>> I thought they are unambiguous already: only the relative numerical
>>>> order matters, and that uniquely defines the KMS plane ordering.
>>>
>>> The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as a way
>>> for vendors to communicate overlay, underlay, or mixed-arrangement support. I
>>> don't think allowing OVERLAYs to be placed under the PRIMARY is currently
>>> documented as a way to support underlay.
>>
>> I always thought it's obvious that the zpos numbers dictate the plane
>> order without any other rules. After all, we have the universal planes
>> concept, where the plane type is only informational to aid heuristics
>> rather than defining anything.
>>
>> Only if the zpos property does not exist, the plane types would come
>> into play.
>>
>> Of course, if there actually exists userspace that fails if zpos allows
>> an overlay type plane to be placed below primary, or fails if primary
>> zpos is not zero, then DRM needs a new client cap.

Right, it wasn't immediately clear to me that the API allowed placement of 
things beneath the PRIMARY. But reading the docs for drm_plane_create_zpos*, 
there's nothing that forbids it.

>>
>>> libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
>>> underlay arrangements will use an OVERLAY for the scanout plane, and the PRIMARY
>>> for the underlay view.
>>
>> That's totally ok. It works, right? Plane type does not matter if the
>> KMS driver accepts the configuration.
>>
>> What is a "scanout plane"? Aren't all KMS planes by definition scanout
>> planes?

Pardon my terminology, I thought the scanout plane was where weston rendered
non-offloadable surfaces to. I guess it's more correct to call it the "render
plane". On weston, it seems to be always assigned to the PRIMARY.


For libliftoff, using OVERLAYs as the render plane and PRIMARY as the underlay
plane would work. But I think keeping the render plane on PRIMARY (a la weston)
makes underlay arrangements easier to allocate, and would be nice to incorporate
into a shared algorithm.

In an underlay arrangement, pushing down an OVERLAY's zpos below the PRIMARY's
zpos is simpler than swapping their surfaces. If such an arrangement fails
atomic_test, we won't have to worry about swapping the surfaces back. Of course,
it's not that we can't keep track of that in the algorithm, but I think it does
make things easier.

It may help with reducing the amount of atomic tests. Assuming that the same DRM
plane provides the same format/color management/transformation support
regardless of it's zpos, we should be able to reasonably expect that changing
it's z-ordering will not cause atomic_test failures (or at least, expect less
causes for failure). In other words, swapping the render plane from the PRIMARY
to an OVERLAY might have more causes for an atomic_test fail, versus changing
their z-ordering. The driver might have to do more things under-the-hood to
provide this consistent behavior, but I think that's the right place for it.
After all, drivers should know more about their hardware's behavior.

The assumption that the PRIMARY has the lowest zpos isn't always true. I
was made aware that the imx8mq platform places all of their OVERLAYS beneath the
PRIMARY. Granted, the KMS code for enabling OVERLAYS is not upstream yet, but it
is available from this thread:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2319898
. I guess this is more of a bad assumption that should be fixed in libliftoff.

>>
>> IOW, if the KMS client understands zpos and can do a proper KMS
>> configuration search, and all planes have zpos property, then there is
>> no need to look at the plane type at all. That is the goal of the
>> universal planes feature.
> 
> The optimal configuration with DCN hardware is using underlays.  E.g.,
> the desktop plane would be at the top and would have holes cut out of
> it for videos or windows that want their own plane.  If you do it the
> other way around, there are lots of limitations.
> 
> Alex

Right, patch 1/2 tries to work around one of these limitations (cursor-on-yuv). 
Others have mentioned we can do the same for scaling.

Thanks,
Leo

> 
>>
>>
>> Thanks,
>> pq
