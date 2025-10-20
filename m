Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1ACBF3B60
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73A10E521;
	Mon, 20 Oct 2025 21:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P6yfuMCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9D10E534;
 Mon, 20 Oct 2025 21:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1+KK4h5pxye0bObznrvZNjVo2OyeYfP/61QR9O98+PRM+CBeDLUwRnAJxEqHLAjqKsOhqJTbQaFADt1zPUFDF8UDp/I6zIOXmKJQByd1QFGkNS7SRjrZahfcsHRjm4tjx9211/VLY6IingMlN6ThDeOP+kRaQTLtkMOuUKoh+Ca22udP0JnQm+aGzXZ5h0oiObmODdNC2inxTlVn5ItKgWRP3SkH/hGrW7AEeK6OpnhUT1p7D0ny0UDJt35ymxcnJoH8TObMQI/AUg4N7ogUvJL0382HPCT/uAPk4Nx5jxaSdaTLQpsmhxGSnhfpMVBxZITsSEinN8Wgsf4fd2k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXeT5C157P5np103ZY6fsJXWTjiUT6keTDNGciQh2Yk=;
 b=tTWAYLHlWcPZszn/S9puxc8CuGKOniNeqhUO5BwlDFdHx+RN1JsolDuJgHUVWIBtccfqIq8G4fXvQCL+SYwv4H5sNcwx5ekfTQnZr5+D4MaCFENGQf++PhhH4dpr779Lah+vJl0jnkaRZtqshyxRusCOGs5ZRqMZol0uTrTkRBlUxf0aHfKiUKSNblZF3NxVHBo5XizLEwmwhkC+gtmVbNhnSbMS5kcfVo8ulf25yO0t76b9wz5rXK9Tsm69VsjTkqQwDsEQPgfaYhN0uQpGsnhbULfkPzMnVcUvQkIRImHZeL8/BebNKIS5cpdAnA07A4mQxOGiim1uF1OLbyy3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXeT5C157P5np103ZY6fsJXWTjiUT6keTDNGciQh2Yk=;
 b=P6yfuMCmDtfXstHrBk5f6n/EE221YChwxFk8lBYo/+9cpUkGXNRDMz0RDCMuUYLmUUYWDJYtLEQAyf6KCxI4z+QgrPzH+ZbU7k5gzuNuXP79emGHnQcNCUv4yL59gqW6qgEg/wGF7tOq+bQjScP3Sadl0fCNTzx2HmRZELPfsfj8VlcPG1esS2h1WhuKTML7nAv3ewC8c54ZZY0O8koXKkYJllrq9sOZs9/ieKvz6zra9687LRPKxe6TD7YnGbJqKTIxWcTfu7yJJb1VzzgCjSDU3rOw7t1Rsf2YSX1iBxX46ACUjx0FAhJVdbl9+srvfnL4oTYLQoxcbBD5Uhd2Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 21:22:32 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:22:31 +0000
Message-ID: <abb01a14-d4f5-47f7-9bda-9755820b400a@nvidia.com>
Date: Mon, 20 Oct 2025 14:21:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs: rust: Fix a few grammatical errors
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-2-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-2-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a34039-d2ba-4578-81a9-08de101ec754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlZJa3M4dGNnK3JZY1dLaXk2NnBqaDBKVDI4cTQ4WHJ3L1NJenI1UmNjZGhr?=
 =?utf-8?B?Zy9CcFNLWEJYdjFic1U1WE52R3hQVUxIL21DMG05NWx4dVlURWdZOG9oVlJz?=
 =?utf-8?B?Yzl4ZnJibnhaVDY0cjZSN2VFOFQrZ0V2ZzQwRStuRSt2dnI4bmhLUWdLVThH?=
 =?utf-8?B?eC95YThKdWQrcFVQS2YzcmdZajdyUE9GUGl5YjZhM2lnbFYzTlBpelRFdGNX?=
 =?utf-8?B?Qmx3OFBIeUVBTThzS0R5enAwT1hzNHJMYUR2d1dKOTYzME84WFBQVnA3bk5o?=
 =?utf-8?B?U090dGxTTkJ1bWpKUzBRWkpMWVpIeEE2cW43MGM2U2pleGdKWTc0ay92d2dn?=
 =?utf-8?B?eE82dTdzN05TRjhjNE5XbXFIdVdwelA3dTZyKzhZcGZOYXVLMkQvU2JMK3hB?=
 =?utf-8?B?ODg3czJCcytod3Y1YjVGSG9ySGlLQzRRSzJNUGpya1RaQXF0alZqN3U5R1V2?=
 =?utf-8?B?ckI2b0hmS01ncldFWFBMMEhrcGNUYlFjUlo1QmN0S3BnS1h4UjEwUktxM0t5?=
 =?utf-8?B?TjFPMWQ1Q1l4b3NOcktxNG9ZK2NqbDY5S1JnQnl6RFpiMXN0UG5uQkJqbnUz?=
 =?utf-8?B?T2VEd2F5M1dTTHRjRjV3dUJST0pmQm9qQmV5L2RtamNtTXlIWEg5ZDhqYi9m?=
 =?utf-8?B?UXI5aXhyZ2VNc0FPNWM1c25hNEM3Rjk4LzBrL3ZLSXIvVlJZM1ZBK2I5aU5w?=
 =?utf-8?B?cG5WZHMrNG81Zi8wNVQ0OGRobmhkY1NHeSszUFhoQ0NsVGhHa0diNlNHQkdl?=
 =?utf-8?B?cHN1V3lVVG9Wb0RUYURwSXhqbzF0eG5PTmg0cSswVU9mVHU3a3dtTHU2MEhu?=
 =?utf-8?B?aEdCYSt0dG83d0RaQWM5c3BFMDNPanBkclRPSHRxZVdlVkEzM09zcWNDS0M3?=
 =?utf-8?B?WnROeFdGRmQwMHRNaHJCVExwUDRJQjFtUUZ3SjZ0YTNWNncxMlR0NTIyRDQz?=
 =?utf-8?B?dXJlY2wxRDJJbzZlQWdBTGxOQmZlUVl2TVh5TFB2dVdJeXQ3U2RJRU5LdGJT?=
 =?utf-8?B?VDZCclNSRFJTbXlRWmpkMFF1dzFQakpyVE5DNUgwNU5zK2RjQWZtTU9ubVZU?=
 =?utf-8?B?ZnBwR3hPYXJoWXFveEFqSGhxZmc3SlhJeWNUQUY5akxZR1U0SmlUSjYyMGJx?=
 =?utf-8?B?NlFweGdwRkZYeDA1ZUFZeXN6VHc0VWI5WllQM3k1Z1ZpaVQvWnNnaFdYM1V5?=
 =?utf-8?B?QUd6UDVjOXAzRlAyTkxrdGxXNzhlOXpXcmZTMWFUaFR4UUR0a200VlJIcHlM?=
 =?utf-8?B?ZHBtTkE0bFNvRThjRm1heFhtRmJQNkFSYnh1Q3UwQ2UxbmZBWUNzY0JwQ2VK?=
 =?utf-8?B?Y2YwWmUwdkVmcVdHNEtsdTVCTHA4aWR1QVlsSlVJdGxZdm50TlZYdW5pWHJZ?=
 =?utf-8?B?SmRSMjhnZEEzOXJ6KzBjT0tnTFlhalFzRTExdUQvdTBOR3hCL0FEVWNHditJ?=
 =?utf-8?B?N2tpaGFyQTVWZUxvVFB4cVFzYWE2bENrMmVzUGFpRUtMQjhwVmRncUh5K3dH?=
 =?utf-8?B?TGRKMnJpbVpSYjhjUDRuaXpIR2swRlJKRHIraXlhVG1SVi9Nc2RsRGsxSWFG?=
 =?utf-8?B?WmJmZ0c4TC9LczdhaGlZSW1MYXB1ZjdESER5S0h3UitxV2RiVnB6RlpJclB0?=
 =?utf-8?B?MVZHeG53R0QzUzJDaCtyM01QdUpHLzk1ZnlUakFyczBWMkc5RkRYckN6RU4w?=
 =?utf-8?B?VXhUVDdibHpmbVUwdHRkZ3E4d1l0TzAyWkZ2dlhIcDIyNVJVRUx1L2RZMitr?=
 =?utf-8?B?czZvUVZmd3ZaanMzdEdvWWpoZE1TWU1aVFVGaHFyb0k1enBJdndYWXpBVlJw?=
 =?utf-8?B?bHhlSmhvYTRIUmluTUY4Z3R6WjJqSVB1cG5NTFBHVVJQdFZMWndRVE9FS1Vj?=
 =?utf-8?B?T1BIb2xIdmNic3JmWk5qbGFiOGtrY3Yza0RpSWhSTXZubFVNUkxHMzJ3cVIz?=
 =?utf-8?Q?vhz0MnDluVMFcealxG1j9nxEBqndhbK2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxaODVtNlB5QmFUanI5WSsrWnVYanc0OUd4ZjZmb0UxeE5YWW5tbG0rU25x?=
 =?utf-8?B?NDdEeWZuTkZIc2kyVU5ldlFEb3g2WGMxZ1JWWWVHQUtpdy9pUWlnQk5YaDdH?=
 =?utf-8?B?T0dCanM1RWRwNXJIaXBITEpqU05QNmZ4c1dCc2Y3bHZyNWVmUmpzamZSY05V?=
 =?utf-8?B?VkViWEt6RFl2N0JSMzd6cE9yekduS05nT09kVndkbWF2Nk9pZ1BxOHdRZDhl?=
 =?utf-8?B?eDdqRWd5SUJQMm5EMFEzQkpzMDIvRXpFWVA5Z0ZnYWdhL1g2RlRCWCtNQ3VB?=
 =?utf-8?B?NTdmNDQwRE9DQ1dIZEdERzZlQlFyWkwwbUhoSkhFZ3phUlVCTkhTMGROSS83?=
 =?utf-8?B?WUdCblpTSXRnR2JCVzFiSkdmbzU4SStvZk45cFE0L09UM25uNTBoczlxSCtN?=
 =?utf-8?B?MlRGUGk3YmxxNWQ5Mzl2UFB6RTFHWXc5T1M2RnFTNDFtYkViUzExV0hqeUVG?=
 =?utf-8?B?QWpvMVREdGhQVld2TWpLMWUzL3E3dUcyQzNqVXpmK2JRL2VLQ2pSMUFGeUsz?=
 =?utf-8?B?SmU3ZHFtdWN5MFhOeUxjSE5GYzZyQkxvT2RkSk5YMm9SdDJWMGFqejFPVG9Y?=
 =?utf-8?B?Q01IN1FXQ25TZFdMYk9SRGhudmRld0RGdnEzS1l3ZERUMUdhbzFhalVmYXc3?=
 =?utf-8?B?VTJEMlNYSjBXRHBHa0hzSWorVlo0L244Wm1yYnhFbFdONmF0LzVGcnh5Zlpq?=
 =?utf-8?B?bUllTGZiRjRMUmFjTlFld3BtcHB0RUpTaWQvY0h2VkkvR0VUM3h6TnAyWXVU?=
 =?utf-8?B?N0N1eXYySmY2U0M4S2NvWWpocGdMVng1YUR1U256dlZWR1dxM1ZiTUQ4N3lq?=
 =?utf-8?B?Mm1ZbXJlb3M5Uk0zLzVjOVpPV0hZVmM4UkJOSVVMdGxaaUs4aFVaOTQ1c2Fx?=
 =?utf-8?B?c3RPWmF6dUtuUGtpcHNkQUFJWVcyS29iS0xsdXNhL1lnNktoczZHWHdBTk5G?=
 =?utf-8?B?RGhYMEk1cUQzd0tQN3JlUlJCNTJhUlNYOFVVODBiMDNNN09kWU1YN0hlMG14?=
 =?utf-8?B?RW9HMnFLUE5QckRybGN2a3JsZHQwRXpSV3VkcmZrRVhyQ2kvS1pCVGRmM3Nt?=
 =?utf-8?B?TEx5aHk0ZTEvRm1peHVuRXVVTnlHd3FJQmJsVFBDRFpHMzRLc01seGtKYkdz?=
 =?utf-8?B?aXZyeThnM0lXTFdYQi9xd05wQklKdXB0NGFmSVlrYndSRC9YdVQ5djV2Sjl4?=
 =?utf-8?B?OE9yMXBSNC9raFE1ZEZQYkl5WTNhbDJiRGJBTGpQRFduQVhoT1FqL3dIZmw0?=
 =?utf-8?B?d3h2cHpsZ3duTTNPSEM5bTArZnJweDJVVWlnR2ZWS0UrZE4rSTFFNDh3WG1S?=
 =?utf-8?B?SmcyaHNYOHFrZnlneENCTXdMNUZmMXhXR1NKalV5aTl2b3hUaDF0VTY4aGxr?=
 =?utf-8?B?bDBzUTRUdDFKSjBER0Uyc1A5dHNUMVBNWjVMc0NUdDdjbVZkU0dkMXV6N1BE?=
 =?utf-8?B?bVdZSFQ2dnZMdnJHZ3FOQUlGOFpaZWlHeXBrL2dyS0hVRHRhQWpNOGdJeE1x?=
 =?utf-8?B?UjVXVmVxQUtSN2VLK0RHR1dodGdZMmg4bEdub3RlR1paeGJQODhYaE9SeWNW?=
 =?utf-8?B?aG9rWDVoaVRBekNHc09MZWNQU0JWRDN2M1RRS3N3eTZNREs1cklEWUJ6czdP?=
 =?utf-8?B?ZHliMk02cHNFZ3MyUlRCc2krbWtOWUczSncwckZUSFNQZHFqRjUrZWw1VnBL?=
 =?utf-8?B?emdKTDY2ZVFXTlJwZDRVM29Xa1RseDU3SGZMZUthT1laUjlsTjRLeTMvNkd4?=
 =?utf-8?B?M2RYUVdGOXc2Y1BZdDhKeThMWWNXR295K3ByaXhROFBkL0ppSUpEM3h6bFd4?=
 =?utf-8?B?eE5XU0RTcS9TUUdDSWpGMnRZbjNwQ2E3MVFiUU5RMWFmRzJCRVZFMFZFNFZV?=
 =?utf-8?B?VHlaSkJkZmxIK3ArWXJzc1BhdXRYOXdCcmc3QWlhaEhuSS9qeDB2MW1ScER2?=
 =?utf-8?B?UkM1Z1dLbkxneTBCbnVBR2pyTFlsUEhBaG04UGFqeG90MVozSElTaHYyaHNX?=
 =?utf-8?B?azIrMkx0eTRPazkwdVRvQUFZSDBkN2wyWGtFVkRXL25JbngrLythbHA3czdt?=
 =?utf-8?B?Z3c4bTMreFBoL3pMaWdCVTNKS0RtTmxnRkZETUgrZlZDNDJqZGNmbHpic2tR?=
 =?utf-8?Q?d1vf1xpuCVP5Mgnt5mIFTBFon?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a34039-d2ba-4578-81a9-08de101ec754
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:22:31.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6V37MR+pPz+ew7nqhKHtr5qE9Sa3KgK6kmcLt/CJT0r3mhc9WHc5k6M4yWurAzvdhHpAcKW+41rR4npMGq4zpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> Fix two grammatical errors in the Rust coding guidelines document.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  Documentation/rust/coding-guidelines.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard


> diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rust/coding-guidelines.rst
> index 6ff9e754755d..d556f0db042b 100644
> --- a/Documentation/rust/coding-guidelines.rst
> +++ b/Documentation/rust/coding-guidelines.rst
> @@ -97,7 +97,7 @@ should still be used. For instance:
>  	// TODO: ...
>  	fn f() {}
>  
> -One special kind of comments are the ``// SAFETY:`` comments. These must appear
> +One special kind of comment is the ``// SAFETY:`` comment. These must appear
>  before every ``unsafe`` block, and they explain why the code inside the block is
>  correct/sound, i.e. why it cannot trigger undefined behavior in any case, e.g.:
>  
> @@ -166,7 +166,7 @@ in the kernel:
>  - While not shown here, if a function may panic, the conditions under which
>    that happens must be described under a ``# Panics`` section.
>  
> -  Please note that panicking should be very rare and used only with a good
> +  Please note that panicking should be very rare and used only for a good
>    reason. In almost all cases, a fallible approach should be used, typically
>    returning a ``Result``.
>  


