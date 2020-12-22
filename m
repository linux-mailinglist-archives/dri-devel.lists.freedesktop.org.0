Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94E2E0F81
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 21:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AFA6E3DA;
	Tue, 22 Dec 2020 20:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9CE6E3AC;
 Tue, 22 Dec 2020 20:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1QpY0fKOb0+KmtgCRB2R1R2VywURGGAUzLJaYTl/cpnsyASgWx292jgYslXHVBNe4uCeNoJ1Lg607GXlq5xUTH0TAHHrdYX/WV/JFDSSmHEsQZRndiAwy7fUGz3pWy97u43lc+2V2Rm/7fx/BxydJRN4w2OfYr41kKLr4a7b85wC7+mOm+AQOUV5u4mwPgTuKAcJMCjlgxYS2V6KlouAN8OmbDaNI3Pr6PxXjefXftPwhv3dXAXjN34ejMUb6sCP5W3izpmJZu+DrlwPZ/EwZqh0WbGajh+UucIDAnd+IPmjDQaWIx9rkN9v/T5ouMlfTY1Br195wS4XiqhqtMK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0LytZVvux2zXMMxLIFIoY2maNxpre9JKXiSSF5giV8=;
 b=gCczwzZCIN4NQh5dSwpNW7y7ZgbN6ulaOV1Wh5O5jAoXFNPvaJtX7VtOXO00u9sBr353GKPBnXsGUa6L4kRGDXhVRDeny/ggIoqsrITpOUUadFyPqU5ZfFNZBKMy1ZqElmwySrjaJhovUY+cqAg+QMQJD9yDXxFfWp9Q8rOg58lEXb8lsuf1l3W3Zml2BCEDgiJ9F0UdgITOX1D2/n6JAd2H9DEC958UnxbLJjdAlPPnYaw4HixWUA1dPkxEptr2UK9M03jDVyEaBOQiTBIV+MzEJB5bbwqbbeU73jyG9e/e7XSTN11oQpRNIXafOJuQfsV357bVUOd98Owp0KKrQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0LytZVvux2zXMMxLIFIoY2maNxpre9JKXiSSF5giV8=;
 b=RaK+e4Y9tUKC8lXVFm1oqP682fZPRmWjNN7sVwFsFa+XbJQhiGL2RjdkHVwMFzfFaK6qTGlzEqfTMESLi5Mifqy/d6mrjH4u75+W7lWs+jdf3gdiEPlyZue/52Kk+bgIViUHohyhy3zfHoaVMLy2DRlcyAU+4BT7g4OXGksjCt4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3461.namprd12.prod.outlook.com (2603:10b6:a03:da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.31; Tue, 22 Dec
 2020 20:55:29 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5%6]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 20:55:29 +0000
Subject: Re: [PATCH] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
To: Zhan Liu <zhan.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 Nikola.Cornij@amd.com, Stylon.Wang@amd.com, Chao-kai.Wang@amd.com,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20201222031812.67228-1-zhan.liu@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <1c3f0095-b76f-5107-7b71-c284b79d8a09@amd.com>
Date: Tue, 22 Dec 2020 15:55:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201222031812.67228-1-zhan.liu@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 22 Dec 2020 20:55:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d05e0a79-55bd-442f-9c5a-08d8a6bbea6c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3461997AEC828A5116180AF1ECDF0@BYAPR12MB3461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Y3uJj6Xs7r8uM07HYa65tYTXxuyDy0ariBsLbVnxWUJkX9zlsad0zCjfqeDaLha3PchiW5SNtMUyjt67oXf2KX568oKNPjNgDp2NKZSYvABwk5jUzkxARyvkSp7U0SxMh/9+9xxCHQsF3vlAlyg5+3OvRR3RIoJeS/O8RDIlIUqLshj9/nmvEOARy8W9CPJX+EkqKbQ6pRbuLscR4xTO38fuUR+OGQfjUTwF4LBsTwOrGULmm+4PYvglBv1/j3lI7QXC3LL1beEHnDLqNDP815ql/9QD9tugftT3JzMs/QIMC4ZUOtl9Jk2/sNo3X6bvIFSGgHNAPPHvOQiyYo/XmLANMmxYak4w4FmAgWqX5EFaKYYrjuK7sn85IQzul7sKkCxU3cxFHyL0gu+EoCzX4EScmkkVi5eqqKu1hyiWSKZGCxIdh6DwV+zI2unk9UyELN0yDU5YuLOV6qUatvT5twd7xipyhiBQPMsJfbQ7B0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(2616005)(956004)(66946007)(66476007)(53546011)(66556008)(26005)(186003)(52116002)(16526019)(8936002)(36756003)(31686004)(5660300002)(6486002)(8676002)(31696002)(4001150100001)(478600001)(110136005)(83380400001)(16576012)(2906002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkdlR1pKSFNwN2tKRUtVUWo0T0NQbEFNK21GOXlmNnl3R1REblNYdmY2cEVl?=
 =?utf-8?B?aFNITkhROHlGMWpFNjhsQ0o5ekZUTlFXbHlxWkhXTXFrTVJvR2puWVI4NEdh?=
 =?utf-8?B?bnhTWFBXUWxheVZMdCtQWWE2S29SeFJvTnhkcDRWaXV1RDd0Z014dXdvZm1n?=
 =?utf-8?B?UjI0TVVpb2o0Q08yVjhyT3paUkFYUk9Sdk1GeW1QM3V0NEozaEdOekRDeEFq?=
 =?utf-8?B?R2NxWTBMaVhGRGRRZnp0bkh5SmYwUXh3N2JXdXlua3NzVm93NzdNK2dvTHV3?=
 =?utf-8?B?Q0l3dG1qY2FmOEh1ai80R0JaZjRzNEkxK1lacFNKM1VsRG94Y2dScFNiOE5W?=
 =?utf-8?B?L1dBdHB6WkZwWFVtQlE1SVNKUEF4T3pNZ0JkcFV0WUJSeVY5bW5CZmVLd2RB?=
 =?utf-8?B?bjFiTGVsTEpkTmEyYVl1R1AvQ2o5SmhTcVVub3VMQVRoUmVDT2kwNGtFZE53?=
 =?utf-8?B?RThUdTRxVGFKNmNXRWhLbUQ4ck95Q0toWEVQZDlHSzRNOU1IdlhpUHYzeHR4?=
 =?utf-8?B?aTd3cjRESEE1eU9CQ0d5cFZRRS8rWVp4cDQxdThVTTFiYS96UTZ2VnJkY0F3?=
 =?utf-8?B?RTUvTE5rMWQvcjNuaTU0NS9HemM4TWc0YnFCNWtGcy8vTmRGZmFLK3JTRmV6?=
 =?utf-8?B?MWY3T0hQUW1XZmlDaVdlY1Q3MzVTZi9FaG1MdlJjM1EyRHYwMThFRy9qU3Rs?=
 =?utf-8?B?dDgxak91YklndEs1bU5LdVZwYzNKOE5XYy94ejJicE1ocnhweUxGVVVIaU1s?=
 =?utf-8?B?TzFiRmY3alJ3Y2pnSzMrcDhmeHA2N09hOGdDZ1JwSFg3MkpyWHBzNE0wa0Ja?=
 =?utf-8?B?QlA2V1FISWYzb3o3QjE2VEx5VkQ0ZkJSZzRmdHNhc0xyWjl4UlpBRGxFTFFW?=
 =?utf-8?B?TEk0bDRHcW9GZm1EU0ttQWJabXdGOGhiNDB1SzJMcHl0Zm0xR0V2bktzb0Zq?=
 =?utf-8?B?TE1GeVBqd1B2TzA2MUcwbklyQjh1ekwxb2FWZ1V0NGNPZWxhVzhmNnBzWHlT?=
 =?utf-8?B?dVhTelVYOVRUS2t2ZCtvc1cxUWJhTVZMTGRNUTlKZ21pZFZ1am1LMDJHZXVh?=
 =?utf-8?B?aUZpWUM3bkNhaGcvU0VQZ1U2L3pHQmFiRkl3czZoYThER3QweUt0SzE2VVVJ?=
 =?utf-8?B?NVZPa0loa2hpL1hrSUVYeHp5VDNtWTFUUFlLMnZCTGFiVHE1SUl1dGljaEFT?=
 =?utf-8?B?bkxTc0poYjFLdSs0OWR5ZTNIbC9Wak0rTXk5N2xKbmxFSGZTR05DSmQ1dXRY?=
 =?utf-8?B?ZTdYNnN5bHFBV1R5dkJjbElpdGFBRWlaTUEvczBPdi9NRjdLTGVHSFFndUZJ?=
 =?utf-8?Q?J5UDtDsxnbCfneJtONFDxZxBMjfZ5SaLQF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 20:55:29.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d05e0a79-55bd-442f-9c5a-08d8a6bbea6c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daT6SPHawWug7hhgktcz3KBBQxcPKsdo7X2oipIUhW9FrnghAh1caQ3IP1WmyJ2PhJ1J0vtjodsuJcpCDRsI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3461
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-21 10:18 p.m., Zhan Liu wrote:
> [Why]
> Driver cannot change amdgpu framebuffer (afb) format while doing
> page flip. Force system doing so will cause ioctl error, and result in
> breaking several functionalities including FreeSync.
> 
> If afb format is forced to change during page flip, following message
> will appear in dmesg.log:
> 
> "[drm:drm_mode_page_flip_ioctl [drm]]
> Page flip is not allowed to change frame buffer format."
> 
> [How]
> Do not change afb format while doing page flip. It is okay to check
> whether afb format is valid here, however, forcing afb format change
> shouldn't happen here.
> 
> Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index a638709e9c92..0efebd592b65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -831,8 +831,6 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
>   								modifier);
>   			if (!format_info)
>   				return -EINVAL;
> -
> -			afb->base.format = format_info;

Adding Bas for comment since he added the modifiers conversion, but I'll 
leave my own thoughts below.

This patch is a NAK from me - the framebuffer is still expected to be in 
a specific format/tiling configuration and ignoring the incoming format 
doesn't resolve the problem.

The problem is that the legacy page IOCTL has this check in the first 
place expecting that no driver is capable of performing this action.

This is not the case for amdgpu (be it DC enabled or not), so I think 
it's best to have a driver cap here or some new driver hook to validate 
that the flip is valid.

This is legacy code, and in the shared path, so I don't know how others 
in the list feel about modifying this but I think we do expect that 
legacy userspace can do this from the X side of things.

I recall seeing this happen going from DCC disabled to non DCC enabled 
buffers and some of this functionality being behind a version check in 
xf86-video-amdgpu.

Regards,
Nicholas Kazlauskas

>   		}
>   	}
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
