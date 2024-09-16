Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7038F97A71C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 20:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651E610E3C0;
	Mon, 16 Sep 2024 18:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU31LBsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60A810E068;
 Mon, 16 Sep 2024 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726509663; x=1758045663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9U7ia+eQBxsLmzDmiJScwaH7E6d86QbPC4eqZLEvpkc=;
 b=LU31LBsbyq9BbTIVMMquPf2Fpb1Xm1AQNHuhQgehn0RswANFekTRzEij
 LoGnLVEI+xmp/Sf0d/cZsNSi412erf9VqC5O4r0PAwXsCggVwnFGLYVGN
 xtxYZnV/+nr9iOadbNivY9JfiMqVDcrd+CRuQcbDM4FM3zFFR/6/JMTrc
 tga87IKUvLMD0bjpTiKglKZqxAjdPg89v9G/oZUruO5C7aeylJUg7PZbz
 gWlSnIigVoN5lHfKPQhz0XVYjil8JUq5e2cJMsVG1zPim7shh9lUT2FQq
 mxvyaP113nlV/KQ/2yfFhilSG6HYkzhiqH39+F6OvGT1eISc70b1GxyAv A==;
X-CSE-ConnectionGUID: FN/9w3w9RmK/5EM8omzlHw==
X-CSE-MsgGUID: d28eaOUTT8eSTXEFyZhtfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25444061"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25444061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 11:01:03 -0700
X-CSE-ConnectionGUID: 8r8GJhgRTU6xM7z49mnlaA==
X-CSE-MsgGUID: WH1/XgQWTpqilc7JrEI2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68565315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 11:01:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:01:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:01:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 11:01:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 11:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7V2YVcNLCIPk/M6Jfmg4+AGuAUiVa+rgemBKd52y31R+fG9XtTdotNVJWSmG0kEert8RNr6XklJwhOtzuNUAcsH7h+I/jcMTFgEwsspnQBMAk6qpJMi1rtkh1iaQuV+SPupImgjyXUqItlCTbmRfJaetOhOoOBcy5S+BIWc4m5HmRfpK3Y3mzXxfOZq8yu4qY6M7zY/cIaJeFzaLXogRhwCAE3yDOk2QnzEo4X8HJFeayHcAUEtoQ6dqG5vVfW8nq7wMR1jyxx6ZuX9jy9oRBbxzYrBcCscjJXLeoIXK5bkMLZf2MsdJv+8/wOpkBlIT+bnk8XKdkktwGNhgs5O2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8QXprfbP3Oib8B/1A4RLUQyTdyeFPZFTL2DZtF90Bs=;
 b=UI64TFaXwOuWSXhJVvGM9epBl10JMLurHn3MhuWz5+EgeyKVEXiXwYXV7UsZ91ikCnFHaQha7HK+cZvR1CI/17rA3IS1r5Ll9M0LW/fIPfixVfiYbe1lxpdf3IHpDml6iEkiXEKqpOKHYaHq+CUGBT0vJAAmKy6mUateB0Cdud+TrxWxfnpL8edv3qSfcA2J9hxpn83kAc8J0aINMpt2tZoE/GUCm90REVd08RroBz+iL4lSOHumYcbAUaCWLl7Yd9werxiz1ISm9wYqLamwsUW+eJylSRLQtpIu3Q+c5nSjjNygv+/9JL/dpLhTRoUT5tcNLyf6ZuVHdoUpw5CDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Mon, 16 Sep
 2024 18:00:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 18:00:56 +0000
Date: Mon, 16 Sep 2024 14:00:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Mark Brown <broonie@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tomas Winkler <tomas.winkler@intel.com>, Vitaly Lubart
 <vitaly.lubart@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-spi@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 07/12] spi: intel-dg: wake card on operations
Message-ID: <ZuhyUjDTiMeHSCKO@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-8-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-8-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfe0df3-9304-430a-f5be-08dcd679835d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+nYtWOdJX+M3ZJbplBWG3u646gyRtkA6XClj23Aoy7MW+jzFu7oUpE9JBAAk?=
 =?us-ascii?Q?Stwxt3JPLB/ZELLCcUNaHygX4yze7FusLM8Ol421p7LdDyKnO6+F4NZfclKR?=
 =?us-ascii?Q?KpoSNGGmXwQivZzjTbhWv1aVs6BEetqUV/NSpk03J281M+YqEbVqjMuVKJZJ?=
 =?us-ascii?Q?En5ds/sClFloqA4XcLjhrwo/rQ8I5ufkE5T3TKibLKs2wb9ZmVNahryX6wvZ?=
 =?us-ascii?Q?E/ww4x2JGCOCuTodMdAnzZrFC4wAJxeLFCtTNh0dE0AMQrQRG7ifVc6u+DoY?=
 =?us-ascii?Q?Z0mK/Iqwxz5MhikXDPW+c+qpuw0yF/Djq0IxsYWD3+3pobXIhbqYAxUsot0T?=
 =?us-ascii?Q?89ytYepupXOw8aiqInqeywuqxmhgZw4mOaaR9bTG/1u+ebPO3Bg4fpjmA7YR?=
 =?us-ascii?Q?Duvt+1CPA+SoVrGeFQ9bGsb9Ri4/6EJEqdbkEmk2MQiufIvRhYy0D+/Xrten?=
 =?us-ascii?Q?WMUC8N2EXjXaCRetyyYRtW0+LQjmfj29IAO/dEuYl6dxUMraUmIDHnhGmE/j?=
 =?us-ascii?Q?YEqoorcOC4LZsKd01xIYxSCHLolpE+eWcjMuBfC5wWYPifCOhkOF6wE6s5XE?=
 =?us-ascii?Q?MPfGc3xBNxPVJPosRRfrFv0LfB09rwFkd/B7OxaJj9PIz4GvDPV13CQzskgN?=
 =?us-ascii?Q?f6xYy921zTwZS3VU1JI/yAjVeFC3O07XNKZFLPrcGDPxX5kQeDL9Bl0/T8vL?=
 =?us-ascii?Q?a2r3nOvJ7agnCobueeqFSQQkC6QYm/gIogshQlbRozgHurVQlebiSiVPbgor?=
 =?us-ascii?Q?Q/knpivPs6+eQAdGlpXbQ65DkguXJqCFAjxuLDvIEKk5miszZyZNH/Xbyq69?=
 =?us-ascii?Q?jtid94e2Mi/1ZaUE04W08vftPs6Z4uC0/HiW/hbrmIXAu75oDKrbH8bzdwIM?=
 =?us-ascii?Q?OOGuAFJ6S+O6HHyNYcQwVbLWkpMpZ2Fp19+BAXxzAGfiOAECqB3RNhSMIsvs?=
 =?us-ascii?Q?pPdMT/WqO2ggrmES2q89HGzRbuec955j+gGBoUAG1x26goHhcqxDu3WnK4bm?=
 =?us-ascii?Q?HQbe7Kd86dUybMd2MdjPwsO7P2ICRmXL94zlP0HzErUAZHjaC5A9Y1/GeftL?=
 =?us-ascii?Q?t/7SE2wiW12APbkhZupl16rdZw3ZWNc/QC1HaAhh6abIDvtg8b6BOs/1H3hS?=
 =?us-ascii?Q?d+HcPyp6cnU+dj42DNDT2ekO2h3WjyOMW/Uyf5/2Zg8n/ryQ4HUENuWpGj1v?=
 =?us-ascii?Q?hTUCE3Osz+7PAhIZ19DkNm1qmmemI6LKMe8fczwW6qTEZ5kLaykeiLKlwGK4?=
 =?us-ascii?Q?whU3KDrrMbVt09ebB1oI+QyY+6/Wt0OMeinA+MAju64wF2mmLFd0nZrl07He?=
 =?us-ascii?Q?YXn7J9kWABH9eQ4YcJNHAC6/79xq9y7Fj6hgmMQGsAtGfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PYabREYLUiYKQ5bZAl5YyX9DJES2eQzr42NKjMjMz1DikIoToWh3OaSVgFjc?=
 =?us-ascii?Q?gVNwTc/c8Pt7poS59Xn/OSoVCDAxxv9xqmuaeQ/Y4cLIz7GAzyRF6s/BRVpQ?=
 =?us-ascii?Q?1DBhfc/RfgWT4xq54sy7ErQ4/gyI17BEpWx/bfjFpXPS5CxGNw8KdQYbHTpo?=
 =?us-ascii?Q?Qv3zxAQ7qQBqcZF7O0T7u2He2YPW9hFRv/h+r6rkdtqIdvYI4l0pelfkvS01?=
 =?us-ascii?Q?MA7RdRoLycgNw0SLmgiaharPOSt8s1AArnpuio3aXs2v0gmNB6/muTAjarwB?=
 =?us-ascii?Q?2GgpkMg8A4eXHKLo4dmBrz+rgzXVG6syRfZrTsnF50dFqyPlIJHURAaTZ1u4?=
 =?us-ascii?Q?OReO0DAoF3SO/oITlXfkcjenCT3b6Sj6Dy/ntIFEkPm/4a0HFwOeE1cRW+3L?=
 =?us-ascii?Q?Gr+XVQfFd1+K17OL4k9JkbjxUwifu4Q716XbTVYjQlseu/uPaaK4uXh+SmOT?=
 =?us-ascii?Q?mGGR4yc/kDzbih6ecYohqKj9i6CNbBURaA3KzhKsYwtyHfas9u5vvNPqI9TC?=
 =?us-ascii?Q?fLMftKPHtrFD4ujnHIUCMSRUKwNpXLoi2D8zKM651ZShNfZdNRoCKtP7qfm3?=
 =?us-ascii?Q?36WaIEPazVl2xHhSTOshKC8e4myQIl5rqoyf+luBl2EhizFDTMEXuTweDcE8?=
 =?us-ascii?Q?HhHN/A4XqPMCAWAXSHT5IfCDNdPnwRixlVtIiHsQRsF4ddq3O4RRMUfDbsK9?=
 =?us-ascii?Q?PYxaYx1Flh/nii2iDNj0lKMYpGrSIgCI5ZFJWJy7W5hWizvgsetR4ys3FxzD?=
 =?us-ascii?Q?TvFkQJIOQc1hsnkjxgNLy0EcTWH2eYljEGO8CIDJdUtZqM2K1XXZx0p0AOpU?=
 =?us-ascii?Q?GzF6C6so+77r68Ju+m6tQk7tEuLSMmrw4MwRfaoONcwfblwYebX4q4sRdzc+?=
 =?us-ascii?Q?iCvRsPKuCWa0+JjbZpopDUNIXvwUIvHuZEVlMYsMLHznE6lISiYpQ+RKD1IY?=
 =?us-ascii?Q?0f925q+GT7ig0y9X5rTvNFkX20+6K3edouqxfLIauN6w5LMK2p8UmuNJec3j?=
 =?us-ascii?Q?nF/Lgl6T8cYfb6cZVNlq1oRe566EocIWBnAiXJLqepu92kI2jKl8LOoaBIX+?=
 =?us-ascii?Q?nyNPyTJIue9EaN4CLayGbya7mnpY+mmbGoEkrDm+fNs8alU5eIJNsJK3XICT?=
 =?us-ascii?Q?I4Bmg3JE8EcS4Uyk71yWTIvKikm2+F84b8AQmLiDVBP9/jUzkUJzSb0UK89R?=
 =?us-ascii?Q?TKvhKqtR0dzYaXeyyx/P2LI+WVMY6bOU1AaTIUFvuN+uH4pVNiiyS4JweQUI?=
 =?us-ascii?Q?LCjaS/jvK6gxgT7Dvfl5mJnjdkZgEsRJYUmPbSEYHPXI3M+VYFbQqHqwwchY?=
 =?us-ascii?Q?lcO+IpZH/rrkwTKTx480P6Af4YJHdcU7G7dgo166BVp3fy+itGiLvZINAs4r?=
 =?us-ascii?Q?qQLfEtyiPl6wUaC2APFtRpCRD3oIci414brgQdJWSPSppr8pk0T+xmY9jCJL?=
 =?us-ascii?Q?iyuVdTSbIkMnivE9DDC4mT01yj5uV3BEJ9xNTLV+NhugL8Fh1ZrZQSJzMKpx?=
 =?us-ascii?Q?+1NxQTvHqq1JRhm0q5c3A+BwHDJ9bLCAbLRoxOnFqI0zyVUs8b4JAQA4UySd?=
 =?us-ascii?Q?HIl1xL/bsYT8g7Mo2sdk43VLrlvrXGHDgtBsKTaZXmn+dB8rlY+Q/kYidLmm?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfe0df3-9304-430a-f5be-08dcd679835d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 18:00:56.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R001q/kU0GXzYoeYjzfMgdj9c4cLtExd1GzODtPImhK7inhpVqfoMQ7xXSJwZ99AFvug0rioeM7Z9y2lJH9oWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

On Mon, Sep 16, 2024 at 04:49:23PM +0300, Alexander Usyskin wrote:
> Enable runtime PM in spi driver to notify graphics driver that
> whole card should be kept awake while spi operations are
> performed through this driver.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/spi/spi-intel-dg.c | 44 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
> index c76b0a70f8d8..a14fc3190520 100644
> --- a/drivers/spi/spi-intel-dg.c
> +++ b/drivers/spi/spi-intel-dg.c
> @@ -12,11 +12,14 @@
>  #include <linux/module.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> +#define INTEL_DG_SPI_RPM_TIMEOUT 500
> +
>  struct intel_dg_spi {
>  	struct kref refcnt;
>  	struct mtd_info mtd;
> @@ -471,6 +474,12 @@ static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
>  	total_len = info->len;
>  	addr = info->addr;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);

If I understood correctly,
this is the device = &aux_dev->dev;
which is the drm->pdev.dev
?

This is to ensure that the graphics driver is not going to runtime suspend,
right?

> +		return ret;
> +	}
> +
>  	mutex_lock(&spi->lock);
>  
>  	while (total_len > 0) {
> @@ -512,6 +521,8 @@ static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
>  
>  out:
>  	mutex_unlock(&spi->lock);
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>  	return ret;
>  }
>  
> @@ -545,6 +556,12 @@ static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if (len > spi->regions[idx].size - from)
>  		len = spi->regions[idx].size - from;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	mutex_lock(&spi->lock);
>  
>  	ret = spi_read(spi, region, from, len, buf);
> @@ -557,6 +574,8 @@ static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	*retlen = ret;
>  
>  	mutex_unlock(&spi->lock);
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>  	return 0;
>  }
>  
> @@ -590,6 +609,12 @@ static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (len > spi->regions[idx].size - to)
>  		len = spi->regions[idx].size - to;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	mutex_lock(&spi->lock);
>  
>  	ret = spi_write(spi, region, to, len, buf);
> @@ -602,6 +627,8 @@ static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	*retlen = ret;
>  
>  	mutex_unlock(&spi->lock);
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
>  	return 0;
>  }
>  
> @@ -747,6 +774,17 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
>  		}
>  	}
>  
> +	pm_runtime_enable(device);
> +
> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_SPI_RPM_TIMEOUT);
> +	pm_runtime_use_autosuspend(device);

If the above assumption is right, then I don't believe you
should change the device settings in here.

But if you tell me that this 'device' is the spi one, and not
the graphics dgfx, then I believe this code would be missing
the runtime pm suspend/resume functions.

> +
> +	ret = pm_runtime_resume_and_get(device);
> +	if (ret < 0) {
> +		dev_err(device, "rpm: get failed %d\n", ret);
> +		goto err_norpm;
> +	}
> +
>  	spi->base = devm_ioremap_resource(device, &ispi->bar);
>  	if (IS_ERR(spi->base)) {
>  		dev_err(device, "mmio not mapped\n");
> @@ -769,9 +807,13 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
>  
>  	dev_set_drvdata(&aux_dev->dev, spi);
>  
> +	pm_runtime_put(device);
>  	return 0;
>  
>  err:
> +	pm_runtime_put(device);
> +err_norpm:
> +	pm_runtime_disable(device);
>  	kref_put(&spi->refcnt, intel_dg_spi_release);
>  	return ret;
>  }
> @@ -783,6 +825,8 @@ static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
>  	if (!spi)
>  		return;
>  
> +	pm_runtime_disable(&aux_dev->dev);
> +
>  	mtd_device_unregister(&spi->mtd);
>  
>  	dev_set_drvdata(&aux_dev->dev, NULL);
> -- 
> 2.34.1
> 
