Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753AB509D5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 02:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0336B10E289;
	Wed, 10 Sep 2025 00:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JzHskYwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4D10E289;
 Wed, 10 Sep 2025 00:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6vIhIwxqVQG5Sp96CnZhWozBbuodhuCDY/nmpZRJs9f/lC6plLx86mgYgMOJ6UkK6M2tMOxZFUAugEX1YO08aZSV7LgXcpjvkt6evVolLzxrZTfYd20gDvm8kQ3b2g5jk8VoKzgtwBbzuy7u2a9IZZTXoPDtDL3M5S7aRo9i9YKj3nToaYdGA26tzyPOCaNIXbAWRjkcEuCF1/4fOEVjAM4JmxfWzv4zzdBxMEzsK3jqWevs6muPjDUugl0f/zead8rMBnSXKq01MdphgSOt3guI6ohzSDWmMNqJxQI7jlDbSrGppzpt1GjsAyWmVonjQyBes79W/0o65O5y6eu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbCOccew0Ld0yZTIOEbxP3xs68eukIj3zogkCX7ahuY=;
 b=A+wYmxoO1LQoRNeWbyCIzw3Q4m9F8bs8rQuttPVQ2RL7/SlZ5IWlVgpDTBOHqKIGTF3mAsxzpZTchCC8Nx+3n544oQZmX3QbWq70L4hYQrgYkXs0hpMgoyus2PCcSUNfeTfpZYU8u4xICuhR8p8mFioCe6UZS1CLzw9ngu+ekfckKVybUP1ZDx1PnhUiCzheGoWoTNHhsXOFcBBY7a/ckYixKeIOzOEhOcLfxRY3Fh09S9DkgJ4zLb/440wgcR5kIqlzBKo66QjzJfLIEe29nMrEAEjCpMcm/A1NJ0FR4bmeegZ9B2su2i0GWzTDq86Qua5T2/8h8Xq8xblsr9j0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbCOccew0Ld0yZTIOEbxP3xs68eukIj3zogkCX7ahuY=;
 b=JzHskYwulRN3r15C/T05wnt12EJLXPeoigvKJ+InoCbFQrtq9l6TSIUyO1cFXw0DGIbVI/N4S1IMSWtfSoGgPOTGJOZwLtDJwZd96ARPapFgxs+8kpMCna/Dr8Qt5kd3O83P938W3csNHNjm4u6gCVdoNt3KirFe+jnX4e0l8Vyl4kvZwc6p5ncHg6A2qaC/ky3CpiXIC93M2g4W8LFKdaPg75SLTtaiAhmWAnZItUkboVPdMqfNJL2jAJjrltG8CpZmiojWyjmY29DSnv7FJPIKARot2vsnlRq7S/gWFL8tJTZYtdNvvDNZ49qDJ4k2lEafbs4KVpAzLHRuO0Cbtg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 00:15:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 00:15:23 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, rust-for-linux
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] rust: Move register and bitfield macros out of Nova
Thread-Topic: [PATCH v3 4/5] rust: Move register and bitfield macros out of
 Nova
Thread-Index: AQHcIc+h9Z7/a45JhUyCuj4pjfNMWLSLX/aAgAAsa7Y=
Date: Wed, 10 Sep 2025 00:15:23 +0000
Message-ID: <C5A11667-E82A-406D-A34D-78AFBD58FB9F@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-5-joelagnelf@nvidia.com>
 <CANiq72nPQps8ow00AmUe3shArHyhCUSSJX4=6QPHfHQZ_QeqcA@mail.gmail.com>
In-Reply-To: <CANiq72nPQps8ow00AmUe3shArHyhCUSSJX4=6QPHfHQZ_QeqcA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM4PR12MB7694:EE_
x-ms-office365-filtering-correlation-id: 71999139-0c95-46d3-39ce-08ddefff22eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RDVvekh6OERCV1JLNDd4bnR0ZVBoY05OSEFuRS8wRXVUM2srazNEWTdZZFR5?=
 =?utf-8?B?anQ2T0lVZHFxOHpMSVkwMFNNNWs1OGUrNnR1ajNPWDMxZVhPMjZSSnlWWkVV?=
 =?utf-8?B?M1NsUGEyMytnQmZ3Rnc1R2pPSUdLUkhqUngzVjdaRUNJenhiYnVGYkNnN055?=
 =?utf-8?B?c2R6cktQNFNXaU9ZUFpQSEcvQTM0ZUFnbDlURjErRDVIbVVRS2FQVm5RTFow?=
 =?utf-8?B?dEQ0eHNmUUFYV0t5dm8rMVRVMWpzMlZHS1VPbUsxRHFKT0QzOHM4RTBKOFV3?=
 =?utf-8?B?eTVFb3U4WlJpSnA3dkEraFM3TlYrNHNKNHIyNVVud0tzSml6UFJOcnMxeDlC?=
 =?utf-8?B?YjZWam9pMzl0S2RFd1BYckFMcUlxTHRRUFhIWk5sTzhvWWxRNE9BdWNxR0l2?=
 =?utf-8?B?WnpnRXBuRGl2ZFgxVGFZeVBoSnZ3QjBmMnRWRGRqeVZ0b1JHZHlEOEhZK2gr?=
 =?utf-8?B?MkZDQVFma2Y5Zy9ydkF0eG14eXdYUGJwTW1JdGV0RlJMZFZTQjNQZVNWaGl6?=
 =?utf-8?B?Y2taS1NFNFBadU5ZMnVoSjhST1RtVWtZZFZZUkwyZFNVYXJnWWdmdEJQVmNH?=
 =?utf-8?B?U29nTFBwRzMyU1NBQjJlWnJIaVpOTlFnV0gyMlBLMmNqMWdFbDBWTmhwZjhv?=
 =?utf-8?B?c0tsaW9GNDlzVitacUw4ZjdFVkxEdURNSlVnbUs5NlpwUzFUK1lLQWpraSt6?=
 =?utf-8?B?clVtSldOQ3ZBS093NVpLUFEzTnhkQ29FbzhXK3kvL21sbmJRWFpkSXV4KzFz?=
 =?utf-8?B?dmF4dHdIOW44aDFSaEJucTYxcTRaMHB5STdWODR5WU1LS29NdkdkMTBnN2ZV?=
 =?utf-8?B?TXQweFdHVFBlL3A4NGtXaWlidmUvZFJKb2xUS3BJTC9HUGJqako5OUlrZ3ly?=
 =?utf-8?B?L1czcFAycTdpZ25jUzdkOGZJTndhbnlOczV1Q0R2SlZrakNQRGZYQnhuRzZp?=
 =?utf-8?B?MWxON2VjYlgzaUI0K3NLMUtxWDl3a1NSYzhmSjdMcks3cFVxWmZjaHZ2T3Np?=
 =?utf-8?B?aFdiZUVBTDROV1ZzSDBLTXMxdDFYMWQ2ZTMyMUV4aEV2VmZhNFVJSGFmRVJs?=
 =?utf-8?B?V2lOLzhUUEZmSURPeEhPTitoUU1kUitOakU2R01zeHNXZURHc2tRU1JCbnpo?=
 =?utf-8?B?UVdqM20zV0JwaTErb0g1UjNvRTRwUWlCaDg0Mk5hNFVBVExvcEkzR1QxUkli?=
 =?utf-8?B?ZUNQSTlqdVdobUNnRnRNYjBxMDMvajdCSTJoaDlnUlBYa3prbUd6Wi91b0Nn?=
 =?utf-8?B?MHJhRmV2N2dCRkszeHJsVUhPMG15UUlqWDBPUGd6VG51VEVKRHZXMk90Mllt?=
 =?utf-8?B?MVllT29jNy96Tll3RHJ5Tld4RGs1eUdHZEFlWlBONHVFMDNHcXZaZVp0S0ZD?=
 =?utf-8?B?MDd0TGFhTmZVRCt4dFBJSEFKRkRBVUwzU0VPZCtSbm9mZ3RUK3FPVE1rb0lT?=
 =?utf-8?B?d1hFaDBUTTdHWkdCc3NnNUthOWQrRkNuZCtmNVBya2Z3cWpIS1REakZGenlM?=
 =?utf-8?B?dW1nbGIwa0M1U2MxeHZTckhZMjNnQkJOS0hrVjVxM0ViU1FjUFB3K2RpVkVo?=
 =?utf-8?B?QWttYmY0aVZKcE5jcHpjM003b01kclg3SzdBV3p1Z2R0enFHOVpaMzA3K1ds?=
 =?utf-8?B?eTVQZTgxTll1MjlrNXlTSXZROXdKRTNNb0xxTVFlVDgwcWx2RXFiL1pRZ2ly?=
 =?utf-8?B?bndYekpnY2VCVTJqUUdkdG51bmVPU2hiam11WjEySUVMU0JyQ3BwKy9XWFho?=
 =?utf-8?B?T1VzakU4bFZWTVcyZ3VKOFVCN0lJMitjYkt2dTRkMCtCZXBpeXpFWE0xQkVX?=
 =?utf-8?B?YjM3RUx1QWp4S290TDVMSUY5SU95dHB3cUlSUVdpMUFjbWNNcnVmenB2Q2NJ?=
 =?utf-8?B?WEp1Nk4xTEViYmlnQ2N3dCszZ3h2WXpWVmZrS0ZVc1g3dy9qUHl5QitscXkv?=
 =?utf-8?B?RWV1ZjFHN21PdmQ2Qm1rWExNMi8yYVFDMUNBSnJVNjJzVDNWSDM2RENScjFQ?=
 =?utf-8?B?bUZhZ2xCOTBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clN4bVFEblFXSVE0R09NT2h5c2x0aGVVNlNRcnA4N1phV0xNTUxDQWQxR2Fr?=
 =?utf-8?B?TytnYjAwbllxUHdYNURMRmtTRXp1dVhONXllTWd6cE8rVDNRd3FHSFVmcnlX?=
 =?utf-8?B?dlEwQmhEOHg0Tmk3bVlPYmlVZnE3c3pka2c5Vlo0Zjk5Z0VVU2NmcXNTaWpK?=
 =?utf-8?B?ZXpiVGxIelFPamF5MTM0RmphcXJ4WGlFNTUrdHZEVC94aTRjTWpTSkIwRkRN?=
 =?utf-8?B?M0VJdTVFbFVlbnArUnVQd2RucUllRVh4Tk9QZE54WlUwRExMZlAxeTd1b0JX?=
 =?utf-8?B?RzNtT0ErdzA0RlNDc2dLRjM3MmlOaXQrWXd3UDhIa00wa3BwaXRrbld6QU13?=
 =?utf-8?B?M0xUbTc3Q3RNdUdYaitQVVIwZVV4VHhSSTFhd0ZvVjhhRGkzVUl5d3B3ekpG?=
 =?utf-8?B?dExHRTcwK2taUUE0bThkQnVaeDFiVmN0NjZWaGIydG9DT1NZbHJhc1dFbDV3?=
 =?utf-8?B?VXhZYmJGeWJYbVBkaVNBUVVCbm5HTkNBZ1pxUzJTQlJLQWQrMUZsZzlsNmZM?=
 =?utf-8?B?aDVyaFA5QUJzcmltWkhnbmlVcGJ3NHMxWVV1TXRsY3cxRXNsa0Q5QXk2YTBL?=
 =?utf-8?B?bnZJZXRtdFRKTjhKdWdsYkgyODV4dmhNUmZWU1k5aVBBd2tEaVMzYWtEZmtl?=
 =?utf-8?B?VDRDclEwRVBXYnJTNWxjeFMxK0xyY0x4NW5rT0x3YkJ0SnEzL29yVVhhZkVn?=
 =?utf-8?B?K2RyU3o5d0lXZTJDSFRHLzNyWXQzbGpuaEVVL2dlcEN3TC96N1NGYXlrKzcy?=
 =?utf-8?B?bWJBM3JPak0vdGNZQk9KQzljREY5TkYxSFlobUtLdkc1akczQXd5b0FmV09X?=
 =?utf-8?B?VzVncUlMRzVnV0hKekdJR1RqTFlxVkFzTHV4VVBvOUt0MGFQblRMQ3ZiaDdp?=
 =?utf-8?B?SXhWc2lucWx3VU5RclZTNENCcHM4akhCbnJhTllDTzlXckdZRXkxUzBvK2h3?=
 =?utf-8?B?NUhQNG4vcm5SZ0lweS9iTUpoWDhKR3dvdDdnNnlWWWNDbXFpQUY2NGNkYkhR?=
 =?utf-8?B?SWtIenFrcmtSWHJSTG9ubFRySEh4MmN6MlRZaWRMR1ljZSt1Nm43WFppTmhs?=
 =?utf-8?B?d3UzTTN2aUpaL2ZKQmU3MUR5eVErNnVaaVoxYVBFeFk0RmlZb25HWDJkTU5k?=
 =?utf-8?B?Z3lKNEJpdlRkV0hsdUlkZXlBUU1DNThnNkpuUVpRQ2FGeDhnZFhoK2VkWU83?=
 =?utf-8?B?dFZXN3pHVG12Vk1CenRud3c3bXdRdDNSakREQURLa0MrbW1sN2lMSStTUWNt?=
 =?utf-8?B?ZFB4MWx4TUpNSEQvODNKQVFLRFA3eW1XRVc1U0xhTTl3ZEU2LzdxSTBZU0d3?=
 =?utf-8?B?M3NVZENQV1c3Zy9yN242N3hmTkZITlRxRm4ydElHOE1tZWQ0VEFxUUFjeXJo?=
 =?utf-8?B?Tk9wU1d3WTBIM29sZ0pVaWNPdkE2SEcwa0FkY2VGY1AzTlBQb3U4QTlEZ1B4?=
 =?utf-8?B?WEJYUUJ4am9kdkk0Ky9PSHlWb24vT2lMck1PUDRZaS91YVl1VjltdzZMLytL?=
 =?utf-8?B?UFpudGo4aFZZODgxc3hxWk0zKzk2TDhyd3UzaDdPNGFjVmErZHVDeWtwMGJ3?=
 =?utf-8?B?YVJkbnl2S2wyVTRFanFqM3p4YldzT0NyQzgrMTRJQnRyR3BRZzZ5ZGQ4ZENW?=
 =?utf-8?B?ZmtJNDVjaUgwOTRkYlYwSWRoMHo2dkRMa3hBTmp6V3BsV2hPelV6MzZBVUUw?=
 =?utf-8?B?R2IyYVdIaTNCbitIMGJTS1RYV2c5Zmd2RjFVYjlmMmREemhaL0lCZW9PdHRU?=
 =?utf-8?B?N0t0Y3RrVUlNMkNaMFM3NUROT3MyVncwUTdMbjFiZ0x6OWI5OG5NTmlmeG5z?=
 =?utf-8?B?UXFHalZKWlRsNmt5c1pwbERmTnM0Mkh6dkpGUGRRbjRyRWF6aHhDOXNDc2tN?=
 =?utf-8?B?bFdJdEVtaXFEb094RUcrVTR4bFdlNFRUeFhGQ0U0M1duQUtJMU56S1NPWW9m?=
 =?utf-8?B?N3JaODkrUXIzNnJ6WWsyK09qWHdJeUlwOUE1dUluUDgvTGNHcmJpOTBReHBr?=
 =?utf-8?B?SzNrYWpGdmZNVmJDK21ibGsrb1hHUjl6NFRtTHJlSHRjdk0yTTI0eWdkOWIw?=
 =?utf-8?B?bXV2WXNIOUhCei9uWnQwZVh2a1M1bzdqcWFEYnI3WkVFb3VTUCtSdXdGYnRI?=
 =?utf-8?Q?B5+IzOz0oh+lmyhGH2lqf6mOv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71999139-0c95-46d3-39ce-08ddefff22eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 00:15:23.7450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8xbbXxFnboDWpudGVqkgg/Hato9X8oFUlhk1x+3l3lkrCPaegzdAWjYD4TLK5QjAL/iq0d4srC2QZ31p7L1KIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694
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

DQoNCj4gT24gU2VwIDksIDIwMjUsIGF0IDU6MzbigK9QTSwgTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFR1ZSwgU2VwIDks
IDIwMjUgYXQgMTE6MjHigK9QTSBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVsZkBudmlkaWEuY29t
PiB3cm90ZToNCj4+IA0KPj4gT3V0IG9mIGJyb2FkIG5lZWQgZm9yIHRoZXNlIG1hY3JvcyBpbiBS
dXN0LCBtb3ZlIHRoZW0gb3V0LiBTZXZlcmFsIGZvbGtzDQo+PiBoYXZlIHNob3duIGludGVyZXN0
IChOb3ZhLCBUeXIgR1BVIGRyaXZlcnMpLg0KPiANCj4gUGxlYXNlIENjIHRoZSBydXN0LWZvci1M
aW51eCBtYWlsaW5nIGxpc3QsIGVzcGVjaWFsbHkgc28gZm9yIHBhdGNoZXMNCj4gdGhhdCBhZGQg
dGhpbmdzIHRvIHRoZSBjb3JlIGluZnJhc3RydWN0dXJlLg0KPiANCj4gSSBub3RpY2UgZWFzaWx5
IGJlY2F1c2UgSSB0YWcgdGhlIG9uZXMgdGhhdCBhcmUgaW4gbXkgY2xpZW50IDopDQoNCk9vcHMg
bXkgYmFkLiBJIHNoYWxsIGRvIHNvLCB3aWxsIGF3YWl0IG90aGVyIGNvbW1lbnRzIGlmIGFueSBi
ZWZvcmUgcmVwb3N0aW5nLg0KDQo+IA0KPj4gW0FkZGVkIEY6IHJlY29yZCB0byBNQUlOVEFJTkVS
UyBmaWxlIGVudHJ5IGFzIHN1Z2dlc3RlZCBieSBZdXJ5Ll0NCj4gDQo+IFBsZWFzZSBkb24ndCB1
c2UgWyAuLi4gXSBub3IgdGhlIHBhc3QgdGVuc2UgLS0gZm9yIG5vcm1hbCBjaGFuZ2VzLA0KPiBw
bGVhc2UgdXNlIHRoZSBpbXBlcmF0aXZlIGluc3RlYWQuDQoNClN1cmUsIHdpbGwgZG8uDQoNCnRo
YW5rcywNCg0KIC0gSm9lbA0KDQo+IA0KPiAoSSBndWVzcyB5b3UgcGlja2VkIHRoaXMgdXAgZnJv
bSBvdGhlciBbIC4uLiBdIG5vdGF0aW9uLCBidXQgdGhhdCBpcw0KPiBub3JtYWxseSBvbmx5IGRv
bmUgZm9yIG1vZGlmaWNhdGlvbnMgb2YgYSBwYXRjaCBieSBzb21lb25lIGVsc2UsIGUuZy4NCj4g
YnkgbWFpbnRhaW5lcnMuKQ0KPiANCj4gVGhhbmtzIQ0KPiANCj4gQ2hlZXJzLA0KPiBNaWd1ZWwN
Cg==
