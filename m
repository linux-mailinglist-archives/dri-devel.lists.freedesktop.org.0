Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EBA947AB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7E110E2E5;
	Sun, 20 Apr 2025 12:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="efG4L1bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC810E2A5;
 Sun, 20 Apr 2025 12:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QicDutrt6MZRyz5OvXjE/fJdBXfuRf0W10aBCNg1tL9Fx8va+da5bTC0qmBxHaOxkzIPJutahaJnQvlEv5UAE1Tm6n6O0VvocXmIAD6ot2jbflCDB1URpUuwXSIXEPWT9PLIHBNrcQoNO5SAufwQUI2nY7968TSM4BHYnzjsYotRTTIInzu4hhrBPuto+WN32JrECEYMkdSy8xykT5cPNY0T46y+HlaQghicRQIub+DCK6OP7Qx72IWNtkZtQte3BtVo2kUwJ5/a4U188LCNvnAO9ELJX8sRdtWJES2zEkNANo9w8Je2ULEtxi2qa+W3sY2f06ARF4ab5tQ7Bi4Emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=ZJ0V3Tey0JSP6O41Scy/qCO7zCvE5LECNmCVuDJ777ZSgPVXlQABa4aTzYpyEQc1GuIMtRQVY5etN6W1TLOVLckBM0e0DMcu6FZgjJCpDV8rfFB1LPzCIFolpJ/1tpw/ah82lS1kQA9y/29W/FhkMxeDp2+1o8CTJLi/sO5cMXbkic+mm+/b2zhlOvPZ7k13bKF9PdN+e35sWoyzsL7eW1OO9qHszPfOyz5dCw+fkKZ7ZFA8X33DzoZt4jRLI2mZXzDR1c2kTyGJkrPSqdKQm6HbZ5wWu81prfR7LKdV2YAYydTV4pc0sRgOl9/eGoMbwqZ/9itHSJ7I16VRqoa8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=efG4L1bJGJRkuEnT/VnbcNPoyjLKr6URE8wBHu7RpA3i8dfVjTkMxcxOT7AVBZV9Owe6ZKZ/PVI+2Iw+xosdvexNh/yUThrzSz1OycD86Xift1TRRmJC61GeCNFO+0fiN6XwQLarILuDz7Cbh9GByWqZ0BlnjjSFGYqy5JrKyl4oS6wg8MdV1u9xcD90exTpOjUo9YD6y05XUYlXvSXXZ3B5VAizMuy4V+kmqDZWIYj9bulCDOxA5mNFV9IKZsGTZ4Ud2NAjlYoF+QN1DY+hHD3luk4VqxKxohGjqOCUOSei9hZX2tai1wcNFsOLNI7B1Af0AMPwIA7MUm0+tOCmIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:19:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:19:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:34 +0900
Subject: [PATCH 02/16] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-2-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0222.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa2b107-2d09-4ea1-e46b-08dd8005aa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LytMajFmRGxWNXJ3UG1TcWZ1OUpKUUFMQWJva2dNRUpPcU5Gdmw1L0ZZMEw2?=
 =?utf-8?B?amx1QUJqdXh5VzlJdytDRmhTRHVjbVpwanN5NVZhQ3MyaUtkMFlHcVpGdVNE?=
 =?utf-8?B?Q01VR092MEhsV0szRzc1UUVtZzFHNEhnWEQwT0hTTWk1WUE0Q3VPUlhGamJy?=
 =?utf-8?B?Nmx1TU1nWlV0YWRUZHlGNzNuYmhkNVFhVHQ3dVlqbnhYNGd4RHBmUGZtdTBF?=
 =?utf-8?B?RUlqckpwWXNnRmpNeWlDWGpBRVc3RG5wcEc5c1U3a2U4cVV6TXh2b3k4dGg1?=
 =?utf-8?B?VmNpb0hLUHBObytMak1UZWtMZ3VtNzlQazFKL3A1dTk1ZktMOHNDc3kwWVFV?=
 =?utf-8?B?Q1VsUnE3ODU5djZUcDBDN2JNSVdCYU81UjluSXhHanhDM0N4bDF5cyt1MlR6?=
 =?utf-8?B?cy8wY3RXcDBMdDRZN2d6eVBPL3FvM3I0czhPc3VEekV0VXd1SnVZWHZXZ1ZD?=
 =?utf-8?B?K2c4RHVYUVZNUGwySnBGOUIwYlAvNzEyUHZzcVJWUGJwOEhrNENMVGt5SVlS?=
 =?utf-8?B?V0VWM3crb1V6ZVlwZWYyaXByZ2IyZ3lrVHZxTFFVVkhnZnUrWVR5VDdqeTk1?=
 =?utf-8?B?Q3lQbjkwUjg1eG9CalYvVXBNMnlRdzlBK3VUUkZaVXNCSGVQMGUvSmNtNU15?=
 =?utf-8?B?TlZDa1NnV09mR0JOeEZBNFI5OWdjc3gxUmVmSi9KNkIrdVMxa2M4WDhoYkw4?=
 =?utf-8?B?RU5uWXRabGpYT0pMNnpKMVRjM3FtTVZnQzZBMjlsSmdjS0YzTDNjeExRWEhG?=
 =?utf-8?B?VnNFck8rV0h3Z016QjZReUNpWi9oeVRPMTlWV2tCN2tkMGV1VmZpdUZHRy8z?=
 =?utf-8?B?Z1hiUTF0NDhzLy96SHhzMUxrNFdXWDdQOWQzb0FqSXlreXlyaldhTUh5R0xv?=
 =?utf-8?B?dy9iMTYxc1dBNkdXRUlreUQvQUh6OHlqWnNBU1dWTlRqVEFCWjFveHl6VktT?=
 =?utf-8?B?V0NRendwZ3JnMVh6TlR2Y3l4T2RJVTRXeTAwbjJiV2pYT1pkbTkwd2k0ckpC?=
 =?utf-8?B?N25SOWlPbWhhTkRDWDE3TnFwbWtEYUJVQ2JNdDkwS0EvWVdEMm5KZjZ6V2FN?=
 =?utf-8?B?dS9TQ0R4MFQ0M1FVQzNTb3l1aW9vQ3JmMDBCR2xWQXMwTVRWdE1mRE01T0I1?=
 =?utf-8?B?OUZFNWZXaXlVdC9QMW1LdTZkN1BxMWM4MFk4Y0xIK2lVUERMQlN6Ri9jRkpT?=
 =?utf-8?B?dWJCWWxyZXRXQjRxdDVvRUppRlZPZHRjcDM2TXNCbFF6aE1aZzBtRjVKcDZv?=
 =?utf-8?B?eUVmQW96cWRRc3p2SkxFN2tsdW82Sm9oak9HNDgvZG84S0t1Nlo0Nkluamk5?=
 =?utf-8?B?TWJRcHlnMTBVZE5DMVZMME9WZUNtWVdWbTJUZFJ0am50bXBuL0RIZ1hmaEpU?=
 =?utf-8?B?QU5jR2ROUGY2cSt4SXV1c2tlOGpXd3ozYlJna3F5aDlacjdyQnZKRXR4OE10?=
 =?utf-8?B?dG5aUDFMcGhJenArSTU5WWxObUhPckdsTUhhS3U2UmNzdkRxam4zTDdiTWxT?=
 =?utf-8?B?OWNkRVlMVFpzcG5RSElPdVZxeWdjOUQyQitMOHkzQ0NuOXd6aHhvcnRmMU1X?=
 =?utf-8?B?b1M3U1lvZWtvQUZKV2duOUwxRlNIUnFIMXB0UyswRzczYloyNWlqb2x0NXBs?=
 =?utf-8?B?bi8vc2RRMFpXN1JKV1NoaG9MY0VUVE52YVk1dG9TZnJKTFdXYWZOUTV1YlBS?=
 =?utf-8?B?ejQycTNMT0hmbEdjVG5nenRNRkJTclN4QUFGREhoeG8yMnIwYytXZXJCMlE5?=
 =?utf-8?B?S0VFczVPRFRmWHl3TlhSU1NzOTQvQmFNMVZpN0NKaVl2NDlHYXF2QWZSOWRU?=
 =?utf-8?B?ZXZ1M2ZuVGFyNFJUbCtPaFJMZVMzZU9QOTluZUs0Sm43R2Rwd2RxbVl4akdL?=
 =?utf-8?B?YnBTcmZNb1FPQStHMlFJM3FreHJwQVhmc1FXR3lyVmNJdTRYUGxwRzBZWDha?=
 =?utf-8?B?Vlcxdzh5U1g1aW45WDJqc3lUQ0VwL3JMMGxjM3dqTmZVdUhNOWo3KzlBemhX?=
 =?utf-8?B?Mi9TT2h4UXZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtHMGFiTDBXOE96SkpiY0l5c3lid0l3WGw2U2svcGVseUdaV3dEcmhtY1Fn?=
 =?utf-8?B?STlITVAwUkQyMnV2cUtHYXBtNFViZUg1TnR1V3AxRjVsaUhQQUdyZ0p0MHk3?=
 =?utf-8?B?bmt1SFJ6QmZibE94OTJYSTVuaXFuM29qcjZicU9pOTR6R1BxK0xzd3dISFZw?=
 =?utf-8?B?aTZnbEpNNnJJd0ZDYklDKzA3dlA1Vkl2eEZiTU1vKzFRU3dGNXJaVUp4YTVX?=
 =?utf-8?B?NXQ2YmQ2Qk81UjVXaTJJWElRQ0NHekRRQlFWNXdoemx4WVowMGpTL2QzSnR2?=
 =?utf-8?B?ZUl4YkduL3FpTzl2YlIvL1pGM096dG4ySEkyVklKTy9ac2hlclVvSzlDNEJD?=
 =?utf-8?B?RE9FZnVQQndaWGdvRVNuZXduUHFtczVuMklwSDBsSUxmcy8wV1RLS3QyL0Yz?=
 =?utf-8?B?UUM3QnRERzFoR3haT2lyZElPYzd1YTBqTDFYWW44blJmNDdBWWRrWkdtZXZQ?=
 =?utf-8?B?U21ENlZxcHFrbHc0SDUyemdCa0dEU0trd3ErOWVqWHlzS2VTVGJMOUhlL3dK?=
 =?utf-8?B?czd6Ty9LR2J2WVB1OUZJOUpBSHkzR0hCSVpUREhtak55Q0xDQnhaQ0VPdTlV?=
 =?utf-8?B?M0ZCKzdwcHpRU3lheDQ1TTR2SThzbCtKR1RkK3dwMEZVTnRTQnJDRTAwN29R?=
 =?utf-8?B?RlFoc3ljWXF2aTZSQnR2STZyRmplRU8ybldaY0RqY1RQNDZ5T01xWXVjOTkv?=
 =?utf-8?B?OE1ncHArM0JxRUhIZlRSLy80YTFtV291OWVjZDVRMVFQT0FKZlB5SVF2NE95?=
 =?utf-8?B?VGxrV3VRUXlPVEtRS3NFUnpHWEFtUExhWGJtWXdqUWUwV0pha0UxQ3N5VU1i?=
 =?utf-8?B?R09OSi9oa0JYeHZpR3Z3RGN0ZGlabHZtblZtTmFlN2E2MzJBazhFWENzT0to?=
 =?utf-8?B?Sm1WRUtNeU52MkVFZnE3R2xiM3ZzK2RvdVlWeEQ0ZmRwUnlQZHpVY2NpUXZB?=
 =?utf-8?B?a0RGTzhrOFRib0FzSkNmU21zTlEzelQ2S0pTVHNpemdReEJxWk1HeUVtSnQ2?=
 =?utf-8?B?S01HVkhkS2Vyb0p0TjB1RDZMamFWdS9FQkZGYW5HNTRTV3lod3NLdzgyODhv?=
 =?utf-8?B?cS9VTTZNcC92TmhyczZ6OHFMNUdKdGtFSHBoVFRPUnp3UnpCME1vRDFzS3Vo?=
 =?utf-8?B?TjJad09LRGpCK2pFNWdWbjBYMDlNcWNiOThUV3RuelRiY1VsREdxOWhzWHUz?=
 =?utf-8?B?SHhxYXRmRHhCUXg3ZElQbkxKUkpGNmY2WVVsV2M0SnkrWVE4R3dPS0VkZEZ2?=
 =?utf-8?B?TThMVDBaQWFPSkpaZU1JTzVPQjN5TzVFbkgzVHRKclVlQ0FOaWtudUxEUndy?=
 =?utf-8?B?L0JnaG5VNnhnemx0MTRPaHp2OHJyRE5ETUljSXpVZ1A5MGFnN0V3M1RVejhU?=
 =?utf-8?B?cFpXT2hTK1lyMW84UmFITkprM0ZHbjFwUFhjZk1xY0xoZ21nRGxwM3ZDRzFl?=
 =?utf-8?B?dkxTVFZvclFLbUplTDA5UHhzY1NibVpPemVqZjZtNUVSUHhHeXZzNFZoanhh?=
 =?utf-8?B?T2x6YWFWTStwdmV4TGZXd0FnUjdQYW1ZOVNKUVBZc2RJL3psbFE1cjRnSmtV?=
 =?utf-8?B?WGlFK2RhQm8zSW9oVDB1aUFvNFM4QnlkbmI4c2EyRzdyNGVYYlVsSzRZcUky?=
 =?utf-8?B?cjJ6em5TdlkzdVh1Y0VidXZ3elpFSTNKUG90RVluTTk5L3l6K20raVp1Tm1m?=
 =?utf-8?B?QkQvZWRFQ1RPT3dzeUE5MU9WTHJmalo1bUpWQnNOTmhkYVRnQ2ZrQWl3SHlV?=
 =?utf-8?B?bGFvU1B0RDhZblozTXplR3VOVXBPTkFJT0w1OEg1K2ZGY1Z4N2J2LzVtdWhE?=
 =?utf-8?B?L0pLYkhidnIranBPL1o4cThVVmFHYk92OVRVK1pScmpPV2dMc0ZpeWhqa3RR?=
 =?utf-8?B?eG9uejZzMHcxTk9RVmg5cjBJUzRBL2FJd2crMGdPeDQ1czJhTUk2b0FwUVha?=
 =?utf-8?B?S3JJa3ppazFPUTVaamZDZ1dicmV3Tmc5ZFNLSmlNczNmcTdGNlVLWW9PcmN6?=
 =?utf-8?B?bXA1V1E2ZUpUTFpzMlpHV040MitFa2NUMjRTMysvWmFJL29YM3p2RWIwcVFs?=
 =?utf-8?B?RktKSkVaSzNOTk1qRUliZFdFb0lXZFlEbWs2TXFrZGhhUjBieFF0V0xqaHB0?=
 =?utf-8?B?aCtmNTRXR1hyU3NVMnBkZ0lDT2RjRTlWb09HRHAwNTBITDhaa3FtWW1Rdmsz?=
 =?utf-8?Q?gPlYiNVKfglPzf7TFKU+yXhyqedd/hVlHnfEfkTgKkjn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa2b107-2d09-4ea1-e46b-08dd8005aa36
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:19:57.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIXDflkme+ANzw0fUV8KRkI3uQWjyfeMXr2OKUn4UVrEeKTkNK9L6MWxBRusU4RwPneeAdKfJVisTU4zYPxdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

We will use this error in the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0

