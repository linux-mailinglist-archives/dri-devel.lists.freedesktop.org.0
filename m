Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7e/sFWqOlmnThQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:15:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339F15BFE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA110E275;
	Thu, 19 Feb 2026 04:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRZUravi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8110E25D;
 Thu, 19 Feb 2026 04:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771474532; x=1803010532;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ODo8PJEDXezFSYIZz9CLj4+nNSJR3sBFt91UjopwcII=;
 b=QRZUravi9S0l7RG12qPjoyD3FJO3thuKhs7xa1x5kwvjna5FCO/qM6Jq
 6z3Rq6SnhX9lDSYw1XRElAGjSxxf0gHjNPlq5sTHSFMJ7uL8HD3I0+FGK
 RF7lkV7h2dHwO2AfuS4VveBgwYOdc0pphV7csto3+Ed50TXD3EY1x/DMc
 S8Gn98zpx6j6tSumJKuaqRPylTsyefRW9lyUjsxENCi4nQ1wozcFZ8Dl0
 4FYs2rMOc/aEJZq6Pz9L2YeutCmDV3x1sc1kqSV7pfVELpDEp/tHFFjN1
 yrERCkaLOklpP72okocOZXspMDKYxwngZF5+mwN09HCqZ1SMze2/14wAN Q==;
X-CSE-ConnectionGUID: HPUma8DuTweljpOFBH3ssw==
X-CSE-MsgGUID: 9+Xg7X9lRPiXJYkA5k5sHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71583070"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71583070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:15:32 -0800
X-CSE-ConnectionGUID: BHKL39HdTkKGbY39bvTODQ==
X-CSE-MsgGUID: 0q0SAFxZSRKt5FiLx7X8xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="219402568"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:15:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:15:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 20:15:31 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:15:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+OhfkE4TSTRz3YQrP2LdFhfwaLus16QucfqgfpfPDC/jJ7kHhquc2kLkDCLcdFqd2KdAATRbOvaQ6wE8Ff10NFiKnkw361vQ2IXdKJ0eDdrMvLOJ2aEHHnr8qnaVgnjUBJVRAOBhQtZIq1DUfStLyR51oXQWlxP15xuq9zffL627I+MJCfWjJRAPOCZ1ub8BL5H0UPl0ozU2q0gw3UzjhIV1f1q7Xc/h+EFmtBZ+kB44qyxnSD4Pw6WYoEi7boemzhHheo9mNZeQ6AD2C+W7XEVOiAoVWCj7u/EoM/gMoU4PWPzjChy6edUJnSKW6PscnJWSPgU/W8yAF4jr8MvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+EhSCVRZGFRC5a1nN2zrSnSwu996Yoss540ybBdjRI=;
 b=vMMd/OaVheKxIGbyJ75XKMPZzWjEFQyQG5OwoDimmxfNb3Uxuxw4Q7ARd0ucgwz5B6wONsv5GImkQVjEOiW3z98NRrZzM0i4cvQPmT6OnUT5xBPsSpPA3GgSRLet1qn8YJVIvbaR4+rylOSi/Qrj9a2jIjxNiKD8RlIQnN+9Zja2LgLkEaLkBqgHQloGMtcbuRw54/Wa4iHy7CpjkyKgW6ZEX4w3HBw8FA1DOVBEU7qAxXoCMXJKFtJ60mV48D6bXB4mKAtot+lscEfrOwl1phNBdUgGA9dR5X+TQnHTYmvxvdqsnzsouRqFiTlNBWcN8KRO2yF0Kjnijo7tnQPqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 04:15:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 04:15:28 +0000
Date: Wed, 18 Feb 2026 20:15:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
Message-ID: <aZaOXQy9xM6VhMk5@lstrano-desk.jf.intel.com>
References: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
 <20260218154728.1508151-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218154728.1508151-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d3b9cb-4228-4dcd-2950-08de6f6d83a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?L1gtv5oeJStk2Qd+YQ7hnxQYNYiy3dkiR9QJhaw80xlLUzmrg5v3PORZFg?=
 =?iso-8859-1?Q?nJYZakPlUIq5ah3jmLTon13xsF6q7hB/X5ZwdHXJMAdXDxh3eW77IxwKd8?=
 =?iso-8859-1?Q?Qoo/MRgXptChmMhxsJpjL0l7uVL2dUwDvCF4sEqJqoa4xoTk464KFGeZbj?=
 =?iso-8859-1?Q?ZIbfjT0mPrBVHqb/fPqFktSOJG0kwrjDsdP9PKL8oPvv8ny3xMSzNkuDjD?=
 =?iso-8859-1?Q?xkwqaxS1VaMaXilpeTKhB5WOAg82tf0LwTddPAGtvvcnXJBo0tTgwi9nvf?=
 =?iso-8859-1?Q?HlpN4L12JfY8IVx39OLgS9S+/3XGO1D4laUPgCafSnVLd8L+Dd06emh1zh?=
 =?iso-8859-1?Q?hTofpJqCnaJfSi+peI7JH9BzrinjmO05wppAF/fJDwjgyYAMSDeG+8tUfb?=
 =?iso-8859-1?Q?5/frwvepDXtCYw/P2Od7Wsh4wdzbAtSa5awjhDat4ZCT+XMhZTxH+WJEh7?=
 =?iso-8859-1?Q?j02z70JX7/+HAVJZZmhnlXAwtX2UilwtCqLHRtsLCBkrGUsbREGCOhQMdq?=
 =?iso-8859-1?Q?ySL8b8o0VpDH8uX9CkJbjnxhxH4ljY4us4VSV0YgjceXyzehDlbuefOhQ1?=
 =?iso-8859-1?Q?r2cUfG/ZKi55/U3ez8lsQzKpvsV9/2/w100f6M3v1DyQqHsw5kNAQmcwHx?=
 =?iso-8859-1?Q?cE0vfZ9eNYjMRKOCWlbTEa0ON+o3xXafJpd+5rDYRvkkis/a1Ulnx7CWZx?=
 =?iso-8859-1?Q?4Ph//UWf87u9u8f9xRsGwXnlnZfa5ffrhgS8rYYVuxIQFxiTkb9Xgz/vIx?=
 =?iso-8859-1?Q?FbfupVOeIbS4tm3OVp1I/iActn42DoF2p16X3wISYLmSMyNIIDzAYSbkWA?=
 =?iso-8859-1?Q?MFdrkix+js5x3GdAEWhfSepgD90fBInPGVArCGivWKVik5PpGOkl0qiA5A?=
 =?iso-8859-1?Q?i2j/AP56uNUKNNb0JBEzIQs8fdo0EhWGl4MmuMiWf0GHhViADEu8mAmOfb?=
 =?iso-8859-1?Q?/X4KSnMFuATXmtqenqCOpLiJ+XIbgBbpz8E1ud+NqcfN6UIVah1+IvKRfd?=
 =?iso-8859-1?Q?kHfby3TBpi0vDiWkOVMP/K1xen7a3C1oedph0pFTcxI7VudS6pfl+P093s?=
 =?iso-8859-1?Q?ZQzfX7Ff/yyN5kSsIQpRGQrlyj8ei5MS+QnOv2AmCthrHKKyhnOkRv49hI?=
 =?iso-8859-1?Q?txOrhCWZsS8NbhGcwfTJx9rXuiEI6be+Mg83zhwQEbg9cMU3oqoNz/P10I?=
 =?iso-8859-1?Q?lTe2XelBhetwlpIeAZUHYsr16hRipIDwourpR8cvFcIGEmtN98EDwd+s86?=
 =?iso-8859-1?Q?8InG+IFMxuTAxqbD6aJfKjIzwpaQvnUzHPxlAxMBkf6aHqOP3IQrN8+3DJ?=
 =?iso-8859-1?Q?WhJ2TpoGKCKv2nMZoJstpTfUQV2/NQ4BDaaFqHjBtTjLuTngO8DGA6FBHQ?=
 =?iso-8859-1?Q?OONdUrt3CJ0cJK1HXgndSp/QpnYomDm20MMMeU+Pc6e87KNBxq6we5wPZP?=
 =?iso-8859-1?Q?cvsJytYT9z/Ej7RwlGu4bpbOLWkmbayI3QkhorLm90BctsFhvN1L1w9RZk?=
 =?iso-8859-1?Q?7+/Oej2NrhpVtgMpFGAWnTtiDeI1CSRYKc697C37rMaWkbpUI6+71BE1ey?=
 =?iso-8859-1?Q?6e2yP7WFDaOoegcUJ1CgfILgNKLLOeB6tv1asFOxIj7Y/R2axxGsnAJ5XP?=
 =?iso-8859-1?Q?D3S1YIwrx90b4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KbdU9mWr07RBCH2vSi4ygaS8VTrGOGNJu1RZ8P+hw6Cv4PZ9EAlLmi+q4r?=
 =?iso-8859-1?Q?mU9NSw65Vi2KykMvGxtkihVsbdlDidFO/E5jm8q2qWtkkTfDOadH1Sc2pS?=
 =?iso-8859-1?Q?I+jFtQ/JZ5K5ELAJyowKE5Xg8JD1tAcevwbrkf8IELw4X1+Yc1BK82JE9u?=
 =?iso-8859-1?Q?oIfK4Eu9Rl2ihl5UqU4WlBM6voZaP4vhYouO2hohZcCX+ja/pG0bKtg2XS?=
 =?iso-8859-1?Q?5CAmLLnCvd+P8CKSbi9OdRSL9qzGswQlhg+cBxZOOaXOYs203CmEihwkeN?=
 =?iso-8859-1?Q?aN9mO9rfW1guyL8vgQllodW+jtj7eBKBVGbKke9Z3hUBTCgahuT4THA4aP?=
 =?iso-8859-1?Q?KTaOeJyhyORTH+fo13oHr/ul5zs7J5fD7yq7VUd6XWcs+ew4/4vBp3Dwva?=
 =?iso-8859-1?Q?/1TivaSZU1lldf7nwStS/Z8CsrEc5TULFiyWmPd2rzhA8OY9nqtZ3+KOSV?=
 =?iso-8859-1?Q?HngyoIkwcvtTYbjGFSf2L3ZmKb3Rcu2K/QAMbcAivz0S4Tj+HGOfRbvjIC?=
 =?iso-8859-1?Q?mHrK61oUSf6ikLxus5KFZePzcxib92bBkmVD+aA1Qtz/f+PVZjbU/BPqEq?=
 =?iso-8859-1?Q?MyJKRD+oTgtBWlG2+jayesCMKUYX/SXMCUUybc8iHOEswbjS+mUEqgeOOy?=
 =?iso-8859-1?Q?9W3XMMO5ABy8n5NXDTE15SwYbdo34Us75o9K7Ht7MECzkVgj1s3r79QqSX?=
 =?iso-8859-1?Q?WN29YF15vk6pKwc/8eEn5HKuzpMPLGIcRQlzcKetqeMdYLiLfKKxNMpwuR?=
 =?iso-8859-1?Q?bS7GbdUPkjJhykrqHvdhShsY1Tk+3ZHgxe1S36ncbv9WHH4otqnUDBk2uA?=
 =?iso-8859-1?Q?Hq9eetkxJgS8hV4zf9mu70ytsqXWdl5U0th87fwv8snZV1LVFZHR/afqDW?=
 =?iso-8859-1?Q?l2JBtfD+KimSBNqL4B/umfiv0Bo6cxE0MkWxDy5W4eZkx8awSC+EwkmWKY?=
 =?iso-8859-1?Q?8zfNpBEhBEIWM4k8W2RkAbtdFaiHQQ3K2abQHU2RDwu735Bvk58fqoXJPf?=
 =?iso-8859-1?Q?sIMVV1KE1hU35jjRGjP61s92PVpZTqLt/lZcGWa29rcdMGiXq2bHiH5TPZ?=
 =?iso-8859-1?Q?eufUWw0na3ERG49ulvvuSVcNGzRJ7wzL+DCjjcbC3H66gKn/mvpCWRZc9M?=
 =?iso-8859-1?Q?G2jUSXty+NiI4r1E1epB8vLTcFPdANm7ZIiVeGekcUOFH6/dqJmbPJl0dm?=
 =?iso-8859-1?Q?XWoWdM+ol96GXFLIu4/fT4pbxsonAUI5VKKg2cHRyyJaV3FtJJhzxnpP2x?=
 =?iso-8859-1?Q?merjKiEOU8rv6yBMu80KfaPr2EsN4R1G9IUU2tXFKj6n5FkLJkzQbsyFPq?=
 =?iso-8859-1?Q?5CXX/bQFIkgkqWIrS9A3PE79gYwtiNLU4E21xvdj6PjLmSdDMfbLmOfdvj?=
 =?iso-8859-1?Q?Gd2Ndp6yAqr+JfPyZyEw6+mUDxagXXmks0vITAsVsmVogFmbT9hHqtt8tY?=
 =?iso-8859-1?Q?WNaIAEQWIWkUqNG0AsJa6Wcb2dUC8bTh/ePAb6XcOoNj4ZACz5hxw4hxL0?=
 =?iso-8859-1?Q?6WAkocP5DmevoWkOx+8XjKoQliAlTi+qd8gFodwHtKyp9peOvvWeaB1a+h?=
 =?iso-8859-1?Q?90Vox2Cme3O3kRsEMLL9ydSzS0YgMTisg+ugvGg4/zY03Y+eoUxzJaNv3g?=
 =?iso-8859-1?Q?GNrIv6Yo1uUL8Z+CJgOBh85dv5+WQ/muzpauDM4Sn97G/FWPGHcyPLVndQ?=
 =?iso-8859-1?Q?GxAYsg9r+xr0s8vXEr5W8gC7NIL5R23cQwbpTsvuJpEzuinw39g4PjrgY0?=
 =?iso-8859-1?Q?2M8b2bvFo3CIpUWbOVFINvcincet/0ZszwZGLa95kRURZUlzL2i0b7YcvS?=
 =?iso-8859-1?Q?40mhBNeiL/NAFS6tYyfKrBUJeIEYz5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d3b9cb-4228-4dcd-2950-08de6f6d83a2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 04:15:28.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbDH7ELxpOi8l+Oi74OlNcOi3jKzr38ak+rqjDBQAVGPO8BUBIvVdAmHz3lu87eE40WA++s0ImKOfdkR2R1m0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,intel.com:email,intel.com:dkim,amd.com:email,lankhorst.se:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7339F15BFE0
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:47:30PM +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. If SA allocation is done by holding sub-allocator mutex, this design
> can lead to reclaim safety issues.
> 
> By splitting the kmalloc() step outside of the critical section, we allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
> the initialization step that holds reclaim-tainted locks (sub-allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
> 
> This separation prevents potential deadlocks where memory reclaim could
> attempt to acquire locks that are already held during the sub-allocator
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> ---
> V5 -> V6:
> - Renamed drm_suballoc_init() to drm_suballoc_insert() (Maarten).
> 
> V4 -> V5:
> - None.
> 
> V3 -> V4:
> - None.
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 114 ++++++++++++++++++++++++++-------
>  include/drm/drm_suballoc.h     |   8 +++
>  2 files changed, 100 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..54f3918616a5 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
>  	list_del_init(&sa->olist);
>  	list_del_init(&sa->flist);
>  	dma_fence_put(sa->fence);
> -	kfree(sa);
> +	drm_suballoc_release(sa);
>  }
>  
>  static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
> @@ -293,45 +293,76 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_release should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sa->manager = NULL;
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_release() - Release memory for suballocation.
> + * @sa: The struct drm_suballoc.
> + */
> +void drm_suballoc_release(struct drm_suballoc *sa)
> +{
> +	kfree(sa);
> +}
> +EXPORT_SYMBOL(drm_suballoc_release);
> +
> +/**
> + * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size,
> +			bool intr, size_t align)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +379,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -385,8 +416,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_insert);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_insert(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_release(sa);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> @@ -402,7 +472,7 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
>  {
>  	struct drm_suballoc_manager *sa_manager;
>  
> -	if (!suballoc)
> +	if (!suballoc || !suballoc->manager)

I don't think this is what Maarten was suggesting.

I believe his suggestion was...

if (!suballoc)
	return;

if (!suballoc->manager) {
	kfree(suballoc);
	return;
}

Then drop drm_suballoc_release().

Matt

>  		return;
>  
>  	sa_manager = suballoc->manager;
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..b8ec64039c8a 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +void drm_suballoc_release(struct drm_suballoc *sa);
> +
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size, bool intr,
> +			size_t align);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);
> -- 
> 2.43.0
> 
