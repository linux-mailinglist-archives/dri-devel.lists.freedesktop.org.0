Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E3B5616B
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3810E1FE;
	Sat, 13 Sep 2025 14:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ijKWIn3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2A410E1FE;
 Sat, 13 Sep 2025 14:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpVBGtoAghaJbWuorUhsLAxhw8YXPGZVhpIFizIB9O8PskY3ARhf4jUPmR7ExwHqw/amqtZm6Zb+AiXUyzOEkQJ9hotmYDB/wRGS3VwTyyWijyojLNiRnqp1YsZIAUyeKfieWza0ssyG4EPoXJ6M3Ni0ZnS7OZN+XWq5uIS6MVIAk+NXVUNwSbJZsI9xajjvA5wQas3JZHi8JsPcJ4cBgqXLjvIOc9tA2OIMVW7WsFoyFB7NfOGZ+aYwu9jFCxG8+gisfrHGTlTPsunKQ3X5kc6nqvL/f7JiLput0ASpyKXt8hnklfxBiMDJZ33qKzv7+MqCm3Nzh70WkhpMTLmbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUAEFjn6UPVk5hKqFxc5jyzwzpWtSYMKzyK+Z46AAjc=;
 b=GcKhSMMjWlLbTVr5L1HxjFj+oFMk1ViOftSy2YTeb856NuyQInDJ8ZFWLdK1rOldWLRz+qLQ8X2MGLbLqtcFytxTBQ8vgcIKvVeZJ9lQQ+STWd93c+2+nlvHxwKRox/u2wnLyIfe7sELNdtfZTfdMIC8aKBxY43R9uoxgk6bq70u1iaQoWu6bVj3xhjj6ekLIoYjOD+FTz+wzbkXJw0jz/QwuI1oVgPsWH7pIvEyDms48N8NHH+m+9fK6gG5wiCHt+f3q+ZJPuoxvu4VYiUTFHQpj+I8V70tt/c/ZSSUZpWk9Mfzmyh1UsD6KPmNkEzQM2qwMCa7CBFfkbQBLu3jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUAEFjn6UPVk5hKqFxc5jyzwzpWtSYMKzyK+Z46AAjc=;
 b=ijKWIn3zXX7ioO14Q+JwYxG3k0VX/C04W0e57rL+bgJKBOXPCMbmWoeIaXjT5H+2pKnUQu3NGIVhPfpqt+GnrB7LTUF/y/VH+HFya4MqpHIyoWEE3M7f6irBMF4MUsZJJv4tjpnxJM494kktq25Vi8KCn59HA+/y6Yq/wGFeKnY3M8AV6sznXtFzdyJBEi7JxagLqjwBrOX/ad1WZgVUavsKLkmX7DsvtbK0Ey81rg5Gqd9FLdGa7OpaKeXzT+gof38G4JreLFQffN+Z8QqzxRBjWFqMAdLvnySrI70iNwAmOo2jSnXZsOKIL8OKi5tfuWzZqWNyrMg2Ue/I0jhofQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:19 +0900
Subject: [PATCH v6 06/11] gpu: nova-core: firmware: process Booter and
 patch its signature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-6-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a6d60f-214e-4126-4c9a-08ddf2cf9a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGNpbktSSGc3cXdrT25tOGZJUE5sS3N2eTVaVHMrTUlLZkYrUlNUZWpPalhx?=
 =?utf-8?B?Tm9pTHNvRjBFUXhhZXU2aG5MUXF3YmxRQ3hGRjVRTTRMUWRWdEk5cDFVZmt0?=
 =?utf-8?B?SWVEK1JobDNMQjZvaHlpcncwY01jRDV2dys4ZGw5b0VhRk4zdkJETG43Zi9t?=
 =?utf-8?B?RXN0cGVibkoyV0dTWEpDMWY2d1oyMzNRVHJzUldwa3dGRHd1dHlPay82OU91?=
 =?utf-8?B?V3VLNzVQbWcvT0d1d3RydnplU3lkelZIdUhxTkNvQ1BPQVVjVE9wWWlDOU1S?=
 =?utf-8?B?S2V6MUovL2h4KzhscmlzaTc0L3RoS1pkZnRLaUVWRnJUTWlvblYvS3EzYzZo?=
 =?utf-8?B?SVZWelpXV2hibWFxd2RuQ1E2UnlZSjhxK2RNQXN5UGJoeTVqbFltbm1wSDdX?=
 =?utf-8?B?dVpOQnJrWWhxSWNRZnAxT2k5bW82RGZaa01VZWhTRUw5cGdkSk0wZVRWR2lK?=
 =?utf-8?B?bUxBV1JTVUpBNGU2UUYvd2NGRmpDK1ljQ1M2NmxUbG44dGswaHJpb24xbVgz?=
 =?utf-8?B?ZkFPWVVtYU1PUUlJeXFrVWllelRmanp3N3BLYVc1VVpoT0VhVExYakkzV3Nq?=
 =?utf-8?B?NWowMlJLRjdPTUF2YzVBeDQ1YVJRNUdTWkw5QmRJM2ZNL1pJS21PMWhUTG11?=
 =?utf-8?B?Zkx5dk1Mc0dNOXNaMFI4di9HUU1DNTI4YUxTdU1KVjRLTzZXWkZPS1BJb2ts?=
 =?utf-8?B?V2ZjNk1CRWJHL2p0Q1NySEFWZTUrYjlsc2MxSHBuRFhqa2IySmNBVnRHbmk4?=
 =?utf-8?B?bnJSN09BQlYra1ExdVBnMERvY3hZd0ptb2VncEpWNVpLdnJwdlJZc0JrN1Q5?=
 =?utf-8?B?em9DN0ZyQzRlVWJzeFp1OTVvaHE1aGZKdERzbjkycVJ5bTlra3VLS0ZtelV2?=
 =?utf-8?B?M3VUejZpcGp1ZDFVOXNyRjJMWnEyTk5MemwxN2l1bWMrek5VWk9uTVBLZUVr?=
 =?utf-8?B?UUJVT1V3azJuaGlWcTBNL0JLYWJtYUZlYmNUZTlkbXF0MlhZVkx0OWlHUG1Y?=
 =?utf-8?B?T0NhSm1EaDZEVjlZNGdEcEo5UDltYkJVS2JGYVBBdnp1L1lRbk55bXJIbEl0?=
 =?utf-8?B?bm5ZS3hIYjdlUGc5YXJpN25NTU5nS0UzWmlvQW5WYmV4VUJSOURhRE1RSTl3?=
 =?utf-8?B?U2ViSmNmNk5hcUxPdG13Rk82QnRjblhDTnA1MHZScVNUbzlKRjlRb3B1Ri9M?=
 =?utf-8?B?cUhUbkJUL0Q4QnRPUVRLcWZGV3hOS0NJcnk1YVg3ZXFacFlyV3RyOEZnOXRF?=
 =?utf-8?B?UkwzSTNmd2pVcCs4TERDMmVaK3lBd3pMMHdBODE0d21pR3NETVZ6MzVUZDJ2?=
 =?utf-8?B?YzZjdmo5UFVLL2ROVWp3NnZWbEpXdGordDZzTHRCbitKT3ZlNGhFTTJmZ2RR?=
 =?utf-8?B?cWRvejE5c05WMW9xcnVtbklGSVl2b1lhSVVnZG95VG11ZGhuU2hzdUZmdGVp?=
 =?utf-8?B?SmRDcU1xVWwwS2duK2JhYThQM3NOa1ZhZkNQcTJxYVlvL0VlZ1BoNkYwUDNZ?=
 =?utf-8?B?SThOK2VrcWpReHJIRVp3NXdGOFNNMDlEY3dLRmdnenRzMWN0TDZkZ0hhcldi?=
 =?utf-8?B?QkV5ZUFlKzV2MG5UYXpWaE80Y1U0STNCMmk3NzlyRXRvYWoxRnZwNDlaSXBv?=
 =?utf-8?B?cTZoeVkxVk5sejViOWdxdk91OHBwREpvRTlINzJrQSt0ejRXMHduYSs4YWtu?=
 =?utf-8?B?d1F4T1ZNb2JmUEplS294QitvWU9uRjNsbVdXSU5LdGt3SWZYQzhJMXNoaTV1?=
 =?utf-8?B?Nyt6aW9paExMTjZPaDVhMzV5T2lPWXlMUFZEZTZyRjd1WWtITkZuRGdhSEJV?=
 =?utf-8?B?VmZtSXdXTU5PNnAzdDJKZTdVamZMbC8wMDM0TzE2YjZwc3BWazRXUFJYaW5Y?=
 =?utf-8?B?YitxTGVBR2F0YndtQ2FNeWg1c29jNUQ0VmdvNnNKNUtiMTdEZUY3dWNhbGZt?=
 =?utf-8?B?WndnZ1Q4QVZYQzM2RlZMc1FtZ1Z1Z1VVem1wN1F6R0JYUGVFR1ZSTTV2bzgr?=
 =?utf-8?B?WFovRFZSM3VBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldPMFZxMWhheTFKOHVFMkxZUjE1NWxaK2owZ2xzeEQ4Zko1Y20yeHlweHBX?=
 =?utf-8?B?OUxJbkdMN0NWcngvWXF6Y00vOUZ1RXZSdzZ6cGJOZWR3Mmp2RFZLMm1tdEwr?=
 =?utf-8?B?YXhqeUV2MlY4UFhKcHNSb0hoYVA2bE9oWmJuQUQ2RjlkWUlxQ0xxenpKcWpx?=
 =?utf-8?B?Z0xvZkE2Y0FPVE1ES2QydmVBU0N3Y281THJUb3I5VGJXZWQ2OFpEaitpWUdW?=
 =?utf-8?B?Z3o3TndXTlpLVjFwVnoxMlg3RjJNc1E0QnlvSzNLOUZ3VnJoeFh2dDBpRFNB?=
 =?utf-8?B?eldSaXpyWU4yS3pCYVdlcTRnZGR2UFFlajZrbnNUakxJaG9IaG5NVzZpdWEv?=
 =?utf-8?B?WVAxTU1jOVNDQWFua2tLVmVrRmswdkltUm5wbDRyNmhlck93VjZUV1FkOTgv?=
 =?utf-8?B?MXIxUlFCZ3RPbGdhNjVOOHgxUy9vRTdIS0NqeEloaTFHQUY5QVF0elVUT2k0?=
 =?utf-8?B?SXBJUWNMV25OK08zODhmVWo2cFlNKzJDQmtQV0NING9qS1gwNTcyaFc1TkV0?=
 =?utf-8?B?NWtUampSZ2ZCWEZESmdTeEhkeEp5emxNQnBqQXI3OEpzOWwrSk0zZldQR0ho?=
 =?utf-8?B?ZHV2WisreUFtWEhFZ3pjenllLzNSeFZlNmJRWkYxWFg2cjU0SE1va3VVaWhv?=
 =?utf-8?B?Szl6ZDdLOGRGUTlKZXZhdjNDMnhxdllHWUd2QlNoVFhudEtjZW9jaVY4WVk4?=
 =?utf-8?B?YTJyc2IwWjQ1QzczVjdvanM0czExbmpCRm1BcCtYNldOc1ZTTThwdFpHVWdr?=
 =?utf-8?B?ZkZ3RUNVZFVxU3k2aVh0M1EwdTJaSGd0NHRYN1ducWtZT21Ic2grVWdvNitZ?=
 =?utf-8?B?bFN2T1hzQUI0ZzhEYzcwNkRNR204Zk5pT3VDYUl4YUg1c29KTmlybWUxd0x2?=
 =?utf-8?B?KzZTdlgyVXd4bENFcmM4Lzd6YlVSZ1E4Z2dSWmJRQUlmbGZSQzV0bWNnTVdR?=
 =?utf-8?B?N0gwdHdJS016cmloK2h1SFN5RVJ4WDk2UkFjMGxyd21NOXdpbjRrL1htZDQ0?=
 =?utf-8?B?dmR5UStDTWtiTnM1NUcvQ09Uc3lGT28xTHU3VEdWcXFEc1AwMmNyOFFqWS8v?=
 =?utf-8?B?eEsvSmMzMkIwTkhGS1RIdncwWEVrOXJQUE9ZQ2ZsOUplRVIxRGJqWGcydTJp?=
 =?utf-8?B?NExJY2hJZ0tTNERmYldhVEk2THR2SCtWTjVEUDFvU256M2NZMHFCSERuUkRh?=
 =?utf-8?B?RFNja1J6bHpWb1F6TDcvcHhxK1YvaHJXaHNBZWNmQjJvMzZxeXFEOWRTVWJt?=
 =?utf-8?B?eGlzS1Y2eWYzQzBJUGw2ZUxNMkNIVEZkVFFqTmUzV1RUL0EyZUVyRitCb0E5?=
 =?utf-8?B?a2pIa2diSE1icGllNC9LSXlpL2FIM0Z6VHVjMlRlMnY4S2pPK1pPbEFlZFdn?=
 =?utf-8?B?bVhFQWpyVWJaZ0txQzJjNmg4RnpkdE8yTTZhQk96Smg4ZzFEQXk3a2RLSEZW?=
 =?utf-8?B?MlBRT0twYlYzdmdid3lERzlqdnhIeXNLdnVrN0phMEh2anJxK3B1cDhTaTQ4?=
 =?utf-8?B?S2dqRWxqcFl1b2M4eTdXTWtGbU5FbjZrbXBTSWczVitjVHJsQlRTcFIvK0xx?=
 =?utf-8?B?UGQ4bDN5ODNPNmdnYmJ2TXM5VkdOUVBCazV2RFUzQmF0WmFycWl3cjdWZXlK?=
 =?utf-8?B?c3FySFEwTW00VDlVTlRoUllTSUFsbEdCbjNvK0RDVVVLamFMbzVGbGNCNEVU?=
 =?utf-8?B?MGVUUUxoWVFCZ3VsSHV1aHdRbXZqdnlBUklRQm53c3NqdWdXWTV3UGhDcDlo?=
 =?utf-8?B?ZWtsWk5rOCt5bVYwTmQvLzhYWEUzcFcveDhwbWJzVDZobm44YUhnZ1hqYUVL?=
 =?utf-8?B?ZXM4NEZ4K0dtM3U4ZkZaN1V2RmRVV2VZV0xOY29LVitXcnVWekRvandCSHlw?=
 =?utf-8?B?c2ROOXA1NlF4U2JLdms1eCsvcmFrME15a1NNREJka1JKSG5hTlluS1pEZXcz?=
 =?utf-8?B?dWhvODdzOW1vT3duNE42NW9oVzR4Sm5TNHBDTHNLeWJoODdHbGxIUkVtcGh2?=
 =?utf-8?B?dnJQeEIwZXNRYnU4SXRkYlRyRGoySFpiQWhNc3BEQ3d5TjdlODUyRnQyMGVB?=
 =?utf-8?B?WWk4aXFuWUlCaE5BYzNqcklIaVpMU3Mxc3ZSc3pTekFCSjR5ZzZrMkRETFB6?=
 =?utf-8?B?NFB0eGRBU2hkZWxNWFd4aGJZbWl0djNYZmpYSzMrRzIxV2Y1RXFaNnMzZ2lw?=
 =?utf-8?Q?S2dCBpwXVWay9m08oXwjaexP2CqumrKBan7Sdm7IF3Ej?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a6d60f-214e-4126-4c9a-08ddf2cf9a7a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:42.2928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCM+m9pS2FnHdZaFOD/Pg1RSjiV7TdA6oqNhcbWLGxV/Y5TEnJFjpqeLnhzE+k2hn1nPoIAuWiS01bcbCDXjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

The Booter signed firmware is an essential part of bringing up the GSP
on Turing and Ampere. It is loaded on the sec2 falcon core and is
responsible for loading and running the RISC-V GSP bootloader into the
GSP core.

Add support for parsing the Booter firmware loaded from userspace, patch
its signatures, and store it into a form that is ready to be loaded and
executed on the sec2 falcon.

Then, move the Booter instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

We do not run Booter yet, as its own payload (the GSP bootloader and
firmware image) still need to be prepared.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        |   6 +-
 drivers/gpu/nova-core/firmware/booter.rs | 375 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs        |  17 +-
 4 files changed, 393 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b16207e7242fe1ac26b8552575b8b4e52f34cf6a..37e6298195e49a9a29e81226abe16cd410c9adbc 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -293,7 +293,7 @@ pub(crate) trait FalconEngine:
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
@@ -304,7 +304,7 @@ pub(crate) struct FalconLoadTarget {
 }
 
 /// Parameters for the falcon boot ROM.
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
     /// Offset in `DMEM`` of the firmware's signature.
     pub(crate) pkc_data_offset: u32,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index dbc62c00d95bc1bb420fa704977171d7c9f74109..d821744d996105d81f6667207fe931492f82d6c0 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -17,6 +17,7 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod booter;
 pub(crate) mod fwsec;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
@@ -37,8 +38,6 @@ fn request_firmware(
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
     bootloader: firmware::Firmware,
     gsp: firmware::Firmware,
 }
@@ -48,8 +47,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
         let request = |name| request_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
             bootloader: request("bootloader")?,
             gsp: request("gsp")?,
         })
@@ -185,7 +182,6 @@ struct BinFirmware<'a> {
     fw: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> BinFirmware<'a> {
     /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
     /// corresponding [`BinFirmware`] that can be used to extract its payload.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b4ff1b17e4a08f2b6b17b8ccb3e43c3e1f2faa39
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
+//! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
+//! (and optionally unload it through a separate firmware image).
+
+use core::marker::PhantomData;
+use core::mem::size_of;
+use core::ops::Deref;
+
+use kernel::device;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::sec2::Sec2;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::gpu::Chipset;
+
+/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
+/// `offset` in `slice`.
+fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    slice
+        .get(offset..offset + size_of::<S>())
+        .and_then(S::from_bytes_copy)
+        .ok_or(EINVAL)
+}
+
+/// Heavy-Secured firmware header.
+///
+/// Such firmwares have an application-specific payload that needs to be patched with a given
+/// signature.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsHeaderV2 {
+    /// Offset to the start of the signatures.
+    sig_prod_offset: u32,
+    /// Size in bytes of the signatures.
+    sig_prod_size: u32,
+    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
+    /// image.
+    patch_loc_offset: u32,
+    /// Offset to a `u32` containing the index of the signature to patch.
+    patch_sig_offset: u32,
+    /// Start offset to the signature metadata.
+    meta_data_offset: u32,
+    /// Size in bytes of the signature metadata.
+    meta_data_size: u32,
+    /// Offset to a `u32` containing the number of signatures in the signatures section.
+    num_sig_offset: u32,
+    /// Offset of the application-specific header.
+    header_offset: u32,
+    /// Size in bytes of the application-specific header.
+    header_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsHeaderV2 {}
+
+/// Heavy-Secured Firmware image container.
+///
+/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
+/// read from in the firmware data.
+struct HsFirmwareV2<'a> {
+    hdr: HsHeaderV2,
+    fw: &'a [u8],
+}
+
+impl<'a> HsFirmwareV2<'a> {
+    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
+    /// `HsFirmwareV2` for further parsing.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+            .map(|hdr| Self { hdr, fw: bin_fw.fw })
+    }
+
+    /// Returns the location at which the signatures should be patched in the microcode image.
+    ///
+    /// Fails if the offset of the patch location is outside the bounds of the firmware
+    /// image.
+    fn patch_location(&self) -> Result<u32> {
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+    }
+
+    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
+    /// firmware is unsigned.
+    ///
+    /// Fails if the pointed signatures are outside the bounds of the firmware image.
+    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
+            // If there are no signatures, return an iterator that will yield zero elements.
+            None => (&[] as &[u8]).chunks_exact(1),
+            Some(sig_size) => {
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
+                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+
+                self.fw
+                    // Get signatures range.
+                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .ok_or(EINVAL)?
+                    .chunks_exact(sig_size as usize)
+            }
+        };
+
+        // Map the byte slices into signatures.
+        Ok(iter.map(BooterSignature))
+    }
+}
+
+/// Signature parameters, as defined in the firmware.
+#[repr(C)]
+struct HsSignatureParams {
+    /// Fuse version to use.
+    fuse_ver: u32,
+    /// Mask of engine IDs this firmware applies to.
+    engine_id_mask: u32,
+    /// ID of the microcode.
+    ucode_id: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsSignatureParams {}
+
+impl HsSignatureParams {
+    /// Returns the signature parameters contained in `hs_fw`.
+    ///
+    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
+    /// if its size doesn't match that of [`HsSignatureParams`].
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        let start = hs_fw.hdr.meta_data_offset as usize;
+        let end = start
+            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .ok_or(EINVAL)?;
+
+        hs_fw
+            .fw
+            .get(start..end)
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// Header for code and data load offsets.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2 {
+    // Offset at which the code starts.
+    os_code_offset: u32,
+    // Total size of the code, for all apps.
+    os_code_size: u32,
+    // Offset at which the data starts.
+    os_data_offset: u32,
+    // Size of the data.
+    os_data_size: u32,
+    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
+    num_apps: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2 {}
+
+impl HsLoadHeaderV2 {
+    /// Returns the load header contained in `hs_fw`.
+    ///
+    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+    }
+}
+
+/// Header for app code loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2App {
+    /// Offset at which to load the app code.
+    offset: u32,
+    /// Length in bytes of the app code.
+    len: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2App {}
+
+impl HsLoadHeaderV2App {
+    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
+    ///
+    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
+    /// not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
+        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
+        if idx >= load_hdr.num_apps {
+            Err(EINVAL)
+        } else {
+            frombytes_at::<Self>(
+                hs_fw.fw,
+                (hs_fw.hdr.header_offset as usize)
+                    // Skip the load header...
+                    .checked_add(size_of::<HsLoadHeaderV2>())
+                    // ... and jump to app header `idx`.
+                    .and_then(|offset| {
+                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                    })
+                    .ok_or(EINVAL)?,
+            )
+        }
+    }
+}
+
+/// Signature for Booter firmware. Their size is encoded into the header and not known a compile
+/// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
+struct BooterSignature<'a>(&'a [u8]);
+
+impl<'a> AsRef<[u8]> for BooterSignature<'a> {
+    fn as_ref(&self) -> &[u8] {
+        self.0
+    }
+}
+
+impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
+
+/// The `Booter` loader firmware, responsible for loading the GSP.
+pub(crate) struct BooterFirmware {
+    // Load parameters for `IMEM` falcon memory.
+    imem_load_target: FalconLoadTarget,
+    // Load parameters for `DMEM` falcon memory.
+    dmem_load_target: FalconLoadTarget,
+    // BROM falcon parameters.
+    brom_params: FalconBromParams,
+    // Device-mapped firmware image.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FirmwareDmaObject<BooterFirmware, Unsigned> {
+    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+    }
+}
+
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub(crate) enum BooterKind {
+    Loader,
+    #[expect(unused)]
+    Unloader,
+}
+
+impl BooterFirmware {
+    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
+    /// ready to be loaded and run on `falcon`.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        kind: BooterKind,
+        chipset: Chipset,
+        ver: &str,
+        falcon: &Falcon<<Self as FalconFirmware>::Target>,
+        bar: &Bar0,
+    ) -> Result<Self> {
+        let fw_name = match kind {
+            BooterKind::Loader => "booter_load",
+            BooterKind::Unloader => "booter_unload",
+        };
+        let fw = super::request_firmware(dev, chipset, fw_name, ver)?;
+        let bin_fw = BinFirmware::new(&fw)?;
+
+        // The binary firmware embeds a Heavy-Secured firmware.
+        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+
+        // The Heavy-Secured firmware embeds a firmware load descriptor.
+        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
+
+        // Offset in `ucode` where to patch the signature.
+        let patch_loc = hs_fw.patch_location()?;
+
+        let sig_params = HsSignatureParams::new(&hs_fw)?;
+        let brom_params = FalconBromParams {
+            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // signature patch location.
+            pkc_data_offset: patch_loc
+                .checked_sub(load_hdr.os_data_offset)
+                .ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+        };
+        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
+
+        // Object containing the firmware microcode to be signature-patched.
+        let ucode = bin_fw
+            .data()
+            .ok_or(EINVAL)
+            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+
+        let ucode_signed = {
+            let mut signatures = hs_fw.signatures_iter()?.peekable();
+
+            if signatures.peek().is_none() {
+                // If there are no signatures, then the firmware is unsigned.
+                ucode.no_patch_signature()
+            } else {
+                // Obtain the version from the fuse register, and extract the corresponding
+                // signature.
+                let reg_fuse_version = falcon.signature_reg_fuse_version(
+                    bar,
+                    brom_params.engine_id_mask,
+                    brom_params.ucode_id,
+                )?;
+
+                // `0` means the last signature should be used.
+                const FUSE_VERSION_USE_LAST_SIG: u32 = 0;
+                let signature = match reg_fuse_version {
+                    FUSE_VERSION_USE_LAST_SIG => signatures.last(),
+                    // Otherwise hardware fuse version needs to be subtracted to obtain the index.
+                    reg_fuse_version => {
+                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
+                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
+                            return Err(EINVAL);
+                        };
+                        signatures.nth(idx as usize)
+                    }
+                }
+                .ok_or(EINVAL)?;
+
+                ucode.patch_signature(&signature, patch_loc as usize)?
+            }
+        };
+
+        Ok(Self {
+            imem_load_target: FalconLoadTarget {
+                src_start: app0.offset,
+                dst_start: 0,
+                len: app0.len,
+            },
+            dmem_load_target: FalconLoadTarget {
+                src_start: load_hdr.os_data_offset,
+                dst_start: 0,
+                len: load_hdr.os_data_size,
+            },
+            brom_params,
+            ucode: ucode_signed,
+        })
+    }
+}
+
+impl FalconLoadParams for BooterFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        self.imem_load_target.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        self.dmem_load_target.clone()
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.imem_load_target.src_start
+    }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6625a11ccc8837d1d3b1d764fe69b19aeebaa2ec..faa553635b7c73f01ba1b07d31f57404e164a622 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -7,7 +7,11 @@
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::FbLayout;
-use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
+use crate::firmware::{
+    booter::{BooterFirmware, BooterKind},
+    fwsec::{FwsecCommand, FwsecFirmware},
+    FIRMWARE_VERSION,
+};
 use crate::gpu::Chipset;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -102,7 +106,7 @@ pub(crate) fn boot(
         bar: &Bar0,
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
-        _sec2_falcon: &Falcon<Sec2>,
+        sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
 
@@ -113,6 +117,15 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
+        let _booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
         Ok(())
     }
 }

-- 
2.51.0

