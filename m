Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F090BD94
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1010E510;
	Mon, 17 Jun 2024 22:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFVo+aBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5949F10E515;
 Mon, 17 Jun 2024 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663372; x=1750199372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zl6sAFNkJdajOQu92qKoCFBNTJz/ZNluvQ6v5rcNtqE=;
 b=MFVo+aBItLv2u8SghW9l4vMMd/wpCSPUXlfVCW49ZBXUPYJBzp+lQIQH
 gxlDyu+LhUn/pDSCHfQy3O1j2hr3a3EwZ7RcTczeMR+LIQAWX20ZkPg5R
 q+e2tZ9uRXclJxKDynYBsXAtWl6vogBPKOF8nKD7plgo6fPzV2cktb/3E
 4M2Fxu3eAv+3X+cnQ4v46ay18fVI/U7o6z9bwO4fvAQNbdbF8dniCIgbX
 GuOshsJuRcEGt9f3F9cVvv/vQsOqUbegkzs1sb9lMbqReIYDMfxAwx6W6
 uhVa6Kx16ioAwU0P5CFXH0dFj2n1jRLlhkfgrGAAOJcEZHyrkY0uAI6Ru A==;
X-CSE-ConnectionGUID: uM3OQY31SsqpK/e7bWiEKg==
X-CSE-MsgGUID: cPtUFyzhRY2EP9X6tT6JQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15638321"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15638321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:29:32 -0700
X-CSE-ConnectionGUID: zqBH1Xr5T5aYzov967g6Yw==
X-CSE-MsgGUID: 4uYlPn6mT9WO7Z/v4/nL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="78795680"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 15:29:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 15:29:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 15:29:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 15:29:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 15:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP/yaY4Sx6W+pCtPM660NnpancZVAGR6d+BJ0VSlzN/4tBmV2xt400K4HxN0afCGI41RNfUTI+POLRpWz8KhCKzGpv3fJCt3P0ZCVaYgrPnlw4sHh5YUN6WncBwFWsI5Ewm2fjle1gwuQ+tCHOIXEry0i6HQRTE5XBIHU362JgD7YABRI2/EIqUUh0ZmnuM8wDeZ9sIh9RRQ8GPeKGoQeHwuapf5JGQazuxU2bt4K8K9qtozWpiEdpVaU3p2R8yaZ0Excq6c6UGFbClpY0CuHQbq8hGGwOCP6QlhFhkf+3fwAj6DIxLtC2TijuXj9uUWAAXuZ2Fdd2obi5pVX36rbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBEfgzRCTh3DK1ilsNcRUfy2WFTw/RmyDlTnUQyXc8w=;
 b=mO0CfZRlOf7Vz1KikJ+DYDMFgSXiQgzw5YM+iD1eYcw1qaAeNYgsCzw29H29X8obe6LBWXlw5y05KEumAZOUTxQlgMB5CLzl8cvtbYtTjr6OS7xlsy9qCOypmPKbjGWXQG6tQHX5GARx9txCQxHPGvCUHoQ9BFtIfsy4fRsihZ9PAxk8aGQ0+WgIxUyawoQdDG2wfKyvUtQzsD6UrGYwvCU5QtmfhJlGu2Hbpz1APYkxpacWVFhtkaohm9JUORkJwMMpVZm+U7EsPL9hQLKuAUCLicXwtBSXpgb1znuj+Xr+mMPSZvzf3I3nDveyGmeb/Gyq13pvLwoPWlTYfXEu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 22:29:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 22:29:28 +0000
Date: Mon, 17 Jun 2024 17:29:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <en3word63algrcfec7dp5x455v3oofyfflnsnmtnymoiczhrk7@pm3vgs47xmcr>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
 <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
 <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
 <hh6i4vsz2ky52hw5g74l5llhjtzuyuebjtnaebqh3dq7svbfnp@zy4cwkqqzszz>
 <ZnCCnEeNCWfyhhY0@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnCCnEeNCWfyhhY0@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: 3967b1b3-c60e-4098-2428-08dc8f1cf36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dPR4lxpo2yfVFxJ8yjGqGF7KheP6lhK7sBykcTGVEgXYRYl10CmW+0uE9sS9?=
 =?us-ascii?Q?/C47mEc1PIa0DsrfOOQDFv1y93yj27I15a6zXzedTERg9KLL8xJMuKxCxubH?=
 =?us-ascii?Q?LECiS9wmSCRc3zAHjGooAJWhz24b+l/IEL+Qw7pUcrynY4Bwl8mn9dQGswBC?=
 =?us-ascii?Q?iRpjagmw5qQ4sgZF42sJDtZuVcDRR8ProVemYiYZA3J3btoebrThB/moMWlW?=
 =?us-ascii?Q?u3SeS8Qh7jCTcdB2+xn7bZ5OQ0p8qXdC5N3UERgA4xRxU/gCo9oBxFT5tnrw?=
 =?us-ascii?Q?dOlimLxxFJjAOj53tkHGS2sogpr+otk/I8Kr5REj6/WoJ6o0BFYY63sbjFHk?=
 =?us-ascii?Q?cbVQ/yoJLCCJi/L+XN4w6y9m18GNFaufzJ6mQ0dVS1sjiAaWUWckX8+zcCDh?=
 =?us-ascii?Q?G+/mrM9PkL98MwFGq6IBQx9VFzlwOXooef39CC/fJyt6Cg5r+91AVJWGpkBJ?=
 =?us-ascii?Q?/pCQrx1LBTu+n5yb+AYh0W9FgTmcdfI6HQFASsTL5sFMIrVJL81KKAByWJSj?=
 =?us-ascii?Q?H9UElLolDUbnre+DiFoNiKv0nA1IJStwF/SYb5lC8UcdEtznB/AxnzRzhcn9?=
 =?us-ascii?Q?xppz5SlidM218ExEZ5kliRHZ16Fi14p93a4MHRnEtKWD2Ut7Draf6QpmvcFK?=
 =?us-ascii?Q?h59EAUj+K7Hunu6EwZPS7RG1tIU+U/Ild08W3iVmHBMvgTr2SybTfsuIrDzV?=
 =?us-ascii?Q?m9uwB2KSw5RA1uaxtp0zri8ZOX3Z9AncmbRx+vfSigKeaSxOfLoOBuG6U8zF?=
 =?us-ascii?Q?yiPSBDCCKowpgTtxvp/ULatG4niD9LizURCaM+Xr5Qa7WqhI7cRWYKp1maDH?=
 =?us-ascii?Q?AnC4fb7iikXhZoJ8uQ9yi2uxDHOvngbLIgUujfpvq+XZPCKDyBITpcwWWgtw?=
 =?us-ascii?Q?8Wrcn89PxQFH3bdHGpbDgIdpyy+D7G4U/wihlkAOPZ415zZbMjcJOwfW7Spd?=
 =?us-ascii?Q?zWylO8Vmex/2+1bLFc/aZk9QnTvbaOsXWJASGF20dqo/u/KbY/U4gXVj3ffZ?=
 =?us-ascii?Q?DjL3b6/0Er46cjeaEBfhVbFY3ZqcuYMSGhcuAF/9KDlKJtbaixGkhb00XTpO?=
 =?us-ascii?Q?wqC8zuXIk5e6pCYtDrh4CxFjRlv6d3XckjcSD4r8yStHqG4Yr+/2sh0qlieV?=
 =?us-ascii?Q?v780nLSQd77l4k2iYTYwqEav/IWdToVvlPP8EiJAC0jShBv3F6iI3ahuBzUo?=
 =?us-ascii?Q?yiPq6DivnF/8gzMRk6Dfu4oCT8iSsL3GnHSB03imqb9Odi01dw6GTOFED2mA?=
 =?us-ascii?Q?z5zmx5ZxePjfmB0rC3B62ns0Y5AvbuEirhSNBxh1ucpGXcnK6M2qzS5JYg4l?=
 =?us-ascii?Q?hks7D+fwisE7Ep8w2bESuxhp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJ77XZEt9W2KWUHIQ+2Ycv4q1a1dcNpkvlYqZxhW2CBQW1RYTSKlgISxmuVE?=
 =?us-ascii?Q?zhLqBaEWfvdnP9LkAmD4Ls7HTQUZpaGgkDUpHsMgc9mj6++Kbst3XIrsum+q?=
 =?us-ascii?Q?6/3dTEskA7v7n22LVvkXZ2+A8trxrnWcLw/bUNBKSjXwNwBH9kjjiP9PhBaJ?=
 =?us-ascii?Q?Md4CX73CWMQQXl16OLSlwPTjGWtbs9tC3uvgLNeY9QhUntWhbTw5LHP+LDfi?=
 =?us-ascii?Q?delaVFOfa9eb1/JjB6qkCKORyd+D5M69tltWWm9I713AlWza1imGs3nKHRQi?=
 =?us-ascii?Q?0Gezq/R9bxXGukgZlAzgliGFJEUsIcoEvyjqiuCFszyo2u5hR7sGCjMneYUS?=
 =?us-ascii?Q?wu4RTOqhWGeZ3AOOWAUwulWb0NJ9wmTTOExQEQQjsAD3MF+2PnpUX9tr4Bbw?=
 =?us-ascii?Q?bgGCKIq9EuqPMoIVntSff2jx9Y9EUsppRjDZPF82TCUGn8ZkP6iAofH+Ycn1?=
 =?us-ascii?Q?KylNBkBTD5G6+D7IcPrb0tViTJ+AP6AW9+XnoMCC9JsBB6UbAj0kpQ3pT59S?=
 =?us-ascii?Q?x3Qf1Oy//rfYMcgYm8Oi7PTC0xPJk+MxA4NU8O7KlRrG1IzTB2BGtODgszAv?=
 =?us-ascii?Q?MhA6EwDem2GWEkIT0nV1vVJ/AxtxyMgjjNqR3IUA3Ff9OVGQfz+kcLaoJYdn?=
 =?us-ascii?Q?eOtDZuz02nxI//2rtKYMvwNYvDPq2B+Jf2E+oZZ8FKbk15R78N6OXun3rply?=
 =?us-ascii?Q?pUZvbHplLH19G1Ro/4mDV6dV51u0plEAXTUKtk3zpzJvl5CubrQTIrDHof7c?=
 =?us-ascii?Q?8fgNvIiDYWeqKIbnT7fZd5d6tsjT9yQS8VSGPujbPvme6Nmi+uzW4mcOU2JH?=
 =?us-ascii?Q?6x85BSR+HG0TeHHD00E0Q6IO2l2c6q2zXOeWda1MecFdtOMWzp3/sFJWDHc8?=
 =?us-ascii?Q?Gm8I4T9YKI/GtIQ2lSftuIbdb0GOVKEIpspBU/r/kTehYmbe4WhT1BSb4S/7?=
 =?us-ascii?Q?sRMBXcjv2Rk2PWzRBrmiZ2oxmQ0GW1PAnO/a0RJS/OLS2AY6BSE+0QF9gjEL?=
 =?us-ascii?Q?06oYhPuqZaD7N1QZo/c+ROMPRY7IsBm10qlp2aH1JfnO25+eO5/sEYv5fA4x?=
 =?us-ascii?Q?sSUvuTfhL9fD9L1lBwiD7P2c+hZ5F8ikX/z0ND5kiKFkDwKtL4nrwnzzlVzb?=
 =?us-ascii?Q?/b+rgSgLzovqFaJZ5Sx8TkE0t848P62OOY4z8vwPm8p6XekJULOgP1tZflc9?=
 =?us-ascii?Q?AjhEy5O2Wiibj/GJfd9A3dNt9Zh9qUz1Kf+rBggT2QjG8dm0nTHXYjNpNSyU?=
 =?us-ascii?Q?hO+pDq8hKcp7lbK+sLg89BHDVBLuSE2pSgJQP49VK3ieRrg+a85k4J/lnI3g?=
 =?us-ascii?Q?d6cU+kJLiwrCNoo+Xp77xaylBQC8itfZ8clfUiKfzGrr/SeJDc9msGZcH0KL?=
 =?us-ascii?Q?GsBb+hsioGGuaF7o7p6y2MgsiRedjMBZ4eOHTkHVFLFvbBvkJMB3xLu3HUoH?=
 =?us-ascii?Q?LMdhBpKaKB9ms1+29N+NqRSS20OKwFTWZCJCmeGlA5cHFOy50IzlZNQXn83P?=
 =?us-ascii?Q?XMct/XnCMI/R5RIs8eI1GaKZgJ0km5abmXkPMa7H55AJtAV4tyLwUkU6oqsp?=
 =?us-ascii?Q?GgkJ/21p2qsPDUYBC8lPGgDQVdy3uhp6OSRWeABWl5q4462UxsBMwdrlcka4?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3967b1b3-c60e-4098-2428-08dc8f1cf36b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 22:29:28.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf6F8am2X1k3LW+N0RMKqzpOdrVNi+d6dbfuUK6GGKIZYTO4WzI4unfK+PDFfmEU2y/0wLgCzYohB0gFlusDwV71gOVqU4vykV6R1kkgsw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
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

On Mon, Jun 17, 2024 at 08:38:20PM GMT, Andi Shyti wrote:
>On Mon, Jun 17, 2024 at 10:46:07AM -0500, Lucas De Marchi wrote:
>> On Mon, Jun 17, 2024 at 04:22:11PM GMT, Andi Shyti wrote:
>> > On Mon, Jun 17, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
>> > > On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
>> > > > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
>> > > > warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
>> > > > supposed to return a pointer to the intel_memory_region
>> > > > structure.
>> > > >
>> > > > Sparse complains with the following message:
>> > > >
>> > > > > > drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
>> > > >   Using plain integer as NULL pointer
>> > > >
>> > > > The caller checks for errors, and if no error is returned, it
>> > > > stores the address of the stolen memory. Therefore, we can't
>> > > > return NULL. Since we are handling a case of out-of-bounds, it's
>> > > > appropriate to treat the "lmem_size < dsm_base" case as an error.
>> > >
>> > > which completely invalidates the point of the commit that introduced this
>> > > regression. That was commit was supposed to do "let's continue, just
>> > > disabling stolen".
>> >
>> > Yes, correct, I missed the point while fixing stuff. But patch 2
>> > is still valid.
>>
>> no, it's not. It's introduced by the same commit. I went to look into
>> this exactly because of the second issue: it broke 32b build in xe and
>> all the CI.Hooks in xe are failing.
>
>yes, it's broken because it's using %lli, right? In 32b it should
>be %li.
>
>Patch 2 is replacing %lli with %pa which should fix the 32b
>build.
>
>I'm sending a new series now.

wait... but instead of reverting you are sending a new series changing
the first patch to return NULL. However in your commit message you said
for this version:

	The caller checks for errors, and if no error is returned, it
	stores the address of the stolen memory. Therefore, we can't
	return NULL. Since we are handling a case of out-of-bounds, it's
	appropriate to treat the "lmem_size < dsm_base" case as an error.

	Return -EINVAL embedded in a pointer instead of '0' (or NULL).

	This way, we avoid a potential NULL pointer dereference.

So... what's it?  Can we return NULL or not? Is this tested on that
scenario with with small BAR or does the module
just fail to load later and explode?

Lucas De Marchi

>
>Andi
>
>> Lucas De Marchi
>>
>>
>> >
>> > Thanks,
>> > Andi
