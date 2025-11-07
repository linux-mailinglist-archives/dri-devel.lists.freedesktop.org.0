Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058BC42052
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381EA10EBAA;
	Fri,  7 Nov 2025 23:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BsUeqYjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857210EB9E;
 Fri,  7 Nov 2025 23:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3SrCw07sj2b0nQLyo3N5FvsxVHnsgk2hTJo2hZmCQFsUogme/auchuW/kqe/dCHoHLvAE9iu5CT4cAqZYA9rcv4CvE0XXrnUIUPZRawQCukshVvqs2Lu1YfLmBqOF9pUjrkO//+BxxxhAhMpauKXrROfFjKCTVZJq/uvJp7+rdxAw92l5LtGeFR0pKzLHj8J6m9moFY9BM7PmT8Dj4nrsm/mi+OLGSYWEgcsge7Yib+UrwM8u8PVuAOQAMNarC2aJyhnTqAwquGTjBw2ETCi0bUjaso20FaWZ51WKLI5UWynYY9u9dUg9g2ZnPDLfPFQcvcZBErRu2IxDPw4HG/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcFc+QHsKI2wr178wG78u8EaniN8dMDXlVm1FR/Gk8c=;
 b=vbi+kUNa2hJx762A3MYbv4h8hiHFQv1PZSZtDXVBD0SwFA/A0NrxttHQ+a86snmbVcYpn0u6EH3wLdSkmS57j+eamBOXzfrvPtUBVa6wH/bEBhnJjhFSZbOxKUUC9BQaMVn/jufK9eI2HG44lPo8yek8UGhBoleVmhE6Ukc0SUrP19nMDCqGmnRghVYdrp3gWLwryPvO88X8BQWGIaaaunpx6ZrElMG89dV/xlIu/wCrs31t4VLXK7SaG9b+cjfNJupricNrAZBWQgrACTDGxed0yQMc+eqM70rEpsvO6OA7R+lvghWfJxnJ1TQ3z+lD2LQcQ6ShMfchTSck+lC4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcFc+QHsKI2wr178wG78u8EaniN8dMDXlVm1FR/Gk8c=;
 b=BsUeqYjgujynPPpz9lrX2+DAQOBVr0Nf5z5FCc/7v50a/sjq+Vob5vrSitvnWTzjQA8fFo1r2RiD699gS0Q4rmfvqvG5/9X1Sk3IKtVjx2+fDy+qTl0Z+0Xc0xfru2xyOCkoBgtAUzjOK5r1Ze4QttbGIgm6qkKQeJdM6Hu63axrZtv6iNZlbALMT+hV82Mf7XJc4NCge2rW47S9S42j6oC0/xxc3eFWTY0GR0btYsT87w4KzAu3bst+1epfg1+SFgs++GtbdPQaMgHSLM4U5E4aMUHo9ecs6fMc1uWXmiHi/ERrS0yVXBDk8WciXzdkeY3i3MEXgGgOj2wENf1n7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:44:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:44:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:16 +0900
Subject: [PATCH v8 15/16] gpu: nova-core: gsp: Boot GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-15-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd8f22b-e03b-408c-db21-08de1e578ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3VycGRLd1dZMVhUM0hEYmRrU25ON0hpdHNrNWQ1RncvK2VlYnRTZGNvdEJS?=
 =?utf-8?B?clpRazVmSFVTNFFXQ2tqTkdobGRxV3pNaUJRRFBDT3JXZlJOM3ZQT1ZJSjZH?=
 =?utf-8?B?aU9GTFRiQjNTT280M3ZBU3V0RUh5Wk1rUFIwZHBwRFlsZGZBNXBHa0NsTHht?=
 =?utf-8?B?bmJGa3YrOWE2aVMyci9RVTdYZ0JKdHBjZHNRREE3eHRrOHlHbWZqQkpQNUVK?=
 =?utf-8?B?SUgxTEVqdmVvNThVWEoxa3NYbmx4MnNqZWMybHV5TDlQQnUxTGVTZmhvK3pV?=
 =?utf-8?B?a0NETFdXTzVRTVVwRzl1TFJLWmV6bU5FUU9adzlmbXhzWHVZUEpYYzI4bTIv?=
 =?utf-8?B?ZVhkLzhveks1c2FtQzhjT29ZbzRtOHg3c0l1UUFlUU01OTBqR252Y04vODlM?=
 =?utf-8?B?K29NSXJpVFdJaktlVllaL0cyWDFSc0NSSTlQT0E3ZkpwOTRrcDBLYjA1c2N4?=
 =?utf-8?B?QlhaNEJzQjNLR2VYUFpPdmFrS01NZnZGTGhESzY2SlN2QjVNNXJIMFdXZlJu?=
 =?utf-8?B?dXQ1eE5CNWt4VEQrb0JodE4zN0FqWkx5b1dReUNaRWc3RldHRlZtS0tVeERR?=
 =?utf-8?B?TzZWdlZZOTdHYW9tM0o2ZW1pUXBJMWppUlUvOG1LZWJ0TU5oUjlWTFJZaUln?=
 =?utf-8?B?Vzk3a0xCSlhOWXRVai8zYmFra3pFNC96bjJocDNTeEFtTkRxWExqeDdkbVE0?=
 =?utf-8?B?VEJvazBGZFdyTVdHMFdWdkVHSUJ0bjJlc1B0Mk5SYWZ1VmQ5RjZOSWJTWFB3?=
 =?utf-8?B?dWhmNjUvTzhoSlQ2NGhnREE0WEJuNk9iWGo0d2JIOGRHTVVVWTBCNm4xUnM2?=
 =?utf-8?B?YlczZ2d5UjhQbjVQSWVwcmp6WHpRNVBVRXkza3Z1aUxhd1hjVEl2SVpMbEpB?=
 =?utf-8?B?SWUxMnVNQUMvbXBFenlEamVsRWVSNDdMeUFqbiszVEFqb3FibXNtQ0pDSWhZ?=
 =?utf-8?B?VXpOcDdpTFhMTDcrbjRkNUVyT1VWU1k4ZWdObnMzWmFOWHZOdUg4S3cyR0VZ?=
 =?utf-8?B?T1dOcHpDTW1DazBYWUVDSlJaaFNwbFZSYTdOVmsyZGFxQ2FDSG41ZDYwRzIv?=
 =?utf-8?B?MXYzV0tGQ1hCb3BsK09BZ0tvUnNVR2o1RVNxK2FHUWtRZHpTTWREb1gwajIx?=
 =?utf-8?B?c3Z5aDJKOGdveEh6TEpXeE1NZk9TdWpLN1dvMk5RSTlLZ3NBOVZZdk4rc3dW?=
 =?utf-8?B?UkhiVTVPeTNLb3h6NlNFSTI4Vk01VFNmdjNBVjFaRzBuek5aWTErbDBjL1p1?=
 =?utf-8?B?ZHBrQjlyTmJlZjFGME1LZUFKcTNOcWg5a2FsZU9uakloNG9MdkZLeWVidWFO?=
 =?utf-8?B?NGZ5dG1pcUFqRGpEQVNMTHNpdXpSMVAyY2pRN1hFenVuYXFzSjhXbStOTWpt?=
 =?utf-8?B?K3RaaDJIcGViRWlNdEkzOEFjbFVJYjlYR3V0ODhrOStlYWVPZTR2QzRtZGpQ?=
 =?utf-8?B?M2ViY2pJWWpUb09McE1XNml5YW1XTEdhZXgwUUIyWHVrOVdHbG9zTVJYZGkx?=
 =?utf-8?B?VENnM3FtNUlwVVk1aUdjK3cvV0V0aU1zd0NKVGZSL2RzaFYrbE9LZ0llbGZE?=
 =?utf-8?B?S1VVQzJpRXE0R0tsYkt5NkFqVnVtNjJsemVWTFplMmx4R0s4Y0ZDNVlKdi95?=
 =?utf-8?B?eFhIVEl4YVpFUVBmbmcxWjdsejNTK05McjlRUWZiOENnZjhPQUVTR3krdzhD?=
 =?utf-8?B?b1pVVWw2cHk3cnRTRmM0NTRlTlFtYzFYV3c4c1VNb2xXZkZxT0ZSdE5KM0N2?=
 =?utf-8?B?Q0NkN2s5RnZBT014THUxV1Y2cklTVmdBWGxybExhT3R4S0hsWEJmOTlXM3lo?=
 =?utf-8?B?SWF1VkxYQlM2R2lpNGtJK0pqUFVxQUFtRU16K3JxRkdnSmYwZDBWS1FDb2VS?=
 =?utf-8?B?OGU5bk9FdzlJd3VMOVZ3VHVXN3JOd1BscjJuK2tZbEpuWUg5NlluQ3k3T3NN?=
 =?utf-8?B?SUdKdFFaQjJZaHAxT1JNN2dFT0FGdDBjWnpFMUpTWjYyclZGVWhhM0h3ZlNt?=
 =?utf-8?Q?MSfUZUy2DIktquB4uhJSlgJkDCOI9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2FFZFlqWUMveWVzSThXaWdaMk1Nb3UzWlZPVnlsQU50bDZpT2QvWWxFb2xW?=
 =?utf-8?B?Z1JMYW9la1dkOTZvcTdpSWZhcVRiMFVwbSt5L3FxQWxSR1Y3bkYzUWt5NmR3?=
 =?utf-8?B?REttTVRQekRXc1pYNUhNTWRZVldQZStQTEl5d2pJUEhqNGtvSVZMTmxrdG4r?=
 =?utf-8?B?NENxNXVqMEhxbnNHUW96Z2xQcHNwa3dXZjc3bVg2d2hxMEFDWTJ1RE5FODc1?=
 =?utf-8?B?ZlZJRlBCazZhbGQrNlpkQjFoT2gzc0p3S2IwNGhXNWRNS1Q1NGFoNWh1ZXU4?=
 =?utf-8?B?SUVnVGJRMUx6SE52Yk9NcExRWFR5c0Fvb1dsTWlyV01KU05paEtLMUlRR3B6?=
 =?utf-8?B?bEFUOE1XRk9wdlhkdENOaVNmMFZVNGplOGREa0JZZ1N2YWdVUXphYVZLWjhn?=
 =?utf-8?B?c2k5VmdLQlpWaU1iWUFUYVB4U05yTFplRkk4R3ArRWIyaGszdks3NDRGbFVD?=
 =?utf-8?B?RC9tMTBOWkNjbk50SVlhb2tjdHNIZkZJNlF3YnJza3luUFhlM1lERjRtaUE5?=
 =?utf-8?B?ZEpEVzNTQTNIZkRhQlNwZlF1Sm96QklXbmNHSmtiOXNsUjFLRXB4MUM4aWRt?=
 =?utf-8?B?eEFEV1lzcFlLWGpmZVdRSjdVZW1IcktiNTNBYkJvc3QyeHMvaXp2YzQvcVBp?=
 =?utf-8?B?WDN1M3pjQ3V0RThOdzB4d2hnV2ZtTWVQTXBPR08xRFNaQ1BkcUZheGp0c2Yy?=
 =?utf-8?B?UTBVWlZjSmhDd0FYZG5JT2daUUs2Q2FyQlZwTmZaYjRCOHJFTEdOU1FhVFAr?=
 =?utf-8?B?UjhLZnBGazY4dGVSSXFFcHI4Mnp5MFByaU9Kb0FNMWZCQ1ViSVpFOTBudDlY?=
 =?utf-8?B?RHorQzJTczFzQ0YrVmtvZFd3MnlWL3pFbjVJaWJQcVhXWWI0SFdVamp1aDhl?=
 =?utf-8?B?anBvNTY1TVhlMGljY1VoOUk3OWR0U0c5cncwbVpBN280QnIxaFdsaTZxNXM3?=
 =?utf-8?B?MjdPQVFIUk9jbDlNM1NkSmdOcjdwem9udFpZZTdPbno2dEhvSmFoMk9NMUZm?=
 =?utf-8?B?N3VxL0ZiWmo3OVFMNFBGTm1zelBVNHhaSEF6RzgzcS9WSFdIRnI1TkJ6ajZk?=
 =?utf-8?B?UGo5bkFEd1ZQY1dteVZuNE5sYlQyR0tYRmV6UU1CQ2ZOZDhEbURpRGpRMzND?=
 =?utf-8?B?cVhsdGxyNDllS2tEelBib21zb1ora0lwYkpzU1FBVHZObUFQeEZxSU1TRVp3?=
 =?utf-8?B?RHI0ZnhvNmptNUNjdVRYZFpDMnhlUUMwc1B3V01NZjAwMUdKTXg4ZlF6TGNv?=
 =?utf-8?B?dXl3NTRWN1pPT3hnWkJMdzFaV0pyYXJHUHprMDhmNUdTeW1acVd0U1lDREth?=
 =?utf-8?B?ZUlUd1Z0N3VKeWNCK0RCcGJMVXkrSUNWSHlYK0RKTlVxUzIwOFA2dHkvYkZl?=
 =?utf-8?B?ZURSSnRHdjRndUQ0Qi9RWGJjdkdtOXRBSjR2Mm5vTWxBbXBmeXo5RE4wTm9G?=
 =?utf-8?B?UURLRDFhRWVjZzJ3TXZMS1JqMmsybjYvcTRKUWNkbDhOMjhEM1k0VWEvR1RE?=
 =?utf-8?B?MHRTSmJqY2QrUithUTQ3Q2k1NFdVL3dUeVY0VytZM1Yzcm94a2czVmhXZ21U?=
 =?utf-8?B?a2ZkLzllZTA1WVF5TzJsNmtidjlzelRSQjlTeXlLNG5ZNHFuZXhVRHpnTmpN?=
 =?utf-8?B?bU9TZ0Zhem1DRWZRQnBkYnVNQTd5TGNuUmUzZlBqUG1WQ2hPYWFrNUh1VFlj?=
 =?utf-8?B?a3huS25YMUdobnpOb05sRzg4d1ZzRVNibGQzTGRHSDlvMEpCT1FPQ29UREdO?=
 =?utf-8?B?VXVkQ2NWSzI0bFVuYWhsQnlRNndBSm1Fc2NCQVNnNjRnc3NNYlNCWE5TdWpk?=
 =?utf-8?B?T0kremdtOWFEYkNWT1h6SUVlTWMwM09IVG5obkUwdEZxSkx6SE81WXR0dlJq?=
 =?utf-8?B?dTUyNFg5QVMxc2RyRHl1WGF3YXR1MlhmbWtNMGVzcldMY1dGRHB3b2ZKQkNO?=
 =?utf-8?B?NFNTbisvUDNqNGhKM0FLRXJaTCs4UEpybGgxdWFWRGZoRU96VTk0bDM1YXNM?=
 =?utf-8?B?N05UOWZRcDErbFZNa1l3L0M5ek90RExIK0N5VlFZUTRoQjRZUG5pODFrRG5B?=
 =?utf-8?B?UWZSQkZGdllSdWdhMUl5Uzh0RXJOYlNCd1FCOTNBWG9CbWFxUUF3MEd3V2po?=
 =?utf-8?B?ek9lZDFEVHNrVFN5cXYvN0pZb3hrMEtpR2k2ZmsrZzM5T2tLY1d4cVdLTlBm?=
 =?utf-8?Q?rWoS+VNusp2e8q4W9Q8HfQx8a55Jc7MWBYYZybIxHuiB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd8f22b-e03b-408c-db21-08de1e578ee3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:44:14.2632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfMqVdAm4HzMkEQf2lT6Q7DM7AlvZh0c3IIl6sAZtsDcAPH5vGlt9NbrYG8D1nPEEpqbiwbadLzfYUFIAaPS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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

From: Alistair Popple <apopple@nvidia.com>

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 65 ++++++++++++++++++++++++++++++++-
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 31904e1d804b..05b124acbfc1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -616,14 +616,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 7d82fb9876e8..28dfef63657a 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -57,7 +57,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub(crate) code_offset: u32,
@@ -66,7 +65,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub(crate) manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub(crate) app_version: u32,
     /// Device-mapped firmware image.
     pub(crate) ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index dcb5b50e176f..638ed6a14b80 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -4,8 +4,10 @@
     device,
     dma::CoherentAllocation,
     dma_write,
+    io::poll::read_poll_timeout,
     pci,
-    prelude::*, //
+    prelude::*,
+    time::Delta, //
 };
 
 use crate::{
@@ -143,7 +145,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -161,6 +163,65 @@ pub(crate) fn boot(
         self.cmdq
             .send_gsp_command(bar, commands::SetRegistry::new())?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }

-- 
2.51.2

