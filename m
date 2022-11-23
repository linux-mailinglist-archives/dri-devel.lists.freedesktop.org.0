Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84864636D7C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85710E650;
	Wed, 23 Nov 2022 22:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1610E64E;
 Wed, 23 Nov 2022 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669243585; x=1700779585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QofoWI49RmvTSvNFJbUmSBA119F8P1nX7A0o9kDukvc=;
 b=O+7qizGztO+If+IWQSvKJd+5cyngg/4shgbocDp7YnHMOFukXhvA4O8A
 OHdomwogrOCVCGPwygM2ZElBvd+68bhe28owxpH9Ci//rRiPdytMl6/xd
 B4+DFiwgTfzGPw1OfdwVgXSwfcKAfcUPgGfW2LdVBuL92rRZidLd9oWxr
 m/uB2PDdF+euzG5CX2H0bQf6kqk4hSrGoGLoAPN7vYCNi0i8ArO+0q12Y
 eC5pzf2eJZ0bcsMowHv+GdNTjZIV0V05VEfY7OdxyaKGSvYY5v4XoiB9p
 pzN7mxte4+9BIhIscTn5U8gk/gljepQhtJpAZs4vc7vBVvU3owY8bGKmr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="293876932"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="293876932"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 14:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="747974066"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="747974066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2022 14:46:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 14:46:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 14:46:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 14:46:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2sMkMGl7w4EA4kyy1ReDe7kS7j2SOKyQlxP4zJGAWMBcjAI24PZHKvX1MrIXaXG3nzTy02HQ4VbU+WRelcrR8FnSFplvuiKpndUVYAqviUAaTN+5Ud4gDltwEh+5EgMW+PSLc5VUO9hYjOT1LGoUVWLDFuHtIlRHgx4m6EHIt3ZMilnUtqsKE5MEoiL1nlnx9bfcb7xEej/AUzCE3N8maBXUOL/YMtUZ0LcYcoRtbnXlrbkxi1yVCpHrFu812vIrZen7f6aQ9hmLlErN1hNJ+9WcG++3bPj5fx8sxEORoATCJUMgiDlDBiOz5h8aHZNawPMAcdDF3GEwt96kqM5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX0ndHhVhbnbmuf3h+vXakBcxCs5jzHmrx9Px+4wqfc=;
 b=dQrsFBxPh4H04YhDKupSu+GmWlEA4ye/tvMzsnI//GT9JJxGvLAUsxOGb7A4dqZHIEaOL/5pWld0cBV2Db2tyq8lQPfLiK2KGrcwgmo7dmreH+Y/SdSVlv71vXbIzj7uT/rioaEm6HrMuViJAffy8LtyYMXW2uiDxGgWT7Q9qoggo71uFBy78GP17pCUqqeOAoxsHPz16MclWfbrQQGYaF9Z0L0FhhLuSMleXgJwxJ6HE7Yw0yqNFnWks4rDNk6RoI0mwlBJi0zSEzV6sikKR1arRCXiweINBh4ifmnNZHEwvKMyrOJv++lZT9DxmPHCAxWdRqxmhxDie27SXbHAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 22:46:21 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 22:46:21 +0000
Message-ID: <10d158a9-33b6-f9b1-1661-04da961ed8cd@intel.com>
Date: Wed, 23 Nov 2022 14:46:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Manage uncore->lock while
 waiting on MCR register
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221117173358.1980230-1-matthew.d.roper@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221117173358.1980230-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b5080c-1623-43b9-0830-08dacda48ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbdl5wpjw4uvZv1FDEws2MUWImqB3lvUSdARyGRqOWUCrPvfaTof9Po0IgZLhjB8To8r8yyBXT9ETCYdE0LMkXySWY4vCPtHtWwS843xErT+jhsDNFTNBVuvcfDWSb3N/imJzdVpPFbjIuB+M5O9Cbp7a29vb+fNOfJhd6YMBrINdoWjODc0VM5nXSeKqRnS/f8TTKMjbR7stjLedFDgBKtNYuvLkCpj2w5RP8WxrT1ez9uqYYyTXWDoKMhlvB4ZgaIfioitPDMq9G+FrdcfiYmvRMVmOXmTLsDWMnHmcN4FCac+JCUVyfE0CmaKF5xYMSyeOT7b31j9sxyQ1L31Cb7IUy/+TvOP1SEKXygI3cgtCiFjH52eWID7am6kFu6gwH2xRPGwt4yIS0Zvdhr8jNm8QryAgUaR3Ls1ssjYZQ5ty2yR2U7Km9L6AHwoQoSxfQuKOBel4tyZCpsA0h1p8DDCZwPKYc3qUf9TxNzvhH5po2K+8T13D7tmdV8Ra9NoJHhqHdxImfWzmQY7Vxqtekw8aGC72wwBCTdEewHSJmfM+jr7H16/40bJNat+yNuqIVBUQlMTYZiW5X7i1CW8QZvjvxSQIzsdHvLCe8IcIwNBZZYALBIkFSbnYZbpJLWr/hQ+BfFJjZ83puvHI8+jIinDcF3HGNZ4qdUI79/OWxNlqfKR5e9VPbePC8TTLZ/jIWRXWQwzgm3xZOevmE4wJQvCXhCNfU9Bzs9+/v1Ichk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(5660300002)(36756003)(186003)(6506007)(83380400001)(2616005)(82960400001)(4326008)(8676002)(316002)(66476007)(450100002)(66946007)(66556008)(53546011)(8936002)(26005)(38100700002)(2906002)(86362001)(6512007)(31696002)(6666004)(41300700001)(31686004)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnphWGlFSU5wdXNpSDNNMjRsVzhFODd2UlB0TGsyVk1nRU40dnMvV0FTRDN5?=
 =?utf-8?B?SFhZQTFqRFNuSTMwQjMyM0dNT0JMOG1adGhjWGFzODRUQ3ZDeGkzNGdveDJ2?=
 =?utf-8?B?NVF2L0NyLysrZ3lLdWxiWkE5dkFxSTBuTTZWM0gwa3g0ZGZlenRaRWp4b1Vq?=
 =?utf-8?B?aFByeDJ5MkphODYvR0VSUVg3NzVhL2lzSXdzYmRBOHBQWDQ2OEtLbVc3Q2kx?=
 =?utf-8?B?YUpaNmtCTVd2Q0NSbUNYMFQyc3Z0Mm40a1lSVkNqN3hOYVROd2xSdDYvTXFl?=
 =?utf-8?B?SHFnRmxIaWNPWDMzT2gxa2h5YUZCaVhLYkNERVZ6RVoxMDhSbHROV012b0pl?=
 =?utf-8?B?RGpTakNacmJLNFRXZlJOSktqVHg5NDFrTnZsZ1JqeU44T2F5ZHdZeDZzUCt4?=
 =?utf-8?B?VG5ybk1uRVhTajJqL2dIc29vNmZRZEdmZzN0alJ2SUVOQkJNN1YxOFdlM3RC?=
 =?utf-8?B?d2Rydi91aXFVdWR2Z2RGNjIyYlFnUndvRTNlWEFXQ3lKdmdQeW9uTi9nbitK?=
 =?utf-8?B?ZG16MDNVT09iU3ZHWVgwbzc0RlBqOWs2NVpuTXIvM200SEdvTFZjVzNpRlZl?=
 =?utf-8?B?cFdLY0FiNGxKc1dDRXJUeDNVUnppclQ4ZGRvSWRXWlRmVVRBRXNUOWtUU2ZI?=
 =?utf-8?B?ZVBpeEkxeFpIZ2J6NmtqYnlhQnpQRTk4ZlprdUpJTmMvTVhyNmYxWFNIWDVV?=
 =?utf-8?B?d0pDcE9hd1FHRU9Jd09Eemw1WjQ5emlQUHgyV213MVVwL2loYkxNTnVCUkl5?=
 =?utf-8?B?QStWTzJsSkRrMU8zRDFqUFdtQ2xxOVYzV2lQL1A0YlUzOW9EcTF5UVl2amxC?=
 =?utf-8?B?WGdTQ2FoVnJiTjRSU0NrMnNXOEdPZUczSTFaY3J5bGVVb0FXenlaMmRNU3V6?=
 =?utf-8?B?dFczNHBadDU5SWNienk2bFlUd3hrUEpZWGNFYkc1ZGpIekk0L056a0RkNW1q?=
 =?utf-8?B?ZEtUTlkwTVVsYzZvV280NXUzV1FoK1gxRThtSzNnU2V4MXlZR3BVaVJKN0Ex?=
 =?utf-8?B?Yjd3ZGRvendrZ3hXSzlBZzNFQUxkc1JobVFpUXZHZnEzbUJmaHQwM21oaGZG?=
 =?utf-8?B?MnZJR3F3Q0FTZi82d2pMOXFaVkc4blRIUW9qbEJxWFNOZW5WOGxIdEEwemEx?=
 =?utf-8?B?WmI3RDdNbURoTno3N1pGVHU3Njk4TjdaZjVSaUNlSlc3Qll2UXY2TU1rdVFU?=
 =?utf-8?B?OWtlczZ1Q1VLRmdXemlpOHJnS0RrY0VicURhWURMSExvQ3U5ZC9Kc29UWlpP?=
 =?utf-8?B?cUFRVlpRaHh5QzNBRll5NVJOMmlsUW5wMlIrQlp2MHdyendPNHQyN0RpZFNw?=
 =?utf-8?B?djRxM2lQbG15RmRQdjZJSW5qVE5SMS9BY0J6UXJCYzVBS1I1SVFyRDhQeitS?=
 =?utf-8?B?REJJQTd6RkRKeWl5eTg4R2xSMzRLSjZLNHc2Y1c3MlRFNTZ3UDRmRXRaQjRw?=
 =?utf-8?B?djJ5V2ppYlZUWldYTkw4ZDBQT0hrVzk4NEI5ZlArd0RBR2JCUEkxNHNXQUJU?=
 =?utf-8?B?MzIyRERQUUUwOGJBekZQbGhsWUhrRWFnd3pOYWMvTmw2WlJVNHYwUTkvQ2F0?=
 =?utf-8?B?OURtUzJyZWN5aHJ3c0g5VVM1bm0zTzBRQWR5Rkdwb2t2d1QvUmRPeFZpNkRl?=
 =?utf-8?B?SUlxNFZrUTVITC95a0tvOXNoaFh4SFcwMmNNckZPTDR5SWxkem5vQUpFajRy?=
 =?utf-8?B?OEpXbkJEUlE4UDN1ZjhxOEdZUTVveWpPaFlPQ0JwV040dEVSTkVPdlZaalhB?=
 =?utf-8?B?R3k0d01qZWw0N1V0Rm8zQUxIc1Y2L1RRTU96M3M1U1FoMTd3RkFBTE96ZmlX?=
 =?utf-8?B?dCtodWtad2ttaUhJeWpXRU1jQThPS2RYRUxpb1lBMXJUK1h0UDFQR2ZDZlc3?=
 =?utf-8?B?ODYvZUw3VGFJZExqdW5UbmZSSEthd1Qwd2RXcERJWlBHNlY4NU04T1I3YkZn?=
 =?utf-8?B?OXArZzNEbmtTVFhLUWJwRWhBWE95b1BuTzRRdlZybG1QdS9TbUltaTFqY3E2?=
 =?utf-8?B?eTB2NnVlTHJPd0dEWGFxT1cwdVZWYVZqYWlsWVUzK1BRL1BLalR2UHluMVQ0?=
 =?utf-8?B?QmExTkI4bmtHOWt3MFF2MDB4VGVvN2JyT0o2YnZTNnZkZmMzaXR4eU9OVzh0?=
 =?utf-8?B?c01MaUkyUStWQ0RyNHpvTGRubGlHTk5ERk5jbVQxcy9iMTBVMFVQc0FGaVVj?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b5080c-1623-43b9-0830-08dacda48ae3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 22:46:21.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEuNo6zPX2C7zfQRUpr4TR9dKSBaVWAwvj/J1ScNntMs2ByH31nOvR8EhzuDdl2UC9AJd6x8I/bz+hpM+MRbMEsYTBh1AMDySqikTxtwGXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/17/2022 09:33, Matt Roper wrote:
> ...
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 830edffe88cc..d9a8ff9e5e57 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -730,17 +730,19 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>    *
>    * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
>    */
> -int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
> -				 i915_mcr_reg_t reg,
> -				 u32 mask,
> -				 u32 value,
> -				 unsigned int fast_timeout_us,
> -				 unsigned int slow_timeout_ms)
> +int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
This change missed the comment above and so is causing errors from the 
documentation build:

Error: make htmldocs had i915 warnings
./drivers/gpu/drm/i915/gt/intel_gt_mcr.c:739: warning: expecting prototype for intel_gt_mcr_wait_for_reg_fw(). Prototype was for intel_gt_mcr_wait_for_reg() instead
./drivers/gpu/drm/i915/gt/intel_gt_mcr.c:739: warning: expecting prototype for intel_gt_mcr_wait_for_reg_fw(). Prototype was for intel_gt_mcr_wait_for_reg() instead

John.


