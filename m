Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F83412903
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295116E894;
	Mon, 20 Sep 2021 22:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3296E894;
 Mon, 20 Sep 2021 22:49:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284260374"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="284260374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 15:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="612718918"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 15:49:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 15:49:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 15:49:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 15:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ2WBpzhLNVMPlf8rqJ7GkdxvTbU1D1uZnd/MKX4oIMmDL9E89vikrh4aDFMZeP834wwqFXLCqttt0OqC9j42+giHcb6m2PcEh6TBTYZvhRK4LgfBADcZOm9V01BQhyscsh4yHqFw3z2+QfIrqN3C8wuqW63U38bSgjx8mUDzv7IZ6BAsDEJgt6Rl4Cun9GkXwiPeCjwaLr+vBMaxy7shp7YAkkGHqQv1AzwCqncohT00xgERwB6pcLef6eAksDIl4lsC7uhgUN+zTOTpxFLoFT+i6hN0hiQ//y+keA6voHXj+Y8/2zoPe6JnHxXn4ec1Zyj55Tm1xIGdtcwNUecKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=crz5WNRMddv5tbMlRoiw3vYw7dXwpMs+6SpX2ugwnao=;
 b=dkNFD3lctrTG2ZtCL1+smZqP9sIDBqCMHHbT6qH+D4KZ+8kBFgQiznJX2irYztdzJ5kOAllK1mO9ahxyExQobMrn9cBfXZ8yqapW0kwulAyR9zYpxazPUtkNnRkuHQiMBFYfeU98serc2N+LHJkTDCsJni19aKtoNN7CEOjyyD76tbkIS4WTHO3jC93ZCyJFJCUJizLBQ2om7w+q2UBt6+2idV/E6OmX9WeCaKwGU0zzREUFKSkx1AJ5es0ipiRyzu4MO4TzVlyTvqqdzhSocO3eFT1TnbAcC8F5HfM7KQvQR4wJSPG40op+lvtATX11BPEa5M6k2LYsaNaU+86vTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crz5WNRMddv5tbMlRoiw3vYw7dXwpMs+6SpX2ugwnao=;
 b=hibIxAKrvodZXu3sxGBDRZJ59Weggnib16sSTUKNY9av7stGSVduKoYoqFKtCni1K3XPfp2+Lwmmrb6A4gvsWQcLnj7OfaRJ8S1r1dV1m1LWE6LZ3xFJ8N6xl/2VvhlW01dSy3UIfWJWXwG3/wWZP8RU3lCmLaRwJsY46v46rWA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 22:49:02 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 22:49:02 +0000
Subject: Re: [Intel-gfx] [PATCH 18/27] drm/i915/guc: Update debugfs for GuC
 multi-lrc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-19-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c63585cd-0cf3-0b9e-80c0-060741d1484d@intel.com>
Date: Mon, 20 Sep 2021 15:48:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-19-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR22CA0004.namprd22.prod.outlook.com
 (2603:10b6:300:ef::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR22CA0004.namprd22.prod.outlook.com (2603:10b6:300:ef::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 22:49:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e5c38c-82b0-4d5c-10aa-08d97c88d7c5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5642:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5642A76C775A175A588DB588BDA09@PH0PR11MB5642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFp6VfD2KT7EnqPNxbz/h3vTZPpneHWVJpGZplFExPani5BiBFT7JdjrFhVidGXbFJhszvkABwrpPlVzJ1B16n3Po8AnEtAMl20N2hQ1Ge3FA90mmIL+vQTdaGkJrQWvZJ9bEzRIFHsA3phN43wEKJaBijRYJiZwvBDGNsCdjM/NQmzmv38aFVr2PivPIQO6XxHcfdF8rwV0wxIBw3QcLOig1P6iVkmp9DvW3CHTOhdjzy91/7HTSTSIT1bqESU1YGPiPPADd90E4PlRwC6a8UaVTUZrDKmpZJsHYrzCHAo94OCcqCyj1xDjETNWc7F1FLGAdHEuQ6PAQHB2ykCEdj8jXwBvwCKmlbxwXk23SRCY16feytEr3U7rD/3aHOpuKF1n40Ce38jQBzxjC5tWq8RL2AmaCXCF/zyIj4xJQv/k8ltupp2P4BWy93St6Qlw08ZUn5LRvi5sJ2SwhWRolX4IHlh/H/9UlBefpZibP14sCevOJSrv4854kjdBsaVziw1y9zDlhpxfKs+snBnjM3fhOA0RWijUe84UkxmFzLTEIko7acd0rSk0opiLbl4k+S0MH4uYeBz/obMab/OmnJcU1+v3eQROj50f6hEE8v+mcHv/0p61MRd6m4FINnOzc0glPpW+RbgaW41EfJuCbUo/uIlm22OJaJx2G2EnOFv1HFbzybprLg5GzJZsXyLP6jSLdTPfSwvUWPqPS3MQCODdQ/ENu1+YBptH8sraq5AG9aTeSDkzRbQwo8csDf3R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(6666004)(8936002)(316002)(107886003)(31696002)(66476007)(31686004)(8676002)(38100700002)(86362001)(26005)(186003)(36756003)(5660300002)(2616005)(6486002)(53546011)(66556008)(66946007)(16576012)(83380400001)(508600001)(2906002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTdabWFHa1pxQStEMGhzQ1dVTHNxYkJ5N0tOSDRCQ1NRVjZvSGUvU2MyNGw0?=
 =?utf-8?B?Tko1ZkQyUDVpQUFLOXRPM0xKYlU3VHV1Slp3UmZCeHFTYmNybTIxWGxDSEly?=
 =?utf-8?B?VzBOL0M1MDkxeUpoS21VSlRtVExMV3lwNm0wZ2RHcnFYQ2FZSndSbUwxQVUr?=
 =?utf-8?B?dFNkUHdJMmFFcDRKR1ZzNG5CRnRDN0d2bTJ2NVcyTS9FdGxYcEhkN293VWE5?=
 =?utf-8?B?OHk2UkhoM3dKWkVPVlVHWUUveDB6dXp3a29lSm93Ukh5Q3BGWkV2MHZZU3NT?=
 =?utf-8?B?ZTAxV09peWp2THJNM0MvY2ovWWhRRkNyK3IwdkxiZ3BRWndCWkdDSXhGSXZB?=
 =?utf-8?B?S0VVKzJvYWVtcDUxMXJXUi84QlpZOHRwWXdGU0RSdUlseUI4V1ZtMVpXZ3ZZ?=
 =?utf-8?B?bzdvQ01CVURDcHlJYUlXaS9xeVEweGYvcUkrdXNjbzdpT0t2WDhQNC9WUnF0?=
 =?utf-8?B?Unk5R0RzZERyalhud2l6Y1FHN3dGVDAxclozdGtSR2h5VW1rMVRDdmt0cGgv?=
 =?utf-8?B?QTlQSkUvY3JSUTFlb0pRU3pNL0hrMTMyalpseHQ3U1JvN09tVzQ1bnZHaC9P?=
 =?utf-8?B?Mkw5REFwZkF4c0NDYkR2T1RlY3V0MHNxMzhkc01CeUh4NG92YW5mNTZJN0U1?=
 =?utf-8?B?L1MycW5PZ2pFWDhLWHA3YmJMZUM1TjlHUFJwbmdKQVRuYUVSSkZpYkNaRHo3?=
 =?utf-8?B?UEd2S1h5TFZqdTZwbHZSTXYxUkRmS0VlbEVJMVpMUEw5SHYyZVp0Q1BRcWJY?=
 =?utf-8?B?MnV4b0hPWFMyQ3NybTFTMVdISVBzZjdzQWdjem5wUzZkTEFwSEFtQVBaOWVm?=
 =?utf-8?B?aHdwVjN5bS9GaEVGRVVuODJsc3Evb1pFbnNvMUk2N3RXSVgyRllTMjA4STdI?=
 =?utf-8?B?YnlMNDhQZU5uS201RnlpYm12OHhqWmdWeENCTlh4SjJjSEdCbUZ0UkZnUFE1?=
 =?utf-8?B?eGZuaTlzOFk4K1YwZWlsMEZCRmphbHhkNjQ3Y2dQZ0tUTzBMSlJHeExVVlRy?=
 =?utf-8?B?aFlRV0VmampEd1pudXFaTytQUzRDTitKNlg0bVhpcVRLS1FqRVMrUG9kaFZM?=
 =?utf-8?B?NSthSFdvWm81Z3FQSENNdS9sdXd4SEQwZklUSjlYMzdQUDZtNDgvYVJIcEds?=
 =?utf-8?B?aGVQMzA3aWExSHpGMVROMGVtUnNUOHRYZkhUdHpDaWZvUG9iOGZvbzQrQ1Zn?=
 =?utf-8?B?aGdidUZCaXFMOEJuVXRtMTZtZmY5OWFLZjNwTEM0c096MlJRVmFZRkZhQ0V5?=
 =?utf-8?B?dTNEd3JVS2hQSWRYLzM2WFUwdU5IM3VHS2FxNndHY3VuQlFnWVBHNzBZdVhh?=
 =?utf-8?B?M3g4a1JZN1FCYXQ4NVJma0pmR3hEL0Z1TDB0dVVjamdBWGVhUjZWZUdvVm9V?=
 =?utf-8?B?bFF2eS9FMzRPMEs1eWtNaXViWlA1Sjk2WGQ2SjMvY3dIUVRCWmVTSmszSDBt?=
 =?utf-8?B?bVRHOVhFY2YyQ1JzcFJNcXBpQUYyek03RVVoMWhHQ1Z1TkdGVU96anNCdVIv?=
 =?utf-8?B?QU9Na0RyeEFmSlhScG84dmZ4TTZQVVhEYXZFMzFBaVFwdlV3SCsyK2Myektw?=
 =?utf-8?B?akxaRCszVFdXTVo3QVYxaTA2NjI1eFZlTlFleklyTEhvMDZTNEJEZkZrUElo?=
 =?utf-8?B?R3A4RU9DOUxXVS9sd0RCdHNtcGZhM1RNOTlySTh4ODhVV3ovZUdEeGpxL1RM?=
 =?utf-8?B?WU5ySmZQVi9UQ3VQakpTTzQzRW5YZUZ2R1p4UUs0dGVpQlRLUCtUNmxNN3FV?=
 =?utf-8?Q?a04Ly0xPv/z7E6paYQ+h6FQldCUo5PuTzubHirL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e5c38c-82b0-4d5c-10aa-08d97c88d7c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 22:49:02.8512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGSb1Vm/a/ZQLWULbaXxelxMqtnfsbWPnijtQRIz9xtI6rAJXse7YIzL/qw08udH4GvT6D8pPYV7x/WTSfO5LYCmI7tk6hSOD10mC/l2kKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
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
> Display the workqueue status in debugfs for GuC contexts that are in
> parent-child relationship.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 51 ++++++++++++++-----
>   1 file changed, 37 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e34e0ea9136a..07eee9a399c8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3673,6 +3673,26 @@ static void guc_log_context_priority(struct drm_printer *p,
>   	drm_printf(p, "\n");
>   }
>   
> +
> +static inline void guc_log_context(struct drm_printer *p,
> +				   struct intel_context *ce)
> +{
> +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> +	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> +	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> +		   ce->ring->head,
> +		   ce->lrc_reg_state[CTX_RING_HEAD]);
> +	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> +		   ce->ring->tail,
> +		   ce->lrc_reg_state[CTX_RING_TAIL]);
> +	drm_printf(p, "\t\tContext Pin Count: %u\n",
> +		   atomic_read(&ce->pin_count));
> +	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> +		   atomic_read(&ce->guc_id.ref));
> +	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> +		   ce->guc_state.sched_state);
> +}
> +
>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   					     struct drm_printer *p)
>   {
> @@ -3682,22 +3702,25 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> -		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> -		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> -			   ce->ring->head,
> -			   ce->lrc_reg_state[CTX_RING_HEAD]);
> -		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> -			   ce->ring->tail,
> -			   ce->lrc_reg_state[CTX_RING_TAIL]);
> -		drm_printf(p, "\t\tContext Pin Count: %u\n",
> -			   atomic_read(&ce->pin_count));
> -		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> -			   atomic_read(&ce->guc_id.ref));
> -		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> -			   ce->guc_state.sched_state);
> +		GEM_BUG_ON(intel_context_is_child(ce));
>   
> +		guc_log_context(p, ce);
>   		guc_log_context_priority(p, ce);
> +
> +		if (intel_context_is_parent(ce)) {
> +			struct guc_process_desc *desc = __get_process_desc(ce);
> +			struct intel_context *child;
> +
> +			drm_printf(p, "\t\tWQI Head: %u\n",
> +				   READ_ONCE(desc->head));
> +			drm_printf(p, "\t\tWQI Tail: %u\n",
> +				   READ_ONCE(desc->tail));
> +			drm_printf(p, "\t\tWQI Status: %u\n\n",
> +				   READ_ONCE(desc->wq_status));
> +
> +			for_each_child(ce, child)
> +				guc_log_context(p, child);
There should be some indication that this is a child context and/or how 
many children there are. Otherwise how does the reader differentiation 
between the list of child contexts and the next parent/single context?

John.

> +		}
>   	}
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }

