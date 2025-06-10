Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEDAD3DA6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD310E2D1;
	Tue, 10 Jun 2025 15:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0y2ji9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7110E2D1;
 Tue, 10 Jun 2025 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749570143; x=1781106143;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6NUg5Hw+CMOh8A0D/KWIf+O4dUl7Q5a568bHz3A33w8=;
 b=L0y2ji9ay3s3dHcjAyPiySXHfnM+lSHaFChJGsteVnyJH4qCEzSZV/GC
 iWQ5MQwRpdcTMnsFY+V80rEiei7w95qla0yCwXXCFxMeNxI9Ka6wfoZP6
 zgymVSsG1E4dom63VNFj4X2s6sGYvGtgPYWH6O4jKWbFNz0j7NyUA8K+h
 Ghw2rCGRJMt68GcoyoPcgvO8Zzr5A9hZPawlj2gaC/VacktwCEfaczuOB
 zz1P8RM0FIFOMtYPRK0rHdVZcULsJa+cnI5cRWkVQ6H6KPJ2FBZQWCk7s
 a9gkPx2ngwR/kUhphSff38UqAtGaORDq+mkYyjiVMbQjQBhqKcOOiKpfk A==;
X-CSE-ConnectionGUID: y3CGpbq/Rvu8bsmSl4tCSg==
X-CSE-MsgGUID: oXq1YtxXQ0Wr+eZ4HXZk2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54316392"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="54316392"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:42:21 -0700
X-CSE-ConnectionGUID: M1ZvTP5BQfSnhtuPwjzVmQ==
X-CSE-MsgGUID: EggwxrmORNS2sJ0Y6xBWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="177814728"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:42:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 08:42:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 08:42:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 08:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcr2E6A/eRkJVxyeQwTg75VQhQn0GFXAmIvhr9H9h7o9U3sthXNeeu5dXJ+WN9L134bwXFJwz+Cn1yk1mYsx9ihIAkCvf0FzMuBMW4sOu+ZjTyAkJOha/S8IQew0WcgQOMCREtAccdmcXS5udO7ep+Un4COVpAqlTFNZkHdRNacV2D4IFIYMWQSmU1bq6PbP7A8uMj5U+rx7C6YXucK6fnz3prHHsqsLoK8L6ZnHgyY59cJx0lmEy3wu76n7rozT0mTsT6TgdEKj94EUOtJ8fdifVn0l+O08+l0S7UeyBQ9rBNfTOeZkh5+yC+PU2BYyNTo8dYF6Ut/XjDpIIvyOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaoxrGhhhLEp6hNTaYGiU4vLLz3wtR07Uxl1i48+JCA=;
 b=EF8jPmqIczTLloNDuG/eePOLUrxsOn/1TAcvZ8T8n+Oa2/hR8m40VML7BSaKLNT4XvSY9IjXFQH4mYjfegEDWsfFl5FXq0YxcdIB1wta/ksz9SwjiDgSKBfH3yVkPE9VTT8eSQdpty1+s/H4//Ka8Ql9zjm7zybqyqD97tWLp4/HujaXbWHPQFI4rXSjluPE3MF3L62FehNiPVQWfjQlV8G2b8MNsCoZYaH66XmoySrlU6mkVdFbikHObZLfjkiPhwrPT85D/oul9DbG6eiysethaACWeqB0SWDqwcBA/ANxny0qtY5FCN5g+hXiF4b60JBqEkyvWlAxc9Crq9DgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA4PR11MB9131.namprd11.prod.outlook.com (2603:10b6:208:55c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 15:42:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:42:17 +0000
Date: Tue, 10 Jun 2025 18:42:04 +0300
From: Imre Deak <imre.deak@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 "Lyude Paul" <lyude@redhat.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/5] drm/dp: Limit the DPCD probe quirk to the
 affected monitor
Message-ID: <aEhSTIVTQyHqfmnc@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA4PR11MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e7159b-cf41-47a7-3b12-08dda8356102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/WFnUx16iR/tangZr1WOayEI3/6L5sRM5WIYGrsA1HaKiUK8vbY890p5vd?=
 =?iso-8859-1?Q?p+CxdrO99wAfqTa6fYmXKc+t6XS6zZ4YflSc3Fn8DZ9vWJANZrCASuchb7?=
 =?iso-8859-1?Q?9CGrFh1ffxobdMoFgz2r3FlWDyaVtKILwvHKtrJG4yEUN5cfVsEVzLPP0g?=
 =?iso-8859-1?Q?chCpeE1PsU2umu2pOmb+xVHKCUXv88SDaMNUUcbqiDhrs/Nde2zf2ZJJH/?=
 =?iso-8859-1?Q?BV5EGUO4K1/BhfxgDm0Ou//a1UQZpzTD4BgFEAFuiRLFt7bSFN9OoS/kxe?=
 =?iso-8859-1?Q?wkyyhK0D9h7cvm13BBYKg2X6zqa34HMGK5j3LkBc/U0KCBRzYANiXqA+0U?=
 =?iso-8859-1?Q?yai/7VDVRdcLKo13aTNisj0mWo1yvfsLdYIr5CqhYB2W7j2/3x22mg+6t9?=
 =?iso-8859-1?Q?srM4WhqmmpLF5KLnCRXwgJS4Ktmd/14W+qglEyabbPD0HKPnc4CWGbe3tl?=
 =?iso-8859-1?Q?ecxnC185050XrH05KRQtATsFQRXTe6hIU8gWxC+8nNC0QO/ubJPXotqx8/?=
 =?iso-8859-1?Q?T2PeDys6goz8hOwUr+o06IA0PdjiRaQKPEvUjmOde2r5djI+oqaUurL9fB?=
 =?iso-8859-1?Q?gK/7EgwHSHOCFCcrgyqqUfUG2CZt2w9PJbz9rVK7NmlzMrkHouWCL3PBDw?=
 =?iso-8859-1?Q?cVW19e2KczyTbF9Zwls0K5s6T7ZoBNrMpZud+kGhJyAlC/2tdUPcBuH/Gk?=
 =?iso-8859-1?Q?k//h7JIP5JWVWqIQYJj9kqhvdlaJybE1DG7ELYpWEihD05+YbpjtWRtZku?=
 =?iso-8859-1?Q?W9rSzYEUYeQuwSp2Pu5JEGqUpqEtBVQXvxHhOT0rVuTXkKvQYqgBE0JMwe?=
 =?iso-8859-1?Q?KQMK5zlPQ+b38lJs208YtRRF1w/Vnd7NxM2DK5H+ji1Ly9AH+YKjJQQBmf?=
 =?iso-8859-1?Q?Z7DBLmFWlAjS10CVCK4BtbQWmGTMO56q999opdtL1ADQayK0BnxtM/meOT?=
 =?iso-8859-1?Q?kGszsJ9fdOyxilH2Z6HSU4VqIPgTr3klTIZP20qmigg6XEym1XycY05o6g?=
 =?iso-8859-1?Q?XjKlttKofg0nssuZYk1MosYfB61keOkMF2A0CGay9BMQQOk4CXHYay3yvx?=
 =?iso-8859-1?Q?JaLbXZsJmsjPVY1H993R9IdJO+Y/fHDmnC0meQiYYiJgQJnApfyoAeOODt?=
 =?iso-8859-1?Q?oxiX517Yy4mc3jnakZHpVWd2GgLJiRFvFR65KK2/ClfHGr39QQuObMS7RW?=
 =?iso-8859-1?Q?cJP0i8wjaRGumg8Lc8G/SiCe5KnY9OvlOzJGCtHDinAZZkXxE5lP6ZgE29?=
 =?iso-8859-1?Q?Cpwi8QmTSi+SE8VDMD5a59u/8oiPU321SpxWo9MsUbnPCImfm9edmIpdht?=
 =?iso-8859-1?Q?xmo55+V2U0HzzGqZm4kZYXPakUtVTMpadteuEXJWE1TCWQq24cAH2aaez6?=
 =?iso-8859-1?Q?Qfi2DcROPoym5aj8t8CrlwvG08hQSubqPKRIIq55srIumR1lKr7wBKPM4G?=
 =?iso-8859-1?Q?n/JIg3xjNqZHeEl3Y00m42LUDQphIcmFkyJ+M7Y02BouoGLYlPlyNqmfAc?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ey+zgsY2ONuFJg35bAhsuPvLn9Byt+vc3rBrwwpnhjx0vrv6K5o0OKVKZy?=
 =?iso-8859-1?Q?UEAdCNoGj3EZbwA6w80s14eb5IiiBo2NLe+dBD4AMMokXIxisjcTIKzSwm?=
 =?iso-8859-1?Q?4l0tIo7KjKkXvmdJPrhie/7x/g1jXP12xj8JFi7YMywf//S098y/Ibrarr?=
 =?iso-8859-1?Q?hnU+yg7FEoyRN4RoSgl4f2k2r9ZsuXEG3yPltL0yWUrN19aQtoJplMH6Cz?=
 =?iso-8859-1?Q?Aref5cnas1kpKNtzEdf2f1svURbyqmbt8Bq7/PPBWfocufGji9kQyE7bUg?=
 =?iso-8859-1?Q?2GdXmSd42f6HX9PGMAXnnyWXKdRTTaOOVD8jGghL/zaHeuTkmBrM1kw5DX?=
 =?iso-8859-1?Q?hulUxviAsECNqviBMEG4X9twa2juqihqVJdM2FItAI5lSmR0nHmhKPaSJ1?=
 =?iso-8859-1?Q?eFnHH08ykA1DWwBFf1M3mPAQ/KFgziU84pBLrN/aYp+zlVddQYuXAvn3zR?=
 =?iso-8859-1?Q?fXKb40o0NJXj0WkmoZ0FWOLCj1gdkVvGNf0KCTk+EPIo1/0G8EQOSlcaNT?=
 =?iso-8859-1?Q?M3BI/MDsbk2GBkkRSVHkpVURmNZ9Pgof8HbrvzIC+9RxBaBC0/jYencUmH?=
 =?iso-8859-1?Q?Bj3NMmqf+E43jhu8nDLmwHQQ1M5IyIh+VPE8kQGsj0nLdqpXEAldGAqAq2?=
 =?iso-8859-1?Q?nVZAiXREuPfpPv+vhhfC4WVvPv00mcb8PAd98cQLUuakT9Q0mvLgMLESM8?=
 =?iso-8859-1?Q?1qt+6z0VLuJ+6CrUH/q2ULQ7lHPVO6MAuygeIRV4P1w4JYStvy16CssnoK?=
 =?iso-8859-1?Q?QbYb13WYWJSrJnMnPp3r1xEmmUZo1qZTbOwhjkSbIEc7fflhe4hiy0untT?=
 =?iso-8859-1?Q?WGM1jCHTZPXvN4NamHrsczj3JQW3PJlxIoIw/cjitNY4XnC26xEvf3zpqU?=
 =?iso-8859-1?Q?SHZV79ikoEUO2dChL1n6W4bU8m8I5BDBlrB6WA/zrK8vJ+Wmn4ZCPDq6aG?=
 =?iso-8859-1?Q?idwb47McDc7lM1xbcWaT8Jhb9eHHoEuQfGXje1hVwf52v4HIG2L2l0eVEf?=
 =?iso-8859-1?Q?bEp5vmSeyE1GQMrgU7hnbbRPuNU6HpXmLW2wWxCBZwUhHSkxdH+L7T/EgN?=
 =?iso-8859-1?Q?ZsXcDbIMKyxULgLcGW4zVzuwovn2HW7FMUAzyO62OXRVrfEFg2EqnvBds7?=
 =?iso-8859-1?Q?taciQj9Fa18f77UDCub+7YuhE3zvpyt4ywJomjEc/7TsvGvygykhc9ZiQ+?=
 =?iso-8859-1?Q?sLkmOrK2OLXnGuv5Bmj33CmIWg22kMXKEhk0nGramTx7WaGJg01Qn5L8Je?=
 =?iso-8859-1?Q?tLwLVD45AbMcwDYUIvW4hZFASj1tMvWRK2VwDT9tbDz2PugANvZ31iVALZ?=
 =?iso-8859-1?Q?BqDqP0AlAlmj8FzGsOy7akuracMH0bCYTShEIU6PKXsOKKvW+xT0z8PprV?=
 =?iso-8859-1?Q?1Hhr+HlwtqNTTI9IrDqOec+WcxRomNmoZuiTMBrpbNxDdhbg7kLovLp+ax?=
 =?iso-8859-1?Q?N8eoaBa9hXLTAMIzwGqboPXpGYuU7Kk/3io1BPZza1SullcPn1p8P+k8pM?=
 =?iso-8859-1?Q?5n5EwBazh0Rv50zTV1K9BuQBXeOQSW6/vDB3MN2Ejm0eyTxFbgERujvWIv?=
 =?iso-8859-1?Q?iSPrgOT9Nr5VJyuNGXvCtFwYDf1juO30EOW296l3rixTQeuEOdq1Yblh1D?=
 =?iso-8859-1?Q?D14Bgpgf05biiEif5NhirPisXiAhmRTzQr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e7159b-cf41-47a7-3b12-08dda8356102
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:42:17.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0zm+8RIM1olRdKzZlebsm6doU+S3S+Fv6+tEfJJmwlBEynwsgBTnLOgGDnxuNr2qOzLix8plMinSdJ8VA2r6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9131
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

Hi Maxim, Thomas, Maarten,

could you please ack merging this patchset via drm-intel?

Thanks,
Imre

On Thu, Jun 05, 2025 at 11:28:45AM +0300, Imre Deak wrote:
> This is v3 of [1], with the following changes requested by Jani:
> 
> - Convert the internal quirk list to an enum list.
> - Track both the internal and global quirks on a single list.
> - Drop the change to support panel name specific quirks for now.
> 
> [1] https://lore.kernel.org/all/20250603121543.17842-1-imre.deak@intel.com
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> 
> Imre Deak (5):
>   drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
>   drm/edid: Define the quirks in an enum list
>   drm/edid: Add support for quirks visible to DRM core and drivers
>   drm/dp: Add an EDID quirk for the DPCD register access probe
>   drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required
> 
>  drivers/gpu/drm/display/drm_dp_helper.c      |  44 ++--
>  drivers/gpu/drm/drm_edid.c                   | 227 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp.c      |  11 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c  |   2 +
>  drivers/gpu/drm/i915/display/intel_hotplug.c |  10 +
>  include/drm/display/drm_dp_helper.h          |   6 +
>  include/drm/drm_connector.h                  |   4 +-
>  include/drm/drm_edid.h                       |   8 +
>  8 files changed, 189 insertions(+), 123 deletions(-)
> 
> -- 
> 2.44.2
> 
