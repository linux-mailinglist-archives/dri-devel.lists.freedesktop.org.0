Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE61C24A4B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FC610EBB0;
	Fri, 31 Oct 2025 10:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rs7jJpYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDFC10EBB0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAkaWB1hz6AOo0AYz1RCMkdIqucIJKoz3xYyuDOEox84JLsCfCRloe3hrh7Zkm8F/NxlWxCKI+ZT1zmFJgTJVYS+XzrUAsoq7MpJ7I9uFAnuI+t9abtC5RMnnEBVG1CYcswJQbYq5rPKydqytQOAJAYDz2jRs3FoVAW0hqyNaxEst+8RCzHbLeNRoLyW5KDTcIk8Wnr3nuCNxLvhg2sQmsWO9CfERO1N2kavGoeAaEcONLMiL6YBocyWzSgOZmQl4Uq0DtDaZ4IYJhVbTNk1yzR3r6xeGwysm5FJy1di2JOYoo7hRUTXFoYkwgbsZu8uYkqOkHzkdB69p2bDAsd4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uabOSvmJdwt/Vl97plvI37QDI0VugSMyvyc+8pCkH0=;
 b=o36/haWKPt0Z+wME3XwpKBYD4lfNtLEUBPhKgtzzL1+6j2/16Xf4FB5d1SzOiPDaMwRPWCFoYt63/XXWswR7sXMo2pi7vDUSqtiz5TCaS1mY4wS88J5+JefRHjEBCf9/wNAu//IlFA32s8FTdl8kRkVMfRZhWmj+Ey9mm1TIcxolKFjDqOuk+zttioM/I1/3w8GXWZQtkHWKfiQPZS3JtVhE+IVj8Rn7oNlh7SUIW7qeqBa9o+7actCfZ38dveFseOn9EpgioWj4iZ4EuOInPYQB3ldLVrz6XIv7ve9t4Pohm8n/zv5fX6O8B5T2MnMV7110RVPhwN/gCVqd11XZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uabOSvmJdwt/Vl97plvI37QDI0VugSMyvyc+8pCkH0=;
 b=Rs7jJpYW/4yhi5zAn7kULH/Y0qf7v41Dm8rV3Cy0fzFI2HSoEoImIp9FBw/03Sfm20vXl3rt8bGzHFQm7QvqjOBv3j1o/S4MUgRTAKL5zFKAZYr5fVJQcT+PNMT2wv/i9x6JlMTqQeLxYbZyIVMQP0AQndwNYDU53AXg14nF6ktHkP/5NhbiAiZlotLbxUX40YrRtVZ8j1+FztrK/ftz4jLxH+wBIqi6FltPKQxOQwwU30xn+8byIZxxP32WLggfnyiQcszWP14ym5Wum+Hw+2UoC+SZjBa8pDefsedbffgJrdcWtpRU1b2wqhX7z1WvgXHnFlSreA0qAy2MOGvqUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:56:16 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:56:15 +0000
Message-ID: <80bc8cae-a91a-4bd4-abd7-f12f9af18eed@nvidia.com>
Date: Fri, 31 Oct 2025 10:56:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
 <yvzfp5igm2trom4kil337wfsyum75amvgmxkadi537dohmnbqy@wgbm3zxojldc>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <yvzfp5igm2trom4kil337wfsyum75amvgmxkadi537dohmnbqy@wgbm3zxojldc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3f9a97-8a25-4f89-8b51-08de186c1cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHU3YnZaY2NQU3Z2SlMvMEY3SkdrYjdDd1FVNE5INWtMcHBESHZCb081Rjha?=
 =?utf-8?B?eTVKS1JQdUhTWWUwQTRGaDRLUDk3UTdsVnVSWGNXTkdDTkxOMWt0bitpS2R5?=
 =?utf-8?B?SzhaMjlUWkVUVzVrcDhadWUyVkd0QjBUajRUK2ZyUTcwbjJmaThsS2dwT3po?=
 =?utf-8?B?RkpNNmNnR2MzbnRxM2doNGF5allPRXpxaEJRUHI3cjZ0Q0N0SU1RbHpEZzYw?=
 =?utf-8?B?bzQ4QWVmTGFOaWlQdUwzWW1Xa1BIYVVTcHlzRUc0OUVZQlZ4dkNSblhKTzNz?=
 =?utf-8?B?WnV0SDAxNWp3L1o2TndZc3JDazNXK2JWQmUzZ2tlcDNXcEE4TmRRZENCSnFR?=
 =?utf-8?B?Tm1iWXhpWURpQTl4UUozeFVnai9zdll2QnBQVVdhNldEL3puTkJHa25pNis2?=
 =?utf-8?B?dWk3TlRjVXMxUXora2VwUmtWblRleHhnL0tRVjlNMlloV0hvMWpWK0NQNVJn?=
 =?utf-8?B?aHVhK0E4VDl4ZEtNMXAzOVB6U252Y1dmNmFvQUdybzhSc3pOSk9XVVphZzBx?=
 =?utf-8?B?OEpQRmUyVkh1cTJBenNZRDZIaWZnUDJOOGxlcWhkaGNScmJmMnBqMG8wcE1m?=
 =?utf-8?B?L1VtTzVvQlhtVUlsSWtkS05teVljdnFGZ0FYYmw5MTZjb3FqdDhDcXdId0V4?=
 =?utf-8?B?YTV3QzhnNDQ0ODNEMG5HcWR3WTBpcUlWdklGeldJbVhFM2xaM0JDWS9Kc3JU?=
 =?utf-8?B?SlRQL3JtNDIzQVhkKzQ3MWIyRFAwdlpwK1loR2p6SG9sQlp0K1JNZGdLNjFG?=
 =?utf-8?B?aGY5UFJHdDhNc3JLMjBwVjF3QmZQZUdjRURPQVozazY5T203aE9ZblpMdjBG?=
 =?utf-8?B?SzhiR0Y0dnQxMUc0dk1oMjhoY3MvSkRRblk1VnQzakU3TzJaZGsxczcrMkdH?=
 =?utf-8?B?WU81WFdqYVIvY25JaytidWFKTHBHYm01ZS9Sa2hMU3JzOCtBSkp2S2dLbnRl?=
 =?utf-8?B?VE03UExFM21mRTVkekNTODlXK3J1R2UrT0pyV0ZiTzROMmNHNDJyc0ptZnpY?=
 =?utf-8?B?SktqT3FEQy8vblFzdTVrckk3V0JsUGlvd0JCMmcvbXdRNmc5cmxiMldhUEcr?=
 =?utf-8?B?RTdvOGNWV0oxNXc3ajd2UkMvZUcycG1mSHA0NllnYkZrZUVhMlpkWUVTUzFT?=
 =?utf-8?B?QWpnTTFaK3Y1cmIxWjBvNW9VanV3QzV0ZmZZbEVpQ2FFSlNPcHRzOGdoY0hx?=
 =?utf-8?B?ZW9Pek85UUZDaGpRa2Rqd0Z1MWJtRkRCOFF0aFFrY3hTUHdDMzV0MEM0NEkr?=
 =?utf-8?B?b3lTclNLeWFKZHJPY0NrUTJSTm9yd2N0K3NqMVN1T0ZjZHY4RnNpNVBxeGZl?=
 =?utf-8?B?V0xCdWJXZkF1YTdYYWtwbU9sS1ZLdjNyN2lsdjk4dW0weS95Q0lGWVZnVks5?=
 =?utf-8?B?WFp3MC9WQnFzWGpmY3VjZU1Hdi81NTFqbmdReURqTzNhb3R2cGNjdXhOcXhX?=
 =?utf-8?B?V3N3aHpTTGJiYy9IZ1pKbFE4aXhRdkRlTG8rbWFCYjFBL2trT3ViTVBMTkFo?=
 =?utf-8?B?enFkcHRkczNqS3VlUmNQWm1RYm1GVms5Lzg3Q0lsUndHdnFpZ0RvdHV5TWJ6?=
 =?utf-8?B?VFYvUGd5SzlVaHJLd29pWlRNWFlRWVpIWDdZdmgrbjJFVFBZOStVcS90ZFhu?=
 =?utf-8?B?Z09rUXdLbmZMQ3NWelI4WnV5aVk4T0daN0hpaVZQc0E2ei9PVklWeDZob3JC?=
 =?utf-8?B?YTRnVEkvN2lGUkhHemM5MUtEWHJnMWlBTkdNOWlEVFJmSkY5VzVBcEtJNGxn?=
 =?utf-8?B?alU3Y2xkeHVoMmJudHoyWEtFdFFud1FHL1ZVR0JwWEpSbUpjaWhiUG9xQlQy?=
 =?utf-8?B?NzVBU3hnTUNweGNXcUVOcndyL1Qwemc2a1NMZm1GWk8rVXp5TGtYSW94TkZ6?=
 =?utf-8?B?ZWd6YmtCSUZzWkJrSkcwREtkRFdMenVMMituTFJMNXdQRHRCd3VSWVBrV24z?=
 =?utf-8?Q?6l661/Kdzc0QAJdZ0GxLN3RBXOAIzIn8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlpFbEx6TjNZelVYaENTRVp0V293bUFmaFROV2pwRm8wVENHWHZPc2VVT2lz?=
 =?utf-8?B?MlowVDJyTGdtMmpsSFFLd2kvejNuWDhPdE0wZXlMdE4wWXdkU1NwYXBqdnpZ?=
 =?utf-8?B?d2xGczFYQmlVQVpMTGhYVTF1dDNIQ3dNVWc5WkFCOHdjeFdHWGc3NDZxR3R3?=
 =?utf-8?B?STBpT2xmbzlmUFNqWHQrVWMrRG9vQnRHN2QvVlRaMS94V0Q0eTAra2RJckZ4?=
 =?utf-8?B?c0xiSGJjaW13aGZIN1JTcGN3ellYNWxoV0VzWGJYMjBaQ21hMWk1eWttcTNo?=
 =?utf-8?B?eEVQa2puc3AzMFJ0elNTQ25tdzdLT3JCVDYrNnl6RTBYb05rWThqaTNCUFRr?=
 =?utf-8?B?RVl6SFFmTGt1UHBKM1Z6UnFRTlJ1b0krYU9JTkJuY1ZudTVqQWEydlhIOXVq?=
 =?utf-8?B?dy9jVmFYZERUVTR0UTVYdnkrM2wvdnlWWmFDamFPcDdZZUREWURXL1RMemNj?=
 =?utf-8?B?OWN4MTMrUm5LcU5zTzFWUVhpT2lhQWZvUFFmTFV0Q1E1U2ZtbXBBaStJOUdl?=
 =?utf-8?B?L1VyYmFZWXJnSDc4SzllSFBxYklmWVdUaDlZTTROWm5kZ2VITDFrK0hNY3FN?=
 =?utf-8?B?a2xEN3FXdTlGN1dlcXZ4Sys0RkZjcmc4Y3J0dkpDMlQzeDl0elljcjAvanBh?=
 =?utf-8?B?QmxXVWo0VFpyN3RmRGJCNTF6Ty9WYVpnTzhJZzc3UXVBNTRqR1VPVUpKbVZz?=
 =?utf-8?B?M0xjVEl5MDVZMHBQSWxJVTFUSTdzbEREcUsxOS80RUJBRUVrZGxmcmt2bFlv?=
 =?utf-8?B?cGI4aHlMVXd3YVA4K0Z2OXQ3MlFFVU9HT3d3UlYwVmhUS1lFTWdHY01EWG1Q?=
 =?utf-8?B?MjlGZUhQMmNmdElFNFdFeFBPd3lEYlpXMDJNd0Z6VWZmaTB5Q0dzbldPNG5W?=
 =?utf-8?B?SnJ6RDBZSGkwc1Y2NnFOOVk1b0VvMlJyVThXTGl2SVZIU3hEK3VSNUdvTm5t?=
 =?utf-8?B?MkNxM3BqcC9JNjI2eU5PdkFlOGJjb0IwNklnZWJsUERCVzIrSnJCNE5icTYy?=
 =?utf-8?B?TThoQ2UrUkMrOE15YmdlYjZtQ2UvUTlkVVpQUkZPdElhVXlPbVVTRnZlYUJJ?=
 =?utf-8?B?YjRGbjlvVG8yRUJvTHl5S1pWZUhIdzlWQWpPbXVpT2k1NW14YWFFYkE0ODB0?=
 =?utf-8?B?R21YZEJPY1ExS2J1MmM0WGREeVp5Q1ZpUmJ4V1N2L1NJU3g1QlpycExlK1FV?=
 =?utf-8?B?ZWZMemVzNnB6bEpGQkI3elhWcSs5K2dueW5Rb0pyUUl3ZDJjN3hlOUhpTmRa?=
 =?utf-8?B?TWRLYUZZOTBWT3A3eG9PbHNIVC9JSktEanV4ODB5U2FrU0RRclhZWWIySXNH?=
 =?utf-8?B?YkRYVkVnbHhUbGNaYk52OFVSbmk3ZjgyK0piYWtucVkzSHJubUlrTU9KdGtZ?=
 =?utf-8?B?UEN0TW9SWHV6cElENml4RHVUVzY5SUwvRjhNSUZEbXA2Q25wRTI4cTlYRWdB?=
 =?utf-8?B?OXBObWpiUDV2ZlNoUU9SUXpFT21nbnZ4WDFCaDNuVi9saER6YVAyazJINWZ1?=
 =?utf-8?B?Y0NUT21PQ3hWU0ZhVk54enA3ZW1wOTV2SnVkUVh5c2dCUzV4QnpkcWN0UW9S?=
 =?utf-8?B?K2FxK1gwaXF2MnE5TWV1SkloYzBuKzNMR3dxZUdsc3VRVzQxQ2V0dWtFOXlO?=
 =?utf-8?B?bk1JR3pxWmFMdFhqRk13bHNUQ3lna2FVMWdDQUU3TDFTMUxJcFoydEp0Uyt1?=
 =?utf-8?B?Y2hWZG1uMUxuZjF1Q01wem1tY2NCdk0xaW15SU1KeWtVNHVkTHhQQWI5Y0Fs?=
 =?utf-8?B?aldURlVxVEJSbXhadHV0eTJ3SEhiTWFIdDdQTVhJbzVERHBKRzEzenQ2NTFu?=
 =?utf-8?B?cmRrNTlyYXZWSFo2MEtNNE02cTdKZzh6UHdzU1dkcnJ6ek0vNkJrWjJFUWdt?=
 =?utf-8?B?SjV4aklTV25DVThNcDdHYjlVeXQycjMvUithMXdBenJ5ZjZKOVJmUkFQUmdP?=
 =?utf-8?B?UmhaT3dkem9KSHBWaWJQQzhOV3YxZ1lQWjk0N3pOcEdkc1k5dWk4Z1ZhWUZH?=
 =?utf-8?B?K0hrT2NsczJZOEd0T1Rib2dYZHpzY3p3cFRob3VXclZkODhtUDFhQ2VJeFUv?=
 =?utf-8?B?WHQ5OG9xb2RYVDV1RVFvOERieTY4SjZvclFWb2pRakJwdFpueHp4cTExT3lU?=
 =?utf-8?B?RTlibFB4aGd6UU5TV2xnMmxROWJ3K0p4RDlialBCZVJUM2lMSGJzN0lNZ3Z4?=
 =?utf-8?B?UVNIYUIyQkVnMWZlZzlNUmtPdDdMOEI5dVN2VDZOZitwYjJMT0Q5SU5INnMw?=
 =?utf-8?B?QzBOeGpoVWwycjdYTThndFZQbnpnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3f9a97-8a25-4f89-8b51-08de186c1cfa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:56:15.8439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljeu3+Rkx0l8s138damu4p9FV0Hwx56Gn6xfgRDgqNnfdsUefnkXqNyX/g0tu8lW3zh9IWTKfuvdmdJc9IjCsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798
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


On 04/07/2025 10:04, Thierry Reding wrote:
> On Mon, Jun 30, 2025 at 09:48:41AM +0100, Diogo Ivo wrote:
>> Hello,
>>
>> This series adds support for the NVJPG hardware accelerator found in the
>> Tegra210 SoC.
>>
>> The kernel driver is essentially a copy of the NVDEC driver as both
>> engines are Falcon-based.
>>
>> For the userspace part I have written a Mesa Gallium backend [1] that,
>> while still very much experimental, works in decoding images with VA-API.
>>
>> I have been using ffmpeg to call VA-API with the following command:
>>
>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>
>> which decodes <input.jpg> and shows the result in the framebuffer.
>>
>> The firmware for the engine can be obtained from a Linux for Tegra
>> distribution. Due to the way the Gallium implementation works for Tegra
>> the GPU also needs to be enabled.
>>
>> Thanks!
>>
>> Diogo
>>
>> To: Thierry Reding <thierry.reding@gmail.com>
>> To: Mikko Perttunen <mperttunen@nvidia.com>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Jonathan Hunter <jonathanh@nvidia.com>
>> To: Philipp Zabel <p.zabel@pengutronix.de>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-tegra@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>
>> [1]: https://gitlab.freedesktop.org/d.ivo/mesa/-/tree/diogo/vaapi_gl?ref_type=heads
> 
> Dave, Simona,
> 
> This doesn't add new userspace ABI and instead reuses the same ABI that
> we use for VIC and NVDEC, but it does technically add a new driver for
> one of the multimedia engines.
> 
> Given that we have Diogo's VA-API work on gitlab, I think all of the
> criteria are met to exercise this.
> 
> If you don't have any objections, I'd like to apply this for the
> upcoming release.

We would like to merge this for v6.19 and so please let us know if you 
have any objections.

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

