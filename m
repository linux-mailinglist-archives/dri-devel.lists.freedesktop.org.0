Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C876BA82B4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59C410E338;
	Mon, 29 Sep 2025 06:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W64zioqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013052.outbound.protection.outlook.com
 [40.93.196.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851A010E220;
 Mon, 29 Sep 2025 06:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APeiqg4NLtN8cefZ0ryviZz1QB2sPe+id1okaOCjiex6dhF/NQTvW3bNycxwSbyopMRiSQDoVOBXOSEKf93JKx29nFfdIkKH6T8ADkveMxXARdXIAU49F+HOKcdmWcbVRihRb2UWvFF73KwsAd92unxZaCnqo6FhcFFo6GRDmz6R62VSalGcAT1Ecy7sRfTnAOLmDVtYzEeQOTzxpbWmMitT1+NHJMfaFskyrALJBz4xDGa/YGerMJ+g00CNFuuXQ/6AKYMkCo7pT8xxKEos3LrZxf9W1E2Jram1uywW5/fyhVEsmxeN9rMuxrbaAWqIgcoMRgm2GKXLcCrxXALpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2DK98AtKWsyTvpMnFt60SXcXWBWUFYxrOb9G4EUigY=;
 b=TbI/6K7RpUJqAdxB9wPTOR9WU4pOufv8xiLW7tWPda+CHkXRMnSI1a0Vpx3hVoJFgdX0WaVp+sqfPaZWD4NUczUtUAFzjrtYqyIhIJ1gBEobTjVs6kViOo+aGtxp72hdFAPwoJIKslw/xqRk77yCSDVEBu2xxGc/U8j2hIbOYJR96II+7bqbMs52YWT44kremoQ5flIWc336eSbO2bkgMlE+Y+XTGy+1/oBMFS99X8j8H3Qq8i4u8jmUGfkg9h0WzyL01DlQPhYW6QoCZLXdY76Ka3SR8y/CES5toZCWvW0Lxsxq+C/fBOwbEAaz70EEZLOo10kcwu8k+/wwNQVeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2DK98AtKWsyTvpMnFt60SXcXWBWUFYxrOb9G4EUigY=;
 b=W64zioqLPZFzkjdnEnoYTcQxvdJEQkCKD/vDYG4Tn/TJPOkXhqCTFFYevxjJ6EB4vOnRdAjRnlioHREKDGdQXGV/veqY+8N0yV27DejPnMed6P/IxXb8r3nsNRtthkLAj1LXA/M87dyiiZPR1NI3BlS/x234vOfPDw9ziqscUJTp/QKFkik0SCXyxE1fnpP+LiXy8X72hI8CvjNMQgVNFij7bYMgx89KuboBY9cfVqYVZ+n+IPQZbzoYzbyMWKUU1pe1Mngb3oAcWMlBZ56DKNIw661taTLj9KDBIZHuaRsRXb/KzpbJsH97dvlxHvTSnbxdNGuKDejsyAyVZiEg/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 06:47:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:47:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:47:08 +0900
Message-Id: <DD52ZFG2MKAL.35RFN8L4LH5H1@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter
 type conversion
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:1::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: e9390422-8704-49c2-1327-08ddff24043b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RldzUlNEa1EvUlF0YTh1dnF3VVJuTEpuV003dlVSVGFpZ3BUY0NVckpIVEMz?=
 =?utf-8?B?YXZTQTBlSjFiNFRqQkt3MG5mSVNHL3ovNzFMWHdDKzJRK3ZiN1ZqSXg4bHJH?=
 =?utf-8?B?SzZFQVlQc2VONTZkb0l0YTdIeHQrcHpteS9kYVY3YmtqeE9FdkQ4TjRsWjgr?=
 =?utf-8?B?VVBDN1VnT0tISVcvV0RIQk9WTk5YSHVCTWtycmRTcW1hNFNmaDlGMG1CM0dY?=
 =?utf-8?B?Vjh0TzNwMXBkSUd0Qy9xRGR2QlRMTUFZR1UyYVg5WGRjMnpDczNIaC9uN3cr?=
 =?utf-8?B?MUdnUnN4aXdLMEJRVW1Ca0xZbGdkRVBxYW9yMkpBWmIrOThzNWZMMkViNHZW?=
 =?utf-8?B?cFAxdTVqQXhic1dSYWdGNjRZRmxwdVBTWE1EbTdVY2JRNGlSYSs5S2UrZndX?=
 =?utf-8?B?YWEzNGU1VVRxQUt6STkrRnBTMklsTUFTZkFZVit6a0xtT0xhL3dVSjRhNU1T?=
 =?utf-8?B?TTRUNUlWMUoydElCbW9KT3VhMkRBa0lvVlZXbG1QNW15OWxZaXdRZHJsRGZX?=
 =?utf-8?B?dDVIVjZ0WnlVN3ZrYTIySnBITkRoT1ZsVXp6STF6cjdwL1VoUU9GWDdOalNW?=
 =?utf-8?B?MlhrcWE3RVpjaHhVcFlEa1Y1RzdMUlQ4QkZYSXFmN2dRekhUalpjT1dXd1dD?=
 =?utf-8?B?MGErL2szZWVJek1YRjBXV0w2WU5DMFQrNC9uNU5TVVJYMmRSOGI5Ny9tbFhy?=
 =?utf-8?B?TUcwVnpmdHl1cGV0K1pkZytkS1JuRk1wL2dvLzRURVdpcVFVdTBCT210RkN4?=
 =?utf-8?B?VnNLWDRWNE5nV2k2QWlxUDh0V0xocEtsazY2VlB3MUwrVjRVbUN4VFhRMTZq?=
 =?utf-8?B?ZUxqYTFWNzdtOHhnQ3NUZFhDYVhOL25RZENwRkREeVVDVURZRmRxQnY0dUgz?=
 =?utf-8?B?Wm1mYWI2YjRoL3U2WmxCWmpMNzVxRjUraWt4ajJKaFR0VjdOTytYL0p4cXJ6?=
 =?utf-8?B?TXdQQ1dDTGRjc0loSGFFRXBHNTkzVi9QTWtIZUdjU3hKbmNKT2VVejh2QUF0?=
 =?utf-8?B?MURWUnpta2ttMEJ1bW44Tit4dkZ2ZEV1aGFwZFVrQWxkbFByTXhSWTI4Z1V6?=
 =?utf-8?B?ZURxaW9PdXdOUEFzTFdzOUJPdUJaWnFWQlJ6WVRud1VYb2hMcGo5ODRhM2tL?=
 =?utf-8?B?Z2U3cDRpenJNZVBLRUpqYVVoTEY5Z3h0K1ZxQ2N0bGdtWDJ0aFBUWnZOUWl2?=
 =?utf-8?B?ME5YRkFVS1NkcURyVXJYSlcreTFFRVpqN2l4aWxQV21aVUZyNzJnTlI2eUt3?=
 =?utf-8?B?UmFOUkpsZVhjN1lGeW1ORkMrdkVLaWhsLzlMMEY1ek4zUHpQWmxPdlpmZ3lH?=
 =?utf-8?B?TFB5ajRmaWF2cEo4NjFoUyt6OExBK3VuV0tZTngwMGd5ZmxBeWVQTHliaHdL?=
 =?utf-8?B?REhqQkVJQWNGV3VkWU9rQk1nUGNCOWIwOWhDYzl1SVNPNC8xWDIwRDBxODVk?=
 =?utf-8?B?RXhRVjRFL1FVUDNITWJ3M0EwTnVoK0tvUUV2QVFuZmYzN21LWFRRN213aUZK?=
 =?utf-8?B?ZEVTMkwwS21FSDI3d0FiaW40OTRrQkZGbVpCbHd4ek9jMzdwR1E4RnhTMWJu?=
 =?utf-8?B?aDNka3djQnVOZU84MHpCd1dLTEVoSHRVSEtlOU5CclJkNUZUZHpnRVBVdEJr?=
 =?utf-8?B?d04xZGg1WTZDb2xqaWtIazVHQmIxT09SL2t6VmxFMlNldUpDVjh1R3FYcGhU?=
 =?utf-8?B?REsxMmtLVGlINm8weDM5WVlRbm9XdExlY2tvM2o5Q2F4YnVYRUlQa0hPSy8x?=
 =?utf-8?B?bjhYdGpFY3RLV29OUTBNU3FaVmtiTG5LOWRJdDZYTEVhTnpPYVo3TEwrdm9y?=
 =?utf-8?B?V252TnFmanRtNFE0ZStMaHZEaGhDdWF6dXdqWDdseVlOcTI4Y0tySGhHSzB4?=
 =?utf-8?B?TFgycGpFVWNXd2ZnSmZDL2xtbkdwUjk2bWMxWmxiSXo3MVBPc2tQSXF3di8y?=
 =?utf-8?Q?H9w5oJJzyRvno53xLreAr2fZ3/FiNchf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdRaHk0ZFgzOTFEd0FNeWVXQjZFdmFqT3l0K1RkejY3NDlKa0hzMFVKcVVN?=
 =?utf-8?B?bXMwNjczdzR0NUdmNWFQbVV6R05mNkFENm9qaERxdEkyY0kvb255V1FNMDI2?=
 =?utf-8?B?Q3Y0bHRGNEtxc01hZDc3M01wS0ZxTUpzR3hJZTF0aklwWm5VdWZBQmRWQndH?=
 =?utf-8?B?MzFvODg0UnZmdlVZV2Z1d3k2MmhYSUZCRSswUVBQeEFyUDhnazJRUEJwUllq?=
 =?utf-8?B?OXdhUyt3aEZ2R05qcDNZOWFJekhuUVU2LzJrV2hOTUU1UHhNK0tnWUtjVUhZ?=
 =?utf-8?B?K0xXQzdvbytkRENaRjk2NFFUeXR4cDQraEZqTXEvZ1hSb1JnOHJwdldhSDZX?=
 =?utf-8?B?NlV5SEp4cnhsekhneUFQdjY1MytaU2cxWmRhd3oxVXFVcHBuN2tQcU1VMzFB?=
 =?utf-8?B?STRuR0p1bEkwSmJpaGI1bXZqV0tINml6NHlrbGRpVmhTVjdWdjhxOXBhbVRC?=
 =?utf-8?B?d1VINDV2KzFQWk9ESkxjRWZ5M0t3Z0F6MWFWWmM5NHhjbzBVOFUvb3lQS3Yv?=
 =?utf-8?B?ZTlTZGNHT3N6eVRxZGwrdVRqRi9IdVVzK2dKZ0JvZzFOOHd4dVV2dzBncXpC?=
 =?utf-8?B?c3dNMVhGd003RW0zWHBtZWdTRTZqSzZGWE1rSWp1QmlmT09Lc0gzS0sxTktV?=
 =?utf-8?B?VWpsUlhrOGRwMWtmS0xxVml0MXV4Q2Z0aUJrellNNGVKTnROV0M1RHBwSnZX?=
 =?utf-8?B?Y3JHdTUwN2FiR2FzeC9aUmVpYS8wbzlZZmJzaVkzWHAvbDRCeklWcFNPOGpj?=
 =?utf-8?B?Sys4MGIrcWNGTndjUGthVG9ETDN5UjNxNXh4VWJjZDUzQVBmQ1pBaGhrb0du?=
 =?utf-8?B?VmEwejdqbDFvOFZWWXlPWCtFM1hzUVRPaU1lMktYbHhxV3dUQkZIWnJzRWlX?=
 =?utf-8?B?eGRqbzVnZjJteTZDMkQ3WkZsanV3ZXVGZ25oMmZZLzZjOGpmTkxwSWsyK0Zp?=
 =?utf-8?B?ZHNmNGRLVi85ZDRWV2RodzcrTXNHM1oxa09JWFR3OFhRUG8xeDFhamt2OVBT?=
 =?utf-8?B?OXRiY2p3V1B3TURGa1RPYjloODhINW1uUmFsUmhxYXdZWnR0ZnhySkFwSHU0?=
 =?utf-8?B?TGIxSjBacXVkYmlTcDk1QUV4K0xYVnFkQVdmd2JXNmhRTm9zaGVXb2V6cUhS?=
 =?utf-8?B?QUM0Y09LTEpiNVZMWnk5UmxSbTlnNlovV0U5Y3RwM01ZSVAvSG9jMzNUU2hM?=
 =?utf-8?B?N2pUb2Z5a2NyaFNnc0VwbU9xWHZvdEF0TFc5L0hwK2crYTlobzVCdDRncEt6?=
 =?utf-8?B?bWtFcWNVU0NYSnV1QXhqZzdLOFM5YzdyTHh3SVpsSFlTYTdxcmczTzVuZ2U3?=
 =?utf-8?B?Z1c0R3VzVHphRUIwYXhwbWlGZWVPU2tWcVY3ZkUzSytMM1UzZ3FIOEU5bVRO?=
 =?utf-8?B?R2NqMElDRnQrYzFLNlg1ZUdocDVrYi8zZXFzbzV4ODEyRHJvSWtnUWxuMnVN?=
 =?utf-8?B?MlZxenZpRm5ZZWhDQlUreTd5cWNIb2hkNW5RbEdLYXF2L3hOUVBEL1F0QjVK?=
 =?utf-8?B?SmFuUThJWEE5MDRLK205VTNjNFZuMmJ0UzB0V3Nxanc3SFpmMkRVQTlXUmRp?=
 =?utf-8?B?SmRpdXk1TTlVeDNSQkpLYjNmZ1BYOFFCSmQzSlI4dzFHTUFkbDhaNDArM0lY?=
 =?utf-8?B?UHdUaEJaRlVyQUEzLzdPZWxkYVNWckM2T3B6Qk5VUjh5UkU3T0dOWFlQOWZn?=
 =?utf-8?B?bG0xdU9MZWpvckptQjdzRVBLQW1QeEY1b1FHdC9samtLS2tQZEhscFB5NWw1?=
 =?utf-8?B?amh2RjEzaThxb2lpWk5jdE5pOVpDRDc5L2dwbUE0YUlxV3ZxVWlCUGtXRlVW?=
 =?utf-8?B?OHBja1owZjNEQTdBcm5td1VsVDA4M1VyU0E2aW90dXIvcTFtbUNzQXJ6dy9r?=
 =?utf-8?B?T1RDQlBYU3A3N2NRT3JySVVDZkNXVWwwWm1xSi83akovUWJEa1pQTVpTdEtM?=
 =?utf-8?B?eHhWN0N6WnlFd2o2NUJaVW9IT0Jsa3hZdmUxV2cxQWZPMWFxeG1PUGdOZzcr?=
 =?utf-8?B?UXZTSjc1SGpsNEMyTFk2emVBRjZzbVBNUzhXQlB0MnNIOU14SG5QTmhyUGtw?=
 =?utf-8?B?eml6ekNJMXp4d3JHRVBzK001eXVWbmt4d2FpV0o1N1lvZXpibUM2MGdtUU8y?=
 =?utf-8?B?VElPTGh6YjFHTTVNc1l6NHMxbERRYzJXVHR4ZU5yQUhQWG9ieFhTMTROa3NZ?=
 =?utf-8?Q?g8WUR2d4d7rLcn0BqBTfzAJfwvW1IGoFqivUASD5hGIF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9390422-8704-49c2-1327-08ddff24043b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:47:11.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgNaeNu5ur2UF45ao8gddm2RdvfPCdp4p2FRFkISlWyZX0uj/zOrkJrVrxRX4A6vAF9TpovK6puu138/nk0lWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
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

On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> The bitfield macro's setter currently uses the From trait for type
> conversion, which is overly restrictive and prevents use cases such as
> narrowing conversions (e.g., u32 storage size to u8 field size) which
> aren't supported by From.
>
> Replace 'from' with 'as' in the setter implementation to support this.
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>

Can you add a `Link: ` tag to the discussion for context?

But I am not really convinced this is needed or desirable at all. Where
would it make sense to define a field that is larger that its containing
type? This looks like it can introduce confusion or errors. It's already
not ideal that we can pass values that would be truncated; but this
makes it worse.

Anyway, if we decide to keep this, I think you want to remove the=20

+//!   Note that the compiler will error out if the size of the setter's
arg exceeds the
+//!   struct's storage size.

bit that was introduced in patch 2.

