Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87984C636C6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83E410E330;
	Mon, 17 Nov 2025 10:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hv4TTXy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CCA10E320;
 Mon, 17 Nov 2025 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763374138; x=1794910138;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=+rVZ7CJMGQDOuEoBRUH0v5j41Mezw7zmedhNPxHcFpc=;
 b=hv4TTXy0TsFTsksCU/Qmcc2NuT7Bq5xvf1zwy8PkxTm15/zRYtDTJ35Q
 VxVnrWTjo6GfMLBC9Iwxm2z1bOZ+8dXBdq/Bm/7yL5R4cI3O3vgiHrn1n
 KlhTl6tDWix7X5jmzw06VoyWukt11lBN5ivN+w4TgKqT2vO/XWQSzDUF6
 s2QIuYkRm9aDx3jT0SX9LWMZMUZIZdJcSnCVRHHVIzIqTil6SejEQJYBH
 YIoMDHX/vt/sfqhf2HB6trmHuYnMYnS9bm9jSuruYroX5iZv9FyH9j6HH
 jk+mt/K03JFBVgPxUglDvU2JRTZvXP8zmOnkZoKx6VflHBkyOEZwtHF4B w==;
X-CSE-ConnectionGUID: 4Hxli2yAQGKKLuRVooXFJg==
X-CSE-MsgGUID: A+tTPW+GRCamuz2hYm1+mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90846419"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="90846419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:08:57 -0800
X-CSE-ConnectionGUID: FqmEgkwKShyO0VQBXpQ1oQ==
X-CSE-MsgGUID: p8SWR/NmQFe+KGHPohbeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="189711136"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:08:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 02:08:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 02:08:56 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 02:08:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvAovwqlzx2gHesXlVQepG+lgR4SPm3H/3iqbnGtki2ntTHaBjzvG3cW3itNpg/6UgoRrhPg8jdk+ZlHCUBh5qD2gN/uS2AtAdNTLLZMleT0TergAkzAjv270zr/67GzuJf68d9+URWcJDSCGXGzPkaam09hMlLkWwMCnXB6GmsihyXqP5VCDOpDRov6wOPI1k3sVNLEg4c8h5xykiacI2fbYWKAMvSDK/gTnFlI0rqqQRt2JxGGP3UVO9QhfP7uGxrg+naL+WUInuN79NRZiI6ckDAqJgAMbCswfGjduCxKZibWpHXGSyDEjk+ccpioTIMHNs4uKwW4gltQibYhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSxaPD543i7/vlvXNMbU5c3tUaIzXwgvDiJ4D81NfWM=;
 b=X+btjn8XI6A3ZjpEMbWfLoSkGfhnnIKBkTy4o68niEhMbfxTCFIeDAl4wXPhBAVMadaPP3hdwlDhEaO2Ufht4EXtWQJBebG9diS6o9kN4dmWwb67YOvoB499+iuveLkYmNF9XlfcDHU6nWgp0RtzeWcl8k42z97QQxzLP9GvrIbUCQ2TWiyFfNTqjVa/T3Rn70TyHLo2v0CWf72Vd13fHDNMd30vZmiO4Ic05M+H7qk1bUEdAaloyYh+w0/ej8juXliuBG7ctWxYf2Mx/rjP4dX1bog2q4hYmKRO8HsPQhnYqp3mKNc/VS16zvT0Ax0mfOKayfRNSVsZcCbDzTY+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 10:08:54 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 10:08:54 +0000
Date: Mon, 17 Nov 2025 12:08:48 +0200
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Ankit K
 Nautiyal" <ankit.k.nautiyal@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Message-ID: <aRr0MJbOaHXMXEtO@ideak-desk>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-ClientProxiedBy: LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fd1f4b-083c-4dca-9693-08de25c15094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uiXzBOQqcfH+rIpHfC2vgSvKMdkD+rhyO6+yT7ArXqjqOzgjWoPyEseka7N3?=
 =?us-ascii?Q?goSKdXs7Stm8BOT0yBllaAtuqTNkkrQhAaO4RqQ/p3+XJnhXgzTJIHO2ZVBB?=
 =?us-ascii?Q?Q8+XqMZQoeJkcbPUi61PhAlIjqaZa+Ka2odQh6H564gepTKDQe4X+nN5lBcm?=
 =?us-ascii?Q?sO2hi8IBpTzrk5VKoeI/dTG2mAenamt9JJMrvd+qKdUZwyWrYjHTrxscNMIi?=
 =?us-ascii?Q?cgrUF7qKeVFPtBsm9+4ER8VWnh4pLGZLz/zjmSWa8JlG52dz7fXpLxD1jaAw?=
 =?us-ascii?Q?Tm+wLBt9oVqUy0RAL2zoPJyR8DsL7uWwrID9jP499rwGsh4sPQWhwmC37unU?=
 =?us-ascii?Q?qkzhcLHv5FKcvMbc6RBX7HtQa+6Dbl3Jq4aZO9oJuv8wowDXDvtdjMzM67yO?=
 =?us-ascii?Q?ewgcMzi66xs643HxeStUllY6oUlvPGk8y/jKV6lVmQ068SmO6jsEBfZxC5z5?=
 =?us-ascii?Q?2hyqCrIynfQtqF0FCOpTxrLBgXkFvSCRPATvIbi5CuziJQHbEGlr4xJ1NPRO?=
 =?us-ascii?Q?pEPd9Qz0139ITA4/PLx12DosaZ5Mt4oeHaGI5gQy3q7bZrwRybcQ8wdyH7YZ?=
 =?us-ascii?Q?3bxlCdSc4+wYwt+ffdZAEbzExDzz3QbapISsSCLkhn0ElaLsu99Je0kBmjye?=
 =?us-ascii?Q?64jxoAbi4Hc5rSZdqwS/jm0GAJhcV1/nYOT2JxK6KgxihXI3gwkaeIRS8i4d?=
 =?us-ascii?Q?a/YqdAcsLcTcWAAOXyL//8M8bVft5NLXL33NaI/K2sy0Y8EnMDVW9PJIJl70?=
 =?us-ascii?Q?6HA1B615Y2ph127084gvf/hmtKhpupgojmUkIl4D387uECTdmp1Xa5gBhxur?=
 =?us-ascii?Q?oCN3WZJg/x8lhEI3uRUPOt+QP9Ab08FS1Br92aOPnSVeGXUN73JYHMd3QarL?=
 =?us-ascii?Q?XqxsDxIBPHaCfVhxlQ4XvvURlBaF+WSdr70A0TjGp7Gtc65lQgkj3Yq4sJtW?=
 =?us-ascii?Q?Ow9rdamTzny1DqL/P1t80EoyZFQySOOAHoRucIxyGdlQqfJk3tdHupZqzjZj?=
 =?us-ascii?Q?nJieG6G3OMk20OPfS3eXQpKQb2dHTdU+UgYfErACRUk/rnhUv8JNjj9Wfc8M?=
 =?us-ascii?Q?MymFVBJv70mhFzGNtZjIVEerIpQekPd9dbgtgo1f8h1lr5p6khh0hbFl7uyg?=
 =?us-ascii?Q?xewAx85/ZBIpzwEmnFDTwe9PiIv+tkmiMMl+mCTlvCb3R/Ax9xrG/XLDzXA6?=
 =?us-ascii?Q?FsGWV1HmebDx27GIss47LgQ8kZrQTNkSyW0mYqsHInVu6LeLtQqrYDbpDlFd?=
 =?us-ascii?Q?AbgFwKQoxBkzXoMO5LzZSB+Z8KU6qezIfYK8FurdGgSax4ksKAAEyEid9ZuN?=
 =?us-ascii?Q?yB5BdzV+WIuSnNLr757QBGoGlwFfG8YKJktNt+YX05cDtRpfvoFcH45/WHzo?=
 =?us-ascii?Q?72yuTN3K3m3UOO1JytZ8Bo2FCDYbGwEgqjps098Z1BmlihZe9NCDGacmHXaI?=
 =?us-ascii?Q?Tc1uTzAA2ds+susbamcr1ErWPjsQeWh7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?50GtRL5xyaQzL+gNabpio9A35tNyhtWRtNQg6wWaHPyF1RtKCNzRhNvcQJZb?=
 =?us-ascii?Q?u7lYuRm7nUWHoYNbqeNRDHXTKHvlCxwCHePtMZi1/NXo+GufYm+in++0iAho?=
 =?us-ascii?Q?c7Kz6UglFw30fcWhou4cEkl67QoKzx/cDkHmgv/ktz7YQAROx3Fcr1k6upF2?=
 =?us-ascii?Q?gVYRcRl8JC9WTr3noSDNftKnNoRt2PDDSfHinOH5rkYwJG+2pShfnDHad15H?=
 =?us-ascii?Q?dWKxUcW6e0O7HT9hQEE3wKLWVmHzSJaDq8PRjeK4ScqP7xTFjTar9T0Llc9B?=
 =?us-ascii?Q?GasZ0MlK21/gShyt3H2DvMJyBDuo0wiIp74FZm2nFGkF2CQ4BIXXvcGalum/?=
 =?us-ascii?Q?MtDsZmKg9fMRG+825Hiva11YE9tJYQXr5A0z5YpluV7w3Pt/yJLuhjMw4Lfz?=
 =?us-ascii?Q?jcA17rQZtlSeVsmsrybiSBnJXdSQBB2+l0tAKoJ9WSrsHhEU3kRiMEu7YjTD?=
 =?us-ascii?Q?QcEQksQ70JHAxKQXA4kFNkVDsFOXDNbmg9BWf/zNeDtKtn3sVJ+ymYZYFBuG?=
 =?us-ascii?Q?ID0NToNp9geExmO/FiQ8egDWra+1/P7EIyIT0viOuOVsa3CNSm9npJMW+7xO?=
 =?us-ascii?Q?Cs2LoKV9wBT4+l0+j991HEL4vgduv/n40BZ3loa5UtJnTuyYxm2cCJrPuDYs?=
 =?us-ascii?Q?RzX9EFemIRyWHyWDITl5UdoAykp0k1H2SZDjSlfVxlfpM8ItWu/xxuIITO81?=
 =?us-ascii?Q?uC60+NKU8y6Qz99fxTAbew6VRxphoq79zq14nBRTkt0rsSCjoVL8EXkzFxBv?=
 =?us-ascii?Q?g0gTdM57UU4Fh52RvWPS/NbwIT8eeTb/nh/+jLVAv5tkQt61GFUWFwVSjnOQ?=
 =?us-ascii?Q?zfGo7U057BlILDFeMKZqoyaL9fU3lxFPn3OUnN/xbHcyQaXdtOOON55dOGLL?=
 =?us-ascii?Q?9l4NIkVDPxYqY5AUdg0a+IN7gkndGxQmJgPQKWii59/ZrUmlH9QJnLa6lauL?=
 =?us-ascii?Q?QTQwKa/uEPkDEfsI6iB2i+5yjLz4E37MRjK/1a5PmWX6v0NS76yKUPnldgNd?=
 =?us-ascii?Q?zIbqhTifQNzHTHgUyjl+uMu9U89Bzndk0CqYlPhKp909e2HvF8aA63kOa4qi?=
 =?us-ascii?Q?FoUWu2AUVj/3oKWr+4nl3Dh2AGMU2G+SV4rL3Pax9rnAMMffhl32ie2/LM9V?=
 =?us-ascii?Q?/QxPgHlkfhb4zCE2tUJ42wri9DDHil6ax2/xrNkF+aRSw3D7g7SyZLM0qIV0?=
 =?us-ascii?Q?9jNwtE0cbvozFdFLhU8Fy5Xup4YYCXr8mr7vRe3GzVcG0MbtlbPlhfIslBbQ?=
 =?us-ascii?Q?dpbwW+NgRgO+Q1SkFrDM5DSLvaBQbEQs+Ul011cXsPjgnXMrJbaSeSyCz6Yr?=
 =?us-ascii?Q?TZGXxNjKxfhcHDkWgSyYbmGWTlS5AIdNon+eboAHHqHBeCjFCYWFk4/xKr86?=
 =?us-ascii?Q?tRYnrnD3EnenU+UjLCTi+TlyazigSuxPUijxk9NV9JsJzv6wrh2nV5ErGzql?=
 =?us-ascii?Q?syAJRhUZiSdz/jTcEXw+UHPoL7AWLGO98hgbMQ4KygHpppdKcqbK6uA2nMz4?=
 =?us-ascii?Q?kVK7oYhhH2RJ+iEK2Piu5RJ0GMMb30k25gjOtT6saWjrDOvIhMrINk8oKne5?=
 =?us-ascii?Q?AGlmEHUZ6UfO7siZnolVDIxkdjhRugCISubkPIJRBVD+UUIz39YzDTuQCzVO?=
 =?us-ascii?Q?LT5Ruk9rNYHSbZ2za8VExnY5RLygdwXuEAIraxqnE1ez?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fd1f4b-083c-4dca-9693-08de25c15094
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:08:54.5734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D36reAYkdAzHtKrUTLJI40ShDTgbc4pVbjHEarb+91gYcOKBoB9z8FvEqRz4FkLdeP3ww1s6irouJd11nacXAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Mon, Nov 17, 2025 at 07:09:38AM +0200, Suraj Kandpal wrote:
> > -----Original Message-----
> > From: Jani Nikula <jani.nikula@linux.intel.com>
> > Sent: Thursday, November 13, 2025 9:55 PM
> > To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
> > 
> > On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> > > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> > >> When releasing a timeslot there is a slight chance we may end up with
> > >> the wrong payload mask due to overflow if the delayed_destroy_work
> > >> ends up coming into play after a DP 2.1 monitor gets disconnected
> > >> which causes vcpi to become 0 then we try to make the payload =
> > >> ~BIT(vcpi - 1) which is a negative shift.
> > >>
> > >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > >> index 64e5c176d5cc..3cf1eafcfcb5 100644
> > >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> > drm_atomic_state *state,
> > >>  	struct drm_dp_mst_atomic_payload *payload;
> > >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> > >>  	bool update_payload = true;
> > >> +	int bit;
> > >>
> > >>  	old_conn_state = drm_atomic_get_old_connector_state(state, port-
> > >connector);
> > >>  	if (!old_conn_state->crtc)
> > >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> > drm_atomic_state *state,
> > >>  	if (!payload->delete) {
> > >>  		payload->pbn = 0;
> > >>  		payload->delete = true;
> > >> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> > >> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
> > >> +		topology_state->payload_mask &= ~BIT(bit);
> > >
> > > This looks wrong, clearing the bit for an unrelated payload.
> > 
> > Agreed.
> > 
> > The logs have, among other things,
> > 
> > <7> [515.138211] xe 0000:03:00.0: [drm:intel_dp_sink_set_dsc_decompression
> > [xe]] Failed to enable sink decompression state
> > 
> > <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
> > [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in topology, not
> > creating a payload to remote
> > 
> > <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
> > [drm_display_helper]] Part 1 of payload creation for DP-5 failed, skipping part 2
> > 
> > <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
> > [drm_display_helper]] Payload for VCPI 0 not in topology, not sending remove
> > 
> > So it's no wonder the port's not in topology and everything fails. We obviously
> > need to skip payload_mask updates when the VCPI is 0, but that's just a
> > symptom of other stuff going wrong first. Perhaps we could do with some
> > earlier error handling too?
> 
> Yes I agree the question is how high will the error handling needs to be added.
> A lot of weird things going on here.
>
> 1st one is how is it finding a payload which we do not create while we
> call destroy function
>
> 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least
> that's what I gather from drm_dp_mst_atomic_check_payload_alloc_limits.So what
> are we missing when we create a payload?
>
> Imre, Jani any idea still new to how payload creation work so am I
> missing something.

A VCPI ID will be assigned to a payload during an atomic commit only if
the corresponding MST connector is still connected. If the MST connector
gets disconnected by the time of the atomic commit - as in the above
case - no VCPI ID will assigned and the allocation table in the branch
device cannot be updated either for the payload, as indicated by the
above payload creation/removal failed messages.

I think the fix should be not to clear the VCPI ID if it's 0. Valid VCPI
IDs start from 1.

> Regards
> Suraj Kandpal 
> 
> > BR,
> > Jani.
> > 
> > 
> > >
> > >>  	}
> > >>
> > >>  	return 0;
> > >> --
> > >> 2.34.1
> > >>
> > 
> > --
> > Jani Nikula, Intel
