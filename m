Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E690C50600
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 03:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61BD10E681;
	Wed, 12 Nov 2025 02:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q0ONMrnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF410E67D;
 Wed, 12 Nov 2025 02:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhY/YWAaYL4H2bJthkIkHmjTKNvLGEm4+E5WnTeZHAtdipoTA4gNm8wQn8LLtC85iIcXd6FwqOfJhb0CXxOHK30xM/OsX/8aEV22xkpbhgK1jWkCfHNJk2hpSakG3SI0k9waRCmrUQ4OCBj/imOtEapfxxMPdBo0KthH4V3+msXvIlKwdwaivKDnFDe69WBj3jLhl89SRUKbtqUPLkcwi58s32g0JVcn170jo3JFe2gfhiYz/a8LPJkAhLB8r01+55uVqazVlhjJXcsX5kcTS1fLCtrN+o3PyN/aH0Fp+Cbwt7xmQ28WJk7WPT0NZw2LqbiK4CCmdYxw447gvt4JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+MIrfUCUGWP/OSwKuzSKzS4bu9iVwEcHi8I/CAjUpc=;
 b=ce8UhX7FZNE6W0M6Gay8jVlN+8DsEVkrV8rJgpJxBXQycuTZBpCtwH8wL/kRkTNvBKeckT8uQSqCVaqJ7TEeq1zWkj71xuDmOOlWPpnhJxCKYG/EOnmPa/r4ML/k3fytwlcJIU6XNFXgaEmZo8/k89mEOK047NHfJ5BNUgMhIfdoDstssAkjEPT8JyKQXkylD5UJajdmulmmHgbzU+WmDZM9FO70fr/Ha5OZ5wJVcMWY9447TuQxNLnQgjjB024g9PFzeem4aCOUE19dqhY/RLVSFhm7tHENTVWyl21kESHrUppfF7/UGrnIshdwP4Xo8dCZp0SGS47swN3KuICteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+MIrfUCUGWP/OSwKuzSKzS4bu9iVwEcHi8I/CAjUpc=;
 b=q0ONMrnVKz3rF+9WnBBv9DIIuicEf6MIH9i2NnNM/weTztnb7jxPPGZ44Q3hEUgGMA8YRDDP713ExKpVVw2rLBHrNnvWtEXAlxYbhS0gXxKY9oPiDLZznZxCo1WD8NgpeLk01SRuqXVYYRcrGeXXxQLSKeb/SiB6l0g1AZgjvgapvG0d+JfD84I1BCN1UnSQv/uK9UxZgNOn7pETOT4d6wdP/UppKippZ1SonBAcP/dpkKxKu0mrqxIgYfCyBvlGM2qQPBD4s/NMMuRcR6OBRAyLzpqN4xtjLKM5qWhvgjpolSWh9EefuqAF0lMpaJfU1aPyMVahfHhH9GzOBJwFBg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 02:57:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 02:57:14 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
Thread-Topic: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
Thread-Index: AQHcTFS/gJzxvkikqE2ick5GH2mE6LTr910AgAIunICAABu1gIAAJcAP
Date: Wed, 12 Nov 2025 02:57:14 +0000
Message-ID: <3E006071-AB3A-4391-82CD-F9C9BEFE2386@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-8-joelagnelf@nvidia.com>
 <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
 <0181a17f-5773-4cf0-9473-7d4ee9122105@nvidia.com>
 <DE6ARX705WO3.1MLSW7OWUCX7S@nvidia.com>
In-Reply-To: <DE6ARX705WO3.1MLSW7OWUCX7S@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM6PR12MB4107:EE_
x-ms-office365-filtering-correlation-id: 3152d9ae-7e8f-4936-0022-08de21972eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NWhhRWx4eDNVMnU5UGc2aDdGaUQ0VXBTS2JEZGJMRkJUZ0JFQnNpTjlZVmhu?=
 =?utf-8?B?OVpRakNGenZGQ01XeWtOTzlrRHRFSlQwMDdGRzRUYmhybVRpbUNKMTZieUFT?=
 =?utf-8?B?TlQ5Z3JWbTRMSzFUVXF5TlVsangySlVScjdCSWtPYlhSOHl0L0luNmY0SmJx?=
 =?utf-8?B?ODA5OWZQMFVLK2FRS2QyUFdYdERhQ2E0SXdVVFJSaFhtOC8rVEYxNHFtaFlY?=
 =?utf-8?B?TVFYRkV4Ny9EWTRLVnJTbmxLVE55WWQxa0lGWk80Y0lpOG1YY3IyUGJVRlla?=
 =?utf-8?B?bFVrWE9nRURLbnUraXBYOG52NW5XZXJaMTRvb0tiMENqM3M0S1Q2Nm5PcjBw?=
 =?utf-8?B?MVlyQnFvSzlaOHZZaDc1MFZGSnQxVEFQMUZ6eUZUSjBMbUx5OGttR0VFV05E?=
 =?utf-8?B?ZVJucFVnVmRiY1FWd2owbHRPaTRydGhxQVVtTzEwbFZxaXp6bTBKNnltWG5h?=
 =?utf-8?B?MXI1KzNkTlVDUUdXamVlUEZtdkNWRDh3Z0c4SDViUjl0NGs5ZG83aTN2UCtw?=
 =?utf-8?B?aTl0MEJVSWkxOWRrdnJVSjQxZVc1RlR1SVlSSWJOUGNyZkNVVU1hK2ZUcVFV?=
 =?utf-8?B?ajQ4bXdPZU9qbE9FWWJUOHlWamZSMUU2bFdJK1JSUEVsRUs0K09vdmx0bVpw?=
 =?utf-8?B?OE9jbFlvbHZsWGlzeEUzWHFNQ1VwNStQTGNwWTZzSTdzSVhkSE03MGphdzh2?=
 =?utf-8?B?U29HYWxXdWptL1E5ajBTdVpNZWZlY3R5a01qTm1YMFJmMDNqbVpHZVViY0o4?=
 =?utf-8?B?bkFscXV4elh2azk2TTZIbGYzWWRxZVpDUzg4TFZENGZnd0oxWUFRN2ZzeEd0?=
 =?utf-8?B?RFRxZk52ejV3NUFpU2JJQ1VtQk53YWNWTjZETm93N1ZBNWxKNDUwWit0bklU?=
 =?utf-8?B?a0IrM3hZU1ZVQ29nbUpaUGszQWFQcWNiaHVOUDdqQ2FXWmtIdnlTWVZVRlF3?=
 =?utf-8?B?M1MxbVNicjJDYytyZ1RDaTBwK1Jyb2ZTZnJYMmU2VkVreStrWTdTbTNEcmt4?=
 =?utf-8?B?bXREVDVtamtqWDJETFdUb1JYWGV0blJvVUtHOWFyUk1sWEs3UzNQeFhmL2FO?=
 =?utf-8?B?QW8wcUFkd3hUUzNvSXNlUzlVZCt6TzN4VUZ0OE9zTkdOVXoycVB1R052Z2JS?=
 =?utf-8?B?TGc1b2g3ZVdvRng3WXZheWhpMm43MlZkZE9pNzNJaWtJVk5ESlhRUzh1UEo4?=
 =?utf-8?B?ZHNIUXFia05oclBWanU0Wm96NmZVSE96VVh0ZkxsU25hTmlMdDc4QTYyQjFv?=
 =?utf-8?B?NzcvYmZMOFduK2c0WWZUWUVkSEFMaDlYRG10N2lYcUhCZmNueURXdzdmOFI1?=
 =?utf-8?B?NlFZdVlvMzNmd2VXeExiVnllMUpnUkxvRjFlRUFsaGYrTXVqWFh3ZEJtazdI?=
 =?utf-8?B?cHAyajBxejJERW1uaHkrc1NILzAvanJORktqMk9JUHg1QWJnYTRqa2VyTzE2?=
 =?utf-8?B?RHpDTWl5TDFtSkErYUQ2RmRKZlpGbU1YaFNrLzcxVDh2NHFGTjZXUmgyVWM2?=
 =?utf-8?B?cnNLUGtpK2FCd0E4b0h0eEZUcHV6dXdlV0E4U0xTb1ZtWVkraC9oS0wrVHl2?=
 =?utf-8?B?SWFLSzUzd2RRMGdLRy9lMXd4U0ZBYk1WbzZOZVpUMHhRMDNLM2FkNU5zL1Rl?=
 =?utf-8?B?VkM5OGhpTTZVVktZZHVubzJjWVpCNkhqY0JQeUUyVmZXcm9XMUFHVFlkb0Jw?=
 =?utf-8?B?QXR3R2RhdDBBUWlVdHhmS0VONFVMRC9LZE5vZHhyVTRjWWVJTHZ6SVY1aE1z?=
 =?utf-8?B?T29aMUFPVjlXYjZxb1o3YjVOYUpHUW5qQ2o0Uk04MXhHN2g3ZklFb1BQRlZh?=
 =?utf-8?B?TDFrM2ZRTUczajVVL3AwVFVVZWVkK043ME80R0JWOWF0S09vMzA4TUdhUlJF?=
 =?utf-8?B?MHJreGRTdys3NHpTNlNWM1l1bm9sa2x4WG1rWkJWZkZSU2tBY1lrSyszcHRG?=
 =?utf-8?B?Z1BJWTBDcmIwNlBwQUNPWlU0Ym1kRUt1N0YyVmJIQUJLd2xaME44U04zVi9C?=
 =?utf-8?B?SEtrNVNyZlVFaVZYUy9VUzBnM1RHRDZQczJZOGdaeEl6VTV1MFVlckViK21O?=
 =?utf-8?Q?kgYCAh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NisrUGNLZkZDZnNNT24ySWlSMC8zZEJvd0tERS9KUzhYVkxVMDR0QVo3UUxZ?=
 =?utf-8?B?Q2Zia3lGYmhxZDhXV0oxaDlzRDZYL2Jzdk9GSkN2VnJYUFJ2WXVPaUVZcy9k?=
 =?utf-8?B?V2svMWg3a015RWwyVXEwUEJHSGVwWFk0Nm0yZjJZZnVzcEM2aEpJWDRKMTRs?=
 =?utf-8?B?RGtVaU5NcENlUDFsV2hNZUhJU0ZNZTV6U09zbWx6NDdaaXM1emUvbHZ0M3Bs?=
 =?utf-8?B?eWhFY1RkNzNRclZCUWNzK3crc1pjL2dXVm8zMUdvcEtRejBIM214UkxtcGcv?=
 =?utf-8?B?Y0FKVW0zYjh2d0pVdjBTNW53MWd6ZUlJODh4b05rZUtxWmNPS3d6SWZVMlhZ?=
 =?utf-8?B?aU9RQ1R5RFRVazI0V3NOV0hhT08xait1OU95TTM0SnRXZjdoMm83RWIrc1BG?=
 =?utf-8?B?ZUpxRDNkbEhpK3JFNzFteFhGYWg4MkZlbFR2dzZ1czd0WGFGVXgwalJCUTZM?=
 =?utf-8?B?bHBwZ2llZkdkMy9la0VMQzZFK0JKaVN5QnlzRHI2blkxTHV5azlGSzZhT1A3?=
 =?utf-8?B?ZTdrdWg2dUJKcUFDd2dWSlNMWmNCc2Mrd2N6d1VYNS9Tckw0SWFIdEJrS214?=
 =?utf-8?B?N0psdlJmREJCYXlZZTlnMitVYVQ2WEJPRi9XT3JsWm11YmZlbTZwMFd3d3U4?=
 =?utf-8?B?Znp5OFV3RnM3NU8rRHFLYmR2cG1EUGpBQVVGam50M2hwUEsyb044KzlWcXlj?=
 =?utf-8?B?S1loazEzV1JXQW9YaDNNN2tHSEN1Yy9IbEQzanhRQzFoQjlzNlVFeXdrNTNP?=
 =?utf-8?B?aTFzU0JwVTRjeVF5UGpEZkhzazJUM0lBZDJTaWxVVjRxb3ZMS1J0MUV3U1VT?=
 =?utf-8?B?WjZNODd6U3hQYlZMWmMxOERGc3UrbDlKeVpaOXpQOENYNklTRXZJWVBEZUsy?=
 =?utf-8?B?TVpWZ2llOURrOHlOSTJCK25BQXVRKzhjWU5OWWlLczE5Y2JLbVZqUzFoTm5x?=
 =?utf-8?B?Uy9NYStKMml5aDFBTmNoNzZRQVFWSkdvUzJxZEswcXFCVmpCdHZPZnNTeU1u?=
 =?utf-8?B?dmVyWjd3NnV6cGdrSGMyWXdTSWlDSC9ZRVVPOUZLRnNsTXlNNzR2UkV0TFUw?=
 =?utf-8?B?QjZ4clFDODlKbU5tZWg1NEdqOFViN1FJbzVFOHFqeWNaY2p6OEpmQ1hiVnVO?=
 =?utf-8?B?eVg4UEplRHZ1L25zUm11emV2djUrc2ZBektvN3BhOFpCZTNNU0NzWFJvOWox?=
 =?utf-8?B?c0hjeGtzR3JFTUF1bkxVZ3ppeU50UUJhM1JOaVpvczlWcXpUVFdiMTJPTGtz?=
 =?utf-8?B?Sm1nSXhRODNaTUJRT20yR3lxaU9aV2dsZXd3Z0svUy9JUmtNT0FuR0h6c2ta?=
 =?utf-8?B?SUhJVllyOUZSWG5tSWsrTTg2d3RZSkI1TUVMSkU0cmFPMlFOL2Juc1drY3dQ?=
 =?utf-8?B?TnFhZ2djaE0yUlNNd1ZabHRkS0dEcDhJSy9ZQndsNXRpVHk1dnlKejJ6ZUNu?=
 =?utf-8?B?M3ZMK3IwL2t2VmJYV0NlNEtqa3VzYWFuNFpjZ3EwMnYvZUgrTFpsZ0ZmcUlR?=
 =?utf-8?B?K1pGQWwwSWEyeWpBZjdOUHZzWjZoZ0h2cUxxM1ZoRmhuVGlIS1ZJOS9NY2h3?=
 =?utf-8?B?eUR0bGxpWmhWL3VhWXNLcFZZUjFtWFUwNHZNVnE4VGlwb1YwcFc0aStpYVhi?=
 =?utf-8?B?WEJmNTJ0RU5MSythL1dmVFZkWnZyZmVwdUFzdGY1RTdWcE1EWWVFSm9PaDFD?=
 =?utf-8?B?Um85clBpdUgrdGE0QmdpNTQzZDJRZHAzWXUyNFBKWngrWDFjTkp3UlRzUHo0?=
 =?utf-8?B?SWpCWU1UWUdjNmRKV2NPNTNNZVFPYUhSb3FQam5sR2hibkpzUURhay9BUms1?=
 =?utf-8?B?eG5YVVc0RGRWUU5hc3pVTDdlNG5DOFRCWFNtOXlUY2FJdVIrTUl4VkhyOEJw?=
 =?utf-8?B?MituUGFmd2d6OFJ0Skswd1V6R1dHOGFVNFFFbUpoNEpXTkNXNnNYbWdwSytL?=
 =?utf-8?B?OHBhYVVDYzg3VkFoZDBaNFA2d2xERFRRdDhZenVyTTYwMXBsMkdFU3NmK2la?=
 =?utf-8?B?YldGaXdtQkJZdmFLZG5TMklNUlFYZTh5b2tGM3RmUTZWVHI5NmY0K1Y5ZjJu?=
 =?utf-8?B?SGl5M3BvUjAwcjUvSzBoYWIrNXg3VFVvWEpCLzIxaXBBR3VPb2FBdDRZK3BR?=
 =?utf-8?Q?1Xcci/sl9/BqQStUT9dYZ/POk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3152d9ae-7e8f-4936-0022-08de21972eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 02:57:14.0250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cqGs00XSsZMb3WiOdUDNtV7OF1QoUzOp5afHphAJO0i49GG0XQ6jADm4dmsP0nPH8PwWQBkcFKxzLtUakqIVow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
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

DQoNCj4gT24gTm92IDExLCAyMDI1LCBhdCA3OjQy4oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCBOb3YgMTIsIDIwMjUg
YXQgODowMiBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gT24gMTEvMTAvMjAyNSA4
OjQzIEFNLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4+IFsuLl0NCj4+PiANCj4+Pj4gKyAg
ICAgICAgICAgIHxjbWR8IHsNCj4+Pj4gKyAgICAgICAgICAgICAgICBzZWxmLmN1cnJlbnRfb2Zm
c2V0ICs9IGNtZC5zaXplX2J5dGVzKCk7DQo+Pj4+ICsgICAgICAgICAgICAgICAgc2VsZi5jbWRz
X3Byb2Nlc3NlZCArPSAxOw0KPj4+PiArICAgICAgICAgICAgICAgIFNvbWUoT2soY21kKSkNCj4+
Pj4gKyAgICAgICAgICAgIH0sDQo+Pj4+ICsgICAgICAgICkNCj4+Pj4gKyAgICB9DQo+Pj4+ICt9
DQo+Pj4+ICsNCj4+Pj4gK2ltcGw8J2EsICdiPiBJbnRvSXRlcmF0b3IgZm9yICYnYiBHc3BTZXF1
ZW5jZXI8J2E+IHsNCj4+Pj4gKyAgICB0eXBlIEl0ZW0gPSBSZXN1bHQ8R3NwU2VxQ21kPjsNCj4+
Pj4gKyAgICB0eXBlIEludG9JdGVyID0gR3NwU2VxSXRlcjwnYj47DQo+Pj4+ICsNCj4+Pj4gKyAg
ICBmbiBpbnRvX2l0ZXIoc2VsZikgLT4gU2VsZjo6SW50b0l0ZXIgew0KPj4+PiArICAgICAgICBs
ZXQgY21kX2RhdGEgPSAmc2VsZi5zZXFfaW5mby5jbWRfZGF0YVsuLl07DQo+Pj4+ICsNCj4+Pj4g
KyAgICAgICAgR3NwU2VxSXRlciB7DQo+Pj4+ICsgICAgICAgICAgICBjbWRfZGF0YSwNCj4+Pj4g
KyAgICAgICAgICAgIGN1cnJlbnRfb2Zmc2V0OiAwLA0KPj4+PiArICAgICAgICAgICAgdG90YWxf
Y21kczogc2VsZi5zZXFfaW5mby5pbmZvLmNtZEluZGV4LA0KPj4+PiArICAgICAgICAgICAgY21k
c19wcm9jZXNzZWQ6IDAsDQo+Pj4+ICsgICAgICAgICAgICBkZXY6IHNlbGYuZGV2LA0KPj4+PiAr
ICAgICAgICB9DQo+Pj4+ICsgICAgfQ0KPj4+PiArfQ0KPj4+IA0KPj4+IFlvdSBjYW4gZG8gd2l0
aG91dCB0aGlzIGltcGxlbWVudGF0aW9uIGJ5IGp1c3QgaGF2aW5nIGFuIGBpdGVyYCBtZXRob2QN
Cj4+PiByZXR1cm5pbmcgdGhlIGl0ZXJhdG9yIHdoZXJlIGFwcHJvcHJpYXRlIChpbiB0aGUgY3Vy
cmVudCB2ZXJzaW9uIHRoaXMNCj4+PiB3b3VsZCBiZSBgR3NwU2VxdWVuY2VyYCwgYnV0IEkgc3Vn
Z2VzdCBtb3ZpbmcgdGhhdCB0byB0aGUNCj4+PiBgR3NwU2VxdWVuY2VySW5mby9Hc3BTZXF1ZW5j
ZWApLg0KPj4+IA0KPj4gDQo+PiBJZiBJIGRvIHRoYXQsIGl0IGJlY29tZXMgdWdseSBvbiB0aGUg
Y2FsbGVyIHNpZGUuDQo+PiANCj4+IENhbGxlciBzaWRlIGJlY29tZXM6DQo+PiBmb3IgY21kX3Jl
c3VsdCBpbiBzZXF1ZW5jZXIuc2VxX2luZm8uaXRlcigmc2VxdWVuY2VyLmRldikgew0KPj4gLi4N
Cj4+IH0NCj4+IA0KPj4gaW5zdGVhZCBvZiB0aGUgY3VycmVudDoNCj4+IGZvciBjbWRfcmVzdWx0
IGluIHNlcXVlbmNlciB7DQo+PiAuLg0KPj4gfQ0KPiANCj4gVGhhdCdzIGlmIHlvdSBuZWVkIGBk
ZXZgIGZvciBpdGVyYXRpb24uIFNpbmNlIGl0IGlzIG9ubHkgdXNlZCBmb3INCj4gbG9nZ2luZyBl
cnJvciBtZXNzYWdlcywgSSdkIHN1Z2dlc3QgZG9pbmcgd2l0aG91dCBpdCBhbmQgcmV0dXJuaW5n
IGENCj4gZGlzdGluY3QgZXJyb3IgY29kZSAob3IgYSBkZWRpY2F0ZWQgZXJyb3IgdHlwZSB0aGF0
IGltcGxlbWVudHMgRGlzcGxheQ0KPiBvciBEZWJ1ZyBhbmQgY29udmVydHMgdG8gdGhlIGtlcm5l
bCdzIEVycm9yKSB0aGF0IHRoZSBjYWxsZXIgY2FuIHRoZW4NCj4gcHJpbnQsIHJlbW92aW5nIHRo
ZSBuZWVkIHRvIHBhc3MgYGRldmAuDQoNClRydWUuDQoNCj4gDQo+PiANCj4+IERvZXMgaXQgd29y
ayBmb3IgeW91IGlmIEkgcmVtb3ZlIEludG9JdGVyYXRvciBhbmQganVzdCBoYXZlIEdzcFNlcXVl
bmNlcjo6aXRlcigpDQo+PiByZXR1cm4gdGhlIGl0ZXJhdG9yPw0KPj4gDQo+PiBUaGVuIHRoZSBj
YWxsZXIgYmVjb21lczoNCj4+IA0KPj4gZm9yIGNtZF9yZXN1bHQgaW4gc2VxdWVuY2VyLml0ZXIo
KSB7DQo+PiAuLg0KPj4gfQ0KPj4gDQo+PiBBbHRob3VnaCBJIHRoaW5rIEludG9JdGVyYXRvciBt
YWtlcyBhIGxvdCBvZiBzZW5zZSBoZXJlIHRvbywgYW5kIHRoZXJlIGFyZSBvdGhlcg0KPj4gdXNh
Z2VzIG9mIGl0IGluIHJ1c3Qga2VybmVsIGNvZGUuIEJ1dCB0aGUgc2VxdWVuY2VyLml0ZXIoKSB3
b3VsZCB3b3JrIGZvciBtZS4NCj4gDQo+IEkgZ3Vlc3MgaXQncyBhIG1hdHRlciBvZiBwZXJzb25h
bCB0YXN0ZSwgYnV0IEkgdGVuZCB0byBwcmVmZXIgYGl0ZXJgDQo+IG1ldGhvZHMgYmVjYXVzZSB0
aGV5IGFyZSBtb3JlIHZpc2libGUgdGhhbiBhbiBpbXBsZW1lbnRhdGlvbiBvbiBhDQo+IHJlZmVy
ZW5jZSB0eXBlLCBhbmQgYWxzbyBiZWNhdXNlIHRoZXkgYWxsb3cgdXMgdG8gaGF2ZSBkaWZmZXJl
bnQga2luZHMgb2YNCj4gaXRlcmF0b3JzIGZvciB0aGUgc2FtZSB0eXBlIChub3QgdGhhdCB0aGlz
IGlzIHVzZWZ1bCBoZXJlIDopKS4NCg0KT2ssIHNvIEkgdGFrZSBpdCB0aGF0IHlvdSBhcmUgb2sg
d2l0aCBzZXF1ZW5jZXIuaXRlcigpIGZvciB0aGUgdjQuIFRoZSBzZXF1ZW5jZXIgaXRlcmF0ZXMg
dGhyb3VnaCBhIGNvbGxlY3Rpb24gb2YgY29tbWFuZHMgc28gdGhhdCBtYWtlcyBzZW5zZS4gQnV0
IGxldCBtZSBrbm93IGlmIHlvdSBhcmUgaW4gZGlzYWdyZWVtZW50IGFib3V0IHRoaXMuDQoNClRo
YW5rcy4=
