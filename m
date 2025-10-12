Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E2BD0A27
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044EF10E191;
	Sun, 12 Oct 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwukOK46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE010E0A5;
 Sun, 12 Oct 2025 18:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760295250; x=1791831250;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M9vA/EPSnTgtLsCNePQdQRzutb82oWes8zDh7m8Ojr8=;
 b=HwukOK46sJQOvCzXKhATR6msukxlTv/TC9+pWJM4HYqPxHIE+beFYJ3c
 TKIOX+fU1oDyasIn33CVgA27A1Pl3wejXSh2qWMhiNOk7veqWg5qiZULD
 JXltP453WghI1p+ytMZUzyxvcLJWzeR6Cg1hkKuOvNsnvaPMC3b5kbLH7
 u9JGdt8SzOksuloKZ1RyswEqMAD6F2VWqXplisF0Oe5NNe0dnPMs07i0k
 cuN5O0GzJghfP5+bjChE83R/MEH8+5Fwzc8L6O7p3EpsIC8ZVp1cWEaeS
 jKbKE+CrLqV51ba6fk7wutqRZ4cSEFshvdINyvQ1Z5d5yHOD8QoKy/P5n Q==;
X-CSE-ConnectionGUID: M/8bSAKaQ7av0SaDOqvHIA==
X-CSE-MsgGUID: KIO4iiKiRomfhAZOUhE/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62596017"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62596017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:54:10 -0700
X-CSE-ConnectionGUID: fL0irA1mQ0WFLfxvju29dw==
X-CSE-MsgGUID: 6fvLe4gKRNyOaOkcjkJItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="212057819"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:54:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:54:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 11:54:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl4yoNv3CBAiLUHMSbrfW5CtM4KOnuzIOy3Z46aC7Io7LoqS7TY4Kka+aoHlrI6X09zMQRj+8wlo/Mvdd6Dz+H4c0iioN35O7SNNwrHL9zD3wT8TEVsO5ZvzISX5NBNa0wdNDOVFOwlrzLL7HXzsvQnS0vIFOeWjbcVHQGF2vbZTXNHUtuzjzpeaZf50ZXR+Reljc9Dkxs9tOVNgCSIqlf+R62kx/assl8Zj6AkC9yVTguPSHeppZuwaeegcowsWq9weQCEPZAZvDUqSnSetHPsAJv/Z3g+BWSB2j4uCvT0UHRnX2ZfGXFnLBuxoNtIgv2FqFWOXooFVOoXtU8Cfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPIBEgm8Qfx/k2VQkgxmYCPQ+Ms4GnuWzIaFo3B3VjU=;
 b=Ot9wRsOtIBsIWBPjmG0nlDEmDD+KJJl+A3yaVqv24SbSfHwLcLn057xkarKUUfEpD0kBf7XewTLe1wyCn7e8z+o4SmFQJxULXCAmYcpZLQnZcXFru+OcfKdrkhzMBJrzq1ILefWQL/artUVrBWpSRjBtsWIyW6YDZA2/87AOIUrB/tjO1wTS5kKpWsYK2IfzU3MohV/j1LOHPRRpR79iLkrVio0NiG4WbVRi67+AR2Xw81qdiVI4/QJbqZl36bhxyz9LJHRE/WTrvJtyqgT1i1eIjQc1+Qar3xVzr9QeBb+az+5ZgMUFXDo2ZOiWt1Gdeeu/vEKy8bgyYtpBM1jn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 18:54:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 18:54:06 +0000
Date: Sun, 12 Oct 2025 11:54:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 22/26] drm/xe/migrate: Add function for raw copy of VRAM
 and CCS
Message-ID: <aOv5SpwAv84HYLkb@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-23-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-23-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 785bb07f-14dc-46b4-b8eb-08de09c0b816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2x2Qk12ellCUjNwYU1SdWJYSWFYWmpydVpkU1VXWjdzQ3FKUDEwVVNXb0U0?=
 =?utf-8?B?S2VSYWV6ODVGQ1NGWnQ5SHUyVzVyYkdFVXZTQjJNZS93cURnWEtsOEQ0N2pG?=
 =?utf-8?B?YmtsS255S25pSjJNTnZoTlNqaHIxZkV6QXFBYUpJYkE0ZnV6TXllVGtaQmNJ?=
 =?utf-8?B?SUQ5eHp6bm5JQUM0SnF5a2pYeEdlZnZTWkEzaGJueEE1cEM0THIraStFYXl2?=
 =?utf-8?B?dWMwMEVqSFhpWFBqZmwzcTdZR3lTb0RNNE0yaEpnT1k3VVFCRUFBb1dQRVZw?=
 =?utf-8?B?bDgxQzhPMjVKcmJLdVhJWkVsMlA2alVKR1ZMcWJnUUYvY2x6RGdXQWpYMFVy?=
 =?utf-8?B?MDZrV2dGZ2ZRbmVTRnFVaEJSTEtnU21uVVRRTzRJWHRPNTBHajRTZURVWHpN?=
 =?utf-8?B?T1EwZ21helZsWG5GOUsxM3VzeTZJdm5zemdLczQ4OGp1SGVHd0UxNmpDYkt5?=
 =?utf-8?B?ZDJUVk9EcldNSlRFZE1qb0ZYVTVNRllNTVZtcHBkUGRmL3RnRjZMVXIweUI1?=
 =?utf-8?B?alNvZzFKMnVlaWE5cU5FS0tyWEllT0dLSGJ3SU1oOTA5NjBmRkN5dDlocXlp?=
 =?utf-8?B?eE91cDJpcGROanZJamp6Z2F3RllCVXBLTGlCM0ZRc0JrTklYVjRTQ2tyZWxI?=
 =?utf-8?B?MDczcWRBLzFnYVhkSWt2MVVONTRNWXE4UnhDZW03eUU1T1dXMGVjL2g4N2ZO?=
 =?utf-8?B?S2liWFRweWE3eFFuTmRaTjYyY21uR2FWU1R1MVJYSWQ4VUZjN1hacHlEWjFJ?=
 =?utf-8?B?RzVISGhtUGYyMnNYd1lENnNXcnRrWGU2VUFCUzk2QmlucnlncVNXM1RhUWdH?=
 =?utf-8?B?QTdJTzgyV3N4T2J4dEx1WFVPNzNjZERqL1ZocUs3bG9CY1pJb0Myb3BoWWdZ?=
 =?utf-8?B?ai81NDgrSUNKMDE5bE5hb3RaZkVVODJSQTVVVE84MUl2cTh3MUl0YVZPeWFS?=
 =?utf-8?B?ckhmVG5uMlFIb2Z1azhJaHdJdGhmQkUxOWErNHFTckh4NXVqS0tCSW1pb3d1?=
 =?utf-8?B?eWd1WnVrU0xTZjdQZmJuYUx1OXduUGg2Q2YweXk3cHk0ZGJCbVNzeDltcTdG?=
 =?utf-8?B?SnVmMzRBUUUxT2lXRDkwS3RXSURnZytNYng5MUd3MHpxSkphcHNJenNFRUln?=
 =?utf-8?B?eHBFYkszRjh2VmdPY05Cd3BiMCsybmgvbHRVblIxT2xxc3dRRzlmNW1xMFp5?=
 =?utf-8?B?VEpBUUFkWXR4UjJoUEtoTTdFbzB4UTZ6WmFlRklkN2h2TjJEUityREJaRkVP?=
 =?utf-8?B?Umh6QkpWaXREZWlhQ3pPYytQbkM4SXhFQkNXWHF5V0Fwck9vTkZURE1MNElh?=
 =?utf-8?B?aE01REZpd0tSbmNtRjlGV0hreVUxOG90QzYvNmdDUEU3U1graFc5Tmt1SDlz?=
 =?utf-8?B?UlBGTVplL2JQMTd4THNoZ0NLckYyalRDck96MEh4eWxNbGR1WnpSdGFpaGJy?=
 =?utf-8?B?OEJpTjFnZVI5T0V0UzdDc3AwaHdzNURIOEszNURqdG4wNVM1TERCYUhJdlZL?=
 =?utf-8?B?ZUNmN3pDekkvSU5OZUVKdmFGRHY3dUFyaFdzK3pDZGxxYnJvZHVQWDVNdjFV?=
 =?utf-8?B?Yi9qR3ZlNUZQNXBwdFBOazNJeVZDdnpXeG5Yd3JaYWxQcllyS1AzK2loVFFT?=
 =?utf-8?B?QmVwaGU3ZjM4VDJ4MHJEd09SSHRWb3BZV1Z2QllvTFJ4b1RsMEJrZ0hBb01l?=
 =?utf-8?B?bGNFN00vN0pTMU1Wa01sVjN3NWtUb09GcnYzV0E3YmY5Y1Q0ZXlDODVrU3lG?=
 =?utf-8?B?SE14cjcyZGVkZGtVTGtQaUwyaWpIR3dDNlRNMSs5VlZ5WGR6cUdlKzhLWHo1?=
 =?utf-8?B?L3dLbEFVN0FTVFF6UzBnT0d5QVNrc3lwTXRKbjVMWGpSMlZ6NzhXQzBjZFJu?=
 =?utf-8?B?cGhNWmxucWpwTUFVeExrb1FxOVJNWWYvaTNrMEhoT3dRMlRmZCtCSko5TWZp?=
 =?utf-8?Q?hvU3GGJa+i+QOHZLfHkDI+xXBZgiSaKk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0UxbVFmNnhYQ0t1YzQ1V1BtL0ZWL2FLN0dSOS9LRWRmWFdibXNHR3AyNjhR?=
 =?utf-8?B?NThtQUlUa0tKSVBDeEhBWWZwTGNVcHVLWGFNMnRlSzR1cWlZNThhV0VRWGtG?=
 =?utf-8?B?N2ZOdmxPbi9ZUWZUakZsUEZ0djBCQlBLdWFNQTAzYlZMWnEwQXJKOFROZUNn?=
 =?utf-8?B?VHNIZEtzajFwOGJkVDIrNzd4TW9oMWtNbnFiSTZCWFI3WFN3M3lyT3lTUlFN?=
 =?utf-8?B?VGhhL0VMa1NTREhJMkQ4ZEJNTU80ZWZ5QzhncHNwd1BYQ3N4MHd3R3l3NDZO?=
 =?utf-8?B?NWJrUDFCeUFRR2ZHamdOcWd0bjZ5TWFjRkdnb3dSL2ZUNWdtMy9UQ2poSmFJ?=
 =?utf-8?B?dEQ5V2c2WVlZcFVSVDd2TlZMT3l2T1RrTXlZbkhscUd3VnhPYXlSaGc3cXQx?=
 =?utf-8?B?UGd3U25aVVJXM2tKL0tiKzNPUW5PRU0yZ2Z1MDlKWmhMV2hWM2ZCaHJqOVJi?=
 =?utf-8?B?Q2RnTjJIQUFMeEMrdEJBWjJPcHFOdXU1VWpYdGV4WXlHa0NLV2NoampmaktU?=
 =?utf-8?B?cSt2Q1l0MW9XUmEyVWZmbStHSDZHRFJ4R0d5ZDdLaDV0S1UrZzBWbm8xRE1R?=
 =?utf-8?B?ZStXRDkyb1d2RGl6SllCdTdFaUZxR3dJUXJkUENjbG5BK2lKSWNiaVVKSjRP?=
 =?utf-8?B?RFoxcnZsdWllVXczNkNPRTIvZ3k5YXBhalpPaUo3QStvQkkzME5JL0hsWTVl?=
 =?utf-8?B?Q2R4WUZubk1YMHI4RnE4aFRncGlqVEF6Uk1wUk5GSnh5TnIyQ3ZjNWVha0hS?=
 =?utf-8?B?OVNwZFR5ZzFUV0hOTGNIaStObEZiRGF3Q3krUnMrUHBEeUYwV3VESDAzZ2Yx?=
 =?utf-8?B?R0dqSnJlRUxsQUg3Q3pWV3ZJRGV1c0RzTzFibThPcWFmZG5kUzdrWHpWQmpv?=
 =?utf-8?B?dm1Kc2tFdXlLSysrRFdsaXJzRzJJN2JYUkhZUzFRUTVCby9ZeUZaSGxxTllw?=
 =?utf-8?B?MHRSOXB1UlhpODBCYWk2K3QyRjY0aWp5UUNGY3pKWUpRRGNPUkhPbUxqa3VX?=
 =?utf-8?B?UEVCem5zRkRXNnk3d1I5NjVkRmhBRlhOTG51bnB4eWNsdlBxY0NSRXMxZ0VH?=
 =?utf-8?B?dUp6V2hkYjl6SWd1UjR1VldYN2ZFWUxvZmVrRWQrbW9WOXVteDVLK2V2cWMz?=
 =?utf-8?B?RDJaVC9SNEI2QndUMXE5eVFtdFVibjJkQVYwZDZnVHAvSmxWQ1pRbzBobmhW?=
 =?utf-8?B?bFljb2xXaTVUNmJSZ2puS2NhQnhDWHMyazlvNlkyWThmc3dSNmlxSFJzUzcz?=
 =?utf-8?B?enFQNE5vSWg4czVCR2Zmd3pZQURpRUlNQ0JvdW14MDc4WG5UTUhZUnVHVENQ?=
 =?utf-8?B?QllNVFZtMUNVMFF1V0RqRE16Rkd6QkkxNkgvbUViY1lzK01uemNhc2lkVUZC?=
 =?utf-8?B?Sk4vZjFFQk1DdkVTellPSEg3NDc0U1hST2JSUlVtRkI3WUppZEpQSURIdnlO?=
 =?utf-8?B?c3lEZkRFM0lOZVpLL2FzRDJyTzhscjFmZjgwRDUzTjV4cHdBZFRyaUx2b3pY?=
 =?utf-8?B?TDZFek56QkVhQjJKSURibUFBUHdKR1ZzbU9WQVNsRnNoUkoySFI5U2N3VGQv?=
 =?utf-8?B?N2hxa0dFZzdNb3E5VGUrZDNGcW9HMU5mUHhEa0hlWnBQNFVjUlVWdW4vTTd6?=
 =?utf-8?B?QzYrM0dkaC9WVVNYUTVMRTd2ZmdSb2g1NnRyeEpMYkVabENWOGhGTHRvbThr?=
 =?utf-8?B?NlI0WXJ1M3N6WENkZzhYa211blIyY244cE5CcCtsYXRUeWpHQStqRmN1Yldh?=
 =?utf-8?B?WnNQcldDTXlaQWZydVFLbGkxNlZCODlKcUhkOFlmM2NMR3h5bFV0cFF5VFdw?=
 =?utf-8?B?SWthYTRhOGFGbmhkMklaS2hFZjB2NHRuVnIxZVNtL0NtWTNLTUxtNDNDNzUy?=
 =?utf-8?B?WXNWR1hjZlZnVEZRWXJuQWZXWmpySjhlb2hOU1FNNzR0NHNDRkFGcEZFZElD?=
 =?utf-8?B?TnBnUjN3U2JiWE9QaytScmJiMDlEUy9QVjl6RUR2WWtUcWJ1bTg1ZGxMamFq?=
 =?utf-8?B?bnZzNm1kWTN0TUFjNUJLNy9Bb2dyczdFVVNLZTRqeExsTmFLaThadENHeHFM?=
 =?utf-8?B?eHJWMVQ2bmc1MHh6MisxNFdWd1hFV0JITThmRE5uVXpxMUgyRGIzMzROSDl1?=
 =?utf-8?B?YUdTSFU3NEo3ankraDFVUnltN0l1VVdQaGw2SlBTUUwrV3dGOE9scHZtWURj?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 785bb07f-14dc-46b4-b8eb-08de09c0b816
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 18:54:06.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmRNckIr/y6HqdgJB/yCBokALtlPt9p98Seup5K/EYt9yI2GTHq8T0i09cEhoiIBh+gg+SgksxQctrhfdLFP5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

On Sat, Oct 11, 2025 at 09:38:43PM +0200, Michał Winiarski wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Introduce a new function to copy data between VRAM and sysmem objects.
> It's specifically designed for raw data copies, whereas the existing
> xe_migrate_copy() is tailored for eviction and restore operations,
> which involves additional logic. For instance, xe_migrate_copy() skips
> CCS metadata copies on Xe2 dGPUs, as it's unnecessary in eviction
> scenario. However, in cases like VF migration, CCS metadata has to be
> saved and restored in its raw form.
> 
> Additionally, xe_migrate_raw_vram_copy() allows copying not only entire
> objects, but also chunks of data, as well as copying corresponding CCS
> metadata to or from a dedicated buffer object, which are essential in
> case of VF migration.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 214 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_migrate.h |   4 +
>  2 files changed, 217 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7345a5b65169a..3f8804a2f4ee2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -501,7 +501,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>  {
> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> +	if ((!IS_DGFX(xe) || IS_SRIOV_PF(xe)) && xe_device_has_flat_ccs(xe))
>  		return MAX_CCS_LIMITED_TRANSFER;
>  
>  	return MAX_PREEMPTDISABLE_TRANSFER;
> @@ -1142,6 +1142,218 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
>  	return migrate->q;
>  }
>  
> +/**
> + * xe_migrate_raw_vram_copy() - Raw copy of VRAM object and corresponding CCS.
> + * @vram_bo: The VRAM buffer object.
> + * @vram_offset: The VRAM offset.
> + * @sysmem_bo: The sysmem buffer object. If copying only CCS metadata set this
> + * to NULL.
> + * @sysmem_offset: The sysmem offset.
> + * @ccs_bo: The CCS buffer object located in sysmem. If copying of CCS metadata
> + * is not needed set this to NULL.
> + * @ccs_offset: The CCS offset.
> + * @size: The size of VRAM chunk to copy.
> + * @to_sysmem: True to copy from VRAM to sysmem, false for opposite direction.
> + *
> + * Copies the content of buffer object from or to VRAM. If supported and
> + * needed, it also copies corresponding CCS metadata.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
> +					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					   struct xe_bo *ccs_bo, u64 ccs_offset,

I’d drop the CCS implementation from this function. As far as I know, it
isn’t functional—hence the reason we’re using comp_pat to decompress
VRAM during the system memory copy.

> +					   u64 size, bool to_sysmem)

I'd lean towards enum for direction. We already have one in defined in
xe_migrate_copy_dir.

Maybe time to move that to a header file.

> +{
> +	struct xe_device *xe = xe_bo_device(vram_bo);
> +	struct xe_tile *tile = vram_bo->tile;
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct dma_fence *fence = NULL;
> +	struct ttm_resource *vram = vram_bo->ttm.resource, *sysmem, *ccs;
> +	struct xe_res_cursor vram_it, sysmem_it, ccs_it;
> +	u64 vram_L0_ofs, sysmem_L0_ofs;
> +	u32 vram_L0_pt, sysmem_L0_pt;
> +	u64 vram_L0, sysmem_L0;
> +	bool copy_content = sysmem_bo ? true : false;

bool copy_content = sysmem_bo; 

Or just drop this bool as if CCS is removed this will always just be
true.

> +	bool copy_ccs = ccs_bo ? true : false;
> +	bool use_comp_pat = copy_content && to_sysmem &&
> +		xe_device_has_flat_ccs(xe) && GRAPHICS_VER(xe) >= 20;
> +	int pass = 0;
> +	int err;
> +
> +	if (!copy_content && !copy_ccs)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!IS_ALIGNED(vram_offset | sysmem_offset | ccs_offset | size, PAGE_SIZE))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!xe_bo_is_vram(vram_bo))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size))
> +		return ERR_PTR(-EOVERFLOW);
> +
> +	if (copy_content) {
> +		if (xe_bo_is_vram(sysmem_bo))
> +			return ERR_PTR(-EINVAL);
> +		if (range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size))
> +			return ERR_PTR(-EOVERFLOW);
> +	}
> +
> +	if (copy_ccs) {
> +		if (xe_bo_is_vram(ccs_bo))
> +			return ERR_PTR(-EINVAL);
> +		if (!xe_device_has_flat_ccs(xe))
> +			return ERR_PTR(-EOPNOTSUPP);
> +		if (ccs_bo->ttm.base.size < xe_device_ccs_bytes(xe, size))
> +			return ERR_PTR(-EINVAL);
> +		if (range_overflows(ccs_offset, (u64)xe_device_ccs_bytes(xe, size),
> +				    (u64)ccs_bo->ttm.base.size))
> +			return ERR_PTR(-EOVERFLOW);
> +	}

This function performs extensive argument sanitization. It's called
purely internally, correct? That is, the Xe module fully controls the
arguments—nothing is exposed to user space, debugfs, or any other
module. If this is purely internal, I’d recommend sanitizing the
arguments via assertions to catch bugs, since internal callers should
know what they’re doing and invoke this correctly.

> +
> +	xe_res_first(vram, vram_offset, size, &vram_it);
> +
> +	if (copy_content) {
> +		sysmem = sysmem_bo->ttm.resource;
> +		xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
> +	}
> +
> +	if (copy_ccs) {

else if

^^^ If for whatever reason the CCS isn't dropped. This would make it
clear copy_content / copy_ccs are mutually exclusive.

> +		ccs = ccs_bo->ttm.resource;
> +		xe_res_first_sg(xe_bo_sg(ccs_bo), ccs_offset, xe_device_ccs_bytes(xe, size),
> +				&ccs_it);
> +	}
> +
> +	while (size) {
> +		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		struct xe_sched_job *job;
> +		struct xe_bb *bb;
> +		u32 flush_flags = 0;
> +		u32 update_idx;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +

Extra newline.

> +		bool usm = xe->info.has_usm;
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		vram_L0 = xe_migrate_res_sizes(m, &vram_it);
> +
> +		if (copy_content) {
> +			sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
> +			vram_L0 = min(vram_L0, sysmem_L0);
> +		}
> +
> +		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
> +
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
> +					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
> +		if (copy_content) {
> +			batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0,
> +						      &sysmem_L0_ofs, &sysmem_L0_pt, 0, avail_pts,
> +						      avail_pts);
> +		}
> +
> +		if (copy_ccs) {
> +			ccs_size = xe_device_ccs_bytes(xe, vram_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +						      &ccs_pt, 0, copy_content ? 2 * avail_pts :
> +						      avail_pts, avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		}
> +
> +		batch_size += copy_content ? EMIT_COPY_DW : 0;
> +		batch_size += copy_ccs ? EMIT_COPY_CCS_DW : 0;
> +
> +		bb = xe_bb_new(gt, batch_size, usm);
> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			goto err_sync;
> +		}
> +
> +		if (xe_migrate_allow_identity(vram_L0, &vram_it))
> +			xe_res_next(&vram_it, vram_L0);
> +		else
> +			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
> +
> +		if (copy_content)
> +			emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
> +
> +		if (copy_ccs)
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, ccs);
> +
> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +		update_idx = bb->len;
> +
> +		if (copy_content)
> +			emit_copy(gt, bb, to_sysmem ? vram_L0_ofs : sysmem_L0_ofs, to_sysmem ?
> +				  sysmem_L0_ofs : vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
> +
> +		if (copy_ccs) {
> +			emit_copy_ccs(gt, bb, to_sysmem ? ccs_ofs : vram_L0_ofs, !to_sysmem,
> +				      to_sysmem ? vram_L0_ofs : ccs_ofs, to_sysmem, vram_L0);
> +			flush_flags = to_sysmem ? 0 : MI_FLUSH_DW_CCS;
> +		}
> +
> +		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
> +						 update_idx);
> +		if (IS_ERR(job)) {
> +			err = PTR_ERR(job);
> +			goto err;
> +		}
> +
> +		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
> +		if (!fence) {
> +			err = xe_sched_job_add_deps(job, vram_bo->ttm.base.resv,
> +						    DMA_RESV_USAGE_BOOKKEEP);
> +			if (!err && copy_content)
> +				err = xe_sched_job_add_deps(job, sysmem_bo->ttm.base.resv,
> +							    DMA_RESV_USAGE_BOOKKEEP);
> +			if (!err && copy_ccs)
> +				err = xe_sched_job_add_deps(job, ccs_bo->ttm.base.resv,
> +							    DMA_RESV_USAGE_BOOKKEEP);
> +			if (err)
> +				goto err_job;

I’d think you do not need dma-resv dependencies here. Do we ever install
any dma-resv fences into vram_bo, sysmem_bo, or ccs_bo? I believe the answer
is no. If that’s the case, maybe just assert that the
DMA_RESV_USAGE_BOOKKEEP slots of each object being used are idle to
ensure this assumption is corrcet.

Matt

> +		}
> +
> +		mutex_lock(&m->job_mutex);
> +		xe_sched_job_arm(job);
> +		dma_fence_put(fence);
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +
> +		dma_fence_put(m->fence);
> +		m->fence = dma_fence_get(fence);
> +
> +		mutex_unlock(&m->job_mutex);
> +
> +		xe_bb_free(bb, fence);
> +		size -= vram_L0;
> +		continue;
> +
> +err_job:
> +		xe_sched_job_put(job);
> +err:
> +		xe_bb_free(bb, NULL);
> +
> +err_sync:
> +		/* Sync partial copy if any. FIXME: under job_mutex? */
> +		if (fence) {
> +			dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +		}
> +
> +		return ERR_PTR(err);
> +	}
> +
> +	return fence;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b62535..0d8944b1cee61 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -131,6 +131,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> +struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
> +					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					   struct xe_bo *ccs_bo, u64 ccs_offset,
> +					   u64 size, bool to_sysmem);
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> -- 
> 2.50.1
> 
