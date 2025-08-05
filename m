Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33181B1B6DF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E8810E6A8;
	Tue,  5 Aug 2025 14:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMIkjHAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F5410E6A5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754405417; x=1785941417;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=73kq7tG1wt59+fmB/MSOwSdBnlpi+XNkxoY8eYm9TcI=;
 b=nMIkjHAZEEV55Iza1QsPY3TNsKBQHr6ZGqUgCsOXNkxoQ6ap0W6Y9BDY
 AZ39v9YDOQA06K7dOmNyE58vTcIpECxXOulYDBjnx7eKqVm/3KW2mqmgm
 LTfuaAc2EeD9HpcVYP+I6q8QKJPEi1bogdT9wSI4It3o/Iro089TvId1E
 5gmoSJ+9fm9ltK+7VSPnWmsqfTtOXjldeM/9DAsf2+ER2nlke1zAw5RHC
 Ik5pis3FoUoUx7DM1uGqXcTjlvsowHqCrglp4uA/2GwbKrqvurLn0lwFW
 GWOAz7z5NFbKwIkDbpWBCsUMyeZRvV6E2vNFdFoPK1CvMhvpziKI9ypCU g==;
X-CSE-ConnectionGUID: 5dmE2eI1R/axPlgox2wrbQ==
X-CSE-MsgGUID: pNir6wZnSe+atkYmfktiDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56838011"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56838011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:50:16 -0700
X-CSE-ConnectionGUID: StZvaDvVTjiESY7SGgZD8g==
X-CSE-MsgGUID: tkRflpL/QtiBCBoS7ZKD0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164837169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:50:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:50:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 07:50:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtFJjB9PXXeUKf3sHh1KVIrcqhaRMBhGsNsxHrKJ/v99bOTqWPxCzyPFiZuc8cipy7mglOdx51YV0ZMzklw7yPamKSLG10T2gFw9nZtCfQ+847sR94wEmDdnmQErHFUbSFZpmix142Ci1DV201KQ8/0rQ0fj1dV40tHHYga8eLq03drM+bVRrKLyZbPW1Z1kTEW7V/dZ/U69TlIGB3n3ubJnk9OC0vmxBeA2phgyoTWRKFNHOW1VcH8jNmjOSTOexq7ip6TMoXueFjmy87kNpqJaWXze6SF1YfAqFid+AA68WYLMhUtVswUtL6kV8SYHtja8lnRvEZVoLrT4sITIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJfr/3dtpZkNF/AsJ5wN9WMujIiipuz9RsaoJnAhQ/k=;
 b=pS8kXn4N8NfokRjI4RIFHf+T4Z0npw5psSmDjhqp+zE6hlOqaZg9AEZR4EQy/CDBzh2MI2n4ik+D1mCj9fE2HIdBewLxvHUNlT4xIM9//4OqneHCpiNQkUMi3D01ZG0PmfAQQNO8lW59Ol0xHYLLuVgTgq1S8vjOlpVIFJWaCKBEyJ+2L5c0yqSBsUA5JsSovGA1IvjFfIsRjilcrytzi1jBznM9mNLJkHujF2t9eb/zUsfVpDfVKKIFdcLV2tlmYAv3dcl9jdHepgLLfACWp/bf8Ie2xlHpApjxxz7Zpd0ICY/2BDEgo1DaQ4Zhr0i5smdD6fvCYrbgQk6aPBMyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 14:49:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 14:49:59 +0000
Date: Tue, 5 Aug 2025 17:49:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aJIaDgAVN8_5TXYu@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
 <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
X-ClientProxiedBy: DU2PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b54fd43-e955-4e33-562d-08ddd42f59c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y2+C5RUmWbzQpCUt/YgroVpYNQjCtAt5ZloZfy4aNsporkacQnf+pbRNRE?=
 =?iso-8859-1?Q?5UrQsGTih5Ra07J5EJVI7VkLmmvQl0zEO7h/NfPUuyt6RFWL4LI2Vjd+oX?=
 =?iso-8859-1?Q?6Kj0GHw6jIdLYmXSkyZZfFN7+eXqckTNY5zFS4Av1sq5nYP/KhAepKp0RD?=
 =?iso-8859-1?Q?xa4gEUeeniDk0z1DkNp+gpGegjjXj+hePYgdeZ+fx/BHf7J4EcI8vJWMpL?=
 =?iso-8859-1?Q?ZUKmWjo95Dj4i09zTtjlDxuK9hORWx47928O+JgFZa+Qbfp0r4DKmFQfrq?=
 =?iso-8859-1?Q?YaKseXuNSTiF1pf0AYs7zsIVcUMUKsa75GJi+r8EQMIQF/wdFqESTqXwaW?=
 =?iso-8859-1?Q?65R4THKLoc14/J0YBuP0l6AnPnScZTVZD82o6mwFHVSDeUez0wMqNyUfhO?=
 =?iso-8859-1?Q?A/DlAnk/b5xeYAMFh2Y6YJv4g5IK1mMMLfj1Xh6KM4AGBBWeYGv3r42it6?=
 =?iso-8859-1?Q?pXKtD3JECNrwPQooapCnhzhnXLGAinG6gGTKuXec9ryysKnEGZB+i9MJjU?=
 =?iso-8859-1?Q?QLDyAXZbqvqib6RggjCwgneju/VoByZtV4PChcAokXyKMWcvo3jU35Nrro?=
 =?iso-8859-1?Q?jFZom39Es1iYzUfBjPPwA1SL6j32gBlGzpdTelOWC5ZMbeYZX+0QaxWo2j?=
 =?iso-8859-1?Q?ij0oTO1BoOeM6UWJo+ReDpLdNP/kxs06bj2xduYEwkz3QBI1YfctO/X13R?=
 =?iso-8859-1?Q?KEHt5TflF1jrtzMlQnTfyVYaOT7Pw3OJIZCHveO/IQ74p/LXJbDtqLP8QT?=
 =?iso-8859-1?Q?VgbpsGmrNAWZB/9vEb0vvIfoB8buU3jxP+PVy9OEwIeuG1DDcN1GL3eU4y?=
 =?iso-8859-1?Q?R+YmRkCZ57Bqtp6WReeALxdhBu5B127m0wO8GZoXQYNdw3Kd7s/llAYD+N?=
 =?iso-8859-1?Q?g3eQzjy6WC3bUEQDYn6ypqlAZkg+/xyG+duH0ptMpiN/JYh8Pi3lsiC71i?=
 =?iso-8859-1?Q?SF3UwlBqSdoEWgG9MOXQVudqoBE9/S92EMciIiGlu4rbq6nugSGlX1aNbm?=
 =?iso-8859-1?Q?zZouTFhebtOlSf67FOmUIBj4fkJgO/Nu6Ejv5nF2NdSBeZZDWvhSMpfFg4?=
 =?iso-8859-1?Q?bo4HObqNMKe3rhRoPSoj4GIUmzr4C8dXQ0xBNQ4kkWMpE/BMHW/v1pXYCT?=
 =?iso-8859-1?Q?sfFFivm8HgkLMiKMg3yuPse/SCy0ch9ib1GN4oY98ECelHHif86NF+NlNg?=
 =?iso-8859-1?Q?qxmdiKOfV6iWTmtDN5ynnXkRqIrosKLIt671jWIk8Ag3ubXhvRdKgh302w?=
 =?iso-8859-1?Q?6rRsuy5221spykc4uQV+7B9tcP+eTgGf1EDSpliaCgSB8yUvpzQtJJFHV3?=
 =?iso-8859-1?Q?VFLEuyP+PE7HsnczFhCPTTe0CZuuQ0pRPpcIJR6wrBfV3WpDwh7Q05mzEc?=
 =?iso-8859-1?Q?UV4EIhGLHks2WstUYQS2MFziDHtY4nv48SgK/xwkmfgislN07DEZfUWkY7?=
 =?iso-8859-1?Q?/DXgXqvIpvykxbTz02N9KbUe4u2CseO70o49+5x+aszx42kbo+eb+D4FVH?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EUz8eFiGKAbRNXtiKnXROBwT7Xrn2/7WSOcll+lom9QZPc/j2/6qTvMX9y?=
 =?iso-8859-1?Q?s0qXQ1aTh8iqkIJuoBp5GmbcJs/w/3QzH3h3hy3NyWzTRau/uUjFNALKZT?=
 =?iso-8859-1?Q?yBCZ1x11XLGQLtm3qTTpPbJD6sCJobBL9tb4uF9fii2foi00aKOfOR9UF3?=
 =?iso-8859-1?Q?sk3WvvIrpDnc7VTgMbLTxLiG3Z8XI090PEqsrafUEN9kN6ZFuUMdK9YX4+?=
 =?iso-8859-1?Q?tz/HCaqBC0VeXE9NwfwLSPKrn766OXdWBS2ecOHnFHnPoBLPP+7HcZR58e?=
 =?iso-8859-1?Q?wocPdVkXRaGy2bDAct91ho3QvZx7XOTiwx3GQXwiUjSSsIAZQoUEGO1hqd?=
 =?iso-8859-1?Q?9sT42h8H0zdMFQtNOJ7TnVzqJtJoHmhoQLsofXN0hkZEGiQm1MZZQafEAU?=
 =?iso-8859-1?Q?Cv8Mtrkwwpn6uvofutiQCX1tNIqWwAcWmYeTIzyatxuuwl8O9UKDtFjmGs?=
 =?iso-8859-1?Q?zsoy6u2i3GdMTP8h+UQvI/e4dmD5dTlbX9abmBixCOcEu+ErJnXc6lkMxS?=
 =?iso-8859-1?Q?UxxzAtqoRo0mOvum2Ro3MX/eObaWMNuZMYpNWIVQtlGxK5VDCL0lasD/pF?=
 =?iso-8859-1?Q?xA5uVC54tsU2Ymfsmyn0xMbMZ7ViNbUqjCscAgQtzYVYXTX2VFyiF2oo9k?=
 =?iso-8859-1?Q?MA7c1V8MtSf4UfxxwxUGVMxYp5feHc2sKZUYKaKWhyt9zQv3qMcycNL8fs?=
 =?iso-8859-1?Q?+8nyXzOzHHTOFmSU0NNJNXzppc7uQYVvm9r4pwGG0OYI9BYJXAMakFdNCB?=
 =?iso-8859-1?Q?ErVYsDuSpkj1f8q0Y08ujl85tF7lPVdWAqs9NTOBim9oEPHRoUdICIny2V?=
 =?iso-8859-1?Q?llz7iDV7edLs/zeRui/wfjD3tHJLmCbCsIXFF0VqgtKpf1EhPLXUpCRLPP?=
 =?iso-8859-1?Q?X4eHKjkJmyvvyYt0AKT57Vl4qo7NfE921ts32e3FoOuebcG8PEs+R5mlT2?=
 =?iso-8859-1?Q?wNnGm204C5kbCobWnV/m3h2/8ZZdc/r2WcP3+xtJsI8gCAWBlOkOM9n0Cu?=
 =?iso-8859-1?Q?ikY/0E0enLbkBgJ2Bn0G9R/YJK1VCvpPjx4UEy7xCLfBm9zxy5/VtgGtdk?=
 =?iso-8859-1?Q?bvAoTiHNztywHBwIT5q6mRGSckTC7fwMUT9UXot0pBAtZuAgRl4vYu+vq4?=
 =?iso-8859-1?Q?CgbLUaOugSQVkXrJtw4i8BkJLXOJ5AhaVewe1uz1Ch6weoyO6Qd/KKxnAn?=
 =?iso-8859-1?Q?Cb4fhBELX8wXG/HM3iQJ8usbqL6xJN3w/jQGzqLq2Q+iMEPPrJf67FkqOE?=
 =?iso-8859-1?Q?3a+tQM+JW6shv7XGkEkziR9a0vzYZjYa+0jYxLsEKGLXtybBalFq51UmDC?=
 =?iso-8859-1?Q?yzQ72bVFFk9n7pGY53CDWqwJbNINOa+HP7NwzWBsxFoWTM3TT0hcQiu5TB?=
 =?iso-8859-1?Q?D+3zgxusTtkj6qahPMTNYZKa4hApnu/G85kX84lpVz9lSi0qboRheq8Uvr?=
 =?iso-8859-1?Q?HZbRLogLjrVP96qQiBDECFWvatm5XP2UPDGcWCZwiO+qEzuVHhlBiZ5P5S?=
 =?iso-8859-1?Q?KqnEOVeJSsi/Nas38LpPlh84rh4vt+5uNG2LgZh/c3kiCc40E4E5nwl0KI?=
 =?iso-8859-1?Q?BR7LzFL7gdpQQz5M4SXuvptQAWOtINZpPksG/dX4HVcx+s0uicR4WDL4Bd?=
 =?iso-8859-1?Q?k5BnAwYwJV3QXnOd2+AVz3o673XyZQ6AWuLZ2GdhQGP7seipxE80wdHvBl?=
 =?iso-8859-1?Q?t7ejnvwMOdOkLhr7Hp+DMuGFkDTIMzb0gGoJLEAM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b54fd43-e955-4e33-562d-08ddd42f59c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:49:59.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGWkhVrkpD3gQdeVQ+wNov9CE5JzBB+m1vjoMk5wmV5R4tuiRBnlKhujhWpXj4WOfBRzfFoFBeWlPF0P8BvTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

Hi Tomi,

On Tue, Aug 05, 2025 at 02:53:36PM +0300, Tomi Valkeinen wrote:
> Hi Imre,
> 
> On 28/07/2025 13:16, Imre Deak wrote:
> > Plumb the format info from .fb_create() all the way to
> > drm_helper_mode_fill_fb_struct() to avoid the redundant
> > lookup.
> > 
> > For the fbdev case a manual drm_get_format_info() lookup
> > is needed.
> > 
> > The patch is based on the driver parts of the patchset at Link:
> > below, which missed converting the omap driver.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
> > Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
> >  drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
> >  drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
> >  3 files changed, 16 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> > index 30c81e2e5d6b3..bb3105556f193 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> > @@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >  		}
> >  	}
> >  
> > -	fb = omap_framebuffer_init(dev, mode_cmd, bos);
> > +	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
> >  	if (IS_ERR(fb))
> >  		goto error;
> >  
> > @@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >  }
> >  
> >  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> > +		const struct drm_format_info *info,
> >  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
> >  {
> > -	const struct drm_format_info *format = NULL;
> >  	struct omap_framebuffer *omap_fb = NULL;
> >  	struct drm_framebuffer *fb = NULL;
> >  	unsigned int pitch = mode_cmd->pitches[0];
> > @@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >  			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
> >  			(char *)&mode_cmd->pixel_format);
> >  
> > -	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> > -				     mode_cmd->modifier[0]);
> > -
> >  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> >  		if (formats[i] == mode_cmd->pixel_format)
> >  			break;
> >  	}
> >  
> > -	if (!format || i == ARRAY_SIZE(formats)) {
> > +	if (i == ARRAY_SIZE(formats)) {
> >  		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
> >  			(char *)&mode_cmd->pixel_format);
> >  		ret = -EINVAL;
> > @@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >  	}
> >  
> >  	fb = &omap_fb->base;
> > -	omap_fb->format = format;
> > +	omap_fb->format = info;
> >  	mutex_init(&omap_fb->lock);
> >  
> >  	/*
> > @@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >  	 * that the two planes of multiplane formats need the same number of
> >  	 * bytes per pixel.
> >  	 */
> > -	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> > +	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
> >  		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
> >  		ret = -EINVAL;
> >  		goto fail;
> >  	}
> >  
> > -	if (pitch % format->cpp[0]) {
> > +	if (pitch % info->cpp[0]) {
> >  		dev_dbg(dev->dev,
> >  			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
> > -			pitch, format->cpp[0]);
> > +			pitch, info->cpp[0]);
> >  		ret = -EINVAL;
> >  		goto fail;
> >  	}
> >  
> > -	for (i = 0; i < format->num_planes; i++) {
> > +	for (i = 0; i < info->num_planes; i++) {
> >  		struct plane *plane = &omap_fb->planes[i];
> > -		unsigned int vsub = i == 0 ? 1 : format->vsub;
> > +		unsigned int vsub = i == 0 ? 1 : info->vsub;
> >  		unsigned int size;
> >  
> >  		size = pitch * mode_cmd->height / vsub;
> > @@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> >  		plane->dma_addr  = 0;
> >  	}
> >  
> > -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> > +	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
> 
> Isn't the fix really a one-liner, just passing "format" here instead of
> NULL?

That would fix the issue of fb->format being initialized to NULL yes.

However, I think the change should be in sync with the conversion of the
rest of the drivers in patchset [1]. IOW, what this patch is meant to
fix is that [1] missed converting the OMAP driver similarly to the other
drivers.

I think the change is equivalent to the above one-liner you suggest with
the following differences:

- omap_framebuffer_init() uses the drm_format_info passed down from either
  drm_internal_framebuffer_create(), or omap_fbdev_driver_fbdev_probe().
  In both cases the passed down format info matches what
  omap_framebuffer_init() would look up again.

- Skip the format == NULL check. format can't be NULL in any case, since
  that would have emitted a WARN already in drm_get_format_info() ->
  drm_format_info().

[1] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com

>  Tomi
> 
> >  
> >  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
> > index 0873f953cf1d1..e6010302a22bd 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_fb.h
> > +++ b/drivers/gpu/drm/omapdrm/omap_fb.h
> > @@ -13,6 +13,7 @@ struct drm_connector;
> >  struct drm_device;
> >  struct drm_file;
> >  struct drm_framebuffer;
> > +struct drm_format_info;
> >  struct drm_gem_object;
> >  struct drm_mode_fb_cmd2;
> >  struct drm_plane_state;
> > @@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
> >  		struct drm_file *file, const struct drm_format_info *info,
> >  		const struct drm_mode_fb_cmd2 *mode_cmd);
> >  struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
> > +		const struct drm_format_info *info,
> >  		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
> >  int omap_framebuffer_pin(struct drm_framebuffer *fb);
> >  void omap_framebuffer_unpin(struct drm_framebuffer *fb);
> > diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > index 7b63968906817..948af7ec1130b 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > @@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> >  		goto fail;
> >  	}
> >  
> > -	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
> > +	fb = omap_framebuffer_init(dev,
> > +				   drm_get_format_info(dev, mode_cmd.pixel_format,
> > +						       mode_cmd.modifier[0]),
> > +				   &mode_cmd, &bo);
> >  	if (IS_ERR(fb)) {
> >  		dev_err(dev->dev, "failed to allocate fb\n");
> >  		/* note: if fb creation failed, we can't rely on fb destroy
> 
