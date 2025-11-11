Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85DC500F2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 00:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22E210E0A5;
	Tue, 11 Nov 2025 23:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1zYyGCAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC68410E0A5;
 Tue, 11 Nov 2025 23:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql0lCRPjsP8AZ/tq7JE2/Ng1wRRRZuYz7hU5XIMKpIqHVVbRn6SvmxsqIix9z427pW1JhhJwYpS1k628Yd8/hgyoQWTIpro9l4TAH+P+igfOnUYs8WwWpWL0YAvuuIbbpxjcaw4sS7lhNZOLX6zfTcvdEqhQmdkZuITGilznWw9DwxHjUX5d3XWHX/UMucnrdp+uTV9jcLi/RdBtqWy/kY9lqK9mTO6zkrLWoC6T0ILYLJIs6umDglmMOtCz8BNeNAiwcQvdOPOusHKbVIy49NAKRsbNZK0uDvese8kaxL0QJTEgimUE2Kh2GgmboiS8+EWBBcMPmjPk/s8nYE04kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11v0E//0Kufl+J/QEvCUV+1xHcvK6s0uRjWQGE0PECk=;
 b=AiT04t/wThP/z0rGSk9Mu9t8eth1UNvJjwBG/WSTQGqEDMA3rg8TzPb+L0LPczftCDpd789DzUZX9NU+1nM+Jqox5FBcTrP20UIlgtDSPps7Pw4CJeR2+If9BCNCZFJhq/86w3o+pAZ18LyjDffF6OytuTzx9K+gWjXI8ow1b6HRi/7rBZ9s7XcCTg0L370glR+v/iDpJnkYsb3BQk5eKVOSHrBTbfbC7orE4rwAFR0vS7Yww0pJ1gPiwTOxGfYEwfMXYe35HwZLmXDAUoN4/JzhRBUe1R3BDBeEwBX4XuayhY2bJ4CuE/5ghtUAjvYq4KdRQQVPoCY1hu2X4KYAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11v0E//0Kufl+J/QEvCUV+1xHcvK6s0uRjWQGE0PECk=;
 b=1zYyGCAvxJmJ+1ULZg8xqvObGxkevsdPcP6WQbM92yEI5cUCciSRkwp+Cx95RBR4FYq52Uaf6V7PSO8i1qNNp5adiV6JzramS5VbLBNYxOrDGmi6zekIxIwpEuSRsLIXp1V1q3JUj78KYrhUdgkNDjo6kVs+rUI85CAHYPpDNb4=
Received: from BN9PR12MB5193.namprd12.prod.outlook.com (2603:10b6:408:11a::16)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 23:30:20 +0000
Received: from BN9PR12MB5193.namprd12.prod.outlook.com
 ([fe80::fe9b:91c7:aa4d:74ca]) by BN9PR12MB5193.namprd12.prod.outlook.com
 ([fe80::fe9b:91c7:aa4d:74ca%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 23:30:20 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Simon Richter
 <Simon.Richter@hogyros.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Bjorn
 Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona
 Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?B?TWljaGHFgiBXaW5pYXJza2k=?= <michal.winiarski@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shi, Lianjie"
 <Lianjie.Shi@amd.com>
Subject: RE: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
Thread-Topic: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
Thread-Index: AQHcSX76mrYrZLWPqUWbOwTFlM0/nLTtQouAgADwlCA=
Date: Tue, 11 Nov 2025 23:30:20 +0000
Message-ID: <BN9PR12MB5193BF4B1776B41DDF037A2D84CFA@BN9PR12MB5193.namprd12.prod.outlook.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
 <c90f155f-44fe-4144-af68-309531392d22@amd.com>
In-Reply-To: <c90f155f-44fe-4144-af68-309531392d22@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Lianjie.Shi@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-11T23:29:43.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5193:EE_|BL3PR12MB6643:EE_
x-ms-office365-filtering-correlation-id: 06a6aba1-34b4-4a59-391a-08de217a4797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RTdhOXU5bThrNkloVnM4TDRKTjVZSFdPc0pxalhmbG55Q2NaTHVUalp0VW83?=
 =?utf-8?B?aXJYUHc0Y3U4RTJxNXd2UTBIY1RFMlY0WXA0R0JFSk1uODJMWlJkeU42U0t3?=
 =?utf-8?B?ZjRKNE52MjQwTTI4T2VDbXhZQmpqZmF0blhXVEJQTHpVaURGdExGdnRVYW4y?=
 =?utf-8?B?STBTdm4xdkZlNjNNc3dDemhBak85NTlUMVZLTmhFOEtjZnFHM1QrSHhpbERy?=
 =?utf-8?B?T0JLZHMwMlVtZDhRSy9oU3VDaEpEVXAyTVhYY3dDMm9GS2xIdlhsRXFTeis0?=
 =?utf-8?B?bWd0bHJPVnNGeitKdHhGQ01GeE52c2tVQThDdDJXa21vbDV1c2xsY1BNTGMz?=
 =?utf-8?B?dlpYODlwQTRJd01xcUtFeTZaV1lYbDF1elAwZEdJT1NIOE5JY29hTU1RYXJr?=
 =?utf-8?B?N05kN1YxSEplWFZjR09ST0FBbGdDNzRNU2pHazFYQzNtelB3QzZOR04yQzZ6?=
 =?utf-8?B?elF5dy9jWHNXVDZtekVoc3Y5RFc2ekQ1dG9KQWg1SjNWQmlSUTZvMTBKMlQ3?=
 =?utf-8?B?TFZ1ayt3c3J5cXQzOGlPcjF1MVd3WGtvUVNUWFJOZnFHWm1QT0czRlE1L3VP?=
 =?utf-8?B?Q2pCcTIzY2V4V0ZyUUo3N09HRDlLOWdLSkdaN1NRZ3dYVUp6S0VreG5IWXUx?=
 =?utf-8?B?bmdwcVNEaGRwcXRrUTVWNFdVSXZnYTJJQkNIeDlsTkxNQzdaVktQUTJBS3Ft?=
 =?utf-8?B?cVZLUFVYemk0WTFqUldzcVcrR0RCZ1dLVm54T0ZOb1V2NW55MXIvdG1OamFv?=
 =?utf-8?B?MUlMRVR0eXlsWmIwUmt0b3VDaVhtTFozcGlSTjBVVXU4RWFydVJha240RXJo?=
 =?utf-8?B?ODNoMVBFMkw2ZUwxYUhia2xsNS9Nc0ZNZ0FFc0wxbUF6ZjlVY2cvdEZZNkcw?=
 =?utf-8?B?SnlqUU1FSWJLbmZ5Qm1UTFpSQm5pTmxpZmhpZ2svQjRHZHVwMk93OFIxa3pT?=
 =?utf-8?B?RkJsUXhtUlYydWJIeVRTaEQvU0QyNlNiMjVVOFA2VVNWZXdFWG1ON09RTnRK?=
 =?utf-8?B?d213SFJtdVlsVWIycnRnZVZreWYxYVJWMUU3VnJUZXg0TSszbHdrcFNxVmd0?=
 =?utf-8?B?RUZoM25pYzNGTzlBUkw2TWxzUTZVdUVRSWt5MkhMcFhhcHdEUDhqck1HTVJh?=
 =?utf-8?B?cHlaZ2cvUXFwV3RBTkRMZXZXSm1nL0RnQjdyUDM2clNzM0ZBVkZLeDJrY25F?=
 =?utf-8?B?c0xUbDYwcXZ5NTZGYWZSbmdHcC93R3FLU0tyTjB4djhOSy9hN0FuMWw5VFRN?=
 =?utf-8?B?eGFvZ2pOZStJTzViVDVMMnhNajQvTEFnN2xqUWhlZmFNTHpvc2JtdkF1QnRU?=
 =?utf-8?B?N3dyZnNtNWdURWtCcURzWURLVjZpQmY3aXpqM1ArSFV2elJQSTBtUEdwQ1Zl?=
 =?utf-8?B?ZDlNUzNTN1F4N0xuN2cyNjlHcDc1Z0t2VTRkS2diT3VubVBPckNpc0JBY3V2?=
 =?utf-8?B?RWlEU21kYWV5RmRNeHlVcXNpcllzditJNFM5aUJ6ZkwwMERKMW5uVVY0NHJo?=
 =?utf-8?B?QUhTKzRWaUpDWk5JekJsZ2xua1BVRjJBYXdmTW1meGFMdVFjd3hmTEdCYnZO?=
 =?utf-8?B?WmRFNjlsdTlrRmpQU2hyOVhubnRNeVRWbDVYalZHcmlJUDRBZ0Z3VWgrVDdo?=
 =?utf-8?B?dFc4Z1JPTTF5cllGL0lIazR1KzZvcnliTE11ZlFIQ0ZyK1VkajVYNlFHVDl1?=
 =?utf-8?B?YTVKV0RoWkI1WGdhc0ttaWRWSlY2WGkyMzVNc3ZHNHRMZ2hDZ29rRXlGN0Iv?=
 =?utf-8?B?dUZiaGY3TUdIbmNxQXRsS3JaSnNmTDdQcFVkdW1Nb0hPbVc1NFIvb0h1MnZs?=
 =?utf-8?B?NjdsczZ1enF3d1d0KzIzeVluVndPQ01ka2JhcVU0Umd3KzA3eFdSMXVsVHdN?=
 =?utf-8?B?d2hmLzVEYmZvR0pUQzRiY3ZDTHgvSjJrMmRPV1h5bndmcFpxVHZER3orVHRC?=
 =?utf-8?B?VHNZdDdzSWVGZnRNblBxbGkxRW1UeTJGYjlmNE83M2o4RFRydGZwanZCK1Fh?=
 =?utf-8?B?NW5tV2gxN1MzSkhQZDBHVnFFR3A2VU5QTGJqRkFYQTJEb2cvczJ0R2YvdTZ1?=
 =?utf-8?B?Zmo0a1VEalp2cFV0a2pFTEJ1cjF3YmRDVWp0Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjFsYW5pZ1ZjakNqR2VlMktMZS9vdVlzcXJrMjArNmRhVU16OTdaU2t4aWZz?=
 =?utf-8?B?NURrempmakZVZGN1YUtRbU1KMk55bm5EQzdKZ2IvaExkS05WMXVIUkl5THRz?=
 =?utf-8?B?Z1B3NjVLS3haVHFJMFMvdVdWSlR3T2ZBdGNrQ1ZHWlRoV2tONnpQQTk3dHJB?=
 =?utf-8?B?a1VSTTRHMlZPZEhtdnllUDFvL0RObDBSanJmQkVHL05EVlBwSTNCNUI4bjdi?=
 =?utf-8?B?SDFEODE1MERBSlBDVE90SUFFb1ZEa3g1cHFOLytvT202cXpwUUxTalIrTXk0?=
 =?utf-8?B?YmJ4dzVtTEI3RkNBeUpFSnJNRGlrRXJMcGlUeUNnQmZ2amZkSFFsTU5ESWpz?=
 =?utf-8?B?WG0xbGlVM1NnZnBsZHI1R1BFTFo0UmZub2N5b09mb3pQWTBnWEV2VjZRa0Jq?=
 =?utf-8?B?QWZhMjJGSXIxcWhwSkhCM1crV2Y2ZnQ3S1lTU3JTcjRtTkx4REhwQkIzMThz?=
 =?utf-8?B?aDI0M0RLa1dwS1Z6ZmVrdXVmR1ExaFo4MjVZeE9PWXlEY0dRT1A0aGkveGlO?=
 =?utf-8?B?bTZqbklqbnNCSE5RaXdxeU1oNmU2S05odlRHYVM4VHVTTlBOck91VmFtbUxl?=
 =?utf-8?B?K3M5TGl4NVlKYk52NjYyQU13NzhVQ1RnbGJHNEdEMzg3bXR3eWkrbXFkWWY3?=
 =?utf-8?B?bkZYeXlkYWNWdmJVN1BwMzhUckZiNVl1bUFhQnQvMHUwMFQwRDJPSUhWZ3NL?=
 =?utf-8?B?ZytFbDNoaDdUWk9XMFlSZXVKS2xtMjU4ZW9SUWtYOXB1Tmc0VTBudDNWcVJn?=
 =?utf-8?B?S0RJaWRjUmlZTWxxZjRVUEdiZmJJMzlyOXhLK1Z3RTJleFZBUG5pZkpocUJ3?=
 =?utf-8?B?d1RELzVteWdyeS9mSTdQUS9VakszWk45aFhmcHNjRzZvS3JWa3NsOGE3d1d5?=
 =?utf-8?B?aUZ2SFBIN0E5LzBaMlFuTXpQVnN5cjg3OG80VDJHNGlodTFPbUU5eHFuMXdi?=
 =?utf-8?B?Mmt2NEZNaHNqL0xBbCttK3pzZTAwRmVtUXNFQ3IxcjYzeGZBLzNYbDJpeGZn?=
 =?utf-8?B?SE5iaGhJMXFneGZCd08rblRzV0I1TndIRXBWbzgzemJkQXdSUnJDc2ZlSnFl?=
 =?utf-8?B?bkRIVGt0VmVKK1RrbTl5czhPTU5wbUdBMERkbWV0Uks3b1RoZjdoQjMxQXRI?=
 =?utf-8?B?QSttc0hsRDQ4YnNrdGFCRlhORGtnalVnLzdLTkNya2huN0FYV21pTXpFWXZU?=
 =?utf-8?B?Y3ZnR1Vyd3hrbFlzeXQxaGJXellRTVZXcGpoT1BZekFVOW9jQkpoZXNENmg1?=
 =?utf-8?B?cTRyRTg5eXF4WlVRRUVOK1VyTWJUa0I5UGN2Q0phaFVtb05SWjloL0VKdXh4?=
 =?utf-8?B?YTdkd2NMbTRuTG9sbFUrMmNlYWpJSVJ4ajYySkRwMXhuZWtDK2d6T3JjeElv?=
 =?utf-8?B?cmE1b1lRcEJYZ09ZKzlOQ2xJZkxSaytlRU94M01lbFBHWUlyWCtmWWVleE53?=
 =?utf-8?B?b0cvU2d2dUJyUUlGZGQzY3ZCQnRnZzhWOHFJSmZLK0dra0YrYU9QY0haSGhq?=
 =?utf-8?B?VVBsWkpJS3I3NmV2NnU3bThYck5Yb044RXpXWWtsNSthVzYvcC83UW5iTkNn?=
 =?utf-8?B?OHFNbnFkY3FESi9wVlI3VmZjWVZvM0VTKzh6cTBtMFhIMHY4TkJjYzY1RHFK?=
 =?utf-8?B?d0R1cVhzdVNQd1FyRXgxb0d4a1hGZEVHSm5hTDlQdHJHNm5CMm5mYUNsVVBr?=
 =?utf-8?B?dzBXK0R0VWpuTithc0thbVhTR20wdWZFSFNQUzBLZUtyMWhINzcwUkRNSmxr?=
 =?utf-8?B?bVNDdVNqVUhLSDBraDIwYjA4a3NkSDBpM2JyZTBLU1BHN2ZDZ2ZWa2hxZ2pX?=
 =?utf-8?B?cytoM2hnb3ljbSsxblNGdmxFNEdCMVc4V1NRK1ZzN2NqdVcxSHFFYkJwNm1m?=
 =?utf-8?B?SWxYekJTNkk2dTVka3dsS1Fhd0NaUmhkY0cveTBoektDNk52L0FoUlVHeEcy?=
 =?utf-8?B?V2duMndjRC80Y0wwRWJPRmplREVNdFJZdFRQMTlFclBSelh4NW9jeUJHbXFT?=
 =?utf-8?B?ZDhNb0RBc1VjZVV0K3VvSFc1aVpLUFdoVTlTcUJHYWxxUG0yTHRVUkgrckpB?=
 =?utf-8?B?SElUbWlHeUFNQUVEZ1daK0FHalJoME84c2tBbG1KeG00M0tvYzUvbi9HeGJY?=
 =?utf-8?Q?yybM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a6aba1-34b4-4a59-391a-08de217a4797
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 23:30:20.3620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9CmP+a91Vo1ALGFKqmIsRmFwMTw2nXxp/ZKCPORcLV+M/rFRaXakpdPh/iJh+UjL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgQFNoaSwgTGlhbmppZQ0KDQpEbyB3ZSB0aGluayB0aGlzIHBhdGNoIHNlcmllcyBpbXBh
Y3Qgb3VyIHVzZSBjYXNlID8NCg0KTW9uayBMaXUgfCBDbG91ZCBHUFUgJiBWaXJ0dWFsaXphdGlv
biB8IEFNRA0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0
aWFuIEvDtm5pZw0KU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTEsIDIwMjUgNTowOSBQTQ0KVG86
IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT47IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFNpbW9uIFJpY2h0ZXIgPFNpbW9uLlJpY2h0
ZXJAaG9neXJvcy5kZT47IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
PjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5j
b20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tPjsgSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
PjsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgVHZydGtvIFVyc3Vs
aW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPjsgTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJz
a2lAaW50ZWwuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6
IFtQQVRDSCA4LzldIGRybS9hbWRncHU6IFJlbW92ZSBkcml2ZXIgc2lkZSBCQVIgcmVsZWFzZSBi
ZWZvcmUgcmVzaXplDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSBJJ20gcmVhbGx5IGJ1c3kg
YXQgdGhlIG1vbWVudC4NCg0KT24gMTAvMjgvMjUgMTg6MzUsIElscG8gSsOkcnZpbmVuIHdyb3Rl
Og0KPiBQQ0kgY29yZSBoYW5kbGVzIHJlbGVhc2luZyBkZXZpY2UncyByZXNvdXJjZXMgYW5kIHRo
ZWlyIHJvbGxiYWNrIGluDQo+IGNhc2Ugb2YgZmFpbHVyZSBvZiBhIEJBUiByZXNpemluZyBvcGVy
YXRpb24uIFJlbGVhc2luZyByZXNvdXJjZSBwcmlvcg0KPiB0byBjYWxsaW5nIHBjaV9yZXNpemVf
cmVzb3VyY2UoKSBwcmV2ZW50cyBQQ0kgY29yZSBmcm9tIHJlc3RvcmluZyB0aGUNCj4gQkFScyBh
cyB0aGV5IHdlcmUuDQoNCkkndmUgaW50ZW50aW9uYWxseSBkaWRuJ3QgZG8gaXQgdGhpcyB3YXkg
YmVjYXVzZSBhdCBsZWFzdCBvbiBBTUQgSFcgd2UgY291bGQgb25seSByZWxlYXNlIHRoZSBWUkFN
IGFuZCBkb29yYmVsbCBCQVIgKGJvdGggNjRiaXQpLCBidXQgbm90IHRoZSByZWdpc3RlciBCQVIg
KDMyYml0IG9ubHkpLg0KDQpUaGlzIHBhdGNoIHNldCBsb29rcyBsaWtlIHRoZSByaWdodCB0aGlu
ZyBpbiBnZW5lcmFsLCBidXQgd2hpY2ggQkFScyBhcmUgbm93IHJlbGVhc2VkIGJ5IHBjaV9yZXNp
emVfcmVzb3VyY2UoKT8NCg0KSWYgd2UgYXZvaWQgcmVsZWFzaW5nIHRoZSAzMmJpdCBCQVIgYXMg
d2VsbCB0aGVuIHRoYXQgc2hvdWxkIHdvcmssIG90aGVyd2lzZSB3ZSB3aWxsIHByb2JhYmx5IGNh
dXNlIHByb2JsZW1zLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFJlbW92ZSBkcml2
ZXItc2lkZSByZWxlYXNlIG9mIEJBUnMgZnJvbSB0aGUgYW1kZ3B1IGRyaXZlci4NCj4NCj4gQWxz
byByZW1vdmUgdGhlIGRyaXZlciBpbml0aWF0ZWQgYXNzaWdubWVudCBhcyBwY2lfcmVzaXplX3Jl
c291cmNlKCkNCj4gc2hvdWxkIHRyeSB0byBhc3NpZ24gYXMgbXVjaCBhcyBwb3NzaWJsZS4gSWYg
dGhlIGRyaXZlciBzaWRlIGNhbGwNCj4gbWFuYWdlcyB0byBnZXQgbW9yZSByZXF1aXJlZCByZXNv
dXJjZXMgYXNzaWduZWQgaW4gc29tZSBzY2VuYXJpbywgc3VjaA0KPiBhIHByb2JsZW0gc2hvdWxk
IGJlIGZpeGVkIGluc2lkZSBwY2lfcmVzaXplX3Jlc291cmNlKCkgaW5zdGVhZC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8
IDggKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
Yw0KPiBpbmRleCA3YTg5OWZiNGRlMjkuLjY1NDc0ZDM2NTIyOSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMTcyOSwxMiArMTcyOSw4
IEBAIGludCBhbWRncHVfZGV2aWNlX3Jlc2l6ZV9mYl9iYXIoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ICAgICAgIHBjaV93cml0ZV9jb25maWdfd29yZChhZGV2LT5wZGV2LCBQQ0lfQ09N
TUFORCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZCAmIH5QQ0lfQ09NTUFORF9N
RU1PUlkpOw0KPg0KPiAtICAgICAvKiBGcmVlIHRoZSBWUkFNIGFuZCBkb29yYmVsbCBCQVIsIHdl
IG1vc3QgbGlrZWx5IG5lZWQgdG8gbW92ZSBib3RoLiAqLw0KPiArICAgICAvKiBUZWFyIGRvd24g
ZG9vcmJlbGwgYXMgcmVzaXppbmcgd2lsbCByZWxlYXNlIEJBUnMgKi8NCj4gICAgICAgYW1kZ3B1
X2Rvb3JiZWxsX2ZpbmkoYWRldik7DQo+IC0gICAgIGlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJ
UF9CT05BSVJFKQ0KPiAtICAgICAgICAgICAgIHBjaV9yZWxlYXNlX3Jlc291cmNlKGFkZXYtPnBk
ZXYsIDIpOw0KPiAtDQo+IC0gICAgIHBjaV9yZWxlYXNlX3Jlc291cmNlKGFkZXYtPnBkZXYsIDAp
Ow0KPg0KPiAgICAgICByID0gcGNpX3Jlc2l6ZV9yZXNvdXJjZShhZGV2LT5wZGV2LCAwLCByYmFy
X3NpemUpOw0KPiAgICAgICBpZiAociA9PSAtRU5PU1BDKQ0KPiBAQCAtMTc0Myw4ICsxNzM5LDYg
QEAgaW50IGFtZGdwdV9kZXZpY2VfcmVzaXplX2ZiX2JhcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCj4gICAgICAgZWxzZSBpZiAociAmJiByICE9IC1FTk9UU1VQUCkNCj4gICAgICAgICAg
ICAgICBkZXZfZXJyKGFkZXYtPmRldiwgIlByb2JsZW0gcmVzaXppbmcgQkFSMCAoJWQpLiIsIHIp
Ow0KPg0KPiAtICAgICBwY2lfYXNzaWduX3VuYXNzaWduZWRfYnVzX3Jlc291cmNlcyhhZGV2LT5w
ZGV2LT5idXMpOw0KPiAtDQo+ICAgICAgIC8qIFdoZW4gdGhlIGRvb3JiZWxsIG9yIGZiIEJBUiBp
c24ndCBhdmFpbGFibGUgd2UgaGF2ZSBubyBjaGFuY2Ugb2YNCj4gICAgICAgICogdXNpbmcgdGhl
IGRldmljZS4NCj4gICAgICAgICovDQoNCg==
