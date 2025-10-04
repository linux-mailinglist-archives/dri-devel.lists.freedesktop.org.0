Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD59BB8FA5
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 18:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2D610E22F;
	Sat,  4 Oct 2025 16:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A021f0ya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013064.outbound.protection.outlook.com
 [40.107.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7498410E22F;
 Sat,  4 Oct 2025 16:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h//B8GkG3mN8QXTm9TRqNwUwzQhxjw82jM1uIXKzpR6CmI/Qx6kNxv41MT8AP9EPOMFOYZOFFpC0OmvTUxRShJYZGkFfMZqkdhqSqDtddKXKSbzSFSbZbi816tcSFAxMHwPk8ECSvbCvX6ybGddYq+J5d+4MJwuLInNg488FvdWCnfVmu8qqwqOuYYZx+/EAE5ACyfWRmyVVOKViMlJYxbl1ZJe0fiVXNknBC4zT7ydKvBdQD/ZT+fN9ShA83P1bmsA4Uvpb7AX+d+54tjJeQwgnsCJV79RgKTt6aityZmr4Fni7l58o2a+P9Jmaaz35z7QXy+qqdRkL/cT1riqYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE2Gy5lwO70RHbOeONWH6bDzDpRSPArcIFTjgI9cHuU=;
 b=PFkvPoKat5+MF0YoVVRqj/jFGX4B+qX+2AEkKJkr7YfQkHDmJ6ZcZOtXdfZFsoeYRmNhRZaKj63lBiGA7jTVtZX5LKHWiPlrdQlE5DLJ4EzvPO9SZLorMuNYWD8AYEE9ntPoOs6pZFVQTrgayZ7eu8FZv9Re/p8iVHqLgJjXcX8NRggUsa2ohZx9kYPE/9/qf/EIs5Dnh8RsRFAz73xZUrZpWjtTvEqIAsTDfHDmLyY+v+qlDDx7MhirKZ6D5V3zi8j2jbmG7WXyq+SbGViDCbcrC6sMzloZxbUxalBsUeBkE/UVWESrlO+bKduPIClfGTZm/8XfzhiyCf3DPFsegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE2Gy5lwO70RHbOeONWH6bDzDpRSPArcIFTjgI9cHuU=;
 b=A021f0ya/TRiBvDK9lOUPrKOo2i2cvuA42lgTr9fUxzEKVJL5WjS5vwCtKuf38+EFhjDtKFS/YWO7ZsFQNiFrIoUc4Ow0LWEKnsykbGfJs89RyiebqU+tC+V4V6TpDUtxXggLFbeW80k1aZwr+80qC1AvlXvV/hx/ahcRGLzVno/DXpPZlOosLmotrRNffBmf+ENQO7G+oN0BicW42+GbvSr8Ys2hA4/GrqieGwhS3o1KGZpvcX0hiGigUer5g0kOA/SJhcYvDTt91hp5zSlekgC81pLJ4XCrF4xwLEu+s0TIdC3OcvtG4byEClPflHWDBCPnEiVFL7rnsKdT6vulA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Sat, 4 Oct
 2025 16:14:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Sat, 4 Oct 2025
 16:14:17 +0000
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
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov
 <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Andrea
 Righi <arighi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
Thread-Topic: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
Thread-Index: AQHcMhju1ljLznsiDEetzKjrDHxfc7SuFx4AgAJ4GICAAJrrAIABBYt5
Date: Sat, 4 Oct 2025 16:14:17 +0000
Message-ID: <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
 <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
In-Reply-To: <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH0PR12MB8127:EE_
x-ms-office365-filtering-correlation-id: 74d730e4-63b1-4c42-5a5e-08de036111b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M3FiN01Kb09Wenp1Y2pQZGlDcTRyQ3lEc2xEVGNxNGcrVzE1WEFoLzcxaysz?=
 =?utf-8?B?RWdiRGRpTkZ5cmxPYzR2U2NXSkVTTWpoNG9MTjcxWmtmSnk4Y2RoKzU3Szl3?=
 =?utf-8?B?VWxLN09TcXlrM2Y4SDhXNmRhTnEzYnI3ZzR5MElYaGJIMkV0NEJ3ckpGYnVJ?=
 =?utf-8?B?bWxIdStnOVk3bTRxL2VyeDlxYmNER3diQURFb1p1OGxaRWNyRnNtTHBoTWIv?=
 =?utf-8?B?WUZIbzZ6UEFHRXA1a3NjNUFVajFYZnNBaFZrNEl2dzVqblVUckFSL25qWXoy?=
 =?utf-8?B?Mk9yUXFLaTJmL2lHWWFwUWIvczEyTERTSVFKcXB6QU9Sd1RjVW9hbnRDYU1q?=
 =?utf-8?B?cjJHa28wSnJCY3ZYQmRrL0pXQWZGaGh5cDQwdHJ4cTVKN1hyWktiSlRFMWxE?=
 =?utf-8?B?aWUxSlFhRnl0bW9ycmpjMXBhOHlvZzdxRWhFYU9IVlptRmZNbThldjZiUndH?=
 =?utf-8?B?LzNzL2dJY0EwNnVuNmQzWjJSeGJxTUpXZGFtVTBJUkJlSmR3LzBZL0UzUHFX?=
 =?utf-8?B?TXdYMzYyMXN6VlVhMkNaQ0xuWXpNRVJzRFRlV3JTYzlid21Ta0pOSVFvSXVL?=
 =?utf-8?B?Wi9TQ0FBdURTVWJvNkY5TmRoWXpnRXA0YmYwODYyRHZ3enc0R3FyVDZwOUVT?=
 =?utf-8?B?clRpT3pXQjM4a05iZHRDQ1ovOCtWS2NzeWdEOFY3SkMvM0l1YWlONE85U3dm?=
 =?utf-8?B?OTlWVUNLV0pYRlJOSTRQd2paL01mcU9kM1F2eWlONjMwSCt0U2xJejUxRGZo?=
 =?utf-8?B?a1UxSERrKzZsTVEvZnpibkIzcy9PYnlraFRENDdUaFdGUWdoWTk5clJRM2xz?=
 =?utf-8?B?bkhUOW1GNCtDT1Exb3dpUzVPM2RBYlJERFJWanFvRzRDc2tjam9tVEx3anBL?=
 =?utf-8?B?THF5VFBXNlA3VzFWL2tnNGFDZGVCc0J4Zk1HVjl2SmRrYzVZQ1k3MkhFY1JE?=
 =?utf-8?B?TEVVRHgxRlc4bml3M1dValJNWnplU1d1T3FDWUJ0OU1QeXZ1ejJxWUpYMXBH?=
 =?utf-8?B?THdBNUEvN2QvUmd3Mk5ZM21oQVhPSy9WVktaeTYxcTN3Ujl4emlvVVFUTDhD?=
 =?utf-8?B?a2MwejRFQTRWOFBhUW90UnVPUUQwSGlHeWtCK1pqeE95K2dXQU5DQjNibDBP?=
 =?utf-8?B?T2pIQ244TDB1clJ4SWpTUWVyeXRJY1BuUjcySG1TU2paN2NWam9zckFUYXg0?=
 =?utf-8?B?UDhBNHdUcEdZY1JQSVkvT25ZeEh3NTlqOVE3MldFa3ZVUk5XRG5FQ3V6cVAv?=
 =?utf-8?B?R3JHYVB1NGIyNUxGaDI2b29MY0lJTEtXSnNZUC93cEhoUTdkZUtxYVI1blBQ?=
 =?utf-8?B?YW81YzY0TmpvU0VFZE1VMmNId0hSZVRKQjRaTXBBSXlTcTBoRGM2THZKb3FB?=
 =?utf-8?B?QlZmVkw1cXozS0dOZzJFV21QdHhmUW9yUkNOSVNBdzNRQ2hOa1JZZEs1QzJH?=
 =?utf-8?B?b0RDVlRWZ3krQlB1VWRHSFpNdVdiRERrTHI0NDhLcjVJUVdCaGtxY28zMS8w?=
 =?utf-8?B?cWpUWFQ2a1pDQ3ovUWgyQWR4SDFVZk9hMkg3MzZ3MVhFV2l3eDg2YWJzY2FR?=
 =?utf-8?B?TUlBYTE0ZUd2MzVjTU1RTGhYaXRXenJsKzA3V2U0QWJHaGdsNGhnelJ4cW9S?=
 =?utf-8?B?OGxIM29wb1poZnpXV1dUVzU3cmk5VHJuYTJlV2pNdCt3VW9Ya1o0Zjl6dCth?=
 =?utf-8?B?cTl4dWduTkZ6c2ZMekR4SkdMcmxVRTI4WTRFZHNvYU90WWs2NlZSa3FRQnlS?=
 =?utf-8?B?cTk1S2l6cGk0a2FJSmNMK0FRRlYxcEFiL003Qm5NVWNZYXpjRnVVTWZ0ZWVm?=
 =?utf-8?B?aituL3A1blBNMExJUFpXNnZDalU2Q3ROclZ6UTJrdEJNL01pczZGZDNZZUkr?=
 =?utf-8?B?YkZtZU9Cc2VLUWRoKzVZZHQyY1BUM1p4WUF3N1o4UXhjSDFnTTAzR2YyMSsv?=
 =?utf-8?B?ZWxDRVBGOGphOGZ3VUVHWnVwQ1BEZlZoMis0S1V4Yms5OGgzRWUxa1MzbFQz?=
 =?utf-8?B?L2l5OGk4b1FUWktSdDJZM0lYbGdBazFiTXdHM3ptU3VVZzNTTGx2MmZ4VTRa?=
 =?utf-8?Q?ADiUDt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2lMTWpubFdZR0F2MHNkSHBBd3I4emFCQkRRQTZ1NDcyY1VyQ0Q0VStBeUtt?=
 =?utf-8?B?SG8rNG1VNEF6YTh2Q0JDOHptWEVtR29mM09qMjUvbVJuMjcxd1E1VzYyVTI5?=
 =?utf-8?B?czJ5NFZzZnBMTFA1Mk9KMjVJY3l0Z0Uwc0d0YXJkQjVERkx0MW5vS1dZRGJp?=
 =?utf-8?B?RzFTd2U3d3NMVEtWUHpGTWlQTUpwbElEVkY0TGR1MFRrV1JBNUI3eDFsd1l6?=
 =?utf-8?B?TVhGMVlwc2xrR3BwaU1xcGxXelo4VFZLZ0FPaDBZZGplR1crQXlObHdVa2Nm?=
 =?utf-8?B?MENkbm1SMHl4UzlmODlrQ1RGUG1hTUFNVDBoVHJ3blo0UnVoMXFTbExsd0Fh?=
 =?utf-8?B?Z0gzVFRsandKRCs4OEV0YkdNd0JDaFNNTVdoaE91RXpaNDhpa1pKK2x4Tndj?=
 =?utf-8?B?c1NJL2hwSEErL0lYZWZpazFPcTVBZmR6QjM0c1BoS1ZuRHk0ZG5TcVNaZy9s?=
 =?utf-8?B?SldieDFTUkN4Q09sK0F1TWRGOUhvZlNISWVuYldVYWRqenl4eGRLQmRuLzl5?=
 =?utf-8?B?cXFORkkvd3QrcE52aElSKzdTMUhvTW9kOFJzbmtwSzJvNG5uVWVkNzRiVFFP?=
 =?utf-8?B?VHlBWWIzRk9KckZWNjNkcnI5VWxZU2x1OUo4S1FLOWFmUjdIdVNQOURFMHJp?=
 =?utf-8?B?eEFrcWJrWncyODNhMHUwNnk1Z1Q1cEZycmZTUEJ0YTV4bWphem8wL3FqRjgw?=
 =?utf-8?B?OGl6Q2ZQSDRoTWIzbWkwNStCOWxYL3FYOFpDSFl2SEowU0Z6YkpTbkx5Y2px?=
 =?utf-8?B?bGJROHRVeHlSWnZHdTRtRFhmMlgyTmd1RGsva1VLNVdacGZONTM3b1ZQUUw2?=
 =?utf-8?B?Mzdsc2pPb3ZBOFF4MmQraWs5bjFHMVJuVStnUEtKWllPYzFLODh3Qy9DZ1U0?=
 =?utf-8?B?MSs4eVlIejRRdU40UVI3R3ZlYzJYUEdIN0N2b2pjN0tIOFcwaFl2SXlnYktE?=
 =?utf-8?B?WDNUNUlpSE5ETERHV0c1eitwbndhWUZ3bDc2WW1DSm1HWWY1QTdsdFZqSWxJ?=
 =?utf-8?B?QTlGOXhsTUdNWVRsNHY1UmsrdHVSMGtpZ0R2MWNxS0ppT0VFZHAxYVNYTTky?=
 =?utf-8?B?MmphbGRRcHZMbkF2TlFWbHZJajRjTDI1aEpRdHpmN2xwcVF1Qmdid1JtV0Qr?=
 =?utf-8?B?Rmd3WTlkS1UxTEpQSUppQlVzOHNlZS8wN3d2aHlnbjVPRXlMV24xcnFyNGl5?=
 =?utf-8?B?VGxPYWlzbUM4NHZZVEdCeDFTdUVFemE0dlBPcmhlRkVJNk5NWURDN21Jd1Y4?=
 =?utf-8?B?S0xJdFIrNjNueDZleFUreDlFcTJXMmtXNjgrNnJzNkZvdWFBMTk1a2crZStE?=
 =?utf-8?B?VUJ1aDVGSFN0bThzeFNpSy83RVZKRUdNNE54UU5mWGpvZU1CbHg5T3BxZDZ6?=
 =?utf-8?B?bGk5TmErbFlUb3M2bWg5REhnZGtyWndpZTFiQVEramJPR2NkdThZWWk0citH?=
 =?utf-8?B?c1RaZkVjZzJuTW15TG1xVFZnTWQ3dTRrT3FMYXNBZGo4TFAvYjI0aDFiUmVE?=
 =?utf-8?B?MUJMd0NNMW9VK3ZRTVBramNzblhLRlhsdkZudzcyYkwxQ1ljSS9xVWZkVDNs?=
 =?utf-8?B?d1pxcmVyVHZjODYvOTBTWUVycTVKc05hYUJZZXhqUGNtbHd3dWo1NGN5NVZH?=
 =?utf-8?B?aDBLcklJS2RXUUZvNDV6V29UUWtLcDkzeG5ZbkZQVEZpMnNjVzJ0TkZZSzRB?=
 =?utf-8?B?L1p4MjZnNnJMeTZhOG8zYldGWUhEZEJuVUtTaXJBS1B6M1dqV1cyQ1VwcElX?=
 =?utf-8?B?b0JwTlcxOTJMQkxINUgrcnZaRWkvVUM2VVZUV0pWcTZ2VE1VRFREUlE3cDhM?=
 =?utf-8?B?NW9udkw0Y3daQmltVjd0Qnl0cmVseW5paTRib1ZqOVMvUFdLaVRFTUNqeHgv?=
 =?utf-8?B?ZVAxYVhia3Nvem9JQnBud0JVbm1DRmVSeGZrYnByYm9tZmtlbUhxSHhodTlK?=
 =?utf-8?B?TitGdzN2QzFSL3RuS0VzWENDd293eXdCQXZJaDdLMWtsZ1NQSWRQcXRrTy9p?=
 =?utf-8?B?U0hjOXRxYXNDTjRRWjByL0FIM0hQTmVRZ3g2dFV5UFF1TzBpbzF1eXFRcXZY?=
 =?utf-8?B?S25GMVlaVEZKaGsrc2J5S1EwVE1KSFQyc21qTGpZOURUN1djQ3pXQ3IvWEdx?=
 =?utf-8?Q?QhxGcKT++ISYmjNepKHpGJ4VW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d730e4-63b1-4c42-5a5e-08de036111b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2025 16:14:17.6562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIOHrHRjHL5jGeA2ZP9gmO0qx3sLTf3I/TSAfnP7paCZciNA0yf0cR2qA7R6/9JoveV7bL0UfKoBYLzEBC9ewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127
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

DQoNCj4gT24gT2N0IDMsIDIwMjUsIGF0IDg6MzjigK9QTSwgQWxleGFuZHJlIENvdXJib3QgPGFj
b3VyYm90QG52aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gU2F0IE9jdCA0LCAyMDI1IGF0
IDEyOjIzIEFNIEpTVCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+Pj4gLSBUaGUgcmlnaHQgZmll
bGQgaXMgYWN0dWFsbHkgd3JpdHRlbiAoaS5lLiBpZiB0aGUgb2Zmc2V0IGlzIG9mZiBieSBvbmUs
DQo+Pj4gIHRoZSBnZXR0ZXIgd2lsbCByZXR1cm4gdGhlIGV4cGVjdGVkIHJlc3VsdCBldmVuIHRo
b3VnaCB0aGUgYml0ZmllbGQNCj4+PiAgaGFzIHRoZSB3cm9uZyB2YWx1ZSksDQo+Pj4gLSBObyBv
dGhlciBmaWVsZCBoYXMgYmVlbiBhZmZlY3RlZC4NCj4+PiANCj4+PiBTbyBzb21ldGhpbmcgbGlr
ZToNCj4+PiANCj4+PiAgICBwdGUgPSBwdGUuc2V0X3ByZXNlbnQodHJ1ZSk7DQo+Pj4gICAgYXNz
ZXJ0IShwdGUucHJlc2VudCgpKTsNCj4+PiAgICBhc3NlcnQocHRlLmludG8oKSwgMHgxdTY0KTsN
Cj4+PiANCj4+PiAgICBwdGUgPSBwdGUuc2V0X3dyaXRhYmxlKHRydWUpOw0KPj4+ICAgIGFzc2Vy
dCEocHRlLndyaXRhYmxlKCkpOw0KPj4+ICAgIGFzc2VydChwdGUuaW50bygpLCAweDN1NjQpOw0K
Pj4+IA0KPj4+IEl0IG1pZ2h0IGxvb2sgYSBiaXQgZ3Jvc3MsIGJ1dCBpdCBpcyBvayBzaW5jZSB0
aGVzZSBhcmUgbm90IGRvY3Rlc3RzDQo+Pj4gdGhhdCB1c2VycyBhcmUgZ29pbmcgdG8gdGFrZSBh
cyBhIHJlZmVyZW5jZSwgc28gd2UgY2FzZSBpbXByb3ZlIHRlc3QNCj4+PiBjb3ZlcmFnZSBhdCB0
aGUgZGV0cmltZW50IG9mIHJlYWRhYmlsaXR5Lg0KPj4+IA0KPj4gDQo+PiBBY2suIEkgd2lsbCBh
ZGQgdGhlc2UuDQo+PiANCj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEgKEkgYW0gYXNzdW1pbmcg
d2l0aCB0aGVzZSBjaGFuZ2VzIHlvdSdyZSBPayB3aXRoIG1lDQo+PiBjYXJyeWluZyB5b3VyIFJl
dmlld2VkLWJ5IHRhZyBvbiB0aGlzIHBhdGNoIGFzIHdlbGwsIGJ1dCBwbGVhc2UgbGV0IG1lIGtu
b3cgaWYNCj4+IHRoZXJlIGlzIGEgY29uY2Vybi4pDQo+IA0KPiBQbGVhc2UgZG8gbm90IGFkZCB0
YWdzIHRoYXQgaGF2ZW4ndCBiZWVuIGV4cGxpY2l0bHkgZ2l2ZW4uIElmIHdlIHN0YXJ0DQo+IGFz
c3VtaW5nIG9uZSBhbm90aGVyJ3Mgc3RhbmNlIGFib3V0IHBhdGNoZXMsIHRoZSB0cnVzdCB3ZSBj
YW4gaGF2ZSBpbg0KPiB0aGVzZSB0YWdzIGlzIHNpZ25pZmljYW50bHkgcmVkdWNlZC4NCg0KT2gs
IEkgdGhvdWdodCB5b3UgdG9sZCBtZSB5b3UgcmV2aWV3ZWQgdGhlIHBhdGNoIHByaXZhdGVseSwg
YnV0IGNvbnNpZGVyIHRoZSB0YWcgZHJvcHBlZC4NCg0KPiANCj4gRG9pbmcgc28gYWxzbyBkb2Vz
bid0IGFjaGlldmUgYW55dGhpbmcgaW4gdGVybXMgb2YgZWZmaWNpZW5jeTsgaWYgSSBhbQ0KPiBv
ayB3aXRoIHYzIEkgY2FuIGdpdmUgbXkgUmV2aWV3ZWQtYnkgb24gaXQsIGFuZCB0aGUgdGFnIGNh
biBiZSBwaWNrZWQgdXANCj4gYWxvbmcgd2l0aCB0aGUgcGF0Y2ggd2hlbiBpdCBpcyBhcHBsaWVk
Lg0KDQpXZWxsLCBpdCBjYW4gYmUgZWZmaWNpZW50LiBJdCByZWFsbHkgZGVwZW5kcy4gSSBoYXZl
IGJlZW4gY29udHJpYnV0aW5nIHVwc3RyZWFtIGZvciBhYm91dCAxNSB5ZWFycyBpZiB5b3Ugc2Vl
IHRoZSBnaXQgbG9nLCBvZnRlbiB3aGVuIHNvbWVvbmUgY2hhdHMgcHJpdmF0ZWx5IHdpdGggbWUg
bGlrZSB5b3UgZGlkIGFuZCB0aGV5IHRvbGQgbWUgdGhleSBhcmUgb2sgd2l0aCBhIHBhdGNoLCBJ
IHNhdmUgdGhlbSB0aGUgdHJvdWJsZSBhbmQgYWRkIHRoZWlyIHJldmlldyB0YWcgZXNwZWNpYWxs
eSBhZnRlciB0aGV5IGFscmVhZHkgYWRkZWQgdGhlaXIgdGFnIHRvIGFsbCBteSBvdGhlciBwYXRj
aGVzLiBTdXJwcmlzaW5nbHkgdGhvdWdoIHRoaXMgaXMgcHJvYmFibHkgdGhlIGZpcnN0IHRpbWUg
YW55b25lIGhhcyBiZWVuIHBpc3NlZCBvZmYgYWJvdXQgaXQuICBBbnl3YXkgSSB3aWxsIG5vdCBh
ZGQgeW91ciB0YWcgaGVuY2Vmb3J0aCB1bmxlc3MgeW91IHB1YmxpY2x5IHJlcGx5IChvciB5b3Ug
bGV0IG1lIGtub3cgb3RoZXJ3aXNlIGJ5IGNoYXQpLg0KDQpBbnl3YXkgdGhhbmsgeW91IGZvciB0
aGUgcmV2aWV3IG9mIHRoaXMgcGF0Y2gsDQoNCkpvZWw=
