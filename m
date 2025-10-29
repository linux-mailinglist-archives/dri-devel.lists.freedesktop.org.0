Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD7C1D4E6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B24310E844;
	Wed, 29 Oct 2025 20:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx1tdG28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3540B10E844;
 Wed, 29 Oct 2025 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761771225; x=1793307225;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F0Ssh9mFP+iUXAwSJ/J+J97KijgwUEtKxN7z7r0pTlU=;
 b=cx1tdG28oOpzZhjgBFQowtGXxcm+pPN00SclGoGu8QrgPgMk+LdKG34Q
 K9XApn4jfYmd4nfRFhuitDuKqNwAu6wnhIp/+98+/wQuwoMGndWLWtTc6
 6Yrsd9QIWq1niRFdqoAsPlDnU/PKRiEtNyQWfX1vZ79Gmn2J29fcVKbfM
 iO7YsI7guJoTrDVPhEtrAf8ermENL4tmNxG1LpgQV0UJTVXeRC+tc55Sx
 wGIHIk5RjXWIFncR9pxtJGTzqLtLp5lJdrGrjGDyXMkGO1E7MpryPiop7
 lf1rVz0wXrEgnTMU/TBF50lVSTOgdcE9db+KjXHyzhAfhTTI0/LN++Dnz Q==;
X-CSE-ConnectionGUID: nY3pZ+5jQRSRu8HRPQ+HqA==
X-CSE-MsgGUID: 2mMSsTaZQh+VqCWz+kov3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75024220"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="75024220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:53:45 -0700
X-CSE-ConnectionGUID: Am1IAJdJQAej3RheJ1EuUg==
X-CSE-MsgGUID: GN/RCXFxS9OIMhnBD5hoyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="209355545"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:53:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:53:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:53:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdmYK8xUeUV2LyvF9B452wNegEtOuhwnqxDrq+3Kc6PjkgPYMMi0Fa2O3+fLV/P05V2iYkGdAqNsNUwXGlgb+LzVEcWRUyH/X7L3OXfrtfjrTC+5RJr28JrLfB8tjVVwQAEuE4eRIgKOYFI69OMNL7X3qNLC1wNXJj+VSRKLWUeiTsyjNMyElmJ5kwnqJ4sr8cxurQ9OwB4LowkfKFCQlzTD/MnzV9s/YrbnASZq89sGENRVKtTtMot5FcCF0BEjmaxTNoQAsB0JDqxr2bN9G+DwPvg/OyWleHc7/oABMPv1kcK/ycwXVNJQgmp2J8VgCy8/cO8rYjf1Z7ZLNAidnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wl1aDpIk56epISD9jtNwSEQ/p8bOE44JD4h+CP40o6s=;
 b=isb88EiQuFzQCaO7EhI9IekiQ2kmWrmqII2I0TrP7pUPT6evZgaUlFcSxrxoeweBYtnqA5bX9OmEwFWzQZZ62aF/SjegNq1JYt8oefmhID/+bdWCvANlTscNz3k9kpx3fY6OSXzs6TTlKdYoDKleEMrRijzlm7VDrYTvrMQs91NuN1tt4JuEkaF/ljw4H4qU+abbizHs7O4BA+drB60KXymrq2jTt8lsatv6u3vxXMZhZYRlWlUciEXC9/IMZven7JJ+5tmg0LDS1uLpkePdmSdJ4r+LiwQf2WP6IZfU6M/pMIZlMMaDM0i5tWv4TmR6cwlHV+2obAfXOBINEQLJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 29 Oct
 2025 20:53:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 20:53:41 +0000
Date: Wed, 29 Oct 2025 13:53:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <tursulin@ursulin.net>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Independence for dma_fences!
Message-ID: <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
 <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 36eefea6-7cc1-4763-8bd5-08de172d3dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zirqXJa8pg2AQG60OVJr72p1e1txwWy4olX82hJvgmLsyCyW+BrgPbnZQL?=
 =?iso-8859-1?Q?Mgg35n0ze8es3yA0SjfS02L0dXAjgTaxCCIWHWhictJQ3qe2zpv6VJSrkN?=
 =?iso-8859-1?Q?B5wgBhgzN86F22bpqxW0sEqqF/t5cvxtHSAk24H/eI0EyWyVFNSM/I3Yos?=
 =?iso-8859-1?Q?+nBPje/DkyLckhrF1Fg/AzTeGFkNN29/vYXxLQjLRh7KESzKVEme7AxKPI?=
 =?iso-8859-1?Q?JChyCmspaa6FbiameoquBR1qsMiwYzf3j5wSVQ0esdBJObXeOOx2HAkpiU?=
 =?iso-8859-1?Q?vT/pgACQ63xHkuWRtjThB16/74Cqs1XQ8wtEZu32z+izQxQnata4FcH2pg?=
 =?iso-8859-1?Q?a6TE+hALTGA3UltEwDiB/eHzedIHe3AdNM+0xEh1wP839JmE7r8q6RkD4s?=
 =?iso-8859-1?Q?Dc/GUYv6oz3yottx6KGHmhvpS2Mpq7IqwCaRRSAMlWFzQztrK+/4OeiJm+?=
 =?iso-8859-1?Q?9WXixPZTsld9jyrJ0FfUAc6DkQ2e9CIW+9Q7awVyJVKEhKUgQ5qlOZ4SFG?=
 =?iso-8859-1?Q?ulh4S/jDVHMIwEDqgIw6ur97PdYSltNQ56rMR9vU8CkzBLQrEjw73tIzMx?=
 =?iso-8859-1?Q?uRCu9gXpA8a0+jhkVTiQJ61RrYTiEMBpy+O3lDvihuUJUbwP0ATr/xbx4x?=
 =?iso-8859-1?Q?y0ST2/AhmVkZHBKPYsF6NTQRcnv8iOVkIgdpXNRMWcUJY3xN3hK+bQLMsm?=
 =?iso-8859-1?Q?PW7Cg60pMa8StVg/TCnlIZz6PQM/7Ub75aNg/0J0R3+JDkudw/4YPpdlwj?=
 =?iso-8859-1?Q?bY8kc94fM2fmjHBQpCZPaj1Qz4xQUdq6eUn/rb7QvNtkzEg87OKH86psgj?=
 =?iso-8859-1?Q?B3wxLiEo6811wsytKf+roEqSOtoFftp/x/tXgjsiAuHGOikGTEHtPEtkst?=
 =?iso-8859-1?Q?w38ah2WHwbL7EGjhoTZeYAYNAo8qPClIieArP/NGmRHKH3YIxYUjCgJT73?=
 =?iso-8859-1?Q?8Q7Cutf2e1ilrmdY4Y23DdeWe+K9SwCv9Xgka7fbq5Cl4ErCwEVsMntyvU?=
 =?iso-8859-1?Q?6iNJlhp7usPq3b1IZR6MQX+HLE2IrR8lL9LL1splWMTueB+EGKzuBe8pLA?=
 =?iso-8859-1?Q?9SLXNLk4JFl4qdIEox3n3fg6bcsv1vkgfvxzz00dRVV05XUT67GpVVShJI?=
 =?iso-8859-1?Q?W0Mxow7rIsx8EEb6C9FyiqgiY4tg2h5KFZ8S9TFNlAbicEAz2xvqPA+ot8?=
 =?iso-8859-1?Q?Kwv7gI+0a047FdGAYQgdGKkw//SuAnkYyZgR4dW3ybbx4aDKuByvU8gWHf?=
 =?iso-8859-1?Q?M9p6opUgV6jNFDvm5HxAvWfLf+jAZik2KPwbvn7/zqF4CbMoNlTt1cUzYy?=
 =?iso-8859-1?Q?gKpJzqD83uwCyxHH2Xg/B9P6i9OTvVoW75gmWbKuvRI8pWmH8PeuHkTHD8?=
 =?iso-8859-1?Q?j6AKfH3yb2tNQY6OPkWmvLVDgkeaYBZElmrS7yHLW2My7VCOi48unH70/s?=
 =?iso-8859-1?Q?d8TyN044QN7UzEF7Yqif2p8Mo68+x5/GsfLC9dIlK3n5XwE3ihVukLFlN+?=
 =?iso-8859-1?Q?xSCQflfMWzl9uPFHHhiBwp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KIqFrCqUvZ0RVOqTdTLrphhciNeSv4y8BkvwsOTs6KGGnEWFndk70puodp?=
 =?iso-8859-1?Q?gwyX6gsfg18688J/qgvV3Q6PFxq9jmY0yB5RrBW4mf+f535mDByEvrKGDA?=
 =?iso-8859-1?Q?hhJ2n/NDyrhelfVCURqVk0w9rZ6wZoTCK6pnBKA8G3n9fUleIhJ8jRuPux?=
 =?iso-8859-1?Q?AJk8Qw0VlLCGDgzHFkNW1aufiHvv6FoTCfRVjnzPCcWGT0TfPBFfjUeUZs?=
 =?iso-8859-1?Q?5fEQxnnXuiPvw0cVoZZdHU1RBFqDgI8QEEFFO9qa2aXwbguTWrd6kpjVem?=
 =?iso-8859-1?Q?e/2bTlN9vZWQkJG9yWHeLkqAGRR06oAfKas8pnHd846MmQeCjO7R8Ipdjx?=
 =?iso-8859-1?Q?OE0gMlBT6/SqKDnG1FpXcgpMZvT8Y9fLvWSaYl2FBpfOd6RmBHdXkKLw9o?=
 =?iso-8859-1?Q?uM5JqoTf4mc9tpDFYHkmt/unWC75Yuc/wIpW8JwJhEkfKMwom/RMcwiALu?=
 =?iso-8859-1?Q?VKlA48PfATW+e5WhsPrN+mqX6eqK1XfCpN5lR0y9UpbwvjUuVz5RScW3YZ?=
 =?iso-8859-1?Q?jEnrOkxCCBHaIPB9HHP2fqeE37aRvmCJFMPw60BkRKPoRIseiFTnIzzoqp?=
 =?iso-8859-1?Q?gRIPtjGsMLDaETyXGS+jsxsYNIIVTXHYU3y2Lbm/GsN77Cj07OHeyWFnbU?=
 =?iso-8859-1?Q?FF3tHRgPfazcBFzdc3MXlawpdpdp0Hs6tx0SRHo2f+/GkGqZBXfvh7h998?=
 =?iso-8859-1?Q?TcNyY4/bPcSiHKoRs9QQgSNoHjv9NSRYn+hfEI9XbGwGVhJeyusLbaYIhs?=
 =?iso-8859-1?Q?Xv943g2P1QgT/subFLXreeFRatpFN69HjFzAwLlhocxxdcgfnvro5iwXLm?=
 =?iso-8859-1?Q?yymTGvkjYZuYRGsHOjNeHAL8o/e5YPwHMEgHIEJAevyPYQIqhC3Ez38n4A?=
 =?iso-8859-1?Q?p2kZ9v1jCl8S9YKK9eXrXJCQZ7qiUoqRmFNFhurlpWTkSlo3sOVOKGmHM1?=
 =?iso-8859-1?Q?KaS4DfxTsVOdk+hMW37JeJjAv93I8xm0J4sco+7u7CkDkxSJAKIjzP1AfW?=
 =?iso-8859-1?Q?iG4xaaK+TigDYAAxYM2hWz0HZq4hYXlXf/KjLRy0O3wlWeIvjTqK72jsgE?=
 =?iso-8859-1?Q?dNl+ug2Flhb51zwpI8hWxLkOzI0JXT8hXzmXnbq+PljmnhrZoknVn0k/Nd?=
 =?iso-8859-1?Q?sSVyX3hewbY0/PB7/AHdqA65SIahChPH6fccjACi0K+OzHph5193uWbqhB?=
 =?iso-8859-1?Q?a/Oc0eDY/fNwJrx/WbmdQAwAE31+R2l1AXmcKO3llxBBMMTHxfs8UjuecW?=
 =?iso-8859-1?Q?XIPE0y45hrBk4UUgeXC8+rm0m0ZgWh+66dGWdu4idkN1XEI0BFKl28SvwO?=
 =?iso-8859-1?Q?YUz3gQCQ61vneCKkisux/isJTg2jLxxpx7BSSi7zR8eMBHpL50HNZEotnb?=
 =?iso-8859-1?Q?jtccyj7krj/UdMIMgYcvHDGCA0PLBVXLW+Ok/cJ1NYws7Ic5/CFFFmbwli?=
 =?iso-8859-1?Q?Zl4JQaaGoaIGt+CaTH0G+RUL6H1y2TTSDYt0OUQ/VcnvN28FJpjY9tmuZ/?=
 =?iso-8859-1?Q?M6pivTjXzdJqpwf564fwB9+SqD1lFa69Yx3WQR9EA8o96CmEaNfhxLh1KV?=
 =?iso-8859-1?Q?aUvNZbj6sh/68cSokmRyqWMKT2TKvD6cZSPtEvkAqdrdgqHthYV9DKcJmC?=
 =?iso-8859-1?Q?bZ8+uaoIaaJwBPTnvlNkTf9nqhe5m68ANhP/+pc3992NLDKEH4smqWyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eefea6-7cc1-4763-8bd5-08de172d3dcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:53:41.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZkWjf9Dp+217z0jCWeKFefaM6J1Ezkn00d6CIeDw4Q+08F2GMUPhXlxTmUS4RA9cCb95kn1s9CYp2PE9mNx+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

On Tue, Oct 28, 2025 at 03:06:22PM +0100, Christian König wrote:
> On 10/17/25 10:32, Philipp Stanner wrote:
> > On Tue, 2025-10-14 at 17:54 +0200, Christian König wrote:
> >> On 13.10.25 16:54, Philipp Stanner wrote:
> >>> On Mon, 2025-10-13 at 15:48 +0200, Christian König wrote:
> >>>> Hi everyone,
> >>>>
> >>>> dma_fences have ever lived under the tyranny dictated by the module
> >>>> lifetime of their issuer, leading to crashes should anybody still holding
> >>>> a reference to a dma_fence when the module of the issuer was unloaded.
> >>>>
> >>>> But those days are over! The patch set following this mail finally
> >>>> implements a way for issuers to release their dma_fence out of this
> >>>> slavery and outlive the module who originally created them.
> >>>>
> >>>> Previously various approaches have been discussed, including changing the
> >>>> locking semantics of the dma_fence callbacks (by me) as well as using the
> >>>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
> >>>> from their actual users.
> >>>>
> >>>> Changing the locking semantics turned out to be much more trickier than
> >>>> originally thought because especially on older drivers (nouveau, radeon,
> >>>> but also i915) this locking semantics is actually needed for correct
> >>>> operation.
> >>>>
> >>>> Using the drm_scheduler as intermediate layer is still a good idea and
> >>>> should probably be implemented to make live simpler for some drivers, but
> >>>> doesn't work for all use cases. Especially TLB flush fences, preemption
> >>>> fences and userqueue fences don't go through the drm scheduler because it
> >>>> doesn't make sense for them.
> >>>>
> >>>> Tvrtko did some really nice prerequisite work by protecting the returned
> >>>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
> >>>> able to just wait for an RCU grace period after fence signaling before
> >>>> they could be save to free those data structures.
> >>>>
> >>>> Now this patch set here goes a step further and protects the whole
> >>>> dma_fence_ops structure by RCU, so that after the fence signals the
> >>>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
> >>>> release callback given. All functionality which use the dma_fence_ops
> >>>> reference are put inside an RCU critical section, except for the
> >>>> deprecated issuer specific wait and of course the optional release
> >>>> callback.
> >>>>
> >>>> Additional to the RCU changes the lock protecting the dma_fence state
> >>>> previously had to be allocated external. This set here now changes the
> >>>> functionality to make that external lock optional and allows dma_fences
> >>>> to use an inline lock and be self contained.
> >>>
> >>> Allowing for an embedded lock, is that actually necessary for the goals
> >>> of this series, or is it an optional change / improvement?
> >>
> >> It is kind of necessary because otherwise you can't fully determine the lifetime of the lock.
> >>
> >> The lock is used to avoid signaling a dma_fence when you modify the linked list of callbacks for example.
> >>
> >> An alternative would be to protect the lock by RCU as well instead of embedding it in the structure, but that would make things even more complicated.
> >>
> >>> If I understood you correctly at XDC you wanted to have an embedded
> >>> lock because it improves the memory footprint and because an external
> >>> lock couldn't achieve some goals about fence-signaling-order originally
> >>> intended. Can you elaborate on that?
> >>
> >> The embedded lock is also nice to have for the dma_fence_array, dma_fence_chain and drm_sched_fence, but that just saves a few cache lines in some use cases.
> >>
> >> The fence-signaling-order is important for drivers like radeon where the external lock is protecting multiple fences from signaling at the same time and makes sure that everything stays in order.

Not to derail the conversation, but I noticed that dma-fence-arrays can,
in fact, signal out of order. The issue lies in dma-fence-cb, which
signals the fence using irq_queue_work. Internally, irq_queue_work uses
llist, a LIFO structure. So, if two dma-fence-arrays have all their
fences signaled from a thread, the IRQ work that signals each individual
dma-fence-array will execute out of order.

We should probably fix this.

Matt

> > 
> > I mean, neither external nor internal lock can somehow force the driver
> > to signal fences in order, can they?
> 
> Nope, as I said before this approach is actually pretty useless.
> 
> > Only the driver can ensure this.
> 
> Only when the signaled callback is not implemented which basically all driver do.
> 
> So the whole point of sharing the lock is just not existent any more, it's just that changing it all at once as I tried before results in a way to big patch.
> 
> > 
> > I am, however, considering modeling something like that on a
> > FenceContext object:
> > 
> > fctx.signal_all_fences_up_to_ordered(seqno);
> 
> Yeah, I have patches for that as well. But then found that amdgpus TLB fences trigger that check and I won't have time to fix it.
> 
> 
> 
> > 
> > 
> > P.
> > 
> >>
> >> While it is possible to change the locking semantics on such old drivers, it's probably just better to stay away from it.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> P.
> >>>
> >>>
> >>>>
> >>>> The new approach is then applied to amdgpu allowing the module to be
> >>>> unloaded even when dma_fences issued by it are still around.
> >>>>
> >>>> Please review and comment,
> >>>> Christian.
> >>>>
> >>>
> >>
> > 
> 
