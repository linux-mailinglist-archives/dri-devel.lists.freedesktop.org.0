Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB742CF89
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4989A34;
	Thu, 14 Oct 2021 00:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54389A34;
 Thu, 14 Oct 2021 00:25:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226339534"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226339534"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="487141983"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2021 17:25:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:25:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:25:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JawI6dsPsDMcpUQSg4PF7AW84ZtiUJOvcgvMyheTMYygH/G+K6J0fqxnsKG+GGpgQIze//Cnqa96wsq0Vy7d7JXQjNvhO+paAOrpwBGPh9jCLoA6aHT0QsY2FYCw7B3mUFGH8PDAILeIVP+DRN+R+dxh4eXr8UMHZwEGg/zFUfgc/VkiCJlouviP/KzLrY8PNmlmIMw/se4Q8JKfWNEYEsn2F0UEK+ZOHBE6kWBFIZ0RO2zM5FDct5UkDnNU6V/0zRzbN1vbMdWzbPRvnG1bupzXcsOHoHmhBJnnhRGDaKsaQufy0+/Law5c+bNlVfHcH2Q/CKtYXt8Imq9ntEiVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HlPOvB43abGTqEA5DGnGqHA/jVPBVhGvrKQQgLK17A=;
 b=VHkgYPDLgLAWyu2I0aJ2j56e5E/0SbR8pYtd+XdWLApSvi3iFzHw7/BnhLWBaygIpro5qIbMwiuWNhAfzCfWQAsS/qUNkO7jlc0uaiz4dedlx/gkvIObUEfZCewqP2sppr+SO9eJtDjWYHx5c/QGtz0wOtFlpnTCdBpMokkZk6+xZC8F9xml1KtkHTc+/yMjQtX6COGAl84OCQaR0OA+y5BAA5vbvyXIT0Ubxk7uzdOpNkhICjsintEBScuxDPtLrJ9SJv18vdcY6sc6RLxsW2XZvImEjpq/ad0PKxfMlOsIkTLWtCCc3+O6NX/z5OZ6vomZO1I/Npm06BkYfECkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HlPOvB43abGTqEA5DGnGqHA/jVPBVhGvrKQQgLK17A=;
 b=PV/f8RAm4ZQTPiu+WpSw2khnjKAoZxtFb0mWggF49heUdEyEUiBQvvBEgOr0a2aCHT1INGgXoIcTieWRw9QQlp9JfWkCE36MHd5DpatEhf24OTH9ceQo8u+K3/YBRQl8qr3VwuZQzslldJw3a08h7iSYExFcfDU4MsR2Li/Efc4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5596.namprd11.prod.outlook.com (2603:10b6:510:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 00:25:52 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:25:52 +0000
Subject: Re: [PATCH 12/25] drm/i915/guc: Implement multi-lrc submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-13-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <5d5e1707-8db5-0353-ac23-6f29115f797b@intel.com>
Date: Wed, 13 Oct 2021 17:25:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 00:25:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 413eb272-0328-4809-4d7b-08d98ea92e26
X-MS-TrafficTypeDiagnostic: PH0PR11MB5596:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB559688BC738F2C11D4B088B4BDB89@PH0PR11MB5596.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MI7nurBdxzQRqXfJh/NuYO3S6hZyUubX6JJLRtjuolIC1HCe8wFb28V2s+b5eglbSOWG1xAJcFcNc6qhrxIvCouVfme8EJmzkwT1gWe3lq2Z0LQloBmdp5GOz9ZSJP0zxbMTihvuVczgmz+d8KFNZTYmq5c0/PRLIRqbO++W2l++tYp/Zs+H9wcZXw8ns45fEGcwZgxtv/lhRWYJr17psaaKsXDmFFk5LxKA+rzL2njGkSdWWq0vA28SNQFy+mEh5+1lE5x9jVbqYnzcotdfvFzz7sEQ269UNxboGM1zixuxP/K1l+YVpDjComzQL0PDPno+JM0eb3KgmcX0GZxJluEygFi6Tb7sAvnOOIk20bZtAQmmKrCMEitkHde7g4eBJ2J8wD0y+PSLbaTVSb3eygzl6xWRdtnZNgs0SK/eEGglxw+tER7jNxgQQc4z9TSGsAtf68qCa7ZU0Zn7qqdFReW4awxFteHJglYkBfh1tqVaaOS2nj0vq8+VblG4LWMneZF/Bk+h70EbG0Ip1Wb9se7Z7iccyV+txgpziAUYklIDlaHZHksBdnCBfK+vwQtAR0hguDrsriyZFLKpXl7+RF8lPRLmJJOGtMm4bazs9P1h27G1DcnGzDPBMRUNEWprm+wb8ys8ImG7oYw7a+5h2Qi9yXFMdMqjOwB/27Gn6f2r1axQLn5dMpWgZ9iD8xqyAlR7XHmM/xwdL5vplqKQvPMJC2amYJDAHs3UyxcGPyDFN/wK3dvIe1cMhJrxmtOU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(16576012)(30864003)(316002)(38100700002)(508600001)(53546011)(31686004)(66946007)(66556008)(66476007)(83380400001)(82960400001)(6486002)(26005)(8936002)(8676002)(186003)(956004)(2616005)(86362001)(31696002)(450100002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTEyOUN4OGNoem9xL0NGbGxIT2xMRU1iRDllZXNEYlJGT2hjQTlJMlA3T2Mz?=
 =?utf-8?B?RVdDbDUxNDMxVi9tWTdSSXhORFhIVVIxQUc3L0RUYWtocTJ0MkU0a0J2YnB6?=
 =?utf-8?B?TFV5NU5CWlN4LzA5V3hsR204TEkrMU5zUnNVbUhZSXFNdyswS29FcjFWM1hZ?=
 =?utf-8?B?YVNWZTNIOEJNNEZIMDh1cm5KZ0l3akpuOEczV0txeS95T2o1dWJqUEN3c2U3?=
 =?utf-8?B?YjRqVTREcnJ1Z0RYV240VmRJUEV6UWxSM0RCVFZJc1RjRHJtckhiUVp2L1dp?=
 =?utf-8?B?NEVIOExpVUdYQXVId0xQNnIzdGdvVGI2c2JJbXVyZU5xWUYrYkRUK2JYSk9T?=
 =?utf-8?B?K3ZNMkVYT0hKV3Z3cjVsd25mbk1XZjFacXRqbFVxN2doUWNQb0J6YTJVUnJx?=
 =?utf-8?B?STFjYXYwMjVLZGVoYnkxdWZhdXdNOGJBZjRRM1JsSDloMDlyY2JBR25nVlEw?=
 =?utf-8?B?eWd1bFZzdkFEV1JtMnd6TlJ3TlF2dTdKdFdlTDdsM3JzWnMraU12Z3VMTStl?=
 =?utf-8?B?R1Nkb2FqSzVxREl5eTNSVFp3VDR2Z1lLOFFPTGMwQTN3M3lvdUR6aEVJRzVB?=
 =?utf-8?B?OWowY3RXYmtWTlFmSEtlVGVMVldaNmRmTmxhWEtzaVBkKzNYbXhGMFdGZUhB?=
 =?utf-8?B?ckpFWHQwdkZYZ3FwcnR1MW1TOWdialZFekVqTnpobkc4dkxUSVMyQTduMXJ5?=
 =?utf-8?B?ZG1ka1BESUUzT1ZQbHRJREgxZStiYUtjbFNzNG5BYXhPM1gxMklTNWV5cHRS?=
 =?utf-8?B?UWx5S0RyY1FReTJxMURoTjk4OVVpMEsrOXZyczlZY2tuZk1ZMWdrWEVTYmhZ?=
 =?utf-8?B?Q3NvdEc4U2tkNlJPRTN3Z2ttYjZxUlVaSHpmVFdwdTNDeWJuTEZ5Q3h3RUha?=
 =?utf-8?B?dHhvVWRIL0Q2bFN1WFFRS3BPaVVtdlMvdXBiN3YzQkZURDdoTnhhZUZwVkVH?=
 =?utf-8?B?dU42a3pRODBqdXJHUGhJTk10RUliZDh5VHBvNEhISmpFZEd0TnN0QUlOenJq?=
 =?utf-8?B?cUdoMkZRdkd3Ym1WNXdET2dJSzJmZ1RVM3JCUDRXYWJIbnRzSlJZY3RvMWFN?=
 =?utf-8?B?RHNQZGF3Yll6UDJVQ21XV0RyZG05VlNrZGJTWjZ6V1RzUnNXelE2TXRIbzZN?=
 =?utf-8?B?NGkxdlA1T21aeGwrNE9iNWZtSFFRZGxjaTZEdGpuWFBkV2ZLQVlVdDA0N1Y0?=
 =?utf-8?B?cWZITjR6ajluKzBySVZjbEp0Mnl0MGUyd2ZGTUFPUmc5UHc3VUhPZzFzczFP?=
 =?utf-8?B?TFpoRzYrckp6Yks0aFFiTFk5Tk1BaW5WalllMEM4RmJMMGNjZ0ZqZzQxUzFS?=
 =?utf-8?B?cWgwQ3lhcWpzRSthaWVGdFBOMDZlait6K3FJRzdZaDFNbHo1T1JCMk11V1l5?=
 =?utf-8?B?c2F5RFd6UXZHZlpDRWhaWmlNT0x2ZmdzbjBJRjZWTGF0QW94R0lUZnpoWndV?=
 =?utf-8?B?K0E3SVo3ZDRWWVhTMU53V0RyUEY1RFN4U0xLV2lwNXFXS0VNRWtLSFBjd2dC?=
 =?utf-8?B?OXY3MDFzQ2lGcUpUanVEQnZ4UjRZNkNDcHJHa1VCeGg2YzQ4NnBoQWhiVDlk?=
 =?utf-8?B?Uk1nOXN0VjB2RHhjOWxReTVtMHg1RmQ5RzRKSnZFRWRIODhkOVEyK2Y2NkFK?=
 =?utf-8?B?bERiY29nMnNIczdNTEpkU0pwQ0dIRFoyQXZBZVZiRGpFSEVaVlJIS1BYbTJo?=
 =?utf-8?B?L2dJdVFlRUswajdNTEswNTZJa2w4Rjk1d3VmcHYxQk1MeTJ2NnRvOEp5NXBC?=
 =?utf-8?Q?R3acSXTHBPN9iAo9ITrTJFxHph5ZC576Lv1vIIy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 413eb272-0328-4809-4d7b-08d98ea92e26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:25:52.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97/aZTe3dlZzce98Atk2p9hqxoOF6asRmguG3k5yWt4SAIxFRBE/bxezErcX+QznZpCLIJMvkLrFP3wC2C9A2U79umvgOInXhKjO4H6K0uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5596
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Implement multi-lrc submission via a single workqueue entry and single
> H2G. The workqueue entry contains an updated tail value for each
> request, of all the contexts in the multi-lrc submission, and updates
> these values simultaneously. As such, the tasklet and bypass path have
> been updated to coalesce requests into a single submission.
>
> v2:
>   (John Harrison)
>    - s/wqe/wqi
>    - Use FIELD_PREP macros
>    - Add GEM_BUG_ONs ensures length fits within field
>    - Add comment / white space to intel_guc_write_barrier
>   (Kernel test robot)
>    - Make need_tasklet a static function
> v3:
>   (Docs)
>    - A comment for submission_stall_reason
> v4:
>   (Kernel test robot)
>    - Initialize return value in bypass tasklt submit function
>   (John Harrison)
>    - Add comment near work queue defs
>    - Add BUILD_BUG_ON to ensure WQ_SIZE is a power of 2
>    - Update write_barrier comment to talk about work queue
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  29 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  30 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 323 +++++++++++++++---
>   drivers/gpu/drm/i915/i915_request.h           |   8 +
>   6 files changed, 350 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 8f8182bf7c11..6e228343e8cb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -756,3 +756,32 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
>   		}
>   	}
>   }
> +
> +void intel_guc_write_barrier(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> +		/*
> +		 * Ensure intel_uncore_write_fw can be used rather than
> +		 * intel_uncore_write.
> +		 */
> +		GEM_BUG_ON(guc->send_regs.fw_domains);
> +
> +		/*
> +		 * This register is used by the i915 and GuC for MMIO based
> +		 * communication. Once we are in this code CTBs are the only
> +		 * method the i915 uses to communicate with the GuC so it is
> +		 * safe to write to this register (a value of 0 is NOP for MMIO
> +		 * communication). If we ever start mixing CTBs and MMIOs a new
> +		 * register will have to be chosen. This function is also used
> +		 * to enforce ordering of a work queue item write and an update
> +		 * to the process descriptor. When a work queue is being used,
> +		 * CTBs are also the only mechanism of communication.
> +		 */
> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> +	} else {
> +		/* wmb() sufficient for a barrier if in smem */
> +		wmb();
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 4ca197f400ba..31cf9fb48c7e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -46,6 +46,15 @@ struct intel_guc {
>   	 * submitted until the stalled request is processed.
>   	 */
>   	struct i915_request *stalled_request;
> +	/**
> +	 * @submission_stall_reason: reason why submission is stalled
> +	 */
> +	enum {
> +		STALL_NONE,
> +		STALL_REGISTER_CONTEXT,
> +		STALL_MOVE_LRC_TAIL,
> +		STALL_ADD_REQUEST,
> +	} submission_stall_reason;
>   
>   	/* intel_guc_recv interrupt related state */
>   	/** @irq_lock: protects GuC irq state */
> @@ -367,4 +376,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc);
>   
>   void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>   
> +void intel_guc_write_barrier(struct intel_guc *guc);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 0a3504bc0b61..a0cc34be7b56 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -383,28 +383,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>   	return ++ct->requests.last_fence;
>   }
>   
> -static void write_barrier(struct intel_guc_ct *ct)
> -{
> -	struct intel_guc *guc = ct_to_guc(ct);
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
> -	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> -		GEM_BUG_ON(guc->send_regs.fw_domains);
> -		/*
> -		 * This register is used by the i915 and GuC for MMIO based
> -		 * communication. Once we are in this code CTBs are the only
> -		 * method the i915 uses to communicate with the GuC so it is
> -		 * safe to write to this register (a value of 0 is NOP for MMIO
> -		 * communication). If we ever start mixing CTBs and MMIOs a new
> -		 * register will have to be chosen.
> -		 */
> -		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> -	} else {
> -		/* wmb() sufficient for a barrier if in smem */
> -		wmb();
> -	}
> -}
> -
>   static int ct_write(struct intel_guc_ct *ct,
>   		    const u32 *action,
>   		    u32 len /* in dwords */,
> @@ -474,7 +452,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   	 * make sure H2G buffer update and LRC tail update (if this triggering a
>   	 * submission) are visible before updating the descriptor tail
>   	 */
> -	write_barrier(ct);
> +	intel_guc_write_barrier(ct_to_guc(ct));
>   
>   	/* update local copies */
>   	ctb->tail = tail;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 0eeb2a9feeed..c14fc15dd3a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -52,25 +52,27 @@
>   
>   #define GUC_DOORBELL_INVALID		256
>   
> -/* Work queue item header definitions */
> +/*
> + * Work queue item header definitions
> + *
> + * Work queue is circular buffer used to submit complex (multi-lrc) submissions
> + * to the GuC. A work queue item is entry in the circular buffer.
is entry -> is an entry

With that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> + */
>   #define WQ_STATUS_ACTIVE		1
>   #define WQ_STATUS_SUSPENDED		2
>   #define WQ_STATUS_CMD_ERROR		3
>   #define WQ_STATUS_ENGINE_ID_NOT_USED	4
>   #define WQ_STATUS_SUSPENDED_FROM_RESET	5
> -#define WQ_TYPE_SHIFT			0
> -#define   WQ_TYPE_BATCH_BUF		(0x1 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
> -#define WQ_TARGET_SHIFT			10
> -#define WQ_LEN_SHIFT			16
> -#define WQ_NO_WCFLUSH_WAIT		(1 << 27)
> -#define WQ_PRESENT_WORKLOAD		(1 << 28)
> -
> -#define WQ_RING_TAIL_SHIFT		20
> -#define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
> -#define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
> +#define WQ_TYPE_BATCH_BUF		0x1
> +#define WQ_TYPE_PSEUDO			0x2
> +#define WQ_TYPE_INORDER			0x3
> +#define WQ_TYPE_NOOP			0x4
> +#define WQ_TYPE_MULTI_LRC		0x5
> +#define WQ_TYPE_MASK			GENMASK(7, 0)
> +#define WQ_LEN_MASK			GENMASK(26, 16)
> +
> +#define WQ_GUC_ID_MASK			GENMASK(15, 0)
> +#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
>   
>   #define GUC_STAGE_DESC_ATTR_ACTIVE	BIT(0)
>   #define GUC_STAGE_DESC_ATTR_PENDING_DB	BIT(1)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9fc40e3c1794..77591e764195 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -401,6 +401,29 @@ __get_process_desc(struct intel_context *ce)
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static u32 *get_wq_pointer(struct guc_process_desc *desc,
> +			   struct intel_context *ce,
> +			   u32 wqi_size)
> +{
> +	/*
> +	 * Check for space in work queue. Caching a value of head pointer in
> +	 * intel_context structure in order reduce the number accesses to shared
> +	 * GPU memory which may be across a PCIe bus.
> +	 */
> +#define AVAILABLE_SPACE	\
> +	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
> +	if (wqi_size > AVAILABLE_SPACE) {
> +		ce->parallel.guc.wqi_head = READ_ONCE(desc->head);
> +
> +		if (wqi_size > AVAILABLE_SPACE)
> +			return NULL;
> +	}
> +#undef AVAILABLE_SPACE
> +
> +	return ((u32 *)__get_process_desc(ce)) +
> +		((WQ_OFFSET + ce->parallel.guc.wqi_tail) / sizeof(u32));
> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -560,10 +583,10 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
>   
> -static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
>   	int err = 0;
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u32 action[3];
>   	int len = 0;
>   	u32 g2h_len_dw = 0;
> @@ -584,26 +607,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> -	/*
> -	 * Corner case where the GuC firmware was blown away and reloaded while
> -	 * this context was pinned.
> -	 */
> -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
> -		err = guc_lrc_desc_pin(ce, false);
> -		if (unlikely(err))
> -			return err;
> -	}
> -
>   	spin_lock(&ce->guc_state.lock);
>   
>   	/*
>   	 * The request / context will be run on the hardware when scheduling
> -	 * gets enabled in the unblock.
> +	 * gets enabled in the unblock. For multi-lrc we still submit the
> +	 * context to move the LRC tails.
>   	 */
> -	if (unlikely(context_blocked(ce)))
> +	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
>   		goto out;
>   
> -	enabled = context_enabled(ce);
> +	enabled = context_enabled(ce) || context_blocked(ce);
>   
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> @@ -622,6 +636,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		trace_intel_context_sched_enable(ce);
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   		set_context_enabled(ce);
> +
> +		/*
> +		 * Without multi-lrc KMD does the submission step (moving the
> +		 * lrc tail) so enabling scheduling is sufficient to submit the
> +		 * context. This isn't the case in multi-lrc submission as the
> +		 * GuC needs to move the tails, hence the need for another H2G
> +		 * to submit a multi-lrc context after enabling scheduling.
> +		 */
> +		if (intel_context_is_parent(ce)) {
> +			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> +			err = intel_guc_send_nb(guc, action, len - 1, 0);
> +		}
>   	} else if (!enabled) {
>   		clr_context_pending_enable(ce);
>   		intel_context_put(ce);
> @@ -634,6 +660,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	return err;
>   }
>   
> +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	int ret = __guc_add_request(guc, rq);
> +
> +	if (unlikely(ret == -EBUSY)) {
> +		guc->stalled_request = rq;
> +		guc->submission_stall_reason = STALL_ADD_REQUEST;
> +	}
> +
> +	return ret;
> +}
> +
>   static inline void guc_set_lrc_tail(struct i915_request *rq)
>   {
>   	rq->context->lrc_reg_state[CTX_RING_TAIL] =
> @@ -645,6 +683,136 @@ static inline int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static bool is_multi_lrc_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_child(rq->context) ||
> +		intel_context_is_parent(rq->context);
> +}
> +
> +static bool can_merge_rq(struct i915_request *rq,
> +			 struct i915_request *last)
> +{
> +	return request_to_scheduling_context(rq) ==
> +		request_to_scheduling_context(last);
> +}
> +
> +static u32 wq_space_until_wrap(struct intel_context *ce)
> +{
> +	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
> +}
> +
> +static void write_wqi(struct guc_process_desc *desc,
> +		      struct intel_context *ce,
> +		      u32 wqi_size)
> +{
> +	BUILD_BUG_ON(!is_power_of_2(WQ_SIZE));
> +
> +	/*
> +	 * Ensure WQI are visible before updating tail
> +	 */
> +	intel_guc_write_barrier(ce_to_guc(ce));
> +
> +	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
> +		(WQ_SIZE - 1);
> +	WRITE_ONCE(desc->tail, ce->parallel.guc.wqi_tail);
> +}
> +
> +static int guc_wq_noop_append(struct intel_context *ce)
> +{
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
> +	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
> +
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	GEM_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
> +
> +	*wqi = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> +		FIELD_PREP(WQ_LEN_MASK, len_dw);
> +	ce->parallel.guc.wqi_tail = 0;
> +
> +	return 0;
> +}
> +
> +static int __guc_wq_item_append(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	struct intel_context *child;
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	unsigned int wqi_size = (ce->parallel.number_children + 4) *
> +		sizeof(u32);
> +	u32 *wqi;
> +	u32 len_dw = (wqi_size / sizeof(u32)) - 1;
> +	int ret;
> +
> +	/* Ensure context is in correct state updating work queue */
> +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
> +	GEM_BUG_ON(context_guc_id_invalid(ce));
> +	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> +	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> +
> +	/* Insert NOOP if this work queue item will wrap the tail pointer. */
> +	if (wqi_size > wq_space_until_wrap(ce)) {
> +		ret = guc_wq_noop_append(ce);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	wqi = get_wq_pointer(desc, ce, wqi_size);
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	GEM_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
> +
> +	*wqi++ = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
> +		FIELD_PREP(WQ_LEN_MASK, len_dw);
> +	*wqi++ = ce->lrc.lrca;
> +	*wqi++ = FIELD_PREP(WQ_GUC_ID_MASK, ce->guc_id.id) |
> +	       FIELD_PREP(WQ_RING_TAIL_MASK, ce->ring->tail / sizeof(u64));
> +	*wqi++ = 0;	/* fence_id */
> +	for_each_child(ce, child)
> +		*wqi++ = child->ring->tail / sizeof(u64);
> +
> +	write_wqi(desc, ce, wqi_size);
> +
> +	return 0;
> +}
> +
> +static int guc_wq_item_append(struct intel_guc *guc,
> +			      struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	int ret = 0;
> +
> +	if (likely(!intel_context_is_banned(ce))) {
> +		ret = __guc_wq_item_append(rq);
> +
> +		if (unlikely(ret == -EBUSY)) {
> +			guc->stalled_request = rq;
> +			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static bool multi_lrc_submit(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	intel_ring_set_tail(rq->ring, rq->tail);
> +
> +	/*
> +	 * We expect the front end (execbuf IOCTL) to set this flag on the last
> +	 * request generated from a multi-BB submission. This indicates to the
> +	 * backend (GuC interface) that we should submit this context thus
> +	 * submitting all the requests generated in parallel.
> +	 */
> +	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
> +		intel_context_is_banned(ce);
> +}
> +
>   static int guc_dequeue_one_context(struct intel_guc *guc)
>   {
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> @@ -658,7 +826,17 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   	if (guc->stalled_request) {
>   		submit = true;
>   		last = guc->stalled_request;
> -		goto resubmit;
> +
> +		switch (guc->submission_stall_reason) {
> +		case STALL_REGISTER_CONTEXT:
> +			goto register_context;
> +		case STALL_MOVE_LRC_TAIL:
> +			goto move_lrc_tail;
> +		case STALL_ADD_REQUEST:
> +			goto add_request;
> +		default:
> +			MISSING_CASE(guc->submission_stall_reason);
> +		}
>   	}
>   
>   	while ((rb = rb_first_cached(&sched_engine->queue))) {
> @@ -666,8 +844,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   		struct i915_request *rq, *rn;
>   
>   		priolist_for_each_request_consume(rq, rn, p) {
> -			if (last && rq->context != last->context)
> -				goto done;
> +			if (last && !can_merge_rq(rq, last))
> +				goto register_context;
>   
>   			list_del_init(&rq->sched.link);
>   
> @@ -675,33 +853,84 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   			trace_i915_request_in(rq, 0);
>   			last = rq;
> -			submit = true;
> +
> +			if (is_multi_lrc_rq(rq)) {
> +				/*
> +				 * We need to coalesce all multi-lrc requests in
> +				 * a relationship into a single H2G. We are
> +				 * guaranteed that all of these requests will be
> +				 * submitted sequentially.
> +				 */
> +				if (multi_lrc_submit(rq)) {
> +					submit = true;
> +					goto register_context;
> +				}
> +			} else {
> +				submit = true;
> +			}
>   		}
>   
>   		rb_erase_cached(&p->node, &sched_engine->queue);
>   		i915_priolist_free(p);
>   	}
> -done:
> +
> +register_context:
>   	if (submit) {
> -		guc_set_lrc_tail(last);
> -resubmit:
> +		struct intel_context *ce = request_to_scheduling_context(last);
> +
> +		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> +			     !intel_context_is_banned(ce))) {
> +			ret = guc_lrc_desc_pin(ce, false);
> +			if (unlikely(ret == -EPIPE)) {
> +				goto deadlk;
> +			} else if (ret == -EBUSY) {
> +				guc->stalled_request = last;
> +				guc->submission_stall_reason =
> +					STALL_REGISTER_CONTEXT;
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		}
> +
> +move_lrc_tail:
> +		if (is_multi_lrc_rq(last)) {
> +			ret = guc_wq_item_append(guc, last);
> +			if (ret == -EBUSY) {
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		} else {
> +			guc_set_lrc_tail(last);
> +		}
> +
> +add_request:
>   		ret = guc_add_request(guc, last);
> -		if (unlikely(ret == -EPIPE))
> +		if (unlikely(ret == -EPIPE)) {
> +			goto deadlk;
> +		} else if (ret == -EBUSY) {
> +			goto schedule_tasklet;
> +		} else if (ret != 0) {
> +			GEM_WARN_ON(ret);	/* Unexpected */
>   			goto deadlk;
> -		else if (ret == -EBUSY) {
> -			tasklet_schedule(&sched_engine->tasklet);
> -			guc->stalled_request = last;
> -			return false;
>   		}
>   	}
>   
>   	guc->stalled_request = NULL;
> +	guc->submission_stall_reason = STALL_NONE;
>   	return submit;
>   
>   deadlk:
>   	sched_engine->tasklet.callback = NULL;
>   	tasklet_disable_nosync(&sched_engine->tasklet);
>   	return false;
> +
> +schedule_tasklet:
> +	tasklet_schedule(&sched_engine->tasklet);
> +	return false;
>   }
>   
>   static void guc_submission_tasklet(struct tasklet_struct *t)
> @@ -1251,16 +1480,22 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
>   static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   				     struct i915_request *rq)
>   {
> -	int ret;
> +	int ret = 0;
>   
>   	__i915_request_submit(rq);
>   
>   	trace_i915_request_in(rq, 0);
>   
> -	guc_set_lrc_tail(rq);
> -	ret = guc_add_request(guc, rq);
> -	if (ret == -EBUSY)
> -		guc->stalled_request = rq;
> +	if (is_multi_lrc_rq(rq)) {
> +		if (multi_lrc_submit(rq)) {
> +			ret = guc_wq_item_append(guc, rq);
> +			if (!ret)
> +				ret = guc_add_request(guc, rq);
> +		}
> +	} else {
> +		guc_set_lrc_tail(rq);
> +		ret = guc_add_request(guc, rq);
> +	}
>   
>   	if (unlikely(ret == -EPIPE))
>   		disable_submission(guc);
> @@ -1268,6 +1503,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	return ret;
>   }
>   
> +static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	return submission_disabled(guc) || guc->stalled_request ||
> +		!i915_sched_engine_is_empty(sched_engine) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +}
> +
>   static void guc_submit_request(struct i915_request *rq)
>   {
>   	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> @@ -1277,8 +1522,7 @@ static void guc_submit_request(struct i915_request *rq)
>   	/* Will be called from irq-context when using foreign fences. */
>   	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	if (submission_disabled(guc) || guc->stalled_request ||
> -	    !i915_sched_engine_is_empty(sched_engine))
> +	if (need_tasklet(guc, rq))
>   		queue_request(sched_engine, rq, rq_prio(rq));
>   	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
>   		tasklet_hi_schedule(&sched_engine->tasklet);
> @@ -2260,9 +2504,10 @@ static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
>   
>   static void add_to_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>   
>   	spin_lock(&ce->guc_state.lock);
> @@ -2295,7 +2540,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
>   
>   static void remove_from_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irq(&ce->guc_state.lock);
>   
> @@ -2714,7 +2961,7 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>   static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   					   int prio)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>   
>   	/* Short circuit function */
> @@ -2737,7 +2984,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   
>   	spin_lock(&ce->guc_state.lock);
>   	guc_prio_fini(rq, ce);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 7bd9ed20623e..8950785e55d6 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -139,6 +139,14 @@ enum {
>   	 * the GPU. Here we track such boost requests on a per-request basis.
>   	 */
>   	I915_FENCE_FLAG_BOOST,
> +
> +	/*
> +	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
> +	 * parent-child relationship (parallel submission, multi-lrc) should
> +	 * trigger a submission to the GuC rather than just moving the context
> +	 * tail.
> +	 */
> +	I915_FENCE_FLAG_SUBMIT_PARALLEL,
>   };
>   
>   /**

