Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7D6FB637
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 20:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3F10E10F;
	Mon,  8 May 2023 18:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A18110E10F;
 Mon,  8 May 2023 18:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2UQ8rcVt5zgB7s3NX+HU6lCohm00Ms8eSl4Aruaz5EqPqkOR80uw1MGVho0rl8C+5iBd+j+Prz5ajjHuDee3x85PvI9fN2M4WW1B50tIgBHGbIMfgUEzHAsLry1tW81DU2pW5w9P0+RGvvBFARSIoFKU4+DTlvLARPfPdsmHNK/NtpPVCJlyyPhKyKBa5uDEg78tFS6bJbTrGLfZTbc5yy3ZblfV3J/gy9S0lR1sX0DS/J05us3v8ZyIrH7RJ+ACcYj4JHyjku1cfwPYe5OfSCti2zPzpoi22uOsJtm5pFVbSAULKXCctWNj0UbCBqNhycMUVkRvX/BVlxPaWKOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P++IWShQZz7x3g1FwySppFEw7cVoKMWEOs+UXoXm0Hs=;
 b=DD4GR1gnJzJktA70h2tZ859PMXbVcXcma5jyT5+fImav+c0K8R57ZvrdqbwSSsX3w2e+/ym22+X3GFAa+LILuGPdl7IruJOTeJ5i1RzhR/Z4d5HO0a2dyr6PY5aChg0iTISvaUZUtzo2Dmu3+RMgdN4vGbwapT0F8MW+0ugWCufzcx4svyDTFg0Wk+fdGCDoYn3r2u994kNN6k1PdLbgmILPVwV5ReqiSNVNcX9D8yTBb6uJ3WKhyHWhTTc0qtTTl/GRsx6uOU2WsKvtLm8dyjRIeaacUgxWrN5FqJ5Eqiq9k7FxGk+hIuqvzkGezHFd+7WnemjDJ9yxS9jdcCJPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P++IWShQZz7x3g1FwySppFEw7cVoKMWEOs+UXoXm0Hs=;
 b=1WsQawKkaRQiUaAOrLOcgZh7mcQEts4ha9FKD1wMaXudxF4INlj/zHYdSqEwLKv4VqEyjAIzE7zkuk1WNzq4vpLtNNnJThmwoKCk9ScaseepBtRjKDqqGDS7WuFOoD0JXAGoZoWgf+6VvaPnw2uhGJ7QqbwPEk/5OXpsgQvh3+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8478.namprd12.prod.outlook.com (2603:10b6:8:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 18:10:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 18:10:51 +0000
Message-ID: <4b7ccbb1-8a5a-3c7f-cb81-bf0cfd75739a@amd.com>
Date: Mon, 8 May 2023 14:10:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
 <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
 <DN4DsX1iIafGb2QiXpToAtyTLkdWlCDgHjsIoC_bq9QN0iEVnuZYRH3AM6ER8AtpT0glLr_CUplpU4V7YEI1_lxcYXGeBdX54cdsO3X7-PY=@emersion.fr>
 <CAKMK7uEk=+YyLJOteDjm6mK315ps=wTsJDY3NZdD_N5vpjL=bw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAKMK7uEk=+YyLJOteDjm6mK315ps=wTsJDY3NZdD_N5vpjL=bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba92c3b-327f-46a1-928f-08db4fef8eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koOGAZdJ6Bvr0FAvt/LuCdZuKDPBqgk3ICwQP944Oy/xgw1u2uvaUz8cqhQGOYVxjJJFfWw6HDio5bqz3ZrnUdFCULPDU8YutvU9Wpuqkjp9NmgZ5jq1ChBVmll/Z/wWOE7AD9eaWOY5H8rm9QVGayzAMoU6+/rf3bFuzXAl4Wq/HCqPEnwd1NIefCP3Cv/ThkScXIsNYInXmQ3TDY+Mh/ZVvnbNmTaififqdkt2SuR/kVIQ4scZN6+w2tWWwU0NWk9dSfMOoSBUpPHd8MMJ4Y6RxhymlZBtX0rXEqrqlMwFqDiIXCR9wDe8WyzyQgdPTbvS2Fu9AWThuZSztcouC8i/PoLhL5Vt1MRUbS0RmPS3k5TPK9Hgm2bYnYI9Ym/RLM7MEMesGbjsTxF50s+gbQTKCvY64SDry6QDKZww0F/MWH/n3Vuejs38Tor1g11ZtnujgGu2YM0ZxmkrbvyOIlVkQWhcRQom4JGeYmUbHjSkGH3U8FULt386mqTbC9rWeTsc+Thmnm/CA6107cNkCiqPNqA3Wc5RgLfSOH1yJfXDc8fb6tx45B/qaD/rLOI1g93rFxjSmPet8T4Akkb5EztychCcU42DEJBzNUssD1CTFS4TDmBLQr0OijHRsmsQEMOwc9sr10RH25MI9hnIAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(31686004)(36756003)(38100700002)(2906002)(7416002)(44832011)(5660300002)(31696002)(316002)(8676002)(86362001)(66946007)(66476007)(8936002)(4326008)(41300700001)(66556008)(83380400001)(186003)(26005)(6506007)(53546011)(6512007)(478600001)(6666004)(2616005)(6486002)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxxNDhDb1JPZUdsYUhSV0RTRzVqZVp5THQrTTFaeDVpZ0VvQW5aK0IxQnpL?=
 =?utf-8?B?Nm1aVWc3T2lBVDROYXRrTjBSeVhNcjBVWldhS2JmcStOcTJVNjB2SUl0dm5S?=
 =?utf-8?B?aG04RUR4SnhIalFYQTZiMmRkUmRHc0FlRjdjT0JiMG1RTXVZYU9TQkRWMXB3?=
 =?utf-8?B?SzdZLzU3ekx6aXJsOVhvN2NMTTNXQ2hVUDBaa2ZrTlBQaGtNakMyVzBaRU9W?=
 =?utf-8?B?TGsrWHhkSHY4M3haUzJrdk5sQklkbVRtM3ZSbUl6d1VNNE1nb3lBOGJDdjdw?=
 =?utf-8?B?QURBNUErMDM0eVdGRXN1MXBFZ3l0a05WOFhkdzltNDcwWmYrRFF2a2RzWTNW?=
 =?utf-8?B?VUhWczQ1WUIzRkpidXRWVmxid0IzSlB2SEpmdlB0Z1gyb2xwNFBFZnRMcDZT?=
 =?utf-8?B?cFZ3TjVORWR0UXIwYjNUNUVJMi93WFc1bjV4T1pSK2RxL3BPcjQyalZqcXpS?=
 =?utf-8?B?Y3Q2aEdBckRkSlRMSHplK3NkZnl6M09JbElabFEzUDBBT09OdHJud3doRDd5?=
 =?utf-8?B?L3lYYVczOHJ1MXV5WWFoS2hOQjdzbnZJUHZQSmFuQ2V4WnlVTk5NeU1RUXl5?=
 =?utf-8?B?UGpyM0tLMGQ1SEpXTlRxQmt6SW9YSkRjOEZSY0l3eTdxSjRFSUkxM0VGMi9L?=
 =?utf-8?B?Tys4YWtDMm81S282Y0c4QlU4U1orVGlEME5xTTlUY3V5RzNpOUUvRFlPSmxB?=
 =?utf-8?B?WFFBWkdFZm5wQXd5ZE8xUUZ0SndFZmFxMS9hclpwb0hmY2wzZDIyY2pwWEdk?=
 =?utf-8?B?TEVBTnd2UGRFbVUvNEIxQ252NGZaVnk0S3lPN09JMUhDRkJBci9MM2RjaC9I?=
 =?utf-8?B?NzFhbFl3dml6M09qczU3dHFWeFFVZXlkS2R6Nm1TK3hCalUyclE4V09YT2lT?=
 =?utf-8?B?R2RHeFdMWVBIYlB1aThxK01pd0h1MzRrSHBqNnhxSDZBYnRIWTZ6SUNadkdX?=
 =?utf-8?B?Ky8rSEh0YWpVL3l1dzgxR3BDM01vcHI3WkNOOTdzalJ0V2J5OWJ4M3lWYmZ4?=
 =?utf-8?B?ZkZIREFzcDVEMDVkdUxVZVZtY3pEWUZJZmxiS3BjbllDTWxwbDdabDlZY0tp?=
 =?utf-8?B?Z1M1OWo4WVVjVXFNenhieGwrUXNTOTZRb0NiMnZkV2F5azVCT1BmdmNPZzI2?=
 =?utf-8?B?cmE5M0p5cFdhUGhvTHZ4UERpR1FyME94Q2pMbW1wQlNMU2s4TENvMFc0aVU2?=
 =?utf-8?B?VlVrYWNmTS9KWWh5WHkyU3ZYQi9KZ0xCK0pqbXBnOTFYeml1UmI2Rnd5bzl1?=
 =?utf-8?B?MTZEUXA4Zm9aYUZnY3AxdjNkcXpHUnRKaWRyR0Y1eWYyNnJZcVdQcExWRFgv?=
 =?utf-8?B?MXZEbGpQQllGcVVQNDhYN2h3VjZOM2t6RUZOUHNPSEdCREV6a3pYV011WHFT?=
 =?utf-8?B?V0tla29ZS3NtQk5qSzltUlh5MjFZb0J5SVkyYjdaRTVVWlRwSmlKUzMzWU1l?=
 =?utf-8?B?UTVkUU5iYWlISGZUYjhuL3RyR2xPWW5URWpUTXpXYTNTTlZqL29iQi9ibFRF?=
 =?utf-8?B?MGl6ZnAwbGdwbjdHQVBKWEdvSGJFQnZMU3FxNkVhbTRaU3hJblA0Tk9Rd2Z2?=
 =?utf-8?B?NmtGZnBrK3VuM3VzWWhrM0tnTFZ3NHdNeTMrMklyazluc0RCSUt3RTZQSXZL?=
 =?utf-8?B?cHQzUGtJUmRFY2tMa2JoTERudklGdHhrTXgzQzZZMjFFTnZXMXQwaW9tL2hh?=
 =?utf-8?B?YVl1NzFDYjltNVZxMHdwdlZBLzcrZ3d4RFVxVXZTend4dk12c2ZSWmxhN2JE?=
 =?utf-8?B?MlpkeWdIMmlkTWVIa2JsTW4xNnNvMmp5UERLeTUvam53QnhLUDU1dHhFWkVu?=
 =?utf-8?B?ZEg4ZWhjM3ZWcWc2MGtZOTV1TThiZDRDcEJnZ2tjS08wdWgvaHJPenkvK0Zz?=
 =?utf-8?B?ZFlwa1BTVFZSSG0vYmRBUTVocWlpL09TUUhvaTdpUWk3ZDFxQ1NaU2c0dENH?=
 =?utf-8?B?QkxBd3YrRGt5L3gvN1ZNNTRLdHQxOWhzczdrZmF6L1BZdU9PaVV0bUFiMXU4?=
 =?utf-8?B?dE9IbEludUFFVEpaamNLd2Y1ejRsSGNUMGdSaDZzOTU4RTlabklHWmJsVWty?=
 =?utf-8?B?RFN4UURDb2NaUUVHR2xJQzFiZzFvRFhGRks3WVN2RFQ5MEsrUC84Yzl3eS9s?=
 =?utf-8?Q?INM6OSSanSRzPhXhF05Hxq3SE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba92c3b-327f-46a1-928f-08db4fef8eab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 18:10:51.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZR+U4+t0gHXKUIQjK2Ip9eQC1ehChPvoBnaLE2kdoxoHwX+I1PhBL10Kb8GTDfP/qx84t0aTkEykZ403tvpEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8478
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/23 05:18, Daniel Vetter wrote:
> On Mon, 8 May 2023 at 10:58, Simon Ser <contact@emersion.fr> wrote:
>>
>> On Friday, May 5th, 2023 at 21:53, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>>> On Fri, May 05, 2023 at 04:06:26PM +0000, Simon Ser wrote:
>>>> On Friday, May 5th, 2023 at 17:28, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>
>>>>> Ok no comments from me on the actual color operations and semantics of all
>>>>> that, because I have simply nothing to bring to that except confusion :-)
>>>>>
>>>>> Some higher level thoughts instead:
>>>>>
>>>>> - I really like that we just go with graph nodes here. I think that was
>>>>>   bound to happen sooner or later with kms (we almost got there with
>>>>>   writeback, and with hindsight maybe should have).
>>>>
>>>> I'd really rather not do graphs here. We only need linked lists as Sebastian
>>>> said. Graphs would significantly add more complexity to this proposal, and
>>>> I don't think that's a good idea unless there is a strong use-case.
>>>
>>> You have a graph, because a graph is just nodes + links. I did _not_
>>> propose a full generic graph structure, the link pointer would be in the
>>> class/type specific structure only. Like how we have the plane->crtc or
>>> connector->crtc links already like that (which already _is_ is full blown
>>> graph).
>>
>> I really don't get why a pointer in a struct makes plane->crtc a full-blown
>> graph. There is only a single parent-child link. A plane has a reference to a
>> CRTC, and nothing more.
>>
>> You could say that anything is a graph. Yes, even an isolated struct somewhere
>> is a graph: one with a single node and no link. But I don't follow what's the
>> point of explaining everything with a graph when we only need a much simpler
>> subset of the concept of graphs?
>>
>> Putting the graph thing aside, what are you suggesting exactly from a concrete
>> uAPI point-of-view? Introducing a new struct type? Would it be a colorop
>> specific struct, or a more generic one? What would be the fields? Why do you
>> think that's necessary and better than the current proposal?
>>
>> My understanding so far is that you're suggesting introducing something like
>> this at the uAPI level:
>>
>>     struct drm_mode_node {
>>         uint32_t id;
>>
>>         uint32_t children_count;
>>         uint32_t *children; // list of child object IDs
>>     };
> 
> Already too much I think
> 
> struct drm_mode_node {
>     struct drm_mode_object base;
>     struct drm_private_obj atomic_base;
>     enum drm_mode_node_enum type;
> };
> 

This would be about as much as we would want for a 'node' struct, for
reasons that others already outlined. In short, a good API for a color
pipeline needs to do a good job communicating the constraints. Hence the
"next" pointer needs to be live in a colorop struct, whether it's a
drm_private_obj or its own thing.

I'm not quite seeing much benefits with a drm_mode_node other than being
able to have a GET_NODE IOCTL instead of a GET_COLOROP, the former being
able to be re-used for future scenarios that might need a "node." I feel
this adds a layer of confusion to the API.

Harry

> The actual graph links would be in the specific type's state
> structure, like they are for everything else. And the limits would be
> on the property type, we probably need a new DRM_MODE_PROP_OBJECT_ENUM
> to make the new limitations work correctly, since the current
> DRM_MODE_PROP_OBJECT only limits to a specific type of object, not an
> explicit list of drm_mode_object.id.
> 
> You might not even need a node subclass for the state stuff, that
> would directly be a drm_color_op_state that only embeds
> drm_private_state.
> 
> Another uapi difference is that the new kms objects would be of type
> DRM_MODE_OBJECT_NODE, and would always have a "class" property.
> 
>> I don't think this is a good idea for multiple reasons. First, this is
>> overkill: we don't need this complexity, and this complexity will make it more
>> difficult to reason about the color pipeline. This is a premature abstraction,
>> one we don't need right now, and one I heaven't heard a potential future
>> use-case for. Sure, one can kill an ant with a sledgehammer if they'd like, but
>> that's not the right tool for the job.
>>
>> Second, this will make user-space miserable. User-space already has a tricky
>> task to achieve to translate its abstract descriptive color pipeline to our
>> proposed simple list of color operations. If we expose a full-blown graph, then
>> the user-space logic will need to handle arbitrary graphs. This will have a
>> significant cost (on implementation and testing), which we will be paying in
>> terms of time spent and in terms of bugs.
> 
> The color op pipeline would still be linear. I did not ask for a non-linear one.
> 
>> Last, this kind of generic "node" struct is at odds with existing KMS object
>> types. So far, KMS objects are concrete like CRTC, connector, plane, etc.
>> "Node" is abstract. This is inconsistent.
> 
> Yeah I think I think we should change that. That's essentially the
> full extend of my proposal. The classes + possible_foo mask approach
> just always felt rather brittle to me (and there's plenty of userspace
> out there to prove that's the case), going more explicit with the
> links with enumerated combos feels better. Plus it should allow
> building a bit cleaner interfaces for drivers to construct the correct
> graphs, because drivers _also_ rather consistently got the entire
> possible_foo mask business wrong.
> 
>> Please let me know whether the above is what you have in mind. If not, please
>> explain what exactly you mean by "graphs" in terms of uAPI, and please explain
>> why we need it and what real-world use-cases it would solve.
> 
> _Way_ too much graph compared to what I'm proposing :-)
> 
> Also I guess what's not clear: This is 100% a bikeshed with no impact
> on the actual color handling pipeline in any semantic way. At all. If
> you think it is, it's not what I mean.
> 
> I guess the misunderstanding started out with me asking for "graph
> nodes" and you thinking "full blown graph structure with mandatory
> flexibility". I really only wanted to bring up the slightly more
> generic "node" think, and you can totally think of them as "list
> nodes" in the context of color op pipelines.
> -Daniel

