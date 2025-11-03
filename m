Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE3C2DF26
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C7410E477;
	Mon,  3 Nov 2025 19:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SY10Sirl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0A10E455;
 Mon,  3 Nov 2025 19:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJjObozapZRbOVtypr+fWiSMpwEW6xZ7JHE6AoXsmcA+ybdJbnkFVJeuU1BmXVqb2vt09ej+bPJhBuDyCBWcHjbVq/mrBDComdS8pm6V6OVLS8X5WInjRhDQfBWhfq6fv/ryxdodYyKd4K2IZ4HIJUZ0Be+VM0rN+dZawPpwtIJ6Ri3OOIGdj1p3OTWK5XK/npe+qdb3EzJDbIZo5rQrtn1GMnjKttD0kvLdWGoH5sCtLy4CLkTr6lLSsjjx7CEfiYGdoqvTMijVw+XT1Iv4AXsqXcJ6+XuMjZ1XhgkRu4k3v2yUvDPUHHTB+OU3ot+82PbROD8XXJ8hBsOFGX7GqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8UUU7bUX03SykP4cNFuSku/TT0xNK8QhOc8YIJH0EQ=;
 b=tZ5TPe2X8KwunCBme3ABp5mMo/vi/p5PQQUYbi4BtD5bKRlR38uRNC92RLaFbPAJWPAJ+iMLJt6Oru/gtPgJdEN7ZjM9kGmSW7t+hqKNHyBwyckmGENhSgbz5+Myu2R/mBRwzOFphWMw7YO+9fbgiNJPome47eoncV/6VHogkW6yHASrUx494XnCUHQBkpaO7ouk6PYnqoqqTp4A6227SLVFe2V9y1BR7ZfbWMlykv+P+7k2dUbWREyQRGSps19OMST1igJ6fX6SLatY8uhM6xX3QeYJVpzrLFHliY8Ig067sHXQ3+b5peCx+Lx5V96sNJ4SPGezjc/v1cookZXfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8UUU7bUX03SykP4cNFuSku/TT0xNK8QhOc8YIJH0EQ=;
 b=SY10SirlHN64JcW7nUJ1oOt2tFrW0WMlhl5qOmFcRYnB7M0KWBwBlW0BIZBVAJTniWn3ZdYpgMlY8U93FGHSJnf5ADo+X5C0qCTGhGRDWsrE/z4eoGoJUCNsUpMNeBxbtU7WkJFv0JVTqDNGPK+d/+xWyWOD1nAfm5QCgqqs7x60LSbGl9JoWeMYaqim1+dbJcoJTQ4ql3JuuU+dnRBH7u55r6MnrPj2rExJz+w7LsP4pK5pxLAzXW15HdNG/2SGA0sQldoeKvv4zH6czWML/QjihuzrB0HLi4MsogYp6kjIRcKL5rKqzYcOuuHKZ1IVz+PtaiSL/OyGr/EjkIPbjg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 19:54:26 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:54:26 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "gary@garyguo.net"
 <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
Thread-Topic: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
Thread-Index: AQHcTFS68gByFr2Zi0ueHSWgFUqs87ThUs4AgAAGbICAAAVsgA==
Date: Mon, 3 Nov 2025 19:54:26 +0000
Message-ID: <69e9c7e55c497430f00d3a3c5a16373f35e95d85.camel@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <f76f61df-8412-461f-8d85-b9ba0fa92df0@nvidia.com>
In-Reply-To: <f76f61df-8412-461f-8d85-b9ba0fa92df0@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ1PR12MB6172:EE_
x-ms-office365-filtering-correlation-id: 78b4d220-5e6c-4120-8141-08de1b12cb20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bnhQblBjTDRPZGM5ZWdkZFh4REUydkFVRXZMRGNUazUzWFN0RTlGK0c3eFcy?=
 =?utf-8?B?N2xRb250NkhoM0VNN0ZKQnFxMDZGN2lmSWRaL3g3and5cDByRTZNdWFzbTJx?=
 =?utf-8?B?N3JyenVrdVQxUVR3OVN4WUpqMFVNM2t1OUdBQ1dFNWdUZjNSdXhMRnl3U1Jh?=
 =?utf-8?B?YXVMbi9ZaTFHZUF2NzdxVG4wMXVtMkRSQ0wxcEt3R1cvdVhBdnZYeHlzZGQ5?=
 =?utf-8?B?OUxzMWwzQ242YWFmcmJFRGNXcXZMbDlCd0o1UW9Fb3MxM0RFdkpqUTJWYmx4?=
 =?utf-8?B?dHZsTExoODlrSXZ5LzQwaGE4VW9lSkJVZ3pYc2s5T1RZcXJVNzE4NStnWTVr?=
 =?utf-8?B?UzdWK05MT0pNaitQUXVrOTkzTEFveE1USmZxb3lnVnN4QURrMjRXV2c1bVk0?=
 =?utf-8?B?c1NUZTdWZUZ2ZEk0Q0Y4ME5zVi9NNURuaFF3YlJIc282elUzN20ya2ZtNm0x?=
 =?utf-8?B?VkpnTzZRazRoeGFabW9nMkRVWm1QNkNkeFVabitQUGtuejVZYWxsdi9nRmNj?=
 =?utf-8?B?cGtoRGZPenRzOUduczcxRjE3NEJlZWRHNW9VWVlMM05QMFEvNURpaE1FWUJo?=
 =?utf-8?B?THdoOGxrK3o3eXI1K2dYYWlwcU5CV2JRS010WkhBSGtMYTNmTXU3aHA0Z3Ny?=
 =?utf-8?B?WjZ3d1ZTLzVzcllUTmNZRFdCMkZZY1lxTk5sZ053OXZFakluSzQ3T0NnWENw?=
 =?utf-8?B?dFpqSERzRXUwSTFlWWhZNmovb2lLWk5lM3JmOCtZRUk1RnhRT0poOE03MHdP?=
 =?utf-8?B?QnRFOWlkY2Q1Uzk2ZmxoUlJ5YUZSNkVZcEV6aElLb01Pb1NoU2JvK3cwWnNz?=
 =?utf-8?B?WUdlVHBDMDhiLzhSNG8vYUp3SVE0cmlONWJaYmxZVmNTVkc1NGx6U0RudVFw?=
 =?utf-8?B?bHFlSkhucFdWSXVRQnJKT1lKYXBLUUszcTJCM3VJOVZ6cE1NMFVxUVpPTGdP?=
 =?utf-8?B?aUFwM3ErNkp1Q041bEhKSG1KNUN1UndpK0xsQVZ2WWpuQkw4VUZvMDBFSjU5?=
 =?utf-8?B?Vmo3V0VjSGIrME0rNSt5WFQ4MkFtQWlJOHlNYlR1bUhBNXNkWnZNLzExK2Mz?=
 =?utf-8?B?SFp0ZTRsL2tYQ1VQSmFqSGYydS93YnJoT0xlVlV0a3VhYldXMFlDSEZSZnNB?=
 =?utf-8?B?YURIa2U5U2MySjIvaGVlb29wdUxJNWo0V3Rkak9jc1JnRTl1UUZRTFFTTXFQ?=
 =?utf-8?B?Zy9heWNabHlUSFFZc01LdU5ielNSc1lOa3RSeXl1RXdlbXV4Y25OTFVJdDRZ?=
 =?utf-8?B?WWxockh4QWwzNzIvYlBxekZPSUk3S1lDWUFHQUpxcTBCWnVVN3dDejZEOWtP?=
 =?utf-8?B?elZIZGw4L3dhOTB3Ylc5SUhSQ20zMXhnNHRraWVaekNpbVorSnc2cG5LK3hB?=
 =?utf-8?B?OHNMTnJGdzRjV3h0Q2phSzgrdDZoc0NCd0ZGbGcxRXlaRmNHRHREM2tQZWg2?=
 =?utf-8?B?OWQ0YzNwL0pldEwwMFkyUmVJY090dDVGL2U0L1c1UVgrZndwSkVTdHhaUGd4?=
 =?utf-8?B?MlBwVU9oWjZOa3hiWDdPRDJTcGlmUFY2aUg1NzBWV2xnT1NJVDB3T25rb0VM?=
 =?utf-8?B?R3F2MHZqTWhhMjhsdXhRUmpYVUVrbVNOcDZ0OVlMU0xOakhVdnkxN0VvNjNB?=
 =?utf-8?B?VmhCamFxd1lSVXVtTWhmSGUzRVVPRzErcncvOGo2S0N0NVYrZit2dmZLTk1S?=
 =?utf-8?B?VUNaTWE0N3k1Z3NyZXprNzBGbDhwSk1wdWtQTmVDUWtpckcwbG4wWW5GOG1O?=
 =?utf-8?B?Y1V1cEpqM2JwdDZ0WWR1N3dzZ1BnaDNtS0FyUWRXVEtKcVA4WVNGS0RFay9y?=
 =?utf-8?B?d3FONlVwNlJ6TGpQdWg1YnVMVWVnVmY5dUVCMlJ6MGd0TFlwcUx3cGp5b2w2?=
 =?utf-8?B?RDVKQ2tDdUxzKzBFMUFCdTA4cHFBZEVpbE5HWUdsWEM0Z1JvT3VZYVZuT2p0?=
 =?utf-8?B?OUdHWklRWCtKNHg4KzRSOUNkSUFvcGtwRERUMkRzQ29XdC9xc3pDMUtNQXhM?=
 =?utf-8?B?T0ZSb2VTcUNBeG1RMHFrWWVjSXVFVTNCa1JrZHpCM04xcElkS2RxUGxIbzB1?=
 =?utf-8?Q?/JsyTW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFFiZEhGRGlPZy9qTGg5UE01QncrUWlncVFTZDE0dnVhcVdIQnJRMFh1Q1BI?=
 =?utf-8?B?MGF5d2tXcUI1eWdqOUFuaHVENDZWY0JzSDRVMERJeGYySFlkZTc5TDZTZVJ5?=
 =?utf-8?B?SHpqRGV5RDNuelBwc1pGNmh2QVl1RTRvVkp2bEJvQTdEVlArOXpkWjF5NFlM?=
 =?utf-8?B?ZGZGZW1QVmlkZ2g5aFk4Y0ZhSEZwRUpGZTZnM1ZFemtTWnY2dmw2dFJiTmdu?=
 =?utf-8?B?cHpta1Z2bkY3N2RBdTk4RVhrTlVlRDJmNWN0MXYrZEljdGZUUk8vSEtpcTRi?=
 =?utf-8?B?U1lFK2M2RnJlN2RKanZuZjMrdTc4Vk1ZTkRjanVWQm5OaFpjeTZMM1Bkc1Js?=
 =?utf-8?B?aTgvYXdid0JKaE4rMnVsSEprWkgwamFjSjhLYmRUUGNMUWF5MC9RUnZ0VWRD?=
 =?utf-8?B?NU5qMUp3TW1oQjJ2TlFnWFhWdzQzT2lRZGZyZThtVW96WUxiWWNRdEIvdi9w?=
 =?utf-8?B?UmlwVHd1Q3p3TjArZFEvTWtQZFBvRE1mZGVEaGVWNVcyRndUUHlwanJvTHNt?=
 =?utf-8?B?SUNLWHpoT2MySVBYL250UCt6RHJUQ05JWCt5UVkzVVRqZEphY2g2VUMyc3lX?=
 =?utf-8?B?VVRzdGhnUlJSK1kwSEZiSlNjbkFXSjFSL05XaXNpV0pwQ0lyZTdiVmFVbXBj?=
 =?utf-8?B?OWZlZGhqOVZtTzBpd2JmSHhuV3lIVDdDbmt4WmhIaG84MHgrczY3WE5Ja3F2?=
 =?utf-8?B?TWd3YitxS0dEUjlPbHNYNnJiZ0pkSTFxeVJOMDdRZitPWmU4VHp0aWxCOGUx?=
 =?utf-8?B?cVlLUUM5cDF1YUpMRVRUQ2k5cjhueWdCVkRGTmN0SlRyYmVGRkNUYUd2UVNM?=
 =?utf-8?B?YjZHT05KTVpFWmxyQkQ2NGh1STJxRFVrSFEwbnVvdGNsMlQvdW12eTZ2UDJx?=
 =?utf-8?B?aksvdFRlK0VsTHZwK2l2S2JIMFMvVUxoMEJ1UFkvbEh1eGxVeURYMlg3YVdQ?=
 =?utf-8?B?dFQ5b3lQSmdvbDJXSzZPZFhtVEowT2ZVa01nZUFiQkRDZXFnRlRjNjZvdlRp?=
 =?utf-8?B?eWpDVXYySm1xMFBxeno5Z0JRUGdxVVpCMXE1d3ZYblRqRWFXRlBSbE9sSDlW?=
 =?utf-8?B?TzhZcXhQVThRUXpQa0tkNWVaczltTlBEeXpXUlptbjdxZG1peWpySHJRTmEy?=
 =?utf-8?B?aFZFNDI3MXZFbW1XYlZTWkJXN1BvRmp0VnRxYU5meHVpc1R3NmJnb1N6ODVp?=
 =?utf-8?B?cUFQaktSMVl5TE1PL0Qwdk53UEFwTE9YTmJTeXpoL1h3ZnhlSDJiMVNXUm8z?=
 =?utf-8?B?OFZJZ2Z2c1NpdzBZdDk2SDlySHZVUGhaSzlRdHVKUTZzZmloU2E3aXc1SXZj?=
 =?utf-8?B?R3FvcGtqMFFicGZJYnh1eTREYnRNejV4QWhSeUVieFZsTTlFZnJJZjdhYlA4?=
 =?utf-8?B?THVXNlRlSHJlcFlFdzAzUEM1T1IwTGc3ZDcyOUJncWpjN1A4VG82NmF4YVlU?=
 =?utf-8?B?WThEZ0hpMDJCUW4rMTVucjJ2NXNpaUpZQ3FzRjhYM2xwSHFWeUFXQ0V6MFFG?=
 =?utf-8?B?ZmdZdGhPUEJjU1Q5RlVNMldHS0xHVjlaRjB4T0VqOVUzM0JZT2UvTFBsS1hH?=
 =?utf-8?B?WFVPNkNNK1BBWjhsU2ViVG5jNFoyQUxLR2IveW1RWTQwbFJxQWNqVUErNk5z?=
 =?utf-8?B?RExTbmJtb3djbGlEeUtzRzdhVE9neEwvTFN2MlNSOHpwc0VLU1NiaDNuK28y?=
 =?utf-8?B?ZTdRVWlyMTJ5TW9hcStHR3I0UFhEalQza2MvdTZKMEthWXpIQ05xbWpxZ21i?=
 =?utf-8?B?U0o3aW5TbzZMKytQdllQN01yVkRVcGxSNk5NeHppWE9YUW93eFh3cXZ3S3J0?=
 =?utf-8?B?bjFkTHM4N3NyM1FNZVRCeGZqREpkNkh6OGowOW5ndGRRQTJsNlNwT2V2Vm9v?=
 =?utf-8?B?b1lpN3dsTXcydE80TWNjSTc0ZkdhdzdHNUFJb25pajlrYW43SEZLTktIZERk?=
 =?utf-8?B?dThhbm4yWVRnUzE1enRpVGhWWEJqR2IzOVVHL013ZnZvaStHSWpxTis1L2p5?=
 =?utf-8?B?VU9XK1dPZ05JTnBSdGZ6UUx2WW95VUFZSUpuMXFyLzJ4Nk5rQStmWUFaRGFS?=
 =?utf-8?B?TjErNSt2dlBNSmRFcHBJRTJlWjE3Y05qWmRxUjgvRWl3bm1NNm45b0FUQUM0?=
 =?utf-8?Q?ghA4acQCDzmBBAkfOxBamqdtS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D141714BCA08554DB03D78478049B239@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b4d220-5e6c-4120-8141-08de1b12cb20
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 19:54:26.3766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QBYW5BCXX3LRCskDx3WXFX43Ou9Ovgd2mpmSDbwVeeuQqmXshx65ZAMkEKuTj2Hz5mnmCGMM20hAz2ILO4MuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

T24gTW9uLCAyMDI1LTExLTAzIGF0IDE0OjM1IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gDQo+ID4gQXJlIHlvdSBzdXJlIHRoZXJlIGFyZSBubyBvdGhlciBwYXRjaGVzP8KgIFRoZSBS
UEMgcGF0Y2hlcyBjYW4ndCBkZXBlbmQgb24gSU5JVF9ET05FIGJlaW5nIHRoZQ0KPiA+IGZpcnN0
DQo+ID4gcmVzcG9uc2UuwqAgR2V0dGluZyBhIE5PQ0FUIFJQQyBmaXJzdCBpcyBub3QgdW5jb21t
b24uDQo+IA0KPiBJdCB3b3JrcyBvbiBteSBlbmQuIERvIHlvdSBoYXZlICJ0aGUgd2FpdCBmb3Ig
aW5pdCBkb25lIiBwYXRjaCAodGhlIDEydGggcGF0Y2g/KQ0KDQpZZXMuDQoNCj4gWW91IGNhbiBh
bHNvIGJvb3QgbXkgdHJlZSB3aGljaCBoYXMgYWxsIHRoZSBwYXRjaGVzLCBpLmUuIHRoaXMgc2Vy
aWVzICsgQWxleCdzDQo+IGI0L2dzcF9ib290IGJyYW5jaDoNCj4gaHR0cHM6Ly93ZWIuZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2pmZXJuL2xpbnV4LmdpdC9sb2cvP2g9
bm92YS1zZXEtaW5pdC1kb25lLXN1Ym1pdHRlZC12Mg0KDQpBcyBmYXIgYXMgSSBjYW4gdGVsbCwg
bXkgdHJlZSBsb29rcyBqdXN0IGxpa2UgdGhpcyBvbmUuICBJJ3ZlIGNsb25lZCB5b3VyIHRyZWUv
dGFnIGFuZCBJJ20gYnVpbGRpbmcNCml0IG5vdywganVzdCB0byBjb25maXJtLg0K
