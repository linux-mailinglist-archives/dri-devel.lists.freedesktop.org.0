Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D19A31CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 02:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8A10E341;
	Fri, 18 Oct 2024 00:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkFWMXjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF610E049;
 Fri, 18 Oct 2024 00:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729212902; x=1760748902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+fbDPj8OX1gR7x16sjzkRx132WeX4+0NQPG+siG1ZKM=;
 b=gkFWMXjN7GBjbUOWRNxdk0j0Pbvlu4LJ+BXZxfv8r99A/AYfEKghDW+A
 85Nw0rh/ZayOLg/kH+xioFsNy2doMhsTfxyUarBEym+SoAyAmeO98xAcv
 CwrrRDrRJCRJyHwL9ZLr3UTlw6ET1oJSVsJA6LngRsmgVrTo2LZJ7zVGy
 NJFgxQM92KWNQRo9TtU5BFvcz7FpS2f1/cZXr+lBAG9DnyVcraoeo4Txc
 Kw/d5lNYGkHP6IVprxrnI8bawCD1L1VTbtxCfv1VROFuSK3lgl/CFu7Gj
 m0CJQgKC5FZu8I0xAqJBgXxEJMtfRV0+WviwVkXvgHJaJxNhdOFQzrIcv A==;
X-CSE-ConnectionGUID: ao5RLiKdSJ6ThYv3JnYMoQ==
X-CSE-MsgGUID: L1/nF0wXRkKIW/hTJ6i5tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39854643"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39854643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 17:55:01 -0700
X-CSE-ConnectionGUID: ZNvoiQcASiiUXNJzVckQ/g==
X-CSE-MsgGUID: VbaOK+gTR9GH9les3EGzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="109456752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 17:54:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 17:54:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 17:54:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 17:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG3yayc5/dM2qQAjFJVsReTCZoWERQU/0DaAeTmpGp7tfCDQoVkE4W0MHAxNr2AAsAcnbubZDOkwXM7ixWpbf6hNr6IdLUrkCyolUTrxXHaWt/TmeOrV/gETKbABph9L1Uk3hoceOGW5CtvmlKdoUyhrT1nU/NO61MmXXQx+5e3Hj8dnkAG9vbCrOyj82qykqyYYSH/SuBck4WoUQX/7qMOy1QNSlmj9v6NJ4vDnYK0rfH9mex4JrCi+Xp4cfYa1RXQD3GAFZGrYltPhBC3otyJ+U/s8eBo+QLxaWAkEK6csIjkw/89Mks8nrIdntnGlp4diNSWgPtOAUfxENLWAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jl7Oq+DqN/BRI+S4RiDJq8svOnCYPAuGkJ0B4CSdcSw=;
 b=vYhKIMKruH1gTGhkpFh6ZYWk/WPbGpvylH80RfpUFIK4i4yanEEaCERnWYZhUZA9npQSZEjv+taWIS7qPaldEzfujWn0VfybD5G6T3z/AFr6XL1pNhp6MPHYBjHbDEqvv2F8wrflKW1RMv4t3esYeWVSzzPhgAq4obnxEwRiGWPybM6S7IELmfAk30pi8XvueDqgob9rDZEyVJ1bnsjgGRFJY1c+cX5BxKZf4aX1Qh284280iQdeay6u1GtqWwxJuV0Tgo1et/II+YDH0myvV/bJWvKdjyE2oH981kY6nMVV6REzCJUcDuYeeizFVI/O6le7bWMVzPlQ04RUNxAV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 00:54:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 00:54:56 +0000
Date: Fri, 18 Oct 2024 00:54:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
References: <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87r08emlb7.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 511020a8-4e1f-4a9e-1605-08dcef0f7bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BGZmcK+IitKRyq6bA3XRuPMbvBeo5Qp3ZvFk/MIiSnFsv2D8f2q/zb6XM00e?=
 =?us-ascii?Q?F0GL8QBu12lwSZKi6UqOu2VStbLiHsyuDfKIKEPT5QJN24N8eKCrOnX+q1/Z?=
 =?us-ascii?Q?KUR/k+A2CBIQ5JqKm2b8x5frVGhK4jfRqcwWfThLl7aQhRF99Fn1bkSnz4fP?=
 =?us-ascii?Q?xKfNhYmdlBfa2B8gONi9kqy06EQYoaK4ReDSFwpcIrnMeB9Ze5/LhsFxJnxN?=
 =?us-ascii?Q?vri+q63PjPDJM2ux9e/yNJv6uwqf/uIhCi8Fe7rtwYojbvd8tE40t/deAP1i?=
 =?us-ascii?Q?IiYGJpts0wjImEzDeRw4c4k6E9nBMFSGJIGMam7rHsq8hf9PiAKp8f8SE9oo?=
 =?us-ascii?Q?b2Xr7yfXIzSvJm0FL14WmPqdBBJbZ/6TxzPkyLDvXHAENJhM1OzDJ5f4Q9M4?=
 =?us-ascii?Q?r3or8kcwISGVAlLJFPwcukFK43H29eLmdc2pxxlDIl0GKt8REgJvwlLHOl+M?=
 =?us-ascii?Q?vTX+xCL7RbJ0ve5PvnCPR9zpn6TvRiaLzdi01xq4Etsszwe8ZureQceG8EgU?=
 =?us-ascii?Q?f+9zMVU79p25lDfBSNlcZWXI8uevEQWYnkOZZRqzTmMc6NstCct6Fg2p0Lmh?=
 =?us-ascii?Q?xLt22WeWN70x0mPJbB6uFuVfMPbe+rHhGmaSgz6LLQalNQu4G/fAkkrgh6rr?=
 =?us-ascii?Q?BWve79wUVPPkGdpInVKG4BuuXGAZwB35nlifs+dmdyg35N3XZbiuu/ZDYh7W?=
 =?us-ascii?Q?AVdbQm0cM9HUSbZLq7LiQM1X501z4iAGkHuE5DhaA2ozbGzb7mmhQDj8CSsp?=
 =?us-ascii?Q?jD7egOPVjgHF85dld1Qlp0PDPnPncxKxZe86BuQzj0MYgSIS3wCNKy6nC9oD?=
 =?us-ascii?Q?a7gGdEEPXo/9jo4U9zMHq30xyIa0TAjwoQPZeMV+Qn2Uc/XDz8JNAIiK8biw?=
 =?us-ascii?Q?Fh3lKg/aYT4doFPxQb82PcqX5oCmqhurrpRmmslMONSjTQ2sPGrqo/thD2g4?=
 =?us-ascii?Q?naJgB5+IaoUDE8n8Gq5dXPdezd7mppPcfpjoWwO8r+UOEOSN2k4ijX5tm5Cq?=
 =?us-ascii?Q?3X8i61PoIt2wY28TM/HajyoJc4xkgscJeylxcyw7JAyfBsQFswPUE/KLBuMJ?=
 =?us-ascii?Q?dV6QyCpz+LMNku5bNWlR8KZNOaqWmScQlP/NG0R+qsFyPr2hYI1VP/GSALME?=
 =?us-ascii?Q?eyNPXQGJ+00wj7e5z/kgVnqfP8jDCgqY0usLbzOv8ar+ahr3yz9ez11NcF5q?=
 =?us-ascii?Q?U07iUMK4NlP3/QYBbAOAZahVB2ngJ7ppurGp/d+atuWTHlyD2xQOna+sL8gR?=
 =?us-ascii?Q?l6guPVQQrZc/q68kDwsLrsXWFn+NERRVDOmReKxhfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvUpiuq53VWVCdQ5js2diRBboial9GZDzigiGPIYQhupboBgMthodHrbw6EV?=
 =?us-ascii?Q?M/KkWcJl3HITN6+wKOfdNlfvxgh4GrJ44SujEApdIsvnXbOw/vm5L0SrJhb4?=
 =?us-ascii?Q?Jv5zLIf7rk6OhtkUhqlDs6ydwQ3aImXHuBumkM+TyEbU+I2SPR6dQ7qMQVgR?=
 =?us-ascii?Q?1R0szmTbBNAcbY1CzWJzrSoUfXVT/wQOElPpTXWXfP/uBzJAbhLpZA7p2mlJ?=
 =?us-ascii?Q?U0dE0LQELtSrscPs/9ZOMebimi8IG1/FynbST6E66hov0zX8k7C3KbI6qRwY?=
 =?us-ascii?Q?zdj4EkdU78u4DkoguK+W92RUEJVsLKWCSnbhA8sw++GNa3S1nq3EYXIXh7Lv?=
 =?us-ascii?Q?NEpxst930IZfaQuXpijJbCHIsuf4ATPL149tuAe3deNHRs4qBT3DtRsFl7Jj?=
 =?us-ascii?Q?kNgB2hrudZla9YunyOBacAQzOs7Yz4tzSVNG3QW5WzY/DN71nSJBB57zl9ap?=
 =?us-ascii?Q?raRbfslUCTlaMi9rsVkjuayaQJaYXjjNRM/q+/iZk8AKYNuBF5kdBqrlvwrv?=
 =?us-ascii?Q?6ogcDvmGazdbo+/mRN2cJVyD9ecahWmLvnmOnHKNe+57CWtoxa6+jQkyYwPP?=
 =?us-ascii?Q?FRAfoqCIx6bAM1RIWAKCGGZj/jeHWk1SlvgEBZDMQXLwdCbBfAJkdxZuDoyB?=
 =?us-ascii?Q?SHiVcfaDTGIaOPruBjhDBzjZg3h3Bvgbgo4mWGLshW49Gqd2kC+y2E6MiNRT?=
 =?us-ascii?Q?rYXxNsokKmr62D9WHNLWa/Rc55v+LvwMO90bxKUfeCcoQQFBcx3fjFHKsFRA?=
 =?us-ascii?Q?vPcCU9rOrDJ6ZQ+dcEIXj2dVDVhGQ7bSP5cPhm72BtwTM4HtCOqJ88MABfSo?=
 =?us-ascii?Q?0gBZDo95+PBc1h3tjFVWUst74LDuGuayu5gFCRaWbk9ABPun0DFvKO6pADHT?=
 =?us-ascii?Q?O3dQK/nJtBbRqwyUpl0epKE6KrMTxuJZMO8UBDVX7lqiOae/dNLqYrNCad8R?=
 =?us-ascii?Q?29wTXmC+03gyQl6yjRGnMr7qsw+s3JJ+l9gHRNcboQtnEomNh9DnIsvWyV2q?=
 =?us-ascii?Q?X4/leRqQbAAjt434MpxXOK57L+JogL+YTK8s5e6Rmy9BY6YnafEpqxHG9cQj?=
 =?us-ascii?Q?I0x2AHx8BOM9RKZzAtVxogzXfAWCZYlFewcihSjOTHcn5RiWfE9p8+fZzdHy?=
 =?us-ascii?Q?DkSxVEGo9s4tkCr4weguBBmp0TzdiL4Y1mZE0QsfSWB2VV+0H4A5NglVhaMT?=
 =?us-ascii?Q?TU+hN6E6P+V0cWZTKMyVt/lfdcqSw1IinpkB1IWHUxroDaPxfHnh2djER0RC?=
 =?us-ascii?Q?nZoxz5DvC4PY6fnViw4rRMeLVUOaFZ4WE6b/Mfguypo68eS7HObNmS4tGPAU?=
 =?us-ascii?Q?7EmaY+osSE/Pm5Cr7D4HbGysOiicK3XBk0qXtKfNgS7B0xcaJ3DvlPkOINGz?=
 =?us-ascii?Q?Hwgmj2XK59BZfzneYn+XXIDUBEYtnWmT3Dt/roXgcoXvdhDv1c+Gc0/zkuHB?=
 =?us-ascii?Q?pukZotPS5S4LMwR3s/YzZnGvkDIOtkV5cWiZNKXk6jy+dqOM+OXaILvrQcTx?=
 =?us-ascii?Q?KGUR2mCN2kTdLgzSWgyCKdgCZ/764qQshf28Bmhi5ifc+wsyuk11h6rPUAeZ?=
 =?us-ascii?Q?NLlmzncmil0FeM+5ezqn38+YrZmp9BKOj8najidqFZZU/kS8X6l2imB2BT7f?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 511020a8-4e1f-4a9e-1605-08dcef0f7bc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 00:54:56.1086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgZK8f46aJZJHI/eAllSw50RgiFa/3MyCEZ/nUEkRB0eXrC/a8UXn2REEzZL6of5DTvU8IsV8xut8qWlRcgvdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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

On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> >> >> 
> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> 
> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> >> >> >> 
> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> 
> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> >> >> >> 
> >> >> >> [...]
> >> >> >> 
> >> >> >> >> > > +{
> >> >> >> >> > > +	unsigned long i;
> >> >> >> >> > > +
> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> >> >> >> > > +
> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> > > +			continue;
> >> >> >> >> > > +		}
> >> >> >> >> > > +
> >> >> >> >> > > +		if (!trylock_page(page)) {
> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> > > +			put_page(page);
> >> >> >> >> > > +			continue;
> >> >> >> >> > > +		}
> >> >> >> >> > > +
> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> >> >> >> > 
> >> >> >> >> > This needs to be converted to use a folio like
> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
> >> >> >> >> > a function that both migrate_device_range() and this function can call
> >> >> >> >> > given this bit is identical.
> >> >> >> >> > 
> >> >> >> >> 
> >> >> >> >> Missed the folio conversion and agree a helper shared between this
> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
> >> >> >> >> 
> >> >> >> >
> >> >> >> > Alistair,
> >> >> >> >
> >> >> >> > Ok, I think now I want to go slightly different direction here to give
> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
> >> >> >> >
> >> >> >> > What if I exported the helper discussed above, e.g.,
> >> >> >> >
> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >> >> >> >  906 {
> >> >> >> >  907         struct folio *folio;
> >> >> >> >  908
> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >> >> >> >  910         if (!folio)
> >> >> >> >  911                 return 0;
> >> >> >> >  912
> >> >> >> >  913         if (!folio_trylock(folio)) {
> >> >> >> >  914                 folio_put(folio);
> >> >> >> >  915                 return 0;
> >> >> >> >  916         }
> >> >> >> >  917
> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >> >> >> >  919 }
> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >> >> >> >
> >> >> >> > And then also export migrate_device_unmap.
> >> >> >> >
> >> >> >> > The usage here would be let a driver collect the device pages in virtual
> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
> >> >> >> > migrate_device_unmap.
> >> >> >> 
> >> >> >> I'm still working through this series but that seems a bit dubious, the
> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
> >> >> >> would help me a lot in understanding what you're suggesting.
> >> >> >>
> >> >> >
> >> >> > For sure locking in tricky, my mistake on not working through this
> >> >> > before sending out the next rev but it came to mind after sending +
> >> >> > regarding some late feedback from Thomas about using hmm for eviction
> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
> >> >> > doesn't work for coherent pages, while something like below does.
> >> >> >
> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> >> >> >
> >> >> > Here is a snippet I have locally which seems to work.
> >> >> >
> >> >> > 2024 retry:
> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> > 2026         hmm_range.hmm_pfns = src;
> >> >> > 2027
> >> >> > 2028         while (true) {
> >> >> > 2029                 mmap_read_lock(mm);
> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
> >> >> > 2031                 mmap_read_unlock(mm);
> >> >> > 2032                 if (err == -EBUSY) {
> >> >> > 2033                         if (time_after(jiffies, timeout))
> >> >> > 2034                                 break;
> >> >> > 2035
> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> > 2037                         continue;
> >> >> > 2038                 }
> >> >> > 2039                 break;
> >> >> > 2040         }
> >> >> > 2041         if (err)
> >> >> > 2042                 goto err_put;
> >> >> > 2043
> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
> >> >> > 2048                 goto retry;
> >> >> > 2049         }
> >> >> > 2050         for (i = 0; i < npages; ++i) {
> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> >> >> > 2052
> >> >> > 2053                 if (page && (is_device_private_page(page) ||
> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> >> >> > 2056                 else
> >> >> > 2057                         src[i] = 0;
> >> >> > 2058                 if (src[i])
> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> >> >> > 2060         }
> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> >> >> 
> >> >> Practically for eviction isn't this much the same as calling
> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
> >> >> probably shouldn't be looking at mm/vma structs.
> >> >> 
> >> >
> >> > hmm_range_fault is just collecting the pages, internally I suppose it
> >> > does look at a VMA (struct vm_area_struct) but I think the point is
> >> > drivers should not be looking at VMA here.
> >> 
> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
> >> so in general I don't see a problem with drivers looking up vma's. The
> >> problem arises specifically for eviction and whether or not that happens
> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
> >> issues there (see below).
> >> 
> >
> > Ok, if you think it ok for drivers to lookup the VMA then purposed
> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
> > needed, rather just the original function exported in the this patch.
> >
> > More below too.
> >
> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
> >> >> > ...
> >> >> > 2101         migrate_device_pages(src, dst, npages);
> >> >> > 2102         migrate_device_finalize(src, dst, npages);
> >> >> >
> >> >> >
> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
> >> >> >> > lookup during eviction cases and this would let me fixup
> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
> >> >> >> 
> >> >> >> That sounds reasonable but for context do you have a link to the
> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
> >> >> >> just missed it.
> >> >> >> 
> >> >> >
> >> >> > See in [4], search for '2. eviction' comment from sima.
> >> >> 
> >> >> Thanks for pointing that out. For reference here's Sima's comment:
> >> >> 
> >> >> > 2. eviction
> >> >> > 
> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
> >> >> > migration gurantee:
> >> >> > 
> >> >> > - Only looking at physical memory datastructures and locks, no looking at
> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> >> >>
> >> >> I also very much agree with this. That's basically why I added
> >> >> migrate_device_range(), so that we can forcibly evict pages when the
> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
> >> >> general it is impossible to guarantee eviction og all pages using just
> >> >> hmm_range_fault().
> >> >> 
> >> >
> >> > In this code path we don't have device pages available, hence the
> >> > purposed collection via hmm_range_fault.
> >> 
> >> Why don't you have the pfns requiring eviction available? I need to read
> >> this series in more depth, but generally hmm_range_fault() can't
> >> gurantee you will find every device page.
> >> 
> >
> > There are two cases for eviction in my series:
> >
> > 1. TTM decides it needs to move memory. This calls
> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
> > here albiet with the new function added in this patch as device pfns may
> > be non-contiguous.
> 
> That makes sense and is generally what I think of when I'm thinking of
> eviction. The new function makes sense too - migrate_device_range() was
> primarily introduced to allow a driver to evict all device-private pages
> from a GPU so didn't consider non-contiguous cases, etc.
> 
> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
> > partial unmap of a range, etc...). Here we want to evict the range ram
> > to make the state consistent. No device pages are available due to an
> > intentional disconnect between a virtual range and physical
> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
> > using hmm_range_fault like I have suggested here.
> 
> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
> fine for this usage and is exactly what you want - it was designed to
> either select all the system memory pages or device-private pages within
> a VA range and migrate them.
> 
> FWIW I have toyed with the idea of a combined
> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
> migrate_vma_*() process but haven't come up with something nice as
> yet. I don't think mixing the two in an open-coded fashion is a good
> idea though, I'd rather we come up with a new API that addresses the
> short-comings of migrate_vma_setup().
> 

I think that would good. Here we actually need to lookup multiple VMAs
and have a sequence of migrate_vma_* calls as it possible for VMAs to
have changed after the driver range was created. It might be nice to
hide the VMA lookup from the drivers with an API saying collect and
migrate all pages of a type in a VA range much like hmm_range_fault. If
the range spans multiple VMAs that would be hidden from the caller.

Matt

> > Note #2 may be removed or unnecessary at some point if we decide to add
> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
> > now though. See 'Ranges with mixed system and device pages' in [5].
> >
> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
> >
> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> >> >> >
> >> >> >> > It would also make the function exported in this patch unnecessary too
> >> >> >> > as non-contiguous pfns can be setup on driver side via
> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> >> >> >> > in [1].
> >> >> >> >
> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
> >> >> >> > migrate_device_unmap?
> >> >> >> 
> >> >> >> If there is a good justification for it I can't see a problem with
> >> >> >> exporting it. That said I don't really understand why you would
> >> >> >> want/need to split those steps up but I'll wait to see the code.
> >> >> >>
> >> >> >
> >> >> > It is so the device pages returned from hmm_range_fault, which are only
> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> >> >> > MMU invalidation which takes the notifier lock thus calling the function
> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> >> >> >
> >> >> > I think this flow makes sense and agree in general this likely better
> >> >> > than looking at a CPUVMA.
> >> >> 
> >> >> I'm still a bit confused about what is better with this flow if you are
> >> >> still calling hmm_range_fault(). How is it better than just calling
> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
> >> >
> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
> >> > vm_area_struct argument whereas hmm_range_fault does not.
> >> 
> >> I'm not sure that's a good enough justfication because the problem isn't
> >> whether you're looking up vma's in driver code or mm code. The problem
> >> is you are looking up vma's at all and all that goes with that (mainly
> >> taking mmap lock, etc.)
> >> 
> >> And for eviction hmm_range_fault() won't even find all the pages because
> >> their virtual address may have changed - consider what happens in cases
> >> of mremap(), fork(), etc. So eviction really needs physical pages
> >> (pfn's), not virtual addresses.
> >>
> >
> > See above, #1 yes we use a physical pages. For #2 it is about making the
> > state consistent within a virtual address range.
> 
> Yep, makes sense now. For migration of physical pages you want
> migrate_device_*, virtual address ranges want migrate_vma_*
> 
>  - Alistair
> 
> > Matt
> >  
> >> >> we're talking about eviction here so I don't understand why that would
> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
> >> >
> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
> >> > as argument. This is about avoiding a driver side lookup of the VMA.
> >> >
> >> > CPUVMA == struct vm_area_struct in this email.
> >> 
> >> Thanks for the clarification.
> >> 
> >>  - Alistair
> >> 
> >> > Matt
> >> >
> >> >> specific concept?
> >> >> 
> >> >> Thanks.
> >> >> 
> >> >>  - Alistair
> >> >> 
> >> >> > Matt
> >> >> >  
> >> >> >>  - Alistair
> >> >> >> 
> >> >> >> > Matt
> >> >> >> >
> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >> >> >> >
> >> >> >> >> Matt
> >> >> >> >> 
> >> >> >> >> > > +	}
> >> >> >> >> > > +
> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> >> >> >> > > +
> >> >> >> >> > > +	return 0;
> >> >> >> >> > > +}
> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> >> >> >> > > +
> >> >> >> >> > >  /*
> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> >> >> >> > 
> >> >> >> 
> >> >> 
> >> 
> 
