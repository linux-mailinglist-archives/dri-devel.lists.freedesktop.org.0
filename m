Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA803C38556
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 00:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BEA10E7C8;
	Wed,  5 Nov 2025 23:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lkYWIN4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384D10E7C1;
 Wed,  5 Nov 2025 23:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyt1K3DnnK3LacT4TLPAxBedDWk6u8ACoKqYVUdqM90EHpKfQ0AXAb0BMU6AZzYSMQHlROd2UxooS4l/iPkMe3Q8IUygFZp6ReuQFramJxl/o2InJqQlsZlhj9+CR2m+devGaNLfkpYlkO15STF1Ovz/FqHYmRU1eUpDra1zJAjsuDMJzjdi2idWOVVyfcNY+a4+wThGvhq/NjzORyvJuNVRkJyK/8HT97fkt4jTWCT9E1gmea9+gfT0q5ObjOjRCNXxeDMvu7UaFaTR6ZeRTRrsmZckTm0vPWsfjRd0pa973pep8Vm+5sIHcq4o9MTl1Cy26G/XEyIn2YAHtyZW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO03Fp9ljDqcSyBk+e+hK4BkrFddpUgboTgrSE/Awso=;
 b=iJUuXzgQaMf0Ke6YcnD80eXCnPqA4AYnDJFPNMe1B5SscTUCUq+bVgkOFxJLoE3dclaSVrAp++pM5lpyFfXOrMlQnXBa3t7TXTpnAJyLCtFtpZWul9q6J8NAfgVTDo1xMXVe385FjZWtp7CcelPOHt8ZxGaGooxL3kqVwJS2V1/ROOXYKLRIw9boCssOpKU1f3PNTa+3dOxPakii3wk4dfuFbgP2lgzD4FoNvQR3jC4D/1HoAfx2BNvvz8/+J/4Ciq5rQef442Hb2Fm+myNu02ZzLkZCb1za7OBQVykH2ugdxLwahh42SghmiYJ0TYPsDbzK+D5yUfNlQybGumIxpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO03Fp9ljDqcSyBk+e+hK4BkrFddpUgboTgrSE/Awso=;
 b=lkYWIN4IAd5nf9Cjh/EA6IS5AEOnEVIdRiFHJAiUIYtuZGhUx6WcMeVEmeLH3KA70ZCWKI52erJRH502vPrGdkWZghnm/733RWRiAMr/k306GcP2XkF97RoiE6ycs8k/XL0sbt2dzTczZkmhsIhk+K8AF6Qop30y1I54rpO+LgY08xVBGrhzJNIFaU4muVyK4Jg+wLDkgtU9nDuXvMWJZjGbx6iIkiqH1XK3So/bEI5yJsE+uwX6X/oIs+YqrxMs/6/+yBPobvVr7jIrI/A6EyhuvBIQV8BoQfeNM2dOkpmdDPk2NmEW0FwLNY3XCmhZplE61wCr2XO8AgURvwwHSQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 23:19:15 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 23:19:15 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
CC: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Topic: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Index: AQHcTFTC0NdFE6lpDkSHKHEG1nJiT7TjZSmAgAAPi4CAANWOgIAAWtCAgAAXdwA=
Date: Wed, 5 Nov 2025 23:19:15 +0000
Message-ID: <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
In-Reply-To: <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN2PR12MB4207:EE_
x-ms-office365-filtering-correlation-id: 86a959f2-d6f4-49ea-e1e8-08de1cc1bce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SkVMZWh6eUxMNTJyb3U4ckFvZ2VpSURYZDFwNVgzRUcxN2NQNWZ3UEhneTFx?=
 =?utf-8?B?K2U4UHV0SmV1dzQrZzNja3NvMzN1WGg3bldzdjFUTWNOK3N5ckdyMldMZmZo?=
 =?utf-8?B?dnIxZ2Nlc212bEtSVW4yaDhkUytUcW9GS0QwU2liYnhlb1BDYkEwMVY3OEtD?=
 =?utf-8?B?SHErZmp0L3R2L0g5b1NHc3ZUUk4ra1BQRkZCUi9Oamk5cjIxb1I3a3RHSkFQ?=
 =?utf-8?B?M24rSXpvSThUM3VxVEU0TnQ5U1h1cTJMcEpoY2R5VVJLN3g1MmxUVGk4bnZa?=
 =?utf-8?B?YmNUQWhWQ1RVTjhjNHhhc2kyTFAzUFovd2R3NWNObjUyS01BWjZZckZ1V2xq?=
 =?utf-8?B?RGlmdnk0TnZaUm0yWEVLdlNycCtQbkhOU2Z2SVBnWGk3Z2dpamlQQW8wcHgw?=
 =?utf-8?B?TElaYlpyVlRLbFdQUkcyTkdkVTB1WTVlN2pveDVQa3A5ZXBKUWpzNXJ1a05W?=
 =?utf-8?B?ZWNCTWVGa0NHNkptSDdaN1dVcXFVVHJ3ZkJjSXEybzR0bm1na2NIRTUvVXo3?=
 =?utf-8?B?aGN6N0Zrd25RY01CcUEyWjlRVDhhenVaVjVtMEFsMVByaFNTN2RXWUF3RG5J?=
 =?utf-8?B?Y0RZWlNTVW44MDRoaTc1cGtWbHhJSDdmaDZ4cTZXOTI1NWhGVVRBdTBTQnRC?=
 =?utf-8?B?eTZOREI2bkwwRTMwQ0E1WlhXbjRZVndZRGEwVTFSQW54RlE5dlErR2FwS1Fk?=
 =?utf-8?B?VjZ4U2dyNFFBUFV2eEZjNFU5TjFWWU9jTjI1dFNGcGZQR0o2VFFOMWNlR2d2?=
 =?utf-8?B?TTZxZDl2TVBDTTY5RHV2Z1lCQUN4YS8ybzNvMDlSbWV6V3NUODlIaVpPQkE5?=
 =?utf-8?B?amkyUlhkckIrSExVMWVWYVE4cWcwMnNuWU9kV0xVdmRrT2haMmtQcjZUREZm?=
 =?utf-8?B?YlhLazFFK1JQcytBTitQWXFwTCtxeDNnclFPZVdOOWJIbWxZblFiV0xXYU05?=
 =?utf-8?B?UXJJZkp1UHZSM3d6dVN5aXZ0cEpEb3c5RjNjZFhLcy9HYnFWbGRGaytkSlZm?=
 =?utf-8?B?VER2elhUVkwwNEUycDEvUjdmbktjRitQWkJjTVRLSGNEaXNjMjVpTjdrSXpJ?=
 =?utf-8?B?NEtaY1UvK2ZzdGVDd2wwVC85Mi91ZFBHcDR0b2VjcHNxeUQ5VXZsdFFNNC8z?=
 =?utf-8?B?UG94ZVU5NWczcUlqdWRLTFA3a3lWUGVUKzhYdC94blBvc1ZkYnBvTDNVblVy?=
 =?utf-8?B?azFKSW44UWUvWmZZS1RJTzhXWHJLdkx3OU4rdjRLMGRqL1lCSUIrb3Y3ZURj?=
 =?utf-8?B?QTBkekpoTFFzWFpvYUg3STdJbVIyaCtvMTN1ditQenFobWhvS2JkRWhoSVQv?=
 =?utf-8?B?bVczLzBUbTVkK3d0bkRhWlRtSGduak5jcVJyMHJ2ck1tM0Q1QTAzU0JBaUow?=
 =?utf-8?B?NnlzODBqM05FYjN3NnRYdUV5OFNrek9FcEc4aFkxQ3JNZ0s3cnhlNGw3dk5u?=
 =?utf-8?B?VFRSRWl1YVBxWkl3TmxMRGtsYklvSVprT2V2cnZLNmtXWEhKVVNWNkVLQkNM?=
 =?utf-8?B?SnROYW5zL0lSeDB1bWtqVERJSW1iaytiM0hJMTROQkQ3YURBam1RQVJySms2?=
 =?utf-8?B?SGVJd0dyclFmMktYNkV2alpNVHhDamR0cnRtZGlteENvcGhGZER1R09VNkMr?=
 =?utf-8?B?Q1JkRGtMRXVqTlJheGN3cVZoeFJMdU5YaUxwb2tQM0Z5NC9DeFZHd0E0OGtX?=
 =?utf-8?B?QUFTdklqRzhxdG9JK3RiWTRENGVJS3IwbldUdG5pcmRpUXpBektMUU9yVkVh?=
 =?utf-8?B?VGdTSjRkSHB1cjQyVU5SRW11MjcrSENjNnREendUYmxTTWgrajEzZXdUemw0?=
 =?utf-8?B?K25DTUR6VEs3YnhIQ05zSFVOS29pb08yWkNscTJobWRGbkp4bTMwdWNIU2lW?=
 =?utf-8?B?MmhjbGd5RHNpTStGc0M0dWNpWERIb1R2K3o4a1p1M2dlZlVjdm1VWlJxVG1l?=
 =?utf-8?B?eExHL1NaNFE0Zk5Lc3lVNUNIWkJ6Rm5uMDVFTFByOUMzcVNzWVkrdjBFR1I5?=
 =?utf-8?B?Vm5CUVJtLzNsVFZ5U2RXRWRMQ0VqWCtFZzRqdCtFVEdoT1lZcVhsUHlKc1gv?=
 =?utf-8?Q?JF0HKs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azIvVnNxRkR2N1hZeUNCWjV4bE9Qc1hieHdobDk0K2F4TG91YWlMeFlWdFVB?=
 =?utf-8?B?VG1IUVpzcWFSNy9sQTA5dk13eGV6Mll6L0FWS0R0SFEvZE9zbDFSNDV0NHY5?=
 =?utf-8?B?ekg5Rmx3aXg2WVdWT3RVb2F1YWJKYkoxWGxNVWw0RkJObVduRjkyeHlWb21p?=
 =?utf-8?B?OEZBeHhaMlo1QkFjSjhiUHJZclNkOGpTZVZJem5mN0ZCbC9XUFVqWWNPbjI5?=
 =?utf-8?B?Q3ZhV3JiTzU0Ym1wL3dJclU2U2JWbmVyVVV0YWRmV0xhSmpuOGNpMndDcE9R?=
 =?utf-8?B?UE9aemF2ZnZlOTNvRTRiQnF3Q2xiY3ljTTVsYlQ1UW1hRUlHRTBxd3dCRTY3?=
 =?utf-8?B?bWJaQWoyS29aN1BhU0dYQjczd1ZzWFhlMDZ5QmtHWUJaYnF1R1JYT09vOHo0?=
 =?utf-8?B?RXAwTXl3cm1oK2pOWkhULzUzQmhFQk1kUE5nNlpZOXVTeHFHV0xsNldqNHc4?=
 =?utf-8?B?U0htNjJSU2ZCZ2EyeEg4bzVtT0FiNktyNk81ZW43R1o2SXFGZFlPdmxGQXdF?=
 =?utf-8?B?K2p0dVNpMThKYThqaisycitBbnNJY1Qzb0tTa29MeGJ3b1kvUVhJaDVPNW1j?=
 =?utf-8?B?cEU3MlRuNW04dmpiN1BWQi9sV0xlNTJNSWphTFBrT2hPUHE5VVAzVmxocWow?=
 =?utf-8?B?UnVhQjFZenFjK3RWV0xBWVozZC9iYUpXbDhxbWw4NElPcXVkc2ZaL00vaWFl?=
 =?utf-8?B?MmVYZ0F1L29iWlphL3RYZkVKVDJ1amVDWjVnL1gzaVhoeEdGY296Q2VlSTBj?=
 =?utf-8?B?WEJGcnNWVG1XWFdLeVpLR0ZZbjd6czJ2SXMwdzkxdDE5YzRFNnlETXc3RFB4?=
 =?utf-8?B?WlZoVzZ3UnVmVTI4bktHbXlJemYyUmRiMXlHTDVmT29qeVROVEZXK3c4Y1g4?=
 =?utf-8?B?YmxTVzRUb203QzZNdWFqWlVnNlZCNjFYK045T1ZsWmNQRFptUlc4cHRyZmJw?=
 =?utf-8?B?MXhkVTZJN2djak1PUUdQUVFnNnRDK0NmRWxOMDkxNlE3NUluOFNZcFNpcFl2?=
 =?utf-8?B?T0JlM3VuVkxpRVp4cER1L0VPWnNzOUVaYWJwam1ZTEgyeHJ2Z0drOGdvbFQw?=
 =?utf-8?B?dkcyaUU2UXlJWUJUNFIvdGRBZVA5c0o1NFRSa3JJK3NBcDh3MXNTcHUrRzAx?=
 =?utf-8?B?TjNzaHNwY3FRd011U2l2SHhRTVkyVXhYcFE1K3EwVnQ5d0hsOVAwWFk0RzJF?=
 =?utf-8?B?WXhSeVlrK2NWQWEyc25DVmt1T3JDYTNwRWNCUTkzem1DbXhTZzA3dzVLVTh5?=
 =?utf-8?B?N1VsOEhSYjk5Mjc5RVFtdm9TUnNVbnFDNnIzNk9UZFVhR2NaeXo2clpXNjFh?=
 =?utf-8?B?Z0FoNENiYkRWR2VtQlJqcWFnQVh3UjhqU1hkMUZJWHJRb2tSRVJTYnJOV2Ft?=
 =?utf-8?B?UWx3blQvL3QrREVjZG04UGRXYWpGRVV5aCs4azRpZlZmSVV2YnBBQmxmS0Vw?=
 =?utf-8?B?czQ4c1BJc0Jnb2FIaEdZRGFURzBrZVY5SWdQNWFpUkpmK0YxQURkUHFSaG9R?=
 =?utf-8?B?TUc5cU5WWk4rZXk3d3JWc1RxNHlUc2UzQ0FiNS9sNHZiVzdWeVlLQVIzVFZK?=
 =?utf-8?B?N1FwY2R0b3hScHN6Rm04NWJiT2xuRTR0djNjdlp2UzV5N3pyMGptd1k3TVZn?=
 =?utf-8?B?bTZEa1NmKzE5OGJHV0EvZ3J4alNXMEFNMHN2S3hrMHBlVFYxbTN3RDhiM3ln?=
 =?utf-8?B?bWZ4OHpXRDV2WllDVlZxN1c2RnRIZHdRekdoSXlxVHJneEk2Z3V4YS9pWjU4?=
 =?utf-8?B?WFlORGlLT2VGTExqelU1YWhwa0dKNjR2aUJsWWtaMWtxUXk0RXBwMVRKOVpk?=
 =?utf-8?B?c2NuMXZyTlpGejUxM0ppeDRLN2pDdEV0ZkhxOFBTM2hKUXRWeUx4eFZ2M1JV?=
 =?utf-8?B?VVpCNlBpM0cyUUJGSHJUS2ZmS2FoT2lSOFJnUitFRVZCazArbTFpakNRUzA2?=
 =?utf-8?B?azJMcldUaGdUdlRYSElBMVBtbS9VQ0t1alhpY2RIZ3cwUXQxME9oQzBlSTVv?=
 =?utf-8?B?bjFQWUJ5c1dieXErVXJDSVlaM1hxYW53UXVTMFZtL0FWaWRjZU5UWXVjUzRw?=
 =?utf-8?B?ck5ZMTJyQ2R5M2RodWVtU0FrWjBXQVRHNGtDb3FUUFptdHNFNEdIdkJsWmJl?=
 =?utf-8?Q?Rrtw8ed/BhCSp5/ObKwKVIu31?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FFFE997FF300A44A8B21C3906716989@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a959f2-d6f4-49ea-e1e8-08de1cc1bce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 23:19:15.6375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZexN+k7sezz/paaT5OlkkAuBsPDqPoWhwDobnFMdhtCBW3T8/5x37GP0Q7YU7B6ZQrX0oNa/qaQruzeR6C47dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

T24gV2VkLCAyMDI1LTExLTA1IGF0IDEzOjU1IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gI2RlZmluZSBudmRldl90cmFjZShkLGYsYS4uLikgbnZkZXZfcHJpbnRrKChkKSwgVFJBQ0Us
wqDCoCBpbmZvLCBmLCAjI2EpDQo+ID4gI2RlZmluZSBudmRldl9zcGFtKGQsZixhLi4uKcKgIG52
ZGV2X3ByaW50aygoZCkswqAgU1BBTSzCoMKgwqAgZGJnLCBmLCAjI2EpDQo+IA0KPiAuLi5hbmQg
dGhvc2UgYXJlIHVudXNhYmxlLCB1bmZvcnR1bmF0ZWx5LiBJJ3ZlIHRyaWVkLg0KDQpUaGlzIHdv
cmtzIGdyZWF0IGZvciBtZToNCg0KbW9kcHJvYmUgbm91dmVhdSBkeW5kYmc9IitwIiBtb2Rlc2V0
PTEgZGVidWc9ImdzcD1zcGFtIiBjb25maWc9TnZHc3BSbT0xDQoNCkkgZ2V0IGFsbCBzZXF1ZW5j
ZXIgbWVzc2FnZXMgd2hlbiBJIGJvb3Qgd2l0aCB0aGVzZSBvcHRpb25zLg0KDQo+IGZ0cmFjZS9i
cGZ0cmFjZSwgbWF5YmUgdGhvc2UgYXJlIHRoZSByZWFsIHdheSB0byAidHJhY2UiLi4ub3Igc29t
ZXRoaW5nDQo+IG90aGVyIHRoYW4gdGhpcy4NCg0KWW91IGNvdWxkIHNheSB0aGUgc2FtZSB0aGlu
ZyBhYm91dCBtb3N0IGRldl9kYmcoKSBzdGF0ZW1lbnRzLg0KDQpJIGFncmVlIHRoYXQgZGV2X2Ri
ZyBmb3Igc2VxdWVuY2VyIGNvbW1hbmRzIGlzIGV4Y2Vzc2l2ZSwgYW5kIHRoYXQgaW1wbGVtZW50
aW5nIG5ldyBkZWJ1ZyBsZXZlbHMNCmp1c3QgdG8gZ2V0IHNlcXVlbmNlciBwcmludHMgaXMgYWxz
byBleGNlc3NpdmUuICBCdXQgTm91dmVhdSBpbXBsZW1lbnQgbnZrbV90cmFjZSBmb3IgYSByZWFz
b24uICBBbmQNCndlIGFsbCBrbm93IHRoYXQgYmVjYXVzZSBvZiA/IGluIFJ1c3QsIE5vdmFDb3Jl
IGRvZXMgYSB0ZXJyaWJsZSBqb2IgYXQgdGVsbGluZyB1cyB3aGVyZSBhbiBlcnJvcg0KYWN0dWFs
bHkgb2NjdXJyZWQuICBTbyB0aGVyZSBpcyBhIGxvdCBvZiByb29tIGZvciBpbXByb3ZlbWVudC4N
Cg==
