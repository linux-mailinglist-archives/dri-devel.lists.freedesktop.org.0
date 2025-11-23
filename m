Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23CC7DB89
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 06:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EA110E0EE;
	Sun, 23 Nov 2025 05:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hsv8O09H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FBE10E0D8;
 Sun, 23 Nov 2025 05:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCypEuHaSCXWnsTpY8XWQ2gyGhekqcAvHllzvypNlLLNxRv4RiZR+YaX8oKrLoodbiOL0J6NS7LBYbDMWHukMpxjYfcJ4Rq2GxibVIB1fqs/yUOsIHQE6YtXydMknkZ9PJXsV0hfYlV69Vqlsc72yd1aSLpJdITh2s+VFj6KSeHn2eEeFkHSZwdbVQjfV58eivsUoh6kzE/ZTotBCoD4tBTNiI2ksbq1s3JXoqAgUdR1blyOtBt2BlCvair2RDKbB4i0DkcSC1IBbzyBr7KHF3elO8Q0UvLMqcmMOzpbe/1CavaeN/Hn96NMEFPfVOrvKsCJkqX3VXJActBg/v8BYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ciz2U0uaM2FPGycx/hvOzIZfxN2/VU1Mmza1z5llg7w=;
 b=yZXxkmswSDHMxXCYtzNClOuvUXXP2iMfKAOsZk+pIAwRZaXWPQyqxzDCwCG4wfBKHqKuO+ZnmFy4Ms9Bgdlbpy3UeaLMZXwNurDEwRrddirJ+X6+SEWC4fui8/Ovo3dHfOxA/vcczR7QyRNZg+fpM5o+RMVoLbMehM5Q/2me6bUlxzCbKXcuR1c5lmYpaVFSWqdy7JrrzuUdHE+O7MjBIqH2SeSdgTjIUp8VBnIBAIJfCkWTrF24ZORWXYOLcYNveIcqp9QJdmC/qwWfVombkbg/2/hrgWPUQbxQwmmz8KHEFN1nzu/5DGNicv4FVTUGVqtW311d59ky+qr2XMEb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ciz2U0uaM2FPGycx/hvOzIZfxN2/VU1Mmza1z5llg7w=;
 b=hsv8O09HVZQQ5BTAPM1qKlh5fhUW6tBRct+OpCj7KwGFF9D3s/o0PLETo6Q9Ejhnz2QY/R7udLTyYPFUT+/rA9w75M+2UQcWs4KBI6eHw/rnxMz6Cv5jsPo5z6yP6Bc3o5GuaOROg/IsdUj8TglOmeGYzjQPVvWIX4cvZRSWi92YMZ7jfEdL2IR4FX0Fl4BPoZTC8md1DAdtItK/AqdwM9jVq90nQgBgvE2Kf9zWejNHJnGxHfkqvqO7p3n3tG+EbNqalB6uSUjijJyG4n0UxQ480GitHOlGkY2ih3JLhRDhs8qhdQRUk0mdJ93g0bKq2trkSbJpkEqn8oudLv+9/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 05:12:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 05:12:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 23 Nov 2025 14:12:15 +0900
Subject: [PATCH v2 1/4] gpu: nova-core: bindings: Add missing explicit padding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-nova-fixes-v2-1-33d86092cf6a@nvidia.com>
References: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
In-Reply-To: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: d2491192-6e6b-4c1a-5278-08de2a4ee345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVM0TDd0TEhwNWIxb292SGVsU1YzZXRHZ0FtcHJUZksvdXYyUUh4ODJJY1Yv?=
 =?utf-8?B?QmpYL1RkWFZCTjYxaUJhTkJmeWN0ZHVSTGphZmlqMXd3V05hWEJDRXhzVGRn?=
 =?utf-8?B?eW9JQ2dUenBmUzhXN0NDTU9OY3F3NWcwY2RoVVFiSFlTdExTQWZJM3FJeUoz?=
 =?utf-8?B?N3BWcmI1c29acmZ2WGZvTS9CWXhRaFUxMmVwRzlXa0pyWmpWSkJSTUdZUGZM?=
 =?utf-8?B?RDFqRnI2S1cwTUg0Y0cyN1BlMlVQdlBSTWsxK2NRWU9pZk42VU94TXJUSlJs?=
 =?utf-8?B?Q1NBb0FKUEVJNmNmZldmbjNLd1lsaWgvblF0R01DOXUrTVY3OEZ0MFQrK3kr?=
 =?utf-8?B?eXpKeWQ3ZTFNanRVblFNUnl2dHJlRXBySDk1M3lLb1JuSjYxM0lENkk2cEtX?=
 =?utf-8?B?OWpuYUJ6anl3UCttUldBd09QSWVHMzY4KzBLOXNlTjkwRDAxaFI2MGxDbzlW?=
 =?utf-8?B?bkFjVW1OWlZVNmxoR3BiNlE0UVhvUENiekJlWk1ma1V0eVFpSlJhMGtORG5w?=
 =?utf-8?B?dHBWcUJLV2VQTVpJaURFL0hqYVByaUNzV0phQjlGdTk0c01WVFNiZFNVeVdn?=
 =?utf-8?B?ckJiekVtaUQ3aVBEeGN4WjFBTm5za0NON1UwUy9MYVZzaExrWFduWmR5SHhI?=
 =?utf-8?B?K0Z5ZUl0aXB3V25kMXpnSUVFMFB4Q3d1dWtDNVNHUnJpamI2VjJKRUhQY0l2?=
 =?utf-8?B?UU1uclFqYkhaRThYQldLREZJbmgvWXBtZE1MdXdhTDdYWGcwVXg1b2srS09L?=
 =?utf-8?B?ZzRERUcvTGxGUU5EcEZ6QjNkRk9XRUpWcitiMVo3U2NYdjNkS2RFWmY0Nm53?=
 =?utf-8?B?c0FUM1JtMWlOd2orK2N5NWExNkluTzY0aEFzeFEzeTJxN3BFTDlsYnI0Qy8w?=
 =?utf-8?B?ZnVXditYdXdXMGNYc2dYMjRmT1VoVGtZSFRLUnRieFRuYURsOTErYTBzVWpV?=
 =?utf-8?B?aExTQStvWjFRZ0RkOGZNU1BCZitlQTQ5bFgrUlMrZHJrK2huQ3BzRjlMblpM?=
 =?utf-8?B?Z0JsTFA3Ky9lSnBTbkxiU2RBZDE4cG52a1JjaXhJZkVhbW9sZTZ0WnRmWEQ2?=
 =?utf-8?B?MGNrQWlzRnZxK1lIZXFydUhaR2lER0xCRDhpWFd3T2dvSFBTUDR0RURYZnFW?=
 =?utf-8?B?Q3VGK0krNG5mSVdhTnJ0TVZhK2VNOXQ3R0I4L1VRbFY5NW5LL01oSHVVRVkr?=
 =?utf-8?B?eWVrNEhqaHphZElTRm94bEs2QzFTbkVxbUFuMkxuK3JJSWxoWk1Nb3lMU3hl?=
 =?utf-8?B?aFd4aWVSRkVRcGNTY09hSmlFbXdDTHJvV2ZUcXN0SUpzdXQ3SVQ5RUxDTkV1?=
 =?utf-8?B?NlFWNjlldW1wRWZKdnVnMFFJVmptbkVCNlQrK2JpRUFrL0hPTVpKY1Y5ZGNw?=
 =?utf-8?B?NTVYQ1hEaWtoWmwzT1g2ZmMwazBkT0Y3YkhON1BzNFg5ZmJ6VDJVaGI2V015?=
 =?utf-8?B?dWxFZTVZbHB3Y2dCQUxwb0tjTExjY1ZMUmJWZElBcXVzUzhpbFhlbUtxcEhx?=
 =?utf-8?B?MWVqUlZGSk9FZ1FObCtGNlltVXpWbVZWWVZGUkJDWTY5TUVURlQwR1Z0NW1D?=
 =?utf-8?B?QjN2eDJCZVlIRnJhbEdvaThwSlczNlQ0VXpscS85bWpldkJOY3RkTUxaNnpp?=
 =?utf-8?B?NzNPUGNQUXdSTmVnMkRZUkw5bkNpSzlQSDNOK3JFK3JsUm53MXl3YWdDTEQv?=
 =?utf-8?B?cWNLN3MyeEp4TjJmRmRXRnJKdi91cDRDSERJV3RQSGg2dDhNeUZtSWViRUUw?=
 =?utf-8?B?dk41M0Y0UWVnamlCbUtmN0Yzckpkai8vbTJIUUpVZUFhbHA4Q1RCUldTWUh0?=
 =?utf-8?B?WkRTeFhXc0I0QUxMOGRRaHFaK2JncEs4ZkM5empBbklnNVpIcmU0V0REaktB?=
 =?utf-8?B?WHQ5L3k5Uk8xYUVTcmN2OG9mSnJ2ZVZCandtN3NOVEs5aHU0YzZEZ3l3Z2NU?=
 =?utf-8?B?T0RwdUU2aURwUTlzMEdHdWlXS2J2VTFNanpNUUNPQmRrenl4STZGM2tONTFL?=
 =?utf-8?Q?Fqr7GK0PLp63foGvoFmYwUBDHwoC5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE12T3RRbUkxbERqcFFiem42R29ma28zejkrOVhiMVBXQXh5NWRlNmVnYVFP?=
 =?utf-8?B?WFZOZ2hiNU1aajNyVm1PcjN4UTY5UHVwa05LN1M4bWhsVDJNVmhldng0Z242?=
 =?utf-8?B?Ry9CazlkNXFjWVlDNjVQZWhRYW1hMkhLVDBuejJ1RzlId0tCKzc0VE5FcDh4?=
 =?utf-8?B?cWVLd1p4YlhmU2FTQUhXWHlNWXU2R01RS3VWdU5ObkhYcTlBSkhqZkRDMmNs?=
 =?utf-8?B?UklrVVNHS1FjZ2lncDFMNDF0cDlpZmFrdGdjVmdtL0phSVpqSmlZM1R1K2hm?=
 =?utf-8?B?S3hsTFp6aTEwK3licXo1NWRrUUcyYUh5MllCcnZCRGN6RTVJSS9JalRxcXcw?=
 =?utf-8?B?RU02NFN5OG9wN1gvOWtmWGtLcjZySXNncjVZS05lMlhraXl6WE9mVW5GMVNG?=
 =?utf-8?B?S3J4Nnhnb1MrQzFRb3Y3M01RWDRjK1hESkJLNHNvdVNuR25RemZDbXlRblZR?=
 =?utf-8?B?bXhzTENSeVMreFIxVGtybHRXMmJ4UHhSYlFBeERFOHkxYnhSQTFSZTRIUHZs?=
 =?utf-8?B?OUxWZXdNRjFSQkxUK25TT3NTZzR3L0dCZUo3RlVPWUdaWWc2WmZPcUxydmJl?=
 =?utf-8?B?VVpwVE1LY1Q4NXhqdmVFa2lpaCtJdjZ4RDVJMHBuUVIrWUxDQnd1b1pqeUhX?=
 =?utf-8?B?MWY1MlI2SWxPcXZUZUdrNzhJeEN3S2l0WkpRRVlrNTVLQjcxZTFUQXFHcmcx?=
 =?utf-8?B?QTZsZkxWZUVRZ0NDaEN5ZFhPdGRRNVErQ1JvNlFCRVRKU3JMakRLUngvNVpi?=
 =?utf-8?B?UUoxR0hzMFdRZWxkUzc2UjRrV3V4MHdjOHQzRTRWaURvUkxtcm51ODRkd0ZX?=
 =?utf-8?B?aHNQK0RUK0NtTFU1RWJsblZ0dCtETUFpOVJ4cHp0WVFFakZRZ05QZk1GZHZY?=
 =?utf-8?B?UnFpOUVHdHNkQUdLNzBrRmFvc3JVajZDamVKZjRjVTVjR2F3YTdqNUVrQzhv?=
 =?utf-8?B?dmN2N0NWMzdJRVlncHJQVi9pMy80R2JxNkdXM3ptTERTeEV0MS9Ud3ZDRWti?=
 =?utf-8?B?bWw4WnAwNUVaOENIQlpST1l3WjhjOVludDFVWW83Q2prSWM2WDlpa0dybWdr?=
 =?utf-8?B?eVUyQ2ErK0haZk10VUlpdWZVVGhQejI2WENaQUpoZGNOUjlvR01vRFBnWHVl?=
 =?utf-8?B?R1J5bWViNU9OMjlwVG14RnRnOEZUeFozU011dkxvNGVJOHcrakF5YnhqdVV6?=
 =?utf-8?B?S3BJVmdiVE51M3RjU2xwM0ZxUURLNks5MThLaitZMzVkeU1wdXcreXR6anFS?=
 =?utf-8?B?UVJyaGhNTythNy8yTURZMzlxemMxVFZ2UDk5WkpqYmV3dnRhbW5xcERCZE0w?=
 =?utf-8?B?L1VxSjlaL0luTUFDQ3FQdXk0MHBqUzNCbHBUZFdwVjNzNi9DNURrdXJwcjNM?=
 =?utf-8?B?QmM5L2NHbGFFTHJxYU5aMmlxQlRQQXRUa0hab0wvOWNtajBiczZhZnN0WnI5?=
 =?utf-8?B?bUpRS2RrVDRZN3FLRUMvUktrWWNrdHJuYkxDaVNzNWkza3JnVWttUTlaMGlO?=
 =?utf-8?B?VXpYTVRnN0JxYnZMcHFvUFNuZW55aXhVUmRGZFRkM2hOS1ZZRG80b2ZhMmpl?=
 =?utf-8?B?SVZ6NmFFbTdQVmdhU3dCejJYNTludERpVkUwRjB4R2VXeGV1YWlJc1VZM0s2?=
 =?utf-8?B?OGpRcjRrdmVuZjA3Q2wvaW0rVzh4UXFLWVBxS01wL0l0UkdSaEp6QW1IMUlL?=
 =?utf-8?B?N1JpaTdJTGtqRm1OdE1CK0p3Tk00cWljUXZrblRVZzFSSS9XdHBWT0RKY1V3?=
 =?utf-8?B?WHI0bHFNd2hLRGZsRDJrNExzOGhEa2NNV2hQVEtEeUFHMnJlVW1XTVVPQW9a?=
 =?utf-8?B?SGtmbGRaSWVPZ09UL0laNUVPU3ZuNDdVVTdFZnVEdlhzVTNXdGkzMnpLWGM5?=
 =?utf-8?B?OFBUWlIyRUJFWE9RVEhVMExDU2FaMjJ1MGR4UlBWUDlBVFlKM3JkUmdkeDJo?=
 =?utf-8?B?bzNrUHF5Y2tSMW02YzY5dm52VEYrRllEU0VvbFMxWFBOdFpxSU5OK3NRQ2Vq?=
 =?utf-8?B?MWVSZWF3NmRwdHlJTVNMQ3pLMllVQkgvRVdhSUlRZkVHZGRXMXg1K2FHWllV?=
 =?utf-8?B?eE9xMGJROTJuYkxHWVJyUmNJZWNJQjJxQmZGYUllaTYzN2twSHVmbkRFMENY?=
 =?utf-8?B?SnlCTGxuK0ZHdjNaa1gzWVN0QnRLdmVnKzZjVUFQZHBDT1Exa0lsQ1NLUklk?=
 =?utf-8?Q?t0e4IWBgmetmojwr4VjxmYCqf6hsjhpI5rYC8wfHeziG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2491192-6e6b-4c1a-5278-08de2a4ee345
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 05:12:24.4336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z3Zt2FELeSjAa4w0aaW/Dh2TMtdpHaxWATF4r6FHJ2JbLmPEeh2YuTUT1qe6qH8wPeDPGe1h6TOwV838ao/FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

Explicit padding is needed in order to avoid uninitialized bytes and
safely implement `AsBytes`. The `--explicit-padding` of bindgen was
omitted by mistake when these bindings were generated.

Fixes: 13f85988d4fa ("gpu: nova-core: gsp: Retrieve GSP static info to gather GPU information")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 5bcfbcd1ad22..5f0569dcc4a0 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -325,6 +325,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub totalVFs: u32_,
     pub firstVfOffset: u32_,
     pub vfFeatureMask: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub FirstVFBar0Address: u64_,
     pub FirstVFBar1Address: u64_,
     pub FirstVFBar2Address: u64_,
@@ -340,6 +341,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub bClientRmAllocatedCtxBuffer: u8_,
     pub bNonPowerOf2ChannelCountSupported: u8_,
     pub bVfResizableBAR1Supported: u8_,
+    pub __bindgen_padding_1: [u8; 7usize],
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
@@ -347,11 +349,13 @@ pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
     pub BoardID: u32_,
     pub chipSKU: [ffi::c_char; 9usize],
     pub chipSKUMod: [ffi::c_char; 5usize],
+    pub __bindgen_padding_0: [u8; 2usize],
     pub skuConfigVersion: u32_,
     pub project: [ffi::c_char; 5usize],
     pub projectSKU: [ffi::c_char; 5usize],
     pub CDP: [ffi::c_char; 6usize],
     pub projectSKUMod: [ffi::c_char; 2usize],
+    pub __bindgen_padding_1: [u8; 2usize],
     pub businessCycle: u32_,
 }
 pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
@@ -371,6 +375,7 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
 #[derive(Debug, Default, Copy, Clone)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub numFBRegions: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
 #[repr(C)]
@@ -495,13 +500,16 @@ pub struct FW_WPR_LAYOUT_OFFSET {
 #[derive(Debug, Copy, Clone)]
 pub struct GspStaticConfigInfo_t {
     pub grCapsBits: [u8_; 23usize],
+    pub __bindgen_padding_0: u8,
     pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
     pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub __bindgen_padding_1: [u8; 4usize],
     pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
     pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
     pub sriovMaxGfid: u32_,
     pub engineCaps: [u32_; 3usize],
     pub poisonFuseEnabled: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
     pub fb_length: u64_,
     pub fbio_mask: u64_,
     pub fb_bus_width: u32_,
@@ -527,16 +535,20 @@ pub struct GspStaticConfigInfo_t {
     pub bIsMigSupported: u8_,
     pub RTD3GC6TotalBoardPower: u16_,
     pub RTD3GC6PerstDelay: u16_,
+    pub __bindgen_padding_3: [u8; 2usize],
     pub bar1PdeBase: u64_,
     pub bar2PdeBase: u64_,
     pub bVbiosValid: u8_,
+    pub __bindgen_padding_4: [u8; 3usize],
     pub vbiosSubVendor: u32_,
     pub vbiosSubDevice: u32_,
     pub bPageRetirementSupported: u8_,
     pub bSplitVasBetweenServerClientRm: u8_,
     pub bClRootportNeedsNosnoopWAR: u8_,
+    pub __bindgen_padding_5: u8,
     pub displaylessMaxHeads: VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS,
     pub displaylessMaxResolution: VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS,
+    pub __bindgen_padding_6: [u8; 4usize],
     pub displaylessMaxPixels: u64_,
     pub hInternalClient: u32_,
     pub hInternalDevice: u32_,

-- 
2.51.2

