Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A52AD71F2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C8F10E842;
	Thu, 12 Jun 2025 13:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns4ecAu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E79C10E3E4;
 Thu, 12 Jun 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749735027; x=1781271027;
 h=date:from:to:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VR7Lwjl5kVHptgv5Vq+4B58wFlzrrqc2NUAJZdgE1UY=;
 b=Ns4ecAu8Wv1zpNeUoU8qQbWMtTiBPZX1PzD+Pe3jgLW45I1rJI2QiCDE
 cYYG+eYnE8H9Y9UFmWS+fqkd64LL9EVtkhQKI5CRvjXc8WmVwqmRuuHlT
 YPVjjdkTbabMjefaiLFaEWqFegCMADuT5fM7CQ2xuO4MAmqulDPXTsNma
 SgJfIEGt4KeDgCR4iUB7/RuoVJxdQb84Dwu2AaQC8P1z6EOEHG0iJm/Pn
 17Ir+fqqgOWtlOXWuYGSFJCa5It4laaMzroPG9uJ9M/c5X5v0YwJB3ma7
 mMgeHieQxIn98MMQh2BpThWz0BIJKXOng2uESZifLe7BKiV1YHpo6enKK Q==;
X-CSE-ConnectionGUID: 541BUMjTTpOGChuFu/xzcg==
X-CSE-MsgGUID: oQoNBHgiQgWhLdEyeITGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51628006"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51628006"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:30:26 -0700
X-CSE-ConnectionGUID: dw+PMzbdTXqQQwjwDcd+Qw==
X-CSE-MsgGUID: l6RbiBjwTeCEnhbXT2oEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178500551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:30:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:30:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 06:30:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtKUUEKprcsgCb/TL8T36E0RPDADyiWp3D3wabRf/I07hJvOog7nVsMCo1EsdmwkvR3HJ5656DbBAinjvcR/Wj6mLAXQn3ewuv9ig01Vk6mxOPE2DvKNii/n/DJE9SuyAlWPu9knleQ0OUVdqYWDmpAMe4X2QHzQRYTgotqlP/rDBP/nukcZJuaq1O6mFyUavZvP7ZNh91HySxQ+H31RNFwzT8+ZdPAnKOAH42GVFO/rotEw9jkokGkqfzJXwUTes1kybSuln4y59DRlk2j6KGTa4OfyCLJMZZtKAB4DI8VIyEdQwCGDLM+/Fr7H7IJ2e4/GS8GAqc7ZToWDUTaSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5yljX+Ucmn5+kyHmBSBQ1Mz5AhR9eHdSaSczXj+YP0=;
 b=tIFNXafzsQoHyp3nD8XHudtV3nmb0oZw8qDF7YXTnD438TZsPkfF1d8cVl0tdtzJQ5V8Lk+24aYtmMHmb458AGyBsgbR/ji4GLIBiq2IjbY5bgJzybTO3HgynJ2AmIYwyQ3VoRVtoyWwpNnRCEtOYreY7qK1CJWhz2BFxdhd8WDtbf/MuDD+y/KOkjI1zaj+E/fQmyTOWDK3jlVBLdp2MvF/dPTxMRn1ieS0twNrpm8B0/r6i7xXkJMxYjsfO/gM3AHTM2FO9TnjbVSYK5mJgNpewZNuMiJ4N0q5AhQqxCz0DMM7B9HNz3LjPqaPfloBNcwLe7/ZJm+T/pyEfA0sfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA0PR11MB7743.namprd11.prod.outlook.com (2603:10b6:208:401::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:29:55 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:29:55 +0000
Date: Thu, 12 Jun 2025 16:29:44 +0300
From: Imre Deak <imre.deak@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 "Lyude Paul" <lyude@redhat.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/5] drm/dp: Limit the DPCD probe quirk to the
 affected monitor
Message-ID: <aErWSEB1NpJ_t4BJ@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <aEhSTIVTQyHqfmnc@ideak-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEhSTIVTQyHqfmnc@ideak-desk>
X-ClientProxiedBy: DB8PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:10:be::41) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA0PR11MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b25daf1-331c-4ef6-1f20-08dda9b53804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OITki7pzpfZhheAtGzXzLll15uHUKm7nbPM8FCZVtjcQGDK4xcM07LRRen?=
 =?iso-8859-1?Q?CS7rMtIhPVLXvhYAXiq/zbxoi/Zro2rtGspanRyx+2rN/C4Y8kCB6cbmwv?=
 =?iso-8859-1?Q?YU70fNGjobPbpSGAOnrxpDnwWtAq7RxFJ55wZOGf0/hsILg9MTlBpmKGBQ?=
 =?iso-8859-1?Q?p3+kXjzJqXqLMvC869rGuCYh1IOmqeawLA9LSylqv7vJ8uu2hj9dUTculp?=
 =?iso-8859-1?Q?RVDMaZd14YUuOWbenRcRnSBhb9EtEDsqde5m/5wmgy3eYmrqZYm/3GwbL4?=
 =?iso-8859-1?Q?a6cbXlUZJrGRDIni4RN1HiFtKe8t/PMGeQ4iqKLD21iDlh1Dj3soR1TEta?=
 =?iso-8859-1?Q?0ZxVFSKrE62dG2m98TFSPzcu7iSs2fwuhsBb48rILVgZkoKQLb/rnuEjXC?=
 =?iso-8859-1?Q?BiQJlQNRO90QamhXIcQVXMgWdbEraxgb5aaw2pDc7Yi1BypYwrSU0LAjKD?=
 =?iso-8859-1?Q?Nmni03653Nqgmuc+SwYdkaXytGVKkU1R6GYa10I6bOb3mf0GfsQCSZeLGG?=
 =?iso-8859-1?Q?y9WVZWE7RV98zGiuo/jakENahNAffO7HqJFBeHibTC7mF20XpQHUOVV1kh?=
 =?iso-8859-1?Q?krAOPeptvSlREjyw2lrUqgRlME/A10eHL7AmR9xD+v5BQJRjYpTzeiJ3Zd?=
 =?iso-8859-1?Q?Z24mgaBAfcByP84HLJUiKR+vt3btg7mxKyzmu0qND56TYAKuR+UPjUhe8V?=
 =?iso-8859-1?Q?JpqClkARhVZp9lEHHB9mfhLO8jj5mOCyNo94E5OzlqttlL1QVT7/ksxbWH?=
 =?iso-8859-1?Q?Rf/5hK0aA3coomyVwx7lCWCtVhsRpPHXdHfHyoDQ7sgLsGKE9U85aMqMQD?=
 =?iso-8859-1?Q?nsUYjwLbYgEWbOfAcogZ7eIbIzKaqkTM2qHe643EHUneoQNtTHiakizCPg?=
 =?iso-8859-1?Q?1LiCM6a+n9QGh8ZDJE5z7UhWMzHruJbtu0D12arR1r5pMwapTpZz1aIZkK?=
 =?iso-8859-1?Q?ycBtw/po0p5PlaYla2kiq5byPnpaMod+Pu11tz82SiI6Sh0AsNqD39PkMZ?=
 =?iso-8859-1?Q?R0Oa/QgsKt4WHeY4ko5fhr2nTzbNtrmaximCgyaVyNUbLGg43Do1IElFnW?=
 =?iso-8859-1?Q?Nd/M17kZoeseS5wA0IFHRuiei6xcYCPh/DyJZkFTFPaXSBXsjPGDc1er4c?=
 =?iso-8859-1?Q?hf2/oRbgbZIZAM24/v5x7lMlvw1GYhqon/eh8y1Ud0isCJpKnM76qj4WL9?=
 =?iso-8859-1?Q?lUoOjJ0VLhgb9u2uAFk6rGcn/xWulxPgp8KquEgSDJWj27y9csvl5gqEZX?=
 =?iso-8859-1?Q?b2+91Xol19T//S8ZukOqUitBrTMc9ADadjBRR0xMFNkAN6Fr3pJjsJ8blX?=
 =?iso-8859-1?Q?S2w6fJ3YMaNmw/V29BERW/e5pKEUSNwbr8faw9JUnpX0X2wH6km/t61dCm?=
 =?iso-8859-1?Q?J2730C9WMac4kyiIvuzB5eU0kbgrm0tI08485/NEOr2rXF7CG5tAjRoM9v?=
 =?iso-8859-1?Q?lzp2pELa+EPuCPtpPNuYIVPmkwzshQ/g71C75ODWKM53cd2A2YjjenyKl9?=
 =?iso-8859-1?Q?HjfT+ZifY833fu7vXhkxyR6YFjhwaG7eRg2EnTgEF1jA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?38+ei7U6HTDsiufyTJ7RCli/Y+fHo0sNNmmO83MXTvOUwuMkljGxEkm0+y?=
 =?iso-8859-1?Q?ArZZxOkhiKF7z/0CNW+gmSea2bqvBXBpUR+uJ0vpk4PPjPZWFbg1NMf3Oq?=
 =?iso-8859-1?Q?j+UheZ/HUlKP6sSB4qglc98brgYm9FPJz9fWr1VVz0H8L2IJ4PqBsx8bNa?=
 =?iso-8859-1?Q?c3ecqqfb0xrB/nzDyYigHsBbwHJnyOS8JuKcWAFJe10kzL7CcwDgxOlFI0?=
 =?iso-8859-1?Q?p7DE9VyCN6FWbVgj7++5ySrUlDVWA4fqb8YzvdE1d+WpS2NsaWCdv+R+wQ?=
 =?iso-8859-1?Q?UrwjfO4u76JdxJpLaJxbvOuRxfQGk+rlBMDSOaSPqKPrcr4jD2laLKLLpW?=
 =?iso-8859-1?Q?wLAlgN5FK8B6k50kKsWHChWq0WfzNLxUIDhWgJ8bbTSuXfmHIcRFocBj4P?=
 =?iso-8859-1?Q?nq0qgBo+0gMJoG++4uSy4kxyVANVlfrPsbDuNbjTya6iD9q4yR+WjC+jgu?=
 =?iso-8859-1?Q?U6WUkXssxu3t+PIhsBO7srnfkpZXeBbq1KIotBLbFME9XugPsCxrlWyZZu?=
 =?iso-8859-1?Q?jVCit4ejxb/UIF+ccOIH16Q4or+q8eXbShaYC0T0i7WdXjLJaOndzyIX7n?=
 =?iso-8859-1?Q?31FlSDFLr7OWgkQ8aKJOZ6iIGTJ5mI5uf4ase3r8kGkp/v0Dkkf5EFb073?=
 =?iso-8859-1?Q?NXVwRVzHRomxRNomyzkwQ5DPn4v1pIxzt4usHzkKvaefl8mwx8ePWGc73a?=
 =?iso-8859-1?Q?+OWXpwP7nWTytgYNmo1A4RL8A4fqle1QtmUoOFm24sxfFmgZfQfjwizaQ+?=
 =?iso-8859-1?Q?XCsn/SU7TPaBGsUVoxPg8g5c6D1F7nNdACPUSjNJ7r2yebdSHcG/X+kimT?=
 =?iso-8859-1?Q?qoh6fHvL/0BLLV/dlGpOy2mXDZ+OcrhNzOPJaCYROKaHexYxzRxZIuJlzp?=
 =?iso-8859-1?Q?0o/S1yTFEjCv2oZJASoipbnoatHvB/2iPkzVVcwDxCq2N+vpAldlG40jwd?=
 =?iso-8859-1?Q?j+jXOcQ2msyepqfykAGNOk+gKfkhKHM9VS2wDBIYo93aQcnZqHeZt5wYDL?=
 =?iso-8859-1?Q?zCw/xvZ7kDWW5ZB+j2gSWuPi8+t19lLC6Vb0sDpdJYNA8pbno3Zb4QOEJt?=
 =?iso-8859-1?Q?ENt1za3VpJsBDX8Tq0eC87KEieZzronnLFuYSOIVRLnDJqlMtuTWCIUC2M?=
 =?iso-8859-1?Q?PWoARBxXR6C3DvjwVNc7rj6pdQDqXNobn0PlnYhCkHdnpB5YmWA5hNjV6g?=
 =?iso-8859-1?Q?ZhD220EDULKOw4HUJlsEXvNlNpT+6any3LpMeFtSvIKUv5+c9ILbEL2CcH?=
 =?iso-8859-1?Q?jLHY0XvqFqSVsczyoL2IlCsASpbZvhmLdcvxr+i1jt38yBwu9IuzEcAHdY?=
 =?iso-8859-1?Q?De0nS0UIQyyV1qaahv7LON2WCMawMnPphCIr4BKiWDLsuIljjZSS4mDCMs?=
 =?iso-8859-1?Q?xrk/CmVheoN2mg3rEhhsVu+TL2QMly2j6XTSMstW2fSBEGiHUs5BxZSzod?=
 =?iso-8859-1?Q?RkKWxf1IH6BAVPm8Og0eO/o6GPC60cEn8xnFvrUe1BfVyzU1Sx6xNWjVQY?=
 =?iso-8859-1?Q?WNKsyTQidxQOhqEl+e8B26WhjqnjpM9gpopGQWBz53pPKUPUqE+O04mvem?=
 =?iso-8859-1?Q?YztxgL7P57OqmdFmN127KG9wIWGJXgwzFIJMadW73r5f+XK8Swe6U9dt1q?=
 =?iso-8859-1?Q?xS+3SFESbO+P/YBrKtxeggZAnFQnR66aLJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b25daf1-331c-4ef6-1f20-08dda9b53804
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:29:55.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owzrRyNHhI5Ctkvdn83JawG22dt3BqOk0uVI8TfutogSNljrO6X3AG/Pb+s4EeGuYXZcxXXK0X5TjqBUOJc1ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7743
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

Hi,

On Tue, Jun 10, 2025 at 06:42:04PM +0300, Imre Deak wrote:
> Hi Maxim, Thomas, Maarten,
> 
> could you please ack merging this patchset via drm-intel?

any objection to merge the patchset via drm-intel? If not, could
someone ack it?

Patches 1-4 could be also merged to drm-misc-next instead, but then
would need to wait with patch 5 until drm-misc-next is merged to
drm-intel.

Thanks,
Imre

> On Thu, Jun 05, 2025 at 11:28:45AM +0300, Imre Deak wrote:
> > This is v3 of [1], with the following changes requested by Jani:
> > 
> > - Convert the internal quirk list to an enum list.
> > - Track both the internal and global quirks on a single list.
> > - Drop the change to support panel name specific quirks for now.
> > 
> > [1] https://lore.kernel.org/all/20250603121543.17842-1-imre.deak@intel.com
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > 
> > Imre Deak (5):
> >   drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
> >   drm/edid: Define the quirks in an enum list
> >   drm/edid: Add support for quirks visible to DRM core and drivers
> >   drm/dp: Add an EDID quirk for the DPCD register access probe
> >   drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required
> > 
> >  drivers/gpu/drm/display/drm_dp_helper.c      |  44 ++--
> >  drivers/gpu/drm/drm_edid.c                   | 227 ++++++++++---------
> >  drivers/gpu/drm/i915/display/intel_dp.c      |  11 +-
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c  |   2 +
> >  drivers/gpu/drm/i915/display/intel_hotplug.c |  10 +
> >  include/drm/display/drm_dp_helper.h          |   6 +
> >  include/drm/drm_connector.h                  |   4 +-
> >  include/drm/drm_edid.h                       |   8 +
> >  8 files changed, 189 insertions(+), 123 deletions(-)
> > 
> > -- 
> > 2.44.2
> > 
