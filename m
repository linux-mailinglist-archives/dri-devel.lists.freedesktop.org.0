Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A5972315
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0DE10E67A;
	Mon,  9 Sep 2024 20:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nl5k4SN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC110E678;
 Mon,  9 Sep 2024 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725912119; x=1757448119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MhLKm9HSnK2cfATFflOnu/aScaqR2oJz3c8fghVtl8c=;
 b=nl5k4SN/93fDjpVYkXnO4ushP2kDe3X4VK7tBIX4WI71v30uaDoGd7Zb
 x4XatGZXzMYRRRthIPkE2Iuz8FW7dIEpSDjvD9ydHYJNF1pSbTyYHNe0Y
 3sQxw5NFUBxK6MQPYNsURlRMXsG3uhgCsCORVZD2g6qzRAER++F+ge4Md
 Bk5B0/iBIrLKHgbdsUlH5yNV3rs6505eKI9iKGvJc81UN7KhPc23ysDSh
 fSx5bTaulYUfcFPata1Mlyp3rERQBaS8pLvZnZB3tgZAPfh0AddM5xMCB
 fPtVnKzcCxVrNpvA+SlJ0om74QKtKWauaO2WRAi7lK4QSImHXCsuBtCFU g==;
X-CSE-ConnectionGUID: DmrK2jwBTXySFft9DNYhRQ==
X-CSE-MsgGUID: rvityK/xS5emUAyIRwJTvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28409423"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="28409423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 13:01:58 -0700
X-CSE-ConnectionGUID: tsUrFXfnSxiHixVbUZrahw==
X-CSE-MsgGUID: rDmZT+6IRMi9VmlK1OVQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="71560620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 13:01:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:01:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:01:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 13:01:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 13:01:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGty96uXPcyTqL7/9jYT2JJFR9uIwZFs0Hg7Qik+UZrp5RScjewrngFBWFmDo15JQmmlBZ9XGHwhDJk44G2bLLWmwHlh5hITcW+4r+9zqBJNYJR5kpkrucyNntLgIfyPQ8gr1Xr3dr642aPabNfHUArJ9oZGDiTkt28/Bxe1dMbqAlafWZGJwG3UXMsi9B46LlmXf6nGz1+EVXXAD2vMD8EL0pAY/WvNgH0ijTdOOD2KqONWg9iu6DS61wAmzGcVk9S8nD0xtxgeClPabukRkzozcc4fohq9TWdjP+Gu5MUY/3ovjJt1uBRup7ILjPPfIRbaCq1ss0AYr4s5oEkbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGB75m37MwH/KtlsGxE9/JGq+tnmGaHifVtFggHFJwY=;
 b=M8Y7ItV4VCbfuBE1nStbH9HSdEtB24a6F1res4LENgbkvi/MwMidGMKlh0j7doj63iSYfwCT9nX+Iz4KtjIar2AI5qwVTLMCWqg8ptqy5BtAg07BfJW4yy24RZZip14/IKyA25kWPuA4yXays4WaHeD6ly+rsFOBUrl3rXeY8mD7fRq+pbhMNJR6DhEmqK8Zot/Bhlha6Af8+mKCagLxQtp73EarzpxHa5WsUbF1xf9A56suyyGMrSu79BXWEOkRMVm35FqoaNI1TY2iTN/5tTQWZpH7mEDXuZuYNhnQ039NrIGz3FlyO/4ecrDELMvJ8H6k2IJnmhs5Aahh2RTk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7478.namprd11.prod.outlook.com (2603:10b6:510:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 20:01:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 20:01:54 +0000
Date: Mon, 9 Sep 2024 15:01:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Asahi Lina <lina@asahilina.net>
CC: Raag Jadav <raag.jadav@intel.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, 
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <dk67ybpmfdx5dabrcsu4ueesk4prcrifhwcvoo73epskyimyfa@x54wxfe6lagf>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
 <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
 <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b8e899-b4c1-4682-d688-08dcd10a405a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OKsLJkmNyulPYiQFPJhgVh1RS/Ynct15BcIXpKJKIbvRtECU8EErCMSQD/Tf?=
 =?us-ascii?Q?vj0PAKOkjfdymRFuvqqts7gb0AqwnvtJuuaDFbc6xdJQrbBXA5mwff9c10TS?=
 =?us-ascii?Q?2mB4CISA8MJCZm8CvFTwjZ1i2ovqdAZAPkrwPIyYMchcBuzmT/LSzEsUkfV7?=
 =?us-ascii?Q?lkD3Pn8iZI3SBRO+FcPhEAjY4PoSK5/cZoF9Gs2kxkPZrXkwRdmOiTgrB0NW?=
 =?us-ascii?Q?0eFHdNm45DwVv5Y4WZyOJgdhlbZBsixx/Bnm9B6sSCHUbYWkIpUYdVY+pvVX?=
 =?us-ascii?Q?YN8HYjHQCSAgVH66zctiIpLOZYPXfPNiaN5euGClxwid6/lRLPPwwN8oHvCt?=
 =?us-ascii?Q?WbfmkQtz9tDlKS+E9UlOH98TXJ1/z64v1V6+CKz4Z5T2mbNxEeNmmbFwj5fh?=
 =?us-ascii?Q?9cueXEEx7Nwwfh5G7wXb0awj1dAahnE/22hk09w6BUUVCJN/cWQE3BTIacZh?=
 =?us-ascii?Q?V6LC/Qdb68OK9SVd7/JpH0bcGhVybOd75QCiQuSwr2nkS67uDbw2R4o9id29?=
 =?us-ascii?Q?KLZIzsXO6UuD8b+bB2+UylPTCD9fDuThkt4x5SUhBs2tpW+WcNrb28Qj1BmD?=
 =?us-ascii?Q?NYBTUO9szd4QQtkHbAA4tWSVPaCm7q9PDbS4XT0NjapSmbylso38IdKif97U?=
 =?us-ascii?Q?2m0HAt7Fxp3M2xvBeKYipwln1bz2QBCl7PXitLgokXk4Jzw0tcOl26li0e7n?=
 =?us-ascii?Q?9DxQmSADH8rl7KWVRpv4WjZYe/RwVcUimqsCH0FjbTHooxWoQxarkyg+m+wd?=
 =?us-ascii?Q?kYTgAfEOkBtw2MdiHZ0FD7+NQYiqeFV7LTHV8cuTINj/JXIxbuR3iVW7pdtQ?=
 =?us-ascii?Q?rbhqsnpDyZZoNK2lt81Z7o63Z3FLQ2ulvi8Z+nOmGcOQavmfhm/sCYdN6lLM?=
 =?us-ascii?Q?MZejvS2fOlsKvP/I12WHKmA924BANUM2Ahmb7h+aNtedOhsNrh+9G0HC2zUZ?=
 =?us-ascii?Q?rqAFvrzbLHRFcMdP09xjul9SCmPEorQOLDe6mZn3oI+gGZMZj7CG/nTK64mk?=
 =?us-ascii?Q?mwHAZxR/PEhToP7Bn7TpzJXymzQ4QItX+lQBA/ZIsmiLW/5a0x+jP6kER9M3?=
 =?us-ascii?Q?4HG6S8l3DLhe8eySsVRXJ6Td0KaOvV1DLmWk2QdRhNnZ+CsP1S+23XhexjFp?=
 =?us-ascii?Q?Bs/UrTUMBPJNVFWqKIkxSfmy27KES7K0lqxfY7Es9P6F9soeOunzjlvZIEgG?=
 =?us-ascii?Q?n+89FIazovYbjK/TgiihJglLuXton5gvMC9ov3W6tk834MOxaI/Yk+/HZ7jU?=
 =?us-ascii?Q?X/K3CwOeG3pEzwymr+SD7HMw693qchyUZZHkcwsIaFSTWxytkKDDCKs+bnNq?=
 =?us-ascii?Q?QV3sxWL600EzYaqmMXmHfuP5lsll7cLtf0N8jUvdXgSVSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FJN9kzX6vSUJ6XEuniSj2nWJSaqyC/Lkbnxzv6rEy0acNuk0/hGk/nCixoSW?=
 =?us-ascii?Q?RP/rMI+kQi/zqmiB5583rlAMxz/+iXSjJuqwnlzIEII7Rc4IvaObzUDVp64N?=
 =?us-ascii?Q?FUTZIXh2/fGYZ2hTROeo1nP8BrM+Qkrtine7j6KN3KWGHsyThEmf4nNlMWK1?=
 =?us-ascii?Q?Qw82xN15XfgxrlEcfIIVAyVIA8Ft4xW5y5bwXF80loACvSz5/3bBvPNgGDJQ?=
 =?us-ascii?Q?3VnSewsKjccq9lrUP5hJs3YPH1lzC0kFqoR5SPp8lgFkwOqtTK/m6owCqzgq?=
 =?us-ascii?Q?VK2xhhKS08GEswfyrzn+QT30+B2mxAfnPhE5ECr2t8h6L3C4BnBHuyFHDJ7g?=
 =?us-ascii?Q?lgCLgnfKG/ZPJGQG0E2X8JtbXf1k2WxizC1OYwWVbhvXBp+pAmtEWBTqSTj1?=
 =?us-ascii?Q?79aa2mU+TINgTgBe85rVoFaKrCq5kJWc1N/ep+ib/+pU9us4aErdxXNiS6W+?=
 =?us-ascii?Q?xoh3PH+aGmTeiAf6MRchupcVOLt5woUZ+IWWdk9+AcTRL1fK+w8fgEieDkhJ?=
 =?us-ascii?Q?bljjEXej/aVt7ptBGOrVE4BSRrCvRcD1AbIEgoO0onozzE8L37PqlKZ+GhdB?=
 =?us-ascii?Q?3/7OWJiVmYQx3KOqlp+UNxlhGJfngEXij/huHCDce7nl1VMsSxiiDIfTDiaq?=
 =?us-ascii?Q?o9xn/n7KF0fXOfGbHZEYpGeZfBdmH2W1PpsvJkbmCSsjczzFrdtsUofpS8cF?=
 =?us-ascii?Q?Ffn62PTxXtHVts+pxyKpRz2PWh7f0Oyg3E4LrxRghtqVyn+2ZO/qOD42Pzm7?=
 =?us-ascii?Q?1+dAn0uOlxttAQ3cvwEttfzHhFLtODYwAsaSz0fT9DcAfIy6j8RPvpkhgMPU?=
 =?us-ascii?Q?77Fp1SNo1xe4qWwOL3iC71tG+t5eWDWXwYSM1+Upn9+SZ45wMUXqJFoco0Wt?=
 =?us-ascii?Q?Yuas9didOwaetGSGGnedCdfYxMRhgfkaJ+Urfs/EaNe4duOwT0PADE3seJ+p?=
 =?us-ascii?Q?fqiD/IYBnp4SsusqArap9ayGuVdOrnxmfzCE6NGumXWTafsc8WIdRRIQVRUW?=
 =?us-ascii?Q?zEQd6rN27M2hGcWYfZBotFhgH1cCZTK1SkTzNeHTJ9dU0xBE9V9SCSkTFwS6?=
 =?us-ascii?Q?48WXxwJgZWKOQ0okNHn4sWGJ7IWXINv52D7ths0UocGEubltIQXLDyvKIUGx?=
 =?us-ascii?Q?M5soAae5Qhg7XcRlrY0sDGtyrVZZrcR4KMI0LEFJUB/iXyng9XgI0cbyP/U9?=
 =?us-ascii?Q?5uNQcwXbElPE+gKIxDywZSQhnxwC21PkVHlrv3XusqGxrrGDxhY5KD2YLwhI?=
 =?us-ascii?Q?l0GnBF5HDTj69QBIQLD17PWJvoqB+bAy5rQMyI8/fqVu2IO0eA+Wh36lde2e?=
 =?us-ascii?Q?s8m9tKxb9Z21vbc3/I2nIsVoopztMwpsqLRQO1eqbKJJFSUAJGpcwlQ0CcQ2?=
 =?us-ascii?Q?Ydmwy3q/WGH5W6glclajhoIhNFEEDbX5qIu46Lni4R0ktt6rNhxdBYuBksR5?=
 =?us-ascii?Q?8auSRWwqSZsb/rqEuBpcKKMczi/8pyZ7vnbBv6VpsXC+O6Tbn24cKC2q/9Vh?=
 =?us-ascii?Q?HKYFX8eL9OMhfToLc3XEjkt5EIWlIiblh9N60hl/xWribGVNpK/iwR84ti7l?=
 =?us-ascii?Q?P/crKkvZ1xG/naD1hnOJf8jI0N8EAfrsAVkx9QAJoGhuFu6A8S2k6LZKe4FC?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b8e899-b4c1-4682-d688-08dcd10a405a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 20:01:54.1892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIiYzUGIstQatiaoAVqEXYjyzTQs7ODGKt1NjiqC5JCMzwVY2bjkFATBkqffkf50FNoyZ5b8Cy1lg/fIohlMnb4ZmTUzsdEcLfpT1H1j7qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7478
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

On Sun, Sep 08, 2024 at 11:08:39PM GMT, Asahi Lina wrote:
>
>
>On 9/8/24 12:07 AM, Lucas De Marchi wrote:
>> On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
>>>
>>>
>>> On 9/6/24 6:42 PM, Raag Jadav wrote:
>>>> Introduce device wedged event, which will notify userspace of wedged
>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>> useful especially in cases where the device is in unrecoverable state
>>>> and requires userspace intervention for recovery.
>>>>
>>>> Purpose of this implementation is to be vendor agnostic. Userspace
>>>> consumers (sysadmin) can define udev rules to parse this event and
>>>> take respective action to recover the device.
>>>>
>>>> Consumer expectations:
>>>> ----------------------
>>>> 1) Unbind driver
>>>> 2) Reset bus device
>>>> 3) Re-bind driver
>>>
>>> Is this supposed to be normative? For drm/asahi we have a "wedged"
>>> concept (firmware crashed), but the only possible recovery action is a
>>> full system reboot (which might still be desirable to allow userspace to
>>> trigger automatically in some scenarios) since there is no bus-level
>>> reset and no firmware reload possible.
>>
>> maybe let drivers hint possible/supported recovery mechanisms and then
>> sysadmin chooses what to do?
>
>How would we do this? A textual value for the event or something like
>that? ("WEDGED=bus-reset" vs "WEDGED=reboot"?)

If there's a need for more than one, than I think exposing the supported
ones sorted by "side effect" in sysfs would be good. Something like:

	$ cat /sys/class/drm/card0/device/wedge_recover
	rebind
	bus-reset
	reboot

Although if there is actually an unrecoverable state like "reboot", you
could simply remove the underlying device from the kernel side, with no
userspace intervention.

Lucas De Marchi

>
>~~ Lina
