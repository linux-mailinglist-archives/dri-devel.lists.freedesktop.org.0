Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A9AF12F7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A9910E6E6;
	Wed,  2 Jul 2025 11:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pkA6xdQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095C410E6E6;
 Wed,  2 Jul 2025 11:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsu1gR7Yv/i56vpO7hzMrWqknP+PEawnINEyCUrS/sRFjqPvuA/7HTZPokrAe8lA7kB/ONxnOERz1OJrS6LmXF5MbxSmDovFKowoYIu7dVlRnduvnRmQTgztBUZIySqfKBCG9lIsrLsSomCJojITZKBbuv6mrEvNRXq9acYXBaacfCZfAOqQxLfgFDr8CcOSYCVJbl9DSHgB/Xy5qUUnjnma6xkDuvvDPd9E6Th8u/O7iaBC8QJOMsFElrGSPySiM9NXb72uuygH6ZD4ozjrPzY11jMEN6dRqfQVtYoNmX2GDq1IFPwFlTWKtmSxMLJYebOpmmWi7YNJmo6B/KiMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkcdMcNzHMS24aSB3BFfgM78O5dy2fIK7DcrLV5wzFo=;
 b=G1HR1tB//xVcg17mvYstbGVcWR7eveFc2UYkrXLEv73YKY7bS5JNqIiABJK+/tzCdqvbOTGO/dFJ+ZUPFw2cv3cGPFFVgDO6BOsY8TJ+4vQfdBU2Ak1RsQc7e2t7W7A+dAAnQG2GVVxO34wvcD8zxaDmEikRXCzErEYNK6t5vDShqqDirN+NlsbnjRjbH8W4W/aOEZLaqchHLYUMt41/PzuhAookWtcQPrcEHh88+yymsfkxJ9qr0dB1/5F6lHjA7CwPpq4LGAtNb1it3fWPFiF0jcgFCRGYw7dyav5HMPoDtvJqwzEG0VbsI950XgXYUq2V0uXV+HSMu2vvqsAG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkcdMcNzHMS24aSB3BFfgM78O5dy2fIK7DcrLV5wzFo=;
 b=pkA6xdQ3Vkkbo7ob/XTYSBxE/DKkKo44faEGCNjuhoAY0NyRHdb2In9tvoi6/DIjWlBcBUUGSSuUIwmDTmp3dNJHWpf1W1nVbNpd7cxmU8sl8KPfzYzVGZiPmDmDZqAeFNcCZatWXoQ2SHJNkmNIP7P4FN4fRDIsLWcp5EJ/Or7pcaDVV+Y/NZ09dIyYayM3fGOuY4AWw/7mJ3ioyaKu9WAs68EYU+fMcxjI/UGSIY49qvS7T3eR6ctXcxwcgCS0gRsOBAqp2ZMUBYhQN3I32o/YsY1/KRcLFucVF09QFRGErkQs8zuqteAftwN5NyXg1nPUeo1llIseDs8tyOLu9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:40 +0900
Subject: [PATCH v3 3/7] gpu: nova-core: Clarify falcon code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-3-f362260813e2@nvidia.com>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b4a728-f6e9-4104-221d-08ddb957bee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVdFSHk2ZGh3UnRYTFVEM0VzMG5FRENXdHFveXZZVkRmWUFIUlovOVNSMXJB?=
 =?utf-8?B?T0tCQ0lUWkk2Ynh6eWRIZytHZHIwc0g3QWtuVFo3R05VWGJzUVcvSERjY2Iv?=
 =?utf-8?B?OFN2M2xrMk54VHdZV3pBNGJOUXZBSGJwOGlWRldDbUNIR2pTV2VLSldvbDV3?=
 =?utf-8?B?S0hEK0o4N3Nrd2l0d0lxaWJKK21QSWs3R3dENE5IcXJLUW91MnJYaUNrY09p?=
 =?utf-8?B?UUw1NVdURlYxN0pQWjFYMkxtWnNhNnNoU3VqZU1XblFXU2lqWkFUTXRMSnBs?=
 =?utf-8?B?RGhtNHdLOThyN0NZaFhydStGbDV3ZXpkVmU1TXJWTTVVV2plWml2WkVUOVQv?=
 =?utf-8?B?Ly8wU1ZlaTU5cVhyclBkdkp5eUZyTjlxVGhQclVkUjNqRW1XQndkNzBmdkJI?=
 =?utf-8?B?VUlxakJOdzNrejhtTDcrMGJkdENSRXdTUFFHaTBVY2E1NFZnNVpBVFh6NEFk?=
 =?utf-8?B?S0NTWWlNY1k1YTNLV2lNenF2RUVNZTZ1eVFMUjIxT3RaWkVpWDU3dmJXWkdC?=
 =?utf-8?B?NjA4OWxWeXNFTmlLUE9tU0VWQXQ2a3FmUVZWajFjY3VjWHg2TlhhbzB2a0xC?=
 =?utf-8?B?K0Q1a0xjNjFub053M3Z4bmFIYlFWalJXSUdJa3pYUExNeVkxUlpXcHdlemhs?=
 =?utf-8?B?NDlVcnkwS0NheU1hSi9CVENkZmI2Qy9veE1BZC9BZ09sWmhvRkZMTVRmUjRB?=
 =?utf-8?B?ajFmOFVRZzdJWXVYQ1B6M0ZOY1MwMFVpWm5ZeDkxZjlPOHdMWmhqUWt4RnJ5?=
 =?utf-8?B?K1ErQ0RnZkNJRmJ6OVFldG41VnN4bTFJcEJJbGZyZDBGSkcrMGR4K1JwSE5w?=
 =?utf-8?B?YnkyM2lGOXhHdkFoMFVVY0xvZEd3TS93cWd5T0xodnQzQUFmckdGV1pNMmM0?=
 =?utf-8?B?QlAzeW1Vb0VNeEpKSmJpT1F3Sm9QbVlxYjVydktWOFRZd2pSZjQ5dk51aU1S?=
 =?utf-8?B?WlFjbnR5RllOQ21ZZVN6bjR3MHVxM3dYZ0g0SnhOYkFLYTlJTEE1cERSUktX?=
 =?utf-8?B?OWdIR2JkREorSjRhYzZ2RGx1cktsNndUeFJpc1IzMGdxMTNLM2phcGxzeDZV?=
 =?utf-8?B?Rml6MWVSdE05Q045M0tYUlRNOXpFWVJFb0FRVnJnKzJYQXJKNFVXc3NZTWJK?=
 =?utf-8?B?WHFBNkFoZzBqZ0dFQS9pSVBCZ2lMWSs5RWd4c0l5UXZFaG9UV3ZOZEZKWWM2?=
 =?utf-8?B?QW9OQVBwR3Z3eXVKRDhnOXFmWkFieGRXYXByZ0p6TVBJbUpsT3hxdVFYeDdO?=
 =?utf-8?B?am9pRkE4ay9SVTdYWkI4SWxtdndlTnhsOUZQTWsvempTZmkwUFduVEpqbFJW?=
 =?utf-8?B?UGtlK3dIamZqNXN4Z2pHK2o1SDZ4NFNxV1hLU0twVC9kWWdKek5SQmYwWmRC?=
 =?utf-8?B?OFZlc0h3dDNtYklZblZDZ0N6Z2NqMDR1ejlEaGhLMUdvcWRPeHZCSHNuY1hv?=
 =?utf-8?B?WEJuWDBsM0tqQnZCWFkxelBvU1RCUkVmbEFIbjQ3UXFUM2dEWW1LN0w5cVd1?=
 =?utf-8?B?dmlKQUhDM1dCMlBWckVOTkVRakNJYjhFRlM2d1NPdENvVXFzWHdaQXUzcnVw?=
 =?utf-8?B?Zkg2cSsxSHhyUXAxZE1wbFFjVkc4aWpHZ0xGSzZwZHF4MnV0VEhFYXZETGdZ?=
 =?utf-8?B?aEszcVZWZTZHN2JUM0VzNGcrc25jYS9JWlY2OU43MlVNZEI5TktpcThIc2Nv?=
 =?utf-8?B?aDZRZkZKSjV4amZmOXh3Tm1PbnNzcWNOMmxjWFNUdjF5ZUxhS0FlQXJ4cEFq?=
 =?utf-8?B?RXB4VXZ4YVNUeFRocnN2YlVxR1kwUVBLNHJxZEcxV0FUbjQxY2lGbjlhbFp1?=
 =?utf-8?B?ZUZqS0luRkc4dnhMQ1d3b1h0bzMzKzNYcTVKK2RubmEwK3pnUDNNVnFJM2I5?=
 =?utf-8?B?eWZTQlltSm1FMVlteFFZaUVsNGsxSWg0bnJRYUk0UVpWcFg5TVFjMVRaT0s5?=
 =?utf-8?Q?KvG4ffVxESs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZmbmpBcDZtYjV0UkxFWS9JampSK3lnalNZUVRNQlVwb3dtN1d5OXdaK1JN?=
 =?utf-8?B?b0hFWjg1b3VKRFJKZ2w1R0l1Y1d2c25hTjlVcm1SczgzZGEzV2ZkR1ZwcUNY?=
 =?utf-8?B?NHl0a2ZrZTVCRTJidmdGck4xcTVBK0tDa2dMczI5MmxESzh6MmZub0VqQ3pC?=
 =?utf-8?B?VVRlY1RxYkpRVmpHbWZUTTExR2RkczE1dlc1aHZXeXdxWUhXdFpvcFVpK2JT?=
 =?utf-8?B?U3RXcTdvWUpEM0FKazNmcE4yK1pBZjIxK242MnJWdGljbDF6MHR6ejF5TCti?=
 =?utf-8?B?MGx2VXRtYlc1RFlCZGZ6Nm1lWWV0cGhNczA1bW03eTJxcjZXRnI0TFl0TDVp?=
 =?utf-8?B?SGlORVg5UHIrQ0dFcGh5U3JDV09pNzN1d0lrREJHQmhvTU9NcXRPRnp0M2RU?=
 =?utf-8?B?Wk8xL3JHc1p0RHFGektvdGh6aWdEQm51ZVluaXlYa2VoNGkwS0EyTzFtSXBN?=
 =?utf-8?B?Ni91NmVjUUIvdEt3UXRZdU9HdjBzYmltaHFRMXIzalJmRHZPWTBWT0JhQTRG?=
 =?utf-8?B?bkEwbXBtcnVYTHV4eWJ5eWpuUkNaV2xUdFhIRGF3c0FTNkp2UnViT2E3S1Bp?=
 =?utf-8?B?UUQ3Sk9zZXg0aHE4ZVBaWXRnVXN0N1ErRXg3Zk4ySWFqejF4bmJvN2RaOUdR?=
 =?utf-8?B?dU4vTzU5dlNpWlNPZlFlUnd5NkxxZnlRaVZuMmg5MVJWMlBXbmxDekR3SEY0?=
 =?utf-8?B?NGJzZThNVmxTY1dGRlBqMzY5N0RuR3N4dlRHQUFOY2JVZlFVdkNVTnFpNFYx?=
 =?utf-8?B?dTYvM2w2emZRMHdFOERYVXdRZzRyU2R5VlFGWitmQVNUQ2lDb2Y1MTBwNldW?=
 =?utf-8?B?MUM5OHpXd0pJdW9wcFJVRUFrYkpPRnZ4SU5VaWJPUjM5TXBoNnkrcTZDZS82?=
 =?utf-8?B?azhZWlk5RE4vVVdGZ2FNaDRhdTJHTWY4UlArNUt0RzE2eGRuNDJtc2NFa0ZK?=
 =?utf-8?B?MXZuS003SzhaaUpHQlBQZkZRR0YzSUZzVTBLZ2syTW9oc0VLYXlzSDdjdXVJ?=
 =?utf-8?B?U2ROUmMra2lZbElqR05HNmFvVWFNcDJtckNyOTdiZW9teTJNZzNmVVBvMmxM?=
 =?utf-8?B?SUlZejVqMnVGTjY3ZWdrV3pEc3RacG1Ua0dMMXc3OCtiWjM0dFI0WkhiZE1J?=
 =?utf-8?B?NkVzUjl1UmpqdCs2eUdGNUZnalc4ajVMOEFhS0pCUC8rK3dibkFEbzhrTUV3?=
 =?utf-8?B?VVBUM0g4UU9VT3c4Vk8rQVRmSHVWS1Z4TUtJNlA5cTkrNTc3ckdGT1pwakpl?=
 =?utf-8?B?ZEZmdUNudnJYZkxyclhITmNKc2RIelVYQW1jZ3gvMzVTRXpDZlhOTTN6cThG?=
 =?utf-8?B?QmVRNy91bFdxTnd3bUhXa3huM1J6Si9scytHQjJFci9rYkRQUFNmZVBQc0ZB?=
 =?utf-8?B?b29LUGpTd25CTFVLcDdpcEdGQ0hxVEE3VUYvZWVrVHZlOXJLb0pxN2xnK0Nr?=
 =?utf-8?B?K1o3ZXNhU0JyNGJ5TWplMVVqaCtQMHpraFdoKzZCMDZDZTZuaUx6QTY4RXR4?=
 =?utf-8?B?c2ZpaDhYeDQ5RW9GMERiUFNGSXoxMXNHc0VmT2dYNmZFWWRFZDEycmdQdSs2?=
 =?utf-8?B?VFoyRVNUdXNvVUpwcTNySzEyaUJjY0pWTUxNTXFqSkE3R2sxN1RoRDdpd3RG?=
 =?utf-8?B?Y0t2NVpWS2Jhd0YxMGpxVjFrQUN0UEpJRTJUQTBVS2E2RUpmS3pSTjRnWjZy?=
 =?utf-8?B?R2JqQ08rVm5nRlo0M21aa0gwSXFMY2ZDR0lCbWxQaGR4QWltZWtaSFV1Tmpr?=
 =?utf-8?B?Q3U3elI5dDRnYmY4Q0hYRHdXM2VPNzhGSVVPUVlZc3AxVDFRbm1Hb0tRRjcz?=
 =?utf-8?B?Z3graGhVTXpEL2JnK0h1VDlaN3YvaGNSbnZ0RTlWV3Nvam9mdGpOcDN5dHNJ?=
 =?utf-8?B?dE9UQ1VCSnZyb2wrSjlBRW1idUJzZEtrNCs3bTBJcVN3Mlp4S3lvLzI4Q2Rp?=
 =?utf-8?B?bEZuUW85ZlBLVWczZ3JrRUg1ZnI4RjlIdmVBR2txVG0vRmluQThaTFlITHdu?=
 =?utf-8?B?M2JZbWZhMGo3YTZUU0lYQVFpREtONVpRMmg5NHUrTUI1Y0lmZERpVmQxQ0xJ?=
 =?utf-8?B?SlVVQ2l0bGlhcEdoOUI0akxaUzNhNyswbnlQWEp1YS8vRUlwZXZEVHV2emJE?=
 =?utf-8?B?TEJOUTdIUy9ERGxaRkZ0WVBWdzM2TVBHRE9qU2xvRlpHV3FqR1RIMzNoc1hO?=
 =?utf-8?Q?OGdiz6kJrQaEMaBmBEG7nG5pgf2wkHozLENX9JtTqSKj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b4a728-f6e9-4104-221d-08ddb957bee5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:07.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWmqBluMDUxiqNuo8SJ+fcKmutdBkrwIue0ejN3TuTUw1VCYhVqidzUHG97P4vIVx7QhCVO8v/rSkkOt69yBLw==
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add documentation strings, comments and AES mode for completeness
to the Falcon signatures.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c2c6f9eb380ab390befe5af1b3c5df260ccd7595..6ded4a37a08deb71db668f389efad84ff17b317b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -105,14 +105,22 @@ fn try_from(value: u8) -> Result<Self> {
 /// register.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone)]
+/// Security mode of the Falcon microprocessor.
+/// See falcon.rst for more details.
 pub(crate) enum FalconSecurityModel {
     /// Non-Secure: runs unsigned code without privileges.
     #[default]
     None = 0,
-    /// Low-Secure: runs code with some privileges. Can only be entered from `Heavy` mode, which
-    /// will typically validate the LS code through some signature.
+    /// Light-Secured (LS): Runs signed code with some privileges.
+    /// Entry into this mode is only possible from 'Heavy-secure' mode, which verifies the code's
+    /// signature.
+    ///
+    /// Also known as Low-Secure, Privilege Level 2 or PL2.
     Light = 2,
-    /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
+    /// Heavy-Secured (HS): Runs signed code with full privileges.
+    /// The code's signature is verified by the Falcon Boot ROM (BROM).
+    ///
+    /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
 impl_from_enum_to_u32!(FalconSecurityModel);
@@ -136,10 +144,13 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
-/// register.
+/// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
 #[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
+    /// AES.
+    #[expect(dead_code)]
+    Aes = 0,
     /// RSA3K.
     #[default]
     Rsa3k = 1,
@@ -209,15 +220,18 @@ pub(crate) enum FalconMem {
     Dmem,
 }
 
-/// Target/source of a DMA transfer to/from falcon memory.
+/// Defines the Framebuffer Interface (FBIF) aperture type.
+/// This determines the memory type for external memory access during a DMA transfer, which is
+/// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
 #[derive(Debug, Clone, Default)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
+    /// Local Framebuffer (GPU's VRAM memory)
     LocalFb = 0,
-    /// Coherent system memory.
+    /// Coherent system memory (System DRAM).
     CoherentSysmem = 1,
-    /// Non-coherent system memory.
+    /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
 impl_from_enum_to_u32!(FalconFbifTarget);
@@ -571,3 +585,4 @@ pub(crate) fn signature_reg_fuse_version(
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
 }
+

-- 
2.50.0

