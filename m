Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6E78F2DF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BDA10E1A2;
	Thu, 31 Aug 2023 18:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC310E1A0;
 Thu, 31 Aug 2023 18:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+POFmsJQtbAYpZmmu9cEGVOV3sXJQq0BmgdMkZS7x+icM7ZRR51WC9UDlJzHI2ITCcRr93NIUgybUHdjmRGDOQHLxSXqfP2/H0iV5V/OZAM0c66zWD1t39lpYHm6Fb4SdN3XMzt0D+gMrpCV02GET5JwsQYhPlsFU01DHpYj8VZux9ppwvX5YzU7zDe5ZvijV2Ti8l8C9V5CguZR3hqd6XHNXu/w5bYoMUNWo/hg2i4o5kX37kiaxAabJXv7GQ7uJ5RFaGNqvILDFjkDrNMqtyEnepcp0x3v4XcZHV/CT+IHjX2rwCM7AzdEeZlpu+hAmxGkIQN7krRoxq809jhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95CgSqvZGgYotU43d7p9g0FYqHk8QgKm3DKUbF0aQgc=;
 b=fFCnieKcG+o77ZheQ7duUWIm+1ZWdtA1oRp2woMJkenZ4bZ4BdENZkTOE+rJ45ZMPBb9e2HYv6khZ9iVBQJMtw7uLX+6o+AVM5nTOdLxNgzWh1US4D0E44EI23wCpAuHeMZYLXeffEQuJ14vIG2KwH0886NDBeTPRHSbsGqj5U/oLI4KE4oqjFgc5r68ORBZBXKwwrwzHUZC6xzFN5ypaQIANls6TYAt9OQAyKgD0uB4/pzqN7hBL6sMn4mhO9et5CbWAakxURerSuMXsVBLc2CSdoMu9IDCaA7ukCHn3DZp/L8rrmlgJtalLIWLSIA8ECwTT0Q3+P5t9aN2GpzvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95CgSqvZGgYotU43d7p9g0FYqHk8QgKm3DKUbF0aQgc=;
 b=O4YJ5u6MT1ua1XEjp1zC7Uev3HARwEFCfrF0ZJTMigeva3Y6V9Rr4PcQG2HwfX3Lhpl786BuYlNCsREWP2nJ1pENOWvU89c3gOHCDxPLc4gApGL2R2KxX7fucYDEPFdI6FdMaORRE7sKDzMtqiTRlumkdgba4NA3jaVQN7eSlr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 18:48:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 18:48:14 +0000
Message-ID: <3ba3a7da-77d7-4a13-899c-e7a1f5b68a42@amd.com>
Date: Thu, 31 Aug 2023 14:48:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove useless check in
 should_enable_fbc()
Content-Language: en-US
To: Dembskiy Igor <dii@itb.spb.ru>, Alex Deucher <alexander.deucher@amd.com>
References: <20230830140103.311752-1-dii@itb.spb.ru>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230830140103.311752-1-dii@itb.spb.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::49) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2137b2-21f3-4483-2fe9-08dbaa52d551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUULqUDsZca2UCC90SZI0XqFEU8TZmKemp+APk5b+eWMdi69qiob3fLSWc/kpYPjYm6d2mfZZGbiF47zKM6TpqaLGf9DK64e+kAKalDKe8av9nvw3AWgLBkyVFomjC2xftb/6J1zYid8BicKUItHzkz6goDDJU+zvJx9uXT0Ejsj4CWA0DWvPpUGicgGr8Y3vOFpRo2Csm+svCqdU+fBbATSCs6qlhQRQrbWIl87Z+uOKZFOfdZVpztSBREjx4Diutyq2EyF8MSEK+7Lx4l+vyUVnp8TNKzhJOxb9VIuZ0vCorqzhrf6F9l4DuOEQYJu18fCkltDRTt65UxIvlMWQffD+QQ9V2V0ELKWWEy2kLD3WxeBQnKckYNfoq6JNmq/ZJprMiRWwnZaDiv+CMFpTnttwuVaDmq+46Nhg3t3yWjJbR3+o5FGHkQvxE8Np4lNc1JH8tv1qr/ivUz/zIjHrSVIQNrkxYxJFg+2la6hd8OoP9NzZb/IowlJyS4spIVhodlbPRFNzi3kM4DZslBjXxoSKpjcn8qkmY/uOWfaa9FfI4hXr5JDz9d2/FF8nQIxNxsCsrfHVbGTT8VQ6KG/xs0KrxVb8NTwlaDryyYLJKtqPGJRBqapkzx0E5ZbI0yorxXN75Xwepz98DZqovNqlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199024)(186009)(1800799009)(6512007)(38100700002)(41300700001)(316002)(6636002)(4326008)(2616005)(2906002)(31696002)(86362001)(44832011)(5660300002)(83380400001)(36756003)(26005)(8676002)(8936002)(6486002)(66476007)(66946007)(66556008)(6506007)(54906003)(53546011)(110136005)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpaOHRia2dUQWhYRm1LVzY3bmFPbThZcDMybGlLK1hBSXNvNE9JcTloMy9i?=
 =?utf-8?B?ODZURGM5K2pEdWJTUlZZa3RHaWVCeU5ERDYwdGFjY1JuTVlzUGFRZDlXWFhp?=
 =?utf-8?B?R0VMamhXTXplYVBkS0RVa01VeGYwU2lHZERDSXJBWFJwU3cwQm02TWlteDRk?=
 =?utf-8?B?cG41c1QxL0pVR040V3pRTXRwck0rT1FEUmZQZGQ4SXdNUXQzV3hJTC9rY3Bj?=
 =?utf-8?B?UnNGdnhyUlo3cnFiRmRaUDBncllRR3NOVTZVYnN6cXJUK1FmU0hFSWtWWnJL?=
 =?utf-8?B?d2VEWlMxVE9qS0VGaEJNSHhHOEluWmZyeEtGRVh4b2MwbmxXWTB2NGJ6SmtR?=
 =?utf-8?B?ajg0R1J6MnVSd2hqekc5U2pENjRmajlaM0xJT1Y1REZuYWdNRXpUMHF0WGRj?=
 =?utf-8?B?TEZlQkpWUUZIcW1YODZPbXg2WjRsSVVnMkdhbENBa1h0OWNwTVkwbmhSOFMz?=
 =?utf-8?B?WWNtNS8wdCtnT0U0eHh4dVNiTEUraXh3cy9UenNDSzExTVI5WXhwNXVGVHNB?=
 =?utf-8?B?SHJLT1pBcyt3dThsZmZDVENrOUE2MjE3NkxaUGJRaGszK3ZXWCtuNGlyTEZ5?=
 =?utf-8?B?cnJhMFpIYkRTNFpseFo3YnJDY0NKUEZ5K3BaaklzT3lGaDZSdlMwOE85MThI?=
 =?utf-8?B?WEpVMzdmbEEyNEkwZXdUTkQ3YUNpS3F5b0pqZXJ6SGcrZUlpL003T2U3RGhM?=
 =?utf-8?B?Z0dzb0dIQmRXYk5tS2FUa0lIOWkvcC9qTmVGSE9FajYwZmtEWVVobVBVYlFz?=
 =?utf-8?B?a3hLektPNy80aUZaQkpkcVMvc1crTmhqSWRjWlNJamNBNUhEaWNTdGhUTmsy?=
 =?utf-8?B?K0VBMGNSOUNFMS9aRFlKTDVwNGdETVd6TExXSnhxdjZhTmZ5cTNoOUNJOFpr?=
 =?utf-8?B?TzRZRlVuQXVuWVZoNCt0OWNVTjhQdmNpakRuUnJMM1I2R2h4S2VkK1M0VXJS?=
 =?utf-8?B?MkZOUjhac0JuZDBrVEN1M29KOEVFTjBjdllTa0xJUHVJVldVWmdROTV3MFpW?=
 =?utf-8?B?SzR1MlUzTVJ4TUVtdXVjUHhaWDZnb25iaE4rTEcvN09ROENyemtTR0ZMYU5J?=
 =?utf-8?B?U1dHTGNHUG1mUXM3Y3UvUmg2VUlXS3h3MWF2VTdvTDltT3NIUEVFUTNyaTV0?=
 =?utf-8?B?aWxib0Jyd3AvalVBdU85OVFZRHdIem9qaThwQi8rV1kxNU1ialJyQ2J5VEx4?=
 =?utf-8?B?WHRHY21CRUhzNTdJL2dTVmhTaEdBU2g5eGJWS3lTRjFNWGhYcWc2S1BBbllQ?=
 =?utf-8?B?Q0lhUDExVnJ1a0U5WE9uOWtDL3E1WnRZM0ppYktIOUUyNGdqUFhtTDF6Tnoy?=
 =?utf-8?B?aFVoSk9rMFh2YXVPYlM5SVVHdU5aWFpNaEFReThyV3g5T1AveSthaDRsRHF0?=
 =?utf-8?B?dHVybC9QWVdkV3RQWnFnWjdpKzZkNFBNaFRrZjZOM3pzZCtMS0I3ZTJOUzBn?=
 =?utf-8?B?VWtuWjdMT2t5TkpwK3ZkNUJhMW5lelRIYXFNU2xCanN5cm5vWTV4ZENuMGZj?=
 =?utf-8?B?RGxvTTcwU0hSN2lUOUN1NlBCTElJQ1YzSHAwYm5DZWxobkJXSVV0bVhwTUlC?=
 =?utf-8?B?QWpCZDVpVXJya1BPRUM1aUZEeFU1czVTd1NYejF2Sm5RU04veU5WbzZ3dU5m?=
 =?utf-8?B?bnJnMlozWG9GNDVpbGNYdXVJMEhsUTc4YlhQWDVBWlVRcjczSTlkK3dHTVdW?=
 =?utf-8?B?VCtRVTY2TDhueXhMYVpkaENtUG9ienhuY3hzLzZ1bEh0b00ra01tSlkvckZj?=
 =?utf-8?B?dXVJY3VTS1ZCeDdyT0hRN3RTY2JtZVc1c1hSd1JqSTlvbDVITTlzWkdHWDIz?=
 =?utf-8?B?OW1pVlRXZHp4WXc2VEtzdTFOdldLVmxNWGZMcXkwd3ZrNVo5VnVUcktxVkpG?=
 =?utf-8?B?bEpJYmJFQ2hIZm5QdFdhc1lZcFJRYTk4bndKMFI1K0V6My9uYWp1NWQzeGds?=
 =?utf-8?B?RUkvL2hodWc5UXFGUGdmdVdyc0hyQUZhbCtRaUh0UEZucXJMS3NlYWY1T1ZJ?=
 =?utf-8?B?a29Fb000NWh3MkorWDVabk44eFY3M1lOanVLM1dFbHJOTWU0cERzcEhMR0FO?=
 =?utf-8?B?OWk2NmVhZE9EMGs5dGpzbTFNbGV2Y0xYT0VYTE1ZdGRRZEE3bnBiaFI0ZEF2?=
 =?utf-8?Q?IkQZbHyFVstJb2+smMip0AIKA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2137b2-21f3-4483-2fe9-08dbaa52d551
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:48:14.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+ODBn5i0dX3PWb3BW3uz1FrUK9v4wRpEQRkb0blLlo/FLrXyLj9/rQHz8MXcXhgl/8FUhL/jTu4toyWPxrIcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
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
Cc: lvc-project@linuxtesting.org, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-30 10:01, Dembskiy Igor wrote:
> It does not make sense to compare a pointer to array element with NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 65d38262b3e8 ("drm/amd/display: fbc state could not reach while enable fbc")
> Signed-off-by: Dembskiy Igor <dii@itb.spb.ru>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index 6966420dfbac..e87cf54ec658 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -1992,9 +1992,6 @@ static bool should_enable_fbc(struct dc *dc,
>  
>  			pipe_ctx = &res_ctx->pipe_ctx[i];
>  
> -			if (!pipe_ctx)
> -				continue;
> -
>  			/* fbc not applicable on underlay pipe */
>  			if (pipe_ctx->pipe_idx != underlay_idx) {
>  				*pipe_idx = i;

