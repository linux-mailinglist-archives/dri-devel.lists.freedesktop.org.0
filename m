Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E836D8B091F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A222E10FE70;
	Wed, 24 Apr 2024 12:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+AsOAHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0F9113ACE;
 Wed, 24 Apr 2024 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713961243; x=1745497243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0ZQXFJrAflmaneBAAug56IkKU6GZCE+uIezHlh+Ss1k=;
 b=R+AsOAHAKLPwvfV/LrYF6MVGhoKARu+SNM2foEmPqb2nBhnB2rzaeSXw
 yEAp17lHtnaIAYm8W1myUvv5R7+pgtCKiBlsTwSBHd4nd8ByketXP1pJG
 tSehT2ff4KejumMRdwCOIbDNuUlCq9tcIDb+Wib3ua2q+HQqu+csSXxWR
 jJnSLMF/X/y9pFeZra59UHYhGxpxMW+6nZ6FJ3ssyDrYrXfMQ1Gfz+UBc
 3BuX7nu8wQE8O1xaXl2dVrlXwunLKBJo6+mlGm98hBmwz73c3Il5/x5bv
 dS8hKROvlIvjEc6WDDN9lmgDdnDbOxq5zOup2sZll9zur/Oxei/HMu68d w==;
X-CSE-ConnectionGUID: q6Q47bdPSHiQeB9q+LpfCg==
X-CSE-MsgGUID: nvRf+WZhSnqblKugasKtHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809118"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:20:41 -0700
X-CSE-ConnectionGUID: kV7Z8KLlQX2ppff44b6AGQ==
X-CSE-MsgGUID: hKCuZSY6ThSbFKWLvEr8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29512568"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 05:20:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 05:20:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 05:20:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 05:20:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 05:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL3LcIK59eWaPL50KgT19Hmu9uKz+4rrYPoUcS/DNpyhObTvEcZkGovjPGasAqNoxR3y/uD/gJFc8ItkGHXsL/ElPauT4g+wY38iFaJEbonuXLQjBz43kTM51NLBovmmDMfIfuBHzZNl45CANlcsZ9u8x50ZNCFqurL460si/vDl9X3Oua/tHBsoBj/CiN2wjraQCLMLhrHOxU2iCFKZLz5vLwNuv2eEd7g6r1aJDa/5+gB1Uh5UYF4wyQyNEj1GmL3B8aN/4Em+6Nzcx+oGA3/oD1OtynSFz9iXhNHWAaiDfWZdIYT3LRX6ebmseKZ4XlYYgOsbhJq5S7d8iVx66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgAOCqzPtilT/ragL+nZS8FUv0DPiNJoYGkDE6QH+5w=;
 b=m1H7t0tKSM21GjTBoIvxQsW6N9FQCdGfX9+R+hER6m+CvAIr3wml7jLv45YGst4vN+mzJWZ4ARKAZqsKTO8Y1RdInkV5TZ+DGwvEkC7dfTPOaOHue1IFddQokXAVSv5roE1ynB9FMTYu/XsLVZt6xt6GQbYxs5D0ygk2gwQHH2KEmK0d8sM5uRdPKD+Ql9hhRWL8G99hN0FqiPsGaXP+z1/LO3VNajaVYdNHjTNFpxRvnGF+5wSX8cQPlgNTuU37P61SmiV0FxEvuqutA2vMP9GvvmkMfRrKDI7NnQk2hxmL52ekqgpHdxZLLUddyRPUBZPgomcHNhQ/QH+WKCJEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Wed, 24 Apr
 2024 12:20:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 12:20:37 +0000
Date: Wed, 24 Apr 2024 08:20:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <tzimmermann@suse.de>, <intel-xe@lists.freedesktop.org>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <Zij5EJLa-E5VEX14@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
 <Zify_rd1yV6ki7oR@intel.com>
 <20240424-spectacular-lumpy-guan-7188eb@houat>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-spectacular-lumpy-guan-7188eb@houat>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c52182-6ea4-4900-c369-08dc6458f2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YD0zRwi7iAJSCgnD2+ZYrZ8RvjoxhZA2MATPzKiGMVOTGouU+nCkRwHnWs?=
 =?iso-8859-1?Q?7qY1ePEQBOIKH0IYxtm1I/RJR5a2UP9EU7amcX1JUVyK2ldUNo0CMdAWDV?=
 =?iso-8859-1?Q?rgrEzka7n36sTQ2d88NqKrp6tXRltPWs1Y8+WM5GOr8WJA698QkJBoTXeq?=
 =?iso-8859-1?Q?lAUh2Qq6Ny9Nnv3VlhoHPzsRnevIFJ8mSDwr/frL1uI6uyigCLkLohPOAk?=
 =?iso-8859-1?Q?NVdux6dHFJ+L40ZkqJF2tsERk8xJTBBozCW4K1ogr447HsfkGs1VeF9v36?=
 =?iso-8859-1?Q?t9VruAEM/TovNSwHN/03f2Hk9IfrQo7JTDUyZe1IE/0rtbSBNfw9KSYjaW?=
 =?iso-8859-1?Q?MzkcgbQC62/pussjOnQfq6XUu/d4qamFZacgH2ySDPf2dej9/ETplD08pR?=
 =?iso-8859-1?Q?cwnUaoYEe8wOSUoHAMuWRJN79L5ueLl2Ct0eKVhwZOBoxtlzGyKQ+qyeLi?=
 =?iso-8859-1?Q?GBo0lmlTwCJkZXv2OL5O+CrDG3ose0a8RCDKj519up78HuF4UfizCa9q2Z?=
 =?iso-8859-1?Q?XX8VhMuzkWDbjpaI35tuI8o1ggkWpXT0MGYPK7BOOV1I99RfHMlkMltsRT?=
 =?iso-8859-1?Q?J57BS7vnXXFcjMUs7ioG1HY3iNmuSsSSKluiOyTqbx+l72AnBvHQjTkBKk?=
 =?iso-8859-1?Q?YLSrFxI+7gHTyuQgmJ/vsAY0PpyN8tx7qs8GSAkuWVykrJW5NdmUYnicqC?=
 =?iso-8859-1?Q?cRs8I74g3lXwBdDTfsa9qzIJQWgi19loMBbI6a7EkuOMNAFD4mIMtu3N26?=
 =?iso-8859-1?Q?NJDmJZmY/OrwcujGRr9Jg7Kq/udw6O9m/WmTo/buwsSnR59m3yXLzc1Ykm?=
 =?iso-8859-1?Q?9AIct0lftJrutiJiy0n6J3Wq4KyURLBiBjJ3oAiQ7qGbrDsM4D02CrRZ0d?=
 =?iso-8859-1?Q?3TyGAaqhbaDx4PqpbMgjpwhx3qcrSMNrvEPGCubU4qhKLgNIRBxZHMfA5l?=
 =?iso-8859-1?Q?YSgKdBzaoZSXkO+ZvmC7LREInPvdMst+36gpElXKliYWJSKkHFWfDWL3Zl?=
 =?iso-8859-1?Q?EVC4N8djLTr5dabYvkf++ESLx+O1rGoL45niuhsWrsSwSunlNMzT0BbKrk?=
 =?iso-8859-1?Q?Y5EYzMXW/zl0vhfBr5IPPud+Pw8EQioTNo1gMsV7QDr6VvT76xt8i6FMQi?=
 =?iso-8859-1?Q?7csF3PaGBCIxsQ3IzviIF+yLLNGPVKYBE9DCg9CM6yV/YZ1sbygQHiWYla?=
 =?iso-8859-1?Q?ZEdGSfd3cpvVxTCIJ344RRBHLENEYdq6FpKh+n1CJrw5Bwxid1DM+2AUaC?=
 =?iso-8859-1?Q?vuq8CAW/1WxDsgflYeIppTgDv7mv+XIGPlIiXHtWvXjIOQVg/SKvwORaWB?=
 =?iso-8859-1?Q?q49A8ofWMwvdHRdl2S1wMqW+Hg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w7si3Zbj5+lTfLYnxkughWT97Fzhmvs/OC1yUnzHAa6wsK6vy35nW0DVf7?=
 =?iso-8859-1?Q?3+ypKmx6fki3hZ2X8EPIR7ucQLzz1SMwopLsFYBYdzNTm0YEhy0rvf/VX4?=
 =?iso-8859-1?Q?8aIKHf82HmrNwid/dGB5/NBuqITVV9jY3IiV5W8ytSq9n6NdBzKQE2uemY?=
 =?iso-8859-1?Q?YetEVx+bRIsKYmCNwfqXfm+yhlKYK8B+l4PjE3bsFOxfG6M6ndx5N9V01K?=
 =?iso-8859-1?Q?1V1I1jcegDb7PaFLui3x/7IMjYXtCP4ZE4VMQknO3+TFJER9fr9l/b7W03?=
 =?iso-8859-1?Q?7W/cmSz4GN0nH1llrtNltOdQkXXoKwGtMd/sGwrh38DrqfHAmZeBg56VM5?=
 =?iso-8859-1?Q?vEFzsYUnV7JQU4vdoQxhx2alYRBF8+TPrrpKrWFeDZJyrwC9ujxSvCvzr6?=
 =?iso-8859-1?Q?Ff7GuUtxudOokZJs/ATOsOH2E/OJaZ3th7CJ6rAh0xQl5vzWQN3dJeW1Kx?=
 =?iso-8859-1?Q?TOLS9pQwdL+C4iPnaK3/jzqjDMAOrb6Tc7iuPO8YVUyJ7OYqdxk1umbD97?=
 =?iso-8859-1?Q?z8H01wGnZqRY9Ic4KjkjeGC1k0pohIiueeyaj2aefsnZc2c649qoCnRxCK?=
 =?iso-8859-1?Q?/RxvecOc14Rs04IgE5GHgMG622HbnCtmg+gqoBpBIX0wCV+VK3gSUBsH8N?=
 =?iso-8859-1?Q?MuJjNXsXLXLROZAjqwmb6j0a0GAakPzVAxRc3kJIMpjrLL5j538KuB+dqu?=
 =?iso-8859-1?Q?wVqRPj6anwbPf8T4JvJWc8e0vbpoBwlybWz+jgxPGeClKw6z2aamYlYXfx?=
 =?iso-8859-1?Q?xxq6S9CP2xllYUB2Jtq7KbL+tRZZbxQcrLFUAbfwmYFN9k2j2Lm5tXnzl6?=
 =?iso-8859-1?Q?Noay5trysVfMatBrjy9CNdXE/+jwf7GpHcJmcXZmgW3mLDlMMFbCCQbkTu?=
 =?iso-8859-1?Q?eGDzNsvb6GKM83IVXlzRSh5MKz9eyDMrKk1xQFVdjb9b+YzwwIr950aoHs?=
 =?iso-8859-1?Q?GC/Nw+KD/n8pedVRfRcf9xE/F4qIZAUNj0dDLglDCUqXBPJEcJrQQvNdQz?=
 =?iso-8859-1?Q?R82KbgZJawLa90VG/OUSWhk8ms7RmyjR5Z/k+hOUtnYQDwMHTZUxiKJqBG?=
 =?iso-8859-1?Q?4E6BckHp//SOMxsG9ptEtOjcz20h4WD4Xre250GOJmG8GAFv9O/EB2B/vi?=
 =?iso-8859-1?Q?4ggwfS94cweaFC5eFN/DnhKBhll3oAiN6EzSythii/uYUpZVLLfuwXaoZW?=
 =?iso-8859-1?Q?za82r1trZ+3dsvq+G0t+3dD3ZNdogoGdKMHE4h/qsd/efB2dAEXf8Td1ke?=
 =?iso-8859-1?Q?+BfoJdHAgzfADTyuEi1lsiDWp94Pvx8H6rlJeyOfGv5PCcmFYWsuvjZGZv?=
 =?iso-8859-1?Q?oDDfWZ+Ys2eimDKjkpW1Q+ZlENeH40+PcOIJLsgBKH/SWMkhKUA1bvzo3+?=
 =?iso-8859-1?Q?6oN4OV4dCUeIhXiXxho5K2QAloVk59oyiFmJyFXDl0jwjy7STdkRP3N2u8?=
 =?iso-8859-1?Q?tbkKAztEMOozLXl6J5WLWZwdzzQWCWCQ2spGJ6z7wsCunjs89bA3q6xhSJ?=
 =?iso-8859-1?Q?wHeGx74yCgoxKXnwojaPWnhNLDPeNSpwHxMvptXq+o1RvQ2qkGyk+ACxSY?=
 =?iso-8859-1?Q?Odj9AHdJ0GJyBJejHv2Iz1SFKYjT9KcdMuyPkvBx3isQYIU3sZxNEAKqsB?=
 =?iso-8859-1?Q?T9HLbp47eNJnhDgTi9hDhSTA2arPkYHvEW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c52182-6ea4-4900-c369-08dc6458f2ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 12:20:37.3123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClGkazXurV4mTjMEnRs3RjUZMxmushQ3cndCy9G0Xpj4gvzwGlSy18CDKCHx9QcoZDZZY1LiNTtrVol/17enzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
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

On Wed, Apr 24, 2024 at 01:49:16PM +0200, Maxime Ripard wrote:
> On Tue, Apr 23, 2024 at 01:42:22PM -0400, Rodrigo Vivi wrote:
> > On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
> > > 
> > > On 23/04/24 02:24, Rodrigo Vivi wrote:
> > > > On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> > > >> In scenarios where drm_dev_put is directly called by driver we want to
> > > >> release devm_drm_dev_init_release action associated with struct
> > > >> drm_device.
> > > >>
> > > >> v2: Directly expose the original function, instead of introducing a
> > > >> helper (Rodrigo)
> > > >>
> > > >> v3: add kernel-doc (Maxime Ripard)
> > > >>
> > > >> Cc: Maxime Ripard <mripard@kernel.org>
> > > >> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>
> > > > please avoid these empty lines here.... cc, rv-b, sign-offs, links,
> > > > etc are all in the same block.
> > > ok.
> > > >
> > > >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > > >> ---
> > > >>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
> > > >>  include/drm/drm_drv.h     |  2 ++
> > > >>  2 files changed, 15 insertions(+)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > >> index 243cacb3575c..9d0409165f1e 100644
> > > >> --- a/drivers/gpu/drm/drm_drv.c
> > > >> +++ b/drivers/gpu/drm/drm_drv.c
> > > >> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
> > > >>  					devm_drm_dev_init_release, dev);
> > > >>  }
> > > >>  
> > > >> +/**
> > > >> + * devm_drm_dev_release_action - Call the final release action of the device
> > > > Seeing the doc here gave me a second thought....
> > > >
> > > > the original release should be renamed to _devm_drm_dev_release
> > > > and this should be called devm_drm_dev_release without the 'action' word.
> > > i believe, was suggested earlier to directly expose the main function, is 
> > > there any reason to have a __ version ?
> > 
> > No no, just ignore me. Just remove the '_action' and don't change the other.
> > 
> > I don't like exposing the a function with '__'. what would '__' that mean?
> > This is what I meant on the first comment.
> > 
> > Now, I believe that we don't need the '_action'. What does the 'action' mean?
> > 
> > the devm_drm_dev_release should be enough. But then I got confused and
> > I thought it would conflict with the original released function name.
> > But I misread it.
> 
> I don't think devm_drm_dev_release is a good name either. Just like any
> other devm_* function that cancels what a previous one has been doing
> (devm_kfree, devm_backlight_device_unregister, devm_nvmem_device_put,
> etc.) it should be called devm_drm_dev_put or something similar.

I see what you mean, but I don't believe the 'put' is the best option,
for 2 reasons:
- in general, we have put paired with gets and this has not get equivalent
- this bypass the regular get/put mechanism and forces the releases that
  would be done only after all drm_dev_put() taking ref to zero.

> 
> Maxime


