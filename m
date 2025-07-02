Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08FAF1301
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0310E6E4;
	Wed,  2 Jul 2025 11:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P0maPlKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF3E10E6ED;
 Wed,  2 Jul 2025 11:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abf7QYZoYJj2BuYNyHWCmPHBfnCtbLkfvkHQ6TmZGcaNTxzUOgaNcDCP8R10Ai6zZkfWUNDXRM6waUNTCjwtoyRVrstCl67mgBeUWu1BbLVHIgOpUjEOB6/rLWSfDS7XcCOwTsbApehGNaIWQOi8jiG0wXNMDxttcaXDlQRe4FWiVwBq2pgT8PphiXJUX1eWdI7geLzSz67ca8xfMhsAiLvooSoF8lJ3aBLVoRi+ftmWpdmthMRRuhysJAm7LR6nZ/lJnr8yUCQoR4kWkJkrJYSJoI7YztobRUhsaiNGcJB3siim0fJ/x76FRS9bkbGHLvZK3UFC4+HEcSLoog2bDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptxkjVq4O86SHHcQ+FFRxsodppsOWYph/Enxr2lVUV0=;
 b=NRQNg4filpAcpNVDfzaoo2jt8Oi1Lev7trQdnYFQKJbbRphZBMr6pAn/zNvCrFBQ58pwOgFqDZdkcmmmmjWSWR5A5DrMN6oKXp6EfLuai3gs0HHAbtNsxFpxHEg8WX0LJSn5B2N1s43UJiUOUFI1xWvw9KEvA1u9hIKGvXraG4ou7w8KWjCLnkIapHhw/BCJgmT0TDpgTYKAMO1FvJwPFw5bBvMzEarccKBScZx6pxNmfOgQzLEFW2yjBWRMcQvPJUbxj0y6MnIfjdfY/8TdcGtAGXJM+/jTrrf6zhj3TxLbWLccLfQQzL+aFxD0Jd4XN5Np95zxWEKkmp/pcLb3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptxkjVq4O86SHHcQ+FFRxsodppsOWYph/Enxr2lVUV0=;
 b=P0maPlKtjwCrdiq0NxO3nBNZd+wTwMMa3cSuBiFnWfInPVTLvI8fozY2iZypku4+RJjEnORy1EJtRwaVpZGQ4SOPTu+e9F5fi8btSf9PprIh2S5UR0mh61lxhOgpC3S/fuFTUQeX2xS6Ezk23+h50JzTDUr8/ZQEatUmetlFIPr0s6VzFE5+3QzReb6nZVpiyECAoOcByqvz/3GueZQQGbxl29+mcLhIqrdDwk69VeJ4531A/PpiW0RBc1hUnsfaldtMfFIcv1Qtlb7HMJKd7vP1NgJKg+2CF9hKmUMr5ztYOC0QAUYLXjq/IcPSZ8Snqqs6lbzVKJj7gq3ql2eH8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:44 +0900
Subject: [PATCH v3 7/7] Documentation: gpu: nova-core: Document basics of
 the Falcon
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-7-f362260813e2@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: c3765f8a-b79d-4a90-9363-08ddb957c797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VuK2RlS0tFMEp1bUM5YlhLQlJJVnNSZHpzS3o2NXJ1d2VtWnYvekMwcmts?=
 =?utf-8?B?Vk01VSs3Q3ZJQ2dmRjNOTVdUZWZNamIvLzFiQTNsZEZwVjBzajVmaFJwVW0w?=
 =?utf-8?B?WnJVTEV4cGRlMHpha1l6eEYrb0s1TVFOZnZ1WHJuMlhFNVhVVDBEVkZYcFVh?=
 =?utf-8?B?eGJFNGdNbTlxTkpGWVBQcjFRdkFVdFVyQkN1bGdCVzd0dDZlQ05HK3IwTFgz?=
 =?utf-8?B?R1dqd3dKNklZTlVsNDFBQ3JPV1dsWGovcDZZWkw5a0xOQzFvUWYzcE9PckJ3?=
 =?utf-8?B?MWpqajZBWVE0dG93aWRURXJjQkRVQzFSZXJyb1JWRUwvQzl4UFVlRkdrUTRG?=
 =?utf-8?B?WXorbm1qVEt5Z00wVWRZdE5DK3REcnNXUitnU293NmNSV042WTNjSkNlN0Qr?=
 =?utf-8?B?OFhSYlJTZW5pRHI4SVVQS3FVaWZUek94d09hYkgxa1RnYkU2am9qY1lncTFu?=
 =?utf-8?B?eGR1YnMwM1ZLbVFkRXNCWGRqak4vNFdEZzdvK1kvdzZ5L3NVMXNBUmw4N2RT?=
 =?utf-8?B?bUdoWnJSa1dmK2FYbk5hT1J4OERmczhNdk53WXZRbzVBVDJ0c2RqYnQ4R1JM?=
 =?utf-8?B?YnN1Y1Z2ZjJOTDNSUEwybDBJRzJkZ3ROWHpSbDJBMXdTZnA3L044dkRReEVu?=
 =?utf-8?B?N210MW8yVkpPL0FkQ1Y5RHN6ekpwbDNRZjJodlN6Y1BRd0xadmlIV3FQMHkw?=
 =?utf-8?B?SmU5d08zaTkzUzcweFM5NDJRK2RVaUV4M1hVdnplUXJTbU1hbVhpM1lXSWNl?=
 =?utf-8?B?RnlYcVBXZDJJdFVDN3hpWVAzTGJJM3I5bDErQ3BIZXZHMkZUZnhsVXFLNEpl?=
 =?utf-8?B?amdUTnZveWRUcHVjYjR1dE8xVG9kckh6L1BLV0xtR2ZTeHFKanZCMjVsTFdJ?=
 =?utf-8?B?V3pnM1RmUWw0VHZxdWVtWW1KNWM5TVhXMnNjNVdka3ZsenNoN1ovRk04TlI2?=
 =?utf-8?B?dHpZb1JnSWk5ZmhWeXhYVHNPSWtCbXFEb1lEYW5Dc0tCSjZBSmRLUFlNa1ZK?=
 =?utf-8?B?bUtMa25rR3BNQ3NtNHdRLzFpMlplbU43VDJLVXlhMUMrZXpoUk5zMmZ4U2NL?=
 =?utf-8?B?Tm1hVmRzeGJQN3BHWHpacklYSW5ud25tRkROcDJPa1R4dXdrMnlvL0IxSUV0?=
 =?utf-8?B?UkdZMmZ0SnNYQ1F0NytUdE51ai9NdElxYXZLNU1QMUY4YTN1aUNmU2ljcGE0?=
 =?utf-8?B?MFo1VXF1bk1RaTNRSnBaYVVqOXJIOVZiRkRhNERhWUUrUGVxcGg2NTh2S2JY?=
 =?utf-8?B?d1UvZmJmc0o2R3RycjlBYkQ3aEQ0aE9abWJjdk5zNC9JcmZXNGJoTHJ4QS9F?=
 =?utf-8?B?dnhrb2hROW1ZYWVBejA5UWZrYWJyZitiM1g4dVozeFAwK0hIMER5OFdZOHVo?=
 =?utf-8?B?VEFBNVVqdUE4dm5jTGFKVHVmWm5SdVp1aEh0QUNLYkROajhnVXZwRWs3Nmtm?=
 =?utf-8?B?VktLSVVLRkJESzNkZlNld2pJeTh6eXpGN2pIMDM1azk1SUhlR093bjlZbHZU?=
 =?utf-8?B?UnBuZGZ0T2p4YS82QkVsTWl2YlBDbU1UOWNUeEhYcm9PYUVta2hRZSszSVg1?=
 =?utf-8?B?YXU3RGtIU1dXQ0pDZnNpVDdVbDV4em0wdG9EUkQvUVNLRGE2ZTBsSlFqWnND?=
 =?utf-8?B?V2xFTHpkcnBqSmJCOU54ZENnRzB0OENLaVFLMENzWWFZeVFEK0ZCVVA1YU1H?=
 =?utf-8?B?UHZLaU5HK1lUT25tSCtDcFdDd2E4S2xJUW1JcDlRV3pNYWRUcXhDb3NQMnRT?=
 =?utf-8?B?b2VkUVRtam1qeDBiYmIrMndjOGgwZVhFSHQvMyt3c1BkRGRWUVVPNEREaVJB?=
 =?utf-8?B?ckhVTXdScXdENWs3dlM1ZDVLRW1lSnEwaUFleEJVVnl1Wk5tZk9YNGhHRmFx?=
 =?utf-8?B?L0NPYjJyVXhUYS94MUV2dmE4MnZXdzVSVFRQdmFDMk1hS0tHcEpmZnNDbVM5?=
 =?utf-8?Q?IxromMj3ka8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VGazRkOVhweEh2K2IxQ3hrV0hicTZpcjYxOEl6L0VySnd0Vy9lOTBYcWwy?=
 =?utf-8?B?OUZNSnhMbHY1RkNJb0ZIMUh1UWFmWlczMUhpWDJVKzE2a25lRUJIcHc3aHFM?=
 =?utf-8?B?K1FGMTNSeXpWZXJTUm9FZFNhc3pUeWF0M0I0QlBDY2VUbkxLbDNoWEU0ZGh3?=
 =?utf-8?B?eDg0ZTlCMmlVL0hobmdlZUJpY3ozQVY1eWZZWHNNRFdYdENuYklpamk4WTU2?=
 =?utf-8?B?VkZ3RElqVHUwcVdIMFlLcmlOUVRDcnh3Y2NmbU1IdHpIRTB6UkJpcklFMHBy?=
 =?utf-8?B?NkhTa2NzYzZWMThjazRkclBvaVUzemQxaXpza3lydkpvd3pYMnIyRmJJUHZP?=
 =?utf-8?B?Z1NaR2NPWWdhc2ZjMDJubFZLcVNFMlArVmhCVFBKRzkyL29sVWNaS3FMeEJK?=
 =?utf-8?B?L1F4MXhpN2FseU5VdkpGY09HaDVNaHlabk1GUm8zZ3EwaC9CL2NCVXdISzJ3?=
 =?utf-8?B?d0RZMkgxN0ZTU3dNSkdNYURDbkJTYXlRRFczZDFsM2hVYzJUdExaQXRDYU9w?=
 =?utf-8?B?QnQxQW5BNU43WXVveXd4QlVKY2VkK29rekNNSXc4eTJVNDVrNFNCRW9zU0ZH?=
 =?utf-8?B?VktyTDJhRTJWSmErOS9HOHBYd2daL2JueEEzOXVhOFU5RkUzc3EyQURkQk5E?=
 =?utf-8?B?cEYyaGt1eS8vM0hNWXZOSjdyTVFmdVlVNVZ1cml1YkVBc2ZjU1hiU09mUjJV?=
 =?utf-8?B?UUhYSlREdlREdjVraVpBeEJPV0N6Z2Y3WDhjNytzemRkdFlpKy9DZXEvZGZL?=
 =?utf-8?B?alRRZG1tRGpmQVpHaVZIZXZ5WjU0RU1RZ1lvbTAwWk53cjl4eTkweWZNNStT?=
 =?utf-8?B?cDNaMFgrcnZmN1lMSVRkSTNwZ09WLy93WHdpcWRSS1U5bmp0bFVnaWJNZnp0?=
 =?utf-8?B?bDZaVHVEbmNLczJBcWFjT0U0d3IzZndVK0FVOVZ6bEU5dDBmTVNiQUhHbE9h?=
 =?utf-8?B?cHdBbENJQU9LUzVqS0J5NURrc3djckFwNnJVdXp6RzBLZ0M2NXk0a2ZRUER1?=
 =?utf-8?B?SVZJVnJVT2RUNWpCMmNGaGlHc3RwZU9QTjhGS1VoVCt4dWRLejJFYTNONnNS?=
 =?utf-8?B?ZkFuMTZ5YmduaG5SSDQwZWNMU29ERFNTNEJwNVRCbElZQWFUUGlHUVBTYk9J?=
 =?utf-8?B?ejRacm9VcjFkV1V4K05IdEJ5SzRZOWJPKzFqaDF0WWJRQ1VJSVdWeWlteEVY?=
 =?utf-8?B?djBOQ3JjQmwreDlWcExjK0p6bHk1b1Z0eXN4SU9wWDl4NmY1Y3BreWZCdzQ2?=
 =?utf-8?B?eHZNTUFoeHMzaHZVc0lISWVKRTBXKzV3bUJ0TlZuZ2IrV3RrVzAwa2h5UVhk?=
 =?utf-8?B?ZVJyVU80N2dqUUNrV1ZJUC9Nd3RBYVlqVGptdUFSZVArUTQ0dGh6MzJZano1?=
 =?utf-8?B?dG1oVm56bWNKZVhGeGs2TDlPa2UvLzErMDBZSTZkK2NLWHNiTXhmTGx0REdi?=
 =?utf-8?B?ZGlnL29WWCtvVGdYUHphWkRkQjNIbDFBODFEWkM3YkdGVHVsZGR1S3Yxc25k?=
 =?utf-8?B?U3lad0haUEx6YmxhdFhwWGZCa3N4RytIUTlWQXRjRXJkaVhrL1l2UllTTitC?=
 =?utf-8?B?OFIzQ0QxZEFxRDBjMldwY2xWOFBCZlM2MVhkb0tycytkbGhaRjRtMjc2clJk?=
 =?utf-8?B?MW41UXBjR2tITnMwc24yY1laMXpjWGVVQk1mdFBpQjNwV1NUTHlQR2pjUzQ0?=
 =?utf-8?B?bmVMU1RuVGo0cnlhL2toM3RZSlhKSFF2YXZoaG9RVmIwcUVOeEZpYm9GRnN2?=
 =?utf-8?B?QUg0RGNnOVMvOFhCOGpsbjlpdStSRk13RFJUUzA5b2RKWXBmNHJGTHN1ZWJk?=
 =?utf-8?B?d1hJNzJMUGFiZGRRaUxBY0hwOG5xbURob0JkVTY3bVR2UStSZy9pdGNRVzRL?=
 =?utf-8?B?YjlRV1dIZkFwR1dkVDFReU0rYmtTT3BiUnI5V0N2NlZqMjZKcE02OG93TW5H?=
 =?utf-8?B?ZmZPNmMvY0VSdVhkeFlwVHd3Z2VhVitKejBzSEUvdVlFQ2V2ajNSaFlQcEk0?=
 =?utf-8?B?TUxhSUhaeUZ4NHBuWGNoaW85MGRvN3Bwb0RWYS92RzlKeE1YQ3dsbDY4Wnd3?=
 =?utf-8?B?bStXS1VXNXBobXlNK2lmL1ZYS3htNGhQdTIvUmZSS0lCL3FrZDlZZ2JiUFZU?=
 =?utf-8?B?M2VtWXpYdDU0ejBRVHU2Y3lodTM5eGl1MWJFbk1XaWhGVTU5bjNPWi83SHI5?=
 =?utf-8?Q?WNQCVK9PxjD/oj+hJOyixCpUU70YUC/Kjh6gd44Okb2L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3765f8a-b79d-4a90-9363-08ddb957c797
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:21.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0CDxlu+za+O2ngA22FOKMzX0lHyNTWeyaQFkNa/Tuqw2GV0K3KWz2CMlrhM0AxQwvaLELm9RF5wqzYNDNkQ0A==
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

Instances of the Falcon microcontroller appear in modern Nvidia GPUs and
are crucial to the GPU boot process. Document some concepts which will
make nova-core boot code easier to digest. All the information is
derived from public sources such as public documents, OpenRM and Nouveau
code.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/falcon.rst | 158 +++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 159 insertions(+)

diff --git a/Documentation/gpu/nova/core/falcon.rst b/Documentation/gpu/nova/core/falcon.rst
new file mode 100644
index 0000000000000000000000000000000000000000..33137082eb6c14cecda2fbe6fdb79e63ee9ca2e6
--- /dev/null
+++ b/Documentation/gpu/nova/core/falcon.rst
@@ -0,0 +1,158 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Falcon (FAst Logic Controller)
+==============================
+The following sections describe the Falcon core and the ucode running on it.
+The descriptions are based on the Ampere GPU or earlier designs; however, they
+should mostly apply to future designs as well, but everything is subject to
+change. The overview provided here is mainly tailored towards understanding the
+interactions of nova-core driver with the Falcon.
+
+NVIDIA GPUs embed small RISC-like microcontrollers called Falcon cores, which
+handle secure firmware tasks, initialization, and power management. Modern
+NVIDIA GPUs may have multiple such Falcon instances (e.g., GSP (the GPU system
+processor) and SEC2 (the security engine)) and also may integrate a RISC-V core.
+This core is capable of running both RISC-V and Falcon code.
+
+The code running on the Falcon cores is also called 'ucode', and will be
+referred to as such in the following sections.
+
+Falcons have separate instruction and data memories (IMEM/DMEM) and provide a
+small DMA engine (via the FBIF - "Frame Buffer Interface") to load code from
+system memory. The nova-core driver must reset and configure the Falcon, load
+its firmware via DMA, and start its CPU.
+
+Falcon security levels
+======================
+Falcons can run in Non-secure (NS), Light Secure (LS), or Heavy Secure (HS)
+modes.
+
+Heavy Secured (HS) also known as Privilege Level 3 (PL3)
+--------------------------------------------------------
+HS ucode is the most trusted code and has access to pretty much everything on
+the chip. The HS binary includes a signature in it which is verified at boot.
+This signature verification is done by the hardware itself, thus establishing a
+root of trust. For example, the FWSEC-FRTS command (see fwsec.rst) runs on the
+GSP in HS mode. FRTS, which involves setting up and loading content into the WPR
+(Write Protect Region), has to be done by the HS ucode and cannot be done by the
+host CPU or LS ucode.
+
+Light Secured (LS or PL2) and Non Secured (NS or PL0)
+-----------------------------------------------------
+These modes are less secure than HS. Like HS, the LS or NS ucode binary also
+typically includes a signature in it. To load firmware in LS or NS mode onto a
+Falcon, another Falcon needs to be running in HS mode, which also establishes the
+root of trust. For example, in the case of an Ampere GPU, the CPU runs the "Booter"
+ucode in HS mode on the SEC2 Falcon, which then authenticates and runs the
+run-time GSP binary (GSP-RM) in LS mode on the GSP Falcon. Similarly, as an
+example, after reset on an Ampere, FWSEC runs on the GSP which then loads the
+devinit engine onto the PMU in LS mode.
+
+Root of trust establishment
+---------------------------
+To establish a root of trust, the code running on a Falcon must be immutable and
+hardwired into a read-only memory (ROM). This follows industry norms for
+verification of firmware. This code is called the Boot ROM (BROM). The nova-core
+driver on the CPU communicates with Falcon's Boot ROM through various Falcon
+registers prefixed with "BROM" (see regs.rs).
+
+After nova-core driver reads the necessary ucode from VBIOS, it programs the
+BROM and DMA registers to trigger the Falcon to load the HS ucode from the system
+memory into the Falcon's IMEM/DMEM. Once the HS ucode is loaded, it is verified
+by the Falcon's Boot ROM.
+
+Once the verified HS code is running on a Falcon, it can verify and load other
+LS/NS ucode binaries onto other Falcons and start them. The process of signature
+verification is the same as HS; just in this case, the hardware (BROM) doesn't
+compute the signature, but the HS ucode does.
+
+The root of trust is therefore established as follows:
+     Hardware (Boot ROM running on the Falcon) -> HS ucode -> LS/NS ucode.
+
+On an Ampere GPU, for example, the boot verification flow is:
+     Hardware (Boot ROM running on the SEC2) ->
+          HS ucode (Booter running on the SEC2) ->
+               LS ucode (GSP-RM running on the GSP)
+
+.. note::
+     While the CPU can load HS ucode onto a Falcon microcontroller and have it
+     verified by the hardware and run, the CPU itself typically does not load
+     LS or NS ucode and run it. Loading of LS or NS ucode is done mainly by the
+     HS ucode. For example, on an Ampere GPU, after the Booter ucode runs on the
+     SEC2 in HS mode and loads the GSP-RM binary onto the GSP, it needs to run
+     the "SEC2-RTOS" ucode at runtime. This presents a problem: there is no
+     component to load the SEC2-RTOS ucode onto the SEC2. The CPU cannot load
+     LS code, and GSP-RM must run in LS mode. To overcome this, the GSP is
+     temporarily made to run HS ucode (which is itself loaded by the CPU via
+     the nova-core driver using a "GSP-provided sequencer") which then loads
+     the SEC2-RTOS ucode onto the SEC2 in LS mode. The GSP then resumes
+     running its own GSP-RM LS ucode.
+
+Falcon memory subsystem and DMA engine
+======================================
+Falcons have separate instruction and data memories (IMEM/DMEM)
+and contains a small DMA engine called FBDMA (Framebuffer DMA) which does
+DMA transfers to/from the IMEM/DMEM memory inside the Falcon via the FBIF
+(Framebuffer Interface), to external memory.
+
+DMA transfers are possible from the Falcon's memory to both the system memory
+and the framebuffer memory (VRAM).
+
+To perform a DMA via the FBDMA, the FBIF is configured to decide how the memory
+is accessed (also known as aperture type). In the nova-core driver, this is
+determined by the `FalconFbifTarget` enum.
+
+The IO-PMP block (Input/Output Physical Memory Protection) unit in the Falcon
+controls access by the FBDMA to the external memory.
+
+Conceptual diagram (not exact) of the Falcon and its memory subsystem is as follows::
+
+               External Memory (Framebuffer / System DRAM)
+                              ^  |
+                              |  |
+                              |  v
+     +-----------------------------------------------------+
+     |                           |                         |
+     |   +---------------+       |                         |
+     |   |     FBIF      |-------+                         |  FALCON
+     |   | (FrameBuffer  |   Memory Interface              |  PROCESSOR
+     |   |  InterFace)   |                                 |
+     |   |  Apertures    |                                 |
+     |   |  Configures   |                                 |
+     |   |  mem access   |                                 |
+     |   +-------^-------+                                 |
+     |           |                                         |
+     |           | FBDMA uses configured FBIF apertures    |
+     |           | to access External Memory
+     |           |
+     |   +-------v--------+      +---------------+
+     |   |    FBDMA       |  cfg |     RISC      |
+     |   | (FrameBuffer   |<---->|     CORE      |----->. Direct Core Access
+     |   |  DMA Engine)   |      |               |      |
+     |   | - Master dev.  |      | (can run both |      |
+     |   +-------^--------+      | Falcon and    |      |
+     |           |        cfg--->| RISC-V code)  |      |
+     |           |        /      |               |      |
+     |           |        |      +---------------+      |    +------------+
+     |           |        |                             |    |   BROM     |
+     |           |        |                             <--->| (Boot ROM) |
+     |           |       /                              |    +------------+
+     |           |      v                               |
+     |   +---------------+                              |
+     |   |    IO-PMP     | Controls access by FBDMA     |
+     |   | (IO Physical  | and other IO Masters         |
+     |   | Memory Protect)                              |
+     |   +-------^-------+                              |
+     |           |                                      |
+     |           | Protected Access Path for FBDMA      |
+     |           v                                      |
+     |   +---------------------------------------+      |
+     |   |       Memory                          |      |
+     |   |   +---------------+  +------------+   |      |
+     |   |   |    IMEM       |  |    DMEM    |   |<-----+
+     |   |   | (Instruction  |  |   (Data    |   |
+     |   |   |  Memory)      |  |   Memory)  |   |
+     |   |   +---------------+  +------------+   |
+     |   +---------------------------------------+
+     +-----------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e3650f53ff53113f31f63f67cf26116b5c070693..e39cb3163581ea4ff5b441b82e9efa4282c946f8 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -31,3 +31,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/vbios
    core/devinit
    core/fwsec
+   core/falcon

-- 
2.50.0

