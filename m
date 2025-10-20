Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD64BF346E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 21:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF8C10E4E5;
	Mon, 20 Oct 2025 19:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hMxQcK3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A17E10E4EC;
 Mon, 20 Oct 2025 19:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpeS4wTH5vqgm9O7UHhwT0gjNxoJYzWeayU1LIW5eE4I3H2kfq7HSxTPzGDMQDPclQ9jrA9bG2DRFpNgHA/WIGpyJ18nDOv0YWvB3NA/nV2mWKwpTKlFpFZXPV+Tpg1Ubc5omDw8Vh6eqdx5huVTIXME/k3+sOA+XZjcdq29q2AIjShBtz+xXBv5KhOomNIRX5iGFns7jE3IjozMjNeC+yK6kiAiAynvixeN+JskKpVWuiH5FR9JXBA/E5VZgBwO43edGJ3zzkcmFUuOEpAqNOr7/1FfGKhwoBwwJ3h2vX7o5IlojepgmSFG6TriMGTmFfQ5MrOOTdYvEIogZo/xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJxGlboyz5+5Ck7DEohcQZOXDd7zqtwEu7AwhulOnvw=;
 b=QibDnZK8mEBL999g/Edspgd7APP1wHnP2BfJH/9NMd4epPVJk5OU80xIpEwP5EfWqXELain8PccJ30zZDWI8kvsl6QQQ/OzKQuW8UC16iFYJOhNgwmCXLGzVm2CTk3Z5FwwYtEhJi77Ug6eueNWo8S2nBmoEM1CKQIv+to1oc6DhErgkdI0UIOKr7N+3NajdJlED0z/kfQZ0zmSaBqL+JTSA/S/Uvzj1aC6I7q/IFlB6AidMjq0hqY0INrhJupIc1dybjWcpH6t8OA8Qr3jmht8G0zoDjomuOvvRV/Y/zAz5yP8sY1x5D1XvZLMebw/XQRakcghMb6fE162kU8cXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJxGlboyz5+5Ck7DEohcQZOXDd7zqtwEu7AwhulOnvw=;
 b=hMxQcK3Qk9GSp+qrud4buo72ZgIudGGBYS4vi5nCiLoZ8pmS50gvIV+zo9gqJA70VmaPcYtVsJomng5jSqU7rEZYllOh7usgwJjsO0B3c7tXhuE9PW4LyS8WgT897nYAvuEJi618PmKvsDRvsmvw/q/Lm6OGhiEVpbSttkXLhET0euRCpQ5I+J7vNsosFh6MUQQNlzyEYeJb70joYebFmkboZmmgFc7RhBeNeE5hDATMi9Rtz5y69wlVfr8NvfdvjmPI0EOcbxfdLfS9R+IVw9Gx2n/GkMaooYTmgZQ7+cPRY+lgUniQ60nJhux69B9yAA72qCILrEfLKduitThKGA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 19:48:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 19:48:32 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle
 Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Thread-Topic: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Thread-Index: AQHcQfMq6XgD6AD1vUOH7Qs02jecV7TLbceAgAADWWc=
Date: Mon, 20 Oct 2025 19:48:32 +0000
Message-ID: <0B70DC73-6796-4114-9C2B-6B1B9AD560A5@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
 <506e84b8-1a99-4548-b2c6-b502d790f4e1@nvidia.com>
In-Reply-To: <506e84b8-1a99-4548-b2c6-b502d790f4e1@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|IA1PR12MB8518:EE_
x-ms-office365-filtering-correlation-id: 23f07784-b3aa-4391-fbbb-08de1011a62a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T2Y3ejNraVZpRmhRRUVDckl3ZW1CbnJUbmN3Qk5GRGlCTWFBRFp5WCtweEhH?=
 =?utf-8?B?NGVuZ3l4R2p6NUpZdEZFRml3QmNqUnJNUDl6bmRmQy9WU0hvTXppK0xIWlpp?=
 =?utf-8?B?VTlCK0IxaUx2UzI2VTF2U2pRWjZJaDE3UjJZZkp1bmUvMGZmeFlHdEJNMmFs?=
 =?utf-8?B?QTU5SEdielhvK1UwZG5Zb2M1aFdyRjExQTRxUjJxeVdaYnA5WGRHTGVrd2Nr?=
 =?utf-8?B?SFprdUFLZVRqR3d0MkxCV3FiWmdKUytUeUtGWWRsUlUvVVhqM0I3dFNON2x5?=
 =?utf-8?B?dDQ0QVB0RTdrQWkwSE02NTVic0Q4SFROMEFpN2c5TzY0eG56a1kvS1U3NGZl?=
 =?utf-8?B?ZlBydXVjdUVjZGcwZnMzeHcxem81NlpjdjZncjk4MnNKSU9kcjhLY2w2eFlN?=
 =?utf-8?B?TjdQNzNZQjB3SzBTU0toUERiVHZ1MTd4NVNNd0YvOFVZRlBhV3ZtSG8razlk?=
 =?utf-8?B?VXhobHZTU0FkakU2TlBvbldVUmpZbGxFQzJhRjlZdWdKek5tdmlhSjVmWDZa?=
 =?utf-8?B?T1lYSEJIK3VuTUhyQXU0S3dtQjhFei9zK3V3eEdjRUxBMlZlVDQ0Y0tyazNw?=
 =?utf-8?B?SllIZmNiMmpTS2lpTUV0eWdENXBSZ0wwK2k0WGcvUjNHNjVEbkJad3pkblVF?=
 =?utf-8?B?QzdvdWZZeEhYWXJVTW13WTV6ZGI4eTZqOGdvUE5GcVRsNWRVeWZYa3MvSnRS?=
 =?utf-8?B?WjYwM2tlakEycjNjTjZ6MWlPaGd3bGgwNi8xWjNwdTdESWdDcXlZQVFXamI1?=
 =?utf-8?B?K1FydEZPUkcrREFNcG9sTEIwQlF0dXVhMjVTZ0p0UFpZdTdXQ3huOGxObFhw?=
 =?utf-8?B?QzBNbXE0eHpVMktHT3BsWGVWTGVONHZEYTJBYmh3UEFmakhRckt3Mk50dWNm?=
 =?utf-8?B?b0tZeEpiUTZIcS9lTENuNnZFVTE5c3FYajZZOVRZWVlkUFpZbzlWQTFXdnAw?=
 =?utf-8?B?ZGw5cHZNby9UUkhIUmFtTDBrZ3FjMEZHZWE3eFBWL1hJZ0FzTXlQWFc4bHpQ?=
 =?utf-8?B?aEUzT25zUWdMelVRWjBwQ2pOODQrK0sxUTk0bjVVeHlVdWJ6czJpRGNKejFB?=
 =?utf-8?B?WmxYYXVYL3lxTXo5eUF0eFNuUmNpQWhtendIM1lrMk90cXNubjh3OTFtcTk1?=
 =?utf-8?B?RG9QY2xqbklnUy9WeUgvejNQY2YzallENjl3QzR0VytvL1h5VldGMzRSdnlp?=
 =?utf-8?B?R1V0RzJRbVNXZ2Zlb2Nrb0pUd1ZhcjlVTlUxNGN1V0Q3THdKZTEwYi9tcVFk?=
 =?utf-8?B?Wm1LZit4Y2NNZUh5UnJXV2NldVpSMTJOMzEzMkZIVHlqRnNJVEova1cyVTk4?=
 =?utf-8?B?WXo1eGJlQ1FmWXhYUzgyZU5qd3Q1elR2MmtKZ0MzT0NtZHJVMXVyK0N5eHZi?=
 =?utf-8?B?WWpwTm4xWHMvbzZSWW9ZVVlxN3o1MDJMM2xCNUdIcnhOMGw3OThPSktLTTZp?=
 =?utf-8?B?WFByaGkrYmkwVjQzdlRRaDBoWE45THF5MmZmRUo4R09hM3ZjSTR1WFFQY0FL?=
 =?utf-8?B?WHpuclh3aE5oc3EyQnNzV1BDb0VZWkdPOStLYXA3RXVIempNbkdYMVozNjkv?=
 =?utf-8?B?Q25aRjVxT1N1NHlSQnJ0WXJrYnVSbXI5STZlbVRBY3FvME9nNktsa1FCQysx?=
 =?utf-8?B?S0xFdkJLV0phUjl0VUU0dFdJb2NNVkIxZm9DSkFLN1l1VTVEcFEzMlpCS0Rj?=
 =?utf-8?B?NmxoZ0RRYVlabjBnR1BXMHNNWko3aFBVNTFucjI1K3V6Q3hrUjBwUmk0alVE?=
 =?utf-8?B?U3UxK1ZZOFpUQ0N6ZEdjK0dtQ2tsbi9jaU43MnBxbWRiK3JFbHVxbTdGMjlK?=
 =?utf-8?B?YjF0d1lCWUNpM2NkS1R0Z3VzV0VlY2JqL1JYYW5CSERZR1pRY1p5MGFVYjFl?=
 =?utf-8?B?Tll6Qk9DL1F5eGFZUElxekJ6UkZRanNMekZ5OVBXU3ZXZlVESG1yYmlzdStI?=
 =?utf-8?B?RDJNUHg3MTZsKzNrbFJMbEFOVXphbnV5VnB1bHdLbDJmVGxyUXdGM2FQOHhw?=
 =?utf-8?B?Z3gvYlRxQjY0aDRRbHBEaDlVMlpjWUNhYUUzUXRKNUJiR2dRZEYrTUZKOHJG?=
 =?utf-8?Q?dj+/8G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b212TVZJc21hVnoraXFpQ2l2a0ZXa3IzNndwdkhnNnpIRHpqVnlRcUY2YklO?=
 =?utf-8?B?ZGpWMDMybmhHRmhYam5OVEx5WnlQbWJDbHFJeWVTbU1MZXNCS0g0WW1pcVdq?=
 =?utf-8?B?TVBmVVdIUklrQnYwa1dyeWQ4RzdRNThmMkMvNTBjZ01VbnJCMCtxVWJ3Mkpy?=
 =?utf-8?B?QmRPWHU5eWZWS1RTM1RnbkNUMWNyYStpRDZFeEJkbE5TeUJzMkwxVEoya1lK?=
 =?utf-8?B?SC9MQm10V2s5MFV5d1dPMllLRXBqMHN3S1BmMy9Ld3FMNFlpRVI4Q0JhTGdN?=
 =?utf-8?B?UGNrVkp6TXF1Nm9ESlhGY3oyYnIrcTB5UDU4ZTVUd24yZS9nSWNPTVJicDVI?=
 =?utf-8?B?bWsxMm1iY1drSVZBM0t0U0hXYTRWZ2VPb3VRRm04RTg2SXpRZ0tkNDVDNk1O?=
 =?utf-8?B?dk94eXY2QVIvNDBLc2piQk5NOTBDcWNUcy9vVlVDQ3N0ejQwZnA5WEptZXdn?=
 =?utf-8?B?QlJYUWZjRjVYM1QvUTgrM2QwM00vdGtLMFl4N2p3TkwxVXI3KzZhQ1JUMW1F?=
 =?utf-8?B?bHF6Wk1EVEVlRWU0bnczaC9QcWtlY1ZJSW9UeFZBRzV0ZkY3MVdYbzNpRGdk?=
 =?utf-8?B?WldTNUk0RjdTNTZPQm9VajJ0Ni9xdVdHdE9kUis4LytsMEphWHlJUVlwclhV?=
 =?utf-8?B?eFd0eElaL3Q0NG00VzB5UHYzRzlsVFVNaWtseXhiU1FxeVRBQXF5K1ZzSHJK?=
 =?utf-8?B?aFptbWVQVUdtOUltdFJqekxiRDZ4V1FENnFBUGJ3d1laWWdEQUZGWnFDMk1t?=
 =?utf-8?B?Z0NudWljREtYcGpJTjRzYTZPVnl4MnZScU0yT1BRbjdDTEVZM1VCUGVKeUZT?=
 =?utf-8?B?czROeENsV0NORmRHQXphVWpuNmswMUFLNTBreEw0K2J4UG5SZ1lhZ20xeEN1?=
 =?utf-8?B?b2RTaEFJbjJoUVFqSWZyd3NiMDRyUzZmczZGV2hPS0EraVhCL0oyQ1V4alhi?=
 =?utf-8?B?ci9lbTY3RktrWS9McFdYNDJQblhBR096bnFNYW9BSFlJR3hMYjFOZGtLdGk1?=
 =?utf-8?B?b0hGQ2kvNmV4RjZ4MDZldXA0SnMyek1qamROcEVWa21JQWwyQllGTjAxRlhT?=
 =?utf-8?B?djNxQ3ZzUWtxckpqS3ZEb3U4NlBDVCtSeVdWczk3eWoyVHlDeVB6ZTE1NkF1?=
 =?utf-8?B?L04wcGwya3hTWWN3OEgrcTl1bkhib0FjSUw4bVFyS1JYdHJldVBJa3VhN01x?=
 =?utf-8?B?bVhiWUxjd09VeEdXblptNTdTT2t6a3VXdHdKcmZhc1dUZlo5a2ZQOFNyVGJH?=
 =?utf-8?B?VUhWZFZocmlwRndxQ0YrdWx1cm1iNnduamVOMGJIUXlEQzBjRGZ4TWVLY0xC?=
 =?utf-8?B?cmxmbjNJeHdrOFJNKzFDSVUwUlNHUjh2dndWK0ZuNDlRRnhKR2RKTjEzT1dr?=
 =?utf-8?B?Q2J2eFdWMzNJekdmd1c5UUdHOVdSbTBpaUt3Z2xaUXFsTXRLMTZtZzcwV0RQ?=
 =?utf-8?B?OUZrTDZoY2h1WWpDc1ZYZGJ2bHQvS3c0N096YjhJNjBBMlZEdzMzN1B1cEJu?=
 =?utf-8?B?ZkhDR2ZKUmdNMFd5N2lFK3pPenpmbzZGbi94cjhRdFUySWs1L2YyLytIbUU0?=
 =?utf-8?B?M3pFZVJVbUNXUFFNd21GdjRDMDJmTkJYMkgyQm1aZElFN3A3WWcrY2F6RnZZ?=
 =?utf-8?B?U0ZzUVRJR0VuVXE0NzNuaElEbUxsR3Y3QTliK1ErTWtJbFo0VkJkZXd2L3Zu?=
 =?utf-8?B?R1RWNTRmVVFuY05kMDFkcm04dTFyQ2lYUi9VaTZ3N3M0N3RVL3FnQm5CNmU2?=
 =?utf-8?B?TGlWRUVJRWNmdWdIVC9mR1pUOXpYRUhzTnFYc2FpYzlBUjBuUFRYb05mQndO?=
 =?utf-8?B?WXBhMzBJaVpiWmI1L0hqckRXWmo2eTFkc0NkSms2aGRjYUVHdWo3UG1xREsy?=
 =?utf-8?B?dlB0TkJzdGFuTUticnA1OXZVVElmOVBnbnVqQ2pzNkpHdzZWNURpekdYK3ND?=
 =?utf-8?B?K0E4T3IvUk0zUklmOWd0Z2tOZ3FwU2xXR25ITytRdzVxeHJEa0dNR3VWTnlu?=
 =?utf-8?B?czlJbzVRaCt3YjNXa2xpMjJuYVVWKzVmZHd0a254YThnb09UNUpISkNwUlRQ?=
 =?utf-8?B?UjJBNUxWOUlGZ25nRksxL0ZXUjlIN3dMYVJSMG9SSzgwSENxVUQ2VmRxaTBt?=
 =?utf-8?Q?WmFNnc+/EhVxXCVXgP5s/hulf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f07784-b3aa-4391-fbbb-08de1011a62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 19:48:32.1184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpM5uVrif2I7UCxPlWpBHL6nQ32L9c7jf98DN6hPs8F7g6IrVzC+Ii9eG6wt8iFXJe1uDrUy5Vm107eG+IAgBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518
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

DQoNCj4gT24gT2N0IDIwLCAyMDI1LCBhdCAzOjM24oCvUE0sIEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiAxMC8yMC8yNSAxMTo1NSBBTSwgSm9l
bCBGZXJuYW5kZXMgd3JvdGU6DQo+IC4uLj4gK0xvZ2ljYWxseSwgdGhlIFBSQU1JTiBhcGVydHVy
ZSBtZWNoYW5pc20gaXMgaW1wbGVtZW50ZWQgYnkgdGhlIEdQVSdzIFBCVVMgKFBDSWUgQnVzIENv
bnRyb2xsZXIgVW5pdCkNCj4+ICthbmQgcHJvdmlkZXMgYSBDUFUtYWNjZXNzaWJsZSB3aW5kb3cg
aW50byBWUkFNIHRocm91Z2ggdGhlIFBDSWUgaW50ZXJmYWNlOjoNCj4+ICsNCj4+ICsgICAgKy0t
LS0tLS0tLS0tLS0tLS0tKyAgICBQQ0llICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKw0KPj4gKyAgICB8ICAgICAgQ1BVICAgICAgICB8PC0tLS0tLS0tLS0tPnwgICAgICAgICAg
IEdQVSAgICAgICAgICAgICAgICB8DQo+PiArICAgICstLS0tLS0tLS0tLS0tLS0tLSsgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgICAgfA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIHwgICAgICAgUEJVUyAg
ICAgICAgICAgfCAgICB8DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgfCAgKEJ1cyBDb250cm9sbGVyKSAgICB8ICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICB8ICAgICAgICAgICAgICAgICAgICAgIHwgICAgfA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIHwgICstLS0tLS0tLS0tLS0tLS48
LS0tLS0tLS0tLS0tICh3aW5kb3cgYWx3YXlzIHN0YXJ0cyBhdA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIHwgIHwgICBQUkFNSU4gICAgIHwgICAgfCAgICB8ICAg
ICBCQVIwICsgMHg3MDAwMDApDQo+IA0KPiBRdWljayBxdWVzdGlvbjogZG9lcyAid2luZG93IGFs
d2F5cyBzdGFydHMgYXQiIGFjdHVhbGx5IG1lYW4gIndpbmRvd3MNCj4gaXMgYWx3YXlzIGluaXRp
YWxpemVkIHRvIiA/IE9yIHNvbWV0aGluZyBlbHNlPw0KDQpJdCBtZWFucyBzdGFydCBvZiB0aGUg
MU1CIHdpbmRvdyAob2Zmc2V0IDApIGlzIGFjY2Vzc2VkIGZyb20gdGhlIEJBUiBhdCB0aGF0IGxv
Y2F0aW9uLg0KDQpUaGFua3MuDQoNCg0KDQo+IA0KPiANCj4gdGhhbmtzLA0KPiAtLQ0KPiBKb2hu
IEh1YmJhcmQNCj4gDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
fCAgfCAgIFdpbmRvdyAgICAgfCAgICB8ICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICB8ICB8ICAgKDFNQikgICAgICB8ICAgIHwgICAgfA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIHwgICstLS0tLS0tLS0tLS0tLSsgICAg
fCAgICB8DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgfCAgICAg
ICAgIHwgICAgICAgICAgICB8ICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICArLS0tLS0tLS0tfC0tLS0tLS0tLS0tLSsgICAgfA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgIHYg
ICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAuLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS48LS0tLS0tLS0tLS0tIChQcm9ncmFtIFBSQU1J
TiB0byBhbnkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICB8ICAg
ICAgIFZSQU0gICAgICAgICAgIHwgICAgfCAgICA2NEtCIFZSQU0gcGh5c2ljYWwgYm91bmRhcnkp
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgfCAgICAoU2V2ZXJh
bCBHQnMpICAgICB8ICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICB8ICAgICAgICAgICAgICAgICAgICAgIHwgICAgfA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIHwgIEZCWzB4MDAwMDAwMDAwMDAwXSAgfCAgICB8DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgfCAgICAgICAgICAuLi4gICAg
ICAgICB8ICAgIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICB8
ICBGQlsweDdGRkZGRkZGRkZGXSAgIHwgICAgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAgICB8DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsNCj4+ICsNCj4+ICtQQlVTIChQQ0llIEJ1cyBDb250cm9sbGVyKSBhbW9uZyBvdGhlciB0
aGluZ3MgaXMgcmVzcG9uc2libGUgaW4gdGhlIEdQVSBmb3IgaGFuZGxpbmcgTU1JTw0KPj4gK2Fj
Y2Vzc2VzIHRvIHRoZSBCQVIgcmVnaXN0ZXJzLg0KPj4gKw0KPj4gK1BSQU1JTiBXaW5kb3cgT3Bl
cmF0aW9uDQo+PiArPT09PT09PT09PT09PT09PT09PT09PT0NCj4+ICsNCj4+ICtUaGUgUFJBTUlO
IHdpbmRvdyBwcm92aWRlcyBhIDFNQiBzbGlkaW5nIGFwZXJ0dXJlIHRoYXQgY2FuIGJlIHJlcG9z
aXRpb25lZCBvdmVyDQo+PiArdGhlIGVudGlyZSBWUkFNIGFkZHJlc3Mgc3BhY2UgdXNpbmcgdGhl
IE5WX1BCVVNfQkFSMF9XSU5ET1cgcmVnaXN0ZXIuDQo+PiArDQo+PiArV2luZG93IENvbnRyb2wg
TWVjaGFuaXNtDQo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gKw0KPj4gK1RoZSB3
aW5kb3cgcG9zaXRpb24gaXMgY29udHJvbGxlZCB2aWEgdGhlIFBCVVMgQkFSMF9XSU5ET1cgcmVn
aXN0ZXI6Og0KPj4gKw0KPj4gKyAgICBOVl9QQlVTX0JBUjBfV0lORE9XIFJlZ2lzdGVyDQo+PiAr
ICAgICstLS0tLSstLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsN
Cj4+ICsgICAgfDMxLTI2fDI1LTI0fCAgICAgICAgICAgMjMtMCAgICAgICAgICAgICAgICAgICAg
ICAgfA0KPj4gKyAgICB8ICAgICB8VEFSRyB8ICAgICAgICAgQkFTRV9BRERSICAgICAgICAgICAg
ICAgICAgICB8DQo+PiArICAgIHwgICAgIHwgRVQgIHwgICAgICAgIChiaXRzIDM5OjE2IG9mIFZS
QU0gYWRkcmVzcykgIHwNCj4+ICsgICAgKy0tLS0tKy0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4gKw0KPj4gKyAgICBUQVJHRVQgZmllbGQgdmFsdWVzOg0K
Pj4gKyAgICAtIDB4MDogVklEX01FTSAoVmlkZW8gTWVtb3J5IC8gVlJBTSkNCj4+ICsgICAgLSAw
eDE6IFNZU19NRU1fQ09IRVJFTlQgKENvaGVyZW50IHN5c3RlbSBtZW1vcnkpDQo+PiArICAgIC0g
MHgyOiBTWVNfTUVNX05PTkNPSEVSRU5UIChOb24tY29oZXJlbnQgc3lzdGVtIG1lbW9yeSkNCj4+
ICsNCj4+ICs2NEtCIEFsaWdubWVudCBSZXF1aXJlbWVudA0KPj4gKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4gKw0KPj4gK1RoZSBQUkFNSU4gd2luZG93IG11c3QgYmUgYWxpZ25lZCB0
byA2NEtCIGJvdW5kYXJpZXMgaW4gVlJBTS4gVGhpcyBpcyBlbmZvcmNlZA0KPj4gK2J5IHRoZSBC
QVNFX0FERFIgZmllbGQgcmVwcmVzZW50aW5nIGJpdHMgWzM5OjE2XSBvZiB0aGUgdGFyZ2V0IGFk
ZHJlc3M6Og0KPj4gKw0KPj4gKyAgICBWUkFNIEFkZHJlc3MgQ2FsY3VsYXRpb246DQo+PiArICAg
IGFjdHVhbF92cmFtX2FkZHIgPSAoQkFTRV9BRERSIDw8IDE2KSArIHByYW1pbl9vZmZzZXQNCj4+
ICsgICAgV2hlcmU6DQo+PiArICAgIC0gQkFTRV9BRERSOiAyNC1iaXQgdmFsdWUgZnJvbSBOVl9Q
QlVTX0JBUjBfV0lORE9XWzIzOjBdDQo+PiArICAgIC0gcHJhbWluX29mZnNldDogMjAtYml0IG9m
ZnNldCB3aXRoaW4gUFJBTUlOIHdpbmRvdyBbMHgwMDAwMC0weEZGRkZGXQ0KPj4gKyAgICBFeGFt
cGxlIFdpbmRvdyBQb3NpdGlvbmluZzoNCj4+ICsgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICsgICAgfCAgICAgICAgICAg
ICAgICAgICAgVlJBTSBTcGFjZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwNCj4+ICsgICAgfCAgMHgwMDAwMDAwMDAgICstLS0tLS0tLS0tLS0tLS0tLSsgPC0tIDY0S0Ig
YWxpZ25lZCAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAgICAgIHwgUFJBTUlOIFdpbmRvdyAg
IHwgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAgICAgIHwgICAg
KDFNQikgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgMHgwMDAw
RkZGRkYgICstLS0tLS0tLS0tLS0tLS0tLSsgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwNCj4+ICsgICAgfCAgICAgICB8ICAgICAgICAgICAgICBeICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAgICB8ICAgICAgICAgICAgICB8IFdpbmRv
dyBjYW4gc2xpZGUgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAgICB2ICAgICAgICAg
ICAgICB8IHRvIGFueSA2NEtCIGJvdW5kYXJ5ICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+
ICsgICAgfCAgMHgxMjM0MDAwMDAgICstLS0tLS0tLS0tLS0tLS0tLSsgPC0tIDY0S0IgYWxpZ25l
ZCAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAgICAgIHwgUFJBTUlOIFdpbmRvdyAgIHwgICAg
ICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAgICAgIHwgICAgKDFNQikg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgMHgxMjM0RkZGRkYg
ICstLS0tLS0tLS0tLS0tLS0tLSsgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwN
Cj4+ICsgICAgfCAgICAgICAgICAgICAgICAgICAgICAgLi4uICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAgfCAgMHg3RkZGRjAwMDAgICstLS0tLS0t
LS0tLS0tLS0tLSsgPC0tIDY0S0IgYWxpZ25lZCAgICAgIHwNCj4+ICsgICAgfCAgICAgICAgICAg
ICAgIHwgUFJBTUlOIFdpbmRvdyAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwNCj4+ICsgICAg
fCAgICAgICAgICAgICAgIHwgICAgKDFNQikgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
IHwNCj4+ICsgICAgfCAgMHg3RkZGRkZGRkYgICstLS0tLS0tLS0tLS0tLS0tLSsgICAgICAgICAg
ICAgICAgICAgICAgIHwNCj4+ICsgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2dwdS9ub3ZhL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L25vdmEvaW5kZXgucnN0DQo+
PiBpbmRleCA0NjMwMmRhYWNlMzQuLmU3N2QzZWUzMzZhNCAxMDA2NDQNCj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZ3B1L25vdmEvaW5kZXgucnN0DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9u
b3ZhL2luZGV4LnJzdA0KPj4gQEAgLTMzLDMgKzMzLDQgQEAgdkdQVSBtYW5hZ2VyIFZGSU8gZHJp
dmVyIGFuZCB0aGUgbm92YS1kcm0gZHJpdmVyLg0KPj4gICAgY29yZS9md3NlYw0KPj4gICAgY29y
ZS9mYWxjb24NCj4+ICAgIGNvcmUvbXNncQ0KPj4gKyAgIGNvcmUvcHJhbWluDQo+IA0KPiANCg==
