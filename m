Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACE6BF37A5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1952010E507;
	Mon, 20 Oct 2025 20:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ifs7+tJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC6F10E506;
 Mon, 20 Oct 2025 20:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTkaK8YaRGTNq6JvExm3Nw4wv1SlnilJ+81a4Wb23gHgmwxfgGJFh+q3MY4z+Sbg/HMOCl1aDR/KYoW7QOr4Jbkn6OaKORM+hilabBGjxkKD9Mtx3u0VkWFayEF6vTtRdaxlKveEbu1mTjWQQOcPeTFb7D4a8FEDFk7dsfRW+A/xo+cLFOZU7APZN54+2NZDu+3q5RZFexM1QRplRcPc7atMWgprbFtPnMzboNEOWkdn59NzhCZNKre0gzhsgy2WsrXXovh3arSIZEWtV9zl5gmVgxoBklrW/6A4/ErMOLl1gyc9k/81C/wwgH2dYuAd4tu9Q7UWHZEudOeisLXmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfIjGmOJ0lZlZ2ypjy+qhDbBnl7LewpMTZbfpuIeL6o=;
 b=DM3/vXOkOiHaFDVSUxMBrP8uHqqfMoPxI8W9Pihlqm14TWNRUrdP6E67GMWi9PF/OYkM9n7/+H3t7M2YY1mPG2SfvyenvQ+QVcdjAcz0A2ua1qGCTffOCDtO4YSJGJRBmNjJX878Uh7BmqyHYqv8Z4E872cEfIOXYKx/imtPwDLZDFin28nbyO1WBO9C2H9iPP0OAhOdhugow/FLtao4dZRbR5kbNPrpUtuoKnIICkkxgANVm8GRRDIhrnkVpi7XzQulC6rH2tpXMsNWdYz9A4NgB4KSX8wG/S2rqJKpraJwsNBnij3rU5Ol5sR0tXjdkYaWgT+C/yWQ3W0FS/X1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfIjGmOJ0lZlZ2ypjy+qhDbBnl7LewpMTZbfpuIeL6o=;
 b=Ifs7+tJHLs2WLllHPyUYmHuYSDVJQ1BfjTLpN73St//wMyGEeU/Qk7c2vHI7J/lON8B8KWZrwW4Aavr5rXwpycqrLi9uLqRB+aEP7bGtwpBKW/dPCwKibC5fBZwf/vWSB5M91Xf23XCxY1OcpNznPdo6Z4otwGy5PpaMu5WL0sXu+1NOxPdrGZ1d3BPsX1ASKObeBaeBysQ+xQ0V2g1aQWcVubYM3Ox1RzrzDNpEkvUyReGAbbh8GEcFlJ26B5ss0fkiVsK9dx3ld4dOHb4Rujde1l4wFs35raAbPnFB/5MTVVEssmgRvXwvqL4hNmqmofjle033rMMWPav8xYijgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:42:17 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 20:42:17 +0000
Message-ID: <c65d6318-0de4-46cf-8f70-8a1c4aba179a@nvidia.com>
Date: Mon, 20 Oct 2025 13:42:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
 <506e84b8-1a99-4548-b2c6-b502d790f4e1@nvidia.com>
 <0B70DC73-6796-4114-9C2B-6B1B9AD560A5@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <0B70DC73-6796-4114-9C2B-6B1B9AD560A5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b27607-cc5d-4c64-a89c-08de10192868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nng0SzNlOForMktZYWZTdkdLbVcrVGkyZkNBL2NUcmdvbU5oYVl5TE9Obkx4?=
 =?utf-8?B?enQySnFJNmU1UE1wQktoNzJqU0tkb3k3RkxIL2ZJVXJZTVlQbTF4NkJnUnl1?=
 =?utf-8?B?OUFsM1pWZEV3Rys3bFAySlVxSStUaUZoSzliVTg1UVYyK2ZCNjJucFU0TytF?=
 =?utf-8?B?MHdRa3pDR1hNRklXV0V6eUU1NThocmNWSmJ6K0F5a0hOYS9kVjJtbm15YVBs?=
 =?utf-8?B?RXJKWmhaNzI1MVY2N01qWmliODJiaFYvS2lGVWVpTWowMzNNZUV4M1ZIU0l3?=
 =?utf-8?B?dHZBUFJQK21ybnZMUkNYTm1mMURUbEVnS2U3eXRJZlVhcjdKb1NkY3cranRB?=
 =?utf-8?B?TWxlZ0sybzloeDJsc2wxWmNaQjRWL0ZUR2VmZGxGazd4Ky95R2R1aGp0dE9E?=
 =?utf-8?B?QmU4c2dsOWRSSm1mTTBxa04vUlB6MTdnTmVKQWMraCtGN28yb095MHZMSFpm?=
 =?utf-8?B?TXYyckxPQjhpdFVKWHE5a1pOdFlIZ1JaRmNhSDFOSDlTK2VlR1F6VUJ5dDM0?=
 =?utf-8?B?eGtHclJNMkhrcE02blBnOVlRL3QrRktxTDd2dDF4NXBEUmpUSVd6NVFKWXZY?=
 =?utf-8?B?aFgzd0RLV2hRVkRrTmtielZtU1NHaVlOYy82N0lkSFM5cjFEWVVKY2FIbkVO?=
 =?utf-8?B?eW5WNWZ6aTNLVnJEazF1Vk0zVjBhaisyOVNLSVpZRTE1b01oQjBGbVFpaDVn?=
 =?utf-8?B?ZTdqZCtVQXJ3K1JoL1pXaGRrYVg2UHZtWDhUYXBNbXdLU0ZWZEpvVVg2emtj?=
 =?utf-8?B?NXBleXpJajFsaytRV1RObmJMTjVkOTVEdHlEeDBXNWQwMW9oVzNLaXE5clFG?=
 =?utf-8?B?TkcwUEo1QXJYZzhSa01GdmJNdmZWL1VYdkxaYWNaQ3dCSlpQMDFYQmpZZFho?=
 =?utf-8?B?SGRyYVRudVhDbi9EY0cyMzJtSlFSWmx5Nnlob2FLNzJVS2RoVkx0WlJzZFh2?=
 =?utf-8?B?NXRSNEcxeXN4UXdtOFBzVVB3a0VYa0pPUS9vWHFEZHVuODNmWitxRnNRRXVx?=
 =?utf-8?B?YTJHVWp3YjM0RFVqRDMxcnpwcEI4N0dsdXd6cEpuUXpOVWVTNko2Zng3WlBT?=
 =?utf-8?B?b2wrS3cwY3Y5ak52SHB6NnNCeHVnT1FpaCtzZkhWelNTa2F5OTc4WUlMc202?=
 =?utf-8?B?b0JLUzYwVk5KUG5LaVROWUh6Z0cvb1JFSjE4TFl5MkdsMm5WdUR5OFYvYURW?=
 =?utf-8?B?aGJ1VUFjZDlRTDlnRlp6bklFNkVQMEFnT0NiUmZqM2NQZFBMOW1EaDNjaEJ4?=
 =?utf-8?B?TzlNRFpjMVVjTS9KWGp6R0FSTDgrUXJvYkNFd0pDRW9La2w2YjhtOFpBZ2lm?=
 =?utf-8?B?WnF4V0hsRmxWTDgra3VySFkwTWxHUnAwaFhyajFJOWlKQ1BsRmV2ZDdwaTlv?=
 =?utf-8?B?MEtGU1VsYTFScVFTY2hxYVJmNkczOWJXOHkyK1N0TUtYMTNyVlVlU1hsT21R?=
 =?utf-8?B?bFdNRVZ6OEp6RDhYc2k2UjZtMUwwUTFxUU9FclV5VzFZcmdhOTlRQ1RqRSsv?=
 =?utf-8?B?WUh0OXpVZzFuUGVMVGJ5REhDVElacVhoUzhqaGtwRUVTZHQ1ckVEemYxM3o2?=
 =?utf-8?B?QVF0ejJPUndqakNHaVNRbk43THlsTXB2Uy9zZ3FHWEJ1VXdpUitBaXM2dExo?=
 =?utf-8?B?cVljZEpnSnR6Q3FNVmV2ZldyaG5GcDFzK3hUZzViTGp6dFc2Y1AxdmtYS24x?=
 =?utf-8?B?cFptMGR5dUJuaWswb04xY3g2Mm5tYnJkdjZlYkRIdEVOQ1dPWUwrZUowRWRF?=
 =?utf-8?B?cStXZXVHQ05pTlNpbEFUdEZlVkV4UmlEbFp6OEpRRi91SUw1R3FQU05oSjdF?=
 =?utf-8?B?NTd4alJHbEtCK3lsRVhJbkhaUFEwWVdIRlJ4dGw3eG92Snk3TTVNS1czeVY5?=
 =?utf-8?B?Z0FoTkVZN3FnMXFUczU2eG1MOGtOL0krQkJ1Rk9SdDhaVHFXdlJTQUJFZm1Q?=
 =?utf-8?Q?adShugLYIWQJ4AFJC+xzFM7PJDHq8L27?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtycUdheDM2dzhNbFFWNzZBdGo1K2hjVDZCd1hHTzhQVWNibGJIWG1ZNUhM?=
 =?utf-8?B?ZlY1UksvM1FjWmZ1UThiWTJXY1d2OEtXS1R5cHpNajdpNjgwa0g5RTAvTk0x?=
 =?utf-8?B?VlQ1bkp3L0g3UDdVUndYaTdtTzZ4Qk1CdkVkRm1lMFE4dkdKYThvbG9XdkpM?=
 =?utf-8?B?NlRmN2xFOGw5YzZkZXJkWjR2Q2JmQUROc1k5aVE3Z3c5YXVFVHBDYlB6OFdp?=
 =?utf-8?B?Y1YxZkhmYkxybmZOWGFIcTB1MUpSU1lJZHFTc1kyc2ZhcHNoZEt1RUZWWE4r?=
 =?utf-8?B?dDhURFVpVmZSSjlOTmVUVkdvOEpDTlBhd1pydEJpZndvTE5vcHdQd0c3YzlS?=
 =?utf-8?B?UWE2S1p0WGtyek9PL25sWm9GS0xvSFRIUExwQUo3dHNSM3htUDV0RXU0NnE3?=
 =?utf-8?B?OEdDRDI2bjhQM1dpd3U2MGIrUnpKUGZIR2swZ0tuc2VmVWdBeVhFWkdrTW92?=
 =?utf-8?B?ZTBKS1RmcTNLODZRbGRUVzh3WDd1dEZ1OGxvekVPYkRMU2tZODVqVHBwa20z?=
 =?utf-8?B?NTFObUpPa1dOTlRJbmdvb2kvUEdxaEQ0b2VQVnIxYUJPQk1ERFI0N1dGb0xW?=
 =?utf-8?B?OUVNclRMUVZWbXozZHkrcUxUakxMT0pZbmQ5djJqdHJtTDM3UVJlYnRNNjBq?=
 =?utf-8?B?Wml5Ykh4R1hvYVJiZUlrMHZLU1pvUENqNlF0UjA3dkFtMk5raHRaclF5YXFO?=
 =?utf-8?B?Y3Q5TCsrSmJmYWdidW9VVmpqaHNWclF5azVSaE9seTdrZUFURUc4Y2FRanYx?=
 =?utf-8?B?bDVxRnl2aXRqL3pUSU1VRnJrdmg5aEpIYUUvQ3p0ZHZpV3ViallvS0srS3Rl?=
 =?utf-8?B?NHM0c3lFZGN0a0laMTZjZFFESmdFbzNuaHZRRTRVWXNxbXVCdnVzY2JsaVdk?=
 =?utf-8?B?UTJENDc5NkZ3OFdwc3Z2WEh2bzBGRzNEbFdPWWVFejFaelZqZ2k3b01aTGY4?=
 =?utf-8?B?YVRYbEV0RzZYYWx5eVBRRkNjdmpIVXlRTWZPd0ZIeUc2eXJiQTNXdDhsTWVG?=
 =?utf-8?B?K1ZEWG9ReUJFRXBXMkh1TE1SVFVGL0tqTU5VeFExbXFWMHFmWU01TkI3QUxU?=
 =?utf-8?B?UGs1dmo3OW5OYW9VRDlvZU1XYUJsNE5FWkZTQ2srdWQ3MnVKUWk0R2hLMnVz?=
 =?utf-8?B?OVErdmh5U3VLY28vTFVRTk5JZmorSDFsbTJYekc3cmRrRjFWSjM4L0JTQkc0?=
 =?utf-8?B?cG1XUUZKWUdGTXVDc3RrSDRDb3cxU3AxNmFrVGUxbVJpWDRmZHVYbStNcUt3?=
 =?utf-8?B?RHNmRzlYc2RzNmZiNmVsVWtEbUVDSW8xU1lPcWhFQU56bGZldEpqbjFLZlR1?=
 =?utf-8?B?OThqM1lqdDN1ZmpUVU1FbVF3TFpaWHlYNG5vdzFtRWtrdjMxbk1kdnI0NlF5?=
 =?utf-8?B?UHA3ZG9HS00ySUVmUTBMdDV5ZFB5S0hLeStMQ2JGb242Rmc3RHNLVzBCNGdZ?=
 =?utf-8?B?cndpOHBOa09zbHl6UmJyOWlCME9VL0d3VXpWQlFrbC80cGt3dVNvZ29CUTJ3?=
 =?utf-8?B?ZEtXRmZkWTR5Nzl5dmZDTUVLU3AyQU0waHNVVlpzTXR1MCtyMDhicnZDS1B4?=
 =?utf-8?B?Tm9HUEtzdjRhTWFFTEFrZ2FpSkJBUWlLYkZqWjAzcXBWRWlUaStlZlBmRjVn?=
 =?utf-8?B?Rjgyd2RtOHpmTWtZMTVzdXFCU1c1UUJJdlI3ZE83RkZ4VkxpanI2b3RzSFl1?=
 =?utf-8?B?OEt2WU1wNG1IVDNqckt5VGdPMlRwOWkwQkp1eFByWFVnL0U0L0tvaEJaSndM?=
 =?utf-8?B?MTJ1SmtDeGd2WWhpVTdVMDZ1OU95YTJZN2NQYUJpVEJJU3lzSDZSWUZHTFlN?=
 =?utf-8?B?NkswRlRHN2pVclErUmc4TFJweXEvRGJybWNPWGxkMUZzTFV3OENqc1ZiSWh0?=
 =?utf-8?B?SUdpeS9HeHFLWHVINWN3anBDMzlBeEtBZW9Ca0x6S1VMOUxNZlBqbUExYU13?=
 =?utf-8?B?K0hLZGhjcE9YNHU4SE5ZTk9VWUlxMTdnTkw5S1hyWjRkM24yWWpvS2ozQTdl?=
 =?utf-8?B?NDV2ZEgvN2tNK1NxRkoxeitsTEg0Z1FjbENvWWl3eENFLzFMQlhJTHhJaVBQ?=
 =?utf-8?B?cTRWVDdkenZja3Y2QklXakZDVUl1Z1grK0Y0cTE0QWxMWFh0WkdtOWZBVHhn?=
 =?utf-8?Q?fYb+GhMTu4rMj89LempDy2PLR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b27607-cc5d-4c64-a89c-08de10192868
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:42:17.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlR8r7Bp737VFKlmz/o+JGK7xgpTWLGqV4YqpoaPa/rGfgpjqRJl89xxKkNpQdN+72hGEsaqPEtmYzS8RGGGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
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

On 10/20/25 12:48 PM, Joel Fernandes wrote:
> 
> 
>> On Oct 20, 2025, at 3:36 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> ﻿On 10/20/25 11:55 AM, Joel Fernandes wrote:
>> ...> +Logically, the PRAMIN aperture mechanism is implemented by the GPU's PBUS (PCIe Bus Controller Unit)
>>> +and provides a CPU-accessible window into VRAM through the PCIe interface::
>>> +
>>> +    +-----------------+    PCIe     +------------------------------+
>>> +    |      CPU        |<----------->|           GPU                |
>>> +    +-----------------+             |                              |
>>> +                                    |  +----------------------+    |
>>> +                                    |  |       PBUS           |    |
>>> +                                    |  |  (Bus Controller)    |    |
>>> +                                    |  |                      |    |
>>> +                                    |  |  +--------------.<------------ (window always starts at
>>> +                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
>>
>> Quick question: does "window always starts at" actually mean "windows
>> is always initialized to" ? Or something else?
> 
> It means start of the 1MB window (offset 0) is accessed from the BAR at that location.
> 
OK, yes. May I suggest this slightly tweaked wording:

   (window into VRAM starts at BAR0 + 0x700000)

? 

This avoids "always" (because HW may change someday), and also
gives a subtly stronger hint about how this is laid out.



thanks,
-- 
John Hubbard

