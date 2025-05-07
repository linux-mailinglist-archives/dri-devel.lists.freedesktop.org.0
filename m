Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EDAAE173
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9522810E7EE;
	Wed,  7 May 2025 13:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pcx0oLYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFB410E7E3;
 Wed,  7 May 2025 13:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjrNagsXFe1o+JvTOlAIl+SHeST30XrMunqKHpbUugDgybhmXgGz71aHJi/OU13HQRFFECOWdzMyp5DKb7++arBD27uMCjGwO/t+n4cBVBARhERCI5dnobMiAJSOB0hH9Pc2vKjtOMBIM6rwC320HLtpigy2rHgLlgeBmIrOORA5yON9K2Pb4kpMXMzj5JcPKsls+gkgzHxr5Vam+fYPuWLL/UNIUHSSeVAjfqG4d6KJPMKy1PEVbIVf9izDzjP+ROqFIyW+MKMwmN4aiFLfcypYawhadwGWOpAkZ6ImA7/HdlSik+O+qbquCpgZ8vEONZs93FpR/eUIW7hnqy2S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0XSSE+gGuC/kzji0z0yuP9SQtLxnli06ibvbZvjMqs=;
 b=Cb+eAVCQ7kZc1l82jY8Jb38tAsXvr9vLVIBlO2jb+UGgppJBKPyAKcoHPaQBA963JimXN142kBOBnNLWaTMMNRMYJwzMThik5JGGO5fc8D9QgtKpvbE6nw5aFO1pbXuHpxKMDAgOjupoCbGuhxiJ8UfQWm5IoDjl2p59rJs35zLWEwVS2hm64njmq/4eVypy0yOMDhh9eIojB1bHDhMZbi4SQ/Fg7vJR9rIwdzdcEDPeq0FuKjU6b2ZiUjlPa2n/2kY9YIp3xNZ94LJ2FfHGqMIEW3EZbYPMrufbCVdpMI7A4K5maAO9wtiBr6SE1TVPMaxs1QCtJIlnkXR0J9aAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0XSSE+gGuC/kzji0z0yuP9SQtLxnli06ibvbZvjMqs=;
 b=Pcx0oLYd+sNnTlrXb9MnCM3OLdtes8w7P9DCjz3aL5CuSpNumKrFraZgBufw+Cj95+B8fwF9SF65pFJzWs3zFyYn1iuDvNG5inO9rG9D+T5zxFLARwTWHB32wiaxwWJsb7xWZ/5Mpj62sBdsU7pZkIXi4JG6DWZwKjD2j2x3drik5+WsPiQubT2im8EnCNuFFpOdjcSBvrfmv1Gx1Pa8hFKVDbbNRm/HoaWaFXYjpnyCn691Jlu70MRl10k3pkdZnOISqqqRxnOAfbFwpVHj6WOd9pf66D89PSNHD7pYU3NcYubAaef0ea/NDenQeDSfeuGtZmofgGqc+POiZ1FF5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:42 +0900
Subject: [PATCH v3 15/19] rust: num: Add an upward alignment helper for usize
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-15-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSBPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:604:71::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 4634f070-567b-43dd-2314-08dd8d6e90d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFAxSlp2cEpyL1A0VHE1TzVnM0J0R1R5RjNkOHlQcDByQjNMdEVzVFhsU3V4?=
 =?utf-8?B?SGpGK0pQTmNTeUdqa1cxUldlR0lQVlkyb0RUMlZUWFJXQUVzK0o5eWFEZlk3?=
 =?utf-8?B?Vk9sZlFtWHRZbUhOUUFzQzlSV2pSOFFINkgwdFFiR1MwK1pzQlVwbTMyeEhB?=
 =?utf-8?B?a3UveFJPZmhQSVErdnp4UHkybGFsMXhHZFpNNTUrTWxUbHE0dTlrUkNrWU00?=
 =?utf-8?B?MVpjekxkWWVUa1I3NWMxTUk1V2doREkxWFRVUXMvUUpRMXpwcks3TFR5WHlr?=
 =?utf-8?B?cmQ1d2paNTc1dk53OCtOZnpxN2Uvb2J4SFRhRU1WK095cWdybDNvT0h4VjJG?=
 =?utf-8?B?d01oTkM4aHFPeUFUdUpKWnVYOTNXUmxTYm1xcmVybVRYVVN4a1YrSUtDNGt1?=
 =?utf-8?B?QmpGUHJnR2tLbkZOOWxrM2xvQ3JpNWFRTW5LdnJDZ3p4UWl0QnA5OXFrYmhR?=
 =?utf-8?B?R1NxNzZlZEdWYmwwMEFCY1R4VFhtSjQ0K2ZWNGdXYjcrNWVvUC9FR0N3bHNu?=
 =?utf-8?B?WE12NGduVUpVVllNeDVKRHVzY09ra0dwazJtSTAyWFIyZmtENW5ZdmIvN0Ny?=
 =?utf-8?B?eDY5cXRRWjVlYjIwdlN4OWxZWTlrUHF3aFdtcUx3VjJrVVFSSlpKeW5yL2ZO?=
 =?utf-8?B?NFROWGVvbFRIMkMrZ1VpdXVDWGQ0ZTFXTHk0OWZia04rUTA4eDJnVXFsT1FP?=
 =?utf-8?B?Tmk4QmI3dlRyaWpJN3VIbnh0aHBCblpxbmVJWEdNQkdZdGpRSGJMbUtrOU1J?=
 =?utf-8?B?T2pwTElvQ000bTRRbURQTlA2UUxQQ2lyR2dzOEttOGNVVkhNcXowV0M1Wi9M?=
 =?utf-8?B?M3duSDJ6REcvTnVTbzM1aUxtZUpMcVZSUGlFbFVEaVNCMnY2TW5BdjZvV010?=
 =?utf-8?B?ck54TzNrdWp1cDJuTmdoOTBlSm5ldjJ5MnZvcGR6bnZKNEIvWHhaNm9XZWo1?=
 =?utf-8?B?RlhjcnlNMFoxUkJrVC9HaW9uL3JWalZ4THhrRnVTVElWdUpsRENxK1UwVG5t?=
 =?utf-8?B?Vm8wM3NHdTU1VnhIQnRVOW1Da0RnODU1ZmpOWjRzQ05haWpXS0xIczU5UzBS?=
 =?utf-8?B?cDJMaHJUc3VmZXl1KzVzQTQvZFhRZmxIMVZnUzZRWVBIVm5TdittMk1Idi82?=
 =?utf-8?B?ZGU0T3Y4VTlOQVo0Q2kydEM1OGIyaHo0bjF0YjF3L1lwcExZelRSRUNEMHhO?=
 =?utf-8?B?MndHTzlQUDRETW1sWUllL0xkZElHUzF0WGQycnZTVGc0dk0zV01PRnlKQ2pw?=
 =?utf-8?B?bXB4M2g0cEwwQWRKQ0lPQWF0MGUvUXNNVk0vQlZ1MDNPV0g0OFZENDlBVmt1?=
 =?utf-8?B?eUJpVENYeU5JMUFVNmtWSk55c0tKUzF4TXEzR1ZkWGtVWCtzbWJiSENiWEx0?=
 =?utf-8?B?Nkgza3hHNW9tOURQd3F2VU9vL1pMWEdqS2dnOU1hWEhuZi8zVUZPY1FHTzhW?=
 =?utf-8?B?RmpNVXd0OGdxTk5hK2hvU0xKQUszNndCSDA2SFhWaXR6MWZYclhyTXhWeUg3?=
 =?utf-8?B?VXZ0SDJUdTFOcWE0ZElXTU9KaHFBdURTQlVjSkZKd1VLT0FQbkJuTEZWaHdM?=
 =?utf-8?B?NUl6V1hZS0tUZjNSZ21hUjVzK0EvMS9nclMrZFVzbE9pUkZBYk92SzJKTlh6?=
 =?utf-8?B?VGVvbmNRak0yZ1VZWXBkRlk1TXpXdyt2MlRHVTVJeGNFbkxNVDVjU1UyNUNQ?=
 =?utf-8?B?S2luaFFMVXBvNGpVenZseUdhRko4K1E5dTVmT3JXaGx0VmlZSVk5V0s0Y0Fm?=
 =?utf-8?B?RjFseC82TU1qMjhIQmI0dE9iTVBzd2thQ1Q2TlZlOUVqNzVGK1F4RUNKdVpp?=
 =?utf-8?B?OU9sTlVZejUxYmdmckNyOTN3dFhxNGJxenNlMFNsSzJUZE1td05hWVNOYzc5?=
 =?utf-8?B?V3FvcWRadzBlK0NPQ3ZtaWNacURzZTRQeW5vbld5aW5EaVo0aDBjTzFBdVA4?=
 =?utf-8?B?SlkxNHZCbmZMNU13blI4WCtQMTI1NTR3MEVxdU4rckFLQnhhSzljZUZERjY0?=
 =?utf-8?B?L1ZjdkhKV2VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRwME5XRFc5KzZyK3hFVVBqZnlHeXd0R1FVOUFISkZFVFpncFg2K3ZrVlVa?=
 =?utf-8?B?RldRRTNyODRueEZXYVA1VUxvUzdDRGFSTDRvOWYzTW1leTNlWXM5ZnIyY2hO?=
 =?utf-8?B?YjhVc3p6Skl4U1dsa2ZjS2U5cnhaSUh5eXd0LzRmR2Q4cjIvK0tWNXRhNzFJ?=
 =?utf-8?B?d1RXNTJQZGVERzJKR3lBVDZUellyWkdMaE13dTM4SEVnRngwT3hlODhKdGhy?=
 =?utf-8?B?TS95YkRwYkpUdnNLcDgwRmxOak5JUGM3TTJkaW1lZDZEZVVzcnJMQ1lUYStp?=
 =?utf-8?B?OWRjUGVsSmt4NWpLWVV5TEttdHhCMk5ZRVpvVEttL2c1aEw1U3MvU3ZYd0tQ?=
 =?utf-8?B?UVB0bXIwZDVLRFh5Vk0zUjlxdzJhZ0NUZFpPMWlJQlZrenNGajJvUnJwbXlG?=
 =?utf-8?B?Y3hwYUJCZTBwVnJ0aTZXeDVRbEpEaXdxdk10S3FFTUYrdkRLM1U5MzhkRldI?=
 =?utf-8?B?OGlnM2wxYnhFWVAvcXVidk85QTZmaHExVDZsVnZXZXNadzVSRmdZNWkzZjEr?=
 =?utf-8?B?eDJIb0M3M3hCN09nTU1KbFJkQ3hDYkVLdURHbTRQeDRCekJoaXN2OXY2Nld1?=
 =?utf-8?B?cFh0OFZXQ2tNWThkMExaR0M3dk9XQjA3U2Zkdkh2eGJkU3pGbHFJSi9LYlQ2?=
 =?utf-8?B?MjlwMm42UmhQcWJBTHE3cmZzSnZCYzQ2Q2kwejdrcDhTQlhQYUlSeGJXQy9p?=
 =?utf-8?B?U2loeFZ2ZWFsT1Q3V21abnRpN1BKc0h3T1FJOHNqRVRpdnVUVE5GbVpGSnFG?=
 =?utf-8?B?dzk4bksrbzRxbE9BWXJUZFgxZldrTmt1OVhjZVdIMWJqU2owUC9EWW1tSXBy?=
 =?utf-8?B?Z3pXTkt0cW1jQkpoK0Q1UmJ6d095aGErM2F0M3o4MUlSd0lkSCtJbExQMnZu?=
 =?utf-8?B?UkpZL1lZdWdKQXhTYkdVMjVPdEZGVDlNNnlRWHJHSFhadlFKSXFHNzVtbEdp?=
 =?utf-8?B?eUp4ZFpjNVZIMWlQSENTU2hLclAwZW5JQXE2akxtMCtJNlBHWmVVbXBUVHp1?=
 =?utf-8?B?c3JIZzByRnR6bWtYRGh2V2dSYXpML0ZuM2YvSXZBWnpjN0N3R0dNNDY4ZUM4?=
 =?utf-8?B?M0NmOEYwSGZLemhZMFdyek9BRG85ODVjM3BmTWxBTXh5bHBZVVd2VGFkZ3ow?=
 =?utf-8?B?MmlMVlU0T3psbHZ1UDl1emtLeWlsRGRWZzVzV01XeVMydUhTckk4UWxLaXN5?=
 =?utf-8?B?dWV5by9hWGFReFI2dUsveFMyeGViM3MyQmNaM3dsY3BRM09USzdFS0R2VGZz?=
 =?utf-8?B?YXpRSmMvQ3pnV3VzMm9lUEgxM3ZUY2kydXNaWklla01wNk5GL2tScEp6cjFQ?=
 =?utf-8?B?TmZYWXkwK1VMMktGSzl4QUtWYzczVDgxdVBjL2xNRnhTZnQ1UjZhQWZUaGlU?=
 =?utf-8?B?RXJrR3RscWxVb1N1c0Jka1JXc0w0UWQxL09odEVtOENJR0lUN01XazJhNGc2?=
 =?utf-8?B?R1BGbG9vbWZGYjZRK3QyblVJeHh5MWFuQmVRQ2ZSNEg5TW5CNHdzMXVlZjk4?=
 =?utf-8?B?WWVqTFZHQTFWMmlJb0o1aTQ2eWVjUm5KWi85ODZEdXVJTVRJVWY3N1piYmZZ?=
 =?utf-8?B?ZlVtYWxjODduMEgwY1R0L1hpM3luSlAvc2pnb1d0d3dHRVFnYk1QNHdnSG9R?=
 =?utf-8?B?WENHMTFlRnpaRGJudjlZM0RrSmZvODRWMmJDRUtUNFYwbXlwRHJadUV4c0t4?=
 =?utf-8?B?TUM3cFlWVlJ2ZTFyTmF4WmQ1QXVyZy9jVS92dGJIVm55T2FxOTZUMysxNjRv?=
 =?utf-8?B?YTlURytuZFRFODBpTG1NMkZIbmY0a3k4QUh0S3hIdG41T3I1QmdzOHpZSmVP?=
 =?utf-8?B?czNsVEg3N2VuT2VPZUtlaThBWkRCUjAvcm9KV0tCV3c3Yjh2YzEwdlhDS0pM?=
 =?utf-8?B?OW5odEVYMkVBQXAyQ1F1N21hK0JCMGZ6NjJ1S1lBTFhkQUFBZ2dBcTF2MWFC?=
 =?utf-8?B?Si9hb0V4UXpCSnhRYTFnM0IyTjFvV2UzendLYlhqRGZ6UnM4bTV5QkdMd1ZB?=
 =?utf-8?B?Yms0TTZ4dlorSTFXNFJuNXdiM1Y5aFlWdWwvVmhwNkhLeVVuNUsxcUxwelBo?=
 =?utf-8?B?emREbzFIUGdwZEJJZVJmdWlOd0E4SkMyeTlzRkl4cWJaUFlOQkVsZEpzK1Zp?=
 =?utf-8?B?RFF5b2VPOFA3ajMrRm9GVjJpKzNUdkgrMjNZUHg3KzEzTWVqc3doc21ESVdP?=
 =?utf-8?Q?RSUGIYUBAjm1JeFUJavKZT3nl8m4L+RMwTETlxOYMXbY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4634f070-567b-43dd-2314-08dd8d6e90d3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:37.3645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ew2sz7rS5hHBdGMJt9Oasv1qIHjoxvaaFaM2XN1HA4ttzsjWDw50ig8sQj1j4eO4g+bjg7tF8G4izQjTMmVjmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be used in the nova-core driver where we need to upward-align
the image size to get to the next image in the VBIOS ROM.

[acourbot@nvidia.com: handled conflicts due to removal of patch creating
num.rs]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902ed8fb98689bbb50 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7d69cbd957546ab75fcf677b851f102c3a5e5c39
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// A trait providing alignment operations for `usize`.
+use core::ops::{Add, BitAnd, BitOr, Not, Sub};
+
+/// Traits for unsigned integers
+pub trait Unsigned:
+    Copy
+    + BitAnd<Output = Self>
+    + BitOr<Output = Self>
+    + Not<Output = Self>
+    + Add<Output = Self>
+    + Sub<Output = Self>
+    + From<u8>
+{
+}
+
+macro_rules! unsigned_trait_impl {
+    ($($t:ty),+) => {
+        $(
+            impl Unsigned for $t {}
+        )+
+    };
+}
+unsigned_trait_impl!(usize, u8, u16, u32, u64, u128);
+
+/// Trait for unsigned integer alignment
+pub trait NumAlign {
+    /// Implement upward power-of-2 alignment for unsigned ints
+    fn align_up(self, alignment: Self) -> Self;
+}
+
+impl<T> NumAlign for T
+where
+    T: Unsigned,
+{
+    #[inline]
+    fn align_up(self, alignment: Self) -> Self {
+        let one = T::from(1u8);
+        (self + alignment - one) & !(alignment - one)
+    }
+}

-- 
2.49.0

