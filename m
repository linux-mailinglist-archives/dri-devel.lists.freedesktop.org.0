Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B1429956
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 00:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B726E546;
	Mon, 11 Oct 2021 22:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03B6E546;
 Mon, 11 Oct 2021 22:09:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="207098597"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="207098597"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 15:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="714915177"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2021 15:09:48 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 15:09:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 15:09:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 15:09:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 15:09:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkG8wzdu3Jna4DHYiyDYdQu1GfKxBhK6ro+iHtTaCUshZ2rxs1gXTz4QAh0xUopMhNeQNsvCv6Vaz9dKm2USKmdswyx43UQZy6FsKcOpxx0/xG55BVkYEHl3El0xvqljTFvvuMJ2N2aV/6r75cKvXIogfCkD/PkJH5CnRhh493jpSHysbCQs8QMm19mrA+62l7vU/3ru7Rw6QZTXYIFpRCg76x2wiRIeBCuo/JmdwPeiNObvXanHG1DZ3c7RJVMqccFhFH3VYk8rMTlXDz9uBEcBaTs40WaFG5hdaLIFdlDTGHurMxZ+a6CvJo8NCm2zOZXuCnH5JdWKPM9M7qvIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kGC+Q7ceTndISBD0odHo9V3D7ojfRQ3xVJcdEFdja0=;
 b=ZqCi/fZHz8KI4Ci7Z9lH2OeAlbV5FTSilBVbVA0rbXqRIEzbiov+13Q/DFtPPfF0LZ8DHcdH1IL4DjL6jzuwoDnmmNremOx3RsrgWJU0oDLHa4zGCWAmippyNJvu8XqOufcOZxfEhmVDnHAdhc15emgHwJ6qZeLgEp9idmi9k+YzkwRSvlm21gWUvRfKwLRAn5JJeoxazelfcVQUi58zOZ3btNqNqJeoxD8dBN8UQDNkLUC0Om2bsFibG+B8CHumTgFNY25FdAe9n8ugc7CoPEk6n80LNJAq8FRag5tPDa2FNARWNzGbMrxS/t6/MvVN1Blwc5G6ct+Nr0U4fYf3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kGC+Q7ceTndISBD0odHo9V3D7ojfRQ3xVJcdEFdja0=;
 b=Ma3gKMM/6BBrHfmk2QWHocysQ0pq729ZAhWqLpP+PgyjBU/vyZJwjUbw0We27yOp/hcKB4nre1ig/khHr5CMXIbqpGpZn+PE5JTXUnYvmNazdq/YgaprWPwGumJrRohF7gXVw6zA6DjB2VHxV4RWk+5KhcVl3O4eQGApTdMcqoo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 22:09:46 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 22:09:46 +0000
Subject: Re: [PATCH 17/26] drm/i915/guc: Connect UAPI to GuC multi-lrc
 interface
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-18-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b9db3036-d353-f54b-6f99-01964b5d57fa@intel.com>
Date: Mon, 11 Oct 2021 15:09:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:300:16::12) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR13CA0002.namprd13.prod.outlook.com (2603:10b6:300:16::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Mon, 11 Oct 2021 22:09:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec53dd5-f616-48e3-0550-08d98d03d5a7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5626:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56264911D35C81CD8C7C74F7BDB59@PH0PR11MB5626.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l09yIRpoRqsVJbHA7EqmE4UwIHlvhbjLXSQJ1P6WaVKna0uXpPDsxfZ+urgECa+WzQMFeksl9TGOBrZVaa18rI0ugcH7NuoavfBVltgVgH7wa5aZ0gqAojZfBla6JmpnW/91phklu5Vq+oCTmNCSHK1kZtucrWWUvmvc1DsjtEKpq3UgK42lgO8vBBhl7iS3+enJ/P6buPK12CGvk+tde+4bYotbxMgpA5ywC8N856S6xpMKwRj/lsikXZxM+H5NDaQ5aAhxUrt7+wyiTlb7FEupkgNvcIIe1Ht1eJkeY9oFsas3So/kiiWQ3sjAtWETb2lvcnnoLpjIsS24ixarWCLpduyYRcXyaqAFmPXH+Mdo+dKQx/7yL+EfjNHl9r8gXFdNB71pPdcO8CkjpJjIey/X6eyPCPDtbIz8XpowlziZI03P0gslu+t42u7j39qFM1xh22UZR2YA+/NgugN5mTzSpByHIBvnNimnQohdGl6VBGtPRN6AkI66ZMcD+2m5YGNPOy20V0r3a6mMEjZQhlIi9cXBZuS8kPN6zukkXhkfPIK+croLNGDlUXQsrdGF/UZY6568NX0U3BoJv4mzH6d0HssL84vMU69XspOMgu82XEF+EbeiKAUD8i5rF+wnUWe9mtBotnwp2VYWeZzzakBkt6YmS5I4mtGTicJciArdhasdVVoXp3zpqyeO0gkKjy2yZh3+L3Qk/lSthFtT57EbsF9f3Qx/j5t3XFBdiXfBEe9uqhcGIAtraBzGzln3Uimm2TUrHz0I5oCJsFoqoxQffei0JntxODSGONVM4uHqBA0MVmtolS4wj9inHBMA1fB/xPWhhlO9Pe+nzH34KkV2sI0KGxlxaTmK48cxoZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(8936002)(31696002)(450100002)(86362001)(66946007)(2616005)(6486002)(966005)(107886003)(30864003)(4326008)(83380400001)(66476007)(66556008)(316002)(508600001)(16576012)(5660300002)(36756003)(31686004)(38100700002)(8676002)(53546011)(2906002)(26005)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZmU2tKazA2TG1zdmhNZzczZGIrQlIzVE9IV2VSNTZHTXJrS2dDTFZTalFQ?=
 =?utf-8?B?bit4cHZRUWw0VVFiR0VkTUU1OVlGb0RtOW9WU0xCK2FKZVlZd245TW5lNncv?=
 =?utf-8?B?aFhHZ2l1UkIxWnR2dlI0K3hrd1JXSkhDWXpXYlREbWJ5Qm1wQmtCU2NmSnRD?=
 =?utf-8?B?dWVQdTQ3dFVkNDZjN0RQTDVnSTRtTzNLUE9RTGJtU0VLSXZVbGtURTA0NzhJ?=
 =?utf-8?B?T3ptSFBoUEZxYTAvcmlFVm1FRFdmeWhodUl2R1dFVVJibWZLc1pnZnpGa1hK?=
 =?utf-8?B?T0xMVlpMeWVkN0l3VFBPdE1COEtXaktIWUU4Mnk5eXNTU1htblY4ZjZQYXBS?=
 =?utf-8?B?TjBueGNKNnhkYVkyYTlBd2dPTmduSWtLOU5lVGplTGtVMGh4aHAva0M1WWRD?=
 =?utf-8?B?ZENBdTU4WnBnTWg3ZVBHRDR2VXdQWWYvT2RFUTVHNldpSGFwNXVZeE91UmZu?=
 =?utf-8?B?OUEvbFV2TDhuRVpqcEhTREdYeFRlUm9YYVRIVUZOUTEyM0hQeWY2dlNzU2d3?=
 =?utf-8?B?Y3kyTm1XQ3VmWU9VcW9jTktzUWs4b050SzFZZkk1c3J1T0FWdVZzSEdObWFG?=
 =?utf-8?B?a1JpaUVnUk1NaXlJWXhUcWZRT2VKcDRZcWlHcFJSWjJUTEo5RUFVcjZMY0NB?=
 =?utf-8?B?bzR2WEYvVHI2TU9TK2pMK1NOLzFwNGplRDB3WmQ5VmJtRGorOWxYeXVnYWtm?=
 =?utf-8?B?VDZLYUg3YkFvUDlmdTJ3VnF3VGJLTlc2TmI3QytvZ3AzZ1krYTBrZ3Y5Y2Iz?=
 =?utf-8?B?UzhDSllUbklXWEJKMXR0USs5c3p1YjVJTUl3YjdBUllMV0YrcE9iK29EMWk3?=
 =?utf-8?B?UHBBWGRFZDRiQkYvTm5YMTdKZ1lmQmFTMWQ4OFZZTVhZS1FOakFkTFFWSlB4?=
 =?utf-8?B?dWo0UFd6MVBveWJFOHNWMGNpWEFjSmtkZy8yMFNuN1ZxTzRxQWJXOUh2ZFNq?=
 =?utf-8?B?ck1XTTNJOHl6bmFMenVWUExucTFXYkdEWmpyMnhudGlRa3hrSThCRDl6WTNl?=
 =?utf-8?B?a1NHeFVOQ25QREtWSk16REd5K0pUZWhFSkRiNGJoc0dwaUh3WUNPcUI1UWpX?=
 =?utf-8?B?cWFxOE9uK0JrQU5FaG91SDV4bFRuY0VPdFhMN2xuQ1lwMnI4MFRnV3dFYWVY?=
 =?utf-8?B?QUFOYTdqNkgrby81MTlQNEcyMUd2YWdwbFJHbGo0Z2hXZmdTZmZsZ2trQVk2?=
 =?utf-8?B?RkI0TnNSekIvQXF6YjBCMTFnU0hvdGN1VkFOaWxXK21idEc2Z085M3ZKNk84?=
 =?utf-8?B?OURiL0xDVkFRODFMZjMzSGp5aVIvME0rTDV2ZG9tM2FTWDBGV2FaeU5LckM0?=
 =?utf-8?B?YW41aUk5d0o3MjNscmVWZ0JUSVR3OUxxSWUzV3NPS1NaSURvMitxcGxaNGZC?=
 =?utf-8?B?NFBtVmpBSjZETzZCeDgyWHZCd3lVemdweVYvRVhYMENXMVYxQTYwd0lSQ05X?=
 =?utf-8?B?WGtRU1YvcytZRGxLOWRPbEE0TXJaNitmRlZZWHNNVFBMbzg4bURLYmxaemR4?=
 =?utf-8?B?RDFSMUIxSFIra2kvUytkOHBtS25QWkFXWTd1dkovQmVTR1NtcXFGeFlsMkJz?=
 =?utf-8?B?eE43dXBia0ZnbGpiTkN4SEFSeWhONGNOQmdWOGZxbVBxdkFyUUs0eHBjbHc2?=
 =?utf-8?B?WG5paFhXcnM1NkVWeG5vWG9KK3FjWHc0djZMNDFFVVZkdWkyL1RvdUd0ekdr?=
 =?utf-8?B?N0Mzd3JEYS9uVXVRMGZGdDAxa3RTQlErTkpiQ0NXWUhnWWlseWJxRlEyWlhL?=
 =?utf-8?Q?8//1UpGOdsuPus9pgv/lcWJZU5+q+7bCqf0Hli6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec53dd5-f616-48e3-0550-08d98d03d5a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 22:09:46.2400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGwNYtfIkJWlaDEq/PJXM6lu5D0v1XYLyPjhwD/MkP8OCThXKz9qrpUIGn68PW6SAHxSysDdIbeQbpe4B8Z/h9vC3L4mUfhyxMO6uxb2W0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Introduce 'set parallel submit' extension to connect UAPI to GuC
> multi-lrc interface. Kernel doc in new uAPI should explain it all.
>
> IGT: https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
> media UMD: https://github.com/intel/media-driver/pull/1252
>
> v2:
>   (Daniel Vetter)
>    - Add IGT link and placeholder for media UMD link
> v3:
>   (Kernel test robot)
>    - Fix warning in unpin engines call
>   (John Harrison)
>    - Reword a bunch of the kernel doc
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 221 +++++++++++++++++-
>   .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 ++++++++-
>   include/uapi/drm/i915_drm.h                   | 131 +++++++++++
>   9 files changed, 489 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 8c7ea6e56262..6290bc20ccb1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -522,9 +522,150 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>   	return 0;
>   }
>   
> +static int
> +set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
> +				      void *data)
> +{
> +	struct i915_context_engines_parallel_submit __user *ext =
> +		container_of_user(base, typeof(*ext), base);
> +	const struct set_proto_ctx_engines *set = data;
> +	struct drm_i915_private *i915 = set->i915;
> +	u64 flags;
> +	int err = 0, n, i, j;
> +	u16 slot, width, num_siblings;
> +	struct intel_engine_cs **siblings = NULL;
> +	intel_engine_mask_t prev_mask;
> +
> +	/* Disabling for now */
> +	return -ENODEV;
> +
> +	/* FIXME: This is NIY for execlists */
> +	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> +		return -ENODEV;
> +
> +	if (get_user(slot, &ext->engine_index))
> +		return -EFAULT;
> +
> +	if (get_user(width, &ext->width))
> +		return -EFAULT;
> +
> +	if (get_user(num_siblings, &ext->num_siblings))
> +		return -EFAULT;
> +
> +	if (slot >= set->num_engines) {
> +		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> +			slot, set->num_engines);
> +		return -EINVAL;
> +	}
> +
> +	if (set->engines[slot].type != I915_GEM_ENGINE_TYPE_INVALID) {
> +		drm_dbg(&i915->drm,
> +			"Invalid placement[%d], already occupied\n", slot);
> +		return -EINVAL;
> +	}
> +
> +	if (get_user(flags, &ext->flags))
> +		return -EFAULT;
> +
> +	if (flags) {
> +		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
> +		return -EINVAL;
> +	}
> +
> +	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
> +		err = check_user_mbz(&ext->mbz64[n]);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (width < 2) {
> +		drm_dbg(&i915->drm, "Width (%d) < 2\n", width);
> +		return -EINVAL;
> +	}
> +
> +	if (num_siblings < 1) {
> +		drm_dbg(&i915->drm, "Number siblings (%d) < 1\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
> +	siblings = kmalloc_array(num_siblings * width,
> +				 sizeof(*siblings),
> +				 GFP_KERNEL);
> +	if (!siblings)
> +		return -ENOMEM;
> +
> +	/* Create contexts / engines */
> +	for (i = 0; i < width; ++i) {
> +		intel_engine_mask_t current_mask = 0;
> +		struct i915_engine_class_instance prev_engine;
> +
> +		for (j = 0; j < num_siblings; ++j) {
> +			struct i915_engine_class_instance ci;
> +
> +			n = i * num_siblings + j;
> +			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
> +				err = -EFAULT;
> +				goto out_err;
> +			}
> +
> +			siblings[n] =
> +				intel_engine_lookup_user(i915, ci.engine_class,
> +							 ci.engine_instance);
> +			if (!siblings[n]) {
> +				drm_dbg(&i915->drm,
> +					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
> +					n, ci.engine_class, ci.engine_instance);
> +				err = -EINVAL;
> +				goto out_err;
> +			}
> +
> +			if (n) {
> +				if (prev_engine.engine_class !=
> +				    ci.engine_class) {
> +					drm_dbg(&i915->drm,
> +						"Mismatched class %d, %d\n",
> +						prev_engine.engine_class,
> +						ci.engine_class);
> +					err = -EINVAL;
> +					goto out_err;
> +				}
> +			}
> +
> +			prev_engine = ci;
> +			current_mask |= siblings[n]->logical_mask;
> +		}
> +
> +		if (i > 0) {
> +			if (current_mask != prev_mask << 1) {
> +				drm_dbg(&i915->drm,
> +					"Non contiguous logical mask 0x%x, 0x%x\n",
> +					prev_mask, current_mask);
> +				err = -EINVAL;
> +				goto out_err;
> +			}
> +		}
> +		prev_mask = current_mask;
> +	}
> +
> +	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
> +	set->engines[slot].num_siblings = num_siblings;
> +	set->engines[slot].width = width;
> +	set->engines[slot].siblings = siblings;
> +
> +	return 0;
> +
> +out_err:
> +	kfree(siblings);
> +
> +	return err;
> +}
> +
>   static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
>   	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
>   	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
> +	[I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT] =
> +		set_proto_ctx_engines_parallel_submit,
>   };
>   
>   static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
> @@ -775,6 +916,25 @@ static int intel_context_set_gem(struct intel_context *ce,
>   	return ret;
>   }
>   
> +static void __unpin_engines(struct i915_gem_engines *e, unsigned int count)
> +{
> +	while (count--) {
> +		struct intel_context *ce = e->engines[count], *child;
> +
> +		if (!ce || !test_bit(CONTEXT_PERMA_PIN, &ce->flags))
> +			continue;
> +
> +		for_each_child(ce, child)
> +			intel_context_unpin(child);
> +		intel_context_unpin(ce);
> +	}
> +}
> +
> +static void unpin_engines(struct i915_gem_engines *e)
> +{
> +	__unpin_engines(e, e->num_engines);
> +}
> +
>   static void __free_engines(struct i915_gem_engines *e, unsigned int count)
>   {
>   	while (count--) {
> @@ -890,6 +1050,40 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>   	return err;
>   }
>   
> +static int perma_pin_contexts(struct intel_context *ce)
> +{
> +	struct intel_context *child;
> +	int i = 0, j = 0, ret;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	ret = intel_context_pin(ce);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	for_each_child(ce, child) {
> +		ret = intel_context_pin(child);
> +		if (unlikely(ret))
> +			goto unwind;
> +		++i;
> +	}
> +
> +	set_bit(CONTEXT_PERMA_PIN, &ce->flags);
> +
> +	return 0;
> +
> +unwind:
> +	intel_context_unpin(ce);
> +	for_each_child(ce, child) {
> +		if (j++ < i)
> +			intel_context_unpin(child);
> +		else
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
>   static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   					     unsigned int num_engines,
>   					     struct i915_gem_proto_engine *pe)
> @@ -903,7 +1097,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   	e->num_engines = num_engines;
>   
>   	for (n = 0; n < num_engines; n++) {
> -		struct intel_context *ce;
> +		struct intel_context *ce, *child;
>   		int ret;
>   
>   		switch (pe[n].type) {
> @@ -913,7 +1107,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   
>   		case I915_GEM_ENGINE_TYPE_BALANCED:
>   			ce = intel_engine_create_virtual(pe[n].siblings,
> -							 pe[n].num_siblings);
> +							 pe[n].num_siblings, 0);
> +			break;
> +
> +		case I915_GEM_ENGINE_TYPE_PARALLEL:
> +			ce = intel_engine_create_parallel(pe[n].siblings,
> +							  pe[n].num_siblings,
> +							  pe[n].width);
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_INVALID:
> @@ -934,6 +1134,22 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			err = ERR_PTR(ret);
>   			goto free_engines;
>   		}
> +		for_each_child(ce, child) {
> +			ret = intel_context_set_gem(child, ctx, pe->sseu);
> +			if (ret) {
> +				err = ERR_PTR(ret);
> +				goto free_engines;
> +			}
> +		}
> +
> +		/* XXX: Must be done after setting gem context */
There is still no explanation of this comment either here or in the 
commit message. It needs to say why it is a problem that the perma-pin 
must be done after the above set_gem call. And what must be done to fix 
this problem. And what issues could be expected because of this problem.

> +		if (pe[n].type == I915_GEM_ENGINE_TYPE_PARALLEL) {
> +			ret = perma_pin_contexts(ce);
> +			if (ret) {
> +				err = ERR_PTR(ret);
> +				goto free_engines;
> +			}
> +		}
>   	}
>   
>   	return e;
> @@ -1173,6 +1389,7 @@ static void context_close(struct i915_gem_context *ctx)
>   
>   	/* Flush any concurrent set_engines() */
>   	mutex_lock(&ctx->engines_mutex);
> +	unpin_engines(__context_engines_static(ctx));
>   	engines_idle_release(ctx, rcu_replace_pointer(ctx->engines, NULL, 1));
>   	i915_gem_context_set_closed(ctx);
>   	mutex_unlock(&ctx->engines_mutex);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index c4617e4d9fa9..eb5f9b4f2d19 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -78,6 +78,9 @@ enum i915_gem_engine_type {
>   
>   	/** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
>   	I915_GEM_ENGINE_TYPE_BALANCED,
> +
> +	/** @I915_GEM_ENGINE_TYPE_PARALLEL: A parallel engine set */
> +	I915_GEM_ENGINE_TYPE_PARALLEL,
>   };
>   
>   /**
> @@ -108,6 +111,9 @@ struct i915_gem_proto_engine {
>   	/** @num_siblings: Number of balanced siblings */
Should this be updated to say 'number of balanced or parallel siblings'?

John.

>   	unsigned int num_siblings;
>   
> +	/** @width: Width of each sibling */
> +	unsigned int width;
> +
>   	/** @siblings: Balanced siblings */
>   	struct intel_engine_cs **siblings;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 8309d1141d0a..1d880303a7e4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -55,9 +55,13 @@ struct intel_context_ops {
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
>   
> -	/* virtual engine/context interface */
> +	/* virtual/parallel engine/context interface */
>   	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
> -						unsigned int count);
> +						unsigned int count,
> +						unsigned long flags);
> +	struct intel_context *(*create_parallel)(struct intel_engine_cs **engines,
> +						 unsigned int num_siblings,
> +						 unsigned int width);
>   	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
>   					       unsigned int sibling);
>   };
> @@ -113,6 +117,7 @@ struct intel_context {
>   #define CONTEXT_NOPREEMPT		8
>   #define CONTEXT_LRCA_DIRTY		9
>   #define CONTEXT_GUC_INIT		10
> +#define CONTEXT_PERMA_PIN		11
>   
>   	struct {
>   		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 87579affb952..43f16a8347ee 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -279,9 +279,19 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   	return intel_engine_has_preemption(engine);
>   }
>   
> +#define FORCE_VIRTUAL	BIT(0)
>   struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> -			    unsigned int count);
> +			    unsigned int count, unsigned long flags);
> +
> +static inline struct intel_context *
> +intel_engine_create_parallel(struct intel_engine_cs **engines,
> +			     unsigned int num_engines,
> +			     unsigned int width)
> +{
> +	GEM_BUG_ON(!engines[0]->cops->create_parallel);
> +	return engines[0]->cops->create_parallel(engines, num_engines, width);
> +}
>   
>   static inline bool
>   intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2eb798ad068b..ff6753ccb129 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1953,16 +1953,16 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   
>   struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> -			    unsigned int count)
> +			    unsigned int count, unsigned long flags)
>   {
>   	if (count == 0)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (count == 1)
> +	if (count == 1 && !(flags & FORCE_VIRTUAL))
>   		return intel_context_create(siblings[0]);
>   
>   	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
> -	return siblings[0]->cops->create_virtual(siblings, count);
> +	return siblings[0]->cops->create_virtual(siblings, count, flags);
>   }
>   
>   struct i915_request *
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 5ed1e222c308..8d7f571029df 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -201,7 +201,8 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>   }
>   
>   static struct intel_context *
> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +			 unsigned long flags);
>   
>   static struct i915_request *
>   __active_request(const struct intel_timeline * const tl,
> @@ -3784,7 +3785,8 @@ static void virtual_submit_request(struct i915_request *rq)
>   }
>   
>   static struct intel_context *
> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +			 unsigned long flags)
>   {
>   	struct virtual_engine *ve;
>   	unsigned int n;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index b3863abc51f5..74986b094b96 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>   	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>   
>   	for (n = 0; n < nctx; n++) {
> -		ve[n] = intel_engine_create_virtual(siblings, nsibling);
> +		ve[n] = intel_engine_create_virtual(siblings, nsibling, 0);
>   		if (IS_ERR(ve[n])) {
>   			err = PTR_ERR(ve[n]);
>   			nctx = n;
> @@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>   	 * restrict it to our desired engine within the virtual engine.
>   	 */
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_close;
> @@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>   		i915_request_add(rq);
>   	}
>   
> -	ce = intel_engine_create_virtual(siblings, nsibling);
> +	ce = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out;
> @@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>   
>   	/* XXX We do not handle oversubscription and fairness with normal rq */
>   	for (n = 0; n < nsibling; n++) {
> -		ce = intel_engine_create_virtual(siblings, nsibling);
> +		ce = intel_engine_create_virtual(siblings, nsibling, 0);
>   		if (IS_ERR(ce)) {
>   			err = PTR_ERR(ce);
>   			goto out;
> @@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>   	if (err)
>   		goto out_scratch;
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_scratch;
> @@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>   	if (igt_spinner_init(&spin, gt))
>   		return -ENOMEM;
>   
> -	ve = intel_engine_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_spin;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f69e984683aa..9b19e0d830a2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -124,7 +124,13 @@ struct guc_virtual_engine {
>   };
>   
>   static struct intel_context *
> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +		   unsigned long flags);
> +
> +static struct intel_context *
> +guc_create_parallel(struct intel_engine_cs **engines,
> +		    unsigned int num_siblings,
> +		    unsigned int width);
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> @@ -2611,6 +2617,7 @@ static const struct intel_context_ops guc_context_ops = {
>   	.destroy = guc_context_destroy,
>   
>   	.create_virtual = guc_create_virtual,
> +	.create_parallel = guc_create_parallel,
>   };
>   
>   static void submit_work_cb(struct irq_work *wrk)
> @@ -2860,8 +2867,6 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> @@ -2878,8 +2883,6 @@ static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>   	return __guc_context_pin(ce, engine, vaddr);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> @@ -2891,8 +2894,6 @@ static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>   	return __guc_context_pin(ce, engine, vaddr);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_parent_context_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> @@ -2908,8 +2909,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	lrc_unpin(ce);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_child_context_unpin(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(context_enabled(ce));
> @@ -2920,8 +2919,6 @@ static void guc_child_context_unpin(struct intel_context *ce)
>   	lrc_unpin(ce);
>   }
>   
> -/* Future patches will use this function */
> -__maybe_unused
>   static void guc_child_context_post_unpin(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(!intel_context_is_child(ce));
> @@ -2932,6 +2929,98 @@ static void guc_child_context_post_unpin(struct intel_context *ce)
>   	intel_context_unpin(ce->parallel.parent);
>   }
>   
> +static void guc_child_context_destroy(struct kref *kref)
> +{
> +	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> +
> +	__guc_context_destroy(ce);
> +}
> +
> +static const struct intel_context_ops virtual_parent_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_context_pre_pin,
> +	.pin = guc_parent_context_pin,
> +	.unpin = guc_parent_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
> +
> +	.ban = guc_context_ban,
> +
> +	.cancel_request = guc_context_cancel_request,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.sched_disable = guc_context_sched_disable,
> +
> +	.destroy = guc_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
> +static const struct intel_context_ops virtual_child_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_context_pre_pin,
> +	.pin = guc_child_context_pin,
> +	.unpin = guc_child_context_unpin,
> +	.post_unpin = guc_child_context_post_unpin,
> +
> +	.cancel_request = guc_context_cancel_request,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.destroy = guc_child_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
> +static struct intel_context *
> +guc_create_parallel(struct intel_engine_cs **engines,
> +		    unsigned int num_siblings,
> +		    unsigned int width)
> +{
> +	struct intel_engine_cs **siblings = NULL;
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i, j;
> +
> +	siblings = kmalloc_array(num_siblings,
> +				 sizeof(*siblings),
> +				 GFP_KERNEL);
> +	if (!siblings)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < width; ++i) {
> +		for (j = 0; j < num_siblings; ++j)
> +			siblings[j] = engines[i * num_siblings + j];
> +
> +		ce = intel_engine_create_virtual(siblings, num_siblings,
> +						 FORCE_VIRTUAL);
> +		if (!ce) {
> +			err = ERR_PTR(-ENOMEM);
> +			goto unwind;
> +		}
> +
> +		if (i == 0) {
> +			parent = ce;
> +			parent->ops = &virtual_parent_context_ops;
> +		} else {
> +			ce->ops = &virtual_child_context_ops;
> +			intel_context_bind_parent_child(parent, ce);
> +		}
> +	}
> +
> +	kfree(siblings);
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	kfree(siblings);
> +	return err;
> +}
> +
>   static bool
>   guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
>   {
> @@ -3759,7 +3848,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   }
>   
>   static struct intel_context *
> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
> +		   unsigned long flags)
>   {
>   	struct guc_virtual_engine *ve;
>   	struct intel_guc *guc;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index b1248a67b4f8..f7c19e5464ae 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1824,6 +1824,7 @@ struct drm_i915_gem_context_param {
>    * Extensions:
>    *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
>    *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
> + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
>    */
>   #define I915_CONTEXT_PARAM_ENGINES	0xa
>   
> @@ -2049,6 +2050,135 @@ struct i915_context_engines_bond {
>   	struct i915_engine_class_instance engines[N__]; \
>   } __attribute__((packed)) name__
>   
> +/**
> + * struct i915_context_engines_parallel_submit - Configure engine for
> + * parallel submission.
> + *
> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
> + * in parallel. Multiple hardware contexts are created internally in the i915 to
> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
> + * many BBs there are based on the slot's configuration. The N BBs are the last
> + * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
> + *
> + * The default placement behavior is to create implicit bonds between each
> + * context if each context maps to more than 1 physical engine (e.g. context is
> + * a virtual engine). Also we only allow contexts of same engine class and these
> + * contexts must be in logically contiguous order. Examples of the placement
> + * behavior are described below. Lastly, the default is to not allow BBs to be
> + * preempted mid-batch. Rather insert coordinated preemption points on all
> + * hardware contexts between each set of BBs. Flags could be added in the future
> + * to change both of these default behaviors.
> + *
> + * Returns -EINVAL if hardware context placement configuration is invalid or if
> + * the placement configuration isn't supported on the platform / submission
> + * interface.
> + * Returns -ENODEV if extension isn't supported on the platform / submission
> + * interface.
> + *
> + * .. code-block:: none
> + *
> + *	Examples syntax:
> + *	CS[X] = generic engine of same class, logical instance X
> + *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + *
> + *	Example 1 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=1,
> + *		     engines=CS[0],CS[1])
> + *
> + *	Results in the following valid placement:
> + *	CS[0], CS[1]
> + *
> + *	Example 2 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		     engines=CS[0],CS[2],CS[1],CS[3])
> + *
> + *	Results in the following valid placements:
> + *	CS[0], CS[1]
> + *	CS[2], CS[3]
> + *
> + *	This can be thought of as two virtual engines, each containing two
> + *	engines thereby making a 2D array. However, there are bonds tying the
> + *	entries together and placing restrictions on how they can be scheduled.
> + *	Specifically, the scheduler can choose only vertical columns from the 2D
> + *	array. That is, CS[0] is bonded to CS[1] and CS[2] to CS[3]. So if the
> + *	scheduler wants to submit to CS[0], it must also choose CS[1] and vice
> + *	versa. Same for CS[2] requires also using CS[3].
> + *	VE[0] = CS[0], CS[2]
> + *	VE[1] = CS[1], CS[3]
> + *
> + *	Example 3 pseudo code:
> + *	set_engines(INVALID)
> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		     engines=CS[0],CS[1],CS[1],CS[3])
> + *
> + *	Results in the following valid and invalid placements:
> + *	CS[0], CS[1]
> + *	CS[1], CS[3] - Not logically contiguous, return -EINVAL
> + */
> +struct i915_context_engines_parallel_submit {
> +	/**
> +	 * @base: base user extension.
> +	 */
> +	struct i915_user_extension base;
> +
> +	/**
> +	 * @engine_index: slot for parallel engine
> +	 */
> +	__u16 engine_index;
> +
> +	/**
> +	 * @width: number of contexts per parallel engine or in other words the
> +	 * number of batches in each submission
> +	 */
> +	__u16 width;
> +
> +	/**
> +	 * @num_siblings: number of siblings per context or in other words the
> +	 * number of possible placements for each submission
> +	 */
> +	__u16 num_siblings;
> +
> +	/**
> +	 * @mbz16: reserved for future use; must be zero
> +	 */
> +	__u16 mbz16;
> +
> +	/**
> +	 * @flags: all undefined flags must be zero, currently not defined flags
> +	 */
> +	__u64 flags;
> +
> +	/**
> +	 * @mbz64: reserved for future use; must be zero
> +	 */
> +	__u64 mbz64[3];
> +
> +	/**
> +	 * @engines: 2-d array of engine instances to configure parallel engine
> +	 *
> +	 * length = width (i) * num_siblings (j)
> +	 * index = j + i * num_siblings
> +	 */
> +	struct i915_engine_class_instance engines[0];
> +
> +} __packed;
> +
> +#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struct { \
> +	struct i915_user_extension base; \
> +	__u16 engine_index; \
> +	__u16 width; \
> +	__u16 num_siblings; \
> +	__u16 mbz16; \
> +	__u64 flags; \
> +	__u64 mbz64[3]; \
> +	struct i915_engine_class_instance engines[N__]; \
> +} __attribute__((packed)) name__
> +
>   /**
>    * DOC: Context Engine Map uAPI
>    *
> @@ -2108,6 +2238,7 @@ struct i915_context_param_engines {
>   	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
>   #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
>   #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>   	struct i915_engine_class_instance engines[0];
>   } __attribute__((packed));
>   

