Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12EBA9B7E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020AF10E458;
	Mon, 29 Sep 2025 14:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nCeIEhuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E9910E44D;
 Mon, 29 Sep 2025 14:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBbLbZmrV3n4/PAAJetcxB7FWqV3HJ0OqjDTbg91pi3/UcFV6iocvKNVGGVZRbgwHe26ARhPElGx4SjkuV3iIlDR/Sk3PrVOWdiBp8ahYn7FY8rOdK9bzBpsouF72Q9/AcyKYYrazZgAxyMWipHL9MvxwQ5s6TLuI+FGnkssazke3ARFgDEhC/jzqaJfsEFlkDKcZy62He9esgAi2GeaX2mjzqKl0d1AVM8PwpbCMGq4EJ61Vj+zgDOaMZUT0Kf6kt4J9+w4VUO3B+ixqLVzGddO6aWsO6oVnOcZT+DqDK9rUUi50b+mJ52++jYHHBvnNkV7iHYGMoZUbTtu21YbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTuHSC2KjlOAIqOH2LHP8ZbLGQW5bNPN/JItyWuSyaw=;
 b=okFAvSTTmXWVKpFr0C2pDUgKjrVXw0387WFV/65XlCt5MXcO3FU99vWUrk5bRdSiQCADucxD+dWJJ0FqgwEYIyOfofUziNJAKwnw5DTDP6EiqJqWG32mL+bAUadCqS+yuO3Vi0+rX/Ffpp3/EA1shGXQmGgW9n2UP0I7+OR1pN1Ar2GJOP7i5qlJQvGDXVZyPnVUbQGYKt1DCD8rluoipDcNeFeLv+wLid/zCe02qrukClK0B1VAojxXQaj0EArzcsBhZoNXu1Q+hcg2ZID7TDmCCFAfB2MDHUj+cjyTCuK/Q9LdfJO2p/jovcMHaNVJBCygXM7FaD9nvNmg7Mv5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTuHSC2KjlOAIqOH2LHP8ZbLGQW5bNPN/JItyWuSyaw=;
 b=nCeIEhuNQ52pcTVhHf50HykIQNxxR/24y781uDJ0rWc13W1XLrlBwv0Ca2KXw6dkisB9D5ICcju+Rz7N7s+au9IOTehO8tr1+ujrx0GZEcXUWN6JccW96V+HSc9wMEs+Tv+MPx0JdxXDTvJ1vH/8ivbrkEOqXI/ZCr4eVQLLpovA+4m9sPFfLMWZgdixKQFQ85Uogyn9SKouyTdlBDmfqS8CYF29zPF9xYQItJST8uxEBZJmN6Jky2RAWG6kAt7jf4omBKMcQmzWdxG/z7WC9jD6iq1NhN3pkihvC+bVyGN40090pr/9WMWhQ2Kbo0AFygQSaZ97j20L5M5H3bjZ0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 29 Sep
 2025 14:54:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:54:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 23:54:50 +0900
Message-Id: <DD5DCUL398SX.3D60FY586TW7Y@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-4-apopple@nvidia.com>
 <e024e964c5e79b1c86dadcb8c19d14d175bcb0a7.camel@redhat.com>
 <DD2C8MKHDRCA.1XRV8RNPCXAN7@nvidia.com>
 <btrbmoivzhslvirfj5ourlmtr5mah4brrzbyhibneb7j7bdqhk@qclukqco4nza>
In-Reply-To: <btrbmoivzhslvirfj5ourlmtr5mah4brrzbyhibneb7j7bdqhk@qclukqco4nza>
X-ClientProxiedBy: OS0PR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: c141a810-478c-4388-bfde-08ddff682672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkQ2RGpwQU56QVh4RHJ3c3FReEExYWJETjIzSUxZd0t1TDRuOFNSclRnZHFl?=
 =?utf-8?B?T0hSYzJhNTJYOVNVMnk4ejBQUVJzb08xQXNoRjU2aThxUjg0STVheHNCVWNi?=
 =?utf-8?B?ZFczN3dBVVVwYkdDYmdrVDFyWUxBTTUraG9UWjhsV2FaV040RGVMUGMyREdQ?=
 =?utf-8?B?Um9KZTR3ZXJ6WU5SWjBPdTZIUnMraVkwTmVQRTVRbVBFWUQzd1Q0S3IxWmpQ?=
 =?utf-8?B?UEVYeTRWY29iSkZicnlUUlh2eXZ6Tjd2YURySWxBUkkwSXpmalFBcHZnZHI0?=
 =?utf-8?B?SktNRkRTa1ZqSnlpajNMUmVCOGFvSDhwTUczUkVoNkticHdoWm5DT3Z5OGRJ?=
 =?utf-8?B?WG1ZTjFaVW5sdU1zQXZZRGFXc3Noa0ovbGh6WHRrekRRQ3g1QnJyNkRvN1Ji?=
 =?utf-8?B?eUdJNG1MZVRBcGtpb29ScWNCWGFuSE1adUs5S1FWVmNjQzhxbGR2dCs4TFVR?=
 =?utf-8?B?T2NSQjZWYnFhVTZQd3dRZFB0c0VGZGg4cVI0T0Q2aVMvRVNqRGdrTmdkbkg3?=
 =?utf-8?B?Qkxnc28veitjdG9ZNWQ3QUpieGZrdUtaWWhxa29jMzhhZnBpbHJIZWxNaDZT?=
 =?utf-8?B?QTZLdVV4RzNza3hUU3gwc2hRMEJ2VFFkdjBrdE4rcXpjbWZ4eXArakpzWUll?=
 =?utf-8?B?OSs4c05LZzFwanYyZGNWRE5aaXZzUnQ3dkN1MGIvbW5xWFE1M0dKV1I5Tzha?=
 =?utf-8?B?azJRempVNlFKQ0UxWTdxNThSVmVZYXNIak1VbEFTaW5mbGNKRTU0NGZvU3dh?=
 =?utf-8?B?a2Fsck0rVUx2ZnpIZGhVVEVwLzV3TkRtSWY3Q0o3a2N0dnNiRlVlNUFEMlZy?=
 =?utf-8?B?YmxWZ0RTb1E5TUFkK3lqYjBMcDV1dDZVTzNId3hXMk9hMVovZ0tNaWdiZ00z?=
 =?utf-8?B?WGV5VzFlN2ZSQUliY3hpZnQxUjJBWlREcXpMaUJBMk5WdHF6S1BXWWxIbklU?=
 =?utf-8?B?MDlGODcvTEJTbUJ6WEN1UGozTXJQM012c1JWYzk2L0dtb0hMQllrOWZVZis0?=
 =?utf-8?B?VGlhTXVpUm55VndieE1zdlhJWU5UTTVhT1hNK3lTL0xza2UxNFVjVVg5a083?=
 =?utf-8?B?a0I2NWQ3OWlFOGtMbVNXdGpiL1g4U2NpMG83UWZvWVF0SUJjZjZqQUNiM1Zw?=
 =?utf-8?B?bDZrbS9pSDlGRDh4ZUFRRUJwQklUdjVDYkdteERrSUdBTldFUjVJSGxyVmIx?=
 =?utf-8?B?UEd4NHR5a3pLOHQ2TXBnVmpoOVM5NGttNElwYkkwMm90SGhkNWZxbmlzZlNr?=
 =?utf-8?B?cmtzZWIyK2twYlAxSjBrR0dQNHFwd1llK1dGYU9uQjRWTUM1b0JRZjN0eURj?=
 =?utf-8?B?aHdpZFVYdzkzMUJNS1ZGdldJdWI2TFNoS09xQTRzeFdzUTI0cHR4VlFLcFA2?=
 =?utf-8?B?OFJDdHhteDZneE1pVnU4d0VydWNaNVRQT3RNdmJ3WHI2dWdUZ0taVDdua2ZQ?=
 =?utf-8?B?TmsxTG9BMkZHK2dtU2lpS2V1WVVaTXNBNjlndGZvSld3QWZIUDFDbTkvZHhQ?=
 =?utf-8?B?dHVuS3FuTmRNZ1hrdEJUaFg2Nlc2akZReXcvVGxKUE9YSERZaVZwNkdKdXNC?=
 =?utf-8?B?b3JpUUZRZUIxN0t2N2RMTmFPSkQ5WmwyMEFCN0R0MXhVVm5NVGIzSE9VVWhP?=
 =?utf-8?B?MUxZOFNQVnFBcFNBaGFJTVZsdE1lcllGQkl0Tk1CazZtL1crMTJNbVBQMmlk?=
 =?utf-8?B?VnFHMGNyai8yc3dlT0VieXpyQ1EySVZvMlZKMGlnWVFGNlZBQVJoSUtQSVVy?=
 =?utf-8?B?VkxxZVJHbEdKUlk3SHIzTDRQL2dFejNTU015VVVJN1JVUHFUWEtLNllVUXpx?=
 =?utf-8?B?QWJ2eFdoRXpRUUZkbkJvN01kUTZSdTJlMVlqek80aXUwM1psOU9hcHVpYXlS?=
 =?utf-8?B?enNWbHhwMmcrU0o2dU1pVEFlRUNoUDNGY3FXc01lZEMveERZSWxKZzdzcjd5?=
 =?utf-8?Q?x920YqoI6tPjWbgbLBc8GU90vschlcib?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGJYN04yam1YWWpxSVk1Si9FK0h6dWhOTjdPYWlZMWYvVTE2OVpReDJCNENI?=
 =?utf-8?B?K1R1bWFDbnFmRXJFeEd5SnZmTnF4eUJjVGF0MmlVd2JtR081R3E1b0E0Znk3?=
 =?utf-8?B?TjFva2JybXpzQlEwMmxlTkh5N1hhQVFteEErQ2oyNUcyVCtmMVZ3eUN6eUl6?=
 =?utf-8?B?Mk4rN0JLM29mdGNvUTNBaWErZVNpanJ0Vm5xUVdzeW5QbWJMaGxibEgrc2V1?=
 =?utf-8?B?YU5paFBub3ROMWdtYkc3RDRQZ08rMVZiNlNFTW5Ha1JYYmphSkswbTZ4VGdk?=
 =?utf-8?B?ZEtob3hOcFl2SU0vOHBJSXhLUU9Dc0RYY0hwdUZvVzN5cjFQcERuYTlHNHJC?=
 =?utf-8?B?TksvOThXWm1rbGh1UENVaHlHdENNYVdMZEYyNUpHd1FRb1Q3SUY5VGJLYVpJ?=
 =?utf-8?B?WVpWUjVheFJKWHZtRU9IRndDNUxrSVNQTFVzWTNoVENFZlA2TmVSbHlGV1Vy?=
 =?utf-8?B?NG9ENDlRRXIvbXpNcVU2OVUzTkVrZVBGUWNzcEJ4czYvd2lpZzVpNmdyN1NF?=
 =?utf-8?B?KythcVFHREt0TnpuNlRtNVhNRmk3bUJpT0pPVUh0WWJDL2JZL3dERGxFMUtO?=
 =?utf-8?B?TU1UekpWQjJiYXhOKzJQL1BVQVh2L0piR3NmVW5WWXJZaS9IaDFKWXdJRTh2?=
 =?utf-8?B?Yk1qVTUvZlhtaXp5N2lya0ZTZFNreWJlRjZEczVjSnNxbUhzdXZvODdOTGRG?=
 =?utf-8?B?K0JGdDY2ZmFTTXhuL3VRNGoyWUtuQytONFU2Rk1Ld2dlNXZBL0tNaURyNW5R?=
 =?utf-8?B?YkRnOSsyWGF6QWhtZzFIK0c1S1FFZ0RjVE14cURBOXU3d0Y4Z3BhWUM0Tmcr?=
 =?utf-8?B?Z2dJOHBtQmVKZkVEYXJlWDZMZytYSkJVT3ZzdkN4Y0tvY0tvYkxlQmRYZjl1?=
 =?utf-8?B?cytGZXhqbkJCMnBaYVUwOVhYWGk3Z25sUG9NU1lGNWVXOUZKajlQU3oxK1VK?=
 =?utf-8?B?SFZxUGtuWDgxaHFyMnIxSTdmZHR1cWR1S01GOGE4cXBrZTlSenNadTFIaVps?=
 =?utf-8?B?dWFNUGI0YXRxK2ZvM1VpRS93cTJMZWc2OXNZZW9TZ29ydGhRRWs0QXovTDNM?=
 =?utf-8?B?dHh2SkZ4VGR1ZmZTRUZWa216OHJiSzFzZS8wVmQrWExQaHM1am0yUEFLMEdq?=
 =?utf-8?B?TVJnWFM4bFhsaWZzMmVUbitsWk1YZ1k3VEx3N0s3UHBvSnY2bFQxYS9yby9L?=
 =?utf-8?B?NEFRa2I1L1F1Wm9QSzRENXNuZ0tZMVErS2lpWkd5T0x5UWNUUFhsYjVTTHBG?=
 =?utf-8?B?K0wxN2JnTHYreEFGa0tmbWNxa0piTlcxUHdPU25MWVhHM2NLME1XeEo0Q3Zz?=
 =?utf-8?B?ckVWNzRTWGVMeHZqVTg3WWhKRy9oK05td2cyNEVxa2s3ckVyU0JMblV3eGZj?=
 =?utf-8?B?OGdWT3ZLZWlvQitQeCtVQVN0YWpTcVJ6a1dIb0ZId3c1ME5COWpwTDZTdVp5?=
 =?utf-8?B?UzN5ZktOTDljWXZ2RnY1V2FNaytIc0FyY0x3Q0poaGtJeHhDS3Q5Mk5FYUQv?=
 =?utf-8?B?VE55Qm5EWFZFaTY5RzJpY0Q3YkNEa01XYklPSHhqZTlDcWFvMzAzVFVVZVVM?=
 =?utf-8?B?NVQvREltbjc2N3k0SFdHWkdqdGxMU3cwb2ZNczZtOGdEWVl0UlE2elQyckpX?=
 =?utf-8?B?ZXZjd3ZUbllzclNLTnhna1RkOVg4ZWpmUlk4bUpUMGtYRzM2WjlLTW92MnUy?=
 =?utf-8?B?R2kydFdiMUJUZkVvdjhQWWE3VytsOG5BbFR6N1BSb1RKdGpNTnhDL1VoMGFj?=
 =?utf-8?B?b2IyNlVKUkpjVHdDV2ZnMGJ2MlFWTnVoaFJGZFAxdWh0YmxUTnRDZ1ozUzFP?=
 =?utf-8?B?Mmk1ZmJEaWpKdHpDdTlQalNrNGNUZ21sc0xIRTVNYmlpWW1CMHdkLy9OSnM1?=
 =?utf-8?B?emQrK0J5YUxxMmg4VjB3UmZBdE1aSWh6bTR5Wk5zQ0kvdmU2ZDd4S25vUHdh?=
 =?utf-8?B?ZTA3WVQ4TzIvWGtWVyt1WUJ2alVpdTVCR3ZiNTVHYW9hSlRxdUZvcXZsOVRF?=
 =?utf-8?B?WHZrMnBVVkpXZ21DaHNxaHNyOXRneUVkZzI4NnFXbit3Z2laTGM0WDhUV1lI?=
 =?utf-8?B?d0lIaVFkSnIxcFBLVXUyMDYrRStwVEEvTWNSZU8zN3pNbU5CL2FlemM1a1JD?=
 =?utf-8?B?UzZmN2NFN2ttS1A0ZTUwNlFWcHFJN0xlQ2ZodlhVOVg3U0dJQlcwKy9Rem9k?=
 =?utf-8?Q?dMxaP/nSbxoYbF1eJO6LimYSzr0nOiwnb9MahUmHCVrB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c141a810-478c-4388-bfde-08ddff682672
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:54:54.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 781aOiPpCc9CEEWWfC1Y+HzsJXeQ9Gec/sigqYz+R5WFwa0rkGI7+fJ3nsHhFa39q7jtPR5Honr8U895lbnMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

On Mon Sep 29, 2025 at 9:29 AM JST, Alistair Popple wrote:
> On 2025-09-26 at 11:24 +1000, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Thu Sep 25, 2025 at 5:24 AM JST, Lyude Paul wrote:
>> > On Mon, 2025-09-22 at 21:30 +1000, Alistair Popple wrote:
>> >> The GSP requires some pieces of metadata to boot. These are passed in=
 a
>> >> struct which the GSP transfers via DMA. Create this struct and get a
>> >> handle to it for future use when booting the GSP.
>> >>=20
>> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> >>=20
>> >> ---
>> >>=20
>> >> Changes for v2:
>> >>  - Rebased on Alex's latest version
>> >> ---
>> >>  drivers/gpu/nova-core/fb.rs                   |  1 -
>> >>  drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
>> >>  drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
>> >>  drivers/gpu/nova-core/gsp.rs                  |  1 +
>> >>  drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
>> >>  drivers/gpu/nova-core/gsp/fw.rs               | 63 +++++++++++++++++=
+-
>> >>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
>> >>  7 files changed, 75 insertions(+), 8 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.r=
s
>> >> index 4d6a1f452183..5580498ba2fb 100644
>> >> --- a/drivers/gpu/nova-core/fb.rs
>> >> +++ b/drivers/gpu/nova-core/fb.rs
>> >> @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>> >>  ///
>> >>  /// Contains ranges of GPU memory reserved for a given purpose durin=
g the GSP boot process.
>> >>  #[derive(Debug)]
>> >> -#[expect(dead_code)]
>> >>  pub(crate) struct FbLayout {
>> >>      /// Range of the framebuffer. Starts at `0`.
>> >>      pub(crate) fb: Range<u64>,
>> >> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova=
-core/firmware/gsp.rs
>> >> index 9654810834d9..67b85e1db27d 100644
>> >> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> >> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> >> @@ -127,7 +127,7 @@ pub(crate) struct GspFirmware {
>> >>      /// Size in bytes of the firmware contained in [`Self::fw`].
>> >>      pub size: usize,
>> >>      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
>> >> -    signatures: DmaObject,
>> >> +    pub signatures: DmaObject,
>> >>      /// GSP bootloader, verifies the GSP firmware before loading and=
 running it.
>> >>      pub bootloader: RiscvFirmware,
>> >>  }
>> >> @@ -212,7 +212,6 @@ pub(crate) fn new<'a, 'b>(
>> >>          }))
>> >>      }
>> >> =20
>> >> -    #[expect(unused)]
>> >>      /// Returns the DMA handle of the radix3 level 0 page table.
>> >>      pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
>> >>          self.level0.dma_handle()
>> >> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/no=
va-core/firmware/riscv.rs
>> >> index b90acfc81e78..dec33d2b631a 100644
>> >> --- a/drivers/gpu/nova-core/firmware/riscv.rs
>> >> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
>> >> @@ -53,11 +53,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> =
{
>> >>  #[expect(unused)]
>> >>  pub(crate) struct RiscvFirmware {
>> >>      /// Offset at which the code starts in the firmware image.
>> >> -    code_offset: u32,
>> >> +    pub code_offset: u32,
>> >>      /// Offset at which the data starts in the firmware image.
>> >> -    data_offset: u32,
>> >> +    pub data_offset: u32,
>> >>      /// Offset at which the manifest starts in the firmware image.
>> >> -    manifest_offset: u32,
>> >> +    pub manifest_offset: u32,
>> >>      /// Application version.
>> >>      app_version: u32,
>> >>      /// Device-mapped firmware image.
>> >> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp=
.rs
>> >> index 0185f66971ff..2daa46f2a514 100644
>> >> --- a/drivers/gpu/nova-core/gsp.rs
>> >> +++ b/drivers/gpu/nova-core/gsp.rs
>> >> @@ -13,6 +13,7 @@
>> >>  use kernel::ptr::Alignment;
>> >>  use kernel::transmute::{AsBytes, FromBytes};
>> >> =20
>> >> +use crate::fb::FbLayout;
>> >>  use fw::LibosMemoryRegionInitArgument;
>> >> =20
>> >>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>> >> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-cor=
e/gsp/boot.rs
>> >> index fb22508128c4..1d2448331d7a 100644
>> >> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> >> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> >> @@ -1,6 +1,8 @@
>> >>  // SPDX-License-Identifier: GPL-2.0
>> >> =20
>> >>  use kernel::device;
>> >> +use kernel::dma::CoherentAllocation;
>> >> +use kernel::dma_write;
>> >>  use kernel::pci;
>> >>  use kernel::prelude::*;
>> >> =20
>> >> @@ -14,6 +16,7 @@
>> >>      FIRMWARE_VERSION,
>> >>  };
>> >>  use crate::gpu::Chipset;
>> >> +use crate::gsp::GspFwWprMeta;
>> >>  use crate::regs;
>> >>  use crate::vbios::Vbios;
>> >> =20
>> >> @@ -132,6 +135,10 @@ pub(crate) fn boot(
>> >>              bar,
>> >>          )?;
>> >> =20
>> >> +        let wpr_meta =3D
>> >> +            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, =
1, GFP_KERNEL | __GFP_ZERO)?;
>> >> +        dma_write!(wpr_meta[0] =3D GspFwWprMeta::new(&gsp_fw, &fb_la=
yout))?;
>> >
>> > Not something I think we need to block this series on, but this line d=
oes make
>> > me wonder if we should have a variant of dma_write!() that uses
>> > CoherentAllocation::write(), since I think that would actually be fast=
er then
>> > calling dma_write!() here.
>>=20
>> Can you elaborate a bit on this idea? Would it be faster because it uses
>> a non-volatile write in this case?
>>=20
>> On a related note, I wish we could make all these accesses to
>> single-instance coherent allocations non-fallible, as this is a pattern
>> we use often in Nova and the only thing that can fail is
>> `item_from_index`, which we know at build-time is valid as we are
>> accessing the first element.
>>=20
>> So if we enforced a rule that `count` must be >=3D 0 in
>> `CoherentAllocation::alloc_attrs` (which is not currently enforced but
>> would make sense imho), we could maybe add a new variant to
>> `dma_read/write` that matches a non-indexed expression, and makes a
>> non-fallible access to the first element of the allocation? How does
>> that sound?
>
> Would this have to be limited to the first element though? I assume we co=
uld
> make a CoherentAllocation variant where the number of elements is a compi=
le time
> constant and therefore dma_read/write on those would be infallible except=
 at
> build time.

Oh yeah, we would have to try and write such a variant but AFAICT this
should work nicely.
