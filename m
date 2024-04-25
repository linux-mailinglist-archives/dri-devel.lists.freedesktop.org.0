Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029838B28B0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEA411A7D5;
	Thu, 25 Apr 2024 19:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1x9PyP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5197211A7D5;
 Thu, 25 Apr 2024 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714071809; x=1745607809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NLLrgvXHoNwo7aDwc/8sEZpRYmHn+q5Zw1sNaxt04kU=;
 b=X1x9PyP4rtwGyFYTLdzLwHdBpvwSwUXOp0Zxlpeo3w+/78qHcgpmu0TY
 0jhWoHlYmszDhQi0/acOOSoSBFT8iO460M0Lh/OevIbukUkdQuUPX+i/Q
 23d5GwNDcKSQAQabSrFCj46QfEnCrZtT70wVvKxnK4c/ps4jLU8EbpzVl
 tcHcj3pvioYlr+yL+DPNTQHHKu/t2Xg+F5AOmUZWDToxsm1qhIZWw8QzK
 kbPmOxkl2cl1OH+UxCvhmhAP3M56CKDHHHyC59Drc6x2KDim4t0GJKJTP
 yEkFaJ6o3nywbLNdexlrk9/+XRH5y6obWBW0+rQb73DefZLFg0ARHL0IF g==;
X-CSE-ConnectionGUID: en35SXfNQyatBY3L0sZddw==
X-CSE-MsgGUID: jlbPvrNvTFS1eSszNwSX3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9897898"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9897898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:03:05 -0700
X-CSE-ConnectionGUID: kCeZZJTmQPawph6vmWNUKA==
X-CSE-MsgGUID: yyPD17Q+R02wCvfBBZtdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25134711"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 12:03:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 12:03:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 12:03:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 12:03:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 12:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRUWpgclBR/cKCcoD0xIAUdwN1uQV+RrWWHrO3lxTRBR8SZ0nGnidqM91Jf/bt3dgPWA6cOR2vH/1sKb+3TIZVOrnEf5mCGccaWPgD0q7jLZYw3/Rjyt9iCEreRdYwGNtiI6vIkt3qUL8raugVbEI8HF5Ndq07va97WCQwapTwUW+BantKJPJYyTG1tvMLhbE5NuG+JXxhROr9U2jFPmRxiBvEefk8PK9HjHcHz2eFk6z1BIqplVn5x3JioYC7sp4iPLmCeHuCjEY7QcQ3yhDqT18F1qArkZVpLOwJSMzZE15O+dLaLVdnfYp4tJxO2HeDXbzrrdw4dLCxIgNqpLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4ObETudLVz5T0cxO1G6qs320WbRA0+ZNNp+F11qjxI=;
 b=j0ixnAhvUGj7r9aOr+fSj3WtpnBLYCe0F5eBBcv6Y+n1uFXyoF+gAGQM4HxJaVNqmp1mtkk+szVnAHE0CgGMR+EfsIM5Qz3jt0+HBJMBTS/b9hGSPkhtJ9hKCuaBCDKqMmqZExe9dbR5xRecs6F5Ijg+Z7xXTC3K0pF5qfIu95jJu5g8fSXMhkJ27VEs6tx5MogROkO/03duN7U2Di6CxuBAL4+RT1RIa8ECsp6cs1Q1vhZHfSoQsB1wNU2JLxhekvlRPo82IRae7nbCH+K4ifYD4NPvM3t3SRw61dq7mZ72qi+5YXliL6rX3hA9ijA8G3t/HO1OARFTtz5RpHRksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 19:02:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 19:02:59 +0000
Date: Thu, 25 Apr 2024 19:02:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Friedrich Vock <friedrich.vock@gmx.de>, <dri-devel@lists.freedesktop.org>, 
 <amd-gfx@lists.freedesktop.org>, Pierre-Loup Griffais
 <pgriffais@valvesoftware.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [RFC PATCH 02/18] drm/ttm: Add per-BO eviction tracking
Message-ID: <Ziqo10vFfhVGQO6h@DUT025-TGLU.fm.intel.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-3-friedrich.vock@gmx.de>
 <ab9afb74-1490-45b0-9b40-2e46112538e0@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab9afb74-1490-45b0-9b40-2e46112538e0@amd.com>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 796d2215-65bb-4233-f8e7-08dc655a5324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?L0ks6hrB7pUStyvBJXb19pbda/UUVGLP/y1cOis07s61Gk7WDLoBMpmHVc?=
 =?iso-8859-1?Q?2hXFOYFA5S/UOrxVGFcD9YqWOlHQljv9DHuqKoGmTZYzF6ysFthMX3k8NT?=
 =?iso-8859-1?Q?dH5cAqiRxBA4p9Mh1x7muU4i6h5MSEMP5jBxPK4V/WPIbndCVoyT/HnVys?=
 =?iso-8859-1?Q?WiLImsaqoU08t0ZDwVZCjjQ3TPBNAvxnv1wSTKripblLejoKPerzW6qsyN?=
 =?iso-8859-1?Q?296DmMlEVANrHVz8vWsto8VZdLSGXgNOOpsBDTJA60YEQ9h2Qz2cbMq3Tb?=
 =?iso-8859-1?Q?CZYUOVjel+UYDjgjKayE1TxJRaKFO6g5yJM6jLC74taHPhobXKW1kc1mnH?=
 =?iso-8859-1?Q?2l46udual7OXm6D9CmUzHefQBkPtfDWJdzrcaDai8oByFrstfiG3UXgvI7?=
 =?iso-8859-1?Q?CnvOnYvXWaGEsDrSzgOYxr146rj2ntJDgIxlyYRTq43UKhfDX8rXX3rWWZ?=
 =?iso-8859-1?Q?L0hZkLrrSP95oZQvnRwAnKRhfiHT4EEapwVNjdafmMo46ZRbPNOIvUrGX8?=
 =?iso-8859-1?Q?yPYPZd0jUZ6WH75MlhD/K8/U6Iy9nK1kpD29MXwS9O0umbgdX6hJWFg1WK?=
 =?iso-8859-1?Q?jtaKfDzF+CGvLX+vX6itd05A2krb3kEFjKKIZnQB7wzfrPygQWyVBL9M7O?=
 =?iso-8859-1?Q?CSpfCITeCUfhdKvSgPGMRaTFUQdZQ4rjaGZTDsbS7X+l3I5N/SuWr2eKBh?=
 =?iso-8859-1?Q?dVmFmm2gFYhMA9E7mfSnX1HSqRENrPZASCTHnmckVqeUsdysj8ZS0YV8aG?=
 =?iso-8859-1?Q?hcLHnaNZqjJPTKWFD7tNFCROvWYnMJm+m3PnKWRJnlhWJVgr+/aO82OGhV?=
 =?iso-8859-1?Q?mAlZkk5JGUBCoDqNKscSHOpsC3rKUtRyc62NUTbZdjfCj5QabhH9XtQIvg?=
 =?iso-8859-1?Q?/XWRWoltgnhBRGRGRCH2o5YG7g5QkadrkcE0a2lI0keS7Fdsh1QewZ6dro?=
 =?iso-8859-1?Q?grNJPbdWvPk/Cy3uuTlUsLfbAUPFAyxRaDsDZzC2TByC493XymkQiotyPI?=
 =?iso-8859-1?Q?IvEkeKhSMPmziPE/XjPcN9N4VJOW6hZ3ePgJeqHmszbswXp+0xed2H3Mu7?=
 =?iso-8859-1?Q?J/bSRbgjtSYy0euw/S9ED1KC7eL9pOgOSYj2P8QLrzofMxpY3TfJADt0YT?=
 =?iso-8859-1?Q?6/HpacBAbGDBjT0Ly6lxJLyB/gtjy0YPS4XdBLA5jr1Fb8tRyac6KAfw3t?=
 =?iso-8859-1?Q?Im+YaUxkQAhJat4j9quwDUq5hlfAbzC81GTpO+KEeAiWwgdvA8R7uGEBOG?=
 =?iso-8859-1?Q?xlj/H+fgqbK+tM1BQ9OE0ogtVtuqNM58Kv6yUV+Ds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0K5qTry560yRfXMn0qBQ9/8gLdcrTMSBzeyfLRabosaQ9CiM6VbWrmkG4P?=
 =?iso-8859-1?Q?6aAbPjsZFGIdn7TBKDeLQkWOnsdHvioYm7yrBUbyJxqaWT2Eg97WR1IDpw?=
 =?iso-8859-1?Q?A50cigwbF0MmfOXJmPxxXPg2VhAws9ls8YPVw/qVQPSiuz74iEpVXn+QEW?=
 =?iso-8859-1?Q?w59GX6Bs2GTcaEnUFqiPy8RG2bLH/7lsh87D+RyLMktj+4OEoZbnpPmJN8?=
 =?iso-8859-1?Q?v2aJdVyHns02Kvvep8J3zLzVTRqGDS0UNfXOADVSUkPZFcmA54ZSbUg0LT?=
 =?iso-8859-1?Q?aZ0B4OoiFouqfh7f3FmzLJ0nF3Qa8A+ckE454eqbXzO4TvaFUuR+dcX2VS?=
 =?iso-8859-1?Q?SuuL9B+WV9vQ6OoPqYV2yfaTCxz9pEMPSWQAAbvQfywYUVCXIXQKeC4nPZ?=
 =?iso-8859-1?Q?+BqHs8CjceaMIXouQ9R+MhUt4HVZfblo4dME/kO1NHGe23025m0wVf+R0p?=
 =?iso-8859-1?Q?K3LNi8ajijUOz/gTWRAUmGhGMumPfscF9JBsBmvaJXKlxf3evlu5HXgSsP?=
 =?iso-8859-1?Q?SovF989NAz9vRRq4Fm76ytPwJBk28vcdbIhuoKxJiNi6v67NgZ2P1RNKGG?=
 =?iso-8859-1?Q?mm2LkTDmc6OjQGDaHM6QXvWky/hAku4aVFLK6/AVcpcSaFEn+1Bw1p3pBm?=
 =?iso-8859-1?Q?2gqlhZtEuxpp2brLToV174b2Ds0kv+uRWQk6sf1tNa+Of/6ZWr+3Z0JJzs?=
 =?iso-8859-1?Q?fYc9xylSf8loJ/DOFecM8sL7Dv9GsNV03ddei0NvP/uUL91BnuBzIcOKMJ?=
 =?iso-8859-1?Q?2tefo2nmzC5Qz2c1+/dyqCKkXD6GC/TExtKxuAi8rPhlqs+QY2CixTmGKJ?=
 =?iso-8859-1?Q?p9x+vJLf5Yk4mIuQFrME45hF+3e5hBstmib+OxOGCd+80SCZoQHUo+vTCs?=
 =?iso-8859-1?Q?F1lT0kzrQQxWjIbSij9OUsG+MzppsJP7XUcsP/GkMWFsIFiwz3Tp6yP9sj?=
 =?iso-8859-1?Q?XXlehYJAKuW+WLH4gkRimdOh9mZL41cLHaIU/wBHu8it1m39vVQnrATSTD?=
 =?iso-8859-1?Q?PfYB+yJLzZuifsfGP0cqyEZ5fx+4V71chM0PNPC0fawON37JvUvDqnabEG?=
 =?iso-8859-1?Q?NNhChrUjGPRE1dH3GZq8AB4fZj2Eu7TEAb1qQ9ro0+PiJbSgMnG5ZxVVo/?=
 =?iso-8859-1?Q?kSUs6ksAFW23jrolg2B/4hrdnTQmrLtQcNDkQiLYXPQ4UE/cpon0LqmvOE?=
 =?iso-8859-1?Q?ZZgG3nrpuijUBczn/Mn9Ej4RXG086W2yTuCfD3XqDPSykY+nxIZIYHy0wI?=
 =?iso-8859-1?Q?tzMu62AK7vk7ox7/aSwQOvJHacJGV3LRpW6/C1W7x121yGlyZP8aYh4Lbq?=
 =?iso-8859-1?Q?GhYHo2lsd79w5L2/7Ze6c9vKqkEwUgS4HEZ4afWPuGDZFgYuEqZbnOyg/9?=
 =?iso-8859-1?Q?aJq3scKZ16gYxHG3FZcKsmb7tnxFLQX44adm0/4NW01sYHsuEsaCYEhQ4l?=
 =?iso-8859-1?Q?WhIDPR1tF+SZMx558QYOp2wkQt4ug87xBcBraDhvAAKUdB0uMmPa440XiM?=
 =?iso-8859-1?Q?wrz4tyXAPXzxZ+kwjc12tl/pJv1aLV6DxTX7FOsXPulYuE+vTSO9MyQIpU?=
 =?iso-8859-1?Q?10FM3C7sC89JrXVWN8P1tVOZUSMWqdBuIEWLiKo/MiUXRlhJRLzV1PU3dn?=
 =?iso-8859-1?Q?9TAkHyQEsJyhaV0gOTt0qIGvx62VsdxgTGmJ5XuTXjL3VCIe9cDd+TEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 796d2215-65bb-4233-f8e7-08dc655a5324
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 19:02:59.7347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk0EFUynD0WTYfUttaYd6dxE4aouhESbXyvaKoBM5KwB2Vsf8lStkb3tT5m5SRh56JAizUP4bl8QN46AXVvRvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8450
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

On Thu, Apr 25, 2024 at 08:18:38AM +0200, Christian König wrote:
> Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> > Make each buffer object aware of whether it has been evicted or not.
> 
> That reverts some changes we made a couple of years ago.
> 
> In general the idea is that eviction isn't something we need to reverse in
> TTM.
> 
> Rather the driver gives the desired placement.
> 
> Regards,
> Christian.
> 

We have added a concept similar to this in drm_gpuvm [1]. GPUVM
maintains a list of evicted BOs and when the GPUVM is locked for
submission it has validate vfunc which is called on each BO. If driver
is using TTM, this is where the driver would call TTM BO validate which
unevicts the BO. Well at least this what we do it Xe [2].

The uneviction is a per VM operation not a global one. With this, a
global eviction list does not seem correct (admittedly not through the
entire series).

Matt

[1] https://elixir.bootlin.com/linux/v6.8.7/source/drivers/gpu/drm/drm_gpuvm.c#L86
[2] https://elixir.bootlin.com/linux/v6.8.7/source/drivers/gpu/drm/xe/xe_vm.c#L464

> > 
> > Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c |  1 +
> >   include/drm/ttm/ttm_bo.h     | 11 +++++++++++
> >   2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index edf10618fe2b2..3968b17453569 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -980,6 +980,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
> >   	bo->pin_count = 0;
> >   	bo->sg = sg;
> >   	bo->bulk_move = NULL;
> > +	bo->evicted_type = TTM_NUM_MEM_TYPES;
> >   	if (resv)
> >   		bo->base.resv = resv;
> >   	else
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 0223a41a64b24..8a1a29c6fbc50 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -121,6 +121,17 @@ struct ttm_buffer_object {
> >   	unsigned priority;
> >   	unsigned pin_count;
> > 
> > +	/**
> > +	 * @evicted_type: Memory type this BO was evicted from, if any.
> > +	 * TTM_NUM_MEM_TYPES if this BO was not evicted.
> > +	 */
> > +	int evicted_type;
> > +	/**
> > +	 * @evicted: Entry in the evicted list for the resource manager
> > +	 * this BO was evicted from.
> > +	 */
> > +	struct list_head evicted;
> > +
> >   	/**
> >   	 * @delayed_delete: Work item used when we can't delete the BO
> >   	 * immediately
> > --
> > 2.44.0
> > 
> 
