Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20221466D5A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73256FD48;
	Thu,  2 Dec 2021 22:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524DF6FD4A;
 Thu,  2 Dec 2021 22:57:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="323113918"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="323113918"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 14:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="561386836"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2021 14:57:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 14:57:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 14:57:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 14:57:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp2CkJ8B/5ASjCYUMlLtl7b5x0gQN+FEF0LpxVfj6Wq1ZDxJ50xm/yTUyBd0Gsq04dsGUvrxpsrMln+VH85etVASv9AKJRE7+4FHZPhwa5RceSpbK6+RH2KWlDwYVVHZrq6X1HovHtOd3IzHIimmuCc+feKjWdCB0Q0Y+t8yFZfnDiiSgW4BHqPVEBFc6VWQ9qKkT1K6d2x1VyVOSMFL9vBC7b4GC1hioODf5EFfEIkk3O6LQ93NrMkYsJPAd7CX7Mhd5gAWiJFPPPIR7IafvGWFmtspTgyF8A8nypqh4YpRYM83EB47QSHsfqzqyweQ2jey+pJnYJ/QinopVh1KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyzfoh4Xk2J4mNAL8nMl31XB+9+1IIfKHzjS99bc0VE=;
 b=ITfGeg7GSVq+fXP+EzXKPHZp5KsOIFYML95+PGWLMBmzboorg19fnpSe+jUAGlWdljymSnJJF/aP7R0XrShpCzxJpPP13ufoY2wudBW0HgH6smVCkNruxJi1qNB4stPP1+2nqFiADI1q4rFYMvjDmxPPbOc59V8nnImLUK3bJYkJaG0efbZ2eQZTBuwQ3ElAgpLrJwtatkE9K3tx5Inen8L8b5PHWZNR13BP0eZdbK5qHY6eeADVgWlGiRCpIDa93bU4OrlL9Ajtsyien4Rwzd7fadeVnEtMX2mrLNrCobPNuWHE/lIcuGhN16gyiLRS4/Yc65HRGpGPJhP77m1UQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyzfoh4Xk2J4mNAL8nMl31XB+9+1IIfKHzjS99bc0VE=;
 b=fCgbD99lS7JSrGAC1n6v1gMPBKInD3uWrMV8dFZfTwqgXOIZ/D99teyFNwewPIW5zGMNxswpSh7x9AfqHaLKPnm77OiFmrJ3RGoSgnxp436wV2YrOV7VvU4XcPsxHGTymxbP2A+9BQwtIsHSWGk913KxBOKvfcGLecTBVZ6W6fw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN6PR11MB0051.namprd11.prod.outlook.com (2603:10b6:405:65::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Thu, 2 Dec
 2021 22:57:16 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 22:57:16 +0000
Subject: Re: [Intel-gfx] [PATCH v3 4/5] drm/i915/dg2: Add Wa_16013000631
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-5-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <d13b149a-dd93-9ad9-4406-4e339c4b9525@intel.com>
Date: Thu, 2 Dec 2021 14:57:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211116174818.2128062-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.254.63.148] (192.55.52.200) by
 SJ0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:33a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Thu, 2 Dec 2021 22:57:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98bd9f71-8e8f-4b88-20b8-08d9b5e715d8
X-MS-TrafficTypeDiagnostic: BN6PR11MB0051:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB005186C7FBC6F95C50E18F74CE699@BN6PR11MB0051.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CNK72N5RevC2GQuZFJI5Gxu6AnA2Rw0WD5WkG4cR2Hh/V1NTS/zF4sJcjDUu+UplPFkHn9EAgdqJY7gCOikz02/pCTjsiUNwQyAxEnTJp77+QH6zypzYXWRNb6/x2fP0lTrssNpGxUI4OMFy1brjtFzEKsuWD7XYzgnlLD/1bngh4a5bkdmCopqGdFKaryEo6PifuIMpcNQPcPOxAJxP0J9FQf6/VcXPXbi8K2d4tUzhFQuhNMAI+rUVAtm6SgbA0cePjavlFjGxqKOgmyNefEBL8cV80wbvp7vKcjCm/0GIJNasOZn9yr1ZU1SPXG1j2tbkNH9P0/w9ABMeLQu6QwVZQe1+v9dKaxH8EwmN/F63HST4HKkFu6VmiRqYHKFkrOWsAt/urXcEw8YFkKIo19wTtKOzGarSNIECQVcm4tZgadK0EnzI02Dk/UPkZOJMI3weuu3/PBGJZ6JYe74PVtPpDNHUEIktOw3/x+mPqX6V4jCh8s9BxTDI+w8zIYowXynWwEf+kg6LkygEWH9LyBkhsKE7R9k/pNuyagWnaEdqUjvHT1Y74Amhi3sLe+3WEJ8rSWcprTAM11jLf/uaYr/zUJBGGYVgR9iIBV8OzaNys0O8MqUrP2IuBQhsAqitWrNitECXu3wdMr2juySEhSfIw/cekeP3ofZZPh+tg77UQeLRMMqP3qx2ER2tVzHtsj04y0H1MINV8B7olX6Firyiv6AJiWAnfGYDfMx+5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(86362001)(2906002)(83380400001)(8676002)(316002)(16576012)(36756003)(82960400001)(6486002)(26005)(2616005)(31686004)(53546011)(956004)(8936002)(66476007)(38100700002)(508600001)(31696002)(66946007)(66556008)(450100002)(4326008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djh0WDRzUnNLVXFHeVU1bUtUZXZSdjJhZE5zOU1veHpTT3J4clBmYUtiK2Rw?=
 =?utf-8?B?V3NmQVA0dUlqdkxyYmtvYWFYNHV3cHEwTkk0TGFNZVBDNVNvSmI3UzJUK3pi?=
 =?utf-8?B?T3U0ZlFvcDhDMlk5Mm11MzEvLzYwKzZmbEpKa2hZUmpSSU5CSWh2eHdtVzND?=
 =?utf-8?B?ZzIrV1NXVlpYMkc1Qit1Yk1vWnAwaHVNY1dSeURwQ0pGd25yZ1kvZnFXendC?=
 =?utf-8?B?eGErT01VTi8rcjI2QWlzYjFBRVZPTlZ3NFBySFZYdUxvcnVIWmFFd0tUTkR3?=
 =?utf-8?B?Qm0zdXljYnl0WHJqS3dGQWx4ZEtiQ2tIWGlEUWZoelVkalFTVzVWT0d0OUlW?=
 =?utf-8?B?RXZwNS9qNkd6M2p4UGNaT3lnQkNiS0JyOHB2V3V0V2t2aUxSdjRXRG44Z1hS?=
 =?utf-8?B?UnBOWW5CR0NGZVFwd3ZaS1RzWC9BaVFncjk2WEg2cnZOSC9UMGNEOWxQWGNl?=
 =?utf-8?B?V2gyS1RBQzZsWkxsV3lzQUY1eTFMcHdHcVB3UlJXZUkzV3VjWmF6eHFHYUlF?=
 =?utf-8?B?K0ptaFRmMDRJRVFBUmdlcEdMNXpSQ1VTbnR0MVZiUVFEY0FEZHRMblFSY1hL?=
 =?utf-8?B?bjZiV2lDTi9zRkhNRlJpVUtSbDhWVkhOeUlBb1JqUlZGNXdQUy9QMUNwbVZ6?=
 =?utf-8?B?QzJNK0RaSWtKdmVNWHdKUUlqdVhweGgzb2ZkRGJqcy9FOUpxSUw3ekdhbExX?=
 =?utf-8?B?WEZHVERIRGhoMXZDUk42WVcveldhczJBcFdEUm10MHg1YjJsU2M0MHc4V01m?=
 =?utf-8?B?OG9xQUdjekF2Zk5tUjV5RDVCTmpzeUVXNnRVVFVNc29SRGwyaWRyY2wwVVBQ?=
 =?utf-8?B?T1NpYjFxZytDOG5sVmFJeDVtcW9ZRWNXYi9aMWVTNjFNV3NlalArdnd1eHU5?=
 =?utf-8?B?WjlzNjgyaC95T2ljMDNFK0ZvckRhdkIwRms3ZXUreXhNWXltV0NPbTEvTm9y?=
 =?utf-8?B?U1FEbEliV0FmaEU3TXVYekxjem1IQUVNd3JqNFNUK1JqWGNZLzB2TnJjS01X?=
 =?utf-8?B?TEk5VTcxQTB1bnZkc2RycmhSWmRZVll6QlMrZHNLUnBjcVFtd0lVS3pqUTRw?=
 =?utf-8?B?bFZWNGNYRGFxWnhacFltSnJtVWFVK1AwT20rUFNDbEdQMlkwNUpJUWNYcVJh?=
 =?utf-8?B?VHFQNUNTVWJNVXBta01tMURmbzZ5NXNiQWNXOG5sWHlRdXRKNS9GWmkwWm5U?=
 =?utf-8?B?RHFXVXVHeFp0bWU0VERmdnBVSjNzSXN1dlk3ZHQ3QjhYQWhLaGF1by9YVzl4?=
 =?utf-8?B?MGlVVGtoVldmUysrQk1NcVVxdVZjMzdvQ0ZlZjYwQUQ5TlJNMlZOTVJxZUdN?=
 =?utf-8?B?T3VEWktTSGhCOWU2MHpjcS9tR0cxRk5hbGhLOFNFNWllZ0JDamMyUTJQc2Uw?=
 =?utf-8?B?N0J5clpRMXBxekdnZXJRd1Z2bHBsOW5jUDZ4NVVZTkhKd00rNERmdVJDT3U3?=
 =?utf-8?B?Z0xTZ3QwNkUzRUk1VFFqcXkwNExhQWVNalo0OFhyNVFiWWNzWGlhT2R5UVAr?=
 =?utf-8?B?Q3Q0TEdTTDVPaVpmMDN3d2JaNVJabklsTjFmK2FycnRmbTBHekNmalE5MTRX?=
 =?utf-8?B?dVZ0U3B4QkNIR1pWdmJSa0ZnMC81RUxoNGZLRGFzN2ZLdE5SWExCREptaHVX?=
 =?utf-8?B?N3crTmFUR1M1NUg5R0wzbHdhVVErbTRIdnFXdUNPalVKRVFmUVdYRDR1RFNk?=
 =?utf-8?B?TkpKeHV5TWNZWEpxUm5odXppbDV0dUVzaEZEK05ibWF6S1lKZGZ5dVpBUHY1?=
 =?utf-8?B?RTlCYmdqS2lqUHJISkRhcFc2VzFVRDJHSzdaRS9SUGRkeG52ODNqL25jU1BL?=
 =?utf-8?B?VWlKTDVob3dycWdtSUw4VUFoZnFJMytCN0NrT21wcXN0QXp5dU5oTW1va0pB?=
 =?utf-8?B?dTczUGF3OS84R1BGTHVVN1ZNVXgxd1RncUM4SWJyTGxnVEhobDdVTFRuZHU5?=
 =?utf-8?B?T3IxVzkyVSszK3doNTh6YzNwQmZBby9TVzdjQ0VrVkViN1pqWFBMd2d5RzFk?=
 =?utf-8?B?Ni80Uk1CbmlZT0ROOXJqMWtGR3ZQZkJGV1pLNWk2KzFyRzBtSm1sTHRBMWdV?=
 =?utf-8?B?UWNySmF0REhidGtmeng3RmNoLzFFWUhqRzdqdVpnV0lMZ1Z5ek9uNDVmWVRj?=
 =?utf-8?B?UFZnMWo1eTBBWlViejdVU21KOW5EVUs3MUtNVDlEWWhwRnpmaWNvZVJDcjhr?=
 =?utf-8?B?WDhEL21Wem84VzNKSTVtVHk0QThGQmRwNXlUQ1E0aXZrM0Q2SUQ1WFI5ZmtU?=
 =?utf-8?B?TnpBOTBmeFFpYTUvblpENGZ1QWNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bd9f71-8e8f-4b88-20b8-08d9b5e715d8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 22:57:15.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVaF7MjJzvL4vEG+ZV8GdaArx9Lq0Ex8IyfOdpFv7eHhvunEbrg3m+mifSvCojMgrYIpNLaXXACQw/Ynb0HuCAvlBwFRw5dntTGf4179AHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint


On 11/16/21 9:48 AM, Matt Roper wrote:
> From: Ramalingam C <ramalingam.c@intel.com>
>
> Invalidate IC cache through pipe control command as part of the ctx
> restore flow through indirect ctx pointer.
>
> v2:
>   - Move pipe control from xcs indirect context to the rcs indirect
>     context.  We'll eventually need this on the CCS engines too, but
>     support for those hasn't landed yet.
>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 56156cf18c41..b3489599e4de 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1167,6 +1167,11 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>   	cs = gen12_emit_cmd_buf_wa(ce, cs);
>   	cs = gen12_emit_restore_scratch(ce, cs);
>   
> +	/* Wa_16013000631:dg2 */
> +	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
> +	    IS_DG2_G11(ce->engine->i915))
> +		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
> +
>   	return cs;
>   }
>   
