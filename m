Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF6B1B864
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6563310E6BB;
	Tue,  5 Aug 2025 16:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu9rq616";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307F810E6BB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754410977; x=1785946977;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7SSx2rGMGwUJTVpnPH/TsfHj8DAGiDNHgNcD9JW95R4=;
 b=Qu9rq6166JRaA/T3WkSL0XYssvG97AWwoFeo6lC4VBnZ/0wpIizpdYpX
 //R/VOhH9kNRMYRAMzH8NdoRY/rnGPsopPR2P1pN1ofC21mTrkidffTy/
 Pxf6Mrn6/gnjcAxTZV/5OsgSyqAk3bM9jqaUwDw7cpV75w2fXxFQ2x6tI
 pavVYvME+oN5TocgKOi0a0swZ1Rxz0DHjZlL65aZvxe9VLTUACFX/UU4n
 1jPcL1N8efimRFAtCGm0WdsugjM2B2+wv8iVnYcaC2lgRV3EByB9FeH/U
 z3W1UhUWGoIgXcbqDprI1BT/zCzS4ITqvPAuisb87OYKXGa8bPh00rI34 Q==;
X-CSE-ConnectionGUID: +ujmtGI6QBOBadF64uaBNw==
X-CSE-MsgGUID: TpJXxJJQTbSNcn6IvQic0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56848034"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56848034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:22:57 -0700
X-CSE-ConnectionGUID: SODfT2JaS4ampi1Ft8iF8g==
X-CSE-MsgGUID: 5l7FjWw7T3OBV6eCJIoXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164061552"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:22:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 09:22:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 09:22:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 09:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7On1rNV4njxLVwKSuD4aDAaCiAFAQqTGoCObRBHkX/rZy3gr5k9TWg+N3HhoGp8CAPeasC6qS7IRqdR+IQEtUQYz7tjZbHjU+R5blxd29s67MAS4mMIrPiF6S9TjhiGdMhEFRHGI03z6nw/ciEahIDAvM/tkUMmenuQsCq4oTMBSGVcVM/ga9CdaDl7BXCMUvKosySw6P0vs7KqVqZLecOdk/ZzoqZBMYZcL9IYP8mQraty4tUWA5FsW2r/p2YP6en6gdV5kAepP7eQSajvFT4/EFKYnaOFWGgYvsndvKIjpePHifVZcq5S/rEZTuS4QHS7AgSig3U/1hhGZqNAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMvE98YGXkbnc8GHD56FDVMeZqpziDPZ4GabnLXnju8=;
 b=RA59rQNTxGekdV5SCJ2kfT+cYa4Abl/b8JIChUiUx7OfMPMyc+JlMyxjbUPDWdFa1uS5wiLwM3VfKI0hh56DTARQ3hHWeiVQGeb2r20nZSakNckFPr/1yLVhP9f3dV5yGIP321nIvFBAeY8cL7Kmrg3RNguP893032u0/J0n4zg3AFw4N8tix3lwy4JLk2g4Ux1fJqQJe+UZ4LriSWLNzmhv0cF/h0Uy1zFSTsdlocBjLFf/DdyqQj/VkbOJh88TjspY/ATD731nujAj5rQblsN2eEhrZt2ba1BdsBWRfeQy7xoBlMpRtNcH6MBDuf2ngnIeXYQxL+g66NQ/Trb9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 16:22:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 16:22:51 +0000
Date: Tue, 5 Aug 2025 19:22:41 +0300
From: Imre Deak <imre.deak@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aJIv0fNF-OFPYwzu@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
 <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
 <aJIaDgAVN8_5TXYu@ideak-desk>
 <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
X-ClientProxiedBy: DB3PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:8:1::25)
 To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af97783-2ab8-4349-a2fb-08ddd43c52f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5B8LrCwo4bEpHkZccc57PWB7iGNgvV+hXPHKxFmYAcAmr9HrAau2r9XBg2?=
 =?iso-8859-1?Q?fIkSWhxGRAxJOuG0arzyjyv1tvHMMljwwUJB6HmmuRRxgY01f2kWjbqwOQ?=
 =?iso-8859-1?Q?Z9074oZECM6lR9meAyeH2h7G990E/Y2fwVjXQKd+JfAxwMK2fckxnk/3RY?=
 =?iso-8859-1?Q?zeGcA2uGxuNCl6fk1zvYKrvOM52L2sN8iVFH9atUh785G9Ukp54Rx9yn0i?=
 =?iso-8859-1?Q?9SoWM9XPjFSLdtIFmbLiDyvYa5Xm/rw4xjccY5IrXwEKF/wuZlopnzQgMn?=
 =?iso-8859-1?Q?h/zPXGQFoJgwz9VVAmiREPVHm/v98R8esy9Xu5n2+It7OJiiMTZfG/eXnm?=
 =?iso-8859-1?Q?epHrwAZtECR7j1AUN3xvfGL6YRUP/4XlgHLzMewf24hNkrRACJRXOJ11Q6?=
 =?iso-8859-1?Q?5x0LuLWupLs2O+LmDIdocTTnaeX1zo2MJ8Z36ouay/1vMCMn+6cxEPsHS1?=
 =?iso-8859-1?Q?7O5uDv1KHD3OigCAU4pjhFhNhtIJYZKeXRs1rVjuRec4eA7Pxku2liIymu?=
 =?iso-8859-1?Q?tKrORKC5gZQg6CRiR0p1sFrdiZXKa3Yujt9j3czTFY1VA7yax5oHd61POd?=
 =?iso-8859-1?Q?o0K7JiPcEYequbpl9ZFhrGpFr4d2o1w31gupckorP2PQ0QEmuSnBliOZpF?=
 =?iso-8859-1?Q?7xFOTPWXysmzG9bxKRUWsqfpO/088cxodKXyb//u66QPYNfmrkMj20Q62E?=
 =?iso-8859-1?Q?bhxauA8pguQE7gaZkSqj+bhoaFx87kjxA4P4+7wFFgunCM2SH0rcQsSrG9?=
 =?iso-8859-1?Q?unTrpE4Zll3tvpyDoSZStmYhKx5AhCc40JQO2k508Vyy1ygwnKaCD5432P?=
 =?iso-8859-1?Q?CXsGGc+1K90ffoNoH75H2J3/UNEshRATcO8/nNYQPLFtH3sgG59bY3s+8P?=
 =?iso-8859-1?Q?pq6FXnzJmi1FUXswJc+1mEud/csamodLu846YyiGNLxrcvF4RSO8UK+2Cu?=
 =?iso-8859-1?Q?SI6v2xxsVtzaeQiecmCRS5EQMwOz97d97xzKVuAWPukTM8YMvwNAuyWbw1?=
 =?iso-8859-1?Q?KZPQoOBSlh86yR3KUSTQRk77UN6CsO7iOJHVMg4KW8sT5VSXSrLD9qxgZs?=
 =?iso-8859-1?Q?bxHNbCdPv0n+RnizpD7+b5RU+6tKQk9A9Aq5fYgojDDfIobx7gh0IyC4U1?=
 =?iso-8859-1?Q?HkI+4TRCm7SLvPIHus/nCB5xWCuUI38E8kIharbA2mBIVdicg/UIhRnwg2?=
 =?iso-8859-1?Q?MQnH7GXMDBPMCOhtRkJbs/niMQ4lbm1OD3Fj8RzBBNyBhsDsWJP4Ay1MGK?=
 =?iso-8859-1?Q?5eHhthqQXN2y4D/zVlcT5yoH2uvSK5RsmJzCFDYGJZaG4NLTMa6OI7nNEX?=
 =?iso-8859-1?Q?+M6V48p5fHQ8TYVtEtyg6EIualQ0SFV/XS8KR/j8m7PenOMVewMK7qmlSq?=
 =?iso-8859-1?Q?fV2rKfjLUmNAGOdkx1xkblrYZS0RKO3TSkPqKhfELFXgAfB4nZgvLsIHr9?=
 =?iso-8859-1?Q?pD9SuTwFL/lV9vuvS3YYHZJrma5OkltFU1ouE8CSBoTBiIX852pn/g/ekN?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AanyG+JgXrkc8Y+xQI1NwbTZhT4VuTdp1aNkFUtRQQQKbNlOFw+xhwzq1L?=
 =?iso-8859-1?Q?E76mKs2UiiIxs1uZUoHOOJxm/ng9MKnm4aCgqluCNK42/r4iL3Zlw8mnvf?=
 =?iso-8859-1?Q?LNSj7n7DnP7JHwCFJ7NTHZrbEW56mgtlzRGQczNBqK6RFzL28oPlTE6UYs?=
 =?iso-8859-1?Q?gTvGDsTbCxLwhiU+evdLK4eD5xVaIx7U2mV+i7QeGB8osxjSJ5rQCH7QqO?=
 =?iso-8859-1?Q?8u3ANMc5kT2AH6GkFwo/EWNJDACtSD3dKLNXOjZy+iAo5qWHGwBa/Fv0UN?=
 =?iso-8859-1?Q?dz1SqEYTp7wBFhFfL+lf1XxX3L4qZ8xTXXf5hK17Mk29XKW0l1YyamFhYN?=
 =?iso-8859-1?Q?T1P7b/z2RyXLHK1h3MqGZotA3xWeQU0RmfFWhml71EsSC9Gpx+1QlDQlol?=
 =?iso-8859-1?Q?XVyU9n+ehV9fpFUVYQ5i3daONxCSKKExy8oDNPTpwv7zlNFXb9cZILoGDg?=
 =?iso-8859-1?Q?ZTpcnL6dqljVH1E6dfJ7WE4/gehuJY60NezcfkdylGX35fyA21/DjXZjjp?=
 =?iso-8859-1?Q?3NVABD8AatkH8lj47Rxiil8IrNTSpbM40iNJrb/2oUvlzCGNa3wu69uDvC?=
 =?iso-8859-1?Q?5uaMeUD3lgMDDHwDpWOjiUmlJFWPrUS5sDC/gajanBeQtDTAE8XjFGK6x7?=
 =?iso-8859-1?Q?jStAnmO3xC7p8nSMe0Cq1jIemSDAh/wxiNj93bFMqbXXiKj5ix08cAfSXc?=
 =?iso-8859-1?Q?YyXB/QcEHZBfDj646P5vPd8iRFT1XFs+NLU0rLNH5Df6HeVpEB99ZSz134?=
 =?iso-8859-1?Q?o1zC9HhkkSmHSE87uNYnFEy0E78DaAfCOEG6ZAq9mEeFJsGgUwKN9HFYVt?=
 =?iso-8859-1?Q?KDTrr9sTfKyDjGmkQTU+DFOW90a4/B+vOLdJwBXJwvBjzPoxhiYVaf+fTL?=
 =?iso-8859-1?Q?oNbYA/XO7KMmTxwvWx4Mvpx6LoGmh/odaUVNnz+cYqQWI1cjWECnqTB4a5?=
 =?iso-8859-1?Q?4gpBdutHL9B6ZD+XaswQz5E9PHIVb67Ti5y12eDg/QU8dQN/wSCdKoE4bh?=
 =?iso-8859-1?Q?MKKJp7ieqcXcvVtgNYMITj7AIHLahLkokKmwQeS5SFSd5RHnf9SD2U1HnK?=
 =?iso-8859-1?Q?Vi02h0Nqi7/OrL95ztQ9L810Dp7NzUFNc2WYLTZYwJ2nRDXMy+Y83uWX3B?=
 =?iso-8859-1?Q?Ub2NksaIqu6/x3tNY/hS75sKnQr1IMckhpOt2eYeUiCax0900MRy3+mc2q?=
 =?iso-8859-1?Q?VXZ8f0OEbl6o823VnkBTKcajrE9p4OFtPt3pHtZBA085vMVcLtowkc7Gs8?=
 =?iso-8859-1?Q?vPs2D8cNzWp8wrBODMdx89rTRvhWzgC35Hvd12P3K2WTbn834UbRXss/op?=
 =?iso-8859-1?Q?BY6KxI0KqafpUg4t7ItL0dS7QKRv6V3hL4sqr6Y2JQTwhHeudZ7DcBNpq/?=
 =?iso-8859-1?Q?jJMHQ20gY4/1YYAo93vWZURjV+oNgfpzAaczJFbgObFf0wBC6MjJ3qbq0+?=
 =?iso-8859-1?Q?g8Zxbvfi3X8qfpxkA15hdykuRV7UsyEQ+Sx3J8GTWVghonHCR2iLs0mj0x?=
 =?iso-8859-1?Q?EAX0RWEQR5zC2clWNtPr0Za219uPESMANgrisNkkfT9TxkCmz9m8Mt35X/?=
 =?iso-8859-1?Q?UwdcX/NJlqsRy+OvEdzscHIsX/KNhshhu3OtwVpdg3m3UzOOQY+6BEgkqN?=
 =?iso-8859-1?Q?exOIvEsZJkgWAeTcmzdsSChlmYZZvz1l7KLMLh2Cvx+4O7tlR0CGkFtxX3?=
 =?iso-8859-1?Q?a0mPuRgIBzJko9KTkdGOBU62GIkyaTSNte5TQAih?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af97783-2ab8-4349-a2fb-08ddd43c52f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 16:22:51.3183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lMsh+2DY0noKTIvQrGf9LCZMDAWujnzW1QQ7sD3aAClP/aeqsg1OtYXJir1YwQtdBElOVsVeRtTBvC020c0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
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

On Tue, Aug 05, 2025 at 06:43:04PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 05/08/2025 17:49, Imre Deak wrote:
> > Hi Tomi,
> > 
> > On Tue, Aug 05, 2025 at 02:53:36PM +0300, Tomi Valkeinen wrote:
> >> Hi Imre,
> >>
> >> On 28/07/2025 13:16, Imre Deak wrote:
> >>> Plumb the format info from .fb_create() all the way to
> >>> drm_helper_mode_fill_fb_struct() to avoid the redundant
> >>> lookup.
> >>>
> >>> For the fbdev case a manual drm_get_format_info() lookup
> >>> is needed.
> >>>
> >>> The patch is based on the driver parts of the patchset at Link:
> >>> below, which missed converting the omap driver.
> >>>
> >>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Maxime Ripard <mripard@kernel.org>
> >>> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> >>> Reported-by: Mark Brown <broonie@kernel.org>
> >>> Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
> >>> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> >>> Signed-off-by: Imre Deak <imre.deak@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
> >>>  drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
> >>>  drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
> >>>  3 files changed, 16 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> >>> index 30c81e2e5d6b3..bb3105556f193 100644
> >>> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> >>> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> >>> @@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >>>  		}
> >>>  	}
> >>>  
> >>> -	fb = omap_framebuffer_init(dev, mode_cmd, bos);
> >>> +	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
> >>>  	if (IS_ERR(fb))
> >>>  		goto error;
> >>>  
> >>> @@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >>>  }
> >>>  
> >>>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>> +		const struct drm_format_info *info,
> >>>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
> >>>  {
> >>> -	const struct drm_format_info *format = NULL;
> >>>  	struct omap_framebuffer *omap_fb = NULL;
> >>>  	struct drm_framebuffer *fb = NULL;
> >>>  	unsigned int pitch = mode_cmd->pitches[0];
> >>> @@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
> >>>  			(char *)&mode_cmd->pixel_format);
> >>>  
> >>> -	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> >>> -				     mode_cmd->modifier[0]);
> >>> -
> >>>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> >>>  		if (formats[i] == mode_cmd->pixel_format)
> >>>  			break;
> >>>  	}
> >>>  
> >>> -	if (!format || i == ARRAY_SIZE(formats)) {
> >>> +	if (i == ARRAY_SIZE(formats)) {
> >>>  		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
> >>>  			(char *)&mode_cmd->pixel_format);
> >>>  		ret = -EINVAL;
> >>> @@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>  	}
> >>>  
> >>>  	fb = &omap_fb->base;
> >>> -	omap_fb->format = format;
> >>> +	omap_fb->format = info;
> >>>  	mutex_init(&omap_fb->lock);
> >>>  
> >>>  	/*
> >>> @@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>  	 * that the two planes of multiplane formats need the same number of
> >>>  	 * bytes per pixel.
> >>>  	 */
> >>> -	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> >>> +	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> >>>  		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
> >>>  		ret = -EINVAL;
> >>>  		goto fail;
> >>>  	}
> >>>  
> >>> -	if (pitch % format->cpp[0]) {
> >>> +	if (pitch % info->cpp[0]) {
> >>>  		dev_dbg(dev->dev,
> >>>  			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
> >>> -			pitch, format->cpp[0]);
> >>> +			pitch, info->cpp[0]);
> >>>  		ret = -EINVAL;
> >>>  		goto fail;
> >>>  	}
> >>>  
> >>> -	for (i = 0; i < format->num_planes; i++) {
> >>> +	for (i = 0; i < info->num_planes; i++) {
> >>>  		struct plane *plane = &omap_fb->planes[i];
> >>> -		unsigned int vsub = i == 0 ? 1 : format->vsub;
> >>> +		unsigned int vsub = i == 0 ? 1 : info->vsub;
> >>>  		unsigned int size;
> >>>  
> >>>  		size = pitch * mode_cmd->height / vsub;
> >>> @@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>>  		plane->dma_addr  = 0;
> >>>  	}
> >>>  
> >>> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> >>> +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
> >>
> >> Isn't the fix really a one-liner, just passing "format" here instead of
> >> NULL?
> > 
> > That would fix the issue of fb->format being initialized to NULL yes.
> > 
> > However, I think the change should be in sync with the conversion of the
> > rest of the drivers in patchset [1]. IOW, what this patch is meant to
> > fix is that [1] missed converting the OMAP driver similarly to the other
> > drivers.
> > 
> > I think the change is equivalent to the above one-liner you suggest with
> > the following differences:
> > 
> > - omap_framebuffer_init() uses the drm_format_info passed down from either
> >   drm_internal_framebuffer_create(), or omap_fbdev_driver_fbdev_probe().
> >   In both cases the passed down format info matches what
> >   omap_framebuffer_init() would look up again.
> > 
> > - Skip the format == NULL check. format can't be NULL in any case, since
> >   that would have emitted a WARN already in drm_get_format_info() ->
> >   drm_format_info().
> > 
> > [1] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> 
> Yep, I have no issue with the patch as such. But if it's a fix, going
> into an rc, I think it's better if it's as small as possible, and do the
> cleanups/refactorings as a non-fix later.
> 
> The patch description here sounds more like it's just refactoring the
> code a bit, but if I understand correctly, it's fixing an issue that
> cause a WARN?

Yes, the patch description should've mentioned that it fixes the
!fb->format WARN in drm_framebuffer_init() and the resulting failure to
create the framebuffer for fbdev and other FB users. I will add this.

> So... Either we could 1) split the patch, have the WARN fix as a fix
> patch to the current rc, and the rest later in the next merge window, or
> 2) if you want to keep this as a single patch, I think it makes sense to
> change the subject and description to highlight the fix aspect.

Yes, the patch should go to 6.17-rc1, but I would prefer 2) above, since
patchset [1] requiring it was also added in the same -rc1 and this patch
has been also tested at least by the bug reporter.

> I think my comments apply to all patches in this series, as they're
> essentially doing the same thing...

I can also amend the commit log for the other patches according to the
above.

>  Tomi
> 
> >>  Tomi
> >>
> >>>  
> >>>  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
> >>> index 0873f953cf1d1..e6010302a22bd 100644
> >>> --- a/drivers/gpu/drm/omapdrm/omap_fb.h
> >>> +++ b/drivers/gpu/drm/omapdrm/omap_fb.h
> >>> @@ -13,6 +13,7 @@ struct drm_connector;
> >>>  struct drm_device;
> >>>  struct drm_file;
> >>>  struct drm_framebuffer;
> >>> +struct drm_format_info;
> >>>  struct drm_gem_object;
> >>>  struct drm_mode_fb_cmd2;
> >>>  struct drm_plane_state;
> >>> @@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >>>  		struct drm_file *file, const struct drm_format_info *info,
> >>>  		const struct drm_mode_fb_cmd2 *mode_cmd);
> >>>  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >>> +		const struct drm_format_info *info,
> >>>  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
> >>>  int omap_framebuffer_pin(struct drm_framebuffer *fb);
> >>>  void omap_framebuffer_unpin(struct drm_framebuffer *fb);
> >>> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> >>> index 7b63968906817..948af7ec1130b 100644
> >>> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> >>> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> >>> @@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> >>>  		goto fail;
> >>>  	}
> >>>  
> >>> -	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
> >>> +	fb = omap_framebuffer_init(dev,
> >>> +				   drm_get_format_info(dev, mode_cmd.pixel_format,
> >>> +						       mode_cmd.modifier[0]),
> >>> +				   &mode_cmd, &bo);
> >>>  	if (IS_ERR(fb)) {
> >>>  		dev_err(dev->dev, "failed to allocate fb\n");
> >>>  		/* note: if fb creation failed, we can't rely on fb destroy
> >>
> 
