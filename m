Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E7AF8944
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7508D10E940;
	Fri,  4 Jul 2025 07:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RHCTXt9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A3A10E94C;
 Fri,  4 Jul 2025 07:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euVf1jX4O2/Arqj8Knui8bHecVt+ZsFrULSg02X6+CbUlBo51+YYSt0rkqh88X2f1TmIho+9KQ+Yfo9bq0petZis4ZPsTmXuyjzX1eq6HyzR8yCSpvAtjV4Db9N++HdSWjKsQFE3q+8G/7A5n25os7sCwDM+gjcE1+JoQ7fd5P8IW99Sfzw1dXZfzwpHMhy+lUO0RsXV3PDw+zhKbIveHRwLruUAcsPx6YgcwfhCtYX77ZlJan33h+IFy8SL71awYpHEJ+cCyCkC6Wd26K7D907DC1sgO71QFb4HS0G84ZIk3ctSsc7l0qYzXVlPZcGmRJrURAm8HZIc9mUsQrOoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyvM4UAicXqOy0i9M2VFXn2R3JNkcbOn0sM/1JGxdOM=;
 b=Fh2TpdVdxzREbd1ZYGBeSpIYmRtQ0io6jIBZJ9DxOWjaZlHZ9VTkaMs2+N89g9VwVr94U8BnDFjXWPxZh9IvBK6szLnL/GuCQIl8EBx30F4JbuyFMca+HavUp7PB9M4cwyq2/bikA7kxk++YkH/zW50ryyA0i+WMWogNW1yQw7tLBcvN/D17yWFr+OKiob6K1pn3z8CO6KJhaWuJtVzK9cTC9y0Pfcnr5q5vtFycQSZeryZdsvlHGrZ6l4bG83e4guGJAcZdPp/puNIpl05BcWq58xt80+ckMrzlOIeEZgw8d5OCQ/KRbUBcq3O0MI62Jzf+lhrPd7Y3MM6pSpw9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyvM4UAicXqOy0i9M2VFXn2R3JNkcbOn0sM/1JGxdOM=;
 b=RHCTXt9Oakxjaq/LwsHJZPAA/Lf+EEjs1KMwjcwTj9+HWsRf517zpB4v6YiPCaJvcSZBLktvPmOcb8kVd5x86JlgEILFOA7dOHxk851OVJ+O0OB8vbV88IPgu28GMB+7XWdwARPOtGqRhQ0ILIAlWfuWRpC7wtzyEpxCY/VVpFgjDWFA2V+eSv7NCHrXrChNR1lq9wQkbYQfOJNbhxyFkvarvXefh5+RTFdBvz4EihuU9lUntobQjDjf5/uRKbSHNQthYjwfV1nqSRKNojpHfWrYPxPL7t5N1ViGG2+BON7+IcmbzQ7jtXf0MEj1zv64vh5wzi56iORqEKIZ8AEvPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:05 +0900
Subject: [PATCH 04/18] gpu: nova-core: register: simplify @leaf_accessor rule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-4-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6bcf4d-e6a4-4125-7340-08ddbacbf860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXl5REhXeGtDSUc1b2JQYW5DSG1WdjgzN2lGVVpIbHpHeFJ0SnROSE9pRFk4?=
 =?utf-8?B?ZmNoaEZ6UUorN042NEFnUExvT2VScHA0aXFOYXdoZkg4Qk1IWlpSMVlscUE4?=
 =?utf-8?B?NldTYkhsc3o4YjJ5SU9YQjFIVjZSV28xRlJVY2doS0F6dTdXT3E5SmhIdmZB?=
 =?utf-8?B?VUJ5d0FNOWdCeUIzNDBVSVVZbnpMMXZWZGdVOXc4L0ZiNHNjMTNibWlQbTI2?=
 =?utf-8?B?VlZsUFFick5IODE5WWFtV21hNUpOSDRtTnRXeWJsb0dZYld5WEtEM01qbTly?=
 =?utf-8?B?eEk1aytwbG1QaHRjeGFhL3VLenhwYi9UREU1M3VCUW1yWFQyRk5MS1NJdXZm?=
 =?utf-8?B?V2ptaTFaQ09tKzFwOU0zRWs5d2NKcFlFOHVVbUhjSk9lU1FWeDFwSERrNEkz?=
 =?utf-8?B?S2UxdWYyQ2g0czUwaWlseTY2Wk1QY2prNTJsNVZHbWs0eldCeVJMcDJyQVBC?=
 =?utf-8?B?VGFiNjdZSjBIOHExT1ZSOW1ubVRRWlVaS1hwT0pISlNJMFlIZ3dxWGZ4RjFR?=
 =?utf-8?B?WDY5Q29CSTBPcDZQc0hBa1JyWXZsNi84cURzamp5aHdaMDhrY3hNMkJWRWhY?=
 =?utf-8?B?UExtalhrN2wzdFF6WWd4aCtqNGxBLzM2Vm52cm5SWUpEaFVpV1cxSFczUGdX?=
 =?utf-8?B?Qnd5aCtzdkptcHRveS9EYUdOWDgyYWoybzlnZkE1ODAyT3dhczI0dEkzaGxt?=
 =?utf-8?B?WlIxRkhGU2V0UVB4ZlRtaGhUVzNnNHNSRk9GeDdQdGhHV2ppc0oyM3ZJMU13?=
 =?utf-8?B?WTJOU3VQVXBkS3ZWRlB5ck9rZWp2WGhqZVJNYlNzbWIrYnZBOFNVRWZBN1lB?=
 =?utf-8?B?OG9TUzhYWmpZcnVNenVkYjI0OWhzZXZTS014ZzBZU21vMUdiZTZKczIrdzFr?=
 =?utf-8?B?Qks5VE93WmZ0ZHVsSHBPYXZsU0F2T0FVdXBka3ZmaWt1ZWNkdFhHVTAxQUZl?=
 =?utf-8?B?dkFGZHg5YzF3bUlVY3pOUlNna2h6azVNemFUc3gzM0kvZDM0eW9nbDl0ZUdJ?=
 =?utf-8?B?UFYzc0dKVG1zTEJac0taOXpuZ3BUb1FuM3UxbnlJbWZ3S0lpM2NWNmVkSFBj?=
 =?utf-8?B?RU1vSjlPWWwvUzhFaUFoNThEYmRNVHZqOFJYNXZFS1BQMFVTZUYrOG9kTGRy?=
 =?utf-8?B?VjMzbGxQdXduNitkWVlzNGR3M2ZIZURDZUdiT3BNRkovNDZPa2o3YlVCN1Jv?=
 =?utf-8?B?SjRRckJwa2ViWkJoNnE1K04zSHlnT0ptMW9pTFJGR2pKQURyWmFQYkxqZUJz?=
 =?utf-8?B?d1Jqb3BVQk9ldUxiaVQ4akR5bldUcXlNMHVkZFlZMFhKYXFHSlpTWFV2ckJB?=
 =?utf-8?B?S0diYmVDK0VwQkliREY4WjMwdDd2QVMyRmhhRU90REc5UHJaVG1XczEySjl2?=
 =?utf-8?B?ZXd4ak9ISjkzMXF1R0J1eXVBMjVsTG1LSUkwYklMcTlrdGhqR2dXNVZ0RzlZ?=
 =?utf-8?B?WXJFc3JBNlVyUUM2a0dET1BIQ1FsYW44UjZNQm9nRnhjaGpkTnZRTTl4RWFZ?=
 =?utf-8?B?SFJPQWtBRFJRbUFTTlFoSi92UUJJZXF0REZZNk04YWVuTDk0anM5OW5zc0lJ?=
 =?utf-8?B?b1Q5ZlVROWo4U3hzV1h4RHFma29paFc1VmZPVlJLaEpDZlJoQXZrSCtEUDhr?=
 =?utf-8?B?Qk9sWVZGS3ZaUGFDQU5jM1Z1VkFnclZMNzQydEFMeGF4aGhtL2N3UjB6a3l5?=
 =?utf-8?B?VzMvQ1ZkVytiTEdWemlmbnZiMEVYQW1VVVpsNXloYTg0U0s2aWJlTFJaaXpt?=
 =?utf-8?B?R2xvZGlnNnhDMGE3WE5UdWdNRy9JOEcyYTNzTHZTTWovS3EvaTRRM0g2SWNy?=
 =?utf-8?B?eEZvTG81V2VLU2J4emQ2TjlDT2FacllYSjNLMFZ4ZnZRQ1VreUVMdFh3cExQ?=
 =?utf-8?B?SmdWSk9NQmJMZ1RET0tTUWc3VUlXcm9CZGxkd1FmREt1V1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXd5NS9PTStRRzNvOGM4SDhVRHZyM3ZDdG5UOTZIM1NUWEpHZUJSMHgwd29y?=
 =?utf-8?B?V2J6TFR0Y3dOMEQ3OEFObHFRQ3l1OHd3MkJzN1pKOUR3aGZVK0FnTTgyRnh2?=
 =?utf-8?B?UjRkK1NjL0lLanlOV1h4cEtUeDNmazhNaHZsd29OUmdTMVlkOTU4TDVvK0I0?=
 =?utf-8?B?Rm03TU1SM0ZmdGpGMnhCSmhZWGRmdHNrTGJtSzAwbFIzTHEycUNERGZnYjQz?=
 =?utf-8?B?Q1Zud2g5Wk8xZnp1VjlVSE9ZYzA3ejVEaUJaSGZHRlo4NXIvY3p5VGxmQ2Z4?=
 =?utf-8?B?ZDBiTVB5YmJKbG9HVEgrSjlFem0ySHd0YzR2aTZ2N2VKMnFTemdBcUxOazFs?=
 =?utf-8?B?dC84YzhnR3Y3S0FLVEVvcy9aSkhsQ3VybUtkR0tGOG5aU3VrdGJFU2RBMVRY?=
 =?utf-8?B?RVNnQWFTK1YzcWVCR1hKWGQza3F3aUs0Z1lnUHhiSHMyM2JxUldPWDN1TkJk?=
 =?utf-8?B?elpCa29HZ2Y1TytLWVpObGJYNFNySmFGcURUNHByMFNVVlVqeHMvVnFIOHlV?=
 =?utf-8?B?djN0NFpuVk4rdTh0Z1ZsOGsrSkpoM09xZFpSd21UUjByYk4rclYyWVlVU3h6?=
 =?utf-8?B?UWVwcEZ0aUdyMnpFcHZWSXQzYjRIQklWVUZJVGpBTU9sVm40YkV5TXFUcHRi?=
 =?utf-8?B?SWRKMXZidjYvVlN5dlg5NjNlWjFyY2xua0pYaFl3dDRYUTZ2Z3k5aC9NMlNj?=
 =?utf-8?B?bC9NYXd1NDg1d1hqWW9idW5YOXlRWmh6dkhSVWRJSmxPOGs5ZFVhOUZ6Tzc5?=
 =?utf-8?B?dTIxVXhnVmx5cEpMZnVGMnh6N2o4dE14MDRuSDNkdG9JOWE3d0FYazg4WXBl?=
 =?utf-8?B?MkN0VUtsVktEWTJsQzlVaG1DYm51cEIxNHVVY1NXLytXOEs1ZTNjOWQxSUtn?=
 =?utf-8?B?MkNIZlJKdlhYZzVWQVMwSUJFbEJGcnRtbWM4UnBIKzlqaGZrNHJTV2pRYktT?=
 =?utf-8?B?Y3lsdWJZazZSeE5kMjk4bUFxSVkvTkJQanNOdGxabmFoc0lMQm12aEdsNE04?=
 =?utf-8?B?VXAxVjZQWitvcGNiejhvMmljcEtscThmWmdTMEtmN1pMVkdUNms4a1hxa3BF?=
 =?utf-8?B?eTZzUE5vUzVoSVMyREJRMHhNU0tyWmpZaGE1NU1MTkttakNvMmJ0V2ZobFVn?=
 =?utf-8?B?SXNtUU9vaVkwWVIxNTNYMlRQNzB2UzM4RFcwc1dEUURVUElxc3M3R2lTUlRX?=
 =?utf-8?B?aTZrejgwY3VDckVicVFwRTFvcEZGS0FGeEZwc0xrd3pQU3FTQll0L0pSZW9w?=
 =?utf-8?B?NmZDYzJpNzhOOTR2cnJXVllvemw5ZnBjWWNHVTlmdUU4MTU5cHN4ZU9vUXdT?=
 =?utf-8?B?K1hVRWVYTFJ3WWdqaWlxY1g0UmorenhDVWxxRDA4R1hzVW5mTG1wVGwvWG5T?=
 =?utf-8?B?S0NWZUZGdUJkSVRpekZCUHprM3NFVmdBTUFycDhpZGZXZnRqaDB6aEdHK0RQ?=
 =?utf-8?B?akpISkwyN1UzSmZKS3FONzhMQWJ6MGljbUpsRGFHV0FCRzFBL3ZwNzkyMXF1?=
 =?utf-8?B?Sk96NnJqcGVzMU8reWpoZnIvMEJ1RTV0aTFndm85T1RnQytGL3ZlNUJPVEoy?=
 =?utf-8?B?dUdDcTFmTUFpeU1mNUprOVZrcDUrOG1EcEpvTFQzbDUvRlhmbVZ4UTk0M3VO?=
 =?utf-8?B?RGxKZnhCWVZXUE94aGoxSXM3MHd5ZGJLazlvN0dWV3RnR2x1VmlYV2g2RC9X?=
 =?utf-8?B?VE1MTjM3OTRNS25PQmtmdFRJOFlCSDdnOFJ2UEFGamV3SWduTVNIM0IwS3J2?=
 =?utf-8?B?VnhPelFqM2xsSDNFcS9EWHZxczc2K2VMM0kxMWlseGhsalFTRnNTTU00U3NW?=
 =?utf-8?B?UkpvT2dJc3h3dmd3bTVuYzF2dW95SXQ4WTd1RVlEVGlNd1AvdFRwR3VNTHMv?=
 =?utf-8?B?cDdxQkx5NVRsZEVpY1djYUhSNGtjSHJmL3VjTGlPR2ZDak8xLzVzNWhxZXdO?=
 =?utf-8?B?WHFYdDNuNjZZSkdkU1RrcnNrUUViZDhxYUZqMDVZZE55Ly9YcHBQbUUrK3pH?=
 =?utf-8?B?bFNRRWs2YlFZM1poRERiYWVwckFteTJYcFB1eFpVTUlid1dRUUhZV011VkZU?=
 =?utf-8?B?cFB0dDdOSVYzdVRDSWdzMWtVeUU2REcvdCs4OXVaaW8ydElXMHlZbzl6ODZk?=
 =?utf-8?B?UVhDMVhtTUlZZklseGtQN0x0V1dzQkpFdFpvU2xOdG54NmE4RzJ5WjhZdnBi?=
 =?utf-8?Q?SzaMpsr6KomBTTsK0I3UvNw3sy8W9orS/YCBmG35A4wE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6bcf4d-e6a4-4125-7340-08ddbacbf860
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:36.7051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTs7io05T3d2Zdt1BGrnWL3JQ3E/c+5GBOyrmycypjdX8gG/t59LeTKWt+kf5tUXWPh1pF2zZ6vJsSWVdDg+bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

The `$type` metavariable is not used in the @leaf_accessor rule, so
remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 8a2001c07654cd6516b09be330e7a595695b365b..7d5cd45d3e787301acab0b4d8ce1002c2dd2cab2 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -230,7 +230,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(
-            @leaf_accessor $name $hi:$lo $field as bool
+            @leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
         );
@@ -248,7 +248,7 @@ impl $name {
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        register!(@leaf_accessor $name $hi:$lo $field as $type
+        register!(@leaf_accessor $name $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -262,7 +262,7 @@ impl $name {
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        register!(@leaf_accessor $name $hi:$lo $field as $type
+        register!(@leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -276,7 +276,7 @@ impl $name {
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(

-- 
2.50.0

