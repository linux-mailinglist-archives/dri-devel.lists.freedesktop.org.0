Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B532ABF80F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 20:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233E910E318;
	Tue, 21 Oct 2025 18:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4I50AaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E5010E318;
 Tue, 21 Oct 2025 18:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgGoxuOubvJ+VEWaQ/3QZhIPwpzYCfOATJHcp2mJ+SU2/fRbxFQF1eb/NHPTphPwleRVT3ITk/b/te/ChOXKGW6tOqiytJAwxMya0l7Tx3uAVXYYYqp8jmB6h25gNb1zwlBBYj0AQGQCfWBql9VzoyzKn5sdeyVSkHd4hn6XKKChhi8CTW1AAxMFSgiZt0Fi9/zzrfct3sNS5QQxZQZYWi9FRsS4oFPb5WTe7Wg+OnqQMb4N2dZv+dEDBtH3xlluGR6XucQErOVjuA1gQjTt4QdQeDCq52ImAGktUwNBcJCa8DdSnX7KatQpl4aMZUnXRSj9IjeaBqQG+UaCaV2BYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TUvRc0cdtkhDnlMcXXIpvIw7x0r0DnhJWz6sE/ow6M=;
 b=woZhI/X1xk9i5LkGxsrwRIukqLPgdCF+u6kbkdCsUxwmqFDrscsIW6Ha0bPm+mK5TuNhkj3E15L42sLlmh6bAVjlJ6RjuC/Ub3RuWKFsdq0R+F4B30k3NGY7hXHZlog3TKj1t8I+1tm8DEEyet0pwrNh8WjaYczsfYHNbYNFX7GR43LU6lLh+QX2tYCNZYR1+qqFZa1hsRElhJDmCy6yGNcL5GGfKMvfMtnyrmeK/z3GogiDvZ+GXUhtgBpE8dnP4lvmUaEgTS+5bzP+0XQPZUS2ItDnyyNHdiG9nZkvmddR+AXLrY3ovsMBBeZkpZMlGH5JjeoxLQUVaTCrTW94TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TUvRc0cdtkhDnlMcXXIpvIw7x0r0DnhJWz6sE/ow6M=;
 b=A4I50AaJ64TRivcPWXFeHxtP4lYkpnG/nOP50fHEd7FSor1utkVZyhb7WooGSqNlAE8lxpkMeAMwqYiXas1IAlvMV326JSOOXPgrU12JKAdxD00oF10aMNc5pEFGrHfWVV1SGgvoJvm744S1KgtNWKyu8I49NxczIwpoN6aeJMvh5FX4VNsRaURZroU8LAbu8AmN8TIzX+mX30C85EkvSqOkDIEkL0tRp2y7qsWA/kyn4J76yrQYHU5gy4vr2Y6Q+oyuT7i4ucZ1DUe9XjwX07Aw94oe1AoLFMyWdlyrvLlFpvuGOsOTUeI2WWhJw+MtmSq7DwgMQb1UxppYuOE8+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Tue, 21 Oct
 2025 18:29:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 18:29:15 +0000
Message-ID: <ff9408e7-9351-436b-9478-67ceb39a4f2b@nvidia.com>
Date: Tue, 21 Oct 2025 14:29:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
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
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <c6350b8d-fb41-46f9-806d-20b058f778d9@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <c6350b8d-fb41-46f9-806d-20b058f778d9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:52d::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: b02e64be-8fd9-419a-7651-08de10cfbd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjZ5YjRuTkZnaS90OHlxckszN25paTVETXo0NG1IckVXMzRLcWo5cG9hV1dn?=
 =?utf-8?B?ektnTStnUTVFcmFCb0trMXBDNXNVai90VnBLQUhBeGlucFIzajJHVnZtaGVt?=
 =?utf-8?B?b3puZ1ppVlZjNGhBV1BEcTVpNmlvK2ZlZm9kY2JrU1RCc2d3Y0UzVVZIQk40?=
 =?utf-8?B?NW40Nk9VUXVGSUlrQ0xtZ2JqaXZmV3MxcUxzNklUOFJmQUhWZXA0NjZ1dXZC?=
 =?utf-8?B?WDdtUWRVL1FIRWVjNUZWS3YzNDlvenFwTWVCbXd0aFJkNS9KeU5sK2l3dWdK?=
 =?utf-8?B?aVpnL2VQVDJhY2Q5M3UyZjBQU20rQmZJemkra3pweEZuWDk5UElTN3c4bFNn?=
 =?utf-8?B?ZVFrc0JYN2hjVHVTQUFuMjY5aGVYU05idGx3L29paHFka1ZTK1lvL3VnTVlE?=
 =?utf-8?B?a3ZCZlhjcG04N2V1UUszMGpmb3dJQlVzUHFBbDJ5cWVvVVBva28xeXB0OUw2?=
 =?utf-8?B?UGpDNnRRYkNRTWlTSXc4Ymc0em1aZTB0Nkl1TWlpS3lIUlcxZnhvcTNCWmdE?=
 =?utf-8?B?REM1ZTRMWC90d1I2eWVjc0J4M0c0L0Jqb3hqcEt2b1NLa1cvWnNiaTZMbXoy?=
 =?utf-8?B?Rnc1bGdDLzhpUGVoUnNNcGFCQ3R1cmhZSW5NdExrVnNmQnRzTnFNU3p4cDBY?=
 =?utf-8?B?NzdQeGpQS29KUWN5UytKdmgvK0NRTjVJTFIzUDNya2tCY0hOY3JMS21xbGtK?=
 =?utf-8?B?ZEZIL0NXUHJDTnQxb3ZYMWRBbjF0YXJQL2FSL3RFN0xYbTVRcmRVV1ErYVJI?=
 =?utf-8?B?SUJHN0Rsb1JjSWtBNFRDcVV5dzJiZFhHeGtodjZxQ3RxN3JhT3JQSU9Kb3c1?=
 =?utf-8?B?VkZJRWFIZlNlVXNSNUVlditoQlYxc1BoL2FsUkJ0R0xmY2Vtak9Pc0RkVWtt?=
 =?utf-8?B?dG50a0hRZjhFQWZHbU5adU40cDJmdTREanhyWXF2TEdqUzFOUGY3cVBKMm43?=
 =?utf-8?B?VEg4c1NsZm9yYlBaTHcva3dqcW9TT1ljdm1XOFp5ZmErQ21nY1BYdFVDaUZa?=
 =?utf-8?B?Q00rTklpRDF1cmY0eTJuZUI1QlE3ODBJUENSOEphRUlNWTI1NGRrcjMwWUgv?=
 =?utf-8?B?RWROTUJTalpDVXRuU3VxQkg0UC93V2J4SzIvQUNXQzRtT2VPeXBlZHlLQzJl?=
 =?utf-8?B?c1prcEFJYUMzTmVSeUVqQ2pTSSthNnRoSTQzcHVPMmFzOWp5RGduYVcwdGlK?=
 =?utf-8?B?R3g0N1ZmMlpzZGZUT2x4cXAzWnZMcDF0VFFMQzhrMHBXTHZjSThpUHZaYWVz?=
 =?utf-8?B?VG8yemxMbXkrUFNaNURoTyt2NUQzUlpVZ3lLcG5QM081MG15L2ZlNnB1SDFC?=
 =?utf-8?B?T3IyZUI4WjBUazBOaTJFaFB1a01rTlJXU1o5S3lGRU1MNzNWaEJxbm4xQVFV?=
 =?utf-8?B?ZHdoaXVkZWVydGZYZ1ZvSXBJMDFXMnRHTXV3dE9COUNTY1E3S3ZoZGFQNmMy?=
 =?utf-8?B?YWRBc0ptK21JTXo5S1gvbkFTWmRGU2V2a1BFNlBOZFI3OXl5ZER0TVJoN3JG?=
 =?utf-8?B?cm5ybTZwcWRmbXZ6di8yb0IzckMyT3Z1NmhySWhWSzVkdndCTzJkY3pHOFVn?=
 =?utf-8?B?TEJmZGNRMWF4UHNCT3JWNGhwMVJycTA5cjBTZUpINUhjRlRLR0ozSk1ZblhW?=
 =?utf-8?B?RnhIdFdVODltRmM4R1FmaVdxTVdVSEg4NFlFSURBWDRFSllvMmFCTWtiUnpL?=
 =?utf-8?B?QWh4MW5aOUdFTExMMVJIZzNYczZTcUlvSlg2MURNUEl2aGhRN3FjUUNwMlBR?=
 =?utf-8?B?RlBJMEh6UCtkQmlVWG1jRnF5cjZUdVdmd3d5c1ZxdStsb3UreXF1bXBqaUl5?=
 =?utf-8?B?aGFlOXEzS2MzWWtsQjhmQkVDZ21TZkZnK0tTNEJIa3R1WlBxWDBiWURQSDR0?=
 =?utf-8?B?L1VvS0VnUGZycy9YQWxVRlJFYzdHRXphMzVnQUt2OVN1QVRybW4zYWZ3QTlt?=
 =?utf-8?B?YklNcDVwZ2NsSmF2M2M3Z0p3VlExS0tCaE1tUnByMytDTFNHekJjczFvMFBi?=
 =?utf-8?B?WUpZMWQ0eFhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDBEWnI2MXpRUTE4UUFWVys2SW9NN1RmaUpGV0dDSlY0MEdWaUtJM3gyZzFN?=
 =?utf-8?B?T2cvaHNaT2E3Nm5vd0hIMXBGeWdRVFZxYlZBRlJtYkRNMVBkN3haQ0I5bWl2?=
 =?utf-8?B?Qmx2LzM2VGdZQXc3dEJFbGxxQzZxdldWVGRDWG52bVJsbWlHRlF0Z0lPUjhF?=
 =?utf-8?B?OFo3VXZGS0hodlR5c3NxVXI3QzRqRU82TXpLNjFOVE0rdUczbk9sU212NStQ?=
 =?utf-8?B?YTR2UlBoaTdkNWcxU3EvQ1JhRjA1S2dOaEpVanVSNWJjVjYwVEl6SGtqdU9o?=
 =?utf-8?B?cU93dmk0b09Bbk96Ry9UZytqOWVBOGlDK0pQd0NMWkE2dDF1dTFRQ005MXZX?=
 =?utf-8?B?UkM5MzNOMjIwUkpiMlg2bFh6WnNKOUI2YVBSbmZPeXdDSEtvYVpYMUxWUGdI?=
 =?utf-8?B?cFE5K2RKR3A3QmRSdEpmajQ5ZFVwT0ZxUWJKakxRd3pabGFuYnBiNDJhL3lz?=
 =?utf-8?B?TDdHQS9UNnZpMHc2eGY2L2NnRzJzWW5lckl2K1k5SlVDUGFuaTdKbmRuMnNK?=
 =?utf-8?B?Z1BjQnhIZjVNQW5xOHMzT2NFeU9FZmEvKzE3WEMxYTAwYXFGRFVxWnNEVjBR?=
 =?utf-8?B?UEVXRVNCOFJZMGpHMWdFakdOUHA3UU9temR6UnNBblJCL0dMSnp3a3dCTFhl?=
 =?utf-8?B?c1N2MmYzenp5Y0RnR3pqclc5NkFJQ0xDT2I3WWVoR3B6cnU1cjd5Wk1PUURD?=
 =?utf-8?B?RXgzVS9La2dKRDZydUUvbDFRRVlDZmQxNXJoK1YvYWVrRzN1MDkzVWZWekVI?=
 =?utf-8?B?dDlJMGN3U2F1NDAvMStGbzRySVNzc2t5a3B6RFNvdEg5VnM1UW1JbGxKcmtN?=
 =?utf-8?B?anArQW9jL3RhTFJkZ3B0M0xNK3JKOUJzdmk5dWdYZUtOMmlNL1pSWjNsVEJz?=
 =?utf-8?B?UFRTT1FjS2xpajB4TTFqUm9YTitTWTJkUkZtNENyUUhGTzVESDZYYlFuYkRZ?=
 =?utf-8?B?VU5JQWlOb2FRcW1nUUVRdXNFanJwSk8rdTc4YWFJL3k3ZnJjM04zYTN1a2NO?=
 =?utf-8?B?SjFaRWZzWkkzMnNNSm9UOEJvQ1IwRis1QXBxMkpxT3pBUjlGa0lEUFo3ZFh6?=
 =?utf-8?B?TFhJaGs1MGZYRGxMYXJTNGRudUJJUXN0cjZnNnpWUUZOK1AwaEdta0tCaTR4?=
 =?utf-8?B?VXpwN3liNXJhbG5nYmhKdTN1S241N2h6REFSR0lCMDNRYWZCd0pubzh6a1JH?=
 =?utf-8?B?eFJFcWxlUUgrbWhMVEdRdFJNb2F6SXlWTDBqMEd1TEhtKzVVZ01henEwbytV?=
 =?utf-8?B?N1JyOExkaW53cFF3TEdqNGh5elVrQXRZWlhJZk1XcjZiUVFWU0Y4SlR1SFBG?=
 =?utf-8?B?cXk3bUt0TUpRVmhFdGdXbjEwWkJiVHBwSkRVdzJoOTZmaXRFT2JsMHRWenNm?=
 =?utf-8?B?VzF0MzVhZEZ0anFCMytxK1JkemFGSytlVGg5NmVicEYyNTM3TWJIVnJ4a0VB?=
 =?utf-8?B?OURrdlZ1WXdkVzJIZTU0ZnJDOVNVd2hTNHRWNDBWSzlMRXFFS2liR1k4UHBL?=
 =?utf-8?B?Qi93YWhHWXl2dkpIYXlJY2xEdVpEK2lRRjd4L3dPL2IrbkpKc3ZGSnhBdHpG?=
 =?utf-8?B?d0t1UVhoY29ONVk3RUcza3JzWENVR0t5UHRhNWwwdXgxMXZjbVJRenEzRG52?=
 =?utf-8?B?dXJCSWFVQVV4dExUWjhXTEovY3NYeHNXSnUybDBMeEtaK1B6czM1MDdIb3dW?=
 =?utf-8?B?dndSaHZDZFJWM1lrNWs2cmsrQ05UNWpnM04wNnBLQTNhdFNtN1o0Yi9SSVpM?=
 =?utf-8?B?SUdjRDB3RDNWbnlKdUgvT1BTMUxiYkhacFgrTVFGQXVXVHhCRDBXWWJXOTho?=
 =?utf-8?B?Q2s5NUtiUDhtZnNodnJBZGRUZW9lQWMxZjZ5T1pHaTMwMlpqZGFHeEMwT1hq?=
 =?utf-8?B?QU1DcVplYWRBOXNTSFF5a29XZHBLMjhrYnlDYTd6WUNXbFBuRWQ1bWEya1Jr?=
 =?utf-8?B?WE5FUTVHb0Zpd0t5d0lBQ1lhV1lQZGlDemlOMk5mUEU5Y0NaT1lqdVpyajBx?=
 =?utf-8?B?eVR0MmE2V25jNlNCTHB5YVoyNWwzbHFLWURmSi9kK1Q2TnZLSloyUG5CRFR4?=
 =?utf-8?B?cWptNk1uY1hzSzdEL3dNRDdsb2Uxa0I4RFkvUHVLc2tuUnBISlJvTTlTaWZs?=
 =?utf-8?Q?Ozagra5wgE+wAoH/5yP875XH1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02e64be-8fd9-419a-7651-08de10cfbd6d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:29:15.7432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MoA7AsRlujfxs87oHFoLW31Tinv9jxN9hDDYeTAGJylHmorPmvcyNbtqjNgeqzjzHSSRm3x0aon1U3VSOXIQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979
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



On 10/20/2025 5:20 PM, John Hubbard wrote:
> On 10/20/25 11:55 AM, Joel Fernandes wrote:
>> These patches have some prerequistes needed for nova-core as support is added
>> for memory management and interrupt handling. I rebased them on drm-rust-next
>> and would like them to be considered for the next merge window. I also included
>> a simple rust documentation patch fixing some issues I noticed while reading it :).
> 
> Just to be clear, it appears to me that one must first apply
> "[PATCH v7 0/4] bitfield initial refactor within nova-core" [1],
> in order to apply this series, yes?
> 
> 
> [1] https://lore.kernel.org/20251016150204.1189641-1-joelagnelf@nvidia.com
> 

Yes that is correct. These patches are now in drm-rust-next and I clarified this
yesterday with Alex as well. Sorry I should have mentioned it in the cover letter.

Thanks.
