Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E09C2DCF1
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5174D10E452;
	Mon,  3 Nov 2025 19:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n8XI2eP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55B210E21E;
 Mon,  3 Nov 2025 19:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Ihz/vM/470Ja0AJtalDUTdzLqEM3NX/HsuTwcZ75yet6vrOY2D62WMh0P6jRU0NYgv3cww3cJlgTWnaQlxuf4VfJ5m+Whyld+6w3dGPwcynWxMBLyeLtEgm898yU4/7dCVB5Yt0SUNLHOJMCBOj+xcx6b2vHmMNAVBlrLTXlWxXJtaDnXp/JJuyqnAjzvTwiLKmlYkK4jxi3N7+2bZEITUn7nTgSnuaJbHI1Vka6mF64xT6UteaaVaWIHj73MWPWgWTgypVlHT50T8bXgZycJSSpV3PI7IPcYPqphyuhI+ujpoeq3q9iU8UBRv4UyuRLmdDsiGqH3kfMlblMC5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSlr74Sa5/Fi3wZlYup5xBHTSygMH0Nma3frC+8s4Lc=;
 b=v7SwUTj0wTQwJIX7ztTJeB9svcPAV9jO7jAiJlzd9skBq2GSiLGjAB/+o+EETAWfPYMX06zD7P+NB8n3gm8pp/ku5r6oa8GzSceQ6xTErhmueg7oNTIheuG4YSMKWIqsTd/2KmwefkPspzinXKpFVXlPwncb1dGZd/SeWo7z/o6xEFHEbtVCpfc0UNrupr+OrBk48sfAUn1vf5ND4Gqzqi9kx3+WeTRxNLAhuxloneAZIddLt0UAVYwaCuJYtn522jNbpOufYECL2RiKJm+Nr4HnY7/0hwDisz0oQmkOGiuq7FRAojudeVgtJ4OP8LsYkQfo63VYO1DAlp3IxEtwbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSlr74Sa5/Fi3wZlYup5xBHTSygMH0Nma3frC+8s4Lc=;
 b=n8XI2eP46oxTVNLt9b3/L5vZpYa+J1lU6uTL30mVHHJQ/SA4gCpDoxfGJbr7tJyotpb2/bfYcbn8/T6vFmDvDz8rLCTGu7tiMoKvenrspAPO6VU42sjmUJ8uSRDYVbhsYhFiJNj9RcyX4Vk/4o1mbTwVnST6ZqOm+MgbnOTrSHC3OMGDV3isyoYn1vyUSSxt36EWj4nUn4qDQ7cJKVAhrUtzUSQo2rR4GkVZ7Z7QLb12NiT/jZmjqBgPecMJ7QwENFDrRRvk70CG/zHsZfYXlN/JKMMW8Yuq5JaPtula3xE8lEY16h7IQM1Idjr0j1+sNtkRpz1xxDxgM06ZV94uUA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 19:12:03 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:12:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "joel@joelfernandes.org" <joel@joelfernandes.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, John Hubbard
 <jhubbard@nvidia.com>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair
 Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
Thread-Topic: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
Thread-Index: AQHcTFS68gByFr2Zi0ueHSWgFUqs87ThUs4A
Date: Mon, 3 Nov 2025 19:12:03 +0000
Message-ID: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB7987:EE_
x-ms-office365-filtering-correlation-id: a36d133f-8046-468a-3aa8-08de1b0cdf4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MCtoRC9zTnhTSnQzUHc5d3k2bmF1cno1UXJhU3Z5Ujk5QUtHdjJENTRHQUI4?=
 =?utf-8?B?akd5ZWcvWnNWRWhYWHB4c2ZYdjBUWkNqcHY0V1piMFNzVTU0cWJBMGpldFVI?=
 =?utf-8?B?NGx5azlUTXNUY2FPL3MxeWl5UzFQZU5ET05wdGo2eVhxYm40YWZEUlpxbS9H?=
 =?utf-8?B?bjVqOHVvUWxCSy90VnZRTkFXN01QaTgvQmlBamxYM3hVSWJVclJFcW4rRHVz?=
 =?utf-8?B?SDhTTVYxeGpOcnpnTmdpMU1qTnpjYUY4THBEOWVCUnR4eVBVODgwb0daYXpQ?=
 =?utf-8?B?TUlOeXZnZFZvRnRhZXNQSjRMRnVtS2FVcHkvSmlWTWlFUUVhNlFnbU9vL2J3?=
 =?utf-8?B?cFVMa1U1SnIxRkpqMSsrYzFubHJ6VGFMWGMzZVB1ZUZWazFCZkc3QURhaWpt?=
 =?utf-8?B?TmlkZUY5WkR2bUNYVGV1Q2p0NzhUTS9jeHd4VGNKbEw1clJQSmhpZHE5WWF4?=
 =?utf-8?B?b3JPamNpSHRsOXdxTFNCdVNaQkhpaENMYzM0U0hmOFRPS0hDdVFhV3JkSElu?=
 =?utf-8?B?NSsvQU5iSHh0ejlMZW1IZ1p5UDUwMk4xWndFVS8rcDFBNU9wbmROVVkzSHp6?=
 =?utf-8?B?UjBKUDZqOGZYK1d6bnh6bVMrWFA2T0pkY2JXODJvVnEwbmlhZlFGNGE3Nk5w?=
 =?utf-8?B?QTcvbDRta1Y2b09Qam93eUFjZEdEcDM1eDFQeExHcUN2UXk5RVJvcmU5VjQ2?=
 =?utf-8?B?WmdIUmo4TTFiRW0zZStvZ0pRcjh5M2FmWmNjVE9SazB0bWR2bllDYVNkWWhI?=
 =?utf-8?B?TE9XYjVKVU5qTStDN0srQnM2WGV3S3QwcjdQOGQvcnV0VmNMUHk5dWd6UlhX?=
 =?utf-8?B?SnNXdkhQMHh0VVFFUUpqN0FWcnF0TnBIcVNOQmh3QjZERGVBVW5tRFhxU2wy?=
 =?utf-8?B?dmgxTEwrWUNjYmJTMmdxZG0vYVQ5U25aY2NZTDBlbWdvbkswMW9KMXV3aFdL?=
 =?utf-8?B?MlJPb0dWZHB3eHJTbnI1UXNVQ1l6RUozWElna1Y0eHczSnAwMHIybERQK1NM?=
 =?utf-8?B?R3N5NnBDM1BMaVNoaDVTdXVrN2VaalNhOFYvWU5paU00QWx5SnpzTVI4WUVt?=
 =?utf-8?B?bENVQ1VHS2lrVE9iWENiT3pXb3ZFYkw3VW1xNi9oNXdpV1BZY1VRNVBQTzNC?=
 =?utf-8?B?MFRSSDhVOUY3NkRlM3Z3eTJWOExSRmlIN2Y4K2w0b2RxRWRKQnRubWk0WnpJ?=
 =?utf-8?B?SE9CYVdUeE42SDZpS3ZFZ0tlM3I1UGlwcGJLT3FzM2U4UjEwNDdRNU8yempK?=
 =?utf-8?B?em9CdTFTaHFEcTVhNHlUdGFtY0FJN0poL1Qrbm9DUmtJblJrUkFyQ0x3a0ZT?=
 =?utf-8?B?TTdjOTRNa3IxcGtlSm9jeHlXeFk5d3pwWk9JUVpYZnB3QXZjYlhFMFdGYVE3?=
 =?utf-8?B?ZVU2aWVqS1JTVzNCRnEyWm10eW50NGxybFV2WTlLVFBQZ2ZGeWsxblovWngz?=
 =?utf-8?B?VHpSRkl2S2k2WDBPQnZsRDdSSlhWemcxTGJXRFZTVGJnbkJESHZoVnpYNVMy?=
 =?utf-8?B?dnJKR2NiSUprbkJaNytxYmI3a29YRUdQbHpxbldzS1J1c2hyeW81RzRySGc3?=
 =?utf-8?B?MC8wMWJOdGJSQ0ZmY09HRFFGR1JSQitpS3AzTFo2SmhqSlhLRmlNLzBwbDdZ?=
 =?utf-8?B?OXZVblNiclBjNVdXNnBVRE1XcE1FN1lobHpEVm5LVU1LTlZXYUNLNThucjNu?=
 =?utf-8?B?RjRjb0xpU0pXRWZuMlU5ai8xWnhQNkNOcm9wNFZCMmRWa0txRWJnR0luMzlj?=
 =?utf-8?B?R05aZlpCS0pDZWxSblF2RjVQd21rRkNLWTR2dVY2NUUrOGxFalhteGFoYjVq?=
 =?utf-8?B?WHYxeFNlU0RkVXpJdHd1TUJlanU0N2IrcXQ4WFYyQmRZQ3VsM1NwckpGaVFH?=
 =?utf-8?B?MzBNUWxsOElIQ0NQdUlTRHVDSU5HSXlYNzJXa2VqS0lFU3libU43bjJBRzdF?=
 =?utf-8?B?QU94S0VSYjlKM0psT2VSci92T0Mxb3NDS21IT1A2WjEwTDVVbnA4NjExS0lw?=
 =?utf-8?B?cVNTTjR1MG5CRHRrMkY0UDliamNzcDNOUzc1SlhmbkdGWXloKzd4R29SSUx2?=
 =?utf-8?Q?7i7z1e?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmpLV3lqeE1LVEh4QjRQK3UralMvREJKdUF2d3F2bDM2TnU1S0RsZWJJOGFp?=
 =?utf-8?B?d0t2QUhnbjlsclU2MXJ0VXkyRUxiUWt3bHJ6a1BxcHU3RldJc2NVSmltOERY?=
 =?utf-8?B?dkRWa0xaOUYwRTF6TnZuMWhxSmxENnF1VWI1aENESE1jSFZmSkRLK2VJVUM3?=
 =?utf-8?B?aHBSWXVnSTh3RGhtRVY1Y2F1Y0lCMVlJelEvZzFKUWxkZmNtTElQWDY2aTFs?=
 =?utf-8?B?dEdwM0N3RUNlZzZWaktaem1rMUtueFNLc3BQai9xT1o5SEdoT0tEQ053TGR5?=
 =?utf-8?B?STNoWVQ1Y1hYQXpwREVNMGUzRTFPeFBiU1N2TUs4VGQ2UGJ5QXR6MVArbGVs?=
 =?utf-8?B?dDEzSTNMRis1SmZCeXlCREE0d3dWME80eE1OaEovd3VJcU92R2NPSTBxYWN6?=
 =?utf-8?B?MzAyVXR3bjJUQ3lJcGsrOG9VdWF6c0o3MEpDeUZkUFZydllhaTFEMURhaExS?=
 =?utf-8?B?alAwTmI5TU1CQ0E2ZVphM0F3QWNvWDRyN2Z4ZytnWkhTaGpjUFI2WG9sb1Bk?=
 =?utf-8?B?bzF2dUV6WDVXUW9iTjR6V1ZOeWNtQlBTVGxINXhOd0RwWUJVdmRTWThhM2Ri?=
 =?utf-8?B?VjdDblR4V1hFR1dpekh6d3BVL1Y1TTRIWVpJbXkrTnpSMmRHdXZzbHNNdzFo?=
 =?utf-8?B?R1VGSjQzK1A0NlpkYXZsSXJFYTVKZ21yV09XV2FPSFV0WmJKZXU0RHpYdjc3?=
 =?utf-8?B?OFlxOEhvZVJhOVdOdktXVWRwaDRJd293dmlWOCtHTkJKNmwyMnZaMlpCYVRw?=
 =?utf-8?B?WjlBTzJ4SzY2Q3NMNDE1em9zZTNlQkMvQnZHR3R3SlorK3lMSk1KR2lsdlQr?=
 =?utf-8?B?S3dGYVBFSThGYlpIOXJGS1VrdXZsY1hidExMYitLU2t2bmZlZStsam5IWksr?=
 =?utf-8?B?ck40aEMvcmNaYUZrTmc2bnlvTHB1VE1LN0M2K0hDd2plYlpxMzdHdURNMTRH?=
 =?utf-8?B?emtqRFZ2QmtLTWVjWGwvSlRmeS9ZK0E4QlRpVFBIdTFtSWwzLzR1RFl3aTZQ?=
 =?utf-8?B?SGRYWCthZnkwODkwNllDMm5XaFVZVEIrUWRjWGtqRDgyRWZaaitwUENmWUN2?=
 =?utf-8?B?cG5kcEp5alJjakR1VGhnc0RpL3hvck5INmo3ci82ZGt0akFBOXltKytxVmZC?=
 =?utf-8?B?NzUvdXN2ZVU4VVFNbTZBWk42ZEJlb1gzeDJZcm1tV01XQ2Iybk53TG9pb1BC?=
 =?utf-8?B?Q1NpeStrNXJ5ZjFkd05PaFVoaXl1OFhQRnRhaFNTMUo5VzA3U295OTVhKzdm?=
 =?utf-8?B?aEJrblh2Q3g3d3A4QTBFSVRsL3FCTDM5c01qU3haYUl3SVg3ZjNWN2VvMUxX?=
 =?utf-8?B?WkVVUXhtRjJNNW1oRXQ2dTd1WVJyYUthakowWDFPbXRIRXVFZWFYczlrVnNW?=
 =?utf-8?B?c1BzeVZEK21kejg1OVpLQml2aGFMZmVXbXdGQUowZHdzSldLVVdwd0xOQm4x?=
 =?utf-8?B?L3lSNkdncURYc0lwcWE1cnVjblNrMWRhZmZ6c245WldLS1ZyaTlmTiswdG53?=
 =?utf-8?B?b3J4ZHRmcklFRUZQQ0NhUWpRZ1FjQ0V2ZThKNzJDWk5KWjJlU3dsbVI0eWVO?=
 =?utf-8?B?TmdrUnJhc3dDZVJBMTZXR2tMUHFGUVR1VUpjcmExdUpJcUU5NTZVUWFtajlW?=
 =?utf-8?B?QVhhZzNnbUlSN2l2Z1FkZjdZZ0pCR2NseTZ2c1I1RU5vTFZMM1RyRnBaOUc3?=
 =?utf-8?B?cGJ6UkRPMzlKNEZuMWR4WnhUYWJIY2plUzgwaFZMaWk1Snh5a3pGelN4TG0z?=
 =?utf-8?B?OXp3cGVZRytNL1RXOXZiakFiTHRGRVFIVnhheUhEN2dYeGJmbFl4Rk96WXBY?=
 =?utf-8?B?MFlURHR5amwvNlRyaTR3ZDhwSno4OWhpdDhJRTV2c1FuOC93WHJsRnFVMFlu?=
 =?utf-8?B?K0xIam1JRmtqR1hWUWJlTk9uN2ZHZ0llb045VGRxN3dYUGdIRWlNMjBMdUxC?=
 =?utf-8?B?ZVIxeXJxU24xVyt3dUVjbmQ1NWppUTM4aGpqU3dmekZKMVRmeXAzMGEzTE40?=
 =?utf-8?B?NFRLK2YrcnV5SU9obEZkWVFtaE5kUkpielBMaC9ZeStCTU1lNFZFK1h1cFB4?=
 =?utf-8?B?cUM3b1UySUZpcTVHUTgyVHNYREJ1V1NpQmUzdlovVG05U0VFYUdyZDhKQVhu?=
 =?utf-8?Q?v6f/u6+XRGoD9D7puwX483IbT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D4ADDACDA576042B6490601CC505929@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36d133f-8046-468a-3aa8-08de1b0cdf4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 19:12:03.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rgPEGVTGBU4UVxhEY+blWDunaLczUk3U0mPgsbyI7QZ0m8pgpAjuYbfdnxKPz+2sjDadZXWEs2vy5+zSlN4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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

T24gU3VuLCAyMDI1LTExLTAyIGF0IDE4OjU5IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gSGVsbG8hDQo+IFRoZXNlIHBhdGNoZXMgYSByZWZyZXNoIG9mIHRoZSBzZXJpZXMgYWRkaW5n
IHN1cHBvcnQgZm9yIGZpbmFsIHN0YWdlcyBvZiB0aGUNCj4gR1NQIGJvb3QgcHJvY2VzcyB3aGVy
ZSBhIHNlcXVlbmNlciB3aGljaCBpbnRlcHJldHMgZmlybXdhcmUgaW5zdHJ1Y3Rpb25zIG5lZWRz
DQo+IHRvIHJ1biB0byBib290IHRoZSBHU1AgcHJvY2Vzc29yLCBmb2xsb3dlZCBieSB3YWl0aW5n
IGZvciBhbiBJTklUX0RPTkUgbWVzc2FnZQ0KPiBmcm9tIHRoZSBHU1AuDQo+IA0KPiBUaGUgcGF0
Y2hlcyBhcmUgYmFzZWQgb24gQWxleCdzIGdpdGh1YiBicmFuY2ggd2hpY2ggaGF2ZSBzZXZlcmFs
IHByZXJlcXVpc2l0ZXM6DQo+IFJlcG86IGh0dHBzOi8vZ2l0aHViLmNvbS9HbnVyb3UvbGludXgu
Z2l0wqBCcmFuY2g6IGI0L2dzcF9ib290DQo+IA0KPiBJIGFsc28gZHJvcHBlZCBzZXZlcmFsIHBh
dGNoZXMgKG1haW5seSBmcm9tIEpvaG4gdGhhdCBoYXZlIGFscmVhZHkgYmVlbg0KPiBhcHBsaWVk
KS7CoCBUZXN0ZWQgb24gQW1wZXJlIEdBMTAyLiBXZSBhbHNvIG5lZWQgdGhlICJncHU6IG5vdmEt
Y29yZTogQWRkDQo+IGdldF9nc3BfaW5mbygpIGNvbW1hbmQiIHBhdGNoIHdoaWNoIEkgZHJvcHBl
ZCBzaW5jZSBpdCBuZWVkcyB0byBiZSByZXdvcmtlZCwNCj4gYW5kIGl0IGlzIG5vdCBuZWVkZWQg
Zm9yIEdTUCBib290IG9uIEFtcGVyZSAoYnV0IEpvaG4gbWVudGlvbmVkIGl0IGlzIG5lZWRlZA0K
PiBmb3IgQmxhY2t3ZWxsIHNvIHdlIGNvdWxkIGluY2x1ZGUgaXQgaW4gdGhlIEJsYWNrd2VsbCBz
ZXJpZXMgb3IgSSBjYW4gdHJ5IHRvDQo+IGluY2x1ZGUgaXQgaW4gdGhpcyBzZXJpZXMgaWYgSSdt
IHJlc3Bpbm5pbmcpLg0KDQpJIGFwcGxpZWQgeW91ciBwYXRjaGVzIG9uIHRvcCBvZiBBbGV4J3Mg
dHJlZSwgYW5kIHdoZW4gSSBib290IG9uIGEgR0ExMDIgSSBnZXQgdGhpczoNCg0KWyAgMzc2LjMx
NjY3OV0gTm92YUNvcmUgMDAwMDo2NTowMC4wOiBOVklESUEgKENoaXBzZXQ6IEdBMTAyLCBBcmNo
aXRlY3R1cmU6IEFtcGVyZSwgUmV2aXNpb246IGEuMSkNClsgIDM3Ny4xODgwNjBdIE5vdmFDb3Jl
IDAwMDA6NjU6MDAuMDogR1NQIFJQQzogc2VuZDogc2VxIyAwLCBmdW5jdGlvbj1PayhHc3BTZXRT
eXN0ZW1JbmZvKSwNCmxlbmd0aD0weDNmMA0KWyAgMzc3LjE4ODA3MF0gTm92YUNvcmUgMDAwMDo2
NTowMC4wOiBHU1AgUlBDOiBzZW5kOiBzZXEjIDEsIGZ1bmN0aW9uPU9rKFNldFJlZ2lzdHJ5KSwg
bGVuZ3RoPTB4YzUNClsgIDM3OC4zMTU5NjBdIE5vdmFDb3JlIDAwMDA6NjU6MDAuMDogR1NQIFJQ
QzogcmVjZWl2ZTogc2VxIyAwLCBmdW5jdGlvbj1OT0NBVCwgbGVuZ3RoPTB4NTBjDQpbICAzNzgu
MzE5ODc1XSBOb3ZhQ29yZSAwMDAwOjY1OjAwLjA6IHByb2JlIHdpdGggZHJpdmVyIE5vdmFDb3Jl
IGZhaWxlZCB3aXRoIGVycm9yIC0zNA0KDQpBcmUgeW91IHN1cmUgdGhlcmUgYXJlIG5vIG90aGVy
IHBhdGNoZXM/ICBUaGUgUlBDIHBhdGNoZXMgY2FuJ3QgZGVwZW5kIG9uIElOSVRfRE9ORSBiZWlu
ZyB0aGUgZmlyc3QNCnJlc3BvbnNlLiAgR2V0dGluZyBhIE5PQ0FUIFJQQyBmaXJzdCBpcyBub3Qg
dW5jb21tb24uDQoNCg==
