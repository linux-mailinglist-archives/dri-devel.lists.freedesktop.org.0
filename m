Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE887707D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676210E752;
	Fri,  4 Aug 2023 18:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B11510E748;
 Fri,  4 Aug 2023 18:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF0CFC4OeLxx1VvbsrB511rlePCi54zwuef1h2PtvYbfWuRHspXydTZFrkOOXJuVjVlxwxWAfwglO61NpOYWnfcHs/fPYWnnjx5HzA09mjtz6eyVL4o06bjBQwZ9zNTwghysLyq6S8cNPqYDt4LH38GZ5wzQMAKZv8DKhZ5D7ZVv5YXZU6HArdUViwMcaUgXuSguMdO8yiBsUNGeqWdi9xOrmxRlkteTPX+Kk74n+g9m/7Xf05I3VS9n4EBJ2falErItn7AGvZqdQjvSzjYNV97sLy+0d4Pcg8dZTQ9t7iv7vUQd8MKC48W0k8Tp74sS3C168OgUifNXJqiyiLfedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcAW4Nh2XMjSdF4T6qJnglHOPLH5WR5neNFSt7bL3U8=;
 b=Tfdn4PKjg2BonzH9xNAZnGhTvkmQkJHKXuSSrbwZvfysM2g31oshSMAu/2f1aEAuQ7HdtfgQhQC9QOjGq3aLUXsRX37vcIE89QPZHCsrswVRIHSPBSNUVVFrrass8jpODsdCedHo3UwuTwmAu0l/OdcQM8eCFLJxk5GLmPY8rVWsTilxTSQx2g92YeCkqNaJzzfu0ZtXd2dTZS+tTa+r5yFKbMjpd5LqjOoY6viZ449RbH8E1tsCuVPtEcIDt+9AHfemIVF8nr1O9OAaXkYfJp9JOHppBEcbjAJanKYQkxAsu9GTahK3TnpsL4xwTg8fDSVQdq5euhmnG5nc0LUk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcAW4Nh2XMjSdF4T6qJnglHOPLH5WR5neNFSt7bL3U8=;
 b=TpV2c/cFogH9N3GLC94jgz1F+CXUQuvGT9nT52msf8N9qTPFw5EmzjpmcnJIIyo9Qut/jomzbNt4YNI/4kRLVSUwAkNiZKSaXzLVmo2GaMWwUoiN7qvkn978aUzIZydRzVrYkctc9A0+OBFPrLkfI0VOPXyMKNnrsCmudqilT90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 18:24:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 18:24:33 +0000
Message-ID: <93602cd6-a03d-4124-8bb3-de21136d9589@amd.com>
Date: Fri, 4 Aug 2023 14:24:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: ensure async flips are only accepted
 for fast updates
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230804182054.142988-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230804182054.142988-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abcdd5f-366c-49ae-0ee4-08db95180c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1zysCtwtqj07orG1iAcHMaStvUMBUP06YvvbeTQTk5ifOpIJNxFtbCbf6OuKfAa36U+slPMe4jSPiNSkU/bn3VbeZWhU1KbYguOm0Auoymc8ZpaAS7qgDjtsw8+Ch8QLsrRTmEFaJ4sP96YNqGU9Nv8+vFMFyUALxl1+lMyEWCJ/xMTCgcXLcFtHPSROlX7YpOJvAgZymJBKVGjJP803UO/vhftrbYYI8ydO3/Lgqbmy7oe+aYnaMeWpym5S1qEHOwuYh40f8hMvwD6Cv9PwO5tU1DjnfbC7xfHFu/asvwfe0ow6Vuy0c0hbb5DjNn4nS2E3P9EiTEVGBeGLjXPX6V8TolzulwuNK+lfA2QtyRJU1iDkf0uV+4m2aAsYH8/h64ND8SYVpt8OD8q40zLemUDjrNWFoiPXgqwTZAfxAKTyKE/hvVRRUh4Z/LZButeoeWcY9RMZIfPINDu/gr5p2s7dFejoL502vMXfVpJso7j0kx/9gWDyzqyA0m95TWGrtUwbyZ3qvktoKzFk5BtKdlZUZtl5hJ8UkX88AlvB+h9NdhmvJ6bxXnZ1qR67XISzlKm1CLb/RhzUh6LI/r4JS+PMSflblww/ON0gEpFqK6mdsAmjiJImkLRq4ru8WNV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(1800799003)(186006)(451199021)(8936002)(8676002)(26005)(36756003)(478600001)(966005)(31696002)(6512007)(86362001)(6486002)(6666004)(316002)(31686004)(15650500001)(41300700001)(5660300002)(4326008)(66476007)(66946007)(66556008)(44832011)(83380400001)(7416002)(54906003)(2906002)(6506007)(2616005)(38100700002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0VvRDZRQ2xaOUZXblllUjV4S0J4eml0VzlsaExSdU1UVUhjalMzejlFcXc4?=
 =?utf-8?B?MzBsU3BLS1hQNDh3N2lUQnRyRk9tSjRrZjM5Smg4Z1lXaVlVUUpyL04zb3p3?=
 =?utf-8?B?TmtldnpzQVNJbFh2a1hadFhLcHdVcFJBWDRtUVliRmtneFVTS3Rlb1dNTmJj?=
 =?utf-8?B?VzlpQVZtS1FiWlo0Wm1pMGdvNGdickZocFAzWjVzamVpTUVOZDMrNWFkdDRT?=
 =?utf-8?B?d2dKZUs5RkZhYUx5V3ZNem9IenVLYmZ0Mmg4Y3ZPcVVHdEZKVWZrZW5UZ3VR?=
 =?utf-8?B?MGVvZlNSczFIM0xYRXpxcUQ1UnZ6N1B5dU14UDVTNWlyY0NWeEZiWXh4N0o2?=
 =?utf-8?B?RVlUajF1aUU2RXB1eFdSTUJVN2UrWWlGYUxzVGhNaEZySTdra1Z4RFpheis5?=
 =?utf-8?B?QUFvd1JwdFA5aGg4V0RkaER4NDVQYmNmVnBXZ3M1REoxMzNxb2doTUZjWmps?=
 =?utf-8?B?dEhocm1YQWgzdDV2NW9lN1d3WXdIRE5mUysvWFU5Y3ZkeDZ4VXdGazZnaEt0?=
 =?utf-8?B?TUpZVEdoNlk4ZCtUd1c3OUhwWWFqZ1BHaC9maWsxbzJnUS93UEd1Zk5TcFBq?=
 =?utf-8?B?blJhdk5TeFVvNmJaMkVWMWxlc3o4RTM1dXJKUmtJaVNjdk5WL3BSWkcxR24v?=
 =?utf-8?B?cjg4dkZ5S0lKUzhxMG4zMDZuVHIwU0ltQ095TnJvTzdMMzFGdzVvNVJoVUE3?=
 =?utf-8?B?MmJVUnRPQXZNbVd1QjA1ZHVVU0k0NVlOQUpiZzFpbDIrNkNaUHlrRHJYdDdi?=
 =?utf-8?B?bW9NWXBmNUozSXRqYU1Uek5pRm9KSVVUSUtMclRXMzBrRHIwRjBMWTEwTWtR?=
 =?utf-8?B?eklQQnpXdjRnaks2TFozMzkrWnFsWndPMC95TjRySWYvMGlJVEg5M28xVjRK?=
 =?utf-8?B?WDFQMkNGT1hRVGhOaTMwK2puYTdXUnltMEhNMXZEb1htbFNsMG16Q3JoTHR0?=
 =?utf-8?B?ME40dnBRYWhmU0dRWDZaay9yRlpVTG0zTE1xRmJhbDNKUUI2bGV6d0xacVNF?=
 =?utf-8?B?L2RMR2h1ek9hZkhKZkVzMTl6L0swVzRWSjVvNm5YSVVqU1NxOVpyNDFsQ0dO?=
 =?utf-8?B?ZHpMODIyMGppVUlZeTBtcmVKWkg3L1RNZzI2Z093MFZld1dkRkVHNmN4cWZq?=
 =?utf-8?B?ZjlIdVlhZGNCOU9tdklSYU4vZzU2ZW04WkZ0aVdlZ3VLL21CUTkwT1pxbjMr?=
 =?utf-8?B?TnVUeFJVQ2JPdGZkNEp5Z1ljOTZpUmswd1A4Z0dmbStaemg0eGFwWFlER1FN?=
 =?utf-8?B?Y2k2NjIvRmIwbHI5QTdQSGlYNXd4bmxYOFl1YTczS3NYZy8yd29rbjhIVG53?=
 =?utf-8?B?dkhIT016S3l2QUlhYmdvSjFzekNzcTNGU2t3aC9NeEw1UTdhckdOY0QyZkFi?=
 =?utf-8?B?Q20xbXh1OEFHQVplRVlBcHRWejJuaURKMzdwdHpobGQ2WGZhR1J0a2xuN0tZ?=
 =?utf-8?B?d0NoUjlyZmpLU3RzbS9BbGlCTmtGMXdqUjk4ZEpNQk1iUGlXcXJvM2k3dFA3?=
 =?utf-8?B?VzcxeHFPMisxZ3lzR2ZMbHBqTExzTDd0UXRWdlRmdlZ1ckVKSDNpUGVoaEY5?=
 =?utf-8?B?K1VXaGVneTdHdWgwT1VsdEJpWkRPWmpyem5QYThpZURZS1V2bU93bUlBTHNo?=
 =?utf-8?B?Qm9KRGpKVDVCQUJSY3BLc2QwWEJ4dyt4bXB4M0xDOFJteDJ5QVRKc29MRG1T?=
 =?utf-8?B?WnlDaVNOMXhSRFZoWjlOem5Ddit3b1htcGgvaTBSRXdmTTUzRGMwTEdSUTBO?=
 =?utf-8?B?N2xWYUNVaU9KMkxrT2xuRG40R1JmWVd5bU1pbkVKRzMrekxmVkFsN0NGN00v?=
 =?utf-8?B?L3l6OVN0NEIyNEkzNy83b0F3ZEpYcjkwOHU1VTVMTlQ3KzJxOUJCS3pLRW55?=
 =?utf-8?B?VVgwQUo2WmRrMGtoYW81S3dSNG9kdDFkenZHWS9Fby9zRDhESTQ1MGhLZ2E5?=
 =?utf-8?B?N2VmNGpicWR0NyttVzhqc2ZGZ2VEdnVmYm1KVFZlUnl3ckg0Z2xYSGtEU1F0?=
 =?utf-8?B?WVpDVmR6NDhFRjluT2UzajNPUXd2T2NxaUEvZ05PUkVZaTAybUNlRHlLWWl1?=
 =?utf-8?B?dHBrVXRSVTZkR0R4ak04Y2lDV3VVWVBoTjZHVWlNRkZ4dFd0Z05LMUNkUEV2?=
 =?utf-8?Q?IlCnQ7fUofQuvWEhF/UMkk+2v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abcdd5f-366c-49ae-0ee4-08db95180c9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 18:24:32.8766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfS3hLduXQb7bnIjmGylvdmEevo9UA+xB5RIbvtHCkreVhUZ2Tf4J+hG9dYgcZATi/9FDOrjmlYo6cNSOfJcYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483
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
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>, Melissa Wen <mwen@igalia.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-04 14:20, Hamza Mahfooz wrote:
> We should be checking to see if async flips are supported in
> amdgpu_dm_atomic_check() (i.e. not dm_crtc_helper_atomic_check()). Also,
> async flipping isn't supported if a plane's framebuffer changes memory
> domains during an atomic commit. So, move the check from
> dm_crtc_helper_atomic_check() to amdgpu_dm_atomic_check() and check if
> the memory domain has changed in amdgpu_dm_atomic_check().
> 
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2733
> Fixes: 3f86b60691e6 ("drm/amd/display: only accept async flips for fast updates")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v2: link issue and revert back to the old way of setting update_type.
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 ++++++++++++++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 12 ----------
>  2 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 32fb551862b0..1d3afab5bc85 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8086,10 +8086,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		 * fast updates.
>  		 */
>  		if (crtc->state->async_flip &&
> -		    acrtc_state->update_type != UPDATE_TYPE_FAST)
> +		    (acrtc_state->update_type != UPDATE_TYPE_FAST ||
> +		     get_mem_type(old_plane_state->fb) != get_mem_type(fb)))
>  			drm_warn_once(state->dev,
>  				      "[PLANE:%d:%s] async flip with non-fast update\n",
>  				      plane->base.id, plane->name);
> +
>  		bundle->flip_addrs[planes_count].flip_immediate =
>  			crtc->state->async_flip &&
>  			acrtc_state->update_type == UPDATE_TYPE_FAST &&
> @@ -10050,6 +10052,11 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  
>  	/* Remove exiting planes if they are modified */
>  	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
> +		if (old_plane_state->fb && new_plane_state->fb &&
> +		    get_mem_type(old_plane_state->fb) !=
> +		    get_mem_type(new_plane_state->fb))
> +			lock_and_validation_needed = true;
> +
>  		ret = dm_update_plane_state(dc, state, plane,
>  					    old_plane_state,
>  					    new_plane_state,
> @@ -10297,9 +10304,20 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  		struct dm_crtc_state *dm_new_crtc_state =
>  			to_dm_crtc_state(new_crtc_state);
>  
> +		/*
> +		 * Only allow async flips for fast updates that don't change
> +		 * the FB pitch, the DCC state, rotation, etc.
> +		 */
> +		if (new_crtc_state->async_flip && lock_and_validation_needed) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> +				       crtc->base.id, crtc->name);
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +
>  		dm_new_crtc_state->update_type = lock_and_validation_needed ?
> -							 UPDATE_TYPE_FULL :
> -							 UPDATE_TYPE_FAST;
> +			UPDATE_TYPE_FULL : UPDATE_TYPE_FAST;
>  	}
>  
>  	/* Must be success */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 30d4c6fd95f5..440fc0869a34 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -398,18 +398,6 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Only allow async flips for fast updates that don't change the FB
> -	 * pitch, the DCC state, rotation, etc.
> -	 */
> -	if (crtc_state->async_flip &&
> -	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
> -		drm_dbg_atomic(crtc->dev,
> -			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> -			       crtc->base.id, crtc->name);
> -		return -EINVAL;
> -	}
> -
>  	/* In some use cases, like reset, no stream is attached */
>  	if (!dm_crtc_state->stream)
>  		return 0;

