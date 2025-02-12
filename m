Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20DA31D94
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 05:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE3810E7A2;
	Wed, 12 Feb 2025 04:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmGI0ixu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700F10E79F;
 Wed, 12 Feb 2025 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739336011; x=1770872011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MlGTphVVL/MLnoo9PGRMK5QEPMg1dY2lmQivuQ4lzkA=;
 b=fmGI0ixuas4NG2jJ5j35eBUvt+VKWGt1mxQazltfgQIRqAflyaMRA79F
 PeEdfFAo/iAvwBOrwIcFOYruBLVFxlumsptecuZIaZ7c1GEAiyE7PotEp
 KKI7DYVv2NBmg0mJ2nwE1AN8BGvrh2FNdj2OKDcVLR2MxsTj2EwpRHMpl
 4NTYRChuQTlCXPjRdgea99/GmgqFOCihayYM1LyvGwi9K3gsPTxGmFxrR
 MaaE1yU9X6c2u3dSQzusUOwfjbH4QDhON0ufPmKeO4WvmUNLqJ9Mp3Zz+
 14yB7Fw5ng3uAO9ZLYiYVF2pXy3xa+1kscu4NQJWUeq3bZwTKklXMVSLf Q==;
X-CSE-ConnectionGUID: cQfZgyNWTVK3joSvKofYMA==
X-CSE-MsgGUID: +24CHTSAR7eq0FT/PVPZRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42821125"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="42821125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 20:53:30 -0800
X-CSE-ConnectionGUID: v+Mi1ZnoTC6WCU4JJgWytQ==
X-CSE-MsgGUID: lKdTo6UGSV+GEHLoqCfT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112928931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 20:53:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 20:53:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 20:53:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 20:53:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoOzCmthZ6Xa0bAn4zwiD1+2vMBwP58yh4BKv+DVN/MJ3XYL6NLOiqscGUsQ9c/NMpHV6/aHY+iE/zbQy9Wl04gD4So5jj1sjDTlE0S0xKQiPE7+5HurTLLtomUa4JWDskvpBBiVD0c8qdqx7N2/r2uCwVukE892havebwYNba6t81xnS57Vyrr9He6nSZLQu/GqY+/pEVOJoKgS/YPOky0jXZiMf0Ijg1Kl7sNe+aMmZNqQc1w1YCwFJZhrHXWaiHtRGAFZC6kiWVb0s5PtS8vXol7rQwgbgvKfFJmvQjNtSdXaThKVH3jYNsC2cmF+pWfBZp9KrbF4H7uJNQZYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlGTphVVL/MLnoo9PGRMK5QEPMg1dY2lmQivuQ4lzkA=;
 b=TOb3NSN9OgWY5q3IF5a265aac9huL7j9fGpnOfh3/3gAlBRklAbOhqnVauQagbdfobF7PVGENn/IsH1AscVastMuF5YYkzRxAWIs5HKPWpWTou+V4JXtcqzJ5Yi7YMWDvr/4iomDia6O9w/30UhJdnA+0WZA4HzlqDgAAbVPDzts/w2fol99jM7GCWPJ+6zTcCf4oExV4oTW+9Dn8KjXHIAsHbLxs4qPmUgKt2oneLRIyCGxx0Nrh6oEp/WnHEZ56BQQ5fWOlpfczybIIidoDRITsRtU/BdkJ9L20iIZVPE9oElFV6SoymrCXEH5Ef8F2+xk8L8brOIUQrpABatZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 04:53:10 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 04:53:10 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v4 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v4 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbd7qg1Li5OhDye0qCOftu9r57D7NDHy3g
Date: Wed, 12 Feb 2025 04:53:10 +0000
Message-ID: <SJ1PR11MB61298A26E2E2FD639AB75998B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-2-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-2-9a5b018e359b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8502:EE_
x-ms-office365-filtering-correlation-id: e783e584-d7af-4e67-3518-08dd4b212679
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dlhqbFpmRGwvTi90UWh6eHVTRzFIdXYyYlNHM0xvSitDK041eng3MVhubFdS?=
 =?utf-8?B?YTRadnNHYXBlS2F5Q1dzQXlheEMxb1p1dWhOby9vbEFZTnRHNHhDdlVkcHJK?=
 =?utf-8?B?dnJzVWxCeVNBQlRQUkZUc2ZrM0VhYnkxM0t1U2lRZ1RHOWVmTDhLaGw5Unp5?=
 =?utf-8?B?TFFINDlWZ1JCNHoyRHV1YndiZG85SGY2VU42dFVFNFpJazNhRWdKNllzRW5T?=
 =?utf-8?B?Szlkd1Q1eW1wd28yMUtXc0tXZDlaR1F2TTA4WVZ6NFJRRm9rVUV4WmpXeFA5?=
 =?utf-8?B?N2VEU21hSzM5Tm40cXVvSE9PZFZ2eHViMkRwM3dkdEJ0SlZjWlpZaE51RnF2?=
 =?utf-8?B?YzYydVRjcUpSUDZ3K010UHl4Tm5pb3htTzl4RXBwQjdydEliaUErdnZqOEFo?=
 =?utf-8?B?cmtVOWFYYXpzQjJBKzlGT3ZRVXl6WWwzY1Vka2ZWZ0pNNVd1U3Z6QzFUN01V?=
 =?utf-8?B?RThlOUNpTUF6b1hrZUtydE9yNE0zVlVUZExRTHFuODJtMmhrUG1MdHd5RHdm?=
 =?utf-8?B?U2w3NFRpWFMxZlMrelY2bDc3TnZ3cGtLQ29IdjlOcDhKaExZakxQSU5oYmR4?=
 =?utf-8?B?MEtBSUZvem9ocVR5VmJETFRkMlpwWFRxSGp3eDZUcGczUjBpZUV1ZStRbkZW?=
 =?utf-8?B?WjczZ2RsZTFKWmpveFdUcDJBajZEYVp2T2pxTVJkZkpBdUxNckdZN1h2TmZw?=
 =?utf-8?B?aVVwUDFhUlNac1RGWnlFR25RTEM4UDk3QkZIc2FBOTRrT2sxLy93UEhYM1l5?=
 =?utf-8?B?bis3SURKNWxYTFR0TEV3TGNRMEhVMFk4S3h0RWtkTmJtVm5TTG9TZm1yamtM?=
 =?utf-8?B?ZG5pamtqd0VGV3lnaGFOZDR0YWpPMkxJUGJ4MHdtdnM1STluREdmNkw0NjlE?=
 =?utf-8?B?VENhdkxYZWJaR1Z6cmVBWmp1elpkVno5ZW9YQTczcE9NTUdNZ1NqajdTUXly?=
 =?utf-8?B?RjFLS20xS25XcGU4eERoYWlaTyt6ZXQ4ajJ6aXhIQUJ1eUlJNTA0anhSY1p2?=
 =?utf-8?B?ZHFmRWJVb2xuK2o3SkFBZ0JZNXNjbmZJSU1SRTNLZjNBN0dqWUJNR2lHRnhX?=
 =?utf-8?B?NXNYbHNycTg0WDdwQ0FyVW9QQkU2V1J0ZGxLQ1pocmRRRXlwY1VpbkhxSHlZ?=
 =?utf-8?B?bGxHQ2QrWWR0MWV5WmhuWjBDN2FrWkE0cFE5eWhmaHlkcnpVV3pXVWY3Qldv?=
 =?utf-8?B?UTd2TG1uSFNlVUFjQzdpSXMzTWMrQkRVWmphYk0zSzd0SCt0ZmZHWE03d2hQ?=
 =?utf-8?B?ck9oTzVpcThjbWZOUjlVdm1XbU5VSXcrOFk0Z0d4T2ZqYzduU29lcTJvTmgr?=
 =?utf-8?B?MkFDMGdIZ2huUFl6S3Bxei9Ka2pobVZkMmhCYXozTWVaekU5ek1oRVdHZFJU?=
 =?utf-8?B?NlpCRmhiRlpWdEx3TXlmaHNrOFRhS081bnV0NU9WcXpNd3hSUWgvakNNRndB?=
 =?utf-8?B?bU5Rc0Zna0F5ZDZhY0pJQkQ0TXk2MURNcHpoK0pDUFZSV01ZOUNVR1FFdHV5?=
 =?utf-8?B?QmpEOGxOaU12d01SUG1lTDhLR2pCOUJvNFlpazhRNUtPbFJiWDcvd2ZkWVl0?=
 =?utf-8?B?NlhSUEdTVGRUZjZaSDB0cnJYVmtKbDdia21lQzFUTDRSWlJ2dHNvU25QclUw?=
 =?utf-8?B?eStyVHdadlYweEhSbnRKSGhCRU82MlVjcDNJeDgyWkk5WGloZUZscFJUV3ZU?=
 =?utf-8?B?anlrVWRxY2IzVWVOQVFnbms2a0JZRVZFWVhHR3NiZHdveG9SV2JvVjlvNDFR?=
 =?utf-8?B?T2w3RFJSdkZwNzB1THljTnlHbmlXVmNhZDRrbzBhT2hHRWY3T3IwODVVTWVn?=
 =?utf-8?B?UjlONFMycmEvL0t5S1E2d0c1NFNxZUYyRmN6MDY4VGRvZTRNQWRNZ0hHcTRK?=
 =?utf-8?B?VFFsVHdDbmJPdDVQL0ozQlpmdkpVbElTazZ3aGU1SS91OGdXUEJjazNqdFpF?=
 =?utf-8?Q?/gjeIRn2m1TdFFfDpY2Orya+JtEYjjGb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk55Y1J4RzA1VnliOHNXTVAzeVN5UEcwc3VUSC9zOENhVlFkZjMvQUNGVndm?=
 =?utf-8?B?Y3BMMkQ2MHlzOXRPelY0b3h1YUtuR2pQT3RyUmgvRk5MUXRFZnNHaGF3NjhB?=
 =?utf-8?B?ME1SaCtwdzR6eEJHQ1k2SHI1UTY3Q1pXWE5MNTFLMHVZV0wwNU5uQ0V3OGxE?=
 =?utf-8?B?MVlCL29EUzRSR2RRM2RmYXFjbHJRNkU2KzZaTTBCbGNoSlJBVnVxNk8zTzhh?=
 =?utf-8?B?aEFLVGlEak9zRGpFblphcWc3RUZSUkJyWUo2VXV1aDZLWFgyMDlMTVNKaWVk?=
 =?utf-8?B?S2JRY2ZyRU9CK1lLMkc2cnFtVGFTTkVaT3VCMXVoK3VndHNVYzRURDBPNk1q?=
 =?utf-8?B?ZE5KQm1jTVlEL0plWFBueWE4YmNtRDVTVm05WEo2TWdMSElPM0dON2U5Q0cw?=
 =?utf-8?B?QThocHNZQ3hCMlVOYjhRSDd3NEo5TTRBZUxsNVpnZ3FETkF1bGlRZFJjMlp6?=
 =?utf-8?B?ci9COEg1cE4xY0p5S0daMHpFL3pLRjJZdVQzTnVRR3lZZ1RJL0lFM1FBNXpp?=
 =?utf-8?B?aWpyV2NjcmR6UjdxdGVBTUtrUGRNT2FuUUlnSjVmYjI1MEc3dnNXZlVlYVFa?=
 =?utf-8?B?WGdCZlpvdW84Q0ZwQW5NbUJyMmw5SFJYbE5hL2tzZFY5RWkyY2c2anJXd3ZC?=
 =?utf-8?B?N1FHN3RTTmZoQURJVGFSVHBvZHBSamkva3JZaFJWRFkyMnM5UjB0MUdUZUM5?=
 =?utf-8?B?Rmc1SldoUUNHQ0FYcFIyWm5LWndIYmp2VE52WEhodHl5YWZQL3dOVSt2SnRX?=
 =?utf-8?B?MHIwcmFkcEhXZVJmN3RlZlJDQm5QRm5oK2NsRWZCNmN1YXhnK3hXTFE2R3E0?=
 =?utf-8?B?TFEweUM0UlByZFRsTmNRSUhNeE9hNjQ3N3RLRGdSTHdsKy9KeFYwOS8yODc0?=
 =?utf-8?B?MVJFd3FFSFpzWGNHWnp3WG41OVJRZ2hBWWxTdURnNU9ac3cvU0dPU0RMRWV4?=
 =?utf-8?B?Q0NhNS9CVm9VUmRJS04yalZMbERTdFdIcXhBcURPNGUyQXl5Rk9sRGZIRUpZ?=
 =?utf-8?B?aVBLbjRIcjg3eUhLcUswRTB6UGJNQ0ovSVBnbjhMYnJhQlFUWWpjbmhlMGJh?=
 =?utf-8?B?WFJHVUtBczdVWWVyaVJ3L0IyQmtPMDcvTEtlYWRETjF5WDBBK1JoNHRqbFo5?=
 =?utf-8?B?czY5K2RKNEdBTEltMFR6ZXZxdFRNZ05EOVdsWVZUenZlU2JzZ2lVd2VFUGFl?=
 =?utf-8?B?TFB1VTRtRVpvMzM3aEtEWk1JRTZ0VjlrV09IcmJDWjJhUEJBdVM5V1NlYU9V?=
 =?utf-8?B?Y1NyYXZCUzllbm5tbmVqSnMwc1pGUzgzdHdIUE1iU3Erc09DNlZZYUlSVHc0?=
 =?utf-8?B?ZFZlay9NaTYrWk91UlZGbllIU2p3WXo2ejFESktXc0hxS3hOSFZOZWZad3Nl?=
 =?utf-8?B?QXE1RjZBY214TmtzaWJuK3Y5Mm9ERXMzVEQvN09wRHBNZ29YUWppNkRrckZ4?=
 =?utf-8?B?U0hzMUwxMVE0bEY0cmxVTHJqT3FZZmg0a2pxcXZhNGdzeEdVNTIyUTUyQ1FC?=
 =?utf-8?B?dm8ySnlNZHJlNmpTSmQwWUU3QjVwakJ1YlRmcHEyTFZTK1lNNys3Y0VmaDNX?=
 =?utf-8?B?c1NXM0VlbGFaTE00QmwvS2dZZjVXcEdQSGpaTUZzV1FIMGVRSGQ0RmRwTUJw?=
 =?utf-8?B?RzFFSTA3VTNvSnFMSXZRVXZ6cElnVkJVWHZxNkRuNmlyVElkdTF3VkVETVIw?=
 =?utf-8?B?Ui9YWkFrUDVWOWx2djhWM2dhMHdSaVRPT3drbSs5MXM1eFhkK0twMHVTejIz?=
 =?utf-8?B?VDYxY2R5VDdyTUppbnhObWk1TE5xZGJTNHNQU1JyQ2hZZEtCckxQb2Vwemtm?=
 =?utf-8?B?QWIvcU9pb3hNaGM2UmRFQUNMKzZ2MXBnMXdtSFNQNm9mcnJXQXBmV3ZLSzRH?=
 =?utf-8?B?RWdxNlJhOFdtZUhKU24va1k3K01jS3dxWitSeFBOTldvamkzd2h3aUtSZ3hF?=
 =?utf-8?B?LzZtVEg2MUlpOEM4SHgzSmw4TDJMM2d4bklvcG5hT0o2eGg0UG9qdkpOYlpq?=
 =?utf-8?B?dnE3UVFTOXZPcHB6YnN5YWl5S00rczFodm9uY1hKQnRFZUF1dG9BSWRpSlVO?=
 =?utf-8?B?R0xTV2J1SnI1YUpwWThHUnJGU0FDYlJwelE0Wk1pN2hKczhvc3NMcmJpdlo2?=
 =?utf-8?B?blREdHJqZWY3TVRRQ3oyUXk4clBoN3BaVlV0eklHZ1hNQTlRWWtUT2h1azd5?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e783e584-d7af-4e67-3518-08dd4b212679
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 04:53:10.7633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nsv0AlzoUy+j/ZgKT+G3LLnLNuCWxckstg1DqtotruXNwJQaBN8Kj4GslTQMl19RPNlykJF53Q30ROrFRCIVX8FZ9hBXZZ7ieeieX1hRIqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUs
IDIwMjUgMzo1NyBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJv
cmFoQGludGVsLmNvbT47IFN5cmphbGEsDQo+IFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNv
bT47IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY0IDIvM10gZHJtL3BsYW5lOiBtb2RpZnkgY3JlYXRlX2luX2Zvcm1hdHMgdG8NCj4g
YWNjb21tb2RhdGUgYXN5bmMNCj4gDQo+IGNyZWF0ZV9pbl9mb3JtYXRzIGNyZWF0ZXMgdGhlIGxp
c3Qgb2Ygc3VwcG9ydGVkIGZvcm1hdC9tb2RpZmllcnMgZm9yDQo+IHN5bmNocm9ub3VzIGZsaXBz
LCBtb2RpZnkgdGhlIHNhbWUgZnVuY3Rpb24gc28gYXMgdG8gdGFrZSB0aGUNCj4gZm9ybWF0X21v
ZF9zdXBwb3J0ZWQgYXMgYXJndW1lbnQgYW5kIGNyZWF0ZSBsaXN0IG9mIGZvcm1hdC9tb2RpZmll
ciBmb3INCj4gYXN5bmMgYXMgd2VsbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0
aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fcGxhbmUuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4g
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IGluZGV4DQo+IDQxNjgxOGU1NGNjZmZjZjNkM2FhZGEy
NzIzZTk2Y2U4Y2NmMWRkOTcuLjM4MTlmZGRlOTg1NTc2YmQ2YmE2YTA4Y2UNCj4gYjY0NjEzYmQ1
ZTBhNjYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IEBAIC0xOTEsNyArMTkxLDExIEBAIG1v
ZGlmaWVyc19wdHIoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYg0KPiAqYmxvYikNCj4g
IAlyZXR1cm4gKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyICopKCgoY2hhciAqKWJsb2IpICsg
YmxvYi0NCj4gPm1vZGlmaWVyc19vZmZzZXQpOyAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgY3JlYXRl
X2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUN
Cj4gKnBsYW5lKQ0KPiArc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZQ0KPiAqcGxhbmUsDQo+ICsJCQkJIGJvb2wg
KCpmb3JtYXRfbW9kX3N1cHBvcnRlZCkNCj4gKwkJCQkJCShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwNCj4gKwkJCQkJCSB1aW50MzJfdCBmb3JtYXQsDQo+ICsJCQkJCQkgdWludDY0X3QgbW9kaWZp
ZXIpKQ0KPiAgew0KPiAgCWNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZk
ZXYtPm1vZGVfY29uZmlnOw0KPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYjsNCj4g
QEAgLTIzNSwxMCArMjM5LDEwIEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0
cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+ICAJbW9k
ID0gbW9kaWZpZXJzX3B0cihibG9iX2RhdGEpOw0KPiAgCWZvciAoaSA9IDA7IGkgPCBwbGFuZS0+
bW9kaWZpZXJfY291bnQ7IGkrKykgew0KPiAgCQlmb3IgKGogPSAwOyBqIDwgcGxhbmUtPmZvcm1h
dF9jb3VudDsgaisrKSB7DQo+IC0JCQlpZiAoIXBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBw
b3J0ZWQgfHwNCj4gLQkJCSAgICBwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKHBs
YW5lLA0KPiAtCQkJCQkJCSAgICAgICBwbGFuZS0NCj4gPmZvcm1hdF90eXBlc1tqXSwNCj4gLQkJ
CQkJCQkgICAgICAgcGxhbmUtDQo+ID5tb2RpZmllcnNbaV0pKSB7DQo+ICsJCQlpZiAoIWZvcm1h
dF9tb2Rfc3VwcG9ydGVkIHx8DQo+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkDQo+ICsJCQkJCQkJKHBs
YW5lLA0KPiArCQkJCQkJCSBwbGFuZS0NCj4gPmZvcm1hdF90eXBlc1tqXSwNCj4gKwkJCQkJCQkg
cGxhbmUtPm1vZGlmaWVyc1tpXSkpDQo+IHsNCj4gIAkJCQltb2QtPmZvcm1hdHMgfD0gMVVMTCA8
PCBqOw0KPiAgCQkJfQ0KPiAgCQl9DQo+IEBAIC0yNDksMTAgKzI1Myw3IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsIHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lDQo+ICAJCW1vZCsrOw0KPiAgCX0NCj4gDQo+IC0JZHJtX29iamVjdF9h
dHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBjb25maWctDQo+ID5tb2RpZmllcnNfcHJvcGVy
dHksDQo+IC0JCQkJICAgYmxvYi0+YmFzZS5pZCk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gKwly
ZXR1cm4gYmxvYi0+YmFzZS5pZDsNCg0KSSB0aGluayB3ZSBjYW4gcmV0dXJuIHRoZSBibG9iIGlu
c3RlYWQgb2YgdGhlIGlkLCBtb3JlIG9uIHRoaXMgbGF0ZXIuDQoNCj4gIH0NCj4gDQo+ICAvKioN
Cj4gQEAgLTM2OSw2ICszNzAsNyBAQCBzdGF0aWMgaW50IF9fZHJtX3VuaXZlcnNhbF9wbGFuZV9p
bml0KHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkZXYsDQo+ICAJfTsNCj4gIAl1bnNpZ25lZCBpbnQg
Zm9ybWF0X21vZGlmaWVyX2NvdW50ID0gMDsNCj4gIAlpbnQgcmV0Ow0KPiArCWludCBibG9iX2lk
Ow0KPiANCj4gIAkvKiBwbGFuZSBpbmRleCBpcyB1c2VkIHdpdGggMzJiaXQgYml0bWFza3MgKi8N
Cj4gIAlpZiAoV0FSTl9PTihjb25maWctPm51bV90b3RhbF9wbGFuZSA+PSAzMikpIEBAIC00NzUs
OCArNDc3LDI0DQo+IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAkJZHJtX3BsYW5lX2NyZWF0ZV9ob3RzcG90X3Byb3Bl
cnRpZXMocGxhbmUpOw0KPiAgCX0NCj4gDQo+IC0JaWYgKGZvcm1hdF9tb2RpZmllcl9jb3VudCkN
Cj4gLQkJY3JlYXRlX2luX2Zvcm1hdF9ibG9iKGRldiwgcGxhbmUpOw0KPiArCWlmIChmb3JtYXRf
bW9kaWZpZXJfY291bnQpIHsNCj4gKwkJYmxvYl9pZCA9IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihk
ZXYsIHBsYW5lLA0KPiArCQkJCQkJcGxhbmUtPmZ1bmNzLQ0KPiA+Zm9ybWF0X21vZF9zdXBwb3J0
ZWQpOw0KPiArCQlpZiAoYmxvYl9pZCkNCg0KVGhlIGZ1bmN0aW9uIGNyZWF0ZV9pbl9mb3JtYXRf
YmxvYigpIGNhbiByZXR1cm4gbmVnYXRpdmUgdmFsdWUuIFRoaXMgY2hlY2sgZG9lcyBub3Qgd29y
ayBpZiB0aGF0IGlzIHRoZSBjYXNlLg0KDQo+IDAgY2FuIGJlIHVzZWQgYXMgdGhlIGJsb2IgaWQn
cyBzdGFydCByYW5nZSBpcyBmcm9tIDEgdG8gSU5UX01BWA0KDQpSZWdhcmRzDQoNCkNoYWl0YW55
YQ0KDQo+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsDQo+ICsJ
CQkJCQkgICBjb25maWctPm1vZGlmaWVyc19wcm9wZXJ0eSwNCj4gKwkJCQkJCSAgIGJsb2JfaWQp
Ow0KPiArCX0NCj4gKw0KPiArCWlmIChwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVk
X2FzeW5jKSB7DQo+ICsJCWJsb2JfaWQgPSBjcmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFu
ZSwNCj4gKwkJCQkJCXBsYW5lLT5mdW5jcy0NCj4gPmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5j
KTsNCj4gKwkJaWYgKGJsb2JfaWQpDQo+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgm
cGxhbmUtPmJhc2UsDQo+ICsJCQkJCQkgICBjb25maWctDQo+ID5hc3luY19tb2RpZmllcnNfcHJv
cGVydHksDQo+ICsJCQkJCQkgICBibG9iX2lkKTsNCj4gKwl9DQo+ICsNCj4gDQo+ICAJcmV0dXJu
IDA7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
