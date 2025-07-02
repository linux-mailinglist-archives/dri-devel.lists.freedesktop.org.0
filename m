Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D628FAF12F0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45010E6D4;
	Wed,  2 Jul 2025 11:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p5okXz1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BBA10E6D4;
 Wed,  2 Jul 2025 11:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNE8/h542d+jzXxnQjSvnRFGVYekM0KgdZYmWQ1y03KsocqLi1PnlRHYYqpSZcIE1JKg1yO9PexlgWVJxCa4kUIfKnAaDQ3PW7/QpO1Ru7Rf0UoHDBe0Gf+X6ZkXwCKHjOCddmzRjlQTqOV9/K5D1nwVXgxj2rtkFgHq3FjrLh+M3nD2TE1+n/6/hlDx18u8QMtfKIVa85PtZGWqIzkK5ssYwElm697maHF3ljj3Jt78Dq/3PeRgyqgzbowW1QfgK8VXG2AVfD3ybV6qhzu9wcqRWjhV6w39P+B9u91CUFcnwhIssJUyPWVqrpVMFEJhgnO4b53okVTMryFUg2u3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT7YwFdyun9/hmVlTDddSa8q022MGR6ijr7FIPQX8Qk=;
 b=mkLOzrSgI9DvuEG2E4sifN/WpZ5fWOa8MAkKdnTR27Hfv0uRHR5DwkFPIwPNN7svAAsWf/hqBJ1mcnLVWhHkPpNv07oEzd0IsCw6eyaOv1Da1Bun8jLdt7548FtW1yHZAZcxPPQ1lg4pLe8s9evPmDnSqR7ZE0DkJqWGxVrBKHLqUPxjsGhXMfD2B4Pa9jIk0zdC9vh75CJIpmwOGHcW7nwXrm2IvyPrpZwgK3GpeE14ztjYHSVLhrRXaKWaCbgkaA08lIyG2VXqTcaQsaq4fX3XDqwG8SP71enniMg6jfJTSpSMqByUotAINQsMZZd09ud6ITst9PccZC5P1b1T5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT7YwFdyun9/hmVlTDddSa8q022MGR6ijr7FIPQX8Qk=;
 b=p5okXz1nacKbRqcINm0GfNaK3ndU32EYZcDvdx3b44IwigtXs9K9LZZ1g7UAcsKYB5UqizSwRabb3XKCJJFVXnDB5lm3H+8HtmOnHsQ3OMKMn9Ys36mOM6EK/dhs55nZPU94teD2PBFBppMBczPhgfaPFnpy82Sq8Lk3kNz0GBN1wz0gnhWO8ZgmQWtp2YWwap+mYPiasH21rh+Cap7BxkWNj/SF91DvA/fmMcreBPkJpJSM7dYsZf2grRNgdmZikZCzG9ovjBOpg8R2keZ/owYkrS8QUFDWQQkVJ+tfn9qmrcx9Ykwn9+DgtzYalExhcHEtLgkmajl9GgosU3WJfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:00:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:00:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/7] Documentation for nova-core
Date: Wed, 02 Jul 2025 20:00:37 +0900
Message-Id: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFURZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3bz8skTdlPzkYt0kS0sDgxQDUwPTJFMloPqCotS0zAqwWdGxtbU
 AplJaEVsAAAA=
X-Change-ID: 20250702-nova-docs-b9900d0505b5
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b9a43a-7b2b-42c7-ad8e-08ddb957b758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3E0L0prSXpIQ1NsRUFLa0UzYmUrdFVYbHRYQUxscFN3OEhHbE85c2l0ZStm?=
 =?utf-8?B?ZityaitrVklZVCsrWUp6UTl3NUpyZUFoK2tCZzJyeGZKbnZBOEw3M0RMVWN2?=
 =?utf-8?B?QVdoblJ6Zm9FaC9sZkN6RVR5NlN5cXdIanJrd3Yra0Y0Z09qbGZvMlE0dU5j?=
 =?utf-8?B?dVN3bjk0dnN6QVZTN3d4cDU3cyswVWRKNEFmZ2hSR1JZeDRqMnpEWndDbXUy?=
 =?utf-8?B?bVNvRVNrWTlJM2JmTW1YaGNOKzZJMHkyWHp0ZmJpZllwb0Rwa2g5eFVvNzVR?=
 =?utf-8?B?QkRUdzVSTTJNMDI2bHBMV1UxSEw0TDZGTngvaElKNnRrWkFyaFdMWHlaaGhV?=
 =?utf-8?B?NmhFall5ZTM4bG5rUkNCTmV1U3BvN08reHdpT0QrazZBZXE3QzB2OEhkU01W?=
 =?utf-8?B?TEEvblUrQ3BnNi9XSTUyejJWTDJ1SmxUamZUY1FkRS9zZEtYeEFTQkw1dGl2?=
 =?utf-8?B?QUVsNE00aHdvNlNUZjdvaklUZ01zYjluR1dwb1J0Z0xTK0hEeVJReEROQUkx?=
 =?utf-8?B?TndVcFBqL1MxQW5YNEtZMVh3OEptbnZPYksyL0VyRkZ0emxoVlJNb3RGUTUv?=
 =?utf-8?B?aEtxTSs5dStIbkxIbVNXa0J0RDRpbHFkd3VDSlBqOEN0ampRRmJDL0xjT0hN?=
 =?utf-8?B?bzBzUEYraGJzUjVXeHJMZnlLR1l2U2VHbGovS2RhZlJXRG9DQk5PUlFJa2w4?=
 =?utf-8?B?Z01XMmZ4QnBmK1V5Y3RDa2dxMGtOL2Q4L2VZcUlBeFM4LzNybUQ1TmVxRSsx?=
 =?utf-8?B?bnc2UUxVeUxxVGR5L2F0QmVkb0JraGpTSWVkN1RoSi94d3YxSFhzYlh3bGgr?=
 =?utf-8?B?cTVVOS9LNlNCemVxakJHNm1LM3BScTQyWkt0R01icjVuT1R4TG45RFppc1ZE?=
 =?utf-8?B?UWRsT1NkZERiTWZmZUtWTGxaQzNWV2JxR1VRMU9Sd1NSY2xwb1EyRHR5NVQ4?=
 =?utf-8?B?dnZjSlU3aHZVOWwxQk4xWG9SejI5OVBFRGNYOHFnRFMzdFVrZGZXZWo2TlR6?=
 =?utf-8?B?TkF6R2hoekNFZEN6K255UjZqODFDeFIyQXkrQWNwa3p1U1JKVkhpQXJxUE12?=
 =?utf-8?B?VWhLNmNidmVHWEVaYldoazFFdVgwQjk1eGJDd1diUUhaSXh4TVdYSjg0M0tP?=
 =?utf-8?B?QUlITlpqN0pmdFIwbktEd3RTb01rZkpIL3NaMllTNndrRDJMSWFtUjB4NXJx?=
 =?utf-8?B?dXQrdkxaNFdkd2ZvZ29hZ2NRUXpOQkNkMzF3RFJRbE5UZ3dESEVXOUwxcDY2?=
 =?utf-8?B?VzRnaEFRdE9zK0IzVzlZNGdZL0pHU2tXLzN6WG56UGhzWXdhbk54T3ZCSjhF?=
 =?utf-8?B?bzR1c0UwVnp1cWtlSFNRTy9tQVdLdkRScytiMXJDTy9QV083ZUF3czV1bXU0?=
 =?utf-8?B?MjRaOTQwTWZmVk9NZWVKTEoyOE4xSURVYTU3T1RzTXZIWlJFVVUydXRhbzRv?=
 =?utf-8?B?YURyV3ZqZnl6eFpES2pzKzRaUGUyS0ttakI1U2hHTjJWakNPVUxRaUIxWC9P?=
 =?utf-8?B?dGNnRkl0Z29UR0tveDlIZmZSU0M3YS9ha0RZSWhkOWhaMlhIbnBPTWV5ck56?=
 =?utf-8?B?Z1VwSndLWDhXUDJSMVJTa3A1cUZsUXNTamNMNzJMZ3pTWjl3ZWFEeFVuWURj?=
 =?utf-8?B?dUlNTEpXZ0hEa09SOE9pOFJqVExMTWk3TzdwV1VBa3YwVDgwVE52bXRuLzNs?=
 =?utf-8?B?U05XRFgvLzFNb0VtZ0VwMXl0d243Ny9JNzZCU0hnbVAvMDJ5bGkrM1ZUTzNW?=
 =?utf-8?B?Vy9ua0dzdC9lMUpLZStWZmFTU0tUcGZoT09haTVkQ0h0RTREL0FKNmJJRkpP?=
 =?utf-8?B?UWZpV0ZlcHhESlJ3WTN1enZoajRJMXp0di9oOFUzRDJjZHd6UUc2ekNGVzN4?=
 =?utf-8?B?ZFpqOVpWM2JnNm82Ry8zbUFsc3pISCs1NW5yTjdsZ3JjazJRYk5CdFZleXRW?=
 =?utf-8?Q?WsdJzIUJX8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TExLVCtqNmJHd0NLZFRlUklKVjJGc0g1MEhzZGRSVVJVcEM5YjRHbDVBTS9O?=
 =?utf-8?B?dG5acGs3OFhOMkkwZUV2NU9XUVdXYWlSN3MzQ2xqMitra2QxTnFscHh6Wkkz?=
 =?utf-8?B?cExMZVFGZWNEek5UN3EvWlRxWm5HOEdXVTZiVTdBT1RKaEM5eHVldVorOTRJ?=
 =?utf-8?B?bloycTlBVUFiKzBUK0NEUXVRSGg5K2pDbFV1dGRxTmRpTnl2SnJiOFFUNkdm?=
 =?utf-8?B?M0EvaWhMNEdPL25zNFJFV1JYQlNIZHlwdkdqR0ZISE93VUxUV1N5d2d5MnY5?=
 =?utf-8?B?QisxQmpkVXZXeXkzQjlNV3k1SUpncXFBRnBhL0g2ajd2NnRyeWZhdUxZQ3Y2?=
 =?utf-8?B?T3NJV0xScEFqbVBtUkhXMDBGRUNtKzB4aDlSNGFncTVlS2JoWVdXNXNLektt?=
 =?utf-8?B?aW5pYWdMbnVrbi9KY2RyMHhZRnU3bDk4dWorSERYbEJlR1MvLzJQekhqd3M2?=
 =?utf-8?B?OFBQVUl3cDRNdHdQS3VVV3I2ZDNoVE5GbjV4QmxISzRoanJabHZrSDRmVkJr?=
 =?utf-8?B?cm9xSGZCL05ZaisxRFdSdlRjYXF1Y0p1UUZLYytKOXFpa1VRUGNTN0lxOTU5?=
 =?utf-8?B?ZDJjQjBZVVQycnhYUnFudFh5V3ByeE5Od2F5cjgyNkpSb0phVVJHZCsvSUtq?=
 =?utf-8?B?dFZZd3VhdTZqc0o3eFFEYVV2cGsyRkJvY3NsR1Z6enB0ZS9DQTdqMGhlOFhw?=
 =?utf-8?B?bEhDNjZUNXRDRzNCNEozMlVlTGRlbGQ0K0o0YXlDRlE5TXZMbFlIdWNnS3Z0?=
 =?utf-8?B?QWw2ZzdwbGhnbWVmRzRueTJ6bjJXYk1aQmdxS2hTcVlqaVQvQWJEdVhhMVBN?=
 =?utf-8?B?VnZiQ2FSWG1lNUdCVTc5TnNaQVJLUVIrUkd0S3JESU50dXdWL1l3L25JVTZo?=
 =?utf-8?B?KzhpOTV3RktIVndlRmhEK2svS2ZMYUxSa0RaTG5iTjVKQm9zWkNudW01enV3?=
 =?utf-8?B?SC9NTmFldnNjeDlyeFdzdE1ZcWJHYTZHbVB4L0w2NnNDbjJiOE81WnhKbkZY?=
 =?utf-8?B?b0crM0VoaXhSWDJWQ2haMEZVWUk5TmcwS3pTc3NLdVp4cDJkYmlWQ0tlalVB?=
 =?utf-8?B?VEJITFpZaHY3ekZ2WVVsbUlNZjk3R3lVei9xbFhiUUNZOE5OeHh6NnBmL1VL?=
 =?utf-8?B?WGdsMmNuQ0pkaDcrMGxDYXpwL1NuQU9wUUNOaGZkUmZlY1hXMnRmWXQ0dllE?=
 =?utf-8?B?a2N2K29IYmRMOU50S0RPTzdxWVdrL21wci9DbE9OVTgvTEp0R1dmY3MvZyta?=
 =?utf-8?B?dkJkYlR2N0xzZUFRcUl4QjJseTlQRk85UVRLTmRRWjFHd214UGV6aWNvbUl3?=
 =?utf-8?B?V3ZKMzJLeGEvNkVMZERMaDhJWUl5ZGlzSExtakJCWUhNSXcrVUZBMy9FMHFT?=
 =?utf-8?B?UEpSUG5kWlRlQmxJaTBsaTd1SDkrRHliUUZMWTFQcW0zcVU3VHUyaGxjYWc0?=
 =?utf-8?B?aFBGVmdONFppemVJcUpyVTBNVGhNM0dSZ0ZJYi9qSDhkS0hGTzJTTEl2S0xq?=
 =?utf-8?B?dGxBNjRvSW9xRHlENFM4VzYyT2RqbXhWZlJMSStNSFJubVprOU41WGEvM21K?=
 =?utf-8?B?SkxWdmhvUEV1bS80UUtuY094anFrTmZTdHd4cWtjVXJTd3NvK2VMZEY2NXBu?=
 =?utf-8?B?dlJvcmNDeVgwQ1JoUm5PVGpnZTNRdjRkUHhvTEJxd2JVUERHNlFiU0hnMXFI?=
 =?utf-8?B?QnZFWXc3K0JDWW10ZVZNRGNVQWJhVVRJenRsNGNkTHVLZC9pYjRzS2NEbDlk?=
 =?utf-8?B?dnpJeDAybi9QN2hoZU9teVBnaDlOMktkbGpyQThzSi9NQnUxRy9mditJRFpE?=
 =?utf-8?B?ZFBSS0c4YUdwTlF6S0JZcTU0Q21lTWJlWHhpU3JuRmV6Q1dNeVZrdDJJRDJV?=
 =?utf-8?B?a3ByNWw1aUYzWUVPZlMwWmlFanNvM1ZKYksrTmZHelNNL2lWSzFzR0J6ZTR0?=
 =?utf-8?B?alFFalErWXNGOEhnSFdrd2hmMEtabUdEcWVuMnNOUmRGY29mUXdxeDRmdXJY?=
 =?utf-8?B?dko3aTFmNENCVUFwdjloMUF1aXgwQzk3d3c5R1JLYTZ6RzhrWjU5YkNqcDlN?=
 =?utf-8?B?TXUrWVZrS3BLQUliaHo0MHJCVDFPc2lFR010b0lveW5UODBPV25ZYW1tU0gz?=
 =?utf-8?B?Z1V1Vlo0SmQyMlhFVWlvVHNnS0wrT0pOVi94OVlTd3BxbC9uL3Bod2VSdnhP?=
 =?utf-8?Q?7wK9TmFxK+Ao8QMXAVSkTiCMHr6cQkgAbDh0AnksDGUh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b9a43a-7b2b-42c7-ad8e-08ddb957b758
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:00:55.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnoeJKwibjcFLc4nPTeydB/sVn4C6S6GqvTs1eVGMVU0k4IkJt9hOLZUgRnZGuvMddWkcSCIVz3l0tWt4qPoXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

This series adds some documentation that was relevant to the FWSEC-FRTS
[1] series, but wasn't sent alongside it as it was worked on in
parallel.

It notably introduces a lot of HTMLdocs that adds key explanations to
understand and work on the GSP boot process.

[1] https://lore.kernel.org/all/DB0I8WAH970B.25D3S59AYF85P@nvidia.com/

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Rebase on top of latest nova-next.
- Reorganize patches a bit and use standard prefixes.
- Convert diagrams to only use ASCII characters (thanks Bagas!).
- Move sysmembar documentation to the new `SysmemFlush` type.
- Reword things a bit here and there.
- Reorganize order of `index.rst` for a more natural flow.
- Link to v2: https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

---
Joel Fernandes (7):
      gpu: nova-core: Add code comments related to devinit
      gpu: nova-core: Clarify sysmembar operations
      gpu: nova-core: Clarify falcon code
      Documentation: gpu: nova-core: Document vbios layout
      Documentation: gpu: nova-core: Document devinit process
      Documentation: gpu: nova-core: Document fwsec operation and layout
      Documentation: gpu: nova-core: Document basics of the Falcon

 Documentation/gpu/nova/core/devinit.rst |  61 +++++++++++
 Documentation/gpu/nova/core/falcon.rst  | 158 +++++++++++++++++++++++++++
 Documentation/gpu/nova/core/fwsec.rst   | 182 ++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/core/vbios.rst   | 180 +++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |   4 +
 drivers/gpu/nova-core/falcon.rs         |  29 +++--
 drivers/gpu/nova-core/fb.rs             |  10 ++
 drivers/gpu/nova-core/gfw.rs            |  39 ++++++-
 drivers/gpu/nova-core/gpu.rs            |   3 +-
 drivers/gpu/nova-core/regs.rs           |  18 +++-
 10 files changed, 669 insertions(+), 15 deletions(-)
---
base-commit: 4092e1b41202ff39aad75a40a03ac1d318443670
change-id: 20250702-nova-docs-b9900d0505b5

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

