Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C84F22DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F357010EC46;
	Tue,  5 Apr 2022 06:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CCE10EC46;
 Tue,  5 Apr 2022 06:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1Iffq7o1Rb08CeiU06azXt0Fag3aNaN4fKlOd84lWU/iNyBXJUE0b7I59SjYkMPgndoKTac9SLkEKjW+j42Sd++CYHebyfyVt7r0/dIbLPAZrZgT7waeYzpQR4aRhNMTCXTkQZzxrT5NIt73p63ADJmqpRcsuAHmR0dBE8QLq+1rfvO6/lis9RgoBs4Rx8FkNIukzcXO4lPeFptoK7WTmJod2W66wjoDeBgnSfke7GpEBunQrozqpyNdVlKGLgQpcBslYFF2omzkBVJJTp5q0/j9D8N996reE8YnQSmsjf5KE8GP3uBORzN/cgFLo7rYPs/mAAcDzo9+Ihio+4H7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqN1wtyje2/x8RKIBTwm5Khri3jt8rCUj8LQxg8iF6s=;
 b=T1b5UoTXY/ZZpAKFZUMhmfMHAYPnKW+ahIfSAO7LJoGFFOgR9LgVaVNSwMBRub2hSjkG0su0m4qoCTgMZMixfl3ocs+dZFKuoOkUS5ZbHZGuuOd1j/kh/YQNNWXCY4NxbXWPJ8kprhG4+qUz/yB4ROdyKakaC7rsNbdh1NiqGYasGpvkfyI4/AUEqIE1A/N2ToTMolspElONIK/WzIEXSpnMp7lwbCJ2PvMEGM/IoI6tTh4rN7ie5ijTWkO3ZpUUfu0aEQnBwMzwOPEAiaR01rR51NIQOIJ8JNo1XTrArKENhNzD5hOzNblQqn3LMnI9J5iHufpui9OBIS1VeTKtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqN1wtyje2/x8RKIBTwm5Khri3jt8rCUj8LQxg8iF6s=;
 b=d+qccSYqllTRaeeoRsAuwKVQ9zodppaLH8VRqTBKzZueoIe8ZpXrAtoEDH2y0IbyTAt9fH2k4vttaG/CjiumkGlcOXUhBWB5uDlZTEoyNbvbUfcn3f7TRiL3A6ncPJWjVpdSgW92InAkvV5RnJqswcdZCKdgnZFiMy2ILUWm7cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR1201MB0001.namprd12.prod.outlook.com (2603:10b6:404:a7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 06:04:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 06:04:46 +0000
Message-ID: <65f33162-74ff-f205-aea9-3ed84dfddde1@amd.com>
Date: Tue, 5 Apr 2022 08:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/radeon: change si_default_state table from global
 to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@linux.ie, daniel@ffwll.ch
References: <20220404225710.972071-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220404225710.972071-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0096.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::37) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6ce8cf1-5359-4531-a055-08da16ca2f45
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0001:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0001AFEA61F7EC5BF40E317583E49@BN6PR1201MB0001.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKBSprnxktN9HczHXzDGvJWSIDeMEZj0PM1q99StpmnlVJIZ4mAt1ZJF6WsjFWBjcJ7FYM40AimShBgL7st+9bxBwrhX66z9x84AQnhrQDoI8ZbuoMiReoGa6PyijCQBDHIboi4gk1AevIIJUtt2lBQA2TbQpT0uNLWnKyb7WYrWDpHtag6r9DCFF6G9wsDyg2jA/ldlR+As0uT+0hMX3C0wSuwLW6zMg48nzG7w6rbLRuRI+jXo6alM8B5BlJcwkUY83PW5Wabu1OUDgIPTbrjCl7mBKNXKyNBvSE0ReTFA8gOf2PjUI2X33pyHQDf5lZWK8IcXDu5LQ8jWyie1YCNgxWmW8f2jddrEjqdbw3tITt2Q+Z4ipQCo2nWCf5Ac9fA/vJBd1ut0VTU4KcDnpvi8b4YWZwy3G17M8+juJeE2CgXCxwDqfRLcT1mV8OFvcOJVUCNegSHOBj/n6nBw7p0NS9oOYf40XTBu9ykF2ROMbiCILas09XV3l92rT+18XfDfI6dnjtoRBtp0pxGAFYgdHuxxXhUZsBlChgNcSL+HGDdhiOO6LtnGSaA4U0rIxnKxnOovjwIv8xFk7lCYKPHhrZCyz9cTuEIkOQ0wkTZfVRon7rJk7Aq2I2/nEh58gLqy8lx/sWzdVbvsCJ5V57i5XQfIGKtlaAwwVJ4N4RYmCu9ikaiw5knimFG+JZoq8wiDUVSZNuTOwnZNp+nYdSqDs2QbMVFQ3uAU1J796cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(4326008)(86362001)(31696002)(6666004)(2616005)(6512007)(316002)(6506007)(508600001)(6486002)(2906002)(66574015)(26005)(66556008)(66476007)(38100700002)(36756003)(8676002)(31686004)(8936002)(30864003)(83380400001)(5660300002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdwZWlxd3NDd3VIc09lUjVuZWZ6Vmk4aDV4Z0hObmcrT1l3eC8yc1dYZy85?=
 =?utf-8?B?VGNOUG1uWVN1YUNURTYyUkZvNTV0Nnl0UE56d213U3VveDdsdTMyVml6SUcv?=
 =?utf-8?B?UE9VRU1DSnJpWDJaMzRJQWVJbCs1QkRvVEJzQXQyMUxiQlZmMTZiNlRSOVRH?=
 =?utf-8?B?WTkyZlBSbkR1Q0dsblYxZ1Biak5KZzkzazcyYzN5L2lQeVhaMFN1VDJyRVRU?=
 =?utf-8?B?MXE1Ty95Nm1jMUcrTmZOYXBrdlJuRGFucUNuTlowSkdHenFDZ2VIQlZaZ0Nk?=
 =?utf-8?B?Y05oZHpNandTZnMvazlzOUEvVGRnbWVEMDJxbUVSNnFDQnBmM2t3V01PdndX?=
 =?utf-8?B?WVRJbGdBeTRaV1U1UDBaOEF4S09nS2N5UHRnUVNpZnJOQURwNC9SMkU4bWYx?=
 =?utf-8?B?K3RSRjd0V2lGaVRyT01zMkhwOUdNN3pkNWdINmpTSWtPZTg3WnJneG14aFNG?=
 =?utf-8?B?TE9LSHVKNHJQZE16SjFUUmNISkNqV2hXTTlvVGFWajNRNDN0dWV0M0EzRVVE?=
 =?utf-8?B?OWVDZllDaVBJbEdIc3ZYNzU4aWg3ZXU2dGVKMXJIZkVGYXluTFk1TjRZQlVo?=
 =?utf-8?B?WnVuSTF0d2w0RnVrUzRpR2Yyd2IrMXlyWkhHR05EeWxKT1hIYmRCenFURzVT?=
 =?utf-8?B?R1JtOW1oTTBoZ0ZDUmI0eGVra3pGTkN0U0FvVjFndU1QemN4VkcxMURXR1g4?=
 =?utf-8?B?aWF0QVhyVnVaUWtGdk5yNHVFYjV3NG10ZENvOFpITjFRVnUvMFUyMmY5VnJm?=
 =?utf-8?B?dVBBTUhWeFVQMWRDT1BUaGRXUGZCMmZLbGNobkEwOU1vaHJQditmbWsvdTVC?=
 =?utf-8?B?VStUZU9RNGM4YUZPWWxqemZqaEI5YjNsc2d6LzMyLy9UNjRYSEZqWEtaTnFF?=
 =?utf-8?B?a2hOVUdkUnlQNEh5Qi9QQmVqRkJQLzd6QjFla3ZLczVVMDRoYVhmZkJ5N2ZY?=
 =?utf-8?B?Nm5zbDhQNWdqeG1oY1g3U09sYy96dXF1NDQrbnlFeElBYXlKeVNzZDB0THVS?=
 =?utf-8?B?T2xEMnZDSnp1Z1VBZVV5WDFMYUtRWW5WQmpiM3NIbWJOTjR6OUxJdjBySXlC?=
 =?utf-8?B?Lys3K0Jqcm1UN1p2WHJXcHRQY1Z4RjRwdGxlTFl1SnJQVVBpK2R4UGpUalVC?=
 =?utf-8?B?Ynd0eEtNWWRpZVJzRW9zS3RXbVF3NnREQ1RoYXg0RGo5WjNNTjhQaVdqUU8v?=
 =?utf-8?B?eDFlRG9nS3BGVHM0RTArcWc3SWc0NWhLcWxhRjVFV2FFZDhCZnVnTGszWWdk?=
 =?utf-8?B?RTlqVkUyem92YlVsNFZZSlJYVWpJb3FQU0F1cEl1WlhXaXJybnJEQk4wU3pr?=
 =?utf-8?B?TUhOZkg2dXh1VWhUNWVCbmdvMnZNM1hodFIxRGhxU2Q3Njd6aDYvQUtZWEFn?=
 =?utf-8?B?U09od2JBWHc2Nm9IdzU1Szl6M0RWNTRMWExwNmtNMVZKcWlPQzhoSTh5VE9J?=
 =?utf-8?B?d0NjTkJXcU9lS3A2RGI1Uk5LSXBUbEVsU0FmZGQxUGpZL0FHWWtHUTBaRDRF?=
 =?utf-8?B?UkVTakFjaWpwUXFCLzczR1BOdllhQ0JmUnVPWE1xb0FCREpkdWM4YWFqNjNG?=
 =?utf-8?B?RzhBSEZtUkxNUWRTd0RzQ2x2ZFVQNzZrWHBWZElRVkcvbFZjMXUzUm9adjl2?=
 =?utf-8?B?NEN3dmltdytjMkFTRU5TU3ZBU3d1ZW5nQ2luNlg2bHRNd2pFUnBjWm1oaVBz?=
 =?utf-8?B?WE4vbEFuQzlScFBtVVRnTGozZHZIczNUYk1zbTdTSkZGU1k3cndFNkg4SXJl?=
 =?utf-8?B?Y1RPTTQvK1dHRk16Qisycm5LL3lMckRJN043cmowdXhpbUZBTWdad0xSR2NG?=
 =?utf-8?B?K2hLVFFHazZmK1cwbkVKd3U2QTRSeGM5dVFSMHQ4cVpsUlVLUWNoOXNGOXM1?=
 =?utf-8?B?dDhZQmg0ZTl4bEUxSjBNdkJLVyt3TnVrMVIzUks3UlZzVEpmY204OTl4ZmdK?=
 =?utf-8?B?NXBzWUtKK01zK28rN05YRkMxdzBCMkRHcXhvYkg1dElUenBPVmVpa3puZXph?=
 =?utf-8?B?OGxRdWJsQzBDUDZabHVycXI4QStKcjdjTDRtM1MzOWFSOVVOUHBHZGJwaGxw?=
 =?utf-8?B?TXJqTzMvWmpwYkNhK3dsdytZT3lQTTdVcmdsNGdzN255RWlscHdFNzlFcFZs?=
 =?utf-8?B?ZlVVeG5HazhEV1gvSi92cS9icFhMdDNsMlREQW5UQU5SRUtnZjNsVWFhd3JU?=
 =?utf-8?B?dGlzQ0NydHFoazdpdkVtMkR2ZDM3WWlUS1UwZlVOcThUN0V5UHdEeFVnWjgy?=
 =?utf-8?B?ZnZFMjdNdEdGenVIN0ZJbkZYNDBOTlhtZmZZcnFyTTR1MTFGRkxCdnBqYTRP?=
 =?utf-8?B?V3F3ZXpOcHVWajdhelJudUhVRTVBRDc4ZXNNUW1zcHZqRjZrZWdLUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ce8cf1-5359-4531-a055-08da16ca2f45
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 06:04:45.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKFRmU2ituVMEid6NWvdmx6ohwt4qw1xj/Rj/7sAvyPJzEDYrhEgpge2qVa5dIqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0001
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.22 um 00:57 schrieb Tom Rix:
> Smatch reports these issues
> si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
>    was not declared. Should it be static?
> si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
>    was not declared. Should it be static?
>
> Both symbols are only used in si.c.  Single file symbols
> should be static.  So move the definition of
> si_default_state and si_default_size to si_blit_shader.h
> and change their storage-class-specifier to static.
>
> Remove unneeded si_blit_shader.c
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v2: move definitions to header
>
>   drivers/gpu/drm/radeon/Makefile          |   2 +-
>   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 -----------------------
>   drivers/gpu/drm/radeon/si_blit_shaders.h | 223 +++++++++++++++++++-
>   3 files changed, 222 insertions(+), 256 deletions(-)
>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
>
> diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> index 11c97edde54d..664381f4eb07 100644
> --- a/drivers/gpu/drm/radeon/Makefile
> +++ b/drivers/gpu/drm/radeon/Makefile
> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
>   	evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
>   	evergreen_hdmi.o radeon_trace_points.o ni.o cayman_blit_shaders.o \
>   	atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
> -	si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
> +	radeon_prime.o cik.o cik_blit_shaders.o \
>   	r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_dpm.o \
>   	rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity_dpm.o \
>   	trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc.o \
> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c b/drivers/gpu/drm/radeon/si_blit_shaders.c
> deleted file mode 100644
> index ec415e7dfa4b..000000000000
> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
> +++ /dev/null
> @@ -1,253 +0,0 @@
> -/*
> - * Copyright 2011 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *     Alex Deucher <alexander.deucher@amd.com>
> - */
> -
> -#include <linux/types.h>
> -#include <linux/bug.h>
> -#include <linux/kernel.h>
> -
> -const u32 si_default_state[] =
> -{
> -	0xc0066900,
> -	0x00000000,
> -	0x00000060, /* DB_RENDER_CONTROL */
> -	0x00000000, /* DB_COUNT_CONTROL */
> -	0x00000000, /* DB_DEPTH_VIEW */
> -	0x0000002a, /* DB_RENDER_OVERRIDE */
> -	0x00000000, /* DB_RENDER_OVERRIDE2 */
> -	0x00000000, /* DB_HTILE_DATA_BASE */
> -
> -	0xc0046900,
> -	0x00000008,
> -	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> -	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> -	0x00000000, /* DB_STENCIL_CLEAR */
> -	0x00000000, /* DB_DEPTH_CLEAR */
> -
> -	0xc0036900,
> -	0x0000000f,
> -	0x00000000, /* DB_DEPTH_INFO */
> -	0x00000000, /* DB_Z_INFO */
> -	0x00000000, /* DB_STENCIL_INFO */
> -
> -	0xc0016900,
> -	0x00000080,
> -	0x00000000, /* PA_SC_WINDOW_OFFSET */
> -
> -	0xc00d6900,
> -	0x00000083,
> -	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> -	0x00000000, /* PA_SC_CLIPRECT_0_TL */
> -	0x20002000, /* PA_SC_CLIPRECT_0_BR */
> -	0x00000000,
> -	0x20002000,
> -	0x00000000,
> -	0x20002000,
> -	0x00000000,
> -	0x20002000,
> -	0xaaaaaaaa, /* PA_SC_EDGERULE */
> -	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> -	0x0000000f, /* CB_TARGET_MASK */
> -	0x0000000f, /* CB_SHADER_MASK */
> -
> -	0xc0226900,
> -	0x00000094,
> -	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> -	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> -	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> -
> -	0xc0026900,
> -	0x000000d9,
> -	0x00000000, /* CP_RINGID */
> -	0x00000000, /* CP_VMID */
> -
> -	0xc0046900,
> -	0x00000100,
> -	0xffffffff, /* VGT_MAX_VTX_INDX */
> -	0x00000000, /* VGT_MIN_VTX_INDX */
> -	0x00000000, /* VGT_INDX_OFFSET */
> -	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> -
> -	0xc0046900,
> -	0x00000105,
> -	0x00000000, /* CB_BLEND_RED */
> -	0x00000000, /* CB_BLEND_GREEN */
> -	0x00000000, /* CB_BLEND_BLUE */
> -	0x00000000, /* CB_BLEND_ALPHA */
> -
> -	0xc0016900,
> -	0x000001e0,
> -	0x00000000, /* CB_BLEND0_CONTROL */
> -
> -	0xc00e6900,
> -	0x00000200,
> -	0x00000000, /* DB_DEPTH_CONTROL */
> -	0x00000000, /* DB_EQAA */
> -	0x00cc0010, /* CB_COLOR_CONTROL */
> -	0x00000210, /* DB_SHADER_CONTROL */
> -	0x00010000, /* PA_CL_CLIP_CNTL */
> -	0x00000004, /* PA_SU_SC_MODE_CNTL */
> -	0x00000100, /* PA_CL_VTE_CNTL */
> -	0x00000000, /* PA_CL_VS_OUT_CNTL */
> -	0x00000000, /* PA_CL_NANINF_CNTL */
> -	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> -	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> -	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> -	0x00000000, /*  */
> -	0x00000000, /*  */
> -
> -	0xc0116900,
> -	0x00000280,
> -	0x00000000, /* PA_SU_POINT_SIZE */
> -	0x00000000, /* PA_SU_POINT_MINMAX */
> -	0x00000008, /* PA_SU_LINE_CNTL */
> -	0x00000000, /* PA_SC_LINE_STIPPLE */
> -	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> -	0x00000000, /* VGT_HOS_CNTL */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000, /* VGT_GS_MODE */
> -
> -	0xc0026900,
> -	0x00000292,
> -	0x00000000, /* PA_SC_MODE_CNTL_0 */
> -	0x00000000, /* PA_SC_MODE_CNTL_1 */
> -
> -	0xc0016900,
> -	0x000002a1,
> -	0x00000000, /* VGT_PRIMITIVEID_EN */
> -
> -	0xc0016900,
> -	0x000002a5,
> -	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> -
> -	0xc0026900,
> -	0x000002a8,
> -	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> -	0x00000000,
> -
> -	0xc0026900,
> -	0x000002ad,
> -	0x00000000, /* VGT_REUSE_OFF */
> -	0x00000000,
> -
> -	0xc0016900,
> -	0x000002d5,
> -	0x00000000, /* VGT_SHADER_STAGES_EN */
> -
> -	0xc0016900,
> -	0x000002dc,
> -	0x0000aa00, /* DB_ALPHA_TO_MASK */
> -
> -	0xc0066900,
> -	0x000002de,
> -	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -
> -	0xc0026900,
> -	0x000002e5,
> -	0x00000000, /* VGT_STRMOUT_CONFIG */
> -	0x00000000,
> -
> -	0xc01b6900,
> -	0x000002f5,
> -	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> -	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> -	0x00000000, /* PA_SC_LINE_CNTL */
> -	0x00000000, /* PA_SC_AA_CONFIG */
> -	0x00000005, /* PA_SU_VTX_CNTL */
> -	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> -	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> -	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> -	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> -	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> -	0xffffffff,
> -
> -	0xc0026900,
> -	0x00000316,
> -	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> -	0x00000010, /*  */
> -};
> -
> -const u32 si_default_size = ARRAY_SIZE(si_default_state);
> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h b/drivers/gpu/drm/radeon/si_blit_shaders.h
> index c739e51e3961..829a2b6228b7 100644
> --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
> +++ b/drivers/gpu/drm/radeon/si_blit_shaders.h
> @@ -25,8 +25,227 @@
>   #ifndef SI_BLIT_SHADERS_H
>   #define SI_BLIT_SHADERS_H
>   
> -extern const u32 si_default_state[];
> +static const u32 si_default_state[] = {
> +	0xc0066900,
> +	0x00000000,
> +	0x00000060, /* DB_RENDER_CONTROL */
> +	0x00000000, /* DB_COUNT_CONTROL */
> +	0x00000000, /* DB_DEPTH_VIEW */
> +	0x0000002a, /* DB_RENDER_OVERRIDE */
> +	0x00000000, /* DB_RENDER_OVERRIDE2 */
> +	0x00000000, /* DB_HTILE_DATA_BASE */
>   
> -extern const u32 si_default_size;
> +	0xc0046900,
> +	0x00000008,
> +	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> +	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> +	0x00000000, /* DB_STENCIL_CLEAR */
> +	0x00000000, /* DB_DEPTH_CLEAR */
> +
> +	0xc0036900,
> +	0x0000000f,
> +	0x00000000, /* DB_DEPTH_INFO */
> +	0x00000000, /* DB_Z_INFO */
> +	0x00000000, /* DB_STENCIL_INFO */
> +
> +	0xc0016900,
> +	0x00000080,
> +	0x00000000, /* PA_SC_WINDOW_OFFSET */
> +
> +	0xc00d6900,
> +	0x00000083,
> +	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> +	0x00000000, /* PA_SC_CLIPRECT_0_TL */
> +	0x20002000, /* PA_SC_CLIPRECT_0_BR */
> +	0x00000000,
> +	0x20002000,
> +	0x00000000,
> +	0x20002000,
> +	0x00000000,
> +	0x20002000,
> +	0xaaaaaaaa, /* PA_SC_EDGERULE */
> +	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> +	0x0000000f, /* CB_TARGET_MASK */
> +	0x0000000f, /* CB_SHADER_MASK */
> +
> +	0xc0226900,
> +	0x00000094,
> +	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> +	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> +	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> +
> +	0xc0026900,
> +	0x000000d9,
> +	0x00000000, /* CP_RINGID */
> +	0x00000000, /* CP_VMID */
> +
> +	0xc0046900,
> +	0x00000100,
> +	0xffffffff, /* VGT_MAX_VTX_INDX */
> +	0x00000000, /* VGT_MIN_VTX_INDX */
> +	0x00000000, /* VGT_INDX_OFFSET */
> +	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> +
> +	0xc0046900,
> +	0x00000105,
> +	0x00000000, /* CB_BLEND_RED */
> +	0x00000000, /* CB_BLEND_GREEN */
> +	0x00000000, /* CB_BLEND_BLUE */
> +	0x00000000, /* CB_BLEND_ALPHA */
> +
> +	0xc0016900,
> +	0x000001e0,
> +	0x00000000, /* CB_BLEND0_CONTROL */
> +
> +	0xc00e6900,
> +	0x00000200,
> +	0x00000000, /* DB_DEPTH_CONTROL */
> +	0x00000000, /* DB_EQAA */
> +	0x00cc0010, /* CB_COLOR_CONTROL */
> +	0x00000210, /* DB_SHADER_CONTROL */
> +	0x00010000, /* PA_CL_CLIP_CNTL */
> +	0x00000004, /* PA_SU_SC_MODE_CNTL */
> +	0x00000100, /* PA_CL_VTE_CNTL */
> +	0x00000000, /* PA_CL_VS_OUT_CNTL */
> +	0x00000000, /* PA_CL_NANINF_CNTL */
> +	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> +	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> +	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> +	0x00000000, /*  */
> +	0x00000000, /*  */
> +
> +	0xc0116900,
> +	0x00000280,
> +	0x00000000, /* PA_SU_POINT_SIZE */
> +	0x00000000, /* PA_SU_POINT_MINMAX */
> +	0x00000008, /* PA_SU_LINE_CNTL */
> +	0x00000000, /* PA_SC_LINE_STIPPLE */
> +	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> +	0x00000000, /* VGT_HOS_CNTL */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000, /* VGT_GS_MODE */
> +
> +	0xc0026900,
> +	0x00000292,
> +	0x00000000, /* PA_SC_MODE_CNTL_0 */
> +	0x00000000, /* PA_SC_MODE_CNTL_1 */
> +
> +	0xc0016900,
> +	0x000002a1,
> +	0x00000000, /* VGT_PRIMITIVEID_EN */
> +
> +	0xc0016900,
> +	0x000002a5,
> +	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> +
> +	0xc0026900,
> +	0x000002a8,
> +	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> +	0x00000000,
> +
> +	0xc0026900,
> +	0x000002ad,
> +	0x00000000, /* VGT_REUSE_OFF */
> +	0x00000000,
> +
> +	0xc0016900,
> +	0x000002d5,
> +	0x00000000, /* VGT_SHADER_STAGES_EN */
> +
> +	0xc0016900,
> +	0x000002dc,
> +	0x0000aa00, /* DB_ALPHA_TO_MASK */
> +
> +	0xc0066900,
> +	0x000002de,
> +	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +
> +	0xc0026900,
> +	0x000002e5,
> +	0x00000000, /* VGT_STRMOUT_CONFIG */
> +	0x00000000,
> +
> +	0xc01b6900,
> +	0x000002f5,
> +	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> +	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> +	0x00000000, /* PA_SC_LINE_CNTL */
> +	0x00000000, /* PA_SC_AA_CONFIG */
> +	0x00000005, /* PA_SU_VTX_CNTL */
> +	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> +	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> +	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> +	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> +	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> +	0xffffffff,
> +
> +	0xc0026900,
> +	0x00000316,
> +	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> +	0x00000010, /*  */
> +};
> +
> +static const u32 si_default_size = ARRAY_SIZE(si_default_state);
>   
>   #endif

