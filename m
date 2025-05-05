Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36154AA91FD
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339B10E3D0;
	Mon,  5 May 2025 11:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CK0+CLYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7E210E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPWwEXngIZh/W6sXhCF1cT2EAuy3d09ZcdVp/hUCQV+LkmZt2AxKjVlI8wzNU9ZsSER9YfgFhtT5LDQRliVwZMMnLUU5eAfJSKoaQBaMkfe9sviJz/9LVA+7OFlAhnT9m7wQf2oRwj47kDsFW/EhTfqVJyPXiPgvW7r9ndTVkW+sL0toHwfbJ+KRAKZq6xOF4dKWVfjWuQgyW3e9QX8xCIWgyOoO9atuICmgJP4hOYAaKi5R3bNUAAlopS3YkdWJyQtxaFcvE50N15O3oFt3ETtR07ONxp1NXUOxzkbbuR7U2VtX8NT0Eazm/oKNP6QV6IaR5qO46cG4ikf4yzRcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwHzybobdljY26EWpIbjJVvOUSuUlgJOImLxl/59jHA=;
 b=ruuD26lzQef/llaJQT6JfMcd3xyCg/BjWQVV846cUzVkF12rN3HFRLRmstmyKsp9DTYfgLHMKOz56LaW2v4iz6ZkFBUtCsY+z3bDdzuYJThJUHeAoP5/nMpMRUYofZ9JH4CGttxlEQvQHQqmZdypj+ZO/Li6uals9PHiX+6F1V/JbbVyOclkigT19UIvW7gjUwxlUWO1sXk5RQy2Wbq4LNZNQLu+seFXoSGeOGWhnNOBnbj9K0NEeHfykpHyX9YTxjfZvn7yl6zIokapsosrU4BM+o46E8Xtr2jZgtKhu+xQ680iAyuePKyAek+O+lhPiNodEqVpI1zYsCpoHjT1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwHzybobdljY26EWpIbjJVvOUSuUlgJOImLxl/59jHA=;
 b=CK0+CLYyswihEBpSD0aBpfVkIqbOMiiJvmB/JWD65iOpQeDLmDOlz7oi58ZURk6gSKna347UD/4YrZfhW7whbNBuY+wpUOg6u5BuNCm0QnnPRsEPj5pew0iafkwdGRIK/zz65yvTcQ1834g1iiNSdXXrS05Mw9po8RZHrjDuKrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 11:25:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 11:25:11 +0000
Message-ID: <8e4f60ec-caa8-431a-88f8-aee8183d96e5@amd.com>
Date: Mon, 5 May 2025 13:25:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong1025@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250501064324.398650-1-oushixiong1025@163.com>
 <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: e07e2c2b-9659-4ba1-1d98-08dd8bc77f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVRqMmNZbjZuTG5qejVCL2hVdUUvUUlGQ3d0SFNjdFI0cGJYNURSTWlKSStt?=
 =?utf-8?B?eGZERDRTSE5TRzRYaGJjVEpNNVZza0E1Q3dITkNyaWdrRjY5cDU3MVd2VlNz?=
 =?utf-8?B?S05WSjhoakxiem9vdHVMeEVWUFhnQkhRVEx6OXh0NzN6MDhOOGd1Y2EyWnJt?=
 =?utf-8?B?OGZ5OEtOVnIrbFVudVB3Y1ZCM251LzlpeXZRMjJjUmVmYVpPTytrVXo4dEpY?=
 =?utf-8?B?azJPcEJDWkNxSkZvMC9BcTFkTm5FT3F6YjZETm5IbHVwc25Qd01vb2Zsb0s2?=
 =?utf-8?B?clhobDRlUkNHZUFwVUR1dmVQZk5EaG53YVJwQjZmKzEvei9ZeFJTWWw0elNC?=
 =?utf-8?B?WUVSa2F2bmJOQnJsMzNUK0RQMytvVWhxbGpCTE9vdFl1cVdyb29XUlhMcUxn?=
 =?utf-8?B?ZGxaRy81amFvNlBZeFRvMDBvNWxNL1FPZ0UvZnRKVmRUOEZNbE9pbGdURXFV?=
 =?utf-8?B?bjJWaFJZeGJqT0NkQTdHTE4xN1BYOVZHbkNIR1JCMlBxWUVhamVjQXJWeExY?=
 =?utf-8?B?VGUzMTZMcXl6NjFtSU1ZanFVd01tdk15RWp4Q3o0ekJXZkw2ZEN2QURTWlNV?=
 =?utf-8?B?dXRraGp3RXc5Vm00RUVGVlhpNUtCV1FNSHdqRDVEMDcxQVlkM2syTkE1V1VZ?=
 =?utf-8?B?MkwweVA4bVJONnhHK2hya1p3ZGNlcHJvcEhLNm8xSm1lREVSWGNkcklxVWFl?=
 =?utf-8?B?ckVtNzdKb0t3bjBUN0pFVHdnSGZuVDdEejJ3Mk12REs1eDlYMFV4eXJnVmsz?=
 =?utf-8?B?TUREQjMzU3NEVFZCNnl1WGgvcG1sL3ordldNWHh3b0xwanF1cW94VjRiWlRp?=
 =?utf-8?B?YklpeVZiMUczMmpKenVDeVlmb3p1L2kxbk9yeWxxV2xoSlU5ZzlMVTVxN2NN?=
 =?utf-8?B?YUpsRGRFclpCbkNlTGZJNCs3QjZNaW9tZExqR2krdUVvMU9DaHZwYks4YnZn?=
 =?utf-8?B?Z0NsWk1qQXk0bWZhL0g4V3pVd3NqQmNqempIakVKNkd6b2M1WUNvbXZJM2U4?=
 =?utf-8?B?LzNTdTFJaU1JVVVHdEl4a3FXbkFKVERXU3g4VzlxcGtNL0ZDdTZFZVo4akR1?=
 =?utf-8?B?MFBwVjc3RzlkMENoT1c5Wlpac3pVNlV2Z25nV2JsNkJ2S2d1dXhjdTBQVUNE?=
 =?utf-8?B?cHl6N0xTQlpDQUJjMEV0VnFIcmJKNWlpcCtFZ0UvN0E4WmxzbFVzY2tURTFS?=
 =?utf-8?B?YktybkNvOFFSMHF6ZzV0b251N25rY1k4WlV4UktITEZkb3Q0ejc4OGREamYx?=
 =?utf-8?B?WHc0c1g3eGsvQmpYWlAxaXlUTTJrdU5vcGtYeTlhRjZFZEkvZTNZcGsySTY5?=
 =?utf-8?B?U0pJbmVrQ1ZoeWphMTdlNVZXWEFQMmU4ZmtlNVppR1VLLzdEMVd4cmhXSTFp?=
 =?utf-8?B?N21KYW5FR2Rkd3pvZURQUCt1U3llOHlFMXN0cDVTb0RDajluWHBKOG14MFpH?=
 =?utf-8?B?QXNUU1pNYmFFVFh5eUQxLzhNbEJETXJYQjZNOTY4UzlIbGFVM2FUeTlOSG1H?=
 =?utf-8?B?MVM3bGZQSk5tYklCVFRwOVIvVy9ObGJVNXZsKzd0cDljV2k0Z0tVYUpPVkZh?=
 =?utf-8?B?RWJ0dE9hVnJzWkhPcTJCZkR0aDI5WWJGZDdpaE9pVElBSU84YUNRY1BkUVVi?=
 =?utf-8?B?MG9vd0JHTWFhK1VqSVFhKzRsTDBYT0tkYi8zc3BJcHpieGdpVjhTMTZwdU84?=
 =?utf-8?B?NHNoNi9pNnlZb1BGeUk4OHdkVWI0eVp5cjM0M3ZHZmJEVnRQQ24vRUhwUzd3?=
 =?utf-8?B?SG95N2ZCT1Azb0hrR3FNbWYyMWNUSFh0NE53dVVXU2FjTUpzdWNFSk9BR0hu?=
 =?utf-8?B?YkdBeHJ0ZGhFeFE4ZkVZVERGZVZTaklMYVpod2I1a2taVFYrRzBGeTlHczVX?=
 =?utf-8?B?ZC95Sk4xWlhKT3JQeXBSeG92TWtNeW54bG5NMXQxdzM5MmFYWnFnTUExOXBQ?=
 =?utf-8?Q?fywHd/avIlo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEQzZ09KM2F5Z1NvOWUwalNCUTU2d0J6VFoySHUrQXdVa0RlS1pCOGVYcElx?=
 =?utf-8?B?QWhRdHh2MWlRNzdnUmRIMnBaMkFBYkN5SkFQc2JyTkNBRjNPUm9ZQk5Wd1A4?=
 =?utf-8?B?T1dQQzlsMklkcE5VaHpORXFocE0rUXpEaDF1dmMyZUJJVW9VWEZhMU4zN0Y2?=
 =?utf-8?B?L1ZCa0tuQkZHM3c1Vm1naGFOSDZOalFXbzhta3RWait3d1dFZkR5QzJuSlov?=
 =?utf-8?B?cU5QditPVFF0NlRBVlphbTM3NDl0dklWa2pxczZjL0ZqcFRDdDcwZ0NyV05s?=
 =?utf-8?B?Si8yQmdvbTh1UC9jeEV5TEVtVTZITzBXYk5KWlZocTZBMmtpMExaNG9rLzFm?=
 =?utf-8?B?cVBDc1BRK0xLZmlSWEhUSmZtRlRzSmxvYVZOeVFlQzJ2WUhTTVROSU5RVzBx?=
 =?utf-8?B?dXNCTWpkZTVXaHBrSHl3NEE2UUxwOHhzdjVkODRHbUozL292ZW8vTFdWVk1z?=
 =?utf-8?B?NERTMHBQdHdTZnF0VGVTVmxnV2dSQm43ZFZIazZnNFUyZTVRSGR1ZkkyN2dT?=
 =?utf-8?B?Rk4veDFYMThWRmNmazhNUGxYaDhjRklPSHNlSzFFY3BvcGZBTVhMT3dpQ1dK?=
 =?utf-8?B?V1JvRitZKzhDV0o1LzJ1ajUvOFdkTGlSbEw5WGE3YmdzN1FGSG1JMjJaNTZ6?=
 =?utf-8?B?V3p2Y2xDZnFMZ1k2ZzlFbkwzS29FNW8vYVRveklBWDZ6dEJrcXJvTklPQ3RS?=
 =?utf-8?B?dHBReDRxRVhMdnhrcm1ScVBCdGx0aEJHK2syUk9mdzAwKzRlT2ZDRDB3Z2xD?=
 =?utf-8?B?cE1yRjZ0RFRydnJMVEo5TElJMTNmRE05SjMycUJyb2dyY1lGUDNEbHBaajdG?=
 =?utf-8?B?WUxiZ1FIVHlFMGhDR3lvYStuS2F4QitKdWFIUWx3YzJkYUtiN2hWcjRBRTdD?=
 =?utf-8?B?cm5JSlV0K2JNQnZyT3c3bjJFdjlMMG94TERJMllqL0JHdDRGY2NUN3p0V1ZM?=
 =?utf-8?B?M2xoZVQyeEhMSzhtTFlmLzNPM05nZkVhSk1mVlRpbVdGN1ZJSFp3aHU2S1dL?=
 =?utf-8?B?UVFGdDVGck9jbHEwa2FXdUJIdEFaK09yNnp4Rkg1VW9tWE55SFJwRDBlL1Bj?=
 =?utf-8?B?RFJ6MnhCMEZUT3V2THROWlFXdTd6QVo1Z1d1N1N4WmN2cnJlWEpjeUlCZzFx?=
 =?utf-8?B?NEUwWjhadDRZOEpIN2Uzc21YRTVMMVo3V2RXYTdma3grSy9EV1M3WkJCUCtC?=
 =?utf-8?B?ektZemhuM0ZYOVhFZmxIdGM4aXZVV1A2MHlQUWlqQUxlcjV4d0paaDFLQTU5?=
 =?utf-8?B?RHBDYXp0QzYycjBBdmRpbUwwK2JZOWdUZjBCbHJPamptQ2xQcEp2SEJhOXlv?=
 =?utf-8?B?VXk1K3ROV3ViNnU5VTJhaFdSOTYvb0crKzdzN3ZFQXlhUlFiTDhHM3I5Wnds?=
 =?utf-8?B?UjRNZEtkQVRod3czdG9LVFg3YWs5dUppdjB4Y2t0TlNYc0ZWaGJtVmJ4cXFD?=
 =?utf-8?B?UFlnZ2V2S2NndUJScFpBcDlUeUhPUU12OWNJblNUeHM0K3lFZ1Mybzd0d3hU?=
 =?utf-8?B?SVVKN2IzanEzSkRqdmRHK1ZMemN5RWJsUTdYWlh2bmlRSmo4dWM1eFQ4aDRv?=
 =?utf-8?B?VXZmUU9XS2hXS0RrWG9rNWwxR1Rrc0FEUEVNZytaWEJHQVBBRnJaenBicWpy?=
 =?utf-8?B?MDBRRmt1WVlONEtpTEcwK2JabmJ0aTFGTHZKamFhMXhpK1pIbTI4dldzWkV0?=
 =?utf-8?B?SnlFbHJZNmNrV0JjQ2thU3Y5czQ4d08xTHRmOFRJRk5lMjg3WDF5d2UvRGlN?=
 =?utf-8?B?ZWsvWDJzQSt1RmEzL1ZmTld4cXMwRWN6aXdqN0RyOUMrOWFvaVpBaFJhekR0?=
 =?utf-8?B?SUhGd2dXbG4xRTRBdllWZjlyOXhoamxqcnhSRHZ4SXlZME5hS1dJaG92amhN?=
 =?utf-8?B?Z2N3SVhJT2FPTjF0alFpZXNGd2VHaGFtSHBOS2JCVVQ1M0RkYmdQRkFnQU94?=
 =?utf-8?B?cE53OUkxdVoyak5DMXZkendKNnJYWnZwcXRPNFNGV0xZTUo4VzM4QUV2c09B?=
 =?utf-8?B?Z1hyc2h5SXhsSDhUYm9kcTVxRmNtbmVNYlJTM0tkT3lxWlFCclFwbFp5OTlG?=
 =?utf-8?B?Tm9MdDhBM1Q1eE9USkNlWG5CejZKUmJTQVJFeERiVmoyWjNCVGVNbEkvY08r?=
 =?utf-8?Q?clLs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07e2c2b-9659-4ba1-1d98-08dd8bc77f81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 11:25:11.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RL6LwQNXIvdIxZs0CyA48wQfttabL+jHI2+ilVDqyTPKmU7+aVUfw0o64HnMto9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
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

Hi Thomas & Shixiong,

first of all the patch is still based on outdated code. For example the cache_sgt_mapping member is already removed in drm-misc-next.

So if I'm not completely mistaken the issue is already resolved upstream.

Regards,
Christian.

On 5/5/25 13:12, Thomas Zimmermann wrote:
> (cc'ing Christian)
> 
> Hi,
> 
> I don't feel qualified to fully review this patch.
> 
> It would be good to have the issue with sg-tables solved, but I dislike the dedicated initializer macros. So my question is if this has any drawbacks. Or could we make this available and the default for all shmem-based drivers?
> 
> Best regards
> Thomas
> 
> Am 01.05.25 um 08:43 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> [WHY]
>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>     DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>     sg_table import.
>>     They only need dma_buf_vmap() to access the shared buffer's
>>     kernel virtual address.
>>
>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>     trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>     restricts the maximum DMA streaming mapping memory, resulting in
>>     errors like:
>>
>>     ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>
>> [HOW]
>> Provide a gem_prime_import implementation without sg_table mapping
>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>> require sg_table can adopt this.
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>>   include/drm/drm_gem_shmem_helper.h     | 24 +++++++
>>   2 files changed, 119 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index d99dee67353a..9e41e350ff6f 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>   static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>>       .free = drm_gem_shmem_object_free,
>>       .print_info = drm_gem_shmem_object_print_info,
>> +    .export = drm_gem_shmem_object_prime_export,
>>       .pin = drm_gem_shmem_object_pin,
>>       .unpin = drm_gem_shmem_object_unpin,
>>       .get_sg_table = drm_gem_shmem_object_get_sg_table,
>> @@ -799,6 +800,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>   +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
>> +    .cache_sgt_mapping = true,
>> +    .attach = drm_gem_map_attach,
>> +    .detach = drm_gem_map_detach,
>> +    .map_dma_buf = drm_gem_map_dma_buf,
>> +    .unmap_dma_buf = drm_gem_unmap_dma_buf,
>> +    .release = drm_gem_dmabuf_release,
>> +    .mmap = drm_gem_dmabuf_mmap,
>> +    .vmap = drm_gem_dmabuf_vmap,
>> +    .vunmap = drm_gem_dmabuf_vunmap,
>> +};
>> +
>> +/**
>> + * drm_gem_shmem_prime_export - implementation of the export callback
>> + * @shmem: shmem GEM object
>> + */
>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>> +                       int flags)
>> +{
>> +    struct drm_gem_object *obj = &shmem->base;
>> +    struct drm_device *dev = obj->dev;
>> +    struct dma_buf_export_info exp_info = {
>> +        .exp_name = KBUILD_MODNAME, /* white lie for debug */
>> +        .owner = dev->driver->fops->owner,
>> +        .ops = &drm_gem_shmem_prime_dmabuf_ops,
>> +        .size = obj->size,
>> +        .flags = flags,
>> +        .priv = obj,
>> +        .resv = obj->resv,
>> +    };
>> +
>> +    return drm_gem_dmabuf_export(dev, &exp_info);
>> +}
>> +
>> +/**
>> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
>> + * @dev: Device to import into
>> + * @dma_buf: dma-buf object to import
>> + *
>> + * Drivers that use the shmem helpers but also wants to import dmabuf without
>> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
>> + * implementation.
>> + */
>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>> +                          struct dma_buf *dma_buf)
>> +{
>> +    struct dma_buf_attachment *attach;
>> +    struct drm_gem_shmem_object *shmem;
>> +    size_t size;
>> +    int ret;
>> +
>> +    if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
>> +        struct drm_gem_object *obj;
>> +
>> +        obj = dma_buf->priv;
>> +        if (obj->dev == dev) {
>> +            /*
>> +             * Importing dmabuf exported from our own gem increases
>> +             * refcount on gem itself instead of f_count of dmabuf.
>> +             */
>> +            drm_gem_object_get(obj);
>> +            return obj;
>> +        }
>> +    }
>> +
>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>> +    if (IS_ERR(attach))
>> +        return ERR_CAST(attach);
>> +
>> +    get_dma_buf(dma_buf);
>> +
>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>> +
>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>> +    if (IS_ERR(shmem)) {
>> +        ret = PTR_ERR(shmem);
>> +        goto fail_detach;
>> +    }
>> +
>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>> +
>> +    shmem->base.import_attach = attach;
>> +    shmem->base.resv = dma_buf->resv;
>> +
>> +    return &shmem->base;
>> +
>> +fail_detach:
>> +    dma_buf_detach(dma_buf, attach);
>> +    dma_buf_put(dma_buf);
>> +
>> +    return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
>> +
>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>> index cef5a6b5a4d6..78ef91593a8e 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -110,6 +110,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>   void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>>                 struct iosys_map *map);
>>   int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>> +                          int flags);
>>     int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>>   void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>> @@ -168,6 +170,18 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>>       drm_gem_shmem_print_info(shmem, p, indent);
>>   }
>>   +/**
>> + * drm_gem_shmem_object_prime_export - GEM object function for export()
>> + * @obj: GEM object
>> + *
>> + */
>> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
>> +                                int flags)
>> +{
>> +    struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>> +
>> +    return drm_gem_shmem_prime_export(shmem, flags);
>> +}
>>   /**
>>    * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>>    * @obj: GEM object
>> @@ -276,6 +290,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>                       struct sg_table *sgt);
>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>                     struct drm_mode_create_dumb *args);
>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>> +                          struct dma_buf *buf);
>>     /**
>>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>> @@ -287,4 +303,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>       .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>       .dumb_create           = drm_gem_shmem_dumb_create
>>   +/**
>> + * This macro provides a shmem GEM operations that implementate a simple
>> + * gem_prime_import.
>> + */
>> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>> +    .gem_prime_import    = drm_gem_shmem_prime_import, \
>> +    .dumb_create        = drm_gem_shmem_dumb_create
>> +
>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> 

