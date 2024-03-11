Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C791687851A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A991123A3;
	Mon, 11 Mar 2024 16:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5dEFjAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5E71123A3;
 Mon, 11 Mar 2024 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710174239; x=1741710239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uJB2wOdP+qvPW0ZeX+swAIvd5R1tjm9ljJG1bWCJI50=;
 b=Z5dEFjAKBGzAtQFV5o7zmVqLoda7SLOuXmgSkew2NuAUAejbZzefsI1W
 2gF9hzxEhP3EeG8KsomK4E+nLL6NGm4HChtrt2siGxuZcyT3IOAMPixrn
 ojktCFF3jZTRNTkFjRly5Gy74JLNCOocVWPw+gqYLnxK4RYupWZ2blCcA
 +brsMpMkLWQXceSg5mctiPNqHO5KyXEc3bnCDIGQDXK0ZPBe+eXVUtn+a
 nhKFUlHt6FuWBhBdbPD8GIjst/9iWpVopuTQ/hmGAPRiBrn97exuLRyUE
 hiA43uZAjWm5RGlrzkvVcM+PMLw3bGeoPpOv53FmvYMNQtH1ygsSEyrXL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5028836"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5028836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11659971"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:22:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:22:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:22:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJJpgyLfBqQ1EvDyck/sew008/TrWfP+l7iqT9menhUinixZb2roEwXLXLSpA0LDTIoL6YDq11xocjc42GyqBYdl/ZUU5/mS6kJBD1rDuAMNrUAJWMV3+o5Jwe6pRkU3MgS+p6GNPiSwiZqzriFsuprDuCnIet32T1t44noqDWvVie8W9BEBhP3oNOblIFbN7y4xJdwc3end2Y8f/3pxNNhHH4sKrbqOIDq5aocpo1cRtOVTkncfnxBJxWWsDUdtaQ+hGlS3/EmKE2iAC8QUTDrna4znxgwszBj5jmbHB9KUXTDIhyaMWdkydp0N6E7vP3m4foJIXuugaokO0fGHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ5E1pFQM/V73jWCXzz3ErXwb5eJni8u2uG6SGILIPs=;
 b=VTaRv2NH1e9+LxNaGaXmb2vCAw81JsgohdFFnLUtUpeqiwsfKLGK+s8X3eARBrHdAQG0ABBFdAZy2iyu7PjDTlpQJ0BhuoQY3kpKHy6Ft5woZAXUEUZC4TCO2xr0BRrzzYPipdqtQC0d2Xy2HtkMA+Y9FJLoWPEs+CuARqPG/nqH+9wYRD5DPeSDf16lLn3inuykmCSERb2wcgsqQiw3wAT8QzWvJ6Fr4q+YFcU1BGWR6aVPCCy9YJKVBsZN6O1w2hC5RFLfbRWIqMZqiACYVKkH28ntwcDps+J1RrsdzTnRe5SPNU43hkOZXxW6IfqFkVb6Aa1hU+TQ5gDUUNsWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 16:22:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:22:06 +0000
Date: Mon, 11 Mar 2024 12:22:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/i915: Drop dead code for pvc
Message-ID: <Ze8vqnQemP5-ouI3@intel.com>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-5-lucas.demarchi@intel.com>
 <Ze8jW2Hr12rMXeZO@intel.com>
 <xzrhpvzuah3cgghbbbhrjwesgtvotlipracgjcvcn3deiae74v@dnyojvaqtsii>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xzrhpvzuah3cgghbbbhrjwesgtvotlipracgjcvcn3deiae74v@dnyojvaqtsii>
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d5efe9-9654-4b12-80f4-08dc41e764aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YdDGz8X42qCHtOQsRm/Z0pYwCmLB70X1Aa8ZyJlac4esm/8fCWJm6tw29YtASIFz07h0Ua4GFAHpZNanFMj7kDtxa8s6beN9aNHkDi1lQWaqnJUBFlMt1Wk2gNrOFU5ryV8AJJHP6oNuL3uhFCr0HkV5zMmXZ43u/F0D13qQtCp4b9DEsIBz+Kxzvdq7g5owhdssjsiFGfxbmyOd5F0oAsRkZhvULYrjU4v6ouvlK7LnbT3uvQXzoq20ppUlaOzK48r15lXL3O63QekNnUezS/zVOznXB1jMtCLhRyYMTN03BRZztEPt9/QelUcDtt2t37U4IuCggrxn2UZ3P8Mzr7WmZhyG4XYieNr9lvmieQ3xLuSuR9z8ITGKCBe561EnOhk6ZWLYiSK6akEZl5OX3UND1BOrjE2ZycCYLv+SOVSwjWk7PTMj5IyE5dpZFG+DMMDgzGwE60O9Pld9jRfvcqk/kJfB+Oj7tjH+ZC1Qj4lAG884TFeYMvZ4PyeKT32PjNKP7Mmp+IJmAs8UoFh1oRdzYJ6pk91SS6IVghsffsm0XmWhCs4ZtIrMtMWw6kW0vukl4jN72phE1/5v39kCoedj22/hLHGUN5dckom1PajfekjQufrgSXvy48vAIt0rz/5qVgcA+XHFKIu0DOu+aCHsiu2fcGArTysBjodGY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VnoqeP3FKNruu+L5OjUrw/FjiXY5LOG5hhZqYXuw6x38k+Rlorm5YLJQ7tCr?=
 =?us-ascii?Q?q7p9Q0ciARFShU1pdXDPhy5gIMeG6ECWaJKAPxc72kRJIWaoC9Tj8ApTNSUC?=
 =?us-ascii?Q?9/sa3ZEgJG3UfrEtuV54jMewxt057X5PXGQIeTYpEkYvcQ9QMXnK9pQALB4N?=
 =?us-ascii?Q?s3O8yO3erhjOxHLjPmUN8rArXUpzQ4kAraGmXr8ODzj4sLD7wfYwXgXiuA/v?=
 =?us-ascii?Q?h6AmP0atmbwzKviCbphJcnhz+eczaIPXdf+Sk6WLfQ0maR9cGgVuleoNnxnv?=
 =?us-ascii?Q?wJOtfaqT02VO6fYS3cR/WVUtpNd7ruP+osW2PpOyTggO1SPW9WT6Ffi5vRGP?=
 =?us-ascii?Q?+ICOefQdMZ/+IO+JXN58PoQQFNKqrc5irVj0BT4TrE8NSyHPa9bo6UIVYOQi?=
 =?us-ascii?Q?N1lvyJT2FfC0Q94AJgSYFstWUpW2uT6nEv9i2iRxABAdwwVD5sONdaL8i/FP?=
 =?us-ascii?Q?nn2RQI6Z4FG4z2JKSNxbDSB21IPuV8DdZHenlm8Bj21g/XWDpngjxPZAmObz?=
 =?us-ascii?Q?tmU55zQecZq8lIf2SeAKOMFwDWpLg02FRB41bbLMrhprMz5+TyEqkwEJRvEI?=
 =?us-ascii?Q?5oeFqqByikvjasZINV54WO/+YXE+7SSJohJGkIezX3U2DyA1mMT6n9Job29F?=
 =?us-ascii?Q?QB1ZaoWJMyz2ickE/kXcisCF2XI7o8UiPBhAKEl1Aw4nqmiayx2TajLMc8dI?=
 =?us-ascii?Q?pCoyqHBuKE8bYrod6sXCXJR0BvnLeQnMfPsGvJXIIm5ZfZp8WbqYijZsCeVB?=
 =?us-ascii?Q?pRWllwjIaYbrOhkfE8PLHu0cnwy1SwdC9JzGPoFQnE0Jnz343cLvQcACjVjM?=
 =?us-ascii?Q?GuRnogSGGbQEW7Aw/rFf3eErWYaK08WZ/6LhlglFUOqeuwqv46FIUKYleIui?=
 =?us-ascii?Q?iilE/mS/n2If6YrKxTX+KRqu9x2Z7gA1sXY3yKxgUs5n6S1b3DXtvKIASyOq?=
 =?us-ascii?Q?dRxxt69wR5Q1VSXn1nxU0Wj0160C2SY4RXaZKWfmt2XHfXxcFKyRbHm6oXjl?=
 =?us-ascii?Q?mHO60jVSb7bhFC9ShvWuF0hcHjIg3a5ePWHXGKCDC55RNIsl8XpjG287boUI?=
 =?us-ascii?Q?mbpsaqdJHD2bwnT7SwZKStVjdeECA++llFh9WHXQ5NLveekkgmoAhgInET0s?=
 =?us-ascii?Q?HrGhOLNMBYgbTKzTKE8RZFAbWKuH+3xQn9cOc4E9GIfhjJQgNm28n6obb2fi?=
 =?us-ascii?Q?TXPXcBvxay0HjdamHr0ksvOqmfGgN91bhkdnoWBibRi2lqQpHxclfFDxoR4D?=
 =?us-ascii?Q?yBOZRWOiDPrcX22Mldugk2tYYKmCUCRvhIEr7SUpTSdHTla5naVn//wy8Y6n?=
 =?us-ascii?Q?Cw8byDUXoVWo5Dh99phsK2SO+RjvgeiJWmV5GcENox8MS4fO0MGJZCJEe4qZ?=
 =?us-ascii?Q?ix8ASzfIhLvThlLL2m0NOA/DFU0snwe7ROMVQGLE1OxgFO2kkmo1HHjeBwut?=
 =?us-ascii?Q?2HXpgMrZAv2KiTFmcNlWVHnixLuQ9yYcBRI0ZSP1utUbzd8RsBaypyoHGMhg?=
 =?us-ascii?Q?JowqaZ4UDGKxMJoQsqFwd5SLNiZMyIjnKyMtuwga/qTW3E33VR3eRuRntX7P?=
 =?us-ascii?Q?iGYaqxosun8y6pOLEDcgSbypbHhi4+npy61f7+ti?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d5efe9-9654-4b12-80f4-08dc41e764aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:22:06.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2mZfsCFl43Pp5M+BBZfK0DhA+GRpTJ6se4bCfPbrZb9XZW4+D4iL2M6O92mFRZKzsPgjvUoahwji7BkPUsEkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

On Mon, Mar 11, 2024 at 10:35:20AM -0500, Lucas De Marchi wrote:
> On Mon, Mar 11, 2024 at 11:29:31AM -0400, Rodrigo Vivi wrote:
> > > @@ -2907,9 +2829,7 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
> > >  	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
> > >  		general_render_compute_wa_init(engine, wal);
> > > 
> > > -	if (engine->class == COMPUTE_CLASS)
> > > -		ccs_engine_wa_init(engine, wal);
> > > -	else if (engine->class == RENDER_CLASS)
> > 
> > I don't believe we need to remove this chunk since we are not deleting the ccs_engine_wa_init.
> > If we want to keep that as a placeholder we should also keep the caller as well.
> 
> right... I had removed it but brought it back since I noticed the
> kernel-doc mentions and forgot to bring back the caller too. I will fix
> this in next rev.

thanks!
with that:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> 
> thanks
> Lucas De Marchi
