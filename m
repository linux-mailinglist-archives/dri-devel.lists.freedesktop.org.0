Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24539664571
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C38A10E02A;
	Tue, 10 Jan 2023 15:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B710E02A;
 Tue, 10 Jan 2023 15:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlF+rc/YfqRl0CyPk92+lYLwbE1130/iJg8+0H1GjVbJyJtGB+hArj48OmlsbrKMNBvT80BUO11Y95/GW8eRERZlXUdFQTPYraFVafx9FIkGjs3IyU0g9bov55ARxCfCbD00uRS8ShQOgr7D1O8grHlVSD7cr9xR2rMd8I33PqRWQBGht5KN5h2ISeY4C8vOVI7gJ5byFPyi3cTf/DlBIIJiLzzJKquRKWnJhmKm1rJBtLBsyg3g5NtosLG68E1tlSFoFbYY9a3Ij4MGa8ZYDTb+02gEs86PXxk0/3ThX5qxh6ssQQC0k2SXInLFoAVl9DMe5DHvSMrFNO+rV7Eb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HNY/9AP4eizCHPboS/JKyoUTPkogDLpg5zBThSX91I=;
 b=MCPnsDQVX4cuIsO6awSqx+khZFEIAYUmzt2l7s5tTT055HR3T567EhOp2Y0iJY/nVMarKSxAZR+gNwPS4arpS4gcQ+2zLRFxGjhUCzmRZD+G8jd4joWWeTEjc3vT5w4T2xoictMQRC0ZuUrYCAl70nMjjiWhgKVgJ5uM5T/BbexWjT4gAXB4g3sdxqFR17nrJ9Y7pcgcpAttBewwsL6BGn/5A7t0ONeYlUEKQ/NKZt0iJAorOfjcNnxJjKwBrJ1BtEgMVlg5Mxv+3fpdzogkjvsiUJzxfoI0Lab9cl44Y9+ArGD6HMdsFqOCXcmeWzNeWzmVIaKqHywV/f3Y+FtkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HNY/9AP4eizCHPboS/JKyoUTPkogDLpg5zBThSX91I=;
 b=GepuLGfktA0BKKKenL7dn4mH7Zw8x12jgB7Mbi+T4YGFyA0cN1491mttgk50IU8beqDN8GwXUVOaV8S4Jw9RRNtExvVzNVth82PzA8X0YwdMtMmEmQ+DJG9Cf0phcRDvzZTvQaz3Z7sAozuTErr2E+BG2LOqI7kTBTHUKm/L4LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 15:58:18 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:58:18 +0000
Message-ID: <789c2c61-4959-c3c1-0916-d1cc7f659247@amd.com>
Date: Tue, 10 Jan 2023 10:58:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/amd/display: Fix set scaling doesn's work
Content-Language: en-US
To: harry.wentland@amd.com, nicholas.kazlauskas@amd.com,
 hongao <hongao@uniontech.com>
References: <20221122112034.30080-1-hongao@uniontech.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221122112034.30080-1-hongao@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0090.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::23) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c68ea9-a115-4b98-983f-08daf3237d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu+lSHC4vrh/BZahTAyllne+eg1ja4o0a0fsat9kjzqotZZ00HxtjBAcYxilyXtiHGBMtrH8Y4+BOMa1NxwVJaTC4R3Y38sVYkUU4OGoSQvpIyz+N/41IyscKZ8UXZjw9moZ2YfbYUC4XcgiOiAfTUvXfF6bmzTOK5/CRXLMIewK4INGKbxOutDGzR/kGi9MfmkU17M5/gFZEClqFqU7uf5tGCisBR8yE2eW4dhsowRxL17WfcI+SYuMoNLgbrwk+oipzO8S/3TSGumbRkLfNwvNZfQscmApAnWFaoQHgeXrz+sS3DSgYis9kFnRRva9yT3JnFebftNhu2rIWcZcsn6iqlvUAPqDQfRF/7phM04wVDoXiL7/xsBAWSXvYoQUCahqwFjc9xWb9QCoI6xCDEubIOJxAnMckyhJiOWEpuW659KCryKap+oGHidTTC2MnBq6pBqsWBv5LJONuKcAk8S7FPiJ47NPfTzoUaOAS2zO3J2QgB7/8dbaXLZ4ycd0BQugCCxH3YezV02jtMC2twKOMZ+5ic5TdHnxqcogejJv/UVTJrCwXOvL3rXy8o4LhgH/gR4alhEAejdQ3MxCuKf9x+9QLhbyQmF9jDnu8wErDQV3qq+CBANT1T6g89t/7IefSvCZsMaTs/xHNNRKk9jN4xDFbUFe4toblRmudDZ4UDm31txVKG1X2z/+OOUv4gXEx3m4AJ0Q/6Y8tWxMhh93zJ0ycUNDHz+6yyRGiXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(86362001)(83380400001)(31696002)(41300700001)(2906002)(8936002)(5660300002)(53546011)(26005)(2616005)(66556008)(8676002)(316002)(6512007)(186003)(478600001)(4326008)(66946007)(66476007)(6916009)(6506007)(6486002)(38100700002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9EWStIMGY1eTdLWCtwMzBhenBrQzZkTVUxZmxBeEVNbGlkNTczOXhpcm16?=
 =?utf-8?B?YytNc1VVTldWUzJHdldjdFVNYnZqcVF6RS81L1YzWVh5TENMaFg5RC9hV1Zv?=
 =?utf-8?B?THB5SnEybXZaSUJUQ2F6dzI3cWMrYVcwUk5tSDRzV3Izamhya1E3UTNYa2RO?=
 =?utf-8?B?cG5YS21TZVQzT2tzMEJlTUdJenlNbURiVnB3cFdzMUhza3M5alBEbzBWNkVy?=
 =?utf-8?B?L0kxSXVmK0NFUklnL0s0VFZHVHRLWnVIa2ZTTHgwRkVxdjRhL3BoQ2tkOSsv?=
 =?utf-8?B?a2NVTUxXVHVxWnhjN25aWEFZRDNBdGpHdnJOeVdTcG9rcEFzQjdrQmF2N0hF?=
 =?utf-8?B?L2VhdXFNUmwxd1hJV1JjN2Y5S0FuT243aW1SdkFONE4xOEN1NHZoc2p6dC93?=
 =?utf-8?B?VHJCYXRiNkNkL01tK3JvTmtvQjBENmg0aTRGVnlNV0ptMVJ4M0hDcXdFU2xH?=
 =?utf-8?B?UE93SVlSNk14TWI2QzV5dVBvc1YrWUYrSnJqZTVMQVBZbmoyM3BQL0QvTXNl?=
 =?utf-8?B?aE0xd0lwUGwybGEzN0tIZS94UDRmOWduRzFxd3lWT1dzNjN5dlJxbGUvWjZz?=
 =?utf-8?B?S2JJR1RRZVVhT3VUMjByeEVQbld4TVJRODZkMlFzQ213c3lKYUZSdFhONUdS?=
 =?utf-8?B?TTdJcHI4TkVMeUM3NmphYWRqSG0vbVlRdGJ4bUVtNnFxWHRHMGppTzkzY21N?=
 =?utf-8?B?bTE4aXZndVNnVW1RN1phbERxeG9pT1ROc2doQ2ZUbk1wYklrakE3SXBoNms2?=
 =?utf-8?B?SS9yZExsUlNVT0FYZlNQUFFhZ3o1cml5NjhIZnljYjJ2RUsrc2FCeVU2NlY4?=
 =?utf-8?B?VXE1ZVU2ZkFZZGZlODVWQUhGZGJ5RytyRFlkdmY5KzZMUjlPSGdmRVdCaUM0?=
 =?utf-8?B?U2ptMGh2ZlUway8zNisydjlkVjFHRG1sT2xUYjRNdXN6eUZITkpjVkhkMUc4?=
 =?utf-8?B?Q2J0ekNqSzRoRUhPUlFoWkViUm01dGJ2RjV2MG5BdlRIMjJJWWRZVlp6Z3FF?=
 =?utf-8?B?ZlFFeXoxaHF1REcvUnRhditMSWNGczdON2Y4VDVWcXF5dWdRZEc4NVNleW00?=
 =?utf-8?B?STlNN0sxOUR6VEVmbDZWR3ozMzZNSmx3cnh2ZWFuR21IZzFPOFd0a1ZSd2pJ?=
 =?utf-8?B?Tlh5Y2IwdFg5WXN2THNBVU5NMGtrdFo5bGE0UmI2YzVjSVZIcTR2Y2dVK3Mz?=
 =?utf-8?B?NjVvaUN4bWx2dW0rYU1KMGdyZmN2bWNJdUdHTXMydWoybnpvdWJZNWYxeHY4?=
 =?utf-8?B?UHlRejBPQzMvK2lBWjlvYWNuU2Ewa3k4VVNhbXVSNUY2bkgxeGxvbzRiMGNJ?=
 =?utf-8?B?WUpoVDZTKzR2UVpMWlN4ek1uMERNUHd5Z2wxTXd4WHk0a2xBOVJhbU5wVWwv?=
 =?utf-8?B?b0lmQk42R2tjbEVjcWlZWEJ0RXFMdXl6Y2N6Q0YyZFZTVGVxT01YNGdHc3lq?=
 =?utf-8?B?dGprOXo1MUQ1OHdud2hLZjdjOEw3VTF0WGh0Y3BWMnpobk02cVpzcmJkRm9P?=
 =?utf-8?B?UTU3Mk1RdWpLTmZ1VGdVeG1ma1FqU1JUY3RoNDhrMXE4ejlmb1ZNbUgxQVlL?=
 =?utf-8?B?OTVFTWtrbmtueS9WUG4vb2V3a2xmZGlTZHl5L0dtbVlPeWJybGxrNUpWK0wz?=
 =?utf-8?B?OGZNTUUzQUlwMVAybE1HK3REcy9ROS95R1NBMkZGcnUvZm1wbFJFN09DYXBS?=
 =?utf-8?B?a0RBRm1QdEJVR21FbmZreTh6aWg0OWFOUGoyc1BMZFFXcWdBNHU5a0M2c2Jr?=
 =?utf-8?B?bVlQMEg2WUZIUkgrc1IrY0lCdDV1MGN5Z3doU1N6cDJ2eTZXdEJpKzZUTWlp?=
 =?utf-8?B?Nk8rbERZYkNTWWVpSXBjUVVwVk8rWCtBK1pqMkl3eW9sMXl2UDFCOEowRXRL?=
 =?utf-8?B?dHJXa1c2bXl0TUd5bk5STFdSY2wwaytHcExjZytyOEp4SS9FQ2VkY09YRiti?=
 =?utf-8?B?Q3NVK2tEMG4rM3M5U3RGMThDV05IcCtTMjFSaTlCQmk2QWJrcVlhVDViemM5?=
 =?utf-8?B?WmxhdDhTc2hhRW1sZmF6dFcrcnZ2ZXhJekd0Zk9EWFNKR09TZjllMG1CcEZN?=
 =?utf-8?B?OGFJS29uOElEU0NwMjVuS2VldXYwbzk4dHMyTjFjeFlJK2VBNW5DSmlWSHpv?=
 =?utf-8?Q?uj4jlzg/vltp6BI9HAt+WcUj8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c68ea9-a115-4b98-983f-08daf3237d60
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:58:18.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snZomJUI9Lla7CTcHrgNYPnZaLN2rUrEPtNgEwye5k03gn6iihpVIG7VCM3y1JvSS2N0LWNZaj37U4eK2dO7Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, roman.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/22 06:20, hongao wrote:
> [Why]
> Setting scaling does not correctly update CRTC state. As a result
> dc stream state's src (composition area) && dest (addressable area)
> was not calculated as expected. This causes set scaling doesn's work.
> 
> [How]
> Correctly update CRTC state when setting scaling property.
> 
> Signed-off-by: hongao <hongao@uniontech.com>
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3e1ecca72430..a88a6f758748 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9386,8 +9386,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   			goto fail;
>   		}
>   
> -		if (dm_old_con_state->abm_level !=
> -		    dm_new_con_state->abm_level)
> +		if (dm_old_con_state->abm_level != dm_new_con_state->abm_level ||
> +		    dm_old_con_state->scaling != dm_new_con_state->scaling)
>   			new_crtc_state->connectors_changed = true;
>   	}
>   

Hi,

This change lgtm, and I also run it in our CI, and from IGT perspective, 
we are good.

Harry, do you have any comment about this change?

Thanks
Siqueira
