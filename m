Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0D950ACD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 18:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E62310E3A1;
	Tue, 13 Aug 2024 16:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Afd+Oq6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B567110E3A1;
 Tue, 13 Aug 2024 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723568070; x=1755104070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n6bW+SamHvzuNpXcQCsxj71f/BERkJdfNQV9U6EqGn0=;
 b=Afd+Oq6wasqTNDlQL4M1AcY7P0zM35OpV9/XZXaMCDr6UsOaJoLEFBiW
 CzlK1oS4jJR9zO+3GzoWPxX0i2Rhl2xoHgMH4+YRHoxuQ7kkLhfgE5xfm
 9u8n3pdDiGKcM9V5cuCWabAxL5NXMaFl5o1CTsUXNFGKL23XEDGOKAAdZ
 ubrHOPfqq/PI+O7o94BlKrkwmr/wuf2rUnxsnN0u5zsm90+HQadHPvrIU
 QSwqypimkJMGSoHoa0tiPGzVYcD+OIdpORqKxvf5+njKivnOx/xpVK3Uh
 kcrV1xK1BSJ1HrYaCnh/ghy0YUIpmo5LHwfjDOu6erZvUHiqCjzaSLc0y w==;
X-CSE-ConnectionGUID: mrdfenvZT0++DgXliTlGmw==
X-CSE-MsgGUID: MOOxXNhgSe2xcNcryLHF2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33151787"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33151787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 09:54:30 -0700
X-CSE-ConnectionGUID: 2P3i2JGLTmyetJQFiXrrnQ==
X-CSE-MsgGUID: 8dwQvd4qTKW5v91O1UPKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58711472"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 09:54:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 09:54:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 09:54:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 09:54:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 09:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMz6f3hOTYZInGB/8AV0Y06pSB48Gj2hetsGMV5YhqO5Eq8OJfAmrpkoAUlcf8frcb+JWyMjGDcVHk8O+CZygHpP6p0ecET3ej44q59Dt0pkXfOftU6+TC46fWtfFJkn+avzCwXV4VTzkBJAENFaGN7EijptRc+l9hSpY95GUMuMl9oK7eBv9+yGHzR7kJE+yU77CpFuYiwb10zV2woBE1NP0rW9K0pSB24csWQbMAzJGtJzVimf1vss1hlJR0RVqODzdc1WJeAQLqufQ6uOjL+El9rrarnKugYde7DWJK88xb+3IvSxz6ZBF7V0l2Se4TfkcHJWvxeIXzT0LHkJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z8OPOM+YAkJsCXH2DFybjdrAupGzY3/DTUOD2QMiaE=;
 b=euQBwLJ1Qnt7w7UYr5ADN0aXlCVPP7JJ/HDwRxE3Kbkj7Y5N5NNds4MqPlN3cgSHpHEV2ZvajO3Ezsw7lANgaUD5qPzgtxWYUWJCpc7UWwJu89AXOWjb6Tn5ASV+T8V9QRWMGhqiJVMsc0tBwuuT4BxxvOv2E6oT0mLJP+uz8vBzsSiCPlh09DDqciZ2Xb0jKnSalprvZDBnkaMUtksVUsOa/XIGGt9l+EG+wuZMLeioT6zjHAaoI0Xh63cadxxU6QyzdBXG3NwhZA0R7aLPf5zxt12lHtu9pTMkDzlDTvy0sSOwcGW7/u8dET9siHvo0Rh1nV2ci4Fgy5FFdCK48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 16:54:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 16:54:20 +0000
Date: Tue, 13 Aug 2024 12:54:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
Message-ID: <ZruPtcniJzXOlumA@intel.com>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrtfgGY1YFr22Pg9@black.fi.intel.com>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 21db5724-72a0-43db-c68a-08dcbbb89386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7wqVf36U46qqGP98V6nQJ10GgO67tBhYtvRuYcKPUCBGkF4/dAjmp+nv1jeZ?=
 =?us-ascii?Q?hL7hWvt5WKJXX5NsPjjRfHaJpQuvjTUjebfydadHmqkGOZ5zUcOy3Mjg5rTH?=
 =?us-ascii?Q?OmKMJaaJPDtgbMdUdiVMNqtxAHam4Ohy9eGzYSWu+Rb62P1iypS/B5CninxE?=
 =?us-ascii?Q?+EqsynB/Afze10Xq1w5VWJr/Wh/DEOaTo/Yrx79fEr7rIpRPxIyMBrHCkO2D?=
 =?us-ascii?Q?iUsviZLX7edDHHPTn1N/k9JwyyPVvVN0mOW1xJwZZHylIW1PvdYNA8FNuhGe?=
 =?us-ascii?Q?khgS48IeRe2e5d70ojxhwfXNxaAFL1swuhkdl2hVROA5NGCmFuQ20JZShZ+k?=
 =?us-ascii?Q?Q/L43fE8EwPAQvu9BkyFuyrvkvSUkAPXo2WisLNMlEOWJefZ8Q2fvXum8+pU?=
 =?us-ascii?Q?VbOBp+zNyRwsyPkChuuZhP5ioVaPb5Em2J0XQSTN5qDQ4MAhsR0AZcx+VfRm?=
 =?us-ascii?Q?Cy2aPtbORMENa/MHL+zyVDKAcfVKO24D4oyR2zI9KvpIXLqC3svA2UJHN6Xn?=
 =?us-ascii?Q?sSVS0x7b7FF51Do7Rc9ESd9lO7pKx+rKeAyndP3v4cVyRR2nQntZDYrGAwLy?=
 =?us-ascii?Q?lOWlNFmiBZCNs0co6EhtrA+A+fW3h9ckv2FFHimqy9FLUnaJuxA/3iz5uMLj?=
 =?us-ascii?Q?qVy2AEEiJMWLybKsqexNOjv7rWH4Z40uvEHZbifJ22dvn48bRF/kGgaJSaDc?=
 =?us-ascii?Q?NI1p6YzGOorGaZqZCIKlM2RrqhB9Xjja8txs0hrFII63E2o+37meGhLhtr3f?=
 =?us-ascii?Q?c6zotjkaZn3t0Be4GGSqswvu0ADKFDka0sh76Af43GKn+ruuUdkMqBgfkFjE?=
 =?us-ascii?Q?q4HNSlVWoLDZaC90lDD/HGIoqOY7kXIJuNwxvB9M+sQ9T1tIWiB5hI+Ga+W6?=
 =?us-ascii?Q?9tUpzqFiOrZkrIRmX3QmbixM8hoMy9vO7Wn+NAQcVfZZi6xrVdlrZOka+09+?=
 =?us-ascii?Q?sm2mvarYjri29lxnaAXtIgtmOFN4D0AJSLwJlp5HI2Z0/AboiS+yPQM/VCCv?=
 =?us-ascii?Q?vJ857H2ejgc0t47YXKGgWGR4W2HlGbXLqFkLeyrae2tE6xgwFnrc+WauZduv?=
 =?us-ascii?Q?wYiJcmFPlwBvDIhnz5pDBjZTCGdulG5kH8bCWpOhufqf1tRQ5eujO+nux1j1?=
 =?us-ascii?Q?BxAln8pKBoRcFLbjTteuBi8ifeAbRX9uiqIKSPR2y4rmVWRNJqokx/bCS7uz?=
 =?us-ascii?Q?C3ILB7pYStcSlKGIh7qjSzuT6mK1dHJYbXrpbu5sYN5iIPVidAIpw2iQ8Umm?=
 =?us-ascii?Q?7SGnskoESbmNEX77WSGJnJb0680V1iqafPg2cDK5pyuPhXhIi58ixF97iTTD?=
 =?us-ascii?Q?E+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?761kQ6w97g2YcH19dgW1+vmFq70I1sExg04mYpMMFcM7CdV7BFYo5ugXjdp2?=
 =?us-ascii?Q?MfRp/svAHO/VM4QwUubalP96SZMjqvHj5HPCOXNp3bsBfsuHlEz3dhjO0MkM?=
 =?us-ascii?Q?5+KjPeRj3qXoObnx8/jGldZZ1tnUomyCp8xsSsOnscqmrz8pKF9rJiqApMSq?=
 =?us-ascii?Q?2g/w4GLKsxIuyrEx2VjwWTBS2XmsGw2G5YBURhsy8MvMbVpkhL177dzw2Nj4?=
 =?us-ascii?Q?ZWitcukXTrb7i16h6E8WvYAB6t8DZINjWzJQFGNNCP4OQFD+7kZCihp3kMEO?=
 =?us-ascii?Q?XwIIDHwSoEGmY7dyX2EKZmwPkE6AFACDKQZQ6kFROA839ZqpeRkXJo71A5so?=
 =?us-ascii?Q?8rw4K1ntF4JFhxFNJQGksnlEUuRqHQGWwHY7m+wxytdCfdrohHZLBzlfSAZQ?=
 =?us-ascii?Q?jIaavTt+luedXpUSzaNEoeAdHDWkbWOaRaoo6B1yEzkKVukAMhn6PNWi/+Hy?=
 =?us-ascii?Q?ZvV7+XEhuAsBzd/e1TgrYUNffpG8W3GTU2qF3Ni+9olA77eD4phqW4eMG29b?=
 =?us-ascii?Q?Hie62fyVECtQ74baRi2a30vUbYegOscXh25vwRGEunVqQodYdjJb7dnGzDBc?=
 =?us-ascii?Q?fWX+NDrY0VoSiXqp7e9hU7TSPvJTQ9QvQ462UrXIYzYEIv721P6RQ6PFDqch?=
 =?us-ascii?Q?6UbG6H2rqfVZcEd5qbXD1U1I7DwuEF8H5RvMGrYatDB0hfP0nHn1LsyRd0+l?=
 =?us-ascii?Q?ECG6A1T57pJaZbWKWFtDAYHAguMaMUiQmO3ILeOTjp7VD8P2x0nbdWXxM4pn?=
 =?us-ascii?Q?4SSh+smqrIzJNwFp1zCnQPrhMX+qFfzaTEG0NRIPg6HGgjAVX/RQYEJUz8zu?=
 =?us-ascii?Q?G/HL7NUmEpKJN7vaJaevOAVuJYYYwYNvFS5OrD0qOz1hlTwTgYd3qB9mMGq9?=
 =?us-ascii?Q?4CrN6VMfRRraQfudcnpvjnImKct2ogReS1Kx0V+Xgd7b4PJI7vlDRHeZKr7a?=
 =?us-ascii?Q?pwGegM5PmAozj+bnfi95zAJiZVNh/GoVljMvt3bExkY59XUBBZYpq/7vharT?=
 =?us-ascii?Q?ucR3AwLR8/iC5+IduRKwNJ9hAnWp8f90U+MUYMFoRLOu7nB4zSeecAhPha0E?=
 =?us-ascii?Q?/+cltHOClvvdqXgKk4qG/k/m1PDONhnPRikdr0FYHnyXaPVg7czPyriScp2s?=
 =?us-ascii?Q?cliU+ICx+DIvkxt8KKWsrhy7m5YwRp4C+KG5Fd5xNjilMS3+aNS9K29dvFu5?=
 =?us-ascii?Q?bIOFws2EXD/hWJ8O3scGSiteYduPY7hEN1+Qe1UEf4G9Bau8LskqNaAhQmlQ?=
 =?us-ascii?Q?hnf0azHkDyulhsg4q1czDtT7TYV+fSj8GlAmQvBMH+/4cca5nZ8xTPkFxDQt?=
 =?us-ascii?Q?oYHJYwpEOUbcG58JaHuYzrStLBWlkwBpSDCN+IpOEu6TfnTj/9X61q7q8/yz?=
 =?us-ascii?Q?n2qCR2y3greLgRCNo+tASyspWlfPZM0R0l0PmLgfNSsx7U694pO7zPfpvG0K?=
 =?us-ascii?Q?MpiLW3vfkQUnCXNZvKjW/EJAHyDoGHd03I8vwdA16h+xUJMBX+TfwI8ll0rb?=
 =?us-ascii?Q?uGwRTHp/f74svbCNBgp9VdxbavJEzW5l//K6g9mVr3Ne8IFYWwYaCAqN/m7I?=
 =?us-ascii?Q?XD5v3fPtZfGjYfIwqsMb30Z1kPfe9dwgUltPLaz4OWsmfpNri09+3G2X16dL?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21db5724-72a0-43db-c68a-08dcbbb89386
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 16:54:20.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3egUreyF4PkCAw8Bu8yoItM2S1lAxTzjoPtoIPTm2RRhY/XPfvnHWETJLZX5rz4vXQVL54cRO/pucGrV4ZHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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

On Tue, Aug 13, 2024 at 04:28:32PM +0300, Raag Jadav wrote:
> On Mon, Aug 12, 2024 at 03:08:14PM +0530, Aravind Iddamsetty wrote:
> > 
> > On 12/08/24 13:18, Raag Jadav wrote:
> > > From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > >
> > > This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
> > > uevent for now") as part of refactoring.
> > >
> > > Now that we have better uapi semantics and naming for the uevent,
> > > bring it back. With this in place, userspace will be notified of
> > > wedged device along with its reason.
> > >
> > > $ udevadm monitor --property --kernel
> > > monitor will print the received events for:
> > > KERNEL - the kernel uevent
> > >
> > > KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
> > > ACTION=change
> > > DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
> > > SUBSYSTEM=pci
> > > DEVICE_STATUS=NEEDS_RESET
> > > REASON=GT_RESET_FAILED
> > > TILE_ID=0
> > > GT_ID=0
> > > DRIVER=xe
> > > PCI_CLASS=30000
> > > PCI_ID=8086:56B1
> > > PCI_SUBSYS_ID=8086:1210
> > > PCI_SLOT_NAME=0000:03:00.0
> > > MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
> > > SEQNUM=6104
> > >
> > > v2: Change authorship to Himal (Aravind)
> > >     Add uevent for all device wedged cases (Aravind)
> > >
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
> > >  drivers/gpu/drm/xe/xe_device.h     |  2 +-
> > >  drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
> > >  include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
> > >  6 files changed, 82 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 1aba6f9eaa19..d975bdce4a7d 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > >  /**
> > >   * xe_device_declare_wedged - Declare device wedged
> > >   * @xe: xe device instance
> > > + * @event_params: parameters to be sent along with uevent
> > >   *
> > >   * This is a final state that can only be cleared with a mudule
> > >   * re-probe (unbind + bind).
> > > @@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > >   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > >   * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > >   * the issue is preserved for further debugging.
> > > + * Caller is expected to pass respective parameters to be sent along with
> > > + * uevent. Pass NULL in case of no params.
> > >   */
> > > -void xe_device_declare_wedged(struct xe_device *xe)
> > > +void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
> > >  {
> > >  	struct xe_gt *gt;
> > >  	u8 id;
> > > @@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >  	xe_pm_runtime_get_noresume(xe);
> > >  
> > >  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +
> > >  		xe->needs_flr_on_fini = true;
> > >  		drm_err(&xe->drm,
> > >  			"CRITICAL: Xe has declared device %s as wedged.\n"
> > >  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
> > >  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > >  			dev_name(xe->drm.dev));
> > > +
> > > +		/* Notify userspace about reset required */
> > > +		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
> > >  	}
> > >  
> > >  	for_each_gt(gt, xe, id)
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index db6cc8d0d6b8..5d40fc6f0904 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > >  	return atomic_read(&xe->wedged.flag);
> > >  }
> > >  
> > > -void xe_device_declare_wedged(struct xe_device *xe);
> > > +void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
> > >  
> > >  struct xe_file *xe_file_get(struct xe_file *xef);
> > >  void xe_file_put(struct xe_file *xef);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 58895ed22f6e..519f3c2cf9e2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
> > >  	return 0;
> > >  }
> > >  
> > > +static void xe_gt_reset_failed(struct xe_gt *gt, int err)
> > > +{
> > > +	char *event_params[5];
> > > +
> > > +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > > +
> > > +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> > > +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
> > > +	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
> > > +	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
> > 
> > the TILE_ID and GT_ID can be passed for other events as well, with that you can
> > have a common function to send uevent which would take reason as an input.
> 
> But is that required for all cases? There could be potential cases atleast
> in the future where it is not needed.
> 
> > > +	event_params[4] = NULL;
> > > +
> > > +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
> > > +
> > > +	kfree(event_params[2]);
> > > +	kfree(event_params[3]);
> > > +}
> > > +
> > >  static int gt_reset(struct xe_gt *gt)
> > >  {
> > >  	int err;
> > > @@ -796,10 +814,7 @@ static int gt_reset(struct xe_gt *gt)
> > >  	XE_WARN_ON(xe_uc_start(&gt->uc));
> > >  	xe_pm_runtime_put(gt_to_xe(gt));
> > >  err_fail:
> > > -	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > > -
> > > -	xe_device_declare_wedged(gt_to_xe(gt));
> > > -
> > > +	xe_gt_reset_failed(gt, err);
> > >  	return err;
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index de0fe9e65746..b544012f5b11 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -560,6 +560,17 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
> > >  	return ret ? ret : freq;
> > >  }
> > >  
> > > +static void xe_guc_load_failed(struct xe_gt *gt)
> > > +{
> > > +	char *event_params[3];
> > > +
> > > +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> > > +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC;
> > > +	event_params[2] = NULL;
> > > +
> > > +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
> > > +}
> > > +
> > >  /*
> > >   * Wait for the GuC to start up.
> > >   *
> > > @@ -684,7 +695,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
> > >  			break;
> > >  		}
> > >  
> > > -		xe_device_declare_wedged(gt_to_xe(gt));
> > > +		xe_guc_load_failed(gt);
> > >  	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
> > >  		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
> > >  			   delta_ms, status, count);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 460808507947..33ed6221f465 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -891,6 +891,17 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> > >  	mutex_unlock(&guc->submission_state.lock);
> > >  }
> > >  
> > > +static void xe_exec_queue_timedout(struct xe_device *xe)
> > > +{
> > > +	char *event_params[3];
> > > +
> > > +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> > > +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT;
> > > +	event_params[2] = NULL;
> > > +
> > > +	xe_device_declare_wedged(xe, event_params);
> > > +}
> > > +
> > >  static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > >  {
> > >  	struct xe_device *xe = guc_to_xe(guc);
> > > @@ -901,7 +912,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > >  	if (xe_device_wedged(xe))
> > >  		return true;
> > >  
> > 
> > i see that this is even called from xe_guc_exec_queue_lr_cleanup which is for long running queue
> > from various call paths need to check in what scenarios those happen.
> 
> Should we add a reason for long running queue?

Both of your questions would probably be answered if this was getting developed
at the same time of the user space usage of these uevents.

> 
> Raag
