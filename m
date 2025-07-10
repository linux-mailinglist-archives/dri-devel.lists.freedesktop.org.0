Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE73B00B2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 20:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B15410E948;
	Thu, 10 Jul 2025 18:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkuyeKRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1F10E940;
 Thu, 10 Jul 2025 18:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752171166; x=1783707166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SngjC84J5ft8sfjMRKq5esHdBn8UI1kbb70aWRBA3xA=;
 b=jkuyeKRlSTwQiexBQxaGPLXqJH3uPEQYCgAjDO5cW9cpqmlBa3lwbiYA
 H6op3RtpvYtjESiogV9e/tf/Y7YrJcFzP06xNoP58iH6M+YCfRiQC2fGe
 cyTMiWBCKWCM99aBLfp4CSkKgSsLj++zlUkJfeVvXv/S2Wc/dL/5c8QDb
 GPCa/nJ2NYj5CUZVdQ3hDWFLPIMAxkXaC63Hv95Scf0Uu/zZLQkGwUbby
 in+8J3Y+KW2N3RkqaM+uVFCQz+5DwNM7w7QxUWddgdN67Ie7bJQWpCeYp
 kdbeLovjPsL3pglKVLnKQKcZ0SCOyi5UlbwNS7axD9iokOPleJMIvWhyj Q==;
X-CSE-ConnectionGUID: P/iiXxvnTJOTa/Vi2Pyr3A==
X-CSE-MsgGUID: 3ANjhbA3RFWeBB/uSA5rjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54435519"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54435519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:12:34 -0700
X-CSE-ConnectionGUID: cqm0OolHR0+0zJKoJgNLTg==
X-CSE-MsgGUID: 30bPz+wnRE+UmqSouRGsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156641010"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:12:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:12:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 11:12:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaXXKdSiwY62PWMn8w52s1tpljKG0cSgi56mHjZhNSgxAu6wsf8XxCcWRyoLp82Cqa5sZOgIyUg619LOMpHLLfDLwgzDF4wWPCag7WJV05seKKI3OUI+TFacdrDWdO/2h6wvb4qnGKExOyLRmAyAkxDEFYtzTBPLurlm23/onc3yb0oXIhfS9VoAQrlA/ta8Ai/VWORcFqVYDq87gDir7FKwGFsATULmcjZuSAT005j8hG67tM3xIYRb81yLtSufENPbEEmFJn7wmOXhAyPmgZp4YouGYwatcHXiPGjUdhVYgMkIvolwUHRPl0fLE/dfNjvlkS+eMTWMKZHvzwlW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EZcJQBF0b80jPq4K4g8VxDe6sEo7hRy3AJP4EOYvYg=;
 b=WXfVyfiHtmA7LhvM6jF7ZFZyjI5chESkHRxx7fhFvd7P5Lx6PxsoYA4qbe7OG+Pgo/xh1Ftkzi2GLymYfcUlCq5BW094atFMMCtblFRX+nKQsnDTU+A7THKggAF1FcxHpEnzd0thmA14zP8e21E6w6OQ9ZimlTLMSfLDg2zKAiPc+ZTrPng2CWmNqRRhMJRG92aURJ7wcaYhyy6veLtDRDIx10FjTD+2J8lgxfSzwPWJ89lEGEuGzTxyDp7UDfubrcZhZnpYQnhzdmcNdFHURH5QqSZ65LHZQrNRuKLewhlrmpY86cOIi2RT3QgQ+7LaLrUYSf+b2kzU81YSN1bHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 18:12:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:12:11 +0000
Date: Thu, 10 Jul 2025 11:13:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/ttm: remove ttm_bo_validate_swapout test
Message-ID: <aHAC4l1taA5qaX0E@lstrano-desk.jf.intel.com>
References: <20250710144129.1803-1-christian.koenig@amd.com>
 <20250710144129.1803-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710144129.1803-2-christian.koenig@amd.com>
X-ClientProxiedBy: MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a5f1ef-e81d-4ce5-abeb-08ddbfdd4a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8DJArqAln0AYWgaCEV1+HQDOgB5zvVKyfRwzntQ1hNE4hxl+D101OHmkA7?=
 =?iso-8859-1?Q?U96qceMcH6tHtJW6MFa77VBQFKK21BjsSj/Ex8zw01nMx37U8AeqVpDS2+?=
 =?iso-8859-1?Q?iCOPOWVWfOvlpYMMRKN4olVKDWexZqU5xOIltEH1PI10/b4JcdFepabFzn?=
 =?iso-8859-1?Q?SQ67KQfO3EKsf0/9S83Hvo6zCeTwIr2DB4GgYyHsuC4kHR+f+gffDZqCQ2?=
 =?iso-8859-1?Q?nrG2fzI0GDfiiI35d9ItEU9GuefemUeZJt+EPpYBR6wqfL6vGWjc8U0zqS?=
 =?iso-8859-1?Q?TbkndplYKgFnPGl7pqAsiUDBHgzhR1gp8JUe6QGG26ip6fLO/6R2xH+q5n?=
 =?iso-8859-1?Q?0T79dcD6SttRzDz9J87vszD2aXSVSe8D0s8fLC0jQiryCgJ5b2xC01HtS7?=
 =?iso-8859-1?Q?Qqp1grU92xVASjGGQjUEFl4bPY/sOFlKkrqF4jSlfuJqrgvIbFmmICpPni?=
 =?iso-8859-1?Q?bD/YJ1tQ+7cMKQNNmxSuzYy2dzf2xnsxpG80k9HSF3T9IB9peb4RdjIgY8?=
 =?iso-8859-1?Q?zK8RUR4O17+poi1gfvW7VNRcPPKsDC1GsiJX2u3GvhB+yHbVZQfkAkUyKq?=
 =?iso-8859-1?Q?wzAQcSRrY+PdXCxoedixJ+UQ7mb+RoHwPABDX71XM6K6h4Jpri+OGHd+IG?=
 =?iso-8859-1?Q?WGGsxzsSoOS8Xa1cmu/vfVcBoJVZuKtMdduANAIGRINKb7eNj1H1jQFERP?=
 =?iso-8859-1?Q?xQ+x6U3ZzE9Y2hahWWWwUuLP58DdL6hp9sKYftZpmji+GJO7la/ha87q5P?=
 =?iso-8859-1?Q?YQAt7+HFZC9IeoLQvRRc0pAn8gHHnwfH+4fHYxeK+1jLGw+9IjDq8OOqZ8?=
 =?iso-8859-1?Q?0G3GT80mYe68HbMuCu6nE2mWAdqLoglI0aZL6w2UI3/JXrE2Nh+t9PmwY+?=
 =?iso-8859-1?Q?P3vi1WkILuWKrHqHlZbknqPAI/SYi4Tf+FHAVHuAe34AgVt1PwQS06w8Mz?=
 =?iso-8859-1?Q?28vU8CKuk4nRUWSqXEfEAGXiFi2448EefPRo74+ag1uPatXojqwj01rtj8?=
 =?iso-8859-1?Q?PkjDinOmSTXBLmfR7K/mFdjG6TgzcXqZDvt3/o3HJhBp9p0ehpAmLvp5kd?=
 =?iso-8859-1?Q?pPYWpT88ZdNPbZesnqfUdYhfKSUBy+3L6t3W4r7FzUS+axMmVYu3d/AiVR?=
 =?iso-8859-1?Q?EG2MBhFINiWUIiMPaeZpiVkKYtqPpK8tfrbGDQw0lIetkc7eGFeq23cpbY?=
 =?iso-8859-1?Q?afzgJdpYIDSJapid0sDLbGjH78UhpcFse2NN5k2OFH/XY6ny8FndFfmzpD?=
 =?iso-8859-1?Q?TKLWB+pBDgphrByLnjTdoP+dLJdVGdkvZtzfHTSeSd9hMh7KnP46tMa+Jj?=
 =?iso-8859-1?Q?UT6lO033z+fkW+uxEnLDhqyBCBNP3g1Jk48jLueAQgYvGJCuQzlbqq7veI?=
 =?iso-8859-1?Q?Pp5SjRKUfLUtKd/7zEFcamoNRNL688IVl0N77q3BSVnRRHaqBH1+SMYx9F?=
 =?iso-8859-1?Q?VJJONVeb2cQm2l57NwCrPql9lZTzPRP1CL6sN4eBf3HtHGyZnrzXbgotvC?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CQ4hfZBMVA2t7Fpt7rCf9HEo6HbZyUIeqOPctcrywAhqddbObjbtLlwuWC?=
 =?iso-8859-1?Q?Js/scGXuepVHt5oz2FTb7VuZGOyeM1GPKRdImrz9MWGVvrNd9oNyTTgIto?=
 =?iso-8859-1?Q?04wgLT417WsVhPehcfKnFJh3RS720Cqgp3nPzX/rrrCwI6aaBQIUbDOF7h?=
 =?iso-8859-1?Q?iIUVBLuEjJ3yemhZ+JiYH00kY6sUTSwvpyDYCbOvOd5uDKW7ytgfVPPIDU?=
 =?iso-8859-1?Q?2KXkicf8lKbRbtgSpT/CuWY7AtS15nJ0SNoL1ZUaMxkDIqCvL5cf3L7xMm?=
 =?iso-8859-1?Q?ledziNoPZccgM3PjELvX/OyivM4LHNMOUDFvFRk4p2a0RT8l34/x37TVWx?=
 =?iso-8859-1?Q?LZyoRkf0ym5+31Pil4HA3zesAEDMmeYvxwUR9DDEevgVLeUFpjVhjF4Pec?=
 =?iso-8859-1?Q?Hr47md3TjP+sC6P35TzEdU1G7+76en4aAJjB+yl+0s/bKXGcQ+b9POyLR/?=
 =?iso-8859-1?Q?/PQ5N7j4lfNKM/KPlIMbaAsgUNEAvQArpaNsXlsHiLOJYWLtu1IVi4FGid?=
 =?iso-8859-1?Q?Lu6LiBPsQeyDiRGyRgEe6V6vc4Bs7IFA/ukxY2DkdtRrdx68W/DBD+4oly?=
 =?iso-8859-1?Q?oJXmV5GHxYL+GyQ+JlUDZ0I762CWo38DANvHXatYcnJBz5bkfuki5wScMR?=
 =?iso-8859-1?Q?EhlzwEIaJch9JpWbXYF/o1ZfduB/jBku9vvlmkbWvS3mVRKKjXfraUumfa?=
 =?iso-8859-1?Q?AWDtl06tvxaHYu0HfHfnU6g9H51E1sUo1pmH/7Aps4zEGZcuy7i1wMjy33?=
 =?iso-8859-1?Q?Z2I4/qitvnwDkkAAYo1HjpI4becnbZ7/H6p/kXeNeYL2D0ss3tFlxK+R3D?=
 =?iso-8859-1?Q?uLJ52VPDSQAFCVijbIr42gFxmUW/8pUS82AfgO1xEV7A24nlopBJ93tOCV?=
 =?iso-8859-1?Q?6huKvjliZRIb2kYOKVl+PNTaGXBp9ny23c5fAXaQ4PP1sK8zL80TmRA0Ku?=
 =?iso-8859-1?Q?Jv9lc4tMEv1vU5DUbUlSiE48h74T7U+joVoRNiJGp4k2h42EO92i/04yHa?=
 =?iso-8859-1?Q?cZ0aV5gRHDWIUaqscYmEITjBNVTnPEGcjGHJXMPbI/Smr8gb2dEW1kTwms?=
 =?iso-8859-1?Q?5ggeE0R/j4lQkuS9VLmehpYincZGzXZF0xTyeMpgzv8I+zkfA/4uC18/9N?=
 =?iso-8859-1?Q?G1fZrLoB+DXtwz0r41zZgVscbEP8+QqWFER1/e2oxEsZ2UXDVQa88WY2o4?=
 =?iso-8859-1?Q?spN5rTeaWYhZq+8XWIrPIEFHx6oXsr+FdTqPXuPmeF/9rs6q5KNnCgGQ3j?=
 =?iso-8859-1?Q?AGr4fEkiY5ix9lUlqh1Va/zz/3atJGZSK7kKkx7Rp1IeToBdv1+Jgmp8zn?=
 =?iso-8859-1?Q?SXqWnrVd+ZSG7oy0C6CMxvzOEGF5LEgviIhZiUupso8XhLb2YO/bHPFVxy?=
 =?iso-8859-1?Q?ShiEF9TRgaEKDpq6/UuHw6nJBhfmOH4eazNAmc5fYgm+HFWaquKthvsOZH?=
 =?iso-8859-1?Q?xwdUTRsvKv6QkvCE5Xu9mq7gE++NJRhmdHpmg4AgrBvwOXNCE/NwtCXwYy?=
 =?iso-8859-1?Q?WSwz9s7INHURFlN5U0qOnQFJy966a92BEpaB579GK0XFy1nALkKOg579p9?=
 =?iso-8859-1?Q?1mVi6nZKLWIw32nl8D1F0QlI2yHBOBBFZIo3NLfOHdezKcsqhL4O1rhDIC?=
 =?iso-8859-1?Q?7cyCn3L8PBKL7QaYn5XrDli+ZPq1wgMgAnaOMoYls1IeY12o4DRaeGrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a5f1ef-e81d-4ce5-abeb-08ddbfdd4a2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:12:11.1189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHpYQZlNLYczCjdpfEk17mbGRFkaWY1PFhKuTzT8/ckyAy9qwcXfAJKlHxxl8U1flIPVmdQP+5DJM3iSAQkwSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
X-OriginatorOrg: intel.com
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

On Thu, Jul 10, 2025 at 04:41:29PM +0200, Christian König wrote:
> The test is quite fragile since it tries to allocate halve available system
> memory + 1 page.
> 
> If the system has either not enough memory to make the allocation work
> with other things running in parallel or to much memory so the allocation
> fails as to large/invalid the test won't fail.
> 
> Completely remove the test. We already validate swapout on the device
> level and that test seems to be stable.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

The first patch in series in nowhere to be found in my inbox, but feel
free to add RB to that patch as well.

Matt 

> ---
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 51 -------------------
>  1 file changed, 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 38f476787302..1bcc67977f48 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -758,56 +758,6 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
>  
> -static void ttm_bo_validate_swapout(struct kunit *test)
> -{
> -	unsigned long size_big, size = ALIGN(BO_SIZE, PAGE_SIZE);
> -	enum ttm_bo_type bo_type = ttm_bo_type_device;
> -	struct ttm_buffer_object *bo_small, *bo_big;
> -	struct ttm_test_devices *priv = test->priv;
> -	struct ttm_operation_ctx ctx = { };
> -	struct ttm_placement *placement;
> -	u32 mem_type = TTM_PL_TT;
> -	struct ttm_place *place;
> -	struct sysinfo si;
> -	int err;
> -
> -	si_meminfo(&si);
> -	size_big = ALIGN(((u64)si.totalram * si.mem_unit / 2), PAGE_SIZE);
> -
> -	ttm_mock_manager_init(priv->ttm_dev, mem_type, size_big + size);
> -
> -	place = ttm_place_kunit_init(test, mem_type, 0);
> -	placement = ttm_placement_kunit_init(test, place, 1);
> -
> -	bo_small = kunit_kzalloc(test, sizeof(*bo_small), GFP_KERNEL);
> -	KUNIT_ASSERT_NOT_NULL(test, bo_small);
> -
> -	drm_gem_private_object_init(priv->drm, &bo_small->base, size);
> -
> -	err = ttm_bo_init_reserved(priv->ttm_dev, bo_small, bo_type, placement,
> -				   PAGE_SIZE, &ctx, NULL, NULL,
> -				   &dummy_ttm_bo_destroy);
> -	KUNIT_EXPECT_EQ(test, err, 0);
> -	dma_resv_unlock(bo_small->base.resv);
> -
> -	bo_big = ttm_bo_kunit_init(test, priv, size_big, NULL);
> -
> -	dma_resv_lock(bo_big->base.resv, NULL);
> -	err = ttm_bo_validate(bo_big, placement, &ctx);
> -	dma_resv_unlock(bo_big->base.resv);
> -
> -	KUNIT_EXPECT_EQ(test, err, 0);
> -	KUNIT_EXPECT_NOT_NULL(test, bo_big->resource);
> -	KUNIT_EXPECT_EQ(test, bo_big->resource->mem_type, mem_type);
> -	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
> -	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
> -
> -	ttm_bo_put(bo_big);
> -	ttm_bo_put(bo_small);
> -
> -	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> -}
> -
>  static void ttm_bo_validate_happy_evict(struct kunit *test)
>  {
>  	u32 mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
> @@ -1202,7 +1152,6 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
>  	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
>  	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
>  			 ttm_bo_validate_wait_gen_params),
> -	KUNIT_CASE(ttm_bo_validate_swapout),
>  	KUNIT_CASE(ttm_bo_validate_happy_evict),
>  	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
>  	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
> -- 
> 2.34.1
> 
