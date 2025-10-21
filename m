Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D69BF44FC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 03:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199010E0F1;
	Tue, 21 Oct 2025 01:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsDC5MEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511210E049;
 Tue, 21 Oct 2025 01:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761011384; x=1792547384;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KmHK9Jjz+CZlDpOkldVaFuzrRb1wGUnw623SuWJ0WYs=;
 b=NsDC5MEiq/NgTNwkRSY55HAKKdQUo5CeizfqEwKrZBLxH47Yt0uyaPgH
 FQh+1Kw7ICobEEQm3UxpHak6GCo2WM50idcIePRSdvMpBncwy8Kw6W+29
 x5HRyvX2pGEcETos02p9QA7Ud7uWH2i+bzlfdb0LDcG/mKgjy0EGC7mDb
 5B3VJyNtxEXoVLVWeHLAtVtTM6ZnLEUzxutBOQKxR/wYl+ys9IOs6Wxw5
 nmcZfjJV5Nu3uydV34yaFerZ3Ai5q2cchwEAEzvcIEfh3sOi1Ys7Xdqm2
 GMLRiv9ATM/Dc8EyuJ+xZAOkBzBgerLplFfriJMntyUVaEx4kSAW5y5De Q==;
X-CSE-ConnectionGUID: FzC0jJ8sS5qvzrvQwUe1ow==
X-CSE-MsgGUID: w29Xu5APSgq/oFVeCb1H4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74477777"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="74477777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:49:43 -0700
X-CSE-ConnectionGUID: 1UNnnI8CR+uZVJE62weH+Q==
X-CSE-MsgGUID: z/aVyXXKQXSOhTHWA4phYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="187497776"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:49:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:49:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 18:49:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAGzKDOqn6AnLR3BzBpASCnz174m2TRvxlxt8H8tbvWQFgreqZ6MalUaX0q3wCLcAbC5eS4Gi4TzI8dauORB8rJFMIkj/zlXF1y8yBgvX3M/sBYMVQ22vq87fahV2Zy2Q58FDOYw9DckgSYEmGaXs9cKvEZ/ytVLY5wTf63xTeG/K1u/gmJGw4KhXjVEhssRU/2o/Fe1bXX3mEvK0zodMTGnIC5y2yAEgN7uHWd7wY89Mv7saH0oHMcoMZAosrwWtaTL2XdUDuzqKZrZFXmIIfFT0sdtyVmhLlkH/yw4n6W/sQ5F66GutEls3q0v9CMnI2w8u5lk6FyOgfo/L5F+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDzzIivSZU3eeENmub4M3vVblpQ3FdmzhXJTgAtM4n4=;
 b=bgoRX1kEtLn2Z+scXISzzlH/m+Ui+KlY+Br30xrstk7awZtNwjZrODOblYplaIewCNujxcBv5Cuso1eeI0gzQKSmHHF/Tg+L9rs9S8Wdjbe65owE7AjjiGX0GVCCgXALJxdBp2VY5nIGXrAMcqBRvqd7JKhEi3CKSRzsSmbwPI7Cyu8mPvbAKVYaSlUvhneHXb6IeyDEmlZ9PZHYeROHUPj+EWbuG8XBidi+RAepuDY8NA/8w6b0/9QBrg7DWcEcgMGy9ytpD0Mn+xUi6T0Zvk/uzp7qPr/aR2gX5SvwR933CON0Dy2w34sRT2dJc9aEWoUFOBc+UGTMutsBqfoLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 01:49:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 01:49:37 +0000
Date: Tue, 21 Oct 2025 03:49:33 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 25/26] drm/xe/pf: Export helpers for VFIO
Message-ID: <5zbjmqb2sa7pxsej5e65gq7e4joy44mc2x37j7vf6yva4xsqqf@zjeqsxjguj2b>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-26-michal.winiarski@intel.com>
 <7cacd33e-e8f2-486b-a507-9b9259e4473d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cacd33e-e8f2-486b-a507-9b9259e4473d@intel.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7564c816-c1b5-4a93-0eb1-08de10441770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnNsYXRqWm5FRlg1Z0VGNzdmdUpFemg1WENYdGpMbjVxcFdTMXorL2hLNWRD?=
 =?utf-8?B?UEo2UTc3dDZ5V0lVRnY5YWtLeG5RZFlicDd2M2YyZzJrTGtML2dmNmxzWmZ6?=
 =?utf-8?B?bitZUldxR09BbmozN1BGMVRyWGJYUjNNMklYN2dyNldLdXZpS1RCVTNXVFNK?=
 =?utf-8?B?Q0p5Z2dPQkVKY012SWVOd0Y4UlZRVkdVakJpZlRGeWRMK0FuL28zUUgyQ3hr?=
 =?utf-8?B?REE0YnNhVktxNDhKdXk2T1NjU0VKT05GWTBtb204aHhjc3pHSmRQZ1VWdzk1?=
 =?utf-8?B?UDhWd2F0QmVEdW5kaHNQR2dLSG1oN1pyaVlKZVVTbFhyeVNMUTVNeG0rNXp1?=
 =?utf-8?B?ckxQczErblh2dW1pdGczUjhybUtYcVd0WlAxdkFicG5UOVoxcnpvTDdCZk5t?=
 =?utf-8?B?VGc2eGNVVVhzNHlYWmNSRWdoVXpTSlZkeGM3Z0NtTFdZamp0OTI4NG41MlRp?=
 =?utf-8?B?ekpHcDR2MUJBYlZiWGhUYitnWk9pZURuNm12Tk9qWGltNDBzKzQ4bnV3RVRM?=
 =?utf-8?B?alN6L1diYVIvWmUxTGZ0RWNzcVVlc1MxbmNBbFhNTmhIRlVGU2pUNjZTRm1u?=
 =?utf-8?B?WlpVMlZiZld3eGFRdEZPRW04UlZNZmxwbFdVcjNIWTduYU5JWUFYL3VweHFq?=
 =?utf-8?B?SWlzL0lRR1gwMnROVlR1azdlLzQyaGhFekxjQmJheEdhdlZnYjFwZ1BLbms4?=
 =?utf-8?B?Q3VaOXlpa0QrWUlJSElYWXZTVis5eXRBaEpmWi9hZm1ndzNPUU0vbUJ5UGR5?=
 =?utf-8?B?Y0xBQ2JyZXpqZ09sclBRTWwwTmNSZVhmYzJ4NFJKWUNpMVAyOUJZY05BZ2pH?=
 =?utf-8?B?UFJGWlo0aDNaUmlYMWRSOGtoNHh1Zjc0Sk50ZlpZa3VFSVFWdkJyWlZIOFdy?=
 =?utf-8?B?d2RMYTdxWkt4b1NNb1krWFV6c250d1pTU1ROWTViSXlNbnF1aVJ0eHJDWFpi?=
 =?utf-8?B?ZURCOWdvQjFzakRDc3RmeC8remtlMkl4QmpZVWdyQmhENWF1UFdraGR2Tlk4?=
 =?utf-8?B?NFhmbVZ5eVpXYzZ5emdBODY2QitjYnllU1VvajZzWW5MVTFlRDZpb0lsajh6?=
 =?utf-8?B?c0hBT1czU0t5dmZVNXJSRDQzVUpQS2N0bS9tZGhWK21sd2NlUXI3SlpEYkNZ?=
 =?utf-8?B?MXRsOGVMRytieHVIUXBranJGSXZkY3lkY0RVYnZOd2E0elZiNmFWUGF3WUpE?=
 =?utf-8?B?c0N1eHk5ZmpSeWVMaDVXaXZhY2RibWpvSW54d0M1WnlGUVJGS2k4U0ZOb0w0?=
 =?utf-8?B?cExOS2xQd1ZmejM0ZXg0ZDRYdDB1QU53dHZpQkhuSWxUblo0NHRsUmRoZjlY?=
 =?utf-8?B?TkdEc3puMURtbDV3dkRlZkFCRkpUOWFkSzlKSTl2Q1VBeFMxdGg1MlU0aitm?=
 =?utf-8?B?MjFEVU9xU1Izd2hkR1BYOURzZ0ZSZTBHWkxnTnZkb3dZUGFRL0lCdU1DcDhj?=
 =?utf-8?B?ZndaN0dKdTNSdi9PL0dOdWdReG9tSm5USG5QQThybzZCekFUdElTam9uUGQ3?=
 =?utf-8?B?bUUxWG9zTjdZSWxxbUFLS2twM2N1L2Y3a1JTaDVYN0ZBVWJHUU5ZeVNZczhr?=
 =?utf-8?B?NW5mNHVYZk1sQTNNU1FTNkMydEMvSFdJZ0QvSHJBR2NId0d6V2I4QU93REpI?=
 =?utf-8?B?M1JLYkxLeXVsdjZuRGY2SHJWeVpVdWkvYnhKZFM1eFU0TEVTcTVOa1NvVEJ2?=
 =?utf-8?B?b3d3QnNLN01zSUc5MlVUZklXT2FvUlhqTnpPYlR4bkRvQ21EQnFFallkdkh5?=
 =?utf-8?B?WDFDc1FhZGpXeGJ6VGcvYzA5aHVaeWpYSC9JVVNOVURva1lnaGtVNWNjVlJY?=
 =?utf-8?B?eXFRb0F0Z01OblVyYkZiOUV6USs0WlhDY2VWTGhEaXg2U2swa0xlY29GVkJF?=
 =?utf-8?B?bG9QMWdsdHMxTWE0cDJVWno2WVFMTVludzEzdGVseTZBdEIvejZteHlGSlhj?=
 =?utf-8?Q?s5XzptYYqT/0Ija7YPuGqI6XJugLY6Zi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tOVVd5cU5FaWVzK2FhZ3VaZFd5ZlJwdnQxajdib01ZeXl6dnpFOVc4dlZR?=
 =?utf-8?B?TExxcC9Ca3BweTdmZEFRbGtsUGlvcDJLTENxMC9MbE94STVVem9Wc3dwNHFz?=
 =?utf-8?B?QU9pNFlpekE2WnZPZHg4U0pVTi82WUxrZmxNTCt0Mk9FREFIeFNnVHFHZUJj?=
 =?utf-8?B?akxLZkNiN09vVjE3S2VTajlSVVRNQ1VZbGh5R2tRRnY5K3M4K2ZoOFd3QkNS?=
 =?utf-8?B?VE9WNUMyTGFiRHd0dUpGc205OHhlYUkyOGRWYVJOYTROV2QrYjFWNUZ3YWZM?=
 =?utf-8?B?ME5WZ3NFSVh3d3hZdjVkeUJrM1J4eVVYNGpOK0xtOW9xbHZRcE9hWE00V3Vs?=
 =?utf-8?B?WmppTGZNN0ZXT2NLeTdVQWErMlZDYXN3bllvaVBvemxwa09BQmtFUGNJZUxl?=
 =?utf-8?B?RU9nV05UM2NRTkNTNnJWTWlDMGdPcXhFYUc4OVhvZEpzOVJFRk1Yc2h4cDNt?=
 =?utf-8?B?aGZrZE5HRTdSK1dVaDlxMnFJTWtoUG1EV1lvYVNEU1pxU1ppcHE4NFlOOFEz?=
 =?utf-8?B?ZTVKdkZqdDlYeS8ra2prZkl6bEZvTDBlNzRtOVhSMFFsNTYvYzhxakkxajAr?=
 =?utf-8?B?ZnR5QzUxWGt0SUNaSi9VVTR1MnpKTERCekI4UGpUZm1abXcwL0t5U1EwR01L?=
 =?utf-8?B?emVrbThxeWxTT1JoVWNrNjUyMDUyR2lpZ2RXRWR3RDZMclgrR0FHTklWQ1lC?=
 =?utf-8?B?NWRtS0hjcU5Od3ZVNmRtNnNNU0JhT2ZrVm5wbk84KzQrVGo0bmwwbU14SUow?=
 =?utf-8?B?eksyOUp6QzFJS3U2ZWh0bXZVRWhTN1lTY0JsZmNUWUlhVDBubjdTT3FPOW5a?=
 =?utf-8?B?R2hCQklmcGpGcWVyeG9FcFRKdDhkbXJTK2RkOGtqQ2JjTW9la3o5Y1Faa0Zk?=
 =?utf-8?B?ajhTYjN0c2dBTk5rM1RxTlFsWHZUOHBRd3ZDdDF2WWJIaUV6M2g5YUpQbnh0?=
 =?utf-8?B?UXFKc3R2eGYzWldNdkhjWnNpTFBqYjM4SHRjeWxOM21od2NTZVU3N1pGUDlx?=
 =?utf-8?B?eW16a2xGN3RMRWpVeVZxbEtSRzRsN1ZzZlAwakQ4QU8xdmdna21IN2R2ZUp1?=
 =?utf-8?B?bWNDaVRwcHNjU0FYNUxpR0NjaFAyTE9KV2xMdVp5RnB5SnBUeUcrcWZhVlpa?=
 =?utf-8?B?ZmRnTVIyOGV1eDRITU9VR3QydUtYclB2aUV3a3ZtbEdBVjBzL0JPc3hiYXl5?=
 =?utf-8?B?cTVMTTRmdVlhdllvWUZaRnNqQzFvMnpNallxdW9GL2FSb3NiU2pMbnBTQ3RT?=
 =?utf-8?B?YlpUNWU2ZmtCdW1MdWdueEdoRFlGamxZeTl5Ny9ta3hCRGI5UHI5a2VRSXQ5?=
 =?utf-8?B?TzNId09zenVmYkUxUWpML21uVjNKQlovM0ZWR0k2Yk9vNW1vcFNwQVZ5S3Zx?=
 =?utf-8?B?NC9KbFZ3M2xLRVNjYy84b3RYeTBwK25VcGlQdnNHWEVCY3h0OWc1RHh5SlVZ?=
 =?utf-8?B?VExBTVkvWHhWOUMydWxQTDluUWVFZ2dMRlo0NjZnQ29pcmg4N1REdHlnRFZL?=
 =?utf-8?B?aHZWc3BEYUErWHRiNnhCd1czaVVqYjhJTXV2OVdTdm9OQzhPTnNvbDI3OXJk?=
 =?utf-8?B?Q3VtbSs0d3dYTG4yRnYvaS9CbXNoZ29IdWl6c1prTWt3ZmpnU3dDckE5QWtO?=
 =?utf-8?B?WWFrRGtuTmUwaDl2d1J0THRqclBhOTNuR2ZmS1F3QjVBdHdlVGw0VDgxRWtI?=
 =?utf-8?B?MHkwR2ZWYStZTVBCeC8xTWg0WHZNVy80bk1IRS9qRUFNQlhTbzZiNlhFM21y?=
 =?utf-8?B?dEdsZHpUSDU1WE05RnQ5RkE4Q0dzSVRCeU4zSHYwbm9JaHpxOHpyUzFDMitq?=
 =?utf-8?B?RXlQTXlrZ21hekhVbDFRK0UyWWRYVnY1SU1oOWVNREYrQUpkYWhVZHBvN1pI?=
 =?utf-8?B?QjQ0L0owcThYb2lYV3JhTVZpUkFicHQ2QTBzcHRuUW0raldCdWpPWWZFVUU2?=
 =?utf-8?B?SkpGY3hhUmpMQy9adHJZVkZyTk8wUWwyMjJQY2p3NDJrQzdJWEJIZ2VSUFZT?=
 =?utf-8?B?U0tUZ3NTS0NXdEdEMWV2M2krc0dFSGRZVlRFSkFUd2M0dTZkRzFkZFlNUnhE?=
 =?utf-8?B?WlI5REtXVmVEQS9oYzBpTkZMUVlyd01JK0pwVnVuN2xRWDNZSzNXbHM0U0NH?=
 =?utf-8?B?Z01kdlI4V3Z5UldaVUM2TVJGQm1uZ1VJWDBvOUJ6M2Z5UGlkeXpsbWdMdTNt?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7564c816-c1b5-4a93-0eb1-08de10441770
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 01:49:37.4884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcR6C9qL2qadnc1tAuEPOkNZ4fb4iFEVyvP0tEVigwBaCQQcPP089gQnD5J6Fd92UG57MDOjMgofeeQM2f8c/40rG8oGW9NIUG+vaWkmz1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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

On Mon, Oct 13, 2025 at 04:02:36PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Vendor-specific VFIO driver for Xe will implement VF migration.
> > Export everything that's needed for migration ops.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   2 +
> >  drivers/gpu/drm/xe/xe_sriov_vfio.c | 252 +++++++++++++++++++++++++++++
> >  include/drm/intel/xe_sriov_vfio.h  |  28 ++++
> >  3 files changed, 282 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
> >  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index e253d65366de4..a5c5afff42aa6 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -181,6 +181,8 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf_service.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> > +
> >  # include helpers for tests even when XE is built-in
> >  ifdef CONFIG_DRM_XE_KUNIT_TEST
> >  xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > new file mode 100644
> > index 0000000000000..a510d1bde93f0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <drm/intel/xe_sriov_vfio.h>
> > +
> > +#include "xe_pm.h"
> > +#include "xe_sriov.h"
> > +#include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_pf_migration_data.h"
> > +
> > +/**
> > + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> > + * @pdev: PF PCI device
> > + *
> > + * Return: true if migration is supported, false otherwise.
> > + */
> > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	return xe_sriov_pf_migration_supported(xe);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_wait_flr_done - Wait for VF FLR completion.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> 
> or
> 
>  * @pdev: the PF struct &pci_dev device
>  * @vfid: the VF identifier (can't be 0)

Ok

> 
> > + *
> > + * This function will wait until VF FLR is processed by PF on all tiles (or
> > + * until timeout occurs).
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> 
> you also need to validate:
> 
> 	vfid != PFID
> and
> 	vfid <= xe_sriov_pf_get_totalvfs()
> 
> this applies to all exported functions below

Ok.

> > +
> > +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop - Stop VF.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will pause VF on all tiles/GTs.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> 
> maybe we should use xe_pm_runtime_get_if_active() to avoid awaking PF if there are no VFs?
> 
> when VFs are enabled xe_pm_runtime_get_if_active() will always return true

I'll replace it with assert.

> 
> 
> > +	ret = xe_sriov_pf_control_pause_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_run - Run VF.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will resume VF on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_resume_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_run, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_enter - Copy VF migration data from device (while stopped).
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will save VF migration data on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_save_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_stop_copy_exit - Wait until VF migration data save is done.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will wait until VF migration data is saved on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_wait_save_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_enter - Copy VF migration data to device (while stopped).
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will restore VF migration data on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_restore_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_enter, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_resume_exit - Wait until VF migration data is copied to the device.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will wait until VF migration data is restored on all tiles.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_wait_restore_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_exit, "xe-vfio-pci");
> > +
> > +/**
> > + * xe_sriov_vfio_error - Move VF to error state.
> > + * @pdev: PF PCI device
> > + * @vfid: VF identifier
> > + *
> > + * This function will stop VF on all tiles.
> > + * Reset is needed to move it out of error state.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_sriov_pf_control_stop_vf(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> > +
> 
> add kernel-doc

Ok.

> 
> > +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> > +				char __user *buf, size_t len)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> 
> missing param validation
> 
> 	is PF
> 	is valid VFID

Ok.

> 
> no RPM ?

In this case, there's no need for RPM, as read/write calls are only
interacting with the ring.

> 
> > +
> > +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> > +
> > +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, len);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> > +
> > +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid)
> > +{
> > +	struct xe_device *xe = pci_get_drvdata(pdev);
> > +
> > +	return xe_sriov_pf_migration_size(xe, vfid);
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> > diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
> > new file mode 100644
> > index 0000000000000..24e272f84c0e6
> > --- /dev/null
> > +++ b/include/drm/intel/xe_sriov_vfio.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_VFIO_H_
> > +#define _XE_SRIOV_VFIO_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct pci_dev;
> > +
> > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid);
> > +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> > +				char __user *buf, size_t len);
> > +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> > +				 const char __user *buf, size_t len);
> > +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid);
> > +
> > +#endif /* _XE_SRIOV_VFIO_H_ */
> 
> this is a very simple header, no need to repeat include guard name here

Ok.

Thanks,
-Michał

> 
