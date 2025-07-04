Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96FAF8958
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E5510E961;
	Fri,  4 Jul 2025 07:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g7uyqVwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3290110E95E;
 Fri,  4 Jul 2025 07:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au2T3N7TKccYdSbDOpiTYr2m7Gp72tBGklV6X4RM8Dcv7JOGfiEimwGq9REotrQGUocLNh1LjfIHkxeS2QpqJ2bwhLq4+iI5S8r0Bx8CCIlcrNGFsB1ECq9wQtfJE67STJRDn3FYu7jabLxYlAdS5fTAOf9ffP7RnJZW8mwB+TxPWu/PKjRqkyelp5ZD80wQHdqQpDhJwQTaL4FpFTcrMOzpDETBhPiOIOklAEd8JQPWOiOypM6WBW5Z/fEbwk2O/9o2UM6Z1gTNSWowg8SiPhPa/D7FfDza+yitO7VT0Bqzh6BeKDJnDsLHep2+CtZPHP+i6b7RpjNB4ccManjfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDK0ReS99styVuTW1lfR0Gr3NWnT/xFFyJHxnj+7STE=;
 b=f5LaPicNA2MRy45Ka2/tiBVtMowMy4MfA8XBxyWdKrwS5GYivNtCNJPWRDcOekI+SStzMH1y88XM0thyvh/g5sjoYJH2sbcpIhMg70+D+FqPz6CNypdxVSbEVjdtpFTZDIxo0NasiGoqBE1YGXYXgjLjdKvBXS73i0TB2TevwrEMMT+zUP9UKqVwVV9KG6L1UEGI1q3dyQZh58c2AGil5Y6kpNMDlN4OUis0pmsW1RnDZuyQ0Z0GaUKUck2W1GvbaDXS1JQT9/NsbKh28t9cBXFgRXRWC1fw08/ypBhfqdtnBG2+N3ItLf6VrAcmgPViUqeayRrWNbU6+34g8X2L4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDK0ReS99styVuTW1lfR0Gr3NWnT/xFFyJHxnj+7STE=;
 b=g7uyqVwzQGsgFARQZPUjltdtuNYQ2GjsHansrYq5ZjazoXgU2bJDJAj0Uy5aZ6EEfLv2Q3b97Iin00FbyTQ0YDvwF9fSJSoEftKZYhpEgk1JI2kEi3sptmVtZGyh2l7xFY65fxfaQKEKISGE2nLXhZye9VXnGuor+SLweWWXjIVAp70oJxJgeYG/6N8UGzV1SPayYN0VHJvRQAVwnFkUJ7+Vi7Ur8T3U0OcnOGQ+O9pbkDCJgoBhchJFgf6RXDMMe140f3A2QscWaEu+zRYVfISKAL5O1MiAZQFO5JwIsRdybbx1hqzIl4dUEleK8mlfephTV8DFryFirZ4xBx/qNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:14 +0900
Subject: [PATCH 13/18] gpu: nova-core: register: use #[inline(always)] for
 all methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-13-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af56920-d33b-4e39-9416-08ddbacc0a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBKT2xUVFgzZUEzMy91cUlHL29sV3M2c3NweVZJQ2MrbmNqdXFRVTA4RnZ0?=
 =?utf-8?B?R2ZpclhheVllWkt0RTZYZ3oyampYVWVqUldkc0ZlWnNUZWM4SmVCdXhuZHVE?=
 =?utf-8?B?ZEROMGg4OThOZ2REcHQ0cTV1eEtBa0xvYmY3TVczdG5ITWh2YnhiWllYYm9I?=
 =?utf-8?B?bEQ0bDByZnk2REw5WXFCWjMyajczeGFCU0FSNTZiN2QvZEdXUlpCZStLUGFa?=
 =?utf-8?B?N3ZmVkNpU3p2NjVRMVhER0gwaDlEL2JoSjZ1d1djYWxjWGxhVjV0aDFwNWNN?=
 =?utf-8?B?ZW9RczhFTk9odFdiOWpxSis1c05FOGh2SHNhc3BUUVdHRk0vcER3Tm02ZzJL?=
 =?utf-8?B?OXVlQWZGS2QyN2JSRXRZRERxUHlna1VyTnJQL1FncWZkdWlQdlNncXZqQkha?=
 =?utf-8?B?MzNRNjhZWDNVVU5vZEl2VldqMUxvZ2ZKSDd2ZENTa2g0MkR0T2VPSjh2N1Fn?=
 =?utf-8?B?NXlPUWYwN2t6aDRrdGx0STFhbFRncjl5OGlrVE11WUVBMjZBTTRvRFJ5OEZv?=
 =?utf-8?B?M1UzdFhYcFR3SVhLS0FxZWlmK0t0SWQ2TFNOY2xraGFyTGpYNFZjUHZRNGk0?=
 =?utf-8?B?NlZqQ04zUk16Vklhb3oxT1ZNSEJMMm42WXJJUmpvQk12K0tKNWZNc0lOc21G?=
 =?utf-8?B?a0RjYXBOd0JKMk5tdzVsQkxYNVllNUZRRG5URll0V1AvK0paN0tjWHc5VzdE?=
 =?utf-8?B?ZS9HMzYwMlZURTFFWEdOUUdmNWJRVjZBdlFhelROVVlpN0hsUWJxbEhtN3A5?=
 =?utf-8?B?WnlKUkp4RFBNZitVSy9HUVg5cXZPbWhkcFptQ3d0MGJnY3MyQ3dQNURhTWJN?=
 =?utf-8?B?VnAxWEFCL204VEJjSWl2U2tDMDZpTTlHYzRlSCtOeE1aK0NGV2VNZUZNaDgx?=
 =?utf-8?B?czRPT3BFYTRUZXdHVTJFSy9WN3FzNStqU0R5K21tSy9Hd21reE9sc1pUUlJ6?=
 =?utf-8?B?OSthMmZQV0VxN3BhQ0JUTUNqTzdpcU0vWnZudnEvQm4yNWVUT0VzV3RSRUR2?=
 =?utf-8?B?bm5OWmljcm95NkZ1bEYwN0VrN3Q3T1BxOGxpdjZ2V0VUZk12aVg3MUZibVhR?=
 =?utf-8?B?OC9kUS9UTkZUMGF3amFzM0tBdllDMDhDTjNsdy9ZNkpFVkcxSklmQW95N3A3?=
 =?utf-8?B?ZUt3U3JOeVEvWG9idEpWd3JnOTZSTDBpNU5Vc1NWUDU5SDRXZzI3UjNkbk9I?=
 =?utf-8?B?UDROVlkvL01JeTFtN2lWNzBVWFlGT2VUMEpTVWFHVkFYdDVtL2htUkpSbERM?=
 =?utf-8?B?K2RoOXc2Y3MrZkNGbHRidVdsUUxXKy9WOGNnVDZWSW1BYWkxMDNCSXFsWkw2?=
 =?utf-8?B?VFNXRkJkYmpxUk9iby9hK1VzTlJld2J6OUlRUGJzU2tzbTBOSGJTdW1nT1hF?=
 =?utf-8?B?TTN6cUlOcDh6WCtuQ3FmR3o4UlBNR1poZGRPMFZTbkpId3RYU0h5cGJVZERk?=
 =?utf-8?B?WkRzaUorVmZrNGNiTHVCdlppVGgwbkVTcGwxazlWRytNQXBTekZyYmt6cnh0?=
 =?utf-8?B?YXVmR1ROcW9FSkR5NkRuejJ6dGNndmRVbFlTbHV0NXF5MzJ2VmdsU1ZBTGx4?=
 =?utf-8?B?SDR3SE5UT0ptZTNYNnU0R3BGcFZjQ2hsY2ZFekhzN1NGTEhzVUVyalBXRUw3?=
 =?utf-8?B?WHV2bzBmQ0h2bE5ML3RHMjNweUQ0cGxiYUdLV21HZUVvU2FuME9aTk01eWJp?=
 =?utf-8?B?WTBJbkY4bjZSa3pEQlM5eGp4ckZhNWsvcEdVK2wwMWs5S3dKSm50QUVpRUQr?=
 =?utf-8?B?dzBMUkN4a2J4dy9uNVI0YU41aG9yMmdCQU84THBoMnVCMTBGWGtpdXpYVGcr?=
 =?utf-8?B?dWx2dnRWZktzekhlWFRUaVZ5L3VqQi82UVVzRldKb3hBUThaTHJCUDB4L0ZI?=
 =?utf-8?B?a3NwODIwK1FXZXRDRWVpZ3gyOWNZWmNVSGlMdFh4ZHJhdEp6cFF2ZjFrOU43?=
 =?utf-8?Q?ocOQjOaf/5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RBUWI1Mnl1ZVBPaTgxMDE1bE85WDY3THlTVjJEVjhKYjBwY2hFdUZQYkFy?=
 =?utf-8?B?TGdUOFk0eklLQ3ZNU2RaTTd3emxrb3l3SWNaZ0lMOGJvN2Z6MytMYVRoM1Zk?=
 =?utf-8?B?dk1CUkg4TGpuaE5TQ2pnK0wzaERhZG41L1dKY3hnOVJLQUNxayt5MU1sVG1o?=
 =?utf-8?B?TTFGOGFpQ1JncTcwZlIrTzZxL09qbVdwZHZ3MzRLSS8yR2JoWlVkTWhXUlF6?=
 =?utf-8?B?L095QXVTbDd5eHU2Ym1wYjJ6TEthUytCdUlmTjhFWFljNFZNUFRueFJYZXBw?=
 =?utf-8?B?b1N3b05qdWdJZHdzekY0K0lCR2JhWDJYM1VwMWpsd0RQMkdNc3ZWUFJxRldS?=
 =?utf-8?B?V3NzRWxmUXJ3TXY4ZmhWNmFkUSt4VG9UTWl2dU1UNlVqRGZIdUFoY01uUWEw?=
 =?utf-8?B?ZlRrd08yeU9ncGpEbE40VlZZSjJyTFdZR0dZbVFBcVpCN1RIcjRpZ2Nya0J2?=
 =?utf-8?B?WXhqeEdMMnM4V25VNnNIOWhUTXhSaGxKUlMvRk9tYmpaSHRKd0FueUJpaU9a?=
 =?utf-8?B?Q1dibWRlTmlYcWVHdkJoakxScXV1Y05KNXVFaGJPQ2dHdml0YXA1Z3pidWVs?=
 =?utf-8?B?RGN4S0MydTJwdG56dWpKSFQ0NDNxMy9nYmxrRzBrUERZZ3RJb0IyZ3hsYWls?=
 =?utf-8?B?UUNHMWpMUFRacEkvUm9pQjNwc3lxMHZqdCtXK2ZXWTRNQXorYm1TdWNPQzl5?=
 =?utf-8?B?SDdmMVVJMExyRnlZdUFrRHNwbXVqbHJ4cXpuS1hmaTc4b2FmeTdsRjl4UGFZ?=
 =?utf-8?B?Q1RaQm14S0UzVDFpTFZRZCtUdzRlazhVMG14bTJmRzNBUUNiRUJ5L0l5SkNt?=
 =?utf-8?B?YmFwSXd3Wk5QRUl0VlRUOUVYbEpGUngwM3BOQm5pUWRiYW5lakhnenk3UWtM?=
 =?utf-8?B?Y1c0Rm9uSjRzMjBxNHB1ZllrWUFCYWV2R0VkUDM5aVVFZHBNSjcrY0pia0pC?=
 =?utf-8?B?UHp3Mk45VDFFT09nTEc4LzRKZVRDaTFRK3pXcytwQ1FFbmF1UlE2UmRwWkVv?=
 =?utf-8?B?OVhBQVJNbklDUWpEbzZXVEp6UDNPUFNxSUp0Z3gvTzBCRUNwZzYwTEswQUVq?=
 =?utf-8?B?L0xWa2Q2Rm5XZDVZRjdiZHNIdzFYVncvdEgySzVySG1PeVlrdFpYcWFrYnRp?=
 =?utf-8?B?dkhWS0tMNVQ1dUlxcWtZMmRURkpCbVpqTmp3Ui9Rb0NHZVdWNUMrVWU0K1ll?=
 =?utf-8?B?YU9UTmRnZUx6c3dLOEVqSnNXWlRzTkp1VTl3WWxBcEMyOEUvWUpQYVVCMHhM?=
 =?utf-8?B?bFQreGFZdUlFN1g1UU9BaG54VmFxbEQvRWxSNWVnMGVPMUlrMkUxSTlzQnJ4?=
 =?utf-8?B?ZlRwUGMrYml6V0JZc24zd0twWk5yNGl3T2d0R1ZZb1lHQjROZTY3UHpnaEdU?=
 =?utf-8?B?TGtldDVpZFd1dFdCWDJnUmhidXBCY2UwZVJwd2pXUnk5UVlwRUx2WDZhSDJL?=
 =?utf-8?B?aUM3M2N1K2cza0NnM1lOUTNzeURrNGpRTGd0cEZkMGZxWFJFY1VjMWRpa0xy?=
 =?utf-8?B?L1BMd3lYUDByUEhWRWN5OCtHOEw1Z0lyVGlFWm9ScEt5ODNpMC9oYTErTVpF?=
 =?utf-8?B?Ty9MZm1hV3dHVHV6K05HeUFmQ29RcUJaNElwcVU0bzlhZXZDZHdiSDdGNHN1?=
 =?utf-8?B?a3g1OFVSSUxFWlV3WTRyNmVDMzhac3lIOHdSSGhkUGF1UWx3cWdXYy9Ydzg4?=
 =?utf-8?B?WkZPbUJHeExmWVozRWpQcHk4Y1R1eXRWaDJkRVV1eHlLNG5GaWs2alJYVmRz?=
 =?utf-8?B?NkdQeEQ4dzBnLytYQ2s0Um5XMDI3aHJSYWRiYTJXWHNNcEVnQVJMbHhESWQz?=
 =?utf-8?B?OWttZng4T2dIME1IaURUbmJVTlh2d1orYSt4QlhnZjd6dW90UWJsRXhvckpw?=
 =?utf-8?B?QUhJTlQ1VGF4VlZQL1kxR1Q1aldYQ21HL0VpUDZWbkgyWTZJdHVwenk2ZkM4?=
 =?utf-8?B?cks1cjBpRFAwQis5VzJaRWF5NVJodHJSZFNCWFA4QkJuZlFaRU9QdTh5blVH?=
 =?utf-8?B?cjhvZXpRZ1JEZElmN3VIL2gydUhYRzNwMXdLVEdnT2dRMy80bHNyYUF6YzN5?=
 =?utf-8?B?QlkxQTQvRS85SHlYSUNDbEtiTFdicHh0YzBvWDQ2SHVLK1ovaUJLTEdXSG5a?=
 =?utf-8?B?bGd0ckVjKzJ6a0RGTzRTYk8vdWc0RTdjZUp4cFR6SytWK0dMN3FBWFl0b3ZQ?=
 =?utf-8?Q?sVGgkl/IIFBTH/KPX19hHxDFQeN+Rwnpuci+0VT78YRa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af56920-d33b-4e39-9416-08ddbacc0a6c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:06.8836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVdoYrvCpcBxcVGLMk6OfuZXVi7PnH1eI3riqLkSAkwETaIevAW3T5Gziu7U7VGXyDht599wyyHTeQbmi73M4w==
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

These methods should always be inlined, so use the strongest compiler
hint that exists to maximize the chance they will indeed be.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 1b2074e38381f9918c48691301e5a6f62861501f..316b67ee1cea7c7fa2894c1778e7d43f853bdb19 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -280,7 +280,7 @@ impl $name {
         #[doc="Returns the value of this field:"]
         #[doc=$comment]
         )?
-        #[inline]
+        #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: u32 = $name::[<$field:upper _MASK>];
@@ -296,7 +296,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc="Sets the value of this field:"]
         #[doc=$comment]
         )?
-        #[inline]
+        #[inline(always)]
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -348,7 +348,7 @@ impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
             /// Read the register from its address in `io`.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
@@ -356,7 +356,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
             }
 
             /// Write the value contained in `self` to the register address in `io`.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
@@ -365,7 +365,7 @@ pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
 
             /// Read the register from its address in `io` and run `f` on its value to obtain a new
             /// value to write back.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,
                 f: F,
@@ -385,7 +385,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn read<const SIZE: usize, T>(
                 io: &T,
                 base: usize,
@@ -395,7 +395,7 @@ pub(crate) fn read<const SIZE: usize, T>(
                 Self(io.read32(base + $offset))
             }
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn write<const SIZE: usize, T>(
                 self,
                 io: &T,
@@ -406,7 +406,7 @@ pub(crate) fn write<const SIZE: usize, T>(
                 io.write32(self.0, base + $offset)
             }
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,
                 base: usize,

-- 
2.50.0

