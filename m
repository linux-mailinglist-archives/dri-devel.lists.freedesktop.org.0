Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC693FFB44
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 09:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7A6E850;
	Fri,  3 Sep 2021 07:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80C06E84F;
 Fri,  3 Sep 2021 07:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4rN95CY8onAZ5FWyZZB3DLZuyMP+j3sq5GS1kBamnldLEhvney7Zr6X/Mbp1sty65mBwquv83n+jqyRuepVZ0GRyVxLtAClRILQ1DjBV5rJXskKoI0NjJQcfwmR3YXDlodaD+ZWLj9f5QNYjQSg+0OlFG6mBRGs/8iXUNIbpYRvTe1791kbEimF/7ND1k7E8LKvULeE+rSaVGGFx6Qv9vjN+UPrCco9xvA2QRVGa51WJG+rcWVuPIs15OgqxGyOE2vXv/iH9WQYwwBecA4Suyasg71WIU9AiH2yXAFKcO5oRlWAlkqtmGHTfuEuD0NmsHo6B2ZWIdeKbBqTeRJ8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VcsUEueTmliTaufNp4AcSx6VF136ounTubfGe2jkzso=;
 b=Pd1ozGMgZJvLg2ywuZBq4gcaRSeUG8XPpOFHxDLoS8ZSdEyGH9QpWCqYRy7IWVI9G4qMmZxeWdgr2S2cW6W3kbt2yqMEdUIMmdc1sTGKalE9wngZseghnnDufNegp+/BkVck0HdjDFU5HTErhnrj9A/mjaLjNfQdWXxdwgyvwdQBGV6WZ9OrssXxC1wMSnPhnmQFvQlgZoTyRkFPlrO3c59sY8M+xxWd0EoqlWeEcLVT5zXVrGF6mzmojEVgnYmnlkHqBN/AT0uPKQM3Fxo3dYQXrt+/z9sKxqxSjMMT3MUrGTBRLr0P9EK9KqpNwCdRAXBkkOPvmuAbO03UGR9NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcsUEueTmliTaufNp4AcSx6VF136ounTubfGe2jkzso=;
 b=R1umVusNSEfZVKC8bqq30S3qL9DBomVuOeJcMFu46tunr2d5kr+rEiJyYNMbYJd7U2aSa1I3fuwAge1XkWETHIib7WvW6phSE2it9PGY6Z3w1SfkyQDjyMifCZfwocjbcyN9MbHfkIL4TnaD8uVNxTjbv520immWirYxYP3lmAk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 07:47:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 07:47:04 +0000
Subject: Re: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx <amd-gfx-bounces@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <88539BB5-333A-4019-A411-D09859291404@amd.com>
 <627484d5-3cfc-5ac2-125d-5a902c852222@amd.com>
 <866A4D9E-18AB-4FF0-9437-E4E47A518BD9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f68af776-0a2b-f846-cde3-f4ceff5af1b7@amd.com>
Date: Fri, 3 Sep 2021 09:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <866A4D9E-18AB-4FF0-9437-E4E47A518BD9@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 07:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03774ce6-85a2-41f0-3e7f-08d96eaf05af
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390CDB93825ADCF4FBC3E9B83CF9@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aeWlPkY5Zf+gVhk/awmWHOtcJSb+Hz6fPSKh8SFGV4YFcmBRk7T7/jCV4GwRphr731hAEkTdf3MSfd8p85YejzzjXKs5vNmeg7IvAi4U1niaeyLuRV45xd9K0Zity7nKm9x9qmgWTmftgNA+YOkwZbOFaKH0bEzQqW7mnHbcZ5Wx7tVMLUHR26KMhrgj3bppJJyUPUoW6TDXnqyrAhrqhXMsHZ8pfDKYz0iUCWcZSu5cgAuSW3q5eiwCffbO2LWDMLLwAS+PSPcV4jqLnAuUUeYUc4GhbajqePM+5F6Gw3e+rsWrDUqzMc5i/tLC4kZcdQHDEyX0Y15b9h8U7+bfki+teoGSyFp0SGmaQRbPrnM0XKjFniRilQnHH3AzNKO9BCKrPnKLeoc72bVMljnrYwFKscso2KM8ZWPaXpCmMuT5kCr5IbHobwDSi1oxBCMgQyytfdiKtnQNGzixptcBilMk7Xmgv+DG2bygZ5R9tMOQQHDTT9+hi9vzjEGzM9+o3u/ZbHvOiNH7fHyM+GnHe+CdXV6rafNVb+BhfEbhEg5faVrpqZG7TBguXmjhPQaF2Kig2bBxLkwiq9+QZWRYf0lrK48ARUDMu6k0Ha8bv9h655Gl+tjgIJbpBT+6CF78lMtvhrszT6W5GgaJDOiVgX+Xtt6NiA0WKIHz992MQ1Bv6DElBzYCgOj0+0VjsbVZoCsW88yUXl6k3MrWpIeK2MX0UOE06Jux9mNdqN4eRQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(110136005)(956004)(5660300002)(2616005)(478600001)(86362001)(16576012)(31696002)(66946007)(66556008)(66476007)(2906002)(36756003)(316002)(83380400001)(8676002)(4326008)(38100700002)(186003)(31686004)(54906003)(6486002)(26005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJ0NlV1VmJ6RzNmZk9KZGdQTWJHcjZDK005ZVFCd1czdE9VdVZTcDlVNTlU?=
 =?utf-8?B?QTZpRlN4Zit5bWJXK0lyZnI1VmI1NUlzS3B6VGUzQWszL2R0TG5nb1Y2MUVv?=
 =?utf-8?B?ZUxjSno5eUpjV2RoNzNRSURuTU9IMVhjK1grVWw0RUYrd3l5WlJlbVoxbGk2?=
 =?utf-8?B?NGpyR01xb0ZDMVNMQ3l4ckUxN3ZvaWNtYmd3M2UwZjIyT3FRL3hNM2NmTFpJ?=
 =?utf-8?B?eHZIdjlZSTgxWVA3TlhMZEY3UFVvTm9JZ1JodmpMZ3czU2tvaURoVXVzb3hP?=
 =?utf-8?B?ZVgxMWtxOHBsaFh5c2l4Ukk5NmFOQmVvSU9MNmg0S1hEbnlKTlZJWlZnRVVC?=
 =?utf-8?B?YmtKZ0d1TGRQQkNDcmlqeTRCdCtISWR3Y0RIYndvNnVYMEVjQXBLelFpcE4x?=
 =?utf-8?B?T1ZmM1FTY1B0K214cVFsOU5GcGZTekg1L2xTcnpXSkw2cnJXeXJkaVA3bUlL?=
 =?utf-8?B?QzlvaVNmUFNLWmtwcDZvSER2Wnd3WG5lcE95d283NDB5azFPSU9ZMHM3VWRV?=
 =?utf-8?B?M0dMWC9xUVYrVXowVUZRQVFPRThpNDI3YkVHV0ZPcnlJbkNZb25NbmVOUVBx?=
 =?utf-8?B?RisxRHN3cEMyVWJKaC9tRXRaNlA5TldtcnBpbEpvVXQrR2pEcnhiUU9VNXN2?=
 =?utf-8?B?cFFxdXdWQVdJbkY4Zkp2eitNa2JNV29Fcy85aVk5NWR3UTlETHZ4UncvYitU?=
 =?utf-8?B?Tzl2T0U4czlTQjBNSXBCOXYwdjRyMXhTdm9wdE9pRitwU0tONFpYSDdSTTE2?=
 =?utf-8?B?YTcrWjUxNUNkZytlY1JZZzZDLzRPbUdkUG9TdFNpcmN0UG5sNksxZVAxQzNh?=
 =?utf-8?B?RkJMaVZmL24zTkJLT2M0RkhIWm5NeUpWVlJSc0JjYkd4a0drVG9MNmNMYnJS?=
 =?utf-8?B?d09PaitHQ0ppS01ZSXhBN2JCQWt4SmxIY1VIS3BNcTFzODFMbmt5VEYwWVlr?=
 =?utf-8?B?cm9xMVlwNEtDRGdsL0ZTMCtnWE1EaFN0VTBMU3Q0eTZwVUZtQjZKNktRMll3?=
 =?utf-8?B?WmJORlFMZkVON2JGU3NYbUlsdzlsTmdjcUJyaWhUVlAzQThhaWxzRFJDaEF4?=
 =?utf-8?B?ZW1FQitsK3I2cmlHRFpHdXRCeGx6bHBQbWJseWRGTFFHaXJIeXpmeVZreG0w?=
 =?utf-8?B?elFMZWhxQURMNGZSK3I1TVB0QmJIc3JnZnlBZ201T29pQkU5K3pZeklybzZG?=
 =?utf-8?B?ME5UTGlQU0lZQ0JiOWwzVFVUUGpDcGJJQVArQUc5enlnd3k3eStGdzRNYlZS?=
 =?utf-8?B?RnFiL1l3WXJmRWRuWU8zQll4U2l6WCtZcGV5emFsMGpVb0dwbXVPUUhPZHQ1?=
 =?utf-8?B?c3QxM2xYelFwTmxMZWVtZGdVQjk3MWpHcGE5NzUrTDJOWDZ6UW9HdkIrVitR?=
 =?utf-8?B?VFkrUHE1UnNmc0dRbW1HOVhzck1SdTlkMlhVd3JXRWM3MG4rL0o3QlVRbXRN?=
 =?utf-8?B?UkF6b24rN2pQamdWWkZwOURQZFZaUzlzWExEUXBKNDBSd3FaaFZUWDNpMmxL?=
 =?utf-8?B?em1GZmRIWktZZmRWTjdTaCtXSnZYdFlIL0JIN25TRzU5ZW9DMkhHaXJQTFFJ?=
 =?utf-8?B?bE1HZ3FtZWlWdXZsc2dQMjZKT0c1V3FlaVFybFRTWmFSMm01MWpVK0NXNUU2?=
 =?utf-8?B?WjU4Y21KWXhNQnM3eXVzMGU3OGJWWENKTDZ2Z0gxc2ZCczdDU0Fla0I1akEw?=
 =?utf-8?B?S0lINjV3T1JTcEFGQnZOemthZlJjT1R2VERPOWZIQnMxOXUyQW43SVMyci9S?=
 =?utf-8?Q?xzGmKjTYcVgOwacA6oatcPk7kh/WKhm1JFXA3Zk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03774ce6-85a2-41f0-3e7f-08d96eaf05af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 07:47:04.6067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1V8g/+lgaEdNx2pp9+yzcQIO9+Zyl+9gE+e+5YuN7jSaUH/Fp8LqvccEfU9zzeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 03.09.21 um 09:15 schrieb Pan, Xinhui:
>
> ﻿在 2021/9/3 15:04，“Koenig, Christian”<Christian.Koenig@amd.com> 写入:
>
>      Am 03.09.21 um 08:49 schrieb Pan, Xinhui:
>      > Like vce/vcn does, visible VRAM is ok for ib test.
>      > And in ib test stage, VRAM is sufficient.
>      
>      NAK, that won't work for older hw generations (e.g. SI, maybe CIK as
>      well) where the IBs must be in a specific GTT hardware window.
>      
>      Christian.
>    
> Not has older HW on hand for test.
> But the uvd code says below. Looks like IBs should be in specific VRAM range[0 - 256MB]?

Well, it's a long time that I locked into this.

The old UVD hardware has multiple 256MiB "windows". One is for message 
and feedback buffers which *must* be in VRAM and another one is for the 
DPB which should be in VRAM.

The IB on the other hand always had to be in GTT (except for 15+ year 
old AGP systems where it should be in VRAM as well for coherency reasons).

Could be that my memory is failing me and on SI/CIK both GTT and VRAM 
would work. But key point is don't touch this without extensive testing, 
it's really old stuff and was extremely painful to get working everywhere.

Christian.

>          if (!ring->adev->uvd.address_64_bit) {
>                  struct ttm_operation_ctx ctx = { true, false };
>
>                  amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
>                  amdgpu_uvd_force_into_uvd_segment(bo);
>                  r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>                  if (r)
>                          goto err;
>          }
>    
>      >
>      > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>      > ---
>      >   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 4 ++--
>      >   1 file changed, 2 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>      > index d451c359606a..1c099b79d12c 100644
>      > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>      > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>      > @@ -1178,7 +1178,7 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>      >   	int r, i;
>      >
>      >   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
>      > -				      AMDGPU_GEM_DOMAIN_GTT,
>      > +				      AMDGPU_GEM_DOMAIN_VRAM,
>      >   				      &bo, NULL, (void **)&msg);
>      >   	if (r)
>      >   		return r;
>      > @@ -1210,7 +1210,7 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>      >   	int r, i;
>      >
>      >   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
>      > -				      AMDGPU_GEM_DOMAIN_GTT,
>      > +				      AMDGPU_GEM_DOMAIN_VRAM,
>      >   				      &bo, NULL, (void **)&msg);
>      >   	if (r)
>      >   		return r;
>      
>      
>

