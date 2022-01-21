Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C949656F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 20:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F310E5BA;
	Fri, 21 Jan 2022 19:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26910E5BA;
 Fri, 21 Jan 2022 19:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4QNhEyZliRFYSq9mWmS+Ho8tqN0rq9a6b8ZogToi1bfpOCbZi1eXGluthDq7H1QJKhst7zydFJ8uyxGrFLcUkKii+l/PbPWEeKX+F0+i9EpCGJxep5VdXApJqyClRCqDA8VxDQXnVukvfldWgfSYl/o0ndZnWjosV7FQMa36THxaiQfN53y46bZUf0XoA7zS7jjdw3XmSRANkKzjWbGwb/2nsy2RKJZds0OUSvcgL9ha370pRU1ShqinjAoZMCb6BfkWYyo7uZUbWu2+bDSg3s8+cXUwP671m+FUBEKNFYaDFmgf/bDdBkxqB6V0zzVhEAE7e+X3On9oHkPKKRx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0NcLSZohCGItVO5cwHsDesbxHVwYZmYfQdDUCBaOIs=;
 b=J/xgTu3t9mi8QvG3IRERKsFbnrHlSvICH5L6NHYyvedriNnA7Dymrw4rZlwBPBk7Tlm988W9OfkKWIEr61rw/2KHkuKq95evriBv0uuv0t56vmqMYX7Xoh33BcavGiQY8qHVCzzbJA6epK8wkfXUeoscPeDCmWnr4B5yaoWKLMpJIP9wnSJ9b556QqryT/CJHRhaaV+KRlk5UUnATPg4mKVi1uQi/smYziuyo/AqEgCZJpNqp3BKHj0zWgfBj95/WyzVTZop2YnrAaDlEevJcO/AWD66vUZf3wFoLoOA3mJBUeghaewbu3AlNd5uUfhgc3NqxRFy1vWcuPfza7K2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0NcLSZohCGItVO5cwHsDesbxHVwYZmYfQdDUCBaOIs=;
 b=IG1xOyuEFpdxpfmzy9UGLrbtdRfQFFqs/ESU5+a5RF8mEv4SE/afJkm3/HZ1A0JCT0VGPTIdqfwRDjv9gmbMV86IJCR0yVylvwfdnjyhUu0H71G5ntuNn7+ixMVaGZobu/NfHJkZ/8l5hfeEE0jIvd06inm4TAYgLLREMGudYuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB3152.namprd12.prod.outlook.com (2603:10b6:208:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 19:03:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 19:03:19 +0000
Message-ID: <51258cfb-c3d4-ade3-0195-54835445d321@amd.com>
Date: Fri, 21 Jan 2022 14:03:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amd/display: Fix memory leak
Content-Language: en-US
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, mikita.lipski@amd.com, Wayne.Lin@amd.com,
 Nicholas.Kazlauskas@amd.com, Jerry.Zuo@amd.com, Anson.Jacob@amd.com,
 eryk.brol@amd.com, aurabindo.pillai@amd.com, nirmoy.das@amd.com
References: <1642764373-48563-1-git-send-email-lyz_cs@pku.edu.cn>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1642764373-48563-1-git-send-email-lyz_cs@pku.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0736a11-d02b-498a-c452-08d9dd10af93
X-MS-TrafficTypeDiagnostic: MN2PR12MB3152:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR12MB31520B74A7867008C0E777088C5B9@MN2PR12MB3152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5caxK6iVsl86yqgr+POrOeFuuF9f+qjJNxTkmukXfAbTLXRLmeUYKGgMX5PfXiO3boTyoWrwNDPXrSjQXJ49uMt/CAy6XvxgPGHaBJwWQ8gwK/NCMUT+tzlzS6zpg3eA/72L5+6yGaVBeUc9l5MuLD7zaHXoiT1IRxcnU1OYSatse5P6YN4JXWqDUrjYqOtXZ22I3MFb22UWQ/8LkugsjDPyRh+srU5BVlc5Q0U8AWdsdWSzJzRiwdWkxNWfzZOi4zDzE2lbkjIEjTc89cZlnZbml3SZOS/1NzzpOrq00nIKHO3f48LdVuTCHHfhOsTr0A1QEHEmgpEOs15iNhKkyXMVFMEvSKKVW7Y2jEmhI6FUMFX2d/pfitvHrxECYFAFaKvU41iXh9j2y4DK8Gqtx1h7TLg+BjrCQAKI136jZRTJRiGXlZ6tVUMdhJvDZwRtQSHYN3vS4MndXwc9d5frSH/Yk1lpN7079scxhgNpYEz1To5W7jh7yVTiWSJDzoGWPpuDA4lE/pQoENVSDZyU8NueBJQS6VFlVcEcErzx5hFDSp8zrGC2CUU/WUmETZipusJVdwajohS8DWmh24WhETCXLDbrKNmGNAwv1CjqItHueV7i3oRvPINf7savDOWfwcg7yE1imEnIH4N7Akr+8a56fQuNb0wGG25m7mqA3rcF09NCJZky3GsY0UmKiqjCSNUL3gdQ81U4HNn+WuLcjV0FyX4y0O7J+89nJ0LjBOL74JDEjjpYhtvgMZO6Y35Kmo+gAeDsBtSEKLkQvnoGuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(36756003)(53546011)(186003)(6486002)(2906002)(508600001)(316002)(8676002)(86362001)(2616005)(6512007)(6636002)(38100700002)(31696002)(8936002)(66946007)(44832011)(66476007)(66556008)(6666004)(83380400001)(31686004)(5660300002)(4326008)(26005)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxzdTFXUmYram90clZQaDlESWh6aEsrNE1qQ3BTUkMyZkdMckVqcDNMcC9w?=
 =?utf-8?B?NGVvM1NnYWsrOUIvZHdiK0Q3ZDdjaDg4MDArWSsyQXJ2QUY2bytsRkR6S01n?=
 =?utf-8?B?anVLQWIzdWJTamFmU2dhblgyZjFSSXpBbDZ0L2NVbHJYQjkwVVdicm5Ycmpx?=
 =?utf-8?B?T25HMzh0NFIwYTRCVFpkYjRBY2dkMHVOUWZMbThtMkljQ29nMlcwRVpiR0No?=
 =?utf-8?B?aDNLMmNqQUVaSmdDM0xnYWt0amRLRDRwQ3dXMFl4ajIwMG81VG1XT2NIeGw4?=
 =?utf-8?B?d01WSUUySFFOYzRnNkhPY0psekJ1blRURENadVNoUEdjZ0pweERTeU5GdkFK?=
 =?utf-8?B?b01jcDVFbkw4bUJHRHlUNzVyQ1A4MVVBaW5RUTF1azUyaWR3R1dlbVFKNXJq?=
 =?utf-8?B?cm9LVGd4V1V1ak1lL1ZaUHIvdW91RFVVcERBTVJ6L0x6V3FlRzVwNzFnTWM1?=
 =?utf-8?B?ZG4zSVI1RDM0d0ZucWpsNFZvT2FzZE1uWlpJSElDN21sQ2pKTjF6ZzVta011?=
 =?utf-8?B?UnBLbkNwaWZHTndENExxdEI3Y2VKNXZnVGtrRkVkWTdxRDZrVWdaYjZ1MUc2?=
 =?utf-8?B?SHZrV0c5NmJjZ3pWYlJKQk94RzVpSUxnTlNQbmFnRWVaeHN6OFlFQ284b2E0?=
 =?utf-8?B?MTZyV2VKMWsxUWM1VXNvTHpBYlVqVEN5b2RqeXZRYjRZSzZuaVJ4TlJBTkhx?=
 =?utf-8?B?V2hzb21zRW5OeE53UFpkeDFwejE4ZWNDME8xNXdhdVFVU3lSSTYwUWZNZ0lW?=
 =?utf-8?B?U1dzeDNkR3IyTHIwQThKL0FNaVduWGVCOU1OMkRWU1Y1L21qWUQzRzBZWG5T?=
 =?utf-8?B?SitmWGN5SEFMZURlUFg5VW1mQ1F1Mk9PU3lQODlSSkVVS2V6NG43ZC9UQXps?=
 =?utf-8?B?bmVlTUxDTXY3aEdQZTM4emkzSzNpaFE4VmFHTUxXdTFTd0tUZ3NaOEs3aWQ2?=
 =?utf-8?B?b0h4M0JHOW9SYnI2cHJZL28xSzVIN0g3dmMwMFpOdGJqek81d29KVHZISzVX?=
 =?utf-8?B?L3BLR3BVZ3FSU1pSRW1LcWlMY3NFdHlIdEFlUXQ1ZDRSU3RkVEljazhaVlNI?=
 =?utf-8?B?QjNxYThLSHo0QVRveVl6MnMzcHBnUTVSOUhHVG96U1NiWEtjRmtPRE1iM2Vq?=
 =?utf-8?B?N05YVFdVK2dIclN2bUk5VDN6TDl5TG5JWE1EbzM1a1QzdEdGeUtmTGI1aU9r?=
 =?utf-8?B?RVZJREtxY2UvRmNnM2gvVys2RXAwLzFjZjFtaHUyNXFzN1FKQmFkTk1VY2Vh?=
 =?utf-8?B?YkN5VW1vR2g4RWRnRURpelpXL09SZ3dhT3hKb3NZcTV2aURuZ3grbWdobm1o?=
 =?utf-8?B?N2Q0akRmVXc0ZmVoWTFUQTdmalVHdURtR2xEcHFXdzNrTVhrREdXbnk4VWdO?=
 =?utf-8?B?VW1OTDZwU0NLZk1takxOVmtzRWZmNVZ3aURWdTcyVGZKcTZxNWF6TE9ENm93?=
 =?utf-8?B?TDNmREFsQVl1bTVOZjBueUIzWmx0S3A1YVNkR25BL205cnZhMURKMzVnSFhi?=
 =?utf-8?B?NFd3dDVGejNabnZVS2tQVE1hWlRQenllcHNaeTRoR21nZnRWQXpTYllDVjJE?=
 =?utf-8?B?a1A4YmZxa1lqeDNxbkhXeVR0SjBtMHF5QUlubDh3dDNDRUExckFjWmY3czlN?=
 =?utf-8?B?Q29BelR3UlBMUExRZHVOMFpNcUFWZmcyQnZBR2hESFRvYmNMR0Q0ZzlNamQy?=
 =?utf-8?B?VkZqdVNPNlE3dDliMkZZMGZacTFmWW9IR3QvR2REdWNtSzczZXVYRUprbU5E?=
 =?utf-8?B?bVY5K21YVTFLTTRqaEpDbktGQmZLRDYrTGNJK2RwTW9nTnFEejFpV08wbGxv?=
 =?utf-8?B?S3VFUWE4b0d5ZHFmTjhobkthQUtsZ0NDbFJ3di9oc2ZuS2w4dURaZDRqS1dD?=
 =?utf-8?B?aDdIV0N3V0Z0eGFjTTFDdUFwNE9WV2ROY0FuZEN3SCtSbGZYMUZXb1lKTVpL?=
 =?utf-8?B?MmtLMm1VT3pTcXVYY3BiVmRpcFBPTUZWZCtPZW1uNXo4M2I1aWV3bnVRREVB?=
 =?utf-8?B?WTZhUkxmQW9PRDRaV1NiSmhDVHBJVm1YUHFGNFJPRFE2d1dKdzNKcHZ4bXAv?=
 =?utf-8?B?Y2VwRDdSdnpaSXJtNEdXZ25Pd2FDelE3K3JSSmRJNzVwVVUrY3NLY0V2QkUy?=
 =?utf-8?B?b2RVQXFmVHJ3R0tCRE5rTEwrVTVrQlR0WE9RMTJ3ejdNNTdBWDl0RUFaTjRO?=
 =?utf-8?Q?ra3AN44HAvkQTCv0SJ3eFbs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0736a11-d02b-498a-c452-08d9dd10af93
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 19:03:18.8766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/fw6zGwxznpGp7qgxqZJ5nbxKcbSwDLoud3q3D7NS32PGRRK9xFpMriJmw/VuEE9C6qH2CkqFBnSVK+ZXzqPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3152
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-21 06:26, Yongzhi Liu wrote:
> [why]
> Resource release is needed on the error handling path
> to prevent memory leak.
> 
> [how]
> Fix this by adding kfree on the error handling path.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 80 ++++++++++++++++------
>  1 file changed, 60 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index ded64d0..e463d46 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -227,8 +227,10 @@ static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -389,8 +391,10 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user((*(rd_buf + result)), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -1359,8 +1363,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -1376,8 +1382,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -1546,8 +1554,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -1563,8 +1573,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -1731,8 +1743,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -1748,8 +1762,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -1912,8 +1928,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -1929,8 +1947,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -2088,8 +2108,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -2105,8 +2127,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -2145,8 +2169,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -2162,8 +2188,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -2217,8 +2245,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -2234,8 +2264,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -2289,8 +2321,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
>  				break;
>  	}
>  
> -	if (!pipe_ctx)
> +	if (!pipe_ctx) {
> +		kfree(rd_buf);
>  		return -ENXIO;
> +	}
>  
>  	dsc = pipe_ctx->stream_res.dsc;
>  	if (dsc)
> @@ -2306,8 +2340,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
>  			break;
>  
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  
>  		buf += 1;
>  		size -= 1;
> @@ -3459,8 +3495,10 @@ static ssize_t dcc_en_bits_read(
>  	dc->hwss.get_dcc_en_bits(dc, dcc_en_bits);
>  
>  	rd_buf = kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
> -	if (!rd_buf)
> +	if (!rd_buf) {
> +		kfree(dcc_en_bits);
>  		return -ENOMEM;
> +	}
>  
>  	for (i = 0; i < num_pipes; i++)
>  		offset += snprintf(rd_buf + offset, rd_buf_size - offset,
> @@ -3473,8 +3511,10 @@ static ssize_t dcc_en_bits_read(
>  		if (*pos >= rd_buf_size)
>  			break;
>  		r = put_user(*(rd_buf + result), buf);
> -		if (r)
> +		if (r) {
> +			kfree(rd_buf);
>  			return r; /* r = -EFAULT */
> +		}
>  		buf += 1;
>  		size -= 1;
>  		*pos += 1;

