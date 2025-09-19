Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6632B884ED
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F85710E952;
	Fri, 19 Sep 2025 07:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BPJOc0bF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54910E952
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MximsomE0/9shNyl6SSRy+X9VsLJFrx1hOrXAIaaqRa75fms03EMr2j2NMb/RBfnMXgJH2lkMIAS/XbVgIYS4otg/UPb/cHZrFvUznvqmHDhGjKcdLMl8QzWXYjft9is9yBly0yvacblOHltHXq4zsE7sQMlykD3FjNI7NSIx3vXdKjI1R7akm6FR3h7CFc1r9Khd97rDkIfoRKIT1wAgr9pKqQCN0ZuvfuAXr+LhNkKOWAvjK+z1KJTbbnAHSQFFLNwx/aMfkNNPC5sMkSafCN5xyYXkZPszSvVtP/dpg6wLmfoj1968DHmfVPjrAO/tMAKAP+hXMWK9jslCuXoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAxoy8X6jL5e0ximSXbX2xRMtrNMhYaSLIxLM5z0Gz0=;
 b=pbLQ5xZ497ln5Kf5qQR7b6WeCjg7WmGplbkOP30DKNfKQMIrI8F0wZtcrXBAIaLmrv028b7m3uThCJe99e6akDNE4/nhDR4gT1c0PLm/u5Qov+oO/m5xgXNoWKdoT3itCGkZJG6RDVwWdf+MpyzGeyVnJ1XDtqoOTi+q8/6rBrYiw5q8imKNmYIIu6xOTgnAZFh7suLgRM+yqx/OtREBKX5ekEVbtkQTvINjTqAWGoDUviqOeKpr52fFA0sullCXgN5ymmaAeTG9FvsolRa6BNOK6IP67BHytUTIzt37Fe7Z79AzwuIFtgmV36cRpNf5jrNk1SLxwzul53KOhOWmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAxoy8X6jL5e0ximSXbX2xRMtrNMhYaSLIxLM5z0Gz0=;
 b=BPJOc0bFGhXm7UqUL5rrSZDyeMsQ7xgaNV2IhMyzrcXDXBOXd/+zTy/boWipY9rDoc8D/RbtBZ/JL3sn+VWVjftWrYzWgeYOe5cKoWaAKSKLFFpGVSnUuxdbFkHgPtGyhKRBpnV8xLtxY6Uvny7mIrtzaVOIwxvRF1p7EMg2AsHu5BFTjOPz5UfJxYvtpwUtODSAaFm8zNKTtuTSrUH0y5uL9Ekwl2yQRFt4ro1zHtJ3y9/acmjlh4bU+TFeZdaqJ5/hLmmahokkihj5BZ3q8eupBolDu/VFQ854wxtJjQaBxPV8GEb6NwoI8x8S7QwuTxOu+Ly+0aseG2IYRzDT/A==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 07:59:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 07:59:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alice Ryhl <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Bjorn
 Helgaas <bhelgaas@google.com>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
 <kwilczynski@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
Thread-Topic: [PATCH] rust: io: use const generics for read/write offsets
Thread-Index: AQHcKK0/cStH5VOq1EGA/E5o+IJ3wLSZPqWAgABXUQCAAI9NhA==
Date: Fri, 19 Sep 2025 07:59:21 +0000
Message-ID: <752F0825-6F2E-4AC0-BEBD-2E285A521A22@nvidia.com>
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2> <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
In-Reply-To: <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SA5PPF8BD1FB094:EE_
x-ms-office365-filtering-correlation-id: 7074928b-e215-4229-59ce-08ddf7527175
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZnJaOE5SOTBpV2FsTi9LOGhWZEsyUVRabzhzcDFlMVJGbTh1NUtDUFpIZ0dR?=
 =?utf-8?B?djR5SWtUVTQrUzFneFpDSlFzV3FjdHJnMEMrYklpYUdGNzZudWpUcnA2NDJM?=
 =?utf-8?B?allpTVhJb3REUGdUcGZZZWQ5dUxBWE5TQlVLQTBONUU1NTFkbTQrOEt6Yk9x?=
 =?utf-8?B?VUgyYi9vWnhmVEhCRlVYcmozaFR5Z0Q3aXpwdCtNSGJDUzU4dm9FYnh6b1Ey?=
 =?utf-8?B?N3BZam1tU2tDVEpkOXJOUFAxbkQ3RzRzS2J3M3pwQXJuWTFDaE12WHRCYzNn?=
 =?utf-8?B?YjNnNWlwRjlYMnJoa1hpNHVZc2h2YnlZR0F6eGQ3L3U1ZjVrV1VzdVAwZ1hL?=
 =?utf-8?B?ME5iMWRnUkxpZVZVS0NXMGJSeThsWUpxNHViZ0t5dXNPV1JiYklTWklPUjJu?=
 =?utf-8?B?K0hISFphejVCQ0JRaldmbU9xNFZMdXZCRTVMdDc0UjdybUU4cjgrVlhxbDVI?=
 =?utf-8?B?R29ORFF1ZEgycFpXYVRMYnlEN2JoQmN5R2MxNGRSQVNONmlxbm5xaHk4ZHAx?=
 =?utf-8?B?U1dkK2djREtwZ3NXZGZHdGFYNGhTZzJKWWZ6ZXlCdXVsOTVyV3gzckgzQ1h3?=
 =?utf-8?B?NWp3TGdhK2piRFg5NUhTVzlnN0hyaEw2YnlqSE9VaDJScTFiODV2TjBmMVhI?=
 =?utf-8?B?cVNTNGJ5ZnVLekVBcm0vQ3RIL05wRjlrOUJldkhRNTMwVUZ0bVlTQTBzNjg2?=
 =?utf-8?B?ZUhoc0F3ZTFGMzNzaGhlbmZqT2dVSWRHeVYzdkFuWVMxcjdJNWVWZlI3R1gv?=
 =?utf-8?B?TVRnVTBxNnlMQi9hcDdzZ2ptSmluN3VJTlo0YVppRCt1NXlxcmMwbVVYQkM1?=
 =?utf-8?B?N1JKblAxSUNnWk94RmE1NjExV3BNR0dMdWlqcWQ3RE44UkFOelp4dXZpVlV6?=
 =?utf-8?B?OEg2RTZlSTYwMmw3dDhwcFpYbzVLdk9oQWY1bllNZ0d1UFA4SUNleFlVY0wx?=
 =?utf-8?B?N3NMMkZ0OFhPeWhXT0hCRVdsWjQwOFQ5QzV3c3hxZGNuR053TlljWkc3RnF2?=
 =?utf-8?B?dkVtbU54U2RxcmdsZWVJSVJWbmpZbmN1TW1zcEVrNUVwdnB3bzd6M1BwUWVX?=
 =?utf-8?B?RFRWR3Z1WTFCZHRJbm5pYzBVZGVNZTdJV3FJSmlkS1JwWi9oM1dpdXdiam53?=
 =?utf-8?B?SUl0bjVRajFSUm1LSXhrRGJFY1czdjVJd0Zrb2cweHVXZnZpUWNRRGhkNklF?=
 =?utf-8?B?VEJmVVBHMHMrVWxyRFNDNVpLb05jNXppZWFEVit4VWQwRWpPZklzTCtIR1Zo?=
 =?utf-8?B?Q2t6UlhPaEdXajYvQWRJSHdXaGFsVW82bnE1VXpBVlk5TEZQT0I5UG5aSGNt?=
 =?utf-8?B?L2pHdHllZDYyUUhnNlduRGVxblEyVHZ3MWVoQUVGNnJlckx6dGRzanFuRnBS?=
 =?utf-8?B?Vm1qd2RYWm1BNG5EalViSmZmcEh1VW9vZ2ZUVmwwdFdJb0VuQjNmSVFqUVA4?=
 =?utf-8?B?bjVRQW8rNjNnVG1ZYTNveEc1VVplTWpyR3R5SEFuUU01VnhwemtybXp1eWlQ?=
 =?utf-8?B?NnB2T2Fja01MbUtsWElnRG1XWGovZHZEZ0lISnh6Vm5NeDJaMUhjaGlGOGw0?=
 =?utf-8?B?dkI0RkpSK1hibmVZUjVSdkJJVlIrNzJmcWJrYlR3bGFJT0M1L2RyZXFKcVkx?=
 =?utf-8?B?dkwwd2hRY2VOdmNBUGtKS3k2ejI2amFBVFpOcjV0NTB5eFBCbUVQMnhVaEFr?=
 =?utf-8?B?WWt2c05zVUV2K0hkTGN0WlJwaVlUcnBONVo2NmZ1TTNIRm5VTWdIcllyd1Jp?=
 =?utf-8?B?SmtIK1lNN09ObTBHV0lVdFNPRkJKZVhGL08yUTJGUGtEVHdVR0crSUwxNkR2?=
 =?utf-8?B?eDdZaW5TcjFCL01zSjNpR1JPRTczQzNNelpYSDVEMUxMOWdwbTRHeEJDOUll?=
 =?utf-8?B?eFRrRVFBQWtUbEFzN2g0eEJsMGdHTkN6Zkwxb1dvbjZrTHVqWDdEdTc1N2FX?=
 =?utf-8?B?YVNUa3UxWkpER3dpY0h5L0tSL0ZrYWxXWkFoT0c4aElVV2U4eXh2TzNwVFRx?=
 =?utf-8?Q?kq+kXB05Wd9moLImgDnPEE3y760mDU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEZpV3Z2RFp2QlQ0elhwNCthMEE4SnU3ZU9QcVJDRmRsYmJCWTJUSnY4aFNX?=
 =?utf-8?B?dVhCa1p1dHNMcklpNHBqQVRySldxZitlZWx5WVVhWUx1RkcwSEhQZkJEYlFW?=
 =?utf-8?B?aEFXQ3RkR0lYdXpINTNPYlJ5dVJrOUZzblFzYjdRNWtzN2FQOHVFdmdlNE11?=
 =?utf-8?B?WVFXUTdrcFl5MmZmK1FhZ0REcndtQU9uWkd1ZUhhSzErY1Frc29XOG9wRGtQ?=
 =?utf-8?B?SEtBa29aRlhUK1Fha3NRMnBBMUtYUHNGU21ZZklKM2oxdW1WZ1VtbStlaEV6?=
 =?utf-8?B?bHU1Z1JqaFpDdWo5V2ExSGFBZXRxYThmYXVmV0JvWURrNzRUcEM5NjhjTUNa?=
 =?utf-8?B?cEJwZnNOVlFuTjhCMnYvMEdCRE9WT1RZMXlPRUlaZk1EWkE0TnNTM0JiS3BN?=
 =?utf-8?B?ZENPdEZvdm16ajVJTkQvZzNSZkt0MUNPeDdPdEhwWGs0cXpJWHF5NzY5TXA0?=
 =?utf-8?B?R1pBV1lNampzV05jSXNsbDk2OEkwTnZZVWFQUjFpb3daTFFmREViMWsxZTRH?=
 =?utf-8?B?Sk44L3ZiV0hTU0VZemdieG51SWdkdmlEbGo2QzUvWHhGRGt3WWxhS2VTVU9r?=
 =?utf-8?B?MlFXNXhGOTZRNEZsQldacSs1bHRUVUYwekpwSjlTbEFBQ29uMTFqVkJ0c3VX?=
 =?utf-8?B?aE12WjdEdGVOUXYwUFVGWFduSU9jeXhjVFJsa2hLejVoSFYySXpqcTlRUWg4?=
 =?utf-8?B?YncvYnEyTVdFcDlZT3YzcGV3cnkranoyeFB1cTRvekJNemphNS9oNlhvUm5a?=
 =?utf-8?B?b3I5SEhwaHRuQWdRWGd1QnoyMU5mZkVFMVpLbUtweS9ERzk3ZkE1THV3MWVn?=
 =?utf-8?B?UGRyMnlsYTR1RDUyMklhYnptY1FIdGlrWHJ1RXRyaVlSb3pFNkkyQ1RFWlA0?=
 =?utf-8?B?RTJURFZ2RnJtMWp1WW5zbGowamowelJucUNnVGVkU1FUeWJlUnlSK0V4SVhI?=
 =?utf-8?B?Mklvb2ZiUXk5NzZKUlB0MVgrNmdBbTZBMFd1SElnMEROTVJ3SWFXOWJFckRE?=
 =?utf-8?B?NnlQdE55MjJGbGxqU3ZvTWhRMGdyS09qR0xyaWVNeXhCMHU5a2pjVmtVdFFU?=
 =?utf-8?B?bG96R0h4cEY1eGJwODY0Tzd4ajdHYUNqeHViVUp4M3JwQ2U5UTRSdVhhSXBI?=
 =?utf-8?B?RFpoM0hVcVNxUXRsdDAwckRwdEp3VUptS2V6ZE5kRWlNelczQjYzVGtVdXJs?=
 =?utf-8?B?K2lWTmU1NTZ6YXMyYzZCYVg2WmZuRUN0MHRGeE9rR0RwTVpFcnRYOGU1MC9s?=
 =?utf-8?B?c3M5clc0ZFhQajNaOGJYUXQwOGZpOGZ4WGR2NUtYZWtIbDcyVkZtNEpJTnVO?=
 =?utf-8?B?SFJBZWNFbVNzM3BEa3YvUzc0SVY5bWxJanlZU2dLRnZxVE5DQkgwd2VyNGNy?=
 =?utf-8?B?YmdkcHdha0trWkE3QWx1TXNZZ1QzSDc1MUo0bXpWY2xacjZ1clNNclFWWG9R?=
 =?utf-8?B?dWN1T3Y1U05sK01iRWVXbkhlamdIRW5UUzBjMkQ3cmNvUllBWFlhRmFpd3BE?=
 =?utf-8?B?RXdHMDZKUUw2SE45SXFDNzV4Nklmd3pjZWMxajBBZk8vQ2tNaW53c25DWWdT?=
 =?utf-8?B?NU9TVG1zYmswR3ZxbGFLdUJVa2d6S2VEb0xEY1NYWFZudlVra2E4MXI1NWJC?=
 =?utf-8?B?eWFOWkJScWowdGsrQk93S1ZNSllUQ3VTY1J3eTBQeG16ZXlYLzMvRWRZV1lV?=
 =?utf-8?B?RWdNMTlZRXgzNmQ5emtCU0NTcVByTXRHVlgvMUF5NldoR0hPSFJDUnVwLzRW?=
 =?utf-8?B?Q1JlbkZBcjhZemJ0Q25tV2pQWVBwS3FiUkV6Myt1TWhwMVBWcUFJSU9VZ3M0?=
 =?utf-8?B?cU8yU1JHbnc2anVyYkxFbHo3TGNZR1FHSktMQ25kTGtVT1VhQlpOYnIreEdk?=
 =?utf-8?B?N015dFdvT2swWGJ3Um40N0k4RnNhWkVDQUVIWEJuMDh5bXBxQkFJUjJNVkNW?=
 =?utf-8?B?Wnh6eDhwZ2FGYVovZGoxVDhNcmVPSlBlMkg2MlhsQmI5OVEvZE1CRDVDemFm?=
 =?utf-8?B?N3hIcUk1eUlGVUxKRWtLN1pTdDFROGN4M2pXRWVib1pOVm9GZ0RONjI2MjJ1?=
 =?utf-8?B?eCtWWVVuRTNWVzIvZm9KS2l3dEhwQUN3R0h3VzVwbU5reEwxL0paazdocWtH?=
 =?utf-8?Q?07Wk0nEL27WlbsB4OB/dcU42E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7074928b-e215-4229-59ce-08ddf7527175
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 07:59:21.9004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXxV++wx/mh3zquO8UEm+ObmjihLL42QIq0ELfvjQlZZLy7reZreB0dYUf82ifvOPBSSeN/zFFdyC+35s23C2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094
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

SGVsbG8sIERhbmlsbywNCg0KPiBPbiBTZXAgMTksIDIwMjUsIGF0IDE6MjbigK9BTSwgRGFuaWxv
IEtydW1tcmljaCA8ZGFrckBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSBTZXAg
MTgsIDIwMjUgYXQgODoxMyBQTSBDRVNULCBKb2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+PiBPbiBU
aHUsIFNlcCAxOCwgMjAyNSBhdCAwMzowMjoxMVBNICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOg0K
Pj4+IFVzaW5nIGJ1aWxkX2Fzc2VydCEgdG8gYXNzZXJ0IHRoYXQgb2Zmc2V0cyBhcmUgaW4gYm91
bmRzIGlzIHJlYWxseQ0KPj4+IGZyYWdpbGUgYW5kIGxpa2VseSB0byByZXN1bHQgaW4gc3B1cmlv
dXMgYW5kIGhhcmQtdG8tZGVidWcgYnVpbGQNCj4+PiBmYWlsdXJlcy4gVGhlcmVmb3JlLCBidWls
ZF9hc3NlcnQhIHNob3VsZCBiZSBhdm9pZGVkIGZvciB0aGlzIGNhc2UuDQo+Pj4gVGh1cywgdXBk
YXRlIHRoZSBjb2RlIHRvIHBlcmZvcm0gdGhlIGNoZWNrIGluIGNvbnN0IGV2YWx1YXRpb24gaW5z
dGVhZC4NCj4+IA0KPj4gSSByZWFsbHkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBpcyBhIGdvb2Qg
aWRlYSAoYW5kIG5vYm9keSBJIHNwb2tlIHRvIHRoaW5rcw0KPj4gc28pLiBOb3Qgb25seSBkb2Vz
IGl0IG1lc3MgdXAgdGhlIHVzZXIncyBjYWxsZXIgc3ludGF4IGNvbXBsZXRlbHksIGl0IGlzIGFs
c28NCj4gDQo+IEkgYXBwcmVhY2l0ZSB5b3UgcmFpc2luZyB0aGUgY29uY2VybiwNCj4gYnV0IEkg
cmF0aGVyIGhhdmUgb3RoZXIgcGVvcGxlIHNwZWFrIHVwDQo+IHRoZW1zZWx2ZXMuDQoNCkkgZGlk
IG5vdCBtZWFuIHRvIHNwZWFrIGZvciBvdGhlcnMsIHNvcnJ5IGl0IGNhbWUgYWNyb3NzIGxpa2Ug
dGhhdCAoYW5kIHRoYXQgaXMgY2VydGFpbmx5IG5vdCB3aGF0IEkgbm9ybWFsbHkgZG8pLiBCdXQg
SSBkaXNjdXNzZWQgdGhlIHBhdGNoIGluIHBlcnNvbiBzaW5jZSB3ZSBhcmUgYXQgYSBjb25mZXJl
bmNlIGFuZCBkaXNjdXNzaW5nIGl0IGluIHBlcnNvbiwgYW5kIEkgZGlkIG5vdCBnZXQgYSBsb3Qg
b2YgY29uc2Vuc3VzIG9uIHRoaXMuIFRoYXQgaXMgd2hhdCBJIHdhcyB0cnlpbmcgdG8gc2F5LiBJ
ZiBpdCB3YXMgYSBicmlsbGlhbnQgb3IgZ3JlYXQgaWRlYSwgSSB3b3VsZCBoYXZlIGhvcGVkIGZv
ciBhdCBsZWFzdCBvbmUgcGVyc29uIHRvIHRlbGwgbWUgdGhhdCB0aGlzIGlzIGV4YWN0bHkgaG93
IHdlIHNob3VsZCBkbyBpdC4NCg0KPiANCj4+IHN1cGVyIGNvbmZ1c2luZyB0byBwYXNzIGJvdGgg
YSBnZW5lcmljIGFuZCBhIGZ1bmN0aW9uIGFyZ3VtZW50IHNlcGFyYXRlbHkuDQo+IA0KPiBXaHk/
IFdlIGFzc2VydCB0aGF0IHRoZSBvZmZzZXQgaGFzIHRvIGJlIGNvbnN0LCB3aGVyZWFzIHRoZSB2
YWx1ZSBkb2VzIG5vdA0KPiBoYXZlIHRoaXMgcmVxdWlyZW1lbnQsIHNvIHRoaXMgbWFrZXMgcGVy
ZmVjdCBzZW5zZSB0byBtZS4NCj4gDQo+IChJIGFncmVlIHRoYXQgaXQgY2FuIGxvb2sgdW5mYW1p
bGlhciBhdCB0aGUgZmlyc3QgZ2xhbmNlIHRob3VnaC4pDQoNClllcyB0aGUgZmFtaWxpYXJpdHkg
aXMgdGhlIGlzc3VlLiBJIHN0aWxsIGRvIG5vdCBmZWVsIHVzaW5nIGEgZ2VuZXJpYyBmb3IgdGhp
cyBsb29rcyBvayB0byBtZSBhbmQgSSB0aGluayB3ZSBjYW4gZml4IGl0IGRpZmZlcmVudGx5LCBJ
IHdpbGwgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhbiBhbHRlcm5hdGl2ZSBmaXggdW5sZXNzIHdlIGhh
dmUgYWxyZWFkeSBkZWNpZGVkIHRvIHVzZSBnZW5lcmljcyBmb3IgdGhpcy4NCg0KPiANCj4+IFNv
cnJ5IGlmIEkga25ldyB0aGlzIHdvdWxkIGJlIHRoZSBzeW50YXgsIEkgd291bGQgaGF2ZSBvYmpl
Y3RlZCBldmVuIHdoZW4gd2UNCj4+IHNwb2tlIDopDQo+PiANCj4+IEkgdGhpbmsgdGhlIGJlc3Qg
Zml4IChmcm9tIGFueSBJJ3ZlIHNlZW4gc28gZmFyKSwgaXMgdG8gbW92ZSB0aGUgYmluZGluZ3MN
Cj4+IGNhbGxzIG9mIG9mZmVuZGluZyBjb2RlIGludG8gYSBjbG9zdXJlIGFuZCBjYWxsIHRoZSBj
bG9zdXJlIGRpcmVjdGx5LCBhcyBJDQo+PiBwb3N0ZWQgaW4gdGhlIG90aGVyIHRocmVhZC4gSSBh
bHNvIHBhc3NlZCB0aGUgY2xvc3VyZSBpZGVhIGJ5IEdhcnkgYW5kIGhlDQo+PiBjb25maXJtZWQg
dGhlIGNvbXBpbGVyIHNob3VsZCBiZWhhdmUgY29ycmVjdGx5IChJIHdpbGwgY2hlY2sgdGhlIGNv
ZGUgZ2VuDQo+PiB3aXRoL3dpdGhvdXQgbGF0ZXIpLiBHYXJ5IGFsc28gcHJvdmlkZWQgYSBicmls
bGlhbnQgc3VnZ2VzdGlvbiB0aGF0IHdlIGNhbg0KPj4gY2FsbCB0aGUgY2xvc3VyZSBkaXJlY3Rs
eSBpbnN0ZWFkIG9mIGFzc2lnbmluZyBpdCB0byBhIHZhcmlhYmxlIGZpcnN0LiBUaGF0DQo+PiBm
aXggaXMgYWxzbyBzbWFsbGVyLCBhbmQgZG9lcyBub3Qgc2NyZXcgdXAgdGhlIHVzZXJzLiBBUElz
IHNob3VsZCBmaXggaXNzdWVzDQo+PiB3aXRoaW4gdGhlbSBpbnN0ZWFkIG9mIHJlbHlpbmcgb24g
dXNlciB0byB3b3JrIGFyb3VuZCB0aGVtLg0KPiANCj4gVGhpcyBpcyBub3QgYSB3b3JrYXJvdW5k
LCB0aGlzIGlzIGFuIGlkaW9tYXRpYyBzb2x1dGlvbiAod2hpY2ggSSBwcm9iYWJseSBzaG91bGQN
Cj4gaGF2ZSBiZWVuIGRvaW5nIGFscmVhZHkgd2hlbiBJIGludHJvZHVjZWQgdGhlIEkvTyBjb2Rl
KS4NCj4gDQo+IFdlIGRvIGV4YWN0bHkgdGhlIHNhbWUgdGhpbmcgZm9yIERtYU1hc2s6Om5ldygp
IFsxXSBhbmQgd2UgYWdyZWVkIG9uIGRvaW5nIHRoZQ0KPiBzYW1lIHRoaW5nIGZvciBBbGlnbm1l
bnQgYXMgd2VsbCBbMl0uDQo+IA0KPiBbMV0gaHR0cHM6Ly9ydXN0LmRvY3Mua2VybmVsLm9yZy9r
ZXJuZWwvZG1hL3N0cnVjdC5EbWFNYXNrLmh0bWwjbWV0aG9kLm5ldw0KPiBbMl0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNTA5MDgtbnVtLXY1LTEtYzBmMmY2ODFl
YTk2QG52aWRpYS5jb20vDQoNCkFoIG9rLiBTaW5jZSB0aGVyZSBpcyBwcmVjZWRlbnQsIEkgYW0g
b2sgd2l0aCBpdCwgZXNwZWNpYWxseSBzaW5jZSB5b3UgZmVlbCBzbyBzdHJvbmdseSBhYm91dCBp
dCBhbmQgc2luY2UgeW91IGFyZSB0aGUgcnVzdCBJTyBjb2RlIG1haW50YWluZXIuDQoNCkJ1dCBw
YXNzaW5nIG9uZSBwYXJhbWV0ZXIgYXMgYSBjb25zdGFudCBnZW5lcmljIGFuZCBhbm90aGVyIHBh
cmFtZXRlciBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciwganVzdCBzZWVtcyB3ZWlyZCB0byBtZSBl
dmVuIGlmIHRoZXJlIGlzIHByZWNlZGVudC4NCg0KQW5kIG9uZSBjYW4gYXJndWUgdGhhdCB0aGUg
dmFsdWUgaXMgYWxzbyBhIGNvbnN0YW50IHJpZ2h0PyBJdCBpcyBjb25mdXNpbmcgYW5kIG1ha2Vz
IGNhbGxlcnMgdW5yZWFkYWJsZSBJTUhPLg0KDQpDaGVlcnMsDQoNCiAtIEpvZWw=
