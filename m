Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAdzHpGvqWn/CQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:30:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A42156F5
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590D110EC68;
	Thu,  5 Mar 2026 16:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/eCiKu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6C10EC4C;
 Thu,  5 Mar 2026 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772728203; x=1804264203;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=a7wAQXh2cetdgFAuwjuztcmPZfzRS457ue7Ox258YBc=;
 b=I/eCiKu6B1vwcI+dWU2xfMg/7HIyuQEZzgZgJOFJIVwcgGOP6Sbd0fCb
 ITQU9WtyslwqsycQEEvrOaX84lO9LWppFq7FFpwd0N2NWt1uHWVafheY6
 +WCpjj9v41ua9FRZGsjiPIYspJDETYX9tK26ymQZT3LZdh2ASIw3p8MHH
 E8OB9snGZiRkD2aXTsWy0geimqP1EgJuQ93ay0OwgOWGXdYvjrIvmluj1
 dGSUm4mR1R3JJ1vGMnjEptyr535HiT/mdW//rTlh9qNT6JLB0XTBtJ8CZ
 h+V6Tk7WTv5xxOR1ii/Z7Kd0GKk+Z21ySJS1ORABMlO9OylQKEw5ucgFs A==;
X-CSE-ConnectionGUID: gQUpRTsmQUyvDQ9dHt3V0A==
X-CSE-MsgGUID: xJ3C9xGERNGpjsh9Sgb6ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73868939"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73868939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:30:02 -0800
X-CSE-ConnectionGUID: T0T31wa9RSOVjpwWqwHsmg==
X-CSE-MsgGUID: SHTXabNdSoWfxOHaD/Bmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="217971169"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:30:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 08:30:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 08:30:02 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 08:30:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umkWe1y4jVrAJF+D1kN46YumFFCF0WnkWEcxzG5VDswqZuDqtc37S7u92+ayBInLXqvuSPIYwFs+B8eek4kHqyYCfx006WqzmtR4bDSjOpv/tucG46i3XTDcv3LZ1YQkHq9ZDDHpK4MMjezr3WWDIiBn4mogMDwAAEou9d32vRbaN4wywwpMfRyZ0B+WnYRhFAWDWk87N4hOjjTgUgnrUq5j6c/8SGEaubG+RqYoPcT6LOdrUyNL+46Zuv4F8/QHlvA9YQJCOpDjCaCJKCTKpmzR8bq5IYvOBADrk83ksV63Vab3SnE4m6dLyS1OLvAiuUJ5h8FLPNyh1tJ/KijZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5ISwXGjOM2Jl3dz4NGD8XgHNNENlXQ20ZCifh4TnsY=;
 b=dUGk0eCoF5jJCQPMXtZGjRfV/gg9NUy9EsLDuYbZ8HxJNIlHPnB03G604SRFKOJFngIUodzDUcjAtW1ejWFmqb7Yc4opwqVgw4oiUM6g6mfgaEvuKqTmyZi45t98mcbFAasAnPG9E/ImKT1W7UIRq4Iu1hFBIzA+jg9/dwmpy0n97kCAsET7U87UNfPedSeohRWz9l2BWozFvvXU28MjuHWCUfeed7Xd0jrZnnjKnptX+01gaQOu70N50ePReDq7vBSY+CAJ8CNvyO57uo9OrYf9qz1DMLq2I+8k8eVBXAYVkv6v/XluPqlolGF9MKSuMgQDlNSLKGZVCP/JY3HGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Thu, 5 Mar
 2026 16:29:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523%5]) with mapi id 15.20.9654.015; Thu, 5 Mar 2026
 16:29:59 +0000
Date: Thu, 5 Mar 2026 18:29:52 +0200
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/4] drm/display/dp: Read LTTPR caps without DPRX caps
Message-ID: <aamvgGUPH-SWA7Yh@ideak-desk.lan>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV2PEPF0002399B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::18d) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 22097858-4613-4de8-843d-08de7ad47192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: dvPjZc6R69Tt42vuIuvNsNi2vgdhhBKLj4qvVRdi/e3tXsHva8McKcGAuYtxi+JjCNX7XWTdqoRoh+rUVhE6mzAX4d5ltZyICjImTokQUGpdnCsG3pEeD48pM1Aw8gMDMouiVh1NCwCMPOrKrSY0SyL1xeJ3Gy+Dej/nhO/GuXUyIDvVzdi/aEjE4RBXVPQMzkoaOQKOUUK26nZ7R0Zk81eQncj64ZYonCGg+kGYERBShevvMf0VZtfgU01KKORwbHYzHPa+t1l6n5TIkbyUJotFCURTElpG82KdZYfIczazySIi5Hq/gmnkWp7Ky3ePmHWcRoFHRZ8ydAiTeCzxXCJ3+9iDB8cG1hEroI++adsB/xx5bwW2Z7YoTBvnegGNV+hR41NxbP0NKjh1V5Jm9PsI7F1nI0r8cnEjB54LfXi2uvd6t5Yu0mSPIRdPQSO9fP8in4IFKARd+TFF1TTznthSw546qc8E8mmvR0mrmSiQY1/KtSQSJ7+I24sngi+ez+r/3yh+DReFV51CSwGdY+ZgKpzWOGmdfX48sx4exY7XTPp0VFiCgHGWrpcGBY8hanUsikewLr1Yoo5SgGSLvwZ94jqRHcPumYLMBm+EFtulun7e6FeQfvLeQ8OPR4joxILd58LqXc49VW5LT2O+OsXnTTW88q8h+RxFMx11kiEtqSUeG6B2bM7aflrkPSDg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AN6yELRjG3aewlmUKfh2OrDxPPcy44yImlAkLzoP7aN36ifK3dgyR1gU2tzD?=
 =?us-ascii?Q?hc+NC/cKdiIbBqkrkOL9nyBsdY1/ZLyw1etEyV/cbonw4gIY1/bJAQIEdKwb?=
 =?us-ascii?Q?e5QlY/E/Gk7+IAnSErfbixBRJxpUmBo803nEbCHm2SrFn6sYhT/lgIkoG3Ky?=
 =?us-ascii?Q?pzmsRo1ngF3cr3R2genb4KoBRHi9xFkBhwJL5CsVuqqqQ14dO03YkaS3T2Fa?=
 =?us-ascii?Q?IZHMKM3c2rNPVL/g1GeKmxqex/EAh03jZ1lJWUVy8i3PaisD9V7+SM1gTenE?=
 =?us-ascii?Q?gVJ4eLLc+AnB9BFCCmCN++Gjy/N23sBlTMRhde3UwyF6tpFn76h3MV7reMmb?=
 =?us-ascii?Q?C/kl+9s138pR2NvBGOpulmxmf1L3FSWJXDTBqcN4IYkH9h5bDfnbbcYDJmh5?=
 =?us-ascii?Q?WF86x3SMVYLThFQiKgzcm2MIWWdTwHtc+LMQ3kXQqpbGz9lpdrSzhQzogRmB?=
 =?us-ascii?Q?WG7fnAnDnZFA7LYzGxpG/70prNmqTqDB3G9BtdDqBRlxGhTqRRIGFVKoZixZ?=
 =?us-ascii?Q?idFU2AmpiCJzUglE9KUmlDlZFqa5TSrpiRZGtOVEzV11PvWACqlbpc6+Fi4a?=
 =?us-ascii?Q?0NuicCH0UZPnafCNWwkCC9UNGNQQDJlaAR89sHRM6VtzZE4DL7t4AWzSTk2y?=
 =?us-ascii?Q?h5gihjSFEcJWsLMUiipVdPDumdyzYhDOUtHgh7s9M7ZS8krlf9kNa0ij75oa?=
 =?us-ascii?Q?GFIIrOWFZL9p3Q7HAhlBeU8lupvmnlvAvsRQI8S+JNXMwqXUDcmtKRWOxJCR?=
 =?us-ascii?Q?mYycd79ac/JrOv1JuCSqX7WJ56SR0buxT7kxRTMzqCz5zBrTGHgo1uiN+KbE?=
 =?us-ascii?Q?lIuGcG5F5LfKNIzY2QaH4NygNv1S7C9sr4F3XOsxaeHwYoF9LZajIgMcBbRc?=
 =?us-ascii?Q?W08dfmOuUwydf3zybuckjWFpxwa62fR26laltzv9Plh/jvEcou9k/IHpkFeV?=
 =?us-ascii?Q?wBinJyvh4ZpGSYJHsY0EBsmCvzRrImSapg+UbC8LFAg8KrQgx4C9aUrlbUtl?=
 =?us-ascii?Q?rTCQP1kbOYzq28mS/2W/TkPLKpiLPDtlwmRJtHFMpBf8gLyJRouMdRxbewmu?=
 =?us-ascii?Q?A0YYzkWux9EUgp5PIZoQNBuO0behRxXbECWjm2b6PSYrJOJMDmutPie5+W8g?=
 =?us-ascii?Q?b5VzmybvcribPSq3nLnqW/aKtihC6RJKSXmOZWykE7/S9v2ZYwH19EjoRYH4?=
 =?us-ascii?Q?SnvYWyrOmWsPsJ4To5+gVD5XF1p9ZzISxeVRyt4Sw5FD9iZqe1ChuqeDy4al?=
 =?us-ascii?Q?CCZD67ndP/y7WajeVlhpUgYUX41kG6PyJyLpwMyvrB5Ko03ZXQheE8OyQj+a?=
 =?us-ascii?Q?Lb79L2MBnJeErIuo3/6tzuapiFKTPZO33kioWhShTOGl9aRCGxgl4FYJhUe2?=
 =?us-ascii?Q?NDQbOywwJKzqXZHpdvgj2d4bHYZwWIiqU/zzusvweY4Ln/liTLlS34zlQAu5?=
 =?us-ascii?Q?zQ5LekYs8ZCwlX7v53W17P6+bOs1upM5uwWV8fOOIyx5ThCXuNtGrin8qJ/A?=
 =?us-ascii?Q?wE8GaxOstzkFwyrll4CPfyHOfBbDMhTnpgmJbR+XBu8FBPgOY/N400Sj5g3+?=
 =?us-ascii?Q?+Uku06XZhR8WiKdxA9jP2HgKp5e4GlVHI3hjfWCMqB8v4T5VDMQIFVb6I0fl?=
 =?us-ascii?Q?cbvWxnkPmKhO7XIAOpiXApelluq0CKLNThPPuNMXhTZ1HSmCRm8clJl4upf/?=
 =?us-ascii?Q?CgJhDNnlhb0zkvFMRcYiWUe98UWmbc6uSw7YLCfYZfU7EU1Wq4DD8NDfQsjT?=
 =?us-ascii?Q?yb2TCMIkCg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22097858-4613-4de8-843d-08de7ad47192
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 16:29:59.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A0Wdq9h+XMQeYg3yAtkh0RFPuYUEYVo8TkzrPGB+nm2hVYL/jfDB+RGvzH8H47ZreM2bamB+Bs/EcxZYUQoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 1B0A42156F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:replyto,intel.com:email,ideak-desk.lan:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imre.deak@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	HAS_REPLYTO(0.00)[imre.deak@intel.com];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.130];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:48:11PM +0530, Arun R Murthy wrote:
> We at present have drm_dp_Read_lttpr_common_caps to read the LTTPR caps,
> but this function required DPRX caps to be passed. As per the DP2.1 spec
> section 3.6.8.6.1, section 2.12.1, section 2.12.3 (Link Policy) the
> LTTPR caps is to be read first followed by the DPRX capability.
> Hence adding another function to read the LTTPR caps without the need
> for DPRX caps.
> 
> In order to handle the issue
> https://gitlab.freedesktop.org/drm/intel/-/issues/4531
> of reading corrupted values for LTTPR caps on few pannels with DP Rev 1.2
> the workaround of reducing the block size to 1 and reading one block at a
> time is done by checking for a valid link rate.
> 
> Fixes: 657586e474bd ("drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities")
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 63 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index a697cc227e28964cd8322803298178e7d788e820..9fe7db73027a43b01c4d12927f1f0e61444658e5 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3050,6 +3050,69 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>  	return 0;
>  }
>  
> +static bool drm_dp_valid_link_rate(u8 link_rate)
> +{
> +	switch (link_rate) {
> +	case 0x06:
> +	case 0x0a:
> +	case 0x14:
> +	case 0x1e:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * drm_dp_read_lttpr_caps - read the LTTPR capabilities
> + * @aux: DisplayPort AUX channel
> + * @caps: buffer to return the capability info in
> + *
> + * Read capabilities common to all LTTPRs.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
> +			   u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> +{
> +	/*
> +	 * At least the DELL P2715Q monitor with a DPCD_REV < 0x14 returns
> +	 * corrupted values when reading from the 0xF0000- range with a block
> +	 * size bigger than 1.
> +	 * For DP as per the spec DP2.1 section 3.6.8.6.1, section 2.12.1, section
> +	 * 2.12.3 (Link Policy) the LTTPR caps is to be read first followed by the
> +	 * DPRX capability.
> +	 * So ideally we dont have DPCD_REV yet to check for the revision, instead
> +	 * check for the correctness of the read value and in found corrupted read
> +	 * block by block.
> +	 */
> +	int block_size;
> +	int offset;
> +	int ret;
> +	int address = DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV;
> +	int buf_size = DP_LTTPR_COMMON_CAP_SIZE;
> +
> +	ret = drm_dp_dpcd_read_data(aux, address, &caps, buf_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (caps[0] == 0x14) {
> +		if (!drm_dp_valid_link_rate(caps[1])) {

I don't think the code can depend on what will be in caps[1] (i.e.
DP_MAX_LINK_RATE_PHY_REPEATER / 0xF0001) after the monitor returned a
corrupted value when reading this register. That is the code cannot
depend on this register value being a valid link rate encoding or
some other value.

> +			block_size = 1;
> +			for (offset = 0; offset < buf_size; offset += block_size) {
> +				ret = drm_dp_dpcd_read_data(aux,
> +							    address + offset,
> +							    &caps[offset],
> +							    block_size);
> +				if (ret < 0)
> +					return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_read_lttpr_caps);
> +
>  /**
>   * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
>   * @aux: DisplayPort AUX channel
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..def145e67011c325b790c807f934b288304260c1 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -755,6 +755,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
>  				const struct drm_dp_desc *desc);
>  int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>  
> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
> +				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>  int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> 
> -- 
> 2.25.1
> 
