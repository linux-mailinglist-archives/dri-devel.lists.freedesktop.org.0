Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491CA99BD7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 01:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA9F10E435;
	Wed, 23 Apr 2025 23:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nk7p8HHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6B10E0FA;
 Wed, 23 Apr 2025 23:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gku2vWALbEPmmyYyiGgsPrsgjcgokQUDCIm9voeaANv9GfsdqlS3iJ1znifj2zskwAUwZd6d0BizQhaVEblM7dobtBZrgfS6Oisls720sfWk5m3wjiWQA29j5yJ7izSQCbiq6+MzLWeAS0LoDkOoFdGv0lKD7/FHxNF/H+IohwlW7Xqr0aG21Bq+Q7vyKVBHPSh09H/w19UKEQSTo+wuKKvDhkQGO9uEb464R5UQviLVwvf2l6WRiKBh9uKejpiupmSmLprcKQzMbbMGOm/Z0kIW1bKq2y3CyBP2GS/xMNwBfWzNaDW2uFbQCreRJUTTfHNZ6/fetloHL+eWI8wpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BikrxaEaylT5FryCxqx82QJ/04Ozf09g3e4zaeVqjMo=;
 b=Cp8XbQDf5ANjOvPOZosvLxrniP/8lwRUngHSQnXbrC30Hzs1cTwoJq1/6xZCZGjRuEDf6b67gvxew6Gm2B6TlZLhg6maBg/pOdcTF5D8SPIhliG8H+lBdD5i2hJsnNEIXNt4cfV2hNFNlvqz4kKaRf1TAVvuF3l6TlKp3hBXFSO1yzCNgdMVUtSgad9IPvUmQsWkuV6+fmOtTcD+BO77YnFZw2nRonmTwLejg3qYFgR9IpH4zAEkmlGaLhvjr9t/D8yWoNXGD/4EG2zSy51Ylwbab8s0/cHdD4TZJ0ZTWP9aYPtP1oB8OAgFbm5LuiBOGi82BQitvk/WHEaQRQVjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BikrxaEaylT5FryCxqx82QJ/04Ozf09g3e4zaeVqjMo=;
 b=nk7p8HHG2TsO4UmAPGzxpkefjrdjwQIoUnsWH3xNwK6P7BLqFW6xQqVI/4RcdYrh+Mi3BSTDunvBzF6RTHUHncX2rVcoBqUG+gSLrc23n+kfj7rYzPeSFgTdhymUn8g8h++TdBeOSGSqPLX0RWJ0EjfGxWmU5sH+uc+tUtF/ORQ4fMusiNgXqx3bWv7EV7T8vAEPd9Jg7eI+Its3OTgBtMx3IxpD2SCv4k/uqhM+dVG0ONTZoZ6mrEwTkfFPNze/vVBTfKJ4btdTTcJcIUEbi4N1+yu9ipoGBFKUBColgOCghsmm13sHiUtFCpWGd061xPnARLIpIceU5CeQJ1GOaQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 23:12:57 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8632.035; Wed, 23 Apr 2025
 23:12:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>
CC: Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Ben Skeggs
 <bskeggs@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 3/6] nova-core: docs: Document vbios layout
Thread-Topic: [PATCH 3/6] nova-core: docs: Document vbios layout
Thread-Index: AQHbtKKtWJQKj3l2t0erMF7//1LC77Ox4TqA
Date: Wed, 23 Apr 2025 23:12:57 +0000
Message-ID: <74c540b50d9c9fa70689ef0f4451a126265d1715.camel@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
 <20250423225405.139613-4-joelagnelf@nvidia.com>
In-Reply-To: <20250423225405.139613-4-joelagnelf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA3PR12MB8811:EE_
x-ms-office365-filtering-correlation-id: da33ed78-5895-4009-b35d-08dd82bc62b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?blgwZHE3NEVoeU9kSHRZNWtkNmhaZ2dSRUF0Q3VFM3FtM0dISURpL24yWTAx?=
 =?utf-8?B?YXc4bk56clZHaWkyN2EwZFhIMTFVTzhkYmhsQWJaMWtBQkRRWi9zaG5iWWww?=
 =?utf-8?B?QTV6UkdFZGlnUXp1d2dIWVlvRVRkbHlxMndTK3pORUlvUm90ZmpzbHBXUDk0?=
 =?utf-8?B?RDVYOFlxV0kzWDVmMytNVFplSXdhOENRcFNJS0M3UmgwWFh6U21xUTFDcGhi?=
 =?utf-8?B?WDlZTCt2dkkyb3gwVzBmRDl6Ky9qNzRYZnRYL1ZtUEtLU0RJZWVnMG1MYm5u?=
 =?utf-8?B?NGUyMUxnSGkxbDJ5QlRkWGU1eUNLTC9rTmZTbUZQWlMwdEJKaXg4eG5hM0Uy?=
 =?utf-8?B?OWxBamVMb3lMUi8vN2FKOEZwKzJJSVMrRGxxdHE4Z1lIRDBNckNOVHJzOEMr?=
 =?utf-8?B?cDYwWWMydUJQNktwWHJ1bzkveUxhSjMzdWJLeEFYbndnOEJyZDFQOXVRVzRh?=
 =?utf-8?B?c1Y4dmQvRHdLZC9oK1ZjNFg5V0Zlb2ZJM0JwR3pKZWdSNnl6VzhERDk1blZQ?=
 =?utf-8?B?VGZMUHFzbnlmNzZZYm9JekZYTE1NQkY0SzU0dFZNdjdscnovOTQxZ01saWp4?=
 =?utf-8?B?UEMxSEo3Umwyc2pEa2tCMHZsZnZJa0tRTXJjeFVBUzNuMXR5VWF4c1JlNHRM?=
 =?utf-8?B?V1VxOVRwUVR1a0hNNlU3ZzVadDFoVWttZWN6UlpQNm5OQytTWnZ5akw1cy9R?=
 =?utf-8?B?T0l3a3R4NUl4YzBMTW0rbUZER0h2SllFQ2ZSTkkyZ2RZakQ1NXhyWGx4WkhU?=
 =?utf-8?B?VXJ0VkJlZzhRdG96K1BLbThiM2NIOFE1cElma2hnRjVrZ1JJajJjMVFwYVNO?=
 =?utf-8?B?aG5NQUN2ZzBkUXRtY0xCczlQMXdrZStVRnVzS2Y4ZWw5bWpFSG5iMWZEako4?=
 =?utf-8?B?ZFI4NUNJN3VvVG40WHVVMjZSeFdhOEtnME43ZUhMNEhqdGFxV3gxZlBnMVRt?=
 =?utf-8?B?T2x0WFNyMDBhQTN5MkVqTkhnKzhrSDNQRk1reVJ3aXNuQkRscCtyR0lkemdr?=
 =?utf-8?B?bHAvYlJyYVhpRnJuSlJURzMweW5TNDBBYlJUeVBPWTEvRWhJNVVYR0tBMzI1?=
 =?utf-8?B?d1B1QThCRWdtNk9vZFpPd2VvNjh1UzNJbUZnS2poamY1YlZIdVpNRXIxRU9T?=
 =?utf-8?B?aXlnWVpzWDgvVUpRNFl5TnlEN1NFUGs5ZHBNN3UyVlFuYmRBQ3pkMW5YeGNi?=
 =?utf-8?B?QklDelY2WVJZRUNrOGhtYW1KSlBxSm5Zb3padkJFSm1IUmUvMkliQkVkZVBH?=
 =?utf-8?B?V3VKakNncjZWQnE5WUpTTGdFZFA0OTJqWEdiV0x5b0VHZkNDdGcrdG0rR01u?=
 =?utf-8?B?MDZIT0svOFVHUnhuUy9uNllrY2VHNjNnWXBBTWV3SnByczFSZTRTVnRXbFNV?=
 =?utf-8?B?THo3cFlITWtDcHdPSTg3Q1QzZ1M0dGJ3U1VPOTZ3a085S1ZDRVQxTHhnUnN5?=
 =?utf-8?B?cXdWcGlvcjliQk55RDdiUWk1aWE3QnNHdGdCS1VwazJKeFJyVlFSSHdENWRT?=
 =?utf-8?B?ZEtTZlZxeDhBWUM2OTI1WVpxMThLbnlBYlBxNy9KQWRoL1AwMWtxN0MzYXFN?=
 =?utf-8?B?cC84d09pMlJXNXhnanVmbHZxL1dicDcyc2ZrK2JkZkJ1TUNvbUNLNThXdHlo?=
 =?utf-8?B?blJFa3dhMFh3WnZMSUJQK1VRZk1yWDlzUHduYlhmSTJNanVLbEg0TzIyay9r?=
 =?utf-8?B?UWNWcFhqdGxKcERjODlja2prMVVxbDZPQWZmWUZNOEd4MXdxUFlUSjFhQlZw?=
 =?utf-8?B?NmFRdWdBbjZsUjR2NElDVVZOb2xiUC9LMktUdElQVkFxNVVWUkZnWUEweUFO?=
 =?utf-8?B?eS9MVVI2S2FFVmF0VWhGcmttUTBidXhYYW1JaS91RkhBUHZITXc2UnhkVnBK?=
 =?utf-8?B?QUxsMWVHcUtXTG5PaHUzdjlxSmxsY1phSnFJaVU4VjJCUTEvQVZnRFJRS2pV?=
 =?utf-8?B?NFEvOVp5QjNGeUx3bkdtRnpMTExyVHBDSS8xZHlSRm1rNEJ0cnJ5MWZlalJT?=
 =?utf-8?Q?W1jGmxqCX7KlDqt5UeO0Q+qFY/YJC8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVhuTk95RVlRMzNJcG5Ja2M5blppNk52R1pBdUdMWHhNWDhSbEhxbXVFcWxk?=
 =?utf-8?B?S2ltT05DS2RuQWdYVXo4enpneUlTL1huaGdZMHZueXJqYzlFYm5wdm5NTlJ3?=
 =?utf-8?B?b2lGZXFJQ2h3UTFjK1MrUk5iYXZlYUREdUE5amNMNnVyZm8xcENkQ1JqTWVR?=
 =?utf-8?B?MDFlSVVsZjlIUVM5TzNSMnlVSmlwWUpFK1AzNG5xelczMyt0c0xPazQwS2lF?=
 =?utf-8?B?U05BWDBuc2RSZWRiaTdHcENPM0g0K3M5OWdrY2s4SGEzOCtwZjZSZldOSUtJ?=
 =?utf-8?B?OGVFYmVQaEkrdzN3Y0dORTVZRTFyK1Y5WnYzWExMaWJOMEtGVHFUQngwMldQ?=
 =?utf-8?B?akU5cjFlRzV5ZWI0S09scnAvS3FDYnpGVlJLbHJvem04RnliTnNNY05YaDFK?=
 =?utf-8?B?ci95QjJhRTY5VXJnT05yOWtOSGQwNVVkMHdtSkN5WVR4Zkg4VnBEb0JhdmtV?=
 =?utf-8?B?bko5MWNSRmlaZzBWaDdVL2U5cnpISHFVVG1GdkcwTDZjWVlhcGJudklTRWdz?=
 =?utf-8?B?alNHWG8xUWdaQUVqZWZUbEhwcVRMTnpBV1JqWGM1N2I4aG1VSTh5Qk5MSDgw?=
 =?utf-8?B?Snd5VURkTW5Ldi9QaEdWcGczUktsdUNOQjlMN05kRWN2cE82NU9pcEZkeEdS?=
 =?utf-8?B?ZjRPdFBwcXdpcUxKeWNmanplcWNnM2RGcVcrQkxqYmxna2lQWVkwRGhsNmFF?=
 =?utf-8?B?b0J2TlBkQUxHeW9Ua3UwRjlWWGtKRDM4VG1KL2NTbGR5YnJkRVVBcThtUW1R?=
 =?utf-8?B?VWpjL2tBV1QvdG8zQkcvdE95VFJnaFBTZC9rb2FHamZwa0FuQ1ZsYXcrRU1L?=
 =?utf-8?B?RjZDeUllTDJIYU9lYVJ0Mi8xVFRLZWpIQlZ6dG02U08vY0czZlRJTFpiN2Vw?=
 =?utf-8?B?OU5yOFdQK1VaaWhqWndLZ01jaVZnOVgwNCtySEhsSVc2MkV0ZzJZMUEzMmZU?=
 =?utf-8?B?RW1yZDZHNEpiaExBZVBhYUlTZUsxRlllUDA2RXZYSEZ5eFJKOHhJYkJwVXY4?=
 =?utf-8?B?RTNzQmk0aGVNckVsc1Y1QzNER3I3YTRFSFJVL0pURXQ2SUs5UnR1aGVNNkVT?=
 =?utf-8?B?S2RvME85OHpGcFdndTN6S2hBaFYxYmRod0REdzFmUUlmUXRxUHhqRlJlTHVF?=
 =?utf-8?B?ZHJrYnNnY20yN0g3OWx5eWk2TUY2WkMvbDYwNUt5M3JhNnM3VHFMc3J5SlNP?=
 =?utf-8?B?OEdjS3VwYnAzcE85Q0dsMkZBcVJBVkZQUDdqbnBDdjAvR3h6TU1yY0lzWHIx?=
 =?utf-8?B?Tm84S09vWkJmTGcvRmNEQ2ZuUTd0Mk8zVTFZVFBYSmVxZExud2ZEbm81c1Yr?=
 =?utf-8?B?VnR2cFY5SGp1T2l0aHUyZmhKWEdPeDJuVUxrTVJBOUZZOUc0SU41bU41VUUr?=
 =?utf-8?B?S0orL2E5Rlh2MG5SalhKYTZlMlhGQ05qRFhoUm1yTjdxempJWGdtN0JuUVF4?=
 =?utf-8?B?VXV6dE95em9iQ004dHlFMnd5dG0zL1U3MTcreC9JVDY2Qk1RMFRPSWtrSUlx?=
 =?utf-8?B?dWhFTDQzbnd3YUtMei9LdWd1dCtReElkZEZBcVRaMzVXNUxkTkRsMkhuaDFl?=
 =?utf-8?B?UUhHTzMvR04vanlxMk0yQTVoS1ZqOWd3ZndMT3FUM0kzcDB1cGIwV1BUSG9N?=
 =?utf-8?B?MnFKL0ZHUG9iOTR0eFNPMXRsemd2dDFza3kzL3FwejBmLzZPYng0aGFmWmd2?=
 =?utf-8?B?U05JeHRZQWkrMC8wZGE0cFJmcmhCdE5CTTg4Q2t0N0F2K2lRL2xTcEFBMFlL?=
 =?utf-8?B?ZVdnWmtOVjUvU3dPNjNKL3A2WnBWZ3Q4cjZJYVAwTmpYOFBZeWk1cDJyQVo0?=
 =?utf-8?B?cklqWnFiMzNOTFlLME42TVpRd2VBVDdoaS8vMk9FOENac2p4YTNTN3JJQ0xX?=
 =?utf-8?B?L2xHd25hNU9hU1QxQ016OENEZzJhc2MvNFZVUzlqb0dUT3p0WmZkRXdXRHF5?=
 =?utf-8?B?MW9XRzd6NjBsZUhLRVd4OUxucmtIZzlXTE9FN0lkaHEwdUhONFl6WWc0RC81?=
 =?utf-8?B?RnhtYUNVUnBOcDdBUnhXU2ZEdVF6ZXZOeUZWQ1pyaHFsMmhRVW5XQk01NWtP?=
 =?utf-8?B?LzJ5bUpWbit4ejNLUHh1WUthRmQ0QjNRZ3lIOUdsQnYxc3pyTXFubEMzTnNm?=
 =?utf-8?Q?q9L7X6hBIxXM7Xo9E+7wMmPng?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11A4AACDF5934644BF2E4314E040765E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da33ed78-5895-4009-b35d-08dd82bc62b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 23:12:57.7707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rofM0+DEaGWVmSb4z6aj/4/eIQQ/huL/oI6SajyZ+vEZyqyG0hUtvdWXptaJf83A8hFs9t7SmVAz59UBcBJEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811
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

T24gV2VkLCAyMDI1LTA0LTIzIGF0IDE4OjUzIC0wNDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSBsYXlvdXQgb2YgdGhlIFZCSU9TIGltYWdl
IHdoaWNoIGlzIGEgc2VyaWVzIG9mIGNvbmNhdGVuYXRlZA0KPiAraW1hZ2VzIGluIHRoZSBST00g
b2YgdGhlIEdQVS4gVGhlIFZCSU9TIGlzIG1pcnJvcmVkIG9udG8gdGhlIEJBUiAwIHNwYWNlIGFu
ZCBpcyByZWFkDQo+ICtieSBib3RoIEJvb3QgUk9NIGZpcm13YXJlIChhbHNvIGtub3duIGFzIElG
UiBvciBpbml0LWZyb20tcm9tIGZpcm13YXJlKSBvbiB0aGUgR1BVIHRvDQo+ICtib290IHN0cmFw
IHZhcmlvdXMgbWljcm9jb250cm9sbGVycyAoUE1VLCBTRUMsIEdTUCkgd2l0aCBjcml0aWNhbCBp
bml0aWFsaXphdGlvbiBiZWZvcmUNCj4gK3RoZSBkcml2ZXIgbG9hZHMsIGFzIHdlbGwgYXMgYnkg
dGhlIG5vdmEtY29yZSBkcml2ZXIgaW4gdGhlIGtlcm5lbCB0byBib290IHRoZSBHU1AuDQoNCllv
dSBtaWdodCB3YW50IHRvIGFkZCBhIGxpbmsgdG8gdGhpcyBwYWdlOg0KDQpodHRwczovL2Rvd25s
b2FkLm52aWRpYS5jb20vb3Blbi1ncHUtZG9jL0JJT1MtSW5mb3JtYXRpb24tVGFibGUvMS9CSU9T
LUluZm9ybWF0aW9uLVRhYmxlLmh0bWwNCg==
