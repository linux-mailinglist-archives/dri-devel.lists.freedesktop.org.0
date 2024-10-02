Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1398DE25
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757A410E0CC;
	Wed,  2 Oct 2024 15:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbThtfsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C85810E0CC;
 Wed,  2 Oct 2024 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727881241; x=1759417241;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Be1hIh+zFNuS0pB1qmdPcP3ffgBKj73voTuqFZBoKdQ=;
 b=dbThtfsSgmqlkJ90oxB6xbGNK4yK9UnaTULGnqwjWfaMI47Xi6Vw3rKe
 Gm8unic/BTgjlsz6KRo64K/NUhtVVhjJmavAvYgmyxM3PRgFA9CEXaBjv
 xOnOBJ0Ii7WiDO9BqjtJeo3KQlNMLyhAVpTOBkFSySelZe3AZ26px9y93
 +JtrMV2jt80yRI2CHF1L5NCueBSgbf3+0QB7MMRrUaIv9bnSrx+HbgbYJ
 RyyeEZ1sQlRHvRwXJzTl6CtkJFNWn+WKBjBQhD7Eh5P760tqTiZochL/o
 /p0Vbj2knRmw7WixiUtH90W5eOw3ko71rf9at4DqUhei3MY0B7IvelAy5 w==;
X-CSE-ConnectionGUID: QoZf+Kb7TaC5jEvjwR1d3w==
X-CSE-MsgGUID: GovLWmi8QnutMQ+W3lpQnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30839532"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30839532"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:00:40 -0700
X-CSE-ConnectionGUID: xZEKv0hpSdKgNMP4Vdjbng==
X-CSE-MsgGUID: 8vG66jjoQwKGjEFw2fuziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="104817135"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 08:00:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 08:00:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 08:00:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 08:00:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 08:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X57X73thHQw3p4RrkckzFSQdRbSuj6xAUtCPRAcOzBnvbV4oqQL9tb9W2209iddQFqNoERwfQ97k4avGdiYt5iQApCUtbh6KYtjezAmb94FZTmUmWVSYBGqZtvsSDYn+55VMaPhkH6WbLhELEEXBelS4dKWcsfQcgZ+dYG3KQ6N9Ybn6BePn5RsdcLKcSzDIQBQe/TWG9JkZ/QLLWD5QYTAWtMl9xsTR4+OAyN839bqo33ocFv8ef7zcbVXpG++YiybRrnSNbB0IA5Ch6bysXqRP30uddf2GmZ7JDhuQfJX1Aas2THKQVaEaA88QaqLIHEGe2ydXpv/zDghX6n1eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVCHTW/dpzr7D0i2+uVL5KsAqXtv2HrqElTUQrfsOaE=;
 b=cU2cEhjSTbwvNnffn6jnck5AC/j+fWagXEgWLxGmG3WqSbBNWu0ugi34I7nliX4RQELC4dNNpafsB7ipEfOyObcySweOogVUnNg5aVv+Xj4AQJoGXzSTuA6PqZ7sjbLSodtQNdJwC9ia7BroPZmg1q3c2puO+AkdINVWzorSdpsGXomm4nPCycY2kRlM5fGujYpx2vgHwfS0oUYdkNicYHCB+CFbZ5m9CA/PSAF9w5n8pCo2snXQVcOcSkt2kuZP3Ct/3FCGoGkGA/+p0kLtaaNXsQM7XO+LpGZhr3AYn8yFKDlrpjmDebQJwtPmTFcoE5yroR2Q3hvl3k0ZbliyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 15:00:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Wed, 2 Oct 2024
 15:00:29 +0000
Date: Wed, 2 Oct 2024 15:00:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <pstanner@redhat.com>, <ltuikov89@gmail.com>
Subject: Re: [PATCH v4 1/2] drm/sched: Use drm sched lockdep map for submit_wq
Message-ID: <Zv1f+KHSe+N282+J@DUT025-TGLU.fm.intel.com>
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-2-matthew.brost@intel.com>
 <Zv1VoJ_KEw1-P257@pollux>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv1VoJ_KEw1-P257@pollux>
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b04dd32-c9ea-4dd3-9fbc-08dce2f2f49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?L11MyPZBF4tCCbPmuu4+QQXAOHy0yjlQRvsW3IrbKG7UIpQayzK68ilv1L?=
 =?iso-8859-1?Q?ilcnQ4vMiRA/JHi5TkYTQMspgDOzzSm3VfT7ilWPWPPgVWS6bdkEEHOpDQ?=
 =?iso-8859-1?Q?2YsU+MRGisa1cgWYaaHn6j9f0zavUnrHnrEagcuVh8ayywi5hQcp0BjLW5?=
 =?iso-8859-1?Q?fPOAga1jgYK9G+wUyWAID09iEq13NHG+4D2vvaVcvVDl3LLK8so0q8Lww5?=
 =?iso-8859-1?Q?zPx8+/OfU8/pZHIguaNq4KF5azRdNZUhjlaOW1VJiAz/bPlwInHcS8+i3n?=
 =?iso-8859-1?Q?lKM0CdmAEGt9NsA6VQuIcD/6wJaCVNk8IA2x/gpPlK1SMf2GeKkjoTeftH?=
 =?iso-8859-1?Q?qxjwfQENX9+T5mYCJSK8cBMzO2L2Czr0md+gamd3cjuT3i6pmIlzjjTFBA?=
 =?iso-8859-1?Q?0lqv9tCimeWejjo+wb7LPpTxqVs+OKMqTA3B8jqYeVenEZ5EeaFuTF5WiY?=
 =?iso-8859-1?Q?VczveTLFu7/Y9qjTI+QHQ3cjRe/fAcdkrULTRu12XAx97pUugnpELfz1ZT?=
 =?iso-8859-1?Q?sHQSVsjgs7lG91p7wV53fuGm6t7Cw+2HBvffRjzoxPufsNPYju515gPU8S?=
 =?iso-8859-1?Q?tbDg/jQ+4Meq68hS8M0ENRHHJmwdZ1kcux7Te1/RkRZQ6AdMiHhzCkUeO5?=
 =?iso-8859-1?Q?vduCFjKoc4JR1KiKeBgd7w1X/qwdhGAZHHsLtlRvJ3fhBJvmaZ/D1IKmNp?=
 =?iso-8859-1?Q?34jU32dW04IylW4seFMryvz+F1jZEZuFz+mCUUiFQ1H0ZH12AmdeDcFIVB?=
 =?iso-8859-1?Q?gUAPjGl0iuOGf38XvDT/nbhp3ojrpKU5H+yoOb0wsUYYY4QufZNwuau/gN?=
 =?iso-8859-1?Q?+4rlNToTXEDYsifCa5W+tuaRl+50/NKULKAx3JX57rQsk351Ee3f68k/Rp?=
 =?iso-8859-1?Q?UOPq3JPMc5aYCII46WYclozbOVqmklLqA0YKpb83bye8h5JR66jmVcLTJW?=
 =?iso-8859-1?Q?UbINqzYrdZYiBBaljsxdD11bB2pP1zfYHvyt9Tw8asKco7zAD5mTzI6Fmw?=
 =?iso-8859-1?Q?Ze/5UUGzNDpLIdBS5CsA5GRr+fQX9/bUk7gG8ntJ62NXwYSiKXGUWi93SK?=
 =?iso-8859-1?Q?9/YbuWtkVavYedevJEFDZgbkG222w6sjQWAPvZOW28gh6L2Bf6z+zywfU2?=
 =?iso-8859-1?Q?UJ7xmyvbaryXtE7CEhHmWQCx8wUvwPez5lgWtAzrjezK3ay+NX3OaEkNIV?=
 =?iso-8859-1?Q?7J1x8thIM2cYL8Ii49kMVYBle/AGlsl43BuYPOBT/xcxEo6VsR5B10hi62?=
 =?iso-8859-1?Q?Mui/9eI3db7YnJyo+QhVyemWnWLsguFG5BwKcqiQONsRdDNSpHC95tUhNK?=
 =?iso-8859-1?Q?g7T3E7goxafwt+VTFxX3aWBx3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ec9k306hurPYzHmubovlBhV5WkA4hMLVUTfWcWtu9gWrxiqCNnk7IpY9Zy?=
 =?iso-8859-1?Q?+CgkLaSVmPDL/v+fEc4cf40ZOdg14kC1Z7xCXJ7fzti1XX1LMu97bkFiQI?=
 =?iso-8859-1?Q?PhKJQnQnyepk02rj3emG46hBZExVj9wtUn+u8XonWPkdejyHBmGDFcKAUL?=
 =?iso-8859-1?Q?qS6NFDwm7GZTot1Swm6yUmEek06sEvPT+8v3Pxr0kTUIAlnj2Kyvnv7d1q?=
 =?iso-8859-1?Q?gNKKrq6XvRbXXpa7r7+b7w/og1T6bglBP8+A0jEESIqK1z26SzlpDXZOn2?=
 =?iso-8859-1?Q?lBvroeT5WkvfRL6ln3PJ5fs5wj2AkLpdwrOw8nCVeOta4Rdbg9ZVHj6z7t?=
 =?iso-8859-1?Q?PkmOC+QdBRs4AsP4De+kuBtlA7qIcHRMhbqE1e89D9WshSTfS124Ld3JU4?=
 =?iso-8859-1?Q?p4pIcnqvGMY2oig2eahVWuaDnOk9i5cG1ZypcFsPJWkHcr/S7gby7CsalK?=
 =?iso-8859-1?Q?q07wGE2noCVhEASunJy0AgVDiJgPiwJZY/k5Taorl1Pnl/VOJsO7aKjPbQ?=
 =?iso-8859-1?Q?2pR/VUYA9kBpaT3Q4LPJn7D2y2uXVaA1rIVb26wkg2MeX2TvjsfZP9mVse?=
 =?iso-8859-1?Q?/hiZsYIdWuQuqQ6mMwZqJD66ZMG4zaqi75pdAkq6Ui7XE1ptOFcBo5XOBV?=
 =?iso-8859-1?Q?8XetVAD2/6JEoN919b1b08yyVuA+ZCnJNwusymsz479UKIW7+sJHS7l0zj?=
 =?iso-8859-1?Q?vEezojTPeWQCx5P0m3tg6EFdXtG2ORPaG1TIQhr0b9xVLNloTv/3xZ/27i?=
 =?iso-8859-1?Q?j9dEUz1W3lQ+sNiKN4hdJV5YHS+WjbKR6tkWaO0WzqIS5E27jpbT8KkFcU?=
 =?iso-8859-1?Q?YVkG0BjE5YvfdMIrdn050lSJUNmg+O9EzjGoFjYTzSm7rdFKXmAjqJT4Hm?=
 =?iso-8859-1?Q?y0l4/ctOcK6fF3lvsP1CM+OtSxkIVs3UbEKuRTST6HcKNR1vLRT4vOT7lO?=
 =?iso-8859-1?Q?Pkr3xiUsnaE4b/dEgrs91E5p6k3BTu80WYh9i7MfyS8OB9tPGa8qn6xZc2?=
 =?iso-8859-1?Q?v+7LOGvw3wYJuKGtsmJJKeNxuXI78ktsM0YGZZg9wukI9XeKgIJwcfUvtB?=
 =?iso-8859-1?Q?ilxU74PkZgFwoWJIpv/mbr1gT42YEZqL4xJ+YwG6/A6juPOdz6Z2ltedKV?=
 =?iso-8859-1?Q?tTbliSU5+1R0tt4cCW329bIaTWvXim6BpMMmvXcfeuuXjaMmdtgkQiqofz?=
 =?iso-8859-1?Q?jUwWedlwrmdvu363qd/OtWgCZ2XflTLxe3KZzVK5Lu4BEeWiJ92FDnzCMj?=
 =?iso-8859-1?Q?uTn71+6yKiRBe3qGagnXEj+TiQrKCw1eqEOVIVLN4Ebzg+8IYLk7jMnMBp?=
 =?iso-8859-1?Q?ffpIHTGErEaLEJ+A3juJUO1fR6p/f6RKaN2U+ZZnMtoFZ+PPRVGOxaL5fX?=
 =?iso-8859-1?Q?uQ1AOlpvx70eSbGovVC8l79K1WYPGabYJrzpgD0qG4VSL3EI/mjbA2eHlY?=
 =?iso-8859-1?Q?YKR03m72tS3dEpUQ4xqxOhOgHe8Zw7q2oT1xRYIZfIEQeSU0jHF/dlBtc8?=
 =?iso-8859-1?Q?1QK6W6IzSBtPdLEx43rIEfjFXNCp3R7Af2lonSal0dPZ4339jCKcc3RyJH?=
 =?iso-8859-1?Q?ZLtr8aLCgLOJgqZBiLP6ggLzWG596A1Xcvqh0S75mzPPDCzSTLHCRPGdlp?=
 =?iso-8859-1?Q?yI7+Ute2VdZRHtmvg1VCcBwfPHMdNvETMnjiWZskba8puRo17OnID3Jg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b04dd32-c9ea-4dd3-9fbc-08dce2f2f49e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:00:29.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSW4Zr68j8i7M3h5jpGvLzpEtYtS8je89pgsYTYvbAXJNzDHKZhXkLMhESgWN79ndiNWz/vyNkoGkYu4w6WOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

On Wed, Oct 02, 2024 at 04:16:00PM +0200, Danilo Krummrich wrote:
> On Wed, Oct 02, 2024 at 06:16:38AM -0700, Matthew Brost wrote:
> > Avoid leaking a lockdep map on each drm sched creation and destruction
> > by using a single lockdep map for all drm sched allocated submit_wq.
> > 
> > v2:
> >  - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> > 
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Good catch,
> 

Thanks. I'm likely to merge this patch through drm-xe-next rather than
drm-misc assuming it is ok with the drm-misc maintainers. I've pinged
Maarten about this.

Any objection on your end if I do this?

Matt

> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 36db5c7736fc..e32b0f7d7e94 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -87,6 +87,12 @@
> >  #define CREATE_TRACE_POINTS
> >  #include "gpu_scheduler_trace.h"
> >  
> > +#ifdef CONFIG_LOCKDEP
> > +static struct lockdep_map drm_sched_lockdep_map = {
> > +	.name = "drm_sched_lockdep_map"
> > +};
> > +#endif
> > +
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > @@ -1270,7 +1276,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		sched->submit_wq = submit_wq;
> >  		sched->own_submit_wq = false;
> >  	} else {
> > +#ifdef CONFIG_LOCKDEP
> > +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> > +								       &drm_sched_lockdep_map);
> > +#else
> >  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > +#endif
> >  		if (!sched->submit_wq)
> >  			return -ENOMEM;
> >  
> > -- 
> > 2.34.1
> > 
