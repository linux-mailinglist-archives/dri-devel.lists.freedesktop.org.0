Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74404BF81F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 20:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761DF10E243;
	Tue, 21 Oct 2025 18:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I8oRWLDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BAF10E03D;
 Tue, 21 Oct 2025 18:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFIJk8/mOtVGDuay8/yx9Chddv/xeFGYOgXfDrqspNslWD7Uj2bN2ifjpPgvB/L+UB/i26D4MhbsnrtrMifIbI0N1NvxlCf54ffZQH/4SXSo7UKApquiFrxfTU70CrfMzI5PknXSLLBKlPhgmQvgdmtqErY89W2S56Hg8wEWHWgWCutXdLKCjejl5XZ4gPaX547vhe1vT5GOfcbDDzEVlTSBzwlW4xDjAFGg5xf2j5cpVhBQZSkBiHemZH3iQmho+z5Zujpah4UpjWNGINC7NoHMNLarsH70h21JpbauWngOJ/fOhQN4NlvDQKow414GZmsD2MsrIYActUT8H0SXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3qn25PaHuas3fE1oGlu36O0E4AO8h29xsME/q68W44=;
 b=H/Rqanm9lRXlVsA3vCMjHJRje2Gtl2s5h5ehh/YBmzt+Fdpz1koPh9EWkvo6TNnoga178U7ntcdE0V9OfRNuU2sV2kRaFBBC8VPUSmziNeY0MSVEIHDlIqXylqXiuxf8QrHAtLuGROhU9J4VYQ1l4JWqxUhvDZxRWsFOHxN/05cUnH2zmkK0YrIphgUp522pPqQg5ETfYgBU8BebymCfoUkQ4fsWjzN3swdBHmHE+VrW0HnqfmvN1CzDWyLIE5ybyQCPgkgeB1RZ57nGjUpTG55N+cKoCaNSEX0NEv+Ld0xbJu+qXml3Eq8gv+Bu4lco0d6zFuLmqn+zz3gCVwVrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3qn25PaHuas3fE1oGlu36O0E4AO8h29xsME/q68W44=;
 b=I8oRWLDorX4ZTL9H0WT4kY5ntgxHuY3hubNzlg0D0853oauB5RteSSxKmasSCj/dNygfN5hwmj6P92f/TLRYpRXVN5Af2u+ld4d0oRGDb/FBj+yayn1xoKkLM5XnNJvRQttvb4CbX09GrNjBZAmA95alQsAe2Z6f2eGlAQChZ2DeLp+U/dWZHtAQ1ASvzfRROLE/B7ZToyf3uFcByfB/mt/N1uTlQ5FQq74dB3l8+pxxR2+Rfaaz84lj632uzZeF81POxNjT4fUgZVZBgz8DpRJhsyyT7qFtreY54cT/23sbzm3Mo/2S+HueZcMef0qZZZSvziDEGo0YmG8QSksgpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 18:42:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 18:42:04 +0000
Message-ID: <11a41de2-752b-4091-8b76-954678d08efc@nvidia.com>
Date: Tue, 21 Oct 2025 14:42:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
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
 <20251020185539.49986-6-joelagnelf@nvidia.com>
 <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:208:238::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: f4945f82-d496-49a9-60d5-08de10d1878b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHpSZGxjcCs2emJsczNSb3gycEpWRTFFR2h5QWhlbGFoL3NVSFdaTWJmZzlw?=
 =?utf-8?B?MkdTVGZDZFN2YWZVZU5LTVM5aTBkRFZBWUJDTi8rUzROWDZZTDNtaU01UkVO?=
 =?utf-8?B?V3BJVHVHQ2JkMWpwWG1PRnBJakZBTHJOL3hVRjFGWHZ3and2YVl0R1JMME91?=
 =?utf-8?B?WHBDZ1dVaWl0VWdQdDkrVDQya2lkRk9UekdYWmUveUc5NytQRFdqUC9tbGNz?=
 =?utf-8?B?VGtHZkJKTEZYd2llLzZtUnBEK1QrMlgyZkEvWTd1N3dHOGQ0Rms2SUNuMWtP?=
 =?utf-8?B?UWxaOTBwTStXL0xhdmtNUUZOemJCWHdFRmtrSkdFZGFMMUNCUVNzNC9KRUR6?=
 =?utf-8?B?Vk9lVnR5SkcxRHJOeVRYVnFhc0Qxbmt1RENuMjIwVkcyM0pSNmJ4NEN6dDlp?=
 =?utf-8?B?OThzTTR4RWhlUzZKSkROdE1lQk9HdzdJcTBDaU1XZ3FpbnUrM2JYVGVVTFNs?=
 =?utf-8?B?SFNJOGZGZE1UZGpHbkVzSUwwUU9zQnNRT2p3YytXRllRMUloM2k1S2paOGxz?=
 =?utf-8?B?RXRBSWRGc2lUb0QxYUFNcXgvRENSYVVkckkwYVhGM20wTTEyWUFxT2tzcGE4?=
 =?utf-8?B?S3hHRUZaMHNvTzVyOVhYRklyQ1ZEWDMycnYrRDJkOUFxdEQ4WW9JTVJIcktK?=
 =?utf-8?B?empCcThacVZoQTVQSUtCWTAvUmk2RUtWNjA3ejVMRXJ5MkRhakRCNGNmNDBx?=
 =?utf-8?B?VTdSakNvVjVud1pxaGR0a1V2dGVpSWpOYngxWm9qcytWMDN2MGY2RFh3Q1Z2?=
 =?utf-8?B?SElmcXBLaUhxb1dwOGN2Z2Q4RU5OdmhuMjhuRGpYOTVkUStJdGQvWE8yUnBz?=
 =?utf-8?B?aFYrb29lVG5qYVdTR2ZrWTZuU2dPZ0tVWnJFU1o3M2dsZ0tPWEtXSHhKcWFr?=
 =?utf-8?B?V3hlZnFqeW5JOHQrTTdKdnlCNEpjUnYxckVlRURXc0tHQVdpS2owNXowZms1?=
 =?utf-8?B?UFlLZVRTK1NWaHNybXg2RHo0VUxKb1RUR3VDd3U5dndOOGsrcVUzY2k2RFVD?=
 =?utf-8?B?WnJHZ3R1WjA5VjVoWVVzcWgwNkNZTnpiVWtWam9wcEs1OWsxVE84QVBaeFUw?=
 =?utf-8?B?TXZNMnZJNnZRZmcvL3Bqb3BTbVdNU3g1RTBwUDR0bkJjbUs4MmFKcE04cW5j?=
 =?utf-8?B?TklhRVJydHNtVmtqYjRiWVZMOXZza2V2Sis5TURxakZ5bTNsWTRXQ00yZDR0?=
 =?utf-8?B?ZXhkTnJ2WXN0SVdFWGpGWmlmMGs4T09SdU1IRFhTSUU0WmRPMG9KcDNtUmhK?=
 =?utf-8?B?VUtGeUNZcmExNHl4U0RvaHQ0Q1pqZFNpOVNnaGR3ZTV5QVlyTUU5RzFlNkNK?=
 =?utf-8?B?T0xFdHJpZisybVZpa3MvYUJrNVhkQUE5WU9EcTlGODM4c202ZnYyZmtod3dk?=
 =?utf-8?B?Q0R4UGdaWHpnbUVsWWlQNmZDVDdBMGNlTm9MU1pvTG9UdEdOejN6VVduU0hx?=
 =?utf-8?B?WFBOeFBIaWpnZGxjaW05OVZMYXExU2J1SldsdmhSbFJrWkkrQi9FRFNyUHJp?=
 =?utf-8?B?RHlCd0RSQndJVmczMjFKdEphM2tOZXZ2cU1lQUFNK2ZOdWd6dm9wb0k0ckVE?=
 =?utf-8?B?WDlzekhHRjlWT2NWZ2h6Q2hFNzFtbVFtZEZ2cHNqQklnUTVGL01SVVJyOWsy?=
 =?utf-8?B?WDgwcEZ0b3VFWUd2djRzNnE3Q3pRcWNsWTEzSlo2c2t4L3dWMGRsUGtkdkt0?=
 =?utf-8?B?VFVIcGlGNG1ZTUtPSGl0K1lsczhSQVdVU2ZCRlN3NG5ZcHhnSHh4cndTM1M0?=
 =?utf-8?B?WnhTT3VXK3lSVWk1QmI0anJ0V1hQMUl3bVBaenpXZGNwNE1TTk5hVm00VTRO?=
 =?utf-8?B?VWFIMWlZbGQrR3NQOGYrRi9Va3FIay9NNjBtN1RiSVRJUjdWS0pZVUR5RlJ3?=
 =?utf-8?B?ck82T3V4TFNXbXJpZk1YTWdodEpBSFBNYUZlSmZhbjZWUkVubTVCSEtvTVdX?=
 =?utf-8?Q?IVcl4uyfMCXfCZiG8DFgSxTj3Ab6DU9d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJDSFpWQk9rTlBtMWYzTzcrcTRVeTNyd2dvM1FRdFFkMXBDTEhYRXZnMXhW?=
 =?utf-8?B?SFhsaVREemJvZlIyWDVlekZRZHdwbHc4Yk9Xa0IrVFVlVkMrUUppSkd1WWNT?=
 =?utf-8?B?U1p5RGIwUjdWb2ZYWGJRa2d4TVBiYSttOHRDNUdsbHY5Z1MrVWJXd1F4elFP?=
 =?utf-8?B?b0xYcHdYYnhUWFduMEViU0JRdmg1VVJHbnZUMzZxUXpGZmJ0ODZKNkZhcG9E?=
 =?utf-8?B?THJEQXc1eThKWjRKazhPN25kWktsZzBmOUNpdUVOZUw4OW9JQ205U0o2eDVE?=
 =?utf-8?B?dTR1VU50bXpXdjVJaDZjVXJDNVBya2J1dWQrUVVqeTlIRWJYdmNoSWJ6V0FL?=
 =?utf-8?B?UHNFZlBXS2F0UFJRdElqYjNySjhoSWJUUjlEOVVmTjgvSnZ1bnZyNHVuaHV1?=
 =?utf-8?B?V2V0YTYzVjZMNGtrYmZsbGxrK1JRaEYvd2k3ZHB5R3cybkI1bEFPVFlYeXE4?=
 =?utf-8?B?N0RlOW00V3RrTFljK0R5QVRweDM3ODNLaGRPNkF5WnBuOTdUejRnTi9MbVZt?=
 =?utf-8?B?bC84azloWTBiK3R2RDJrUGVMWjU1ZzRNY0JXd3ovQzF4dnBoWFJaUi9hYlhT?=
 =?utf-8?B?Uy9IdnVQb3pIemIreFdxakhQczR4NlorN0dLdUIxaHRoRXdPdkxuTGgxdXVj?=
 =?utf-8?B?NmpTc2lHeG8yb25XUE55UmlDb0lWMmhVV09RejdrQkhBMjdEQUVUTGhGUEox?=
 =?utf-8?B?bW42SjZqUkMzWCtBSGw2RllhMVFpSjVrbHBzK0QxSHkwYW1oTXdmM2JCTzRz?=
 =?utf-8?B?Qis2M2plbW16a2R2bnMzektPUnp4Z0oyeFNxU3YybzVBZlZ2dnRiV2ppbU1j?=
 =?utf-8?B?eWZITmdnaDhJQVZ5SDA5d04vSitVR3RId2swcG9YOFI2ZVY2KzlsL2psNWVv?=
 =?utf-8?B?NGZlZzRhWkpqRUJYd1QzVFVVYlh3d1l2UmNtc1NhcVE2SkNNME5sbnA2cnoy?=
 =?utf-8?B?NkdnWHFzU1dWMW1wZkNwU3BGMjRGY0J0c0YzSGIyakpDc1RQTkhHZU1OcStG?=
 =?utf-8?B?WlRzVWJBSEhJMEU1dGtyMG9BSTdaZkdVUjBWdFRWQS83VVV3M3pkL0NpVnFl?=
 =?utf-8?B?ZCtLUEc5UklXQTMwSHhjZEppSnI2emszSUZBV1dDZmZYNUFQS1A2ODlyRmtw?=
 =?utf-8?B?T2lIck90WFVGejUyZFlpRE03Ny9Rdk5BNTJlWVBRZUxidXlxTFNFRkhNOHV5?=
 =?utf-8?B?RmxRRCt2WHVvQ0ZrQUtqb1pHRFg3eWs5L29ONEF5dWdQeC9uZmFUUTFwaUxK?=
 =?utf-8?B?UFBFWWVVbE9vK2tTdXoxQTRPajQ0bG96S2NiekFmWnVQcytXNDNiMmMxdlcw?=
 =?utf-8?B?Y0lWZmpLMnZVRXFYNDBGNUVuY2VIUVRyS0xJVHpEbTl3bGlYWmZQWjZSOE1C?=
 =?utf-8?B?OFI5UXJyTWZzUXNDTDlEci9FcmhHMEdWblJOaEg0K0FzTW1yWmFLVXZrZzhl?=
 =?utf-8?B?V2RyRkY5UTZJVHlQTTk1ZEI0KzFaNWM3RXdmQ2xUWS9nRU9UVW5DNXI4N2FN?=
 =?utf-8?B?U0RHREthNVJWRWJSTnhzcHF5UFp5dnJaQ0cweTh5VyttTVBvVnQ4dnIzNVha?=
 =?utf-8?B?emtabGJwQkFkMTAvVmhyVENrMXROYXJZekFra3BCaHc0WDgvU2NDck1ZZDVY?=
 =?utf-8?B?V1lzSTRwZjBvYVZWcm9NZlpPM1cyLytxU3NQU0RUb2ZmUWVmdGpHOFZ5djVJ?=
 =?utf-8?B?akc5cGF5WmYrand2NlFyVzlodzBCSFN6bEJsb1ZTZ3dISUwwYlRJNERTbnUy?=
 =?utf-8?B?ZmZUaGE1dU81bE5GVHVpWE9FdGgxVmVzOWdpcTdKYU9ISjM2ZmxQZ3Z1Sm52?=
 =?utf-8?B?endzTFM3aHhpN05QOUJFakRiUU9tR2I3eHVhSFR5SlpnenFNMVlnenIvaHpy?=
 =?utf-8?B?RlR3Q1hZTzhadHNDUUkvNEdwZ2M0Y0lja0lkNWwrRGthZ2kvZ2YwSVpwMmVk?=
 =?utf-8?B?bnIvdU1mNkN6dkZpOFRKb2pGbXJCWlUyNU5MRXRIRlFvRVNZRSszVVVLSER0?=
 =?utf-8?B?K2hZVjRhVFVuYUcyNkZObFRsQ3VIZ1ovdGlwYW5YZ3YrN0l6OG8xTUVFQytJ?=
 =?utf-8?B?dkpPVnZSZ2luenJMVkxESVNjOVV6dEliU3BYNHVzODY1b1BYUk5paEdvUDlu?=
 =?utf-8?Q?ruouiXg894SeiBucjEfFdsjqm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4945f82-d496-49a9-60d5-08de10d1878b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:42:04.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZWVD6NBkd25n1ueFkoPKOZAfzaAYY55fWUs2PUBnAOF/6ug6AeMEVyZpS0AwEXE22I+s1PUwN7k9AxGartyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
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

Hi John,

On 10/20/2025 6:35 PM, John Hubbard wrote:
[...]
> Joel:
> 
> I am guessing that there is never a situation in which we would *disable*
> these interrupts, right? Just thought I'd ask.

Thanks for double checking. At the moment, we don't have usecase to disable
swgen0. I checked my prototype code and Nouveau as well and we never have to do
this.

thanks,

 - Joel

