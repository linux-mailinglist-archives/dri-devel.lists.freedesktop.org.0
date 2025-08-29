Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBFB3C5BC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 01:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A4010E120;
	Fri, 29 Aug 2025 23:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LuxBNx5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C1710E120;
 Fri, 29 Aug 2025 23:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAWBV5R2Bs+yocHpqLDO5nRqfOwBiuD5eiGADCT+1B2lF56zLY+htderhWudxIcrgtgTWV5NQrF/Ei42worniyTDzgVx2vaKPtCUzTr1hmDlQVYNBrO/zTgAjTG4F24pcBEAz0ToTe6zvmvFs4LTF5Ymzn6jBC4R721G+wSHogWcFtiezRqgQdAtFwwmDtzwn+IYTbDK5qfmvnNGXDh1soeXgfDQ1vtRFUdQ9VLh9lqr4I/gCaPFD3ehk26S9lK9eD32HWVvsO2dxCt5teFijePQNE3l/yH66pNUYml3lUWB9nvQHUbiMpdFwMbMqlu+81ExloBiMgiCGEgXHhc0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvlfv40jmeo14TP95qBHv1h12ywvpvq6WdPiR/wLPUo=;
 b=jYLDQSTkYo0wjg8Ban93DpUe1neSGYD58q58TIZaq6Vm95v/FabqhnN0ydtQ1MosXwtGwNHuBL4A7ScPWlzFTB79zSon/qi+CYfYhKiJ2vOsDT+/XZfvw4PQ7DMllMKmoHWSPrrsvMZAhdP8AnGJTOao3WBR0/u+GKFCAZaQxHCbNtdXnucWJVT+kpxtBO2heJV8f4z1LaS3vF6dStH8HX8FwWxZlHroW7dNEk9PLowMRl2oYwiwMHG4OCuu8deYY/jAhtAT5deUjLnCSBAG4vTvgnrdufLcRJKlb4OfK4HyuWDUnb/TMX0NPp6R0DBRQR7XW+itXxsOcEEruD2z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bvlfv40jmeo14TP95qBHv1h12ywvpvq6WdPiR/wLPUo=;
 b=LuxBNx5DJj5h/vCoQu6c/FDO9LQHuIDC37CQwaU0ZePoBmESgpGe+1MyEDyJAMcJ2FGlZf1x0XYgPZ/jZVVtXaV1jaJet20aKSPxge4AlI3tTqPgE21W0JKnK5GAAB6xhzrjHTBZWRI/UtjtiEc406XPfwDu76AgvK0MmyOj2Zsqdn/qwUwRcl/951c/dEkZ/1f9GvFv1wQwtMZo7q+pm9CL8D6vIHRqbA8iNOFmLcQFOXL7TSCa1lT4P2eowYmyubvj6G1WJdX0wK9wnbRQtWEGjBmnYvXpN/UkdM8a4ywqy8SqVo4+iM9eYBU34PbmW/YOH+8Gskm0PHniTCYcLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 23:55:43 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 23:55:43 +0000
Message-ID: <b5f42338-e5b3-4823-8aa9-9374c22f1209@nvidia.com>
Date: Fri, 29 Aug 2025 16:55:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] gpu: nova-core: Set correct DMA mask
To: Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
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
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-2-apopple@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250827082015.959430-2-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: df584a20-aeaa-492a-6d59-08dde75790ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlBLQnBIdzIzeTJObGdiSFlIcjRGK0xQWk1yaE1DSDdPQnRscm1JYi9oZWth?=
 =?utf-8?B?TkF6bSszTWhZUUU0aDBXanU0RjYwRUNhUTk1cTl0RHFFNnhNcnVMQTEzd1V0?=
 =?utf-8?B?c0YxOVN4N25FdDgrUXE5cjI3NGpZWWJ5V3RCcTBudWpkWFpBT0RjVTEvM0Zh?=
 =?utf-8?B?Qnd4K1FCVEZudnhYU0dhS3I0dzE4c3o3aVd5RlgwY1dmRmhGQjN6TnNmM2lI?=
 =?utf-8?B?WUFyZVBUbFE5d0o2TW9yb2dNZ2doQ0ZRRVZ1NXJBQkR1RnFNbEdUbWhsSHNQ?=
 =?utf-8?B?R05zZ0VENTVheEsveTQ0blZqV2NuUEtBaE5pT1lRRFBBd1BWSlJkSnBQSmJp?=
 =?utf-8?B?Z25NWnZoMkwxZUQ5Ny9GY1RBMExuQ2t4SHVHUTBXU1ovQ0pyREZkWjVEbjJi?=
 =?utf-8?B?U3FDSzI4VHJYNDJ3QjZkSEw5TnJqcS9mSkM5TXpldXhFZFJBcFBxenNVTUhX?=
 =?utf-8?B?aFVlcCsxTSswMEYwVXFlYzVFZEJHYXV4ZVMwMHJ4aWd0ZDk1SjVHeGltU09p?=
 =?utf-8?B?NUFZdXJmTGlCdmlPdUFNM0UwSUlLdXB3VlhnKzM1ZjVyRHFzenFqTWwvR3Q4?=
 =?utf-8?B?bmovRDREeHNRZ3Fvb2R4S0kyV0Z4NURzVWZ4SWxmT1dUQVJBMlVsdStBSXRn?=
 =?utf-8?B?c0hwNk9rSDhTb3hiRnRDL3pPUlZsazJVaW9icTc2SzhCQVZqWVRobFk1WitX?=
 =?utf-8?B?elFsd2Y4RTIxZWdjM0YzYkdleDlIdlo2ek9Fby9ZaGFKdGJWMDNOYlJBQ0VR?=
 =?utf-8?B?NkJVZWlvZE1MYTJza05OWEZmUkY3NDdZQVFpSVd6ZThaK3g2elVJVG8xbDhu?=
 =?utf-8?B?NTZSRkdhcG1sWnJFN25PZDZLendoeTRvdmpnMzFRR0J6akNTbDlTM3VoMURa?=
 =?utf-8?B?VlU0UWZqdTNGYjV0dGdLU3dzYTluRFZBT0JWUTBFdmJIY01CVlBmd2Iwd3Jj?=
 =?utf-8?B?dnF4VEZTUGVPMHEySW5xaVRoUERxWGphckp4TWx1WklnWldwV1ZiK2JIcFha?=
 =?utf-8?B?Uk5KRWdWUnRiQUFwZkx5QzV2M0d4aEZvVFZjSFN2N2pnTnIzTnpEZUtHZ0g5?=
 =?utf-8?B?dzB3YjQxYjNVMjBMdzNiaTZHaFdMK05LemNMMFhGNXI4cnkyYXJNS3FQdHJ2?=
 =?utf-8?B?NUlUTE0xLzY4VEpBQVYzVmxVNUoyOFEzVml1d2NIb01hc0c0d3pmcTlNQmxU?=
 =?utf-8?B?TWdZZWk4L3BqSS83QUg3ektMdlRLeDJBQUNEeUo5NW9mMkxtUWtZdktOdXlK?=
 =?utf-8?B?WUJRbVk4Q1dGZzVmT2Z0dTIvMnErbzlLMDJlSkpSUXdPQUlSTFZLaUpCMHA3?=
 =?utf-8?B?TWhYWkg2RHVkbURzMmZpRjFhRVVUU01Bc0kveTZ2V3lVaWdGTStqTzZrS1ZH?=
 =?utf-8?B?YnRBSzhocnpsZlBPSndFTEw3VklrRTJGcVlSNkxud1p3bTN5aVR2VlNUMGky?=
 =?utf-8?B?alcxOWNveldtVHBXVXhWRjJFZ1RrbFdjSHd6SHR1eWRWdDA5Ulc0SStURDkw?=
 =?utf-8?B?SXE0eHlrWnVBbDd0MFlXT1hwbkxaUitGMDMxTWRpT2svOWFpVGZXcEFiU1Na?=
 =?utf-8?B?dHBxeExYcjhOSlE4K3kvd2R2enBNV05Db1B0NlArVk5MS3NWNCtjVVJSN2RP?=
 =?utf-8?B?ZEdkSHVkU0o3MG1yeGxoaXJzaVNMcC83Y0NlcVRqcjhIbGxaVkhHYmIycUQ3?=
 =?utf-8?B?RlpIbWM4RFlYeERWWkh5V3E4S2hIZndMK2Z5NVJiQ0tTOUFDOGk3eWhKN0dx?=
 =?utf-8?B?WlI4WnhxZXJpNFF4SlFwY0UyT0p5VWNrZnBXZExDY2ZYamtGaW1ieUtXRU1Z?=
 =?utf-8?B?TG5nQWliNFBWSHVCVXVzUzdtcnpGTHNpVzFBM3BVZkFPNkVBOHZzVFN5eVhh?=
 =?utf-8?B?L3lXZFBkZHpWckhpUTU1czIzd2NCSnRjdkY2dWdrVHhCUDNGeTJPVlZKR2lI?=
 =?utf-8?Q?rUqPoYNHlAo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5KdFV4MGw1a1VucGNYS1BoeHpOS1ZJL3pTOGlUeFNHWUJrc0kwVElDMzhy?=
 =?utf-8?B?Q2JZZC9KVEhnbXZrZzZpenVNOFJhQmllVzJkMzB1UXA2QTJaTnFHanY4T0F3?=
 =?utf-8?B?TUtVK3o0RVRZbkdWSThmMVg2ZWtyWlpIcXpsU2VERzJzckgwQk8yeVcvdmYv?=
 =?utf-8?B?aVRHV3pHNTZPbCtNMmxhVmJMbXpSZUhNaGNqQ1JSU1R0bURyV1huQ2gvR1Jn?=
 =?utf-8?B?aFFkS0E0Q0ZiYzA5eXdCWVp0dkpVcitjNzJydFlGdkIrcm9wZ0w5amNFSG16?=
 =?utf-8?B?VTVYTFNlTVVua0hqd00yVGg5clpGVXNiSkVkcTZCampkb01NR1hMeE4zNndH?=
 =?utf-8?B?d2tZYkVEc1hBMjY5YnhBdkNvY28xRHVDR1R4OVhIOVY2dytjS3RFRU8wZnla?=
 =?utf-8?B?QkxxUCtpOWRlWUJBY3JYcGdLb3pHZkYyeHVTbDlBR0c3dUNHUHB4SlVBSlJH?=
 =?utf-8?B?dVpsYlZtQ1ZQOUF2dUhjZGdCNW9PaWMyaUNiTzBocUxIWnVPd2ZTVnpmOWhY?=
 =?utf-8?B?TnAzMy91bDJ2aVIybWRCdEdJdHhBckRyTVhNRzVzTithWVhQV1IxWE9hVFpO?=
 =?utf-8?B?bE9NM3FEWDRaNnEwN3FjL1A4QXQzSFM5RHlBSVROaUhZOE9CS3hyaVVBbE9i?=
 =?utf-8?B?UUI0REo2eGpxZEVGbklZRWQ2TkQ4TVI4R1A5ZjN6eDdIbFJ2cWtJQUlUYlpu?=
 =?utf-8?B?Z2JuN3hCNFJLN3BIeTRnUVdBaDVwdU92S29QUzZRckhJeG9JMEhpb1oyZGpO?=
 =?utf-8?B?VHJmb3B1UHhQYXFaeDFSL29HVExObm50eFVOaXVkU1M4d2xJNEJjMTd2a0JS?=
 =?utf-8?B?UDNpUE8vcC8wQnhmZlhMY2xTRzF1WDlscnJROEJuU3pKcUt1SDV1cUpKdXE0?=
 =?utf-8?B?TEQrcEsyNExGUGdFWmVwa2lkUHV5YmV1dEFIcEpyV1dHZnZ5ZHU0blc0OEwv?=
 =?utf-8?B?NHVIcFYveDM1T05XeVZZZ1RXSUNLWFQ1aTFzS2thOEZiUHZ4bjJoUEc0RktD?=
 =?utf-8?B?bmN3SkRWMHF3US9zT3ZFV1dvSVFvMW4xNVRHNE91MWFlZVF6M2Y4b0hWZzR2?=
 =?utf-8?B?ZUZaMlJXNUFaQXBQUnQwWVpIUlphRGl0c285WjRBQ1RWLzFVbjBLbVdDRHdF?=
 =?utf-8?B?ZVBmbUZnaGZLMWJVOHZOQVlvYWdBMW80TWNUNnU0VXJRdFVUYnordDlBNHcx?=
 =?utf-8?B?azREMmg4bDVKU2pXQ2IwZ01helY0clBWQ21UTnpuYWgrcTBoeXpDSmkycytz?=
 =?utf-8?B?T2NNUk1GMnpFTDFIZ28waVVyc05xbU1ZSzdKWmZiNnVOaFVBbVJqV3YyaGRN?=
 =?utf-8?B?QmZIVGRXaUFkTFVZYTBLaXZHcUhFWmhWaStKeWdRVHo0bjdoWUs3bzQ1UXlt?=
 =?utf-8?B?dkxXcytyY0NoMzgwNHJvTHNpVjlxMmJqSzZlVjhqc1BRcURjYVg3UHhlNUNi?=
 =?utf-8?B?NnRua2xvUExNemhPQkZvWkdvSjZ0RHgvU3diT1g0ckIzNysvZE9abmxsSjIz?=
 =?utf-8?B?YUxVNUQwb0tGdy91T08rU3BmSDZHeXRHUHAxTHJ0aTVJeVBwOWhmd2NYN05z?=
 =?utf-8?B?QUg1RVZQOWdxTlIxVW1XMjh3eWk1S1VxKzRPSjUvc3BpbFY2MDdZcDNyeVd1?=
 =?utf-8?B?RUg3dTVtaXl4aVVYSUZMWjdqYmtlNERKWXpPbm5pTTBoL21ZemVxcEd1RDh3?=
 =?utf-8?B?bXZKNHI2NVdlYWI4RjMvS09NZ2VrZzRMQVFuOEVjV1JMdHd4NVBtTFptclJO?=
 =?utf-8?B?TVdXODdZb3pCRCtEWHdWTmc5QXFlejd6aVBzWCtNeG5jejhDMitTa05nN2E5?=
 =?utf-8?B?NzArbjVCbklDYUhqdnBBZzdRc3J6L2diM280SndadHFYbytjSnVUaGZ0NE1E?=
 =?utf-8?B?QUVIZEtzeHRFdFQrVEJKNXJBUHA4bXlGMSszVEQ5UlRxWC83MG1YNk9mOXV5?=
 =?utf-8?B?aGJWVWlWMXBlVEMrcHdmbU1YMCsvL0JsVi9vc09lVFJzMHBVUy9DbTFIa0xL?=
 =?utf-8?B?cVMvNk01WW1pcThCQk5RQk9VUEFGQS9PRzdFK0xIdGJuVjZuVHR4UmtZNnNm?=
 =?utf-8?B?bzNVSFdWd3JlMHdZNDFMNlpMalpDSTZNZzVFZnZndWx1OWhhY2tHYUl0NG9K?=
 =?utf-8?Q?E1ymh2ute3Q1QZOwrLQAc2PRi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df584a20-aeaa-492a-6d59-08dde75790ab
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 23:55:43.3729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPCqxGtedtRxj/9hf6ZXFU9xs5wifGOD7m8a/AJaH/RB4pmL1Dicq341natbyi7XiQH/1z3R8Ws5sSMj/LUiyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
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

On 8/27/25 1:19 AM, Alistair Popple wrote:
> Set the correct DMA mask. Without this DMA will fail on some setups.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 274989ea1fb4a..3e154ffb6be4b 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,6 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
> +use kernel::{
> +    auxiliary, bindings, c_str, device::Core, dma::Device, dma::DmaMask, pci, prelude::*,
> +    sizes::SZ_16M, sync::Arc,
> +};
>  
>  use crate::gpu::Gpu;
>  
> @@ -34,6 +37,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
>          pdev.enable_device_mem()?;
>          pdev.set_master();
>  
> +        // SAFETY: No DMA allocations have been made yet
> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<48>())? };

Eventually, should be 52 bits wide, rather than 48. Or so I believe from
looking at various drivers, including Nouveau (which uses 52-bit for 
Blackwell) and mlx* (which use a 64-bit mask).

However, it works for the current series, because this series only supports
Ampere GPUs, and 48 bits suffices for those.

So, you could leave this patch as-is, and I'll change 48 --> 52 in the
upcoming Hopper/Blackwell series. Or you can change it now.

Either way is fine, so:


Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> +
>          let bar = Arc::pin_init(
>              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
>              GFP_KERNEL,


