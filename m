Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52AAC2AC3
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 22:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2E710E0AE;
	Fri, 23 May 2025 20:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dNtQHG5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67A10E039;
 Fri, 23 May 2025 20:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDWvk5veBrt27yuynaKyc9w0i4aQKnL6TqaThi3FMxZAxKkAjvfMi9CrDp7SFk9yTJWPoWMvPSFuCUKAhTrnS2GtA6EP3t+xFeV+vUfPcnArsJOssvMoXNLXR2SGQFe6+lAIPxjcun2o9sATgdywYIND5/wHQTBAZKam02FXQY8Un7YYyro3lrYrPPJtZlx4I4DcsFHywbrBlkbkphn45hGAflBBZYiU7RV2j10WgOzVmRI7anSERQ2gZfJm0cyp5SZvuwSv1B59OsjBYUd3mQVxTf0J1T/8sO6j+9VWKfK3asStnoK/acD9rxQGrBCTbo/BLc79W64Idgm0yyTjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcuvIEPsdODG2IzhJ35EEL5GSZSzrLF/7O0NN5zkIzs=;
 b=hWzJKcUrRNMfVhJPjPzmpvIV9/j+nQaf4JXN6dlO/dbNH+wfi85ByQdQIequtPa093V8vbsOGA1Shgy4Snwo4Dk4a1M3xZi/FAckS8HvCY3wi5ypbuESWfogiwZfPcq9llNoSZjzNHklXcmyO24VS3wrKwG2LG3aa/bIGOor63hb9kIthYw7Y1wq4yORccsMgjAUN3LVE8dHpjZuNNmP5rCK4zTIwMuzQONT3cZ/mMdotC8wEmba9EbPBGXEZ10HFDh9yRTSR9+x5VCebtExUPPqq10kxLgAfVodgT+YGLRxoeOwSXwqJ7skubHy4UVc6gqys4VGXff4FObUmrfweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcuvIEPsdODG2IzhJ35EEL5GSZSzrLF/7O0NN5zkIzs=;
 b=dNtQHG5kgIFE4j98Lf/TNQmBy8xosVnwMOuxa2uXv84f1+bWEdSVa5VYkboh/iex0xbjh2unn8hdWNCCj63IYWh94sqCconnTnEMy1Uc2zHDibNU8OU74vx3aTwGRch+GQUEMqG7v6GG4VQit3c/BoClDkjsLwDs8EJVI6lHvTXWq4xZTwXD2Emi+hV0uiBR7UxOpw/gy6fTbycDcNxWcwCd/pcN+Qd5TBENTREOHiQ0n+apB4M1U2j0OWqmULV+wfnvW3PiUEbK3qlKGAU1fPD0gaF4eCZhPby7v9trrPi7u9noskyB4BrvEUBDFjC8eD+gUACCM/0ujyXKT2SAIg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 20:18:17 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8769.022; Fri, 23 May 2025
 20:18:17 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Jon Hunter <jonathanh@nvidia.com>, 
 "lyude@redhat.com" <lyude@redhat.com>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return
 in nvkm_device_tegra_resource_addr()
Thread-Topic: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return
 in nvkm_device_tegra_resource_addr()
Thread-Index: AQHby/zmFoJxJHt8c0mIqbrRSifT3bPgp6gA
Date: Fri, 23 May 2025 20:18:17 +0000
Message-ID: <334404bdf60765cb5a8e855a74c688bc537531ee.camel@nvidia.com>
References: <aDCdXk98AhLBcWvK@stanley.mountain>
In-Reply-To: <aDCdXk98AhLBcWvK@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MW6PR12MB8997:EE_
x-ms-office365-filtering-correlation-id: 475d4a84-a994-4ceb-bcd8-08dd9a36f47e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmJZYTYvR0NWZTBZUVdNVVJqbmd3alQ5c2VIREpzTHkwY0ZEUXNOdGNKR2hL?=
 =?utf-8?B?T2NOdENrNEhEMkZlRWUwY3AzaUJFNlpHVkt5d3pYRlZMM3RkbjdaT1lWRVNT?=
 =?utf-8?B?b0Z3SEVjdTFTNkFGRTR4Q0xnK08xSkFmVCtHV1FFcG4rdm1hd0ZwbmtEelVO?=
 =?utf-8?B?d0ljSVFtckYydERRdTh1eG9odDF4cTJob1V4N1YySWJuZ01LY2pRNkFlamN6?=
 =?utf-8?B?MUo1VksyVW5ZWWthRkwxVlVtcDNHLzd2cmNvNVB3dHZhelFjS2tkcW00ZXBV?=
 =?utf-8?B?K1JmcmlraW13ZktJZXJRbFpyZmFaZ0tZYXV3Q0ZOaUNZejFoVGxtYWJrTTF5?=
 =?utf-8?B?SmR0SndOUTdHUlA3K0dtSlFvcVhSZzYyLzZLUkpTNzhHSTRHSldxemdQZk14?=
 =?utf-8?B?dWRqQ2NzUGw0OUYzTVdrVGdyaVZCTUxNQzZaRXdDWmNiOXdOcWZkbCthRDBM?=
 =?utf-8?B?Ymp0dksyUzhScVZPdDI3Q3hyeWl5ai9GZHFCNXZWcWUyKzFGOFlCY1ZVSkdP?=
 =?utf-8?B?ZXI4Q0tlT3lsYlJ0QlFMUXJsN29TbkxiRHFCZ3pvdEtTZFFmeFlaRVZSSkF5?=
 =?utf-8?B?L2xJNC9hVlJ4dmJqaWRRWi8vRitMZVFZL0kycjR3c3QxT2p4NnZDTytNOXAv?=
 =?utf-8?B?WkJyTU5KUlZwUFdxaE9MelYxZWdrS0NieGNEUWxmS2gvRDBRdmlTeDkrVTAy?=
 =?utf-8?B?ODFXOFZ6cVVkSDVDbSt3SmJpZU9YandscXBuendrMW5nWmJFVDNVenRQR3Z3?=
 =?utf-8?B?alNCQ0hucU15Rk1zZ3A0Q0ozSG1RcmxQSGE5b0xWalkvR01ySlVKZ2RxNFdY?=
 =?utf-8?B?YXdmRllybFpwODFYSG45R3YxTnV6cWw1YXBGMmNDVnBzZzZodEJDZjJKS2pr?=
 =?utf-8?B?VGRxbDV1dVZ3QnRuZnpsREs5Rm8rWVhWVllEQ0FMUFBuN3BCMXlVQStLRHpr?=
 =?utf-8?B?a1lOSjlKdFBmOVRQMnNLZ3pLU0tTVUhFWmNUZm8xU2tWa2kwSVJzNUZhcmhL?=
 =?utf-8?B?S2lSb1RVcy9icE9JN1ZoS1hDSzlMaUd2dE5lemRQNjZJLzErdWhzZmF5R2tH?=
 =?utf-8?B?Q2pWVWtvUFQwU0pwK3NsMkdHaUJTQjNtemVsNGFpQ0djRm9iMzNPcXpZQWxS?=
 =?utf-8?B?TWkvalUvUEZzREVSN0s4NGIyQmc5SFJMNStWQnR5NHZVcXNtdlJVM1hZM1lU?=
 =?utf-8?B?L0JwSHAwY1ZvMTMxYzI3MzAxRS85QVBDbnhMaE50YXB5MmxBVkNDTzVJV1NO?=
 =?utf-8?B?YU4yb0czWmxGMlRyd2lVamRSaG9oQ3pYTnRmMU9RS3BsL1UrWitjRkczOERN?=
 =?utf-8?B?cHV6MHJwa0dIMnVlVEUxZHdqUytqaFM3QTV0SUtiMlFXZ1drL2xMSG4wTm5p?=
 =?utf-8?B?RHUveTlmNW8vaUk1M01Ta0VaZVFzaXdlczBYcUZxRUd2VzRFMXRwYmEwS0Zq?=
 =?utf-8?B?dnBBbm4wV3I5Rk5RSzJ6MnMwNVlKUkFVenJIZjZKbVNrRG9VdEtLWlNxaDJk?=
 =?utf-8?B?VFZIbmNmMTl2d0VoNnlWRVdVMFh3N0p2TE1odEVYNlY3bi9NdnVvYlhKZVRN?=
 =?utf-8?B?azcxSWpySTkzWGNFQzFwMnRnYXhNK2NYMGNPalhvSzBsK21ockJyT2w5ZUM0?=
 =?utf-8?B?Mkh4S1RqajZTU3BkY1ZVSG51ckN6bzJ4QXBLbHZXNExZdjkvSUlTVzJVdUp3?=
 =?utf-8?B?eXR6aDBXRnVoZkV0S3JxWUZPaVFmdjhrb284WXNpbHpmYWJLUWF2ZDQ1ZkRB?=
 =?utf-8?B?cUFJZml1TnQ1RmZtT2taMzBETkhZNm9VYkREM2o4OGpLb3RzZ05XWmNJaEpN?=
 =?utf-8?B?bzdBZklLL2NUd1BqY0pqSFVWSysyV0xKVTJhOHowM1E5M1ViZE91YWRMb2Rs?=
 =?utf-8?B?Q3pZN0tCWUNFMU9uZ3RhOFBEZnJ1QzhJUWlvWkc5OUN6UnQzNDBJbzZGL0xw?=
 =?utf-8?B?YUlxZlRDa1RUWnVhbW5VREF4cEVFYW9lakE1ejk0cjA3NitZSlBqUjN4YTBv?=
 =?utf-8?B?Y01xclpYcWV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0x0bXpCZmQ0WE50Ukt6Ui9tbThpcVpWS1RZMUgrMy9ic0ozeC91SzRpRzMy?=
 =?utf-8?B?RE04ZmxtRE4wYU9pYzU3SlgxN05FaHVSQmxTc3BVME1rZzdjaTZ0NTU0TmF1?=
 =?utf-8?B?SDlCYmJPTmxxbXNvdzBKWmo3Zi9ITmQwcGdKRTRqb1RuRURmTnBpL1l3bGxV?=
 =?utf-8?B?LzhhbmYwRUxKOUI3YldONDhLZGtmbXdyS2w5V3ZEUlpLNEgrWC9IaiszaFBH?=
 =?utf-8?B?MG1zSnY2T0djaDBwam5qOThFUjdkeFVucTErOGZKK09wMVFSeGtnelZJQTJL?=
 =?utf-8?B?M28xYXFsdGw3S1RxekFwOHBSNXVpVGR2RTlRVnBhOWtreFdUYWN0YUxVQ3lS?=
 =?utf-8?B?VGpyaHAvRHZ1UlFReE9LVUFxdUh6UWFVQVdudjhMTVozUFpsZS9RelFnVXd6?=
 =?utf-8?B?OHBya3pDTFVvQnorbGFqalJOeGRzUlVzL3NSempiQVJqY0hNbS9Fd3N3UUNR?=
 =?utf-8?B?cERaSXVLWGYzb1l5NzlQWmh0L2U4WXB0N3ZjWUttdFlVdTFNM3FtenF3QThX?=
 =?utf-8?B?U2ZCVWw1RjUxajdFd2QrWmsybktjYmNSZDBmY1VMYjVFSUtlLzV2UnZkdFpi?=
 =?utf-8?B?cmg4VlZvRHlIK0g1TDVCVGVaYWVieDlydURQNG1TZ21FOWVGUDY4TFVIenRz?=
 =?utf-8?B?SFJjYjdvdUM1UDRZdkZoaENMVzBSRUVBakNxdGVsbUhoNnZqV3hDSmp6dnU0?=
 =?utf-8?B?cmpnVzRrOU43QzBQQTFSL0Zyb0RYcTdEbFZaNkZQM3ZvNG5BKzF3MEIreFAv?=
 =?utf-8?B?TUwzVy9ZVVZOYTV5dUI2RWJDRHJTWUZQMFg4WUVhVkVpdW4rc1ZCT1pzWjhQ?=
 =?utf-8?B?SFQ4M3U0dFBTTFpib2pOdzdVNTVjMDJkQWpVZGFwTEJCYlJzZFdCeGZlSkJw?=
 =?utf-8?B?YmhqU0xHaWZPclg3Mk51QWNJd1lEVFFHQkI1RlRBd2N2S3FQVVdqU0FXTzF1?=
 =?utf-8?B?TUFWZlUxVW94bjdHcmFVemp2RUUzdThiRG9abEJybDlMWmNFR3h6TGFYM0Fa?=
 =?utf-8?B?VE5oMEZuZVgvbFJuUzkzOHFNby9PZnNCT0h2bGQrWGlOSjM4WCtocmxqNGNk?=
 =?utf-8?B?SjNvN1FEMjJET0t4T2p1YjdoSjFSTVRzc1FzUmV0bDAxWUwrTFVjZ0tsUUVE?=
 =?utf-8?B?YjJwSENEbUJKY3JDNDlLRmtsYUIyQk1KcVZvMjhCMXhuNnk4bWNIMDlFQkV3?=
 =?utf-8?B?L3lBYkZRY2w2K3RCRHRmbDBhSWVsbUc5THVnZk5PY1pVb1hsYmR4aGxwalg3?=
 =?utf-8?B?dTFtMzE3RVJONHZZVTZaazZDNHJKN2x4aG5yVmxwVDBVT0szTWlaZWVacjYv?=
 =?utf-8?B?SHN6L05acStzVTVHMjRoVG1uTWxIUWFkangwYUNVOGE4ZnVlUlc4dGNSdFlK?=
 =?utf-8?B?YnVPMjFHQS9jL1lEOTFMeXF5S2NWcEZoeEtRVXpNSThCVHpvbHZjQzh5RG5j?=
 =?utf-8?B?NVBMMHVFd1M1dHVwaDFuYkM3MGRlaVAwbzZXUnRTSW9qRDRZQ2pwdTEwNVhH?=
 =?utf-8?B?RDdlbG8zOTVJV2NaL252VEZ0d2hsRU1GQTYvdFUvVEMxVDVuTS9MR1c0b2hv?=
 =?utf-8?B?QmF0WTV1VDN5aGY0MlhucG9UNElNRkdmL3ZrOUgrL2lTWVJuRXFrOVFYcFZ0?=
 =?utf-8?B?amZRWlEzTWMzMVdPSkZXT2w3OHgzK0hwVmV1aFNLSTZUSjRKK3dpMDgyT3I4?=
 =?utf-8?B?VlQ1bFdUTjN0TkpmMDE4Y1ZIUlExYlhNWkJSYktMQWplRnlTNGhXVjRyTENx?=
 =?utf-8?B?MGFqKzJ0NWo2Zm44S21KLzVybWw1ZWhlOUJ5SC9MZnpwUGw4M2NxV3hoMTNU?=
 =?utf-8?B?NFRmd3lWR3ZTYzlra1lUUU8yQjhOWS9tbjdyYnd3UDhoZ0xidG56ODdLMzI2?=
 =?utf-8?B?S2dkNUxZVXE4eFlvRVJkdndNSUdOZ2hyTmc5K1oxdkdVRHprSTdRc3hnRmRE?=
 =?utf-8?B?N1ZVZG1mRkUvb25Sb3NwTkJWQnBJY0ovbDBCN1c2MUlSNFYzeFljRUxyRDU1?=
 =?utf-8?B?V0dyU0xXZjB6b1FoOVhkd2czSFMrdm4rL0NjeUdMMEQ3aXZGa3o0VThiK2xh?=
 =?utf-8?B?RWkwZTZBelBVS0pvZmZ4MHU1KzFnaWJ2RC9XN2txNGdyUFhQY1VGam1BeXdm?=
 =?utf-8?Q?VkSZ6xjva/Iy1PiTQFRBisIru?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51809A9858343B43AB86C8E30D6AC294@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475d4a84-a994-4ceb-bcd8-08dd9a36f47e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 20:18:17.7203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBxoayedX93T8tDP5oNSrTI/erS/f0tUJJl3HbelR5GAi3DrPcvFbrOJiF1ijEkSsX/CticKrfMsimgZgneqMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997
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

T24gRnJpLCAyMDI1LTA1LTIzIGF0IDE5OjA3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgbnZrbV9kZXZpY2VfdGVncmFfcmVzb3VyY2UoKSBmdW5jdGlvbiByZXR1cm5zIGEgbWl4
IG9mIGVycm9yIHBvaW50ZXJzDQo+IGFuZCBOVUxMLsKgIFRoZSBjYWxsZXJzIG9ubHkgZXhwZWN0
IGl0IHRvIHJldHVybiBOVUxMIG9uIGVycm9yLsKgIENoYW5nZSBpdA0KPiB0byBvbmx5IHJldHVy
biBOVUxMLg0KPiANCj4gRml4ZXM6IDc2YjhmODFhNWI5MiAoImRybS9ub3V2ZWF1OiBpbXByb3Zl
IGhhbmRsaW5nIG9mIDY0LWJpdCBCQVJzIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRl
ciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogVGltdXIgVGFiaSA8
dHRhYmlAbnZpZGlhLmNvbT4NCg==
