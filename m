Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3FBC9965
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1416E10EA79;
	Thu,  9 Oct 2025 14:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ko8TKkc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4269F10EA79
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760021073; x=1791557073;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h4AEHkZY4wjZP8hGY6LWN2qEZEr+IcFdOtTO5Sfcrow=;
 b=Ko8TKkc437O3NBR2Mget+aKluiiHg4McmV+qtWD8RFosM9WiAteCysQO
 /GtkTwczcOLpq0Vijt4VML8VJoSLper7u8J+3Qo18DQ1sebHT+xI08ujp
 TToPxX1ijaj/CQiGilaAI2VK7s8SZRTV09P+eb/4eDV5W73bG/a3vOZRb
 MUxsP7O5fJx2cua5c+MgzT2z0DYJQnHu7DQGXt+S2p5FAfm8LC1y6lOZK
 kcpRuDa4qH1pQSnJYYvoCvdR+rzPGf2MBb5uk5a9wLjnPxdoxqVNq/DBJ
 rBW+/gTqIdmEOBM9lEBBvpvGBTNFv+dLdPm4/0Wjbdnev7hMgG7hmO1Bi g==;
X-CSE-ConnectionGUID: iJck/XseTiKEr0bGbpjF/Q==
X-CSE-MsgGUID: HhJfEZBhQPW0bDTJh04+hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66061202"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66061202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:44:33 -0700
X-CSE-ConnectionGUID: u0zJOOb4SG6dbbA1mrAPvg==
X-CSE-MsgGUID: lAGcxgQ8Ruudz3pScCFOlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180307947"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:44:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:44:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:44:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L02QAlsH4yMCwbA4ZKIoN+N7qwu4TWF04nEPbLJTrPLd36rMVqSMcKDl3LRV22p9RicPTYZzaNzPHe/+4DO4d4NWYX0fp+8o2wJrU4/hJ6zrvL2oWH0+1Lewc/1td3nWq5jLILHomp2wBeeTx5UuiIlxvWVW945pXISM7cnTQ11bLIDbPqD5Hk8IH7Awl6sAVng/ehFUwReEFKgKMOqqfIiJMioOxj7e/YuUAQy5SFXQZwkwtphrE8IijFW3bKO67NJoukkzB4ApIPIEnX5IZvhhQqgKf7tD5pvJp2ILH5HZi+4BOz1QIcrpL9JxAsBDv7/B+EmRDwzpZnWx8ABW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jP5qeFNuRRP24mMUlmUVE+yWPvTR9zLw2SWnK+5HoY=;
 b=hRDRc5Ce9khi999IqA1C6vaC5qHELDyiTSgVIx6xAPMPGdK98oeQOKAs6IyY7PbTjSNJjMQSmYD/Xg821h0IRplk3IRljNCdvpWbSPgqIR31kDmKCL52raFhSbrLCQTpbbTtslTcIA+G8UX8ek7C6RhcPYcPvYrOOmDaUXnkq5QQH2IRORQDDuMTU+Ly8uqic43HcZRV+72pM5krBnfdkbqLRHuKqqCEXQpI+8HpwMmnQEBZlyqYhnExY9gkeAljV4+wVUZZAmUv0z2h58XYRmHeHj7pSlhww4LoU4iTebZV+nV6V+m9tDaX8Eli9T08S9hp6gGj/CLudxGI7nQ+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB9469.namprd11.prod.outlook.com (2603:10b6:208:5b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:44:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:44:30 +0000
Date: Thu, 9 Oct 2025 10:44:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <matthew.auld@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <matthew.brost@intel.com>,
 <ville.syrjala@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm: Prevent sign extension on hdisplay and vdisplay
Message-ID: <aOfKSSO7EeuZWPYD@intel.com>
References: <20251007153645.90920-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007153645.90920-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ec9dde-1c9b-402f-2294-08de07425a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u95PyvoI+UTK2RKNHGhSLyb694aAkf5PIPm4M1DZs5wLeHoFyDi+Vlo+JS?=
 =?iso-8859-1?Q?RWqPcpO07CwFmQKv2T73StbcGP8Eaj+MljrNpVDaqCbaF7lLqXEUuFZ9ss?=
 =?iso-8859-1?Q?i3OEHRRWzUYdHBCoVIy+WkI4bF6ZHXl26AiTFIPcukXeIz2fhepBNlqI5y?=
 =?iso-8859-1?Q?YvE9CxvJkKSjXbLwmzHlUwKtwqIF13LKAYpNDIukJAmHwtkGvBu2mJ8CQJ?=
 =?iso-8859-1?Q?dk76jgSjybomqaaojrNI5WCSylt7ekiTi+XzQ+CqoKgPjdhCL5fsgr/JSV?=
 =?iso-8859-1?Q?35HJRNN3y2CSSpFu3icG7gqMvfGm3432DISrrkpBdE9ogvtb3KHD1NsqVL?=
 =?iso-8859-1?Q?aIIGFndi14F+OBnK0kFtyLPqPylQkp00+93FdbgRKI6v91dt1OGANyY6XS?=
 =?iso-8859-1?Q?X8RWjhWENLNlWdYZfrU6iqB5U4us4NyKkyXQMyEsDwBWNOzdJwpVAfEyJu?=
 =?iso-8859-1?Q?Re3zeWd5RSJM80tIl1UJvRBdgLWjjdfc5711jcurdQejEJWJ5w/7ZZQv48?=
 =?iso-8859-1?Q?7GygUA4Y6RR3bPnWEyNhSel9RWLXtSCtVwVa1IBXeXqTSIGgx31qHIdpKc?=
 =?iso-8859-1?Q?dKWI55KYQ0QgHcZb3PgYPDeJtCgu9RHlpyE/U3Y4vBvb1sDDIww+uSn2Bf?=
 =?iso-8859-1?Q?K6XJJgFMLkl9SFqD+IuXPqiVkS//EobESoXGIcLv3KYnRDQaRYhwVxwG5U?=
 =?iso-8859-1?Q?KbhRbeO8e0Xv3kUV0k9a/ZgTPmz2801r4IG+0/psa5OQKkNXG7lznbJHec?=
 =?iso-8859-1?Q?W07zzQIEe/t+l0aCycCtdg+hx/bKTGMfZ0162l5KfRIiBaU8PPjLZlKjkc?=
 =?iso-8859-1?Q?d+fGmojQYhUryzNPM2xnw62fIUPHDkQS0qHeoh2ELsYWjNy4QDHxNQNGZn?=
 =?iso-8859-1?Q?Vvje5zSJUQX2w7bednOy0DwDviGp8IYtlHOHtsGhgSLfFgw0Xb1LsJY7iA?=
 =?iso-8859-1?Q?HgpbHK8mzrAV/Cc81f6iD2WhSEui7gY5jpI2jiVr0s5Gbq40hluqiEp76l?=
 =?iso-8859-1?Q?SLiaKfx4VkuxZ7AMRpolT7JHdqLQpLA3vmVoqCCnfRa9/gQdDVhRjxvfjC?=
 =?iso-8859-1?Q?qm8YfiVAl/4IqeatgIsruNdlJ6opM3WMJioVNNxTYbOYUC8E73drJo8yv0?=
 =?iso-8859-1?Q?GeyRRjHkDZr+9fvCWOJwW2QKYABsla+TOkaTqXlaZtAnqbAIwx/JTrsKsE?=
 =?iso-8859-1?Q?7hfZQz8vOlX47+zv5XCG4adl3FMZ63JQe/ZnSCqryBgqzBkz06RVyStlm0?=
 =?iso-8859-1?Q?5PldV+anZN5Yll9kf9ivtEo7uoWDQoGPbbcyqQK9KcrauZ5KoW+SNuM1hS?=
 =?iso-8859-1?Q?Q/1EOiYGnmS3ryOaSBDgdQIH2uBe1idAh45B4Dg+0P0yBMmg8jicddcVGz?=
 =?iso-8859-1?Q?8iGRXl0G6P+Grua117jt0+tHAlc4TR5dhyfg+LvMbnt5DGMxBdl7u75Kxq?=
 =?iso-8859-1?Q?2MACSVcXoHRX61621DF6d7GF00I93Ei+rG6lFX5xPaG4IhBweDMBT25UPd?=
 =?iso-8859-1?Q?dzA+YzT9zG/OzJlYUBTV7m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fJUfVIJeterHWMApu2RJToJKIyRC7M7+QxD54VyslKkrj0kqh0gZsA6YDM?=
 =?iso-8859-1?Q?qFMffY1pNCbZy537ZtW/s1ghsdi9QiaPgVdLSl5VqnTWjDZfowZTMM1W6d?=
 =?iso-8859-1?Q?iFFwwuA52bQw2loV3aQXZSuHp4TKqRJ0EK8rjbRtQpBxXcpmA1ZXtdb+FM?=
 =?iso-8859-1?Q?xITjiYbEyIZ4gpRJJU5ULUjXsjK1Ruf/0j5PeRddR6zTZEHC4aSjKr5sFF?=
 =?iso-8859-1?Q?fqe9zAaxVOArSED4fQLZrfVhTgqP26nZ8jWBX4JVoErEiOk93/8VdPpvhT?=
 =?iso-8859-1?Q?ygz8CQ30mQqNPjkUzSNxRMnPqDgEN/IbMtFXi8crSg59A9JZCgDzlQhqTL?=
 =?iso-8859-1?Q?5xeL0AHA615/TGzyG2I5aQDkJ0mf8iTrtH3HdsgwMTEDlIAma3dAM3rdNv?=
 =?iso-8859-1?Q?m1AzxrXgbt2Y1oDQ0qUiVs0DbbePB7klYgP8QLsev+BLAISRv1btKJUNd8?=
 =?iso-8859-1?Q?Sc3vdD8i/IVf0mzS+MT+8VAn7iLq4GjckX/q8z8fqUnuHff0a84ZldUU4Q?=
 =?iso-8859-1?Q?rLFHA3GcVI2ld14X0XT7/v6Y/j6g1i1dvS4o6pwy72AEzg5lAQhG4Kioqp?=
 =?iso-8859-1?Q?quBhWaNpOJ0eAXJYEbktYZXmgXHSzalbad7i0rSTL+u1bXsVNaH6u4qCxp?=
 =?iso-8859-1?Q?NZyURI3jCpH3AepHpF9mBc014Xu0wL4T+WacrbYJIbjq3hxT+p+lEnYDce?=
 =?iso-8859-1?Q?eKkyBzmoRf96sjch2h/s69R4rA8rqZy14rOyuvQ848Zqw9jF5mYTN7UZ6T?=
 =?iso-8859-1?Q?3sWDI3K7SwjWEO6vGbam+AeNDxcbiTn82bHn58b1XEPH+ruVp7R1LMw4Jc?=
 =?iso-8859-1?Q?CnzoWGbY5Ibi7x43s/dG/DXOtpZQ6Bq3pQr5GyyFBxIjtjIF1cXMd3bMEW?=
 =?iso-8859-1?Q?39ogBNgn1iVpznBdr5Bh543SppgiqkpJY4kqZmwxCIzU1vzcR2tF/HLgxU?=
 =?iso-8859-1?Q?UF17x/yHujw9v85n0XMvt4uk9LpzQ3jgPimOAunH3kRUy+wz9KlA+WLdJS?=
 =?iso-8859-1?Q?bT5ggNUccZu5y0HAx5Qx3GtQkJJgkFjMzoRdjCpoZcQ2i3RKB9+5DWcV1J?=
 =?iso-8859-1?Q?UQYME7p7gndgZWEcA72SdOg5i3/kIb573c1oh2po7jL4t1M8Z+VwMno5je?=
 =?iso-8859-1?Q?lc6VWmNAQY8/PYRt5AwYjP9/wzAheu701xIyGGZRDSSQ1D7sPfIzq5H9da?=
 =?iso-8859-1?Q?MxL8uEfrwxaQZ7o3N93aqbSnOrMIGx9u7K3qN0nDQLIcivhLQJE2YMVivp?=
 =?iso-8859-1?Q?l3+yJnQiW6CIbrXPODs6FoWpcAXVnShpoAG5g/a2TSQEQk3G+g2PPUtKrH?=
 =?iso-8859-1?Q?6NXikMidHOxK2kV59eUzTKvs5rKPiW6DIZoDkdxYGVYJG+3uEUoSiw16YS?=
 =?iso-8859-1?Q?DJnsfspE0Su4Bp9mew2ZCUGTPJTbFoxZ60wBqnDomw/CsUAnSS5Rx4hMNM?=
 =?iso-8859-1?Q?hvixxWkcjKS3Y4IXxQuT9YLd16OnNTgPvMc0cSAKajvQlvL3y/Z1pSI5FK?=
 =?iso-8859-1?Q?l56t0m88OUwBOYMhWX/wZg4wEQ3FrqIw48xWfjirztTFa0Z+45FQk7++Vz?=
 =?iso-8859-1?Q?S0Ic0Y30tna5le14yHCXKjzIb9i6A8eawUK3je+3eb0dRqIHjkw076P8TP?=
 =?iso-8859-1?Q?vF+Byaq2YDLtAMJeyWbriUVb1dEJxm4WPGIyXp86ncrlvAsEr2/xKiXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ec9dde-1c9b-402f-2294-08de07425a54
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:44:30.1555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PyK8mMQRtizau2e368New30z/Y4iv+8Tr2GFcIQmLn9SGhWM3DhHKAXhGP7J2vzdEf/xaWQ69KKowF6gX1fYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9469
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

On Tue, Oct 07, 2025 at 03:36:46PM +0000, Jonathan Cavitt wrote:
> Some functions in drm multiply hdisplay and vdisplay with a third
> factor, which can result in a sign extension according to static
> analysis due to an implicit s32 promotion.  Use a cast to u32 to
> prevent this.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Krzystof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 90760d0ca071..0bec6f66682b 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
>  
>  	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
>  
> -	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
> +	fbsize = (u32)mode->hdisplay * mode->vdisplay * max_bpp;
>  	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
>  
>  	if (fbpages > max_fbpages)
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index e33c78fc8fbd..b488c91c20a5 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  		      const struct drm_simple_display_pipe_funcs *funcs,
>  		      const struct drm_display_mode *mode, unsigned int rotation)
>  {
> -	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
> +	size_t bufsize = (u32)mode->vdisplay * mode->hdisplay * sizeof(u16);


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-misc-next. No, I didn't considered to push it to -fixes
because it is a theoretical case that doesn't occur with real world pixels size.

>  
>  	dbidev->drm.mode_config.preferred_depth = 16;
>  
> -- 
> 2.43.0
> 
