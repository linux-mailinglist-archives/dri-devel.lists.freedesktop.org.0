Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA75F0C99
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CCE10ECF3;
	Fri, 30 Sep 2022 13:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC9A10E274;
 Fri, 30 Sep 2022 13:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZz1wtP2DmOpqFxvcbwuvklFSYusPTZhTokyJqEVocJv9l/ljMN53kSN2KCFgAzHO/BJT6TomDY5O6YIqX+9rSL20pv0BlkWsH+LhKZ78b0nwLuo5z0xA6a1EPmCJyZTygf91PoT/baxavKhLfeoHbXEItw1GBJ8b1zV/rrJiTbvKJgjebiUPiwe9yLH8grgScBuJSN7oVH7Y4PROumGCe5fin/wW1WmN9CV2eld/6E0rk6eAhQ4lsOMTKTvfbjwQ1ba+/q09eUoq9JZuTj9udmHMRIPVetHBLgTHo6Lw1K22W1PzJBBLr3t3ePhCOGNcvpusUmXzNO/5MFjzpZS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXn9raogH8iUXjN0Ep9rLEtIIeyksMGtTJDSBpxjo4s=;
 b=NaGRFTWtyTrXoSyPgo/e1m4fBtkuegGPF/dOhU5QgsMkl3cm1pkP2MFJ8SnLbbCUzZWjo5jrQA2sLPnmM++MZAnVhf9QwqCm/vET+OCDRmezWI78K+z/EfkEZENfAPgMX1a/jHbE7Gj5gKZ+DjlxuvMqevaNACZpCA7mqnH07LObZ/AKAUUUJ4vp3ab3I9a2pm/AYiTmHKQ09+TOK93QqRmHUIHtLvVGE/vDWcIi5TLb2xZrWkBHwhwNzhqbO21zUOYzi+Z564J+A8LAy91GcILFNgtNKmV2887hGvFUbuYfzaLWDw8gyTbQk+80IQK9xkYebNtOmyOI7pbnEXrpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXn9raogH8iUXjN0Ep9rLEtIIeyksMGtTJDSBpxjo4s=;
 b=BbrqQBQ8+z2fJWcfImKvm8L9tQ2Fx+y2KC+5Sb1cAlhChf9ow83gNtnVXZZG9f7cHBvlDr6W2bIKI7hs+PqDjM6gzPMhYF5WIR3Gogh0No53YvERmXMx6Imd8DagguMdoqfwJ39enn/w2UWH6GtwNgd3ooMLRyZKx5SdIvOXh/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 13:42:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:42:13 +0000
Message-ID: <6e28372e-82a0-bc1d-9585-a089c3232927@amd.com>
Date: Fri, 30 Sep 2022 09:42:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
References: <20220929184307.258331-1-contact@emersion.fr>
From: Harry Wentland <hwentlan@amd.com>
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: baead941-9964-455c-378f-08daa2e99479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxWsXWNPPSEqJHEUG5x4DKQfziuLEEFe2jlwqjFYyIZV4xNCpYtZaCLGEXOpYGvFWorrO3aov1qLAKPy1+udDLLeW4fW69WW0pG+Qk59jgEsepwjyN6I+RZvRZeD2HFVFjsmx++TsB3EdSVkHuZpdI+3wXmXYJgoYF55KKXxLIKw7OTlfv8XizVbWECqhdzgsTOM8+Hn9fCpf1Qxd0l+iwOa3MEFLUJ15CmfyrmLkU/fn9GVmumbNZV7G+zmfmTEoNkdS14qe/5HlsgmmzyLiagINIeB0WpS4yhMrMgLfsNcf9jIh8v1az+g2uHOQmUa6YqU6EuHwnPAlAxVYzETXGQukjqd5pVq2gg3a8XRTRE9CXRlEypiAJ1He2QXp7kWUVxM2gHopRQwOQ9brIY4GJh7BZi6hnBcyuzAky3Agx5kidWDpOxO5trbdq/09y37a1r7fEdZvvO3IjgmuQFApbiW8aNerX6u107WK6b7cmvAGqTLrYmgRWIWwp5WLIE4YgNPjLHv8PTq8DNhKLAYf73hM4datZzZV8wJ/G1V91lm23DpHsONbMf1knLzeQA9hLK2eM1ei6xF7/jJuRkDZ7NtuEZwN5xli+jhGdchxLsXQpb5a8wnZiQ6xKTO345mXb+d4N74bx2C8uysAPgoxjuuk74SEUJYiKNaAiGpIHafm8c0K8ifRkUROIrdMVQWkhw5Dodt7+HgZgs7XpHERbQrvgLOhfvDLqsUlZklzrDBEeIh/tLHIbniCYNPKW4WP6PDHdpDnXNyvLF0vFPP+baVCgDGmtQvrg5maCTNrGlb47NkTWVKn088cX43kD4RgfqFqQ6xp78eTnPEezw+kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(4326008)(66556008)(316002)(478600001)(66946007)(45080400002)(66476007)(8676002)(6486002)(31686004)(6666004)(6506007)(8936002)(41300700001)(966005)(53546011)(5660300002)(6512007)(26005)(36756003)(83380400001)(2616005)(38100700002)(186003)(2906002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUoySHFQQk01ZHl6YmdPM1Z0bmxtTFNQZG5WZzRHWTFud1ZIRDNqaThyd2F2?=
 =?utf-8?B?d0duVG5nR01TU0hQSWgyVWZtN0ZlQkJMZ0c5MDVVd0R3ck8xUjhlTDlEbUtL?=
 =?utf-8?B?WmdmT0dFNXlYUUJaVFFGbHY2YWh4RE4veHM0WXduNFphM2tKREIrRmdKU01t?=
 =?utf-8?B?YTVvUnVwL2dER1ZzUXA5d2FldXl5cU0wKzZjOUpTN3pEZWg3V1c1OUpJSDNM?=
 =?utf-8?B?RDhyS1ZtYkpyTlZWV2txdk9NMDNuanR2RFNCVHhRR1l0QWJpQXdMUjVCSjZX?=
 =?utf-8?B?ZkYrWHk5T281OTd1eFhaRFpBTWs0NVhiVG5zVC82YkwyaHVqd0N1N0o3L2NR?=
 =?utf-8?B?N2hyaTcvM2FXVW9uamdlenltT1ViMEZ0SkROTlZoZXkxTlNoYUN2T2F5aW8v?=
 =?utf-8?B?RDRDVFRLQnVOYno3MzVxRFdxUE9XY1JGNlcyV0l1dHVtazNmR1BKek1vZjNr?=
 =?utf-8?B?UDdEd0ovK1krMUJlNmNsT2hiZVVPT3ZLNmF0T01OaEJtUDE2QmdGUmVOOXF4?=
 =?utf-8?B?bU5iNWRraWpYK0dJd2x6WkwzaDl1Zk83NVcxcG9IclQ5Yk9LOXRnc3IrNThB?=
 =?utf-8?B?NFIwenpnclo2ZCtubjNEY0JJTjdubjR5ekdLM0JocloyazVqUHRxZmQxaHda?=
 =?utf-8?B?R09zaVRHVnk4R1ovZGZPRzRoS2V6cEN4KzRvc09PVCtyYURyR3NLN3JlWTZt?=
 =?utf-8?B?ajFVbWtCUUJSSndJNjgwL05LdllMb004UEloUWpObTJxMFpNSFVEQnhZbGhV?=
 =?utf-8?B?NjF5SzlGaWcxWGFvZzc2bGc5QjFSVzZJNFRlbWZTUHFIdjBLdTluSGU5Sktq?=
 =?utf-8?B?R0svOW1XZFkvK3hkY2ZYdUs3a1UwaTdKc21TclhBeW54OWNFcWRTODRHUG00?=
 =?utf-8?B?SXN3N0g0Z3kzWHJWNmJyWGw4WVJWc0ZTUU9xejNMRzdtY3Z3TVl6L2xGUHlu?=
 =?utf-8?B?ZTl6Yk1kOE9xbW1OM2xKWEdPK0N1b3hhNjFzL1QwMjluSW95NUlUZnpyalhv?=
 =?utf-8?B?RC9tZTRYK0I5dTdnOVVzTTlwcVRmYlNuNUt6NjNGSU52YTltc3Rqcks0ZWg4?=
 =?utf-8?B?ZWd5YmdPOEpQYkNjOTd4VXZqRVZHT2hsSnhQTlk2UGF2cEtiNVJJOFJqcER4?=
 =?utf-8?B?SXdzOVZXM1R1Q2VkMk9CaWE0WDNwaWxPQjhuTSszZXIrRzFKbGE3eVZIOU8w?=
 =?utf-8?B?UndpM1A5NEJrbG9rZElnU2tORG05MkpFUVFwZHExL3lBNVRYVWxsREgrdDN3?=
 =?utf-8?B?bGtSQzcwVkw5bDVQT0Y4Y21VMFp6SmRuZE9Wd0pCalhhdXJhOVVMSWt3L3FB?=
 =?utf-8?B?OVhhd0pURWJ3bGRYTUI2YVZLVWFiUWw1azg4UEdKT280V2J4dVNxU0RMb3N4?=
 =?utf-8?B?Rjh5OFZzUG5MRjNIbG5FSVpMWXk2R2M1aGtqSEJ4V3E5OWRUR1crTVBMemk0?=
 =?utf-8?B?aTNuUm9NYlpaODZtL3NHaTNNRVZ2NytrTSs0NGhQTlYyckpDRXd1bzhVZXRH?=
 =?utf-8?B?Z040bUNaRXJROENoWUdCL1R2UWdpaVRrZ01uT3FBK0ZDcTh3VzBaQllTdllJ?=
 =?utf-8?B?VzFvS20zSmZBdHVjeHlmNVlsQldxd2RCamM4SXMyRi9ldnpOOFkxVCtvNXd4?=
 =?utf-8?B?SUZJS09wRFRrN0NXMTRBUHQvclBVcGxWK2N5empxbWkzOGVhWFBxOVNIWFh2?=
 =?utf-8?B?K2JvT0JGd0lOY2pSS3ZBNjYwSE5sYno5alpKcllKUEhjM1pFVEQ3UDlXSEVo?=
 =?utf-8?B?RklJT1JzeE1oM1lkWWNkY0d4R1JCQWZ4VldqVDh2ckRtQ21OM1YyWEF2UUNU?=
 =?utf-8?B?TlIyYWEzd2tVU1Yza0hhZ0Yvdmx1YUlMcktzNFpScUdnUEJva1huUmlDU2pp?=
 =?utf-8?B?SksrWWY3RUpzQk40S2NVS3d3dTRlRkhlcElrNkNQS3NFZGVyVXdlVUhsNjBV?=
 =?utf-8?B?U2RmYllUL2xRaFRicml5WSs5VnBubHlEamNGYVdpMlNoYTRyZnlvQ1Z0Qk92?=
 =?utf-8?B?QWRHaVNlWml5SmFENmhsL2F0Y1l3UmhFb25JZkxPNTJUZ2ZCZ2FDc0RsQyto?=
 =?utf-8?B?TUovamkrbGdGR0JYQ3Yvakxxa050RHFjbTYwZEYzTk5ySG1Rb0VNdms5V00r?=
 =?utf-8?Q?7qj6z7IFZwBdqwnjNKHnSF3AH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baead941-9964-455c-378f-08daa2e99479
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:42:13.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +euvX9yHVb//sEOHkWO7piDF2oFnFusWhGlo7kf9YVKEARMKNlPEJBJjDiMCgVEcwSycJVnlvF+2YXYc+vIuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch, mwen@igalia.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/29/22 14:43, Simon Ser wrote:
> This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> commits, aka. "immediate flip" (which might result in tearing).
> The feature was only available via the legacy uAPI, however for
> gaming use-cases it may be desirable to enable it via the atomic
> uAPI too.
> 
> - Patchwork: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F107683%2F&amp;data=05%7C01%7CHarry.Wentland%40amd.com%7Cac97e739abd04e7d3f9c08daa24a7de9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638000738084626501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=J3DbO0agtOXfEt0XNA%2FKvmSLmJrFPW048T214BSl4dA%3D&amp;reserved=0
> - User-space patch: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FPlagman%2Fgamescope%2Fpull%2F595&amp;data=05%7C01%7CHarry.Wentland%40amd.com%7Cac97e739abd04e7d3f9c08daa24a7de9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638000738084626501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6vJftf%2Bl5h4vR3ANZKWw9AhghZpPhAcHdXR5EI8Xwrs%3D&amp;reserved=0
> - IGT patch: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F107681%2F&amp;data=05%7C01%7CHarry.Wentland%40amd.com%7Cac97e739abd04e7d3f9c08daa24a7de9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638000738084626501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=hOJssKhjj39wIHkrd%2FEI8csLvpZDoENbakqqkN%2F22O8%3D&amp;reserved=0
> 
> Main changes in v2: add docs, fail atomic commit if async flip isn't
> possible.
> 
> Changes in v3: add a note in the documentation about Intel hardware,
> add R-b tags.
> 
> Tested on an AMD Picasso iGPU (Simon) and an AMD Vangogh GPU (André).
> 
> Simon Ser (6):
>   drm: document DRM_MODE_PAGE_FLIP_ASYNC
>   amd/display: only accept async flips for fast updates
>   drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
>   drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>   drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
>   amd/display: indicate support for atomic async page-flips on DC
> 

Finally had a chance to go through this. Series looks good
and is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 10 +++++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 28 +++++++++++++++++--
>  drivers/gpu/drm/drm_ioctl.c                   |  5 ++++
>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  1 +
>  include/drm/drm_mode_config.h                 | 11 ++++++++
>  include/uapi/drm/drm.h                        | 10 ++++++-
>  include/uapi/drm/drm_mode.h                   | 16 +++++++++++
>  11 files changed, 88 insertions(+), 4 deletions(-)
> 
