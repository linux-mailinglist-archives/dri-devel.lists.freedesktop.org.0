Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8C9A3823
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 10:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5910E375;
	Fri, 18 Oct 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhIO62nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16510E359;
 Fri, 18 Oct 2024 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729239138; x=1760775138;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UXqryZRCkuM8OKgMg36FWl4WWEj/kYUytz8ZtVfNaUo=;
 b=bhIO62nB8I/1Gh2UFpmiyF8vOPePsDVnjdY4lvvZstR/tAIIbUd2Fq0I
 WcmYkMO6s5HBpxfPmXoUuIXtgORt7y7TaplsiwUpsngt9VtObIU68sMmf
 WemVKHPq4lkVGfMCuaUYGPTlomYklKaxhsBcReFvl8U+TuVDKSeDU1FUy
 3YVAvN0e7FXqfTNvZgPVBvY4xlpNPa3NngfpLxAN6piQkI20Qk5j3DmmB
 8M8+f2Zp3QfpnCb+Q4coH1hpU4TAsLwIoiup9Qs6XpPfZwRExEJLzdQeL
 43isgohHZQ95ouiMYuuukReTyupQJzvvl0vWmzAMDn6DL6u8I2rkwyrsU Q==;
X-CSE-ConnectionGUID: bL61ialbR+Kheds5rBWP6g==
X-CSE-MsgGUID: q+fliKMZQ0GBXrbMKupZIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="31626199"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="31626199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 01:12:18 -0700
X-CSE-ConnectionGUID: lLS9mAGbQq+I6jNRn0pqBw==
X-CSE-MsgGUID: nuvwovv1Tkm/s/c3HNnUgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83381155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 01:12:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 01:12:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 01:12:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 01:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upOgUDY0TpHofC5BvJJGBs0aSZDrjcpWbq3L/Y9ml1uZY0K2t7SpMAO/hTVe44F23NrmPBuOSP3mQh/8GswiZcvrycSicH2Sw/kCkXV2f9et6se2XP2jLVqzG3MoWb4JZQOFN/8LjEbw926xYX/IMwxk4q/DP/SqKMBNm8JRjr7Y0gzlQdv3E6C21rpsjhBIB/zS/oDuIFDKNd3nVUW/g4m9b3/BRUtljDelaubFCYXQtjlxOvuRw19ztbxKc6LRTPVmbhvHCHLZVdoUdJ5CvByV8XJZw87E3ghOye/tPIUKRR+V93HvfdRjBR4Pz5pd0pVXCf1S8kaX2ytrAQm5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLG3V4T2TUfIwtVjDwQC6q1K4YwWojmKvQMkRvDBIhg=;
 b=tQYH2gOjUqiZ3sTdrgsAlKJNNAUo6sGBw0b6iWBGUmjppp/mhcZt3cv0y5la27EfIkeokP+GTRkNXbxr9ndVFmY0yT4MjRbvwdRLBcq+fvGlr9TB5pqsJiW0Kr12tVGtgSbAOTBvUQ/i8Ud39cRCuBg8kTFnX3+7Qik/dHaLMdh0PXVBm7JyTLXcadDyky2QnIdYGRyqE+m6vaoC8Ac81pKs5GtShYqjTWf7lrjr07nFautgU9pYazauqG64XH5OfL3xjdxkcbf2rKH+lpgmb/ZJs/fOsgZzn99DCwqgblX+gs+53Y888y9w9lUWjfm+zlaO6hJBT3HnoX83PzLNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 08:12:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 08:12:14 +0000
Date: Fri, 18 Oct 2024 08:11:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
Message-ID: <ZxIYLWspJKm3pZLo@DUT025-TGLU.fm.intel.com>
References: <20241017233941.1047522-1-matthew.brost@intel.com>
 <20241017233941.1047522-2-matthew.brost@intel.com>
 <02faa9e057906d7e3dee0127ade83974e33182e9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02faa9e057906d7e3dee0127ade83974e33182e9.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 53914a4f-596c-45dc-5c8d-08dcef4c9322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KvpKNIhnbvEGS9whNILzQlc/BTQkNPa02WRsPvMgtWRFHVBjnWfU4kI4lK?=
 =?iso-8859-1?Q?KtXuJMLR+cJIbo+TvnebrdNuRNT/Lv7jvoK3VGVdJ5jIMQjoZoEmFYvWyL?=
 =?iso-8859-1?Q?4wCdMIpZG8dsvGf8ge9r6Hqs2iNSovFSst5+LMAOrdF8C68MZfQ5cpBzo/?=
 =?iso-8859-1?Q?MWOycXtsYWRxpJc+4ZAU4FsDeD9wwIl8QPw3KlT+UCEft6RA/8FnkvWx1R?=
 =?iso-8859-1?Q?XJY2QdmL2wRi96TaqlWmpborrKBZpZrvFl5PJWGUhAvPiV9/zCBl2lnOTO?=
 =?iso-8859-1?Q?+VOUrp7h/k+AiXyEOZO9SArEzSe8RZJbR1wNXTiHQnqSTV6e1/G/R3IyCn?=
 =?iso-8859-1?Q?eDpqlFFavnqwX+fnzAZbW1IomLWu+/XtdMAVRbUXQHuu7MITtpEevr8bTj?=
 =?iso-8859-1?Q?7rhHEncItalZQ63Tvlm2RwC2EFhuDkI0h8Cd4yg2AjRe0otq3hiDzU1SwV?=
 =?iso-8859-1?Q?SINYuOucLmEMLY0ScUWv21ZpKDjNKrK9CYUqSB+lufYwTG6U989ibP2p/w?=
 =?iso-8859-1?Q?i3xDKIWtW2+EcVuCPbNIKzKEf/aqN3i5nxSXyTdNitI9EA4vi/PQAPdEQU?=
 =?iso-8859-1?Q?r+yGG0k5E1gURjg4uEzO9H0BweUWh/hulrUoWJLg54f/6dMbzYGJVgJVBb?=
 =?iso-8859-1?Q?K1XP+SCtRRqUPqRj5zU7eRPpD7sGZPnQMb03RFmMMpLfh6qrK426Mex3kF?=
 =?iso-8859-1?Q?cacyk8c+JER8/Dr+2YZQQzQA+g6Yzb1MaegXeXOmxfMhCsvjMMZemnA5oT?=
 =?iso-8859-1?Q?kw1pqJ83fmrKsc7gngHWJlwM/V4lGazl0I1EI1VcPX9es4GiBIq5jA33pv?=
 =?iso-8859-1?Q?54baYqkRvA3odF+M5749oh9f5ELvvoedLE05xygwQqwSEiQMCr4DRYnN6J?=
 =?iso-8859-1?Q?QJZ+yphIZpvTKA4uXlCHQRT8KQw3XIezhYsjWWnoBG8lNmPvrezLsnUw0o?=
 =?iso-8859-1?Q?AuTiUarrE5CjynjbJibXNLWNAl5W0p0TezYuc/VNjgXM/6037/dtzShLLV?=
 =?iso-8859-1?Q?mwv2w0UgXhwmfg3Kr9gXzlv5oEBEPB1lqRwlqGad+ujdMnzewKuHIFra9V?=
 =?iso-8859-1?Q?ZdEaBnf8FoIq2vFHoHbzWf1Tz09dM49HaC/qIGZTsDdwKBIxVujOmNY4CN?=
 =?iso-8859-1?Q?6a+SMNo8jhS5ZTDSIyfgFpxQQ2ryZ32gyJGuwJv92MPwBE1xPG2BsfLO1B?=
 =?iso-8859-1?Q?DNIspPjL+kCUyMjbW3NVv5SSoAZrUwfNEDOpLELlKqHmRTelPioSjOwEKY?=
 =?iso-8859-1?Q?gs7MbTe9hWvU4IEa4lddMTM1I7+MK7Y37F+53pbDpdcwwfzlRkCgzns1hA?=
 =?iso-8859-1?Q?LYK+T74pegX0kI7BafXDLijfLyAamLiOi9i0GMBcch/Qz2dRlOqJqkN6rR?=
 =?iso-8859-1?Q?m/p9uzZUiV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qW0jQKyO2V36oMVUZ6XRc45QacUCyLO+7Jr+HSsDK6ATxgWSuvJmQpTf9r?=
 =?iso-8859-1?Q?G0kGVh7MuPBoY51iuKBSuONbv1CVX23828dvRXp3xO5w15Zlt1JWnAGhq0?=
 =?iso-8859-1?Q?T0yS/7/nyoJjEUH4YIzWS7BMtzhxfC3xeD1t2q94sYR3V1Cg/ev8JLec8W?=
 =?iso-8859-1?Q?OC1oapGv9vE9Xuz28A8sX94st7xqk06kRHSqiITWacKnrfqGXoWieUgBVe?=
 =?iso-8859-1?Q?vISdvoekB8jyEqZ34cwOxOdrZJqBqNcoG9ioILLU6AlcXFUxicknD4X2nT?=
 =?iso-8859-1?Q?nmtjX24EHTX6i77c3g3uFjWZVR5kKdjqJ9M5O2Dk31oVoPStiHt1Modd3n?=
 =?iso-8859-1?Q?lQDjPuQNY3YXUoyuekAW5USr0RCJ3V4LSh0Zn3hIIgOi8DKlWSTwflh3nd?=
 =?iso-8859-1?Q?4W3hkttWbKEGUHNUVEgat0RZ68L/ozVOOqOTkHTwGjwaaerlPynzDCCY/E?=
 =?iso-8859-1?Q?xJKK+gd5o3Enwp7CBfqcru3dDFB5HVROJMGIiocBROstnJDQvrwB+SN229?=
 =?iso-8859-1?Q?ZXxrkr8a+B/QFnLXmDNuY8fK8ALryQ5V/yNEON3O1qsVuNadUSt3n7Pxam?=
 =?iso-8859-1?Q?0x2Zufir/GzHSqd7lnXTt04EQpv6Y4QfFAPnbbbldUAo5mWfb6AsGLCVip?=
 =?iso-8859-1?Q?mLExC5bods+OGcPmKq50vC9Vi0tCQalYfY1o5iHIQLuKpVWsdikoBHMnB1?=
 =?iso-8859-1?Q?s7XnhyWAcdx+5FtyDiXs5Tni3iRER2xg/euahwtNEnyonU1OmZzE/UtYMk?=
 =?iso-8859-1?Q?38Z57bRCEh01YM/ix5WALGL4DCVajkCM2X98+inv4NXUkqyjRS67UCaJSM?=
 =?iso-8859-1?Q?lS7YaEv60FbWvfACtjokMfgcLLKRdiV9iAUZsuXoSFw9I7bRhZPKrnGdgc?=
 =?iso-8859-1?Q?KXQVMsTLOLrG0JRDwc6NqqHEazQJmVDZ4flJyvTAWclGhFbzMiyMSsBCEH?=
 =?iso-8859-1?Q?d/wbjDRmFvHRQhBL+KOYrq23seu5rCFVv5quc0E3s54crQAktR9qmHXePm?=
 =?iso-8859-1?Q?K4JvV+NJmU33AniwdqFawiqrVdsxfbgkzxYKsbY7iSVpWQz07FFaud59IH?=
 =?iso-8859-1?Q?f0TbyUxbgGEyjujGw+11E+wIV2i90FDKxwsgbkmZn9XCk6Dju6dr1w2jMI?=
 =?iso-8859-1?Q?v28rqDKHdq5v69hZyt4n3kA2c/ZPPdgl+Ov+xRh+i7CwnlRDF1x0S92dqE?=
 =?iso-8859-1?Q?e2QnsQMdIsr5Y5nx8llM/brjAWJzlCJL74AOdniG9X2e1joE5GzHxXOVs1?=
 =?iso-8859-1?Q?LZfbsdZMTfq7BGo9y7+xfg1pQFjm5acf9C+yF5nnGoB5+oBXkC1c7Nn+qM?=
 =?iso-8859-1?Q?/E3jnnAv6CD5KVteZSfHZnrPQUb1inlwHcm0zrC3gh9+nNVO5OfmcvS7jf?=
 =?iso-8859-1?Q?Wv3Gxo+6krOUpHBegHK74XfZQ7+xgtBc6FFymqkrZkSw50xozZvHrKvvVb?=
 =?iso-8859-1?Q?qq8wDVMENE4JyiUtI0rtN6a7x4DzV2WkXXuVgIYdY+jZVgpCLvZ69qudir?=
 =?iso-8859-1?Q?v6Ial3ajatmQokQuTOwkyHX6XNyO/zCA2V1cxBcxdKARA6yqiGtgIOPJj3?=
 =?iso-8859-1?Q?vAHqwyno/URN7/ChsFNihD+S4bhibjvJG2YP3QYkcLJ7DpDV5jcsKvxUZs?=
 =?iso-8859-1?Q?OHVI+aBvNMLXrtPkHg1/KyKQR96Kiu23tqnOr8aKgxJtuyUU+ll7Xg/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53914a4f-596c-45dc-5c8d-08dcef4c9322
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:12:14.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5mrDl3zXliFuc35yIuctQYxRcZG2PughqJEo0ydJVfsK/hQGdojXGMbmwu7HhrQnF6Ri3lflpohU1cTqnVGXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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

On Fri, Oct 18, 2024 at 09:27:48AM +0200, Thomas Hellström wrote:
> On Thu, 2024-10-17 at 16:39 -0700, Matthew Brost wrote:
> > Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
> > easily be accessed. Add ttm_bo_access, which is similar to
> > ttm_bo_vm_access, to access such memory.
> > 
> > Visible VRAM access is only supported at the momement but a follow up
> > can add GPU access to non-visible VRAM.
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
> >  drivers/gpu/drm/xe/xe_bo.c      | 48
> > +++++++++++++++++++++++++++++++++
> >  include/drm/ttm/ttm_bo.h        |  2 ++
> >  3 files changed, 64 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 2c699ed1963a..b53cc064da44 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct
> > ttm_buffer_object *bo,
> >  	return len;
> >  }
> >  
> > -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > -		     void *buf, int len, int write)
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long
> > offset,
> > +		  void *buf, int len, int write)
> >  {
> > -	struct ttm_buffer_object *bo = vma->vm_private_data;
> > -	unsigned long offset = (addr) - vma->vm_start +
> > -		((vma->vm_pgoff - drm_vma_node_start(&bo-
> > >base.vma_node))
> > -		 << PAGE_SHIFT);
> >  	int ret;
> >  
> >  	if (len < 1 || (offset + len) > bo->base.size)
> > @@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma,
> > unsigned long addr,
> >  
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL(ttm_bo_access);
> > +
> > +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > +		     void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *bo = vma->vm_private_data;
> > +	unsigned long offset = (addr) - vma->vm_start +
> > +		((vma->vm_pgoff - drm_vma_node_start(&bo-
> > >base.vma_node))
> > +		 << PAGE_SHIFT);
> > +
> > +	return ttm_bo_access(bo, offset, buf, len, write);
> > +}
> >  EXPORT_SYMBOL(ttm_bo_vm_access);
> >  
> >  static const struct vm_operations_struct ttm_bo_vm_ops = {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5b232f2951b1..267f3b03a6d0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct
> > ttm_buffer_object *ttm_bo)
> >  	}
> >  }
> >  
> > +static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> > +				unsigned long offset, void *buf, int
> > len,
> > +				int write)
> > +{
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct iosys_map vmap;
> > +	struct xe_res_cursor cursor;
> > +	struct xe_mem_region *vram;
> > +	void __iomem *virtual;
> > +	int bytes_left = len;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> > +		return -EIO;
> > +
> > +	/* FIXME: Use GPU for non-visible VRAM */
> > +	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
> > +		return -EINVAL;
> 
> Is it possible to check whether the bo is actually already in cpu
> visible space even if the flag is missing? Also is there an error code
> convention for the access() callback? Should we return -EIO here as
> well?
> 

We should be able to setup of cursor, walk it, and it if all in visible
space proceed with the memcpy. Let me look at that. Eventually we will
need GPU access based on the eudebug feedback but making this better for
now is probably a good idea.

Yea, EIO seems like a better return code too.

> > +
> > +	vram = res_to_mem_region(ttm_bo->resource);
> > +	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0,
> > &cursor);
> > +
> > +	do {
> > +		int wcount = PAGE_SIZE - (offset & PAGE_MASK) >
> > bytes_left ?
> > +			bytes_left : PAGE_SIZE - (offset &
> > PAGE_MASK);
> > +
> > +		virtual = (u8 __force *)vram->mapping +
> > cursor.start;
> 
> Is it possible to use (u8 __iomem *)?
>

Yes, this is copy / paste from somewhere else in the driver.
 
> > +
> > +		iosys_map_set_vaddr_iomem(&vmap, (void __iomem
> > *)virtual);
> And no typecast here (virtual should be __iomem already)
> 

Will fix.

> > +		if (write)
> > +			xe_map_memcpy_to(xe, &vmap, offset &
> > PAGE_MASK, buf,
> > +					 wcount);
> > +		else
> > +			xe_map_memcpy_from(xe, buf, &vmap, offset &
> > PAGE_MASK,
> > +					   wcount);
> > +
> > +		offset += wcount;
> > +		buf += wcount;
> > +		bytes_left -= wcount;
> > +		xe_res_next(&cursor, PAGE_SIZE);
> > +	} while (bytes_left);
> > +
> > +	return len;
> > +}
> > +
> Otherwise LTGM.
> /Thomas
>

Thanks. Will split the TTM part and Xe parts in individual patches, add
kernel doc, and fixup comments in next rev.

Matt
 
> 
> >  const struct ttm_device_funcs xe_ttm_funcs = {
> >  	.ttm_tt_create = xe_ttm_tt_create,
> >  	.ttm_tt_populate = xe_ttm_tt_populate,
> > @@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
> >  	.move = xe_bo_move,
> >  	.io_mem_reserve = xe_ttm_io_mem_reserve,
> >  	.io_mem_pfn = xe_ttm_io_mem_pfn,
> > +	.access_memory = xe_ttm_access_memory,
> >  	.release_notify = xe_ttm_bo_release_notify,
> >  	.eviction_valuable = ttm_bo_eviction_valuable,
> >  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..8ea11cd8df39 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> >  int ttm_bo_evict_first(struct ttm_device *bdev,
> >  		       struct ttm_resource_manager *man,
> >  		       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long
> > offset,
> > +		  void *buf, int len, int write);
> >  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> >  			     struct vm_fault *vmf);
> >  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> 
