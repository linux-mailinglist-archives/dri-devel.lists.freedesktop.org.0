Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8A97BEAFD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AA110E2E0;
	Mon,  9 Oct 2023 19:55:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5167210E2DF;
 Mon,  9 Oct 2023 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881302; x=1728417302;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=poD0yEyr1fqAaai30Jp5B5dAE4nW9qJ0ndbMSKMatBQ=;
 b=JMuIPaLiAlMjAGMFJbHnH3SSPCL39Lu8pBsBArW4ULMRFvImS0WpAaCD
 9yTxpvZEQPVGAr1JHjeCpG7iMuaCqydlu/LU6LAAEA+NYITFR5aQNXLjE
 //mWc9I5aBIF6uN9+rcV7S2dqASCwljqjO5Ik0xL7MgaRex8mWu8CFgMd
 luyz4ppqrhLkMganDIkdlEtU7n+A3L1Eboz2dK7N9c2YSp778y2XwqQvO
 sMmgeJMFPvUTlrzHZuRf/p3+C/Rem54rIMuO7pbwJKW4f+7bK00v51AY0
 gsVAIsRuKfmcTibFSJb/2K5VNMtXolSOtQKKvW8pr1nj2ZEW9ZV+fgO5X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="383109491"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="383109491"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823460105"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="823460105"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 12:55:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 12:55:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 12:55:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 12:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/hiDOT8iJ730JeQpr88E0erF65v+VH5rcXvulAdXl4oAY5A+cF7EViIXzLwXKPy6chjCgrSAaXxT68KF3IoyIXkqcM8bE/J0fH8zYLrisjSspcue0jbPjq2XURV9csp3m0w8mHpb5jv/bhmRk58c92/050kmXiGM2QbfbjjXJJaH0PFbkk4eokDjCbHgIJL/njA558nVe2iv/nmCzuU+EuVlrydIYq9ZWx8n6oxtglDCcI6yMgSW25I7sP6yEPR+malNA7eR1binIdAoMtbbaCDnAchEknXkGf/2RFLPd0mYacgAFLJtVw0nvbPGpgywCRiI23nQ4voWz3O2db+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe5EFPwXO08yikxuc8JB0H//omE3xpZopg9Ut+mxSjI=;
 b=e4jyEkrQSs9TFxf5ukPDoQ0pKm44qB08Cs/DjYDw1O1LQlWz7Gyloz1epEmw1857FtKNhv2rEBtyBPIR2AcAakQBIjxWa2c8tCdBARGSxUZZR11rtbBM7Yi71E3f6BXzu1zKcM9+rDQUCSCDHLOzCzQ7zsgVyXWLjngYbNuL28hXmQh7vo8NaKk9QX+0cRuKqRUhuZkZ4G0YfKCxjm18qk3sFjoZp818ttw8p7KZCIr+CEw1Cijb3bxCstcuzqwgT98Rdott4pweE95k0nsng9Qva9wdgWoMTd2+8tk1p/COr3wD/SkGAndxLNYUfBG7pw/GManAKpGGYkfXPe9uUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 19:54:54 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 19:54:54 +0000
Message-ID: <5246139b-427e-4264-b21b-4562f55bbc45@intel.com>
Date: Mon, 9 Oct 2023 12:54:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: More use of GT specific
 print helpers
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-2-John.C.Harrison@Intel.com>
 <ZSRZjS6YOrOcIEoY@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZSRZjS6YOrOcIEoY@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:303:8f::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 22131ec6-720b-422c-f3df-08dbc9019b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HH7xRAXO6XfXZ5Nkwr8HS6Xzh0NtW9CFs4ijWCeC1QAQJCeSFZXt6L17v6aT/Z4nQeme4uSU0XTSjJhlNF9rRSO1SrDuafm67d+SMYniGchtnIWVqF/s17m+Jzdvq9zKRTcm8+hYmL0zIAF2dSbEdrMcvy38V6aShB0xPeBe2f34uIQ65XVdBptcot10tGq+PPHEdrGJ8zelMISToMZ4XyE/LhKzS/5BeDiqksGo7/jsPzz19r1oYvonJ98iqCqwylDGDAYgWZqBsxSN3F3c09QwufbsD7yV0/KMTVO4t7YSaNAPMTv/FtreTPiHdJZ7JRZSXV+HWeQ/3n8xAm07EAX1P9bxXSzLXLL8svgf1sUCFQMCqEsaWYS9lc4lLlivkAFnZRKg0L+dlViqBzAUomd0o1LI+h3JIxkXfw0pn9UW5KdxD+thntIlpj5DJPChnmDqmlW313SV88dVd8eX1bZBTjhAjx6cvYXOWmcl8dd6HPFJtmperJVNRm7LnrPC9A40WHwDX/yPQGj4apaTUDvT6NVpr3MUyq/cNSuuCEtDsXJxTpt4geXq7Wi+UFWBE8rMfpakwhYF68VhSLV5dyR4isPpuSiT7oMdwSqIgMtk2Vx3/2qYT6sBZVKgqhAnLdL0ELFfmxh/tleLeANWZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66476007)(66556008)(83380400001)(2616005)(26005)(6916009)(66946007)(316002)(5660300002)(8676002)(8936002)(6506007)(53546011)(41300700001)(6512007)(6486002)(478600001)(4326008)(2906002)(36756003)(38100700002)(82960400001)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhrVHJKM2srSGlwUmgvVnJnUCtDd3pSRVUzTWoxWDZ1N0hWMWV1VGxmQjVZ?=
 =?utf-8?B?K2tlMGVtUXQ0Mjh2a1I5WllUd1E1ZFBsNWttTkZxc0g5ZnRoRFdhREtZVnRW?=
 =?utf-8?B?bHI1dG1PNkpaVWsyVzJVVktOcmNOUEVNZ29zTEdSWWNOTmp3d2hrc25ZaGw2?=
 =?utf-8?B?M043OWxQSnNlQVlhNE9mY1orRmRKRU1PK1F4SEg4b09Ja2VUOVVsWmJtcUFi?=
 =?utf-8?B?NWcwRW8xOXYybnN5bE9BS1ErRnZTRWYzZkdJVWtsR3FPMzFkVysvM296VU9H?=
 =?utf-8?B?NkdwL25wdEJ3UC9HMCtnaXFTTHF0THhaa01XZUYzVWZkWGwwVjdCSGYzWmNR?=
 =?utf-8?B?WEE0aVkrc1RVb1VjKzBXczYxWW52L2FBVXFMMWZIOWc5bjlxODduL3JNUGN4?=
 =?utf-8?B?SVptYk5aNHZ1QVdOWUxyckhESSsvb1ZtT056QXhVcjVOMGI2RmxWZWJWbS9K?=
 =?utf-8?B?dmwxWURudURtS0FZS2tLYlR2SXVMb3dUU3pJNnpERGl1Z0hwQ2M0Vnorazkz?=
 =?utf-8?B?UGxTNVdRZlVFOGZLM3BRVHY3c3hoZWFYQjd1YVZKWEN2TDhCend6Z0NVeTND?=
 =?utf-8?B?aThNeG9VbDh3c1BVdXU1c2V0SE5lcWhMbDdGUFVrenpZaklXcUYrUUJZWTVP?=
 =?utf-8?B?dzdjaDFMWFhQeGQ2M0dRaHovQnRhc3JEbnlNb081R3VVUVdsRnBBa1E3RTRC?=
 =?utf-8?B?Rkc5b0VtSXhRbWM1cnc1TG5Bakh5QjBYTjhkNjVNRlZpMVJreFVJd3FodjZP?=
 =?utf-8?B?UnRHSUNLa0thdjBlYVNCSWhhaE5GMWJEQmxEcDJsMER6YW9qVng2bERET2pz?=
 =?utf-8?B?WHp3WVQ5NGtJUXJTc1Bmc01PSEh6b0oxcGIxa3ZCSWpSYlVTM1ZCcjlETGI5?=
 =?utf-8?B?NXhQempTSWwxdkVGbHhGd0dVV0FwT2t1Z3R2RTBoSjV4bXBvOUwvd3ZKOGFY?=
 =?utf-8?B?dTNVamdLMzBUREo4ZjBhSmtqazlGd0dqYUF1OUViN004cDQyTElIRk5JaGhI?=
 =?utf-8?B?ZFhnaExFQXlxYlhMcXYvK25PNHExS1Vja3B0NU1IZVBsZmRIWnRPNzZobk1T?=
 =?utf-8?B?Tk9CbHExVnBSMFpYenQ3SkZLTGhsTXBOZ3dNbU5DdlJJY1BqSktYS2hQdXg3?=
 =?utf-8?B?TzJvbW94a1phNmh6MENkNzRrejBRM1lWLy9Qam9JTDNZV2pvTU91NWJzTHpN?=
 =?utf-8?B?b2Y2WWVUWWNOTDE1ZE1iaEtmVjBzbGJLc3R3YTZvTCtOc21wdWJlYkdVUi91?=
 =?utf-8?B?R29GcC9oZXFCQi9YNE15eUtSV2Rwa093bENoVExYMGJMay9XZDNINm1SRits?=
 =?utf-8?B?WEdrMjlOL1hOWW9mdW9RUXI5MzdHMEM2T0hvUllFc3hoZlpmN2FhNHBvMzhJ?=
 =?utf-8?B?d0pBNHFPcVkvSFZ6cmpjYlN1bkFISUxBS0tPYVkxQ08vM3padnlqY285V0Vn?=
 =?utf-8?B?Snh6TDhicEx4bTNZSWJMRHlhNDVKWkhtS0tiaThFc0lUY0gxT09TWjdVb0d1?=
 =?utf-8?B?aEpya2p3RFE3OXM1TEJVdVd4eE5iZFNzT1phMVRvUDI3WlRrRzlPTmZVTFFo?=
 =?utf-8?B?aTg5dUg1RlpTTFZURlI5MVBubmpsSUozSTlVYTYxc2hkU0ZqbVBPUnNCREtz?=
 =?utf-8?B?NVl5RWwzWDgyaHlZRzNoYTZmSTlNYUxxYWxRbGJvczR6TTIyTzVsZHlodlJj?=
 =?utf-8?B?VWZ3SThFdU8zUitMMTg3ZmhzbXU2QnljS1VCL0QzT2FZbWlKMnZ6MVFabjFY?=
 =?utf-8?B?dXQwTGg5cStmaGYxZHQzTGJPcHZ6OUszU1pLVVBuQ3l0MHIyL2d3VHd6ZmZF?=
 =?utf-8?B?M0dYcUZsNldZcEJEN05qcTE1U3ZCL0gzZ241MDUyTEwrUlpVbjRhZUZDWEhz?=
 =?utf-8?B?c1g4U2lISmQwQjgrQlF5ZmgyQnpCRDNlUEw2REd0WXc1VVlaSmFpUDVPdXdY?=
 =?utf-8?B?bHMxZHM0bXY5NkVqb2RLSnh2K29EQ0Qzb1BGcEhQdG9nQ2tPNEovOFV0S0tT?=
 =?utf-8?B?OFArU2dCLzdwc1NLNWk4eHVJT1BwQ2Z4dkdDeFVEcGhvc3o4amJWS0VVZm5E?=
 =?utf-8?B?bVlsRk5jeWZlYjM5VzVEc0sxSVROV2d3TEx3RmdyblFBdm9Cby9PcDM0ZlRO?=
 =?utf-8?B?THU4bzZibFo0aG92dWhIU1QvZmtRaEZEWW1SV01SSlhPOG1zT1E3cnJ0K2hq?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22131ec6-720b-422c-f3df-08dbc9019b2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:54:54.0053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feZnmzJyAWO9LA3V+ucnkvjKYbHA5w+xhKzV+YwskdPj6WUjLOXzbky5kydbxgH20onrdhPSujARfoGw94hU7BHhdq1DV4W6v8NznFwPAvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2023 12:50, Andi Shyti wrote:
> Hi John,
>
> ...
>
>>   	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
>> -		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out of range", intf_id);
>> +		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
>>   		return;
>>   	}
>>   
>>   	if (!HAS_HECI_GSC(gt->i915)) {
>> -		drm_warn_once(&gt->i915->drm, "GSC irq: not supported");
>> +		gt_warn_once(gt, "GSC irq: not supported");
>>   		return;
>>   	}
>>   
>> @@ -300,7 +301,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>>   
>>   	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
>>   	if (ret)
>> -		drm_err_ratelimited(&gt->i915->drm, "error handling GSC irq: %d\n", ret);
>> +		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>>   }
>>   
>>   void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
>> index 55a336a9ff061..7fdc78c79273e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
>> @@ -16,6 +16,9 @@
>>   #define gt_warn(_gt, _fmt, ...) \
>>   	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>>   
>> +#define gt_warn_once(_gt, _fmt, ...) \
>> +	drm_warn_once(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>> +
> I would add the gt_warn_once() part in a different patch.
But this is the patch that uses it. You should not add dead code. The 
only exception being if it is something large and complex that needs to 
be added in stages for ease of code review. But this really doesn't 
count as large or complex!

John.

>
> Andi

