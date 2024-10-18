Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BC9A36DF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3A010E8AC;
	Fri, 18 Oct 2024 07:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgzE6i1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F5210E0A8;
 Fri, 18 Oct 2024 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729235830; x=1760771830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lrN94Yoc3HUVD+7ptxWJ20gaP3kL6KYVzKxfWQaAe7c=;
 b=EgzE6i1+9NAga2n4o5Sm2L5JxlIvefvmD7826OIgw3k6O74doRCmR/2k
 TaSPWH1OW6G9juJ8Y4EpLwCpFJakYTjnYLR7KLELPYIq1WVte0CGuO5L6
 J4oFKMI3CFLAvNaJWzkqQfWnv7jHaTVuql3lVsKMOKtaUplYSUu516qQr
 sHZfTatml7ogvLf2260vKL1g1yhd16e3v/2c1YMMlClUzY6eKnznVslmU
 kkHg0azNwsnM3KnT/F4CDA6zjEtkMZ/bufd9viBWu5olxhg7o+H8ZfSsL
 9BfGf5Hl/Lz4PYLMeowQ5YDyN1khVdIAOqvBqmjgcKMaLH8pYe3/l6zXS Q==;
X-CSE-ConnectionGUID: q9Q+WhcISLOLPSH7pobqxQ==
X-CSE-MsgGUID: S3G4Z+fsSz6AKqo9Wypa1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28193888"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="28193888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:17:09 -0700
X-CSE-ConnectionGUID: 5STxPWuSRAyRzkAR337L8g==
X-CSE-MsgGUID: FeSYUs7kSGaB3obVeClXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83421920"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 00:17:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:17:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 00:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAQJYAMfV+8sYvdMxFkdQ9FLDuPyIudatqh62IYHv0U0/Bqnf0Fp79176xhVUfzihT35yC3wq3sjxnyrtfGJlQayLdLB+62fzxm+ayGoCyTQ/YK31+tQNk6OmvyuS4FEUGE5HqYgCD+FumiXdrm8N0ucfEAsTR1YHq8UtPah+5srowRAzwkFVRVdqaj7+skXhHvZqsP8v0P5pxTVdPNsUYUHIsuB79N0Rb9jjTuopbXnFBVJLR7lY7SPp+9C+vn1qMu/1B7SQEb4gtvi0GqjXXFls14P8wwUUNYvZoGhQbM2rUKRnV3XheOUFw22Z+IeYDctXDylRrMD5L3hpZdsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlTLylc2cQoGLrLpbYmdGK68jUY7b646CjXuYNra3GM=;
 b=exZY0TksyxOfxUiNpC7kX7jCq5A0EYScqGYbap5rjfBvEOgS5AL+B62R0sQHezfk1mrJ0Z/C0t+hHvOANxzO4CpPMfAPOlycFVRSWx7rjk9moErBgtROisN0m7TZdWC3zYi0JlP4GhNk5m0KbfGbjwwkY40wKHhxQgMmbLANM9CX1zMwFdvCJxz3CixLN9rr3eR9hI5RSqy+U6F3931cOS+Zstn3UF3Be4iGbCcVrT5zD2zscazBECU7npcy/LfE+3m4vjlUyaU+gS4GWPNTF/AykN626NKmWTboe6iDf4VueGzKDiMgSWU/CYjjjps40XLGPmwNa3p/ycjDF5NLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 07:17:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 07:17:05 +0000
Date: Fri, 18 Oct 2024 07:16:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
References: <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
 <87zfn2lz6z.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zfn2lz6z.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BYAPR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:a03:54::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc404d9-10c7-4748-4fe4-08dcef44dea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oR9Fg2mGVwg2Q6rpvVQ73vofcwbreMV2ZEvLGNrzbduI8Aa5lQC6XGRoVYC3?=
 =?us-ascii?Q?k5Dujtd7am/frzr8Ch75Bm9QAJ6YpB+x8OLlfo8A+dcl6lzSLdS2u0pV7BRt?=
 =?us-ascii?Q?VqScEiDiVxNmaCfDMLt6bGaxvm6BCWhDb8xpfloPazNF4cky4sktSVp8CykI?=
 =?us-ascii?Q?PizOPBV20txejHbOBJ3m+uC0IkS+shJz1xkVCBJa2vsuvlHXEbzlR64sdsRf?=
 =?us-ascii?Q?ZU28mU+zmLnObqOfc/Ttkh/lpBRbeuRgKgSWV4of6hoxJLaDWStn8td60BJX?=
 =?us-ascii?Q?i9R6+UxCLxf1RyerQryAffMyc1Mg5MbA7Wcp+oEi8NCxBPH2Md/DtX2aJdtA?=
 =?us-ascii?Q?9+sOnH/aCUbfRC/6cT3xYJXWfI8xvlzUHth6NYz3YP4BHipgTc78PrtD4SXq?=
 =?us-ascii?Q?nrQRfJolYoztyWLASsQPUT6iitEqD49qGxYy2e/LLcAcJpHyqaIY3cViYFWW?=
 =?us-ascii?Q?uKqLRxnOE4Vp7R4HXCjTswIqazS1r5k1SGM+JsEobnZHY/cBsh21SItdzE97?=
 =?us-ascii?Q?6T7Z6WEd9dRfBdagqqt5V5AII+HiVbenFfDn++aQxtD/WkeuTYLcfy7ZZH19?=
 =?us-ascii?Q?WL7xYxwbcPUIZvFZyZb95BcDt3EP8H8YESMBpb8NTCtFrtluHsIqNSbOqHMH?=
 =?us-ascii?Q?Ls9okv+4QnNgBtfbOw6jYSMg1p2DwEqCJo2gUSeJZPMloC6uoNJl5Is1+hxy?=
 =?us-ascii?Q?rR3gAVAWjyeOxd1UdcpRPP53LjjBVVj2ujSBsyYOKCHT0S+xZllNBXn5lUc3?=
 =?us-ascii?Q?OrVBBdeOelgF8DELseX+Kklyh0XWcf6X4wb7KZzdkruTRn6CyzbIjrqh7Jcf?=
 =?us-ascii?Q?mXwmv5QgqQXxQF/xL+k061ArfvqOzsASWjOHSjXbZ0TovUnFyDQT1Zd1vgFg?=
 =?us-ascii?Q?uLqpYnEXPbZ2ejirLUFGasl/51QpanVQZ8ZDDzbcp5QC6SHSP+nwClpJK94K?=
 =?us-ascii?Q?9XOc17UjpZ3/sDtpKw9ZK45skXX3xCYsn3fJH1nuR2Af20cN3IdaA51eri8r?=
 =?us-ascii?Q?altDyEIoeTmba7kuzIyg1V6f70ef7zEnvK6yyyLWGj71zcTvfwIN1Wif3S1W?=
 =?us-ascii?Q?XB9w2/Y2mvOZtNhMw3+kqP05YzUHstlX7j98sYStRbuNvh7Ns2QqWGjafl9W?=
 =?us-ascii?Q?UewH4giJ6gDHtzCVbwfDc5cUhgoHbt8wfrKSOSK8/UFt5D4bx+epH5EI62v2?=
 =?us-ascii?Q?lDQenvhmWd1/OJpuGKRTNXpGj1Q1EKaswttkmUasDAkERdi1Cb+xXenFNTDz?=
 =?us-ascii?Q?DinyEgBrKZK2MMKY5q0DmclecYNhqAV+8eZia5rM1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8qw/3q87mwilgnJYiILEEmjaTxcKnUIabmEI+q1XTEl6uJYQ0bJiTiWc0al?=
 =?us-ascii?Q?1AzRpEJQePEUnpyaFJ3ZC4IsUwBGFnqNH13MJ9REx2ZhlPQFVpuCWlTIRs8j?=
 =?us-ascii?Q?akBxlnieFNCPwn0u3bXOaWgUq5VMZuCGNg2e8clDx9NIaDqIPkOzIT1RVSyj?=
 =?us-ascii?Q?wBuudd3Zb4kp2OJNsV0G1xVw7s5QynIFooU2eZAeE0/X6yF170h2QpJBAGyl?=
 =?us-ascii?Q?CQMaQaCC4CUo9dO/gQpy0Xc3zCtWk17s1mfexgUl5YrYxjLRqyqQtuGH57VM?=
 =?us-ascii?Q?ucwvwUEurb9CPjTnwqlVIcl7aHMa/OAy/nHDnRy/PzNV5bbZDa+eTyoyGPxe?=
 =?us-ascii?Q?5No6SLw+6Td9Xzm2UHR5ipAMw0UAkOCAyG6tRFTd8GYbQpPwiHKLDxs775ud?=
 =?us-ascii?Q?PPipESz9CFS1C54UPrgH0QkHy6r1D/94Vk4D63CM+dKU2MT6O95f8sqY+DqU?=
 =?us-ascii?Q?kYYkvx1ZCUjgtvy3+zvjvJbsjR2IjQUoDOM+NrlHvSmSb7jl/VS0ilSdMg3e?=
 =?us-ascii?Q?Mu72XMCB28GpZX0NDsR2TS7Cn+fDg1dca9sDJP+tRcsLtZoaYy8WL0p0Pw/N?=
 =?us-ascii?Q?bfH4SOrQ6wqlC4W+I/gLxAdXve1rfCmvM53xKvEmSBbRsZKWtYdzJYnaJR+l?=
 =?us-ascii?Q?eEkm0f/oLmg2Nfjn8WtD+9R65VTbZuGg47Ca4OOvuYT6SRm8ut4OcJP2h2Jx?=
 =?us-ascii?Q?VPDkB36wXbo6ZDze4ZrGpBJM0+T0484HoQ2RtqUYjJRi9c9G1USTFkPZauv/?=
 =?us-ascii?Q?ZwzPurm0iBOZ3NFA4hT5MBDX/O6gvbH5yoqv4RDsvw15u5NJdXI6uVOTHBHm?=
 =?us-ascii?Q?5GbFLI0ZN85qIyGqucRidZlDgvogh9pTTwDmg1szoMVinkTuMEfSNuOCMHun?=
 =?us-ascii?Q?ecMWKnMb5YQpfeh1AA12QuNDpNsiDuoKko1vegfzNE6OhI1xDwIpTYoY4zfw?=
 =?us-ascii?Q?vML590g+RflXwXDb8hdaR9D007medO8RL9zA9HFTiqAjjAT0W0Qc0G3GBIbf?=
 =?us-ascii?Q?XWAsQBORYVW1B0blfYSgLPnRmWTXBHfTq8AG44drZ/EIMWQAU1MO9q+TG0zC?=
 =?us-ascii?Q?CFHLVBitn9R67Zoz+4DGQUIuo6olsAKdko5whFuXQOgTbrhg87E7A1VX6Xge?=
 =?us-ascii?Q?X0Rry/UsBZshQUMyzU5X0Afd9h0vtW/18X0BVydrfr3eKSAoeX4XyXGOu8IK?=
 =?us-ascii?Q?SdrykkLrWt3zj59ri3mgwZJkRvdP4lrlpxkZk4EYSiBIQDymfz7cW46I3ghj?=
 =?us-ascii?Q?0nX9VBBSN3nGfx3Xk+AcfBq/texUmzT0+qcgyoodeGdDjQ+933k4BEkOhbQw?=
 =?us-ascii?Q?mwl/0mbmKHedRPaEURfbMz9jEcyzvkJaltx8LYRKQkl1idWpYCXdtBGUHbiM?=
 =?us-ascii?Q?dXvpx6wr1q9F7OZiPPHHXvWfojTX0h+4HRyjYBt8Dwv+dhykPD2ycWbPsCbP?=
 =?us-ascii?Q?cfpHNMjLok6Q7cMwRCEaYBhJDOYn1eU4bZjAvF1q85Vd+GbNoFAWjtNgrI7W?=
 =?us-ascii?Q?n0Cfie5G/gIx0eLe3neWmKJCUsB+mk7wX/ytahYIapGwTKYMJbEbDBq1RRen?=
 =?us-ascii?Q?5nvz9UNpRmzmCc692taRyfFjKLiO3fbMM+e3mM9EZul3g/PXXx8oNoTjF6J8?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc404d9-10c7-4748-4fe4-08dcef44dea6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:17:05.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFEkau9xnLyc59bnaEqSqyTyJd0GXZrX3MWjlZ7bzuMUF4i7e/bv4V5SkY/h2/3iKuD2dZqT+R1Yp/HnX2IVmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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

On Fri, Oct 18, 2024 at 04:59:05PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
> >> >> 
> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> 
> >> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> >> >> >> 
> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> 
> >> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> >> >> >> >> 
> >> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> >> 
> >> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> >> >> >> >> 
> >> >> >> >> [...]
> >> >> >> >> 
> >> >> >> >> >> > > +{
> >> >> >> >> >> > > +	unsigned long i;
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
> >> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
> >> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> >> > > +			continue;
> >> >> >> >> >> > > +		}
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +		if (!trylock_page(page)) {
> >> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> >> > > +			put_page(page);
> >> >> >> >> >> > > +			continue;
> >> >> >> >> >> > > +		}
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> >> >> >> >> > 
> >> >> >> >> >> > This needs to be converted to use a folio like
> >> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
> >> >> >> >> >> > a function that both migrate_device_range() and this function can call
> >> >> >> >> >> > given this bit is identical.
> >> >> >> >> >> > 
> >> >> >> >> >> 
> >> >> >> >> >> Missed the folio conversion and agree a helper shared between this
> >> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
> >> >> >> >> >> 
> >> >> >> >> >
> >> >> >> >> > Alistair,
> >> >> >> >> >
> >> >> >> >> > Ok, I think now I want to go slightly different direction here to give
> >> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
> >> >> >> >> >
> >> >> >> >> > What if I exported the helper discussed above, e.g.,
> >> >> >> >> >
> >> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >> >> >> >> >  906 {
> >> >> >> >> >  907         struct folio *folio;
> >> >> >> >> >  908
> >> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >> >> >> >> >  910         if (!folio)
> >> >> >> >> >  911                 return 0;
> >> >> >> >> >  912
> >> >> >> >> >  913         if (!folio_trylock(folio)) {
> >> >> >> >> >  914                 folio_put(folio);
> >> >> >> >> >  915                 return 0;
> >> >> >> >> >  916         }
> >> >> >> >> >  917
> >> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >> >> >> >> >  919 }
> >> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >> >> >> >> >
> >> >> >> >> > And then also export migrate_device_unmap.
> >> >> >> >> >
> >> >> >> >> > The usage here would be let a driver collect the device pages in virtual
> >> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
> >> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
> >> >> >> >> > migrate_device_unmap.
> >> >> >> >> 
> >> >> >> >> I'm still working through this series but that seems a bit dubious, the
> >> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
> >> >> >> >> would help me a lot in understanding what you're suggesting.
> >> >> >> >>
> >> >> >> >
> >> >> >> > For sure locking in tricky, my mistake on not working through this
> >> >> >> > before sending out the next rev but it came to mind after sending +
> >> >> >> > regarding some late feedback from Thomas about using hmm for eviction
> >> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
> >> >> >> > doesn't work for coherent pages, while something like below does.
> >> >> >> >
> >> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> >> >> >> >
> >> >> >> > Here is a snippet I have locally which seems to work.
> >> >> >> >
> >> >> >> > 2024 retry:
> >> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> >> > 2026         hmm_range.hmm_pfns = src;
> >> >> >> > 2027
> >> >> >> > 2028         while (true) {
> >> >> >> > 2029                 mmap_read_lock(mm);
> >> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
> >> >> >> > 2031                 mmap_read_unlock(mm);
> >> >> >> > 2032                 if (err == -EBUSY) {
> >> >> >> > 2033                         if (time_after(jiffies, timeout))
> >> >> >> > 2034                                 break;
> >> >> >> > 2035
> >> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> >> > 2037                         continue;
> >> >> >> > 2038                 }
> >> >> >> > 2039                 break;
> >> >> >> > 2040         }
> >> >> >> > 2041         if (err)
> >> >> >> > 2042                 goto err_put;
> >> >> >> > 2043
> >> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> >> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> >> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> >> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
> >> >> >> > 2048                 goto retry;
> >> >> >> > 2049         }
> >> >> >> > 2050         for (i = 0; i < npages; ++i) {
> >> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> >> >> >> > 2052
> >> >> >> > 2053                 if (page && (is_device_private_page(page) ||
> >> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> >> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> >> >> >> > 2056                 else
> >> >> >> > 2057                         src[i] = 0;
> >> >> >> > 2058                 if (src[i])
> >> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> >> >> >> > 2060         }
> >> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> >> >> >> 
> >> >> >> Practically for eviction isn't this much the same as calling
> >> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
> >> >> >> probably shouldn't be looking at mm/vma structs.
> >> >> >> 
> >> >> >
> >> >> > hmm_range_fault is just collecting the pages, internally I suppose it
> >> >> > does look at a VMA (struct vm_area_struct) but I think the point is
> >> >> > drivers should not be looking at VMA here.
> >> >> 
> >> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
> >> >> so in general I don't see a problem with drivers looking up vma's. The
> >> >> problem arises specifically for eviction and whether or not that happens
> >> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
> >> >> issues there (see below).
> >> >> 
> >> >
> >> > Ok, if you think it ok for drivers to lookup the VMA then purposed
> >> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
> >> > needed, rather just the original function exported in the this patch.
> >> >
> >> > More below too.
> >> >
> >> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
> >> >> >> > ...
> >> >> >> > 2101         migrate_device_pages(src, dst, npages);
> >> >> >> > 2102         migrate_device_finalize(src, dst, npages);
> >> >> >> >
> >> >> >> >
> >> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
> >> >> >> >> > lookup during eviction cases and this would let me fixup
> >> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
> >> >> >> >> 
> >> >> >> >> That sounds reasonable but for context do you have a link to the
> >> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
> >> >> >> >> just missed it.
> >> >> >> >> 
> >> >> >> >
> >> >> >> > See in [4], search for '2. eviction' comment from sima.
> >> >> >> 
> >> >> >> Thanks for pointing that out. For reference here's Sima's comment:
> >> >> >> 
> >> >> >> > 2. eviction
> >> >> >> > 
> >> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
> >> >> >> > migration gurantee:
> >> >> >> > 
> >> >> >> > - Only looking at physical memory datastructures and locks, no looking at
> >> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
> >> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> >> >> >>
> >> >> >> I also very much agree with this. That's basically why I added
> >> >> >> migrate_device_range(), so that we can forcibly evict pages when the
> >> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
> >> >> >> general it is impossible to guarantee eviction og all pages using just
> >> >> >> hmm_range_fault().
> >> >> >> 
> >> >> >
> >> >> > In this code path we don't have device pages available, hence the
> >> >> > purposed collection via hmm_range_fault.
> >> >> 
> >> >> Why don't you have the pfns requiring eviction available? I need to read
> >> >> this series in more depth, but generally hmm_range_fault() can't
> >> >> gurantee you will find every device page.
> >> >> 
> >> >
> >> > There are two cases for eviction in my series:
> >> >
> >> > 1. TTM decides it needs to move memory. This calls
> >> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
> >> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
> >> > here albiet with the new function added in this patch as device pfns may
> >> > be non-contiguous.
> >> 
> >> That makes sense and is generally what I think of when I'm thinking of
> >> eviction. The new function makes sense too - migrate_device_range() was
> >> primarily introduced to allow a driver to evict all device-private pages
> >> from a GPU so didn't consider non-contiguous cases, etc.
> >> 
> >> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
> >> > partial unmap of a range, etc...). Here we want to evict the range ram
> >> > to make the state consistent. No device pages are available due to an
> >> > intentional disconnect between a virtual range and physical
> >> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
> >> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
> >> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
> >> > using hmm_range_fault like I have suggested here.
> >> 
> >> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
> >> fine for this usage and is exactly what you want - it was designed to
> >> either select all the system memory pages or device-private pages within
> >> a VA range and migrate them.
> >> 
> >> FWIW I have toyed with the idea of a combined
> >> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
> >> migrate_vma_*() process but haven't come up with something nice as
> >> yet. I don't think mixing the two in an open-coded fashion is a good
> >> idea though, I'd rather we come up with a new API that addresses the
> >> short-comings of migrate_vma_setup().
> >> 
> >
> > I think that would good. Here we actually need to lookup multiple VMAs
> > and have a sequence of migrate_vma_* calls as it possible for VMAs to
> > have changed after the driver range was created. It might be nice to
> > hide the VMA lookup from the drivers with an API saying collect and
> > migrate all pages of a type in a VA range much like hmm_range_fault. If
> > the range spans multiple VMAs that would be hidden from the caller.
> 
> Ok. I wasn't really considering multiple VMAs. UVM and Nouveau don't
> really have a requirement to migrate across multiple VMAs but if that's
> neccessary I think an API that hides that specifically for working with
> migrate_vma_*() might make sense.
> 

We can run into multiple VMA scenarios if a user does something rude
like this:

mmap	0x000000...0x1fffff -> fault migrates 2M to VRAM and creates an internal range to track
munmap	0x080000...0x17ffff -> now we have two VMAs instead of one and the range has a hole in it

In this scenario, which we believe to rare / unsual, we just evict
remaining VRAM pages to SRAM, destroy range, and fixup on next GPU
fault.

> > Matt
> >
> >> > Note #2 may be removed or unnecessary at some point if we decide to add
> >> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
> >> > now though. See 'Ranges with mixed system and device pages' in [5].
> 
> As someone not very familiar with some of the DRM layers can I ask why
> having virtual address ranges with a mix of system and device pages is
> hard to support? It seems to me that in practice it might be quite
> difficult to keep a VMA range as exclusively all in system memory or all
> in device memory.
>

A few things that make this difficult are:

- Our (Xe) bind code would need to be updated to support this
- TTM / DRM buddy allocator doesn't support freeing / reallocation of
  individual pages rather aligned chunks of initial allocation size
  (e.g., 2M would be common allocation size).
- Spliting ranges would add complications

All workable problems but since we are writing a new common
implementation trying to keep it as simple as possible for initial merge
of the design. Almost certainly at some point we will add support for
mixed ranges to the common GPU SVM layer with a driver choosing if it
wants mixed or non-mixed ranges via a flag to function calls.

wrt to being difficult keeping exclusively in system or vram, in
addition to the above case the only other case I have found in which
this occurs is CPU and GPU faults to same address range racing. This can
cause hmm_range_fault to grab a set mixed pages. In this case again we
do an eviction remaining page and restart the GPU fault.

I don't have real workloads yet but I do have a very aggressive test
case that intentionally does things which could break the design in a
highly parallel manner and the design as work. Is it ideal? Maybe not.
But getting in a simple design which we can build upon is the current
goal.

Matt

> >> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
> >> >
> >> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> >> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> >> >> >> >
> >> >> >> >> > It would also make the function exported in this patch unnecessary too
> >> >> >> >> > as non-contiguous pfns can be setup on driver side via
> >> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> >> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> >> >> >> >> > in [1].
> >> >> >> >> >
> >> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
> >> >> >> >> > migrate_device_unmap?
> >> >> >> >> 
> >> >> >> >> If there is a good justification for it I can't see a problem with
> >> >> >> >> exporting it. That said I don't really understand why you would
> >> >> >> >> want/need to split those steps up but I'll wait to see the code.
> >> >> >> >>
> >> >> >> >
> >> >> >> > It is so the device pages returned from hmm_range_fault, which are only
> >> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
> >> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> >> >> >> > MMU invalidation which takes the notifier lock thus calling the function
> >> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> >> >> >> >
> >> >> >> > I think this flow makes sense and agree in general this likely better
> >> >> >> > than looking at a CPUVMA.
> >> >> >> 
> >> >> >> I'm still a bit confused about what is better with this flow if you are
> >> >> >> still calling hmm_range_fault(). How is it better than just calling
> >> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
> >> >> >
> >> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
> >> >> > vm_area_struct argument whereas hmm_range_fault does not.
> >> >> 
> >> >> I'm not sure that's a good enough justfication because the problem isn't
> >> >> whether you're looking up vma's in driver code or mm code. The problem
> >> >> is you are looking up vma's at all and all that goes with that (mainly
> >> >> taking mmap lock, etc.)
> >> >> 
> >> >> And for eviction hmm_range_fault() won't even find all the pages because
> >> >> their virtual address may have changed - consider what happens in cases
> >> >> of mremap(), fork(), etc. So eviction really needs physical pages
> >> >> (pfn's), not virtual addresses.
> >> >>
> >> >
> >> > See above, #1 yes we use a physical pages. For #2 it is about making the
> >> > state consistent within a virtual address range.
> >> 
> >> Yep, makes sense now. For migration of physical pages you want
> >> migrate_device_*, virtual address ranges want migrate_vma_*
> >> 
> >>  - Alistair
> >> 
> >> > Matt
> >> >  
> >> >> >> we're talking about eviction here so I don't understand why that would
> >> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
> >> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
> >> >> >
> >> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
> >> >> > as argument. This is about avoiding a driver side lookup of the VMA.
> >> >> >
> >> >> > CPUVMA == struct vm_area_struct in this email.
> >> >> 
> >> >> Thanks for the clarification.
> >> >> 
> >> >>  - Alistair
> >> >> 
> >> >> > Matt
> >> >> >
> >> >> >> specific concept?
> >> >> >> 
> >> >> >> Thanks.
> >> >> >> 
> >> >> >>  - Alistair
> >> >> >> 
> >> >> >> > Matt
> >> >> >> >  
> >> >> >> >>  - Alistair
> >> >> >> >> 
> >> >> >> >> > Matt
> >> >> >> >> >
> >> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >> >> >> >> >
> >> >> >> >> >> Matt
> >> >> >> >> >> 
> >> >> >> >> >> > > +	}
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> >> >> >> >> > > +
> >> >> >> >> >> > > +	return 0;
> >> >> >> >> >> > > +}
> >> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> >> >> >> >> > > +
> >> >> >> >> >> > >  /*
> >> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> >> >> >> >> > 
> >> >> >> >> 
> >> >> >> 
> >> >> 
> >> 
> 
