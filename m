Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD002E9F68
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0D6E041;
	Mon,  4 Jan 2021 21:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0D76E041;
 Mon,  4 Jan 2021 21:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFlmrP4DHe+QY9lBRSgNrIXvNPxRg7XPopbr3i2V0RIZfNgxLKmGzgnvYDFHNKozMGxHB6ikAjoQVUWF2PH4CilkFvN7tgQIqGIulK4d7CGr8c18QXa/6U89p+srxqY6cQJKKNFzRpSIu9yYpEZeblEJokbZqpADQNHXiQaZW+oaQfldAZntPp+g6T2VGxySyIF0sAfRfokDVsEcsgubnv18/StEoAgjgIl6BCbEYdsXChdvfKTDb1F++Zr4amhWk2G6qO755rw/l83qAz64ziUYexJUnb0MDGVerUOZJVXUFTqMTXftZs/YwdZppSJ3bGXgRml8XvrL1g44oBDAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhFyyZevrCdTeafM/by3nYwmUVH7IQJVaODOadNKRZU=;
 b=nuFKG1puJNlvQGbePau/M3sgQwMJdcJAJjMB3np7vByKgyo6OP8HrAoa8sH/BBAq+fMJtjxanG1p4ovToiUP3WrQait3xZviQ0g97zgjlzlNGRS6LKY2htQ9ZdeGvHhmSlG91gi2LsZjRr1AB8e29i353Fq9+ziipQ01ugLHILhKbg6a4wWqjvVpweV1E8zdu/R5PUZJSXt15d3x4a6Wixy67OlUkogHg7H5K8Pvjt9e9DjxKpiSi52UFNaov0YbxzciL8HTEpAI0OHssYd/jvZrlwg6p0ahX2G+7G+Tnm96xU6hQh6nbjsyhtqJxlrGEAMthfD+/YZBvxPHVHaMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhFyyZevrCdTeafM/by3nYwmUVH7IQJVaODOadNKRZU=;
 b=qTuZM/RRu/hgAvb6wFvSPoXVjTcfAWkmWePwcKXIUrNBwquHOnx4CSMtyids9kntFJKKbx34zx+rDoef9H4fmgQv0+8dhNNmsdEjfl44DKWmR7HMRDiPtmKtX640Rl1j7S2hNsi/lHfmm1e/7zTb1pBfTKCiBbZmT5qVZ/zKc6M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 21:17:25 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5%6]) with mapi id 15.20.3676.035; Mon, 4 Jan 2021
 21:17:25 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-8/10/11.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
 <20201228185059.3949-3-mario.kleiner.de@gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <2b1f7e42-bc31-824c-387d-0b08193b6a67@amd.com>
Date: Mon, 4 Jan 2021 16:17:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201228185059.3949-3-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Mon, 4 Jan 2021 21:17:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6f681d6-e5a1-44e7-d28b-08d8b0f621e7
X-MS-TrafficTypeDiagnostic: BYAPR12MB3511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB351164834E35D91858D3BDABECD20@BYAPR12MB3511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Joi5fhDYbuZ5svVpTjGsk/wWtTGQJ44bCxfUEkGnbQwnggGMFsaiW/m/R2AxwtzSZIsj7gFOEMu0iFc4Bk0x60XjXctnLAgH0pVgZjzlSxprPJuQfwK+8dfccDduPB7b0WYFEao5Qa3kSXVSr/gKRe4de8AZs8B+gg0AjtGxC0JbG1aW7sZvAW9f7Dc5OLnpwZ81Q5qY3BdHvTqJ4+SFzm3rs5NPerBVwbp1SnKzVvtLnENmfViX2+mBZfZpj76p5Brcur4Sf4CP6MhE6DLn5NCUVWWFVzOXPsihH0OIU+LixdAaOQ4zKgS0jdQtDPPzLvNTpK9lS44xOvWPyI6Ud2TLojClUfsoTfR/Y2wXIrwioFAqQRmdkahM1h13iJ8bSVAxXIFxOxX9GI54Oupl5w8yzYY/F6zl+fnGEmM91L/ESdQ4ZsimQHD9+3bPH0lK5ko7w4Aro/V1EYfbCSYl9x2StjdCSpsYBCwJoz42eW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(186003)(16526019)(52116002)(2906002)(83380400001)(956004)(2616005)(53546011)(4001150100001)(31696002)(86362001)(26005)(478600001)(16576012)(36756003)(5660300002)(66556008)(66476007)(4326008)(66946007)(6486002)(8936002)(8676002)(31686004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N29nV3YyZjBlc2hDWCtmNlR1ai9vWlJCeWJmbjRuS3Mwa2pQUXhPNEc4RXJt?=
 =?utf-8?B?VGZPZ29EV1VzVVhybVNQUGhaRStBblQ3SXZkTDJhRVY3RmVKcnVrWlk2a3RO?=
 =?utf-8?B?ZU4yazVaTFpTZTBNV1Rpc01WU2Q3QnptV0VWMkVKSWNJd3QwS3RuQll5R2cv?=
 =?utf-8?B?cXl1bHdwV04rTVpnVXNPb0hPV0VCMGVZUmlPM2F0Qm00MWRKbEQzVVBvTDV5?=
 =?utf-8?B?RDdjZ1l3TUFYYUpicE9RcVQyNVNxRHlndmhyUTFVVk9DdWFaZEFIamZZM01n?=
 =?utf-8?B?MkZnV0tEa0lTc1U5cTRmblVCS25zRjB6ck5Ra29qUkN4ODhkUytQZ0N4UDR6?=
 =?utf-8?B?SlVsYzN0cWdQdVZSTHlXdUtIYk1QemdXTXR1a0wzNnFmMTVaYkdaK3I0ZHhJ?=
 =?utf-8?B?ai9aL0NRb0RoSDFqODM2ZTUyYnI2RWZmU2h2Y29qbFB5WEozelBibG1Ba0lY?=
 =?utf-8?B?djhtMTE0QWs4Y2tYNXlKYVdzOWc1eVNhSHdHckxFMHdyYmhhY3lPamN0VzBS?=
 =?utf-8?B?ektTWWtpRXNaRUcrMnlvYllFWlZFcGhDcGNzb0xBbzNmUHRWeG5hNXZWOTlW?=
 =?utf-8?B?Y3hsQlRQakhldnVXSzZHbjlVenRTZ3ZwR1pBYlA2aSswUjZTRHQyQjJOcEZC?=
 =?utf-8?B?Nkx3YnA4eFAxTXlwUlNNaTFwZGsyM1hoYmg2RUpiM293alJBOHJ4ZGJaMlNT?=
 =?utf-8?B?QUJ3YXVFYzZUNkFoNU1Ibi9CTE5xdzU0T1g5emdDQXNaQ2tBTW9tREJoQUxw?=
 =?utf-8?B?OEV2eFZrd2FGTWJld0NTYzRjdzRjSHFSUUIyblpNMnMrVGhRQTdUeGQ0WThl?=
 =?utf-8?B?MUp2Q2xwTEM5M3FVbUp5VVZmeWVWVHozdXM2VkNvOFVRQi9qaEEwMWc5L3lN?=
 =?utf-8?B?S0dUMlhnWWZqelNzcFZOM3RYSmE3Ym85aDV1bjYrSjdsWG5xU0ZoVHYzb29k?=
 =?utf-8?B?YWVReHlOd2Z4NVlJdHpOaHJMRncvd0M1ZTZxM20xWUc5OUZ2a0tFYWR4V3l2?=
 =?utf-8?B?RnM4ZzYwS012S0xJYytvaUt2cmhFU25ackhvNUFvQ0FJSjk2c2w4ejFVOU4v?=
 =?utf-8?B?cWYyZU1aRGkzY3lCYjl6SE96NmswOGhNd2ZvRXEweXA2dTNrczFzQjlqdlla?=
 =?utf-8?B?YmM0OHVMblRVQ0ZUYzdsU3o3WlBzTFFGZk5SVnN5cW1MS2hNeGVEQW4vem85?=
 =?utf-8?B?SWtJc3AxbGpPcVVheWpZWUFuL3FtNTg3T0Zzck92MEErZy9Bbm9qaXNMSzYx?=
 =?utf-8?B?Z0lGQVZiK3dURUVjc0F4bncyS2RYUEg3Q3BUU2dEd293WmRWMU4rcUpySlBj?=
 =?utf-8?Q?SYsNeUVaxMswwQVZ/k8vSyYqKJOUd6gb7F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:17:24.8790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f681d6-e5a1-44e7-d28b-08d8b0f621e7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlSw0JEPwGr29aTTtcmasHs0peP2MkkPzWVt8RdC2GeetoRYWwvBHJDce5NkvcH2RfasMmjbM9m8ayYGlUUJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
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
Cc: alexander.deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-28 1:50 p.m., Mario Kleiner wrote:
> The hw supports fp16, this is not only useful for HDR,
> but also for standard dynamic range displays, because
> it allows to get more precise color reproduction with
> about 11 - 12 bpc linear precision in the unorm range
> 0.0 - 1.0.
> 
> Working fp16 scanout+display (and HDR over HDMI) was
> verified on a DCE-8 asic, so i assume that the more
> recent DCE-10/11 will work equally well, now that
> format-specific plane scaling constraints are properly
> enforced, e.g., the inability of fp16 to scale on older
> hw like DCE-8 to DCE-11.
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Regards,
Nicholas Kazlauskas

> ---
>   drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> index 8ab9d6c79808..f20ed05a5050 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> @@ -385,7 +385,7 @@ static const struct dc_plane_cap plane_cap = {
>   	.pixel_format_support = {
>   			.argb8888 = true,
>   			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>   	},
>   
>   	.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index 3f63822b8e28..af208f9bd03b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
>   		.pixel_format_support = {
>   				.argb8888 = true,
>   				.nv12 = false,
> -				.fp16 = false
> +				.fp16 = true
>   		},
>   
>   		.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> index 390a0fa37239..26fe25caa281 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> @@ -402,7 +402,7 @@ static const struct dc_plane_cap plane_cap = {
>   	.pixel_format_support = {
>   			.argb8888 = true,
>   			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>   	},
>   
>   	.max_upscale_factor = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
