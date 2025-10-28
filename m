Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD0C16EE9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1160410E665;
	Tue, 28 Oct 2025 21:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n+ocqqM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F7E10E665
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPcIh77+ZpQChORaYZkC5DEAfyj5rx9AKZnezG49uTFWVOpH7bQDkueD1Yo+beynt7vlNTAOGRKDRz+kv8PDRLI4rG6TIdj3DJXvzL6Bgf4DB7ojLWj75MAPphSWJMz3wO5bTYk12MN1ofOmzrP7yN8+9K44M+d6hd3WwX0E4zAvhTme13UkyjCNeKVhhaNhPDMe2vtcEfYB3gzvk5jS6mQ3FJJ8YpMfkzXArO1d9lmxrflisR1solgX3//huWQlck9XORQkBkM1hghY7u0b+VupDDjYjC6FhaKE879c+izA3ilZOxfpll6damtfGd7ZcLQ75BqbsO0xpm/QlgUe5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9WDKCHuAleYKQeynNeCgByQt36+WltB2uEoMzrv/as=;
 b=V+FepL1jGabsqhjItFXbfvXMFllxfSBO8iJXT5bCY8zkQ/XsRkJ8wOiKOQw5wjlgzlbmpH7tkXdAY9mkvqWq77lZG6zt0i07tN3X/s+PflPnqIe6f1VSBda4P4MLRDZLcj1lVf8xjjojF4cLIm98i2r8WrIb9/NA4Zzr4hAAKn+b7k/kd8HZy4rjx1vC+mcrnW5b7x4rKugUoD2ZcBPOSkKt9NOlNq53MassxuX6Scc78L1k3kC3yga3nRlrOAqcC6vlCRhyJHSk5ZY9AlbdtVwDrB5wp6l1aGEqYt9zdcXP7/p1VoOO7mezS+k3THC2sv+tgiqEycECEQUIAQpvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9WDKCHuAleYKQeynNeCgByQt36+WltB2uEoMzrv/as=;
 b=n+ocqqM40HLcXY/kyteV0MiZeoeW0tmAJ1hWGsStieD8eCGYvQL+Yol972VFlN4qievuMXHUyaCvkBS5TLp0Gl/673TGY3ILtvv6IckkEP+iJ8q+1MY2c+7QCiZEVIYcP+9cm2GStNZjIduP7LJEGvuceVMzknR8JqONz9tuDX3Z2cbMtUP5cKfykgIDSrPPtE6uew5L1nr7UYzwoqldB2UDl4AOffDUBcjn/VZKenYv3z65TXZqdFMxRp0Im7Jf1qFqgRVOuJ8LNi1sBOfwFQQXGFnWQUKqpkRQrqZNbDgDl22/tilP4b2Hx9tBNS4RMWx0uT7VOpaXYNXQIxZmvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 21:23:29 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 21:23:29 +0000
Message-ID: <99fd44ff-85bb-4892-90f3-381843feccab@nvidia.com>
Date: Wed, 29 Oct 2025 08:23:20 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] KVM: s390: Fix missing present bit for gmap puds
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, akpm@linux-foundation.org
Cc: borntraeger@de.ibm.com, david@redhat.com, Liam.Howlett@oracle.com,
 airlied@gmail.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, byungchul@sk.com, dakr@kernel.org,
 dev.jain@arm.com, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de, rakie.kim@sk.com,
 rcampbell@nvidia.com, ryan.roberts@arm.com, simona@ffwll.ch,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-next@vger.kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com
References: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
 <20251028130150.57379-1-imbrenda@linux.ibm.com>
 <20251028130150.57379-2-imbrenda@linux.ibm.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251028130150.57379-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: ce87335c-3917-4235-e086-08de16683ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFhZSi9XalM2N1ZhWFJ4K2NsZ2JReWVDY0tlcVdXTWFyaHIxQitObWJKRGhI?=
 =?utf-8?B?b1pJYkEzYzVQdjBuVktLaExPZVgyWUlwc0NYcDJGcHE2N1QvczVucUdqanVN?=
 =?utf-8?B?ZHZsL0JWdEhjTzRjakx4TzY4eUNnYmdsVG1GWmZwRDJublVPSmNia1hEYXJH?=
 =?utf-8?B?OG9URW9UUTdxM2tHbENKTXpTNTUxVE53ako2MXcxK1Rzb3RhdnN6UEN3ek9E?=
 =?utf-8?B?NlAxeVRUM2xTNEt0dDF5eTA4UTRPTlhnc2ttOFd3SkxaVno2enZsNFU2YU42?=
 =?utf-8?B?TVdWcXVKQjVjd2dLUzMraVdlUWd1MWVvL1NtVGVTdXYxYjRsYTBvbHl2RXM2?=
 =?utf-8?B?aytMVHZ3dWhnT0ZyWWtFeUlRZDBwZ1RGRnZXNzBtcEhta2hYZ1pKS29Hb0Ry?=
 =?utf-8?B?TXA3MFpwdE9JaDQwRHhUeGFOWHR0QzVYOURlWk9DM04yNVZCVWdLaVNpMzUv?=
 =?utf-8?B?M1pmZFM1aTZGUWQ4U01EVzN1Y1ZURFppOGlldkc0MUFUbHRtNXd1YzBRd1NR?=
 =?utf-8?B?dFVrL1I1S3UvU2pWRlB4eGNIbUowM0NFMGVhRE1HS1ZGTmNYRGpFS3ZyWHQ0?=
 =?utf-8?B?ZmVLdVpIbnRydXdpT0daRE9kdUF5T0Y0bnRHclBYY2lEbHZuZlhqRjY5SEla?=
 =?utf-8?B?TmlEa2RySXZtTDAyVHZRemEwN2RGdmhpSlBTOWdEemc0U3JTdGNrUVBGMU56?=
 =?utf-8?B?cGJUd2gyWmtDQ0h4MEViZWRQT2pZbDF4VkVzMVpCSElPM1RXbi8ydG9LazVW?=
 =?utf-8?B?VFJhTEpweHZlUU94TUZRWTR2ZW02ZmgrZnN6Ylg4TjdycFE4VEdlWnk0eEtp?=
 =?utf-8?B?QmE3TjNPNmliN1EzYWY2bVljT2hNeXVuU3pGanlXcnhSOUlEZUdrYTh4TGVB?=
 =?utf-8?B?RU1uN1ZBQWJYTTk2ZFdSdTFhSTBEUE5wMGlpOEF6QVdCQ3JQQmdQQlRISVU4?=
 =?utf-8?B?WnRwMnpNNUM2VFhUaklkR3hIbi9ibjdyR3FiRWVnWm5MaVRCOG5kUVMwUFpq?=
 =?utf-8?B?NWcxajNydVAvckd5VzVZZjR0WGFFWEFHajFMcFArYUxMLyt6YnRYTFcvT3dD?=
 =?utf-8?B?V0lmdzN5NVliVWtpRkxqaSs0WkRLSTg2ditmSzIyNnZoSTdjd1kvWllpRUk2?=
 =?utf-8?B?OW15ejh1QjYxeXhkeFBvSzZ4Qml3QXIzalJBRlB1SjBmaVZLOHNNM3RObVMx?=
 =?utf-8?B?WE9rYU5EVHl1Smp2ck9xMmMyQTQ0THZRWjM0ekVCZzNLZVBLYTBsL0tpZkNE?=
 =?utf-8?B?Rmp4cldoRjgvMW50eHhEVWJHQ0UzUklQMmZyOTNINE9XS3ZjaDVVemU2a3hB?=
 =?utf-8?B?TlpKSmFaNUVUMjlPNVUwTUFnM1RIYW11NEpnOU5uQW9qQklWWEpRbkgxdUM4?=
 =?utf-8?B?bWdOVnVjUzUxMVNpMk94dzBRTnZYMlpPMlBBaFpsNzNKWXg5NWMwUzZLZnFS?=
 =?utf-8?B?WXgwb25YdUdTSW9iaHFuMDloMWNzUStqa0Y3VnQ3T3dxRHNZZGxRUHFCc2ts?=
 =?utf-8?B?bTdhMW50b25UZU9vaHh0cmRhTnJSQllsNklMZDJRV3l4WjlpaGhaOGl2YVBz?=
 =?utf-8?B?a3p5c25rOC9vV1lmaTF0M2FRZDMydWIxalhXNlIyeWdDSkV6MVZ5bjMxZWlB?=
 =?utf-8?B?UzAzNzB5N0drQjBRMjRmcGc1ZjNobThrR1ZnTmI4Wk4rcFMzb3Y2OFo5cDd6?=
 =?utf-8?B?dVZaTWdJcUhsNy9HR1pvVlE4SUh6T05kYnVtZVByMGhDaWFaMUtUYndBY2k1?=
 =?utf-8?B?Tks2a05jZzM1Y0xCL1ZnVzM1c3IwMXBQNysyZ1NaRWpGL1RYNE9wRkZNVHg5?=
 =?utf-8?B?eFdFNDJQYlZzanpyeTkyR1NqYzJHR3h4c0F4MStmQmJzcWlLb1RBT0hidi9X?=
 =?utf-8?B?WXJWZCtySXppejltSVRHbmpFZWFMNEkyMCt1SzdzaXUzZ2JESVJ0SjlRajBL?=
 =?utf-8?Q?toxLO/Hwmsb37pV52ZSDAZAwp8TD8Ogf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnBhRHBTcnpoRWNPd3RUU0FIY0thdWJaWG11RGFaUVhsN29jbnZtVWxTaytD?=
 =?utf-8?B?aHArTEJBeC92cUExU0dTK0xWWWJ3cFg5QUlEWUFZaWtHb3lKN0xJd2t0LzZD?=
 =?utf-8?B?bXV0U290U0c1UUFVVytHSGhtNWY4TGJPK0lnR0NEMGRSYVFMUC8vQzl6TlBs?=
 =?utf-8?B?eTJMbWdTV1JpVzZPS2h5b24zUEIvamNTMVpDWFByYTJBVmFSVG5vRng1cUx4?=
 =?utf-8?B?akJCR24ySUlqZG15RHpKQkdtdTlncGxiZTdadmRneDE2ejNseVJRL1htVHdQ?=
 =?utf-8?B?MDNzSHlTMkJOMWVScmxvWkZ0a0V1enY4K2ZDZTB1QlRIU1p4REtoZ1ZTV1NI?=
 =?utf-8?B?R1lxMVNJS3ArYmNMakR5WnJudGRldzU1U1hBbVBOa1JQTUx3MG9JNTBwc28r?=
 =?utf-8?B?ZVc0ODgzMzNDdUpIRkVIdW9pL1A1VXQ5eWlhN296OXNDdHUyVEpiYWluUDNz?=
 =?utf-8?B?bE5vSHJrRWN2ckw0cExpb0NqRkd3SUoxa0NnV3Q2dlA1Qll3elR0T0l6RnhS?=
 =?utf-8?B?ZXVFamxZakdFNk5wT3A1dW92KzFta0VuSS94ZlBoUlpSQUgwTjMwaS9RSkVW?=
 =?utf-8?B?TmE2bDVieGhHaHh4L0RMMDdWVHZaR2F4Um4vUUN0Y3k0QlFKRzYxSC9CWlh0?=
 =?utf-8?B?NEZuQW5UVkU3TXR6VVlaMkgzR0tHOWU1MHVEdTNOTjh3TjBCbHRCZDJpU2Fx?=
 =?utf-8?B?OXBlaWVKbDZkSlBsMTFYRXVWcms1eE9XK3Iwam1uc1VMQitwQ2JrZkZVZSsv?=
 =?utf-8?B?cFFjdU9wU3lKTGRHUCsvNnhHR2hBeXNoUG9XRkt1dVMwSGJzRW1PQ01hQ1oy?=
 =?utf-8?B?ODZiMmt2dSt2andtak1NQ3lON1R0c3N6Qm4zMWYwam9Bb0hhc012dmp3QzB6?=
 =?utf-8?B?ZlFNRnZycDJoQU1PMDA5UFpOT3JxOEZMWnFjSWVMb1BPS1F2TGUzT052T0dE?=
 =?utf-8?B?c3E0V09OOTlvWCtRdWdXSkNxOUsra0xKMVV5b0t6VkMxYllBS1hwb3ZmRENJ?=
 =?utf-8?B?VlJCUFlGOHEySXZNUUk1Y2txa3MxSktjd0JTRGtHQUQvVHlHL3NrMHUvOU8y?=
 =?utf-8?B?eGpPdjY4NHk0aHdpcDlKSGtPYUhGMW5MT0dsZkZCWnM2aStNU2RNaU9sR1NM?=
 =?utf-8?B?U0hmNkk4Y3k4Znk3cS9ZT1FsUnNhbWxkVEdPRHFXUlpXTjRCQlViMUhzcWtB?=
 =?utf-8?B?MExKWWZZOXlUTmR3bzhISkZZNC8wd2dKWW9OZFRFTXFiRVYyVWN4WjFxcUhM?=
 =?utf-8?B?MjBFWXZrblExbzUrT0NaRFE4aE5ucUJRSVFuT0RNK09NbC95YzE2cFpram0w?=
 =?utf-8?B?a3NqMDQyZkVVOHArZDlSakZKY2RjMDNjZnhnY1o4ZUhlV2pkeGZnK1U3NG1u?=
 =?utf-8?B?d1NyeHQzN1RneUJqQTFGcXMxYzZNRkc4ZGQycjQ1MUlSNWFhVGEyZ21DSzN3?=
 =?utf-8?B?YnBmSnhxQVpnREhjeUs0dW5JVGJPTVdTbVNpTDU3R2JmUjFMYWl1UzlSZkNP?=
 =?utf-8?B?MDRpZzR1QTR3bWZYbm5jK2cyY2M5ak9SNnJobktuQmNrK2x2M09vL0pJbFVL?=
 =?utf-8?B?QW1aVlRzcXAvQWVqNlhEWWVPUmRMWDNmTWxmcitNc0lDdTc5VEU5WEVBNUNj?=
 =?utf-8?B?MEZKUlJxRGNOL1RXb2FHUmdGUXdBQTJvN1NjbnN3TVNLS3hHcHNlZ1hGb0lN?=
 =?utf-8?B?czc5d1BWdURZR09EbzJONSsxclJtU0VmSEVhTnc0ZjF6YnhIMjMwaGVkL2tP?=
 =?utf-8?B?UHFTTkVxNDJ4Sk05RWVNQmFBeklUN2xWemNmSHE3S21IV0RjY1RiV0RKUVhs?=
 =?utf-8?B?N0R1UG9SSjY1Q2hkQkFuaUNDYVNoUVdhWlJkUWV0b1NWQVN3OC9GejZnNWFo?=
 =?utf-8?B?QWpNblVtV3VGTWppUVFyWkxmL3E4RFBSM0lUMGtmcms5Z3pQSEJBUkRPZTFB?=
 =?utf-8?B?YlVrek5zK3BROVZIRFhmMzFVNWVKZnF1OVJ1TmJ1dFhLSlg5azFqbFN4YVhS?=
 =?utf-8?B?ZytkdklpOUZ4MnVtTWlQYnhmR3JSdFY4aGU4RmMxWUlpTU8xVTVubHgxSnFT?=
 =?utf-8?B?TTBwTzAvaWZWSzU0bWpDaFBKVmVPdjVESzRCRVJCaTVHaWkyK0tQSTRFWWtn?=
 =?utf-8?B?RjNmQjUrUGRKYytRU1Z0Vms5aEFTMXhOZ3VRa1ZGRFEwWU1yQThWaS9WYkh2?=
 =?utf-8?Q?SOrK9iSyiDeHIaFSpit/QEQz7rTTJig9DD8RGfuysOln?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce87335c-3917-4235-e086-08de16683ce7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:23:28.9238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9GAiXpl8wbEPMYkMosIeP7gqRCsQ4FFf7pFf6gfbEdiMj48+dPcSaDcH14yJNVSvCMgM+YetsE5ssg7O3cPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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

On 10/29/25 00:01, Claudio Imbrenda wrote:
> For hugetlbs, gmap puds have the present bit set. For normal puds
> (which point to ptes), the bit is not set. This is in contrast to the
> normal userspace puds, which always have the bit set for present pmds.
> 
> This causes issues when ___pte_offset_map() is modified to only check
> for the present bit.
> 
> The solution to the problem is simply to always set the present bit for
> present gmap pmds.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/20251017144924.10034-1-borntraeger@linux.ibm.com/
> Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>  arch/s390/mm/gmap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> index 8ff6bba107e8..22c448b32340 100644
> --- a/arch/s390/mm/gmap.c
> +++ b/arch/s390/mm/gmap.c
> @@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
>  					| _SEGMENT_ENTRY_GMAP_UC
>  					| _SEGMENT_ENTRY;
>  			} else
> -				*table = pmd_val(*pmd) &
> -					_SEGMENT_ENTRY_HARDWARE_BITS;
> +				*table = (pmd_val(*pmd) &
> +					_SEGMENT_ENTRY_HARDWARE_BITS)
> +					| _SEGMENT_ENTRY;
>  		}
>  	} else if (*table & _SEGMENT_ENTRY_PROTECT &&
>  		   !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {

Acked-by: Balbir Singh <balbirs@nvidia.com>
