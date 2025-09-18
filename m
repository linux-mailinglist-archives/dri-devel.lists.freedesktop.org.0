Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62BB85B22
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A0C10E1F9;
	Thu, 18 Sep 2025 15:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTXU2nhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5F710E1F8;
 Thu, 18 Sep 2025 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758210082; x=1789746082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rccxoxFfKYbp3HufAZoCk3lTypt1AYaZpJrAuMjyAyM=;
 b=lTXU2nhEC/cvU34jBQFj/+G6JaqgcMIeMq+09/yhsDN9RuEm4b2mY/u4
 Ks1iHPbQ+TUDlyLw+nVz1a6JPxDAj06P6WuJw1qhrQFieSwbrkFPHFjfa
 iptCBad+IXs/86/mgHFngURFbz8+mBo9t6yAhRA1ZF9QTRK2ji/e5o7wC
 TLyTWmSuEd7jWAyivX1DYmCElmuSdq6bSXJrRtR6KlRKHvfJYbV5dSvZ9
 J+mD18oXk1/+n38IOYI2GRlpxpIeRZO7K7Lm1A3xuuU17eIWgoh+/qDYL
 ZQcUzR4VEvZFs57fUUX+uqSxSqQMVOx5UqUAyK3slQ1sbbAt/3ZxX3s/c w==;
X-CSE-ConnectionGUID: Yc688eyaTVeO3vnFblBQxw==
X-CSE-MsgGUID: +EV85cSHTQiDQcxJ4ySAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60696621"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60696621"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:41:21 -0700
X-CSE-ConnectionGUID: yYaCiGuER3O1+E6hZslLjA==
X-CSE-MsgGUID: ver8w7lRRseBWZl6ywNtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175388830"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:41:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 08:41:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 08:41:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 08:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAS7x2KJLJfikx/DMLTMlGRr/3+OdkTKR3qg1H//GiwI1YmXaMN5eDLga612WmZ3VvQsSphGcC02wt1tVoo56LVP3xCuZSKxUgFc7TeKl5FyHE5Daf7F/IMohZ4bGXNfOEwOPe/nRwta/qu/dKu1Hbt0rDrxN2DYHh8bE3htxUqS1K+QIAwYtE98mVXZZlsEo+JMvqQPomly87iG8wwOgBNlZCiVC6U3jDstjB5NZf2xvjogKlOwQ2UVXtCOAg1NnPGn+CVmTyefFKvJICdCo9ddmXb2hG9AOlKjAmaXYhNX6VK2AUxdxAhkl3ks+vyxpHuSMKCb0OAwVbPHaFyZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQLCDAqhoP49S0H48H/s6YgpTUC/oJrBXPfG8+mma58=;
 b=TuZUA0EtCrS+5RQtrZkoJX72ZrdaLQuxAVmskFVcRoIhxxSOrV/ZKeqnpTqK5nGojEWjwkh+s7fFYK35/hYHseM0/hwoxgIGIBM2T21BFrCuylqc7VpErfMxmgXZB/lPWtWEjspT9YAsqrFu8PEW3TODaLZxR8BZFb6q1ucM3886atXYxqyP2xh/YIk1nCXeovWbsejg+/lswnPhfm2+b5xXjrHNxaOOclQBpCKaxXY2tbwSeoLwe4uGLMDtzL6gRToVNN2gnBdwFMG4fIUE7mZaDxmwVITZurLLfJl6e38LZJ+fmj5+81AajWjg1P0jpY+38y4mPW6e2vSiuIBrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV4PR11MB9514.namprd11.prod.outlook.com (2603:10b6:408:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 18 Sep
 2025 15:41:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:41:18 +0000
Date: Thu, 18 Sep 2025 11:41:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Gupta, Anshuman" <anshuman.gupta@intel.com>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Message-ID: <aMwoGX9LOLS5_8fe@intel.com>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
 <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
 <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <wuy7xx57puqytyigl2fbosluckauxikgdvcrdvtubbob6olvyl@wlbsiuquprep>
 <7l4emr357ugep2brz67d6mxgudxqpgfkf3gyhr5cp6i6uhku42@jhgdf4cujbis>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7l4emr357ugep2brz67d6mxgudxqpgfkf3gyhr5cp6i6uhku42@jhgdf4cujbis>
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV4PR11MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 803cd721-d2ab-4ca4-c7c2-08ddf6c9cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AB1SmOp7EzfIgrp8cWUAf2reN2h47+KtDdItRKE5NUYVc5P1x2cXIglc5eta?=
 =?us-ascii?Q?kQAms5C0TfccJPWAM0M/x0gF/2IQu+pZZYrl6oqn+BEggjn0kH9iskYdSkr0?=
 =?us-ascii?Q?Ld+CaheOdb7HaRLVtoP32KRdww4KdpBi5uL9w7Drbu+S+8yAMxoLHwsh7AxS?=
 =?us-ascii?Q?EFcDTrvd4iMu5EFudgYmksgnDjBn1sKG/KR/acUIB6HWZB8GN3XdekFl+8+Z?=
 =?us-ascii?Q?w+APywnd1OsE6dbCgFfWmQv7ELGxYJmNEq8ydw+yhkwccN97XlmCnYlRo+LD?=
 =?us-ascii?Q?sbNT4kJlYUahnf0KdmDevX7j7A8LxADt69DkAnNDQVwyJi3E6kaNU+TDDRT8?=
 =?us-ascii?Q?PBaCW35+iMKZm8zkswTDlOc1+cwgNLYlji+Q+w+NmdQIbcq2dBu2ECwF1did?=
 =?us-ascii?Q?CTU4zZF55r73afcl+4fYSvKxtXlrM2T+UEYOvGlGxb5bHFUuhougDnW0kre1?=
 =?us-ascii?Q?xGRSafdG4i2nchXy4gWcYQbqUut3AW7iZYu5r7i7xT8BRad0+rwhBkxujOfL?=
 =?us-ascii?Q?tWRvUU7G1wKQYJaofVJhAFbXnXs4HTUWP2U95B7XQbIK1ktZ9TMTK8OkD1Q8?=
 =?us-ascii?Q?cJajOipAWCwdUOvxy/8oGXGaT9DNqf1qjO2UVsgyW7+JtabXeUuPDc23wyyT?=
 =?us-ascii?Q?FGt7HPNzxmI4faSUF2hqBML/UxC6ogHLYKYrD0UNtecGFDjBiTu8oxrRftVR?=
 =?us-ascii?Q?nhj131xXsIzYKSPYaTuxAlB6R1utA8rj4nG2DcQ0Q+Jx2qKpe5zJIMYzu8+I?=
 =?us-ascii?Q?+vpAPNhUJmrDiyMVbWTk4RNV1UPWXFjd83gmXjdtS9lAobDzI/Mz8rdLGfHI?=
 =?us-ascii?Q?7jYtT4ANiu68WhjlMnncoMZDjjPPfI1oEIgyzER2vhRVK2X7F0H4jhOPH6j8?=
 =?us-ascii?Q?uGFaqDPhEuganWAOLtyW1yRi7+pCoRKzRDVsU893ALVv+XoVhtrrFQtqXsB2?=
 =?us-ascii?Q?R5COAlYmmL7ZBVUdVJQe+qPeIJ2Gmm+kMGFSbtn4JaFSS7mREFnMXZEXfQg/?=
 =?us-ascii?Q?DZ+XSczCw3LXn2V2zmPoq52SVzyKHwXgCO2WvFJQSqfYunAHO8xLiptbdcYT?=
 =?us-ascii?Q?+wAoUrQnYA1hrM2bZKEfiGirTA+qOmPmArqenpOGgb/lGQp5Q1+tNwoi8ti9?=
 =?us-ascii?Q?uWFpsOCq27Hg5hFr6WEteAtbMuKJFMxcf6GsJ86GIvWQBkiobV6aR194iGD2?=
 =?us-ascii?Q?Mvo8pzaTRi36HqWhhK4g8LRcoWtdUlpkgsDF4NjpNBCgTMAskPwgP6i3xRi1?=
 =?us-ascii?Q?mqFYO4+zAcIbAz3vq34qw8MlJU06DD73C43olai5jn5eRA4Jk3veHWmrr58v?=
 =?us-ascii?Q?DewrHAVrLQ76mFHfSGINCH4f/Md+/cj5MnSnea28vbQV8WR6zgEmJPeW+urs?=
 =?us-ascii?Q?A05WorWzN6GYBZgVpcjOLhxCzlZOyMtE91YDH4XhHCfL8Y8JMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXRJLsA1eOySvFIIj9LcFq+wH+UrxyHD7YjTe613m+0LkWAG+TPD+qN709Os?=
 =?us-ascii?Q?9WBwRzcmLTPPdXXU2S+IFoNf8zSPs2Y7Sl3hDPlk84wS5G9hzvnizEj1Cdf4?=
 =?us-ascii?Q?1cp8e63iUpLhNCuCWiK67jxO+TNvJp8oA5F0Eu9pAhlv4NpwgYl72+c3jG8n?=
 =?us-ascii?Q?yq1j4cAsndUnP8sPyAaeX+9qVS7gkpdNzEfT2LfJd8s4TgSoir5NtnHpPmwr?=
 =?us-ascii?Q?m5xuktgBX9G/yEZ6Q4vu3q7MnFrD4Yh7ritpIjhr4l/DNtTBA9iBAEAb2rPq?=
 =?us-ascii?Q?oCxsTJh8jLCDcuwrqcB9b5AVQNvocSBCSDPGLnW18OMfW/eomAmkjDoQaEJX?=
 =?us-ascii?Q?N76vjCWmvzqEjW1XbCyuOFoCuLGxtZaIlHURbmNnG5tO0ndtlDXTaKTlsJAQ?=
 =?us-ascii?Q?VftQ6D5szm4hllaG/GX2YpWbgUMl57oL4FESD7ajuanpu98E6Zw1mXWA5fJD?=
 =?us-ascii?Q?UNYjJWTtYzZilGzW88dGWsPVxQ4mog4sHKB1mF8HZFj6x/TjhTyC9xWDGCga?=
 =?us-ascii?Q?f7s8uwPZy524vgyThCitWTkxgahfEJBgusAxiquKQauGH3ZFyUzx6d+y4sDR?=
 =?us-ascii?Q?8387fW+x4w+jtbdhpic2iGESeec6YVLJuAHvDoR4fmAVSXF/8WbKTxLGhZZo?=
 =?us-ascii?Q?9fEtj4g2YITOVSyalq88fZO9EoOxhjXavzCe60IYnpqrUK2VlXjuRcGRI4bF?=
 =?us-ascii?Q?nLJguYeOoGSJciP8jmJkQyQ8c1oY+dcPFIhc3g3+q+X5oyHixf+lCXNrnWJy?=
 =?us-ascii?Q?o5w+nqDMQZzZvjMoAZuLGqTF9LBeqejEdPkjK6gjk9319dRXwBw2AEJSwdTh?=
 =?us-ascii?Q?bl5Pevmm+5zziWa5n2bUIXNX4B9oiLa8u8Ie8oJgutIKLR4WL/BJfwYYK8F9?=
 =?us-ascii?Q?WXfmxwzh3rmHvcgEicGbr9Iy8NtXpzxBuqLP7I9enx7shygc/qOJxpc7jvCY?=
 =?us-ascii?Q?nDLvUHeGFHql0kKlXIdALkrDoDT/KSx2qlRTgOuRTWJ0NeHvb3VaJluw1/eE?=
 =?us-ascii?Q?WX0p6Lbo9pH1evo2aCzbjPh/oNzK8s+fsGXcuPwhVxzlvgT1zTmcEeF34uvI?=
 =?us-ascii?Q?8IPfU1MEVENyIHK71ofvodHRAncf1qApOW4inan0p2uSnoIgD1GvktqWyANW?=
 =?us-ascii?Q?ZYqOI+ueiOqzb7vbbAqO8hFEUZEPaQoOQ/oN3bJxI3Wg2RU5pKnXAgueZ2rD?=
 =?us-ascii?Q?qX+WIOE7w/Y7/zCYlPooWeHvg8vyJldMFctVEih52IgJ8pNaK9dPHJXn6eKg?=
 =?us-ascii?Q?B3imkKoPt2YA4SxMwc5bm6tAkkvOW9E0uJibfsWTe1NIblZk3pbzojCWNyju?=
 =?us-ascii?Q?+mBATdhmoogp7DkSDOdHOUy/m2lNPPsiU1glNLr07snSdp1ytPX/y1B5vgNp?=
 =?us-ascii?Q?zf1pfzAqRzjuTSH4IpcoIwcK/g32zp9lLvbuZBb3BZkvG6CFK6kJbk+pvz9J?=
 =?us-ascii?Q?j5v6qGeCp8mdN/kYqe5MbaXO7wfXgTylNc7NT/Ci4nx8ax3uo9SbPgx4eV0o?=
 =?us-ascii?Q?3ewZh9qFiX1FclkE5ZAqi2SU4dg+vuxonKCUMbud3JxSeWR7y0Zys7oY/1VS?=
 =?us-ascii?Q?qtZ2f6+sRvy96zdCzrIbiTuCYucoqJ9jniq+TvoIvNyTm0uCAFtcrDducGmz?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 803cd721-d2ab-4ca4-c7c2-08ddf6c9cee8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:41:17.9553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jipT5fy3GNauYW1xAoS5AIBPq7dgRF+THtJuptqD0ksxzhu6X28q40+eg1P6ikdoqkeu6E2YzCw3llgwnZYgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9514
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

On Fri, Sep 12, 2025 at 12:19:21AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 09, 2025 at 09:43:02AM -0500, Lucas De Marchi wrote:
> > On Tue, Sep 09, 2025 at 04:50:41AM +0000, Usyskin, Alexander wrote:
> > > > > +static int mei_lb_component_match(struct device *dev, int subcomponent,
> > > > > +				  void *data)
> > > > > +{
> > > > > +	/*
> > > > > +	 * This function checks if requester is Intel %PCI_CLASS_DISPLAY_VGA
> > > > or
> > > > > +	 * %PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is
> > > > the
> > > > > +	 * grand parent of mei_if i.e. late bind MEI device
> > > > > +	 */
> > > > > +	struct device *base = data;
> > > > > +	struct pci_dev *pdev;
> > > > > +
> > > > > +	if (!dev)
> > > > > +		return 0;
> > > > > +
> > > > > +	if (!dev_is_pci(dev))
> > > > > +		return 0;
> > > > > +
> > > > > +	pdev = to_pci_dev(dev);
> > > > > +
> > > > > +	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
> > > > > +		return 0;
> > > > > +
> > > > > +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
> > > > > +	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
> > > > 
> > > > this doesn't seem right, we should allow other PCI classes. AFAICS this
> > > > check could just be removed and just leave the INTEL_COMPONENT_LB below
> > > > to protect for component match
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > 
> > > The subcomponent is unique only in its own instance of the component framework.
> > > Or I'm wrong here?
> > > We have to ensure that we have Intel display device, not any other device to
> > > subcomponent check to work correctly.
> > 
> > We are matching by child-parent relationship + the component id. So you
> > have both the mei device and another pci device that added that specific
> > subcomponent and both need to have a common parent. Thinking about
> > another device that would match the parent-child relationship:  audio,
> > but audio doesn't add that.
> > 
> > what scenario would cause a false match that I'm not seeing?
> 
> so, I doesn't seem it would fail any, but it's fine as a sanity check.
> This is in fact very similar to mei_pxp_component_match(). If we are
> going to remove the display check, it could be done later on top, making
> sure not to match what it shouldn't.
> 
> So, this looks good to me. I tested this on a Battlemage card
> it's correclty loading the firmware:
> 
> 	xe 0000:03:00.0: [drm:xe_late_bind_init [xe]] Request late binding firmware xe/fan_control_8086_e20b_8086_1100.bin
> 	xe 0000:03:00.0: [drm] Using fan_control firmware from xe/fan_control_8086_e20b_8086_1100.bin version 203.0.0.0
> 	...
> 	mei_lb xe.mei-gscfi.768-e2c2afa2-3817-4d19-9d95-06b16b588a5d: bound 0000:03:00.0 (ops xe_late_bind_component_ops [xe])
> 	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware
> 	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware successful
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Greg, does this look ok to you now for us to merge through drm?

Greg or Arnd,

ack on getting these 2 mei patches in this series from drm-next trees?

Thanks,
Rodrigo.

> 
> thanks
> Lucas De Marchi
> 
> > 
> > Lucas De Marchi
