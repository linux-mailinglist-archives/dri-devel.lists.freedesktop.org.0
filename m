Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161F409ED9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5626E270;
	Mon, 13 Sep 2021 21:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26D46E25A;
 Mon, 13 Sep 2021 21:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA6KpH2M3b95W0Ykikq45/WnprVI7crAGtabPrHy87W9DxaJWDDANrqFSr5fVtE+D7OBte3GOkjrlV9dv3Ta9o/2myMealKXs9iCNK9OiJnOmp3TYN9P5MKEOqIYSpOG4ruV9Rzn60Ytsqgj8GNJQA6HJnZ+A3TAmET8C3ZIanOdog9z+uLUdKAdN5Nb70j/VD7TecLUJ7JP6SnCqeYhOG2G3luKlRTtvAj35T88GfBZ6NOIK+i1rY0EETOxXiVJGR5Lg/9pm8tMihcY+tt8BE3NalEpYa4RldCBmfwY2sjwCl9rQVJJLVi9cQwjnpNWrQZVznmjP7EFzC3TWh+klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8O18j0m8Faol+di/BWZ5ROzHb4HarPkahOYf2N16BaM=;
 b=Jm7ugU18oxq3eWO9ZV9Ayymz2v0IEvDzxfA6gdVBawjnYRuwOPkXJrDTnevf0QhJFlLOjMk0ClL/vwaV4/nNhv+yjFWkL/Xjt49agdzoJLDkRYSsmEYjSCu9MR5P8MlwQuVqqz5l3m85RwHlv76y+ogVYIhMH05ccFwUiYGC2KNGhloVAIHyIZVBT6EcN1MxD0CAM0hbOAgI0qTo+lixP52ygNkJTiEZTCxHuAP4Uf8XaULUA4S8A1mimQRRvkUSA7zrM7S0ZhbEA58GmTAVOCgiC8ZDqzKW8bLclcU1iD1Chk8cBHROVg3De6KP59KjjFKXnEVEvMugcOfYEr9Ftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O18j0m8Faol+di/BWZ5ROzHb4HarPkahOYf2N16BaM=;
 b=B9Y8zv7uYaRO9igF+ouAOKsowzAeX4ZdgStTyIRE02swDWw6zEmfoMnbFANU6zwdeHJPqcu37fFBQPkN3NEhLgcoVgFtSNuJ+T13iTPVEGPJOnvV3JnZpX2ugdiPooO3Ebwl9QKAcsDRSj7M2FhkpadPCYMw9AKpRAkFu/qlQJc=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Mon, 13 Sep
 2021 21:08:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 21:08:36 +0000
Subject: Re: [PATCH 00/14] drm/hdcp: Pull HDCP auth/exchange/check into
To: Sean Paul <sean@poorly.run>, Alex Deucher <alexdeucher@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>
References: <20210913175747.47456-1-sean@poorly.run>
 <CADnq5_OA=Hz-DOj6X-wnZwsk+wU924rHxCKOCepsMfbdFGasQw@mail.gmail.com>
 <CAMavQK+BJqSmxFCPvTJKpt1VTaY=KeQPw-VwGYM8mQQU4TS=Wg@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <e74888d0-7b08-01fb-6ebd-dc138617f171@amd.com>
Date: Mon, 13 Sep 2021 17:08:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAMavQK+BJqSmxFCPvTJKpt1VTaY=KeQPw-VwGYM8mQQU4TS=Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::14)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.3] (198.200.67.104) by
 YQBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 21:08:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d68831-840e-4c38-bd62-08d976faa6b3
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-Microsoft-Antispam-PRVS: <CO6PR12MB539665AC125FEDCAC6889F188CD99@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TC8E3Z/DyHeR/kORqtw+7M7S+2Te3p3U7uSrHNLJOdprQJMZ8Npw+iKfLmiT8DybIPUq9dbdmVTA8R3Sd1zTbOeeWt7uNx7gmUJ53m35rouHE77zR/dSUeDVxJROwEOO7y4qrZVAx0vfcN/gCDjJaqgf9/pqzQbwAie38m6qIPbp58c9y1IX81oVh5xcmnx7PdH8WRKfdEDBTvrcN8guWxj3R4bHwo6wGm3otHtI62hDQlqJm3Moc2n/Br8YdOdM6VhcAgN54acxb23tQNL11CFGD1wIRxD7gizTmO/6Kcr4HLsA+b+1sghhAD3DlaC3rzffo/Aeu8SENqnD1wvh1D5NLL3zteC9ptpHDebQEpcob4u311qRcJ31jQ/cf82Mvj1YpuB/9NPcjGD1kIGRdhcN96j3tCpRfugN+SXq09e3lsxsoh04vXFM2MQWoF9Jbn0/jgarfq9oFzqmmGt3EpKaNxJN7FO23+jobKAEF5noynbiDMmgAFengRQbQJXHYuQiAkXU7yoNkxf9yzYUFwWl2n5hQulTd1eb3QkYQ8VE7Fa7HHQoWHhewVOoptuLWM6C0Jkzel3XttWREkoJnCzeeNQ62U3nJlqW9wNwfCMntU18BEnNeqqxpVNxhxAMQ1YKMr1hDDNLMnsEkA89SB4dhySLt96mqziH/zhnIYY33RRcFC2jLF/zQA8k4dxBX/lStLaH1eLphJYKToBbFNwPtmDRlEeawIFs08atzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(38100700002)(26005)(110136005)(5660300002)(66476007)(16576012)(316002)(54906003)(186003)(66556008)(2906002)(86362001)(44832011)(6486002)(31686004)(4326008)(31696002)(8676002)(956004)(8936002)(83380400001)(66946007)(36756003)(6666004)(2616005)(478600001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFIR3Y4Mm5YS1llcWpIYnpmdEZaV1FkZCtRTUVKakxWbmdJNXRuR1YvT2VT?=
 =?utf-8?B?T2lWd211UFhRNDArOENsb3dDNmZNQmNjY0JyZ0RvMVFxY0dXQUNyY3NXV25I?=
 =?utf-8?B?VTNKNFdZQmlSSGZHYmZPelBVd0VYb2pkUVR2RWNuMmRQSms0Nyt1MUxaUnp0?=
 =?utf-8?B?b3VMM2tCT2gvdUV4M2VOREFJNXh2NkNOQk9kbHRMaGNCbWNEdWI3bExwNnFj?=
 =?utf-8?B?cklHYWRNQTVvVG1kT3BFYmVQM2M0QzZoZkpVSTc4MEZqSWZBMVB1cVArc2dB?=
 =?utf-8?B?ZHF6UzVFbm5uVjZqTWxqZ0Iwa2hMZXRhTzZlQkVkK25YRkpTOFQrUEpaM3hJ?=
 =?utf-8?B?QjFmQ1doS2ozenpNaThrYk5oWDNJQk1ORWxsMmhwOENMejRXVFNzSU9vamFG?=
 =?utf-8?B?cDdwN1lPVnpLOE9NM3BhNXN2TjNWMS9MVFBaeEhYNFh0WEpiaUhjVUdzeWlS?=
 =?utf-8?B?MjQ4VndIVnh0WTdPRmdGcDQvNGN2RDREb3VVSnZRam1uSS9LOWdndTRsM1lh?=
 =?utf-8?B?V1pIYWlyNEEwYm5RdXBVNmg4Z2lKbm0rUjZTMlVZall3SzFacVgvVDBmUXBm?=
 =?utf-8?B?K3Y5d3lGRkdPeUg1TzdaSUV5YzJDM2ltbERVL0V5R2YwcUNpTjlzYTA1RzIz?=
 =?utf-8?B?SHR4NEFUVHM3dm5hdTF0a2hnL1hNR2k3d3BlWlFVYlB1RnhNbDgvYjBQdkw5?=
 =?utf-8?B?R0VOY1d2MEhVaHZ6TDJScXNSQkVJMWxqdHNIV0grc1pIWUtXQkVyWDhHR3pz?=
 =?utf-8?B?d2RMZXFENFJoaVZDRlhxNDR0bmQzQWpzSnB6MmhsaTJoalVpeUJFdWY1MmRO?=
 =?utf-8?B?clB5YlQ3bmNNamY3Q2dzNnpMQm9aMW1NaHlVTEJNZWtuTEd6cHorcElMTVhx?=
 =?utf-8?B?K1ZxSnBzaHNWaGZ0aDBQTStHSTZ2aUlsSkZqZnpraHlpOVdGNzE2Tk5CdU1x?=
 =?utf-8?B?WHJWdzRtQzMxQTAzMVV6MXVwSlVDbGRiaWxSMklINVQ5cVpNbnZiV0YwZkJk?=
 =?utf-8?B?RU8vMVdBU09UTk5oRE1ibVloRDFQa0V0RmwyY01TVGZBYkNSMHlxenk5OW13?=
 =?utf-8?B?OHVrckI1NW5DY1V5OEtOV01OZmxNUVNvR1BJYm1rK1JmSmJjU1h5SG5Pemlz?=
 =?utf-8?B?QlQ2N3FkbjhEZzM1Y2tKa08zK1lCQ3RSa2ZqY3NaQTRuNVlyRlkweXZndnp4?=
 =?utf-8?B?NnlmMTRBWDJQalpJVlp5TVBsMUpWUGFQZnBBSnBlK21NTzlvRmkxaFRvMng1?=
 =?utf-8?B?MVJDcGJsMCt0cnZmVUlKdmJUZjNLMUREejBkYU9USlpqMHJBeTI5OWdDWE9N?=
 =?utf-8?B?VWFlSVQ2RjRMNnN4b1hBejFMakw0N3V0TlVucmpSV0Zxa0R3czZkTmtESUY0?=
 =?utf-8?B?WkVNdmhnRWRwa1dXcEZPUTZJaEYzdjNKZTJUcDJHYTducUJieG01c05qcWVK?=
 =?utf-8?B?TkVkUWFVbXRPc01ySGFLb0xIUXNzVkZmYk1sdVhRT3ZsVXVnRGFoaUdrWVVZ?=
 =?utf-8?B?dlhvTy90ZXFlNkgxRmQ0MUtzM2N0Y2FqYW5PN1pRT1EzZFl1VjdvSGYzMnNo?=
 =?utf-8?B?cDRoNjVnb3lWMy80bWhTUCthbldlZ1lzUGhEYlFHVi9wZTZBRVZEWUVhcktK?=
 =?utf-8?B?OGtxT04raldGRmF3WGxaZ0p0aDFldXZiakVpQWh1WU5KelZxbkh5cVR4a0pQ?=
 =?utf-8?B?THpZQit0SExham1HdGVJZWdsMmxGNENCUmpzbmE5bUhLeDlvNG5PTVc3eE0r?=
 =?utf-8?Q?HzFxvI7VyiwHCPRa7N7HPqcGTzQAQXVVID+jwtk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d68831-840e-4c38-bd62-08d976faa6b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 21:08:36.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjYsfQ2w6AA5+jqxoKJRnRWQ3NoyRZ6b/dF2eAOLu31pxgSPXpjuHNGVIqd2zivqV7CYZgUoVMgeGsOS2GiQjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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



On 2021-09-13 3:26 p.m., Sean Paul wrote:
> On Mon, Sep 13, 2021 at 2:05 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Mon, Sep 13, 2021 at 1:57 PM Sean Paul <sean@poorly.run> wrote:
>>>
>>> From: Sean Paul <seanpaul@chromium.org>
>>>
>>> Hello,
>>> This patchset pulls the HDCP protocol auth/exchange/check logic out from
>>> i915 into a HDCP helper library which drivers can use to implement the
>>> proper protocol and UAPI interactions for achieving HDCP.
>>>
>>> Originally this was all stuffed into i915 since it was the only driver
>>> supporting HDCP. Over the last while I've been working on HDCP support
>>> in the msm driver and have identified the parts which can/should be
>>> shared between drivers and the parts which are hw-specific.
>>>
>>> We can generalize all of the sink interactions in the helper as well as
>>> state handling and link checks. This tends to be the trickiest part of
>>> adding HDCP support, since the property state and locking is a bit of a
>>> nightmare. The driver need only implement the more mechanical display
>>> controller register accesses.
>>>
>>> The first third of the pachset is establishing the helpers, the next
>>> third is converting the i915 driver to use the helpers, and the last
>>> third is the msm driver implementation.
>>>
>>> I've left out HDCP 2.x support, since we still only have i915 as the
>>> reference implementation and I'm not super comfortable speculating on
>>> which parts are platform independent.
>>
>> FWIW, amdgpu has support for both HDCP 1.x and 2.x
>>
> 
> Thanks Alex, I knew this and neglected to mention it, apologies for
> the omission.
> 
> IIRC amdgpu is much less hands-on than i915/msm, with PSP doing most
> of the heavy lifting. There's probably some value in using the helpers
> since it'll handle the state transitions in a consistent manner, do
> you think this is something you can use?
> 

We might be able to use drm_hdcp_atomic_check but the HDCP protocol
stuff is sitting in our hdcp module and shared with other OSes so
sharing it would be difficult.

Harry

> Sean
> 
> 
>> Alex
>>
>>>
>>> Please take a look,
>>>
>>> Sean
>>>
>>> Sean Paul (14):
>>>   drm/hdcp: Add drm_hdcp_atomic_check()
>>>   drm/hdcp: Avoid changing crtc state in hdcp atomic check
>>>   drm/hdcp: Update property value on content type and user changes
>>>   drm/hdcp: Expand HDCP helper library for enable/disable/check
>>>   drm/i915/hdcp: Consolidate HDCP setup/state cache
>>>   drm/i915/hdcp: Retain hdcp_capable return codes
>>>   drm/i915/hdcp: Use HDCP helpers for i915
>>>   drm/msm/dpu_kms: Re-order dpu includes
>>>   drm/msm/dpu: Remove useless checks in dpu_encoder
>>>   drm/msm/dpu: Remove encoder->enable() hack
>>>   drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
>>>   dt-bindings: msm/dp: Add bindings for HDCP registers
>>>   drm/msm: Add hdcp register ranges to sc7180 device tree
>>>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>>>
>>>  .../bindings/display/msm/dp-controller.yaml   |   11 +-
>>>  drivers/gpu/drm/drm_hdcp.c                    | 1198 ++++++++++++++++-
>>>  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>>>  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>>>  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>>>  .../drm/i915/display/intel_display_types.h    |   58 +-
>>>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  341 ++---
>>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>>>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>>>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   35 +-
>>>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>>>  drivers/gpu/drm/msm/Makefile                  |    1 +
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
>>>  drivers/gpu/drm/msm/dp/dp_debug.c             |   49 +-
>>>  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>>>  drivers/gpu/drm/msm/dp/dp_display.c           |   47 +-
>>>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>>>  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>>>  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>>>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  433 ++++++
>>>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>>>  drivers/gpu/drm/msm/dp/dp_parser.c            |   30 +-
>>>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>>>  drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
>>>  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>>>  include/drm/drm_hdcp.h                        |  194 +++
>>>  29 files changed, 2570 insertions(+), 1385 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
>>>
>>> --
>>> Sean Paul, Software Engineer, Google / Chromium OS
>>>

