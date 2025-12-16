Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185CCC172C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3C10E72B;
	Tue, 16 Dec 2025 08:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022108.outbound.protection.outlook.com [52.101.101.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B4210E5D8;
 Tue, 16 Dec 2025 03:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/TbVWLsDd3PB7VZK9JyZjEzzqZ6lPO1NHRQi4X30mEHtQru1GgHRVacg8NwebYe3DwCBvdxI6qkCNCRrQvJNXHwX2ixilO/rgbcKgC2GFN2JONSZVOOpX2Lbj5GH03Ox0t6N1JzcdebsujCWgFjhK23rd1v6DTBhIlKATgvFa6tAtzOMIp5qV3BsZx5LSnHlYsyE8XxXkSVpuYxq2z/th+v+deJyaOSLkRSUnU/TGtPGw+19SRJGTbi8xy+d1sf+UQENFrLCd1TuueZayzIf9jgXWNmlOXqSxcxavauJYI6XISJObvk8tZkKfGgYb1QkNHFUIVMEfqVeFl/buu+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GkY5mUDoQdNfUw+jDqPPo2KTofXbYBH527YyDMssyg=;
 b=Ockyd84/JG8apaujb+hfMF6G45ZP+0GiYhg0/gAAoKrrca+4ZUrRfEbxy/U8Z7JikeaBSypIc3jdhFLDfQiZsjyAr1b1YDywHCYPJify6L4kDpnz/jD+b7AiLjU72599kLvl783IqEeKYjI8l9OKMNr3Yeh+R8Vcr9ph42EIPDn4jC2enFpkmkXZSQ6dCAfsvMyLShFnghIvSa8qftdQDiBrdF+jaNVMy4v90yDctJtFYbsOTl1LhdgG1Uuc9IlUXqhdaMPQ635S4ReqyhCPwuL4kLH9Niw/8Z5piINtU/YE5EwmrBWdxp5Qef7lIiaEhqbGM3pH+Y6Tei2g4Hklug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB2755.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:05:11 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:05:11 +0000
Date: Mon, 15 Dec 2025 22:05:08 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 1/4] kernel.h: drop STACK_MAGIC macro
Message-ID: <s5mlxqh3utetnuzfh3dwnv7v26awezmj5jikdtwahkfybwfzez@rj4eoap4kwt4>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-2-yury.norov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205175237.242022-2-yury.norov@gmail.com>
X-ClientProxiedBy: BN9P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::20) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB2755:EE_
X-MS-Office365-Filtering-Correlation-Id: 325afebb-f65a-4e50-acf5-08de3c4fed24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVpUamM5VkV0YVk2aW5ta043d1ZHTXgzbkRvSU55eW9MU1JHeXFCT29LelEw?=
 =?utf-8?B?Y2swblFhdEN4UXFYeTc3NDVwc2lvc3VoUjJIN2dMeFJ4Q0pBcGk3VjFYV2x4?=
 =?utf-8?B?L0hQQmpZWkZUSlVsMVQrV1krSzdMRU5qbG5EeHZCS1FGL0lONWJYeGJUbUVB?=
 =?utf-8?B?UkhwczM1OVZKdXcxaHNaUmlzY2kvdCtVTGZ3NWR1YjE3aXBTaGtNdXIwWGVl?=
 =?utf-8?B?bUtzUEFQMGFMUjNKbGZaam5hcmVDc0V0cmdPWU8rTFh3emExejFxaU9KWEZE?=
 =?utf-8?B?bnFnQmVBMEFXN1JrUkl2QlZWTDVKQVF5c1g3L3Rwdk1haGowZFFOL28zOVVk?=
 =?utf-8?B?MnBxakhVcmFkNHFyZVFlZ0ZxNllTb09wZXRiODZBM1lsUkIrc0FjTGx4RU5p?=
 =?utf-8?B?ZEZKQ3BnZ05QaDdjZElQQURKNDJSSnJjdG5JYmFnMXNNR0FEMm5rL1Y5a29L?=
 =?utf-8?B?VS9aZ3o2OXFYcm1kaDFJUHBCUVdyYk1Mc2Zpa2tzWWhjQ3IxS2l2dEdnNVZH?=
 =?utf-8?B?eFoxSFFBNEFSejQ1MmVwUm4rYjE1dUFONncwOHJVek5kNy8yYS9sTE4vM1gw?=
 =?utf-8?B?azNUbVhiVnl3V0tlWFYrVXdFWXBjSEc5dnVFRVFqODlCRnFaRVdjMUhwdUdS?=
 =?utf-8?B?RFVnT29qVTlXVGdUcVc4bEF6RkxIZ08yd1lYUldpUFJ3Z1lZOVlIWUJSUjNU?=
 =?utf-8?B?QUVFdjJZWnB1UHl4KzFLTG1XeXAxUHkvdCtueFlibTFtTTVJSjM4bnhJNVY2?=
 =?utf-8?B?Q3hTeUllaEhOcUE2TC9JdjdUUi9JUHhaRUV6YnNrWFhGS25oc2NBUE1GWU5v?=
 =?utf-8?B?MkV5N3RSS2YyczZyRVlWNjVEUkZBYmdKd25XUmV2Nlk1Q2FkRFNjaHZIb21D?=
 =?utf-8?B?M0oyL2NocERMSEcrRmdGUXhGeWRDK2tMVnBtK1lWaVR2ZGlKOHlJWGZsV2Nw?=
 =?utf-8?B?Zm5wS3lDVGtQK1R5TlV2eCtRdFZLRy82Qy9qeEdoaHRMSjQrYTNVajN1N0dm?=
 =?utf-8?B?N1JQaC9JWUZ4cG9sMDNoL3Zqemgxb0dFYUNUbzZRL1FKZHM5ZTlibGl0NUFT?=
 =?utf-8?B?eHc1Y3lRWmVrOXZaZWc0TDg5dEkwd3BhUmFaZkQyemhQNVl1QnhSWkZNdVd4?=
 =?utf-8?B?K0I1YU9rSXVSWVovSWd3ZTRLVXFSeVhhRkc3SjNtWDcwbFhQNUlYM21Zc1VF?=
 =?utf-8?B?RVkwUHlWcy9xNngvd094akhJTHVlQ2tncXFVSkF3K3BLMnlrak5TeGJ4aXMr?=
 =?utf-8?B?MVNUeStlaS9Qc2ROdWRkNmhUUkRhN3RscGVOWTgzSWdDRklDYThjVFMyZ1VJ?=
 =?utf-8?B?WDVCblk1NThJOXpCWnJ5Mng2OGVMNVdlWEtzbERSTTc3a1IvOW1VNkFXZjdo?=
 =?utf-8?B?U1BZQi9OTnhLbDdaY01VRVVJcktXYi9GWjA3QzhzYW1hdk9jc3ZsRVZWbFFJ?=
 =?utf-8?B?ZXB6RUJVZWxjeG1pZG9PNXFyWllsd0FvQW9MUFd4UFllYW5lajRIUmJmS0xG?=
 =?utf-8?B?clBMbW1GQXRGMGk2TzRvSGRZU1BhZ0UvbnN5SGczdUtQK1lVVkNoT1krdmJo?=
 =?utf-8?B?RzRuTTVXREQ5Q0VXOTI3K3lyZ09XS2JlV1h0bjlDMTZnU0x0SCszbGdXL2ZR?=
 =?utf-8?B?VFloN1hLNksvNWE3Wi83Szk5OFFuR0lYRjBhR2lBa1hmZS84UHNhTTFDNHlk?=
 =?utf-8?B?bFdXQzdub2ZFckVTNjhGVWJhY0lWcmRkbWd2UmJ2OHc4Sk9NNXNhUzhpV0Vw?=
 =?utf-8?B?eVNCczA0NURuek9lNnZHRVNCMUNKckpMSHZJYXkrVDE3NW5JQi9TS0lWVWNs?=
 =?utf-8?B?aHJtKzhLVmhQZmZmNmlLaEJyS3R2NjNkcEloS0QvK2dyMkszY05mempSTUpQ?=
 =?utf-8?B?V2hQNjNSaFFyUGtxUllwdXQ3SkI3U0gxa2JNQVB1RkNoUUV4RjJyWU5aRUhC?=
 =?utf-8?Q?Kv982WGs8TbJm8V+SqR6TrlKI0Vfmgcl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdoeEVheVdOWktKL2pRUnNCWDduUnB5bjlxbUozcWh6aXpGclVNYU1NRTRG?=
 =?utf-8?B?V0RsU0xHcSsyU3dRWktxc0NBRkduQTFZV01SalBHb0EvcUp3VFpOSCtNUnNz?=
 =?utf-8?B?M0dpTi9Fd3NUVTk5SzVBRGZnY0JjaWpYUjB1L1dwRHZ6bStqRkxockF2RWlN?=
 =?utf-8?B?Ymh1WmNMZU1NcDZUQ2lsWCtWTGxneEZkRCtkRGpoZWJORUVuWVovbjJmckVT?=
 =?utf-8?B?dWtSRkJrcHAvc245Vys1U0h5QW54Q0xOWGVmL04zQjJ3YWNhNk1VRG5mTE02?=
 =?utf-8?B?azZVOFZIZDdQSnpUWno4SDZRRHlxQVpzRlhxa0V2c254RmdwR0srKy9tQytB?=
 =?utf-8?B?RzZIVTZDY242d2U2S0ozUlRnWStFejF3S1dOM2p3ZkNnMStDWlNDclUwSHhz?=
 =?utf-8?B?OWtUd0NWWTl3eGdWZzNDMGVxa2lSR0tVZk5IMFJXMjZZa0ljKzFtVFZJcVcx?=
 =?utf-8?B?U2p1Vmc1Vi94aTk3WGxJOXRMNGhiYTh2ODJ2dEJvMlNKa1JFSzZXeDk3aWdm?=
 =?utf-8?B?ZDYxd0tkeU55YUdzU3FaNDhtQ2VldW1uakxWbk9rMUJLTm9Ya0JqcVJjTGZT?=
 =?utf-8?B?RnJNdDZ5NFd2WFpNOTZ5akVQaTROT0V5RS9sdXkyYzN0SXlybzVrSHhzNEU3?=
 =?utf-8?B?OWtVZ1UyNXBYRnJmYkpyNnh1SGczTTJ3clpCeWN2aStZeEdzTXNPcXA1WmQ1?=
 =?utf-8?B?L0x4L2tiVmFPY2ZaZ3R1b0VyVFgrRDc1WDQ1eEc5SE1QSWhhNXFvazI3T2NT?=
 =?utf-8?B?MEk2cjBEdHFhTUVZcjcrbGphN244M0dPNTY5eStnY1ZBRE1FRjhsR2owUTlE?=
 =?utf-8?B?eThvaGpZN3JWWlhidnVpYnBPOVU5aVRtR3FTL3dIZlc1dkRlbUZUbXg1eE9y?=
 =?utf-8?B?MWhzQ2F2c0FWdU5JaWw1TlI5azR6Znc5M3VudWZoZUJ4ckgwQzFVTVYwZWhq?=
 =?utf-8?B?N0IzUmoxUGNHQnJwdS9qTGpWQWtrcVFZdmRESllOQ1FqSmM3L2IvanFXWTJq?=
 =?utf-8?B?OHM0ZXI5VVp4R0RNclVabXZpUkkyK2xMdERmMUtwMEt4cWxLWjB2RmZ4aCtx?=
 =?utf-8?B?RXVkVmFYSzRFL0Q4aTFhSlpkcHdHVk9KVktPT0dXNGtKZmVabTRjUEtyMjBW?=
 =?utf-8?B?KzVZUGhVekRQNUJVNkxrVFRxT0FQbkdpa3M5NjZJNGFpdlp6NnVYT0lzdEMy?=
 =?utf-8?B?MitITlFQa2VjV29EemFreGRJRE5Zc3EzbXdZcmRsc2NwQVZBT2xVT0s0RkhX?=
 =?utf-8?B?aXVleU1XV0h0aGY1OHlLZm5SYUQzVnA2S1hydHpzWnVDWjJHYkVZWWhkV2dl?=
 =?utf-8?B?b2Z2TWFJNkFTMk56N0RId3ozWjliNWdTRlFaT3M4TWxaRnBVeGxNb0dGOG14?=
 =?utf-8?B?SDErWHMrQ251dkFPalZzQjBFd3Q3ZmY3MGpySDN0SG9jUUNpNVJ4VHdDbGhq?=
 =?utf-8?B?Qk83dGE4NkwzQWFkMzhneEZTSndTZTBnZlZXQmxCcmJ4RjlYUnJZajhiclp6?=
 =?utf-8?B?N0hlNjNZVy9RbjI3TUlXMGdEOXhQUHpzUitkQzV1aCt4WU4vZEFQMElvUjd3?=
 =?utf-8?B?K1RPMVdhL01nZjZDMW5JTjdpSTZ1ckZleFVGdnREeHVnWFZVSFBFTGI4dkE2?=
 =?utf-8?B?b1lqUDhiS3pqVzA5Q1lWRUp6T0NYZFRtYU1DSDVOeGMyUThoVnBwb2ZTQkkw?=
 =?utf-8?B?T2dXZUZxS2R6bG9EVUNKcndDNEdJcU12RU9xVGN2Q1Zwam1OYkY5a3pZcFBH?=
 =?utf-8?B?WEowdzJLR3padHIwK2YyeXhYS2RVV1ZMTXcyWERMTGRlTGlZbDVqeU5GVUYr?=
 =?utf-8?B?NTRnclFsekw4VGhjbnVWQlAxeXh1Wm94dUkwY0xtT3ZYU1cvL0J4QnVuOTF3?=
 =?utf-8?B?M1RQdzU2cXMwdGxaaWlCQnNpSm0vRHQvVEJBSjBMaGF4SWRuN21PQkIzZkxa?=
 =?utf-8?B?dStHUm9WcUw0ZWU4eEVHSlRsT2lXN1ZicENkK1dLSDdGeWZVcWhIeGtjeVJp?=
 =?utf-8?B?SkVkV3MzeTgzSWk3ckwyd2JsTkduOGxHcFkrRWh4cUUzTXVJNkhpRHZvb3U1?=
 =?utf-8?B?d3JxRXdzanRWWXJZYXp1bjBXdDgwYmVONVZZcmlubnZzQWJrZk1Cb3VNeHdm?=
 =?utf-8?Q?8FgabBRhYAFkuyE94bUmpCcGY?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325afebb-f65a-4e50-acf5-08de3c4fed24
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:05:11.4093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HHHMjWRgOECX9Me6RMnEGNb/43kcqEGhDMJxq6BOd4oQrbBMq/FdWNigNk0jXKTQ71iNezF+S22lDlbAz5QTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2755
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:05:31 +0000
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

On Fri, Dec 05, 2025 at 12:52:32PM -0500, Yury Norov (NVIDIA) wrote:
> The macro was introduced in 1994, v1.0.4, for stacks protection. Since
> that, people found better ways to protect stacks, and now the macro is
> only used by i915 selftests. Move it to a local header and drop from
> the kernel.h.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_ring_submission.c | 1 +
>  drivers/gpu/drm/i915/i915_selftest.h               | 2 ++
>  include/linux/kernel.h                             | 2 --
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> index 87ceb0f374b6..600333ae6c8c 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2020 Intel Corporation
>   */
>  
> +#include "i915_selftest.h"
>  #include "intel_engine_pm.h"
>  #include "selftests/igt_flush_test.h"
>  
> diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
> index bdf3e22c0a34..72922028f4ba 100644
> --- a/drivers/gpu/drm/i915/i915_selftest.h
> +++ b/drivers/gpu/drm/i915/i915_selftest.h
> @@ -26,6 +26,8 @@
>  
>  #include <linux/types.h>
>  
> +#define STACK_MAGIC	0xdeadbeef
> +
>  struct pci_dev;
>  struct drm_i915_private;
>  
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 5b46924fdff5..61d63c57bc2d 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -40,8 +40,6 @@
>  
>  #include <uapi/linux/kernel.h>
>  
> -#define STACK_MAGIC	0xdeadbeef
> -
>  struct completion;
>  struct user;
>  
> -- 
> 2.43.0
> 
> 

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin
