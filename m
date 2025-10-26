Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5EC0AA98
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135A210E2CE;
	Sun, 26 Oct 2025 14:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="twUaClUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17510E2CD;
 Sun, 26 Oct 2025 14:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5qp6q9Z5t3mhFzNdAbUuHNNkxYTkssk5H1BWIltuqhru+zHZAEFmW1lGi0cdINC2g0sJp5yXHR/kBzlHMxbbExDds2pm7Fo0L2djIpNsEyxZURuLy5ftTHWPB0xDDJYTgIoJkNzcL6X03Z6I+XBWXW1kUSmJ91QanPLG8Ze5Jgh5rB01lr0YBZGDcpjBnaIvMKyG++hLLUNHlWlExQJ5UN8Nw3ugU6mKld5B4YfMTqvGBQKrtSaD4jJ9Etg8j3x7EHMooAVUcinsWDOOyuGjwqXjtbC/BV+7O4FYidBKABDbttSXG8eK/cVXqzaIRSEWnqO7Y+Q18mmlqcWVO/xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYyRCNEZkE/qfv1fqPlth2gZyrlls4WcGAvc4KRx3KY=;
 b=rH5NVYi8bX1iNkkU5qSVwO04VPQFe8vX6l+DS2gLic5iQ1rc7BNUfmO6C++mC3RZTKAxi0nUeD44sq731MFQrT2XfmiE7Sl08M8gM0U8LP7wJ8VK1builF9L/IrpPh6XGkJMwza84wq39l6FeKmmsx2qXLC4UnDIUw/jdMZ5N6RGenbXaAXqC1NgSzTQWRUNuIAuHRDKSObuIQEBJ+1+Gr31I+ncldN33x0hUzXOz3UHqMLn03UkT+5+Pbg7YPv9dz3qfpzcT/KZ5oGsexZyCL19N3YqMs8ij9D5pYA0leQYd+wy4YLMCp2sHqaIn8IQex0CVID1B5GTlQbx32xxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYyRCNEZkE/qfv1fqPlth2gZyrlls4WcGAvc4KRx3KY=;
 b=twUaClUjdg+C489D8N9SMs1vK1Jn2Gm9M+fwtuGRtHLhcSbRyr4c0hUK/PE6mqzDSAKI3YuvRhgEO1eyZpEJSS2Z/R4fZ0BA2x4iieVPNnGfq6tD5Ctwe/3OxPLuGOD7h209Pk3tFluIiDHy0JhrfMAaHcXS3V4E38XSoDzCSA3rgRxtsJKpVZjKVsxrDXjNKn8A9Sck4Qlxqgp38r0+dwVVzuOftQ3kduuvaII+1WXPGjMp0FwNt1G2Rp0VpsGZpUXi0BQL6P7uWbFjWjt5OmMcA1KXd7+KSxB8Ob/5S5P5P/njJHYapVdeih4KD5PzbmU2A1IY9iz4nQ3/j3E5FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Sun, 26 Oct
 2025 14:39:47 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:39:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:06 +0900
Subject: [PATCH 1/7] gpu: nova-core: replace `as` with `from` conversions
 where possible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-1-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:3::24) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e40712c-df61-4af6-eeae-08de149d8082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmExL2oxQlQwU3hTMGxNVWFWUWxMNkg0K2s0ekJDcmV6bk1sNnIwNkpCUTBr?=
 =?utf-8?B?SGo0NEZlaE5ZVTBSZ24wTGE2RGdwVzQraVFFM1JJODErbzIzWUdFRHBZeWRw?=
 =?utf-8?B?NFQzTThSQnBJemltSndId2pNVy85bnhiaFd2aGJVMlpHUHNTSVhvUkxRKzd4?=
 =?utf-8?B?LzZMOFdSc0VHOEYwVDZ6ZDVnUVpad29HN3BnS0YrR0o1SDU0WTltaGYyUnhV?=
 =?utf-8?B?Y1dsWTdwN2xrUVUzSk40eUY0V2dwdFhKcCtqUmo4SUJrOXlxMkhNM2Y5S1FB?=
 =?utf-8?B?d2dlV1ZKaFZsUjRtRHA0MVdISWtpNHI1L1o2WHEvLzdobXdBTmpYNEVqTExt?=
 =?utf-8?B?THk4enFjMzFxSDVaL0tTSlRoOUpaVlBmR2ZCakxQTlpQVnFwQjhMR1NSMTJT?=
 =?utf-8?B?ME1mT0k3WkxkQXJuL3pjL3FMcWUxdEhGbUtVNEtxQllIT0RRbkxqTmF5bEtq?=
 =?utf-8?B?a3A4YkpUcTdhOTZXQTlYcENsZTlacWJmQlNmRjVaOWhCNXduRG5jZ1pTalJ3?=
 =?utf-8?B?KysrUjNVdW5XOE14b2NhMFFpbW5kbHJBSlZLYU5sQktnOFBMK0Z1YkZmWEp3?=
 =?utf-8?B?RWZPSnYxN2dicHI0TDFxN3Fia1JwTzRzNTdVSmRTNzRtL3ZmNW1EYTdFKzBw?=
 =?utf-8?B?Z0lVTk94NG16d2tqb0Z5RGd2cVJDRWVGNlhJK0ZyMVdUc0xUTEZvdkxsOERm?=
 =?utf-8?B?eGUzRHlMU1gwR2pYT1hzMHNQM3laeUY5SS9GVWFXanZibjZtZkNWdEhURENV?=
 =?utf-8?B?RXg1d3lud2tDc3dncjYrUzFCZUpVbU14TFB5NjYyUko4eFBNQ3VrQ3VpYVRt?=
 =?utf-8?B?TkVhZWdOVEhyRUI2dGhnQ0FmSUk2MXU2M2txRk9ST3ZiRlpvdUtSbkZaczd1?=
 =?utf-8?B?eTNYV2NzTDVaTmR6NWlZRytpYUhpaDV1QWtDQjNTK25uYWpMdFJFUlZJcWdo?=
 =?utf-8?B?aWVkVWtrTi96RFVJdmdzTWpzUk02WHRrbHJQbytHQ0VpVDREbFJNVWR2UzBQ?=
 =?utf-8?B?emdWU3Zidm9BWEV2TXpxejFQa1FLdytmZUJxcW5KdkViV285K3pWbDZjc2Nz?=
 =?utf-8?B?TW5ybm1RNTVyTDloRWh4K2t6R1IwZjdTV1dPT0RyK1pxRDBQU2NTZW9DVnFz?=
 =?utf-8?B?KzhzN0RHeEwrODI3UlFQYUdJQzFTK25oZTFPbW5TQ0xCSENYRTUyMkZwd0tS?=
 =?utf-8?B?TnRob1crMVhTUkZUSkV5a29WWkN1MnY1RXR2NDNWUWtzSUZBOHQzUEgrUGpO?=
 =?utf-8?B?WS92TUVkNUtDeldwTHNJbzJSWVEyTi9nQ2JDSFp3eDdyNnVEcWIxbjE1MTMy?=
 =?utf-8?B?RTA2U0xCMGYwa281WVBaZU90cUJTRVI1R2NQdVVhUk1tOUdJS2ZFdXdwTmpu?=
 =?utf-8?B?L0pla0Ezb2hjZ2pIS0dzOE15aWQvMmo1Q2FWcGtYSG9PUWxlWHl3d1Ixa1lQ?=
 =?utf-8?B?dER6akJLQkdmSVIxZ2huT0EvMDdlakZYM3JKVlIzNGdFSno1U0xRMXJxTU1l?=
 =?utf-8?B?YmM2Skw5UWdtb1o2SkxLN0lJRXhFUDVQWXNrU3UzMzJOZ0lLV1NEbEtMQUs5?=
 =?utf-8?B?ZDVTZ2M3ZXRGZnFtSUJpdTBGMjMyeFgrK29ZRmtPYTVIMXV2YUlWLzNGZHd6?=
 =?utf-8?B?OXJUOVU0aTdaVSsrZXd4WVdUK0trVWkyMVdKU3E3Y1lMckI3RWVBR0hNS2FN?=
 =?utf-8?B?dDM5OUl4M3hYeitwajRZN2VpekpzRXFZQkhvMkFVcXRDZ2JaaEp0eG1OWHBo?=
 =?utf-8?B?enpTL1dXWEJzcDJCVXRjNkpzQWF3UkJ6MjE3VExwWlUxUlgzZFNRdWlZTGFk?=
 =?utf-8?B?blMrbHArU240b0pWNzhFaUd6dU0rUHZvRGpRSzhsTWZuNnBwWEp2QzcrdUhP?=
 =?utf-8?B?Nnd4V1Y1d2R3a1ZQWUpNUnJFUlBXeUd0YlA5Q2xYb1Zsd2cra3B1YWl2T3gz?=
 =?utf-8?B?clk0Y3lzc2FUNy9SaDQ0dC90SGhOc3JQSnZ2UkxDVmpGWk10c0txVklPN1ox?=
 =?utf-8?Q?6SL4M2+nESIodmgeO6N7+RRzqpcCwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1pmZDNXYmhkVEpHNUNPallubjBWZmQ5emk5ek9mRVF5RnVnUFhXTmpLb2pR?=
 =?utf-8?B?MkRxMjZvc3dNais3cmhEZzdhTXdMUTFoVzRzcU1TWDdQZVRPTG1nb09uQ3pq?=
 =?utf-8?B?YVhzY2I1L20xdzRYcG9MTWJ1Vzl2WXhoeGZhUkhVdXRvYXFaUGFZYngyamxv?=
 =?utf-8?B?eHI2aXdIZUZCcGJiMFVNaS9YRjhuY0NpWnNXbGI3UHh3RTVCSWdoV251cUFl?=
 =?utf-8?B?K0UrVE5Beks1ZlN4UnJXYThlSCt3RExYcU1vMStlZXNWQ09JVFVXM3orWXl5?=
 =?utf-8?B?UkJKRlgvZER6eHE0a2JRS2pqcHFIeDRCNE5zOU8ySkovTzJnZWNTVVZVZXk4?=
 =?utf-8?B?Z2dUV0lITUJWdzRwL09rUHlQR2NZTFpObUNoYytmWXJ1bitZYkVzTFpPZkZJ?=
 =?utf-8?B?N29ReVI0cUJsTGtLY3RWM3RqZXJNQlV6YnZzOEJtOTNHamFGQk1hSzFFNFp3?=
 =?utf-8?B?T0FhRWN5Qll6YnBESE5RVmNwNXZ4WGpUWTJXbE5nK1Q4S1J2bnZwWW0rclVZ?=
 =?utf-8?B?Ry9GZ21NOVVtckE3TUMzQ3NMVFh0UTlUK2dIOElCdjZqQ1NnUlJlQitFWi9m?=
 =?utf-8?B?NFkrdGtFZW1uYU9xeXhxV3QyQzJrNE9wNFdaZWI2UFkycDl5MklvbTQrR244?=
 =?utf-8?B?RW5zZUxXUEIzam92Vm96R3E1LzlzczhFTlAzcllVUndKSTMyNTZFMmxRUWoz?=
 =?utf-8?B?SkdYTUN1RGpNNkR2SHZGUkxIditNNnMwTkJaVmh3Y2szRzBHSExNT1d6YUc5?=
 =?utf-8?B?d2VpRWRaQzlINmh6ckZjalVlZEx4aVAwajFqUjlmMzl3QXgwTUxhdjRiS2Jv?=
 =?utf-8?B?L2JJUGE0MWZZNVR5K2NybEZTVUcyZHRPN2loeWQvTmJRTVdVMzkrR1ZjMitk?=
 =?utf-8?B?RDFKQUVUeWZsWDVyY2VVL3VWUUVHTzZmWXNETDlVZjBsREVmZFBLMDFMTENp?=
 =?utf-8?B?NW9UaVBXNUY3WlJDMGRYT0NpMWs4UUJLVU02ZzRidUpsOUZKdEQrZitncXZw?=
 =?utf-8?B?NDBSSTN1cUtHWEx3VGtHUjJ0a0FtQmoweXlHaWdaMWs1TS9SVVkvK3JickFm?=
 =?utf-8?B?cHpQL2dtZDZiZ010NjF0NkJoUmdmSGwyaGxrSHU0UlJFVnVKLzlEZlY1QnlM?=
 =?utf-8?B?QWxwdEdteHZPYkJxbU8yOVRuTWp4bFpOd2ZSdWp6RW5IbFA0ZkxFb0E4cW4v?=
 =?utf-8?B?MUxqU1IrWDVyZFZubERYTEw4VTJGY2tkTm5mNnRTd1dITzRrZFowUXczOTlF?=
 =?utf-8?B?N3N5OGFVWVpwT3Nwd0RkSDIxQ1VWNXJKQUVGdjJNcXRraE1mUnJvMEpGMUNU?=
 =?utf-8?B?MVZwbDh3cEdpbm51SGdXU1E5dG1kRXJSSnZLTXM1ZEhWOHY2R0tGdjZTQy9k?=
 =?utf-8?B?TGRlL25XTHdWcWsxend4cm9Gd0xRMFBSKzlrY2NNWFJ3ME1jSkU0czF4cml2?=
 =?utf-8?B?dnZpZ05vTkVIbHpqWmtsSCsrUG1WdXkxcXdUQU5tUE9tcnZGdVdCRURDdVhw?=
 =?utf-8?B?MEZqQ2tpMjFxMmk2RTdqYUYrUlBMUEZIUDZGN0FQbjFsSmdFKy9oQW0rOTli?=
 =?utf-8?B?MHBubEFld2E4akdEZzBkdGhTOHZHM2NsV2VEdElMaXByL0ZBK1dBWlRzYml3?=
 =?utf-8?B?SkU5QWVyWDdiU2dSSVRCY3RaZWR6a0lQcjB0NmY5TDZ5eVQrN3ZlMkc4Wldi?=
 =?utf-8?B?VzBSS2RsSzF4eEhpZk5iMkc2MnlNN2s1NmVPYzhENVNXSlFkblpoV3VwRmY1?=
 =?utf-8?B?N2IyYmlRWjVITkRtMWVlTUZDSHdxWG1JQnh5cExKZldIQUlMTjV0cHpRTUJO?=
 =?utf-8?B?TlVXUmtCZkNjQXd1bDZLVHJpeXJOTGxrekVFQXRrL3ZHZGVkaWhvNFl3TnE4?=
 =?utf-8?B?WTAvRlRZUFg2K3BqK1BYVXYwTGpQbW5TUjhaWDEwaXNTMW1nYkRYbkdSUTBL?=
 =?utf-8?B?L3VYbTAyYXlRaXZ4Y1JpUW02dDN3b1JES3BsRkpIcHdKQnE4d0VlVmhPMlc4?=
 =?utf-8?B?Y0RRdTlTWW9NTWg2ZDdGbCtaMEYwMFZpZGxnT1B2U21GZTU0aXpGeE1LNWw4?=
 =?utf-8?B?V0MwNkh6Vlhzd1kyaURacHBMTCtraDJFMXZTMmg3TUo0UXlaNVgvZjA0c0pX?=
 =?utf-8?B?NzVhMkRsNDhkalhTWGlQRUxtTGdiWGI0dEdLYlRYaXovOUNyMWlRRS9EOXVy?=
 =?utf-8?Q?ynz3OscOtT1OjDircyMIWEqCZJgVvgbzVdrA/TzVtSjF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e40712c-df61-4af6-eeae-08de149d8082
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:39:47.1390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjsaR+GFwVDGwZGDCWjdw/XGTii2NMXMOf3mu32UxHxVNGcuU2+oN5xjfOevSsJuCsQVXw2IxeoWqnxHUxKxDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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

The `as` operator is best avoided as it silently drops bits if the
destination type is smaller that the source.

For data types where this is clearly not the case, use `from` to
unambiguously signal that these conversions are lossless.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  6 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  4 ++--
 drivers/gpu/nova-core/vbios.rs            | 38 +++++++++++++++----------------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index f2ae9537321d..afed353b24d2 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -40,11 +40,9 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    const NV_FUSE_OPT_FPF_SIZE: u8 = regs::NV_FUSE_OPT_FPF_SIZE as u8;
-
     // Each engine has 16 ucode version registers numbered from 1 to 16.
-    let ucode_idx = match ucode_id {
-        1..=NV_FUSE_OPT_FPF_SIZE => (ucode_id - 1) as usize,
+    let ucode_idx = match usize::from(ucode_id) {
+        ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
             dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..dd3420aaa2bf 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -259,13 +259,13 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         }
 
         // Find the DMEM mapper section in the firmware.
-        for i in 0..hdr.entry_count as usize {
+        for i in 0..usize::from(hdr.entry_count) {
             let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
             unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size)
                 )
             }?;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ad070a0420ca..943b0dac31df 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -361,7 +361,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.image_len as usize * 512
+        usize::from(self.image_len) * 512
     }
 }
 
@@ -439,13 +439,13 @@ fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
         let header = &image.bit_header;
 
         // Offset to the first token entry
-        let tokens_start = image.bit_offset + header.header_size as usize;
+        let tokens_start = image.bit_offset + usize::from(header.header_size);
 
-        for i in 0..header.token_entries as usize {
-            let entry_offset = tokens_start + (i * header.token_size as usize);
+        for i in 0..usize::from(header.token_entries) {
+            let entry_offset = tokens_start + (i * usize::from(header.token_size));
 
             // Make sure we don't go out of bounds
-            if entry_offset + header.token_size as usize > image.base.data.len() {
+            if entry_offset + usize::from(header.token_size) > image.base.data.len() {
                 return Err(EINVAL);
             }
 
@@ -601,7 +601,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.subimage_len as usize * 512
+        usize::from(self.subimage_len) * 512
     }
 
     /// Try to find NPDE in the data, the NPDE is right after the PCIR.
@@ -613,8 +613,8 @@ fn find_in_data(
     ) -> Option<Self> {
         // Calculate the offset where NPDE might be located
         // NPDE should be right after the PCIR structure, aligned to 16 bytes
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
-        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
+        let npde_start = (pcir_offset + usize::from(pcir.pci_data_struct_len) + 0x0F) & !0x0F;
 
         // Check if we have enough data
         if npde_start + core::mem::size_of::<Self>() > data.len() {
@@ -737,7 +737,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
 
         // Get the PCI Data Structure using the pointer from the ROM header.
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
         let pcir_data = data
             .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
             .ok_or(EINVAL)
@@ -805,12 +805,12 @@ fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
         // Make sure we don't go out of bounds
-        if token.data_offset as usize + 4 > self.base.data.len() {
+        if usize::from(token.data_offset) + 4 > self.base.data.len() {
             return Err(EINVAL);
         }
 
         // read the 4 bytes at the offset specified in the token
-        let offset = token.data_offset as usize;
+        let offset = usize::from(token.data_offset);
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
             dev_err!(self.base.dev, "Failed to convert data slice to array");
             EINVAL
@@ -818,7 +818,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (data_ptr as usize) < self.base.data.len() {
+        if (usize::from_u32(data_ptr)) < self.base.data.len() {
             dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
@@ -886,9 +886,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             return Err(EINVAL);
         }
 
-        let header_len = data[1] as usize;
-        let entry_len = data[2] as usize;
-        let entry_count = data[3] as usize;
+        let header_len = usize::from(data[1]);
+        let entry_len = usize::from(data[2]);
+        let entry_count = usize::from(data[3]);
 
         let required_bytes = header_len + (entry_count * entry_len);
 
@@ -923,7 +923,7 @@ fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
             return Err(EINVAL);
         }
 
-        let index = (idx as usize) * self.entry_len as usize;
+        let index = (usize::from(idx)) * usize::from(self.entry_len);
         PmuLookupTableEntry::new(&self.table_data[index..])
     }
 
@@ -1092,8 +1092,8 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor.
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_size =
-            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+        let sigs_count = usize::from(desc.signature_count);
+        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
         if sigs_data_offset + sigs_size > self.base.data.len() {
@@ -1113,7 +1113,7 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSigna
                     .as_ptr()
                     .add(sigs_data_offset)
                     .cast::<Bcrt30Rsa3kSignature>(),
-                desc.signature_count as usize,
+                sigs_count,
             )
         })
     }

-- 
2.51.0

