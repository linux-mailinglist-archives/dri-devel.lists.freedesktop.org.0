Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED43C75FB4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 19:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962610E7CD;
	Thu, 20 Nov 2025 18:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPQbr3tE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5C10E7CB;
 Thu, 20 Nov 2025 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763664809; x=1795200809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B/bFJ/vLvK2oUiP9y+0/s29GVRpQLNTeGbn1pmZEX1o=;
 b=TPQbr3tEMaAW3XNKdIGIRNukS7OOUnXtk7MWPkEWcNY/55yQThzXtt8S
 +QQPKUprXlmXsf2A1x+aoJmtmVfuFhnpE3/+9vOToW4t3J2TiGTOq84Db
 dH6Z+5/N1yubnI0slKnA2Jq+nDGgdgVASKahsg1X7DswJapw4Ey+TghEN
 GybLfnWt+JVEluanxHRRBQOPCMconSurYyTs1c8yblQf3+IIxussL00bG
 B7k/NSMWOHibDNsGeVHVjYBKVPtuQwDs1Rj8cKhEGHpNiu0lJeDRQBXJW
 vPOXDPiSNiA/UcXX9NpeyVCknBn1vQzhvQXsfyHbCVBcXMAaF7Xm15Yio w==;
X-CSE-ConnectionGUID: RhOBeKq0TbWfftxWohNhQQ==
X-CSE-MsgGUID: 9uTpCwwATA2JPIqM7MMJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65680107"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65680107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:53:28 -0800
X-CSE-ConnectionGUID: 0hjYj6idTd+OqTvzZKpGsA==
X-CSE-MsgGUID: wL6V58vATjSYlhl1C/eWYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196592614"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:53:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:53:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 10:53:27 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwWQ2NZvZPNObwH6iAzgZO4ASem37DiPeODllwfbCmTh93qoZZjCoEFG9oziJsXlAOfcE6ToBTr4qlqE+rYghf6iV6uUg78Xkg8XIbX1ft+VwBkTLfQrMI6FPTYqfmKhvCxmCTtDMqURVt6exI4nrIG2LeHEEWRxoN9DY4kTH0ZMGsJ0+Tvruxfjuj8pPFS6IpfGiEuixnHUJMXbC8DRvxPG+ueO0QFRFbeb3CZ12LG7GB4FcAMMNKlLmXliO8pq1vjx/ciJX8BdhhJJbAbyr+zEdpuow0kBjeCWNbjtTD7XSiP2GLm7cRpHaQCK+4l5iIkzkSeNFMBna7rVih0wVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6S6S3URoVr4e9aeWtQ0HJcWVXgV6cm1egj4DlI7+aI=;
 b=TDTvOpJZk67K7qavlHMurM2O1lmpQiHjgYiha5N5KsUgJe+TTir++nfdhT8oWtr2NE//tzEuWzpl5GQVo/lXnXGlDo4yxpQXLEOJQ5xnKBXnUB+zPzn5B+smvR9aDCx51c3fQak+epqkMgul4/lkr+ygkpXwVTrMHBSqAXaMwGN2GzsiXZ9q5QHfYM7ozUyznMoK7/SSQ2PGJFebK9RIwv7X5Y8eOnMo9JS65preQPoLaJkoE4p6df47RVO4qtWqkdtpx5IBppudob4K/+29JAg+iwoXVhWhSJlfMTauzBMJ56/ZCLeoBGkM/jbk/YoSRhtC12cqGQ2IPgk9uR3bcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 18:53:18 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 18:53:16 +0000
Date: Thu, 20 Nov 2025 10:53:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 7/8] drm/xe: Remove special casing for LR queues in
 submission
Message-ID: <aR9jmI17paRzlhmg@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-8-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5399e40e-3c8d-4208-59fa-08de28660fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r4WORCY1BsiQnAU2i04iIEpwba5N63EHccM6WFLu2xLA+ALscKqXkkuSbbEM?=
 =?us-ascii?Q?nlsL2R+ytUj2amxvfal5PnQva0h05oH+cJbKRB/hm2wqKDizpRcMN8oT0RqL?=
 =?us-ascii?Q?3QxKpuarXELV+dpCQWy34Nm5VcHlUcy0r3jWuybO75aWRY0/lLu38/64CcXd?=
 =?us-ascii?Q?DhqorIQO6j9CK5MUUr7hBhqRiX3x3MMp5gonGltfHry+fGgQZr+r+XDSEJhd?=
 =?us-ascii?Q?EGz5HL8xxkPL7LYzHXXm5cUaC4UEuyBLcBVB5wL++MKl2zNktUF79J/bw77p?=
 =?us-ascii?Q?eODMz/PJSByNXyq/Or7eMOhhyTNRMyUKNJg7+es2MfPz1oV+qhFJlVmZx7Nn?=
 =?us-ascii?Q?kcK8k4aFWbmEiyy82VoQfwjpD98taad/QqC94lvBBgiQx+HMuFWFrCwvDqBv?=
 =?us-ascii?Q?IjrfK7atvsdu29SzFjyRoC4D3DOxpZ74R8mMqOi5kW93VFzNFDMnTp/jp3SL?=
 =?us-ascii?Q?464fG/rMud6HC/90wlsxUKfGxrpBGj68sV3xrgifDS9tVH1CEj56VSyoqX79?=
 =?us-ascii?Q?0NeioxD2ANtQMdkI7revxDOa+7RRPznH20ceNoWpnmsmb0cqVdMNVUDccsVM?=
 =?us-ascii?Q?O+PTXXGFv4YFna77Ps2uKrMUPOMczlKlkfkAmRZHS/27xPpCQEXcDxbA7kxY?=
 =?us-ascii?Q?DI6rJH6HbtqYEeTcBEFdLlYWF4RWrk6YbpWDGHHXSFKOAO2iQH7nghSDSNaL?=
 =?us-ascii?Q?6sNMUgk+inOvT+wrUef2ZbtGRdnB1SLtDlugUdklD8jGSGMc8zKTeCfGexKZ?=
 =?us-ascii?Q?n/CzFWegdi375TrrkG+cl7VZQyNmAESod4Uh1311juJTyxZQZn0A2oPxC76g?=
 =?us-ascii?Q?X5IzTwoSlNbGLDa+y0D1XOmJZQJf/m3RX2F7Y3bWUHK7wRpsfQIbrm9/5gTS?=
 =?us-ascii?Q?EEB/SEfeVQFJqQeEbQYK8mKF3U2bkEazxDF+wwTOCIY8UAnPhh7/7/2RbukL?=
 =?us-ascii?Q?OVm/eWH1PdooJdcl+PWDZYrItCNKPGfx22+IK50JDJOttXLeQNMM7Z3ldGHw?=
 =?us-ascii?Q?ZiuvxJjl1vNJ+Fw95agOBOQvwXBZ18Bf9q5luHwcGgk2nNDH0TDk1R/Iiu0C?=
 =?us-ascii?Q?+p+JAMj+jNJuDBtqpmla7n0q4jqMjIvoxk9gE9itf4lvppu9jRCn9kiRMVJo?=
 =?us-ascii?Q?RzYQJ5fLvz3czXaIU2/3E8h1RAkOvbsXdrKrEm5UHn43L9mNvcy5PdY0vQk0?=
 =?us-ascii?Q?mpKJ3GP9+roQTSSuTqUeo8jAXoEATAZ4uCQFWzLyUnQb2ujmAqTVND+1jjuP?=
 =?us-ascii?Q?TGYSH7y+oUxxJnS0c7lPAw2wz51dIWs1JtW8EyFMow8Y9IFTt8HDXtDHD9j7?=
 =?us-ascii?Q?Vgq7TtyI+lbiODZm9XgeVYe8XTeXkD6t10LEE8FNVHJo10EIn58jWAkYADDL?=
 =?us-ascii?Q?TMB3nXVUB3j3+61d9XodV+P5VhbhItGR6exMpTIZrSY11DID6WfLQB/8toVU?=
 =?us-ascii?Q?YVDfNCTJYeXFwotrdu7R/WEe5ugAvWLu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2SJEmltRtOANhT1qj+gmh7+B4tO138t0PycDayBB28RuImnbj/mvRsrm4Wqs?=
 =?us-ascii?Q?/YQxuS/RwThhw+eHZBROBZSrrno+czgDeQfhzj7Lw7wymGnSNspMj2Ib/oY/?=
 =?us-ascii?Q?n7v6hVzHhVUJUZwJBHFwj2ECwdb/o/tuIdjS/2azdmooPJ7cAT3ULhw/larb?=
 =?us-ascii?Q?qacb9sKWstQuynOX5rMKZPapGv0Vk6lFJaWt/6zfTAdTO0fx6cLfuaNKSBpn?=
 =?us-ascii?Q?OIOqjUdrRslNV6ZNVEo8E9HsVxqmciQE23+90vwsLvOvtJhFh0cXzSWWCqLE?=
 =?us-ascii?Q?Mw3uTUF6QP+Do+8ZYJHDFCWtFcsugrNAyVL2L7Fkg65fmJRnx5V5/nI+urq1?=
 =?us-ascii?Q?kTM1ZMtSFm/qBVAAfrAWLrQTSSz0VV/nRkcftR6XwaMgjP0dEqib/zblnjf0?=
 =?us-ascii?Q?zDmM67g0QcEbSczFkleMXmZEE8d0E2PFjMg2bWOwpbztksgClTN8jQTSdCP2?=
 =?us-ascii?Q?9dB/UgKz7Md36rhGYGUkYX6UlcVzwyaUTtLvCeeOkVLPj8zaNtkwL3AYO4+z?=
 =?us-ascii?Q?00+GSSeixi0XFj1Fu/5f7jX3nUVWZ6j2JbCYEo5VsuQGX16Zse2CeCCPRKdc?=
 =?us-ascii?Q?ZO568s83g9DJzRRa7YD02sHw2Dk1CNjvHiqeXZ7ek+SmuU+Y9ab9kNHcPzvy?=
 =?us-ascii?Q?IPcP9Nh33tSKRc3v+5zdGxl5S5eSL73SNVVOZtKuFT4nH1W7gFNJqQBVrUGZ?=
 =?us-ascii?Q?ZYRqhEo60pDV0F4goX1a5CewOCHre6fbKK5XkFHf9PWEUWI4RXQhGa0O++WD?=
 =?us-ascii?Q?cVQtlQxwMOxAXtb9ksDb/zcWWOMUarhgvVjM4MkddRN793OkcL7zi8fzxSdz?=
 =?us-ascii?Q?3N5w2XyCCzK70sIFg8nBBc6bCSqqIKS1q2yQStg3SyXvr2pNSXADQbTn3+CO?=
 =?us-ascii?Q?az/N4UhF6sDVfx2nO6TCzpjNMmfGDem6XaSMnO/QTT1eaM+3/dCF2iPp4k1P?=
 =?us-ascii?Q?jmpvR2XcMqPvSORmTEmSc7/AqK4GTkvK7OCAbr5DACfS6l10x0cpA1kqSFQW?=
 =?us-ascii?Q?U99B2huZaQYOEoPTcIXEbOsXbaUNz98WabsqZxmFnQDhCOmKHb4P5cLeUVU4?=
 =?us-ascii?Q?YdDAMasorzb9Fr6Aclw0UtmJa9kUpckyfh5KzykS8LoYWeCzvR9liSNO+Knn?=
 =?us-ascii?Q?fmuZEztz97fGYJ3bBW42ot8BxY3ej664dj7jvHgBjV5FaKgyDKNs7PTeNZQw?=
 =?us-ascii?Q?TUkQeT4Et+X00/hCMz6MhCRt22Qo5nii3KnozbbfNYtPQRVDFd2uXZjLKri9?=
 =?us-ascii?Q?jtaOEEuTv1ZrOl9ingUFO5rGfwPHTQrovn9rLT2NWIt73lcWM8sUUk/Jgxht?=
 =?us-ascii?Q?ihFVwJFLvmED1u7MUMgioeIIpdTFVvKFcg4i7Mnqpup/Tyt2oTkqUA2rfPeu?=
 =?us-ascii?Q?D+JjNQLBLSt5HFyB1bBg9DtSLVWGt6NrGk5ltU8TKU0JB/n2vRaDM+H6oTW0?=
 =?us-ascii?Q?xtmWjb8Z0JpLQoE7rLFU+9BcXlLftT9c5NBHItFMsY/WQjAr/p6BE8hEzkUE?=
 =?us-ascii?Q?OMprF3gbm2VMnnI/L9GZQPNuEf8RwXOVmR0x8Pr0ygust4TA0oZdX8DINBzM?=
 =?us-ascii?Q?Ulpk9QLRQ6Ew3LQMP50TO2fp+y5CLYdTn08uuXOFateBO3v0bncCnFUBV0+1?=
 =?us-ascii?Q?H9NCBaA4AHLQFOSMXgyRd/0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399e40e-3c8d-4208-59fa-08de28660fd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:53:16.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isCjTtL/ydJYH38vU8ULwqhpqVq7AztdoYcYtPoXhOHpJwxf8cmldf51MjFi/nGcR7zWHUUCT3CQkL1Jbsy/DYzhTkh6DgtodOCdYERlzlGIl25KIxphKHtObXIvaBJp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Wed, Nov 19, 2025 at 02:41:05PM -0800, Matthew Brost wrote:
>Now that LR jobs are tracked by the DRM scheduler, there's no longer a
>need to special-case LR queues. This change removes all LR
>queue-specific handling, including dedicated TDR logic, reference
>counting schemes, and other related mechanisms.
>
>v4:
> - Remove xe_exec_queue_lr_cleanup tracepoint (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
> drivers/gpu/drm/xe/xe_guc_submit.c           | 132 ++-----------------
> drivers/gpu/drm/xe/xe_trace.h                |   5 -
> 3 files changed, 11 insertions(+), 128 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index a3b034e4b205..fd0915ed8eb1 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -33,8 +33,6 @@ struct xe_guc_exec_queue {
> 	 */
> #define MAX_STATIC_MSG_TYPE	3
> 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>-	/** @lr_tdr: long running TDR worker */
>-	struct work_struct lr_tdr;
> 	/** @destroy_async: do final destroy async from this worker */
> 	struct work_struct destroy_async;
> 	/** @resume_time: time of last resume */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 5de300b66767..1f2afad1766e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -674,14 +674,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> 	}
>
>-	/*
>-	 * We must keep a reference for LR engines if engine is registered with
>-	 * the GuC as jobs signal immediately and can't destroy an engine if the
>-	 * GuC has a reference to it.
>-	 */
>-	if (xe_exec_queue_is_lr(q))
>-		xe_exec_queue_get(q);
>-
> 	set_exec_queue_registered(q);
> 	trace_xe_exec_queue_register(q);
> 	if (xe_exec_queue_is_parallel(q))
>@@ -854,7 +846,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> 	struct xe_exec_queue *q = job->q;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>-	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
>+	bool killed_or_banned_or_wedged =
> 		exec_queue_killed_or_banned_or_wedged(q);
>
> 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>@@ -871,15 +863,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> 		job->skip_emit = false;
> 	}
>
>-	/*
>-	 * We don't care about job-fence ordering in LR VMs because these fences
>-	 * are never exported; they are used solely to keep jobs on the pending
>-	 * list. Once a queue enters an error state, there's no need to track
>-	 * them.
>-	 */
>-	if (killed_or_banned_or_wedged && lr)
>-		xe_sched_job_set_error(job, -ECANCELED);
>-
> 	return job->fence;
> }
>
>@@ -923,8 +906,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> 		xe_sched_submission_start(sched);
> 		xe_gt_reset_async(q->gt);
>-		if (!xe_exec_queue_is_lr(q))
>-			xe_sched_tdr_queue_imm(sched);
>+		xe_sched_tdr_queue_imm(sched);
> 		return;
> 	}
>
>@@ -950,10 +932,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> 	wake_up_all(&xe->ufence_wq);
>
>-	if (xe_exec_queue_is_lr(q))
>-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>-	else
>-		xe_sched_tdr_queue_imm(&q->guc->sched);
>+	xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
> /**
>@@ -1009,78 +988,6 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> 	return true;
> }
>
>-static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>-{
>-	struct xe_guc_exec_queue *ge =
>-		container_of(w, struct xe_guc_exec_queue, lr_tdr);
>-	struct xe_exec_queue *q = ge->q;
>-	struct xe_guc *guc = exec_queue_to_guc(q);
>-	struct xe_gpu_scheduler *sched = &ge->sched;
>-	struct drm_sched_job *job;
>-	bool wedged = false;
>-
>-	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>-
>-	if (vf_recovery(guc))
>-		return;
>-
>-	trace_xe_exec_queue_lr_cleanup(q);
>-
>-	if (!exec_queue_killed(q))
>-		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>-
>-	/* Kill the run_job / process_msg entry points */
>-	xe_sched_submission_stop(sched);
>-
>-	/*
>-	 * Engine state now mostly stable, disable scheduling / deregister if
>-	 * needed. This cleanup routine might be called multiple times, where
>-	 * the actual async engine deregister drops the final engine ref.
>-	 * Calling disable_scheduling_deregister will mark the engine as
>-	 * destroyed and fire off the CT requests to disable scheduling /
>-	 * deregister, which we only want to do once. We also don't want to mark
>-	 * the engine as pending_disable again as this may race with the
>-	 * xe_guc_deregister_done_handler() which treats it as an unexpected
>-	 * state.
>-	 */
>-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>-		struct xe_guc *guc = exec_queue_to_guc(q);
>-		int ret;
>-
>-		set_exec_queue_banned(q);
>-		disable_scheduling_deregister(guc, q);
>-
>-		/*
>-		 * Must wait for scheduling to be disabled before signalling
>-		 * any fences, if GT broken the GT reset code should signal us.
>-		 */
>-		ret = wait_event_timeout(guc->ct.wq,
>-					 !exec_queue_pending_disable(q) ||
>-					 xe_guc_read_stopped(guc) ||
>-					 vf_recovery(guc), HZ * 5);
>-		if (vf_recovery(guc))
>-			return;
>-
>-		if (!ret) {
>-			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>-				   q->guc->id);
>-			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>-				       q->guc->id);
>-			xe_sched_submission_start(sched);
>-			xe_gt_reset_async(q->gt);
>-			return;
>-		}
>-	}
>-
>-	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>-		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>-
>-	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>-		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
>-
>-	xe_sched_submission_start(sched);
>-}
>-
> #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>
> static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>@@ -1150,8 +1057,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
> 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> 		set_exec_queue_banned(q);
> 		xe_gt_reset_async(q->gt);
>-		if (!xe_exec_queue_is_lr(q))
>-			xe_sched_tdr_queue_imm(&q->guc->sched);
>+		xe_sched_tdr_queue_imm(&q->guc->sched);
> 	}
> }
>
>@@ -1189,7 +1095,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	pid_t pid = -1;
> 	bool wedged = false, skip_timeout_check;
>
>-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>
> 	/*
>@@ -1209,6 +1114,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	skip_timeout_check = exec_queue_reset(q) ||
> 		exec_queue_killed_or_banned_or_wedged(q);
>
>+	/* LR jobs can only get here if queue has been killed or hit an error */
>+	if (xe_exec_queue_is_lr(q))
>+		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
>+
> 	/*
> 	 * If devcoredump not captured and GuC capture for the job is not ready
> 	 * do manual capture first and decide later if we need to use it
>@@ -1400,8 +1309,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
> 	xe_pm_runtime_get(guc_to_xe(guc));
> 	trace_xe_exec_queue_destroy(q);
>
>-	if (xe_exec_queue_is_lr(q))
>-		cancel_work_sync(&ge->lr_tdr);
> 	/* Confirm no work left behind accessing device structures */
> 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>
>@@ -1634,9 +1541,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> 	if (err)
> 		goto err_sched;
>
>-	if (xe_exec_queue_is_lr(q))
>-		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
>-
> 	mutex_lock(&guc->submission_state.lock);
>
> 	err = alloc_guc_id(guc, q);
>@@ -1890,9 +1794,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Clean up lost G2H + reset engine state */
> 	if (exec_queue_registered(q)) {
>-		if (xe_exec_queue_is_lr(q))
>-			xe_exec_queue_put(q);
>-		else if (exec_queue_destroyed(q))
>+		if (exec_queue_destroyed(q))
> 			__guc_exec_queue_destroy(guc, q);
> 	}
> 	if (q->guc->suspend_pending) {
>@@ -1922,9 +1824,6 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> 				trace_xe_sched_job_ban(job);
> 				ban = true;
> 			}
>-		} else if (xe_exec_queue_is_lr(q) &&
>-			   !xe_lrc_ring_is_idle(q->lrc[0])) {
>-			ban = true;
> 		}
>
> 		if (ban) {
>@@ -2007,8 +1906,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 	if (pending_enable && !pending_resume &&
> 	    !exec_queue_pending_tdr_exit(q)) {
> 		clear_exec_queue_registered(q);
>-		if (xe_exec_queue_is_lr(q))
>-			xe_exec_queue_put(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2065,10 +1962,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Stop scheduling + flush any DRM scheduler operations */
> 	xe_sched_submission_stop(sched);
>-	if (xe_exec_queue_is_lr(q))
>-		cancel_work_sync(&q->guc->lr_tdr);
>-	else
>-		cancel_delayed_work_sync(&sched->base.work_tdr);
>+	cancel_delayed_work_sync(&sched->base.work_tdr);
>
> 	guc_exec_queue_revert_pending_state_change(guc, q);
>
>@@ -2440,11 +2334,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> 	trace_xe_exec_queue_deregister_done(q);
>
> 	clear_exec_queue_registered(q);
>-
>-	if (xe_exec_queue_is_lr(q))
>-		xe_exec_queue_put(q);
>-	else
>-		__guc_exec_queue_destroy(guc, q);
>+	__guc_exec_queue_destroy(guc, q);
> }
>
> int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 79a97b086cb2..cf2ef70fb7ce 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -182,11 +182,6 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_resubmit,
> 	     TP_ARGS(q)
> );
>
>-DEFINE_EVENT(xe_exec_queue, xe_exec_queue_lr_cleanup,
>-	     TP_PROTO(struct xe_exec_queue *q),
>-	     TP_ARGS(q)
>-);
>-
> DECLARE_EVENT_CLASS(xe_sched_job,
> 		    TP_PROTO(struct xe_sched_job *job),
> 		    TP_ARGS(job),
>-- 
>2.34.1
>
