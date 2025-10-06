Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7339BBEE22
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 20:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF6E10E447;
	Mon,  6 Oct 2025 18:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rEQymjEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011057.outbound.protection.outlook.com
 [40.93.194.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314D510E445;
 Mon,  6 Oct 2025 18:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M51Ovxv/5OIKkCpqnLeXmtz46B43J6bb1UltsoqDDfH1pf/ng9Vc4ADlMhCeLTaXpqY8ncoJjBUZK6XvqclB6Ns2kt8ss7HqecoFE076ghAfIk+D9lB2bz+RAk7rGISxPM7bDQukWvWuZWaLgSSZIE7KGdCyXm7t7BuOuzypY/V5RMzOImFOcbAzeawHEMa8t+3X/RHhxTyzBP5LuyzoHBJMlh1d9Imn58ZVqQHpF9QNAxbNvQfwM4ylGHY9RrrdUogqk3CQi+S+/iGV8SrMy8noTLQWqeNmMFC+ytLvB9ocxB9qIfEY3HLWYzsLEnFnSYfXnzOnBnuzwXYzYe4rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vHbhSg9O8S7jwdns9fYd3Gp7AZbLMd3laqk2lvhNkg=;
 b=uLnpF/nhTbMCLkx39eiRM05R2sorhxh0XUKKV7QM5cDeQ5cprp0Vzj9CaLhRn0IZcPJ9y79N2ayI5Xyq1x5jjRA9yAfkzCIWwAVu6qs5SBiREd1qpG8sZjI+zlh4ZXmUiFHpX2RieI8F8APNX+kjwSExydfrytE4jXk1wG/moQFQ3CK+dsPsC08Tzr6n4fX8Bl3KE6v+W3cc23cVPykjKZ2If/VPz4jwnSdeWj6aejsqCBKuSa0DMsDrheUGj+0bswikvlITDE9dSd+DEv6n4fJsgqFKQnI4deQZB/cOIkuGHjTSfVs8gPOuasPsiqb7QJdZAxxcRBx5jlulXJyJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vHbhSg9O8S7jwdns9fYd3Gp7AZbLMd3laqk2lvhNkg=;
 b=rEQymjEALrHRMzgRxiZ7+bD7xY4mOqae89xDFM7DPg/7TZyGJQJajrGBQc+fvN2aDlqXXl6yMaWH2jG6K5rW6REJCwaxUbJCpkvkjxRw2ZFUSzBeqrl15Anm8gakw4mKmojDOuCuAv5W3spsCbLZx0i/hozgug6W3+BdPvVYbjTxAr5oyjRoTDwHH2y3ACHoEXqHadp6cR5J6qtFsBpnh0Txcc+Gd8zVmpQ6P9ZRWYzq1LA3f+x4B2Bi9km+9yBbMjF4SBPcmvGZj+MJ4qSJliphUYHkxDXiZwjU7Taqp79mS6SdYWGfUtGURUYcXfCpLVY+K/gHkn5jJD7OwhEmiw==
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by DM4PR12MB7768.namprd12.prod.outlook.com (2603:10b6:8:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Mon, 6 Oct
 2025 18:05:04 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::e73f:7d5f:7a1a:f363]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::e73f:7d5f:7a1a:f363%7]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:05:04 +0000
From: Edwin Peer <epeer@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
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
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard
 <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Topic: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Thread-Index: AQHcNH0eeUyysLzNnEGfULeStYcyT7S1bnOA
Date: Mon, 6 Oct 2025 18:05:04 +0000
Message-ID: <353E10C3-7F2C-431B-B6CF-BF70987D1001@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5182:EE_|DM4PR12MB7768:EE_
x-ms-office365-filtering-correlation-id: ce6220ad-4e53-4f60-eb91-08de0502e016
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?b3l6RnJJblhtRko1Nmk1QjhCMjVnSTZzbnVtODN6YWQ2MHBoYXhRZ2p1UTMr?=
 =?utf-8?B?Y0hBWVROTmtYdXpqby93WjNlUW1KMXM2MTNudGlRKy9UcjB5Ty9lTThMOWtZ?=
 =?utf-8?B?cUtsU3ZrazVEK0U3d3JjY2w1M2dRRERPY1NXQks5ck1KL1BHdmJreHhxemdM?=
 =?utf-8?B?NnRTSjU3ZTF3bmlIc1VDQmxJOVpKT0ZMdUZHblpGU2V1emV0bFRXMFRhY1Ns?=
 =?utf-8?B?VEU0U2I5aTZoQ1NkZ0s0cHBDMEFnYWV5NlRaa3lUbyt1Wi9VajFQNE8vbnRi?=
 =?utf-8?B?a3RETXdDU1BsL0ZVT3JOc3A3VXF5b2hkckxPMHkvZlRkSXZPQmltMnZ4SllH?=
 =?utf-8?B?aDJ1dHZiamd4eGpzcWhIRU5GTjVDYUlNb0syYjN4TEd6a1owOVlsSHhBN2RM?=
 =?utf-8?B?TS9RbWd6dWNPek9RWlRtTEMxMlhNWXdjUEpVMDRwbkcvWlNjTXVmenZ4TWQ2?=
 =?utf-8?B?WjFxM05jeEZyRlZoK2tGWHZoc24rdGNUdnIxQklEN3RrWEgzaWpOOElSNE5K?=
 =?utf-8?B?OWZVNW9rOXkxbWdZaGdBM0tYTEhNWnJDMTJENS9lQTNSeXQ4QTRpR3greG1k?=
 =?utf-8?B?VTAwV2x1YmJWMHlENldMYk5nQTluZUJhZmVqaENJWXFxTEJqWk44NnV0emxt?=
 =?utf-8?B?L292c3ZJWkhRR0xJYTNQL3U5UEdZdnBkYWd0Y2F0VXNCR1ZLd2JMRituNDlL?=
 =?utf-8?B?UnRTZEg2dDJ4VWdhVUd4aDlJT2ZuL09rY3h6Uk93ZlZENnlhVWxFWmcvTys2?=
 =?utf-8?B?OElPUVN4MW4xN3NDTXYrQjJNNXRCUFFiQ1ZTSHc2NmhURk94all4QjBzRkdS?=
 =?utf-8?B?TUg4RHprQlBiakxjNGc1SXdZMlNOUWt0clZ0QzRHaWpoZ0lZUDRwVXpkRGxW?=
 =?utf-8?B?RitCMUtUUUx0V1ZqVk1EZXBoNjNObGpOdVc0OFplc3NaaGc0MUl0RkhXV0Nm?=
 =?utf-8?B?OWM2S2hiZ2ZmNmxDdFRXdmJnUnRwV3NYTjVoN3pLemcvZFRCa3BLdXlhVjJP?=
 =?utf-8?B?Y2FyVXZXY3ZiOFlyT21MZ3pIMTJscUg1NU8xM1ZLbXg4U1hIbE10Q0FnTDZo?=
 =?utf-8?B?ZHFpZTdMTlhwSSt3ZEx1ME5Bb0dTQzY5bTVRM2dlRzZNc2JQZE8rRWpQWSt2?=
 =?utf-8?B?bUhOSXRmNkFYNllhM1dvYjVKcGVzeGVhaFgxeG1LWkVuV2FTdmROR2NVdXRP?=
 =?utf-8?B?RUpQaGR2eFN6WEFsU1ZqWDVvOTd1NmpMbzJLL3p6TVhXNmVVZ01FcjJxTEhL?=
 =?utf-8?B?Wi94RXVBRkhVMGprcnVLaURvKzJWWjN6LzJPaHorVndKM3Y5SEpKUEtPRGdx?=
 =?utf-8?B?ejdLTjdMajRHOUl6alpCS2NiZE1YakhUZDZ6bU5PODdaSDllamhyblpyQ092?=
 =?utf-8?B?d0J6NldnTmxYMWpMdXFTZnZrZUN0SlVpc0JiL0Nzb08vU3Nacm1QL1ZaZENp?=
 =?utf-8?B?RU5DL25vT2NiSWxRSkFyUjA0STBKdnpIOERpYnE0OElVQ0dHNTRZNy8xQzNi?=
 =?utf-8?B?T09rU25VWXkvM2Jpdlo5L3hhTTR1aEhhcnhLbHZLQ2dSVVdGOUtPVURvUWx0?=
 =?utf-8?B?T1pCVnJKczFzMUlGRTNTbExEdHd2Z0RVcWRvSDZKUzlQNklYaVB0RnNoSHhJ?=
 =?utf-8?B?MHRORU90VjVTc0l6STc1OWd4WG82SWF4MHR0MlRKQ0I3VTZkK09tSjlOOW05?=
 =?utf-8?B?cjgzWXRTbVZ6S1p2NmltekYza0xWUjNpbGNQRFhweVgvdHpnZzVrYUJHQkZw?=
 =?utf-8?B?d2xCKzlUb0I4QjY1OWllNnAwNlk2SExhdmdsdDlSRHNDMXJ1dzRMYlFVL0t0?=
 =?utf-8?B?dU9JOUFmd2xFK3lSV1FyOGJnNHVlVWc2RUlibDZXY1crdTV1b3ZDYUdYNkpX?=
 =?utf-8?B?SnZENm5mdnpsUEh0TjRTUGVLbHlZZTRjYmxoYVpBaEE0ZWlnaWlsK0VLUXJh?=
 =?utf-8?B?anFqa09YNTFkbklmYkdRbmUxeHlUUHhFY1NteklRSEVXSmJ3OGh3ajhsMmtq?=
 =?utf-8?B?M1R4NksvalpoaGlleGVpN3FJbDRYandtK1pjOXg5R3B6N0JaZDBrNlQrM2Zj?=
 =?utf-8?B?RWVzbjZhYytLZ1dQY2JwL2xHNE9PYWliUGt6Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QllOSmdTV05iSnNnNTdiTTBkTzBGak5rSHBzdFM2YVhMYjdVajlnU3hFQ3FX?=
 =?utf-8?B?dVBOQTJBS1VtNnp5WlRZbXVFTGlPK0hYSzZkZDY0TFN5WVRTN1lWS1RtelBU?=
 =?utf-8?B?WldtRFN2aFBvZ041UXl1TXBnclZVTlNyQ0lhK2xBVUFLZ1lJQ3dyZ2hsMU5h?=
 =?utf-8?B?emlNcENBZ3hFWXlzdTRnaEtwUmdlWk9lNG9yU1NGQnZlSEpES2tadHp3K3V0?=
 =?utf-8?B?UXA0QTR3NmVwaDJOTEc4MzRSc25vZ2U0RjdyVytRdEc3Rnd2ODR6VkNYN2hs?=
 =?utf-8?B?YkNpSGUwYkNWOFZJNUJaeXU1OFREVlZqOUwzTGJEYWFqVE1HWW4wNE5zTFd3?=
 =?utf-8?B?V1F1d0kycVN5clhSTzZidTBUV3Y0UG11ZEdhTUNUN0ZCVFVkWWF3ZDMyNDV3?=
 =?utf-8?B?dDI0MW5PMU1Lc2RjWCt5YVBDSzJJV28yM0ozNEh3RW9ET3NPNEVncGd2ZUQ4?=
 =?utf-8?B?ZVhjTWtMZFdnaytJRi95a2htcTJPa0VRSm9lM1dxZ2U3QjB6akE1TXJkdFFx?=
 =?utf-8?B?djJBOTdYbU44dUNCSldiUzIzRUxpdXBHQzZwaEJqajVXVFhiNzlRbCtrYzBN?=
 =?utf-8?B?Q3FhMzdFazVGRGJNZ0FDVG9DWEZWZFpTWDB0NE5aZ3FZV214aDdrUUdUN1dj?=
 =?utf-8?B?SmRCKzFkWlFtYnVxSjFNS1VlZ0I4TDhTU3l4YXhBQ09oU3hoS09sRnJESHhy?=
 =?utf-8?B?eEc0b21FaVlHRXRoSENyRnJWclM3azRINVlHUllBSGZSOGNBVnoyQU1YQ0p4?=
 =?utf-8?B?cDdPZ3lhWHVIZkhUUmRKWi85ZHJ3K0QxMUJYU0dUWlVTTkxnZzFyQ2hTQXpm?=
 =?utf-8?B?YVFiZnlVUm9mYzlrbTVaQjEzWWJYanRWcVJSOXZtQjlWQ2hBRzlYODBmc3lz?=
 =?utf-8?B?UmNaYUFHWlU0N1BibU9IUWVoWE51OFFnYisraXdaeDIxVWcvdE1pYjBza1Vi?=
 =?utf-8?B?TTY4ay93SU9mUDc1OENxQkdFaEw1Y3oydlByNTgzUllrRk5DeXpJaTNtZ3hM?=
 =?utf-8?B?UGFZeXp1UjVJelVlQ3VZUnZjNGdZeEg0UUQ3OFg2TGFhQkFRNWxWTzFOemFu?=
 =?utf-8?B?UkNYTWM4LzIwcDViWEJnc0tEb3FEQk54NitQK3JjaERuN3hDS0M2R0p6K1dw?=
 =?utf-8?B?OGRCWTg5aXpSbTh1a0craHVsMnNoVUdSbXR5MHAzNzkvaTRpRmlwcXJwSzFH?=
 =?utf-8?B?Mk8xODZFc0ZEV21YcFh0aVorT2ducE1XZW1uZ0Ryckpsc0dEa2dzcy9pUXNh?=
 =?utf-8?B?U1Z0VVZmNmhPUmUzNVY0RUZIaUV6ZVdJTW5MR1RncWVHb2dTcm1wUWdTbkVM?=
 =?utf-8?B?NXEycGx5YUtwNy95VFZ1aEZyQU56bXFYSWlqT1VpQjRsZkd3TG52UTR3U1Nz?=
 =?utf-8?B?SUhsMVhIcm5sY3NjV1RjSDlkbTFnRHczcVJzWWdiN3NxeEszWWZJSHdKcmsv?=
 =?utf-8?B?Zk5OcXhzbXdKL2syeTBFaDZXd09kT2VtdlBHOWtKb3IvMzJETElLZkhsbVBu?=
 =?utf-8?B?bk50c0QyY3RCQ3JkN29aUXp5ZDVCMzdKUzlTVU4vQlRWaUlxc1U5RnIvRmpX?=
 =?utf-8?B?UVRBQ3hub05jMmtCcURWOGgzQXJnbFllVDQ3QWhTeU54WkkrRFRGeFFpRXNY?=
 =?utf-8?B?aC8yM1VhNWpoNEV6V1pydldSRUtSMEkxa3NGK1BxdEJTVXlGQzl2Y1NEbmtE?=
 =?utf-8?B?L2JvV2lBeU12bEgwQ3lxWE92WFIxcjh0UkphdjBtS2J5eThOaVNDTFZEcWxU?=
 =?utf-8?B?K1J5eEQ5Yi9GVlJxdHF2V05uRzczeEs3SDhXK3JvSGl4ek9scWo3Z0toVWVN?=
 =?utf-8?B?cDZmcjBZRVYzZlcwWWorY1NBV3FxQmliYXVZT0NjUno0blBxV3hzNE52bS9F?=
 =?utf-8?B?bUlPdytrVlJnNzFqSmFjVFdtb2owaXRTREcyTWNpZ3hERDMvb3FLeXRmQzh0?=
 =?utf-8?B?aUFYMDhtVUg2cjVraU5aQlVieEdLNGJDSm9LT3psK244NVJnQU11SFRma1I5?=
 =?utf-8?B?ZXRSaWNKdk5DMmo5MGtadVVsUmFtdGdLZWtRTHJoWGZMdU9va2NWeHJodmJJ?=
 =?utf-8?B?RUJiSVNiU1dWY3UvRDZIcVU4T1BRRS9ZbU9oZ201UzFzNmgrd1VqdWkxZGtv?=
 =?utf-8?Q?4nXbJXdKkDD5TmQeCOjnpu0iO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <205168705204EB4BBC6F66EE46DA9959@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6220ad-4e53-4f60-eb91-08de0502e016
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 18:05:04.0308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+QLd1PHC4PLJMrOT7QTavv4bMrUwjensqYVADmgEvGGSmSoqNUrYnRZ49Mzqt1/cZyW0BOoaKTp8JYSyGS1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7768
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

T24gT2N0IDMsIDIwMjUsIGF0IDg6NDfigK9BTSwgSm9lbCBGZXJuYW5kZXMgPGpvZWxhZ25lbGZA
bnZpZGlhLmNvbT4gd3JvdGU6DQoNCj4gSGVsbG8hDQo+IA0KPiBUaGVzZSBwYXRjaGVzIGV4dHJh
Y3QgYW5kIGVuaGFuY2UgdGhlIGJpdGZpZWxkIHN1cHBvcnQgaW4gdGhlIHJlZ2lzdGVyIG1hY3Jv
IGluDQo+IG5vdmEgdG8gZGVmaW5lIFJ1c3Qgc3RydWN0dXJlcyB3aXRoIGJpdGZpZWxkcy4gSXQg
dGhlbiBtb3ZlcyBvdXQgdGhlIGJpdGZpZWxkDQo+IHN1cHBvcnQgaW50byB0aGUga2VucmVsIGNy
YXRlLg0KPiANCj4gU2luY2UgdjUsIEkgZHJvcHBlZCBzZXZlcmFsIHBhdGNoZXMgYW5kIG9ubHkg
a2VwdCB0aGUgc2ltcGxlIG9uZXMgdGhhdCBkbyBjb2RlDQo+IG1vdmVtZW50LCBhZGRlZCBhIGZl
dyBmZWF0dXJlcyBhbmQgYWRkZWQgYSBLVU5JVCB0ZXN0LiBBZnRlciBBbGV4J3MgYm91bmRlZA0K
PiBpbnRlZ2VyIFsxXSBzdXBwb3J0IGlzIGluLCB3ZSBjYW4gcmV3cml0ZSB0aGUgZHJvcHBlZCBw
YXRjaGVzLg0KPiANCj4gSSBhbHNvIGRyb3BwZWQgdGhlIE1BSU5UQUlORVIgZW50cnkgZm9yIG5v
dywgcGVuZGluZyBtb3JlIGNsYXJpdHkgYXJvdW5kIHRoYXQuDQo+IEkgYW0gaGFwcHkgdG8gbWFp
bnRhaW4gaXQsIGJ1dCBJIG5lZWQgbW9yZSBpbnB1dCBvbiB3aG8gYWxsIHdpbGwgY28tbWFpbnRh
aW4sDQo+IG5vdyB0aGF0IHRoZSBsYXN0IDQgcGF0Y2hlcyB3ZXJlIGRyb3BwZWQuIFBlcmhhcHMg
d2UgY2FuIG1haW50YWluIGl0IHdhcyBhIHBhcnQNCj4gb2YgdGhlIGNvcmUgcnVzdC1mb3ItbGlu
dXg/IEkgc3VnZ2VzdCBsZXQgdXMgY3JlYXRlIHRoZSBtYWludGFpbmVyIGVudHJ5IG9uY2UNCj4g
QWxleCdzIGJvdW5kZWQgaW50ZWdlciBzdXBwb3J0IGlzIGludGVncmF0ZWQgYnV0IEkgYW0gb3Bl
biB0byBzdWdnZXN0aW9ucy4NCj4gDQo+IEhlcmUgYXJlIHRoZSB2NSBwYXRjaGVzIFsyXS4NCj4g
DQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMDItYm91bmRlZF9pbnRz
LXYxLTAtZGQ2MGY1ODA0ZWE0QG52aWRpYS5jb20vDQo+IFsyXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTA5MzAxNDQ1MzcuMzU1OTIwNy0xLWpvZWxhZ25lbGZAbnZpZGlhLmNvbS8N
Cg0KUmV2aWV3ZWQtYnk6IEVkd2luIFBlZXIgPGVwZWVyQG52aWRpYS5jb20+DQoNClJlZ2FyZHMs
DQpFZHdpbiBQZWVy
