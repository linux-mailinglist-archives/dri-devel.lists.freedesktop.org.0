Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491FA83786
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 05:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B3210E35B;
	Thu, 10 Apr 2025 03:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j410O1ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5272D10E35A;
 Thu, 10 Apr 2025 03:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257466; x=1775793466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=33lBKCEpD6YQOo6cGUuuYnQuIYKtFfyG4hcju/bW/bY=;
 b=j410O1abSKPW631Zjs/xWZ4gE/DEOM7tQTNvfK6CNrGJuT2fOXEx0Y0I
 Qy18OQaRPFR//I+8Ik8qHZR6SSfv9WFToMm9ue20E6SlmYRxDop4EgWAp
 MGvaTWAiCN0mUpi55aetrj7IjRLxVDDmI+sfkCLZbP0D97CbJZxld/xXG
 i3Ikf2tnzqr5uyWJwDnu9s93C3USrv3tOJi7RQUMmhavt05aVOse6EAg/
 Us45q2MWYYuaRgz4pZ1i0PHGbheiQo+pkNMM5uZZQeixtYndWUjsSOoq7
 p/6dTvrUbDzs3GpUgHzcckCHLldGWcGy+sOV2D1DYQ6CyYym/iXtKPo5H w==;
X-CSE-ConnectionGUID: 6yO+msVfRJesIW0r1mM2Rg==
X-CSE-MsgGUID: s7VbMmhiR/Wc0mLPK0dtew==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71134124"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="71134124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 20:57:46 -0700
X-CSE-ConnectionGUID: oMIJaX/FS9K9AXfn4kKDww==
X-CSE-MsgGUID: 4RWNUEZGShCB4g/eR0acyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="165992662"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 20:57:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 20:57:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 20:57:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 20:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIPAxtAgcldbd9I2s9/iSagHweBTnffK/6CEQZws6djhfwzLpWm5y5kHtKwSWKjYFxzyrIKrWpII3BSH/nKPERdKMjB8/p7PdlqYqNmTDI1zcuOCOd0Dcj6TlPunWjxqNoTMXP5b5o2KFIvtiZYV+Wp0kH+iD1APDKJjteanErcnR8fsy8yT3KhJSSLywFxOTHO6gvvIJTJKbGF2CbpAv+CT8ebvi17y9YmXmaGZpql7yt/mj0l9ytldtbOSpTbU6RpcDk+X5jvKhp0VzMXeTb4yWGF813Gu3JKd2vGuT1iONBSu+Hf77uoW8xV2FMyMkHPewCgFoop2P5aMX4KHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8nAO5DvObLGuPlWpkyqshUN4PS7e5s4u4VYp4UqR0I=;
 b=QgGikSSjGmUjdE/8wJkfJdq2R9xFBGQ5xdiUe0rWK0g8Y+i6vqXirFLevSBX1FjFAcYYexEns0r6nhEWxxlOk3utakigq7C0xfGSvkZ/n2IXx4GRs6vqUyff4u2WjMxsWlFpkBtxQLd+SZ7vMu55qjzqL4g0NYkMY4+E+V+WuQDS6i0vgGx/6moii49Y60g0jXXuudyAbfSelfLugWNdknLK08ZaZX7KAlvJhrA0242j6pCJyABo4WfSrF8eybP8llfc+4UBor3FmpiSaLi0kzgOHXzTpVWOWZLM0EHCP/q/VOxqJM8mEbjV4RSRzFkDWBbTpmM5AA5Y00vbJNLK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 03:57:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 03:57:28 +0000
Date: Wed, 9 Apr 2025 20:58:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <Z/dB9MeMq1VyhMHl@lstrano-desk.jf.intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-3-matthew.brost@intel.com>
 <CH0PR11MB5444564A7A44CBF255CE097DE5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444564A7A44CBF255CE097DE5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:303:b9::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: d34bc1c8-cc81-4aa5-9e86-08dd77e3cf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OIxJ4DKLvCdX2VSUf50+HLQOx+2QZSKwoG2xVVTXgaSb70VceRQQguHzpZ0b?=
 =?us-ascii?Q?tO29VoT0vgStt24abob2WHEM4MJaA6AvbOUBEWSLqiSjWiXMReBST6rnOnzR?=
 =?us-ascii?Q?xUGhC1ADBiRvy6RlkUDnPATrpTuPUfOXntrbkDwWc9UqmpK9VcRXfWmps+Xk?=
 =?us-ascii?Q?avSZlHMAPPfd1KzHB8iQrlGXxtgVp3cDroXu9IfVYYcAwjDzYA+DRov2RFj0?=
 =?us-ascii?Q?+Ka+Y00CUDTCle9z0qUUnRvAsIAfgYe9Dpq8+61Nhyk9AshhKAa3MSixYGeF?=
 =?us-ascii?Q?MVZ7mMQ0l5YAS5SyBHkEVK2X23QPvUECA4qqwKSI5Is+AxSmBDwpUqoqB2y6?=
 =?us-ascii?Q?MKNYvAs8N6CBZVDYVjzoeQo0Wh5LT/NZJpf1tDXY1b3RMh+m3zw77TxZUMXt?=
 =?us-ascii?Q?HUBQPgaRQPlA7qfMKnKojpTNvmhYHNyn0nt3Rw00YKw4a3ocnCYVcSb7dDQE?=
 =?us-ascii?Q?FfxvnQA9F3AmxmQAWfAzFkAHzsXaYxcLCZ2JDt+w/KPlDFJYXPwaYU0xPaNl?=
 =?us-ascii?Q?nUk8J6Na9Z8V2euNXJuMpfIWvkJUfIh+j+FJzyEMDhT1BuD+hvrk/tVpWVXd?=
 =?us-ascii?Q?mf2Rj6V2MuGcPc2OAEZy1GBXGemAxJCfbpUTQY3tL40KM+iI7S1VFrWq2mrM?=
 =?us-ascii?Q?Ekvo26fsXY8UQfes5PyU1ChHEZx4RgXYLLP06v/e0cWE1Io0O4GYo3L5RSMR?=
 =?us-ascii?Q?lVxBbdl3uNQxZmUYQm3qiDnxap2DBL5i5MPljzMwkWOVpLC9TQEp8y9ePtjP?=
 =?us-ascii?Q?dXSnTojvefuzVPSK/mhGwebnyo49IbgT6UB+LqGspmBzvnpDN7mwmWqsj/Wk?=
 =?us-ascii?Q?NL/KbypPfpH9j78gBCz3zfJ+XHxrspjg5N6yznvyq7NiM2QD1QwasOLMW6oj?=
 =?us-ascii?Q?dpw2yeBxNmQS5eWd7lr8GdqjYNMMTIOWBcyP2vw4XiUyqgFukHaorUkYDR93?=
 =?us-ascii?Q?ua1H1EeFXgpas/7LhDl2Mp6xNpCmIluWky52k80TMFN51RBKaYgDasq1LVcs?=
 =?us-ascii?Q?mHfzANIvhwWddW5SsGrIx1np6ns0D+dL2GWqpemqZPqXfpaQzbvD1+gZeWi6?=
 =?us-ascii?Q?X3hcMdQEK7rFQq8dWUttqXKPUJInHWmL7iP+3BiESS5HAgC5I/dna4Ou1duI?=
 =?us-ascii?Q?9uPMlGYGEDxyzURJNh58SLdgkAufxEbI2UYvGVPZTR9OXo2KHWoGjUSBaDIV?=
 =?us-ascii?Q?M9UshPMm8uHz1GB8+5WhcddqqebhA/XYAZUYpMM94iUGSE1AQGoT4Kfi22dl?=
 =?us-ascii?Q?gzthyFx+W3YXj0jbAKagk7Z77kWw2DeywQfJB7lXSHbXK5uUxnLR6hcuLd+r?=
 =?us-ascii?Q?vM/zjK7F8tGSMHTHWSK8/cEutM+UL4tcnpH3JaMzBJDH3PFBaip+KY/h35Up?=
 =?us-ascii?Q?MmINtNEE7ng67QK1E0o92XYufdv7yG6sWTTCp+xjkX3X1LWUakJNPl3vRekf?=
 =?us-ascii?Q?ttNWEfF2ZTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KyjpeuzTVujdlWm+GQyPG1ctAaA32N1bl2qkbivVroxdg9UtXI5ObFUIFbUy?=
 =?us-ascii?Q?ERvmRdvBDEZlC5MGVKgNRl26pGDucmjSjr83lG2XJb5SvHKPpNVj/al3CUpG?=
 =?us-ascii?Q?SK4qUJEv+4ba4kJOFiRk7qqKnFz44qnWk4LlJuvyt1LsdF1dGJSM6JKx4XUQ?=
 =?us-ascii?Q?uYobH/LUy2E5aVfwXf9oZKuADVRadCY20U4w5MM6xV56mr/RxiK3zFhhYx26?=
 =?us-ascii?Q?0h3IongFF+SdSA8VfTwYyzVKQ5dAThZjACb0sARsdANxVPdcRWXo1i/EHZMy?=
 =?us-ascii?Q?Wdlb9RkDW7wexEey8nHPDOZC8jJMgkzXHTq02PSwBU88tTSwr/9bL9KqzCEU?=
 =?us-ascii?Q?Veddjwqc+JHNOWGEQ38BcQgk67A7bmFgj5ZXFZDNYfhGP+71ZVx77oqDgHes?=
 =?us-ascii?Q?/ovB0xQ8Et7hfcay1+mlKmLreC34apl1hyOxsnbTasHt7SYH2TAQmlbC82nx?=
 =?us-ascii?Q?wd1mBQZijbZxDUXrRbdhcjCHlhc8Ao5XaVc/BQmC7X7wA4LAgUd9IQfcwGYv?=
 =?us-ascii?Q?V9TQFPFh5e3y4rN8bGiOnJKoCtRcdOPtkRK55Fo+BdUWdrxQrCf2EhVvCE7u?=
 =?us-ascii?Q?AoefehzCMefwxXUX0GpGMVajkFl0YNIhS52VTv633Lyxrf2zKXCHIGMoqU3z?=
 =?us-ascii?Q?tBveh0C61ZfmWzOHURd6PVX1J4reuLdZqQ3UmHc7TOOLNFGNHeVAhSKLuU/M?=
 =?us-ascii?Q?EpukCcSCjB44Kckp2ktUvaPSXB0+VqCqzH/kPqrdB0y8H7m8DOBdd0uNUyFH?=
 =?us-ascii?Q?rmPVL7aH8i4K62PIh2pEQk/6OnYBWA+X6q9tR5ykwg47fVC7ZqVLYU0T4Ab4?=
 =?us-ascii?Q?Gy4yuRlXWGu+rDN8YZ6x+hrC/T1bGlI8+NvKLCNmshE5FIF8ProZWx6EQmDy?=
 =?us-ascii?Q?QHE/12k8pcZj4NBj8i9Djro278M6RGo72X71ZYIroEQkGoLeuTPrRh4e9pKR?=
 =?us-ascii?Q?hRQDE2Egqm0vsaKi+MUgnYCmd3lYdem5nJETHQuVpwsR+cyh/th/X3d1bTFl?=
 =?us-ascii?Q?SL+WrmRPwgWi2QoKp4G6RRZI6aNgr15qSDQ71wfKOOpANnLZprECQAExMn9F?=
 =?us-ascii?Q?czEuPPficDz5pwCm2MElpwVqLRS6VJIPvWMD2S9Pf/U7GXf9PRvAbmhBT2tU?=
 =?us-ascii?Q?qnDWvHk8jJnUcTocyrzotrZMrNl3Fi6PUdA/WDl1sEkJfAP2FSdR66kKpFzQ?=
 =?us-ascii?Q?QTB8cf74ngQP3msVn0kgzEXIYoEBglG7p1fYATBnK54bZRIUXnaY5/pIQoI7?=
 =?us-ascii?Q?jGyef1hAJWhDybhuqb8qlln0C6u2MVt0hgDmsz4CMbhaH101MU+o5/IkSjc8?=
 =?us-ascii?Q?6zqQDcGah+w3h08gZVcS8Nv/P8cu/7+HNjcZndZotuVPRdrMwdXW74t7TEj0?=
 =?us-ascii?Q?HF+Axp1eVoI7zzDDu99bg9mjUI+jWCiqq68ihvDUxytoRvWPtImaWiernUFs?=
 =?us-ascii?Q?OI7yG++Ry63vLYbvOrWnu3umkOuv/fUqayZI9/ZLd0/He4pwYASgjOxmm2yd?=
 =?us-ascii?Q?9iw4M4IrTN9OGDK5IhXcxJo5oY1kelkcr9psCzarjlsYqs3nxz3qJ2p9Ry+x?=
 =?us-ascii?Q?tC2qNS7N9iyIGGC5LRnxrJlmDbF2ckGNxQzwDSQAeYNcZasSfLNEzqdc/Dl2?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34bc1c8-cc81-4aa5-9e86-08dd77e3cf90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:57:28.2179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYqWugT5b+e3L+YjAbc5nHnmJqWc2qXFcWmQYzbzxuCov0IkmNti51sUNfdblsaQt4DghIiNEUD1NO7+iC59iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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

On Thu, Apr 03, 2025 at 03:28:48PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Thursday, April 3, 2025 1:27 PM
> To: intel-xe@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
> > 
> > Add migrate layer functions to access VRAM and update
> > xe_ttm_access_memory to use for non-visible access and large (more than
> > 16k) BO access. 8G devcoreump on BMG observed 3 minute CPU copy time vs.
> > 3s GPU copy time.
> > 
> > v4:
> >  - Fix non-page aligned accesses
> >  - Add support for small / unaligned access
> >  - Update commit message indicating migrate used for large accesses (Auld)
> >  - Fix warning in xe_res_cursor for non-zero offset
> > v5:
> >  - Fix 32 bit build (CI)
> > v6:
> >  - Rebase and use SVM migration copy functions
> > v7:
> >  - Fix build error (CI)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I left some notes down below.  Most are non-blocking, which I labeled as such.  And
> as for the rest, it's probable that I'm just misunderstanding some parts of the code, and
> that the notes I left are not relevant.
> 
> So, I'll be providing my reviewed-by now in the case that the blocking review notes
> turn out to not need to be addressed.  And in the case they need to be addressed,
> you can take my reviewed-by for the next revision.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c      |  15 ++-
> >  drivers/gpu/drm/xe/xe_migrate.c | 221 ++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_migrate.h |   4 +
> >  3 files changed, 223 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 3c7c2353d3c8..c7e6b03d4aef 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1414,6 +1414,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> >  	struct xe_res_cursor cursor;
> >  	struct xe_vram_region *vram;
> >  	int bytes_left = len;
> > +	int err = 0;
> >  
> >  	xe_bo_assert_held(bo);
> >  	xe_device_assert_mem_access(xe);
> > @@ -1421,9 +1422,14 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> >  	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> >  		return -EIO;
> >  
> > -	/* FIXME: Use GPU for non-visible VRAM */
> > -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> > -		return -EIO;
> > +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
> > +		struct xe_migrate *migrate =
> > +			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
> > +
> > +		err = xe_migrate_access_memory(migrate, bo, offset, buf, len,
> > +					       write);
> > +		goto out;
> > +	}
> >  
> >  	vram = res_to_mem_region(ttm_bo->resource);
> >  	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
> > @@ -1447,7 +1453,8 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> >  			xe_res_next(&cursor, PAGE_SIZE);
> >  	} while (bytes_left);
> >  
> > -	return len;
> > +out:
> > +	return err ?: len;
> >  }
> >  
> >  const struct ttm_device_funcs xe_ttm_funcs = {
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index ff0fc2fb0eb9..ba8568691d99 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -670,6 +670,7 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> >  	u32 mocs = 0;
> >  	u32 tile_y = 0;
> >  
> > +	xe_gt_assert(gt, !(pitch & 3));
> >  	xe_gt_assert(gt, size / pitch <= S16_MAX);
> >  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
> >  	xe_gt_assert(gt, pitch <= U16_MAX);
> > @@ -1602,8 +1603,12 @@ enum xe_migrate_copy_dir {
> >  	XE_MIGRATE_COPY_TO_SRAM,
> >  };
> >  
> > +#define XE_CACHELINE_BYTES	64ull
> > +#define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
> > +
> >  static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > -					 unsigned long npages,
> > +					 unsigned long len,
> > +					 unsigned long sram_offset,
> >  					 dma_addr_t *sram_addr, u64 vram_addr,
> >  					 const enum xe_migrate_copy_dir dir)
> >  {
> > @@ -1613,17 +1618,21 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> >  	struct dma_fence *fence = NULL;
> >  	u32 batch_size = 2;
> >  	u64 src_L0_ofs, dst_L0_ofs;
> > -	u64 round_update_size;
> >  	struct xe_sched_job *job;
> >  	struct xe_bb *bb;
> >  	u32 update_idx, pt_slot = 0;
> > +	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> > +	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
> > +		PAGE_SIZE : 4;
> >  	int err;
> >  
> > -	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
> > -		return ERR_PTR(-EINVAL);
> > +	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> > +			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> > +		return ERR_PTR(-EOPNOTSUPP);
> >  
> > -	round_update_size = npages * PAGE_SIZE;
> > -	batch_size += pte_update_cmd_size(round_update_size);
> > +	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> 
> Hmm... Does this case still need to return an error value?  I don't think replacing it with an
> xe_assert is entirely valid, as asserts should not be used as a replacement of proper error
> handling.  Or so I've been told.
> 
> So, I guess the question is: what error was this preventing previously, and is it still a concern?
> 

This should have been an assert before - it just validating the caller
passing in sane arguments which we do everywhere in Xe. If that changes,
then boom the assert will pop. 

> > +
> > +	batch_size += pte_update_cmd_size(len);
> >  	batch_size += EMIT_COPY_DW;
> >  
> >  	bb = xe_bb_new(gt, batch_size, use_usm_batch);
> > @@ -1633,22 +1642,21 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> >  	}
> >  
> >  	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > -				   sram_addr, round_update_size);
> > +				   sram_addr, len + sram_offset);
> >  
> >  	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > -		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> > +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> >  		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> >  
> >  	} else {
> >  		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> > -		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> > +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> >  	}
> >  
> >  	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >  	update_idx = bb->len;
> >  
> > -	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
> > -		  XE_PAGE_SIZE);
> > +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
> >  
> >  	job = xe_bb_create_migration_job(m->q, bb,
> >  					 xe_migrate_batch_base(m, use_usm_batch),
> > @@ -1696,7 +1704,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> >  				     dma_addr_t *src_addr,
> >  				     u64 dst_addr)
> >  {
> > -	return xe_migrate_vram(m, npages, src_addr, dst_addr,
> > +	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> >  			       XE_MIGRATE_COPY_TO_VRAM);
> >  }
> >  
> > @@ -1717,12 +1725,199 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> >  				       u64 src_addr,
> >  				       dma_addr_t *dst_addr)
> >  {
> > -	return xe_migrate_vram(m, npages, dst_addr, src_addr,
> > +	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
> >  			       XE_MIGRATE_COPY_TO_SRAM);
> >  }
> >  
> >  #endif
> >  
> > +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> > +				 int len, int write)
> > +{
> > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!dma_addr[i])
> > +			continue;
> 
> Non-blocking:
> I'm guessing the dma_addr array can be non-contiguous (I.E. position 3 having a
> dma address does not imply positions 1 and 2 have them).  Because otherwise
> this can be a break condition instead of a continue.
>

It should be a break, let me fix that.
 
> > +
> > +		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> > +			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> > +	}
> > +	kfree(dma_addr);
> > +}
> > +
> > +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> > +				      void *buf, int len, int write)
> > +{
> > +	dma_addr_t *dma_addr;
> > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> > +	if (!dma_addr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		dma_addr_t addr;
> > +		struct page *page;
> > +
> > +		if (is_vmalloc_addr(buf))
> > +			page = vmalloc_to_page(buf);
> > +		else
> > +			page = virt_to_page(buf);
> > +
> > +		addr = dma_map_page(xe->drm.dev,
> > +				    page, 0, PAGE_SIZE,
> > +				    write ? DMA_TO_DEVICE :
> > +				    DMA_FROM_DEVICE);
> > +		if (dma_mapping_error(xe->drm.dev, addr))
> > +			goto err_fault;
> > +
> > +		dma_addr[i] = addr;
> > +		buf += PAGE_SIZE;
> > +	}
> > +
> > +	return dma_addr;
> > +
> > +err_fault:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> > +	return ERR_PTR(-EFAULT);
> > +}
> > +
> > +/**
> > + * xe_migrate_access_memory - Access memory of a BO via GPU
> > + *
> > + * @m: The migration context.
> > + * @bo: buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Access memory of a BO via GPU either reading in or writing from a passed in
> > + * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
> > + * read to or write from pointer.
> > + *
> > + * Returns:
> > + * 0 if successful, negative error code on failure.
> > + */
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > +			     unsigned long offset, void *buf, int len,
> > +			     int write)
> > +{
> > +	struct xe_tile *tile = m->tile;
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_res_cursor cursor;
> > +	struct dma_fence *fence = NULL;
> > +	dma_addr_t *dma_addr;
> > +	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
> > +	int bytes_left = len, current_page = 0;
> > +	void *orig_buf = buf;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	/* Use bounce buffer for small access and unaligned access */
> > +	if (len & XE_CACHELINE_MASK ||
> > +	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
> > +		int buf_offset = 0;
> > +
> > +		/*
> > +		 * Less than ideal for large unaligned access but this should be
> > +		 * fairly rare, can fixup if this becomes common.
> > +		 */
> > +		do {
> > +			u8 bounce[XE_CACHELINE_BYTES];
> > +			void *ptr = (void *)bounce;
> > +			int err;
> > +			int copy_bytes = min_t(int, bytes_left,
> > +					       XE_CACHELINE_BYTES -
> > +					       (offset & XE_CACHELINE_MASK));
> > +			int ptr_offset = offset & XE_CACHELINE_MASK;
> > +
> > +			err = xe_migrate_access_memory(m, bo,
> > +						       offset &
> > +						       ~XE_CACHELINE_MASK,
> > +						       (void *)ptr,
> > +						       sizeof(bounce), 0);
> > +			if (err)
> > +				return err;
> > +
> > +			if (!write) {
> > +				memcpy(buf + buf_offset, ptr + ptr_offset,
> > +				       copy_bytes);
> > +				goto next;
> > +			}
> 
> Non-blocking:
> This should debatably be an if-else block, rather than relying on a "goto next"
> here, as "goto next" is not used elsewhere in the function.
> 
> """
> 	if (write) {
> 		memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
> 		err = xe_migrate_access_memory(m, bo,
> 						    offset & ~XE_CACHELINE_MASK,
> 						    (void *)ptr,
> 						    sizeof(bounce), 0);
> 	} else {
> 		memcpy(buf + buf_offset, ptr + ptr_offset,
> 			  copy_bytes);
> 	}
> 
> 	if (err)
> 		return err;
> """

Yea, let clean this up.

> 
> > +
> > +			memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
> > +			err = xe_migrate_access_memory(m, bo,
> > +						       offset & ~XE_CACHELINE_MASK,
> > +						       (void *)ptr,
> > +						       sizeof(bounce), 0);
> > +			if (err)
> > +				return err;
> > +
> > +next:
> > +			bytes_left -= copy_bytes;
> > +			buf_offset += copy_bytes;
> > +			offset += copy_bytes;
> > +		} while (bytes_left);
> > +
> > +		return 0;
> > +	}
> > +
> > +	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> > +	if (IS_ERR(dma_addr))
> > +		return PTR_ERR(dma_addr);
> > +
> > +	xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
> > +
> > +	do {
> > +		struct dma_fence *__fence;
> > +		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
> > +			cursor.start;
> > +		int current_bytes;
> > +
> > +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> > +			current_bytes = min_t(int, bytes_left,
> > +					      MAX_PREEMPTDISABLE_TRANSFER);
> > +		else
> > +			current_bytes = min_t(int, bytes_left, cursor.size);
> > +
> > +		if (fence)
> > +			dma_fence_put(fence);
> > +
> > +		__fence = xe_migrate_vram(m, current_bytes,
> > +					  (unsigned long)buf & ~PAGE_MASK,
> > +					  dma_addr + current_page,
> > +					  vram_addr, write ?
> > +					  XE_MIGRATE_COPY_TO_VRAM :
> > +					  XE_MIGRATE_COPY_TO_SRAM);
> > +		if (IS_ERR(__fence)) {
> > +			if (fence)
> > +				dma_fence_wait(fence, false);
> > +			fence = __fence;
> > +			goto out_err;
> > +		}
> > +		fence = __fence;
> 
> Non-blocking:
> It would be nice if we didn't have two paths assigning fence the __fence value,
> but any attempt I do to try and change that ends in having to compute the IS_ERR
> value for __fence twice.  E.G.:
> 
> """
> 	if (IS_ERR(__fence) && fence)
> 		dma_fence_wait(fence, false);
> 	fence = __fence;
> 	if (IS_ERR(fence))
> 		goto out_err;
> """
> 
> So, either way works.
> 

I prefer the way I have it.

> > +
> > +		buf += current_bytes;
> > +		offset += current_bytes;
> > +		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
> > +		bytes_left -= current_bytes;
> > +		if (bytes_left)
> > +			xe_res_next(&cursor, current_bytes);
> > +	} while (bytes_left);
> > +
> > +	dma_fence_wait(fence, false);
> > +	dma_fence_put(fence);
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> > +
> > +	return 0;
> > +
> > +out_err:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> > +	return PTR_ERR(fence);
> 
> Non-blocking:
> The branching execution might be able to be shortened.  Perhaps:
> """
> 	dma_fence_wait(fence, false);
> 	dma_fence_put(fence);
> 
> out_err:
> 	xe_migtate_dma_unmap(xe, dma_addr, len + page_offset, write);
> 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
> }
> """

Sure.

Matt

> -Jonathan Cavitt
> 
> > +}
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >  #include "tests/xe_migrate.c"
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 6ff9a963425c..fb9839c1bae0 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  				  struct ttm_resource *dst,
> >  				  bool copy_only_ccs);
> >  
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > +			     unsigned long offset, void *buf, int len,
> > +			     int write);
> > +
> >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> >  #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> > -- 
> > 2.34.1
> > 
> > 
