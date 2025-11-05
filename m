Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0BC33DFA
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 04:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0510E6A8;
	Wed,  5 Nov 2025 03:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EA4EwECH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013067.outbound.protection.outlook.com
 [40.93.196.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FC810E154;
 Wed,  5 Nov 2025 03:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp9YhViKnDkI9i7IfcZXvxXs0mC62oxWOBasbZBA3nVgx3imZIu7VMzAj3KtS84NIOc+kPlZjMVgYy7ZjJcRPqgKCpe2qCULPSjm8f8UspqxGgua2aXVjOVYnhtap5IkNCXcUaXqNpc3KKrv057iHhN7eggsozSyUyq2kzOSr/8xxK4FAT5fp/KfGV7Tdpy4/TrRPBsTdSgmLN5WbkDedp8ijhEQFBUabzQSmiqsfgmDw3VY7Dr8HZ9JN2rKqNT5DFvP2ZobYmGFRQuDc13Pf/if6h7+nLfOQj/rzC1Lwq3YnZwF4dtiy8lW/2TxtAVZt7X4VaXWHTntceP17vgX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqPYZgPm3fLxMRe75W/Zzgkkfq0+4OU57mOyfkHL6D0=;
 b=U1dA3Bk0xmeF1GXGYmVziu2PfPC512h1JrjdWojB8aqC7s/ZxOfPPWn8oaH3kIpWkwLD4PXEjPuciH86Cske3k+j0y1fccdH1tcZXVxUMoxE+/5ML7KeCJJKTpe33fZeQTHmqpmoQSGLe/puUMx+twq5iM7mqxI8qTAHEw1mFm6plzOU/rWMnbWUUKgx6vSP73glk54kbFqzpBatbaoSYxRKl174CH8s1C+ePuEJBtVwNBoeMyLonICip2uKvsDBYm7YVq4s53DfpsyoXcQAEA5uODCCXvb37j9BV3ywjmjYh8dwOQKQM66ja2wFKJRHapCyl8kXh4sqCHybBYTgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqPYZgPm3fLxMRe75W/Zzgkkfq0+4OU57mOyfkHL6D0=;
 b=EA4EwECHR3am97dnp7wdRMqqHAu84uB2UAiIB2q4MTWsTBVTDrDKK73s6n7M1D6N+Jr7KQn2SMW+vsRGsENcqFu6I+3XOVB2/KcvTgls9nNGCx4b0j37s7GizS96Xf9Liekjfe43/6Hw0+dkxzqbRxw45ZxnMfuZeQ53gPkhdRPhZUo6V2JkShjTQMorsrX1YCIZWCPkm+w9mrH38GfV//5eUCDIAtja0xjSEI7ge8XMl5ixPf30VwCkcTlUskTWFQ63iGaUSoCCXhNZ+968xS7XRrl6x5pUjAMP7bhIQS6uK8KqL9B3S/LRUv4pAW0u/EJJ9AqvlmfWmIuvBKRIAQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 03:45:53 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 03:45:53 +0000
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
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Topic: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Index: AQHcTFTAORmK0Ghe7UK7TDiVVDAFJ7TjZSmAgAAPi0o=
Date: Wed, 5 Nov 2025 03:45:53 +0000
Message-ID: <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
In-Reply-To: <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM4PR12MB9071:EE_
x-ms-office365-filtering-correlation-id: 0f5978a3-fa23-4e50-ecd2-08de1c1dd1b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UlhGeGNta2JUVXRrSFY1QjNZak80NmJSc1ZZOUJlcURjQ1J6L2hHVVpBdzAw?=
 =?utf-8?B?OHAyOUVtaXR1MlFZY3lnMzM4OEVOUU9JUXBuU0NoR3V1WEtRdlkvUzBOMkpQ?=
 =?utf-8?B?TnVIVTFEWkE5SENiV2JVZ2s4aXlzWnY2QXlCeVdvYVpDdzVydEJ4ZXVwMzFF?=
 =?utf-8?B?SXdMVEdWb0NzK0JYNnR4bEZEaXdUNldwdTBNR2hJUDhZcXQvYVFURkk0Y3Bk?=
 =?utf-8?B?RlhZWFNtMG9HODZVa2g5dDczMlQ3V2l5cWFXTjN0a01ybnVBUmZ3eGRrWEsw?=
 =?utf-8?B?akx2MmJub1g1UjlINkNqUXdDQks3ellkVk5IZ1FVdUdFS1FubnExaDA4U29J?=
 =?utf-8?B?aFZjNW42eVFpZDVvQS9qaE9IZlJPVy9PRWZ6V09RY0E5Yjl5ckkxMUFyQXVO?=
 =?utf-8?B?cTBmajBSYUtCdkhrOHgyaFkzS1hMVXZ6T1ZtVlJnYnF4dHBwYm50czFXQ2NB?=
 =?utf-8?B?SzRmTXJndlNnZ1lOWWV5MEdaS0UvSjg5SENCZFJPVmlkcHFsanhnYlJBYnZX?=
 =?utf-8?B?Qi8wZ2h6ZHJOWXkyTG5nb1VNRGlmZWJUQldXTEdiL2JyQXVSYlV3MGxYSk1k?=
 =?utf-8?B?VVZDV1lxOG9yTDhaS2hjdzlRNVVmMUlDMkQ3UVRzaFNPQWNqc3VTaHZmRGsr?=
 =?utf-8?B?Q1hqbDl3Vk5VSDYvSlZyVjQyeng3K0E3RVIvT3JVbXpJWXJjb0xoa3RMR2VG?=
 =?utf-8?B?T1FxZXI1eVdvNjEwMzNEYW9IdUNBR1cycXd5NlBHVW8xRGF1QjdyNDBuUnJS?=
 =?utf-8?B?a3hsMTFiSnA3ekE1Ykx4RGI3UzRHelZaaVRMaEhsemk3WW45dDExajg0U2lm?=
 =?utf-8?B?R2c5TjFwWW9ZWFMwdUo2S0JEdE10SUl2MXc2SkNwU2gwMWcvRkROTWVqeStL?=
 =?utf-8?B?Yk85ZkZBNVlTWU5IYjZiRE9YTkpncXVmbGcwZnR3T0RGS0xBWGJDckN6TjRw?=
 =?utf-8?B?MHpXdnhZTm83VTVtaFRNVTB2eWF1RUp0R1Q5dmhEUkM0OGpYVjFrNHBBZVlX?=
 =?utf-8?B?VWVwcE4xSnJpNE4wZU1DMFI1VGZSa0dLbTFOaXJJSm94VUNidFNMRVVWVlZP?=
 =?utf-8?B?TjZTdnVRc1ZKSlpianAxZVRGcTY4RWV5OWRMeVdBUVVTTERNcjNyRHBsQ3Q5?=
 =?utf-8?B?NWt3a204TW1PN1pJVVdJOWQ1bjdncktXV0J5Z3VGei9XRGQ1ejJ3T1RPbTV5?=
 =?utf-8?B?d3ByRk15UXNYTzNHSnVUNXBUWTB5N0FpMnpIcFBrVWhQdCtLWkdQS05UNjdP?=
 =?utf-8?B?d29FeDRwa2p0T3J0WUkydllmcklkeEIwdUlFNmJONkJNbk4yNnEzNnVnV21v?=
 =?utf-8?B?Sy9ka2Y4dkpvZ3kydWlUSm03aXR3ZExrZFp6Mkt0cHBTSHg3K1BrYm1mK1RS?=
 =?utf-8?B?ZEUvdHh3Vndqdzh0OUlUZTVNdFNyZi95R2VqY09DV25GbzBDbS85eW5BdTlY?=
 =?utf-8?B?RzdRSzFMbHBzQkFhRjdWT1FWV3kycnQza2h2dGNCVStnQ0taRVpDZmZQT29w?=
 =?utf-8?B?M2Z1K3pGczRORUNsZDlvWDBFUFJqdm1FTlEwNFhseTdoa3NKclJzNGhyUlYv?=
 =?utf-8?B?MzJCRDFUazFvODhBWmVjR3NMRzV2MG5uTmF0T2lWVTVMU1Bvd0F4OE1FdXlH?=
 =?utf-8?B?LzhhSEUrZmlKMVRyenBvdmFQeUFvVE5kY2Q3a1JGRkw2eFd5M1dET2pxdGxy?=
 =?utf-8?B?MjZkcURGYnVRRkhHcC9sdFFYUU1vRXJQZkpIVG56Z0hkZnlFUVNGblNLOTZa?=
 =?utf-8?B?M3pTdnRXaGcrQ2dwRmttbDgxOVBaaDQzL005Q3JHNFRqRk5oaWVJNCt3eFR2?=
 =?utf-8?B?ZlFVcWlSWmx6bk9Vc29HQitCeFhuS2dsNzdnVnRONE5oNm16OFFqWis5bjhq?=
 =?utf-8?B?SHFSU3IvN3ZrZEkwNUJRTmF6K2lqajNzbS9pVkhTUktObE1lNVp1ZmNpYWEv?=
 =?utf-8?B?V3NXcjdRRU0zeit3c3psdVlzc2VqMjRieDgxbDdua1hMT3RuWWNsa20yVUdy?=
 =?utf-8?B?eDJGcjgrTHBvMU9EY2ZmMGlqcm00ZW4zMFJCWE9BYnMyV0hLVmxCUGUzOWVM?=
 =?utf-8?Q?8foIcy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MC83QzVUMXo4L3o1WE5GTnB3NEtJaFFmejF1eXNaWEk5aXNLaC9tWHlnbmlt?=
 =?utf-8?B?d2EyUG9RM21tM2dQbFNLaTNJLzFjVms1TjFUd3FCK3ZsMi9VREZ5RGtrYkp1?=
 =?utf-8?B?YmFtOEQxcGR6RENEc1lRVGhFTjZIQ3FXck9nV2Noa0RRMWFWdllBSmc4T1VF?=
 =?utf-8?B?c0Z1dEgxOGtEV0Nid2RORGtwSHJOWHZzclFHZGFDdjc0WXg2SEE4SXl5TmZT?=
 =?utf-8?B?NjZVVEVDdUxIa25KUVVyTnp2QnpGL1Y2WUVUMXZ6a2dCTVVRLzYrdDQxbStw?=
 =?utf-8?B?a0FlWFJmb3JtN1YzQjUyZnZVbnN5T0dqRnFxUk44MnVMdmttYXhHOUYwOXFH?=
 =?utf-8?B?VXF0RzZtWXJZWXFjSHhYY1pyODJ0K3dXbytyWmJ1SlIwR3FGQm9IM2Jodi8r?=
 =?utf-8?B?NmhBem1lRG5VbjdpMFhxRGJtNUFEQ21nMjJ2NWU1Zk1xc3E1V09VcmRQcmlH?=
 =?utf-8?B?YnNIZlR2ZitNaERvckljYi80UXdZa0tuMjFmOStOV3Q2UU9uclVPZ0w2cmQ0?=
 =?utf-8?B?eTlEaXFQMnEyNkhBczg5NWtEMUJNbHJQRHpjWXFkSWs0dTJkbzk5ZWE5SDNj?=
 =?utf-8?B?MWQ2aExnRjVJaE9pcWpTa3lHRVN2UFhvWlJWd3gzZEp1RUk3VlZTRXVrRExi?=
 =?utf-8?B?TlIya2lRY2RCeXVPNitkNjRnNlhiSXN6RHUyZ1RjSVNEcDR5MWZOdEZjREV5?=
 =?utf-8?B?clhablRCWVRaUWxmc08wbXBwcEtRYVpaRUVEdWhBMEFoVUc5anpXTHNHTFZr?=
 =?utf-8?B?R3dTMmNNaXhXOVR1SFZ1NU1vbXdhRyt3eUpuZmo3Y1d2TnluQ2hYMHV1emVK?=
 =?utf-8?B?b3RtSXZUclkzVjlheEpGVW5NU1hISFJ5cmlScHNZMGM2MnpTMWlLRWdiRk1K?=
 =?utf-8?B?Mk9yY3VPcXdCTktRM1VmZkdvSmJoTVpLc0FkbkswNHZpdVRIVTU4M1o5ZFR0?=
 =?utf-8?B?QkwvQ09yMjZ1eWNBVEwwUEJzRWJ5YURtUUZIQzJCSXUySWtPd0FnMWxOVnQ2?=
 =?utf-8?B?OElucS9WZXFvOE84eHplYXhNMURBU3ZHdjVBSnU0YU5JcGJQcW1GTlZicXlB?=
 =?utf-8?B?b2xRMzV5RWpld1ExYmJQTkhoRlMzVUZzVkc1a1FyNVRWenBrbGd0Vkk5U01U?=
 =?utf-8?B?YTZjZnNYOXo0SXFMaHd2YnVWL0tGaG9EclZBVjNjMERwaTVWVzRPNVpFZEFO?=
 =?utf-8?B?MGl1aGJzaUxIOVNhcENGY3dEV0FaY1FuaU1QYXRiYUYxc3lOQWRRS1czdk5Q?=
 =?utf-8?B?Rm5VdTdVa0pnOTVWeUVsTkVaYUVDeUUzekxxOXZoTlZENkR4SElabWJvd1A0?=
 =?utf-8?B?ZldwTWpoZFlmZUJaaVBkaDdQY2V3L1gwZWRSbW5FUVFNUjNJRTNyZ0hveDZq?=
 =?utf-8?B?d3JHcXlmRkVWbXFvRDJnSjRjMndoVFcxcTdIeGNWdUh0NmdtZXduQmwza3pK?=
 =?utf-8?B?cS9ZeU9mVnlzQkV0cmxUZU5Nd0xsUGRDUitPWnJvQk1ZZmFUcmoxN09DQU1n?=
 =?utf-8?B?UUlzdU1DajlYYUVoZE80amxRZXZkVmxmSkZRVGk3ajlLNDNmdUhQRGwwRldx?=
 =?utf-8?B?czd4ck1jc0tDbklDb3JnQ3l2VEtteCtFcCtyYng1UmdzWTBTdjhmYkJkSzJm?=
 =?utf-8?B?dUdBekxFYWxZWnZ2UjkzODQ3SElYUld5aUNhT2piRU1DcFJXZ1pycytiLzRp?=
 =?utf-8?B?UHYzWjNlcjdHOUorTUFTKzBIWkdHUi9DRTRGUXprYTRSQ1BoWkxxQnVNbCtG?=
 =?utf-8?B?cXZCT2lQOTJHTk44dXVTYXhDZ29LWjNzRlVEL3phN0s3VVA1dWd2OWkvbzk1?=
 =?utf-8?B?dC9kMUtmeUpCbkl5bFpLM1Z5TW1sOTM2dWpJMHNsQy9YV0EwQW1DOEVEWmdu?=
 =?utf-8?B?VzV3dWVyK05xR3liS25PMnhlU0pWb1MvYkg5aUIrVjAvS2RuQ1NpbjdNR0xr?=
 =?utf-8?B?Q2V1YncwYnVrV1hxRGliajVaRC9kWW91RkJJaUJEWS9jc3l3WFBBNStURnZY?=
 =?utf-8?B?SFIrVTNwK0gxNmhtMmlwaENSWXoyTEpnc0F4MEZ1NHgxZHNhdWlmajcvUHFu?=
 =?utf-8?B?ekhQNFkvc0dVam5kcUpyNzhpWmVLZlJxdFFIbm9Ed3lSRzNuN2xCS0VXNnN4?=
 =?utf-8?Q?vKa2XMLae4iZ6Y2lgKmPWhMs3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5978a3-fa23-4e50-ecd2-08de1c1dd1b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 03:45:53.1337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYsbvtYk3rWfV7pEw8mKAxgFAGZYKjQJdoTM5jOKZEpzhYgfxmznWcAgPfZ9vcJwtbEtTt5Hopg5GwkNqFEpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071
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

DQoNCj4gT24gTm92IDQsIDIwMjUsIGF0IDk6NTDigK9QTSwgSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIDExLzIvMjUgMzo1OSBQTSwgSm9lbCBG
ZXJuYW5kZXMgd3JvdGU6DQo+PiBUaGVzZSBvcGNvZGVzIGFyZSB1c2VkIGZvciByZWdpc3RlciB3
cml0ZSwgbW9kaWZ5LCBwb2xsIGFuZCBzdG9yZSAoc2F2ZSkNCj4+IHNlcXVlbmNlciBvcGVyYXRp
b25zLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVsZkBu
dmlkaWEuY29tPg0KPj4gLS0tDQo+PiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL3NlcXVlbmNl
ci5ycyB8IDEzOCArKysrKysrKysrKysrKysrKysrKysrKy0tDQo+PiAxIGZpbGUgY2hhbmdlZCwg
MTMxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IC4uLg0KPj4gQEAgLTgzLDEyICsx
MTYsMTAzIEBAIHB1YihjcmF0ZSkgdHJhaXQgR3NwU2VxQ21kUnVubmVyIHsNCj4+ICAgICBmbiBy
dW4oJnNlbGYsIHNlcXVlbmNlcjogJkdzcFNlcXVlbmNlcjwnXz4pIC0+IFJlc3VsdDsNCj4+IH0N
Cj4+IA0KPj4gLWltcGwgR3NwU2VxQ21kUnVubmVyIGZvciBHc3BTZXFDbWQgew0KPj4gLSAgICBm
biBydW4oJnNlbGYsIF9zZXE6ICZHc3BTZXF1ZW5jZXI8J18+KSAtPiBSZXN1bHQgew0KPj4gK2lt
cGwgR3NwU2VxQ21kUnVubmVyIGZvciBmdzo6R1NQX1NFUV9CVUZfUEFZTE9BRF9SRUdfV1JJVEUg
ew0KPj4gKyAgICBmbiBydW4oJnNlbGYsIHNlcXVlbmNlcjogJkdzcFNlcXVlbmNlcjwnXz4pIC0+
IFJlc3VsdCB7DQo+PiArICAgICAgICBkZXZfZGJnISgNCj4+ICsgICAgICAgICAgICBzZXF1ZW5j
ZXIuZGV2LA0KPj4gKyAgICAgICAgICAgICJSZWdXcml0ZTogYWRkcj0weHs6eH0sIHZhbD0weHs6
eH1cbiIsDQo+IA0KPiBIaSBKb2VsLA0KPiANCj4gVGhlIFJlZ1JlYWQsIFJlZ1dyaXRlLCBSZWdQ
b2xsIHByaW50cyBnZW5lcmF0ZSBvdmVyIDQwMCBsaW5lcw0KPiBwZXIgR1BVLCBpbnRvIHRoZSBs
b2dzLiBUaGlzIGlzIHRvbyBtdWNoLCBlc3BlY2lhbGx5IG5vdyB0aGF0DQo+IGl0J3MgYmVlbiB3
b3JraW5nIGZvciBhIHdoaWxlLg0KPiANCj4gSSdtIHRoaW5raW5nIGxldCdzIGRlbGV0ZSB0aGVz
ZSBlbnRpcmVseS4gSWYgd2Ugc29tZWhvdyBnZXQNCj4gaW50byBkZWJ1Z2dpbmcgdGhpcyBhc3Bl
Y3Qgb2YgdGhlIHNlcXVlbmNlciwgd2UgY2FuIHRlbXBvcmFyaWx5DQo+IGFkZCB3aGF0ZXZlciBw
cmludGluZyB3ZSBuZWVkLCBidXQgSSB0aGluayBpdCdzIG9uZSBub3RjaCB0b28NCj4gZmFyIGZv
ciB0aGUgZmluYWwgcHJvZHVjdCwgbm93IHRoYXQgeW91IGhhdmUgaXQgd29ya2luZy4NCg0KU3Vy
ZSBKb2huLCBJIGFtIE9rIHdpdGggcmVtb3ZpbmcgdGhlIHByaW50cy4gSSB3aWxsIGRvIHNvIGZv
ciB0aGUgbmV4dCBzcGluLg0KDQpUaGFua3MuDQoNCg0KDQoNCj4gDQo+IA0KPiB0aGFua3MsDQo+
IC0tDQo+IEpvaG4gSHViYmFyZA0KPiANCg==
