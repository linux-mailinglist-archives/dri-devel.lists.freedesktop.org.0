Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8ABF3EB8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 00:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5797010E534;
	Mon, 20 Oct 2025 22:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O1p5icxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442B10E534;
 Mon, 20 Oct 2025 22:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/CmHSnjLYn/aDVgewhMcTKag8nEQ/5A0abapRD3G1O5yrVo3H469HJEJ0J6ZW+lEIcV7Az280GmdTz5RzxM/CzyrHOiy1I1hqAI9IHIRCeB699/X/U9rdSo54yREHVdbqcbzdx0pnHq/cZEhP3IRimRW0WDQtL97hpnTIQVWtEZDzTMthLwplRHChZgZS02kTJr2z/Td5s1MjNawy9jxd04zNW+Rhcg3Z6/9KzD7XwdVM26EEi2kroTbraBbo1gnoe36xX9YQ6MeB9rap9KYXBMSGiAGSxgraCJiVjZClte+RPe9XaLnAEoyNylgMvZPgisLt3wGj+PosSjOPDZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz2wfVVq1OQ5va1YTf9IEEhU/fHeEHguPmQXsyymcPg=;
 b=S85hnQTCrsKVC7A4dul20kImX3q3haQAoHITV62nux/yxKQ1KmNsXn4PWQesG2EWujRmg7L31WkFESPq6JbkGYb1S2dYSdL8AZrXePDKt29YQXY0CYcH5TwzP3BQQt1tkyUnVDVvklIAdpMjCoPSWRUVLCYz3vgk5hSHnmdM7EeWbiJRth4Fy2whjB57mE6ZtD/jwzBBufc+MffEFDNc3V29gaSv0tsEWjf8c/vrXdawwriZQkGRpTWQHFkui7Qglnm7ADi+Uhc7PID8/gONyu3MpLXWQgIWw2kMJitguMvultMiHXspbVob2vY5Bjpz8rwtcuCx0VmQ2+PWP34B2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz2wfVVq1OQ5va1YTf9IEEhU/fHeEHguPmQXsyymcPg=;
 b=O1p5icxreWTjtIhAusf4Z4itptIlf35sIl+Ehmw+PsReTjAD/+CVpUd5Z289O9IYPyX62kJydJMpN5ucXeGqkfOIP1L4Qu6Pg1qpm24iz3sYmJ+9KQAfdGDgHCoBrGqzKapj6L9Yu5EUIM83nklz35WgLslgnOjf0P5z7RZvIAaywq0H2UgXm1pA9WkYU41Wl1LUiaAOu/iGySta0P1GD6GVFNkFAAaerhPG86o4XFewKU/6YrueIH+wYSlpNZZqhjFXCUTLTI+Xpyus5Z1P4718vcS9Xtf1G2f2I+ljoUJycsVJvUMTCKIuGaGYqAk5z1mV5L9vgALbnOIWcj2zNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 22:35:39 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:35:39 +0000
Message-ID: <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
Date: Mon, 20 Oct 2025 15:35:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
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
 <20251020185539.49986-6-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-6-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc95ae9-12ba-4f7b-09e2-08de1028fef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGRrWUdLck9GckZ6cmZVYlVBOWVtYUZSclZWSXUwK1l4QXhmdmZRRy80bGxW?=
 =?utf-8?B?VGlObjFpbDJ2V1g3cFJ6SDhpdmxPeFEzWXdQVElhWi9nd1hJYXFPZWZRVW5P?=
 =?utf-8?B?My9tazNEME5MTTVDcDJsUXJwbjRvQllFelMxZXNaQzZ5Vm9neVpacHYvTGJC?=
 =?utf-8?B?UmdJaFN2Q1ArRVVZNTFuL2RMRHEzNzcxZDluN2NRL1dwcHRxZ3F3M1lmV3NO?=
 =?utf-8?B?TGF4Y05PejJtMEpsVWhqR2t3RVlGVEE4QWhYVkNyak1Xb3g1TnBwNDBYRVFq?=
 =?utf-8?B?d1JtQm0vNGF0SGpKa0ZsQm1lS25GMnRTWXBtK3ZCTHM1SmkvZ0Y5REE0YVdh?=
 =?utf-8?B?eEZ6eGp1NUppbFB6Y3krd2laRE9vTGl2M3BWdDBtMUlnKzJNeEhXRlFrTEZU?=
 =?utf-8?B?YnRLRlUwOEdCTkVGeUNKSFNnUDNZazJOalA3eWRhUXFMZW4zUkpxM2lsM2NW?=
 =?utf-8?B?aWlUcit1Umt4dlp1NVpJb0JDRzBXUU9wb3BNSllnYlVpWlhDNXFSYysxblE3?=
 =?utf-8?B?QS8zc3BlZmdEQjh1clNyRlkwWUJhNXE3UXBmdGVXVFN0bHg0cjdpZTBhSzcw?=
 =?utf-8?B?Y0czbGY5TlM4ZzduME5HYzA0aERyRVlrUXB2dEhMdGozcUpYWS95b2h2N3JK?=
 =?utf-8?B?T3ozUWpHTGtUcEFrQWRpSzdwOUtEWXVnUElrbUJUaXVxZ2g4WGx0aGdWOGVj?=
 =?utf-8?B?YTlEb004dng1ZjY2RlYxWGw3aEtrNGRKYkZERVNBS1N4Z2FCY2JsSyttendU?=
 =?utf-8?B?b0RQdmx6UE90SVg0MXpSZzhMdVJ5WnpXM0txVGRsazFlSkV4dTJIT2F3SEMz?=
 =?utf-8?B?eGo3UitVRzk0aDAyVTZvNHMzMFlJQWhYOHU1MnZpeHhmMlA1NkUyekpJUVN4?=
 =?utf-8?B?WHdoeWtCamlwejU3VDc5aHRJaU9RSVVFVTZRNUpsMmIwZXlnckZueDRuRTl0?=
 =?utf-8?B?LzM3aTYyRFh2TUxBMm5VVi9OV3gzSEoweGg4VlNLSTBaMThXa3lNRUQxZDk3?=
 =?utf-8?B?TzlzNkwwYUxabnVlekgxdldnZWp5RTVOL0dJMUR5MUllTFo3a2F1bWc3WSs3?=
 =?utf-8?B?aUVEL3ljbnhUUTRpZjQzOEs1Tis4U1dlY1JYeGRXeXdGQUNSQ0xaN3hhRkhJ?=
 =?utf-8?B?YzhIQlRUbENYcHJwRkdoWHBDRitzUytya0tHc3JUenN4alRBbGhYY0M4eHhw?=
 =?utf-8?B?TVJaWVVkekwrWTNnbFJuakNnU0N0RGU3NGJKcndPd0thYnFjcXk1NVpxWkJ6?=
 =?utf-8?B?SmxIM0xzOVNtQWpIS1ZrdE9neUZ6bmtXcVZ0cndnbWtxaTg4bWlicGJManND?=
 =?utf-8?B?eGg5UE9XZjZrWFVsYzZqOXNTS0dNYWRUeHR5NlJKY1UyWHFPQ3RFbW9qaDlX?=
 =?utf-8?B?RTFMNGwyUDBRZCtnN1ROS2xBV0pOZEdBRkRRQ1FidnJ1K21PQjZuaTFuQU5Y?=
 =?utf-8?B?NFYvZFY2NEE5MTJPeHBSSTVYbFBiamhwS1dTcktkQmx5ZVg1Uit3Sjl0Z2V6?=
 =?utf-8?B?b0ZWMEZ2YjRYRHlaNnl4c3J1WWJ1eWtIbXVVS1ZwSjlhTGhKMDFTUlNJcmdN?=
 =?utf-8?B?Y2VlaFY2bnFYR2pvRDZnR1YrcDBwclI4Znc0ejFjbjlKYmNWdjRlenNKUit0?=
 =?utf-8?B?QUZuUEdNcTNnQm5uSEhwemtpaEtvMnF1akZCa1JkUmlXV0tBYzFLUWxFK1pn?=
 =?utf-8?B?RFhjcXptUlN5MkRtSTFpUnFzbDluelRObEdoSmlJVE1qUUpJQlExcnF0QlRm?=
 =?utf-8?B?eitVcTcyVWxTSmZVZ0pZZkpKdnlZMEtHMTE5c0FPdlJ6TWhyWDdBNW9NYTBF?=
 =?utf-8?B?c2p0eDNOU1grTXRUK0F5UVdKc2NOaTJGS0ZWc2ZOUXVHUWZnRnVNNTlaU2FT?=
 =?utf-8?B?SEVlZ0ZNY2haMXk3UUFsNWVaZCtiaStuanhxN1NjSzErN1B6aHFFTFdCeEdU?=
 =?utf-8?Q?Bb4xGpnsxc9AxS/RFpi8RtwR9eJQGB50?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bStJVmlkcHZjUGdtY1N0cVp3bHpoMFJyNVJTTEtUNklSSEhZRFJnMXVuRGcx?=
 =?utf-8?B?dnROdjhGQmJPVGlLTkluMmtadmpsbVVhTldEdHNobkc0clgrcHRHWFJ4UXdz?=
 =?utf-8?B?WURkQksvbTdmN0VEZGNkaFNtOWx6S2RhYndPN0tXWTd1VXVLaU4vbjVwRWkx?=
 =?utf-8?B?clhZV2hkS0RkeE1Yb2tOWnF6cDdObm03a1BxZnFPb0VOMzRlL1F3aXo4dzBY?=
 =?utf-8?B?cnlVaFRlV0ozZzNZbDYzZ2hqK3A2aXhzRlhtYkJWS25oNEgwWWE5ZmNCMjFz?=
 =?utf-8?B?NUt3TXBFVFZ2VkorUkZXck1nTW8zVDZXUzlBWGJGcHV3VmNMcUJzYThKUHEx?=
 =?utf-8?B?Y0g3bTFkbkRRY24zL0YvRU9vQTIwU1hFK20zaTNWTnp3NTRkL3VxTUxQdmxi?=
 =?utf-8?B?ME1obkppdnl2OHdjVTU2KzdNcStHbTFOczZJSGg2dytxZnNpYjFpTTZ4ZU0z?=
 =?utf-8?B?YnNXYlVOakpEblVHYTFYd2lqM3pVLzYyb0NxL2dSY0g4a09CajF6a2FVeXd1?=
 =?utf-8?B?WERRZTBmVmFMa21YK2Zzb2ZEeFpEWEtoUGE2SXMzdWV4OTJieHBJYnRyamFh?=
 =?utf-8?B?ako1WWVlUHV0eC9yMFRSWEN1c3BIalo0bHNONDMxUU5OYWQ3WjJydXBONWZq?=
 =?utf-8?B?cnJZTmpvaFpqemhrZFM4M2hKVHUvb2VDVkpDdWgwLzc0TG1RRk9PZ2poZlQx?=
 =?utf-8?B?aGdhL2FlYnI2bEt0Q1hxZ0diRHk0SW9iQk5PS3cwOUJlV1ByWDVnbXdDdzIv?=
 =?utf-8?B?NHJob0NUNjFkTXAvT3ZOM0VXRnJHR0dROXIva2NIRzRkUmZtTlhQbjMzT2JG?=
 =?utf-8?B?WUdKYkN4WWhxR1VBWi8yRWJ1SGxzR2pMMStna1lOdEswMTYrS1NIdmpqc0ds?=
 =?utf-8?B?YmVtYm9hdE1tSklqNFlCY0RsVHM3WDA5V1hVVFNxVnJnVVBIUUw2T09yTHVt?=
 =?utf-8?B?MGgrZHFrWjNFS3hQT3ZVU2tLMEJDdkY5VlJqTUNMVkpYOG4vSzBWaFRtcXRV?=
 =?utf-8?B?c1hjTU9OVHdqMHpzaWRTeGpXTnM0dlk0a1pzbnNlT3l3blhwYlJrL2VOK0Ey?=
 =?utf-8?B?bXVQY0dTaXQ0RjBMOS80YmIzM1hyV2JZbEN2b0QxVDRaWGt4UlJRZ2pkaDNa?=
 =?utf-8?B?OVhJY21ldjRNNDBGU2tKdURxT3NycHZWN2tOYlJHYjF5emJ3WkkrSHBBS0FX?=
 =?utf-8?B?Smd5SU5RWDhhZ3IrZDMrVGNEdnZpRlFkM04rNzZvcmlBRDFCY0I3M1ZpRnNt?=
 =?utf-8?B?TFJMemlHcUJld2ZzTXlYNWZXc3Y5YkZhWEJNQXB3Q0Q2c1VyQml5dlh2Z0Rw?=
 =?utf-8?B?Zy9jV2l5Skp1bW5wSnpZV2I4azdHUklML29PU1hJdVR1SHJTQmthVkpLSmZx?=
 =?utf-8?B?YXZuU0hkMVhnZHkyRXdCbFBtdFNpVnhuMUdPSEFtV1poS1JreU1iNGZ1aVNP?=
 =?utf-8?B?OGg0Q2NGbnRPdk11UGxrYmU2UEpyekd0SUV0WlZKZmFnYzNEQUs2eGF3NGN6?=
 =?utf-8?B?TlJ2dkZZOExIcXk4ak13T2RibWhsbG5oTVFvS2FOSXd3QTJkY3VJdFdMSmMv?=
 =?utf-8?B?MmN0Y2ZKWWtuVE1JTVVJY2ZyMG16ZHBVUVYvYjVFQ2lTeUdkYkRZdkVTTzEw?=
 =?utf-8?B?dytuSHFUWWx1YkV2MEsyY1Rxb0EwM1BKTS9kK1YwSXN3Y1dQTVFpSnc5MnQr?=
 =?utf-8?B?S0cwRG9Id0cwRElJdHJORDg5ZW9RVytyL1RDeS9DSDYvVG5VckZydHhhRnlZ?=
 =?utf-8?B?RGIxZXVPOUpvT296Wk9PUkVtc0JKQWhjMWNTSHNINjJ2d3ptNWFJY2NzdE5B?=
 =?utf-8?B?cndiN05Uc2JwMDllMHV4RzczRVRPZU5XaDNiTXdPV0svODY2L3VwY0lNVWZ6?=
 =?utf-8?B?Unl3VWtFd1JERFczendacDJ6NVRDcG95NGRRaWg2WHZreTNBOHhNcjVGVGI4?=
 =?utf-8?B?MEl2SUdDdE1YY1U5RVZyekFZQ3VZckxnN1BzNXF5aXpMVng0Rm9STDVFc3E5?=
 =?utf-8?B?L2FSZmFEaVlrOE0wdVNSb3l1TDlYU2NzMzhpeFdzN3gwekc1bUlJYkpyOFJk?=
 =?utf-8?B?Q0dDeTJ1em82MkhGOWwwNmgvODJFU0xHeG1jV0tqYU55Z3U3S0U0OEJJZ2tz?=
 =?utf-8?Q?OPl+EwMMXY7rtETttWl/1E75Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc95ae9-12ba-4f7b-09e2-08de1028fef0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:35:39.6146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtYxzwcKivuVgV8gQr78eQHPjiyt6Y7H4V0DIFVwFYDNYsZeWD7+cJZTJp4F7ywRadU7ep9x/FY5YiVeh9cs9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222
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
> Add support for managing GSP falcon interrupts. These are required for
> GSP message queue interrupt handling.
> 
> Also rename clear_swgen0_intr() to enable_msq_interrupt() for
> readability.

Hi Joel,

I have a few comments below, including one that doesn't apply to you,
but to Alex Courbot.

Also, other than some trivia below, I can't find any problems with this
patch, other than possibly the above commit message wording, so
regardless of what we do with the .alter() method, please feel free to
add:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/gsp.rs | 26 +++++++++++++++++++++++---
>  drivers/gpu/nova-core/gpu.rs        |  2 +-
>  drivers/gpu/nova-core/regs.rs       | 10 ++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)



> 
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
> index f17599cb49fa..6da63823996b 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -22,11 +22,31 @@ impl FalconEngine for Gsp {
>  }
>  
>  impl Falcon<Gsp> {
> -    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
> -    /// allow GSP to signal CPU for processing new messages in message queue.
> -    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
> +    /// Enable the GSP Falcon message queue interrupt (SWGEN0 interrupt).
> +    #[expect(dead_code)]
> +    pub(crate) fn enable_msgq_interrupt(&self, bar: &Bar0) {
> +        regs::NV_PFALCON_FALCON_IRQMASK::alter(bar, &Gsp::ID, |r| r.set_swgen0(true));
> +    }

Alex, this ".alter" method is misnamed, IMHO. Because for registers,
The One True Way (or so I claim, haha) is to have the following methods:

    .read
    .modify, also known as RMW (read-modify-write)
    .write

"alter" never shows up in this naming scheme. I'm going to claim that
this is a bit jarring for old hardware/kernel programmers.

But it's not too late: these are only used in a very few places, and entirely
within nova-core, too.

Can I *please* send a patch to rename "alter" to "modify", perhaps?


> +
> +    /// Check if the message queue interrupt is pending.
> +    #[expect(dead_code)]
> +    pub(crate) fn has_msgq_interrupt(&self, bar: &Bar0) -> bool {
> +        regs::NV_PFALCON_FALCON_IRQSTAT::read(bar, &Gsp::ID).swgen0()
> +    }

Joel:

I am guessing that there is never a situation in which we would *disable*
these interrupts, right? Just thought I'd ask.

> +
> +    /// Clears the message queue interrupt to allow GSP to signal CPU
> +    /// for processing new messages.
> +    pub(crate) fn clear_msgq_interrupt(&self, bar: &Bar0) {
>          regs::NV_PFALCON_FALCON_IRQSCLR::default()
>              .set_swgen0(true)
>              .write(bar, &Gsp::ID);
>      }
> +
> +    /// Acknowledge all pending GSP interrupts.
> +    #[expect(dead_code)]
> +    pub(crate) fn ack_all_interrupts(&self, bar: &Bar0) {
> +        // Read status and write the raw value to IRQSCLR to clear all pending interrupts.
> +        let status = regs::NV_PFALCON_FALCON_IRQSTAT::read(bar, &Gsp::ID);
> +        regs::NV_PFALCON_FALCON_IRQSCLR::from(u32::from(status)).write(bar, &Gsp::ID);
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index af20e2daea24..fb120cf7b15d 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -216,7 +216,7 @@ pub(crate) fn new<'a>(
>                  bar,
>                  spec.chipset > Chipset::GA100,
>              )
> -            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
> +            .inspect(|falcon| falcon.clear_msgq_interrupt(bar))?,
>  
>              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
>  
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 206dab2e1335..a3836a01996b 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -198,6 +198,16 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
>  
>  // PFALCON
>  
> +register!(NV_PFALCON_FALCON_IRQMASK @ PFalconBase[0x00000014] {
> +    4:4     halt as bool;
> +    6:6     swgen0 as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_IRQSTAT @ PFalconBase[0x00000008] {
> +    4:4     halt as bool;
> +    6:6     swgen0 as bool;
> +});
> +
>  register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
>      4:4     halt as bool;
>      6:6     swgen0 as bool;

thanks,
-- 
John Hubbard

