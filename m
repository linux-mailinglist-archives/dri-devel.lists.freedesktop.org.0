Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EFCACC927
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 16:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F85810E679;
	Tue,  3 Jun 2025 14:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7y6RqxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906910E212;
 Tue,  3 Jun 2025 14:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMBZ7h9nTGfTlbkXWVIBi/taHgx0h2vJ7jwVKIqFajwWy+LKFtH8drj0x4e1vJyyXF5ojp6v3XZuZQaDUGFs2e389WL/zEKCDKqipS8VFBnmoygHi5xQQ8tUI2ERn9WxpVFx7igaEt2eVT2634Vjve0kT/SRr+M9uFburzQU53/SFffYExiSQhp/uyz1MAUblXe7jY0Xm75VNCkKgcZG3e/q50TEIvgeEYOp9SxeuTYEuNwGjqRbLCajieYM9ErAfcHwNm/62QCerIuwknrEeeghIX06eJl3N921UzbHXY8gmk+jHsSDhe1FQR93BlrLSvt3E9ouF45kCQVMXBK5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSfdLyNAFz8mBCTj3LSOHOQA7urkhAEreHKmJDBLWm4=;
 b=Z0YK4mt+c5c6uohufx4u4t86+l+2fM4IVJ1dM7f6MhsWxF4UzTGJhgBcjW8IMUYrDgwLXzO0yYoOX3YE+Ijb94NZ+1Iw7vXGUmv4iYQ9IcQllc5KcB+gh0nQDQgrWE4Tz9hezjBUi9KoRuTL2t3Go+jj66NsZwNdEeG8Mohewl9+a1JecEfx5EniYqitZ9P8ACmAwODwmWsiKjOzyFp/PKhaJ0NalcPRNgquZXZOmzGgAWf4HfOiygXfFA9giqWPXj8/UZzgCYO56ZRi0DblX3v1/t6O/C6xUQFa1aMs6lXRJcEnM9Shwh7fZq3lryYrQ7fyvVxDUKzugIbTZ1mdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSfdLyNAFz8mBCTj3LSOHOQA7urkhAEreHKmJDBLWm4=;
 b=f7y6RqxKcTT8n3loc+abNTAZaCgGpSg4owT7El5tv6cLMSRaFJTDOw8DXekVjRLJ+j0ArelflIvFRR0U172ogrWt9tbcE2Jdkkh2tD1JPvIVTwmqnXNJp4EQ6/sPEpe20Nibfn0q0Dy6ig3j/GZ+VRN/0b3Ic2VDUtcQ02Meu6GrwmAvzMCTRVMB9Dr5kdHcR405iltXZcKTumqwwjqv7oXb0MTzWCxLoV8+aMHOAImcvNJxnBZOZUDQHYP8HqGuSFPAE4SXCnUwJ0wo/3Gd3C5TDHvtvEOUqv3g5i94+rKfMCl9Arg2ImmX3sUofxo6MK4IJJuT/IczuQL3U9IKqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 3 Jun
 2025 14:29:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 14:29:42 +0000
Message-ID: <1057c8c0-26c4-4c62-ae7e-ca4d9cd532cf@nvidia.com>
Date: Tue, 3 Jun 2025 10:29:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <aD2oROKpaU8Bmyj-@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aD2oROKpaU8Bmyj-@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0062.namprd20.prod.outlook.com
 (2603:10b6:208:235::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5ebf61-24c0-499c-3853-08dda2ab1460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTc2WkxKNFlqcnFWR2xtcUgzdGNlLzIyRWFFNW02T2MyT1UvQlVYTTFXbG9X?=
 =?utf-8?B?QWh5VTdDNGRDTFlub3hzQ3ZDYTNnUFcwTUdRaWwxWkdUUm5XMlp1V1B0YWpP?=
 =?utf-8?B?NFdCcXpWL3hHMTcvSENvMys1bGJpN2JBOFd1QXlreUxHSW4rTHlsZW5ETUYx?=
 =?utf-8?B?Y2NpQ2R6WElibmNwdEdOQnBSdnBPZUUyS04yNnpEKzlxTzdUbGJmanZ2U1Ir?=
 =?utf-8?B?ZFVTeWRFMitjQ2NDYzlzTHFpVjA2akhnblpKM3ZMT2VVRHBCeE1NZitJS0hY?=
 =?utf-8?B?bWFRVGU2TW9CRzVvNjFxdHNJNjBoZk52YlN0dm1NRXVYdkwxbkxwRGwrSzha?=
 =?utf-8?B?UFc2ckwrZUM5eCtBbTFsUlFublJWa29XTXNhMFdRSDQ4WFdrUzVwY3VVNjhS?=
 =?utf-8?B?ZG9nY05zMUZGRlM2MmJCWGlnUHpXZkdKa3RXSEp2Y05PMEc0R3NWak1lYkJO?=
 =?utf-8?B?OG0xeExWeXEvM3dHcFVHNk5TaVlWQzN0K2VNUmV1L0M3T2dHRWRJTSt1Tktu?=
 =?utf-8?B?aFZ6NE5udU16QXBrQVlvaUYxa2JQcldEYVBheXBCN3hOeGV3VE13b3hQMWpB?=
 =?utf-8?B?N0tDMUdzbDFYTGlBd1dRSFJxQ1lVTTZaT2RxRSs1eFp0Sm5vWW9MemZQSVJu?=
 =?utf-8?B?TkVCdnZmV1RhRzMycHlnKzg3aUF0TE9QajFxR3VZUzQ0YTB6eHFaRDNiTVBN?=
 =?utf-8?B?RmpNOHhraU1zdXNsMG56bW45V0FPdXBmU2J4bDlWeDhyemdldmtiZFcxZTZL?=
 =?utf-8?B?QlVrU2J4d2d1bENPbFZVZ1lUTmhDeFk1emRSeDRocnBBNm5Wai82WkdMNlVa?=
 =?utf-8?B?c3hHQlJkRlRDQm5LWXJsU3FDamEvdVQ2Qk50c1pMMVU1bWx5czAvQnVobXJV?=
 =?utf-8?B?eVpzaFVSZmtBcW4xTUdIZXN2dGxlMzFwRERZN2JjY0ttUEk5UEYyTGUxaThW?=
 =?utf-8?B?dm5hUHRZR2tCaGlmbVN1UnBROUZHUS9ETmFpSFNNUzY3aWFoWjNabjk2QkhI?=
 =?utf-8?B?cEllQ0xzWWdJNTFqdFQzbUg2amRjRmlObURtaENWUmlhSVhqUlNNcTNGekNr?=
 =?utf-8?B?OFcyYWhXd0lNQ0xrQ1hjTSs0VUtvMTNnaTlRa2lhUnF5MXVlbkFpd0EzaE9N?=
 =?utf-8?B?TVZ1dFVjVDE5ZnQ5MUtEV0NtUzZGcXRweDJUbis2dTRQeHlGakFNL0owY1Fs?=
 =?utf-8?B?aTJ2T2FseXF2RHUyY1B2dmhaSmE3VTRPcUx4dHpGcG5xRnIxRFBYTVF1dWQw?=
 =?utf-8?B?Q2szaXJNaUxRbk02eGEyczBQaGxkZHFDV243R29CaWt4dXhDN2VWL3lZRGlS?=
 =?utf-8?B?VTlqdUo5cjU1RldXTDUwZHRqWUdJQnBpQml6Vy9ZdmFDY0phWFdMVXlSMS9h?=
 =?utf-8?B?YStvSElDdk5GV08zUFl3YUZzb2VvTExvS2UxeE9LSERrMUx5cmJ3ZGhMY3hj?=
 =?utf-8?B?TG5VYlFNSGx0YU5jZVZIeDNGTG1WeFdhQXoxcGxONFdOY2RVcVNTM0xqOXUy?=
 =?utf-8?B?NmVlblZ2cWNMSXE1WVpxaisyZzR2UkVLaHBQU2x4c3VKeWM0RGNtdHYwcW9K?=
 =?utf-8?B?R1MvN2h0ejNiN0RlTTNLZWtRVUtKOElLbmxkSmsrWnNxWVF3aERiN2FveXZu?=
 =?utf-8?B?WG0wZUpabmg3TllBcG9DeUZtV2VhbkVEanl1aktEVWFYK3FMSURGMzQwdDBX?=
 =?utf-8?B?cElnM3hOWXR3cFk4YzYzWWpjRlhGbmtoY2hmNVNrT3puTDd5QU9CcGtiNXhW?=
 =?utf-8?B?b2dmZjJiNGFGb1U0N0M5YU9CSnRrZzRNWllnT1BSM1JSVTIxbktOWXJKTEFz?=
 =?utf-8?B?TXkzL0dyOE9TQklyN0ZzZjJiWFNiU0s4WVlUWHg1SzgxVytNRUIxZytRLzhr?=
 =?utf-8?B?SjNYa0RabzF3SWFadm1xN1JzUVFqRnVJWEVDNjFXS1VENFF5S252aVp2bFhB?=
 =?utf-8?Q?t3NN+xIGoLA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFMra1lPTHBlZm1paDZRSVY0QjhWSjVDb3p0b2xHY041K0RQUUxSbVBMMGI4?=
 =?utf-8?B?Qk5hNFhyNncvQVlOczdCTTAzNHNoSzFtdEs0b2d0WkVSMHRPUjNZYXMwOGVG?=
 =?utf-8?B?TzAyWnJCWGlWQXJKd2Y2SGQwVDVzYk5zQ3RPMm00cGNRaDVKM2JLQVV1ZWFh?=
 =?utf-8?B?SW9RM1BiYllGdUl5QytRUUptRHN4QytFdmp1OHJpWjd4T2JUMW5XUEtNYWdr?=
 =?utf-8?B?d0JaWGkyM0VYVUc2cFR2L1ZZT2FrYUhrc1FDTFc5SzZuWnNKZzdYVGZvSG04?=
 =?utf-8?B?Si9zNzhXZ2NSRExFMFJIN3M3R0pZbXNjT2J3R3lUaE00eVZycndrODhnUEhF?=
 =?utf-8?B?MEdRWG1YMjFJRmJVWmdUSlFwZk5zcVljODZGcm8vbVJ0a3JVVE9HQ3d5azBZ?=
 =?utf-8?B?SGlyaUNtQU1tTVBQdDJuTGFsSlRsaG9pVFhFOW5oRnpDQm91UHJHblR3K2or?=
 =?utf-8?B?WHBLT3JVYjJBUEtzYmZLWHB3dklEQ1JBUW1BNkdQRnZNZ05hQkk3OTd5Z3RD?=
 =?utf-8?B?NDF3VVlINHN3ZWNYTnR0NXAyV3V3bTl6T3FyNDhRSitFd3FyK1ErMzBrRytn?=
 =?utf-8?B?cEd1cVYzSXpWQ2h4My9uSkpxVDE3Rk40U2FoSlRHU1hjN0lWWkRZVzl0azlJ?=
 =?utf-8?B?UXlTVFZSNkZHaWtqTVlEeEtCUU1lWVMrbE8zU1VETXpZQWV6NHd0RmpxSGpY?=
 =?utf-8?B?THZxdEZSSU12NThaOFg3YmxKcjhyWnNFOHJ4U01Fai9uVGwvVFk2RGFaeTdl?=
 =?utf-8?B?R2ZJQXF2cE1mOWZuUjlBWHJ6V24vOTQ4ZTYweE9FdC9LV0g0amdIRWtwR3pk?=
 =?utf-8?B?ZW40cEMrdSsyc1hxaTdDem5RQ3p1Rk9seDc4NmwxbUQ0dDZEVUNlWUt0c284?=
 =?utf-8?B?NDZLd09ORFYvZ1g4OGNjaGdPYW9rNUcvVnlKb0pnNXZwNGdLRWJSdW5xRWpv?=
 =?utf-8?B?Wkp2YlZlL3VQWnExZnlmVldja3ByWmIrNDdyd0paeU9FY2crREpZUEZBdjdp?=
 =?utf-8?B?Y0gybElwMC9qZ0VRTTlQUkRoMnJWOVhYSzE1MDdhRXJqV3FqL2VpNzgreDh0?=
 =?utf-8?B?UEs5QjNNRk1rOVZNVFlYZ01ON21yb2JkWEU5b2lrcExoNWNKMVhXNUJhOWNx?=
 =?utf-8?B?KzZuTUxPQ0RPOHI3VnREQXE2ZVRqYXNZb2VuWUlBaUxOK05CQitWcnU4WUIr?=
 =?utf-8?B?VkZoRy9TQzA0SXNaSXJjckpBbjV1SGtqZUlweTFpRTQyNzFncC9WVndvMTRW?=
 =?utf-8?B?YklMYklnciszc3QyRVplRS9ZcWxSUFdoYUF4THZ2ZW5yZEF2bW5lSStCbHlm?=
 =?utf-8?B?RHBYWDJHaHNTRVQ3OGhaV1NzS0tPV21tZDFUa3MxVnNmeWkrOVhNNWxGVWpp?=
 =?utf-8?B?eW04d1hCMjlOMmJWQVVIcEVmbXo4UUZVci9JK3dQQkJTUGhqUEhBMkVZSVc4?=
 =?utf-8?B?UUZnajh0ckFCSWZZZWg4NFhLdmFVUG4xY09nOEZRcFlabGl4azJJTXY5cGFS?=
 =?utf-8?B?NmU4bElnT2hIQzlsQitSZ21TbU5yWThmMEp3YjlyalhJNTVRdE1HblFpejFG?=
 =?utf-8?B?bWJKMFkxRnlSU056UmtPNW1sOGRvcHVnZWxyRjZ3R085dy9FM2EvcTJtWHJu?=
 =?utf-8?B?SWx4TVc2bXV5aVp6cTVsZk4zK0xCSWtjTFA4TlBQSExtQnhqcHFaTm1yN3Iw?=
 =?utf-8?B?Skx1WjJrZVhpaG5pM0UvYkpsVnRhazJTTGE1czZyT2lGL1dSM1h0bXdZdmdR?=
 =?utf-8?B?QU0wV1UvWlZWbmp1aExHbThDRncwbFJmUzRNZWRkMnVMTXRpTGVKRjd0TXR6?=
 =?utf-8?B?MnBzQysyNGFMTFN3eTM4cmJmMEZFUi96cFJJYXQ0L1N4cUc1cW5PYzdWR0NS?=
 =?utf-8?B?Mm1MU2ZUV1NTUGRyM3QzVGZ0dndFUmJzNms3Skl3T3htVW44S2UzNlR0ejl5?=
 =?utf-8?B?TWYrOTJFSzZOdG5PaUJaTy9OWFlTQVd6V0RqTmRoZkw2cm5kdEpxRGU0cEpS?=
 =?utf-8?B?dSs1dnA2eE8zM0t3QTQ2eUZZeG9ZMDBXYXY4eXkwcUQzNHRJOVVzL2NMVXZs?=
 =?utf-8?B?VjdGMFFGb213SW1pbmsrcnFtTGFUM2Nzc050MWJhelpXUnRQQWdnd3dyV050?=
 =?utf-8?Q?xn5s1mHpYIQQaxSdegNhsPC2T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5ebf61-24c0-499c-3853-08dda2ab1460
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:29:42.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2bXRyoCx9XHLsILQlQJeH8IsbVOY5eXd1KH74N5Z7gIxCBI5+swIOk+7oe0cKAZFC3WXU9F/1YpObAW1ohZgA==
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



On 6/2/2025 9:33 AM, Danilo Krummrich wrote:
[...]
>> +impl PcirStruct {
>> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>> +        if data.len() < core::mem::size_of::<PcirStruct>() {
>> +            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut signature = [0u8; 4];
>> +        signature.copy_from_slice(&data[0..4]);
>> +
>> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
>> +        if &signature != b"PCIR" && &signature != b"NPDS" {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "Invalid signature for PcirStruct: {:?}\n",
>> +                signature
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut class_code = [0u8; 3];
>> +        class_code.copy_from_slice(&data[13..16]);
>> +
>> +        Ok(PcirStruct {
>> +            signature,
>> +            vendor_id: u16::from_le_bytes([data[4], data[5]]),
>> +            device_id: u16::from_le_bytes([data[6], data[7]]),
>> +            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
>> +            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
>> +            pci_data_struct_rev: data[12],
>> +            class_code,
>> +            image_len: u16::from_le_bytes([data[16], data[17]]),
>> +            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
>> +            code_type: data[20],
>> +            last_image: data[21],
>> +            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
>> +        })
>> +    }
>> +
>> +    /// Check if this is the last image in the ROM
>> +    fn is_last(&self) -> bool {
>> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
>> +    }
>> +
>> +    /// Calculate image size in bytes
>> +    fn image_size_bytes(&self) -> Result<usize> {
>> +        if self.image_len > 0 {
> 
> Please make this check when creating the structure...
> 
>> +            // Image size is in 512-byte blocks
> 
> ...and make this a type invariant.
> 
>> +            Ok(self.image_len as usize * 512)
> 
> It should also be a type invariant that this does not overflow.
> 
> The same applies to NpdeStruct.
> 

Done, that's a lot cleaner, thanks!

> 
>> +    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
>> +    fn find_in_data(
>> +        pdev: &pci::Device,
>> +        data: &[u8],
>> +        rom_header: &PciRomHeader,
>> +        pcir: &PcirStruct,
>> +    ) -> Option<Self> {
>> +        // Calculate the offset where NPDE might be located
>> +        // NPDE should be right after the PCIR structure, aligned to 16 bytes
>> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
>> +        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
> 
> What's this magic offset and mask?
> 
>> +
>> +        // Check if we have enough data
>> +        if npde_start + 11 > data.len() {
> 
> '+ 11'?
> 
>> +            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
> 
> BiosImageBase declares this as "NVIDIA PCI Data Extension (optional)". If it's
> really optional, why is this an error?
> 

Good catch, me and Timur were just coincidentally talking about this as well!
Indeed it should not be an error since NPDE on some GPUs doesn't exist.

Will address the other NPDE comments separately since I have to do some research
first. Thanks for double checking.

>> +            return None;
>> +        }
>> +
>> +        // Try to create NPDE from the data
>> +        NpdeStruct::new(pdev, &data[npde_start..])
>> +            .inspect_err(|e| {
>> +                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
>> +            })
>> +            .ok()
> 
> So, this returns None if it's a real error. This indicates that the return type
> should just be Result<Option<Self>>.
> 
>> +struct FwSecBiosPartial {
> 
> Since this structure follows the builder pattern, can we please call it
> FwSecBiosBuilder?

Yes, done.

>> +    base: BiosImageBase,
>> +    // FWSEC-specific fields
>> +    // These are temporary fields that are used during the construction of
>> +    // the FwSecBiosPartial. Once FwSecBiosPartial is constructed, the
>> +    // falcon_ucode_offset will be copied into a new FwSecBiosImage.
>> +
>> +    // The offset of the Falcon data from the start of Fwsec image
>> +    falcon_data_offset: Option<usize>,
>> +    // The PmuLookupTable starts at the offset of the falcon data pointer
>> +    pmu_lookup_table: Option<PmuLookupTable>,
>> +    // The offset of the Falcon ucode
>> +    falcon_ucode_offset: Option<usize>,
>> +}
>> +
>> +struct FwSecBiosImage {
>> +    base: BiosImageBase,
>> +    // The offset of the Falcon ucode
>> +    falcon_ucode_offset: usize,
>> +}
>> +
>> +// Convert from BiosImageBase to BiosImage
>> +impl TryFrom<BiosImageBase> for BiosImage {
> 
> Why is this a TryFrom impl, instead of a regular constructor, i.e.
> BiosImage::new()?
> 
> I don't think this is a canonical conversion.

The main advantage is to use .try_into(). It also documents we're implementing a
conversion from one type to another. I am not sure where the boundary is, but
when you requested me to get rid the other TryFrom(s), I did that but I left
these ones alone because I'd like to use .try_into() for these. I think it makes
sense to convert a BiosImageBase to BiosImage since they're both essentially
similar. Alex, do you have any thoughts on it as you had suggested this for
other usecases during the initial nova-core stub series as well?

Btw, .try_into() does hurt readability a bit even though its more of a
short-hand, since one has to work harder to know what type converts to what, so
I'm really Ok either way here.

> 
>> +    type Error = Error;
>> +
>> +    fn try_from(base: BiosImageBase) -> Result<Self> {
>> +        match base.pcir.code_type {
>> +            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
>> +            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
>> +            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
>> +            0xE0 => Ok(BiosImage::FwSecPartial(FwSecBiosPartial {
>> +                base,
>> +                falcon_data_offset: None,
>> +                pmu_lookup_table: None,
>> +                falcon_ucode_offset: None,
>> +            })),
>> +            _ => Err(EINVAL),
>> +        }
>> +    }
>> +}
> 
> <snip>
> 
>> +impl TryFrom<BiosImageBase> for PciAtBiosImage {
> 
> Same here.

Same comment as above.

>> +    type Error = Error;
>> +
>> +    fn try_from(base: BiosImageBase) -> Result<Self> {
>> +        let data_slice = &base.data;
>> +        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
>> +
>> +        Ok(PciAtBiosImage {
>> +            base,
>> +            bit_header,
>> +            bit_offset,
>> +        })
>> +    }
>> +}
> 
> <snip>
> 
>> +impl FwSecBiosImage {
>> +    fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {
> 
> Please add a method FwSecBiosBuilder::build() that returns an instance of
> FwSecBiosImage instead.

Done, I made this change and it is cleaner. Thanks!

 - Joel


