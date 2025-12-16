Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B06CC0FA7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1A10E6CA;
	Tue, 16 Dec 2025 05:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lymxoruU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A6410E6AD;
 Tue, 16 Dec 2025 05:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GznuBMt7HvJVTmut+7o4xi7uJ5enPeujjqIkAV5xmvb9jIxhiSivBsP/rQY7dQKWl972syKGN4amEJTYoQFzF9LalZ/usAHrR7D1eeLh70vfHjlC+DT+96sA9rvN98sss6JzZjCp/QrV1it+QC0kQFVBtVe48fgTe+zMAdyE8Cf9R6lgtEDqTZQEDBbAj3TcGiJK3z3iCTBVyJF2x984UZsw8h1pep/rnniOL05CvAmZTmP4wmprUjaYbdkSagKllgBOGL6goshR3zBZrskPM+dfIKh6anL40+uUiQca1Dfzws8hlMpDcAuUrqAeQ+RzpuXkkXKU9gV5JncNGBEvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vhbfZZwzZliNSdPtJ7DBOuGoM7eUMZTAzXKb28sPB0=;
 b=ekjS+35KPfrWk+jh4tAUrcXjxlEnHDmspJtvA/vgxlAFQMEg71KV+5yCJ5D8NGp94ot/HYCrSi0w0UXbnDzUrF/n5Gb6kdDilvEMWvK19pNYelow373J427IAS2x/oM6rMIt1UJUk5X4ct3QBluieMhncBaAEpVcqrUnAZZslAi98SAuGxilGek//wxkzJp8HWmbshZFHR+Xq/WyFKfJe8Z+YogKAh5qym0hdhxlZZ2LORYZytUojln2Xrj4Kh7xCIe5SP8eGqvSuNk9wNmldB/d/wE/xFNiLIrOtdkAlS7+OFeyf+qKjFa/DIcKJObmKDNqC46sNMRdloZqcvsccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vhbfZZwzZliNSdPtJ7DBOuGoM7eUMZTAzXKb28sPB0=;
 b=lymxoruUj0MXDijmFb+bKCtUcKQLwje8kfc8mfAWUfF8wF8tAjD1s9twU08QOXgq6coxcU8i2by+nB4QGw7W8UE436a9JuFvaqRjhlGF5YmVs2uWwGv+NnE6PjYH2kj9r30/SMWIOMLlOdOStRdUa6AXM5r/hc5HoaMl/WzNMVVmoBay16p1Zc7dEdMDWUmF6EFnFg9b40l8utU+Tv8UO9VcL0vadMhAiDiJpM0rdeM/cZ1UGox+cjiaA8DH5xzSTJNkfDbqSakUF1RHUrxRvXFb4kSbH8wscyPWoz5+C3R3TZhzF941ccdjPQsEW4lxBc+3pioZJ2/Fe7wyAg6Mwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:32 +0900
Subject: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f170b89-10ea-4a82-1931-08de3c61e892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0JIYlNKK2kxbEdjdTRidElvdHpLUkRXTk8rRWNEOWMvSkpPWXFJaU5QalpX?=
 =?utf-8?B?TzJ5a043MEVGRkZIdjhSTzVXc2FqR2JOQVNPazJkZ2lnS1kwYlFZY2FZR2lG?=
 =?utf-8?B?MXJtWkRUNEtxUmI1bGhLbFE4dXVGZDZydGRuRlJwRFJoNmxSTlVjeVFEM2E5?=
 =?utf-8?B?cS9jWlMyQUJnbk1IbXI5cE9ZNmFabVRwelVUTGdKb2Q1NVd5WWcxMVBFR29R?=
 =?utf-8?B?TWlMd3lidjhHbWlNUTUveU5XYzVGbVVZSHNMWkZwOURvelcyR1ZNSU16SjND?=
 =?utf-8?B?YTFMSEtyalJxWFcxd3k0dmo0cm9IUDFQUjEzSUkySjNpdlRieVFsNUhJWWNF?=
 =?utf-8?B?a2VDeDE1UEsvZVBudmRoUk9hNER1L2JBQ2MwSlZRL0Ewems1cXpoVkVKaHpV?=
 =?utf-8?B?dkpINUhvTDVFKzRVUDBMVGlLKzJOY0lERXVaY2NabVMyT0tJZEZ1VUxFSHVx?=
 =?utf-8?B?a0xXOEsveS95WFc4aVBwSU5GQkdJWkNuL25pQzF3UHRtVWJBMHdvQk4zczdq?=
 =?utf-8?B?ZTRsWS94UGhCRno3UDZ2d3dvVDk5bDlBbER4VGkwNnNIdENhRG1KY3dCZ0Ew?=
 =?utf-8?B?R1ZXdUIybnFMSmd5M25oRExFUWUwMEdEcmJVeEIrd1FkMFluNFZta1k0MVVE?=
 =?utf-8?B?c2NEQUpXanhhdjM0RFMzdVJhTnd1cDdRV3Foc3RGT21acGt1a2ZCcVFuWHl6?=
 =?utf-8?B?c1doY3NPUDdjV0RacmhWT2VXekNIekhRd25Wb0w3NFJ6cTFrWDhPSDh3MmEx?=
 =?utf-8?B?dEhpTzN4TXliTHZud2Job1p2QUNKVWV1SkpIRFJYQm9LOWNkZlk2VGJYa0JX?=
 =?utf-8?B?bGZ6TEZtd3A2Q01tMjBQajE3T1BPOUI3M3d0V1hJYzhCa2RDdUNNYm8wWUxs?=
 =?utf-8?B?dGRwQ3FLSUlFUWNDc2VDa05UZGwrM3BtTURvYTNZYnFBQ3FXbDZkNHovWnRt?=
 =?utf-8?B?TEVtMmcvKzd6Q2ZTcSs0QnJpT2lXMGVFcnI1V3N4NlQ1a1BYNmV2TUJuUWxn?=
 =?utf-8?B?cWtxaHhCZ2xuMEJXdko5RzRINlBhQllYb3BIOTZteXY4NkJiRVV0R2E5dXN0?=
 =?utf-8?B?b3FVUnFBQU51Z3NKNlhSNWsvNnJEdTR3dnRSZm0wYndJRkpSMU1WRytDN0Nz?=
 =?utf-8?B?alNSb3JXaTd1UUViUHMxUkwrNTEvb3RiUnBrUTZoWHo5ZjNIS2lKSnNCbm9E?=
 =?utf-8?B?QlZydHdnejk5SUE5T0Q5azhNRm5HR2N6UlluaDF2VXZQR0Z6UW9rQ3QwWXpr?=
 =?utf-8?B?K3p0SlRWaVBDWlVaTTdoUTZ4d3dwL0pYWFJEZElLbEI0bW16bTBSLzREck10?=
 =?utf-8?B?aXhHQkdyd2RjM3d2UDFmOEpQeVFUT0dsRVkxc2VlTURSclZhVUI2Q3VMV2ll?=
 =?utf-8?B?Sk1qZGZ6RTV0aGJFZDViUFA1eWlrQjU1bFpmOGs0Myt5L2xkR3dQYWJzKzVn?=
 =?utf-8?B?OXgyTnNsVjdaSzRqNGxlM0JHeTA4aktaRlJMS1pyWFpUYVpLNjhlU21Fa3Zh?=
 =?utf-8?B?YlBCY1FnRzdKYjJ1bzEzbE9xS3kxMGdkMHd3bDZJK2ZkS3lLYjhjanpBU25x?=
 =?utf-8?B?Y0VqMndyRmtQYXRvcGpxekFKLzM5ZFdjYUZ2Q2luODlvZmFXZGQ5L1NoaU5I?=
 =?utf-8?B?akRMMVFiQmtuOGpvSTFRZTlhcE1Ybis2T0ZFSnNZOUUyaVVCV294cHRMWVR6?=
 =?utf-8?B?dHh0RVRaWjJ3VHA3WHZmdEs0eVJsekZaaFNjci9QM0pYVXdIeEtBVFVXenc1?=
 =?utf-8?B?T2VzVkFmTVlOSHZKKytrRTdCaEsra283M2hiYnRHNlNYTk9IbFV1VFk4bXE0?=
 =?utf-8?B?VTcyQytkeU8rU01SemZ6NWdoWS9DWlFyOTJybXNTLzlNR2VXVlVBcXVVUkI4?=
 =?utf-8?B?ckdSVDNsSnloSy9NbkxzM056NE1jQUNSeE9jRkpuRFEyekhuY01WYnZsM294?=
 =?utf-8?B?QzNEK0MxdU0zS1A3ZElWOFJ2by9zZUt0TnlicDg3ZmlMMXU1MHFVU01yanFT?=
 =?utf-8?Q?mljaQqYteLnsf8gvfhWP4+p9hxAxjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStWaDgrZjZNZTNuSkFEaEpldE5CUXZDcnRZbkxkNml4ZkJiZ0JmenVFQ3Za?=
 =?utf-8?B?Q1pZaFp1d3ZYbE9XQUhLZmhKQXltelcvOVlrZ3NlNDFGVkV4QW5sYVVaT20y?=
 =?utf-8?B?RWI0MTFmcGM3MXpVUXNrSHl0K1NTYjJBaXdEdFdIRlVxRmtKSDY3Y1Bjbitu?=
 =?utf-8?B?TnEzejJsM205MTNmai96Q21IQ3pOaW5xRmwzVU1nSE5hZXRlR3ZzUnd6azRv?=
 =?utf-8?B?REtCTFVnK3Y1Wmh4bnNtYVBuL24xbmkxc0xQdFBYWkNFdmlYK0NjSUkvVjlY?=
 =?utf-8?B?WkxFL1I0UW5xMFhzT29tY3dwMTNWQkZYLzMvalJoTmFOaWNKSkdWK3VROEQz?=
 =?utf-8?B?Q3JSckp6cXFhSTNYVkFwejU5MkMwbSsyTWJrVHRTVGE3bW9GdDFMN3R1c0N4?=
 =?utf-8?B?R1BNTFFNRHBLNzZrK0R2cnA3VE5jdUFuS2ZqQ2pQaFQ5YlFLbzZSRnBCUlBU?=
 =?utf-8?B?eGZINU56d1lIcUVGRXNnZG9VckhCRlduUXIwa1Z4ZXRJLzFpVGpCb0JVY2NS?=
 =?utf-8?B?aHBpWlNSNWEzNEJWQjZYRTJwSzlBci9SNnZBQ3dOejBWRVZsL3hiTlY0TEdR?=
 =?utf-8?B?alAyUlVscEpmSmt6cW1PVWd4WTc2d1crRjdPcTR5S2huVVd3bHgwbjdxMUxP?=
 =?utf-8?B?Tjc5OWVWZERXMVNoV3JJRVZTQkxjNlp6dlBPeWFGdlZJYjJTNnJSODlxR2tj?=
 =?utf-8?B?Vm5KYW1TRGd4UldONWMzQ1p2bm5sRW1CWURZaUVYS1dnUWdQSzBHRHZ3QVhP?=
 =?utf-8?B?UWE4WnFUYTlCY29aTmdEK0prWWlYcExEcCs4WTJ2c3ZIUGV1elJqT2xKREJI?=
 =?utf-8?B?NXg3NXBFOUFqR0lQS09SWUxISGVLUWFQWEdSYVd0SUdKd2lwUkJrM2dTK2gx?=
 =?utf-8?B?Y2JFd0tZbzhWV0NNanlyTVRkZE5STDF1aXprMmMvcVd2QTFpU1NBZjUxcmFS?=
 =?utf-8?B?b3JpWnQ5QzVBOTBzRFZvYlFEdXVRNzhOcFRnWWZJcnpScnFwRjBuZUEvTmV6?=
 =?utf-8?B?dlI4VWpkLzk3YW4xZncrTXZHTjQvY1orWG1sUEFmaFc3b0czc05mcENRSXlX?=
 =?utf-8?B?Q2pVQ2lhWTFhR3RYNTBoYnNVa2FTZXVQd3ZNdm5OQ1RkVWhNNHdIOG9aWUIr?=
 =?utf-8?B?L2ZqUTdHNWFFTHZEWGl4cXlSdFNYa1lKaXJuRzdvSmpIYlp5ZUJ3enp0cDRq?=
 =?utf-8?B?TkdTa2VCL0Nwbm1keEdWWDhpa0w4cVBhTUlORmR1Q3Uza2xIMkRjVjFuYjVC?=
 =?utf-8?B?ay84OFdQYUY4LzR5TTc4Wk9ETEhPekVCWWpEWHR4RFNJTVpkb1ZVNmZvZXRv?=
 =?utf-8?B?MGY5OUUvWXJMRjJiL3Qxd0lzWGhjMWJpTDhKdjBTQTJoU2hTSkhESGZOOUMw?=
 =?utf-8?B?azNFdWVEdXVNU2psdCtVbDV1aExTWHVLNStkYVdKSHZENElLemZETVZrYlhK?=
 =?utf-8?B?NE5pWnpRQ3lVakZ6emhqd0lLVjVaTUlCMnBHc29qRG84WXphdVFrN0NOd1pL?=
 =?utf-8?B?U2FyVHRxcTROTjNsNTdzZlNycXFKU29LUzRXZ0RDSVVrNTFlUHVJTkcrNDQ3?=
 =?utf-8?B?czV2SFBpaUhhN1VIZEcvZW0wajNMdmlqRDdHZnBCSjJaYSsrODVzZ28vREJY?=
 =?utf-8?B?QWRBcHFxeDZZOHA1a25ZWEwwTStrK0tpRng0eG10bGRhcGJNRkVTYmpscDcx?=
 =?utf-8?B?NFVSTDdEMFJ3enJ4UXNkOWdqRlIrU2FTamR1UUs5d3NkWHYwNlVrT3N0c0Vi?=
 =?utf-8?B?OWdpQlpnTjR5bGpDQzEybUwyZE9FOTdJSTZ3aXFMSFFJbkhHM3hrd0UzK2Y4?=
 =?utf-8?B?dmRKOVZTVUd4R011cktrRDhRd1ZrOUd1b0o1ZnB6Q1ZWQVlERXJQTithd0x5?=
 =?utf-8?B?NXo1V0ZtRGx2aGVzR1A5REsxNFFTaWozYm5RaFgzTlpVSjJzaS96ZVM0YmNX?=
 =?utf-8?B?TU9KMlpqYUdiTjR3OHV2ZXUweXplUm1pbXlMRzFpbFhOMFptZzQrd2NkQ0Ez?=
 =?utf-8?B?eXEyQjhIellaVS91VUlmWFZxRFVqYzZiUkZKc3R2M1BuY292a003Znp0ckNM?=
 =?utf-8?B?UTdqNlg0UmZLQTMrRG02bzV5aFFSakFySW1NcXU3WjdibTZyK3pLSk1uL0o5?=
 =?utf-8?B?RTZaOG4rVWk1b2l2QXI2OGE5MUtUdmttbHlVTTJYdlFkelJhNHlZUDBhMlVj?=
 =?utf-8?Q?06XeCHoGmZWPhvAM2RLz9Ph3q1pV7d7KOtlBKqcJNVOp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f170b89-10ea-4a82-1931-08de3c61e892
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:54.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbb1kqCh1kitOpCkZCyYZrJndn9J9Suiltercw+62v3mO9nLbuziX+PxjcP2QCNLdfdSQgiVPqGeU31KTZKscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Currently, the GSP is left running after the driver is unbound. This is
not great for several reasons, notably that it can still access shared
memory areas that the kernel will now reclaim (especially problematic on
setups without an IOMMU).

Fix this by sending the `UNLOADING_GUEST_DRIVER` GSP command when
unbinding. This stops the GSP and let us proceed with the rest of the
unbind sequence in the next patch.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                      |  5 +++
 drivers/gpu/nova-core/gsp/boot.rs                 | 42 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 42 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |  4 +++
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 27 +++++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  8 +++++
 6 files changed, 128 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ef6ceced350e..b94784f57b36 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -291,6 +291,9 @@ pub(crate) fn new<'a>(
 
     /// Called when the corresponding [`Device`](device::Device) is unbound.
     ///
+    /// Prepares the GPU for unbinding by shutting down the GSP and unregistering the sysmem flush
+    /// memory page.
+    ///
     /// Note: This method must only be called from `Driver::unbind`.
     pub(crate) fn unbind(self: Pin<&mut Self>, dev: &device::Device<device::Core>) {
         let this = self.project();
@@ -299,6 +302,8 @@ pub(crate) fn unbind(self: Pin<&mut Self>, dev: &device::Device<device::Core>) {
             return;
         };
 
+        let _ = kernel::warn_on_err!(this.gsp.unload(dev, bar, this.gsp_falcon,));
+
         this.sysmem_flush.unregister(bar);
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index ca7efdaa753b..e12e1d3fd53f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -32,6 +32,7 @@
     },
     gpu::Chipset,
     gsp::{
+        cmdq::Cmdq,
         commands,
         sequencer::{
             GspSequencer,
@@ -231,4 +232,45 @@ pub(crate) fn boot(
 
         Ok(())
     }
+
+    /// Shutdowns the GSP and wait until it is offline.
+    fn shutdown_gsp(
+        cmdq: &mut Cmdq,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        suspend: bool,
+    ) -> Result<()> {
+        // Send command to shutdown GSP and wait for response.
+        commands::unload_guest_driver(cmdq, bar, suspend)?;
+
+        // Wait until GSP signals it is suspended.
+        const LIBOS_INTERRUPT_PROCESSOR_SUSPENDED: u32 = 0x8000_0000;
+        read_poll_timeout(
+            || Ok(gsp_falcon.read_mailbox0(bar)),
+            |&mb0| mb0 == LIBOS_INTERRUPT_PROCESSOR_SUSPENDED,
+            Delta::ZERO,
+            Delta::from_secs(5),
+        )
+        .map(|_| ())
+    }
+
+    /// Attempts to unload the GSP firmware.
+    ///
+    /// This stops all activity on the GSP.
+    pub(crate) fn unload(
+        self: Pin<&mut Self>,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+    ) -> Result {
+        let this = self.project();
+
+        /* Shutdown the GSP */
+
+        Self::shutdown_gsp(this.cmdq, bar, gsp_falcon, false)
+            .inspect_err(|e| dev_err!(dev, "unload guest driver failed: {:?}", e))?;
+        dev_dbg!(dev, "GSP shut down\n");
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 2050771f9b53..0bcfca8c7e42 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -225,3 +225,45 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
         }
     }
 }
+
+impl CommandToGsp for UnloadingGuestDriver {
+    const FUNCTION: MsgFunction = MsgFunction::UnloadingGuestDriver;
+    type Command = Self;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        *self
+    }
+}
+
+pub(crate) struct UnloadingGuestDriverReply;
+
+impl MessageFromGsp for UnloadingGuestDriverReply {
+    const FUNCTION: MsgFunction = MsgFunction::UnloadingGuestDriver;
+    type InitError = Infallible;
+    type Message = ();
+
+    fn read(
+        _msg: &Self::Message,
+        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        Ok(UnloadingGuestDriverReply)
+    }
+}
+
+/// Send the [`UnloadingGuestDriver`] command to the GSP and await the reply.
+pub(crate) fn unload_guest_driver(
+    cmdq: &mut Cmdq,
+    bar: &Bar0,
+    suspend: bool,
+) -> Result<UnloadingGuestDriverReply> {
+    cmdq.send_command(bar, UnloadingGuestDriver::new(suspend))?;
+
+    loop {
+        match cmdq.receive_msg::<UnloadingGuestDriverReply>(Delta::from_secs(5)) {
+            Ok(resp) => return Ok(resp),
+            Err(ERANGE) => continue,
+            Err(e) => return Err(e),
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 09549f7db52d..228464fd47a0 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -209,6 +209,7 @@ pub(crate) enum MsgFunction {
     GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
     GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    UnloadingGuestDriver = bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER,
 
     // Event codes
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
@@ -249,6 +250,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             }
             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER => {
+                Ok(MsgFunction::UnloadingGuestDriver)
+            }
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 85465521de32..c7df4783ad21 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -125,3 +125,30 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspStaticConfigInfo {}
+
+/// Payload of the `UnloadingGuestDriver` command and message.
+#[repr(transparent)]
+#[derive(Clone, Copy, Debug, Zeroable)]
+pub(crate) struct UnloadingGuestDriver {
+    inner: bindings::rpc_unloading_guest_driver_v1F_07,
+}
+
+impl UnloadingGuestDriver {
+    pub(crate) fn new(suspend: bool) -> Self {
+        Self {
+            inner: bindings::rpc_unloading_guest_driver_v1F_07 {
+                bInPMTransition: if suspend { 1 } else { 0 },
+                bGc6Entering: 0,
+                newLevel: if suspend { 3 } else { 0 },
+                ..Zeroable::zeroed()
+            },
+        }
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for UnloadingGuestDriver {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for UnloadingGuestDriver {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..212ccc13c0cc 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -879,6 +879,14 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct rpc_unloading_guest_driver_v1F_07 {
+    pub bInPMTransition: u8_,
+    pub bGc6Entering: u8_,
+    pub __bindgen_padding_0: [u8; 2usize],
+    pub newLevel: u32_,
+}
+#[repr(C)]
 #[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_run_cpu_sequencer_v17_00 {
     pub bufferSizeDWord: u32_,

-- 
2.52.0

