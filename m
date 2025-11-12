Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A546C54C8F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 00:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A01010E7BB;
	Wed, 12 Nov 2025 23:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmVSYYKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59CF10E7B7;
 Wed, 12 Nov 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762989310; x=1794525310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Flp18mGDkHR8PCS+SMWvLQPjrXPQYBpAORaK8aCqfwk=;
 b=QmVSYYKKNWCB89q2MuC0bDBHz3Fm5MiCGvN8Bj6klDOCyN4Es2d6mc5f
 /CSpPAtFCB+YwIc0oBLkowVYmJdm7joPbWnMB5y0uiDiNsifU0R3I8EVD
 Wx1TkRyliy/TdxLtlJrA0xkCXC9N6HQa9wudG8z13WjpqASAWxaj2LPu9
 JLu9wdeRUtJhgCQCcNYE6ZgEbJYQKij6q/oyc71UZjCoFUrN4w4W1PJFL
 cFe86NvkmfLJUtgx+xfLfMTM6/brUDTCIFDMfTgI7C4+7rRKvhKbNnuQO
 Lq7Y1OzI4tXvxLgLHufyGEN8eIveTabVc5N6vVi5HJXJgnzAYZEWKlIO4 g==;
X-CSE-ConnectionGUID: NEbyMCbUQciuq5rHK4FCjQ==
X-CSE-MsgGUID: 1mLrPE68Swe8Pm8LlfTK7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76168108"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="76168108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:15:10 -0800
X-CSE-ConnectionGUID: 5dkgqxoQQ8mDt47mOAf7fQ==
X-CSE-MsgGUID: Z8vwg80mT8uHubZpMXnfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="194530798"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:15:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 15:15:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 15:15:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 15:15:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ4XhtPHn1TF//Y88g29jExYZ/7CJzAfzxb2LZKwUrOihqsXUswN/xxhR37zdFhHMN/k/dAcfyin7N7ea+YhhpMqR8yWmocH9JH5M8v3L2o7Q0DYkx4Uutj6qZOeG5EXHlNPbT7x3LyHgd/Je1AZBjkhqjubu7CPnyBisWAGhY9YnWii7Ey6adUQjr1/C/a4nQbDdlN9Q8w3Lek8cx9pSsHRFC/e+fdgYf4XtPSYTlKR3Sm2J6UbHCgzqu3T9ykndoSH8astp9yO/spTLBLqKQvsNFsD6upzZV1KPJSNf16WMz1RJTl9VeG2ITpPqPAe+3GS4QHTtOe8dhgXs7vyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVbrSWwwJw0jn9wiac30OSzUfd+gsQqpyU2FvXICF4Y=;
 b=WsTgSvi6WJji2F2WJl1XZ6omzgZWLmUxe1JCb1YoWB5Mf1936Nx4xjLzJ2rt6Vf7w3HIsoBFeKKrROIQOF7h9wgAMX4aNJyNEDtE1ROLu+OR1SCMYpQ+j89Lr++EFjR5/WsetKwMebA4+vXqQjNDEUHqii2tz8G90qju63UekI5FxCTTkoZQphA88nluS9OVPpFplIvYLjH93z5aurVci8uQwKNFnuo39sQocwra7OfjJN1NwgwvRxMvWuMiU4z8/78gk0reOytEFYTOGw4V3lz/BHjCZDesIlWmQFUtev8dwFKhyRygkomQd/iUOfAxbrG4WLgQ3EGbpahkKQnI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Wed, 12 Nov 2025 23:15:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 23:15:06 +0000
Date: Thu, 13 Nov 2025 00:14:59 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 13/24] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Message-ID: <akkdrkhzypmqbnazyek7htd5r4umg6en74mnuoamyn6ju3didy@54ysh52vthmf>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
 <20251112132220.516975-14-michal.winiarski@intel.com>
 <aRTb7nvT1jpd_k-h@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRTb7nvT1jpd_k-h@intel.com>
X-ClientProxiedBy: VI1PR10CA0095.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5a93b5-0cd1-4f39-5b3c-08de22414f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlNqNjdFcTdyV3hXTWdMT0ZHT2RKMU5qaUdhbCtEY3VsdEltbW90bnBwTk94?=
 =?utf-8?B?QXkrdjV6Qm1HTXIrTmhMOXcxZUpmY3dxYXJhREN0TW51R1kySEZYUTBxNnBH?=
 =?utf-8?B?OERFTlkvQTZEOFI2Q2FEbERHQjNCVms2Nm9GeW1kY0Ewdjl5SFNxcDZsWDF6?=
 =?utf-8?B?MUUxdEFHc01nMGgvZ2lhblA3ZWo1YTNsalJMVVRuVXBraHYxWC93T3BqaUxW?=
 =?utf-8?B?V3VxSjdHNjNPdGxMK1l2TzJKZkRDTEJGU0RUcytTM0s1SHFKdmN1WU0zZEZ4?=
 =?utf-8?B?cEhrOTBiSlFJUmg3SktEWDc4VVFWM3YvTStUQllTQlc1ckJSWVU2enBNcTFv?=
 =?utf-8?B?V0RTN2RVcm94ak50VitSQllBenJZNVNpZFBDZ2R6Yk12VExtWERvRHNrM0hJ?=
 =?utf-8?B?Z1lrTTU1YkVpcURkc0JldTA4OVB0WDEwTFZZTTZkU211d3NpSTJpRE1mSnJm?=
 =?utf-8?B?anYvbTcwMENTRkZ6U2hpK1MrNjlVQ3htVXVYOVFDbHN2dnZPVFpteVBLaExZ?=
 =?utf-8?B?VXFwNWZuS0pGNUxXdGVrWXFvM3ZCVkpCa2ZZeFlWeDZJL2szVisxY2ZsNlhB?=
 =?utf-8?B?TXNpMFFqZWVXYmUwaUQ5UUx2dXR6K1NHR0RoK3VvZlRoQ29VWVFtQitTOWlL?=
 =?utf-8?B?RkNBcWVtbkljalh0NkhZK2Ewd1pWdGVsa3FGTEpPall5U1lqRGorQmlobnh2?=
 =?utf-8?B?RUxTcnN5eXdleC9aYVJYVWQvMUV5RWluZjFvaTVVeXF0elJNamFFM05JQXRU?=
 =?utf-8?B?a2lFSjU1R1BKU1F4MXByTnVXV2xvaGR2c3VGR3YwczZFaGdpN0ViRW5vbnpV?=
 =?utf-8?B?VkxlSDk2K1MxV0llRDVIcEZUUXVnaGpTUUd0VnpEQzIvQ3RrakhpeTJJU2tN?=
 =?utf-8?B?SW5lNlA3WDhFVTNzNFVQTnpRVXA1UkNhSHZ6dG51aDM5L2E2Zm1nSGxXQ0tT?=
 =?utf-8?B?NzgwRW5xeFMxWkhlRm9uOHJjUnY1bzJac0ltdVlEOWZ2RlQvNTVGcmUxOUND?=
 =?utf-8?B?V3Nrano2M1Mxd2tDQ3F0NjgzdVNiSWNMYnB4dzV3Z2dpaFdCTXIxa1lveFNz?=
 =?utf-8?B?RGZvRWRFU0gwTE5CL2ZUcTJPOWZ0aU0rR1llWW5TN1RSWG5yOXlNdzRTTHBi?=
 =?utf-8?B?VUxrMnVRdEc3RmRqejBGMFcrdGdOcGtBQXA1RVd0K3ZsbUh3QnlKS0NFR0tO?=
 =?utf-8?B?VUZPQXkzcXZqNEx6ajc2cGNoLzdWRlJobDlRUkoxenZGeHpNVjFJU1dJbW4w?=
 =?utf-8?B?Q2Y5SGRRY0JPd1loelJFblFjdm5yWCtuaWJEdDc3K2xEa2RrTzhEVm5KRXFH?=
 =?utf-8?B?YU1lQTVESWQ0eUVuQVRJdW03dFIyaFJSS2picE5xd0QydStCTHRVR0lTcEh1?=
 =?utf-8?B?NjVjVVV2NHF4Wk85ZS9kenFHMEtxYVJiSjBmNjZXckg4OUtFMmlZcERJbElt?=
 =?utf-8?B?cFNqSUNVVGZsekU5aGVZRWwyaDV2UVJWdi9FK0VPMkJHdWJPSHZFUkVhNEty?=
 =?utf-8?B?Q3UxZFNxNFNFK3lwTlFNYzNtUUR6ZG5rb3BMWGZsOERJRVdBSVU3blB4Rk1Y?=
 =?utf-8?B?cmpaY0VUN2NtT0wvc3prajVqM2oydmQ1dmZGMlU3UlJPZU9tUlBOV0dyS2VO?=
 =?utf-8?B?NzVXTysydlNtdFB3TWxoRHZDMUpMbnU1SVV6dnFndE5pRm9kRWRMK2RLT3l3?=
 =?utf-8?B?SVhXdlV2SDZyamE2R0t6SndRRHE1bk1JMHJ3aVgxQlJTWU5hMjF0RExCUmlD?=
 =?utf-8?B?czFnTWlBYWI3b0N1SzBmNVEzT3NMWWVOZFBVdDJwdUNYenlSV1dhMzE0SEk1?=
 =?utf-8?B?QkN2dmNFMVhpWHllcEgrS2YwSU5CZmpBT1lvb3VJbmsxb1pzNWd3clBCaGdV?=
 =?utf-8?B?R09kK1EvdkNUWVAvTWFTU25yd21uZFQyTnRsMjA0dGw0NUlkeEVQQjcwazRF?=
 =?utf-8?Q?uM4Q1c/MLP+3nTfROHJ6hHgC6oAVPyLs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkdXeXB6WW9tQU1nVDJEUEdnVmFsQy8rMDdRYW91Z0lkVEtoRUJldTQvOVpP?=
 =?utf-8?B?NlFmZ0V1TDZVZittOFFQdzVkYVV4ZmVRSHdJV3NhMGpMYXJZUjFQUUlPZndh?=
 =?utf-8?B?TlRWR3NUZGdocHhKUi92dDNqc0VCVGJxWjA3TklwZ25yZzVQU3dXc1pibTlk?=
 =?utf-8?B?S0xEdXhkN0VtdG5xa1RsdFI5azVIYXg2d2tpOEw3SzFBVWZEY0lDVFY5dFBT?=
 =?utf-8?B?ZGV3cUdvR3dTOGJ0YXIzMXhyMGNJVXlzT3pSVmFZa0IxazFJaG5pWGJVaUdU?=
 =?utf-8?B?djF4Nk8wMmNDODRNenJTUlpJaTI5VkpVRE5HcUduQXpYNWg4WVBQbjBRbGlp?=
 =?utf-8?B?c05DMjUzZXc5WkxoYnQ0UzcvQ3JnU2VBd0VITXNTamhTeDkyTDRjalBxNDNw?=
 =?utf-8?B?RFowWllVSnpRUHBnOGp0SVhsWWt6YmJRTzBjUGpGZnVTLzVrb0RnZVQ5N3Bi?=
 =?utf-8?B?amdEZkJNYWNRYlpZRzBlVC9ibFNOWUlnRFlmd2dXWXhtMzE1K1ZFazNVQk5p?=
 =?utf-8?B?UnQxM3c4K0E3QTUreE5jVFgxQXNrVHpjeVZNL3N3cW9jdlZLUlMrNmFNaEZi?=
 =?utf-8?B?RldxMDRiYkJNcmFiSWw3eEg2UWplNGxzdFZ5cG9tcFhLUUJmZTBGNUJJQmZG?=
 =?utf-8?B?RHp0Qnd3Y055SkVpTkRFOWxPWTJJN0llMksyWWtvSDlvRzl0N3lGNFJUWlVH?=
 =?utf-8?B?SEE3SjZHNll4eXlHSFRsTlpPSTVZdE1wSDN2bG44N3FKYnN3S2dJTVRBMFNz?=
 =?utf-8?B?ZXRqQU1IcnhHM0Zja3hyUHlZSk9ZR2lZTGlKLzJUcW1JSVVjWjFmYU1RZmRO?=
 =?utf-8?B?djVWZWFJWXhUdkpsamk0MzFXdnF3YTR5TWNyRUQxeFM5MTIwY3F1NDNiTXJH?=
 =?utf-8?B?RjhQTUdVQmpKZ2FBOTNKcER1bGpkVFRaMVlXbjNBWFpIM3dudnhsUzNKRmVm?=
 =?utf-8?B?QUs3NmF6Ti9KbFpITUhVQmFIcnF4ZVdRTXdqeGViQWc4YnVnWHVnQmNjMDlm?=
 =?utf-8?B?cWF2bUg1YzlobTF4Q3VPS0czY1hjaGdMMFYwRWc0YXQrL3pxNGxLLzQ3WVFN?=
 =?utf-8?B?M1JldUlpb3RZUS9HakkyRzAzNDFqaUJmbEFoMFlwL1o0a25hZnhjTEZIVlpX?=
 =?utf-8?B?a3FrUHp4YlZMc2YxL1ZiMDZxbk9DOWZxWGVhTVZxNXlWYkJhSVNUK1ZjaSs1?=
 =?utf-8?B?TkhTRW1uYXh0REliSmttNi9YYk1ZR3NXdXlnSlU1NHJBRWFUcVRqNUYwbDNk?=
 =?utf-8?B?bXdTQ3l4MkQrNXMrYTFNN2xtZkZ3UU1QNzR5aUlLakYwL2NzYjBJaGEvby9M?=
 =?utf-8?B?aFdMTEVzTUNKQTdjRUM1V2lPUkdnVEs4L1J1QzBnRkM2MUJLUVkrYjUzT1d0?=
 =?utf-8?B?Q0dzUnRhRzhSNlB2UzRJakhPdGdZWkJjeXg1WXRyT3c3OG9mUnIrRHo0YW9x?=
 =?utf-8?B?Q1RYS1lpcFUyd1pkNWhjVlF1Yjh4QlF0MitoU0ZjSjAyQVE5eitOTDlMVk0z?=
 =?utf-8?B?bGVQcm81QkdjdzhKZVp1a1IyRk9LVE84M0VzcEFJZDVnSEV4ZzZ2TGJSMS9H?=
 =?utf-8?B?dVViV0oxY2ZYWFFKeTV1eXVzckYrZFZDa25hQ0g0KzhZUzR1a3hjYW9LVkpX?=
 =?utf-8?B?QVZkQmFBUkw3UUFueWZ1V3dWTEQzNkRuMWh5d2FGNnBlMEtsaFRsMkNSSVBh?=
 =?utf-8?B?aEE5VHZKekM1RXh6WmdMYjNhOERpTHFCMys1dmpzLzA2YlY4ODFMbjNuNkp1?=
 =?utf-8?B?dDFJSTQ5b1BCY3RSSXU0TGJ6aXh4dGJaYXYyR2EybmhXNzZiYTNJbkNCRmgx?=
 =?utf-8?B?bFBZNW9tUTNUVjBRQnNaR2l4SHUvRU9JMkdDeHNkUFlCSUtQSEJ0SmYxSUZW?=
 =?utf-8?B?bVNTMW1nN29USlF6Unh3TkhMVGREMWhBbURkaTQyNWpoRjVrbktvcXI4VGJq?=
 =?utf-8?B?Nk1uNCtHSEpLSGxUMnMxTjRNL09ER0VIcUJ4OUEzdmY4MkNVdEZNbDBOa2V3?=
 =?utf-8?B?ZFN2Tzc2N2lBMG5nR3NlNFN0UVBiRy9lbUdWdEJ5VElWeXdNVkJuVUhsUEVE?=
 =?utf-8?B?bXJEVFQvMzR2M1R4SytuVUY0bEl0ZmtleS9xMytkSXd6Nm5pRHJpSHozdXM2?=
 =?utf-8?B?Nks0MEZmTWZIWkNKVnp5UWdnVlNZMGFidHlPdmNFUEN3N1BYTXlHeWtiMnVk?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5a93b5-0cd1-4f39-5b3c-08de22414f63
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:15:05.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKtXW+Wq7AaY+7ZteCLQebxhV1FQndeLZ/8UnM8WNtQZRrtd+SQXApex3Vcd3j/aR2OhhewaWG3h16U9Zaw96Hpy5QKtnQGl40ZXOehBSsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

On Wed, Nov 12, 2025 at 02:11:42PM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 12, 2025 at 02:22:09PM +0100, Michał Winiarski wrote:
> > In upcoming changes, SR-IOV VF migration data will be extended beyond
> > GuC data and exported to userspace using VFIO interface (with a
> > vendor-specific variant driver) and a device-level debugfs interface.
> > Remove the GT-level debugfs.
> 
> Perhaps this should be retained while we don't have the xe-vfio?

The series adds device-level debugfs, which let's us get the bitstream
with all of the resources (GuC/MMIO/VRAM/GGTT), from all GTs.
I don't think we need a per-GT control for only the GuC migration data.
And if it's needed - it could be extracted from the full bitstream.

Thanks,
-Michał

> 
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
> >  1 file changed, 47 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> > index 838beb7f6327f..5278ea4fd6552 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> > @@ -327,9 +327,6 @@ static const struct {
> >  	{ "stop", xe_gt_sriov_pf_control_stop_vf },
> >  	{ "pause", xe_gt_sriov_pf_control_pause_vf },
> >  	{ "resume", xe_gt_sriov_pf_control_resume_vf },
> > -#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> > -	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
> > -#endif
> >  };
> >  
> >  static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> > @@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
> >  	.llseek		= default_llseek,
> >  };
> >  
> > -/*
> > - *      /sys/kernel/debug/dri/BDF/
> > - *      ├── sriov
> > - *      :   ├── vf1
> > - *          :   ├── tile0
> > - *              :   ├── gt0
> > - *                  :   ├── guc_state
> > - */
> > -
> > -static ssize_t guc_state_read(struct file *file, char __user *buf,
> > -			      size_t count, loff_t *pos)
> > -{
> > -	struct dentry *dent = file_dentry(file);
> > -	struct dentry *parent = dent->d_parent;
> > -	struct xe_gt *gt = extract_gt(parent);
> > -	unsigned int vfid = extract_vfid(parent);
> > -
> > -	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
> > -}
> > -
> > -static ssize_t guc_state_write(struct file *file, const char __user *buf,
> > -			       size_t count, loff_t *pos)
> > -{
> > -	struct dentry *dent = file_dentry(file);
> > -	struct dentry *parent = dent->d_parent;
> > -	struct xe_gt *gt = extract_gt(parent);
> > -	unsigned int vfid = extract_vfid(parent);
> > -
> > -	if (*pos)
> > -		return -EINVAL;
> > -
> > -	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
> > -}
> > -
> > -static const struct file_operations guc_state_ops = {
> > -	.owner		= THIS_MODULE,
> > -	.read		= guc_state_read,
> > -	.write		= guc_state_write,
> > -	.llseek		= default_llseek,
> > -};
> > -
> >  /*
> >   *      /sys/kernel/debug/dri/BDF/
> >   *      ├── sriov
> > @@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
> >  
> >  		/* for testing/debugging purposes only! */
> >  		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > -			debugfs_create_file("guc_state",
> > -					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> > -					    dent, NULL, &guc_state_ops);
> >  			debugfs_create_file("config_blob",
> >  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> >  					    dent, NULL, &config_blob_ops);
> > -- 
> > 2.51.2
> > 
