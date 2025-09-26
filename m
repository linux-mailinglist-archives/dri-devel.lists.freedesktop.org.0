Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB98CBA2641
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 06:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFDF10E9D7;
	Fri, 26 Sep 2025 04:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oXstQWLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013014.outbound.protection.outlook.com
 [40.93.196.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2131A10E15A;
 Fri, 26 Sep 2025 04:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+dpS1rMhQD/pyA90dNEzV13CzAIYqMe2ke8yn6s5rdggNgU7Q/VptnooZCsx1MUCmXc9562A/mjKHUSKuzC9w3AQ4ae/a8wGQ/ysuq/LIz4bxOYYUVmXoc6ahsb/aij1A6ChpNSnEedJK+TdayaikqeXpntSUljBWw4vyI7oLYx+8comvCWAQygx04g/zk1F9ek7S+9ruRp3blNDgccJH8x2YD0FeYghu0p51q3P1FGa4eRLP994G+6BrLFGeWkIt+ucTEjkYyf8USkvCCyndZh1eyqHmp+x5wVV6cCIVVNTmNlO0Y79geJqPN22oRJZj4BuKyYjWkjGgo+XjBlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAFC/Rcsd97yMcmbPrrjJwnut13mfYfRfUIrVjvd9jA=;
 b=KMPnG0f6jWTVE30GjPuNE9j4EbMJzwvYWMAj1kwYIfESxSeQJs87d0xzVASzhHwJLw8z+C6nwwhI3aSsjr5peX4us8lka5b/xJL4Y85WLT67+mQ6a3GuHKRE1w3WJ17u8WWJOJNoaGiZkKRBv3Ruo/ySw99PsiUbzv/EO8fCHIyVqyCnEKi7IvrZj+uph0KdsA75CViVra2uTfEp7DRjYfX7LUaH9AcDK0GJYHIqAamFnXOMH+Ve4CizBsin9hqvYAILLovpvmacVgt2l8pqdxPUGuxpk1cn7bTG1MvEdd1CPCSDxCRbAhGPNTgcaLHSRzMaCOFtT3uCuNxUc0Snxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAFC/Rcsd97yMcmbPrrjJwnut13mfYfRfUIrVjvd9jA=;
 b=oXstQWLm5R6oSA4JuW+3VAM4S0PVak4DTO8lYEkJ5IcX+fATwrsn4wcQuXrE/SQre1cLHbW6CwqgJOpY999eFD1WebYhYDnlQV7OMSky3S7cFrTXVhrbb4AuMEn4plFOJbBAk/eKQXZd3jdNsjJ2WyuZcv7teZm5yxVjWGwKFJZFdr/LTkFDXIW3bNUe3qiUKNwxdEPPX+HHyK9/3+Cyr7D4vh6PMF7KzkEHIojABKPBRIiPSHLAOruASVAEg7gUjgGiW78hL4YwufdsWNpcLN+c8vjqidjF+DWjDW/EZdkW+gir6JQMxx/2doDHJX2JkVXsUuEw6CuljZzbitddbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 04:37:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 04:37:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 13:37:17 +0900
Message-Id: <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-6-apopple@nvidia.com>
X-ClientProxiedBy: TY4P286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 978e1dea-8312-42fa-04f4-08ddfcb660f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlVMOXRhNGZyYnUzMFlSc04rL1VDc2FNVkgvYWU5MVV1TVRtS09HUlFJSldF?=
 =?utf-8?B?R0NHSTVYb0hKTkVrWGY2SzBnTm01RUYzb3IzU3BYWWQ0aXU4WE9DQlFnendN?=
 =?utf-8?B?Yys0QjBWYmxRNm03WUo4VWVLaDIwaUxQYkxXdndjYkZ3TjFGQUlpc01LM0ow?=
 =?utf-8?B?QVhGK1RBQWJMZXk0czVvei9iSFUyUXZKLzF0SFVsbS8vQjRJdmN4bDZHWjVJ?=
 =?utf-8?B?S1k5a0NWS01GR0kraTBBQ0s5cHBuOVdESnZPMjJDNDQ1OE1wckxoZVFXNncx?=
 =?utf-8?B?bmtYQWNkRE9WMFY2ZlVmaVBUM29aQlVtQU4zWmZnT2piM2dvR1BPRW9pbDMw?=
 =?utf-8?B?WjBybXFJQ0FOaTlKRVVSWFNKQ3NpcFd0bkdyOGlKaW5SNHMrMlZ0dXhrL2Vz?=
 =?utf-8?B?cVZGcUV5aGtMMS9YYlpyYWNoVXFpSkZDN1pHSDF4QkJkblI1VTVHWXZuQzJa?=
 =?utf-8?B?OWxFM1hvK3l4U0pDYlFKem5QUmFhNUFJbVc3K1h0ZGdyeHdTWTVyT2RjNDk1?=
 =?utf-8?B?cW1YZTgwb2JyTmgvcExiQWcxZVI5NkY4OFdiVVRhbkU3Nkw5Vi9lUzRDNVpn?=
 =?utf-8?B?UTBvTWVIQzhNcGdVMHpYdnZIUDUwcStoUUpHWUVuODJuMTdxUGJ6TTRNYVpH?=
 =?utf-8?B?M3BxZUp5M2VkZjAwOVUwZmhQZG94WnlaZVNsMjl1YWhmTkJUYUtVa1A0RlVU?=
 =?utf-8?B?UkRyZGxFNnovalN5bWZ3TTZ4OHVnR0xHbTdrY0gyV0dGYUxWMDd6TC96YXhG?=
 =?utf-8?B?blVvMFlrSzdOanJHYWtvTnF1Z2RnN0ZzbmtjTGZySm9LczJRUzRDaU4vK2RH?=
 =?utf-8?B?d2MwNmtJNnlwZXZwNC9xbDJ5K1hha2lsZi9TQjNKYnR4eUd1WDhzUFoyVDlG?=
 =?utf-8?B?L0hPdnBBT054VkhKWVg5eHJ3cEt6b09nYmpSaThKTUpJRTJJNUxJcEgrWktC?=
 =?utf-8?B?c3BtL3dBejJ4SCtkaC9NMWNZeDhMbmdONDI3ejE3cndHSEgwcm9QU1lOWUh5?=
 =?utf-8?B?eno0eFRuY3pvRmI5dHlKdG9teTVSN1FMTWlXSXVvMGtNZmp2VkhKajdIM0o4?=
 =?utf-8?B?MlF6Qmd3MFVXTXdzMDFCZWtOam5xRkVNaUpVd3paMzBMN2FZYzJ1bE5seVlS?=
 =?utf-8?B?MXI0RmM5OEFrQ0ZSQTgrYkF3MTB4U2krQU5jTHlKS3FCYTRBT2dUQXllZUJx?=
 =?utf-8?B?cHZLUWtsb0E3NHkwcHM0WEkvbi9selNnMy9nZ1NPd1R3UEU2WFE0SmRrNGk0?=
 =?utf-8?B?OXNzVVU5Qjd1SjBYR0FVYkMybjhWekpzN25EQmMxSlVOV2p1OGVnYzhqT204?=
 =?utf-8?B?OEZyQXdsK2pXUUM5SklKWHFBSmxEV0lneGEzQ3VSVFpqWjZZeGFwd0VCSCtV?=
 =?utf-8?B?RkpHbHRLTjRtaWUvMlo2cXUzdlF2MEcvME1wbFk2S3I3NmVFL3I5L1pTUzhj?=
 =?utf-8?B?L0JvZjdUY2drcElUSytvSCs4TWVVS0JWdnBubSt4RDB4N09ZeTYyTlNDL1dP?=
 =?utf-8?B?eWNWTVp4UllRc0RvaS90OFFIYXM1TmtZVmNjc0RoTUtYaUQ2MGVKM0svN01p?=
 =?utf-8?B?REFlRFBNclNib2FRdnRROFJWVUo3cnBLTVBpdVErdmR2MUZRSWVmZndrVWh5?=
 =?utf-8?B?N0dRWXB5M0EySWt3ZUxlSmJjdUFZdndnZStyWEZITHhDbkQvYWJXNlJhRUNu?=
 =?utf-8?B?ZzNFcHEvL0Nud2NkWHFQd1JLR1BPQlZqYUhYaVhYd0lkdDkrbXRSU0dOMW5H?=
 =?utf-8?B?QS9XYXBEMC9XVWtQNkpSSyswRWdiSHE5OWdEbTBDVnMvVjB2c3NvOWtZZGtV?=
 =?utf-8?B?M1lVOHJxOUxPS2ZGVFI2b2wxZXBHVXczOTlNOUJQTTNuQWE4WDVyWHhwa3d1?=
 =?utf-8?B?NWtGOWZOQVJBM3F1d29QRVQ2ejFvT2hKSU1saVlTL2ZPcTBCcXRJM20wOG12?=
 =?utf-8?Q?GgudPxmnLFDy7IufomVB+DGvrHoF9UqI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFJT0VmQlU4L3duT2V6MWNpUGFLTGNzVnVsYXNBRXRDYUVkTVloOERwaGp4?=
 =?utf-8?B?ZUFEeHlxZ3FMSkhHdlNMQkh3L3ExT0JWaUJxZTRBNVg1TDZ1bFBmaWtndHFq?=
 =?utf-8?B?WjNMWXpranM1Y0dmRlpTNDBnU1QrMnRFRjJzVExWL2VQREM1M0h3Mm1iNFhX?=
 =?utf-8?B?S0VHNXV1ZitBRVlucFVLczVlR1BUS0ViTWFwdHhydkgzRm16enRYY2phTjhn?=
 =?utf-8?B?QUVEZS9YUU5xdy83UjYrUGp2b08rZ3pPTVJybUVXY0p0UnBwZEtSSEZPQjFr?=
 =?utf-8?B?QllNNEgwSjNuQ3FHVHB2SkxNRGNiSUFUTCthYVBTbXMvWTBzWmdya1IyNHFI?=
 =?utf-8?B?a3JXNDRxTnF0bnNtUlNHbS9HVFVITW45aG9tT3JuMERTdnlRNDQzbGVGbEls?=
 =?utf-8?B?em04ZnliNUd1WUtWMFc3NW5ZNU1HWk5KTUE5bUN3Qi9QbzE0dXRBdUVxSjM0?=
 =?utf-8?B?Q2JnVlBHZmpjS2xISkpKbFFHS0NTblRLTkovU25FaG5sQ1NUQ29vd0F0ZHhy?=
 =?utf-8?B?cDJ3YTBwV29tWVQ3YmNkN3hrT1hFdDhRSHNDQzc1cUhtcFcvVVBkZ2Y2QTVk?=
 =?utf-8?B?WEhuNGdMSkQ3aDdRTFEwZzVtbDgvZWRRNHZaWVpaMi9tV24wL012cHkzMDBi?=
 =?utf-8?B?Z0xDWTZ1RXZJenl0MGI0bDNSR1NVeXM2WnZsLzJabFVXSnBLR2VUWVhRRS9S?=
 =?utf-8?B?bXlmcDhza1VlaVhsK3MyTG5qRjdvbEp3b3VscEJIWlZseFllTUpRWi94VTRJ?=
 =?utf-8?B?aTdwa0FEdmIwTVlDbE03R2c0amRaN01mMFZZWEVTZGxFZ2UyK0dPS3NGbnZX?=
 =?utf-8?B?NVhiTmJiSnE0SWRLUnNEMjFVaFpnL3lNZEN4NTJhcHh3SHorZ3hXenZYZDhW?=
 =?utf-8?B?ZnJEVmFBbUxpbkJ4SWtycE0wQUFpeWdNMC9haFM5b2lPUThqRjRpVmd1RHNq?=
 =?utf-8?B?cWt3b3djQVFIK2JqcjFTYTY5b2hvTnVtdlFNRHZhTE1KdWxhZEVCdFRNSDNF?=
 =?utf-8?B?RHM4OWEzRkF1SkNlc2YzNHlpZUY3UnFjZE1IcHJTY0ZrNHdnRW1aQlR5aC9E?=
 =?utf-8?B?SGtMTXJ4b0hWWGMvM1M5VFBnYmZEejMvUjUrcU03dWpKNUdVVmhxZVlXRFJs?=
 =?utf-8?B?Q2tFVzM1RW1XSEkyWEZaNTMxaHZnRXNKSmhlQ2xHZU5pRXphWVlXY0RNSjhy?=
 =?utf-8?B?T09Jc3RmRzJLR3ViNXRQN2REYjNVcGFuZ1crc1dJdjYzZHRRQWpmMm5NdVhU?=
 =?utf-8?B?Tzl5aTJLc3h5NzAxZDZPeUwrQkkzd1JRRjltUit4OW5GVTdTTGhTcm9vZXpH?=
 =?utf-8?B?MHlCdzRzeGZJS1h4RnlQSnc1NE9LaTNuY3VUczIvb1liV1BZNjJjNkwwMFRa?=
 =?utf-8?B?WE1NSTVTcVIwbWc4ZDFyTFBoMVJGNUk5ODNhdWtkNUQ2QWxEbDBtSTdPbnhq?=
 =?utf-8?B?ZndyNkp2VTdHNFc1ZndOcWowR0ZQUmFTMkZOTEhhYUVFWWliaFliMzdtc3NE?=
 =?utf-8?B?K0dxanRjVnp3MkRTQ1NiWnp5YVlndnJpSkowNnFyUVpLejVVbmgrZS92Kzdt?=
 =?utf-8?B?dGlZc0UvckVEdEgzekN0bEphRjRxeVFSWEV4dHN2Z1lsSnpsQmlCWE1qeml2?=
 =?utf-8?B?d0c5RWNLdTZkMGJFNUNNcGpzMitTV0Uyd1pJWVlQVnpkNHNMK3pCWDMxMVhP?=
 =?utf-8?B?Nm9TY0tydmUzQjcwdi95SjRRY0FlTmdnazR0eXhQQVdxOXlxMGhXNURCUXRa?=
 =?utf-8?B?QVMxRExBNzlHcXM5OUdWTis2WFQvck1zL2h0SEd3MlFsWk43dHVoQlJadFcw?=
 =?utf-8?B?YmpKK1lCOXlmbjRsMTBNOTBOeDVjQ1ZkTHJQb1ZPSXRUaXpoM2RTWkV4TElX?=
 =?utf-8?B?WWlpZk0vNThaZUtRVFJiSWhPeUtiODY1dWhWdmFHZE1rZm5JczhqY1h6UElN?=
 =?utf-8?B?TERyQVhIcW5mcWM5WW1Zb2gwT1Y5dm5RcHN4RUtPTEMrMWpDcmxCVU0yTkZm?=
 =?utf-8?B?VTVqeVQ1ZzN1NUNmaWtPYXgyNVF1cnh3b2JLYVgvSzhiYlgxVnRHNmgvODhq?=
 =?utf-8?B?Q3JPRDQ3amkrc0NVTVFUTndUWkx1MjlDYjhyck9mQmFjL3dBc1JEWUJNU2I1?=
 =?utf-8?B?anJ4VnR0YUp4N0VwNEhyaFlKYzVEdjZjdE8vWWtwWkVtWHVhbm1nZWNiVWM5?=
 =?utf-8?Q?c9lEwYCkV4htrwlBc4oXQh0xGto6c6uaw04rqQF1JHrt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978e1dea-8312-42fa-04f4-08ddfcb660f8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 04:37:20.4730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFq99Sm4sEWZ+CidKaEO7ESTf/NyHyIajyqyQbt5cYqxKO7IqXRiVdFJ02jJaZ6NwdnKcvbDZSpkxAeud8479g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338
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

Hi Alistair,

On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> new file mode 100644
> index 000000000000..a9ba1a4c73d8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::mem::offset_of;
> +use core::sync::atomic::fence;
> +use core::sync::atomic::Ordering;
> +
> +use kernel::alloc::flags::GFP_KERNEL;
> +use kernel::device;
> +use kernel::dma::{CoherentAllocation, DmaAddress};
> +use kernel::prelude::*;
> +use kernel::sync::aref::ARef;
> +use kernel::time::Delta;
> +use kernel::transmute::{AsBytes, FromBytes};
> +use kernel::{dma_read, dma_write};
> +
> +use super::fw::{
> +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTI=
CE,
> +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NV_VGPU_MSG_EVENT_GSP_RUN_C=
PU_SEQUENCER,
> +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED, NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> +    NV_VGPU_MSG_EVENT_POST_EVENT, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NV_VGPU_MSG_FUNCTION_ALLOC_CHAN=
NEL_DMA,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA, NV_VGPU_MSG_FUNCTION_ALLOC_DEVIC=
E,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT=
,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT, NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA, =
NV_VGPU_MSG_FUNCTION_FREE,
> +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, NV_VGPU_MSG_FUNCTION_GET_S=
TATIC_INFO,
> +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU, NV_VGPU_MSG_FUNCTION_GSP_=
RM_CONTROL,
> +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_LOG,
> +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY, NV_VGPU_MSG_FUNCTION_NOP,
> +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET=
_REGISTRY,
> +};

As I mentioned in v1, let's turn these into two enums to avoid this big
import and make sure we can never mix up the values.

This can be something like this in `fw.rs`:

#[repr(u32)]
pub(crate) enum VgpuMsgEvent {
    GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
    GspLockDownNotice =3D bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
    ...
}

Then you just need to import `VgpuMsgEvent`, and can use that type where
appropriate, e.g. for the `FUNCTION` associated type of
`GspMessageFromGsp`.

> +use crate::driver::Bar0;
> +use crate::gsp::create_pte_array;
> +use crate::gsp::fw::{GspMsgElement, MsgqRxHeader, MsgqTxHeader};
> +use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
> +use crate::regs::NV_PGSP_QUEUE_HEAD;
> +use crate::sbuffer::SBuffer;
> +use crate::util::wait_on;
> +
> +pub(crate) trait GspCommandToGsp: Sized + FromBytes + AsBytes {
> +    const FUNCTION: u32;
> +}
> +
> +pub(crate) trait GspMessageFromGsp: Sized + FromBytes + AsBytes {
> +    const FUNCTION: u32;
> +}

Do we need to repeat `Gsp` in these trait names? `CommandToGsp` and
`MessageFromGsp` should be fine.

(I am also guilty of prefixing type names to avoid name collisions - a
habit inherited from years of C programming, but since we are already in
the `gsp` module we can forgo this habit as users can just import the
module and refer to the type as `gsp::MessageFromGsp` if there is any
ambiguity).

> +
> +/// Number of GSP pages making the Msgq.
> +pub(crate) const MSGQ_NUM_PAGES: u32 =3D 0x3f;
> +
> +#[repr(C, align(0x1000))]
> +#[derive(Debug)]
> +struct MsgqData {
> +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
> +}
> +
> +// Annoyingly there is no real equivalent of #define so we're forced to =
use a
> +// literal to specify the alignment above. So check that against the act=
ual GSP
> +// page size here.
> +static_assert!(align_of::<MsgqData>() =3D=3D GSP_PAGE_SIZE);
> +
> +// There is no struct defined for this in the open-gpu-kernel-source hea=
ders.
> +// Instead it is defined by code in GspMsgQueuesInit().
> +#[repr(C)]
> +struct Msgq {
> +    tx: MsgqTxHeader,
> +    rx: MsgqRxHeader,
> +    msgq: MsgqData,
> +}
> +
> +#[repr(C)]
> +struct GspMem {
> +    ptes: [u8; GSP_PAGE_SIZE],
> +    cpuq: Msgq,
> +    gspq: Msgq,
> +}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> +// that is not a problem because they are not used outside the kernel.
> +unsafe impl AsBytes for GspMem {}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of FromB=
ytes but
> +// that is not a problem because they are not used outside the kernel.
> +unsafe impl FromBytes for GspMem {}

These ARE used outside the kernel, since they are shared with the GSP.
:) I'd say the reason these are safe is just because we satisfy the
requirements of AsBytes and FromBytes:

- No initialized bytes,
- No interior mutability,
- All bytes patterns are valid (for some generous definition of
  "valid" limited to not triggering UB).

> +
> +/// `GspMem` struct that is shared with the GSP.
> +struct DmaGspMem(CoherentAllocation<GspMem>);
> +
> +impl DmaGspMem {
> +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> +        const MSGQ_SIZE: u32 =3D size_of::<Msgq>() as u32;
> +        const RX_HDR_OFF: u32 =3D offset_of!(Msgq, rx) as u32;
> +
> +        let mut gsp_mem =3D
> +            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> +        create_pte_array(&mut gsp_mem, 0);
> +        dma_write!(gsp_mem[0].cpuq.tx =3D MsgqTxHeader::new(MSGQ_SIZE, R=
X_HDR_OFF))?;
> +        dma_write!(gsp_mem[0].cpuq.rx =3D MsgqRxHeader::new())?;
> +
> +        Ok(Self(gsp_mem))
> +    }
> +
> +    #[expect(unused)]
> +    fn dma_handle(&self) -> DmaAddress {
> +        self.0.dma_handle()
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the device doesn't access the parts =
of the [`GspMem`] it works
> +    /// with.
> +    unsafe fn access_mut(&mut self) -> &mut GspMem {
> +        // SAFETY:
> +        // - The [`CoherentAllocation`] contains exactly one object.
> +        // - Per the safety statement of the function, no concurrent acc=
ess wil be performed.
> +        &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0]
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the device doesn't access the parts =
of the [`GspMem`] it works
> +    /// with.
> +    unsafe fn access(&self) -> &GspMem {
> +        // SAFETY:
> +        // - The [`CoherentAllocation`] contains exactly one object.
> +        // - Per the safety statement of the function, no concurrent acc=
ess wil be performed.
> +        &unsafe { self.0.as_slice(0, 1) }.unwrap()[0]
> +    }

Since these two methods are only called once each from
`driver_write/read_area`, let's inline them there and reduce our
`unsafe` keyword counter.

> +
> +    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut=
 [[u8; GSP_PAGE_SIZE]]) {
> +        let tx =3D self.cpu_write_ptr() as usize;
> +        let rx =3D self.gsp_read_ptr() as usize;
> +
> +        // SAFETY: we will only access the driver-owned part of the shar=
ed memory.
> +        let gsp_mem =3D unsafe { self.access_mut() };
> +        let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_mu=
t(tx);
> +
> +        if rx <=3D tx {
> +            // The area from `tx` up to the end of the ring, and from th=
e beginning of the ring up
> +            // to `rx`, minus one unit, belongs to the driver.
> +            if rx =3D=3D 0 {
> +                let last =3D after_tx.len() - 1;
> +                (&mut after_tx[..last], &mut before_tx[0..0])
> +            } else {
> +                (after_tx, &mut before_tx[..rx])
> +            }
> +        } else {
> +            // The area from `tx` to `rx`, minus one unit, belongs to th=
e driver.
> +            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
> +        }
> +    }
> +
> +    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PA=
GE_SIZE]]) {
> +        let tx =3D self.gsp_write_ptr() as usize;
> +        let rx =3D self.cpu_read_ptr() as usize;
> +
> +        // SAFETY: we will only access the driver-owned part of the shar=
ed memory.
> +        let gsp_mem =3D unsafe { self.access() };
> +        let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(rx=
);
> +
> +        if tx <=3D rx {
> +            // The area from `rx` up to the end of the ring, and from th=
e beginning of the ring up
> +            // to `tx`, minus one unit, belongs to the driver.
> +            if tx =3D=3D 0 {
> +                let last =3D after_rx.len() - 1;
> +                (&after_rx[..last], &before_rx[0..0])
> +            } else {
> +                (after_rx, &before_rx[..tx])
> +            }
> +        } else {
> +            // The area from `rx` to `tx`, minus one unit, belongs to th=
e driver.
> +            (after_rx.split_at(tx - rx).0, &before_rx[0..0])
> +        }
> +    }

As we discussed offline, this method is incorrect (amongst other things,
it returns the whole ring buffer when it should be empty). Posting my
suggested diff for the record:

--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -152,17 +152,12 @@ unsafe fn access(&self) -> &GspMem {
         let gsp_mem =3D unsafe { self.access() };
         let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(rx);

-        if tx <=3D rx {
+        if tx < rx {
             // The area from `rx` up to the end of the ring, and from the =
beginning of the ring up
-            // to `tx`, minus one unit, belongs to the driver.
-            if tx =3D=3D 0 {
-                let last =3D after_rx.len() - 1;
-                (&after_rx[..last], &before_rx[0..0])
-            } else {
-                (after_rx, &before_rx[..tx])
-            }
+            // to `tx` belongs to the driver.
+            (after_rx, &before_rx[0..tx])
         } else {
-            // The area from `rx` to `tx`, minus one unit, belongs to the =
driver.
+            // The area from `rx` to `tx` belongs to the driver.
             (after_rx.split_at(tx - rx).0, &before_rx[0..0])
         }
     }

> +
> +    fn gsp_write_ptr(&self) -> u32 {
> +        let gsp_mem =3D &self.0;
> +        dma_read!(gsp_mem[0].gspq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
> +    }
> +
> +    fn gsp_read_ptr(&self) -> u32 {
> +        let gsp_mem =3D &self.0;
> +        dma_read!(gsp_mem[0].gspq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
> +    }
> +
> +    fn cpu_read_ptr(&self) -> u32 {
> +        let gsp_mem =3D &self.0;
> +        dma_read!(gsp_mem[0].cpuq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
> +    }

Maybe add one line of documentation for these. Generally I think we want
a bit more high-level documentation explaining how the ring buffers are
operating.

> +
> +    /// Inform the GSP that it can send `elem_count` new pages into the =
message queue.
> +    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
> +        let gsp_mem =3D &self.0;
> +        let rptr =3D self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ=
_NUM_PAGES;
> +
> +        // Ensure read pointer is properly ordered
> +        fence(Ordering::SeqCst);
> +
> +        dma_write!(gsp_mem[0].cpuq.rx.readPtr =3D rptr).unwrap();
> +    }
> +
> +    fn cpu_write_ptr(&self) -> u32 {
> +        let gsp_mem =3D &self.0;
> +        dma_read!(gsp_mem[0].cpuq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
> +    }
> +
> +    /// Inform the GSP that it can process `elem_count` new pages from t=
he command queue.
> +    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
> +        let gsp_mem =3D &self.0;
> +        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) & MSG=
Q_NUM_PAGES;
> +        dma_write!(gsp_mem[0].cpuq.tx.writePtr =3D wptr).unwrap();
> +
> +        // Ensure all command data is visible before triggering the GSP =
read
> +        fence(Ordering::SeqCst);
> +    }
> +}
> +
> +pub(crate) struct GspCmdq {

Similar to my previous comment, we can just name this `Cmdq` since we
are already in the `gsp` module.

As a general comment, let's also document our types/methods a bit more,
explaining at least what they are for.

> +    dev: ARef<device::Device>,
> +    seq: u32,
> +    gsp_mem: DmaGspMem,
> +    pub _nr_ptes: u32,
> +}
> +
> +impl GspCmdq {
> +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Gsp=
Cmdq> {
> +        let gsp_mem =3D DmaGspMem::new(dev)?;
> +        let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> +        build_assert!(nr_ptes * size_of::<u64>() <=3D GSP_PAGE_SIZE);
> +
> +        Ok(GspCmdq {
> +            dev: dev.into(),
> +            seq: 0,
> +            gsp_mem,
> +            _nr_ptes: nr_ptes as u32,
> +        })
> +    }
> +
> +    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 {
> +        let sum64 =3D it
> +            .enumerate()
> +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_lef=
t(rol));
> +
> +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
> +        &mut self,
> +        bar: &Bar0,
> +        payload_size: usize,
> +        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8=
], 2>>) -> Result,

This works pretty well for in-place initialization.

There a couple of small drawbacks though: `M` must implement `FromBytes`
even though we only send it, and (more serious) there is no guarantee
that `init` will fully initialize the command - a forgetful caller can
omit some of its fields, or even the whole structure, and in that case
we will send a command with what happened to be at that position of the
queue at that time.

I think this is a good case for using the `Init` trait: it's like
`PinInit`, but without the `Pin`, and it ensures that the whole argument
is initialized. So this method would change into something like:

    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
        &mut self,
        bar: &Bar0,
        payload_size: usize,
        init: impl Init<M, Error>,
        init_sbuf: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], 2>>=
) -> Result,

This also allows us to drop the `FromBytes` requirement on
`GspCommandToGsp`! But also requires us to use `unsafe` to call
`Init::__init` on the pointer to the command. I think it's worth it
though, as this removes the risk of sending partially-uninitialized
commands.

Then there is what to do with the `SBuffer`. I'd like to think a bit
more about this, as not all commands require it, and those that do
typically send arrays of particular types. I think we should be able to
use the type system to have more control over this, but let's keep that
for the next revision.

> +    ) -> Result {
> +        // TODO: a method that extracts the regions for a given command?
> +        // ... and another that reduces the region to a given number of =
bytes!
> +        let driver_area =3D self.gsp_mem.driver_write_area();
> +        let free_tx_pages =3D driver_area.0.len() + driver_area.1.len();
> +
> +        // Total size of the message, including the headers, command, an=
d optional payload.
> +        let msg_size =3D size_of::<GspMsgElement>() + size_of::<M>() + p=
ayload_size;
> +        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
> +            return Err(EAGAIN);
> +        }
> +
> +        let (msg_header, cmd, payload_1, payload_2) =3D {
> +            // TODO: find an alternative to as_flattened_mut()

I think we can use it if we enable the "slice_flatten" feature (stable
since 1.80, introduced in 1.67).

> +            #[allow(clippy::incompatible_msrv)]
> +            let (msg_header_slice, slice_1) =3D driver_area
> +                .0
> +                .as_flattened_mut()
> +                .split_at_mut(size_of::<GspMsgElement>());
> +            let msg_header =3D GspMsgElement::from_bytes_mut(msg_header_=
slice).ok_or(EINVAL)?;
> +            let (cmd_slice, payload_1) =3D slice_1.split_at_mut(size_of:=
:<M>());
> +            let cmd =3D M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
> +            // TODO: find an alternative to as_flattened_mut()
> +            #[allow(clippy::incompatible_msrv)]
> +            let payload_2 =3D driver_area.1.as_flattened_mut();
> +            // TODO: Replace this workaround to cut the payload size.
> +            let (payload_1, payload_2) =3D match payload_size.checked_su=
b(payload_1.len()) {
> +                // The payload is longer than `payload_1`, set `payload_=
2` size to the difference.
> +                Some(payload_2_len) =3D> (payload_1, &mut payload_2[..pa=
yload_2_len]),
> +                // `payload_1` is longer than the payload, we need to re=
duce its size.
> +                None =3D> (&mut payload_1[..payload_size], payload_2),
> +            };

We will want (either you or I) to address these TODOs for the next
revision.

> +
> +            (msg_header, cmd, payload_1, payload_2)
> +        };
> +
> +        let sbuffer =3D SBuffer::new_writer([&mut payload_1[..], &mut pa=
yload_2[..]]);
> +        init(cmd, sbuffer)?;
> +
> +        *msg_header =3D GspMsgElement::new(self.seq, size_of::<M>() + pa=
yload_size, M::FUNCTION);
> +        msg_header.checkSum =3D GspCmdq::calculate_checksum(SBuffer::new=
_reader([
> +            msg_header.as_bytes(),
> +            cmd.as_bytes(),
> +            payload_1,
> +            payload_2,
> +        ]));
> +
> +        let rpc_header =3D &msg_header.rpc;
> +        dev_info!(
> +            &self.dev,
> +            "GSP RPC: send: seq# {}, function=3D0x{:x} ({}), length=3D0x=
{:x}\n",
> +            self.seq,
> +            rpc_header.function,
> +            decode_gsp_function(rpc_header.function),
> +            rpc_header.length,
> +        );
> +
> +        let elem_count =3D msg_header.elemCount;
> +        self.seq +=3D 1;
> +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);

I'm a bit surprised that we always write `0` here, can we document this
behavior, maybe in the definition of `NV_PGSP_QUEUE_HEAD`?

> +
> +        Ok(())
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
> +        &mut self,
> +        timeout: Delta,
> +        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>>) =
-> Result<R>,
> +    ) -> Result<R> {
> +        let (driver_area, msg_header, slice_1) =3D wait_on(timeout, || {
> +            let driver_area =3D self.gsp_mem.driver_read_area();
> +            // TODO: find an alternative to as_flattened()
> +            #[allow(clippy::incompatible_msrv)]
> +            let (msg_header_slice, slice_1) =3D driver_area
> +                .0
> +                .as_flattened()
> +                .split_at(size_of::<GspMsgElement>());

Beware that `split_at` will panic if the slice is shorter than the
passed argument. So we must check here that the driver area is larger
than `GspMsgElement`.

> +
> +            // Can't fail because msg_slice will always be
> +            // size_of::<GspMsgElement>() bytes long by the above split.
> +            let msg_header =3D GspMsgElement::from_bytes(msg_header_slic=
e).unwrap();
> +            if msg_header.rpc.length < size_of::<M>() as u32 {
> +                return None;
> +            }

If we have a message in the queue and this condition doesn't hold, I
don't think we can hope that it will in a further iteration - this
should be an error.

> +
> +            Some((driver_area, msg_header, slice_1))
> +        })?;
> +
> +        let (cmd_slice, payload_1) =3D slice_1.split_at(size_of::<M>());
> +        let cmd =3D M::from_bytes(cmd_slice).ok_or(EINVAL)?;
> +        // TODO: find an alternative to as_flattened()
> +        #[allow(clippy::incompatible_msrv)]
> +        let payload_2 =3D driver_area.1.as_flattened();

There is an issue here - payload_1 and payload_2 cover the *whole* area
that is readable by the driver, not just the first message in the queue.

If there is more than one message pending when this method is called, we
will get a wrong checksum and skip all the following messages. We need
to truncate payload_1/payload_2 to cover the exact area of the first
message only.

> +
> +        // Log RPC receive with message type decoding
> +        dev_info!(
> +            self.dev,
> +            "GSP RPC: receive: seq# {}, function=3D0x{:x} ({}), length=
=3D0x{:x}\n",
> +            msg_header.rpc.sequence,
> +            msg_header.rpc.function,
> +            decode_gsp_function(msg_header.rpc.function),
> +            msg_header.rpc.length,
> +        );
> +
> +        if GspCmdq::calculate_checksum(SBuffer::new_reader([
> +            msg_header.as_bytes(),
> +            cmd.as_bytes(),
> +            payload_1,
> +            payload_2,
> +        ])) !=3D 0
> +        {
> +            dev_err!(
> +                self.dev,
> +                "GSP RPC: receive: Call {} - bad checksum",
> +                msg_header.rpc.sequence
> +            );
> +            return Err(EIO);
> +        }
> +
> +        let result =3D if msg_header.rpc.function =3D=3D M::FUNCTION {

This should be done way earlier. At this point we have already converted
the command bytes slices into M, which is invalid if it happens that
this condition doesn't hold.

(on a related note, the checksum verification should also be done before
we interpret the message, as a corrupted message could make us cast
`cmd` into something that it is not)

> +            let sbuffer =3D SBuffer::new_reader([payload_1, payload_2]);
> +            init(cmd, sbuffer)
> +        } else {
> +            Err(ERANGE)
> +        };
> +
> +        self.gsp_mem
> +            .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAG=
E_SIZE as u32));

There is a landmine here. `msg_header.rpc.length` contains the length of
the payload, INCLUDING the RPC header itself, but NOT INCLUDING the
remainder of `msg_header`. Therefore the correct statement should be:

    self.gsp_mem.advance_cpu_read_ptr(
        (size_of_val(msg_header) as u32 - size_of_val(&msg_header.rpc) as u=
32
            + msg_header.rpc.length)
            .div_ceil(GSP_PAGE_SIZE as u32),
    );

Of course, it looks horrible, so we want to hide this member altogether
and provide a nice, well-documented method that returns something that
is immediately useful for us. More on that in `fw.rs`.

(the previous use of `length` in this method is also incorrect).

> +        result
> +    }
> +}
> +
> +fn decode_gsp_function(function: u32) -> &'static str {

Once we have proper enums for the function and events, this can be an
`as_str` method.

> +    match function {
> +        // Common function codes
> +        NV_VGPU_MSG_FUNCTION_NOP =3D> "NOP",
> +        NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO =3D> "SET_GUEST_SYSTE=
M_INFO",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_ROOT =3D> "ALLOC_ROOT",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE =3D> "ALLOC_DEVICE",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY =3D> "ALLOC_MEMORY",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA =3D> "ALLOC_CTX_DMA",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA =3D> "ALLOC_CHANNEL_DMA",
> +        NV_VGPU_MSG_FUNCTION_MAP_MEMORY =3D> "MAP_MEMORY",
> +        NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA =3D> "BIND_CTX_DMA",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT =3D> "ALLOC_OBJECT",
> +        NV_VGPU_MSG_FUNCTION_FREE =3D> "FREE",
> +        NV_VGPU_MSG_FUNCTION_LOG =3D> "LOG",
> +        NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO =3D> "GET_GSP_STATIC_IN=
FO",
> +        NV_VGPU_MSG_FUNCTION_SET_REGISTRY =3D> "SET_REGISTRY",
> +        NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO =3D> "GSP_SET_SYSTEM_IN=
FO",
> +        NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU =3D> "GSP_INIT_POST_OB=
JGPU",
> +        NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> "GSP_RM_CONTROL",
> +        NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> "GET_STATIC_INFO",
> +
> +        // Event codes
> +        NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> "INIT_DONE",
> +        NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> "RUN_CPU_SEQUENCER"=
,
> +        NV_VGPU_MSG_EVENT_POST_EVENT =3D> "POST_EVENT",
> +        NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> "RC_TRIGGERED",
> +        NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED =3D> "MMU_FAULT_QUEUED",
> +        NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> "OS_ERROR_LOG",
> +        NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD =3D> "NOCAT",
> +        NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE =3D> "LOCKDOWN_NOTICE",
> +        NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT =3D> "LIBOS_PRINT",
> +
> +        // Default for unknown codes
> +        _ =3D> "UNKNOWN",
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 7f4fe684ddaf..2e4255301e58 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -15,7 +15,9 @@
>  use crate::firmware::gsp::GspFirmware;
>  use crate::gpu::Chipset;
>  use crate::gsp;
> +use crate::gsp::cmdq::MSGQ_NUM_PAGES;

I guess the number of pages in the message queue is firmware-dependent,
so would it make sense to move its declaration to this module?

>  use crate::gsp::FbLayout;
> +use crate::gsp::GSP_PAGE_SIZE;
> =20
>  /// Dummy type to group methods related to heap parameters for running t=
he GSP firmware.
>  pub(crate) struct GspFwHeapParams(());
> @@ -159,6 +161,37 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_lay=
out: &FbLayout) -> Self {
>      // GSP firmware constants
>      GSP_FW_WPR_META_MAGIC,
>      GSP_FW_WPR_META_REVISION,
> +
> +    // GSP events
> +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
> +    NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
> +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
> +    NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
> +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
> +    NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> +    NV_VGPU_MSG_EVENT_POST_EVENT,
> +    NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
> +
> +    // GSP function calls
> +    NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
> +    NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
> +    NV_VGPU_MSG_FUNCTION_FREE,
> +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
> +    NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
> +    NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
> +    NV_VGPU_MSG_FUNCTION_LOG,
> +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
> +    NV_VGPU_MSG_FUNCTION_NOP,
> +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
> +    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
>  };
> =20
>  #[repr(transparent)]
> @@ -197,3 +230,86 @@ fn id8(name: &str) -> u64 {
>          })
>      }
>  }
> +
> +pub(crate) type MsgqTxHeader =3D bindings::msgqTxHeader;

This should be wrapped into a newtype that provides the exact set of
features required by the gsp module, like what is done for
`LibosMemoryRegionInitArgument`. For this type we just need two things:
return the `writePtr`, and advance it by a given value. That's all
the parent module needs to see.

By just aliasing this type, we make all its members visible to the `gsp`
module. This increases its dependency on a given firmware version,
carries a risk that the GSP module will mess with what it is not
supposed to, and introduces inconsistency in how we abstract the
firmware types - some are wrapped, others are not. Let's be consistent
and make all bindings completely opaque outside of `fw.rs`.

> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for MsgqTxHeader {}
> +
> +impl MsgqTxHeader {
> +    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32) -> Self {
> +        Self {
> +            version: 0,
> +            size: msgq_size,
> +            msgSize: GSP_PAGE_SIZE as u32,
> +            msgCount: MSGQ_NUM_PAGES,
> +            writePtr: 0,
> +            flags: 1,
> +            rxHdrOff: rx_hdr_offset,
> +            entryOff: GSP_PAGE_SIZE as u32,
> +        }
> +    }
> +}
> +
> +/// RX header for setting up a message queue with the GSP.
> +///
> +/// # Invariants
> +///
> +/// [`Self::read_ptr`] is guaranteed to return a value in the range `0..=
NUM_PAGES`.
> +pub(crate) type MsgqRxHeader =3D bindings::msgqRxHeader;
> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for MsgqRxHeader {}
> +
> +impl MsgqRxHeader {
> +    pub(crate) fn new() -> Self {
> +        Default::default()
> +    }
> +}
> +
> +pub(crate) type GspRpcHeader =3D bindings::rpc_message_header_v;

This type too is another good illustration of why we should make our
bindings opaque. In `cmdq.rs` we access `GspRpcHeader::length` multiple
times, ignoring the fact that it also includes the size of the RPC
header itself - not just what comes after it! Since it doesn't come with
any documentation, we can be forgiven for assuming the obvious - that it
is just the size of what follows, but it is not.

What we actually want is a method on `GspMsgElement` that returns what
we actually want (and is documented as such): the actual size of the
payload following the whole header. That way there can be no room for
mistake.

> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for GspRpcHeader {}
> +
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns
> +// are valid.
> +unsafe impl FromBytes for GspRpcHeader {}
> +
> +impl GspRpcHeader {
> +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
> +        Self {
> +            // TODO: magic number
> +            header_version: 0x03000000,
> +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> +            function,
> +            // TODO: overflow check?
> +            length: size_of::<Self>() as u32 + cmd_size,
> +            rpc_result: 0xffffffff,
> +            rpc_result_private: 0xffffffff,
> +            ..Default::default()
> +        }
> +    }
> +}
> +
> +pub(crate) type GspMsgElement =3D bindings::GSP_MSG_QUEUE_ELEMENT;

Hammering my previous argument a bit more: in `cmdq.rs`, we do the
following:

    let msg_header =3D GspMsgElement::from_bytes(msg_header_slice).unwrap()=
;

Even though we explicitly used `GspMsgElement`, `msg_header` appears as
being of type `GSP_MSG_QUEUE_ELEMENT` in LSP. That's super confusing and
can be avoided by using the newtype pattern.

Lastly, the bindings generated from C headers are supposed to be temporary,=
 and
we eventually want to replace them with direct IDL-to-Rust bindings. Not
leaking the C types let us design `fw.rs` as a blueprint for the ideal
interface we would want to generate - so the limited extra labor that
comes with wrapping these types would also pay off in that respect.
