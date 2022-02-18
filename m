Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277764BBD9B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F207E10F27B;
	Fri, 18 Feb 2022 16:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F294110F27B;
 Fri, 18 Feb 2022 16:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENd3aaHdXQLME/5XDE2wZGIlELBzkHMNcJF0vCSLEfvMJme5XHO+2d9r9PWWdQoOzQ2pdP247obAQpEQUl19HX3OwGisegd+LYolN3K7LWZN+AmSj3H11rXQrpL9s4iT9SRkrtGcizWROMiJ9DFbYtRoeCpqvDAMP+WQy0bGAmxr7ET8Ih+eFtgZ1qJiMWDYUwdNx7IuHXwlwwi8WRl66ziYpk6M/Xcbmm0i5l1xOPBLlFdLGiQT3cFynwvU+k1c0U9U4HthhVMo6XQxZMcJwBT4kEW6SHBNdnmBjkhc21FooBUP4zq/Vz3L9DjDIuzeROKcLTtWbRtYLCOwJnH2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho3LWKbIe2Y1PvDmz4MoPOTYcXIEKSnpPSBW2xgnCsE=;
 b=F4Lg8doYdR6ljENHzH2Zc/ZcAmYoBx0IfWpe8Xjprma7A6nnvRtNIxdeLTH5LhhSycbbj0OLOgYWgkxhPEbXrcfKddlOnKCQQGAL6A/zWt/RA7qnSAtusu5aqK1OM9L1GADdC8hMZOd6erc8N/MYAlZ75myvuHukA1Hf+Uc0Zvv7mG5Jyu/nliWJQuvQBZ9e4j666up1dLLFC/DzB6wihE5li1onae2C4s+iRn+H5gbL+syOtmHdTjJf2mptBsR8v4qHdse1iMFThC2OuCkwX7fsS8cgnbCVcvIxn+ON6XKLpQkt5e3PyJx67yPH8a1ljmsnNGroVw9/hLCuuXWoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho3LWKbIe2Y1PvDmz4MoPOTYcXIEKSnpPSBW2xgnCsE=;
 b=alKdqmiT+09pjTjKQe5q27aN5y9PZ+a5fgL80AvW+/7VwFYS9tPz5X5HOBnOm4Nmr1Zg/gLXRW//lAgGZqdUanPbUkJ8GtzxYrfLNZJwrcIJmpqNMcgKD5LMqH8+r6WvNmIr9eXqcYOnLko50/oOH9jaWuAqUzysdnnQSBaULbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 16:34:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 16:34:41 +0000
Message-ID: <c8bdfcf8-f1b8-a584-ef1c-39f7e971f03e@amd.com>
Date: Fri, 18 Feb 2022 11:34:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 01/22] drm: Add drm_mode_init()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-2-ville.syrjala@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220218100403.7028-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda33b16-ed1e-4266-6bea-08d9f2fc8fc5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4705D7C389B95BC21B4ED9F48C379@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fo+nfE7W0Iv9DV8BaP8ml/3FZFBL5/7Mh+1TC6xIAj8zq9C+D+iW1c9G9SJg4xBowh9ugO66rNIjoPhsH+/7QvjjFmMS0JFAQPECsRJahnLsCO7bU8M3BEXBMBMbNGh0y0rHDO6M9lUV/bHY1fPDCi9dnRhjk0ASQeGHk45+SyTFsH3M6hu/FjJEvyoaTWfP/Pjkr6o8NVF1MTxGUlmzt8/LV7DMqRITmK0baVzTmTtEzar5wNYZd9FLxl4K21YivzLCkkyZ89iQ3h/eWBEUMDOvoyr1TG5qkL2gyjo2xpduETzkFVFSawqWZiXPt4z1KOdK7hfaipFvQKfCZ163GIl/adMcmOn7Y0nbmEa37G7gGlZdSuQyOCrfhTqSTP9w9WWqvu9wDuWFbDCo3GnQZ4zGCUsuzVksQuGcrSsa9QA1wjYR1F9i9aMysB9N2XlmHL1QZvI3YJSnAJo2M0pteMb6GCxlgpL+1VobOjRoNkvshW0ruJGEHXC1s+ywMRG6oD44kQhDZO6uR27sJ7VjzoA1l8XDPY6+qIiYyIzhyAckvrHPMKFS9+daQGIMgiyuT1XEQK/KIK6msKHVqTVP8Z2PZeCNg5jf06avXtLJzToJTz61pYJuHxLkOthfJI26NhmxonlTvPcBzv4BThAtBftEayaKbZ+DvSSJ6p1PbZvDSEMLV4i9dfJmKx5QxXn296vVlQqApwFB1ndBp6dEV8vKV0nGuW/59FmyMbJ7MVe3D/9ibA2bXiwAx21I3u7v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(6666004)(508600001)(4326008)(66946007)(66476007)(8676002)(66556008)(86362001)(31696002)(5660300002)(6512007)(36756003)(6506007)(38100700002)(316002)(53546011)(2616005)(44832011)(31686004)(6486002)(2906002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlBlMDJERUJXYWk3RjFUMnpPZ21Zc2RPUTBKaEExNVdtY1pndXBtWGtRdUZP?=
 =?utf-8?B?STU0Y3duTE1UTnAzM0poSW9wTno4OCt1aTZwWDgvWVJEc0xiQVovVlRDRU9s?=
 =?utf-8?B?b05YVE9PSTlCWm52c281a1JOeGswbTlQZm45Z2xHMXo3ZGJ3Q1dRNjFma2Rl?=
 =?utf-8?B?VzJPSE9McFBYWXFyZkVzUElKRy9RVXRkRFNXRmhScUR2YWp4TjBnNzFMUnpL?=
 =?utf-8?B?VUFvczZLZE9aamN5UldzLzloSDNVclJMWG02amZEcTB1SzFlczRzTXlQbzZR?=
 =?utf-8?B?MUt2Q1RyLzJHamFGVWZzN2IzWlJSM2w5a1F6by9HL1BVZCtQSC9HTU5oREJI?=
 =?utf-8?B?dnRhYUQxZWhDbVpyZzRDQWJGYUExcGRiVEFTV0diRi9mTlR3NUN3T3BITk9h?=
 =?utf-8?B?WFdDM1RvUzN3R0ZHclpVY3V6OXdmVEtQekpPaDdUVzlROTlRNDBiQlVUQ1hh?=
 =?utf-8?B?aWlhSG9SN0Y5RG1BRHdrd1pPTS94aEtZMnY3TFl5QmdJelRZL3dpNmZ1SFJT?=
 =?utf-8?B?Wk5WdU9OeTdMNnU5bUg1Uk1WOW9BdldBd3RjWUpDcmhLMW1ZZWhiOXN0T0t0?=
 =?utf-8?B?OGxKbUdwNzVNKzRxYS83cmFPaUROZ0VCSnd6MjFUaUJWc0doK01YT2JDV2hS?=
 =?utf-8?B?QTFJb3VYVXdEdzYxcmNScEkzOFZBQ1BnS2Q5alhPM0pvWXFWOHVpZ2ljdW13?=
 =?utf-8?B?ZnFIcGhqb2dCK0JFcVlDQVVWemYyMGt4am9NV1ZGekRSUnFwV0NTQVp4QjBZ?=
 =?utf-8?B?R3cvYlk2a3ZoUWVIYzdCOTFzWFVpQXc1cWJhZVFYa250c2NlT2xFeDYrRTZl?=
 =?utf-8?B?RlZJZ2xBT01TamM3b0t1ditlU1JpeFdhS1BnZVBDUzlON0d3YVQ3ZHJGalFh?=
 =?utf-8?B?UVF6cVFrQlFyVHJXdDhvSnNRK3BHdXpzY2svTGdZVlA4ZzdWVHVjNnV2dmJM?=
 =?utf-8?B?MlFQQ1NhbXZXNkZIajdFeGgxYVFqKzYzL0FhT1hmeHhuRGNqYjZYK0RwOUNs?=
 =?utf-8?B?anRrYlFSbkg2eEN3QmJkT0k3dG1nOSs5Ty9TRXRmd3R2OTdwNjJndDl1RFJX?=
 =?utf-8?B?aW5yczBXUlhORDdTSDhjVmdyU1ZScy9rWWFaWTZ5QWh5Q3diS0UxQjJqZjlP?=
 =?utf-8?B?dW13Y1IzTVBTRnFQV0tKQXpOdk12d25iTWE1ekllOVdZNHpaL2RzVW1UY1FE?=
 =?utf-8?B?N1BiMDN4cjdGM0tSdk1hdzJwQkJDYTdDNlFiL2lHWHlxNHRBS3Z4UzJvQ1Fm?=
 =?utf-8?B?WWZIQUE3emlzMTM5aEgzYXlIOEhPQnFON3hpc3FPOWZwZlFSMEZtbjRRZkFr?=
 =?utf-8?B?MlFkSFZTaWd4QzZTdjROdkpjZWlPY3BmaS9SZmczY2VqUDZXd0d5NXhtbFJq?=
 =?utf-8?B?TTB5VXgrL2hRQmlRaGcxNGZhcXFnSkswUTVzeUxOU2twU2xIOXFzVVpYMkdE?=
 =?utf-8?B?NExNVzdWdGNDUUxGbUhFMk1SRGhVdmFMUTl0Y3QrY0M3aERyMm8rRjZsTnd2?=
 =?utf-8?B?eU1ud3ZhWEhIaEdObnFOQW9uNWxhUlR2NWVsYjVDaHhzTWRjd0hsMzBIWHpV?=
 =?utf-8?B?eTBReS9jeHpES01vL2x4QmNkTnNHZ1RCV3pZTUZIZ2ZxajF6Z2t4akg4Yzgv?=
 =?utf-8?B?b0pMdk9yTG5jNTB4RzJGZktEQklGQmJUY0NqNVZ4dW1ac3U1UElvRU00cFpY?=
 =?utf-8?B?SnFjMjV0Rjd1aHltdXQ1TFlvMWVrMXM0Vm5lUnE3ajg3aThiaGVjVEk3a2Fv?=
 =?utf-8?B?cEFORDFBUDkxTk1rWFdYbDVkaUdRdGJydkFwRk0zeVFKMlFweTJVZjdBbGwx?=
 =?utf-8?B?U3dtM0FHMEUxUWhTeE5TaTlkZlVuMmZUQndXM2RQbm93dnFaZXVKZXNPYkN0?=
 =?utf-8?B?WUR4ZUhJeVl3Q2dnVzhPQ3NicFVNKy9LajVua05YSUNpdnpFbEFaMUhIcUto?=
 =?utf-8?B?ZWxPUEF2dG42THZtbXJwRktHUWxHaDE1WExzTGNlQjJOdnFhU0lMVDF5ZVBF?=
 =?utf-8?B?UFJPZGEzL1owV3J0cWwxS0I4TWduc3hGNTliekRhMXhSdmRvc2lDUC9WM2dK?=
 =?utf-8?B?ZkRZS01HTVFsRXhwQnJoTG05blJ5cDlYWWtrT2t4OGl1NGZnQStMSnNmUTBh?=
 =?utf-8?B?bUI3dzBxM2pOY01veWFSY0I3dUdrZVNsZTRzZ2p3bEVwN2dTRUI2cEkrZzFs?=
 =?utf-8?Q?fynldc8yLQPDXQVs4ooTi7U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda33b16-ed1e-4266-6bea-08d9f2fc8fc5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:34:40.9270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAIn7yTBz4Sx7UTDbep2ITqO8rj9vu/9wPVOi24rEFDQ5ofGZ+dERaqPp0K7VscQjYlXs6FWwa6hRNsFcuaQJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-18 05:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add a variant of drm_mode_copy() that explicitly clears out
> the list head of the destination mode. Helpful to guarantee
> we don't have stack garbage left in there for on-stack modes.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_modes.c | 17 +++++++++++++++++
>  include/drm/drm_modes.h     |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 96b13e36293c..40d4ce4a1da4 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -892,6 +892,23 @@ void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *
>  }
>  EXPORT_SYMBOL(drm_mode_copy);
>  
> +/**
> + * drm_mode_init - initialize the mode from another mode
> + * @dst: mode to overwrite
> + * @src: mode to copy
> + *
> + * Copy an existing mode into another mode, zeroing the
> + * list head of the destination mode. Typically used
> + * to guarantee the list head is not left with stack
> + * garbage in on-stack modes.
> + */
> +void drm_mode_init(struct drm_display_mode *dst, const struct drm_display_mode *src)
> +{
> +	memset(dst, 0, sizeof(*dst));
> +	drm_mode_copy(dst, src);
> +}
> +EXPORT_SYMBOL(drm_mode_init);
> +
>  /**
>   * drm_mode_duplicate - allocate and duplicate an existing mode
>   * @dev: drm_device to allocate the duplicated mode for
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index 29ba4adf0c53..e6e5a588fab1 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -484,6 +484,8 @@ void drm_mode_set_crtcinfo(struct drm_display_mode *p,
>  			   int adjust_flags);
>  void drm_mode_copy(struct drm_display_mode *dst,
>  		   const struct drm_display_mode *src);
> +void drm_mode_init(struct drm_display_mode *dst,
> +		   const struct drm_display_mode *src);
>  struct drm_display_mode *drm_mode_duplicate(struct drm_device *dev,
>  					    const struct drm_display_mode *mode);
>  bool drm_mode_match(const struct drm_display_mode *mode1,

