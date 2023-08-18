Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE77780E80
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215410E534;
	Fri, 18 Aug 2023 15:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BFE10E530;
 Fri, 18 Aug 2023 15:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAaegEkUFcNbVk0YCXjVt0KwggP+mtxDkC0TEl6s1Lns3qwedTngplC556xfkVU2uiTDBsMWXER/OMCIYU7tH/MTRa+Uz3711noGe7yit3XzV6EiE3GKOeqXkaCVmgpxPD1pauao0jDgxBquN9+TiqdTG/0U2TKRQiPw6L4N2MO7yhXjcCGUGahKeeiJkZvFYTUbsZdaEyU3AoS3llnTFCFko99ouJWdeJ4fX8VtNY1oFx3vmT2YJG31dlLqhtfpgmreBzHh92VGm3mLy6VicClry8hDJ49odBa/ADaBn5WOwsuKDF7fnXnB8Wtgb0ZpV+i802DJhLyFlxCe+2quRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIVpXkPP5juLdE1DOwLhNteRDhZeNTmAm0lHTDjHg6o=;
 b=DoIy5wVkdT2OI2C2n2ADrQWDUmBCsqFzbwSWlxDF+epGnrAxXWPzHwc2UeeN6R79y+ke72/x5qUGGfGbVeYJ4gJ7vn/7XmSWkGknr7/62cKIwXwsCTB+V4I0YEl8n9SfHOCIY6oP+WlocabrKhoUOAWlt0C7Yr+E0oB5m0RS9ROk+YVpj7+N2qjkx1ei5ani+DGRGVxJHLj4NbU8fpr1PRT4HXn6wKHRQXqGStzwlYexJ4NZqro1PzmDFIRc5Z9G2NAt9lCNLx/cRFBwr7ecAmjshTMUqyIYqSamozN/qLnMhzICdvQfUfVYjSH1PdSdNX8zgQ71eNAX+wmRV+NvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIVpXkPP5juLdE1DOwLhNteRDhZeNTmAm0lHTDjHg6o=;
 b=N955xuH9cINp241nZBQq9p1hmT5VFqSuNzASoWTVXsFZ/PoN9E2Q3lwd6e41YGDu+mzOMqK7rDuCihAf7aI01fCfx/iyGSmtalqCtKjZt3lGDdpqAHxKAkkdR9jvGFcmx2ri+eyFBUTDwnX6OFJAdh3DA3tokKpX0DE+2D84c+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 15:01:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 15:01:41 +0000
Message-ID: <486d8b13-0230-46c9-951b-4739357b2b8c@amd.com>
Date: Fri, 18 Aug 2023 11:01:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix mode scaling (RMX_.*)
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230818131742.88763-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230818131742.88763-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c67248-66ab-4e7d-cc65-08db9ffc07a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d9UiRoqoYakxP9sGx2tA/equpjWDgxjprcH8GeCrpyDYmcIvcxa1aDHEqonuHv95lt/gjmXPpxPYxV8nuMWgKOkMDDqrwXkD3dpgQ6Fg1Bbxidp/T/Xa44AtWvkrAj3RQfx0yIRhQyo/8v5qD1EDXIKCgREo0pDBZJcbUr74oY9JWNSdYvQ10XzpRuVXT39vxhjil7DNZeAcI4WR4O8qLu63WzuoQ5QcqtYj6qkFm9PoiWYvf9+acJWZtgTTjEsMn/TwtQ6hx99wtb7ECTTO/CizyzOHV8HmanVxPrT443e16u8GxJsGTXgR7DkUvZkw+uGiRWt60l35AUHIxwbvYyBO0KhuM7gYfvbdfS/kYHs6zeh636ZOtRGcOLI3z9fHiFjYi7a59MmlBuzjlbIXDmnw5bzxQJUalOIpyWILPYjBUgErY8WeoHDzagvQcmE/WO1aUYccwCK30Yln53097Q4fh3PWdI/Rtr4jHpA0hwSydhQYUo9KIP1z7kMJRDUV1wHQA4SPtC8GmxoLIMQthDNuNnNnC3gwbBfoYhWiiqoeWBYGVzhLPTckpQhnf8mmUWRivmbabJi19t1pawnZvCLJF9CuP/ITuOK2CvjdibgsPG9NyqA1Ngyigz8urwxCs3LGmuVg3+Bxb8q+y9fUbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(53546011)(86362001)(31696002)(26005)(83380400001)(36756003)(2616005)(2906002)(54906003)(66946007)(66476007)(66556008)(316002)(41300700001)(44832011)(5660300002)(31686004)(8676002)(4326008)(8936002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dSbmJ6bnQzSDZZVW01czJ3MjFNc2ZTZmpiMTVQdytranpncnpvVUlvOXd0?=
 =?utf-8?B?Q1N0eVdub0VFMVV3aG0xN25EaVJWMmZpTWxLS05BL1Y0Q0dYUjFRQzRyTG04?=
 =?utf-8?B?WWhSMnovVE5KbzdOV2lYTUVhcUlsYnRURytXeW1VTHVMTWlYdHUwM3BKczQz?=
 =?utf-8?B?aWNuMTB1Ly9XcU5QcFpycmZOZlQvRkczczBYYjZTb3ZLQ2ZoRUF3bThNalY0?=
 =?utf-8?B?YmNDZzJUcm5YLzlQOE5lMTA0Q1hQWkR3SE9zSE85UUJKOTlZZU5UcVdKd0w3?=
 =?utf-8?B?L1NnVXNjcXpTZFl3YXpRSWdzQ3VpSGo3L3NHWndXQWNzdHNueFRCVHcxRGJR?=
 =?utf-8?B?YTNhandTTFd3cG85K1g0eUpWS0xpMG9EYWFWd3pNakRJMHM1a2dQRWU3VnNS?=
 =?utf-8?B?cFlYUlBwNTNScmJBSzhCbk5OeW1RVmN6ajQ5YUduNTlBOVpBQWxWQzljekRY?=
 =?utf-8?B?U2ZYZXd6WnBnMjNBYW5maCtJSGsxdk5oWWRsQUt6S1Iya1YzdnkyenZJYjJl?=
 =?utf-8?B?N2tTcE1wemxveUtVU3Z6cTIybStLR2FLTCtaRzNFWTQrdmJIR2QrZGVkZGFj?=
 =?utf-8?B?OXRveTRaTVp0ZGZZOWVLNUxEbU10MHlwakpkSUJGeTlnb3BiVkRkbHE3MUU4?=
 =?utf-8?B?d2FlbDROWTV5b1RPMGFmZmVXTFhTNVk4YzZ1TVdqMG9hczQrWGsvaUR1bGlp?=
 =?utf-8?B?ZU15bGhhc1dUSTZERURxV1hlbURPRExqV21aZ2hkYlB4S0dHdEd2N1QxTlpa?=
 =?utf-8?B?M0IxVVkybFdLR0xwN2VpeStkejlVUzk4Nk42THRWbFdITms0SnBHRXZqM3c4?=
 =?utf-8?B?K3VkVHlBbmRxcVZlRDRkNGI2VE9GMlU2cytGYjZoZWQzOEMvTmZCOGRyRGR6?=
 =?utf-8?B?Q3F0ZG93S1pPeVdtc0pDUTJHdjl6aytrRGkvajhhSm95VW9lc05ZV1QydG1x?=
 =?utf-8?B?MTVNaVpRczRtYU9jWmN1NjlueDRFVlEyRXJ5RlRSaXp0MHpJWCtRWk1lZy9C?=
 =?utf-8?B?d1NVbUk5RGhPcjZOa09ybm91aHlNaW92WVJCbWZ3dVVIQzFuZVBLTFl5QWo0?=
 =?utf-8?B?R3dYNEg4a1lldjNFTGNVeXVua3ZIVVNQYzFBWGpDRTdzRUtOcFpPRlRNb3lz?=
 =?utf-8?B?ZWJQcEtlaC9PZTFySWROQ2NaNXRuMy9uOG5jTlNYUFVkZndoVjNGdjRBTE9x?=
 =?utf-8?B?b2dJcjF2cVpTT3B4MUh4QzZrbm1nbVlyZjlzR3RGL1BrS1BERXpCVnN1N040?=
 =?utf-8?B?WENKWnRQZnNWRU5ISnV5NGErNHhDZVdMWm5yQmJITzlwcDE0OXdOMGRJTzFK?=
 =?utf-8?B?WHh4aWx2R1lBVG8yL1RzWHpJRXVOYWw2dXhCSHBSV3p3dEpJNGcyaUJ0Z0JZ?=
 =?utf-8?B?OS9PZnZuVDFwaERvQ055U0hsbkRTYVIxb2pFMVNvWGNSUGxXTm9ONXVESzVz?=
 =?utf-8?B?Y29LU3Yzc3duVjdwN2JwaEtrV2h6N1BWdlI5TE1sZ3FzWWw4RWVUZTIzMzZN?=
 =?utf-8?B?U1R1dGQvZzNPQWNMRnRGeDJDYjFrb0JOZ3EvTDNyOTQ3Y3ZYSGhhVmtlMkRK?=
 =?utf-8?B?dHdLSE1GWEJhSEhwUERhSTFXRGw0N1hiUHNFYmVZaFNaUTZWUnR4cHJQVTRW?=
 =?utf-8?B?ZnhLdnQ2LytyMDk2MFpoM0NKa1BVeGVOTGZUbGp5Yy95YjdLYm1BaERMbFds?=
 =?utf-8?B?SjU1djlBZVpaZW9DZmkwZ0xkNU5PVjBLbHRBSWRMdU5raHhXaFRoQStueGRZ?=
 =?utf-8?B?VFFjMmI0dnlud3JHOEpEd1orOGdjdFhwVHU4UzJVbzloVDJub1RBYlhIU2Zm?=
 =?utf-8?B?ZEZLRllmUGNrZGZUOGVZWHRGeXJZUG41c1B6cGsydG5TUUFpWHdTK0d6WVVQ?=
 =?utf-8?B?KzZLQmVxYjVpMjNrWEgxQUkwQ0dFdU9YNWVYUVF0bWxkRmUwNENFYklNRlQv?=
 =?utf-8?B?QjlGQVRUU2RIZlBpZzAzdi9yVTBncXljTXZSR3JjWUM1bVRRVHhoMEtLTTVt?=
 =?utf-8?B?dURQMkdLNWpocHBzQUNjK3Jjb0cwc3c2SnFteFBuSnI0UHJsMERTcXUvRE52?=
 =?utf-8?B?eExKUThHVDNuZ1BHQjZlcGNnTUJTN09HbitTSlJLWmhELy9samx0K0hNTmpW?=
 =?utf-8?Q?4V61f+TWGBBp5zcc/kKHXUCRq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c67248-66ab-4e7d-cc65-08db9ffc07a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 15:01:41.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvtPL7yDqCoH9P/5+CDRowWkY3yNeUipvwLOVRPuUfSNvtWDDzd+8AYlSfUZe7Vz9Ukjlx1hXqQEjRuEugG5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-18 09:17, Hamza Mahfooz wrote:
> As made mention of in commit 4a2df0d1f28e ("drm/amd/display: Fixed
> non-native modes not lighting up"), we shouldn't call
> drm_mode_set_crtcinfo() once the crtc timings have been decided. Since,
> it can cause settings to be unintentionally overwritten. So, since
> dm_state is never NULL now, we can use old_stream to determine if we
> should call drm_mode_set_crtcinfo() because we only need to set the crtc
> timing parameters for entirely new streams.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Fixes: 712237a4a1b4 ("drm/amd/display: Always set crtcinfo from create_stream_for_sink")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3b27b7742854..e9aff5014e39 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6035,7 +6035,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  
>  	if (recalculate_timing)
>  		drm_mode_set_crtcinfo(&saved_mode, 0);
> -	else
> +	else if (!old_stream)
>  		drm_mode_set_crtcinfo(&mode, 0);
>  
>  	/*

