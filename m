Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D6BAE275
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 19:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC22A10E614;
	Tue, 30 Sep 2025 17:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TadGvIGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9A10E610;
 Tue, 30 Sep 2025 17:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TguysFd8Uf1Soj8NS+9/sbzQI/xoLhXzEWDv6I0NofOzUHw0XCWKgUxDnxw019QGWFHhXT+YBq7crj0T0+T+h4UuRLRMbRDaLGZhtHepOLeydbfo05jhWSqCHNdqIziEg8BirFTIykk+PGy/tX+JFLe06eIuiN1I7BBghPqmd1CNwcg7kY03CqiteydBsnkih3cFXH5v2/opa90dhCo7wnIJ3ZPJ6BVHtJIqVf7CTNXhlSETGFhKekEajBGZRB1PqetMXKuFVfjJ/UNJeVXdU9DF3eP5LunrSC4gWNWC6daAsh66C7oZuSflncQWuN6YAzWUadAftmgJgmhi8bIB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k/WzX6y+rA03PKLqNhSRI+3Q7e+oA0lAORvp3bI2gY=;
 b=sW3C2qMlbgJOjzvWxR5WJBG8m2j+nNiK7FQXrdqIp1iqRitLJHuwkd9bcCIzXpXDc4oD+e2//pWrfrBgXV5S1Za4J/+5m2f8rcJpY++xnb1tJvfGQBV/5VmJn5xGzYl0OGjlfonesJ8ztZatDGg0Y7sBpvatzOvB04/kDogziNFqZYKVr9iYoiPRYXFt8w7KUKwJ5wGUSLjKlyibFSZ9XUFfzBQbO6hyxdA7q4VvrCvdXQQ5c7hpROoT0a2+EURHsDDPuyPrBemHySBAfIfOqF8/bfx+zqeM0dwLbIhH3xsXbVBwd9vfoapuj5gzbefI9sFAGvnyvvTamiziajt1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k/WzX6y+rA03PKLqNhSRI+3Q7e+oA0lAORvp3bI2gY=;
 b=TadGvIGv1/46THa+BpcOjC2PJW1a5zBe1+uM+IjPuGcg/Q9ViU3fVrUjCq+ouM4xqNQnE4HxghM/Xv0p/PY50b/gWf4So0aIqMgo0URP140/nchMsBJ+HGvU+iqEtvlaAP/7uUtQKVq48kkzdOPog1bobuBttnhq40u5Fn8r5RDMC5cmGZ7BOGdLqpUXyXD6RZoezUhSWBpMfAGCZ8u++DrycM9hPI/hNAXvsyoictRct7hlOa0pVObWvqh03IojDmMaUcKeDTQr0OAYn4Zsi1eZzP6roJBbOWHFq45ea9995iTKiHacJ7mdlB5KeDcBtF4rUiMoTduUquXxEifYFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:18:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 17:18:47 +0000
Message-ID: <89db73a5-8a89-4ceb-b9d5-679ab78f263b@nvidia.com>
Date: Tue, 30 Sep 2025 13:18:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] nova-core: bitfield: Add support for different
 storage widths
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-3-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250930144537.3559207-3-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0330.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7272bf-83bf-494e-7b8d-08de00456a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk84cXRSOVJqM0pwbGNwUFUyN25Hc0NYcHYzQ1BBSzJaVzljNVBBK21Hclht?=
 =?utf-8?B?TVhhS2RVS01wUmtTa1lPZDNlYko1SkYvbjcxOXRUSDd1MkhKLzlUU0tUOTdy?=
 =?utf-8?B?V2piWEpqb2JXUFBvdkhSV0NuWkR5WEJJVnN5M0JJNFR2eXVmM0VWZDZ4MXVn?=
 =?utf-8?B?OE02OUJRVFRjdXRpOTk2aWNFNkdOMk81TkhBNWlqbVVmM1p2cWYzUEhQeElz?=
 =?utf-8?B?QlNzc2VFdnc0anNxbVBqL1p4d0NFRDN4WTJCTVV0ZUlYSVNiRHZEM1dvUnht?=
 =?utf-8?B?dGl1Z2RqNFlyWmYrK0hxN1dia1lUcmR6bDc5L1RpaGY5SG55TzA1WmZXM1pF?=
 =?utf-8?B?UWwrNUs0Z3QrZXc5YXN2VWlqL2NCVE1NcGZzVzRnbjRzUFhrWm5CMmp3RUZ5?=
 =?utf-8?B?aGlQMmFrRUdQcXY1RFNINm1hTDhWTnZYQmNzWVJ5UjZGb1Z5TExUOE8vblBV?=
 =?utf-8?B?OGhjVGQ1bjNjSlZ3cnh2YlpYSnJFaXVFc05BUVBHcUszdklTcitCeVBITGNI?=
 =?utf-8?B?MWxyODZJRUV0WTFXQXI4SFd1ZHNjbEN2WnBsVC9Xd3YrQm1uUGdpVzZZZWU2?=
 =?utf-8?B?ZTNqRDlLZXdFN2tzYjZHQjk5ejk0bzVPVmloVlZ2L2VtQ2MzeU9lUFpxQjBv?=
 =?utf-8?B?aktFUDNWeUk4dEczRUlTQ2N4RW16S1ZuT2RsZVhkQVhkWWdRbEswbVhFWUlJ?=
 =?utf-8?B?bEdlV0tqblJXdU9HVkVOQTB4czlNZkVtZnhTOExkcE9jc0N5czVRanJIUDU5?=
 =?utf-8?B?cE1ocnVUMlBQUGJZZlptcGgxSDI1WFBQbW1EVk5uSk9FNjRxdEVMME42TWtY?=
 =?utf-8?B?V1EyYTRuTmRROXYxTDFvQm5pZ014V1lNRU9YUVdDMGtSTG1GQ2dKamt6K215?=
 =?utf-8?B?MzRXWktSS0dRVG1iazQvR2xvNWFRc1FRd08vZ0V4VENLSjBtckx3TG1HaVFN?=
 =?utf-8?B?MTFtcldJUjRmWGJFM25JRFN3MFdwZVphd0sxdFNOYXVFRG5FeHBQc0FaQjg5?=
 =?utf-8?B?RjZWbmFhYkZOY1RPYlpvNGZoRlNMZVpzelRFRGF5aUUvNDhLRmZMTUJxRjdN?=
 =?utf-8?B?U216d2xhRFR0NWczMXdRSVJRd3BHQjlKYXlueS9RMjRkTUJIYXZGc0VIdGxS?=
 =?utf-8?B?Z05CZXo3WHdkemFFZWtqMEJaVHBsbmZGeE8wVWN6U0ZCMEszd3JkRTc3SG5x?=
 =?utf-8?B?S0Z3S2NVQ2RmbCttK3JpdHBWYnYyK3djY25rdFlvaHJheGRKOEdmcGZUc0xW?=
 =?utf-8?B?Q0M5akNpRktOWnpzRHNZeHVGenVDNXFBZkltOU5OWWk2dHpBamRVakZZRUlW?=
 =?utf-8?B?WjZXbXpxd2N6WFFHNytkT0YyVVFIUDdldTdrVEt4VXFnM0dBV0kvQmw2bGhk?=
 =?utf-8?B?Yzg3NVhBVGVYWUhmdm5memZQUytsMWJLOFk2S0YvVEFMNU1MdjloYytUbGQ2?=
 =?utf-8?B?SklBNXRobXg1cnczMk5CVURpV1NkdEYyTm9LVk5FQ0E5V2xtSHo1SDBaV3I2?=
 =?utf-8?B?WFF6ajd4cU9HREVReEx4Vk52WU9UK1hGUStUQlR5dGZwZ1puRVU3MXJOb3Y0?=
 =?utf-8?B?ZEU5SmF1T2N6MFJzdGJGQlFkcnR1TWFTeHpMQitSSjVHVWNLdWhoc29tYlUx?=
 =?utf-8?B?NnVrNVZKcjJiZDdmT1dkV05SUm9mdHp4Q2szMC9iUVdCRmxabFpzSlE2VDFp?=
 =?utf-8?B?b0FlQjRKSFVPMC9YUEk5NktDSHRDZkxNcDFpYzFXb1pzU0hlTjVzMGFrbi8y?=
 =?utf-8?B?UDR6eWgyd296YVhnZlZBSWs2MzRieXFFU1VXUjQ3WVpMTjZYR0tRc0NmQTYv?=
 =?utf-8?B?TndWc0VXVWVTdUx4R1AzelFuUVlDYVF1NDdIVC94MXJTVnFtSUc4N1NrR0M2?=
 =?utf-8?B?b1VvVjd4YURXNEhTdVBydklwVHpGUjlzb3d2NjFmZytOWW5panJzZ3hCOVdk?=
 =?utf-8?Q?sWAeKT9j/R0ZLQoalgmfwV1PpOrgqbjA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxBMGx2d1dDWm9KeVcvRDZZQXVnd2ZkMFNVMlB6aGZnenhUYWJPL1JTQkE3?=
 =?utf-8?B?MjlvOGwzUVJMcWVRckJTeXhPaW1vb0FEV0F2RjZtaHVKUFo3U216TUVqVDN4?=
 =?utf-8?B?K3FtSlViT243YWpMSnZrTEhMbEk4UWhuSmtZQ21KS1cvTHNPaGFCcjZLWUlC?=
 =?utf-8?B?N0JsREhrQ0F4NldiL3dnWFNSbGZKUFE4UjVJVGRNMXRaZmxSTHlzQ2lxdUI0?=
 =?utf-8?B?cm9IbTJjSENtYzh2dDNkV3UwV2ZHSzJ2QVE1ZVJKdlVjekxYcVhYRXQ2c3Vq?=
 =?utf-8?B?TmxOQUJpeDhVMVVOL09qUmE1czZ0S1Z4Y0dhcjhDRUVtTHJVR3NiWnJ0ZlJM?=
 =?utf-8?B?QmxtM2t4YU5TaVh6NGFucEpiUFRXdjNxV0REcHEyY1Bkc255Rks5ZlRYTXdW?=
 =?utf-8?B?N0Q4TkxqTUhpaEU1WTMrd1NjUTFXeGVNY0pwSktqdVNPYjZyY0FoandDc2JP?=
 =?utf-8?B?aHcwRkFxTndsUmlQVDc5S2k0K2R4SVFZN09jWkpEYStsOGtvL0JSakxDSnVS?=
 =?utf-8?B?ZWtwWGtjQ29oclR6QmtlOVZTdVBSTnY0a0ZwT0tpclg0VDlyK3FENXpXSWlG?=
 =?utf-8?B?OHNjT1ZkakdBREgrd2VWeEpycWo0U0tPZlN2ZHdvY2ErdHZXR2F4akhsc0pS?=
 =?utf-8?B?WGFLOWEwTW4yQ3lLT1NoVTlnVTYvVVdlNlY2QUtaekwwVkNmdHFFV1grZTk2?=
 =?utf-8?B?elVDdmp1bkNldXBuM0c2ODZZd0Z3UEt5SlhTQnNDWXdVM2pKUWpucHovVW5C?=
 =?utf-8?B?MGx2SHlRZVdEbWhkTXgwNFZ3K0txWFI1dUI1WmdVZVVrZm5ZYmluRFYrNWJ1?=
 =?utf-8?B?ZVYwMTdmU2xscEhhZGxjU3FjZXpLa1haNFRlWkxKckt1RTNZQmt6L3Z2WjQy?=
 =?utf-8?B?QzRuZEsyWWxNbnFjTkxmZWMxQ0UzYWdaZExQc1FrT2R6S3ViTDVkbG5tU2Vq?=
 =?utf-8?B?MStKVWZ3MjFqTWVNVTZMNFlQY29JQ05LbE0vemxlclhsVDQ2KzVhNXNNMHdE?=
 =?utf-8?B?Nyt4VXNFNFYvanFhbUhFOVZCNVJCUHZYc08razJDRTh3bW1JTjNHZkNobTYr?=
 =?utf-8?B?b3M4TjlubVBqYStDRGhyeHQ5b1UyZndZSUFVOWkrRTk0a2ZTQ3Ewd1hUNkRF?=
 =?utf-8?B?K0VyUWd1eFg3SUxycHdwdWg2cW1oVGRyNXRaUU5BQkNlTjN5R1ZwcUZiajVx?=
 =?utf-8?B?Mi81dkdOdWU0OGpWaVZxWGw0SS9XSFk3T1ZVTmpPZ2ZuUG1Id1djUEpWU3VR?=
 =?utf-8?B?NjlqYldOWHVwdzhwbjNjM2V5Z2U1VEQza1pWdVBvZmNJNzhHL2FYdnZvOGI2?=
 =?utf-8?B?a0tnYk5JQS83UDdMc0hGc1paeU14NUVLK1pBN1ZIdTNsd25tS0VTZW13UTMx?=
 =?utf-8?B?bGpBaTU0RHgxdnRLT1pUTDJDZVVnTXlKZStpRWVmdnhCUm5qMi82NkRtanZ5?=
 =?utf-8?B?NzNoZENQRzBpTFJ5S09icXZkaVlWbGkxQ0JONG9aUm1zN0R0dnNLVWRSR1hw?=
 =?utf-8?B?OHpIQlJ3bkVEamJFYTBrN2VQYkxYbHlFY1JtU0tnMS9tT0ZCS3V4OGM1Ynk0?=
 =?utf-8?B?cWdZaytyUUdDdjYzL0pSdzVkaXhCMUNXc2pvWTFpY2NYa3pVNE1id2dSQlpy?=
 =?utf-8?B?cE11MjJPS3VDRzhEeFhvREhtaStRM2xscmR0WWRiZytQSFJwL3hpQk9KK2hm?=
 =?utf-8?B?cldXaTVLS2lJTC91NVFSLy9RemlRUkZnL3daTXFlUDlLdjlETjJZSGE3eXZ4?=
 =?utf-8?B?dGNFZUNIakM5L0xoNnpabHgzMEZBWThmUGYzaFFQcHJxUmtxdjU1U0tZYjBp?=
 =?utf-8?B?T3R0R0xvUmEwcWh0Ky95bkVrNUhGM2RUcnU1SlJkelo3bzVwY3N6ZDkrVHYy?=
 =?utf-8?B?ZG5QSk9jNHc0RkxFaS91V3Axak5oVE9rcXRqSDJEWkU0bmZsZHFwOVdLVzFN?=
 =?utf-8?B?WVhucDErSVluQnpDaUJWcTdJdncyVk5MZ1RHZ0h5cGtoaUMvMnd5bUdrZnVl?=
 =?utf-8?B?MW9FT3dZK2s4aE5ad2hqdHZ0TklOOEFyb2szVXhCQU5QRUtjQzkxb1dNa0Y4?=
 =?utf-8?B?R2J2UmozWTIzMENGTnVvb1pKLzZGUnl2Z2cwbUdxVXZwMU9hM25EZU1wd0tz?=
 =?utf-8?Q?Yv02/3uL6TSRgykIX6sy5n6Tz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7272bf-83bf-494e-7b8d-08de00456a4c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 17:18:47.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owv9vmhuDFVWIN2R7ZiGNcchSgg2GVV4JBRQq9FcttF5dJJvcQQY3I+nV9sDbIWgTfG6NP4hHNYwMq8ZwlpKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
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



On 9/30/2025 10:45 AM, Joel Fernandes wrote:
> Previously, bitfields were hardcoded to use u32 as the underlying
> storage type.  Add support for different storage types (u8, u16, u32,
> u64) to the bitfield macro.
> 
> New syntax is: struct Name: <type ex., u32> { ... }

Apologies for not updating this commit message, the syntax is:

struct Name(<type ex., u32>) { ... }

thanks,

 - Joel
