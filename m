Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFCAE06FF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48E10EA39;
	Thu, 19 Jun 2025 13:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L6N3Nf5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCA510EA3C;
 Thu, 19 Jun 2025 13:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khH+C5jewfMf8HeOLyGmyM3gAb5HIERhWdhrvuJIOMRh3863ugAh4OZloE0wNEMjyhatHr+QLG4eE+p2nMQ6bCY9k+jgZapCekfJ7i7ymDWwt8EU0BTmltwRj9OU6TbdDsTxrlWeZp8Vvpa2T8+wJ3vHroTj+m7k0Rm3rZM0G0BNBkCQwYnq/m9eaCuBer1XFbXi+divqe36/31UFuMnZoLOo5VJslOschtqJQygKttNaRu/xOd0lCCydMCj8mq9fkBkcyEO62Gr6Af5ObnlL2mr8tvsLP/VsASMkTRPyhRp7ttcKNcxuNC4WneMoZnNo2HzHFefr7jv5nTfn5sQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7E4m2II5j7uSOb9//xlcrTYSeByihbQNj/clr7DFco=;
 b=mpnKxGnrbJm58d6svBsqyXu6ytUjx7LySCQKdQ+Y7UBoa4wDUUik2aQwt7l28zmWuSecU1Sp/vo+ykdjKJ5e7BqkJfhNDyx20oU1Br9H71uG1oTtgshLR1alWtcpi5t10GEyS4JfaiM/MC+DWk+JBlLysqwUEe4CNnyZppzRgiOYEQ4JS0TQEm/9QxajqKcCPSHntVxfTMSDRogiqueMDXymmTe8LQk6Gbf05HgSOWHuhTRcX475ta1rUm8bVWpKB4OBoy+axZoqT3RR9JX+AJ0vWU6Hnx901yJdzn2Xm0jt/3mTRRExrGUrzMMY4mIPWBdZ1bReG4B4PBBhxu2oHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7E4m2II5j7uSOb9//xlcrTYSeByihbQNj/clr7DFco=;
 b=L6N3Nf5tSIs50yW6Ki9GpvW/8PPiVhWC42TO3s0zJZdBBw0/xmIXGBqXchJrRAbvAbEbIUmuLqlKV/4vZpRS9YLttbSIGuEnUVV16t3qbZ1JztzSjovM+6gMQSPjj6zXCpkAbLyjamm6VT199s4iPP6liXZFutY2HuX2iJKG4S+TOD4eonolp2F2IjgZXuHJbGTbR7pe9sScExq1icmkHPSbLQeKxFcfZTZstUGKyKOjmiyyJxHrtxMzIFaCM95TBco2rTq6KNadugYpyvdKO8m0v2a5BksZwEqcmBPudiO6Z9nk+Ko5QjlsyD1pHJIhSajE44jXhTVqUDBRWpvptA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:51 +0900
Subject: [PATCH v6 07/24] gpu: nova-core: add delimiter for helper rules in
 register!() macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-7-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 161a6610-4410-4f83-e88f-08ddaf34aad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uzh6QmF2b1J0bWVHbDBJUTAvak9DWFJ0RjJtdmZ2Z2YwWkx3OG51ZXhGNEJT?=
 =?utf-8?B?blZ2NnBMQVB0QjdGS2ZLemdIM051SDU2OGtnY3RSbXpOVVhJbnRGVHhMQ0xr?=
 =?utf-8?B?OWc1WE9ZMFIyK09ScUN0NklocE9uZHJsYzNkUjN6NDg3YU1DRWtCU04xWGg3?=
 =?utf-8?B?Zmw1RTBra2tGRXowMXpiL1NnWHlsLzRLaUtKOVJVMkl3c3BGR091cXdhSGFa?=
 =?utf-8?B?L3dQSithV3VmSkFYaEZDblI1ZjNSbDJQMENzSUNnbjh2VVcyc2dJMjE4eGRo?=
 =?utf-8?B?VklRZmxpbHlvanNrcnA0OVlVejFta2hZckh2bFo4d0JNd3Z5VFRIOTg5S2hj?=
 =?utf-8?B?SDdha2ppRWhkTjUwL1VxRExmZC9oWWRkZVhRL2JZNjBzR2tlMStVbnM1dEtl?=
 =?utf-8?B?Ym5aNGNUSnJUZzRiU3FpRDhEMGNlNkxIcERna1ZkaGI5SzFJdzMwSVIrSm5a?=
 =?utf-8?B?UEprZmlaNmR2NTVFY0pVdDFZQmlkOVVURjFiOW5KMTBFZlpMdHc3MDU1SEZu?=
 =?utf-8?B?UnpjZ1ROTy95dW14NHpveStEQjlsUEdiZ2ZxMlBYRzcweWx5UHpvWUVnMlI4?=
 =?utf-8?B?Y085MXhoU0cra08zNkQ2M1ZRWVdVdkhuOFJnZ1h1bzlCWE9jMGVKOUhDTXE4?=
 =?utf-8?B?R01aMEhLYXNKY3FNalcvMVQ5Zk94ZE0yeVdrVzVzeVE3QWNsOEs3OTVVdGth?=
 =?utf-8?B?UEYweGNxZy9XK0ZSTjMyQ0lCTUxmSHNFVUFGcU1DNUd0V3N2a3lBTU91K0Q1?=
 =?utf-8?B?Y1Q1WG5mazdOa3NRYk40dXh2R3VHRHlOUEZJYk53eUNwUFFBT0I2UlBKVHlN?=
 =?utf-8?B?UUlrWGUrcjRVbFpsSlNKWkFXcFNWUTg4OTFneGlHR09ja1JaVnRQcndFZGNN?=
 =?utf-8?B?dnZJUGhNVDhZTDlaci81WEs0OWp0N1Y1VTByVGRwRjNrNy9zTlBlaDg4TjFB?=
 =?utf-8?B?R24xODNUYnhia1VwaXBwekQ4Sk1YRjRYeWhEUWhPd3V2dFNkbktOMFphR1BB?=
 =?utf-8?B?cEhPVGpYeUxKb0k1ZS9YU09VVys5UTJHRHp4NFVUM0w4ckF0NFU0TnE5MlVs?=
 =?utf-8?B?Tmk2bmlaUTFndFhtZWt2WCt0Y2prU0RyTmhWTWVjL0p6akcyTHVGVGI0aHNE?=
 =?utf-8?B?VmE1cGphVzh0bHlqMFVWWjhjbTRudDNHR3hXOHQxS2FOWmZSUzRScWlhSEJW?=
 =?utf-8?B?Qll4UTZJMEF1VUxsL1dpejY2a1E2REVreTcwMGtxaXlqVWtmcytGU0NoeGVk?=
 =?utf-8?B?OHhaZFBZUnJDbUNyVFFnTUFNY2VOakZWb1VYZkJIN0ZkZ2ZIVnlUaFNnQklF?=
 =?utf-8?B?TDdSNXVVQSt5eFBYbEV1K3pJYmJnYnpMTkNxdUVpeEhsVkNwb0R2V1BFNHJ4?=
 =?utf-8?B?VjRCSnluYUhhdWdlUGs1a0xIUWdrc1hvaU9mVGZDaGhMWE5yTXY4cGZVNzRr?=
 =?utf-8?B?QnZsK3RXWlB3SzZHaGxGTHRuNmxmWnMxcmpGNDNqMEZpSUc0SXlmWjlxb2oy?=
 =?utf-8?B?dzArUFlhbTNFQ0UveUVSd3pwK1BpemZDa29yMlVZUFd1THFuS0xUMkRzK2RM?=
 =?utf-8?B?QlNsQktCVnpzdjRnM3lRR2ppbXFORmQ2bTFid0ZPdjZReGZVaFBndkFyajBC?=
 =?utf-8?B?Sk56UVpVbzJjdGNxWG94RzNpeHdxMU5ibjJJbzJtSWV6eGREdlJDbTFtQ1Z3?=
 =?utf-8?B?VnE4RTQrdXpvdlZWSDBia05WcDMzdjNqUzB4T1p6TXlwalNoVHhhcXhKVTEv?=
 =?utf-8?B?eTJ0RzgvSFBmMENiN3VJdFBvTkN1MzBVZ1NocHk4NDBXTDQrRFRwSkZRWmN1?=
 =?utf-8?B?ZkRzRDJTd3ZoL24xelI4WmdVUWtzUElEQXBMUUhmM0pWU1ZzNXNhUjJnWm00?=
 =?utf-8?B?WDdvTE1vSjc3b05NdGlRSjNtOHFOY3h6aXZiYVdSeWNEVE5VVWo3VEt5bE5K?=
 =?utf-8?B?R2VtNFl5SHR0SFcrTVg3Mmlzb3ZnMmx3a3hBMWMyenoycUxzcTVQOWZ3VWs5?=
 =?utf-8?B?QzJFaHFEWlhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJOdmNGWDIySFM0Z1BtL3lpYm4xaEc0a2xZdjBqd1padlQrelVJTzZrbDA5?=
 =?utf-8?B?RDJiM0ozOURjUCtYd0pNTWtjUmdmS1BVOW1sSzcvZGlWZVFKcURackE4bGtQ?=
 =?utf-8?B?Qi9BeHZZNStTWkZ1cWpOMTJSQkVhUTkwZXpmWDdtQ1h4ZHVvQ0xTTmFrbEwv?=
 =?utf-8?B?QlF6TWdld2MwVXc1alZQSWh2MGJ1SWFDRmQ5bWFRUjdWU2RQdTdLazRBLzhJ?=
 =?utf-8?B?TjExbFd2TGduMWZZcFRLU3dtYTdUYWc4VW9sQTMrYldSVkk5TjVja3dxWXF1?=
 =?utf-8?B?YzdQaUxNYkpmbnppYXZqU0pHSVAxNFViQlJUL1Y1WGlSb0I5OFlFUmdXU25k?=
 =?utf-8?B?aUtadUhBV3p6TjFjT3BSVTNaeXZWRzhxRXdCWFlYd3JhZ21laGJMSGFwTmVQ?=
 =?utf-8?B?ZEoyUWpwc0hILzZkbjhXQnM0S1pWaStGUVkvZjcvcGVKeU5KN1J2eGwvelBT?=
 =?utf-8?B?ZGRUUVdnZVdGSkhKMEZWZ3JxMTBsQTBwLytzWmRvczNObDRZZkhCc0diYmZF?=
 =?utf-8?B?OGN4elFkbUxSRzloUTl3d0x0RGZ4UDByUkNITTQ2MEtqMUJXNmVXbjlldFZo?=
 =?utf-8?B?T0NlM0NuMisvVFNvbU5yUUFONzd2cUVEZUVJaEhmd2hqdEx3TkxEZXRYcUJY?=
 =?utf-8?B?dXFSZmQ4SEROTGpVRzVtVVhPcmZ2azc3WHZFZFdhNGFpUVoxS3VzWDlnUzNZ?=
 =?utf-8?B?VHFqczhGNmpvRHk5TENsSDgwWUE2WThRcU5vb1I1eGdCSmQ4VlByeHA5alcw?=
 =?utf-8?B?ajdXZGhFOHB5YUdMWStkd2FuYlRSbkRreVNRYTlybHRyQWVmWGRwQ0NxR2p6?=
 =?utf-8?B?dnVSL0tjekJjMlRuVWpOMm0wbFU3ZUFPUXh3L1l3QkMyWHVHQUxOSFFNUXFQ?=
 =?utf-8?B?OVFRQU9Ha0x3QXZxbThPN2FpMmd5OGc2eThsOFdCUHNqWVI2R3JKU1dFM2M3?=
 =?utf-8?B?aEY1MGNwbkJQaUJtRjVtTzM0Z3lobnZIbXhORFVNYjFDajNXOWtTT21jcVNi?=
 =?utf-8?B?NWkydnBYZElTTVBpTFZsNTk5a3NTNkRGT2JHYVV2aEVYVjJ6a0l1c0ZvVnp0?=
 =?utf-8?B?eHVGeENpanFMWnVSTk1MbEJCSzByQnNtNGlFMEx4aGU4MExEZkZjU1JBUUV3?=
 =?utf-8?B?TVkyNFcwWk9ZamFkYWVJblBCcWRXNVpSZjZldkZCdHFTL0ZVVWxLTC93V0Nm?=
 =?utf-8?B?eExKbkw4Y213ekJTU2d4TjdXaHZkRE05Wit4aGl3Zk93cDJCL3hBWGVoS0xl?=
 =?utf-8?B?VmdDL2hLSWZIZFNJemYrQytJVE8xMU1VbkkyL1MxVVcrNGdtZERRN2xqQkJN?=
 =?utf-8?B?K0RGS0ZyZVM3TEJUMTY0MkJ0Y0srWkpGUjVwOFNJTURubS92ZkhCSDlYVkYr?=
 =?utf-8?B?QldnS3JQNVUrWm5TTFJMSWtueGFnK0h5Kys2SkIvY0xrMlZoT1Q5Sm96VGRq?=
 =?utf-8?B?ZHlTdlQ0R1pjQUpoT1hmZnBpdUgyU0lzUzNoU2wxc0FzQkVXNFN6OXQ4cnVi?=
 =?utf-8?B?Wm9VRUpSejMvYmxUYWE4d0hKUnVnc0ZHVzIyMUV2Ny9yVWZOVDJoZW0wdkV4?=
 =?utf-8?B?R0xCdmhRZzI2K2V4QUd3Y0ZGTXg1d0RyOWtaSXlEb0lMelNKZW5zcGI2dENT?=
 =?utf-8?B?VlVzWEVzMlJaeXlBM2ZHZXNnR1hXNERTMGJZeFdjT1VndmNqaDNGYm5Rd1Av?=
 =?utf-8?B?LzBabnVXd2s5MlBLam54a3FJMXFRZWNnVmREUWlhMWlMV1ljRjh1Y1VTV1lT?=
 =?utf-8?B?elhUckdCMFRjL0oyY3NpU0JuUVdJaHJpMmFJcEZRb2RRSUJ1V05CZklUUUd1?=
 =?utf-8?B?Vm8xUVVldHNBeUlvK0JqVStVRUlpd2d5cGprbVlvQ2dSem5zTGN3K3dEcURo?=
 =?utf-8?B?T085eHZtSUpvdjRuV0diY0tWbDB4RWNKWVpINVBJT0JCZGFrSWNZUjJ3MUdR?=
 =?utf-8?B?dlRMaGVvbjFtbHFnVzFna1B6a2xQdmlCZk00M3NCMkNYZWVuL1cxdTBpbVNV?=
 =?utf-8?B?a0hzcjZkcWtXMm9GL1RzVWtwNlJVMzdnODBvUlR0TUZkWkNzeGN3b29sak5V?=
 =?utf-8?B?R2JMQWRSOWZCcVA0eGZzamdZWE5OdFdPYUdqNnhhRGdxSWVjdjN5YjJMd1pk?=
 =?utf-8?B?YVM0Q3dlYWMvei80YWhOVldLWGdtMFNxVU1Yc01HV3J5Q0lINXFkZW9kb0dZ?=
 =?utf-8?Q?zvBr5QZQUCpampRYyUf3j9BBJ6FWbzjKWiiM1Cfz2gvO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161a6610-4410-4f83-e88f-08ddaf34aad9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:49.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bW2j5JGWG45DKUmXpjmwpO5V4CHt0SpzO4W+GiPJnrquDAzXZkWVt0u9iWHV3SPwboAPJhvAPBGKI7QV0up8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

This macro is pretty complex, and most rules are just helper, so add a
delimiter to indicate when users only interested in using it can stop
reading.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 40bf9346cd0699ede05cfddff5d39822c696c164..d7f09026390b4ccb1c969f2b29caf07fa9204a77 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -94,6 +94,8 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // All rules below are helpers.
+
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
     (@common $name:ident $(, $comment:literal)?) => {

-- 
2.49.0

