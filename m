Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB39CE9EB1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042F510E1F8;
	Tue, 30 Dec 2025 14:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.b="dBYbn3FU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from YT3PR01CU008.outbound.protection.outlook.com
 (mail-canadacentralazon11020080.outbound.protection.outlook.com
 [52.101.189.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021910E1F8;
 Tue, 30 Dec 2025 14:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7MFn/wt9+b0IubkS3+hnAMbNzvHIJs6gj11CkXlZdkwAYqrvas76IXiNOTyuZXa9JYZKyR4CUIveFgZYI+ln63reEeRpVghgJfIpvyJ6+LApuYLqkJ9RsVpivOyFnNpFXTJPSHH9gkDIe6VkHriwS9ktUNWmzirWYI0+k8XxC9V0pSSd7XeNzvfpXxgMHxpTSi+40Ex2cwi8EPje3QT8c67OyG2apT+svx+ATO5QvU/2VaSeOax+gDhmXRkDpUdjK5jaZKSzbob+4u2djj2w/c8tc0K5nHxUJ8vzHhhM663ddnqJM8z6Nps9xU8JkCxR/2XJaazH2M79PwGeb3aCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmfOm970tR0LMfVhppECJYwa31qtTvA7VdHsreylcy0=;
 b=b4FEQOdTnsgtfp9nfCzIyJjb4Txv0Dw+q6gvaBSfqLpLcI1gGeMO+GOSQYwtU7jnZAg5c4zDhxsLUqlVVGE0VSQH/JeHRB2NIvZU2PFq4qPnOpIMnq5o7SiHdTiz7juuSPmw7U1fM1MaefOVWZoLNp7NbTkQPUfo/5nAYCrw1CreT2hgoxwFxsZLR4ZOkDR2wm/okAyMzC4etrFCmb+E4MxRSqozJy4vhTMJpTcwSFmEUv7Mb4fNaVSH7kAheQntyW8RXVfhUQZiuvbO5NIulgRpraMc5B0nmoQlpPcpFcgmvT+Xtc357PFzeOAQDIsdwRzO4gzsb2aQhs/qr1uBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmfOm970tR0LMfVhppECJYwa31qtTvA7VdHsreylcy0=;
 b=dBYbn3FUM8OpJ3zUhI4YcRuiN2Mvp+duZAFXmB8IfYS6pTZtbLRmXAKybWQWb5TID7mmkLKSKGBybTKWQXBhLWsCq6U6a3vpcDHLHJJkyZaa4XWAULe4s2alH1/hwiMeuHD3WB3dSkU48KZAoqgz8E1vDGewuxWJInhmleh2VEVPzBdxgJC0E1ydpmZ2Z4p/VxCz78RC/73TNX5azPl5615aDoRXuCRg6Ge4nD+cy5nOdpq6lPSD76l2TPOYHQf72j9oERBBTitkIXZcjEtbS0lCR+QQgAMezaMND1P8GsjZ7q9EkAzfloXama8jX+zzWDSFxoI3Ptp2qr8Fv5pFEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB10796.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 14:21:04 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%5]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:21:04 +0000
Message-ID: <71767aa7-0247-4bcc-8746-3338905197b3@efficios.com>
Date: Tue, 30 Dec 2025 09:21:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
 <aVOTbArAxmbT5LY9@smile.fi.intel.com>
Content-Language: en-US
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <aVOTbArAxmbT5LY9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0345.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::19) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB10796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d66e775-d2bc-46b7-a473-08de47aeaa4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a003RE0yYk1ra0FKRXZ0ZzRjT3B2U2toTkhYMXFVZlhQeXpHVURIekpmMmhl?=
 =?utf-8?B?Z2tTYUk0VGh4MnhlQVZBZFA1Mnc2WVVFZzJ3cTUwTGtXMXpPR3RIMlV3V1My?=
 =?utf-8?B?UzVIRTgwTkNoYS8zV0VzMmJBWkZxSVBYTTdsLzJaSnZ3T2tpL0Jhbk95T09j?=
 =?utf-8?B?YVpZbVMxdEQ4enViVWNkcm5zcEJLVVlucXpMSUlzNkNDU24vNGF0QVpTZnJQ?=
 =?utf-8?B?cmtYTEp3ajZHYis1bzFteEt2ZFpDQVNCMXc3Y3VuUHN2ek5DZnlyeXl5RlJG?=
 =?utf-8?B?cEVSYmJPL01tdTNFTzNydGVmbjJNODl4MTBUYW9KZHVmOTNqZUdUZCtuclMx?=
 =?utf-8?B?RnZXaE5oc050Wk5uNmtkWER6V0huSWdXMW5KR3J4V05BR0lZZ1FwWVUyNnFw?=
 =?utf-8?B?M1loWHVhZ3Eza3N5Vi9BclY4VFc0WFZUZE5iK2lIQ3JJTlhRUnBsNGpGSG1t?=
 =?utf-8?B?bzVvTGtkcFh6ai9URlRoL1BlcFhCNEMrUFlMdVRHSitsRldJQzhZT1BoRmtV?=
 =?utf-8?B?RHpTM2VzU0pHbFJVcm1qNmJXUVorT3duZ1djczd5dkZ2cktGaWhyYjBpeTFk?=
 =?utf-8?B?TExNUEV3MUpUZnNuMlJTZnRxUzNzdWdzUnExVmd3MVdPSzBZMHVCTUxnVXRC?=
 =?utf-8?B?NHFTOW5YQTlVclVOdVZacGlxVk9SbWZYSEVkN1YvQXZLWVNsazdjSTE5RnpT?=
 =?utf-8?B?QUdmY0c2SDRCUXlpUEFLOHRuaFlKcVlXV2hPelpuZFdLYndMRUYzbnZVZERF?=
 =?utf-8?B?YWptUVp1WjRCREtBVld1YktJNDlMZWl6WTRCbFBwUlFYWXJNWnRJdTFVQzVO?=
 =?utf-8?B?N2NXeFk4VTZIb3VQSUhCTXY4a3JVcFpibHpiWEFpUEp3dklSRmFHV0wrZVFK?=
 =?utf-8?B?YytsdGRKTHhkWmp3MWFMOHFtWWlLcFpwSlV4OHRod0tsNWk2Q0lqOTJzaU9N?=
 =?utf-8?B?S25SSHkvTldNcXpDMzJ0TE9ZUmdVN1kvd1VzblBKMjdYRnZlRGpyVWdldGNM?=
 =?utf-8?B?aXk5M3FrVGRVd1hBL1RqQWtlbkFhbmwrZnd4L0d5YXc0TGd6NXdnTnVTWitK?=
 =?utf-8?B?N1ZoU2NXbk12NVp5ekpwMDhBN2hPU3dWRk9OblNzYUM3a0NHU0JWNDAwempT?=
 =?utf-8?B?R0VBc0gyOFlRblkzOEpVSDcza1JxTVRLOWxCclpvVUpWVW40REhNUXF0WHhp?=
 =?utf-8?B?Z09GVWp3TnpWem4yTU9VOE1TbkZaTXF5TDlyV1R0dmhHbzRtOFowbkVIMEg5?=
 =?utf-8?B?SVpiRVRVYmZjZldmUm84ayt3WGhOcVBUMEtVVXhVQ2pTaEZKMUNLUlQ4NURi?=
 =?utf-8?B?SUZuVnZQOVlHUzFCL1JBRE1SL0VqTURaQkZibXNFNkl6MnQ3SEovSi9UL1Qx?=
 =?utf-8?B?ZW1qYUFza253ZjdTRGl1ZnNTU1FUeVE3ZHQvdUxxdk5GSWdxeFNyY3JiMVVC?=
 =?utf-8?B?MjQ5VG1MZFMyM0J6QzVlS0o0WE9reVlDV3F5V2szYnNCUEVNckR4NDhMaFFt?=
 =?utf-8?B?TVpqbjg1alpyYmJjRnFzanRYcmora09UbXZ2YjNyQlZUT21NWUE2aUZETTRG?=
 =?utf-8?B?SjNKVXRoY3YwSnA2Z3VtYzl0Wm02c1N4QU9OTzU5ZDJoeWFKdEt0a1MxUUtW?=
 =?utf-8?B?dHhmTWxXa2JmcDlLeUNKVm1WL0pMdHh2YUF6b3dMRkdoc29Ra1JzTEltcHYx?=
 =?utf-8?B?aEViSlVSbmlQU1BydjBVYlk0TkN6VGhpcEpTcFVqUEthYnpJTjlmK3RBSWUw?=
 =?utf-8?B?NktyRXdqZ1V1KzdKVnp2eFp1T0YyK0ZZVEtIdXJVTW5yTndHVEVKaFBRekxy?=
 =?utf-8?B?ZGliaTNSUURFak9GeVdsWVJ6YVhhRk1XYmtxaE9sWkliU0IwTTJDbHNEZENN?=
 =?utf-8?B?Wk5lUVhzbW1iVzVpYVl0VnBaOTZKNjNIS2ZodnJLbGVSZWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2hvZUxrem9kdm50NVUySFRPVXZyenE2eXRwZnFJSVpqOEhYbzZyNGd0NVZw?=
 =?utf-8?B?dVhONEZEc29MVWhvVmVVQXlPdk9FQ0JIZUdvdkZIRExUaG01N3U1Rno1M1VL?=
 =?utf-8?B?cGxsd1MwUFhJdFhpQ3IxUVdETkVvb3diaHVSWnRNSDNDQWVzcjlDbllXRmxE?=
 =?utf-8?B?VTBzbzZ6bWJBQS80YkdhcW9RNlZHbm1vWVh4dHZ6NmJaNlhndCtyVUJLblp0?=
 =?utf-8?B?R0gvbWZnYVdjTngxeUt6VVBJWC9BdCtnaExNd1lEdEdZQnZNR241Tm1jd0F1?=
 =?utf-8?B?QUVFbDRSK2pKM0hycVc1a2lWajZxNDkvTUJ5eHBQbnMxcGhvdTR4NzZ0Yk13?=
 =?utf-8?B?dHhram9LRWNzTUlFK0xZOUFUMi9VVTFOdUMrOUcrd21RZGx0MWt4MGQ5RWdw?=
 =?utf-8?B?SFNYcVF6UkJDQ1ZOK3FiU3ppUEY3V1hzMWlBcW5Rb1ZpRDBPZ2ttMGY3WENk?=
 =?utf-8?B?Mnlucnp3OTNlTU9zNmJLZ1ZKK0E4TjlCMHdKR1JldmpEMXpPWTR6b3l1QkNX?=
 =?utf-8?B?UnQ2SGJpTzVzLzI3eWM1TUYwZHI2OHhiRGw1d09vdE9TQ2RhcjVkUFBzWkdK?=
 =?utf-8?B?YlQrZlVtbmUvSmlxY3VhY2hycVhpZTVQRk82dkM0Z0srQ3NzVk00Q2xUQnlq?=
 =?utf-8?B?RjhEdEEyZWpMNDU5dnI2R2JKVzBlOW5wb3JiMkUxRHdpbzdSc2tjUXF2MHQ0?=
 =?utf-8?B?M3RYVUtaaENSOHpXYzNDR2xxMU9zVGthZFc0VDdLaTVyaU9BbHZ2RkU3RjR3?=
 =?utf-8?B?RG5mWVRtdDdqWUp0QWQ5N3JPRjFNZWxvRGpVVDB5OGwydXlRNExDODdsVWFu?=
 =?utf-8?B?d3hsVm9sTGRsR01xZjM3ZVdkWUhqUUhNNkFBYlVhbUI1ZExNU1JpYUhERzJY?=
 =?utf-8?B?NGtFUXRXUmp1dDFrMFpHaDRoWi9UelBMQ1R1RElPZDlCTkN4WXM3cHFFTGQ4?=
 =?utf-8?B?V2VzdE5rT3V5R3NqU2xoQ09ycmRuLy9VY25JOFhyNjRwMGhjbUpyNWhUWU1J?=
 =?utf-8?B?emR4WDkzN09RVHNxYXd0cG94Q0YrcXNYSkhqODFmK0ZwTHljZmdsR0Exa1Mv?=
 =?utf-8?B?UGJhYVFvdUNMdkZiU3dPbG1oemVZNW9tQWtTQjMyd3p3OWdCd3ZTTThLUnVk?=
 =?utf-8?B?cTBhenZhMlY1NXk4Vk5Pb3JOV1UwSjZ6OTBXS05vR2pETHRDNDZrbk5wVHBV?=
 =?utf-8?B?V29ZM1pkblVONk5QTEM2MDIxWXRLY1Ivb0QrMTZybmd0Q2dlNFYwb3BYSnFF?=
 =?utf-8?B?eEVkMG1LUk9QZEl6Q05ISWN5bmxhV1Y0TFY5WDg1RU0xOVp4YWZGMnlzYVhY?=
 =?utf-8?B?VTRlaWd0T0JPK1dHQWJ1cjdINHFhdGFwREFNaG1nRXlmVTZ6SnRaM3RNdFFV?=
 =?utf-8?B?Vko0bysvMTBxNjhhanhDcTBabkpSblJ3UnZxamovSmFGYkE3TmU5SkkwbnFI?=
 =?utf-8?B?RXk0V20rZG9qOGZiRnNhTTJwNDIybWpKVlljY2EwMkY1NFl3OUhzQUxnajQw?=
 =?utf-8?B?Uk1rRjdZOFdTZUJ5OU4rQnlxWHdOY3RyRG12aVJBQmlqS0hYeEEzTUNvbitE?=
 =?utf-8?B?aE52dkQxU2NOZWdHdW51K3ZnbTZBTEk0Y3pTK2NIWjhmK2ZjZ1VwdGQ3aml4?=
 =?utf-8?B?SS9ZVnNOQTV0S1JSNmtJaDc2SzdaTGhzaE0zb0dtRThaSXVyb1BEbWIwMEln?=
 =?utf-8?B?eDZzaW9HZ1RxTHh0cEloTkx6N1B3ejN3eVFyR0EraEtjZ2RXUmFHMnVsSVc0?=
 =?utf-8?B?aWNrM0JZd1l5UDY1OVFTYS9VbDNpYk41cFdKUlcrNnhyVmJmbmxaSjVUQmtX?=
 =?utf-8?B?Vzg4UTNXWHZyWFlRbzcrNzQycUIzblJ5N21ncmNyc3d6SS9FZWk0NDhZVS9h?=
 =?utf-8?B?eVZ1eTc1ZDJTQmlDMWJrVy9SdXF5TWFoRC8zQXlEZTdmeEQvS3RSSVBvODl5?=
 =?utf-8?B?bzc3Nm5xMmZzWVZKVVdrQXRCUHM5eHB5dUwzdEtMalovL1UwWXBycytJZGZB?=
 =?utf-8?B?M3ZTdm5odEt4ZDFnWitUYW5OMUJqTEozVk5tNUNGOVEvVU9jSi83ZXl6M25T?=
 =?utf-8?B?UXBuWGtyUHh0VWtZV1FCMFZBbnRwam11WlVYNlU2UFB2ejhOalVCWUJIOGUw?=
 =?utf-8?B?SnIzc21ZZFA5YzlidUN3eUVuRUpKZGVPcDFBTjZWN1RJK1ZHVURqUmNRYTdX?=
 =?utf-8?B?SzMzSk5ianFFZERJQzRhYnREa2xnWDcwQi9BNnFjaXpCZElYM3czVnNUU1ZN?=
 =?utf-8?B?MDZTTDhmT0FTYmQwQlNLVlR2eTloejdvYjhRaWhOQzIzRGRhbzM2b3V5TWVJ?=
 =?utf-8?B?bkJHMkxXbHpPSzE0akRFdzEyUXpQYmY0RklDRFFubzBYRUhvQ2VVYzB6M1RT?=
 =?utf-8?Q?G1HflB6xF7D/RPzA=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d66e775-d2bc-46b7-a473-08de47aeaa4c
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:21:04.1974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJCCHMKchYxyXY2sxleL8Lpf8nRlze7XuANf1WfsibXtaT/a9uWrNJvXAoUhd8ucx13la9EGZISrZKd11VMOIEoEo2Np32tJkrC4uEnrDRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10796
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

On 2025-12-30 03:55, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 05:25:08PM -0500, Mathieu Desnoyers wrote:
> 
> ...
> 
>> One possible compromise would be to move it to its own header file,
>> and introduce a CONFIG_TRACE_PRINTK Kconfig option (default Y) that
>> would surround an include from linux/kernel.h with a preprocessor
>> conditional. But please make sure the default stays as it is today:
>> include the trace printk header by default.
> 
> "by default" where exactly? The problem is that kernel.h is a total mess and
> it's included in a lot of mysterious ways (indirectly), and in C you _must_
> include a header anyway for a custom API, just define *which* one.

This patch series moves the guts of trace_printk into its own header
file, which reduces clutter. So that's already progress. :)

> 
> Based on the Steven's first replies I see a compromise in having it inside
> printk.h. If you want to debug something with printf() (in general) the same
> header should provide all species. Do you agree?

I don't have a strong opinion about including trace_printk.h from either
kernel.h or printk.h. As long as it's still included by a default kernel
config the same way it has been documented/used since 2009.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
