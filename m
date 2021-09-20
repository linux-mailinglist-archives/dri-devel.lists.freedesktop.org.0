Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E841291F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF466E898;
	Mon, 20 Sep 2021 22:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB40F89CAF;
 Mon, 20 Sep 2021 22:57:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="220055685"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="220055685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 15:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="612720822"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 15:57:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 15:57:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 15:57:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 15:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGlulipk8AW8mx5/j1JBkVUhVEwV8ndlORN8Ijr4Dj51n4WCHyCxcmB8vb7F6hcGGY2DnGSrxw0UDfL/tJlXZE5htlBalGXR5BtYc1kUtaiY3XaXYNc1hUonf8uvPeCKAUpTyFt0Td4pDYKHgImg9isvqehI77tLWl3dqz/Yk4OGPwlWEgDs4ILYtRyJr9dtuZlOpsnnN/6h1KmrMZrthIHK8Ebts9ERzcoB+KJvBtfL/6AUpGauzbddQ0IoYgJHA/81U2Q3z6a1PiDHTbb3O9dliT7tzfKtF1PmOw2svcZu/UW0te7DONIO6Fbfl9tcI2d89lf3UDbEcTnMB9EtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=m9YTAT+wrnVapPMrP5PVqo1fSOYlR54gQldC7yLFCv4=;
 b=ag9AXn8MhoUT9nyAlaCdS1CIfatekq3NRSX1YeD4cc7Bfg4DPfxynDCrWyuZEO5iRFKUJwOKcVgsF3mDKTk/RgmjMBdOPHJtseh4jiy5jKNS9UNxdi1ihSb6ton7Nh5d6rJxqkVwhy8eY/jvX3lSeNdvfZzDptUCw2i6rqeTa6w96EYyrM5d6WF2W1rbe3STylMlVeqd1PYCojX//ajD3D015sXjKPxjygavzGFDpk//NS3GDiuELX6qv9dWol89iofSvMMFSDPnu275OB5AB6O/mHwBaYNE5xFeP4uatEVV4jvTzBqOD95n9U5nROVLSDET97vGuHk+B0gZ0XNx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9YTAT+wrnVapPMrP5PVqo1fSOYlR54gQldC7yLFCv4=;
 b=KWBcMsPKdE2+DePt9QWoqe2SP7ntnm7XLFKZjA2BrBhRrLL5+aPNBptsv6q+3IVPrOTnXN3JGlYo+sC7PxQHdPZteufESn9JgQoUsMDUqg+AjFfVhtHK5lPOUCJlSL93zEDSrFf4w8eGCsFprRXEUKm2pyyszJLf6hOxOwT/mpk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 22:57:09 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 22:57:09 +0000
Subject: Re: [Intel-gfx] [PATCH 19/27] drm/i915: Fix bug in user proto-context
 creation that leaked contexts
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-20-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <008b1b3f-9aa8-fe64-a967-091f7170ded1@intel.com>
Date: Mon, 20 Sep 2021 15:57:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:303:83::11) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0096.namprd04.prod.outlook.com (2603:10b6:303:83::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 22:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19c587b4-fb3b-438e-6562-08d97c89f9e7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5641:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56415F2C8735D46DFEAEB182BDA09@PH0PR11MB5641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDFjFxe3/ZoM7UVm/F5v0r4OLg1dvpCQVzS2LEr5TU1IqDha9i+p4ebvah7ETqyoTvX7J0f6fgAzDP7/SadWa/gGeZcixdWJC4ebxPjHp6gJnSka85o7nDaeyXh7UJigCbAd+70EtW2O4JUU3xLuYr8FMebvZtDyz6tnz1gZeWb0aW//7ynEvQuzCJyI4g/xcv9hmdK9nnkdLck/dDgzYi9ZKLUKV0RXYuc4xqU2luyk/bzhIcEoVlUCtrwPH1vg4x3CgTtviCLENr6yrWHAqAqL8fJeBoyA4TmdXAn5XIHzrpj4iBp9ynG7UCnB7hDX6fEscFHhZBCVB1RtIxwj3fN19PPF/B5NylkIe1G4Q18F53TakZrKWqbbZfxZftC74pHPfsI0qCQL8NkJjo9igNWEhe1crxAt9o4FPJ/TatY82MUrYFDORUrgvQjesJ29mUUA1YTM4q8XFe0J1Ug76Sj01eYntBYBCG/BgCxXHQy45idAcKB6vJTfGrymssNa3dKKXV9m9vWQPHFDyM3GzShfuT8forL5564XftKBdzHEGfmj7SFZFlpocklpj51smfjjZLBqmUhe/ODDMIkyDhC+BdG8T4aJ6L/pCj+aG2EUm70eMSwKvZWIIqSRYcZx6I88geRJb+Zu5a/r79FSST0VCpDEWX8O1ZcxsoIdm/vM59IxFNXfx0VA8WNTGvL3SGouUTXimfA2xQ7OC5IIwTojLpIaLpBdCEqKgrWlUgwudh0IGDzGQm0+aUXjBSpX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(316002)(66556008)(2616005)(956004)(31686004)(4326008)(186003)(8676002)(66476007)(86362001)(107886003)(6486002)(26005)(83380400001)(8936002)(38100700002)(5660300002)(53546011)(66946007)(31696002)(16576012)(508600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjdsUTkvMkpDcGR0Y0ZYZXFvaXAzb3VBS1l6cVh2YU9sNmp4bHpRbUcyd21p?=
 =?utf-8?B?ajhObjZQRzh0NU5mVWswcndtUFQ5bXVYOE0xWC9iM1BJVWhHWnhEVGFUcXRJ?=
 =?utf-8?B?NTF3cFVxM0NlWG1IcS9jTDVxU2VibXVCeEU0VmRuL0RzTGgwdjFOeXlzbkhj?=
 =?utf-8?B?WUxwaVB2cGx5dERHRURDSTRDV21ORVh5RjBRb01FSytHUDVpVXFaQVVyVlZF?=
 =?utf-8?B?VWlXQnBTTTQzN0NxeDhhZzZCWERDVTJyV3lKQVlrajBNbUdkaHVaazRUaXJ6?=
 =?utf-8?B?VkdwNVZPMlR1OUk2bitFQmFEb1VXclFOQVY1dTUxL0JjdGVHVVlhUzFmZ3Nm?=
 =?utf-8?B?d3lYWnJ5UlFqdDVzeWNMWXl4Y0E4RU1kK3BhUFlkTkt3QXJ5ZEJyQjQwL2VP?=
 =?utf-8?B?bEV0cHIzbGRoWnp2dDM1Y0FPbEVWQjZTam1YN2tST1QyR2g4MjJMbGU1MXg4?=
 =?utf-8?B?VCtXdDU0bzlYMkpqdTJQaitSN05aNDRiUVV0d2QwSFVwMEU4YVhpS1QwNCs2?=
 =?utf-8?B?QkpUak5obVc4WDdZSjAwTWFRQW13Y09mY0dvR2dRZzVKMkl3a2hHWjUxakNT?=
 =?utf-8?B?dnRYMzdLTzVjU1ZZOTV6cFlmRWEyTEp0ZTUwK3dGb1NqOW1HS2FQb2dTUVJX?=
 =?utf-8?B?L2NUU2ZiRXhhV2RzN1lSbkNpVWgwOFdHRWJCUGxlK25qbFp4N2IvbzVESjhI?=
 =?utf-8?B?R1dFYnJJczlOajloa1pTbzhVaGd4TEpUTEVDOVR3bjZNNHp3b1ZlRVM5a1Zh?=
 =?utf-8?B?eEJRYnBqQ1NIc2MwWmJuclZDaDdLcm5WamNCWnRUbGFCRVBRTWhGbnhiWUNO?=
 =?utf-8?B?cjlQbGM1Yjc1RTd4bWZIUUMyNUVreTBYVHBxVG5lN1hIZmliSXJtckdkM29r?=
 =?utf-8?B?cEZIYjRldVRKTGF2WkIxSUxnYU5tMHlCaDZ5M1pTczd5RE1lZkhiK3VSb0ZN?=
 =?utf-8?B?emtBYjZxbDJQR1FLRnBhM2wzaEw0d1VONWJhOEFnT2JwY3ZWUHV2YmE5Yi9S?=
 =?utf-8?B?WUQrdDNJSm1jNmpDVDhTcWhMbmsrZGxHVjJVTFF4OXVzbitJMGp4bXIvSkps?=
 =?utf-8?B?QVNGYWRuN1JhNXFPZkpjWDVvZDlDZHV1bXV1Nmo3OW9KTmFWRjZrV3Q2dlda?=
 =?utf-8?B?eURMM1Znb1hzQ1E5TnZpeXlEMDhCWkxvS0h2Z1c5bHY2aEgzNTVZZDRWTGJR?=
 =?utf-8?B?a0RxSXZkQnpIbUtqK090aFRrUzJWOFRBSHFVWnB3RkIxbERDWEE5V0t6Yjll?=
 =?utf-8?B?WXpmcVRqcGFEUmExaFdwWTIxcTZNSDBqQ1ROVlMyOFVTWkhKRkVnUmNKTzRi?=
 =?utf-8?B?b0lKNzgrQUl3NUVLeThyUmROaUxONFFZbWpaUGdocGJQdjI2d2tENVFjSU85?=
 =?utf-8?B?QkVrQytWTzhtcW5BV2hSc2xTODM0ckI4ZmxpekFzVEMvNjIzSERyaitUWnpv?=
 =?utf-8?B?MGVQenJOUXg5UWFCdEJtZVRmalNHUVpROTFLbDdubzUyak1hcFAwSjJFWGMz?=
 =?utf-8?B?bStUOVEyWldWbW9lOTBDUUZ1eXVCTTRWMGhJZW9KcEFWS0hBa3hnd2pySDVJ?=
 =?utf-8?B?bHQrTW9Kc25NOFB3SVZHalVYdVlYZGlrZjRCRVI0Y0l3Tm03MzVpY201UWY1?=
 =?utf-8?B?NWxmcnM1Q0RveW51Rld1a3Vvb0xiQ3Zmdlg5TDB0QytKcjYyNnVINDlCV3Zt?=
 =?utf-8?B?eTdzczh4L21Tek1Pa01GeXB1cDd4N0tQZzVWaU9ZazlwYnRtK2Ntd0pyWkRD?=
 =?utf-8?Q?pe4igK6rOBxXYizGkasC5wnFPDfVDeWWDCwjPuv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c587b4-fb3b-438e-6562-08d97c89f9e7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 22:57:09.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFdJrBTsd4Ug8asnfqp+RcbzRK2FDpHt9ww+g95JmuR5R8DsoSLxeGWokFLNsAFGFZVkIr4JoZj0dBp296mLjaBlTK+eBqSYPNYnoB6wjks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Set number of engines before attempting to create contexts so the
> function free_engines can clean up properly.
>
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dbaeb924a437..bcaaf514876b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -944,6 +944,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   	unsigned int n;
>   
>   	e = alloc_engines(num_engines);
This can return null when out of memory. There needs to be an early exit 
check before dereferencing a null pointer. Not sure if that is a worse 
bug or not than leaking memory! Either way, it would be good to fix that 
too.

John.

> +	e->num_engines = num_engines;
>   	for (n = 0; n < num_engines; n++) {
>   		struct intel_context *ce;
>   		int ret;
> @@ -977,7 +978,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			goto free_engines;
>   		}
>   	}
> -	e->num_engines = num_engines;
>   
>   	return e;
>   

