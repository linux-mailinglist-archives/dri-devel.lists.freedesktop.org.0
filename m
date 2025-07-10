Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B143DB0008D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331910E37E;
	Thu, 10 Jul 2025 11:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md9grAm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A707F10E37C;
 Thu, 10 Jul 2025 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752146935; x=1783682935;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=steN7NkzLZeDFlhdRE2j5h/2vX0dUVEIOeC3JfAMZ3Q=;
 b=Md9grAm+F/HLNNc2LgFXcpPOTwLvwa8t9azEajZnAuRcgRb9oFVCBF+j
 oSjY9Xt3vyVAgjRQgPlHgMjLvuHj0UUEv9Tsq57Y0jXs1qayhYin66WIl
 UA3M84J20wQ0Gzq1dZkx2Eqlkf1eHzWmErmRdCOepSdmBvy6yfnQpAjQu
 9q5Mp7EHYLtoUNVw4t6ZsZ/Ph1e7gLs1+qgthC97P4VGlahk43JZtNkjo
 jJ4yfFNElxbZ8fXnRRID65nqaRIYgakM0EglaiXjkMXDciL0DnakkrgJ2
 E/K9agu90DFT4Pi1+vHEi6W801qPjZgNXP7vLqYHXEM8AirbITvBKlaCP g==;
X-CSE-ConnectionGUID: WhEZCJAVS1qPb594tlB5hA==
X-CSE-MsgGUID: /F3UEpgjT0m22dvpGJPs5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65124899"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65124899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:28:54 -0700
X-CSE-ConnectionGUID: EpudOaJORMWfML11lBILTg==
X-CSE-MsgGUID: VbpsMEoOTMCnsslgZexyJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156599682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:28:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 04:28:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 04:28:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 04:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbjVkWOLxn9POqSNA0Om1tORbn62QOsMa7s0T/clBz3bedTkKle97+u9sl7hr/CvFKMDx7K0LkWV3q6ZgWl5qNzsDEXSqSaRmqOzuyxIr/8zz6J0NiqZH4mPfL4SMHuTo4VT70z2jcpVA78qw0NXcwufOC4vgZ5p5WUFGcdNTCYxrZIiHE8vCl9M691Fwn5f0FUKG39uPtdQ1Lzz6yzeYoum65Y/cORkl1SUO4+ODS5nPkFPNT1jwnvT6J4Q2Kn81tDzFEEWjBCGOS1NtWfALJ2LROhS0KTnIc/pAmvBxD/ZV2NxrDhzM2uHiE0M+9CDA4yzfDGRdkmf9EQnl6Cgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ut6HTcivjWjQe723dnFDfE79c+afjNYABrPrQ2Z1vIo=;
 b=oDv+wEZwbnCGWarEt7lI+3oHH5UI1EgClGatwxMjlyn7kue4tfrLbOjavRmA4YsSINsEdeUecMveMHc5qYnqKlQES9d7Biw2LeLW761WzerE8rls9jdS7rezGBjVRdvchDGs6G6yMpQM6o+P0yHcmN1z03tkZhjZ3jDS2THZsN3OaVg4jEJJaCZv8UfMYTh9Kd/CAmDo3rO2Eo3CEfemmKjhogkfQUKRrg2ft8HHDxfYDJKm7UkX/2cP71z2lxHLnfnW364ibzTjeiQNsFoVFBycAmIWbC+LdHNxk1cpY9YUEExDTpbEWfGG1iPeRQvJLrOcBe9I6NRnmp9MVCW2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 11:28:36 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8901.021; Thu, 10 Jul 2025
 11:28:35 +0000
Date: Thu, 10 Jul 2025 14:28:28 +0300
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aG-j3NuvQCwLJKCO@ideak-desk>
References: <20250708212331.112898-1-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708212331.112898-1-imre.deak@intel.com>
X-ClientProxiedBy: DBBPR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::30) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dda9688-9233-449c-b9e1-08ddbfa4e897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kRts9L96viFy+dT6k2i3966jQ+bxZizb+VR4zsA96Pw69OEbG7EMBzQtJj?=
 =?iso-8859-1?Q?zSHbGa19q7rsbxAlHh0dzMs6cBuCnItH8BNQoV2v6cA0bx0BDHA0ecurw4?=
 =?iso-8859-1?Q?0a1WdMJ24Mq24jMEUWiZRgafMZODTXhrks4NPjz55+fLtjBKX/P4mTVGW5?=
 =?iso-8859-1?Q?TTCtGFdAziQy5UqdpBQvcTcaPF5PoP8wM/oRGoaP1vmo8l7AZ3Qoj1k9JR?=
 =?iso-8859-1?Q?gNfN1ncbCZVcJce6GRRKRS5SOu8KKAed8CyudafBFLkm786c0y79Zlgryq?=
 =?iso-8859-1?Q?/Jm+9ilR7+e9db39It4w/FN6HTyDDVtZgn8Jbb6tMrJoXOSg/A7Byamipd?=
 =?iso-8859-1?Q?9w/I8C7Gk0kRBMpAykHztW2CjS8ck3M6v1Vie4otALJiWiTYLYH/ndvfje?=
 =?iso-8859-1?Q?0mXd0QtxhdxhM2gGKlxS11jnH1ulynpC+F/SA3lr5CLVWqmdZdoxwY2PMm?=
 =?iso-8859-1?Q?x/+0IXFiqGWYsnHukVMvbYpct62jnXoWWchposC2PuhjFAIeXrNf0y6wdb?=
 =?iso-8859-1?Q?K+ZC1Z5ZRuRZzqykrZcXSnLdxVqywKJca8nuuKMsrLfpx/Mh2hOfYvXHxc?=
 =?iso-8859-1?Q?BkAYBfC2HQ04tdRDGoudgl5uXqN+55LyKN231Ab9ffJKcxE09A5LjOIvKf?=
 =?iso-8859-1?Q?G51Yb97th5NLdAvHMU0+Q7Uo1nNx9VIWGLpUN8IHm6avNmJydmr+t9dbXG?=
 =?iso-8859-1?Q?6z9GhkU4Fiziw17ejHrc0TVJlZxOhZ6KfgVXZvdyQt83PBiM6zp9Kf07AY?=
 =?iso-8859-1?Q?gG/ScParbKh5cjlhdnBaY4ITZFfDEPh1+2RcekiVOXp+0DSpXAhu4cqCWt?=
 =?iso-8859-1?Q?VR0bj0kJJDGmPSnbZ5dj+RjjRxhjwXnMJ6cen0SmAb/rq3fUg5lcEk4urs?=
 =?iso-8859-1?Q?s7zS1o+tH6Qd4kswF9eFwOlvUHlGsqE9iqBTXHQhxRNY9iGQvN2JB3Q2xJ?=
 =?iso-8859-1?Q?Rg6MKxgWBrkUSEFwNtF/X+LzFrh/H9yIfX5BMAXGiF+rjdqDTWHBJvRWhD?=
 =?iso-8859-1?Q?2V9HniLwLnjWRQdVnRxGFe9wr+W/wG0e5o11oi8fT618WVU90a/cfeMClv?=
 =?iso-8859-1?Q?tQKVLFRcB9nhB9JadmeaqNIUmO7Zuq2YJjYpdmaKekY9gGWdi8r/XFurD2?=
 =?iso-8859-1?Q?M+FuFG2P2QT8MlNthhs9L8FayxI4gwHJiCUlWNRUt77j6b4Ar9N3pOoSP2?=
 =?iso-8859-1?Q?NI/UWnyMhdhzLKQjisZzQb4xl/vyhGn4LJRGTua4NfEKd7mysYPE157UWk?=
 =?iso-8859-1?Q?qu3cDZoMWiCEYH+9r15on5At/ZnYYFLjljZBVVIAlKX6movN2SS5fNprQz?=
 =?iso-8859-1?Q?dfyLpQBmD+NplyvdAYkCxrBxk1B3BlFmxOrZEK3pJiOsXiOLrexTTO09/X?=
 =?iso-8859-1?Q?N5y+cIlz3ljBDFuwrz+6iStbZ6ahSpfz6S6T+w0ZfX83gC3epp6zk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?973MlEB8CtdzRU2MCTn1pNhmknTAdpjF/ujxarC70uFPKz97ljhrOS1GeY?=
 =?iso-8859-1?Q?WjxaHjmq03Hllk5NxelAuIHPxtxFKqBNuGwYrpjRtHa3zzYvjJCJTqbFFM?=
 =?iso-8859-1?Q?gdrRlBH3FswBPgJKu073plHxiXsokpemlbJjr/lVuHNMprw6lEqQfqoys8?=
 =?iso-8859-1?Q?44kFgjrUGM3yC7dxWpQ0pYwvuKBo7OX7LfoI34EZQE+DLro6h/n7HxS3pr?=
 =?iso-8859-1?Q?WJnzHil9YgIMmEfLCHIqTsh2txkkq5wggSOujzxhH+MQiBCUxwCFswqQpL?=
 =?iso-8859-1?Q?xXTXyvEOEjKXSZwYifvXXhevVa8HRJr3r2tgFCoNmSWHj2PzBwIKuygBOB?=
 =?iso-8859-1?Q?gxosUzTrYnPP4Vp23YV/PMVjBGZoHbak6/L6TnhoH+a9xXG4oZVr9Tc0tw?=
 =?iso-8859-1?Q?dBeqI/am1o2M13YIN5r3zG3+xJyDqwrQQpQMLmFgetxfeuCrXeHZXEHfcY?=
 =?iso-8859-1?Q?MxXEW7zV/1+NSabvSr/MGS9Wf+112j/w4eWgSUtk61k3onrcxn2ITJMoEl?=
 =?iso-8859-1?Q?QZKlw7x+qAryO7N2aaJgNtaxUZQzXg5VAmw5IXUFiOGeqkueB+shE08NL/?=
 =?iso-8859-1?Q?keu4BogW7I8u3MXxHUdM6v06sCE9erFoTfxbFw0E+4sZQPzwhw44o3+vkj?=
 =?iso-8859-1?Q?ZMAlnch9GNGw79GeXWfAlsxDbhhYQphzXlvG3x1P92yYcTRd8Ehl4S+Eq7?=
 =?iso-8859-1?Q?58nTlFXo/1QKLJv3CvYRp2MCCR9/wyPc/lGixlAZwOCHjlWSUKr1W5MED/?=
 =?iso-8859-1?Q?uxCESlkkB/LZFi/772x/jEsaDwuAZFjrdes/mJpdcwvTnJeIQwYpcliiNU?=
 =?iso-8859-1?Q?CTu0e3SqwMb7rZRq6r4nt8VIBQz64ATj9pPDx4Czhc6kS73+ia/5o8JDBc?=
 =?iso-8859-1?Q?6SMA3CysMA6Gar3Lvp0Ep3wHyAdygs2ltz0k6WQ1LoztcEtivJzVRXDsyl?=
 =?iso-8859-1?Q?JCrcwlA+PQrOEKDiYgzdsfOf0sMBlzRUGSeBU1/YIYgbsAE+YqxlfkH8Py?=
 =?iso-8859-1?Q?JLMZnDvD//goZIHVG024fnvrKP+Pu5zorJjxh9lkegyAbxbjp5azXROP5v?=
 =?iso-8859-1?Q?k55X0M6nkT8+bGbal2/m7erwx8zC+pfyBqkrmn2uD45XI8ppuGbFU0f819?=
 =?iso-8859-1?Q?KJgRai+OyYd3FBOXK3rcOVzjc4QrCZ4/8PT79G7buvdJwg4BkiKwkJB2Hv?=
 =?iso-8859-1?Q?vHaXQV1Ohp4wmKupkNlJ58Avfd0kqdY0xlAVPH3U8weawc5/BC4WhtQxwq?=
 =?iso-8859-1?Q?UIeIMBKRawTaWPfQCouYnYHsOZrq7q9xmqCvlyf36uP2SO52H7rjsQgjYv?=
 =?iso-8859-1?Q?w9z7O9OV12owNnSMhBo8vig345nOO797HgXtE5jnumjIpRP+MtHwd+SLqD?=
 =?iso-8859-1?Q?md4sYTeAKPCEXQocDQ88gnubVxGacnra46APAbEKFtK25GH52jgRXHSHxl?=
 =?iso-8859-1?Q?i7QTcruYlvE+vAifqgihPmD2Xq/PMqrJMN+73igqPafEgbeshgCowIT7qa?=
 =?iso-8859-1?Q?PJeklpRVLAqEXBF7tNBCOV8D/Nxl1hx+rLF6Dpq/iqELTB8F0IhWTdIk0O?=
 =?iso-8859-1?Q?gv4ykDLjEOwMkMKlhYy7Oj3QRGzFrNPLK/xrG1xmsS3QvsG2yv4jmMi+oH?=
 =?iso-8859-1?Q?4MiWllGVbF5mvI5LBa2zT13ErenJ0S9yUA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dda9688-9233-449c-b9e1-08ddbfa4e897
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 11:28:35.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BKO7UGZ05ghOsWvjPVvpeU6QSPGHyg74wx3wb6d3MEJuOUf5izAUxFnhth9qRgdbNtdt77QJpNlmNOKIP0a7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas, Maxime, Maarten,

the patch this change fixes (commit a40c5d727b81) was merged via
drm-intel and is also part of v6.16-rc4 (there cherry-picked in commit
a3ef3c2da675).

Are you ok with merging this fix via drm-intel as well, so that it could
be still merged to v6.16 before that's released?

Thanks,
Imre

On Wed, Jul 09, 2025 at 12:23:31AM +0300, Imre Deak wrote:
> Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> DPCD probing, since this results in link training failures at least when
> using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> link training). Since accessing DPCD_REV during link training is
> prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> as it falls within the Standard's valid register address range
> (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> training on the above TBT hub.
> 
> However, reading the LANE0_1_STATUS register also has a side-effect at
> least on a Novatek eDP panel, as reported on the Closes: link below,
> resulting in screen flickering on that panel. One clear side-effect when
> doing the 1-byte probe reads from LANE0_1_STATUS during link training
> before reading out the full 6 byte link status starting at the same
> address is that the panel will report the link training as completed
> with voltage swing 0. This is different from the normal, flicker-free
> scenario when no DPCD probing is done, the panel reporting the link
> training complete with voltage swing 2.
> 
> Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> the above side-effect, the panel will link train with voltage swing 2 as
> expected and it will stay flicker-free. This register is also in the
> above valid register range and is unlikely to have a side-effect as that
> of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> CR/EQ sequences and so it may cause a state change in the sink - even if
> inadvertently as I suspect in the case of the above Novatek panel. As
> opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> training sequence (it must be only written once at the beginning of the
> CR/EQ sequences), so it's unlikely to cause any state change in the
> sink.
> 
> As a side-note, this Novatek panel also lacks support for TPS3, while
> claiming support for HBR2, which violates the DP Standard (the Standard
> mandating TPS3 for HBR2).
> 
> Besides the Novatek panel (PSR 1), which this change fixes, I also
> verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> panel as well as on the Intel Barlow Ridge TBT hub.
> 
> Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> i915 and xe drivers keep DPCD probing enabled only for the panel known
> to require this (HP ZR24w), hence those drivers in drm-tip are not
> affected by the above problem.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1c3920297906b..1ecc3df7e3167 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  	int ret;
>  
>  	if (dpcd_access_needs_probe(aux)) {
> -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
>  		if (ret < 0)
>  			return ret;
>  	}
> -- 
> 2.44.2
> 
