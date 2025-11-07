Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE283C4204C
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CDD10EBA3;
	Fri,  7 Nov 2025 23:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K00yHKfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2B110EB9E;
 Fri,  7 Nov 2025 23:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMSWRXgW6cUsY0DJpqhhAgyJX5ubFOJOlpjbmRaNS2QnT3YWjICovIlK2+I2Hil6lAEuQZf5DevGkXOSNk+O2Sq2WLEsK3iMkipd6CpJ3/ddU9geIPOxiCxylvu3dryMQ1bZL4StvlZmZhxKZ8VAY6rP2OUWwkQ2aiDtqSi9rGkc6MHVxx+DLLWAmFuuIYuQqquUGcEzqFqfIMuNW9tpCgFjFM5WiSrpGFVWc8j1Akwk0Abd/1M62DWk6px6jorkg1lRRJhtuGS0hTlCU/dHkXTwjfHjMuwT3eR+r+LwJC9M1bcPCcZumswFcRxw9/JZ2aJ3pNbHRLFI4bKbyElgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqBxLmE5Vh76KSTkKSvx92+Dqt7xcvt2/oeT4qycq60=;
 b=jr+3gutrN5hA6E+ZXlmzHjlP6oSVcE53Oh1sqoSjZ2M64/x9hqKuXobuqXgjS7X8U1C7u4tv68RLes9vjNCuQ48qf7ZVv+WzKD1JM+geEq4b5E83hXRoE0jvJksfWphldSltaYVxpWyxGTvwsc6Sm33jV1yud1au/aL7OraWl7D2/Jd7oJJwpIbj7GWtDBiHdWv7d1VYN1Bif6UmMvt6brGodiU062136/QOEc8qmAboLPyMdZJxv4ce652CcZScg+e4mAuuC1VvcNXbC/YrEB5dE70Y35K4gyxnF1yTQfL6HpB5Lyllh6qTWP/tpz+3QREOt/BMx3c3juDVeT1noA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqBxLmE5Vh76KSTkKSvx92+Dqt7xcvt2/oeT4qycq60=;
 b=K00yHKfS85KSa044nmilhJ7eqFGsaEhtEOrXO2rPLMu7yuqTjPn09nKFWcamLegrTFntD5ZodNyvrm/QGN389sjijWENh/nvrd9sYe4keDCg3xrww/k1elRtvPGa8ilaY36rn3ChkrSXhjdkK1MTKu4HdPjRH17/0vijZb9colDv1QjyIW65c2vciOrH8FiyyPX6GCxoYGGWbfNb2zwGtwV6WcvdjH90027N/zlw5/L0Qkl/oa4a94uhA4c03N5PJttI5Ct1tsRjQvIEb0diasugMjCOeYtbAKMMwXiussJh6j1JbYmp7S0BzBd7GTwM0r7YoCLQ1sX5keVCJfKqCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:44:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:44:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:15 +0900
Subject: [PATCH v8 14/16] gpu: nova-core: falcon: Add support to write
 firmware version
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-14-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 6473e4d1-cb99-46e1-1030-08de1e578ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlNxZERuempKVTZhNUtiNmlWT0FwMTd1NFZrdVdJL2RyKzY3cEQxcjA2aXlp?=
 =?utf-8?B?cGNRWmdEMndEK0FNUThzOGZaTDVDczNTYWxBVWJxTHVoVHNXRHFwUzFmY0p6?=
 =?utf-8?B?ZkRVaVZUY3FxRU1HUnk1OG11ajhhRDgzdDFCRm0zaW1nOERNemI1blBYZ0Za?=
 =?utf-8?B?NnVCb1pkM2xpNmNOQ3lDVEgxbERpcFNMbzYzUkRBK1V3MkY1KzVETFA2K3J2?=
 =?utf-8?B?NjVnL3ZieGlrcHltQVFMVURHTmFxODh4RmtYQ3NkVWVBbjlIM2J2M1F3S2dX?=
 =?utf-8?B?aHRuQTVUNEtUeVdqWnpibjhmV0NBZHd6TmV5RmhtdXNWaXdqT3d5Q29ZV290?=
 =?utf-8?B?SVNJMjVGWWhtYnUxY0pQenQrdlpTcE55d1pzbDhidk15QkxuYTR3VHdSaWdI?=
 =?utf-8?B?SWhCN3B0dlkyVlVjcldqdk54b3YyWVM0R3lyYXZVUFo1Tk9KSEN6NWxjSkN4?=
 =?utf-8?B?dUIwVUhHd0p2ei9TRDkvR1Q1c0pQdzN3MEFVY2Z0a2VTZlpLNmFmcHZUZXhL?=
 =?utf-8?B?OXg5emtPVFg0MjJOS3JybXVRUTl1SDhGay9VZWFhc1hLdFJMTmNZNi9MalIy?=
 =?utf-8?B?R2JwMmNGNXN3dHFNMUxQY0FrVExSOTFJWXlCeGJwNGhoNHdUVXYyR3luZ0tY?=
 =?utf-8?B?QU9aSFcyUXhOOExSYjhkbGl5UFlRUkdYejZvY1dHcEpXTGlaWThNWFVkQW1J?=
 =?utf-8?B?SDgvSlZBZkNibmZkL283YTRUYzA0SlVaNXVQRkd3K1FaRm0xZGRLL2VZdC91?=
 =?utf-8?B?TjhVSnhWRUNkYjFnTzA4OGE3TVo0a3VaczB1RmkvQ3BEQkdQTENwWU9XMFpQ?=
 =?utf-8?B?eThTNVZKcHhIeXFjaUhqKy8yL3FOblhiWTRmaTYxb21LVWFPOTFwVVB0VVlU?=
 =?utf-8?B?RnZCbEZidmN2OUJGVUdKbzIrbzFMYlBtU2w2NDYxcFFyYTc3aHJ0ZmhpTlBU?=
 =?utf-8?B?eFBPYVZINEU5Wk9ZS3hDRnUwOWcwczd3VEhMY29vbGhFY01tWnA1dDlPbWtC?=
 =?utf-8?B?a21VeFNBYTVXc1FRZytPRVhQKzVJZkpBZWtRRUl1Tk9oRUk4Sjl3VkM4K0Zv?=
 =?utf-8?B?WUhCS1FNcmZWZjVKVC8xWjBlZmlvREtQQWl0K2hCNmtpVkc3VjJUSklNM1Az?=
 =?utf-8?B?Snd6R0RZWWZQOU1uUkM2cGw1N0xmeWhjQzVoQmVBb0ExQ1kvbnA2elcyL3Vz?=
 =?utf-8?B?NnJpTkJTNFYvb2U3Tk9sVTVSTTU2cmhxb3U1ZDlYdmY4TmZDa3R2MzMwQmpS?=
 =?utf-8?B?TVBKS2VaeVR6VXUveEVRcllKYTMxZXRMYitMaHRnTm4vNWZzKzFRdmphYXMr?=
 =?utf-8?B?SDhwNzRJN0JlZmNCek9TcnRCcTNIVm9UQzk3cEJqb1BkSThWeFJlZnZ2aUdo?=
 =?utf-8?B?Ujl5azJZR1NKZFFSYWk2aDdLMUVHVDBFUFZ6TDZOcFdKUGFWK3ozdkcvODVX?=
 =?utf-8?B?Y24vUnpTVGV5ZUNmQWZHVFlOUndNUCs4ZWZsMXhWZDBuaDRyaklKZE92VzdX?=
 =?utf-8?B?L0VKN3hFNVRPYUFoaGkyWXVGdmQ2T3Q1U0VnRkUrVlN4Mk10N1VwbmR0aWov?=
 =?utf-8?B?M1ZkdklMTFhvZGlTcy93MSthWnRjSUVwUUFQYVo4Q3BZT3paa0hVbFBFNHhH?=
 =?utf-8?B?dWhyZGNLaTdzNktWK0h3c2ttSmtKY2d5Z3FHZFdvNGxCOXlaL2JzSVBkRGZZ?=
 =?utf-8?B?TUM3clJHZUlhZ0ZEYTFpU1pLaVFjbnpBdlROakhYWUF0akZWbHM0WWZVdkYx?=
 =?utf-8?B?dHJUKytGL1NCWEZvZjFVOGtWWHVmNDBpU211bkJEWjBUSG1xWkQ1K3NLeGJx?=
 =?utf-8?B?MEd0QjNrZmVWV0phNStJRENJUGd2V20rMVd5L3VYOElzRXBqaDZlZFgySnVM?=
 =?utf-8?B?TmMzTXFGU1BGaWVrcTRuK0RxM2RrZzNFUzdaL2REdG9yNUtkWTkwaXRZajFn?=
 =?utf-8?B?TjBuUmRFUGRlTWFiTXpxaXl1dTJwRlBKS201RVJpSDdJeURpOHFGNy9GSk1U?=
 =?utf-8?Q?rDPcxgYynkLsTJ+8OxV2cEND0nqYjQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVFZWQydThtL1NEUkR1Y3ZmOUt5bXBUTFFMTmVqMUlmQUtqaGVPekcrRzdE?=
 =?utf-8?B?SkNMNk9qT1FKcWpHYWZDZkV0L2ZldjRmNzdhd2V4S0I2QW1zalcrelFNbjhS?=
 =?utf-8?B?Rk1lUkZLM2g5MzlUTDZiNndPRnJ3UDdHcDlGVm04T0t4b3BwSERYaVN5cDc5?=
 =?utf-8?B?a3NGc2ZxeW45ejVuK1F3OTlsVyswdkthWTNlT1hRVGlKNGlNME10SU1FNklK?=
 =?utf-8?B?NDZsKzAvanJwVjhuRXE2NFpBWlhjWjNDdnREU2tEZXlKWG1BK0VxcTZkSld1?=
 =?utf-8?B?VUxzTzAzM1YvTW9RSVVaeTZvd09HOXhaUlMwcWlYVTd4cHhyMlBnY0h3MGpt?=
 =?utf-8?B?ZVVFc1V0MzdaeFZaQ2Q4cCt6ai9SbE9jQi8xd3JZamlVcFhNOVhpeWVXdUl4?=
 =?utf-8?B?S2tVeWhMOTZUOWEvQXFoR1FmazFyem43TFpPWHpmbk12V3g3VWJjOEtPWjdJ?=
 =?utf-8?B?R1pqNVNDUWRSWm91Z1ZhZXRjNHV4clJIMThValMraWJ1SWdNQ3ZwWmZ3K1BW?=
 =?utf-8?B?dFFFdWtUWkZRTnI2M1VPMG9aM1hlN1EvWS9PTGhla2FlZXNiOWxGZERpTE1j?=
 =?utf-8?B?dE9zSTlFMjM3bnBlMnE2ZkdlN0Y2VFVoVVoxbXFXM2pQdTYxWE0ySjlPT0hQ?=
 =?utf-8?B?U2pKT0ZOWHFyV2xNRVBNNVdGLzNGL1Z4NXdIUGhBR25JWTZWdEo5R1ROaXZU?=
 =?utf-8?B?SjF0bFpOWCtwNnJkZWJqRTFETVdsZTM3THRpWXVBWWdBN0pOSVFhaUUwRUU0?=
 =?utf-8?B?WUZrdmUzeHFNOHhHczJlMmpVeWV4UEFRaEtKZExHMlllRXJGMU5GQUpIZTVw?=
 =?utf-8?B?WHlJVW5SK2FXMjRGckRZSmVIdENmcFMyUk5nVlpsd0UvN2pleE5wQXJjc0VZ?=
 =?utf-8?B?bFFEQTZzbTVmRkZ5ZUxEK29HYUtrT094ODhWZktPeTVuVVZuK1J2RDh6NFF5?=
 =?utf-8?B?cnhYY3VNdG92ZGZlWXVudVdNWlFWSVFmR1JwV051Wm94cXpjdW5JcVhGSE5O?=
 =?utf-8?B?SGVXenhLM1QrZUJlRkJWVUsxRkpFalJzdm5JYjhCQ2Zid3lwOUh3ZzA2emFZ?=
 =?utf-8?B?VGhFUHlpb0J0L2VNWS9kVTQ4KzY1a0doYjZjZGxPekF1VWIzbFVBZVRmWTln?=
 =?utf-8?B?NGxQcUdnNjl1K2g5ZEVXdkhiczJyTVVpZG5tWmV4M1RSbGtKQ2J6SFBBeWlo?=
 =?utf-8?B?QWp4Q3ozV1FCWjh2eHNYMXM5SzhaV3VDYzNIYTJJWnFpMXQyeUpBc1pqOW95?=
 =?utf-8?B?Q0R4aFVIVkRGdGNWTnZWemExbUdQcnRteGVrVCtHdE9TS3diZXdUR2JEbmFq?=
 =?utf-8?B?MFZOMnIzYzkxbC9oYXJlT2haNXZuaE9VMWZkMnBvZHhmSU5ncitlcVBlQnE0?=
 =?utf-8?B?OUd5N0FKSDBmRWk2VnpSM0Y3ZGNMMmJTZVkrZllvd1RaWHAzeEU2eFNGZ25Y?=
 =?utf-8?B?dkVwZ2h5ZDdQU1lPS1dzY1hzaXVaSmY1dkh5OHFaNEZoa0JlOGpOZjlpWEFM?=
 =?utf-8?B?RXB1K0xWQVNXQzhaUkFiT0ZIUityRUU5d0NERTBPMlFRMEFTZTNMY04zU0Na?=
 =?utf-8?B?b2l4NE9lRHU5SEo4d1RSZUxJUDBkNUgrZVVGN1RPbTFkcnZpbzFwNXZlYzZS?=
 =?utf-8?B?VUpSWnEzV2J1d3VTRHZ1Q1R0L2dSZC9DYUNrSVEwanFxZDBUNFJpMXoyYXk0?=
 =?utf-8?B?UDFQajI5bWhZZXRRVWJDczFhNW5YWGNFbW1wWWZNM2xWWFpaNlVwRVFIeVdU?=
 =?utf-8?B?R2VUQTE4U0hiMm5pOTFjYXZTVlpITml2dWg0ZGN0NUhwd25JQ2ZvSUxKUFgx?=
 =?utf-8?B?c3RWMlJWZHpwUTFQYUpNWUVNMmpaeVZ0bFhkTXZwdXFpYUZnSGJ2WlFEQzVT?=
 =?utf-8?B?ZXFMQlFONlpiYmhHMWZObXpFTnAzaE9vN08zMlhjYzJmZmZ2Z3lGSmxuVjdq?=
 =?utf-8?B?c2d5c2JKbmNDZkxYQlhaSXAydHNQbGpPbWFCN1l6UjJhRXZMTldaempDeitD?=
 =?utf-8?B?d0x1aDFTeGtmNUhxOUtadnM3cVlDc1JIcEhXckJyU2hzNVNXZkhqc2dZb2F3?=
 =?utf-8?B?L0VSYTRUdkdaQzRldGRHcmtveG9ZaFNTcnFtTGhrMzBrcFBnVW9veUQ4Q0lu?=
 =?utf-8?B?SmczR1doWTNTUTU4aFF3eEltVlBlUzhjWjNpMXd3TXV6bnZySWIzNEc3R2c2?=
 =?utf-8?Q?EDBpXYJ7M41GUIBzSviCuQKfkyN3b6OtbZoOwr7auxCt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6473e4d1-cb99-46e1-1030-08de1e578ce7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:44:10.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LspuVXknKmSXaXYhx/sYBy2adbuWBMU19gx4P0O9EhLu1wbOp71UGHpl/LxLAPhGihwvBwcQ9fSXWIL1TRTtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 8 ++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 4c1f36073533..31904e1d804b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -621,4 +621,12 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5d5ba766cd61..274e53a1a44d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -230,6 +230,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });

-- 
2.51.2

