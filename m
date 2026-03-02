Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OcoJuHfpWkvHgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:07:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252CE1DE9E9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB0910E598;
	Mon,  2 Mar 2026 19:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjikXIlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342DE10E58F;
 Mon,  2 Mar 2026 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772478422; x=1804014422;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c6Huz2ocae9A+a3UpfEZpYH+WI5ku2M4cDoTQr9oCIY=;
 b=SjikXIlSKjYCTsX/8pcMJchUBuWa6hUbPpafVLbGp4Gxg3e5aWvQnYDY
 d5Qsy9Crk9mn7B6nFcaa3UZZVn0lklaehmUmT64NAk8hAJ0IjVmQTcgxv
 R76XrhQWi8C3xV7VeV3+HOD3tUQ7w1Em1UEvA1pYNqgkpHUHbBu+A4TCu
 u2TuLKhvBhixDKnLTW1eF8P2L4yja1mev6u7sZQwXTUyjBb6qHAIOkkA1
 8sBh3XBwazBZ+nH3nS0mUAeVfkGq+o+csuRhlvmanfZKWGdA+x09iTcfk
 4t6vOLRW385xkJxdkRn24I0bTuDG7nguGGyxwzpyXZ5nkO3k7OQ0hbEvW Q==;
X-CSE-ConnectionGUID: XIFTUoWKRTeA9nq0dwk//Q==
X-CSE-MsgGUID: 9RBEunikQXO31yun4PV7Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72697747"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="72697747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:07:02 -0800
X-CSE-ConnectionGUID: NsZvtEqKSgODWPpFUX431g==
X-CSE-MsgGUID: 4VFfxCupQki7xXx9imn0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="220792076"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:07:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:07:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 11:07:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:07:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gly4eF/zSaj0YxgENtGndmzUVOgrx1l20oGjyjWbkrdY9R6KFc9euqC60BQVS/JGOdT5M3C9XKW2XHBGSFjWBdtgZp8j95bzPbgFMbP3oWGLmu5LAtvKyylXewax7GB7N77UoGDNwHVVNFpTgrfXrAzae5LlvSuNPSD9ZC7uQT+fJKg05xt4MEk2Dd5DQhMhIsgRZq8bm+fWJS68MTGCOVgBo/Z3feTTJmAovm0q/+p9Wm8mOWbihxIKui21x3Ig19iKgOjT3CYPKQnCPUJ8Nsem26MdkToJaL/u1+uOEZt6BR2C17ubMT/Mwrd7/3xzkkxocAeWQWLtuE1afHw9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwbQX59Ziddq0e4NjIXFdBrZhniAoZBSOwoaxjq13Hw=;
 b=r9s9L7Ua+5g3jBIHGzB0QiRce2Kmp45xhXiaSj9TKOBvfzNdlCNcXWE5ckQ8XTdgskwyjVguoA901wyIc8+6CahjQVX5LQwGFhpNtvIRnygRpiYmPhIonPfVnq8h9/hkT7qJHVP6kRb9HZyB7d8ky6TlbnMZCTGTn91dgHxP6K5ZTtUc8L3KURUOZkClwMEt6/YecL5NgLlh9aaDDhe5Y0tPFlsCWEXQjxmzQlLYzK7R6f65IfbwxA10vPDc5fK9hwGEKOPxdrrm1OupvC1mJ0J+oHyRlp7hWRXONip9HYBksWJn5A9hiY1D0L/iIglz5QgpJSA62svDrcGn5RPBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 19:06:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:06:57 +0000
Date: Mon, 2 Mar 2026 11:06:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] drm/xe: Split TLB invalidation into submit and
 wait steps
Message-ID: <aaXfzrTSvRpiX8An@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302163248.105454-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 590ffd13-593d-4246-7445-08de788edfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: hoK/RApdLgWpV/2XecukokFkr6H32fqeSybAczCZXbN5rwxHO3b5zadxPrDdx4aQ27r6ZnzJ9W1pBmdV4D6H2VCHg89a5/+DpPdZ1TaqMttdK+aFurcRR9xcAmxQwjETvAaK9qfrG/X1YnFVdrKo756JjrJXguJUk17wjeU6LzDhLUaLMUAoP9dQbaTDOV/fP9sgrhx12Z9l2A5Ae0XjoddFXu+mMiV5JxWcj/ZSCeMAwS5PEht5SfXfe9r7orzdAnKAWPJ180hLF26nLIqgHaNzeXOvkynNF5AC8b54ftncd5W4tM5CToLjrMI2t6Gm2o7lNnsX6eysAS/2zyg03qQT1UMisCoV0IJLtaw28rEvRponkO5Zz7rI14AzAElm7ET/RS8hncxEEjWkaMxARapRZZdNFinZEh4xhmlvpJRfcly42s0vIXUPRX3HmJrjt60gmAaIu1SLdxE4yLcREh3HkHT9ARBplQ9AJCjT5KVtAr/+2kfwpnFhIkd5BhKz/i0qN3FT66BxEZgOPigKKijxpJDbMamH/Grzgzfp//dF70RPxO98g6U8lsPqFbK1+SQ/j39bIWdoHQvR7jXE5RPZdVcAZsI2frbfmFMMiU0udqd0OgTnisCaCW0SClabSAEPMwG8B9t5sva6VJHGx3196Q94NjEfKoChqWv/15VF7ET9u7FtiB/tSD/kEXAxz8AfoFZmTQwpD6bfETcUxWMke2oYHmessgztRnrHWOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FMohBqinsF051l1vesUPE6CNZlRJ50Z8594y3qqPx4iGLnyPxBei15FHwR?=
 =?iso-8859-1?Q?FB9Cg3SqY/fVRGYtKhcYkXrl60hU71iHV18yzb9d47G6SLFj9et78vOA8w?=
 =?iso-8859-1?Q?aHm91AMLKxpQClJ46seHeley2qY2bpXAwfW1RDi73kRL4p6XoLOoizwUdX?=
 =?iso-8859-1?Q?mH/IUYloQc27tt2NggPT7kexfGUV5Tg0St80gUy7K1kFVZjoVo5OzTlIan?=
 =?iso-8859-1?Q?5YJegJ7TCka46A61zWlICk+7l459071WKfz8tgnkNUPMNBvxa6MLZdw9ex?=
 =?iso-8859-1?Q?Lqb5xGgA88x4GW4VNfCZeWoV+txoGv7ucTJqdV2bPtOFeeRhZB76cex2Av?=
 =?iso-8859-1?Q?Cf8lhcKa+bJQDjpH2VTJ7DwsVfDpQ3uQveYvqosc9oTHarA4G9JkQRmpIn?=
 =?iso-8859-1?Q?5Q3OZ5Rxn8staBa0RkzNaSnhXDDM2DkyRVSXrdegrPm0V42yj4MmAxGmb7?=
 =?iso-8859-1?Q?4qH8azHn6tL8oCreVdIukt2IH//TCd1+5acZ6Kt8GGrTknRCHugcXDXrBY?=
 =?iso-8859-1?Q?MS7voxEODZunuFDoGfGDgUfCLRKZGUzpz0XWer9NN94gO4gz0ybrZYvHNS?=
 =?iso-8859-1?Q?d1w2j2JUAdWMmAXPnz8SIUUlHb2pl0kc/6AVDSMpkplYZKTMtkDx5cVWzz?=
 =?iso-8859-1?Q?B1UNReby+fzLdM7whsywe0uSN6iHdNg6mXKW1oreSMHGPPrOkWPBobQTuD?=
 =?iso-8859-1?Q?dHJFQoNZM6goBf4S0b++Z24SAfygmsPD8pMymMzqeY7Ortwlr9R+VOTi5h?=
 =?iso-8859-1?Q?FG6M5lrdgp8I4rrUd4KOFpZIGJPWOl9u+AQGCYoONSQkwrKhWlddYhAdaX?=
 =?iso-8859-1?Q?maAgjZJgDNIZetCiOaoaqevxCuxrMdZhAhUzHHWi6UKifNNJUQdeDjS8Ek?=
 =?iso-8859-1?Q?v8F8TiiZfnBm83JGs16hxpbZruSbwC6Ry9Re6+95zFt87o3PWDTHUHVV+i?=
 =?iso-8859-1?Q?h6D0L2vnAPvv6zkW4Ol3R9gk3bidmWJZJK2GaZB5We7bo1ZkAENXOfvacx?=
 =?iso-8859-1?Q?oi2q3Hh0hp3XtV3XR2AhjQlQgreV10oTlbn3tulJunSWD7hkQC9UiYnzjD?=
 =?iso-8859-1?Q?tLeXr6kTfX8MkuvWcYqe5lIwZP+w+Ip87pVw3rHtZblh2VxKrwl3El3Tkw?=
 =?iso-8859-1?Q?7jgv0fla6N3ZplM+mHzi2rch0FLVgstph80dHicGNen9H25S4hwmYo3jDx?=
 =?iso-8859-1?Q?FKjPTYItu+fu9ZM4mGK+QxN666YJ/Cto9DAGFYFsNCj2TIGSOh289THWHu?=
 =?iso-8859-1?Q?Gu1ZJ1zuzfV+mxrzXfgKh13fTkxkjELUy31LVt2tbz5BuHfBU8ExqiKdKj?=
 =?iso-8859-1?Q?pJbXT6PixXMuF0YFs+DHW3C0Q36x0NC8A2/hxnKvHsmdyf48jguoPMvfD6?=
 =?iso-8859-1?Q?fxBlOLc6zS/7ndVHdMU5GF6VXXbSn4fQ2W0pNdnvbCuAXNaV4qYw6e1sbl?=
 =?iso-8859-1?Q?M84PcyXT6CkXRJ91WZqzqEDL4jNUpFKgDjvO1x8YO6Z8p0mfTP+v8fy0n4?=
 =?iso-8859-1?Q?zqWN5z+OvyQmf/HF/qiy2gSHAF2+ywiNjaEDjXrYFFVixqnrSBW5ej5RuH?=
 =?iso-8859-1?Q?DYOV4URBWfoDlTKVWZriew9Df2ZHCcGTs4a0YF+PCxG+k2cypL5rJruDIX?=
 =?iso-8859-1?Q?+y22qcJxKevYac2Ei2C8+Ruv+cMWKcC7kiFFrBymdG1RjqFhKX+4ENe1gU?=
 =?iso-8859-1?Q?wj4Pu5mprkXDvasWhKBEv1piYfLwxJQDtLtITvsNJHy/NK3qwRwqGgC/q3?=
 =?iso-8859-1?Q?l60gPCRt82k2f8YbPp+DDFADZT2Nfv7erXZ+9O/MAP7zv5PaaxCg7wrcwZ?=
 =?iso-8859-1?Q?QQhbDCEtunXBAGCPpVXrIhde6kPt5t8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590ffd13-593d-4246-7445-08de788edfc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:06:56.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 354chQYwWoqP+XMddvi0VkqaYHnsdT4B69sklrR+xLQPv85jxNWBGCNebJ6M9i8iCW3ZJWeHgYZAzddMpNjj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
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
X-Rspamd-Queue-Id: 252CE1DE9E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lstrano-desk.jf.intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:32:47PM +0100, Thomas Hellström wrote:
> xe_vm_range_tilemask_tlb_inval() submits TLB invalidation requests to
> all GTs in a tile mask and then immediately waits for them to complete
> before returning. This is fine for the existing callers, but a
> subsequent patch will need to defer the wait in order to overlap TLB
> invalidations across multiple VMAs.
> 
> Introduce xe_tlb_inval_range_tilemask_submit() and
> xe_tlb_inval_batch_wait() in xe_tlb_inval.c as the submit and wait
> halves respectively. The batch of fences is carried in the new
> xe_tlb_inval_batch structure. Remove xe_vm_range_tilemask_tlb_inval()
> and convert all three call sites to the new API.
> 

Mostly nits...

> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c             |  6 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 82 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  6 ++
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 14 +++++
>  drivers/gpu/drm/xe/xe_vm.c              | 69 +++------------------
>  drivers/gpu/drm/xe/xe_vm.h              |  3 -
>  drivers/gpu/drm/xe/xe_vm_madvise.c      |  9 ++-
>  drivers/gpu/drm/xe/xe_vm_types.h        |  1 +
>  8 files changed, 123 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 002b6c22ad3f..6ea4972c2791 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -19,6 +19,7 @@
>  #include "xe_pt.h"
>  #include "xe_svm.h"
>  #include "xe_tile.h"
> +#include "xe_tlb_inval.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> @@ -225,6 +226,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  			      const struct mmu_notifier_range *mmu_range)
>  {
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> +	struct xe_tlb_inval_batch _batch;
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_range *r, *first;
>  	struct xe_tile *tile;
> @@ -276,7 +278,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  
>  	xe_device_wmb(xe);
>  
> -	err = xe_vm_range_tilemask_tlb_inval(vm, adj_start, adj_end, tile_mask);
> +	err = xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid, adj_start, adj_end,
> +						 tile_mask, &_batch);
> +	xe_tlb_inval_batch_wait(&_batch);

No need to call wait on an error but it is harmless.

So you could write it like this:

if (!WARN_ON_ONCE(err))
	xe_tlb_inval_batch_wait(&_batch);

>  	WARN_ON_ONCE(err);
>  
>  range_notifier_event_end:
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 933f30fb617d..343e37cfe715 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -486,3 +486,85 @@ bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval)
>  	guard(spinlock_irq)(&tlb_inval->pending_lock);
>  	return list_is_singular(&tlb_inval->pending_fences);
>  }
> +
> +/**
> + * xe_tlb_inval_batch_wait() - Wait for all fences in a TLB invalidation batch
> + * @batch: Batch of TLB invalidation fences to wait on
> + *
> + * Waits for every fence in @batch to signal, then resets @batch so it can be
> + * reused for a subsequent invalidation.
> + */
> +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch)
> +{
> +	struct xe_tlb_inval_fence *fence = &batch->fence[0];

Would this be better:

s/&batch->fence[0]/batch->fence

Personal preference I guess.

> +	unsigned int i;
> +
> +	for (i = 0; i < batch->num_fences; ++i)
> +		xe_tlb_inval_fence_wait(fence++);
> +
> +	batch->num_fences = 0;
> +}
> +
> +/**
> + * xe_tlb_inval_range_tilemask_submit() - Submit TLB invalidations for an
> + * address range on a tile mask
> + * @xe: The xe device
> + * @asid: Address space ID
> + * @start: start address
> + * @end: end address
> + * @tile_mask: mask for which gt's issue tlb invalidation
> + * @batch: Batch of tlb invalidate fences
> + *
> + * Issue a range based TLB invalidation for gt's in tilemask
> + *

Mention no need to wait on batch if this function returns an error?

> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
> +				       u64 start, u64 end, u8 tile_mask,
> +				       struct xe_tlb_inval_batch *batch)
> +{
> +	struct xe_tlb_inval_fence *fence = &batch->fence[0];
> +	struct xe_tile *tile;
> +	u32 fence_id = 0;
> +	u8 id;
> +	int err;
> +
> +	batch->num_fences = 0;
> +	if (!tile_mask)
> +		return 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		if (!(tile_mask & BIT(id)))
> +			continue;
> +
> +		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
> +					&fence[fence_id], true);
> +
> +		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> +					 &fence[fence_id], start, end,
> +					 asid, NULL);
> +		if (err)
> +			goto wait;
> +		++fence_id;
> +
> +		if (!tile->media_gt)
> +			continue;
> +
> +		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
> +					&fence[fence_id], true);
> +
> +		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> +					 &fence[fence_id], start, end,
> +					 asid, NULL);
> +		if (err)
> +			goto wait;
> +		++fence_id;
> +	}
> +
> +wait:
> +	batch->num_fences = fence_id;

Should 'batch->num_fences' only get set on success?

> +	if (err)
> +		xe_tlb_inval_batch_wait(batch);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 62089254fa23..a76b7823a5f2 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -45,4 +45,10 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno);
>  
>  bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
>  
> +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32 asid,
> +				       u64 start, u64 end, u8 tile_mask,
> +				       struct xe_tlb_inval_batch *batch);
> +
> +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch);
> +
>  #endif	/* _XE_TLB_INVAL_ */
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 3b089f90f002..3d1797d186fd 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/dma-fence.h>
>  
> +#include "xe_device_types.h"
> +
>  struct drm_suballoc;
>  struct xe_tlb_inval;
>  
> @@ -132,4 +134,16 @@ struct xe_tlb_inval_fence {
>  	ktime_t inval_time;
>  };
>  
> +/**
> + * struct xe_tlb_inval_batch - Batch of TLB invalidation fences
> + *
> + * Holds one fence per GT covered by a TLB invalidation request.
> + */
> +struct xe_tlb_inval_batch {
> +	/** @fence: per-GT TLB invalidation fences */
> +	struct xe_tlb_inval_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	/** @num_fences: number of valid entries in @fence */
> +	unsigned int num_fences;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 548b0769b3ef..7f29d2b2972d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3966,66 +3966,6 @@ void xe_vm_unlock(struct xe_vm *vm)
>  	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
> -/**
> - * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on this tilemask for an
> - * address range
> - * @vm: The VM
> - * @start: start address
> - * @end: end address
> - * @tile_mask: mask for which gt's issue tlb invalidation
> - *
> - * Issue a range based TLB invalidation for gt's in tilemask
> - *
> - * Returns 0 for success, negative error code otherwise.
> - */
> -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> -				   u64 end, u8 tile_mask)
> -{
> -	struct xe_tlb_inval_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> -	struct xe_tile *tile;
> -	u32 fence_id = 0;
> -	u8 id;
> -	int err;
> -
> -	if (!tile_mask)
> -		return 0;
> -
> -	for_each_tile(tile, vm->xe, id) {
> -		if (!(tile_mask & BIT(id)))
> -			continue;
> -
> -		xe_tlb_inval_fence_init(&tile->primary_gt->tlb_inval,
> -					&fence[fence_id], true);
> -
> -		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> -					 &fence[fence_id], start, end,
> -					 vm->usm.asid, NULL);
> -		if (err)
> -			goto wait;
> -		++fence_id;
> -
> -		if (!tile->media_gt)
> -			continue;
> -
> -		xe_tlb_inval_fence_init(&tile->media_gt->tlb_inval,
> -					&fence[fence_id], true);
> -
> -		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> -					 &fence[fence_id], start, end,
> -					 vm->usm.asid, NULL);
> -		if (err)
> -			goto wait;
> -		++fence_id;
> -	}
> -
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_tlb_inval_fence_wait(&fence[id]);
> -
> -	return err;
> -}
> -
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> @@ -4040,6 +3980,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_tlb_inval_batch _batch;

Why not just 'batch'?

>  	struct xe_tile *tile;
>  	u8 tile_mask = 0;
>  	int ret = 0;
> @@ -4080,12 +4021,16 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	xe_device_wmb(xe);
>  
> -	ret = xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma), xe_vma_start(vma),
> -					     xe_vma_end(vma), tile_mask);
> +	ret = xe_tlb_inval_range_tilemask_submit(xe, xe_vma_vm(vma)->usm.asid,
> +						 xe_vma_start(vma), xe_vma_end(vma),
> +						 tile_mask, &_batch);
>  
>  	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
>  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
>  
> +	if (!ret)
> +		xe_tlb_inval_batch_wait(&_batch);
> +

Here we skip the wait on error, hence my suggestion to skip waits in
other code paths or at a minimum make call sematics consistent. 

>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f849e369432b..62f4b6fec0bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -240,9 +240,6 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  				     struct xe_svm_range *range);
>  
> -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> -				   u64 end, u8 tile_mask);
> -
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  int xe_vm_validate_protected(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 95bf53cc29e3..39717026e84f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -12,6 +12,7 @@
>  #include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_tlb_inval.h"
>  
>  struct xe_vmas_in_madvise_range {
>  	u64 addr;
> @@ -235,13 +236,19 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>  {
>  	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
> +	struct xe_tlb_inval_batch batch;
> +	int err;
>  
>  	if (!tile_mask)
>  		return 0;
>  
>  	xe_device_wmb(vm->xe);
>  
> -	return xe_vm_range_tilemask_tlb_inval(vm, start, end, tile_mask);
> +	err = xe_tlb_inval_range_tilemask_submit(vm->xe, vm->usm.asid, start, end,
> +						 tile_mask, &batch);
> +	xe_tlb_inval_batch_wait(&batch);

No need to wait on error.

> +
> +	return err;
>  }
>  
>  static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1f6f7e30e751..de6544165cfa 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_device_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_range_fence.h"
> +#include "xe_tlb_inval_types.h"
>  #include "xe_userptr.h"
>  
>  struct drm_pagemap;
> -- 
> 2.53.0
> 
