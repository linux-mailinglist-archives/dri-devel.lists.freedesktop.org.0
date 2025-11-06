Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777DC38CAA
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4B10E110;
	Thu,  6 Nov 2025 02:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c20y4YPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FF510E110;
 Thu,  6 Nov 2025 02:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0j5BzHuAjvYgPkzTvl7epq+cC+/YY6+/EVrpg6X+Jsw7gMz5biBEszDAR8CaJLjhDHwuDYc2BDZR2X2ftOUPG3BPpWAxj9lf3UmKh0bFK44xtKG7mbR//akAmWGSzJa1Ng4Q0ytx0z6IsDU/TDdP7U7uYBBe1lCbokQYRXFAEuGRU8iQWstVhWKVus7x0IM7Woi7ccsZUp/nG2h7RqvNBv6NaDqAFN+KXzpRL5iEJDvc0iirIkJr16fqjYru4z2cTBNWexRlj5zh+gQUBDufsJHKIZ/lRSpyUsKRgvLYuszmVTrPbCoNqOUdgzQaOWLsWAc7K+T83cGQqdcAxi+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEr9yASFKzCBxyKOW7CbKpMX67ulPH6iwB6PbHIZ7zo=;
 b=RpsEbfwHWkIhltaQFPImU7yWJSEvgf5ng6/xd4GWHpg8luJjtcgWoH7fhLekQ0lv+wiUd2HRdCjf+L1Ko43ZhDT2W/fdhRC05E+7+g573W/7xWgim5BDo6+qGtY3DGgtPsxWOX3PXkqIbZJkU6JHFwPvfXw5hZZSFx+7LzKnYzreg2AxwONbzIiuFrPwiy5XTeuDpDTU9fLEj4pkfX590Je+OESQzSyY9H3btjBBGAAK9fWq4kNqi3EvmUltfcJL8vtrENqujxK+PVsOwLYMLxAhqwuT7a5rSMNRQV/NIJ7NEbpGGEy+orYgNauW5yu4+vhQ/Ramm7LR8aWuJBaZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEr9yASFKzCBxyKOW7CbKpMX67ulPH6iwB6PbHIZ7zo=;
 b=c20y4YPGhjnB9dsyyME93i81vVdxMx6FZrRh9OlJ2ge4YhKwzZEKM6ij7CNyGAI47CBuisxyRvzDRxf4vuctpM/29NTuY6FcVEcAplu22I0N74CSDLcywkZ6RqMftrY06lC9aTiahUFYDnHHEJhLZp1ia6a2iBBbh2NpHmPaCng5o0mFBbxlq/MDyHibmmDLqPvQN1biTScEoannQbo3aOHacx+/LPUVw+ccovQeytMCEVDss1kNhCJlXIZ07OasdVniKqWeLzJqRYH+d7jboCXBQustzG9a/cZWqRfdosswFNnzCV6+kHM1HSzL3HIZGX6IJnXGeU2upQpPsxM61g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::612) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 02:06:42 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 02:06:42 +0000
Message-ID: <35642339-8913-45cc-869e-8bcf93553920@nvidia.com>
Date: Wed, 5 Nov 2025 18:06:41 -0800
User-Agent: Mozilla Thunderbird
From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: a6755680-acf9-46db-1a0e-08de1cd920e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnRMOWVpbHhQV1VlVC9jdFRXeDAxOU53Yk5nY01XWThlTndJL3FCSnQzbS8z?=
 =?utf-8?B?QWg0cXJPcVdTWGtPNnIxRkRpbXdXQWJLU0pWY2V2TTA5cSsvektjZUVUbnE2?=
 =?utf-8?B?OFp0aHNpZkErdzRiSTFCRU1UMnhJallUYXNxdzh2aHdycGdsWXJPMXA5b0dm?=
 =?utf-8?B?VFVqR1l1cnBFNEN0RmhJWjVnS0c0WndoUjJ2MDdTM20wQlcxc3QwTVZ1MURq?=
 =?utf-8?B?UTZXMXFzSFgrL0gxNHhQSGVOWXJSWHJsYjk5cHVCUW9GRkxic1RDb0ZwVytn?=
 =?utf-8?B?Rlp5Vkd1WXIvL0xLMVNUblp0bDZWRXhFUFZtcDVLcXVtYXJ3M2xNYTIwMEVa?=
 =?utf-8?B?NC9oQ0UvN0p2OWpqS054ek0xM3FtM2xBenVpMFZCRUpLNVRUY0p5N0VPcG9x?=
 =?utf-8?B?RHRiVklpWmJkK0h2c0xEU0xWVi9xNVBBcy9lN2wxendiclFaeW5ROVJIN05j?=
 =?utf-8?B?TFhaV05tcSsvcjFSeUhzMXdEazlpWGUvNmlUUExURjZlaFpnd0hRV0wxV3dy?=
 =?utf-8?B?cks1blg3aG85bGV5N0dacG8vcURpYkE1akIvdnp1dDFLVS94VG9LazN5MSty?=
 =?utf-8?B?Mkx1N2Z2bE1HV3NpVnlzMWdLZHhwV0FDTy9SME1TazZGSEVwaFpxUWNwTEs2?=
 =?utf-8?B?S1pvTzFDbEtGS0hQQ2xabS90Zkl5b2I4ZWF4dG51dkw5ZGE2c3lOZGRNRHdl?=
 =?utf-8?B?djhtRjUzcjZHY29oZG1vNWUxVHgvWFdmWmppcm1KazNnYVhHdlhnaXdRamwv?=
 =?utf-8?B?RHJRb0gzR0JaZ3EreHN2b2tjOFpDT21HTEpoUWtBUUp5V0szVjdsc3BjNDlr?=
 =?utf-8?B?dUFtUFJHeUlMUkZ1N2sycm4vQTE0UnpTSnBNRS80NnhpZkFqUk9ZLzBQaHZF?=
 =?utf-8?B?aE1TY25CcHlqMURIRVhrQUplenRIOXB0UjVzUXoya1NIUDB6T005Wklnelp4?=
 =?utf-8?B?VnM0Znk0NWdFaENmZWZ2cjZOZmJYTFJMaGZTRHJ2N2dOMEFJS0dmazViU2hN?=
 =?utf-8?B?TGoyMWZYaEhUYVB4bkJ5YjlJVlVxL2pyM2ZYVjNodFNuMUtpbU4zUmsrcHNS?=
 =?utf-8?B?dnVJYWx4Wm41ZXhmQmRxbzZwOG8rbS9YMkVQVFJvWVpIeERxelMxU21CSm1M?=
 =?utf-8?B?YitDaXR5YTBLbE02VWQ1VC90QTh3TVhrL0psU2U0MTBjT0FIYk1wUWZJc3Yx?=
 =?utf-8?B?ZFc1QmJmYUF5SnN1VVd6dzBQUXEvVUxGYU5zblFzOVZWNGtRSXF5ZTNBc3FC?=
 =?utf-8?B?dkdQQ3BoMmw1cjMzbnhuR3RzWW91SVZONUN5WDh0ZmFlcGhrbnMveG1kT2ZW?=
 =?utf-8?B?bWNtZFJiamVFOXZKaE9jbk9HakJ3WFZxTVUwdXQ2alRGbHhMdEN0VXMweFZB?=
 =?utf-8?B?OGI0T1MrQkpWY0lCNnE4a2ZQQzlIUUcrSkt6Y1ludkprVCt5WWJXSDdWVGFq?=
 =?utf-8?B?dFNjKzRrRDcrZmVaZlZFQVB1UGVpZnE3RmxmcWxvYWJ4c3FpYWh0S0J3N1dM?=
 =?utf-8?B?VWxXOHZtamhHVjBuSXhpTFphUUwrbzlUMldUeDFVOU9ITXpCVGRYMjRBdXEw?=
 =?utf-8?B?MnJVZG9ZNUNiK3h1Umh5ZHNyM2l0Z3Qzb3d3WVpPZ0FBVG1YcjdCZU5ybW5h?=
 =?utf-8?B?NzR0dkpwdWRXLy9MUUNiQkMyZ2hSUWJKaEczLzRHbWFHeXkrQm9FUDVReUlz?=
 =?utf-8?B?OU5LcHNsZWVPaXlLQ2NHalk5bmROTER3WjNTMWRJT0ZsL3hpd2VtMDI4Nmwz?=
 =?utf-8?B?dUVpK1g0cTJYOUZzTmJOYjNXYTdud0Y4UCtIOWcrTkJFeFBpbHhwU0ZvNzFE?=
 =?utf-8?B?eGhaTUtHR0FYRFJBWHJEUy8rRU5PQjQwcTRzU0pCV3RoUDF3S2xmdWJaZ1lW?=
 =?utf-8?B?M0RHUlQ0dzFiRVdKTHJDTEJNa1N1c3Z0WE5LSGtZZThZczBkS3BGUXBJNlha?=
 =?utf-8?Q?oQ2v/hWRnHsUMsi5vP2avm7fJNchG+qn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk9yamU4YjVoY3hDaDY5aFNScWFPeXUyZDB1Z1c4UUlWcTlBbXQ4NjZkUTlD?=
 =?utf-8?B?bFUrUFNpaE0zcEpqbHhlUHIrbVJrK21TZ05UbHRWR2orUFFwTGpTZFMwU1pq?=
 =?utf-8?B?QVBkS1lSZ3plVWt6UStHZDZ0OW0yWFFiVFVKbGRabjNSWSs0SkhDZGlaRUZj?=
 =?utf-8?B?TXlZVnQyTDFWUXRmWHdtZUVXcDFCc0dTeTdLcWs2NEZ3MlJOL1hNdExQNWl2?=
 =?utf-8?B?TDFpYlVod0V3Y0w2REtkLzk0d1F2Q0FVNXJTUlJ6TXIrSUpxOUxYS3lrQWts?=
 =?utf-8?B?a1piOUxlZVpKUUtmZ2JCbERqdXkvYlU2L1IvSlB3eEdjNG5EcEN2VnRXVWd2?=
 =?utf-8?B?RWxGckN2U0dYRnUxaXFFQ2lBVlAzWC90ZjRHREVDb2hORHQ5ZTBUbXp0QUdj?=
 =?utf-8?B?MzBha0s0a0JoUFBUN0JSSEJ2SkRwMlZYcVA0SnFyZjRMMERDVjNxMXIrMHM4?=
 =?utf-8?B?ZHRocTUxbFpjTHl6S1ZWZGFJRCtyMVByWkFmSFlvWWRIQVRyL0s5aS94Tldx?=
 =?utf-8?B?bHUzTWhNM211MU5Jd2l5eFIyNHdYNG1hbnc4OWNESCtKVDZrQm5IdEZTN216?=
 =?utf-8?B?b1htWFQ0cEFCMkNrenhOSUVMRXJmbWF0NXA5aFIxOWF4THhVZW42aUlGSXpN?=
 =?utf-8?B?RklHZCtBaFZZZDlZaUZQRWlaMzVvaUZnOE1OQXBtcmZaZGFDeTViMkpmSlFI?=
 =?utf-8?B?WitRL2FWTXJEQXNmMWhNdW9uR21FRzR0TkVMTy9WNTY2M2sxOE5hVnRVWEZF?=
 =?utf-8?B?MTVFb0VWNlVkSE1sNU93a2dtbU0vVEZlNlFrRGJOYnBoMFJKM3VpTlBLTEM2?=
 =?utf-8?B?SHZ5MTVodHFqNDEvMXlLQS8rdzNZSlVjb1ZTaW1XcXE2dlZMeTd6U2JrYUhQ?=
 =?utf-8?B?cmdOOVdKWjJZaXE1bG9HczdNa3lDVE5KZCszcFozUGNlc00vRXE5N0NPMnVI?=
 =?utf-8?B?NlF6M1d2eEVadEJnZGdDL000OW5yb29OaUQ3dCsxWHpudDdMYUVlMnArcE1V?=
 =?utf-8?B?TE1VU3FoQkp1QzA3Wm83Z2tqdUFiQ3hVUy84NTdoMWtDU0x1NjRqNTRja01n?=
 =?utf-8?B?RWVNamFueDJxai9SUVUxK2g1dFEvU2FUS1UyVFcyZFJ3UGVKaWVvMFJkUFVH?=
 =?utf-8?B?SWYwS2JXMXcrbmZhd3B2aFQ0SDRneTdXbHFyL3ZtSFR6UDZkTDRQZzhGeDcr?=
 =?utf-8?B?bVEzN1lySkZLeE5jaW1LMDY3anN2YmNhTFUzcXlMU0F6L3VRRXIrR2tKbGpn?=
 =?utf-8?B?K3JtT095T0JZV3VpMkpoNTF6UExUSFV4MDRqY1QrZmRoTXBxdDFaa3dLdVVv?=
 =?utf-8?B?OWZzQjJ4ci9tUGdnTUVQNmlYNkNsZDNlOC9hd3E0dlQ5QldIMkFNSEZyc04w?=
 =?utf-8?B?cmErbnpBTWViSWttYXFJZ1g4VldCNGZwSEtkQ1p3SmlpRmo4ZDZRaXN6TWJW?=
 =?utf-8?B?cXM4OTE0c3RtWTVOQUV3UDJoVUxLYndXa0tYK1JKZ1Brb1B6Rytha3NnTG4w?=
 =?utf-8?B?OVE3NzFZNk9GY0I4UU5BSTlVL0lWK3k5a0VhMnVxM2dpRVRTSnlNbEV5Y0tE?=
 =?utf-8?B?MHB4WlRMeW90aFYvZTNjNkR3TUR3SVRhanJxRWVPWC9oRFlGL2lnaG5aRldk?=
 =?utf-8?B?UVdPMXA4S2JYd280R3RScjJCdGdhVTc4cVVkNnV6dlVNTTdwQjQ1K2ZKUFpq?=
 =?utf-8?B?OU00cXViSmx4OFp4aE1JOTNvTXgxZW9jOUtiVHlCa3JOU05vaUVrMnpPK0NR?=
 =?utf-8?B?UC9mTU1ZQnpHRXlDYWpvY3lZSGQ0OEdrb1JHVmcweXpnQmhicHk1U0NmVURH?=
 =?utf-8?B?VjM2d0NNSlUyaDZ6a25iNk0yUmdYRitEOWdCWC9ybGNtTXdYN1hTWDFBRWU0?=
 =?utf-8?B?UjFybEovUzZhVCtsUFcvVktwdGhuY2JqdWkyR0NQc1RmbG9ha3RFSWZ1YmVj?=
 =?utf-8?B?YlRDTkNUaW83M091Rjc3YXlVN0xXcTFvUEVSK1FCSHZXNXlsSUkzRmNIRWRW?=
 =?utf-8?B?bXd2SFkrR3hUdjF3cnNFbUYybkl4clhtZFM0N0dFQVZEV3dlNVNvUFJkL3cr?=
 =?utf-8?B?aWtzeTA2RE1wenFvTG92Zklhck9ieHB5WS95WXhSYlh6OWd3TDhxdmUzd3V5?=
 =?utf-8?Q?w14HShf4fZDQcQAHrpj7nY0BY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6755680-acf9-46db-1a0e-08de1cd920e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 02:06:42.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/Awm/YhrbNCgFRknZo7ylSbp4BP4j7e1EZTb27zZlI/ktSf2EPtuingzzIRHQ3Ze5zk3WxUwvvHFQi6GxS0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C
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

On 11/2/25 3:59 PM, Joel Fernandes wrote:
...
> Joel Fernandes (11):
>   nova-core: falcon: Move waiting until halted to a helper
>   nova-core: falcon: Move start functionality into separate helper
>   nova-core: falcon: Move mbox functionalities into helper
>   nova-core: falcon: Move dma_reset functionality into helper
>   nova-core: gsp: Add support for checking if GSP reloaded
>   nova-core: Add bindings required by GSP sequencer
>   nova-core: Implement the GSP sequencer
>   nova-core: sequencer: Add register opcodes
>   nova-core: sequencer: Add delay opcode support
>   nova-core: sequencer: Implement basic core operations
>   nova-core: sequencer: Implement core resume operation

Another quick note: while preparing another patchset for posting,
I just noticed that the convention that Alex established for these
is:

    gpu: nova-core: <remainder of patch one-liner>

...since all of my tree is also old and using the "nova-core: "
prefix, too.


thanks,
-- 
John Hubbard
