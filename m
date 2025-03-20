Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC48A6A759
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F7210E616;
	Thu, 20 Mar 2025 13:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fXUz5Ugp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABE710E60E;
 Thu, 20 Mar 2025 13:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/gkjpEkZ5+M9nCJl/KAmsB70ZD4zNqFVHb6eOSQz3YWeTnuEsfiaa2qQml35aLKIWLPYnZqv7MJ6UhYzNNAl/iNxDAWtVcikLREhQx76OENJhIW05rpQUwleTbDIF08W1XjK35TgGTYGg+36nsUSOo/utqvhKvY1HKi3CUnNCf//852ypwMSdDc3nmUltOUPdaMRmDMG0ZbeJ0CguFpifW1/inMvoGJMGwb3J7ZB5JbOzT6SKDxcSsULLIBHLRdxdrQb32K+1qF5nGVcpfWNmzEumf4iD0WKztCdMK/IU8pw/N26Miwac4CBAhZstmQ4UmIdsouK8Ni501MCakDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPnytbVLNMZtSinX202w86hfBqCuS+JmTfUgM1yUgGA=;
 b=IvvVE0voEwsAwPh6R0CNS6A1x9gy4HY7IVcwUeDBJ6Kbk9HoModO2ycMl1P3zC3iXnlsSCBoDNs/UczduK9aYk9Jb5Bo4CB/QUuowPcptbLMQVoYjtEjODdtDil0+5W6ekpqHchfSd0qmdwe632WG4srJTTYJ9c9lZxeBn5KcenO707xVZ3oT1i+83QcCxA2q7e6QyzUAkyyLfbuxp8U243/zNyXm7hmGETzVO9sSLC2BdGa48QEVyNUi/LCesf1kPMjA4IHIJyS3xj70QjZRHARLxtAnfCKsxWbRKvCGcRDqwc0T3ijVvNKkQTvSVcj0oalWd+25pssV0lYW/weHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPnytbVLNMZtSinX202w86hfBqCuS+JmTfUgM1yUgGA=;
 b=fXUz5UgpglqJe+DYC9uQcIjPqihxWra2ug197FjTtt1TLw8ztDALDs1hjAa23ioO02YaruBoqNSsPkZ8/QQipMc8CacmfkHo5pHmSf0rerBFp8o/3gYVbrIuJ7uSfHOpqMwcbXQDywAGSHmxqjcKHKGI6UGMfiCAsVc08bahGQiBsWNVH4uJg3IuZ78qM9ISeCIyt9qbM5xk3sMmLLx19wHPySHzNu1/z7r+z6AqpbOFbCdEbwd+tobAR1Yis7UB50/hQrHb7Ci7UeBXwkiRb2DSpdTH4u+mFLEwGFIYhuPXVefd1yB31GGF3ZvG4Hw+oF/naOd5XA/AHRX21I7KaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:10 +0900
Subject: [PATCH RFC v3 2/7] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-2-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: f79c5bd3-bc96-426c-9db2-08dd67b4a94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0ZkTUZwTlh6aEVKNUpFdWNCR1M2TWVUbFdCWlZRQkFoSktMQW1rS3kvMUxx?=
 =?utf-8?B?ZDduK3htNUxDT2tLbFY4dzFGenBFZUduUUJMYjZkeDRublYzNGZlVk4ybDBz?=
 =?utf-8?B?N2ErN1V1VDhqMGdnUFZRVGUvUkRpMzZKMkkweUhERFlYVlcySkJJTTdzWVFQ?=
 =?utf-8?B?OHZGYW1YQzFBU3RhU0JTY2lrbGx0SU8rbHlFM2VYMW1KekZqVTU3NmZweU9x?=
 =?utf-8?B?QnNhV2tod2g0ai9UeGhHa3h4UjM4N3JJeG5yOUljcVhhOGVTUkZaNWtUNk9m?=
 =?utf-8?B?QlhHZk9Lc0xhelNZWWpjc0t6cEp1M1ZjVWlHMkp2bGo2YVJpYlZXWW11Vm9n?=
 =?utf-8?B?NEc1WGZmaE1DNkVHZVFxUERBRllhM1NDVlhyYWFEYVo3bWlwRFRRNk5Tb2F4?=
 =?utf-8?B?eWtyOWxJVTQ2RnlYWkJpV2I4TkJaVGF2NnU5M1RmeUx6UW5BR1dJbnRCWWFn?=
 =?utf-8?B?MWN5UFJVM0NtUlhMVlNwSGNCSjNDNVBnR3RYY0xhYkNPak9kYUlJL3N5OGh6?=
 =?utf-8?B?Z3dDaVZoeHM4em5PTysyWkdIcEZWc2wvQVN2bFhvNnVBTGkyTDRzS1FRNkZ2?=
 =?utf-8?B?RW1Hc21GVGpJVHdJcGpqSWovRWo5K2NiNGJVZGRkeVR4WnJhSnFEVWhvci8z?=
 =?utf-8?B?NkM2Vng4SHdwaFNvMlBEYmdvRHB0OWo0eHk0N1k5YWVIcnFSME1SQmovVDdu?=
 =?utf-8?B?UlVKSGRCbVNGL1JjVGZUVXJIL00vUmtEdHNLQ3FvQ2hDRTFYc1EzMFBHV3pV?=
 =?utf-8?B?eU5wRWw2WEhJbENpc1NBL3VjRjl1L3N1VXowbVBRZFVjMlJmakZ5VTBGeE5i?=
 =?utf-8?B?ZXJZVWV6Qjl4Ni9BcjhLcFNpSGJBSGpzcmQ4a2xMajhGYU1YTTA3S3RqelVL?=
 =?utf-8?B?MlZDMVNoTU1jd2plWWRyS0N0eHY5L1AzZy9neGVkRjFWRmx1ZStmTHUwOGtL?=
 =?utf-8?B?dVR4WVRwUEVLMUN3WG03YmFWQnV4MzZuV3ZPK3J6SjVkdFlNNkkxYnZkV1Jw?=
 =?utf-8?B?bUI0V05aekJ3MzJNOEw4eWNMdGRaeWlaWmlGUWhUdmpkd3FUVkU2eEhJSGpt?=
 =?utf-8?B?Zkx3QlZtWURCcmpOVHhvaWRnRk81U3puVFVSeWJFcEVWZEhRVElVWC9NQi9n?=
 =?utf-8?B?MFk3Y2ozbGxlc290VGlMSTFiazRKRkRXeDRDTkxIVVlhY3RYMllmaDJxVGpU?=
 =?utf-8?B?dnU1Z2dQR1pXWTFqa211QURQQk40MXM4Z1Zkc3ZTblZNNFQvVjcwTnNlYXJB?=
 =?utf-8?B?K2FGSCtydjNqL1U5c0FBVDlENGpLRjVTYW9vcjBnbllZR2lsOFNsajdGNHhP?=
 =?utf-8?B?dkFaQmwybWVrN0xxR2dhVlNMRnhNRTdxMWJHeksraGJmNUFrcmpsL1NKaFBR?=
 =?utf-8?B?cC91MC9JdDZ3WmM5NjhnRDBhRW9qMVJEWndFeDVkOU0wOUk2QnU5aC9GT0lj?=
 =?utf-8?B?K0lkQUc0aGVrMjMyWTIxcVVnZ2RaMzJpUDJpVGJ6VXZFRU5MS3h2by9rb3U3?=
 =?utf-8?B?aHVOMUw0Z1NyK21adU5CMzJSSFZzN3dkdDdaeHhpbU40b1ZWY2dpREs1bHJ3?=
 =?utf-8?B?eE9XOUZ2UDJJMGVJL1NtTTJ3cXc5Tlg5RkMwQlZaL2xtMkV3OW5uSzVIOFp1?=
 =?utf-8?B?UG1aVUpsd0dxQ2hGYTBLQ2RZeGI4T1pFNjdIdllvWEpSd2k2eG1WMEpEMWhD?=
 =?utf-8?B?SHBOMU0vcDhoTnBEeStSeW5uSTlTZ0owbmJmWWpyRENZZ29wckc2dWhkekY0?=
 =?utf-8?B?aVhWZ1RBV29BZDZWRlVaWFpkcWVhNGk0ZFlVdnpjY29veGFoTjJIZndWNVBB?=
 =?utf-8?B?QWhVU1l4RnB4RzVLME1UaTRTelJrTzcrMHZjQ29CanovaXQvZGxIcTFIUm81?=
 =?utf-8?B?cXJTZXdxMEdZK1BNbzN6OWFrL05LeTBnZnViRGNBK256cDZ0WTB4YkJxN3Uy?=
 =?utf-8?Q?GuJ0FmOb9M4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEd6OGpicmdoWkxYNThPMWlJVzh2Nk1CSnlEb1JKMzBBZ0VVSXlPeTN2dWg5?=
 =?utf-8?B?UUE0K003c0JEZ3BUd2x1SGljb1dxck5uWU11aEpsVWUyR3NzZEloQWgyWjA4?=
 =?utf-8?B?TDJmeEJSSDJia3hXankvZHpxenNFN1Bhb2RDUkwxVUJFU2h1bkRDOStFMzVY?=
 =?utf-8?B?SDJYWlVGMUZhU0JZWCtpSEFPQlNobnI0VmhDYU94cnZBNTd4czVudE5sYUkz?=
 =?utf-8?B?cW85QmRrMzVGYldCczhoRkMrN0ZaQjh2OFcwUXAxZk03OUFmV2ZMK2dKd1lE?=
 =?utf-8?B?SW92d1hxQ0dLSnFNMnRlSnkzNU1WSEJtek9UZi82ZjZFekhIY2d1bStvNHJR?=
 =?utf-8?B?OEFmQnJnSHN0bkZsSnJvWHY2c3BNQmU3amJJTHpKTjlmNGp6QjcwZTBTTHFw?=
 =?utf-8?B?b3MwbkowYTFwNzQ5VFhKZDhMcFBZSCtaRHdnZS85eGdjUmdTQU9iWDVKWWZp?=
 =?utf-8?B?endMOXRqd3VsNXBVTTAzVGtTOXg5VnJBalhza0ZJUy9rdDB6ZW1WL2VqblZw?=
 =?utf-8?B?dmc0YmYwTWhYa3p5Wm96K3FacStQTUpXNVdWVjI0SFhMWGpTTlhaOVJuMUVz?=
 =?utf-8?B?SFVuNkdvT0p1eEhSUFYzMlFVZTNCK2QyTnF6aWlpcnlydTJ5QUhPcUxrdTEy?=
 =?utf-8?B?S2xFYmo5cnZvZzNmS3pQV1ZkT2tsZ05hbHRMSW04eFc0elBjTjNmNjZucVlz?=
 =?utf-8?B?YUZkMHBXZGl1bm9tUEpYNGt6UjdyYnAyNkJPSTNOYVpHK3gxSUlUd2RMUlY0?=
 =?utf-8?B?c01BZFYvcUwyNmVNc1NXNnVLV2RjTWxFQVYydXRNSkd3QzkyUjVlUTYrblMr?=
 =?utf-8?B?U1YzeUJiOThVeTN2aDdmTDZRb21YYlkxSEdyZk9sbXFVVmZKOFdUdFJzWEZ1?=
 =?utf-8?B?d0Q3YkVoMEFGWFhUMytDZ0tZUzNPUUkxdWVJMk10VTdYemI1dFd4aTVIVU1G?=
 =?utf-8?B?K0Q0VDNXaVlsS2NBVFBVY3pIeTRGMCs4dUx4SEJ2VytRL1FDME52eFowbWtS?=
 =?utf-8?B?SFZTMkNRUEo5czdZZUgweG5odTIzTjBmK0JDalZrMUdKeWF1RXA2SWJ5SUpx?=
 =?utf-8?B?SDRXOVk0ZjVFanVnTXVaZXZZUnpEbW9wQUxqbUNZNTk3LzNoTVJhdDRYa0VW?=
 =?utf-8?B?dktOR0xqdTdWVTNOU1pWRmNFcXRFbEVTaWRaSUExSi9Edkl5Y2VOUEl6OFZF?=
 =?utf-8?B?aFF1aUxtSzlzd3dhZmpLR3pjalZ1Y2RFVkpsaFB2dzhEUnU3WUYxc1djVDR4?=
 =?utf-8?B?c0JzQ2tNdXRpc0ZZOVlEdWdQSEtCQmFkdTE3bjR0Tk94YW4rNGc2RVMzUnZI?=
 =?utf-8?B?RnNsYXNST2cwWE5jUDluYVhqOS9zOFZ6anNaR0ZjY2VmNEN2S0ZoZFVLY2tk?=
 =?utf-8?B?QjBsWmdnbmVlbjhwZGx1S0F3UzBLZW9wNklUSVFZL0tVSENQbytrTVhVUC9T?=
 =?utf-8?B?L0ZMQ1Z1R3ZTR1lEcXlNOTRHVEdHR29QNW1kdE9hcndJbndneHVZVmxtTHdZ?=
 =?utf-8?B?eEE5dnJDYnF0L0ZGd3V0T2NZRnZYc0toVEp0SDFvdW9mUUs2bmtub0MvU2dT?=
 =?utf-8?B?Um4wZXUyaW9kU2RDZDN3aTNXV2tIU29jT1pvZlFsajVUMVpLTUpXUksyVHNJ?=
 =?utf-8?B?bmdPcjA0YUJidXhmRCtCRHNFaU5oZUNVbHhTM2VIZm82UWVSTXRPMTVUdm0x?=
 =?utf-8?B?RmJOV0tjRHF4d25MTWY5VVFoL1JhN0NKU1RZZjJvcXZJU2QxamE3anFFWEhW?=
 =?utf-8?B?aWl3UHd2WFk0c0E2YVJlUFRCWEtJdWdmRFdGYnRNZlE3Mi9SQ0tiRnErVHZn?=
 =?utf-8?B?WXVWYmNsL2szSE1pQ3dQK2lud3lld3ZmQkJIVmtGMkJ4Qm9NQzRMOVdZUWtG?=
 =?utf-8?B?Qm55LzlqaVA3aXdQVlFuNGthU1FvbE9VS05WN3VyN3NETDg4WHJLaE9vWC9n?=
 =?utf-8?B?UnlFem0va3FDcllycktjNkliWVdWWGJKdXdQL1BoV2ZZTEV6bkd2aW4yT0pQ?=
 =?utf-8?B?U1dIay9kRG1kQS9WNnpPTkJVQk9PWktNT2xjZEJpZEc3MnE5WlUrVEVkeEFE?=
 =?utf-8?B?LzdicHIwWElvTFAzNmx5bWRmb3lpeTF4MlNueXdZVkVoK0tnNTFjNVJmYlZL?=
 =?utf-8?B?OFJabUxBSWx5QmkrYzI5cjAvQmRXaHJJanJzTGVyU3ZnbUdGNDd2WG5KVGJo?=
 =?utf-8?Q?4NczGu1sd7+1OnbDbE2IVWItJsgWm5Rx44GDxfU9Yj5J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79c5bd3-bc96-426c-9db2-08dd67b4a94e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:38.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP2kqRJl+9+ajDjGqGqlZWN2ChO/PMeO6IES+oPmtTuz97nC3FcsxoOxQyGggFmlwHtsaJATYQqBEt5a8EHb0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 1e510181432cceae46219f7ed3597a88b85ebe0a..475d14a4830774aa7717d3b5e70c7ff9de203dc2 100644
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
2.48.1

