Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B6B3C2AB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80B710E1F4;
	Fri, 29 Aug 2025 18:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SjR24b1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F2D10E1F4;
 Fri, 29 Aug 2025 18:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtQxiY3wwQa2MGviRkgF+zIdNBXhnkDkUJtE3Bt2jUWoXzJ371KRIeG8I5komJxzq1MiZlI4mF8H74vrlmDNpn1RI65b47u4zBVlFFpkIe8t0gVu0aLX5X9sLaGpNj2ckiGZaKln8FIlpNsIq6fXSvqwjsJ2WOduF1h7qmo62RHCGF6HC1YpmcsEuveyh267UOl/jhqwMSWZ4Ub8t1rz/FuLLuNwMf3fEg5oXDDOMK+wgULvi5DkPHsr1nGH/UbaUrfee0V/rIiUHWsfNcVTkR7dzmvDp2pbTxGcbqo1wmpSbG69HCNxbLcTivHgTjq66m2k8oP2qRizFQ2Qm0MKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2Sra34qcrU66BDDwos7kIpbGAspdPS7mxXOZD+eEd0=;
 b=N20Fj3fKww/m3EwrLju1+cma/uDIDhYjfbhmYAfYl25eAubiUv6/+zhZSQBSZatl7t//MwmYxpMMsE0Bgq1hGM/4YgtD9/Lms3nIwqP1R48P6svjaamuLPTK+qEi4Ub0/pgSN4VSvIaWmOeIZTD5Y/Dg89SE7DtPXZ+6B2Uouxg2D8gd3VMYXJBOSc0qSBvXRcHUd+CI5uCDEtCi+ga/XDVq//QLhvE0WOXb7i9+KXnyBjcvV6VMOAPujYpda7wx1l944cbx58c+xfJbwwxJ9gRYKUUXkyUXS5s9x0jAilPiUTmpHXYqZ5P3WGMbN2QVzPCNI48mWpXKcl1dQ9tfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2Sra34qcrU66BDDwos7kIpbGAspdPS7mxXOZD+eEd0=;
 b=SjR24b1N1HabEEqyOgTxbtncpmmKyccDNyTLtl/tVnA7BIDI1JS1znrmTKK+7+S2yw+cST5qr4V4DrTloO20ExrrH8cOzbVgUcAmcMT565Ib7ByU8QIVLO0R7etNuphAYTWjYtpAxq8WmRi2jDFKOYl9BKdELEfgActVjJLkfZFgWg7DYdBi0EznDJ0ZL6mwecqtyTSBtjyBJ5Nmd0DOxr20VuvW8czPUNcqgG2dmJwZas3n39QCYDrpYnQptHmmSIMvmWXvOIjNN1Evp9bRWvR9K+XGk0OH2PhVtgfV2yptmvneOVaP57ugUnFuQ4Gfm864lR6RBuo8QMILg2a/2A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 18:48:45 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.021; Fri, 29 Aug 2025
 18:48:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH 08/10] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Topic: [PATCH 08/10] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Index: AQHcFyuLtTNBUE1oWEmr135C0UxaALR5/L8A
Date: Fri, 29 Aug 2025 18:48:45 +0000
Message-ID: <ed0e4a38be11a954338cafcafca66f6dbf015ce6.camel@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-9-apopple@nvidia.com>
In-Reply-To: <20250827082015.959430-9-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB4197:EE_
x-ms-office365-filtering-correlation-id: c2b2ea30-61a6-4bec-10d1-08dde72caeca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SWdPTGNiMXFDZDZxUmZZS0JqSzZOL2tLdHM4S1F3VDRaYUV5VklQQUZBTHIx?=
 =?utf-8?B?UEc3RUZ2ZXUwMVBnSzFYNkczMCtERkMwS2ZvS0dZNlNONnVmMkIzcW1IYmE2?=
 =?utf-8?B?UGU5VUxkajlnUzdNVGtCcmZWTlhyL2NIVC9ER0dRUTNuaHg5SFNkOURMeVVR?=
 =?utf-8?B?Q1JNUnk3ZGRSck9rWFZSQUZlZWdUWklDdk1VbTVnVC9RVjA0Yll1b091S0Qx?=
 =?utf-8?B?WkRFQUpoUWgzTUYzZnBMMVBPenE2ckQ1VCtlSkszd21vcUdtdnpQTFN6M2ps?=
 =?utf-8?B?NFp4ckVUWFp4ZUx2UjBpYjRIdEdGRFpaZTNSU05tTlowLzNNYytTWjgvVTA3?=
 =?utf-8?B?QVFseEJSeWc2OTJBdTBzNnd2NzZUREFicnlwYWdoSXZuMXM0WUNsY2cxYjNC?=
 =?utf-8?B?cUdVNS95UXNYM0s3VFRidzFhVGlLREphYUEvYWZTWTJYUTVYY2lvM244TXVK?=
 =?utf-8?B?eGpsWXBMdUgyMnBpbXVCelc0WlhNZFRGNWIxSFhFa1ZnVWk5U2paamlKTWp4?=
 =?utf-8?B?VkRZSmIyV3UzYjJDWjlUcDRTYm9lajltenZIdm9EeHNHd2hrSWFqU2UvZXhY?=
 =?utf-8?B?NElKRUREYW55VUxXMmhhS1orYmVwclBmRlBReVNvS0dYSTVaQXJvRW1mS0VW?=
 =?utf-8?B?RFJ6WjU0SlBHY3MxQnVGUHRqcWh1cjl6U01TbHJzaEZzb29FOGUzNEw1Ry9a?=
 =?utf-8?B?NFZHUnhreXRsMVRKWkJ3U0pkTGtJUGUwVjh5aGs3cWMwckRZTVY3SmlGdU1q?=
 =?utf-8?B?RDU3ZmR5eERsRjdLUG1rcXpwVUdNY1JGWkJEcDAxandOampBNFRQNXlRYUlD?=
 =?utf-8?B?NEo3ZER5ejNvMm0rOXc1SGpYNlUrVWNrWTY4ZHBGbVFxWEJnR0ZKV3BTc1RR?=
 =?utf-8?B?VEx1aWVMbXhZUmkrZUREUllMT3FGelR0ZktFQW01QjRkOW1JQzI1RUNHM1dD?=
 =?utf-8?B?SXBXZEM4OGVlUmtWUGMwemNSdUd5QTVleTZ0RElVRUpZbmNMT1RMdnM2cnNY?=
 =?utf-8?B?WHNKTndpU0xBbE5pV1hiZE45Rmttbkh1NC92OHlHSXBtTG56MnprNjl4NTdv?=
 =?utf-8?B?L05hdkMzK0J1OVBvL0pEWi9kakk0cjB1NHFDT2w2OWN1UXNXQmtYTjFLVGtF?=
 =?utf-8?B?eW51YlN3S1p1ZXFGSWxJV1FzN2JjVFpKMDJ6YTQveVd4ZFM4VHFnQlpSMmor?=
 =?utf-8?B?aldwbk5YMFBvY2dYMU1sMUhrcmlSKzkvZk5Kc2d3SGt1YVZibjlWZFA1ZkZk?=
 =?utf-8?B?eGdCYXJGQ3NxWWwwWlhsamRwTEk3YmtEV0ZSVWlaRkRrOUVhUGNwaW54YXBr?=
 =?utf-8?B?QmtxaEwvTzJmd3A5UWZoYktGWFU1MmdGbTR6QVdsSzlwN1BQNzNYMmFHWTdM?=
 =?utf-8?B?eGg3SVpCSVUyR2Jibi9yamlQMWR6aWVtVVA3aFhkREdzY0RKQVd4QmZiR0x1?=
 =?utf-8?B?U2RhaHlJQTlPdjI3YXI4V1hHSjk3eitlN2tvVjdGcG9wUW43VFVHWkl3V1BF?=
 =?utf-8?B?ZXFlSmQrV29UMzk3aEJXYkVjb0x5WWEwVGFiaWJnOHczbjdFT0hKUmo5RjV6?=
 =?utf-8?B?V2xOanlhWGY1dHJQbW1tcWs4VmFzKzJpMmNhS05ZMUw2TkF2QVREVTBDQld6?=
 =?utf-8?B?L3IzZGJUYitueXgydUpuemtENGx0V21MRnlCZDJ1UTlYRXJNek9uUEduZnNS?=
 =?utf-8?B?M3J4ZWJLSjRveER3cEoyNXZBVVR4TGxpODZvMDFKaS9rRVhHTlhsVUJiWGJv?=
 =?utf-8?B?K2pzSklnczQ2UkRPa3Q1WVRVbVNoZnB5WlRFbjNTRU8yR1ZHeTVTWGxGMnZn?=
 =?utf-8?B?YURNcUJuSGt3Wk9PQzVBbWFwZ3N2bmVZWkhEdFl6dVF2YSs0ZHpubUJ5dDRp?=
 =?utf-8?B?S0E2em84RENHWi9hKzc4NzJlNEp0b3pnSmxVeGtWcHRJa1JsZ0xQREZwQ1NC?=
 =?utf-8?B?dHhuK1ZwN0p5N1dSbXBXT1JQa3RrTDRuVWdwTG54bTJVVkF6STJCS1F6UWd2?=
 =?utf-8?B?eGU4V1grUnZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3FpbGpIaVhaVExrYjNaVm9IK0sycmNETW4vb1Z4MUZaWXViTlVOcE1mK285?=
 =?utf-8?B?VjBEOWRhOHdhT3NmREZoOVdBakR6VjN3bjRzNDgrS2kyZzVYRTJXRUdONHE5?=
 =?utf-8?B?UGQ1Ti9ucTlDd1RiMGVzTzBNdklyOGhjWC95RFZISVdObktnbmVYaXFXZXFE?=
 =?utf-8?B?c3hVSTJoNjYvaEpsK1A3eVRWZGZqc0VQVXFCR0NMNmxlcldqMm85SlpMVG92?=
 =?utf-8?B?ODJsZ1hOZTFOejBRZkxoRnB3OVhIaERXS1BKQ2tLLy9sbE55ZGQ1QVlJOWor?=
 =?utf-8?B?Nmo5L2dFODdXTnJWaHlzcmkxS0VMZ25uUmYzbWFDV3NjMFVsY2hObVVtaFph?=
 =?utf-8?B?dDQ4Z1lOUXFzQm40RHFPWUZNWmpUUXVoQXJ1SEMvNlNnalgxakZnWENGb1U2?=
 =?utf-8?B?SWRrM2p3U2JtcHUwUEsyZC9PTkhRQnRrV1FvQ25JOHEwWGhuUnIwc2NOTW1V?=
 =?utf-8?B?VDVwMy9wWGo1WWZPYU4zOGVvVUtTb0NFZVVtWDBlQ2FLRksxR2tZNWU1TVF3?=
 =?utf-8?B?U2ZMZDc2K1pNSDNHMnNIaHVtVEIzejZtbHBmZTIydTdGaUJ1eTNRRGQ4SEw4?=
 =?utf-8?B?aFpaeDBtanZQVmpYa2NmR0o5MzQ1TkUzRXRFMlpDOThucS9YeUp2VUc3NXRY?=
 =?utf-8?B?NnQ5R2dtN1Rpb3dDYnRPUVFLOThDdHNSWDh4dHdqa1ZFM0xSL1o5ZmtLVGQ1?=
 =?utf-8?B?dDdORkxPNUtaeXZSeGJYS3gwMXF5MzBKb0o2SGQvSjl6bGVBeXhmcys2bE1y?=
 =?utf-8?B?QVdUaEIzZStUZXh3YUZ1WjlnM1FQOWI3NkNHV3hsdnJMVDE2SW1SZXk2S0xD?=
 =?utf-8?B?TjBuZTUwWVF5Q255Wm5FMlE2Y2Nldk8yWllSZWNCb0ZhYWVhT1FtZWI1NmFk?=
 =?utf-8?B?WXRRSkNoZWQvcHFFTUd5VXpTbW1OZ2FWQS9aN3d3Qmw5MUtMMVVGcTBiN1Q3?=
 =?utf-8?B?N0NhZzNXMUMvYnpPRHBBNWh4dVVObXVsRzk4UXkyVkp6UFpWVVp6Tk9EbWh1?=
 =?utf-8?B?R09BT0tXRkUxUENJbitJaW5QOUdYdlJjR2RJMHY3bklOUEllMk1YQ1BVRVhv?=
 =?utf-8?B?dGU3dXJETDVZRFlUcjB3ZzRuMnRpRGJwaktxaTdDQTRZSCtZK0x2TmovTVRD?=
 =?utf-8?B?ZkRPYmVoQXJ0MDRNVzlsSDJ4ZjdWbC9MeVJrTVBmRkEyNkg1blFxTlJ3WEE5?=
 =?utf-8?B?SWsyN3R0dlRuWkM3OS9GdVFTbys5SFBKQzRwQnpWeG1vcEJzcmF0dVg5MnR0?=
 =?utf-8?B?YUVwMW45MFlUL2pFN1orL1RaZWdUUGl0S0FjeWFKUzJtS2pmQkhYTFVSQWNn?=
 =?utf-8?B?SjQ5NWVINGlmZGNIcXBRUHJxaCtLTGc0cHp1NzVSK01EWFpVVXdHa0U4WFNU?=
 =?utf-8?B?eEt4Q0xXd3ROZkE5MjhoRzViRU5NN094L3VWV0sycDR3ZG9lYUlSZDhvajFG?=
 =?utf-8?B?Q3pvUThxcFd2c21sL0phNDFXbTBSdXpBQTJocVBSdHdjNGFkbGpsc3d0S2xD?=
 =?utf-8?B?ZFc4VkdmWUR4YlozbE1xaDdzeFA2TEYzbjR6dE43SnQ4K0dFM1luREJVdThX?=
 =?utf-8?B?ZG5vTzQ0cDd1U3BvQUZZVkVyN0h2dVdQU3czTU5ubGQvaDNIcElDKzVRZHp3?=
 =?utf-8?B?eVJmUzlaQ21hRm1LYm56amdWRmE5cWxhTEI1VHgvb1JaTTNyUk5WRG95R3hw?=
 =?utf-8?B?eE4zTU1rbkErWGl1NGd1Mmo4eE9WK1R3ZEF4WGx5akluRWFtWGVaU2RJQlhB?=
 =?utf-8?B?emtoQmwzbjNKZEg0OUxiOGdDVlNyMVZQNmQyZkhYRlBHdEVCKzBidVY5SkJu?=
 =?utf-8?B?Mm1tVDlUQ09JREdLclo3TWU5OWF1eGpkTEtpMFBWd0l6a0RnTHdOeUtyZ1Yz?=
 =?utf-8?B?K1pHWHdCQjBmWWFjR1lnTEJRbzdBaGg4bHpMcWNZNklaR3FVcGhUNy8weVp3?=
 =?utf-8?B?YkJ6SmU3SGtwVmJWNFYvWXloNjVqbHErTmpiMnp1bzF3SXJSWU93T0dWUnNx?=
 =?utf-8?B?WlNzcHRtZ2h4VzJtbHZlSWdKY3pKd1lsZE0rTUdWME9EdTRtZkRzdGZzV1pS?=
 =?utf-8?B?UytkcC9FakRnTjNOT21lTDAyZzM5NGZ6eXNObStDbldHNkx4SkNDZDVMZ0xQ?=
 =?utf-8?Q?Iin7RFV+3WeCB9pCcuih1GXi7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <405A7A4EC79D5843806B5BDAEF8C9FAC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b2ea30-61a6-4bec-10d1-08dde72caeca
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 18:48:45.3403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BKet2imrm3zmhR0+BSF+YY+Qo+9zFqECEHXqZpgPxa85zL9Mvug3WfgYEuah9BjGcCmEpLm12pXFxeRpQTAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
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

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE4OjIwICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBpc19yaXNjdl9hY3RpdmUoJnNlbGYsIGJhcjogJkJh
cjApIC0+IFJlc3VsdDxib29sPiB7DQo+ICvCoMKgwqDCoMKgwqDCoCBsZXQgY3B1Y3RsID0gcmVn
czo6TlZfUFJJU0NWX1JJU0NWX0NQVUNUTDo6cmVhZChiYXIsICZFOjpJRCk7DQo+ICvCoMKgwqDC
oMKgwqDCoCBPayhjcHVjdGwuYWN0aXZlX3N0YXQoKSkNCj4gK8KgwqDCoCB9DQoNCkkgdGhpbmsg
dGhpcyBzaG91bGQgcmV0dXJuIGp1c3QgYm9vbCBpbnN0ZWFkIG9mIFJlc3VsdDxib29sPg0K
