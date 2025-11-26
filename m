Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFABC87AAD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781510E4DF;
	Wed, 26 Nov 2025 01:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Al/qvsEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45FC10E4DF;
 Wed, 26 Nov 2025 01:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW9Mq1BbHNTgBh2qHxdfutT7M0EV7RWN/yR6BwV//HU8Q56aKPUXGgaXXrIBlptUluCCllnn2f2agchx7770zi01j2b8adOWSuU+Ty4hS/2mtOni31xoexZN6GZpH45FJgy7RgJRZxF8ADGuR4rSj0OmojGjvq9ZMuilkusrXaFZJrL1r1vADPmq8dDjBoAaMueaBsQyIqostHnlChwT8OVOlF22v1GKCzjGJ1BTa0+XwjpgNVrx2/Un/JNVwQxS+N3wQeyIXt4lAV+Bp9FhgM7zmQPcIJiIlAbZn2dpAUdDnA+nst4CvArHAV0QGirOfTgc1pQ+ghWV6EIhJnDvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pK6PeltXCdw880ulV7nnnz4ONPE6kDa8b06c/Wf7YqE=;
 b=U1hmACKnSTJZdbEMhQl8I2qXqpC7LkymA48PMofEcV12vpCphrq6LZD+qvHDPjk3xWHVo4vu4YtD7wK8NzfIawkZOrntJEHaAXf0MeL4vyJtKVQjqCDUaKZGNFf04QPf9qLNToB/szvz5i1VEGQtBiwlANNUX915QWUYVxdgPwWWos0zC/HHMlmj6GB0Z0xN9Zit9ktsX0+tBAubv4VSVK6kBPQBH/EmnJ8HjDkURIXckK45DWIt48Cj8QpGcOcWmdPJqt34elFXNNS7rZePBZCuD07CppKbZ1M7CUFnRbG9zDkd57Io2Mo5IYaeUwojFxLoQEaMOFDbwk3CCaWLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pK6PeltXCdw880ulV7nnnz4ONPE6kDa8b06c/Wf7YqE=;
 b=Al/qvsEIuiFnY5aS59asDTNfHMAyFwswLUu5ckF0oDCHJhhWtlGb6eIZZ5VT2KQ3gHUEvSz+eOOINLcznXIuJg2HeKWUo/ncJVhOe7le6US25pCCg1pDLHJfKZG5+iWg1vXyfl5vKos2/qp7LLshK6NYU44l/5gFFJY8mZVqxQa6vPdBkUO03Mn8rDxwzr+ZrLVADgzwn5ZliFpYAuLZO0DgwpU+Xm3Nn2RHmMCJxibtGrgGzdOD5rLKaXqv+ct5N4eA8YLBf0Y4EXqu3+zKGl+4/Yh/urO6JqgBmnyfVHrZVx9BeJNEHNsrC9L2DEKQGkMIJzkkadBFuLUMbIsMgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 01:16:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:16:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 10:16:30 +0900
Message-Id: <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "Alistair Popple" <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, "Andrea
 Righi" <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked
 list operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
In-Reply-To: <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: b73bd361-6b4a-40ec-5842-08de2c897049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFRWZXVJbUpyOFhxMGhGanp2WW5zemYvOGkzVTZMUUUxbjVpRlRHeGMwcHU4?=
 =?utf-8?B?VXAwdWQvVkRLTlpiVitsYmNvTUxzTVlhU1lDa3hld21WYkJ1YTFxTWt4R0Ft?=
 =?utf-8?B?eFhlbVAwRGdPbkxKRldHZjdRbmV2bHh6TndaSEh0WUNZWUxmYkZvb09OMTFB?=
 =?utf-8?B?VzBZSUR1RFdzUmJXZWlTM1VjNHVReWdxay9xK0cxZmFLbEhKTE1EYXlEbmp3?=
 =?utf-8?B?QkV0a1NjaTllM0VIY2cwaHN1UzFPMnRON3ViVklQRDkrdkUyY01WdkQ3eGdL?=
 =?utf-8?B?cVBtTHpjVkNUaGx3amd6N0tkN1J2MlRTaU11Z29NYjY4OTA2RktLY2dLdEVI?=
 =?utf-8?B?c0NUV3FsaDJOdFdUZmVCUzlSUkJGR21zS3ZqM01vbzVEbXB3MGc0YmJyVnRy?=
 =?utf-8?B?NnN0eTZyU3NWTXdlS09SdFpheFFQUk5wSHlWWGVYU3MrNlcwcmVWM3lvZkxo?=
 =?utf-8?B?cU4vVVV6MGFEWlhqYWg2V2xJN1ZWc1FHVmNadDk5aUNad2R1K2liUVVxSEhq?=
 =?utf-8?B?L3BYV2NLTGQzNjc5K2RDUEcrRm5iMlIycTZXNGhjTTJLWlEzT3lyU3Y0aWlv?=
 =?utf-8?B?V05tVCtvSk5iWEQ1ZHhtSUJqVVFnVWhoNk50SXo5YjNnMHhDSWU2MmQxQmVN?=
 =?utf-8?B?bzF5eTQ0OVUzWWN0aFZIa0R3WVVSYUZaTWRtcGhidzlFTElTZVgwM2ZOTkox?=
 =?utf-8?B?ZCtNZWhiRWNDRHZ4V0wwTEZmZEtnallIdWJrdTlsMEdINW1QV25NRWt1dkU3?=
 =?utf-8?B?L3Z5RHMzRjRjUHVkaGxENmVKV3l0MGlzVURhckxXbC8zM2l1K3FibDhtcnBP?=
 =?utf-8?B?NFJ0d2N5S1VrOE1RdUhDVHBQaG0xOHZjdGJMNGRVcjU4QXVsMjkzakEwMWZE?=
 =?utf-8?B?bmZNUGpoSzMrcG4vRXRZcmxWYlB5SlpOa2xqWVdxaEtRUXY1VS90Y2tZdFN1?=
 =?utf-8?B?VFNIY3YrUzUycVpjRExkRndqdW9PMXJDMnRNQ2ttTlpGN2hVM2toaXFMVXNw?=
 =?utf-8?B?U2x2ZjlNZStBN3VEOFgxM0Jqck5rcS9aTkNPQ1FpcGduYjV6SG9oWmFBNXc5?=
 =?utf-8?B?dEJLOVJmUDd0N3NCRWQ1eU1Cb0VUWHppR05SUXRaQjNNclpyUnFaMGVqUURu?=
 =?utf-8?B?UUsyNHF4WmxJZHFRSnVmQmFiSFNoR1BSeFl4cDJCUkZJb2o0MUg1eW1aeDF2?=
 =?utf-8?B?RDhxVjFOcTFhRmJzcFo0dXFFYUYvWlZmeW5qVWFlN1BETDFOVGdSZm4zdXEr?=
 =?utf-8?B?UU54eGtLR3NRTW9ZWWdHbEp1bndwVWgwNGNUVk5EWmVIY1E2QXVJYVFLV0d1?=
 =?utf-8?B?SWFCNXFHQkNJTVFZaGQzQ09QQURkRUNuS0hIbkRHZllxVjlhMU1XRHkxK2xz?=
 =?utf-8?B?SFozazRGUDdWUUEyVDRRbERFNFAvM0RIcFlFeE9HQkM4RytXYUFDLzF0MndD?=
 =?utf-8?B?ZVJUVTd4TGZ3Q0VnSzNWbG5MN0NxVWZMc0lHQStBNmNmalNtaW1vNU1UcHR4?=
 =?utf-8?B?WktvTS93QWNBekdHbTVLQkhDeU1iRVEzcldhTS9vRmkzTXMva0tJOU9PdVhu?=
 =?utf-8?B?RGVnR1VXbmI5ZFYvZFpRd1htd1JHd0lOaE1ZQ0lvL1JKMHlwRXBvQlkxYi82?=
 =?utf-8?B?TE1LVUNpUTZldWVvVlk3MmlUVlpJbFFsSEVBUzU4TG0yNHJod05oWEpwaEg4?=
 =?utf-8?B?cEIxNDF0WDF4bEVqeHIwTnJVd09KSlRGWDhEejR4ZXVsM0Q1dHJCeTRPaVds?=
 =?utf-8?B?T2xUVnRoM2xXbXZYS2kvVjArdVFObzNtYzZHOEZVSnAvWHAybGl5SFdubmNn?=
 =?utf-8?B?WEhDd0QrdDlmalZsVnpqUXFxdHZmZVBxSWVuYklLa0FjYldCc3ZNTzJLbnpT?=
 =?utf-8?B?VmRJQUROdi9UeERONGJOdVdvK25LNkpFZHMzNzZYSXlQV0NlNi80WkQ5TGlt?=
 =?utf-8?Q?Tdqbj0AAjFCF+pBqHaN9oTL4Q0KBCKzb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2M0Z1hUNEVzVmJEeXB3bVJramd6eFpRTUV2bklLTU0rVEJjaThvSFZPZ3RR?=
 =?utf-8?B?UmlBVnYvMFJlVEF1UFJKb3l0K25JTGdrUG5nRFM1TkR3UEFmQ0dkODFXTjFC?=
 =?utf-8?B?SStlT2orTkcvZnpNQ2lSZlZENGNuMTQ1VkhBUnNueVo1b1ZXclA1ZGVtTElv?=
 =?utf-8?B?cjl0M0tSMGFIQU9jQUNXcGFCYklUQnlyeWJEY1RxNDlJT003V0xWYVNpY2Yw?=
 =?utf-8?B?MzdtVDFLM1QzU0NXSWQwSnI4c2pYZHR0Nm41Q1M1enlQSVNiTm1NZVp3SVF2?=
 =?utf-8?B?cFJlSWlOY2VuWWw0Tzkvdk1tWnFxWlZjYktERGJNVVd5T1JnMEg1K2wvS2lO?=
 =?utf-8?B?Q1paOXVZb21PclJGSzQrSkRrNUkxeEYzWjdpOGZUbk52enhPK2tWNlIzVDlH?=
 =?utf-8?B?dWRmWmRlbVl5UmRXWnVyTXdwWitsWDN0cFlKU25ENUZPeDRlTzJueEljRE0r?=
 =?utf-8?B?cVY5NW1kQmY0Zi9QQU1UZll4MEE1dkdURmNYSVFkSEM1d2U3OENYajJ0SW9r?=
 =?utf-8?B?OU5oaVlhS1p4Z3JZSjUwUGlMU3RBcXBoNFhxc09MZWZKd05sdUFIOWZvUHhJ?=
 =?utf-8?B?Sjd4WjRyVURZT1RtYkx3RERNdWkwZ1ZhK1licE94bU8rckhnUzFBaUlJQ1Vl?=
 =?utf-8?B?bVJnZXJCS3N1NFBydWcyQ0VqS3hyY1E5NG5hM1NQa0NqSnRVZnZDZGxQMm16?=
 =?utf-8?B?QlppWmV6UUZ0VnVISVVRSnZRRytaZSs0YkFORWs0MEdWYlF6eklmSFZ3VFZl?=
 =?utf-8?B?Zm16WTdLVlBPeHR5Q0Vyb2NhdEZXbThqdy9XUmM2RG5BTmVwRHVIRVYzak5W?=
 =?utf-8?B?ZWNNeDVicURjc0EvSk1YWGZBdmMyaUNtQlowazFQUHlGQk9HejNjVGVXa2dM?=
 =?utf-8?B?YmthRFVFUlBDM2FlbUlOUjNMVjA3b2pSR0M3Vkgwa2g1S0F0MmxmZkhOWjN5?=
 =?utf-8?B?SjFwakhNTzlHQStuaEJGYzd0VjBnSDIxSVNxRFE5cVd1cVdoMGZyUTRlSDFQ?=
 =?utf-8?B?djE2Q2RyS1dtZDNZNFBLc3FXOWVsdlM0RkJVWS83RXNiL0laL014VjVtOFE2?=
 =?utf-8?B?Ung1cUNEWHRNWW53bkRnRFNXWjZ4YUxFSy9DTVp1cDloQVVEZ3JrWCtMTHli?=
 =?utf-8?B?b3d6a25PSzhDNXVROTJDeEkvZjg3MVYyZUZTK1g2SVA3UE95Z3h0RUsveGZS?=
 =?utf-8?B?ZlVxZ3lTTDA1WktGL3JXc3hlcEhNNHdyNDk0RVo4NU1rVkxuSVVxNlNKK0Fo?=
 =?utf-8?B?UmpNZldEekpKL2xiRmtTN3NKNlhTL1dZaGR0a0s1SGFSWVIyUEdiRVZXSDhw?=
 =?utf-8?B?YWZwZUJKR2UxS01QSE53RDVuRG9qRUVtOEtFQUs3M1hsNnBWZFYzekJRWXBp?=
 =?utf-8?B?NjhrelY3RU9senVRYUttUGQwYzFwR2tZY3duVWp0WlJXemN2aGIwTUVDa3Rl?=
 =?utf-8?B?blNRMUVaWlRrTysvR1pVNHdtVFo0VHJMajFMYUdEWlREeGsyZ2MyMUx1Mlo3?=
 =?utf-8?B?SFlGd3lwV3NXSmI5RmJJUnMzUEZMc3FLNVArcWtEUEplMGdFV3JYenpLODZZ?=
 =?utf-8?B?V0d4UUtPMjhPODNwZm9seEM4WXVSUXdDU1dyYTNRZnB4RWRtV0tlVWNFUkZn?=
 =?utf-8?B?TkZ1Yys2Z09MMDY3UlYyd0E3cWtFZnFaR1gzb1pPVW9HN1h4c0JIeTBXYlIz?=
 =?utf-8?B?YlQzejRILzBFbDYySlQzNUNkd1c1Q05PZGxUVGFBSExZVnk4ekttemJENjlM?=
 =?utf-8?B?NVpzWGp0SmR1YlM4cGVnL25LQXowRk90QVltTnFQVXBhdUE1eExKQ2w5Vmps?=
 =?utf-8?B?QXc5OEN1RXNEU0l0dEpSZW9ZTzJCRlJaZUMvdXcwVEF6VE04OVBJeVN6L2o5?=
 =?utf-8?B?WWxjNjlWUnlYNUxzaVYwYjF1ellWcVJBNERURGhyVGZHbTZZWWM0VW9zS1Vu?=
 =?utf-8?B?bkdQNXpBVlBqUy9TOGs3NlNkTzZQQk45aG5Jc2pHSGg0ZWFVS2s5Tjd6QmQ2?=
 =?utf-8?B?MWlzWXNkS1RQOW03dVpGSm84dkxFKzJ0d2RCMUZtVFd5Vk8vVGgrLzdNVzVn?=
 =?utf-8?B?SDZsWHlVRmVCdTg0aVdYdWx6UGFVS0dHQXIxM3BoTGFrZDFiTVE2WXRWR1or?=
 =?utf-8?B?ZzBiRnA3SjNDZ1pPeFNzRXJOSTdqYlU4cVBRWlBhSnFSNFc0aUxwYkFld0R4?=
 =?utf-8?Q?hrvXH/AHzBxSdT/GOeFYfsHxQCMz7bhWtGwRVfQqR4u6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73bd361-6b4a-40ec-5842-08de2c897049
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:16:34.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhdVy3iBe3CSgD0ZaHNj1voEJcHb8c2vZ/u4XSyofSC/IQbEtryNNOqLk6OUIPD4gRlD4giQi1HJFPdcmxBQEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
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

On Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>
>
>> On Nov 25, 2025, at 9:52=E2=80=AFAM, Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>>=20
>> =EF=BB=BFOn Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
>>> Add Rust helper functions for common C linked list operations
>>> that are implemented as macros or inline functions and thus not
>>> directly accessible from Rust.
>>>=20
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> ---
>>> rust/helpers/helpers.c |  1 +
>>> rust/helpers/list.c    | 32 ++++++++++++++++++++++++++++++++
>>> 2 files changed, 33 insertions(+)
>>> create mode 100644 rust/helpers/list.c
>>>=20
>>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>>> index 79c72762ad9c..634fa2386bbb 100644
>>> --- a/rust/helpers/helpers.c
>>> +++ b/rust/helpers/helpers.c
>>> @@ -32,6 +32,7 @@
>>> #include "io.c"
>>> #include "jump_label.c"
>>> #include "kunit.c"
>>> +#include "list.c"
>>> #include "maple_tree.c"
>>> #include "mm.c"
>>> #include "mutex.c"
>>> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
>>> new file mode 100644
>>> index 000000000000..fea2a18621da
>>> --- /dev/null
>>> +++ b/rust/helpers/list.c
>>> @@ -0,0 +1,32 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +/*
>>> + * Helpers for C Circular doubly linked list implementation.
>>> + */
>>> +
>>> +#include <linux/list.h>
>>> +
>>> +bool rust_helper_list_empty(const struct list_head *head)
>>> +{
>>> +    return list_empty(head);
>>> +}
>>> +
>>> +void rust_helper_list_del(struct list_head *entry)
>>> +{
>>> +    list_del(entry);
>>> +}
>>> +
>>> +void rust_helper_INIT_LIST_HEAD(struct list_head *list)
>>> +{
>>> +    INIT_LIST_HEAD(list);
>>> +}
>>> +
>>> +void rust_helper_list_add(struct list_head *new, struct list_head *hea=
d)
>>> +{
>>> +    list_add(new, head);
>>> +}
>>> +
>>> +void rust_helper_list_add_tail(struct list_head *new, struct list_head=
 *head)
>>> +{
>>> +    list_add_tail(new, head);
>>> +}
>>=20
>> Just noticed, but of these helpers only `INIT_LIST_HEAD` and
>> `list_add_tail` seem to be used (in doccomments).
>
> Correct, but it makes sense to add the most obvious/common ones (also to =
make it clear that using these are supported).

"It makes sense" is subjective, and in this case I am confident it is
not the right intuition to add dead code just for the sake of it.

Each of these helpers adds a potential breakage point from the C API
should the latter change, so we should only add them if they are indeed
necessary.

Actually, some of these helpers are not used when they could have been -
you have a `is_empty` method that rewrites the C function instead of
calling the helper. The only helpers that are unjustified as of now as
`list_add` and `list_del`, and these are easy to add when they become
necessary.

But this raises an interesting dilemma: these helpers cannot be inlined
and add the overhead of a function call. On the other hand, the
definition of `list_head` is so excessively simple that manipulating it
directly is virtually as intuitive as invoking the helper - and doesn't
bear the overhead. So should we double-down on these helpers, or just
drop them completely and re-implement the list functionality we need for
increased performance?
