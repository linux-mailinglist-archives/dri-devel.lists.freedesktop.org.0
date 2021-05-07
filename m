Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F9376A74
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 21:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3586E3C4;
	Fri,  7 May 2021 19:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2051.outbound.protection.outlook.com [40.107.102.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6056E2F2;
 Fri,  7 May 2021 19:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNFClaetrIVbHKygDrM8AHbIV8jl6vY5G49Y7Welvbsy89ylV265aV/E1jp3j7/6PhzPqRdrHb/ahA1Bt79018fliXr9xAvugWpxzI7jJbNS74XINlGI3nE8DMp2cqAN28ua2yyk0PUhxoIHOl7wIn/c+DBdC7YjfuxJe+KrVxKb6aJLfT9fPUQFjWfG5rEP7QveeFsBtHWeQgV98kpy02YKnRpczd0hyW5V1OdMQeSAAmzzLUI8CsKfqfkJTCQKCVyLN6jFOP8UkrF8jvDla+uvFdsrx9x1bmrZuXO7fXc6EbeWy37SjNzAXCAU7Oh/KBzTetF6+o6AWnMrwf10AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4oqaa3j5/8Vbw4bReAo8s0ui2ir6lGCXNUv5iiuAdg=;
 b=IQBXINSenTE+Zm7sarBYQ+DVAq0vsnbUM6clVCsqsHaUvKov1Po68QO54rRABBER/vdU7ZrASb+LTOY60JSPujifcpppKmeDbX9ugJLh9lWsnTPa9YMJ/ILrvDmz/A2zz6LegeLjuQZFHzXXZlzkFXuQ5j0KpixMUA6VLUg8LtHyovxam39bC2X9dcxnCED5H2bN16IrH6u5Y71wBEeA00F0l/bEwnP8dXQH0wJ3Wio49z0G40Blan4sCvqWhMVlPT7bD5b5GhTH+aifufh+tG96wrhkXE+rOTtzlb4taBlbfKUF2+dn4PRrrCaLrHuocLUNHdNUOt75GAPpN3jDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4oqaa3j5/8Vbw4bReAo8s0ui2ir6lGCXNUv5iiuAdg=;
 b=4fmBaFB3EoGfb83c12hlN2YGee0+IU7iN9unNg8sEyWTVxeiCoPBZd1u3jekOXnB30RfH0PW0G7rndgKPJyJb3MMVX6Y7efFC6UGMpey+JoqhNAqet0e9ynnw5C1xsoBonNOdwuPd0IygjWzPJ4KejftMQY1rFtrBaUoRYzIkJE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 19:05:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.027; Fri, 7 May 2021
 19:05:11 +0000
Subject: Re: [PATCH 0/4] drm: Mark DRM's AGP code as legacy
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 alexander.deucher@amd.com
References: <20210507185709.22797-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <28cf654a-b4cc-7f94-586f-9465d657e4ac@amd.com>
Date: Fri, 7 May 2021 21:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210507185709.22797-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7fe:78ce:5249:f98a]
X-ClientProxiedBy: PR2PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:101:16::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7fe:78ce:5249:f98a]
 (2a02:908:1252:fb60:7fe:78ce:5249:f98a) by
 PR2PR09CA0006.eurprd09.prod.outlook.com (2603:10a6:101:16::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 19:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8336aa53-f609-4d31-0e3b-08d9118b0989
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408FEFFFB688DB9B1C2529E83579@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDPJ7Zb8TecYuIKb3kIbvPKuKRbK31ih9Gv2+DoCTcLfoXHHmDSByZUpEC+Xt7uXAwm48XZ6j+E8tO24Qogzz0vE58IXkzuwNzw/kM700p/4yPzou45kxN7d7VBMagFtvB6Yp5mORtOVD/5DhFZ71lIG69ijoa6Z1gHGs+BIT18z0exdiAn3bppti+LZp4JXEwbKQD1qlaFaws2DzLNJiy5TDmtM2orscjVPxbTOKNRW/KE5kx+fnOe77YT1QV78wxptpsQxoR3K7BkgC6ChoCJjltJa/Q7uYdMhSYuhwO3WyZxedC1MEWLtkUIX5LIFWp7bgWtOeYMMtPQ8bjYckwQfePCIFbvaEKN1jW9jfaulrAwfwN6yqwllNQqcRXO2wKE/SeNoRKiwWbV84rgDxvSX/hHS2iTPA6Sm9LbtUgHUnq8Az9kfKKZKtWFT/A9DBV8xFwQ8I0AQoUhpSxLZy148KTCvIx0UhwkA+kb4z+s7/w2stdArMpNrOHFwoJRkbG+C8wHYzRCfrSs8Nkqbc0FOu/vMbVahnSfrg7WaLAc++Xf7HhmXbWCF5qlq9vFyvcNPQ+iSv7qLkT4U7wEOzRqBjwTO0fXhWK21YPZVaGx2sTShE0pHNvQcWCnq5vRmcnlyYREDUP7XMVbrVmd+OfL5e9iQd2bd3X/C901h7crrVCzIiKxCRvhHrsmTNwb2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(6666004)(6636002)(186003)(5660300002)(52116002)(2906002)(66476007)(6486002)(83380400001)(38100700002)(66574015)(2616005)(8936002)(4326008)(478600001)(36756003)(316002)(16526019)(86362001)(66556008)(66946007)(31686004)(8676002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHZNOFRwck95dEh3d0czdHNralpzZm1EODVmczNUZHovNnI5MW14alhKNDh4?=
 =?utf-8?B?UVYzdERQVTVYOVRxcU1EMmFUVlNDc1NFcHcwR2czeTRiS3RQQ01pcmlLbHU1?=
 =?utf-8?B?bmYyRW5VdThYU2Q1V1IvSFZKZkpjcDBTbmdVQmJsaUowMEhYRjJMQkFKZnZl?=
 =?utf-8?B?cjhGM1RZaitqd0lWbStXNHlmdkR1bUt5dmdWT0pTMHFwZENBTTVPSHlaNVl1?=
 =?utf-8?B?ZHh5VlVhTkFDY2NNRmtwZUZ2bHNJZE9zMjdhSDJRM2hwb3Zjd1c3MnNvVm5F?=
 =?utf-8?B?eTJpUWpaUFNha2p6c2kyNWpHZXRhMUtEUWoxY0JLWlo1T2ZZMjM2UzQ3VzJH?=
 =?utf-8?B?L0RML21FNmxmTHFCeWJQMEg4SDdwQ1N1YWZDYVBwZlFzSGllMWlLOXJacDUx?=
 =?utf-8?B?MHN0UndXK0NvOWV2T09zTHpBdU9qUXVFTFpDTzdSTWdxRUM0eTlXTGs5Q2tv?=
 =?utf-8?B?cmFub25HZ2JiZTUyVTBxek1wVTR1TW5hWFJ6bG1ySTcyczB0TlJWT2JUS1d6?=
 =?utf-8?B?VU1KZkhVNzFXUHFuSGptcDV2bVd0bGdXUW95SlRaeEtQdHVhTDNvNnl5Y1d3?=
 =?utf-8?B?OW5WbHEwMjZiK01SYlhZK3ltSHZYd0c2UWErdjNaN3hWZW9hNVJuRFp3TDdG?=
 =?utf-8?B?UWJuWTZ4SHcyUm5SVXVDY2lqdHZDMlNyaU5OWDVhdHM1b3JSaWxDQ3hFeGlR?=
 =?utf-8?B?RTZjdFBRT0lYalUxaFpNYk43L3VBemxaekZ4UWJxNjJNVVJWTjBZMGJva0da?=
 =?utf-8?B?VmozSEJJLzdwUnRmdTBKRTNwdVdUNDh4djVZbGRSdThia0cyOVpZRlI5am1k?=
 =?utf-8?B?N2pvelNaU3BiaTQ0QW9mcTJUME9lbWhTSllObkhBbUxHRmNKeGN5RGthc3ZH?=
 =?utf-8?B?YVE5UG1kVnVRRnhYUjVrRkFjMk85cmdKM3N6SUdjdkdJYmFpMXZrYm5ZZm1M?=
 =?utf-8?B?c01YRngzSzNkUmNrVnFxbzhNOEIwNXAyYmxOSElDOEV0MmU3ZHRzeVFVSkFu?=
 =?utf-8?B?dlVOSkpMVlNUMXN4di9qbERMNEFBRTc3MHBRRDhSOG1KU2pIOHQwN0V5Mzg2?=
 =?utf-8?B?eTZpU0pINGxraFovS2lWUE9tVy83RTlqZXBvN1VQa0FyUkpZY1NhbHN3NnJH?=
 =?utf-8?B?anl4eGluUExHd09xWjM3V1YySk1YWlc2MWVZZWIzYUhCSU9jeG1DekJRdGJp?=
 =?utf-8?B?b0l1MVdsd0tHemRqL3ZDRnNVNXdEUVFZOFlPN2VDN2pkRU5zcTRIWUlWcUlF?=
 =?utf-8?B?YVN4QUJla0xpMWRtWUxubTY3dE5uYXgzRmVlTFFwcUxVZDczZ3RhTWpPZFhs?=
 =?utf-8?B?aGNQQlpqblRpS2REd24zaGdORXg5NEoyWTdlRnl1T0M2NitJSlRiemhhbU4x?=
 =?utf-8?B?ek1YT2pBaTFDU3padzgzR0poWFFtS3lWZlJodzgyd3dxTjVuU3dJZDVFclky?=
 =?utf-8?B?MkFDTmVOUEpHTTJjSFNySlN6RmNrMGtzK0ZrUW1xZFFYa1R4bE9uZ2JVUEgv?=
 =?utf-8?B?TTJLWGVUL3M3WUtxUUYrVHFydEhxRFlqRktQYlR4bjduYUxlUkI0dUd3VGpM?=
 =?utf-8?B?OUhIT2ZzYXBiZGdjVS9CeUd3dmlkNzNVL3AxanBhdzY5dC9pa2NqenB6bGRZ?=
 =?utf-8?B?NE9kRGNRQnF3OW4zU3htTGZrSVd0aUcwUUF0UzRBNlFtNlJubm5hTFhpaE1o?=
 =?utf-8?B?KytpSVdHMU8yWWhGTk1EWUpFaFNEbDNFbk5yNWxKekNCTk1jMmdHUzQ5Qzd1?=
 =?utf-8?B?bWI5dlFpV3hRSEVyOGpiRFB0c0txL1ZKcWFrMG9ySjJONGNpMXRkeGRIcnZm?=
 =?utf-8?B?OW9GR24xZjk0OXJKVFI5eU1MSVZLdDcvcEtaYnZPSCt2bkFTK2N4SFFIM09N?=
 =?utf-8?Q?r3kuk/2YrbcFE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8336aa53-f609-4d31-0e3b-08d9118b0989
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 19:05:10.8918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f/+nKw/Di240WywNUZOB/Xbs6w/faM8mtdtiQjW7M8KvAKE1tbKkRZfWnjEzzkf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Christian König <christian.koenig@amd.com>

Am 07.05.21 um 20:57 schrieb Thomas Zimmermann:
> This patch moves the DRM core's AGP code behind CONFIG_DRM_LEGACY. The
> only use besides legacy, UMS drivers is radeon, which can implement the
> required functionality by itself.
>
> This patchset has no impact on the AGP support of existing drivers.
>
> Patches 1 and 2 move some AGP code from DRM core into radeon. Radeon
> uses some of the AGP code for its internal purposes. But being a KMS
> driver, there's no reason why radeon should provide the rsp AGP ioctls.
> So duplicate the implementation in radeon and thus uncould it from
> the legacy code.
>
> Patch 3 moves some AGP-related PCI helpers behind CONFIG_DRM_LEGACY.
>
> Patch 4 moves DRM's AGP code behind CONFIG_DRM_LEGACY. The files are
> then only build when legacy drivers are active.
>
> Built-tested with different config options selected.
>
> Thomas Zimmermann (4):
>    drm/radeon: Move AGP helpers into radeon driver
>    drm/radeon: Move AGP data structures into radeon
>    drm: Mark PCI AGP helpers as legacy
>    drm: Mark AGP implementation and ioctls as legacy
>
>   drivers/gpu/drm/Makefile            |   6 +-
>   drivers/gpu/drm/drm_agpsupport.c    |  99 ++++++++++++-----------
>   drivers/gpu/drm/drm_bufs.c          |   1 -
>   drivers/gpu/drm/drm_drv.c           |   4 +-
>   drivers/gpu/drm/drm_internal.h      |   5 --
>   drivers/gpu/drm/drm_ioc32.c         |  19 +++--
>   drivers/gpu/drm/drm_ioctl.c         |  24 +++---
>   drivers/gpu/drm/drm_legacy.h        |  30 +++++++
>   drivers/gpu/drm/drm_legacy_misc.c   |   1 -
>   drivers/gpu/drm/drm_memory.c        |   1 -
>   drivers/gpu/drm/drm_pci.c           |  23 +++---
>   drivers/gpu/drm/drm_vm.c            |   2 -
>   drivers/gpu/drm/i810/i810_dma.c     |   3 +-
>   drivers/gpu/drm/mga/mga_dma.c       |  16 ++--
>   drivers/gpu/drm/mga/mga_drv.h       |   1 -
>   drivers/gpu/drm/r128/r128_cce.c     |   2 +-
>   drivers/gpu/drm/radeon/radeon.h     |  42 ++++++++++
>   drivers/gpu/drm/radeon/radeon_agp.c | 118 ++++++++++++++++++++++++----
>   drivers/gpu/drm/radeon/radeon_drv.c |  13 ---
>   drivers/gpu/drm/radeon/radeon_kms.c |  18 +++--
>   drivers/gpu/drm/radeon/radeon_ttm.c |   6 +-
>   drivers/gpu/drm/via/via_dma.c       |   1 -
>   include/drm/drm_agpsupport.h        | 117 ---------------------------
>   include/drm/drm_device.h            |   6 +-
>   include/drm/drm_legacy.h            |  82 +++++++++++++++++++
>   25 files changed, 375 insertions(+), 265 deletions(-)
>   delete mode 100644 include/drm/drm_agpsupport.h
>
> --
> 2.31.1
>

