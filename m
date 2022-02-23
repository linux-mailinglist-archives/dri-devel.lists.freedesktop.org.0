Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E084C1632
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735DE10E9A9;
	Wed, 23 Feb 2022 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4910E9A6;
 Wed, 23 Feb 2022 15:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu5fqMIKsqfOroGKuSJ8Vu/b7LM4jtA46l1OUxQjUVWNoY+KqcDXCo1SIzkcLna4pIHxV5yCjzxOvXJgNNf/qlbqHueo/k0LpdLzqfUj8w/lxqWarBP1vvdDk5Gcd/aYIElj6rrUS5teHg3xjeNn9q80DQVmifjjJdKAtKafyeasQWo+bPbaBrUzNHDWvP2ja875gVph5LZ+GELMx2yIKgpxWE6d9gInZp80KnpeRqKKGosAB67RwHFHmWtGbU70qR7SpJLRoowNxdwkveil2YfLV9payEYgz762C2Mc5oLVIHzLTcDkA3xwvhQ/WoXT1ySKeJRSHFYruGV/e2qLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnyyUaolNVtstSzVQY38+zRLmkySBkYuw5e2DLUvGVU=;
 b=aqb6xtxs7IvAqoJ6UQt6fUsXpDNEQJ2J+6uoojF+K0l0H0Fzy868OZk4Xgtx1IfTyl+GpH5oT88oF9aYvWtKdbhW/TlJmrYnxxWl3kx8pw5nFnY7dqniUlwvYGWO+UiBT95Au7nh+EaKsQ7+YPwO+9d19+hfzJAaAq6lVbQjeoHaDa57KjydhLOVYmugenLqGwTgKdBIBTQbc1NimojarZpsq/GLzqlSUJPU8Lu9E99lY7Rql2XV3aPHV7A/OjLVzYyL/JvgmHKFaJasP5ROOlU4Hq5Qe7QddLm/faabuVqZl44k6twJpm8xtqaiDxoc13e0+K9/sXi00gkEbQvzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnyyUaolNVtstSzVQY38+zRLmkySBkYuw5e2DLUvGVU=;
 b=KJN6Ob9Byi6EeJ/DV+LnwqnnEx2vYnaOifj4hYmD6+4IbEC69/Ilb1z80Uv1ac4aDIcZbUwaRhlkL28peoaMYuMxb4ZcywwaZIaTHcvrA/BWe4/2A0LpNYIW9UzeMiZ//8UsG2cBtQys+28YlvX/D5uUoGFDyxduJ4bQjzhsUz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2567.namprd12.prod.outlook.com (2603:10b6:4:b2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:11:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:11:22 +0000
Message-ID: <868b0d69-0620-95a6-ed47-7f89288afdc5@amd.com>
Date: Wed, 23 Feb 2022 16:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] drm/helpers: Make the suballocation manager drm
 generic.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220223135112.655569-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220223135112.655569-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a305ab36-1b45-41bb-5068-08d9f6dec096
X-MS-TrafficTypeDiagnostic: DM5PR12MB2567:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2567B0E5BD8603F630DB5BBF833C9@DM5PR12MB2567.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5VdXy0VJucspKDRfVUhVHjQD5ruiAXSB/N68LwI5e3ylRGJPdC9QRYQxTU/kjXFEfORa2vz0J3P1yF+a5u/k0WxfBiTpRw5VZGGKHBVPoZ1F5i/VLcnmFTsgDA9lJ9UtXsdFQg6Jpa/flQ9G+1pzSoiEYPIv+tTTyb32L1eBIU0Zspbe5/IeEW12Y9cToUnHANcgYlqSuUfUBHk7kziXZLQvMZqZmnJcNeDIVp5HKbMhbF+rbiXDuLljEM2pBNI0eCgKaN0Zfy5lDixiMXK4CONSc1u5+R61fUhtRkdh1BTJGojhnE7xzFslQHL6XcszYS/t/9kinapJ/3dXnznCQnGEmLNjaC4gxfgDk9RyxVZV1ZEnckHkn6/AS1wWNh0cYI2hNacHk0Jug6ViklLJWCgpRhHaob+KOtPWlTQfbQU0QUcaFvBVpAQhEG7u9h0yC/z8ZCHaTk31SvNVjlyEikCNka0cg6VwfTXSz82RYcdzph0ZsZjcxqk3Nii19hFgQHpGdzv90pCzoN/goLsFNEtkFyCVK8ijgjEgDgeoixwGKCJEHhnq+alH437f44V+Xy8oIHd03emEJUID3Xii10oykbsXlep0DG6ge+qg2AeyesypBWiyIwmxoqsGxOcJEjfBZWhJWhWqthmFTJpLFb9aag4QV4Um6cTDyK6+HpVRRPop+Y7DRMvY3lqDLufvcYxDAOp+VuG34XXcn60ojzC9u/qhKG8kDAC0Oty2jvBSzgY8ZBslEhGx1tRLpjXdNN1if1YiiaFzRb4bnKLTXtx6UyxMq2YwNcOWpOgMrOTkVy6JwVgSzILtP6JKUmea
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2616005)(6506007)(6666004)(38100700002)(36756003)(83380400001)(6512007)(31696002)(31686004)(86362001)(508600001)(6486002)(66946007)(66556008)(316002)(2906002)(5660300002)(54906003)(8676002)(4326008)(66476007)(8936002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFlvaG1qa3dVV2tKbGhUUVgyWmVKZXBhZVliUWNoQUtkejl4clJ5RWV5M2ZZ?=
 =?utf-8?B?Lzl6UjNMWXVZYjRrcVRRRmhIM01iWGlzUVVmazBab1FudWRNWk9nTjhsYnF4?=
 =?utf-8?B?ZHRIUmhkcXBVSzV0N0p4Uk9DNkl3Szd6TGhLUGZRdzcrUGdQWXVzYzJNbHEx?=
 =?utf-8?B?YTZCOWI2eUlhYlpUZW5hNmFhUzVBeTNPZ1A5dzI5aVNqZUhUVDJPeFVyV2l0?=
 =?utf-8?B?NXRFalJlczNvZXh0V1dDbVQzS2t4b3RiWG0wRXMxcTVaQUdjMk1DazY0ZzRK?=
 =?utf-8?B?NGN6QmorQVpRZmdPVXdqRzZjNUVIQXlrN25wU1BQb3VXMWpZOFAzQXAvOTVj?=
 =?utf-8?B?OXAvdlNjWE04L3ZDRFhGcVRacVJBNnhEc253c0o1VkFwSnczZ2pRZ1Y0WVdw?=
 =?utf-8?B?aFY5Mzd5ODhkZXNJNi9IS1hNd0RjYTFQcnk4SkpRSDBFcW1RN05PNEJkQUVP?=
 =?utf-8?B?MFR3eGE4MzlQcHdzczkzWm5WRHF2VGh0QkplWmxxVjYvYm1xdkZIZm5zTTZY?=
 =?utf-8?B?cU50YXFVaWRDeDUzSmVyenA2eEZmczVtdXpSRUR1djVXMXJOVkpXR2JINFpC?=
 =?utf-8?B?QTR1dlpZaFgrV1g4RG5HVXlmVlBhd0VDMmNWOTZCa1R4VVNkNkUyWEZOcFI0?=
 =?utf-8?B?Zkc1b2VidlJ1ZHpFcnBuRWZMcENPVGtWakdGZVphQlVYSncrTUhRMWNBZFNw?=
 =?utf-8?B?dWNON2ZjWURZcTBUZ04vaXB2T2NyWDdZbVdQdEpFSTBTQUxxakFPdmJlNjE3?=
 =?utf-8?B?UGRpZlBJRlJmNDBJRTNkcTNQc3ppN3hxK0orbWNIbnpFQlYxRE1xSWhuUDZF?=
 =?utf-8?B?QU1LYXJOaUVDR0Zuc0FpcENCcG81eWkzdlJjaUlnZktpK1ZmOXpidmJtRkVP?=
 =?utf-8?B?SHVjckZSTlFtcHhzeE9XR0JzVnlGUGZXckZiYjByMkFpK0duQ2o4ZDc2YTQy?=
 =?utf-8?B?ZUtnN3ROSVFaSWM0aGpLazBmd2hoTmpvQmlYbVlpMC9MWEowdXo3MUpnNmhr?=
 =?utf-8?B?dFJpY2gwcXpEYm90bXpzZmI5SU41c1VlQXFZMm5WeGpwa0JkdVN3ZFdmUmlQ?=
 =?utf-8?B?NC9rQjBXM3d2bWlwZE1hcGpySUNZV0IwN3ZmTkgrdFhVNXg3MEswM2Ntb0Mw?=
 =?utf-8?B?K2ZaNTNmM0J1RUM2dFlJUUMremlQTUZoaVlzY2tKaDh6a3hKdmlJbzdDNVBk?=
 =?utf-8?B?b1NSZUsvSFkxeDRrZ290UFY3dWtlcm9OMUtMU3Z0ZlhsY1F0bDM4YVFLTWMy?=
 =?utf-8?B?ZGlIeUlJN3R1c09CS3grWDU4TmxVUm5qUjhoSnNkMnl5SW9sRGhTRFlVczBI?=
 =?utf-8?B?WTlIV2k4K3dNbm1mOVFTTm9OOTlPaDVPZkx4aEhMN0lMNkNFU25ZYTJGMUxz?=
 =?utf-8?B?OHBkMGhQdzZsMVpYMlJ4OUZWaFNBbCs1TjljWGszVlhqbWNmdnJnNlRvcWJ6?=
 =?utf-8?B?aHBoNWdTQUpYRFJsTE9CQk5mbzRXZ0xuc2IrWVZwdFYzY2VlaWx4UThQNE5w?=
 =?utf-8?B?Z0VNZE5HcDZNTmFzSmFseGlEQ0Rwd3NPSnlOTjBXRDVseS82SjZyUHYrWkpE?=
 =?utf-8?B?czFpbjR3S1Fxb3l1MFBFNTNWbHRwZUdveFdmc2dVQTh3KzcxUUZvZ29VU2Fj?=
 =?utf-8?B?Nmx4dVlkclR5U1JPYnZ6Z0VSTGdQZDlUMTQxcksyTXgvaWg1bG92U1RIMEJz?=
 =?utf-8?B?TGdEcVZQemRMeUYyQmJWaktReEptdmpzWWdIemNlQ1FsaXlYMDdySlQ1UFZV?=
 =?utf-8?B?dlRrT1A2Z3lvTzZLMGY3aVVkZ3I1bDZ3ZlZ1Q05UQjF1RllhMnhTUmNucE5s?=
 =?utf-8?B?ckg3MVVBVFlYdmVSRW9yUU5RY2ZwcS9QZVljZER1UDU4dW9mOFhCaTJIcVVI?=
 =?utf-8?B?SWhhc3RLYTBLY2FmK2xsaXFvcVh6MER4WHpFYzUrRjl4OUZsVjlCbmlweFJr?=
 =?utf-8?B?aEhqWGlPRjR4TnlsQVNjb0o1aERPVTZvQjV2dDVHZTNDL0YzeFJERVgweFRD?=
 =?utf-8?B?N09pdnNNS2V2OWMvZE16bTluT3BEVkhBRWdXWDdjVnpxQ2NWVWNpVEJmVFVU?=
 =?utf-8?B?YmJGWXg4ZFRoa0JHT0NsWmFrWGNyMmVHN2RMS1krcWZGRitmdE5GUXBUbHNk?=
 =?utf-8?B?UUtoRkx3WjBqMU1HQncycWdIQ04wYmdqYUNIck1ISGZmNkJtT3JsSlpDQmxa?=
 =?utf-8?Q?SY8CNm9bzX/5OxsoqLwZ4Ck=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a305ab36-1b45-41bb-5068-08d9f6dec096
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:11:22.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+OEeXKzJG4vvnNgWAKrI6cKMfu/TeEfNwvEV6tGtm8E2nFnfod/Un0G9pQ6jUf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2567
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.22 um 14:51 schrieb Maarten Lankhorst:
> Second version of the patch. I didn't fix the copyright (which ame up
> in the previous version), as I feel the original author should send a
> patch for that.
>
> I've made the suballocator into its own module, and did a cleanup pass on it.
> The suballocator is generic enough to be useful for any resource that can be
> subdivided and is guarded by a completion fence.

Well the main issue is still that you removed the per allocation alignment.

For amdgpu that is not much of a problem, but for radeon that could 
cause massive issues with UVD semaphore synchronization.

Christian.

>
> Maarten Lankhorst (3):
>    drm: Extract amdgpu_sa.c as a generic suballocation helper
>    drm/amd: Convert amdgpu to use suballocation helper.
>    drm/radeon: Use the drm suballocation manager implementation.
>
>   drivers/gpu/drm/Kconfig                    |   6 +
>   drivers/gpu/drm/Makefile                   |   3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  29 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  21 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 320 +---------------
>   drivers/gpu/drm/drm_suballoc.c             | 426 +++++++++++++++++++++
>   drivers/gpu/drm/radeon/radeon.h            |  55 +--
>   drivers/gpu/drm/radeon/radeon_ib.c         |  10 +-
>   drivers/gpu/drm/radeon/radeon_object.h     |  23 +-
>   drivers/gpu/drm/radeon/radeon_sa.c         | 314 ++-------------
>   drivers/gpu/drm/radeon/radeon_semaphore.c  |   6 +-
>   include/drm/drm_suballoc.h                 |  78 ++++
>   13 files changed, 603 insertions(+), 693 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>   create mode 100644 include/drm/drm_suballoc.h
>

