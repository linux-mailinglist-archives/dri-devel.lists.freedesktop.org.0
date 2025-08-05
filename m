Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB57BB1B9B3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E277B10E291;
	Tue,  5 Aug 2025 17:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhTGnD63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168D10E291
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754416689; x=1785952689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WNrptbctANjXfA5CLpBHjagnkh4UaPiWmtyqEjICLQM=;
 b=BhTGnD63XA34JUaq+AtV+luA+pxBHtCc+3c1LUCQwntCMab9k15jlOQ8
 h+AG901cqX/0l1K4usSmywtZ2cvFY8AbwHnTvtqnpv21N9Fe0JgxItk1U
 IW6GlGdnsuMW96//QYNeffncGr8EhDYXipjYCjI3g5BEPH5nw98yth0f6
 f1AmYJX4hEhkp/l+opkBQb3NPhVdLYCnPF5HQXYkSp/rEB8QirlaXgIsi
 vjTunhDH1+svHscZpEjUMGEq7g1kii7xXipiO8uLMMUkCqBrRh6kMmOeM
 ep26vkpu1+e01B0CMfgYDUohc6qHs6h1FCRnYGUKx80SxFX7wtH/fhPYm A==;
X-CSE-ConnectionGUID: HtiD1I4vTnKzUlxSFjS2NQ==
X-CSE-MsgGUID: OyQ/aaP/QrSftf+EzI0Cng==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56807514"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56807514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:08 -0700
X-CSE-ConnectionGUID: 1mgZgohbRqq4sLwIb6k0bQ==
X-CSE-MsgGUID: W565pBl9QkeHkLSK4v8UuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195527597"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 10:58:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4nUSxUZmjn+/POqbU0RjTV4QoNYXgtX7vOME5pYAXz+Cg3gVHSe2KtGwUCDAAeXS2r5aTkERGv9CtzsJWf3kOLV/IePc1lGDcnFIEAJA5S86Pshjnw+65KGQddJUv3xnCWux7JMJSr3k6py4gs/dnYeqV53OrGvtOOSkgZyeTkBxUNRMT//qjpc8mo8ktQfF5w7sYE+iT21gNahlFYJKDXgu9KVA3ch+yPeDDLWpu2SXRrEYdkvb1n2SsYRf7LV0GDtzx7AwVBws3MvUwMP0PCevVWAqA8qhX9ktBZwcimR+8Z/Y2O4mQLq9tbiRK15uDYUKQVAp5N3b8RwaHkZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEYVjGYMZmnuiin/wMeZ1eEfa5FI2tC0Zz0GCSrkcbE=;
 b=dYLKU8sz/MUqObonovoo07J7/HYo/DGZZ5R4I7jVBPjEfga8+T4sePH+7+nNQ0ZziNOShMOV+HqA+ABd3BJ5zxEV8+rm9DIQrTcXswCoYRf9fKjfWtFX2mDhwZJSPaLgJvnxaSZcuxVbjWZb+fDnhEN2jDl9HkYQ5mo6MIO0ADWUIbLGEr9DWezwHxvs3If+tkpfc2JwW36cO5PCMmqUvy3uQZhLAnSvZl/mL0LyNZY12pny4bsADa5/kneSQnEzTQgW/emWtazBN9p3fpi/T4nNC7Vj51o6oDwovLjonKSkN4Cdgh2Mn9lPTu8clPGOmWmCoNS01duDB8V3uZjCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Tue, 5 Aug 2025 17:58:02 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:58:02 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>, "Linux
 Kernel Functional Testing" <lkft@linaro.org>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH v2 1/3] drm/omap: Pass along the format info from .fb_create()
 to drm_helper_mode_fill_fb_struct()
Date: Tue, 5 Aug 2025 20:57:50 +0300
Message-ID: <20250805175752.690504-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250805175752.690504-1-imre.deak@intel.com>
References: <20250805175752.690504-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0330.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a5f1ae-92a7-4e59-85bf-08ddd4499ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUloVFUybkp5QWhJeDJPMVpIanhra2tZNzdGaWJ3MWgvbU8zWWtuRE5mcEx4?=
 =?utf-8?B?NlV3NURoZ0RJUTZpWlJNL0d5bXBkMU5maUlqMXlvdVdHYmI4WFNFMHNxVGFF?=
 =?utf-8?B?alFKdWlZdEFzZHl3czhPbEhGOHlTN3RSQm5kaitDbW9YdnFqVjFHQ1dyc1ZY?=
 =?utf-8?B?RysrazY1Y1Y0TENPUFBRVElhVXJHOHhVbDlFbWFOQmhLZnRubW9xaFk4UXVY?=
 =?utf-8?B?MngveXBOWTMveFdvRTI4Q2JUc1RHSGg1ZXJ0SThuMkN0OGJrU2M3Qnp6UFRy?=
 =?utf-8?B?MXJUSE5DbUY2UEV6bmpCdmQybE54MS9jT0UxTk11MHB6YmxPWmF3RlZqR05C?=
 =?utf-8?B?em1mclBLcldPTDBOb3ZQa20xRUFJcVhYOHdaTUpYU0ExSUhxdDJpTmh5aVhu?=
 =?utf-8?B?UWh0cXdTdVNQb3RhZEE0VzVsODU4clRTUFdsZDRTVlVwemtqbGdWT2hVZjg0?=
 =?utf-8?B?N2MyNU0vNXArb3huNXJFb2FEdjZBbTN0UkFIMGo5OVoxTDhhK1BNOTNVekhV?=
 =?utf-8?B?SkFYbDVSWlgySXR1ZG1aMUtYdVNwNjJ2K29OMkl1L0tvcTIvNHQzN1hSQnhi?=
 =?utf-8?B?QlVyVFVSUk9QMlZDbXdyRVdkTDZuZnVia2hHVGlMM2ZaKzdudEh2elJBZElr?=
 =?utf-8?B?TndtM3AvbW9hQUptTm9GOXEwQUNRbHF2bXRnOGdhTnhIeXpyWVo5YzlhTUNi?=
 =?utf-8?B?M2FIR2VBcnBTejdrYTRMWGxrNW1WODA4L0xUM1BlZk5WZkJtL0NDS1ErVkY2?=
 =?utf-8?B?aGdNZ1ZVTFkyZDFUTHAwTGFTN3BmYWJxNHYvYSsxbkZxa01xUXIyTG14azNT?=
 =?utf-8?B?UlBaVElsZ01Ub2ZJT0lnQW5sa2grVFM4dnRwR1BreEZ0YWg3eU93Q0ZDY3Nx?=
 =?utf-8?B?SWZmNGVQWUJNaStnM0ZZWmlCNUIzK0NaTFVHOEJrVGZNMlg2RDN6bmg4Tkth?=
 =?utf-8?B?Y3F0MStRcm9QdjNNajhzVFg3dSs4RGNZeTNBSnVtcUJTY3pVcDJpUGhJL2w0?=
 =?utf-8?B?SU1CQzZiemtmTmlESjZhQ05SQWpHME5LdGt0U1NJNzcyNi8xOEU4Rm1raUhC?=
 =?utf-8?B?T0xpQ0M5OFgzOERYMys5NzBYL05hc1NiWjl0Vk9kWjFlTVJaMUFmWklCNk9T?=
 =?utf-8?B?dk5tQmwxbzdrQm5USktLNWU0MTMxaFlJd2wrQXlpOHFiZmQyaHZMcVN1U0Ew?=
 =?utf-8?B?a3Mya0FsZ0V5NWxMNTRrQW56SnNNWjhsdVBrNlJPbThicTBiRkxwNFhab3hm?=
 =?utf-8?B?a3BSQ3F6elBOOEJ2ZGhSYTFiWFd0aDNsUWd4R1RPWjNGZ1lZUVNwK2lnQXdK?=
 =?utf-8?B?Z1RJQkY4WVRDSFRrazU3T1NzMmlrcmZGYmZEL3oxNGJNNUFPazdsazFqNm5p?=
 =?utf-8?B?TWl3UGJNU1oydkRrek5tVnR3bnlIdE1BQkg0V1R0amZwaEVGSTFUM3ROdHZT?=
 =?utf-8?B?NjVFdHp6UXFKVHh5SjV4RE8zTFovaGFCdEpBcVNGMjNhRE1FUFV2U3ZzVmEx?=
 =?utf-8?B?aXlUdjJ2VDFoVExYaUJDb010cGsrV1hOWFFvaFEwUzROaE1ybVh6Vk1ockdr?=
 =?utf-8?B?dUJ6T3JPZ3hrU2I1K1V5VnlFdkhPcmVWWklBSXFCT0FIcTdjUFhJUTdjQjBG?=
 =?utf-8?B?dTVoUUFSZndBaDhMc3JrZlBaT0NFYnpPRkczaFlvVmpvblcxV2dRMzlzVUNh?=
 =?utf-8?B?YjY3aEdyK0I2WjlCdlFyVEFzN1lIUXRDcnRhR0JPOXdJQ0dFdXI2U0pqMWZZ?=
 =?utf-8?B?VHQ5ZlVzanc0dGRlQXl4WTFJYUNacWg4YVQxVmpzdmQ0MHZKWmxoMitYVldr?=
 =?utf-8?B?N0NlZWluRU1pRW5mUmdjRHliQUhwa1ZWSHVmZ0pEU1NQU2lNT01ZZ0IycWJn?=
 =?utf-8?B?SXpYeldvc0Z5RUR6MklrcmFGbkhESXNMYyttOUtQd3MraXBpbjZldktjTjE4?=
 =?utf-8?Q?1elY52a8Mcc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFmcFBhbEEzd3Y5cjZObGh6QkNHRkFhUmRTK05oOTdQZkpROGFzem9BQTA5?=
 =?utf-8?B?U1k4RC9MaTl5NnByYnNCcENXV1BOZVIvT1llZldPcTVzU09hLy85cDV1ZW5j?=
 =?utf-8?B?c2dUbUIwSzVJWnJ3M2d1TmVsTXBjQ3krck11bEhORUFGUFQwOUpYUEFuYi9i?=
 =?utf-8?B?cDMvRFRxSzY1RGVWWXFZU25Od1RHVXdTVFYvaWllZEErWXYvNmhRYitKL2ti?=
 =?utf-8?B?RXgzWU1PK3g2NjN6SFFwbVZya2hjZ0h6c2NzTVljemIxdEZmL0RoR0xwcHdn?=
 =?utf-8?B?Z2xsQXpTN2gySUxRZUZHRXZFVWNlMmxPZlFTWS9rbENPWjFSUmhjVGY5bCtL?=
 =?utf-8?B?RU4zTDMxakpEN3J0WlJENTQ2ZE1XL3ZiUGxKT056ZXVhU2dvYTdTYlhsVW1r?=
 =?utf-8?B?d2gyT0hNYmNWcXBDT202cFBvWE5XdjEvOFJoRHVOTGRWalR0cmh0QXNjS2FO?=
 =?utf-8?B?bVNZVzUwNDlWci85UjdDc0JGcmlhRnpla1NsSzZlT2FScFd2M1VsUERVMHpT?=
 =?utf-8?B?QW1QbEppSTN6MmoyckpJRWNYODlYd1FQVXI1YUluOFdHQkw4Yzg5SDd6L3Vt?=
 =?utf-8?B?SmNwMU9HNHJHUnBSVkxDTDJyZHNZRkM2WlZWbkpwK25Lc0lHVUd0ZVhaYjBi?=
 =?utf-8?B?bWNldTVMMllLdHk3aHdnMFVRTVY0ZlNzeVlSZHdXdjZHN1FJRU1FdHVhczVW?=
 =?utf-8?B?cjdDK2JMVURVOXlTejJYSHUyTXNnV0dFZmlkSXN5VldTZC9vNlMzRTdmOEpv?=
 =?utf-8?B?SjB4NVVlY3JUUktVc2pLVktkYjFCTHV6YWwvSTFEaTRadGIzVGV5NDdVSmhx?=
 =?utf-8?B?NHo4enBkSXZsU1poQlpTaXRSSFRMSEpPR25oNThSQlNPb1hQMEx0Nk93QUhy?=
 =?utf-8?B?ak53UEVCbFNCQUk4aG9qeFRJcDZBZmZWSmRERVFxT2VCbTF3emhDcnZHYnp4?=
 =?utf-8?B?NG9ZcGlmOVVlZElyUGZyZlRPSFNsZHAvbWozdlVDQ1RjUDc0VUh2L1pZZldy?=
 =?utf-8?B?N0UydWltcnFTbXVMTjZHTldscjNCbUNJb0hENXFjejloTmFQaXQwaTd4NXVh?=
 =?utf-8?B?K2t2VmxZSmg3U2lJWFJvOWRiNkdCaEdHTjR6UkwyTURtdGRUR1A1K2xlTG5I?=
 =?utf-8?B?T25IRkN2TUZ4VW1Xb0RZVTBKNmFacWdRWnFPSzFnN1R2eW5RdDZDcDNKUmpE?=
 =?utf-8?B?TitJQVBqZXBNVW0wUlRNdUVSaDQ2UlJaMFJrVVlLeHIxUldZSTdrdlk2RkJa?=
 =?utf-8?B?OU45WmdXMHRGemhvUzQ0ZHpROHRsMDdQOHI4S2RCZSs3aUtoMm5GbElxdzhJ?=
 =?utf-8?B?QmxUMmpjR0MrdzRjUU1ZNllrZlNiQ3VsajZKWEd3UC9zZ1Bpb2hRL0dWTnBV?=
 =?utf-8?B?eUg2ZVo4ZFE3Tzdrck1xVHN4dUJTRDFWQlAxM3dnWUQ1SmlwNmYvYTNMY1Ry?=
 =?utf-8?B?Z01wMWJSZFNudzdOd2FGa1V5UktROVRJdjVPTjBaL3pGRWtaM04zd2dVdjJX?=
 =?utf-8?B?RmRWcitGQ3l5ZHQ5NE5KdGVYRHdDRmZIRklObnZHSTJXMkUyZWdsRVl3aEU0?=
 =?utf-8?B?NER1MFRmUWhBYVQvQ0IvcmJIUXFhWmYvY2N6NlltajlldFYyWGlQNHNOSUp3?=
 =?utf-8?B?TTk5VUwvc2hxUWNZVWdmSXRrdHcrc2x1WE96V1NuUklwUk1pa0VhZnpydW12?=
 =?utf-8?B?ajVvcm90Y2IzL2hLUjlKbEFESkJsVmg3VWJRcForZkk1Nk54NnpmaGpmTThK?=
 =?utf-8?B?NjBZTGVBTzZMUWZ2R0pwYUY3UGFCSWRna1JHejJzTldnQzNHbWxKNGNCcFdK?=
 =?utf-8?B?elhTUlJGeVptS05SRUh3MXNIOXhKUDloVWhTZU0wKy9MMzVoNDR1M285a3hC?=
 =?utf-8?B?U2tON0VLNzIrMjJ4Z2NzTjI0aE5ib1BzZURqb3I0OGdVQkJQRnNDL3dPWFZP?=
 =?utf-8?B?bUZrNTNzZEw3QlczWlVrTWxNZlljekxoYldvQ0M5Zld0R3puRU9LNFZTbDJK?=
 =?utf-8?B?c25JZDZWdWR2UlZqTzgxVXZvdHZabDVVRlpKdngzU2xYU0Y5clBlRmpCMTZk?=
 =?utf-8?B?S2gvWHh6c2lUZkZUNlhJRGN6MGNueDhPbEZJVlBJV1M2RXRVQXdBcHRYNklI?=
 =?utf-8?B?VkVtQ1JvaWFJNjg5b3FNSHVtZ0h6TjNNWkJQVDFLZktKR3hNT1ozbHFjckZY?=
 =?utf-8?Q?5giYtCz9t4BO2I8GUnh4kL0agFyoMj66L4Bq/a6MKYUZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a5f1ae-92a7-4e59-85bf-08ddd4499ec2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:58:02.2990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWMZK9cVVGGxCKKGYCSUVrcKi5q/1imYQ5tHE+r/2FjGPXc0A5ZqxuljkksY2nvb4jHoGVpSvm7PnIMqd3+ooQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the omap driver.

Due to the absence of this change in the patchset at Link:, after the
Fixed: commit below, omap_framebuffer_init() ->
drm_helper_mode_fill_fb_struct() set drm_framebuffer::format incorrectly
to NULL, which lead to the !fb->format WARN() in drm_framebuffer_init()
and causing framebuffer creation to fail. This patch fixes both of these
issues.

v2: Amend the commit log mentioning the functional issues the patch
    fixes. (Tomi)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Tested-by: Mark Brown <broonie@kernel.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 30c81e2e5d6b3..bb3105556f193 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 		}
 	}
 
-	fb = omap_framebuffer_init(dev, mode_cmd, bos);
+	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
 	if (IS_ERR(fb))
 		goto error;
 
@@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 }
 
 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
 {
-	const struct drm_format_info *format = NULL;
 	struct omap_framebuffer *omap_fb = NULL;
 	struct drm_framebuffer *fb = NULL;
 	unsigned int pitch = mode_cmd->pitches[0];
@@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
-	format = drm_get_format_info(dev, mode_cmd->pixel_format,
-				     mode_cmd->modifier[0]);
-
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (formats[i] == mode_cmd->pixel_format)
 			break;
 	}
 
-	if (!format || i == ARRAY_SIZE(formats)) {
+	if (i == ARRAY_SIZE(formats)) {
 		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
 			(char *)&mode_cmd->pixel_format);
 		ret = -EINVAL;
@@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 	}
 
 	fb = &omap_fb->base;
-	omap_fb->format = format;
+	omap_fb->format = info;
 	mutex_init(&omap_fb->lock);
 
 	/*
@@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 	 * that the two planes of multiplane formats need the same number of
 	 * bytes per pixel.
 	 */
-	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
+	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
 		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
 		ret = -EINVAL;
 		goto fail;
 	}
 
-	if (pitch % format->cpp[0]) {
+	if (pitch % info->cpp[0]) {
 		dev_dbg(dev->dev,
 			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
-			pitch, format->cpp[0]);
+			pitch, info->cpp[0]);
 		ret = -EINVAL;
 		goto fail;
 	}
 
-	for (i = 0; i < format->num_planes; i++) {
+	for (i = 0; i < info->num_planes; i++) {
 		struct plane *plane = &omap_fb->planes[i];
-		unsigned int vsub = i == 0 ? 1 : format->vsub;
+		unsigned int vsub = i == 0 ? 1 : info->vsub;
 		unsigned int size;
 
 		size = pitch * mode_cmd->height / vsub;
@@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 		plane->dma_addr  = 0;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
index 0873f953cf1d1..e6010302a22bd 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.h
+++ b/drivers/gpu/drm/omapdrm/omap_fb.h
@@ -13,6 +13,7 @@ struct drm_connector;
 struct drm_device;
 struct drm_file;
 struct drm_framebuffer;
+struct drm_format_info;
 struct drm_gem_object;
 struct drm_mode_fb_cmd2;
 struct drm_plane_state;
@@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
 int omap_framebuffer_pin(struct drm_framebuffer *fb);
 void omap_framebuffer_unpin(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 7b63968906817..948af7ec1130b 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
+	fb = omap_framebuffer_init(dev,
+				   drm_get_format_info(dev, mode_cmd.pixel_format,
+						       mode_cmd.modifier[0]),
+				   &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		dev_err(dev->dev, "failed to allocate fb\n");
 		/* note: if fb creation failed, we can't rely on fb destroy
-- 
2.49.1

