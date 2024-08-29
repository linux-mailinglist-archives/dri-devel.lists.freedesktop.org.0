Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEA96526C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEF310E792;
	Thu, 29 Aug 2024 21:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBmxbQFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013B10E791;
 Thu, 29 Aug 2024 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724968490; x=1756504490;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FX0V8NtWoMcAeThP+kEKLjQHBtTLkNWZoWP3CA8w4cI=;
 b=FBmxbQFDBo5vdW5haQuLy2M5MEA4MahlCHAKRbecw7yJDhPEY6hX2W3Z
 zI/TYOynXtLkzkzvqXhew4qMxmpGd4MUnEEGhFXUAW9WJpTqoNHSHrNiO
 TvZTjpYYaAOADmZoj718dCG/4v2436Bc1rlVYbFm9/oz1AJL9x/43BE2U
 0LhiXJ/+DKj9abFZQ9xD9WftaDU1KDhH/uak/7xsGaHPS9wD1mk+7cNDY
 qnB3HKpCgHqIQKt5uh99Kddmy3ShSzySgUturma4cP9rr8MHrPdAKyTPb
 Zzczb3/Z5rYpMlaLUoIBfhNcoMdpyUW0TvgOqPsv95Dn8H3F/eAfTwvbl w==;
X-CSE-ConnectionGUID: OrH0MvS5RuqsQAZeWlvU6Q==
X-CSE-MsgGUID: 0ieSZJlnRcyKKwH+1P5Mrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34213661"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34213661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 14:54:50 -0700
X-CSE-ConnectionGUID: 1SlyBy52S3C2A3yYPBKZmQ==
X-CSE-MsgGUID: DrP+W4G7R9GsaF4hzVJJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63702383"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 14:54:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:54:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:54:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 14:54:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 14:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwxkQQQMnrxUthFTmIRdeQbI85HoBdZ1qxPEjkZF1ENR/ywbDbXiUU2H5b7xA0NqiPl1l8K8Ap4Ord8zLUtIZlC/Kmxq0TXCNItlWlKdtkJbishJOWbSYmRoeS6B5GUJ7TsZlsK/QN5ZEBD0/qBU5e8TGwUP5KoBACUnE4fh+E6N2m8kdF2S7gMN1/61iXe+EfHykmdJqc7PQEfbE3QKGu1rRC+I1sI2mMzV55eCDLlVMqQoPAybC2b9jyJtHl4kM+gXKP873x2HPCvJ/lKUTNQTqfbiR/byx/qVYWShqa6muDj2HZs9SAFRm+Vw4JjRiuka3zXFVC9YQrRE9k5K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pny/hFwqkunTBQAUU5UwMshETqU5+TyzWNucmEc9Li8=;
 b=k208QR9+ThnFZJ2PKstXYGSTJvtt+GjHKUUInTOgnID6yZP7MRuICoYs5H1fAXd9p6lbMy2fYWZ2kZBy3hJgqDiKsy7Rkw3y5wSg9D40g4n/tpXVjQxSjYGXKUsjrB/MqneCQix4tSRoWFsqV3LF6hSs8H3j64v3esAWTZt0r9/E9WhhlDeiOuk1Affr+EYDbs508/Fi3W1jXSUM46jF8wDijx8/dQxfvVK9h6K6LVbAxm8yVvs2F/zFnb6fTiSylGfY3bZk9VBXiSZwE9v/ct8mfPbblg4EQtYIdSz1C111KyOaxOFVpb+qwK0yoAHoYPat1ipdZyQ0jCmVJ24CJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 21:54:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 21:54:40 +0000
Date: Thu, 29 Aug 2024 21:53:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <matthew.auld@intel.com>, <daniel@ffwll.ch>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtDtyLpzgZc2wgB6@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <c7c0aea0-cbf8-48cb-829e-a9c7b1766494@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7c0aea0-cbf8-48cb-829e-a9c7b1766494@amd.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 207c8dcf-bbbc-4ae4-654f-08dcc8752ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vl6ezV+fI4c1KqaWRzgHQP+O5vmBm0mXKvvvvWlSOHvSFlql9s6iKh0YnL?=
 =?iso-8859-1?Q?3/v7JOtw62dt/hEk2+LUtzCZHXcLVy4DXLzi5x/ra4jkdWHW4YNYnydmev?=
 =?iso-8859-1?Q?l5sX4HMb/ei10ZU+pHNI9RSPVFNBS8B/UuLr6CJTjECegZd1QcgGXkdrI3?=
 =?iso-8859-1?Q?iRg78Y+ZKiNsQ1ROJbXnP85khL7R8vd2JnqB/PTsII4QOWlQFjqpdsmVKj?=
 =?iso-8859-1?Q?4ynztj/BS8e8bg5AbMTv8NQO55r4IVOZM1MqV3N2c+MDb+prg7IVEgLmSy?=
 =?iso-8859-1?Q?8sHTiq3kuuiPQTZcan/qu3WWWw3xWRKMGYyROZpfOYHAbK6qAhrafjbOIe?=
 =?iso-8859-1?Q?K8nnGFAZJz9vQy53cO/9ExHRNacF35iwCtaabD/ksWyO+dWt1ogaApknN7?=
 =?iso-8859-1?Q?gj6ojKZ/0zme3il4ErjUAk+WQ14EYA8rskC5j3vh5XQcQpYS1Tzjw/9TC/?=
 =?iso-8859-1?Q?HELJhLE4cqRB7QUxhxBAHhkabij/RN9NVLadgvz1Xqwk6bD7I8dt068bMh?=
 =?iso-8859-1?Q?SlQ83VbqxI1khTwHz47NVxpB/sAay3XXwedsZAQvl2OQL7scNcts35wjif?=
 =?iso-8859-1?Q?NDrqJHLg481XwzdqDvs4aa+ZIJS9xGc17qK/I5gdRD8D8yvjF0wRreecHU?=
 =?iso-8859-1?Q?i7F+b37m/hA2WwiMP3d943TjIMLRRQpCCIRo2WLejMvBdlovxAF6nBAfUw?=
 =?iso-8859-1?Q?uDTula4F6LOgxIrR1CoB9ZSIKd+hdAOSmVdowzX5rPBU6kRYeMGJ/+d1Hu?=
 =?iso-8859-1?Q?B0nM4uOL42DtEo6E2j2QrI7wyLpyItgQGukLJ2WfjlKBFDf77yZBkayT0A?=
 =?iso-8859-1?Q?tyuRot9uoMSIJWQTfQiIYWeeWE2Gp9kA3LHj9b6UYR5jpUK4hbytkexri5?=
 =?iso-8859-1?Q?Eyd0g7xVQnClSKKUdS/cHGaMpjT4HtDFfmWV2XBdQp4fcewtX9J7ymuIEN?=
 =?iso-8859-1?Q?yA+LcojUP5RU7c3zN0c/Xwug043Ftm2jOuo5j1STVeQS0URxkeLvxez2/j?=
 =?iso-8859-1?Q?QIGMik1dxfkOxtpgg+eKEEb1OtZwYmov82KOA1sPUKvEgcQU+HGxKogxTL?=
 =?iso-8859-1?Q?F1mwrf/9HVo1gHe/iXoss3EWh430SSNdlj4eFKNJ3MrTA+31dpBBONRWxt?=
 =?iso-8859-1?Q?ftWnkWD6qKAei0zcZKwpi+mR40NDsn1e3a2DnxDlRpTnZT0wh7T7ttgIqH?=
 =?iso-8859-1?Q?RBh+rBS1bKjjC+jKD4zU1Lnbsb6dL/DYnhEOiy2FOxifp/NAbO8C9vJ5wM?=
 =?iso-8859-1?Q?rrU7WIO4NYE0lItEkMbh/pbQJPIDMmzSN+3O7qGJ2kXWN+RCpHM8U26Dfi?=
 =?iso-8859-1?Q?AU9WGNEe+7RSNudKwqZxkdOcrfVtVLm+YM9QxC+AwvqUqu0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H7T5EekOV3HPRcJe/4XXfST2C1fEmbMWo7HmWgI6dpYyMxigIGnIaDoWN3?=
 =?iso-8859-1?Q?9LNkuo0Gzt0sb3GTk6dARuuv9FCivUjV5FRpjOcaKc/6ma8oSLUvHTuK45?=
 =?iso-8859-1?Q?i60yIGMktSRrhCqoc0ZApKWEMui6i+TZuWT8Rcrmdv6yk2dfD8tkGwUgvN?=
 =?iso-8859-1?Q?v/3Abj2dprtoPG0WtBHjR0jDDLCZrIxLlHLcqyJSOe9o3NAFgvfClhtjTD?=
 =?iso-8859-1?Q?bwfIT3Q8r1qKWBZnBgRbaMyn5SCf0+wLqH/dWYO6aJ0QNbcMgJdhHg95VN?=
 =?iso-8859-1?Q?Wfaew/PIgX6dIQ9LjR88SLqqau8xdA5qmpZeC4vdcr9oGXt0UzBPzWZWBp?=
 =?iso-8859-1?Q?4nCTvm54KmoNfrBPa9lJRXCnFdIBH4g++2uP5gJ4zhfA/S6O3fuox6W8fp?=
 =?iso-8859-1?Q?C+9Ao8B5ga893mGRvCqBvAUQB+nauxw4VLzGtgRQXC0tOpSduUAJ/42R4+?=
 =?iso-8859-1?Q?x4pkL/G715KkzgZLoWXx2SK4IW5z1mmaInFvDJctfNtWS4s0h/q/n/AEnS?=
 =?iso-8859-1?Q?PNbOggFl+I9JBRbZwJneNo9ARowoedTEDRM90JKTTg/Z92+0KZrIGy/f6H?=
 =?iso-8859-1?Q?yrqmBo419sF4Pn1FZbzSjf3EhULnCmwE1Mqr8bs/LakIcamRpmeGW+w3+R?=
 =?iso-8859-1?Q?yOcZQrmbaAXQp2iYU4B9aK+yZpH/GFdjnmveX1aXnTThhdMRp4BJi+gvcm?=
 =?iso-8859-1?Q?KUN91j79L36eJiRlCDlP4Ydbx0gXDy8xydI1qhASKFtWnOqQfRq3SDB6pI?=
 =?iso-8859-1?Q?GwZUBSGWw+bku/vtrBph3pH0b1r/bCnSSyVmkZXNl08cax/ZrRSgdkOmEd?=
 =?iso-8859-1?Q?g+XU+9H28A82Rn0LCQ8yjP/9ytuTS0+/1jVXAZTUYTT2XzW2/vNoDRSsGl?=
 =?iso-8859-1?Q?KP61kep1rN6BgdETnuFDZF52UXLHjs08vGp2oqiLS5UIG3IWjg72E+wS2u?=
 =?iso-8859-1?Q?QYwECWN5/P8FIQDmwA15og3hf5A5DptAKfeqfnL7cI/w0r85NUCobxpi1t?=
 =?iso-8859-1?Q?qiGr0KrR8MW5S4oTiyYvE1+JxDJxYnRuC2zsvUUyAH6WM89sI3yeUkcqHF?=
 =?iso-8859-1?Q?58Hv8zNyoq5h5vO6DtNfq7IwfhaR/FvaDgQZuOeHP/Uww5AwVe6R+3eJE/?=
 =?iso-8859-1?Q?lFdjJ5x0NkPmjlInV2+erSOpaOW9nYJS9EzFTg7qMTFkm4/D4f1w4olE64?=
 =?iso-8859-1?Q?Zpodgw++zTVBpZTjsNY9cnFi848Lce7y6oouAPI+58qzaGSEwn9SIFTi5M?=
 =?iso-8859-1?Q?oTpST9xqKHq3xTXA0kqHoJGgf0NVxKHv2IfkvYyOkfx1DlNh9YU29wEVbh?=
 =?iso-8859-1?Q?K2aQh5AxwtyvGC4ZBcIQG4ERSZMg+0bIxYIG219uERM2ydwXQpvlXuy4Vq?=
 =?iso-8859-1?Q?NvCS6pcZP1kCHGzcB4Rm88EPUzeW2UGCfHNJeEM4noVFdjcoKcXbbasJrp?=
 =?iso-8859-1?Q?Dh8V++IQd9InjvoTRnXks4CMjAh3sFkzNBGalXLr3c090sBOU/SQR1hwIU?=
 =?iso-8859-1?Q?9zb0l/88XA2AXhFESOWdw/SNxTQnfiYssNzKHnzW8RRE9l5Y8GVkt/+zu9?=
 =?iso-8859-1?Q?d5263SynSdzUnMzPtkfAuqx8shjAdnD+vzMPi5DwJ4IbnLbm3y/Bdk8DfW?=
 =?iso-8859-1?Q?Z3K7XiqZn8zG7KmCXTlrchZ7um21bhLPOzvp5iaKRVBc4ZgetYd8W76A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 207c8dcf-bbbc-4ae4-654f-08dcc8752ea1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 21:54:40.0092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpiiukBMZE/5Fh+6OPA+dM3iy+1BOpgoRsB1FZFQM/Qi3p4BhyOb+l+Z+luqV+OGtgkBioagu/WNHsZDAdCzdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

On Thu, Aug 29, 2024 at 04:30:11PM +0200, Christian König wrote:
> 
> 
> Am 29.08.24 um 11:53 schrieb Thomas Hellström:
> > Hi, Christian,
> > 
> > On Thu, 2024-08-29 at 11:24 +0200, Christian König wrote:
> > ...
> > 
> > > > > - Unified eviction is required (SVM VRAM and TTM BOs need to be
> > > > > able to
> > > > >     evict each other).
> > > > So core mm handles this by just roughly equally shrinking
> > > > everything.
> > > > Seems to work, and it has a pile of object shrinkers, and the page
> > > > lru is
> > > > also split into page cache and anon memory.
> > > > 
> > > > I think you need to put in more justification that unified eviction
> > > > is
> > > > required than just stating it, because a look at mm/ gives a very
> > > > well
> > > > established counterexample.
> > > > 
> > > > > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > > > > certainly
> > > > >     require a dma-resv.
> > > > So from the TTM side we need exhaustive eviction, or at least
> > > > something a
> > > > bit more exhaustive than what ttm currently has. Note that i915-gem
> > > > also
> > > > never really got to perfect exhaustive eviction, it's just a pile
> > > > better
> > > > than ttm right now.
> > > Please define what exhaustive eviction should mean? I think I know
> > > what
> > > it is and I have been pushing TTM into the direction of solving this
> > > for
> > > years.
> > We internally refer to exhaustive eviction being a client is always
> > guaranteed to eventually make progress in obtaining non-pinned vram,
> > typically by incrementally locking and keeping dma-resvs across a
> > single validation including validations during buffer object
> > allocations.
> > 
> > > The last missing puzzle piece is to use drm_exec for TTM evictions,
> > and IMO keeping the dma-resv locks grabbed during eviction until at
> > least one unit of progress (one validation) has succeeded.
> 
> Yes, exactly that. My guessed understanding was actually correct.
> 
> > 
> > > but
> > > apart from that everything should work now.
> > > 
> > > 
> > > Regards,
> > > Christian.
> > But as Sima pointed out in private communication, exhaustive eviction
> > is not really needed for faulting to make (crawling) progress.
> > Watermarks and VRAM trylock shrinking should suffice, since we're
> > strictly only required to service a single gpu page granule at a time.
> 
> Yeah fault based memory management should be able to keep working as long as
> the page isn't re-migrated before you make any progress.

I prevent against that via eviction_valuable vfunc. See here [1].

[1] https://patchwork.freedesktop.org/patch/610982/?series=137870&rev=1

> 
> Since the number of VRAM or system memory pages is very high that should
> basically never happen.
> 
> > However, ordinary bo-based jobs would still like to be able to
> > completely evict SVM vram. Whether that is important enough to strive
> > for is ofc up for discussion.
> 
> Yes, exactly that. Felix, Alex, a bunch of other AMD folks and I came up
> with the same conclusion at AMD internally as well.
>

Agree with both of you. Landed on BO rather than rewrite the world as
TTM appears to everything need for SVM aside from an impedance mismatch
Daniel has pointed out resolved by refcounting. 

Matt

> Regards,
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > 
> > > > Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
> > > > eviction is going to win because the shrinkers can only trylock
> > > > dma_resv.
> > > > So this part works. It actually works so well on the system memory
> > > > side
> > > > that if we're not careful we can trigger oom, because we're too
> > > > good at
> > > > getting at all the memory.
> > > > 
> > > > SVM VRAM allocations otoh do not need exhaustive evictions. Or at
> > > > least I
> > > > don't see why, because the idea is that thanks to gpu and cpu page
> > > > faults,
> > > > you can always get out of a pinch by just trashing everything for a
> > > > while
> > > > and migrating the handfull of available pages a lot.
> > > > 
> > > > > - Likely allocation size is 2M which makes of size of BO (872)
> > > > >     acceptable per allocation (872 / 2M == .0004158).
> > > > > 
> > > > > With this, using TTM BO for VRAM backing store seems to be an
> > > > > obvious
> > > > > choice as it allows leveraging of the TTM eviction code.
> > > > Except it requires that you hold dma_resv, which brings in all
> > > > kinds of
> > > > pain. And for eviction we really don't need a lot of
> > > > synchronization, so a
> > > > lot of that locking is not needed, unlike the case where we have a
> > > > cpu
> > > > fault, where we absolutely need mmap_lock and all that to make sure
> > > > we
> > > > fault in the right page.
> > > > 
> > > > But for eviction we only need to throw out some pages, if we're not
> > > > entirely precise with picking the right ones (or have no idea into
> > > > which
> > > > vma they're all currently mapped into) it doesn't matter. That's
> > > > why
> > > > migrate_device_pages doesn't care about any of that at all, it
> > > > doesn't
> > > > need to by design. But by bo backing memory you drag in all that
> > > > stuff
> > > > that's causing headacheds for eviction.
> > > > 
> > > > The only thing migration tries to do is remove all pte, and if that
> > > > succeeds, move the page. Specialized for the gpusvm case, looking
> > > > at mm/
> > > > code as cheat sheet, we need roughly:
> > > > 
> > > > - reverse mapping structure like anon_vma. Except gpusvm can assume
> > > > that
> > > >     there's currently only one gpu side mapping, so we can just
> > > > stuff the
> > > >     gpusvm an va_address into the page, and protect it with the page
> > > > lock.
> > > > 
> > > > - we need pagetable locks, so that we can manipulate pagetables
> > > > (well
> > > >     specifically make ptes invalid) without taking any other locks.
> > > > 
> > > > - everyone else inserting or removing ptes for svm mappings also
> > > > needs to
> > > >     lock the page, or we have races. This might be the
> > > > hmm_range_fault races
> > > >     you're seeing when allowing vram pages, since I don't think
> > > > there's
> > > >     anything else stopping the page lookup otherwise from
> > > > succeeding.
> > > > 
> > > > - we might also need to stuff migrate ptes into the gpu side, like
> > > > the cpu
> > > >     does, to hold up refaults before the migration has finished. But
> > > > I think
> > > >     those are only needed for anon memory in sram because there's no
> > > > other
> > > >     way to find the right page than swap pte entries, of which
> > > > migration
> > > >     entries are a special case.
> > > > 
> > > > - core code also expects us to handle the page refcount correctly
> > > > for svm
> > > >     device memory, so we can't free the pages like normal bo pages
> > > > either
> > > >     directly to drm_buddy.
> > > > 
> > > > Now typing this all up will look an awful lot like what you have,
> > > > with the
> > > > dma_resv lock serving as the page lock and the pagetable lock. The
> > > > only
> > > > reason is that these locks are much smaller and nest within all the
> > > > other
> > > > stuff going on and so avoid the inversion issues.
> > > > 
> > > > So one annoying part is that this is a lot of pointlessly looking
> > > > typing.
> > > > The other is that it's full of races, because core mm really is
> > > > yolo all
> > > > the way down. So lots of ways you lock the wrong page and fun stuff
> > > > like
> > > > that, but the few cases that matter work:
> > > > 
> > > > - svm fault handling with hmm_range fault retries with mmu
> > > > notifiers. Note
> > > >     that we need to have vram pages locked and the notifier retrie
> > > > needs to
> > > >     be under the pagetable lock, or there's room to escape. At least
> > > > that's
> > > >     what I came up with last time I thought it all through.
> > > > 
> > > > - migrate_to_ram: it will hold a page reference which we know was
> > > > the
> > > >     valid vram page when the cpu pte was locked, but it might not be
> > > > it
> > > >     anymore. So we have to lock the page and check whether it's
> > > > still gpu
> > > >     mapped, and if not retry the entire fault since most likey
> > > > another
> > > >     migrate_to_ram has succeed meanwhile in parallel.
> > > > 
> > > > - for eviction we don't care, we might actually be migrating a page
> > > > no one
> > > >     even wants anymore.
> > > > 
> > > > Now I think you can get all this done with the dma_resv lock and
> > > > maybe the
> > > > bo refcount. But it does involve a tremendous amount of headaches
> > > > and
> > > > impendence mismatch, because that's not how page faults and
> > > > migrations
> > > > work in core mm.
> > > > 
> > > > Cheers, Sima
> > > > 
> > > > > Current migration policy is migrate any SVM range greater than or
> > > > > equal
> > > > > to 64k once.
> > > > > 
> > > > > [1]https://patchwork.freedesktop.org/series/133643/
> > > > > 
> > > > > Signed-off-by: Matthew Brostmatthew.brost@intel.com
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_svm.c | 81
> > > > > ++++++++++++++++++++++++++++++++++++-
> > > > >    drivers/gpu/drm/xe/xe_svm.h |  1 +
> > > > >    2 files changed, 81 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > index 4372c02a341f..fd8987e0a506 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct
> > > > > drm_gpusvm *gpusvm,
> > > > >    static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > > >    				      struct xe_svm_range
> > > > > *range)
> > > > >    {
> > > > > +	struct drm_gpusvm_ctx ctx = {};
> > > > >    	struct dma_fence *fence;
> > > > > +	/* Evict any pages holding references to vram allocation
> > > > > */
> > > > > +	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
> > > > > +		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm,
> > > > > &range->base, &ctx);
> > > > > +
> > > > >    	xe_vm_lock(vm, false);
> > > > >    	fence = xe_vm_range_unbind(vm, range);
> > > > >    	xe_vm_unlock(vm);
> > > > > @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct
> > > > > xe_svm_range *range,
> > > > >    	return (range->tile_present & ~range->tile_invalidated)
> > > > > & BIT(tile->id);
> > > > >    }
> > > > > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > > > > +{
> > > > > +	return &tile->mem.vram;
> > > > > +}
> > > > > +
> > > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > > > > xe_tile *tile,
> > > > > +				       struct xe_svm_range
> > > > > *range,
> > > > > +				       const struct
> > > > > drm_gpusvm_ctx *ctx)
> > > > > +{
> > > > > +	struct xe_mem_region *mr = tile_to_mr(tile);
> > > > > +	struct drm_buddy_block *block;
> > > > > +	struct list_head *blocks;
> > > > > +	struct xe_bo *bo;
> > > > > +	ktime_t end = 0;
> > > > > +	int err;
> > > > > +
> > > > > +retry:
> > > > > +	xe_vm_lock(vm, false);
> > > > > +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > > > > > base.va.end -
> > > > > +			  range->base.va.start,
> > > > > ttm_bo_type_device,
> > > > > +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > > +			  XE_BO_FLAG_SYSTEM_ALLOC |
> > > > > XE_BO_FLAG_SKIP_CLEAR);
> > > > > +	xe_vm_unlock(vm);
> > > > > +	if (IS_ERR(bo)) {
> > > > > +		err = PTR_ERR(bo);
> > > > > +		if (xe_vm_validate_should_retry(NULL, err,
> > > > > &end))
> > > > > +			goto retry;
> > > > > +		return bo;
> > > > > +	}
> > > > > +
> > > > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > > > > > blocks;
> > > > > +	list_for_each_entry(block, blocks, link)
> > > > > +		block->private = mr;
> > > > > +
> > > > > +	/*
> > > > > +	 * Take ref because as soon as
> > > > > drm_gpusvm_migrate_to_vram succeeds the
> > > > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > > > +	 */
> > > > > +	xe_bo_get(bo);
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm,
> > > > > &range->base,
> > > > > +					 bo, ctx);
> > > > > +	if (err) {
> > > > > +		xe_bo_put(bo);	/* Local ref */
> > > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > > +		return ERR_PTR(err);
> > > > > +	}
> > > > > +
> > > > > +	return bo;
> > > > > +}
> > > > > +
> > > > >    int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
> > > > > *vma,
> > > > >    			    struct xe_tile *tile, u64
> > > > > fault_addr,
> > > > >    			    bool atomic)
> > > > >    {
> > > > > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > > > > xe_vma_read_only(vma), };
> > > > > +	struct drm_gpusvm_ctx ctx = { .read_only =
> > > > > xe_vma_read_only(vma),
> > > > > +		.vram_possible = IS_DGFX(vm->xe), };
> > > > >    	struct xe_svm_range *range;
> > > > >    	struct drm_gpusvm_range *r;
> > > > >    	struct drm_exec exec;
> > > > >    	struct dma_fence *fence;
> > > > > +	struct xe_bo *bo = NULL;
> > > > >    	ktime_t end = 0;
> > > > >    	int err;
> > > > >    	lockdep_assert_held_write(&vm->lock);
> > > > >    retry:
> > > > > +	xe_bo_put(bo);
> > > > > +	bo = NULL;
> > > > > +
> > > > >    	/* Always process UNMAPs first so view SVM ranges is
> > > > > current */
> > > > >    	err = xe_svm_garbage_collector(vm);
> > > > >    	if (err)
> > > > > @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > > *vm, struct xe_vma *vma,
> > > > >    	if (xe_svm_range_is_valid(range, tile))
> > > > >    		return 0;
> > > > > +	/* XXX: Add migration policy, for now migrate range once
> > > > > */
> > > > > +	if (IS_DGFX(vm->xe) && !range->migrated &&
> > > > > +	    range->base.flags.migrate_vram &&
> > > > > +	    (range->base.va.end - range->base.va.start) >=
> > > > > SZ_64K) {
> > > > > +		range->migrated = true;
> > > > > +
> > > > > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > > > +		if (IS_ERR(bo)) {
> > > > > +			drm_info(&vm->xe->drm,
> > > > > +				 "VRAM allocation failed,
> > > > > falling back to retrying, asid=%u, errno %ld\n",
> > > > > +				 vm->usm.asid, PTR_ERR(bo));
> > > > > +			bo = NULL;
> > > > > +			goto retry;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > >    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > > &ctx);
> > > > >    	if (err == -EFAULT || err == -EPERM)	/* Corner where
> > > > > CPU mappings have change */
> > > > >    	       goto retry;
> > > > > @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > > struct xe_vma *vma,
> > > > >    	dma_fence_put(fence);
> > > > >    err_out:
> > > > > +	xe_bo_put(bo);
> > > > > +
> > > > >    	return err;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > index 8b72e91cc37d..3f432483a230 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > @@ -18,6 +18,7 @@ struct xe_svm_range {
> > > > >    	struct list_head garbage_collector_link;
> > > > >    	u8 tile_present;
> > > > >    	u8 tile_invalidated;
> > > > > +	u8 migrated	:1;
> > > > >    };
> > > > >    int xe_devm_add(struct xe_tile *tile, struct xe_mem_region
> > > > > *mr);
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
