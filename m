Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKC+IYFtfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37463B878F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDCD10E966;
	Fri, 30 Jan 2026 08:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mbg6nCIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05CD10E962;
 Fri, 30 Jan 2026 08:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA0O+z12YDh6PZQM7qxdcQ7axIjKwPClyGLORwbQ9dmcgLpHOUw3Zr4I+MSICvT1LbZS+1jlqAzATQMArvCZx4Nn+UV5UaaApcrgBBw8Z7AcIK+tUMnLRO33imu6dPp2bLCfwAtXkYyUAN6v+QaIEdZV3gLQgk7fyq5vOYB2BtEOK+NReX+58BCJUjudvv8632RDRdCGMbNV1TRY911J69bj2VxU2uZ+1LwMKINQL90R1GHzQvz4GB+/gZCXQVoy4U+670a6vu1Lc8QAZslRfsy2794F+fgxYHhsCinPoinATU1z9zW9GBlgDMYjeeiXK4J1x+6/rKX404HjQH8+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Lqhq+72C2e8wtc+h/gNYzX2Aqwy7FdRMyOTEbJ6Lpo=;
 b=oDX+wzspFlduKihcIEwzCj3//lvDjAtkCi8ni5zEvWadCurSY/m4kXhCBybyLmlN6bQSH7mxS/lilsfXcbjUbOiMVIeeufMw5bNZ1f2wtPzxwOHZHSbJT/G+xcbKkMh8OruBPHpJGJ8fePePDoLEa08nHXD/5fQ3nnf5QKNVOT7TXSgP1wm3Ha9NXsiWDxroUcURxejXzfGh4CXrsuP/GsRI4YSixWiZorl+IxWnkC+yIjC9qyYq4RcKqmeAnOpeiY5cAFhSOLtE/hsB1ZdwzTxDg30QWdGLVzYHuKdscVfa6zqSv+bUdYNDk74TvPdU/ho9c4zHN1NFcIm8OUgqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Lqhq+72C2e8wtc+h/gNYzX2Aqwy7FdRMyOTEbJ6Lpo=;
 b=mbg6nCIn6jiCBQdDzTeZCAaIJL1AOT0wX1qV6Txn39ipq/88DLw1mw1HX7fMIcKXsrQaKJ/2WGOcLRRIshaXmI3qc+gKPNwu93DOXrHxLSsf0t4o05mKMVdDCodfzZUkpfIPQt0JfXtefOm9Q5HQHSp2W3NQViaNaq/Eop/pEupcn2zCsSx2Z1i8RQ7RqxGuHwhKt9zB+lCm7Q6+YzhCePLR9e4EuGYXCzk5PC9sS5dls6KAeAQNMY2avrlrtMbzm34XVgh+Okoxqz2Zq97Yt7w91IooQ2aBpdkFHx2xrET7aRHyyYOYZVYPrJ3HStMbJyUfP9DJpoEhLS1zrbADgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:36:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:36:09 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:12 +0900
Subject: [PATCH 9/9] gpu: nova-core: migrate to CoherentArray and
 CoherentObject
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-9-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e297311-f88c-412a-abde-08de5fda9846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWFyZlpXRUdEemNzZkVINTV2S1dUQXhlZEtFNFE1SkoxQXlUYkVIcUlDTmNR?=
 =?utf-8?B?WHMvelc5c2lMSVlHNVd5a09xT2hKQWI5SWRVWTdwT0hYMjN2djFOTXZ3dnVE?=
 =?utf-8?B?NHZ6b0U2czdDanZBRUtGUTAvWjFkMnFQMWVEUTd6OExjQXRUcVl5UW1vaTdt?=
 =?utf-8?B?OXJPbm9OM1JveXJLVE1EUldicFlrWkpCdS9zZk5yT0N1UWtCbFBPMERVRjVs?=
 =?utf-8?B?SzcvUXNYeEhoUUprL2ZTcjV0aGpJcjZzTnFqVjBaWnpHUnBrTDBmVHUvQVVv?=
 =?utf-8?B?V0k2TTlTbGZ5WjBrME4yRU5jRDhHMkZhVmFCdVVMdUpnTUg1SkdmNGU5RmZw?=
 =?utf-8?B?U3I3eEVjWGlXeHpqaGNmVzB3dU1MdEliNlFKL1ZhcDFVdlRaL2ZURHdJeVdU?=
 =?utf-8?B?RWh2eWVaRlJuc1Q5YWppbWlwUDR4QTJDbTlNQjJEdEllUWFNTTU5azdlSTFD?=
 =?utf-8?B?RS91WHl4Z0hLZ2xsa3pFM3p1Szh1Zllrd1JHVFpIS0VFOXBlNER0VGRoRlJl?=
 =?utf-8?B?c0wxR295MzRXdEhlamE2WGtsOXlKaDhrR3ZRSE40Q3BhdUVSeDRyeDdRMWNz?=
 =?utf-8?B?N3h0T2I5Slc2YlUzMk5jdTJYbXVkVWpNS3dKVWdRbjhOYjRWZVFHalRMbUNr?=
 =?utf-8?B?TDlzTDZyZkRZaUs0Qm1JdlRDL2YxMjBVZzNIUnRXY0VMNlh6TmRkUXUwMk5a?=
 =?utf-8?B?eTJnNmk5aUFOVndteG5JQkpHblZlY1UyL0lDTGhUQmpTQUhrNFFVMHQvQjVI?=
 =?utf-8?B?SE9yOGtOeU5yc2RiUDZ5S3pmQkhMMXhJUGVXdS8vdlNWaTV0ZWNqTGNac0w4?=
 =?utf-8?B?OWUxbzQrdkF5OVNXTFRKRzFWYXhCSVBUbnQxWGQyVkNJaXM5SkNRSXptU1FB?=
 =?utf-8?B?WVlKYXZkc041YnZodWRzQ2MyQTRYZVZvdWE2dnRTL1ZhZnU2QVpkdUlvSnNY?=
 =?utf-8?B?cms4U3BINXREMzl5SHU0MVNIS1owNFRQbTJVVDdSeEJUMnNPTkV3ajczMWNC?=
 =?utf-8?B?ZGhnSC9UeGZnclBzUEltclNRT21oZm1BUTQ0VUIrNmlvZzFwd1pmMDl5R3pX?=
 =?utf-8?B?bEZDcldQSjlqaThmMSsvbllMOUZmUlkyMFlySFZRSFNONFVqTDQxTkdJVHds?=
 =?utf-8?B?NytrMnhwdkNrZEM0NU5QWk9DOFdsLytHQzF0UTBUWFZqbnBNNVJVZXZva3VM?=
 =?utf-8?B?SUQwSjJ0RU5hSXFDMHNIQ1RPd01tcllGOVhCd1gybVlMbXRFOHFWMWZxUUsw?=
 =?utf-8?B?dWY0c2U3cWMyUUU5TkFkL3ZPU2ZKSlY0QkdOZmxxWXQvdjd0aWVuY3ZLZ3Zp?=
 =?utf-8?B?NU9OcEVRdzEzbUdNYktXLzVOQ2tkdkR3RXBJYjlCMHdrZ1l5ZnlrYU9ZWnhR?=
 =?utf-8?B?TlQxQzFRZjNEMzZDZWNkcjhkM3BLTytySVlNVTBWY0hBQ2F2YW5FYWgyWWF1?=
 =?utf-8?B?K2RxbkhuNzMxQ2lhb0JWcWdrTTBVTG1vdCtFV3Q3Vk8zSXlrVnkraUE1cm40?=
 =?utf-8?B?Rnkxa2hrdGExQVBvYkxLRUN0bWtTVkJUUmE1RHFEVmE1MlNKQmtwL1ZtcDhp?=
 =?utf-8?B?dUtHeUVNMzdQY3RvajRwVGkxZnBVdStPZEorRk16THIrYzJncWNHUHpaUDhC?=
 =?utf-8?B?S29iQjhXekw3aFNhZUtvbTIzMVNocE4rQVZWR2RpYi9lQ1lFamZWdlI4SWV4?=
 =?utf-8?B?N3JmZHdLWkl1L2s4cHNkUnRIL0krcFdaRnNJVnlDWmhHZDc2Y0kwdldSSVhj?=
 =?utf-8?B?Umo5a21jcUQxMmttL0VtWHhlLzEvSUNYMmZqdndMMnc5aEJKWk9YUEZGQlYr?=
 =?utf-8?B?U1lIYXMzU2JIUEh5aThkYll4QU9Nb0pIcUNOQ1ZyQUJYZkFpKzJ6MnV4dFpj?=
 =?utf-8?B?TThLMmlqeWpiVStkUGZLTERYUWZ0eTBrN2pLajQ2WmYrcFZ2QS9mUm9nUnk4?=
 =?utf-8?B?MFpTT0JHNHhoZk9Ja1BiMWEvcXl4WmtQWnJ0REhnaEJQTi9ZVmFqQUI5U2hy?=
 =?utf-8?B?akZqajNicndiWWlOdmo5cHdPMTBCUVMxRXpXZXV5VlVYT05oU2Zqb2FuOTdo?=
 =?utf-8?B?WmJBQkJQWmEzSlNzRTRwNHV2V0pDSStZRHExWmJ4UG9GMStJaTRpdFpBTGk2?=
 =?utf-8?B?YnBOdWRlUnQ2VFdKZGdPRDF5SFFGTGdiNU1aNk92ZjVWc2VKUHlPcGhUVUdX?=
 =?utf-8?B?RkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtLL1VocEhhR1lOZEx3dENaRGRaTjZsc1ZtVi94dzYxSW1KWVNNV0tJbWEv?=
 =?utf-8?B?Z1BTU1YydVRPWjlyaVE2L0t5RXdvTXlORWZFQlB4RHhuWTUvZnVaaUNrNGFL?=
 =?utf-8?B?NDY2N0tnbEJSSG94cmFyU3ZhM2RFbFFOVEUxeVU3Tk1YbjB1ZmwzS1VWMExw?=
 =?utf-8?B?a0JlTnkyTnVrM2EwTU00bEhxWmxJSkUwTTJwNGIreTJUaXRyWUh1K3lFR0p3?=
 =?utf-8?B?ZjhrbjltQ3pmamlmby9mRTVYSllyd3MveXFZZkVLOGFwc0gzTi9UUGR1NSt0?=
 =?utf-8?B?dmptUGlERkVpc1ZYV05OdWJEYTljd2NiR2R0ZVlXbnZHdzFJQ1IxNVdLL3l6?=
 =?utf-8?B?MldDWlpVeEs3SG5uY3VwQ0QzMGttdHBYNTBlKzZFSzNMQlhHc0p3TmJsL2hm?=
 =?utf-8?B?R1ZkOVlKdFk0TlZLSk44WitzOWc1Y2lvOVFRMGVSNGUwQnZwOVNSZVNhQ0FR?=
 =?utf-8?B?NkFPY01XSUxGdjA1RmJJZk1hMFgvdmoyUkNGZkNoLytocUJocW9KcVR2TjFk?=
 =?utf-8?B?SGtjU3UzVUNiclpBcncxd1dBa0o0ZndWZ3E2RVcydXgzc3VyTXJsWkNHbVd5?=
 =?utf-8?B?azhVaDdQTENaRE9VUUpkRmVWM2lKdmNPbFlmeWRJYTduVHc3cTZidnhaZmEr?=
 =?utf-8?B?VzIxNkNVSjkwOG9FTkJRajJuSkhicTN3MkhoOENjOGErdHJWbXBxTk8vdTFw?=
 =?utf-8?B?WEhLOVNRcWJPL201a3pXRmtrdWQvMHVsUmhQd04zZGc2UlN0VGF2S2o3Y09B?=
 =?utf-8?B?RGxrSlhnOHQ1NlY2OTVHYVdMZlFYeUZsM01OaXpQUkFMbEd2Njhaamk1aHhk?=
 =?utf-8?B?enJWbmpONlUzUDBQS3d0OXhYK05BWG42TTJyekdqT2dLbHFsV25INHcyT1E5?=
 =?utf-8?B?ZmxVdkl3MitncE90V3pxRlZ2YksyN2lSdFdkOGQ3RExwNmFoYWtJd0cyUTZv?=
 =?utf-8?B?Rm5mSVpxVnAyS0FiWmV2dC9ERkFvRHByM0p3dkpYbFZtbDIrbmhhaXFkVk5l?=
 =?utf-8?B?WVh6RURBdDRUT0xiOTFpVmtmTVRxUU5WaVVmaGpBbW5MK2ZTWVgzMkNNK2h6?=
 =?utf-8?B?K25Ub1ZTbHdjWm9NdGNGTmZwVU5UZGJKR2dYbDFXSHVhaFl5ODhEV2t0U2dY?=
 =?utf-8?B?bnJvNTcrRzdDTEY2V3E0UkVvVWwyNVNNaGpMdjZ4RTlSNnJvdXZ4K0VaejVF?=
 =?utf-8?B?N1NuTnRNNlNyY2tLdkl3MzJPSk5CLzRuem9jajZtSUt0a045V3diK1Ixd3dh?=
 =?utf-8?B?YWNMWnUxR29OT0NJVlRpWHRQRzJTZU80d2puQkZLdzUwZG91NndrbG9WaXpi?=
 =?utf-8?B?RHBhaFQxRUlzcEQzMnhwMGpxRWE0ZVB0dEZKTEhBUFJ1dHZQRlRtK081Z2l5?=
 =?utf-8?B?NVJ5YURDdHdQOHdoVWVNU25CTHkrVDRGOVJyb2pralZLZ0xDZDFyam5tSE1i?=
 =?utf-8?B?MkZ4TktSTUxRRndFWmVxdG1VUWtNc094cmNnaHJ0WFNsR0FaUmV5cFA5aXhU?=
 =?utf-8?B?aXcxZkFjSndYSVpsTTc4ZGVUR1hnaWpxWThCMEhHbjNZOUtYaFVxM04rcUw2?=
 =?utf-8?B?MVhQc0JoMmFCVmtZOFliQnUycDQweFRUSTZSTks0bG13Q3hPcEVRd1BFZnJp?=
 =?utf-8?B?dnIwMmMyd3VxNlhpVXVOZHpHT1U1Vm1KUUdSSkJxaVBGd3VyS2JPaFUzaDAv?=
 =?utf-8?B?OHpmbFhBUGlqUFdBSy9sQUd3dFVycjM4TEFLUmlZaExVY2wzT3lwV3FRRzVL?=
 =?utf-8?B?R0o0MHpzNmJEODhqTFpyMWlIdmxRaEJnVk93TkpaWVBWeTQwQjU3Z3F1d01y?=
 =?utf-8?B?REhyNEc3Z2x1NnFUMjVFZW1ZQXB4M2ttb1BUT2ZhamppcU4xbWdseTJwL1cv?=
 =?utf-8?B?dVFqa0ZrQU9sVUZmbEE3Y2QvbVRZdTZOQlNRcmxadVFGWndlTUx6ang2dlgy?=
 =?utf-8?B?RlVib1ordFRFVUxZNUZBM3BONkxud21CQTdnUlJZeUR6bS9Ca2JzeVdhWkgy?=
 =?utf-8?B?emhMeXRENjZSVVdEQ2JrZWZrQVhBa0hvb1Y5NXNoenNONFZCdWpNOEd5ZjdG?=
 =?utf-8?B?N04wSEp3R0lnRExLYlJaemQ0TWJWTmJ5ZHZwbUJRK2FTdDRKeGdlYUxXcWVE?=
 =?utf-8?B?MkpvV0ZzazVncVNVQ1gxR21GSmpLMDRzQTVCbDgzUysyUy85cWNpQWpXbDU0?=
 =?utf-8?B?ODR5WXdISHh5M2pvVGlzZGVsMkJRQjdLclozMjhSY2hpbExMUlV4UmtJWHor?=
 =?utf-8?B?ZGlzZDhyQ3QyUnlxem1PTmwvRmxnWnJEUUgrdjRsQWFBZEJ6RUFPUVNFUG93?=
 =?utf-8?B?WVczOVZGVkFvMHZManNJUFdRTDd2MXVLcEM0MlVKR0g1SXcwWFUzSWJyWjhI?=
 =?utf-8?Q?LqB+oW/ssvbuGQZgfjym7OmrEHi9k3LUedm0Ea+5U1Iwe?=
X-MS-Exchange-AntiSpam-MessageData-1: QwSJSyFNTvKMpg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e297311-f88c-412a-abde-08de5fda9846
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:59.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOuS6oJfx5fSQklqbSKtZiCCz6X3RJwu0DUnl4xkdQT6FJcfB2mcTM7I3UDDBUpFJo6K0FMrlrXnFWU7CnVnDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 37463B878F
X-Rspamd-Action: no action

Migrate to CoherentArray and CoherentObject. This enables removing
a few unwrap()s.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 46 ++++++++++++++++++++-------------------
 drivers/gpu/nova-core/gsp/boot.rs | 10 ++++-----
 drivers/gpu/nova-core/gsp/cmdq.rs | 24 ++++++++++----------
 drivers/gpu/nova-core/gsp/fw.rs   | 12 +++-------
 4 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 43bc35fd3b55..2513822d43fb 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -5,13 +5,15 @@
 use kernel::{
     device,
     dma::{
-        CoherentAllocation,
+        CoherentArray,
+        CoherentObject,
+        CoherentSlice,
         DmaAddress, //
     },
+    dma_write,
     pci,
     prelude::*,
-    transmute::AsBytes,
-    try_dma_write, //
+    transmute::AsBytes, //
 };
 
 pub(crate) mod cmdq;
@@ -74,14 +76,14 @@ fn new(start: DmaAddress) -> Result<Self> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer(CoherentAllocation<u8>);
+struct LogBuffer(CoherentSlice<u8>);
 
 impl LogBuffer {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
 
-        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+        let mut obj = Self(CoherentSlice::<u8>::alloc_coherent(
             dev,
             NUM_PAGES * GSP_PAGE_SIZE,
             GFP_KERNEL | __GFP_ZERO,
@@ -100,11 +102,14 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
+/// Number of `LibosMemoryRegionInitArgument` entries that fit in a GSP page.
+const LIBOS_REGION_SIZE: usize = GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>();
+
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
     /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub(crate) libos: CoherentArray<LibosMemoryRegionInitArgument, LIBOS_REGION_SIZE>,
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
@@ -114,40 +119,37 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentObject<GspArgumentsCached>,
 }
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
         let dev = pdev.as_ref();
-        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-            dev,
-            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
+        let libos =
+            CoherentArray::<LibosMemoryRegionInitArgument, LIBOS_REGION_SIZE>::alloc_coherent(
+                dev,
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
 
         // Initialise the logging structures. The OpenRM equivalents are in:
         // _kgspInitLibosLoggingStructures (allocates memory for buffers)
         // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
         let loginit = LogBuffer::new(dev)?;
-        try_dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0));
 
         let logintr = LogBuffer::new(dev)?;
-        try_dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0));
 
         let logrm = LogBuffer::new(dev)?;
-        try_dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0));
 
         let cmdq = Cmdq::new(dev)?;
 
-        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-            dev,
-            1,
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-        try_dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-        try_dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+        let rmargs =
+            CoherentObject::<GspArgumentsCached>::alloc_coherent(dev, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq));
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs));
 
         Ok(try_pin_init!(Self {
             libos,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 69e2fb064220..7888a39356f3 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,12 +2,12 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::CoherentObject,
+    dma_write,
     io::poll::read_poll_timeout,
     pci,
     prelude::*,
-    time::Delta,
-    try_dma_write, //
+    time::Delta, //
 };
 
 use crate::{
@@ -159,8 +159,8 @@ pub(crate) fn boot(
         )?;
 
         let wpr_meta =
-            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        try_dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+            CoherentObject::<GspFwWprMeta>::alloc_coherent(dev, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout));
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9c94f4c6ff6d..845c9e176b93 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -12,9 +12,10 @@
 use kernel::{
     device,
     dma::{
-        CoherentAllocation,
+        CoherentObject,
         DmaAddress, //
     },
+    dma_write,
     io::poll::read_poll_timeout,
     prelude::*,
     sync::aref::ARef,
@@ -22,8 +23,7 @@
     transmute::{
         AsBytes,
         FromBytes, //
-    },
-    try_dma_write, //
+    }, //
 };
 
 use crate::{
@@ -191,7 +191,7 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
-struct DmaGspMem(CoherentAllocation<GspMem>);
+struct DmaGspMem(CoherentObject<GspMem>);
 
 impl DmaGspMem {
     /// Allocate a new instance and map it for `dev`.
@@ -199,13 +199,11 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
         const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
 
-        let gsp_mem =
-            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        try_dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
-        try_dma_write!(
-            gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
-        )?;
-        try_dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+        let gsp_mem = CoherentObject::<GspMem>::alloc_coherent(dev, GFP_KERNEL | __GFP_ZERO)?;
+        let ptes = PteArray::new(gsp_mem.dma_handle())?;
+        dma_write!(gsp_mem[0].ptes = ptes);
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES));
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new());
 
         Ok(Self(gsp_mem))
     }
@@ -223,7 +221,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &mut unsafe { self.0.try_as_slice_mut(0, 1) }.unwrap()[0];
+        let gsp_mem = &mut unsafe { self.0.as_slice_mut::<0, 1>() }[0];
         // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
@@ -258,7 +256,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &unsafe { self.0.try_as_slice(0, 1) }.unwrap()[0];
+        let gsp_mem = &unsafe { self.0.as_slice::<0, 1>() }[0];
         // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index caeb0d251fe5..1877b727cc22 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -9,17 +9,14 @@
 use core::ops::Range;
 
 use kernel::{
-    dma::CoherentAllocation,
+    dma::CoherentSlice,
     fmt,
     prelude::*,
     ptr::{
         Alignable,
         Alignment, //
     },
-    sizes::{
-        SZ_128K,
-        SZ_1M, //
-    },
+    sizes::{SZ_128K, SZ_1M},
     transmute::{
         AsBytes,
         FromBytes, //
@@ -652,10 +649,7 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
 unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
 
 impl LibosMemoryRegionInitArgument {
-    pub(crate) fn new<A: AsBytes + FromBytes>(
-        name: &'static str,
-        obj: &CoherentAllocation<A>,
-    ) -> Self {
+    pub(crate) fn new<A: AsBytes + FromBytes>(name: &'static str, obj: &CoherentSlice<A>) -> Self {
         /// Generates the `ID8` identifier required for some GSP objects.
         fn id8(name: &str) -> u64 {
             let mut bytes = [0u8; core::mem::size_of::<u64>()];

-- 
2.52.0

