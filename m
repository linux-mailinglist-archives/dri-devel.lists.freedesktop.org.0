Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDz7M/W7g2kgtwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:36:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35351ECC3D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1573B10E05B;
	Wed,  4 Feb 2026 21:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fp/S80vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013039.outbound.protection.outlook.com
 [40.107.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475B310E05B;
 Wed,  4 Feb 2026 21:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDCZxlT12Swa2QZ1R6hiHq6Ll+7n8ylEBGcvxjSHv2FWT1WntilDo5KWTDetdUddxlxaI8j1VhyLUR5WMacr9D8lBrDfW4n7EB7kbSmAmG7i+v/B8QQags5BxtxndVwd1wvfFXGIw8F+5lCiEuYx+AHmJ8pCG4e6A53XQaJS8BqgikoE6ZLrTHXYXCy+VUYGOdUhq99vHdqHiokYuOp3+irO2svljGHMTeLavRn3vPcFDfRCMs4/h5Av+bMoNxZw5zb+vSDT1o0B9fGUx+WvBGQ/vyKz8JXu9CSdfqEI7jjrgAar6JdBqNOFcCwiSlHR/7u0uBrpzFdMbuT6lPAeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfmBEWRaSCyJngPlvMVDeN8cqSrvIjyD6C0a4/wHHBs=;
 b=bIjUQNBpbFJhSrJ358OFrZjsbg0vBsndcnHbiA6R5NPOIPHuoxVPXL4eUlIwzPTXXKwEh6UAR6FI3q3aSNAnEluxJm73jmzOkeS5lafht4fC9/shlIiH5S0YKvJ2/GUUS53EHdkSuMHhOM2sebu1T91oRVR444Vs/7YvqjjQQ8zuULP6M8xzx84Xn10f/pAPoYeB4/xZBiWCugE094nAWzRycAXEEQYW6q9gp+CCUtqYor8Nq/jqzUkEao29ba3KhHFuu1rosLl/YbI4u1NKZdCZSX/B75ZNSHlOnnr+nKUU2aL7yugKlXrOmAdWOXMoRP4H5lo893ycalS773KEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfmBEWRaSCyJngPlvMVDeN8cqSrvIjyD6C0a4/wHHBs=;
 b=Fp/S80vbhv12TEq9wKeJidNqnq9oSl8qdbvYNpPU+lO8+a3qxrsRfQfoyWZ0W6Q8YuOnFoe/8ReBVWcqhTdQk07jlslL1PVJL6uRq4oCqC+l1kxbz1dIwClQqPCUlxYRhskFWFPtZkO03rvMQQqEn4UZCW5BK/EqbwveiWC+2RD2iitJfHJRsgq/D+GoGO8SmVAgTaRE10P4UjfMwoweQDsnRVqpjs3T0soPnMSfJ2yGjzXVcB6PfuockZsfISBoFRgjv3A7al2v4fnZPlfpLX5vfyg5+8pIiXNx1ax9qDG3CxNrJQuo5DA6nBxcTruk8oC/CJtW7SMsbSjPb5tCvg==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DS0PR12MB999080.namprd12.prod.outlook.com (2603:10b6:8:2fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 21:36:34 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 21:36:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
Thread-Topic: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
Thread-Index: AQHclM1uh+7/0H/mW0uOHNMo/9ByHbVzEw6A
Date: Wed, 4 Feb 2026 21:36:34 +0000
Message-ID: <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
In-Reply-To: <20260203052431.2219998-2-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DS0PR12MB999080:EE_
x-ms-office365-filtering-correlation-id: 4f84268a-337a-46b6-eb84-08de643577f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aFlBV2hEZDRCclRPWFB6MXBEQjUxa0ZuaStOZXlqMXVaMWU5bVd3RVdkc295?=
 =?utf-8?B?amJrd3lLS0lTeEw1c2pxcThPV2JZOGpkRzJaZjU5RFZlZ25qUEhQWTA4aGdE?=
 =?utf-8?B?WFQ0SExRam5DZFQzVmtEVndrZWptWlBaN1lhVk01NmErYTRJbXRlMGQwWGlE?=
 =?utf-8?B?OTM0S0V5YmY5aDEzaUpXR1c1TDUzVGtOcFhMYXJRSDZyRk5pK2hIN29BWm8y?=
 =?utf-8?B?bXZndzkzZWpjNTczY2s2U0Z1eDRMSVB4UEExUEk5OTVOamVxMVRxcDg2MEJU?=
 =?utf-8?B?QzBTRWpzS053dlUyV3dmMnpBNm1WVGk2RXU3aUhCZGRGeHpraGppWUlVR1dQ?=
 =?utf-8?B?VWNIT1pjbDZlcEl4cGtCWWRJeS9pVjh3YVNXR1d0S09MVTFJQlh5djBRVzll?=
 =?utf-8?B?NFN0VjA0NU1wVDZiaXJEdm9UVm5sd3hZODFkV3hVSFNDU2pqcmVPbHd0Tm5r?=
 =?utf-8?B?dWk4T256UkFTL1VVaTNRSTMvUWNQSGNEYktLUGVJaC9YR2RKYU8zd05wVGNT?=
 =?utf-8?B?cG1hTXNHT0VDQ2tOUkRYeHY5Q2FsdUJHQUU4NjhaWTNtbDc5Z2gzcGQ1eDVO?=
 =?utf-8?B?VWJPMTZmSGNNL0s5L2VaWU0yeVhrODc0dWpMVkFpKzcrUjd5MktkYU94MzZu?=
 =?utf-8?B?UjBoZUVueThRc3ZXc0Q2L0RobWF1WktIWXZCUlBleXRJVmpMRnFIWHRBeHZn?=
 =?utf-8?B?KzRPRUlqSjcxWEVWRnVCM05PRERUa2wranNxS2g2RW1pTytHeTFwLzU1STA1?=
 =?utf-8?B?SkZYMWQyYmNTbjNlWlo0TEczTndNZ1ExSjZ0T20ybHphMnl0WklVTVQveEpW?=
 =?utf-8?B?UFNaZUhZK2dqckUrR05oRTFjNTVPVFAvazhrR2RwNEpERWdVM2F2V1NlSzY4?=
 =?utf-8?B?VlRDTVZyOUpMMkpweGFGeTQ4UGxnVTJaMXg0Wk1qY09aZUljeWJocnRHd1BW?=
 =?utf-8?B?REIwa1VBcHc2VFQwN0wwWkxjQXp4OThUNjNjTjNHajdjZWt6MDNnRGVWMS8y?=
 =?utf-8?B?Mzl5SnN5dFJoYkk4clQ0LzUrMDJxVjhtOGN1TjV2MERyT0pTRThpMWZLRmlW?=
 =?utf-8?B?bzAwVWd2ZnBFTUxzOStrMENhL1liNGZpQytNSlk3cnhtSEs2S2JJVkZDaXM4?=
 =?utf-8?B?dUNPNUFPeTlieUZLOWZJQXBLZTlSY0JSQlc5a2d3WDdWaHdjTDA2K0ltcS92?=
 =?utf-8?B?OGVidEwwbmtCUk1PdWxRWjFZVGs2clcra21sSVI2c3Q2TXh0K1FlbC9wMDRS?=
 =?utf-8?B?bVpYaXpUZ3YwOU9nZHhvQ0xCbk8vdDZSanhYaWU3K2dYUnkwUEgyN3g5OUFi?=
 =?utf-8?B?NHB4SzJnZU1SczhYT3dQeitJeHM2bDZQeWRnOGc1V1Q4ZXRYSHdrVThBd1dh?=
 =?utf-8?B?Nks3OFZad1dwR0pGNHFrRjJlNU4vNm5QRWFCdmtmOGNTT0tsVHhQV3U3TlZT?=
 =?utf-8?B?ZVBLMFJRNHd3OGp2bUJmcWdFRzNKZ0pncm5EM0pmOHIxU1FZV0RQY21WM2l3?=
 =?utf-8?B?dEpuaFEvbU9hQ25FaFpwaUNNaUtHLzE1TW5xTTlYWGZKUFE0MFViYmk3UEQx?=
 =?utf-8?B?YU9zYjd2RCtKU0p2cjZZTlZiOEZJdEZYSklMa3ZCV21wWVB3ZndmSGRYR01L?=
 =?utf-8?B?S2xsdXA2cnpzRVpTdWFxc0VuejVEQUNncDNxNnpFM2N3dDRweG5aRWN5ZnhE?=
 =?utf-8?B?dHJLOXBCRkg1VVNGTThmZW9CajRjdXpQSWE5K3NEZk1xOTc3M1pSTmVPeENp?=
 =?utf-8?B?S0dDL0NzK0hrZm1LSEhLbS91MUhiYmxNNHh2ZUxEV2hBd282UklvajErRUFT?=
 =?utf-8?B?ZTRNNDgwUFJkWkRsM0dHN21KTE9kN3YrdmZzUUUzRHROS1UrZW9hQ1ZMVUdt?=
 =?utf-8?B?L3hzOGh0YmR5bUpNUXNsZlR6a3JDd0hiL2UyY2Y3R2tlb0JqK3dxaW1tTlU5?=
 =?utf-8?B?ZkhIcSs3dFFOMTlXYWp6VFNFR2JQUUNtb0s1dHhHNjZhNGJNSjdJQWZMa2Mw?=
 =?utf-8?B?aUFtWGtBcmV5QTUxYU9RQWo0ZStHUWxwcXJuMnlLTUJGdVZ4YnhBMDVncS9Y?=
 =?utf-8?B?SVp1VDdyL1pPdkJVZldNQU1rZmY0OHZ4YjRqSUhRZkZvMVRiNG9rdUF4ZWFv?=
 =?utf-8?B?NCsxcHYrZmN0ZWY5YVNmdWFJRWNmM2RpRlR3TFBGZWwvSjNFbUtQWlhtUnRL?=
 =?utf-8?Q?+qYvAIaSyF7CswoqBcOYMZk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR12MB9815.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGptVFIwQnAwcWZ1VUgrYmw5c0RSVWRoZmtxaURFbjV5cWhsaktpSmxzUzB2?=
 =?utf-8?B?c1ZBdEpYQjhPN2NZODRYQU9yVmZITEU0eHJJWGVPejhxLzhGWmZBM3JFTkpK?=
 =?utf-8?B?a29FcTA2QzB1VGdsazBTZExrVUlvWHpzOXBxUEVxN0UvY25mMk9IaC8rTGxm?=
 =?utf-8?B?MDNOaGhyeCtWdmM1YnE0QXdGNHRlWXVIMERQTGg4Z1pObmJWUHBKOUZ4Q0F4?=
 =?utf-8?B?dlJGTVRVU2pEOEIwQTAzWEdWSnZCN2dZKzJxNmErSDVIWjF0ZWNiTXVYZndL?=
 =?utf-8?B?NFBpK1hkc0hJZFhTaUdTRnFKa0FIQnYxblpBRnBGblJGcFpuS3IvTFFkbU56?=
 =?utf-8?B?dWZtL1pLWnI5c3k2SkJWM2VJUjlNeWdMZitIR0V2TE0xRkpHdG9HMHpaN2Rj?=
 =?utf-8?B?cHN4N3JIZ3BuRXg3c0N4bndkckVRaEFVNFpUYzdHMU9BdmU5SzduSk9WSnVo?=
 =?utf-8?B?YmRLdGhzQndsb3A0NGY2T2VVVW1YWGNlSnIyUnBMRXY5cWl3QzUzdVZ6SzVS?=
 =?utf-8?B?NUZkVTYvQXZFKzVzdHgvZEhXZFFkck03MVZVSUNqK24yZFkvTktjU1lNNzhT?=
 =?utf-8?B?YmJsamowSHZwZGtidHB6Q2FWSzVOc1NKbjFteUl4YkVXRzRlcmN2SzNHN3Jm?=
 =?utf-8?B?R050eWhVRkZnT3BGVzJuRGxuSnRpMi9IT3VMQkpBTDJNam1zSnd1MVFOVW00?=
 =?utf-8?B?YkdnSVh5bHpVMzhuWk96K2FlbnpLK3RIS2dxZlFNSVczVGJVMVBMYy9PaHpx?=
 =?utf-8?B?NlE3V1dGM25BeTdRRHpwZWhBL1hVWDJvZVlHTjc0aVZPd2hNWEhxYlk2ZjEv?=
 =?utf-8?B?SHdsRFRwRnJnMU1FcVJJV0JVSXArSDhrb2lWSTUwNjEvSDJkbUhxSXYrYkpU?=
 =?utf-8?B?cm4wdXJzenFxdUhCOGZLZnBKUWlHekRxYkdRblFVa292SjRaK0Mxb3llbGI1?=
 =?utf-8?B?TjJuZ2lML1hYMGE4bnd4UCtaeElYSmV4bFdSUy9ZVzlxM0R4Y1hraTJMVlR4?=
 =?utf-8?B?UjNvV2xqcDFvcXpvREd3SWp5L2pIb1RvNDVMNm4vREV2NnR5Z2s5SnNXZU1a?=
 =?utf-8?B?Yi9OZEo4YzN2eDhyeHFMcmdHcHFLRytSa2dzQllkejlsR1N0QmhZL0ZZYVQv?=
 =?utf-8?B?d2RJMXpPTk93TzVGWktvSWVSK3dUOFYwQnc4dFREMDdVbWtrRnJOVnA1Mi94?=
 =?utf-8?B?WWx0UUxjdmhORlFTbHhzcGNZVkhPa2JGeVBWdGdNT05sVzdzemtSVTljeVl4?=
 =?utf-8?B?dzZNdXhMTEtneGF4SUoyZy9JSHdQM0hSS3Fjamh6VWZRdW84S2lzdktGZzQy?=
 =?utf-8?B?UXJCU1VNVUJsWHdyTG1US0pXQllnYVRHTkdDZzBlTlpyOVlGbVllNGMreFZJ?=
 =?utf-8?B?dTc5NTJsb1FvOEhRZnM1cW1Sb1ZMRllsSFVIMXMvcndXRFZjbE5KZU1VS3RJ?=
 =?utf-8?B?NFl2VlNlOGN4RTI0N0pjYUtacGFkMU5GeFVLanA4TTNOMTNxZmlhUkViOUFl?=
 =?utf-8?B?REF2NWtIWDBKVnM5eWFRTkxtVDNhQ0t6RkcxR3o2OHZJTDZiN2tnNG1NZTVS?=
 =?utf-8?B?aVZXVXZQWHJ2SzB5TWt0QUhjR3djamVTdDhSYUlRVWViSDZFcFpVbzQzQ2Fm?=
 =?utf-8?B?U0p0RFFUaWlrWXE3Z0FqSUdEeXp2M0kxbHd0cElsYy9RNVBuUDZXaGYvQVdF?=
 =?utf-8?B?ZFkrL2ZvOXJlMFN3SUF0L2FYV3k3WTMybS9hK1BUUjRyUXhNeHJBV3BJaDZB?=
 =?utf-8?B?SCtxV2RsNjlsL2VOSWd3U3lXNUJtOUtHOGMraFVvcDdwTFBFK2hPam54VEZH?=
 =?utf-8?B?ZkR6ekU1aERNL01aZUxKY0FzUWxSQUQvUGNvMFdTZXNMOW5pb2huTjFSVTFY?=
 =?utf-8?B?Z0NLb3hPaWR4T2lLMGVBT2lVbk9CNnZQZVZnVVVTQ3MzeG9UTUNIMHJsM3cr?=
 =?utf-8?B?SWZ3NlVZZXVrRjFPSHhobjJIS3BsU2xHNGlldTlpMDVpVEV6aDN2VzYvVmV0?=
 =?utf-8?B?VlVmbE1JbG40NHRCTTQvcDlwcVIza3phRzM0UmJ4RzN5MG10dVpHY3I4NDlC?=
 =?utf-8?B?aml4Wml0RmYxOUp4cDQwUldYQkVpVWtRL0tZSDJGeG1ZblBUODR0dXNXSVFs?=
 =?utf-8?B?MUw2UTRYVGFVbndFQVpHR2hpYjNxcStQM1RxWjBwVGsydVdhOVpXeHBSUSt1?=
 =?utf-8?B?L25TMW9pbU40ZmlpeGtRYkhwSkx3VDB2dEtGRFF2clRyWDNxL04xVjNyNjE5?=
 =?utf-8?B?VDVWb0pxVXA3bk5ET0FYeElkb0RkMUhTQnZBdEZRZVpWZ3VmVVc0czA3bUY3?=
 =?utf-8?B?VXVyZ2dWVUcyMEtKZzB6YnhyRHpvaTVuMlVCVllnTjdIUWdvekZqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ADA1180B9FD1949B1A6F204C60012A1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f84268a-337a-46b6-eb84-08de643577f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 21:36:34.1039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89NuhPm2sGDHCKqOF172Gm6nXcjUdyOS5XgTLssxGendKOmVnO94ACApH1vh24xTONzRRDNyl7P3h4DeW7bZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999080
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ttabi@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 35351ECC3D
X-Rspamd-Action: no action

T24gVHVlLCAyMDI2LTAyLTAzIGF0IDE1OjIxICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9y
NTM1L2dzcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3Jt
L3I1MzUvZ3NwLmMNCj4gaW5kZXggMmE3ZTgwYzZkNzBmLi42ZTdhZjJmNzM3YjcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9yNTM1L2dz
cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9y
NTM1L2dzcC5jDQo+IEBAIC03MDQsNyArNzA0LDcgQEAgcjUzNV9nc3BfcnBjX3NldF9yZWdpc3Ry
eShzdHJ1Y3QgbnZrbV9nc3AgKmdzcCkNCj4gwqANCj4gwqAJYnVpbGRfcmVnaXN0cnkoZ3NwLCBy
cGMpOw0KPiDCoA0KPiAtCXJldHVybiBudmttX2dzcF9ycGNfd3IoZ3NwLCBycGMsIE5WS01fR1NQ
X1JQQ19SRVBMWV9OT1dBSVQpOw0KPiArCXJldHVybiBudmttX2dzcF9ycGNfd3IoZ3NwLCBycGMs
IE5WS01fR1NQX1JQQ19SRVBMWV9OT1NFUSk7DQo+IMKgDQo+IMKgZmFpbDoNCj4gwqAJY2xlYW5f
cmVnaXN0cnkoZ3NwKTsNCg0KU28gYXJlIHlvdSBzYXlpbmcgdGhhdCBzb21lIFJQQyBjb21tYW5k
cyBuZWVkIHRvIGhhdmUgYSBzZXF1ZW5jZSBudW1iZXIgc2V0LCBhbmQgc29tZSBkbyBub3Q/DQo=
