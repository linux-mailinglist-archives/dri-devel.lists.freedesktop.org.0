Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB9B5615E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB17110E1DA;
	Sat, 13 Sep 2025 14:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c6cD3u+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5E210E1D3;
 Sat, 13 Sep 2025 14:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imIE7sM8YD0Asg3I4EhPErSQlL0E9gl1zeDrRPojNXsmUeySJI3EGiHTIwrn7mKixlZ55oKC9J3pivBUDsnJ1xJO4AjsbWEoK8lW8YcpWuhuuCQnNv8wDTgFQsxo3kduRZqyK9TdQqDmAbJiKdkiUAkTiQ7Ym16q7UsohewUJ7FWaZj06OHsXDoT7gpGrjs+B0R3gxLUvE7Aq0CCDknNKKc9Q1uWlPPNGNkfNvDOFgy1L2S4vOFO6ecTK/o5DCSlZczCVSmgyw9Pg7NFqUkVhAQc9ORxXaJrNeoKzzY5No4FaJ+PtiKEyREQ2ExaizQqPn/ZX74Fk89JK6bm2KD6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBkRSmf47sJmQRS7IbUlqOAE1FLL9o1dhJYw//hTJRc=;
 b=IG4zEBVKii0/RCXDwlzn17TlXRTxLtubK6UhOhwXk8Cq5bl51rMVsXxAT4WDeZBRQ/Qg1mG+too7NdD7ofrUhx9mXIT6EeLlg45wXilIMpRA7CZAH25185Lmey8MOzfd+xEUIk4d86zMuEMdyP7y7wIfZU5igHmdEAhFdd+thGDic3Wi8/f1xAI+mdTYoglsXETk1/MOxk2TPXecURC4c5v8BQQlXbjUSgWR59Q5GeOF+SiTramzARX0GqKkdCzsmybcNT6qn2HRe1/BjUOzZXimcj/YSnA6VueuFWbCe2KgkBhqde+tbchGcMIsPKLnE9uhi1rMYJbORYQXVTCFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBkRSmf47sJmQRS7IbUlqOAE1FLL9o1dhJYw//hTJRc=;
 b=c6cD3u+8brGR9hDlxLOPUQiUzgXyFMoXLRnFyOvo0MIoY8WcLLDgpCKOM2xBScn3a38Z5tfnEIftGCaK+oX6ZZnmgFLxX76ODpA6sJHm5qcpXhWCkkDcs90gvrxJHf5NNuABs7vBoOnBePZFfD/7tMX31Oinl0iVpL7fP5O+il/1fMWs8tu/2TE1kqQFtxCrrB8VnWRHp5LctK/fhNuwEOEG7rjcmIiB6mES+zGXKcQ3rx7JAtbwYjGkI2P2pmlugLfouWLds1MTpJ6D7q9uNf7RJXmJ2laUuyZ1Qh3i71F48fhV3qJPqRY8H6w2mePFSkhTzkApbrXWkHKmK719nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v6 00/11] gpu: nova-core: process and prepare more
 firmwares to boot GSP
Date: Sat, 13 Sep 2025 23:12:13 +0900
Message-Id: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL57xWgC/3XOQU7DMBAF0KtEXhNke+yp3RX3QAhN4jH1oklxQ
 gBVuTtuuiAkYvlHev/PVQycEw/iWF1F5ikNqe9KwIdKtCfq3rhOoWShpbbSaV13/USvMeXzJ2W
 uWcbYGK8bAiuKuWSO6Wvpe36558zvH6V2vB9FQwPXbX8+p/FYsbZOGgXkAJ2MePBeGgo66lYRo
 UfvDmjQi1vXKQ1jn7+XVye1lP3z1aRqWcdoEaBUGpRP3ZRCoseyu1RNes1xy3XhHiyitjoy0I7
 DL/dytw6FW3TWBN9a8G7HzZr7LTeFm9A2BiDYyLzjdsWV2nJ7WydHAE0ILak/fJ7nHw/PvsHzA
 QAA
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: e3344311-61e5-4bf6-17f7-08ddf2cf8dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2ZWbHBHdHNaTWZYZFZxNUgvQWk1U1d2WnRwQytKdlkzUHdpV3pQaGF6NFFB?=
 =?utf-8?B?NGtwZVloQXRHM3F0dDBlMTA0czFzVmtOcUJ3SFpmbXNlTjZBaSt3QTlyY3kz?=
 =?utf-8?B?Z0MwY09ESjc4OTNpeHJSRWQ1NXgrak9PdSt4R3lmcDVlc2lKdDRPV0Q0NkNo?=
 =?utf-8?B?TjlVK2pUV1pXRkRKdTVkb0V5VFNNTnJwNjJjNitWU2NGdEl1YnNLN1d6VExO?=
 =?utf-8?B?U0UyUHplVlR6Y3luMmdHUUlWaWsvaUxobDB1N0FLSUh1Z3FZMHdiQUNlaGVr?=
 =?utf-8?B?OVJiL0x2VnIrYUV1dTRrVnZhQ1h6OVE2bFN1M3R3cG53T3YydXVFN01IQWsw?=
 =?utf-8?B?S2Z0NVZ6bDgxUmU4MmJLWDV6cUIwdnh4cDc4QmlsVDNza09mZGkwcEhIOXBQ?=
 =?utf-8?B?NHJNekpHS0loTEdvZmxuSGJ0SW5majJGVHhoLzlDSjA4clBYNk5UbGM3a2ds?=
 =?utf-8?B?UCtvWi8yQ3hJTFdIV1Rma1FpY20zR3JlT2F4T2RpWXBLVHdwUWZRenBrejN6?=
 =?utf-8?B?MXNGcHgzS3lMSERDcDhTOS9zNjRjaVIrNlpEL3hHRTVqVlRSTktwVjFONmVV?=
 =?utf-8?B?V0R0WWl5UThvNVdwVVcyODJOTGtSZk13Y3lhOFowa2E5WU9oMVdUY016NDJv?=
 =?utf-8?B?b3E2aGxLdm1PNUpLVDBhL0Z2MUsycVcvVVh2ZElIWEhqcURVRkdWU0Q4TXRl?=
 =?utf-8?B?cXhnWVJSK2xYVk5kcEdKUlZuUCtOMkdZa0JnRkNWQjAwNWhtT1NrZG43SXRY?=
 =?utf-8?B?bDhkT2VWQU9uTWRtUWxaK2Y3SjhiWDZ4Q3VTb2dFd21WdnRYYVNHOUZrRjlm?=
 =?utf-8?B?T21QdkRjUGJzVWtyNUtzdzdJUllZV3R5S3V6WE42WVNUNEsxZW92UjdFMHBT?=
 =?utf-8?B?RGsvZ3EwUURiOXI1NHZUY0RRc1N5cjBaV0JiMmRRMlZqRGU2Q3FRZmxQNzc1?=
 =?utf-8?B?czF4UytUUUdmYWlnazFQOW1qWS95cFdydkN1RFJRUVlPVFdMdXJRSlhMay9l?=
 =?utf-8?B?WWV4ckRMbFNlZWJqSG55b1NxYk56a2F2WDk5SmlRZHAvL3hXYk5vazgzdUlL?=
 =?utf-8?B?b3hZZ0N3UGgyZXdoSS9OMy90OFQvNWh0eW5BcUowcEhSUlF6WWFSNFJmQWhj?=
 =?utf-8?B?aXVoVmE5WnBPTVo4NE9DK1Bkc0FWMjA5dDJDK2tmWTNlOHNqTm1LYzVvNG1H?=
 =?utf-8?B?NzBTaHArLzc4ZGRWZjVPeGFseDdST0lNUUVRbVlUMHhHdndaSC9ReFNxL3FX?=
 =?utf-8?B?a3NnYnIwdDdqU2dWTzFqVjc0aDFFTFpFejBrRmdJUHA3cGxPVmJ4dC9ZdTAy?=
 =?utf-8?B?bGROSUR0L3YxZDIvRzl2WmlPWmpPbyt1bTIxV3N5ZzVzcGJhZmd2eXlKb2tV?=
 =?utf-8?B?L0RCTVZvaG1WSXVaU2hVc0VoMjdwd3JvcUdMb1k2Nk45MTFncExacDNkWFRU?=
 =?utf-8?B?Uk9mSDdhUDJ6dS9IVDZGdDJKeWljQzVpSUREVWFyWXY2Q1Z5UTNhbnExMmVD?=
 =?utf-8?B?N01LdUFIRUhhd2dldU5RNXdwblN1bGJzd3NZMUxqYXdRRENoRytzZk1NOGZu?=
 =?utf-8?B?Y3RQMGNFVUNvdHZrNmhyaXFBWnRKanU1NDhKa2N3cVlVYnppUUNNOTV0Z3VS?=
 =?utf-8?B?ME41cWl1Y2lEbkphdzVhd2N3YXJ2OHAraW82eG5UazBkT0VCb2dsMUZIaW13?=
 =?utf-8?B?bUJBV2E1Mk5tT3FNRytPQ0VIU2NGRDJrbmZ2SEVVOFhpTkpWbWI4Yy81TDh3?=
 =?utf-8?B?eHprQ1hsNHVkZEluNU11emdoemYzeG1tdUlhSW9DdERGZjB6RTBQZUVacWNq?=
 =?utf-8?B?aFlSM1A2bndaQStPT1JuWUlVTE9reldNcy9hZW85QmpxZVVSbk85RW9hYVZC?=
 =?utf-8?B?SENBbHpCK3N6eGFOSnVBRmIrelp3OGUwSkNXK1ZNRzExRlZ2ZXhFTG01RnRY?=
 =?utf-8?B?MnlhWVhndGlpQ3dwYm44azF1ZDZlUnJJcEl0TklUVjk2QWRvN3Z5UVhlcTla?=
 =?utf-8?B?dnFoNkJMc3lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N01ZWUluZmtCcUpJYit3dU9pZ3luSHpCMWN5U29WVnM5dkpHM3gxQ05hVEpM?=
 =?utf-8?B?K3ZQQmFpWXE4REtOeUFET2ViZkIrZjZmcXZ5YU9URitiUjd6dExLbC9DeGZv?=
 =?utf-8?B?THVvdFNtaU1ZWnM3cEtWWEtNNk13SDRna1dJNXM5VlpXdHZOVUZaTFZwa3lV?=
 =?utf-8?B?dTVJY3JQZmVscTFBY01oY29pTGFGRHZLbUhHbU5sejM5WFVacnRkRmxrbW9N?=
 =?utf-8?B?R0NMajlWeitGN3lxTVY1OXpXVldIZ2txSlhuVkhLMThpN050MER5WmlRZGpX?=
 =?utf-8?B?c0podVlxOUVGVmxCUjhjOXJzVkxzWnF1cWM3blQvbzlHM0VwU2lBUnVTdUxG?=
 =?utf-8?B?L2NodXRFVUFwU05uZndGMUs0Znowa3l0V1F5Z1N1M05rVnFrYUdVbnVpbVJr?=
 =?utf-8?B?WDBjRDdLNndPOUN4WTNBYzROQVFNN3BSdlNlZjB1T2R1TGlZZkdBZng2Vjl4?=
 =?utf-8?B?cE0xc1Z1ZHpVTWhpcENGMkJBeVpnTnBMclp3Y2g3cFFmQ2xIa1RhOFJ6TDFK?=
 =?utf-8?B?R1ZKb2xzNG9Cb2FDa09IQXNMUHVrSjVoejl3WWhVM2FzaCtObnZzNUJ4cm9I?=
 =?utf-8?B?eEd4WnlJTGN2L3VyNlV3SlUvcERnd1Q5RVhVQ3hFYy95MU16dmhJK2RDQ2Q1?=
 =?utf-8?B?SjlxN3pWVHMxY2xYdEpaOGx2cCtHUE4rUVc2cDNuQmx3RTJWRmVxd1hNNWRJ?=
 =?utf-8?B?Tk5yNGszd0hjS1NNdkpNN1BCZURqSTdYN1NLMGlMZElRbVdSaEI1Vzh1VWxB?=
 =?utf-8?B?Y05JSExpcEZQbVRnNDhTTS94U2pwaWIyc1I1d0ltUnFJaS9xYjFEKzJQVmtW?=
 =?utf-8?B?c3BQeG1EeVBLclByOTBrd1BNaW4rVDd2aDJQZ3pKVFJwUzBoajBTNUdLejFD?=
 =?utf-8?B?dnI4c3QzenpseFJxelpVMFRTSGFHcGFIdll0STgvL0tDT0psV2tPNzZLTHZj?=
 =?utf-8?B?c0JFVjVtYjcvL2NPUlZONFFDdFFKMFZoUStBRzdMNENrMjNmY1NNWTBhV04y?=
 =?utf-8?B?OXlSKzROSDZoYzlqbEhrNUZSc1ZSbUR0T3BTemxUU09kbEpGUGhCbWhJVmZr?=
 =?utf-8?B?NmNkM1JpTk1tNXNWT2pkZVA4RGVOcUk5cFFVeXhaWHhYY0pqUExFZUl0RUtm?=
 =?utf-8?B?ZUFTR0JOMitCQXRVL05GU2FpeW1lcFViaDg3b3orL3ZTKzl0NHl2NFV4M2Ji?=
 =?utf-8?B?ZFA4TWxxT3NNY2tFR2Q3UURaQlgwK252dzVpVzI1d0t2cTVGL1Y4eDREVTJL?=
 =?utf-8?B?R25GODVKaVFoRDl2eXRlVHRiTy9vWFREZlJQVkM4U1VleUZvSTFsVjBwY0RJ?=
 =?utf-8?B?YkZxWjhHSDg3eHpjdGtoZXNhU1VTZGcvMkFGRkcydmVOdTJ4bzYxVjZPZ3ZC?=
 =?utf-8?B?MDV1WDhER3NIU2lpWmJ1MnNqcXErVFlnMnJWYWFpOUNnNTRacjQxTnlEK0th?=
 =?utf-8?B?TU9NZzNnQUZBeVhSSTcvSVgzN01wK2VzNEVhWmpaS1J0RFg0SERrbjg2Mmt1?=
 =?utf-8?B?WURBbHI3bmtLMUdvNWNiWHpVSTNkOWVqa09ZWE43NWo3Q0FkS0NJWWRwR0xq?=
 =?utf-8?B?N2hNblMreVkyZ0EwWGowSmRxTGJRajEzUnJRckV1WEp5QlNZa2VjaEFUd05v?=
 =?utf-8?B?RFd1RExQMGJEVUZTeXBLaDg1ODgvZWp3UU9oQ1pIVWZuU1h2YnZtQTlkanAv?=
 =?utf-8?B?eHhlMjY4cFFIQU9BeGxKOXpoS2l4Q0RreUlNRmpCZjRyTUZybjE2c2lkNksy?=
 =?utf-8?B?ZHY0dXgzbmhDZVdmOCthTEFseVM3U244eDQ5MDhVZ0lsR2R6MnhlSWcrZTBq?=
 =?utf-8?B?MGRPZUh0allVRDQxMFVzQmRzSTc4RUZGNzNtK2UwVCtUSVR0ejhDR09BNk9s?=
 =?utf-8?B?b28zN0svc05OSEYyYU9TTFNuTjZNb1AxM0NkOURhM1Y5a2hjUUF2SkQ0bGRC?=
 =?utf-8?B?VyszUHREa3lDNUE3K3JUU3hkNXNyc1ZBUmQ0ME4wc3ZJekw5TmZpS1lZRWp6?=
 =?utf-8?B?c1ZzUE9pYUdId3NDVXhrcS9IK0E2UEJWNnQ1SWZ1cE8xU0hrZllKRmFmcmtq?=
 =?utf-8?B?VjkydlFVSXdOaHpKZ2V6bkJRMTlYOFRkZDlYbHZ6MGdNdHlCN2RKYmFnMXVE?=
 =?utf-8?B?RFBEeXBBQUVNMWdFdXpQRCtiV3g5UUZ1aEhnL0tvUXRwS25DV2lQUmJGd2ln?=
 =?utf-8?Q?Z++NZkwB2NoZUt/9XHBdIBzvls+A4yKSwACH+cLOxMRx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3344311-61e5-4bf6-17f7-08ddf2cf8dee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:21.2570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP3myH1ESf0ld4RKg/x4t9ggarPbRSoVY3tSM9740uRZTBG0uSbYKpFNi1WmMi9Ju6+TPmu6uae78sbQyq92yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

Sending a final revision to have the `Link:` tags that dim requires, and
for the record.

This series makes more progress on the GSP boot process for Ampere GPUs.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 2 new firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader and firmware, with the bootloader loaded by Booter
  onto the GSP RISC-V core to verify and load the actual GSP firmware.

There firmwares are involved in a rather complex dance that is made
necessary by limitations related to the level of privilege required to
load code onto the GSP (doing so requires a Heavy Secured signed
firmware, which is the role fulfilled by Booter).

The first 5 patches perform some cleanup and preparatory work for the
remainder of the series. Notably, the GSP boot is moved to a new method
of `Gpu` to get ready for the additional steps that will be added to it,
and the `Gpu` object is now fully built in-place. We also simplify
chipset name generation a bit and move the code requesting a firmware
file into a dedicated function in prevision of the removal of the
`Firmware` structure.

Patch 6 parses the Booter firmware file, queries the hardware for the
right signature to use, and patch it into the firmware blob. This makes
Booter ready to load and run.

Patches 7 and 8 prepare the GSP firmware and its bootloader, and keep
them into a single structure as they are closely related.

Patches 9 and 10 switch to the 570.144 firmware and introduce the
layout for its bindings. The raw bindings are stored in a private
module, and abstracted by the parent module as needed. This allows
consumer modules to access a safer/nicer form of the bindings than the
raw one, and also makes it easier to switch to a different (and
potentially incompatible) firmware version in the future.

570.144 has been picked because it is the latest firmware currently in
linux-firmware, but as development progresses the plan is to switch to a
newer one that is designed with the constraint of upstream in mind. So
support for 570.144 will be dropped in the future. Support for multiple
firmware versions is not considered at the moment: there is no immediate
need for it as the driver is still unstable, and we can think about this
point once we approach stability (and have better visibility about the
shape of the firmware at that point).

The last patch introduces the first bindings and uses them to compute
more framebuffer layout information needed for booting the GSP. A
separate patch series will pick up from there to use this information
and finally run these firmware blobs.

The base of this series is today's drm-rust-next, with the Alignment [2]
series required for the last patch.

A tree with all these dependencies and the patches of this series is
available at [3].

[1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250908-num-v5-0-c0f2f681ea96@nvidia.com/
[3] https://github.com/Gnurou/linux/tree/b4/nova_firmware

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v6:
- Rename `request_nv_firmware` to `nv_firmware`.
- Move GSP boot code to the `gsp/boot` module.
- Declare and use an empty `Gsp` type and proactively pin it into the
  `Gpu` object, in prevision of the future addition of mutexes.
- Link to v5: https://lore.kernel.org/r/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com

Changes in v5:
- Perform construction of `Gpu` object in-place.
- Link to v4: https://lore.kernel.org/r/20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com

Changes in v4:
- Rebase on top of latest Alignment series.
- Make use of pin-init references to initialized fields.
- Remove all uses of `unsafe` except for `FromBytes` and `AsBytes`
  implementations.
- Keep the GSP placeholder inside the `Gpu` struct.
- Move GSP firmware bindings under the `gsp` module.
- Get the firmware-specific information from the bindings instead of a
  HAL.
- Link to v3: https://lore.kernel.org/r/20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com

Changes in v3:
- Move the GSP boot process out of the Gpu constructor.
- Get rid of the `Firmware` struct and discard loaded firmware blobs
  after the GSP is booted.
- Consolidate the GSP firmware, bootloader and signatures into a single
  type.
- Make firmware bindings completely opaque to the driver.
- Improve firmware abstractions related to framebuffer carveout.
- Improve comments and naming throughout the series. (thanks John!)
- Use alias for bindings module in `nvfw` to avoid repeated version
  numbers everywhere. (thanks John!)
- Fix inconsistency in naming of members of Booter header. (thanks
  Timur!)
- Link to v2: https://lore.kernel.org/r/20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com

Changes in v2:
- Add some GSP bindings and use them to compute more FB layout info
  needed to boot GSP,
- Use PinInit in GspFirmware to avoid several heap allocations,
- Rename `bootloader` to `gsp_bootloader` in `Firmware` to avoid
  confusion with the future Turing falcon bootloader,
- Link to v1: https://lore.kernel.org/r/20250822-nova_firmware-v1-0-ff5633679460@nvidia.com

---
Alexandre Courbot (10):
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code to its own module
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware
      gpu: nova-core: compute layout of more framebuffer regions required for GSP

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

 Documentation/gpu/nova/core/todo.rst              |  17 -
 drivers/gpu/nova-core/driver.rs                   |   9 +-
 drivers/gpu/nova-core/falcon.rs                   |   6 +-
 drivers/gpu/nova-core/falcon/hal.rs               |   2 +-
 drivers/gpu/nova-core/fb.rs                       |  65 +++-
 drivers/gpu/nova-core/firmware.rs                 | 107 ++++--
 drivers/gpu/nova-core/firmware/booter.rs          | 375 ++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs             | 243 ++++++++++++++
 drivers/gpu/nova-core/firmware/riscv.rs           |  91 ++++++
 drivers/gpu/nova-core/gpu.rs                      | 186 ++++-------
 drivers/gpu/nova-core/gsp.rs                      |  27 ++
 drivers/gpu/nova-core/gsp/boot.rs                 | 137 ++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 101 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  28 ++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 126 ++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/util.rs                     |  20 --
 17 files changed, 1337 insertions(+), 204 deletions(-)
---
base-commit: e2580413a83680f679904ad2f2c1aa6969876469
change-id: 20250822-nova_firmware-e0ffb492ba35

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

