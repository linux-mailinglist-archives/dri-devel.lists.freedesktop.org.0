Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21700B9C30D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D3110E7E8;
	Wed, 24 Sep 2025 20:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UN1w0mVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012056.outbound.protection.outlook.com
 [40.107.200.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BC210E7E5;
 Wed, 24 Sep 2025 20:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysBqPQzWOR/pMG842uicRY58pmjEAQmW7HT9vU6w+iJKlI1JoF7OdxQziSr3G5cY1k632ytNsLHxvV7NwfiOFD+0YPTU0mkXfUSJU8lLLB7Nmkqt38TWyejosRhFLCpXZ0FIkDdZfXmUx8kz6cLKdQKUSbG3BuxQ7joIpqb+sJsbw3Ekd6EilI2CtUjuzyCPx8LPcmbPscHja71ZZHI9DV0zbHjItR8qahhZxDHRrzNn0FrsS4v1u2FPuR4e3fJpNwFQtGn4toOapKpocjXs/bmzAXVlzFLpknWg6UTiLU3g7XF6sRiTqlshawSfPa+Fb/gHQ1/OZem5bttLVC0X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6il8gdNs96HObSNJEhlChOOMDSSNF8fwTfgGs//wvK8=;
 b=WM7J+SETu4QNACA/LYErhHw0KASRD7mwSpyzow0KLEj1T4xUlmNlwAeuiK9JobmlZpdoqycZH6El8KZtnIYZvpXxhCI67UAtUHigHhl6pFXHE/yDhxWu4Gvk4Z6bLHq6ABaBT5vkuD9p4+WoZj7lsxuTcDUcFK3GN2sT8iZLVWNtewDoNCMWrTPoG040otob5w3XWZFux7pbPZobW/2IBwceKXoiR50qkBnmuCUNFt17m3H2qSMOFoc8sL1q8Q6nFKc7oeSN0bcZUzyYGtmW9uF+WjJzEntoYBWYRKYNgve55xJH8z2H0EP3CNmBhzgaf/WbGF3FoXugtznLJlsgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6il8gdNs96HObSNJEhlChOOMDSSNF8fwTfgGs//wvK8=;
 b=UN1w0mVTQfEOBHelrFBqwODop9XsS8MLUxo2h0BrT0EXNbfzcXeuMfw37GgHXLEdNLhbId4oddMikRZG4HzUpv09Yta6yi6FGABA0+jUfUpjnv7jUhy+MFtSR6W7+ngBAWRc1DgomL7sz4bCraBg7fQbUqV5Pd1aikOBPQX0jgbEwE1SqOYq7una6RyK1MGi7nvU9ZCUanI3KBCiUxXzr6r4ir+nnvPKv17YvLCyGbsG9d88nh6IsFae/BCySa2/yOeAdbLREek5hZzEUKhcJ2Vt+81al2+5pgf+l1xGY3T8haa3Lj9Qim9xE7EfsQ0VcdiglWfhO62WqTWp2R6n2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 20:50:14 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:50:14 +0000
Message-ID: <5edf3123-4721-4a02-b5b8-9556804b248b@nvidia.com>
Date: Wed, 24 Sep 2025 13:50:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] gpu: nova-core: Create initial Gsp
To: Lyude Paul <lyude@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-3-apopple@nvidia.com>
 <8c754dd68b7caba32888a5b33fac4e4c5c8d6991.camel@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <8c754dd68b7caba32888a5b33fac4e4c5c8d6991.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5fe4cf-e49e-416a-2948-08ddfbabf5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SldGOU1qZEhjWnJ0OEhxLzl3R1loa2FUZ1ordUpZeC9wdGxvV2d1THFpQ29a?=
 =?utf-8?B?WWpEMmZLWGEweElSK3ZDZlVBOC9KYk1ucFRiUzJYeHNZTjNQMEZEY3lSekVR?=
 =?utf-8?B?dExWWUhSS2hiN0RodUNyTlRJbnpHVzd3MHNFaWE0blZvN3ZFbklnWnJsSDU5?=
 =?utf-8?B?c2NlbGFGN3ZOSjFZMFpXbG9JWGFDWFZVTG1aQWRHYXZaWXBMeVR5aVJPMVZt?=
 =?utf-8?B?ZTJZYWwvUzZERHFtaWNPb09aNnVFK0oxR0poK1pWYTg5MGtORlRKTUZFN1JR?=
 =?utf-8?B?NHQwUXUwUTFsV3FnOEZ5U0RkNmtFQm9ieFh4dmJ6NEdXeUFkUk5JVEk2RzlU?=
 =?utf-8?B?UEhyWm5mN3BVWTR5Tkhwek5IVmsvQ3duVmtJUWhwcTRoUHlYdCtsbHBwVWt4?=
 =?utf-8?B?SEhVV05YSnNCOFhudEpMWTdBM203RHZUMU1NL1JONUdMUGhIZ21qTkFyRVBO?=
 =?utf-8?B?Z1RCeElCRXdsV3VKU2RMWXdHTmVEempMMmJINWJaOFZQc2VKV3JpeGxZRjlP?=
 =?utf-8?B?SENEcFRETkdJRHZhSXZITXdxS2VyNDZIRWtidGN5aml1b3hmYytCV0tvL21x?=
 =?utf-8?B?SlRZQ1FLaWREb3hrUHBxUWNBTGp1bnFkYkZVZmliRE1aem95ZEF6V2Zqb2Ji?=
 =?utf-8?B?WUsyR05aTFArRDFhUnNQSkZWRm5scEdkckJ1TWs4QWEwZ1FIV2l3Q3ZET0FS?=
 =?utf-8?B?Y0JaUHV1bWJBRVBKMlB4eXVTUzEzeTY5dkFZRWZJMHJhZUdRU0ZzTzhCS0lZ?=
 =?utf-8?B?N0JqTXhsaklZL0hpWXJDOXZEejhrbFV1RjhHZW0yd3lCZVhlSGJtQ2Y4NjZa?=
 =?utf-8?B?R0JXb0dOYVZib2diKzNxWmF0c204cGJ6MVVyWDV6ZTl2YmxpR0NxdkNPbU1U?=
 =?utf-8?B?OTJ2OHhsMFh4eE1DTkVDUjJBaVc2ZzlreDJYMTBMaTFmRUlHdG1RSkVRV1ZB?=
 =?utf-8?B?ZnJiRUwrWmU5MkJOTDZwM01Wcm5ZajJkWnJiN2hwZEJISWR1TmNaNzdmWDIr?=
 =?utf-8?B?dWdTSXBsUlJ0UFVNMWcxaTZxWUJMZDBGTW90a29adWp6L29nWFFNK3pYYVdX?=
 =?utf-8?B?TUlrZ1R0eXJzNmtZWDBuSUtZZzZxL0U4SGE0R3FIMVkwcmErYU9MdmZTL3N5?=
 =?utf-8?B?SGhPdjczUEo1R21aeUFmSjFMb2orSGJzalJBYTc3bVc2cUJVUi9RVmV4b0d0?=
 =?utf-8?B?bXlHZm5YUVRDay9PY3NmVXZsbStCOGlWdmo5KzZpeGVmcmVEYXlJalR1RFpl?=
 =?utf-8?B?QlU3SFQ4SFEwTitzS2RtckZ2elhPOGpyODR2Y2pXWjNBb09jUkFTeDgrR09S?=
 =?utf-8?B?TVlCbUxhOTJJT0xONlFoTXFlL1lpVjZWTnlLUmZ6aEY5ekttWXgxdGNmaVI1?=
 =?utf-8?B?TXhNNnVmckxCYUxLc0pOSGxta3A3ZHRzWndNcEZyRmFpOXdWTXZxOUx3UU0z?=
 =?utf-8?B?bWVjVjNnY3VyVlEzcnRieTRIeVZ2cWx6K0ZTY0plWmtNTmp1cEF0cnNTSSsr?=
 =?utf-8?B?TU9ObG9wMTQvL0NUTzZtRWI3Z1hCSFdSU1dXb3RvMHlRRHh0a2c4eldHbnlM?=
 =?utf-8?B?aU4xZjU0Wk84Vzc0QnBGekJGUnBLS3hqM3hLNlVqMHpscVZMT25uL2tQL3B2?=
 =?utf-8?B?Z09zVFAzemJpc2hyTitpTm5INDlDWmlSR2xiSW9NNURkN2UwVmNFUlJtSzZ4?=
 =?utf-8?B?RnB0YWdlWTdKMjJqR1Y4ano3eVBkWlRpL3puVUU4RUhIMC80c29oemIvbkFa?=
 =?utf-8?B?NENOZmJIckRiOXlCNjl5cDJGbkVFQ2pXNWJvM3RsRWlmSndreHc4WCt5UGtZ?=
 =?utf-8?B?Y3VINXNxaHJEcmVPcGhITU1pODRXQXF6YVhGaVJjbzk2SFhuaFhEOVNtWnpN?=
 =?utf-8?B?dElwcXM5enhvcU5OQm1tNDMxNDduRWFkRkVHU1gycEJVYjVQTmh4Mmg3eVNJ?=
 =?utf-8?Q?OxXhHVENVkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDR0SzRUTjRNN0dKb0wyMVlEL3ppdnlJNHJQWGZVWFlzNFk0V2t2ZnZYaCtp?=
 =?utf-8?B?NzdHcTdiTEdERUdwa2FTL1FNSENJUnYzaFBFU2gxeUNjWGwrV0hUdEw3OWFk?=
 =?utf-8?B?TWV5L0hKOVYxWFZTYUdPWHQyRXJlZWYra1lodmNrTm5wTnhJc3RwUHBkWmU5?=
 =?utf-8?B?RkxRYXpnWWNOVDVWeHBpeDFkQ3BqdC9Uayt3NzlDSitHWm9rUXl0L25CaWZn?=
 =?utf-8?B?TGxVQ2pXRitGSHB5QmpDb0pXNENNVEJRay9DYVdScG1SSytYTFJtSWhkdkpU?=
 =?utf-8?B?c3NoVnNhRVVYYXFPWUhja2ppVngwR2NxWVpwd1FKdDhuc00vUlNwb0NsakJn?=
 =?utf-8?B?dStwTkR5NFlsUVRNdCtYTDg5Mi9lanVWZGpySXNmVFR5M2FJQms3bXB1MHZY?=
 =?utf-8?B?Q1BWVCsreW1RV1JMSHhHcWxhWG5yZEhMVDVGM0kvYkpJWXVZK3RsQWxHeVNm?=
 =?utf-8?B?b1pTYkptYXNXUEhtOFQ3MDIrQ215Vmg1bC9Uc3lWMWdNaWJsblc4Z2E3ZW13?=
 =?utf-8?B?RXBnb0ZYd2hYcTk5YWV1bUsvWGJrV0xwK3BjbWpJYTFMOEJ2SmlTVUNRTkI1?=
 =?utf-8?B?UWFTUExPL1lzVTU2L0xiVHVPYlZkQzk0bEcvRGpqN3hBeEJUYTRudFA1RWtl?=
 =?utf-8?B?UHFqMjFlWkhmWWJqUHpHd2ppQWVLcjd5cnJiVVdtRGFodG1YKzMvaDJmSk9S?=
 =?utf-8?B?VndaWlh4OVZPSE9XOUFDdVFocERUMzhwMUFMeG5waUdnL2VXUlZoQmVYVHhy?=
 =?utf-8?B?RkdSSkx1dytJY1hJdzd2RkdzclBmMHRaV1Z5ZDcvcm9hek81QlpheXl0akdB?=
 =?utf-8?B?clZKcWd2aXMyVDVuK2dwZG9KVFZLL3NvY2owUnE3alpONU1EQyt3UiswNHJZ?=
 =?utf-8?B?Ukh2TEZZK2lEUmxzYm9TeFl5QmdZZWRPTTJudlV3TllYTTJwUkdtaHhDRi84?=
 =?utf-8?B?elB1WWliQWtpWnFTWVk2SGRkVkl5NG9PMU9vVTR4UzdtVmMxSFVUODg2enhX?=
 =?utf-8?B?SmFtUzdEZUY5MEtFOG5pNVFhV283bElkYWlMdmswd254TXlyTTZEQXB6a0ZL?=
 =?utf-8?B?Qm93bWs5SzhLT1Y1ZDlQenVlQkNUS2s3MU1SYVZkVTJLZkloRlZuTGlQM3kw?=
 =?utf-8?B?SE1OYWxYN1BiK0ZtZUNSYUwraVlnbGxHMmJ0alA3S01xVG5HY1YzV0dBa1BH?=
 =?utf-8?B?bm9hWTZLSFNrQlV3SGxFTDFEVTllYko3NVk4RkRtak5zS3llZkRXWXlFay9Q?=
 =?utf-8?B?UkltRWpHekFJdU54MVFJem9XMCtWNy96SlJaRTl3TnJUT29sNjBMSTk2REtu?=
 =?utf-8?B?RzBmcnp5SGJsQTdTSTkreGlqUlFVbDZFd3JxRm5reG03amR3MTFjOXVxVXlI?=
 =?utf-8?B?RHBmSlRuakp5TU5sTXdrQlR1VlJzem9nbU5aQmFhUHIyNG5FUzZIVTBhcFVV?=
 =?utf-8?B?RnZnNkpZTjVBeGFqTWVnR1JEaUw0anhiVFEzeXRVZUVQeHlEVHV5MXBoRll4?=
 =?utf-8?B?eEh1bDNHcHdEaTFGM1M2MGUzbDRiSWtjME85NlN6MjkrT3krTkNscW1HWVM1?=
 =?utf-8?B?UjB6MmtJV1NMRDRiQ1NFU0V2U3RXTklab2tCSTNDQ3BSaU1zVUFVMW94OVhI?=
 =?utf-8?B?NkMyTzhkcnMrK0lveEJnZmlkUWdmZUl3Ry8rSEc0NTZCNlNaN0dFNU1Ub3Mw?=
 =?utf-8?B?ZHZjNS9aWGxFV2NBdnl3WVF3U1lJT3gzOXlUcXp4QXBQbzNZUlZPYXdZZWpG?=
 =?utf-8?B?d29LNkN3UklSSUROTWZUaDZDNXprME1ZNERGNk1UdWlkd0Q2SlFmSFBFSWF3?=
 =?utf-8?B?S2RLZWZ1WFVrblFTOEp3cUcwUGpEQVNSMDl4OVBFYlk1K0dlLzl5OWFXZ09Z?=
 =?utf-8?B?V3EvRXZGU1RCckp6bURoc0d6N0x0cllJenpLN3BNSDc3bW5PU3VUL1p0V0Mz?=
 =?utf-8?B?Vy83Y3dZenNucnNtZlpWN3J1Y2dZRkJUN1FITjIxbHR6N1MzbGUyTmhybVBF?=
 =?utf-8?B?YkdCYk1kNGM4UWRIVHZGYkNFeURRRkZ2dXhuOUs1QUtBUWpsSlJLblZTZG9O?=
 =?utf-8?B?enZLMVQwMTlrV3Y4cms0SW0yNFE4d2VpQitLczFLWkJOdDZoY2pyYjRvV01u?=
 =?utf-8?Q?8PkBaCVoPkEUM5CB8BjSavGNd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5fe4cf-e49e-416a-2948-08ddfbabf5f5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:50:14.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyfUfRv1CSahsihmFkdhQ3PcGLTrBDlSVRnZWaVDlAuCYApcxoWlTyMX5wesRJMAq2Z/68Vpl4w1Qm2qQTHl4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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

On 9/24/25 1:13 PM, Lyude Paul wrote:
> Some comments down below
...
>> +/// Creates a self-mapping page table for `obj` at its beginning.
>> +fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
>> +    let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
> 
> Unfortunately there's a bit of a gotcha here - we can't actually use functions
> like div_ceil as-is, because a number of 32 bit architectures do not support
> u64 / u64 natively. The problem is we don't have __aeabi_uldivmod implemented

I recall that we agreed that nova will depend upon CONFIG_64BIT.

Does that make this point N/A?


thanks,
-- 
John Hubbard

