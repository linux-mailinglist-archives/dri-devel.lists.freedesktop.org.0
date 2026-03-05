Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMYKGyUZqWk22AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 06:48:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7A20B0BA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 06:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891610EB15;
	Thu,  5 Mar 2026 05:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG0Mu4WM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6C10EB15;
 Thu,  5 Mar 2026 05:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772689698; x=1804225698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DqaP8dV2T+SUGxDdGdYO+QbCPj1MvZsW7StlBp58UJM=;
 b=WG0Mu4WMMPiBeOWhB5POWOoDCoaI9yoNiM1q0ycbdKV+Kb+4YfJST4G5
 l49udD9ibBfXFX+p866byLGl40qCFTmouiVghpJOn+u+Tf16lhoBNHGKF
 QdCYSl4qOO4//tRt0osEtAjMUaUrIMmTyYtxKUEWy8oE2TV7AHWEPUvp3
 iLN53a4BB3rwbtMIZEAQJhBQFTbC7yDqzjVC8811txXWQmomj2/p9FzVc
 4ORwoLF19GT4TMBbzeMzfjEH3SrhPYJo/JRKEygFPEWvCcQpcjstE6D1f
 V72G/+NSaIMQMuk+IU12mVUictVeWNqKO50og/3ILrHmKnSg99DaIZbl3 w==;
X-CSE-ConnectionGUID: B6P/z5yvS1SRekTWkWetDQ==
X-CSE-MsgGUID: b3+nQIs/Qm66S5J/Rm4fjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72794506"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="72794506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:48:17 -0800
X-CSE-ConnectionGUID: e996yRDXTginx/ifxSXYww==
X-CSE-MsgGUID: I+BosB8NRVicmE/epXuzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="217728571"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:48:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 21:48:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 21:48:16 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 21:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLy9D5br68nQHvF9e6sQxqv17riJ5zA0NRwzVBzdKqIl6Q/9Ysxr2Hx8unvEwqj5MH6kAlVG0n82NfHq/tf6w96kSAPwStn/wH6VTYJHTybT3gbJXAmPr13SDaRqvfzneAI1aaBaf0eBvJl9bHcAdmZZpHppNOitAkfQxBJajDCEeF88FG+IK0afYA/j/AwTMpQU+6XwnnuD9APdVC3GmntXDC8BmapkkykHdgxp6tSxuQjXK4yi2n4CSBLaR31QYVU8QuitcGshy2ndjuaLalCecoprMUshv5Qfv46XH6PjYnA78EcXcPPfpIHIDnl8pltXTkKFb4RbIiIaw6YHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUD5penfaGtujgfVDrIkjjTAoap6QEbG36SZsjkuGRY=;
 b=qwuLeQ7KYyicjaZ3f6xnIA/rgK31kW+OlrbI3rZRMcOnv6UVCBC44P0nOF9W4qeh164ppZaAJ+wdBbiO7ehObGODOz5EDdWdfcM7NoEbntcCQ5vFvPhC5wl/+UHM0uEwhnPPhrbjWnk2fOxeGxu36SNoDpK37VMK9EiTvUD5w+/f3gPpRUY8v7nV4vSRYiNMiJ/M9pbbrgy53ghJatMLxgxCFB04zq23u6AJEPb8TAaf2n8CitP0xnf2su46ItcHf1Xw8j6JkR1/04zZat36lp59QVYXD0knd5bzxnlhUUpcBK2WLmhFCeG+UUd66D7fH/Vrv2YkX/LvmExkFngjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 05:48:08 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 05:48:08 +0000
Date: Thu, 5 Mar 2026 13:47:27 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
Message-ID: <aakY72_ScpDLcytF@X299>
References: <20260227082452.1802922-1-yujie.liu@intel.com>
 <76e69151fe679658d8816dcce1011cea20633252.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76e69151fe679658d8816dcce1011cea20633252.camel@mailbox.org>
X-ClientProxiedBy: KU0P306CA0091.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:22::14) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM4PR11MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 793d61de-772a-4178-8074-08de7a7ac771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 5DvOkSi6EiY/wQY1Xt5Hfv2LYu2nyh6fA6aLlPWhSdAq/UYOZHnHd8Zbe7ZBlBB+4JJWlilEWGUXCdazMRAw8KKdCmG3hsR6CzGYAYbeNjPdtS4aJ9tYsAwc1Umoj1f9l3r6onfemqZEM9CexH5/ezBrFh+P9ejJgv1kgGNZ/X8Fqt2Bd1LbS+0Jq5EtfaejqjxpEarC87e+d36peGs3Z9emj46giqFd4LFN1NOaRUiLVv9Vy2eLBBUvYvOlKhh/dSjMiF7D8gZfWHfSsGGyFgvtt6J6gIPONrJIuoyt0M0PdQG4I9p0hAySa/W89GuSy/nt4HJGB5qo7EDajaHpjuuvY/0lT/pEXLUmulpuhSguVNkVrSLI0Xoai5hvO5JNEoVDC2/dGhSdkiiW/82zE5zXmKzqG5EWX+zvoH1WHJKq8fDfe4sv1C0uA7QaIz/j450KL1Yc6+Q41NveAl8Z/x+dzR8C3WsCwFyZIA2ehXqZ4ANU/fHN6dEo4s/2Y28g0IFM8TKsVpJkmLG4s8VURdN0Dg+IlZNsCGZHsS0Vyvow3nfotm+OuUPPHaX5IYajMxBq2FiV9ip3VC4jfMi51vqXhvEGq5uVKFwJfzb1ZJB/PTE9ZtEYHEvS+lz2/istKM9q8OLR/4XUsnHte4/wc2j7hpMo72cQ2/BfVj2zjmwYDboQ15XQo1rjkaAzF04rlao0oXa9nE26FHuLhtrZrAdUbo2HIOOa3i0BB3PWye4u9PyqalqVx7if97Y2fxEn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8393.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aDLRUzEMDMGS8/M9R721hLm8PchyOpJT32jE2F5BJmF/iGi6t7ifgsuSUP?=
 =?iso-8859-1?Q?d5YAXYGJM5e/ooQXw+EXAOBOJi7zmy+5Ke+4XQTe/KzGcGvJB+Q0gcijEL?=
 =?iso-8859-1?Q?5mH4bU2/DaO+9ePTZv4GyZ/TCa82Z+mXHln0E0D4Dhepe8P6MG2Gd9Vw9k?=
 =?iso-8859-1?Q?gD/V94VISfUx6/+GOeWquShOnpqDVxbHAwX5WizM6x5J2k8kfullE2eH7m?=
 =?iso-8859-1?Q?HAjSalq5b/ZX6Rqzxnwl/SO5ZtHIKmCsU/3dIoDlplyv970UJsCRnMG7FV?=
 =?iso-8859-1?Q?FCAHKNV22udwh/x8RHFSKNSatNNKZ/x4C9A5JdpNiIAYotZD5hYaoQ+1aP?=
 =?iso-8859-1?Q?tnhV9l4U616kAr/66On2Z+Uo/IkK7TCQHCzZz7+Y3gybF+Q7IKVt4uWOU6?=
 =?iso-8859-1?Q?vSftgGGoLSncElAxpqeL99qD3ZKXFZNqi6NGYUmOvU6aX5QcGAv9TMw3Ov?=
 =?iso-8859-1?Q?QuqeAw6FjZrILXafuYfzns7PfexyepZ2Ok2COI2doW5o6Zv7QBH4SJP3qm?=
 =?iso-8859-1?Q?c+y61Ij4v+BBwafKIjzkjZmkPB4p2IBebhxyRkRdz9ayt8SCzxO9n/6IOR?=
 =?iso-8859-1?Q?Evlp2MtWwNn5tXIVH+M1OmHRkbiQVHe1x0TNj630m4qakeXBU5FY5rnTIr?=
 =?iso-8859-1?Q?aMSojj+m5HJbcQFB7m8AEyaDKZhd4EVIlYMh43HLCmTzHaV8XQ3OynpKa2?=
 =?iso-8859-1?Q?zko4dUZbZIWiM+2s6PDJ7r6us23EgcaEaoAKpJvpcMzbbZjp5uq5wRbw57?=
 =?iso-8859-1?Q?wgy84OwcPLxkGurprkimSubB4yAOyop7lDal4xDTyZLQWGIjK8jgwu0fTp?=
 =?iso-8859-1?Q?Jsyju6z9b3V10MxXQmHxG4v0is63MbFqbGN2caEXrIcpSWORD5RKkYs+0r?=
 =?iso-8859-1?Q?ZfpRAitxHbwjGE7WA0l6aAWPeAJsxfy73JZWsEtEMbFF3y9OOgTxJwIf/h?=
 =?iso-8859-1?Q?vQXJ/CkUk3RrgNFiDzispx4FpBSbCWf3lKScHACfn0CJ+mTjJu87AUIKmI?=
 =?iso-8859-1?Q?4rqazQz7Iwx5O4a9qkYhY+YqloHi5UIhBlJM1TMYu8DtziizHG3RHfYt6D?=
 =?iso-8859-1?Q?jYTJLlFcW7F6KcnOm/CCsoV2pcZUQrkE+DvJhc+/UJOaZ6OMgXOjssIeQ3?=
 =?iso-8859-1?Q?c0ZP8AA2uiW/lYI+iErVrRi3XMJYXJyNXBsrvoX5pHYcK67oGI0OmxIhB+?=
 =?iso-8859-1?Q?litBnXbkdV0RcAlRsf7JB/yeo1yBFgqH5k5KXk0at9+EiSkZFTQ0mdY6x7?=
 =?iso-8859-1?Q?qqpxnT1nNr0jYzbPkYtbMyJzAFYntYU1OiiQQ+kzFNAOkSf+pY1B0c8vG4?=
 =?iso-8859-1?Q?KRQCQGjKOZFGjJZnSwBl5cRnPELguzz/1l7daqVBVPy/seruftC5AXyUxf?=
 =?iso-8859-1?Q?sy64AkrGhVHBTcvG0CJoWMtWpdzex4Vclvru7/nKPC1iNu33ovFflReAPK?=
 =?iso-8859-1?Q?tEs0t1VD16imIPURMIKAQgRUlCFZetomgKdE06thPpoe34xxJCkqDvn33R?=
 =?iso-8859-1?Q?SzxdScfePtuXZjTpnQDJZKKdKWrJneNzeNvnYjSfzqAauPSOX/KegALGqa?=
 =?iso-8859-1?Q?8ccArXZgycEXm273cW/uMUfgL+45LsGXfotM8/t2eeIYhoXw/LcJF9a4I/?=
 =?iso-8859-1?Q?I+kEuS9ucO1N7DyCtX3mget+hnNMzKPPT8x2GSpQcffPC1zBq+VWqRdxUv?=
 =?iso-8859-1?Q?WYZBOEbYLc9NZ0e4Low9FIhmukv/oNm8nxvasfrFBfy2Zk+oovCYKEWQjW?=
 =?iso-8859-1?Q?M/FEc4tsjmHKqvLIW6laI+uXr2u/4Dsyi6Sq1opzeqcuwnPqQmGa61WK17?=
 =?iso-8859-1?Q?UE8GdPX0HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 793d61de-772a-4178-8074-08de7a7ac771
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 05:48:08.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhExvsdsiNGlP0Nu9s+rEBeIkPlgn9qm8aQoFq3Du4362tVsjvkFDGWHBD4YxQykNxDULb90UDBdGiBPR5CZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
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
X-Rspamd-Queue-Id: BCC7A20B0BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:34:48AM +0100, Philipp Stanner wrote:
> On Fri, 2026-02-27 at 16:24 +0800, Yujie Liu wrote:
> > Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
> > 
> > Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
> > Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> 
> Pushed to drm-misc-fixes.
> 
> Thank you
> 
> P.
> 
> PS:
> for the future, scripts/get_maintainer provides a list of all recipents
> a patch should go to (two maintainers were missing). And a sentence or
> two in commit messages to describe what is being done are desirable. I
> added them for now, so no big deal. Just as a tip for the future :]

Thank you for the helpful tips. I did try scripts/get_maintainer.pl
which showed many recipients. I wasn't sure if such a minor kernel-doc
fix should be sent to so many maintainers, so I followed the same
recipient list as the commit in the "Fixes:" tag [1]. And yes I should
put some description words in commit message in addition to the plain
build warning, thanks for help adding this. I'll keep these nice tips
in mind for furture patches.

[1] https://lore.kernel.org/all/20230420115752.31470-1-christian.koenig@amd.com/

Yujie

> 
> > ---
> > Changes in v2:
> > - Split from the original patch set
> >   https://lore.kernel.org/all/20260226030038.1182961-1-yujie.liu@intel.com/
> > - Rebase onto latest drm-tip
> > 
> > Changes in v3:
> > - Change "errno" to uppercase "ERRNO" (suggested by Philipp)
> > 
> >  drivers/gpu/drm/scheduler/sched_main.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index e6ee35406165..2d5cb21a05b6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> >  /**
> >   * drm_sched_job_done - complete a job
> >   * @s_job: pointer to the job which is done
> > + * @result: 0 on success, -ERRNO on error
> >   *
> >   * Finish the job's fence and resubmit the work items.
> >   */
> 
