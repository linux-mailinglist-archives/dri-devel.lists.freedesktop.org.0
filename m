Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D24BC883A
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 12:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF5510E20B;
	Thu,  9 Oct 2025 10:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF2oe4sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D9710E20B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760006030; x=1791542030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PnMAcc9SjN/mLVHTyXhpfxhbhkZv17nJqi68N5ASKY0=;
 b=BF2oe4sgLtxHOzcljy4t42yuXanWSKfgOL7Ih62uJBebwAFmWnIK/KA0
 iHycdvR0CiBN5i20dEs4u2F062ei3Gj7/8pWwS1FFvYIktTuVWNlvmnm1
 /oO+oJPLU7uHPtIEcgSrRVpO2cbyrTqi8KRtpbk1ILdXaxvIXLNyJ/FlQ
 NdF637d2B7lCEN8g/J8L8HYEwt8U57lhs82u+3Z0eYL1l767TE7EgEo2c
 +CrKL8X1S1/mTN3sr5JW7QEMP1TT/QGFgpogQtmc0DkL8sS1IH4KkDe/3
 BAkXhTHZTFvrFuputJDgWK2EOUABc9QkFcifOU+o4W4aMa6CQ/hV0rG7t w==;
X-CSE-ConnectionGUID: Wunz6M8yRKGPfQJu/jDrew==
X-CSE-MsgGUID: rY80bqEhSGeKQLDGOJdcLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73556385"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="73556385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:33:49 -0700
X-CSE-ConnectionGUID: QX6exgNjSYyy7os4DR18Rg==
X-CSE-MsgGUID: kJfQc5ZRTJaKImJoR/6K5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181447383"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:33:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:33:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 03:33:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWlNOoAIxDFewwmuY0ujVYsJgJA41QJNW8GKk5kLb0vbBVW4IgC+7AYz0LYBOJytHOdgkNERUV0TCHcQnxbl0bB+7S5KqzB6ek68q9FCR6T98fFWm/u0SE0Nha8WQW5lLC3P6SGLvoGCitChV1umIoyFauyrbZ1op0QbcRlecqPUgYQlBG9ndo9r8He1yUrzMV+yO4AIt8be5fKbp3RadPkMQnl1ebrN96EayaeOwWbac9bRChwnP6ZZv1cwoWqBPK7v9dT8kz1oUYzlrK7fPeu1vluHrU2iOkCNJaUVMof+4c6gKbe9MNd8XTB+9Z5pqsE6iOr3l0g0NV4gxbfrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UdOyVNHOhjAsW+v7rrZg1Z5f6885mQesUbjSzQKm2U=;
 b=JT1j/+qosxZGcCeyBqr6C1uLJ7+az/iB9GMyoqcDJsHBwlKyM13phIuf+svDm61Pn0WNLp/VvoXkoKLAjGuxALkZFyH8pMTWjl4Jd1AYFsvEeh11ThrlgFoq/zwhFWhzJK4oLagz0M6x+lU3STZpFumJ/y3oO62cQ7qxv+n6mZ61tfxuWYDbLz6Jdotx0iGb0rPkzzZL2Y6x3rd0flTeYcY94wyW6V6F0mOdSB9RXu0jnYgedryPnTnra0yCYC/QszWN+3nIGWBYjMNPvSz6m56tAU4VEqh2RPCpp98t69gCHh4E67gWwyaR33GrnV3HnpcEjQtHz+xUTSNLg32/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Thu, 9 Oct
 2025 10:33:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 10:33:36 +0000
Date: Thu, 9 Oct 2025 03:33:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v7 00/16] mm: support device-private THP
Message-ID: <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
X-ClientProxiedBy: MW3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:303:2b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf47d60-18a7-46da-38fe-08de071f4df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qwh4hWwGk7OtX23KTX4iFCbMrfN+5LSNJwZq92okuk2qnTM29jHxUjOYVgqk?=
 =?us-ascii?Q?26qn+lRPJr3ZG7V9iBIJO34XdZIdgNQAAD5BuNrgiCwBFqhgRj3+TdA+S3G5?=
 =?us-ascii?Q?1fdek2Z1UT7ymxIrAHXZMLHcJ0fIpqWi2gMb8bL9SkdbzydNyMRaSEVelicO?=
 =?us-ascii?Q?LjgYG29a5A0owz9J2p2feGAJvR5TyTIVNJmkLyTbRqc+dwngksmsYatUWEQs?=
 =?us-ascii?Q?BB6LJqHqImMnITF+PE4WXLu7EzpjDbsZvDW7QWQHQ+kYSoRdVztebAthyQ/V?=
 =?us-ascii?Q?i6La2Uz/abD/LW3muPNsvpN69cj5A8/emg6S8qJ9noG2jbRzr9C9ZhIzvBP2?=
 =?us-ascii?Q?VMyZ/babg6izN9/+QMWMsRWC6BgIa8c7q12U2TxKSkuBBn4BoQTw2HPNO/OZ?=
 =?us-ascii?Q?epGUXb78KOX6CcT0KJEQnJDphbeiV6EpQ0Kzp8OGzgWxjJPJB7ZM0gLlMDBt?=
 =?us-ascii?Q?UBzYuLdCryO1MmDiVayZ9q1WQvjjBeWDBCOeo0O3YCXE+MRDmqYVjHXlI866?=
 =?us-ascii?Q?72uJXW+kX/zqc2b+XDsjhfOSHn4htIcXKjyrQt/1HZVA91YExYTp+dtPskCH?=
 =?us-ascii?Q?JOrpOfSrMXHIHI5a0TSpDa0XmxcOdcEQRopeqp+0HLcQUVD+Ng9Bji5tPBTG?=
 =?us-ascii?Q?IhLU7IToUISlppJR1n0KLWkzqjUwDcKz+7WVNucCNyrCS5CjPGJtGVqmQB4I?=
 =?us-ascii?Q?jrJGoPdLGzzVjfLn5hX3eSBZR0Qg9ub+I8XOxD2/sA4BnVu24GSWK2DgwHt/?=
 =?us-ascii?Q?kLGZf+eysT5WfAvuOa89bXxBARR+EzvLnM+CKti8H4Z1jW/DAWWf4OuLLpmW?=
 =?us-ascii?Q?ZAKJa5zLax1w9kKT9VZYSOHAcVAD3Au3x+07i5PTSRBj6UY9vHbG3VdTJlP8?=
 =?us-ascii?Q?0k+QoKfZKlTQi+OhffhPsGVN62n4gHNOOnxiFaTxIIPZwYiozKjBc1TxOvUH?=
 =?us-ascii?Q?/J1bE5WTOYs6klIKYH8ni0iGt/1eCpz0SpUXisBC9s9bEy2sYRwYMHIYbLbH?=
 =?us-ascii?Q?ByA/1eE8/fgLjlRI080HAnVySKmpcIJjqJXOEaUaJDQbBTnY8lNy2iMNU1al?=
 =?us-ascii?Q?P5VrZDYEgpC72Qr46+cFt/s/B9pqsYzOSn3W2NRzquq6ceHY16h20Y2wq+/x?=
 =?us-ascii?Q?fpaDJKWjgT2CTeG1Wt8CquARvmbxsiBo90HAOmp/fcgXyNiF4P1pcBqJ1Ika?=
 =?us-ascii?Q?3aqfQR5b67yj64Q+s1Zmmk2EA1qPRO9Ol+6y84e0z8TiTIO8jYvwVqYR08Td?=
 =?us-ascii?Q?fKR37Ak/eU8wZTVOP4/aQgcHyDalNDCNMtMT5kbLWxLP0QYDJLlcXsr8Rq3I?=
 =?us-ascii?Q?a6JDtGiMq+K5IjOFaOxIFsnw9ajWFN8igvczCPzVyGKNz0iEqSahwaEiYgKD?=
 =?us-ascii?Q?Z4GVpY0oQbvy1Tj4NOvZ8HfLmzenTQwkwqpcFOdEAsWnSAE2JUw3zkg1FCn4?=
 =?us-ascii?Q?4aqHWdczscC0EATsidVUiTyCKL2BjKH1v9W9DQbQmmBvk2GvdmcHYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pahldNChympQoDr+Y2FXPPnI7gq+2p/KgKGRlywwldSRARbgA+Vkhkw+oOq?=
 =?us-ascii?Q?2b/YOWCzxQ46fixzelxk+tXRooIeZeN9OMoXX25+7w0WxCOpsjm8P5/gKIt+?=
 =?us-ascii?Q?PB+PUqxE6R2gWaN8RBT/UrGFofagUjawE4aAVizCwIxGXDgu9ANPbzAykWqG?=
 =?us-ascii?Q?B5DqrG2b1Z9nn781DqH4q62oeIa1Y+x7DB6wbL3JL/8VGuWMnayPLZ8HC1s8?=
 =?us-ascii?Q?VwSSubTGK2qZgcOp9h/EfC3txCCmoPBX4hvE8X7gXNMGtFfGFY2+Mlm+uS0A?=
 =?us-ascii?Q?XPpQpAJQ8tbtYCcYsTHz/IK4DminZGJOZ4wey1DM14PNytECRFPCb3CxJH9C?=
 =?us-ascii?Q?Ya6xWELtNtD88d0I5j5/7lUUq563f1ZL2/H1pel9i5KGTLZoeA86F/DV3k75?=
 =?us-ascii?Q?FToWlPnMUncjRnLAruTGey1CulDf4YEezQrHvvR5CGJI//6osZ+YdFP02LUl?=
 =?us-ascii?Q?Wr6vpiM4muMd8sPUZzjBt2zI5fhSytej4eiKV8i0Rz8pjZllb5H/F6fVchpx?=
 =?us-ascii?Q?U46OxNIaNWJNWCZ+D50xAb5Le69zVNmVvm9gZTs5N6RDeSNgRcBLh3qtJxd2?=
 =?us-ascii?Q?uEeUqDKWkVCuM7dP8HbQwFAh7JMT4ptnF0N6ywV40s9aisKSqZij+2rnJ3Dh?=
 =?us-ascii?Q?gKkJWFR+qIHFl0Eyut0qAi03W0azBS3X95RoyLpqHKsA+rglbzrxr65Vh7nH?=
 =?us-ascii?Q?43g39zbKGGNQKS2i1XNaL5j1erl2Mjufvidyxb46xtVXogFBcjOrnQMR4rEq?=
 =?us-ascii?Q?y2AMBfGdtICuhJOyl+ziN12MYyyqG2iS2lCf6zCyXns0qkso6ARTYE7umFeZ?=
 =?us-ascii?Q?DCFOihPkWzEY8pJe41evCr3NsKr/4FiviGISefLF0nKrcbFBDTN5NcJOkJmC?=
 =?us-ascii?Q?+bu+IGAhIecj7SrpkcPNXUruQYwx0k0YmL21Kr5WdvNVdXoRUaa9LilCma+T?=
 =?us-ascii?Q?C+/Q1V2tDQcpgginZdioJNOrwSq2rrfI1TdUwt2QVPOpx7gwRq/sS5ADIfX/?=
 =?us-ascii?Q?aVOsh2bwFrDUQnuUXkUycubxa2sh3vi0Dur3+znnd0q2GiL5ay0v4nW0C1f/?=
 =?us-ascii?Q?LwsPMoffHTkTSQuPFKmq7a12V1nhBIMz6dvretPqzGVnlSxNslbv1E1SJCFa?=
 =?us-ascii?Q?nWBlOlSUNPOzz4k2z2WVItNa3AvZbgt33STm1I1Mje13oM9TCEaJcVmN72y8?=
 =?us-ascii?Q?HykLjVwhVgNYEOo4+1XL9mkl/biBRR60i2+7IXN6prxnhy6zY5aZE8zfBiwy?=
 =?us-ascii?Q?JHg5TqbAsvokFBI1LrSEkLHkO46DXtA1ziClp/QnQlmwNDQ0j9MgW5No7Z3Y?=
 =?us-ascii?Q?+onLhzujhg5R+U2pRszlT2UnBaehWiGz6rwrtpcv2Aqi5ImAU8Jg4B6VtVXO?=
 =?us-ascii?Q?DQcfUIvufoFps+fX26YCVgIWyslY/ZBw+1ZZ2ukbT6vK9Wf1X3CHRkUpiKu5?=
 =?us-ascii?Q?EwStZ2K1+ZhGH05BqfFctxrlH9+1hWBAdrKaJDEOpB6Wf0DOnOsstg8xM3sx?=
 =?us-ascii?Q?JmXZnowtZwRYFUaqXEqlluW8qHyKkXIDoyX1YjbeTVlih/rqE82+jDzxJgrS?=
 =?us-ascii?Q?4jjo7wpW5x+IkSQzVJjvoUXXY5nqtIpDwj/jMIcVAM/blDobtf8P+scdEYeM?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf47d60-18a7-46da-38fe-08de071f4df8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:33:36.8490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoAwuhZlar9BAuCI01Nzj2E2yQ5es+j5TwnzLlG+uX1CqaP+tc1XUc8/sWBRTYGyYZYDPZcKfx2M5Vx2JdJ6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

On Thu, Oct 09, 2025 at 02:26:30PM +1100, Balbir Singh wrote:
> On 10/9/25 14:17, Andrew Morton wrote:
> > On Wed,  1 Oct 2025 16:56:51 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
> > 
> >> This patch series introduces support for Transparent Huge Page
> >> (THP) migration in zone device-private memory. The implementation enables
> >> efficient migration of large folios between system memory and
> >> device-private memory
> > 
> > Lots of chatter for the v6 series, but none for v7.  I hope that's a
> > good sign.
> > 
> 
> I hope so too, I've tried to address the comments in v6.
> 

Circling back to this series, we will itegrate and test this version.

> >>
> >> HMM support for large folios, patches are already posted and in
> >> mm-unstable.
> > 
> > Not any more.  Which series was this?
> 
> Not a series, but a patch
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=10b9feee2d0dc81c44f7a9e69e7a894e33f8c4a1

I think this [1] means this patch is Linus's tree?

Matt

[1] https://github.com/torvalds/linux/commit/10b9feee2d0dc81c44f7a9e69e7a894e33f8c4a1 

> 
> Thanks,
> Balbir
