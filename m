Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E376E28EC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 19:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F410EE2B;
	Fri, 14 Apr 2023 17:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF2410EE21;
 Fri, 14 Apr 2023 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681491719; x=1713027719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qA+bync1wfTnUX8eA9Y7cw3G9bGhz4MdCAcevjb9iXs=;
 b=bhwKbID/dGik/TN7/2n/wTDMpm9F0miviuE2hOL7pzPRbrq/2E37y8Ge
 gSOwZJAzRdQCJ4i8oY6OYSYo03EFdiE6lx/QnltlZ1WyWyXI4Lcg0PgpK
 SZRWkqUTdOJCitPLyrpTL59m+5M//Jq0kWC4jcGQ/cHKuZZVYRMhCLt0Z
 d0DfbdkMq3Xbsp1zZp2+r+nhvGW5zUHYWXlt+grRRWvj+UQE6AmDsvWkv
 ehRDQ0StOUAOsF80Mu3Y20Ar6hOVZ3Z1z07jH1l62+yI0jjWNeV6F2ckH
 e1Lf87B6WTW4ggU2heM4rZx4+snCOzd+Q40/+mCYKolIzYoyYqCEp4oMW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372379547"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="372379547"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 10:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759161919"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="759161919"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2023 10:01:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 10:01:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 10:01:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 10:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbW5DuCvXlaqpDjEkqU13aeVDty1QDnAUAEZDh7W84qBCNSJrFRODWlcY69EB73TpZdbpNC7DW6DyKZaNf8KCMfFVKVbiBQ6fs1QiMwm9rZtTKZPxtkKwbnWoiT9h/shHmKCGNM22cU+L0y+cDe+8ucBgOybSY5nifmcjGgs22q/W1jbA6WcF/Zq9YR5VHvAmkF67O+cgxAfwkBfwL7jgwTDORXRGsdNLjZssxUX+uAFqoifo4TbMwxsAouYzRw7vyPNa3vuULVCodf4FbL/fghOioxgJbppspAv4wN5fzNc3SBKLRh0LUol6Lc181SlWqXn33H3uflS8onWSEWSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8s9EL4wUjQK7hltK5o/gsWP/ohhz7hS4cRzGnEFkgk=;
 b=S9dSq4NifuVR3UMdz/I+R34HTtIKqBR8CBOcY3RFO8PTpvn2EXSikMd4QVfEq8K43qH/tphlEjR+Rv3t7wKWH4nHXoC8fZq65S60yDmU6ZuNCGbS/N/jU7xmLnP9xBmSh8g9mzP3MNrhzl7ccPV6F0lYuUgPxLmnFh2Z8YYWJ3B0wr6jaQzPzyl0YwmFfY3+RUEq+gYDsVrBKKClAyE3UIl1EhukCLYV5g3p/gKeBY6d7PODBZnYeDdPfz+zXAjlxYPPEYsLkF2sJu9qDwYRrrnUDQ0YPECnZ5mnsZA+tkkiCPDS067aKAjMgf0lGeRft57FuhR4cK0ZZb4LpyfN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 17:01:51 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:01:51 +0000
Message-ID: <289dee9b-9388-316e-c777-7534608bb38e@intel.com>
Date: Fri, 14 Apr 2023 10:01:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/i915/gt: Mask media GuC interrupts
To: Andi Shyti <andi.shyti@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230414162540.1042889-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230414162540.1042889-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4177e30a-60b8-460c-604c-08db3d09f0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQuZpvBjLbRY/1h/iLe7NFuVyyXEu6d6unyIBNmM58DlMWR1DNMxM50Gv2qUxZLkdS3tauLhIG5k7gyjg2qa5KUgpb3PnKZDvLfl+pUOjCyV7tqgBi3gp7jw4o6Ckw9PwSD9ylXdMW0BWXuXzXkayaSNUNtR3bjuw+de2jWIf6RQUYuhjEzEXpf92QwJjqXQWnhw26wWDYZuLEe8PtaSkERSeptsMt1/zeYyG3REV1j2QF/YVuBOpgtaPrdg2qPYkkcafFJ9VdFu+76NffM02QlRmQ7GgAU2n8+Tj3iQBes67UuRy8zXzl12ZlRWoexeU9lXrCdSgsoY9c5tVsRZdPoFPkPT8VJQR1HrxUgovnqlrjJW/p+cw2omO0i6mznihxTO6AwLXhk9ScuxyDRJ4KNbLMxQ9NYDLpRWpqAq1IXJ1iQmKwjVOeH80yrYshnMd7+A5BCCXoSYBZOk/homKG/X9T6rnoDp7KgtiwzBfezd8wti91fnhERLZ7VUBbWwrlrN/6BstpzMg8aTlehw8PzxGBFAMeDLqh6tX0M29OEbVu3gaUVZDtEUXbEpmdUc/Y06jm9907uJqBH5+dzFRD9qQvv9COrTHM/fdijtuVoGOj/fpdAKFLfgjoCiQq1h10Lwle0I9xhDpEkkp/284Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(8676002)(83380400001)(5660300002)(2616005)(36756003)(186003)(8936002)(41300700001)(38100700002)(2906002)(82960400001)(53546011)(26005)(478600001)(31686004)(6506007)(6512007)(31696002)(6486002)(54906003)(86362001)(316002)(6666004)(66946007)(66476007)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU5SRlg4cVRJaUZkd3JrZDhBcEF1UjJOZXMvY3hySys0S1g3cXp1YzExVC9t?=
 =?utf-8?B?TjluQzFMcUlSQ0NMYjVUNnRnbVQ4S21TdEZBOHhlTGJuWjhGUFVRUUJoZHJC?=
 =?utf-8?B?NktLU09zRGZxbzJieEtyYjRkU0lucGJTV0lMM2pqNmY5dnY1eEhqN05Sb0hD?=
 =?utf-8?B?bEl3RE1Dd29NR2MyWDd1OGpua1RrQ2lWRS83TExtYjlMWVA2ZlJoNTB0MGJ6?=
 =?utf-8?B?NFdhQUFNSGhlZGNoUUxKRE5IUFkrbzBLdFVtNzV2R2o0a1hQajVkWEszN3cz?=
 =?utf-8?B?bDVwM1NITTRoZndoZzgzbVRpMk00T2s4Y3FwZkdnekFpV1RVVDlQcjhyNVU0?=
 =?utf-8?B?TEUvazl1a2lXMTBHRllyc0VPMVdDTHc0K1lYSWxQa284cGdJUE5YRDNqU1pR?=
 =?utf-8?B?czBoQXIzRUU0Z09qNlc2NWZqS05rNnl0eFRacGprbGlMZ3F2VWo0RHQ2Sm12?=
 =?utf-8?B?Mi82NmtDN0syMHRwTXloTGZkZXpITWpWdXR3Y3d5MFl6MG1RM2pabnZuajBV?=
 =?utf-8?B?NVFCejRFaGJKRXVMNjQ5Ukw4TVE1dDh2c3VHaGF5MDhtT01idDdhNkpmZm5F?=
 =?utf-8?B?NFc5c1pNTXRnUFBJWm1USnFiaFoydW9qelNySGdqaUxtQmxnUzJyaEkvZUR1?=
 =?utf-8?B?OWpGREdpakJ1NDNwY1E1SjhuS3owRzloOEFxdUJTWFRmbkdyU0ovdXUzVWJl?=
 =?utf-8?B?d1p5Rnh6SzcrRkRLWVBTZGNERmdyWHk4N0xmaHV0VW5HejhyK24wT3hKeTF5?=
 =?utf-8?B?a2JXU2JodE04dnlIZDlZSXdHRHM4WjFrb3JOdlNHYVZON0JPWTR3U0VnVDB6?=
 =?utf-8?B?MUs5Y1ZXRlJna1huc25jY1RTbFYwODBtZHhTYTFDcmc5MXFWUU9MNzQxNldw?=
 =?utf-8?B?c1hxZEZqZFV4Y1YvREpkQzAyVFJiTVJvOTExQktJc2RzUXlYMHNGRVdueUxI?=
 =?utf-8?B?dU9zQVh5RGRuR3FwaUFGall3OFZvOGxlT2tNUnlqY0hQMmhQbGI5YjI2SzV4?=
 =?utf-8?B?MXVnVG1UdTRCSStmdi9oY1VSYllqaUd6NkRXKzYzZzVPU1B1N2haRElXVVAr?=
 =?utf-8?B?cWhiREF3YmIrSlN0Mjg2OUl1VzRYbmpzM1lXdUxkMGsvUjZ1SktlMzkvQjFu?=
 =?utf-8?B?SDlaNzhJR055RUQ1OXRsVGxFVktmQlJHQU85T2hhTFdoVWFoYkJoWTJsYk9C?=
 =?utf-8?B?WTY2SWgyLzlIUG1BMWI4NThpRXVLMndqTVlKb01IaFVaOExlSzV6TDR1VFlz?=
 =?utf-8?B?R1hXVzlROE1KTDFOQjFTQ3hpQWl4UXdBaUYrK1MxOVR0YlFrL2YzUWt1SXUz?=
 =?utf-8?B?REZjcUR1L0JRYU1pVFAwTWN5LzdQM2JRdkpwVWtMMnoyeFovYmpLS0RMM2pY?=
 =?utf-8?B?UHVtN0UrK0ZKbGR2Yml5UURDR0lYajFaanVGQjVnU2J4a1VrZDhTTm4vaE92?=
 =?utf-8?B?VisybEg5enkyOUlNQkw2T2hxcFE0cVl2L0N4RDFlRzZVYldBM0I5UmExajky?=
 =?utf-8?B?cUNOVExRUVNDazY2WGJBNUFXSWsrWk55R0N4c0tpZGFlb1VWMHBMZlozbFpt?=
 =?utf-8?B?dEhlQnFoWVphVEwySlRCNjZNeXdoVmQ1c0xCVitBRVRQZENRVnloT3JyWFFP?=
 =?utf-8?B?N2k4VExmUUZzcGdWNVQ5T242OVdtV0s5S3VOTVkwVVk0WXVxcmRieEdrQkY4?=
 =?utf-8?B?WEUwWitxdHU3YTFPbXZmQit2cGhQcDZKWnhIcDhpT3JtdHZCVFZZdi9hNTZw?=
 =?utf-8?B?WEkyajV4bnpmOVZ4VkpabWhlUHlLc2tUSXAwQnJjVk92UnF3T1NKOTBkbHZH?=
 =?utf-8?B?VXM2Z2VPNi9rbG5nenVTa3VLMTh4eTJvdjJzSGJkQTZuQzVtWkhNTUx5ai9Z?=
 =?utf-8?B?Kzliay8wUkFQRzVqVkp6VGdtZ2FYbW9sQ2RMMmxlZklpYWIySHBZK1U5eGVL?=
 =?utf-8?B?bGpzVmxYUDBiNTR6UnRwV1JiWHRIOVNQUVVLUnlxT0dkTVhDaUo3U2ZZdHVv?=
 =?utf-8?B?RDlRYmREMUlRUXdtdlFremt5QWUrbEdVSk9NWUUzeWpmSkErNmVacllhQ25a?=
 =?utf-8?B?eU0yUzdsWFNNWXErRFQ1T0plNk8wdjhOU3lpdSswYitCa1RMbGhZNCt5MWhw?=
 =?utf-8?B?cDltQmN0bW1YelpwMmhUWHl6N1gxdzFTR2Q3NWF3ZStrNjNER3FxdE1Jemdr?=
 =?utf-8?Q?sH8lRhItRQapSHifE3VETbk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4177e30a-60b8-460c-604c-08db3d09f0e0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:01:51.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuklnUrP+c1TNvMhl4EkD7EGy0M+OoMh51Qwzo577RxvHYGooAY/QUzITjFRE8kDDv7iDIZyojK0fdt6Q549PUjzrdPLjXz8WxauRHw2muQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2023 9:25 AM, Andi Shyti wrote:
> MTL features a dedicated media engine that operates on its
> independent GT, requiring activation of its specific interrupt
> set.
>
> Enable the necessary interrupts in a single action when the media
> engine is present, bypassing the need to iterate through all the
> GTs.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Hi,
>
> I'm starting with v0 as this patch is very different from the
> ones proposed recently.
>
> After all the discussions on this patch, I took Matt's suggestion
> since it seemed the most immediate.
>
> However, in the long run, I agree that we should have a
> specific mtl_ function for enabling interrupts.
>
> Thank you Matt and Daniele for your input.
>
> If this patch hasn't missed anything, is it too optimistic to
> expect MTL to boot? :-)

The GSC engine also has interrupts tied to the media GT and those are 
conditional, so that engine won't work with just this patch. The system 
might boot because the GSC engine gets disabled if the FW is not there, 
but IMO if we want a single function to handle both GTs we need to do it 
proper support for the engines and not hack around just the GuC.

Daniele

>
> Andi
>
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 1b25a60391522..162a27b4c4095 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -254,7 +254,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   {
>   	struct intel_uncore *uncore = gt->uncore;
>   	u32 irqs = GT_RENDER_USER_INTERRUPT;
> -	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>   	u32 gsc_mask = 0;
>   	u32 dmask;
>   	u32 smask;
> @@ -309,17 +308,20 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	if (gsc_mask)
>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>   
> -	if (guc_mask) {
> +	if (intel_uc_wants_guc(&gt->uc)) {
> +		u32 guc_mask = GUC_INTR_GUC2HOST;
>   		/* the enable bit is common for both GTs but the masks are separate */
> -		u32 mask = gt->type == GT_MEDIA ?
> -			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
> -			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> +		u32 mask = REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> +
> +		/* Mask the GuC interrupts of media engine if present */
> +		if (MEDIA_VER(gt->i915) >= 13)
> +			mask |= REG_FIELD_PREP(ENGINE0_MASK, guc_mask);
>   
>   		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
>   				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
>   
>   		/* we might not be the first GT to write this reg */
> -		intel_uncore_rmw(uncore, MTL_GUC_MGUC_INTR_MASK, mask, 0);
> +		intel_uncore_write(uncore, MTL_GUC_MGUC_INTR_MASK, mask);
>   	}
>   
>   	/*

