Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61380C46EBB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8923210E39D;
	Mon, 10 Nov 2025 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oyRm24J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012017.outbound.protection.outlook.com
 [40.107.200.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F02310E39D;
 Mon, 10 Nov 2025 13:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNUTgmyMZ4dZQN3OE60jkbHZHNQ5561/3EK+qZ9LiVH7BeBOglKSb9NUzIbfQ/8dJ4MROIbzjhvkRXcJx9cTWNMKAdqye+r6i+0h1j+MR5vVAhWxdg/t4mWinlDSsPJKMzjiVsYX+wuqnJTwSEll0XZzkWBWWnL1D+eW9gNBcWEvKp0WD8xVdsn5SwWNuvzcO7sfUk4yXUW198gDdKJshZnrmgWTR4bC2EzV2gOGqQfKwiyCJJsrINAUwyhxltHKAWbwZ5/XLJ5ZM7Y/tlPyUK5HckqqqE0cS0xhB4HbP2KjWaDaxJsdt14EQB4V6FQlcbb42eCIQ/Nqxxda3sGd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXwDERina842nUovIixLBdlVzhiPzu1gj8a3vbvYrSg=;
 b=RDLAY6S2HQEQrtUus6S+M3hPazNwkYOTbdYXh7/FCIGuuHNVpXeqnXK75oFi9VoKOOPf6Rl5/fA7b3BtvB0FMWt5G0oCs+qJrtDRPnNM5Ekz1aXEGdstoMmjhU0o1D7DwyY9rALV32cgLu+z4GWufjnb5XOhBe61hJcPtgIF6kcVKEfSAtLbnSZkGCe0+uGuP8JuRhWwAaWQ8eRksZ9woxpKzIeQxoEaghVbg8wVCiVYVn25Iubble2/Tz9hRhrTfZvQ0/6NQqHRUWECXOZti3oYHz+xwOq6tUP1tRVkS0a0U+f+kZzdnV5PSj7+N8g24RvRBnt/murXXZDSy5740w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXwDERina842nUovIixLBdlVzhiPzu1gj8a3vbvYrSg=;
 b=oyRm24J+yh1P63PMC+EUnZ4I+3/Vqk9zRT8fUT7vC6yuZStX2Ul6q2xGrUwGr3uRyRC2t3j65zHVoQuYZah1GHUf+aF13cs12zE4he7oT9uZR9FvdyRLSwXnwG646K1YO8HNn0tPbMwjxNOb0KD7sBCmZ6No7uEQvhpe/sCPtyhml0lqK3AsEaWor9NOwxLWhLk+J6bh4bxd3g/cMMbJ5IIaY4Ng3ecklPJM01oSAcMiB0x4ScRVTr0vN1rTKk5RYomyXLgfl0XZ+mjwK0wzt4fgPXWfuwJyrXHZcgNu3ab+anUzxbjRr/IptCke2Rp5T6XYGoZuH0Euuyjc5jv+5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:14 +0900
Subject: [PATCH v9 06/15] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-6-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: a721fe8f-3040-4e6d-a1a3-08de205de7bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3J2ZlptcUxvZDJCenF5QzE4bDF4RjRGUC9WQUpVV2FFdjlRVXpTL0ZvaFh4?=
 =?utf-8?B?SlNnNXA1YjhvK3FZcGRVVzczMUQ0VEJISjVxdHc4bk1MWll3TnBBSEo0WXhQ?=
 =?utf-8?B?MHEwYlJxVHBjbCsrVzcrTkJycnVhYm51MStJUkV5akVOQUlkUURBYUJtTzBN?=
 =?utf-8?B?a2pPS0dCcXZDWE43ZFh1TzIyVTI4dVNpdFRjT1kvWkNEa3dUbjFlUTdKMzdp?=
 =?utf-8?B?L3ZtWWJuZ05qeVhCQWYzZVZ3UWxBTUY1TEwwYzVUendLWUpPQnFveG9qM2d5?=
 =?utf-8?B?dUsyeXBjMW1BTHc2Sm5wRklNQnQrMnRFcUpxWmU3UXhtZ0tCRnI2aVVKUHVV?=
 =?utf-8?B?WHZnQ25mdU1SMHJnTzRDWmRpSTErWnhLbnJTZ1VvREk4aXo4Y1lVekt4WlpS?=
 =?utf-8?B?WWpTQTcyVWpTRGNueVFvK0FIWHZMdVJNMFRtSEFYUjdWUFhzeFNsQW1sZE5i?=
 =?utf-8?B?TTc2aWJNVGNYMHBTQlIxMm5CU0lsamZDU1ByRnkxM3BmSkViMjhqYlVQYlZk?=
 =?utf-8?B?WnJHaytpa3N3ZnhQYS9UVEhyTXNlR1pmVU9GSU9MY2dOVHNRZEJFZzZ0citv?=
 =?utf-8?B?WnNZdmR2d3MxNWN5S0k1ZStIRDBKTENYcE93a1BaNGIvMm0wbGpXTG8rTlVp?=
 =?utf-8?B?Wk5vdzVOVXlvVzhEams0SS80Q09FS2IycHdBeDhuaHBOT3U0SXoxbnprdWR4?=
 =?utf-8?B?OXBlZVZVU09INEdtSDkwMGgyRUNvZkNBRmhBMXJmUGJ6UzhwcVQwdk1mQ3RP?=
 =?utf-8?B?SzFjTG5HeGZOeDIwa3RnRXJDV1l5czdYdUdNbEFyZ08xcUZ4ZkJzV0xwK2dK?=
 =?utf-8?B?RDltWnhiaVcrejJPTEJ0aEdMMVA4N3JXaVc4dmRBZldhdWpZd3dlRTRmTy9t?=
 =?utf-8?B?MllSYld2OWpJY0dnVi9MaVBOSlJvaElBVWUzYXhHaGx2UWYxSkR2UnNSYjI2?=
 =?utf-8?B?dmVsWXZmUXVBM1lnaTFtdUdCcVdXdk51R0ZjeDNJWDduSm9hY3FoVzBHOU5q?=
 =?utf-8?B?a0M1Z3cySmtnaEZRZmFDeE5zdzgvRjRPNGJQVEJMRGdQZnBTbUpLbTZKdTZN?=
 =?utf-8?B?MkM0RXFqQ3BNVXVDbHJKVW93bnNyV2RBNnc2SnJYNjBibmoxSElQc1BaYVdT?=
 =?utf-8?B?YnNJZEZhY05YbG1QQzJkNlRoVUdZbkpwc3pWU2JKb3VEdkRFQzdFTTJBSGVl?=
 =?utf-8?B?U1RxbnRzeWgyTWQ5eHovU3IvODI2dG5LNVUrbG9QR3BtR0dYRXVyWVZTSVJ3?=
 =?utf-8?B?enZrUGFsQXhucGV6UXRLR2RFdU5aZDlCUmk3M00wS1ZYMThkdDVCcG9yOWpO?=
 =?utf-8?B?cThjbHJEUmVoRktlbnh2TlQ2c0ZuTWwyQzRheTZ4alMyZGY1emZXZGxuTGQ5?=
 =?utf-8?B?U1BRSisrVUhIS01tS2RTYkVlYmgvb2lrVmJtWXNwUjc5UW1idmg2R1hnQmly?=
 =?utf-8?B?Ry9sUTUySlhRa2RpSWhXd3VUUnhJTWVGUDl3YU93dzYrdTVVQTZHcmZ5Tmpu?=
 =?utf-8?B?azUxWmFGcURma0dyVUdLTEI2a2FKck5KUXZDRXRXYUE2ODR6ZkNQSjlxclN4?=
 =?utf-8?B?by9KVDVBSmxLUTBmRWFXa0xvMHFkbnVGcURLbHhhejFmV1FPN1hjSCswOTBw?=
 =?utf-8?B?VGJYbTgwYzRuN1paRURPVGMzQlovbDZsR29QUlRxT1VoM0E4eGxJOHVsTVVY?=
 =?utf-8?B?Ni9RL0doQXk3dC9WNXlqL3ZTUDYyd0RoZFVqR2JxNHFnL3RXTzdvUWxCVmtt?=
 =?utf-8?B?NmNTSHB1ajdjYlFoajNNY2lhVU9yNmJscUdjSElVQ0hzYitSdXVSVml0d2h5?=
 =?utf-8?B?TWd3OFhaNjhIR2NLMERHKzc1aGQ5RlBFSnNvMHNYT1ViM2Nucmxubkc0ckFG?=
 =?utf-8?B?ZVczK3ZtazVRNnY2c0ZWdTFwdUNkUm10RUVFWFVsdHU0d0lVK0FSRWd1TGoz?=
 =?utf-8?B?ZG52Q3g5Q2M2Ny9JSUU3SmZRZ3Fvd1RFRzNncmxiT1c2dmxkSy9zTmVTVUI1?=
 =?utf-8?Q?hW9sIS9czKIrsrkUTGNtoSW7qieGn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxhZkphUnk3SXIyb0J5aGk1RlVpZUF0SnVxNlFyTTdrelRneG9GRGMzN0N2?=
 =?utf-8?B?ek5KZUNMdjU2VkcyQkphRkhqZnhBM1NseUdKNG1saGpMckdlWU96ckJJOXA3?=
 =?utf-8?B?dGIyaUMxb2ZRLzBxWTNPczZJejRUQXVySmNKaTg2VzRDb2xBVStIRnhWL01P?=
 =?utf-8?B?bTR4MC9nR2xoUU95dEs3MUdjRkdJKzloaERnTzdBZVJaU2txeTdvMU9Sa0hv?=
 =?utf-8?B?TS9HYk1FRjJLZTNWblVvRW1VME9wcnRUL0JZY29VTlF5aStTMmhQRUVEQTFr?=
 =?utf-8?B?VXQ0UXpzbXpwY2VYRWFBcnhsMng5ZzRGUGRHa2N2VklkUzlvWUhGVlp6cVA1?=
 =?utf-8?B?RkZYaDAzZHdubThFdjc2Wm5YajZEcjdjMUdZbjRkRUVnQmJDeVFZTDR2MzUv?=
 =?utf-8?B?U1JXQW85MWJ2a0YzaEZ6aVloTjJjYUdmVEhEcThKZmJKWitFL3lvWXZLTERS?=
 =?utf-8?B?UnJtZ2h0b3lyVDVsR3RQLzZ3RXpqKzZXblpRNlkxSSs1SmFKdzZKcVdrY0xG?=
 =?utf-8?B?Ri8rR1gzUFMyclhVL0Jqbzl5Ym04S3ZyWVBvQy9SbnNxeEkyVVZGVVhScGdH?=
 =?utf-8?B?Z0R0STBES085dk9YNnFWUTgxMmNpNzZPQXZ2c3pyNm5QNEVmQnh5NmNoSkpa?=
 =?utf-8?B?cFlpL0VSQWdpQkxGYXFRNVlWU1BucllKTW1XUWQ5WU1VSFRGdGRVT3d3T3Fm?=
 =?utf-8?B?U0M1VGJIakJVckxhUHB1U3kvUzRodlZ5M1FCNnNMbGgyQWZCQTdZMjhlN0hL?=
 =?utf-8?B?bS9lajZVOE9xZTFsa2o4eVVha3JmcW4yRWVManlaY0NUQWhOMFVPTkRvenJD?=
 =?utf-8?B?SUZmZnNVWTluNGc0TXVhQUdFRUhBaTdCVlpuRFF1MThocXVhMG4wWHZ6Yldj?=
 =?utf-8?B?RGl5ejcwcjlEYjByN1U1R3lmR0pyK0o2cm83OFh4cFZJY1NDbVg2REdxakRY?=
 =?utf-8?B?R2xFeE90cklzMWVya3VZSDJtZm1ZUHdBcklXOEZYeGlFdHB4b2ZoTnhFa1ZB?=
 =?utf-8?B?YkZUWit0bks2TUYwWXpCMEtEYnl3SHNWVjRINnhjVEY5QTZOWlhqN3pPeWUw?=
 =?utf-8?B?RU1pV2puSzlFdGlQRE9uZHJJdkp5b2RvQWh4aWNseGxHYWZTeGJkcm9oTERI?=
 =?utf-8?B?bXkxQksrWnB4cUgzcVQ4N3UvS1BNTEl5UGczbU5OWUNXQzRPVW5tVEszRjJm?=
 =?utf-8?B?L1oyd014bFFqZWR0R1JkcUk0Mzh2UXRpK1NqcC83UXdTZFR2b0swbXZVRkhr?=
 =?utf-8?B?TlZGZGpYZXk3WTAwOEdBbXVJZjl5ejBiQXZtTndRK0t5Y1lhWktkc215VEkx?=
 =?utf-8?B?NVd2ZVQrV0Z4a3Z3TGwvZ0x3RDhObDYySTVza3ZMWXJXOWxxOHlnYlRkY1Mx?=
 =?utf-8?B?L2hnaVk5Q3ZiQVd3ZlQ3VHBxQ0laenB5azlOV0pNZEZrZVNVMGxwbDF4Slhi?=
 =?utf-8?B?c3BGTGpkVEM3TFRKTUZ4SXI0dTgzNUM4N2F1dDNITXh4L0FsNVBMZjdycnhu?=
 =?utf-8?B?ZThidDlLaFEvQzQ3R0o2OHk5QjNvdmozQldMTWxHM1BiNGtnd2dCMGVyYllz?=
 =?utf-8?B?QmNuWEY0WjZNWXRodElPdlAyZU12YThGSnF0RW5hTkZBb0pETDVIQ2hvNjI1?=
 =?utf-8?B?d2o0ZHM4b3NhVEdtY0E2Qnd5UnRMUUs2V1hsMHBsVGV3emlXRDNFNXBvaTB4?=
 =?utf-8?B?VGFaWUFSQmFOQ3NsVWc1MzJDdGtoN0tkeStRQkFPTmtFcm1PT3Qxdk0zUFVt?=
 =?utf-8?B?RVIySWlPU05kUVZrQzZRT0orakFWaXZQV2dpd2hna1ZjWStvbll1d2NQdFoy?=
 =?utf-8?B?NERBNjlibW9jUWtKN2VkUE1vTjJubVlaUnFKU0hGbEF6ajZSeENvMDdpS3hW?=
 =?utf-8?B?NklVZzhSZUZNWGQ4TjVlMEVKeS9hTHcyZjZ3eGRnejhiaUw1a2RRSVZGNTJo?=
 =?utf-8?B?bnFPNHNFR0ZySko2bStob3M0R3ZhNytuSGxhYzNmNGtTT3gxUEtPRnlLUzh4?=
 =?utf-8?B?dUFCa3JkdU9LV3ZCZjZnUXZYTlBuQjVRT0d3NGxnZkJRektjWkgyeis4azJ3?=
 =?utf-8?B?RnI0MXc0UFlWdTg1djUydGtpdVduaTdabk91SzdrR3ltK1VHQ0VLWEhwemhI?=
 =?utf-8?B?TS81WGVqdVoreDBCSnBpK0RqU3RvL2N0VS9HYzdOTWZHNmttS2FSUmdncm40?=
 =?utf-8?Q?b9IS/E/LDnj2j6Gaxd22S9OwcRSOKeUmNXUdwOU+uHIS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a721fe8f-3040-4e6d-a1a3-08de205de7bf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:42.6963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSxXwrn2r8fawr7xLxJlpd5LSas2I1p+ssloykdBA4L+G/5Njx4D4ACwaci2ETUCTyq7u0vtn3bB1QdPFl3DBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

A data structure that can be used to write across multiple slices which
may be out of order in memory. This lets SBuffer user correctly and
safely write out of memory order, without error-prone tracking of
pointers/offsets.

    let mut buf1 = [0u8; 3];
    let mut buf2 = [0u8; 5];
    let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);

    let data = b"hello";
    let result = sbuffer.write(data);

Reviewed-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 232 +++++++++++++++++++++++++++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9180ec9c27ef..c1121e7c64c5 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -15,6 +15,7 @@
 mod gsp;
 mod num;
 mod regs;
+mod sbuffer;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
new file mode 100644
index 000000000000..f0cecbcb81be
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Deref;
+
+use kernel::{
+    alloc::KVec,
+    prelude::*, //
+};
+
+/// A buffer abstraction for discontiguous byte slices.
+///
+/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
+/// of the same length as a single stream-like read/write buffer.
+///
+/// # Examples
+///
+/// ```
+// let mut buf1 = [0u8; 5];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+///
+/// let data = b"hi world!";
+/// sbuffer.write_all(data)?;
+/// drop(sbuffer);
+///
+/// assert_eq!(buf1, *b"hi wo");
+/// assert_eq!(buf2, *b"rld!\0");
+///
+/// # Ok::<(), Error>(())
+/// ```
+pub(crate) struct SBufferIter<I: Iterator> {
+    // [`Some`] if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    // All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator,
+{
+    /// Creates a reader buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let buf1: [u8; 5] = [0, 1, 2, 3, 4];
+    /// let buf2: [u8; 5] = [5, 6, 7, 8, 9];
+    /// let sbuffer = SBufferIter::new_reader([&buf1[..], &buf2[..]]);
+    /// let sum: u8 = sbuffer.sum();
+    /// assert_eq!(sum, 45);
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    /// Creates a writeable buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut buf1 = [0u8; 5];
+    /// let mut buf2 = [0u8; 5];
+    /// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+    /// sbuffer.write_all(&[0u8, 1, 2, 3, 4, 5, 6, 7, 8, 9][..])?;
+    /// drop(sbuffer);
+    /// assert_eq!(buf1, [0, 1, 2, 3, 4]);
+    /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
+    ///
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a mut [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        let mut slices = slices.into_iter();
+
+        Self {
+            // Skip empty slices.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    ///
+    /// The closure `f` should split the slice received in it's first parameter
+    /// at the position given in the second parameter.
+    fn get_slice_internal(
+        &mut self,
+        len: usize,
+        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
+    ) -> Option<I::Item>
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        match self.cur_slice.take() {
+            None => None,
+            Some(cur_slice) => {
+                if len >= cur_slice.len() {
+                    // Caller requested more data than is in the current slice, return it entirely
+                    // and prepare the following slice for being used. Skip empty slices to avoid
+                    // trouble.
+                    self.cur_slice = self.slices.find(|s| !s.is_empty());
+
+                    Some(cur_slice)
+                } else {
+                    // The current slice can satisfy the request, split it and return a slice of
+                    // the requested size.
+                    let (ret, next) = f(cur_slice, len);
+                    self.cur_slice = Some(next);
+
+                    Some(ret)
+                }
+            }
+        }
+    }
+
+    /// Returns whether this buffer still has data available.
+    #[expect(unused)]
+    pub(crate) fn is_empty(&self) -> bool {
+        self.cur_slice.is_none()
+    }
+}
+
+/// Provides a way to get non-mutable slices of data to read from.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at(pos))
+    }
+
+    /// Ideally we would implement `Read`, but it is not available in `core`.
+    /// So mimic `std::io::Read::read_exact`.
+    #[expect(unused)]
+    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
+        while !dst.is_empty() {
+            match self.get_slice(dst.len()) {
+                None => return Err(EINVAL),
+                Some(src) => {
+                    let dst_slice;
+                    (dst_slice, dst) = dst.split_at_mut(src.len());
+                    dst_slice.copy_from_slice(src);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Read all the remaining data into a [`KVec`].
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        let mut buf = KVec::<u8>::new();
+
+        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
+            buf.extend_from_slice(slice, flags)?;
+        }
+        for slice in &mut self.slices {
+            buf.extend_from_slice(slice, flags)?;
+        }
+
+        Ok(buf)
+    }
+}
+
+/// Provides a way to get mutable slices of data to write into.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or [`None`] if we are at the end of the
+    /// data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement [`Write`], but it is not available in `core`.
+    /// So mimic `std::io::Write::write_all`.
+    #[expect(unused)]
+    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
+        while !src.is_empty() {
+            match self.get_slice_mut(src.len()) {
+                None => return Err(ETOOSMALL),
+                Some(dst) => {
+                    let src_slice;
+                    (src_slice, src) = src.split_at(dst.len());
+                    dst.copy_from_slice(src_slice);
+                }
+            }
+        }
+
+        Ok(())
+    }
+}
+
+impl<'a, I> Iterator for SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    type Item = u8;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
+        self.get_slice(1).map(|s| s[0])
+    }
+}

-- 
2.51.2

