Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2F4DB018
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 13:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBC789DF7;
	Wed, 16 Mar 2022 12:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A1089D83;
 Wed, 16 Mar 2022 12:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6+9dybXg30RleMw7gM/FHqofHKB89KhIW8Ty/N9ABQqqtEwEhuZlIIoc561evA+rA1pJrwIIrGSAP4504Ac32Or8naO+h8kNJ5ySPCRTuf87iWC5Jm9amjZkyLU1YRhK92/XYCVUnJuwAND+/1PQFeELj3K5eFV/QwDERXSf7ofYpT/0oikKAYb9rpldds0o2w8UifzJ1p8RW9ql6/nnRBP8tAjy+lkV1ffzsHNWxgKSR2FBiDr52P//MIDtF5QKbQ8fxTfTsXJI2HijRhvfw5UbggveaVdmwBQHv1HgMxHCxBG0vPAEkJgywotm5fXx111zgOBxaoIxzmIzia+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrY/h5mVnDwV6QwtOVhVLjvOJlfVWvYMFLe3gCiocHA=;
 b=erU2iF7M59MrkANvJcUKjBRJIKwSUoiNpEuw1BZgvlzkDIncvzD1+CVywmNz5a5PkSAS+t9Y7UjTzlKJ6JALaR8WKkn5UnZG+NFe6x2REFGqvZVFjqhFhmPYyEj3CMS8PceSlJrfGTssXo3PDd8tqh98eyxrXwF1VR3zlRkaAIUBopY5oQVfsLeixd7YcwNvpYltS/7QjVtNmyknqzd/awnRRKcNI+HJfeUuR87gT+yACVVEB+ydQDLcVXCJf+9qxKM9lRgARc5Xi8cG+NKd6aYWE7sqqjGLgJE8wukZrQiWQYyKcxAJmNTNpVGdIG1jJk/gIbg5OqcnwckuO6siFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrY/h5mVnDwV6QwtOVhVLjvOJlfVWvYMFLe3gCiocHA=;
 b=EGTcXYAhZx+IA1bMY19IDX9UsUMjgrUgw0ZfDAQ+z49LtxMjgKA4sPu9qkW7xcIYSrtmeDbBO/2i24rc4Yc12IwWskCsLp02bi7DK7CaXW0WblTNeP63bQfkLoeAPQSPDmRErZjbQS3E5engHqKOeZHcQ/gi9ZAjoBoES9aO6Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 12:49:37 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08%4]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 12:49:36 +0000
Message-ID: <f1f242ca-4701-9352-7a88-38c546f3cabe@amd.com>
Date: Wed, 16 Mar 2022 08:49:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Move FPU related code from DCN3.1x drivers to DML
 folder
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
References: <20220307154801.2196284-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
In-Reply-To: <20220307154801.2196284-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:610:e5::6) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6355b934-0890-4e44-38e6-08da074b6ce5
X-MS-TrafficTypeDiagnostic: LV2PR12MB5944:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB594409A4CA2815B9DC7322AC98119@LV2PR12MB5944.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1KJgSe3rY4DCRJpj+n+psiReybmaVca9ED8IIU+2ImCwNFgGTHghG6SLfzhF+QOpPCDkTymJ0P5yWxaGf0lL0utnIO4lET5oLoM5v9wjmPcavt8vmpFLgH8zxyk0mQb9o31xLlNul4De7Lzmi1IWFOe0dc7/pIFfvhOYluYxDfU1Eijk0El4B/DdtCokxskPOryKFfDlt9INTW+tUuNRWjpSy4xu2/2csoqchx3gWCsAIAz5hJsphMP50Wrysc6GU2Hd4dxVj5gHv1LPJRKraEfs3duBbMLzlMb1QYloLNfrgWhxoiGQK8H6Bt6XhzETd0xFeJX2j9EXtTUEgeBI9fykQ2fq9uk3ODFtBX3nK7qeaEl/RkbyfFs0vLKvnG8wYB/ZOlK3BLU5g8gj/B6peMg82r92g9mogulTxeq9Zp1enIyWmZIHZw6NjwjB7t1/QRw/sGP/ZhDNtj9K0x4TS3O1ecUnCC7Eve9uLc1UxVGSQXawmR+vtCeMDHFO1kKzJ7KSv7OJqax5nybL+ycv42JSxqkJx/osvgJYnnbRyOdSFakOSZ1dSMxDnQhHZE2dFN1tGHG/pEh+TZmfJ+kzET7wqvObOQNCQfiiEIkW9M6/XwNqSXzKcra7r2pn+HXRDiBRpINuqAyOSOSSqiqSjCTybTSQ9T3oSuVNi3kFsvq/xwzOIaGLAcdYgbsz8qiYgjpdvUWfP64sN9T+1Ard9U0sHVnLyWRpSkfBcwGQT9IPutHSiqWDmrMuzpLrroABhaJLr6GED4N4hIHsaOnZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(8936002)(6512007)(2616005)(186003)(2906002)(921005)(31696002)(38100700002)(4326008)(6666004)(316002)(36756003)(6486002)(66946007)(6506007)(54906003)(66476007)(66556008)(53546011)(8676002)(6636002)(508600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXZ6c3d4dHdIbkc0Vyttb1dyTDgra3owQWRqNDFnRzJUT0lTbm5VSndCa0Nw?=
 =?utf-8?B?bU0xblRwVldscmt1NjIwSmlhSkM0b3A2eW9zaXFFd01zaHdJVyt1Vldob29G?=
 =?utf-8?B?VXltd2VZeVliSHM4TlVseGhXMnR4ZHV0KzN3V0pPS1VrNmM2bVpOdHUvdTFp?=
 =?utf-8?B?TWJ1enNCUzFHN2VnRVBHU1dIVFpDak5DWUcrcGR2UmQySTFlMDNFZjR2ckxQ?=
 =?utf-8?B?NE1DRzkvcWtSMUh5R1hCa1FQK1JWUEVyQnBiWTF2ZTZwSDVkalR0TitKMUJR?=
 =?utf-8?B?b3k0SEhtK1dmTTVxR1Q5QVVrRGVhY0JML2RHUFFzVncveWZKSHQ5VVI2TmNs?=
 =?utf-8?B?MUt6VWNNc2p2cnJaaEVzanlmVURqd2VKendyV3Vab2R2VW5GQ1lTcTQvcVRz?=
 =?utf-8?B?bnlLUkx0cERiUXlZVnczOVd4c3c0YXBLMENWMlNvWm1CSnVxQnFUeWJkZzJa?=
 =?utf-8?B?bCtCMlgyT2hvVGJDU2xKbmlXcS9kZ2prK1JrK0d2TzVaL3RhdjJxcFN1N2x6?=
 =?utf-8?B?ZVNGS3NvYlNTQmQ3Nys1cG84UE5ESVVBN3FxM2ZTV09HZGY4NUVNd3pHUFZ4?=
 =?utf-8?B?RW5HbmdaUlh6WGQ2UEM3TlhNTFhwU2tnZExIR3JEQlY4aFF2Tm1pRms2SjAw?=
 =?utf-8?B?UjMrUGpTN0dIT2Y5M203aFozejRQeXk5SjhJR1RtTGpiYThQYWQ5N3RRWXNq?=
 =?utf-8?B?VVQ1RWJHMzdVNk0rWFZBM28vTitJNDNFNnZCZXpJQU5LeEI2WlROa1hMbzR2?=
 =?utf-8?B?NlRvK04xT21PNmZMUVZVWERBR0RYS3EyYXZKckROWXJqdVZrWk9zeGhITHpx?=
 =?utf-8?B?eXlBVDBXVlFUbFh2dUo5WUV5YjJ6MHpQOUpYM2pjdjFreGEzYVFEZTEzOGJy?=
 =?utf-8?B?SHJ5VktIRFQzRmptakJsWTJ3c3dpOFk1eHpnVEYyejNvOGdtYWtYazhZbHRz?=
 =?utf-8?B?SExWT2VMakdjQW5DYkI3TWtyV3RybjZMcGZ5TElnaWx6ZWtCalNxM081NGdD?=
 =?utf-8?B?M2Y3UUl3eFZVWExzSUlDcmEycE9kRndwaXU2UjZtTzJMUURXK1FaZG9kK1Qw?=
 =?utf-8?B?STVNaW9lL2RIRjRtNTkxV1I4QUJsQVJqMHRRcVNKTVR5eERnd2ZuT0FBbjVJ?=
 =?utf-8?B?Zk01cHYxUFhXMzFENlhKNUpZc2ZyZjRqNXk2MWhkU1JqdEtybU1SLzJ0dGJU?=
 =?utf-8?B?QzlrNWpyL29JK0VsUnZSeldBVlRPOFZ5WGhTc3IxMTJOcG4wQ3ZVd2c2dWt0?=
 =?utf-8?B?TVFwV3BNV3BLWXAxbUZtZmd0UXFhUFVSdk1XTmRZeWRzRER4YWNDSDRtSlBP?=
 =?utf-8?B?TXpRZkF0cmJmTFJLeU1pakp0Rk1ONlJWR1pUUTVEU25qVVFIM0xNSDhjUzFF?=
 =?utf-8?B?RGlsV0M5U2pKV0J0RXRyeFlFUUFpLzdEZ0UvMFIzam5UZlU1alV2elMxaVJp?=
 =?utf-8?B?U1IzZDFVcVJtSFUra0o1Vm15Q255ckVwR29wSW1oNWRlZ3ptTDJ5S01BQ3Vv?=
 =?utf-8?B?aEZVbDRPOUE4cXZQaTNGK3U1TjJLTmgxUlM5Sm14ck9tcjJ3aVpOWlhiM1Vj?=
 =?utf-8?B?cU05bEVvMnRQWWlIaElHallVbFYxeEVKTEUzbVNtVFFuQ0tJbm5HNy9RelNu?=
 =?utf-8?B?MzRHMlhaNHZMbkdMYXNadDZBKytSVFpnWFVzbDJiellWQkVOYWxpaTN1S0sx?=
 =?utf-8?B?NVM2VVZvOXVmNnJZZXp0UTVyMkpxdFczUFlNMDZFZGxQMU1CakxxZDVMdnZI?=
 =?utf-8?B?R0E3TG9jM1R5MWNKaGpoK0JYa1hVSHh0OUQ0UDE1UklCZUNab29kOVp5ald3?=
 =?utf-8?B?NjlDb01HaUlUdzJvZFdSVXhpWFY4VUQ2d3BGN3pnL3doSzNiQThlMDdpYStE?=
 =?utf-8?B?V2JhKzdPMXVvNWNnODh6dVU4MXhyaC83NmoxT3BXUWJXTm5LRE45L2JFVDA2?=
 =?utf-8?B?SlhUUU1FdldHSWhzaFhiMzhBaHR3K1NZcG1xVnZ3Zk9SNXl2UlZ2NVh5Z0ZZ?=
 =?utf-8?B?ZWhRSnhlUmtIQXF2REVVcisyZ3JMQldFUmQvTk44b2JCSElCQkFyMGJGbnpS?=
 =?utf-8?Q?hBVQ+j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6355b934-0890-4e44-38e6-08da074b6ce5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 12:49:36.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCJyy8DFrkk217OifM2T6JreHmMa2HqeSf2LKiXEkOOO9b7z6N/ewJfbhjvLb8EDEp2PRRItStPXGk8KvQ2koQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, linux-kernel@vger.kernel.org,
 Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-07 10:47, Melissa Wen wrote:
> This series moves FPU code from DCN 3.1x drivers to dml/dcn31 folder to
> isolate FPU operations. For this, it creates dcn31_fpu files to centralize
> FPU operations and structs from dcn31x drivers, that include:
> - _vcs_dpi_ip_params_st and _vcs_dpi_soc_bounding_box_st structs
> - dcn31x_update_bw_bounding_box() functions
> - dcn31_calculate_wm_and_dlg_fp()
> 
> Also, it adds dc_assert_fp_enabled() in public dml-fpu functions, as required,
> and I've checked if their calls are properly wrapped by DC_FP_START/END (and
> removed when inside dml/fpu files too).
> 
> Melissa Wen (3):
>    drm/amd/dicplay: move FPU related code from dcn31 to dml/dcn31 folder
>    drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder
>    drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder
> 
>   drivers/gpu/drm/amd/display/dc/dcn31/Makefile |  26 -
>   .../drm/amd/display/dc/dcn31/dcn31_resource.c | 355 +------
>   .../drm/amd/display/dc/dcn31/dcn31_resource.h |   4 +-
>   .../gpu/drm/amd/display/dc/dcn315/Makefile    |  26 -
>   .../amd/display/dc/dcn315/dcn315_resource.c   | 232 +----
>   .../amd/display/dc/dcn315/dcn315_resource.h   |   3 +
>   .../gpu/drm/amd/display/dc/dcn316/Makefile    |  26 -
>   .../amd/display/dc/dcn316/dcn316_resource.c   | 231 +----
>   .../amd/display/dc/dcn316/dcn316_resource.h   |   3 +
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   |   2 +
>   .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 863 ++++++++++++++++++
>   .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |  44 +
>   12 files changed, 921 insertions(+), 894 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> 

Hi Melissa,

Thanks a lot for your patchset. We have already tested it with IGT, and 
we are running some manual tests to ensure that everything is fine. We 
will include your patch in this week's DC upstream, and if everything is 
alright, we will merge it next Monday.

