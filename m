Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB5BFDFB3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 21:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9404510E82E;
	Wed, 22 Oct 2025 19:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NQGy8+pJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013060.outbound.protection.outlook.com
 [40.93.196.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2767210E09C;
 Wed, 22 Oct 2025 19:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIzb35kDfsaHhokA1w6iOlhSswDF08ADTNOT0a5J5QI3Aeb3KVXDCCS+/nKc9Yfdk1EH8FR9n83T6PgFxmXgxEa/m/5tpBeyJ7MWoYGwE+UO+ZjeXouqyAqVJLj1oDhCTHw2vkPUhJrtmGgBN0G/KfjZ9IV74at/0FBniR8ISrMeuK9/giqcOMAkqvEFqLEzLfEkVvhCShuiKOKnpNz1PTktKBYa6NwbY4G+ld9WG3p15dAxpHPdwagrhcr34R90sD3mGkzljwHL3qdI8LkhtkO6oxHVKilYa4a72etIpZgLu25B2CZps8UE+b5PJpXxdp6O8iOwQTxmH/0unV2Ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIMYE7czL4N6bqsB4H8Ng7PQKJKkVJ5kiaTz1awfL50=;
 b=Wwbt6E5vStXygkP0DYvhKPrxLddRjKgjDnOzZ+YY3fTqY0EmlcFpv3qD681j29FX+SmQTxsJzn7HvcgchyCKuaK4ELfOIyonYWmpQhUb8Iz1gy/tGrjDllHCeLvLvmhafh9/3pZdXLoorn36U/5PIj30DGA/CBRO3Mhah1ZuRC96zZKlND6i6TnGbtDLI+8qMDbW3+fP4OS00YAQZcBXwm0+ZiIzq3k+8eVPeTiHhyh1t4ia6kBVpuqhvSDAxwUviErmajwT7emCpGdZVJ6Kj0tUi46qlveVrEeCr0T5NYhWrttkp1B6Upm7GBWki8v8wJt3Fpfi8FQztA7zFYBF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIMYE7czL4N6bqsB4H8Ng7PQKJKkVJ5kiaTz1awfL50=;
 b=NQGy8+pJ6KiSy5+8l0l8AqlUA7DkrK1x1VZi0I8yhgpnHXVpDmBi1ZoOD0xPB+DhtBiifyYaI+nCuyD1uSd9tx7NYRcYFeMjRSvE5YtlryEdUtV0Ur9L+c+DxLDfm49tq/BGAbRHSk7cuFt5kX5ce95TdsBVnWZojsx//lIjMYeyHtPh7re3ZGpA927udJWIpWMnIYWIuKBxLDC4RnBnQv4EdAOWsURRVafAzXSrI0UwWB5hZOvHGn0BqYpYvCLOB03L5Q9hiM6MRWSM59ui050B24x92ul58LcmkXG52Hd+yrFdcFJTc25fMZjMVXleU/xMmvJE8gTZLLTGq/AkBQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 19:13:40 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 19:13:40 +0000
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
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Daniel
 Almeida <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Thread-Topic: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Thread-Index: AQHcQfMtaAN7hmZj90ONxNxJIQOdf7TOCEOAgACDybg=
Date: Wed, 22 Oct 2025 19:13:40 +0000
Message-ID: <ADA086D9-C352-43AD-AD3B-35BCE84265BB@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <DDOT8EL6RMYA.3SR2XSN6953HA@nvidia.com>
In-Reply-To: <DDOT8EL6RMYA.3SR2XSN6953HA@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|CH0PR12MB8552:EE_
x-ms-office365-filtering-correlation-id: 676b87ce-71c4-4ea9-7d3f-08de119f1c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?djBvNWdsZGkyTE4xVnc3dmN6NVJsYmNoTWJjbm9qRzRodUlwdDhxZ3E0ODcy?=
 =?utf-8?B?MTdqMU5vSlpkY091WWJNeEVmUEM2TlJGSFhXa3A2dXpmNVFwZVF2eGRlZTBm?=
 =?utf-8?B?M0d3a1ZVQWVkaHIyaVNVRm1UY1lEV1RkVnF5OVpwVFcrTERRekhnd3FvMlpI?=
 =?utf-8?B?dC9hWkhFYU9UbG92QVR5UmlFU0xpRW5Lc3NnQ2xjdkwrc1ZJeVdFVmJudno0?=
 =?utf-8?B?ODBRcWpkV3J1bWVGbjNublM4ODlqOGZ6Y25ONWpXbUxYTkhUYnFkaUh6ckY1?=
 =?utf-8?B?MlVsU292bFJudXNnSmV1SHdNenZWOE12cWNXZ0twZC83blR4Ylk4a05TZlJo?=
 =?utf-8?B?ZE8zNlNJd29WSTFFMFUza202UW5qbWNnZmdyUEJTamo3bTRtNWx5S0kxRzY0?=
 =?utf-8?B?S0FjRjA4OFdVVjg5MUdONmdXWEMxQ2F1TUppdDRZVWJNTTNpcTRuY1pSR1Jr?=
 =?utf-8?B?Wi9PUlVKOGlGZUhEcHpENnBOdDFoK2s3ekJJM2pLbE5lcTRBZHFuR01TdkZG?=
 =?utf-8?B?blNLbEQ4VG5QTzlvcHlnRDY5UEo0aU1QaWltM0E5dlpiNGh0M2U2bm1uNlBt?=
 =?utf-8?B?dEYwVjhRci9uT2NCRmh0c0VBRzhROE9xRFJXcCt5Q2hDdnluM0ZSdk1JNEVN?=
 =?utf-8?B?cnNMTVl1L0YxaUc3Nkc0Znk5RWk0enIvaVBMcFBIK2k2d2psUXBxb05oYllO?=
 =?utf-8?B?ZmQ4OGV3c1QvRlNndUpQQTBiTU04dXUyazA4UXFLUmhYY1VjMktTVzJBUkIr?=
 =?utf-8?B?SUFyNnhsVmVFZzFqd3JCenRrQUh5UmpET1JwSWpTR1FKVTRpM3JQWlZlZU9p?=
 =?utf-8?B?M3IrV0E5clp3NkYzOGo1ZW5US0RveHlGRU9WRFY4WDBUSW1mQWd0YXJMRG40?=
 =?utf-8?B?OEZ4Q1VmZFJ3cks4cElGNlUzQkJKa2NIRFRjUHUxbVJ5SjYzRXNRdGhKZFNC?=
 =?utf-8?B?cjRuWmcwQTdrd2JSOHhZZGRjbEJ2eDJiYTZtQldZZkVxK3JWVTc2SWx4b2J4?=
 =?utf-8?B?VGZWUytLQ2I0OGhreDV1R2xvRUhNVjJmUjhyM01FWmhRd2Y0cFI4S1RWcEFH?=
 =?utf-8?B?SzVOTG1vaUZUTFBlc1Voc09EcE51WVUxQzIycDdzUGd0R2lLN0svWmNHZG9S?=
 =?utf-8?B?NiszR2RVM1JPcy9MNFEzS0ZJRXN4NUtwSTRvVkdxb2VUeTl4NlVBcWpkQUlN?=
 =?utf-8?B?V0dFZkU0Sml5UG0vQ28vMnRVRVp1OEhzenJSOSsxYTJIa09hM1pJSUU0MU5G?=
 =?utf-8?B?dUdlQnVWZUFMZTNGRXB4QzFQRkVxQTh2amJDQ2c0YlhVVFg1WDY1RWo4SnBU?=
 =?utf-8?B?eXVQMGVmcEJMb2JsN1Fld3VGL3VJZzg1aWp2NDRibWVkRlc0SVJNOXN1eld6?=
 =?utf-8?B?OHdlWGx3MG9ObU9heVpzM0h3QWZFQ3JRblV5UzV5NGdvSk1PcENTU0piR1NH?=
 =?utf-8?B?cXRDb2t4K2c5QWRaRlpXRDNxZTRDQ01uQWEvK3M1MStMaU1LQUFvOUJCN2NP?=
 =?utf-8?B?THJFUlI1YzlHTXZhMCswK2dYK1BOS3hvZHIxcjBKdWJjdW9GWnlEUVdFUWZt?=
 =?utf-8?B?dXhJUEtMR2hoc3F6dU5YRi9zZ2xpd3JCdlpzNVovQ0xEYVRRR0o2Rml2ZFRB?=
 =?utf-8?B?SVVCRTlQRSt4aW5qV203MGhmSUl1T0RHMzNnaHJyd25jWTREQ0c5SFdEcTFm?=
 =?utf-8?B?Znkybm8vZnlIQ3M5M0hUZ3RYTlUwbzJuanBDWGNrTjdJYXQ3U3Foa1NxQjZL?=
 =?utf-8?B?WHBhREFpSXdKTDZXQkYvekxnbVZod2FiV3NlVzVYdjY0aUZWMWxZSUFKV0oz?=
 =?utf-8?B?Y01aUVB3TjFZT05kbDdSTU5OWVUrSHMzb2s4RFJES2QyUlJZWGVjc1FyTFVq?=
 =?utf-8?B?K3cybGgzZ0I5NDAzcThGZzhYV3NFcG1wcCtCdEZISW9zZEIvVDRIY2NHMTRy?=
 =?utf-8?B?eDRZVkVZcmFCSE8wbWdRQVYzdEFOVzBGVnVodGZjRTFuWG5QQlh5c01oWFlF?=
 =?utf-8?B?TVpVaEw2b2Y0czgvL05mVWJFS011OHEyRVZnQjl2T013Tm02a1l5eUc2dm80?=
 =?utf-8?Q?ew8psp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUJlVUNYSjZ0SUtsbE1ZelBKcnltN0pYRmlsd1RQLy80c3Y0c1czU01INGRP?=
 =?utf-8?B?MHdMdGVEa1U3cVQrNll4UnNYSEE3WFl4c1l1UXJvQzJpSDFCMGt1Z0dPMW9Y?=
 =?utf-8?B?NWhtSlAzbEtkMVQrQ0VlOERoMThYNCtVS2lkZTBmSlZBNVN4aUxLbjYxUUo0?=
 =?utf-8?B?Zi92SDVVK2hOeHNacEFNR05NT3FzNktrblJoSXI0M1A5QURsRi9MS0RzcTFU?=
 =?utf-8?B?NHdUaHBGejNyemxxR1E3WXRiRXpiREhtMlpLZ0lOamhuQUJNVU4vaTZHZWZJ?=
 =?utf-8?B?R2d2a1YwNytua2JUKysrc0hEZ002NzBxMSsrczl3bW5CSGllRS9mTmlDRlNP?=
 =?utf-8?B?MW1McW92Zzg3V0NHeDRtR29QR2JFSVZoemFSZWRmWWNGZTlYcjdCWjluZTd6?=
 =?utf-8?B?bzZxNWdNKzF0elZxNFlMaGsyK3puU2orSFk4c1laQjNEaTk4Mlk5N1FhYmtv?=
 =?utf-8?B?dmMvdHZ3VlFUYm9FK3VGSTh5dnErS0hveU1rZm1KMDlpa01wLy9aQmh6eUpG?=
 =?utf-8?B?NUpVYm5VL1NBOHBtcE0wcEFhY2RGTFZycmlCbVk0N29MR0FucXl1QkdyWXpu?=
 =?utf-8?B?WU9vRnZDL1VPNmN1ZXphaXdsY1M4YUVpY0Z4bk5qcjk4b0JXMkhXQlkyblpG?=
 =?utf-8?B?UGlvcE4xTnVzRllIYnd5dFVZUFMrZ1F1Z1VkdWUySnE0aFJiM1h2elhvd2JL?=
 =?utf-8?B?WHZZSkg3T1FtL3hOSzNqVVVHY3RRMlVVS1JuZkFWem54bk9KanJCQnBlV1ly?=
 =?utf-8?B?LzR4SS9SRE1Fc2xpTXloY0VpdGVOd3kxd3RodWw3NmNBZzhJS3lyQ3RPN3Bh?=
 =?utf-8?B?N3FNRFR0blVnRVVOWGdqQ3pnamw4Wjhib0pBODN1Z1lvamV5SzdTYmE3by9a?=
 =?utf-8?B?dTdtUGFMbFZReFNOVDhOMWg0aHdyOHQ2b3A0eVZvdHNRWk1PcmVxNjRjTDRq?=
 =?utf-8?B?RlJCdWhMTmxGaUwzSElFZklwTGttM0ZuMkh0U2dFZkExVjRSN2F3THkwZ1g1?=
 =?utf-8?B?YWkzTUorMDVJMnhSbGFZRlNKMFVrSGR2aFY0ZUZkWm91eHdTSFJyYWtqK0Yz?=
 =?utf-8?B?TDI4c0tnRThsMkJQL09yakI1WHBlWmozTXVIQStldjF2WWc2N2xHSDVPa2xw?=
 =?utf-8?B?VStYZE0vSVA4K1JGdGtDazNxU0RsUnk1Slo4V1c0cHZRRXFiSFdBQ3lvZG56?=
 =?utf-8?B?RDRPOWhsL2tKUEdwMXFvaHB1ZndycFVYWVY3YnQ1SzBHaFVONWN5c0o1ZitF?=
 =?utf-8?B?TlFZK2VLS0N1Zkl0Mm1aL0ZiZE5seVBaOEh6RjJvanJ4Y2p1b3BUbXR3M1BB?=
 =?utf-8?B?M1VYd1FyOFRrazVqWFc0K01LaEZYcExhcno2VkxGdUE5cTE4RHhleTZ3eEZs?=
 =?utf-8?B?alZxcGVUOFR6YktORDhjVlNtNTVhdU1WeUFvL1YzVHdjaVhjMjZGbGx6WTV4?=
 =?utf-8?B?dXZmQnVSbUkrY2ppYmZIaWVzZGJYMjZ2alh6MXQyV2hrcWU0RHJMQ1lwbjBy?=
 =?utf-8?B?clJMbkhCSWhHOG9TT0tKbCtZOFpVNHJwS1IyYjlUL3RNTSt4anA5VXloL0gr?=
 =?utf-8?B?aDVKR1pSbEsxS3BDV0lZajhyUldlcmpsMVFqaFJ1ck8xaGl1dys3MlhBSURZ?=
 =?utf-8?B?WEZySERhMVRVViszTEMrWFkvRFd5cmdraUxZTmxMNkMwckVmOGZVelRiejNB?=
 =?utf-8?B?VmJONWVkRG02cytjNFhlMExha3ZxdERPMUJrMHhiODVPNlBkSXJzSnlZS3lz?=
 =?utf-8?B?RS9NVnNKNlpGNzdJb0U0VEI4YnllaE9vOVpnRW1HdldvcGhscForc3VkcEF5?=
 =?utf-8?B?MG5YQVZhb2VkL3NTdEM3M2JXT3ZUcUFnZkJ1Nm1odE5VL2p1MnREOE1KbFdk?=
 =?utf-8?B?RzQ1ZjQxaUozWmVpcDN3YXczZE1XYTk1ZkV6OHNjVmNIeFVkYTB2NmF2RjJn?=
 =?utf-8?B?VHlXcFFDZFJnR2NmeWtVazlyVHREbXd1NVc3YjhXVjhidjk0QkgvK2YwSllY?=
 =?utf-8?B?UkZML2EzU0VsY1BJYVlKM093c3FhQWJrQXI0WlNuWDh1RDdnZjU0YWdZQ0h2?=
 =?utf-8?B?NzVZN2drc1pWdDdyVUx3TmZRVnNCcTh4OFBqRGVDaTBZY3pXNWRHS0RtTG5H?=
 =?utf-8?Q?zgy2elDu7UtI4g7cA7OgmcghU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676b87ce-71c4-4ea9-7d3f-08de119f1c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 19:13:40.6441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTd/hLN3d0PPyV8EdxcuyStHs3EIyFcxkkpEaJKjQFa5ygHTCXpXyJVwo/ab0kmW5wMvixc/RSZR3/LDD8+WrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
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

DQoNCj4gT24gT2N0IDIyLCAyMDI1LCBhdCA3OjIy4oCvQU0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFR1ZSBPY3QgMjEsIDIwMjUg
YXQgMzo1NSBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPiA8c25pcD4NCj4+ICsjIVtl
eHBlY3QoZGVhZF9jb2RlKV0NCj4+ICsNCj4+ICsvLy8gTWVtb3J5IHNpemUgY29uc3RhbnRzDQo+
PiArcHViKGNyYXRlKSBjb25zdCBLQjogdXNpemUgPSAxMDI0Ow0KPj4gK3B1YihjcmF0ZSkgY29u
c3QgTUI6IHVzaXplID0gS0IgKiAxMDI0Ow0KPiANCj4gWW91IGNhbiB1c2UgYGtlcm5lbDo6dHlw
ZXM6OlNaXzFLYCBhbmQgYFNaXzFNYCBpbnN0ZWFkLg0KPiANCj4+ICsNCj4+ICsvLy8gUGFnZSBz
aXplOiA0IEtpQg0KPj4gK3B1YihjcmF0ZSkgY29uc3QgUEFHRV9TSVpFOiB1c2l6ZSA9IDQgKiBL
QjsNCj4gDQo+IFNaXzRLIGV4aXN0cyBhcyB3ZWxsLiA6KQ0KDQpUaGFua3MgYSBsb3QsIHdpbGwg
ZG8uDQoNCi0gSm9lbA0KDQoNCj4gDQo=
