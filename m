Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F2AD0419
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E4210EAC9;
	Fri,  6 Jun 2025 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7U/UT3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EF10EAC3;
 Fri,  6 Jun 2025 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749220509; x=1780756509;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ArgV6UC0WBee5hX8JoSfSonf4O7h8wxVKr8JaWotR8c=;
 b=m7U/UT3iC3hB8a2tLD/epLLPvjVOPRWsTfdI5xS9sYRYdUsSZv1Z/qul
 1GgYzEkDVsvG8XjRND5E7Uk+Ra3YGpH7xJnck2ehELFT2kqUJAcF4oCgf
 p+cwavxvdo8IAXWp5kztR4+nef33dnyfR1R4ag0OLdaEjIHMP1dbfeGHL
 id5dDXZpwT8oTiHyFjgc2zKh81SU8UXPqN4ClCOuWTkpckOYLvvpB9WQi
 Ajr1lfSM7zNAtdvcTURSTeS+y3K5GS2KGpW0VTMCTvWHyVzVegWUb0zkR
 ec/XdV2rIWd5IQ6c5rZNDlBkx4/JBrk7WLMTm0KDgECi+0oSAp+ItQT1r w==;
X-CSE-ConnectionGUID: IVNiuEYzTkGe8Eu5MFad7A==
X-CSE-MsgGUID: ig6HzJGITTG89ajvJCDKRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51517656"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51517656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 07:35:08 -0700
X-CSE-ConnectionGUID: iByFEmctSpSfwrvVdTAtqQ==
X-CSE-MsgGUID: vQP/UHEkTx6n9YJpazuMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="151100354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 07:35:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 07:35:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 07:35:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.49)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 07:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhy+xzBLA08D8rMceNdvv3zFvtZBXJm5K8azRXGDdZR5rHtVz4YshkNGB9lZow+CAthxDLCXutuC8lPTp0zgIyrJWFjblhWBd1tcgTI6ILbmtoeyLzbeFNcQDGjuAfvwz/2R7fLRfg3h0TOEcWGXT8izHoffePz09dxSYLjgpW1MQIytyGS8+azdCFXKmjwQ85TsX3RN5W0vmmPatEV5M0wb3rUjfAfa2n26sq2PUuBaoOclosO6Q1+M2Q5bqmmMIZumzYuffjX43wYt39c6IHTuGOycxz+gInP6x82fQMA5Y+jZb75FVBU+U97oT1CArkGGpYvpStOCx3/UDOjvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDf8tNybqZPWQnvdXLOxATAhxPP3uiRVQzYFqs9Y4XM=;
 b=ZRFq+aYLZfKYtEvkCsggKHHRe9hgXZFMrzfImkrLBpCf6X9WG/qMDvJ8a4PE4oKHrj1yfNLP8xXZ2wMRCkqoP6Obxuv23taEsd11HUmUq6eiBXvK5IlF4nortacGNZKk63rMdqN9if3yvnx9T1wU4DIaNsLvcgzAN46snpsenJX1NRFxJUmNfGDT9DJ7IRv4d5ni1UujC+TZeP5CssEM3h6BR2eV+6S2mfATs+OUeL3bjIP2hd6+hal6Qon0gzc8NYYwDhK0RE6hJ41sJL3KV5QJJAHz17c4JHemEbW5nrRSxcQWTb8Emc+NkxxCD+M0UOgpmfMziKR3dDUG+wSU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 14:35:02 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 14:35:02 +0000
Date: Fri, 6 Jun 2025 17:34:56 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
Message-ID: <aEL8kCmGH8Xrc-H-@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-6-imre.deak@intel.com>
 <99b831c92a446eb5e33d8d9536f6750d4a6e3ae8@intel.com>
 <aELyC0YxLiIgxIj5@ideak-desk> <aELzaxIUjxANMLH9@ideak-desk>
 <635d15f850ce955b6e009bc0a5358dc4ebcdcc18@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <635d15f850ce955b6e009bc0a5358dc4ebcdcc18@intel.com>
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b40bd9-d0fc-4b76-c65e-08dda5075262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fLuudjnV/pLodZNojz2llHZcoWS2J+oznkcEBTA8gvmGkLzgHcHgPWXWq6?=
 =?iso-8859-1?Q?UihRgV0rakSarA6S383lSHneOvQV3KQrSap4ZQRn/nRDnB3+/Uji2DpyE1?=
 =?iso-8859-1?Q?qGxGUzcB/qq0T43hc+wT2rNL2FymcfzJcc34ptj2qi7v3VFnn32SIuCbBz?=
 =?iso-8859-1?Q?AfjWvLjy5KO6+tKKa/YYCg5A5AQoBSJfRWqOUQQKxaZFUepXw4zpNdwguA?=
 =?iso-8859-1?Q?kKJ8t1mIEzzX7Qj0WMVIxDkjDF0ItiIC0g6Wd/p1Ba94kIR9DiqtlfIrUH?=
 =?iso-8859-1?Q?5I/R95WkR4Di3jZQgN5p5FQQuYqstNUSEBdYi627Lo0fX3M4y03icsFIH7?=
 =?iso-8859-1?Q?Y2lWaayLj8gyA23CwKwEedaGu+jJLDQG+4dxi2IwxHjdmUR9VasGuV/79I?=
 =?iso-8859-1?Q?y+A6jVykG/YgXXgPrF0apSpVbO7pzf3PYcephVWi2miWuxFW3AKCTAk5Kf?=
 =?iso-8859-1?Q?ddIBEmBVlB7eOoKL83az95TkFqDdw0BWvtFMu1kr3Rs4e7XohP9A0aydJx?=
 =?iso-8859-1?Q?nCks+oKn4VA5huryuFpGOs2OJAHEHZCrXeyVIlPFD2OZwJI0TtzdsXQixn?=
 =?iso-8859-1?Q?TTJlR3ug9IHuMYrkwrHQQElA/S6ECZL7GXqDVljuNT3ijj2wLnyHdCwS1J?=
 =?iso-8859-1?Q?Bu11y4BznBCeo6uJdKxzV+E7pLRt4rEEQaAl9+RPeFMMwxE+KK+DMx0P+n?=
 =?iso-8859-1?Q?49MroF4LjdQ1XdBJAoahjDx2zF1fw7b/CHJNGmlv6eaYZZz2qYgcCbv+8u?=
 =?iso-8859-1?Q?LdX40NrBu4DU8AbkEt9rh1p+5Z5oIR/Yu+wW12dhlQ3qbixKWoFbG6JzYh?=
 =?iso-8859-1?Q?fLeX1WoJKsyNnd8Nmt9u9qFKdipGqXy+nKi8i0rsRcKrxpH8HEjJIe0NF3?=
 =?iso-8859-1?Q?MJb7A15TkiuqvAsImis0gPV0ysNalrRkQucfJJ0ivienotcvCM7WsXfhaD?=
 =?iso-8859-1?Q?1RlKVQiF8CEzz2ZeKF9IFpPvWSQ/ybIuvfF60x+3phJHYLzSxyeW7TBZqC?=
 =?iso-8859-1?Q?gnXZq+9L78VXARN7LRoFyiojGOaVtLE9Vn1MOh4pOZ2C7e36/8OUdeWpJv?=
 =?iso-8859-1?Q?tc0tkaHmVo5gDyNH0hmQQsb8OVaZY0xecNBokAY/wLr33FCccolcUhsSA5?=
 =?iso-8859-1?Q?9UAzsXqej9kuI2VMwUxjIklH7LmffbslLwecFDiPLa5ihm12Y3QhS/RFU+?=
 =?iso-8859-1?Q?eVLVV0M1+UhB9fdyCHqZ68/pAhmh8aZ1frlBDpMlTG3pCFc/+B/25goHaJ?=
 =?iso-8859-1?Q?BrdTZKVxH51lSlZ4zXdt2N3nKye4BSFvlBuwervETLnhHGRjN1IylQLb0L?=
 =?iso-8859-1?Q?96zb7m9AscOOKmgL8PXWQRW6XwUur7QALyHunrxaZ5v+1orV/d3SNDHtfp?=
 =?iso-8859-1?Q?wdqoKEe4FD/75AB4mYc1TaqaZnuwaIrYGwN0ns/phl6/wFIVk7TX3dL3C6?=
 =?iso-8859-1?Q?S9L/vs2sIdsZCEqp+WigceSxity16h8QldyKk2VgCy6hWanrXiFxgMyHAS?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c59ewAwHFqcTgvwdJgF4rwWd/BmUiLwWiUw4McYfjHP6dFNQu0mshSDvxz?=
 =?iso-8859-1?Q?/atBEPR3TAF9nR6O6IAcVxnoUt0h1Z3KPBXN9iWLR3ZDLCxcIKn1HacgLi?=
 =?iso-8859-1?Q?Iv95QijHhdcGls0qYhOldxc/VnNMLRBmPbqKU78dKPNT5eIV26FJuOr0ht?=
 =?iso-8859-1?Q?lZMYxPgCHEitoaDYHuPTbqggcqPh4gq1TQhovVoXo56qBgd7eaX9h3QpSN?=
 =?iso-8859-1?Q?KWcpyGeyEw933UE1iq4JJvD+1QRR/ml4lGaNH8mOlyvSN42Yner8ktiNho?=
 =?iso-8859-1?Q?zHbp1jcuCE1pvnlwOmQ+lyZ5GUfJXSrGTJKoOff8JFCbAw6QajH9qj5TZi?=
 =?iso-8859-1?Q?88UH/awEIw8eO9LNtc29ndR55DtARzWmI6+XSUKu43E2Q7dqiEM4+MBoix?=
 =?iso-8859-1?Q?whWgFsGihpLaFZ9l56lB6m49KO+CETtJG5i7GquNaQpaU8CipxxU15rseb?=
 =?iso-8859-1?Q?RRu0GTBoI385aNINpw0VYsX5S2sppOOGSIKHMm6WFQNrplAhzZS+hvbkgN?=
 =?iso-8859-1?Q?t0v98wMoIq30r84Y15u8uZGBfK1Cnh6DMW5gqPgJvMqbziOr+QqFYZahD8?=
 =?iso-8859-1?Q?eG57kHWrQ3Xtp8HWQl6HwZm+DFYW7QVamLM1CUIviylcyx/+qFuxsIDasg?=
 =?iso-8859-1?Q?DpLoKUaF5r652IdxvQoBJGJPYGDv0GI47pfSIRRC9pibAc6rlmwIwzPsqL?=
 =?iso-8859-1?Q?AO/puRlg3miqMRgHfivR3pwJpfb+epBf71sMf+HMvNvPSZvJl5mUL3AAbl?=
 =?iso-8859-1?Q?IdzcXF8+my7TXkrOXE57Vl1wIiWKc0OKyK5wstSNEJk+uShNi9ShEw5/Py?=
 =?iso-8859-1?Q?NmJidxGceWIoWlzw3r5PmMy14DbruPpWNJjZnWO7041O9d0HhlbDysEMGl?=
 =?iso-8859-1?Q?zzoV93UM0zdk64rBPiHx2Oq/M/AE2kFfxaR3Z0nPoNj0LSsVXugV4BYvnK?=
 =?iso-8859-1?Q?Yc7UNJ+XKCBYE8GoksYC7sxwK6qT0XvH/lKvURXNTuScIm8vKk1Zl8P0U5?=
 =?iso-8859-1?Q?T0K1raJMXQqpVqGhwj40IWkFSve7lByR6EZACDJsHo/BI9qq72ZOnYgtWs?=
 =?iso-8859-1?Q?SUCadoYUuJ8qxWbYAs6fTpCegULjt1uACZ7F5FQUNemS6sBweGaGQ74mOI?=
 =?iso-8859-1?Q?8zrgSRgAlo+x/lf8qFBzHtd2ObXY1oUqk3u3j/WloVLpZ8lJB98XtnUu8V?=
 =?iso-8859-1?Q?JIi2Ob+0ow1+B9gxvmCKDatDmOZFgivPvaeqh4n7MH469p2139gGpaUi/b?=
 =?iso-8859-1?Q?8l/3zpbAPk/cwFb9xs0Ms0opXqO55XRCVvjDE9X+Ioqedk2wfKgmgXGFV+?=
 =?iso-8859-1?Q?sUshuEvJeNusP2BeOTFFA7nMXcxNaIMAdnw6y9Dg9z16S7I2SlrxKtOSfM?=
 =?iso-8859-1?Q?G6+fu7v4dkn34uzkbMtalMJxFyhafmxADwfC8IeWm4R7gVdmAWclVXCTdv?=
 =?iso-8859-1?Q?QGLnGyV61j2fgvo1wEiUHsHqLEFxP/xOEa7aNhM8kmNrMK2CZMyUueaSSg?=
 =?iso-8859-1?Q?hvpfbIdToJfFOFmUzQLav8h9jjuOrcxfu0b4O1k8K67GZ0FDyy5CQGLh2M?=
 =?iso-8859-1?Q?w0Mkimb2jWERDR8JcFoBPC9aMFEv1JoXy+iefz/hVBl+t/Lc8FCKP7GS0j?=
 =?iso-8859-1?Q?cSZ6UvdVn9OySUFG/nx+fsMOTM56mjjL/n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b40bd9-d0fc-4b76-c65e-08dda5075262
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 14:35:02.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJErJy04mPADXmdKW0ZLpZg9ms5Bm3g74230TdoBV0/mgmNzOQEIyUGP9j8ljD83wdVCG5G+OZc0rCRtdSSntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

On Fri, Jun 06, 2025 at 05:04:36PM +0300, Jani Nikula wrote:
> On Fri, 06 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > On Fri, Jun 06, 2025 at 04:50:03PM +0300, Imre Deak wrote:
> >> On Fri, Jun 06, 2025 at 04:44:37PM +0300, Jani Nikula wrote:
> >> > On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> >> > > Reading DPCD registers has side-effects and some of these can cause a
> >> > > problem for instance during link training. Based on this it's better to
> >> > > avoid the probing quirk done before each DPCD register read, limiting
> >> > > this to the monitor which requires it. The only known problematic
> >> > > monitor is an external SST sink, so keep the quirk disabled always for
> >> > > eDP and MST sinks. Reenable the quirk after a hotplug event and after
> >> > > resuming from a power state without hotplug support, until the
> >> > > subsequent EDID based detection.
> >> > >
> >> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >> > > ---
> >> > >  drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
> >> > >  drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
> >> > >  drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
> >> > >  3 files changed, 21 insertions(+), 2 deletions(-)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> > > index 208a953b04a2f..d65a18fc1aeb9 100644
> >> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> > > @@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
> >> > >  	/* Below we depend on display info having been updated */
> >> > >  	drm_edid_connector_update(&connector->base, drm_edid);
> >> > >  
> >> > > +	if (!intel_dp_is_edp(intel_dp))
> >> > 
> >> > Why does this depend on !edp?
> >> > 
> >> > Feels like unnecessary optimization based on your knowledge of that one
> >> > specific display.
> >> 
> >> The detection itself requires probing before each DPCD access. I want to
> >> avoid it whenever possible and since the quirk is relevant only the
> >> particular HP external display, we can avoid the probing on eDP
> >> completely.
> >
> > Ok, the eDP check here can be removed, as the panel's EDID panel ID
> > should not match the quirk's panel ID. Will remove it.
> 
> I'm wondering if we should add a local "do the quirk" helper that checks
> for eDP and mst and the actual quirk. Not sure if it would make this
> more readable.

That wouldn't work at all places, since after a hotplug/resuming the
connector can be still in MST mode, but probing needs to be enabled
in that case for the subsequent EDID read.

> BR,
> Jani.
> 
> >
> >> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
> >> > > +					    drm_edid_has_quirk(&connector->base,
> >> > > +							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
> >> > > +
> >> > >  	vrr_capable = intel_vrr_is_capable(connector);
> >> > >  	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
> >> > >  		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
> >> > > @@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
> >> > >  	intel_dp_print_rates(intel_dp);
> >> > >  
> >> > >  	if (intel_dp->is_mst) {
> >> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
> >> > 
> >> > Isn't this excessive? Haven't we already set the quirk state?
> >> 
> >> No, this is the MST root connector's detection and we don't read the EDID
> >> for it (we read it for MST non-root connectors, but those are not
> >> relavant in any case). So this should be set here explicitly, with the
> >> same justification as above for eDP (on MST the probing is never needed,
> >> so we can avoid it on such links completely).
> >> 
> >> > 
> >> > >  		/*
> >> > >  		 * If we are in MST mode then this connector
> >> > >  		 * won't appear connected or have anything
> >> > > @@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
> >> > >  	 * complete the DP tunnel BW request for the latter connector/encoder
> >> > >  	 * waiting for this encoder's DPRX read, perform a dummy read here.
> >> > >  	 */
> >> > > -	if (long_hpd)
> >> > > +	if (long_hpd) {
> >> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> >> > > +
> >> > >  		intel_dp_read_dprx_caps(intel_dp, dpcd);
> >> > >  
> >> > > -	if (long_hpd) {
> >> > >  		intel_dp->reset_link_params = true;
> >> > >  		intel_dp_invalidate_source_oui(intel_dp);
> >> > >  
> >> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> >> > > index bf8e8e0cc19c9..410252ba6fd16 100644
> >> > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> >> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> >> > > @@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
> >> > >  
> >> > >  	intel_dp->aux.transfer = intel_dp_aux_transfer;
> >> > >  	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
> >> > > +
> >> > > +	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
> >> > >  }
> >> > >  
> >> > >  static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
> >> > > diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> >> > > index 74fe398663d63..1093c6c3714c0 100644
> >> > > --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> >> > > +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> >> > > @@ -33,6 +33,7 @@
> >> > >  #include "intel_display_core.h"
> >> > >  #include "intel_display_rpm.h"
> >> > >  #include "intel_display_types.h"
> >> > > +#include "intel_dp.h"
> >> > >  #include "intel_hdcp.h"
> >> > >  #include "intel_hotplug.h"
> >> > >  #include "intel_hotplug_irq.h"
> >> > > @@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *display)
> >> > >   */
> >> > >  void intel_hpd_poll_disable(struct intel_display *display)
> >> > >  {
> >> > > +	struct intel_encoder *encoder;
> >> > > +
> >> > >  	if (!HAS_DISPLAY(display))
> >> > >  		return;
> >> > >  
> >> > > +	for_each_intel_dp(display->drm, encoder) {
> >> > > +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> >> > > +
> >> > > +		if (!intel_dp_is_edp(intel_dp))
> >> > > +			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> >> > > +	}
> >> > > +
> >> > >  	WRITE_ONCE(display->hotplug.poll_enabled, false);
> >> > >  
> >> > >  	spin_lock_irq(&display->irq.lock);
> >> > 
> >> > -- 
> >> > Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
