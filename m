Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBezISQ+hWme+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:04:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD9CF8CC4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F7410E192;
	Fri,  6 Feb 2026 01:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bAkIc5CD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010023.outbound.protection.outlook.com
 [52.101.193.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B2610E192;
 Fri,  6 Feb 2026 01:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiRdcS+K7JgPK2TlyhsbxOS1QhB5PkRp+VkXXdK2/45XtSH7ZYuqxlKUJr1OYRjIn3VMc2oSYRBCGFWOS0z6YnCSNXDENV8wGH/1m393bhHk9zgC2FsBVfS6tHqOatt0Cdnlg1rCd0Wjkx+8G1SAiS+FCdF9MCJG2PGtyM85H3ycsq4AyXXc/fJePtgWXNjG+T98Kvxd9Oi/uiX2o3LL9IsMS/TjYxSTYBM03TuU4PDcVTASCsXQuV5CcY3unyCweuvqRD7+RG1Jderm8gKZJN9uEWmFZPKM37B/fo5J5WKvGlD0xX+TXvpocCH91vays54V8LPvTIHaCMJ1A2UBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63UbUEJ6+C1g8plaL+OcIDkzpCRgWjX84ak2XtdmiV4=;
 b=QmufvPuiU2zXkXcjTIHr9xXL//3b39Q9DaRp9/x830q3rwYbrPDhK4BHraSp09aK3c2ri+0zO4/Lom7IIuXNyBV9OcV0e8WljcbGWCsIg+g8ZEjD6l7YG04hw7mITcPmQ1vkGIDX9uSBgRBz5IQpi6XziS5ZPib1awQgHeBpbz7rrtZZ0n+Gd0O9PZ3ZtqUvGvGe+5WFlar5Mp8+Cc27EcxeTbBmK3RdWfip0FVDsJafhLBZNhet7auZzUW4G7EIUCyv7HlU9tRLdYjJyd34IqCf2FWmLa+tus1m3iZzg/w7iCSrnnvDeIwqPLt0b0B2tHhcrjkLVsQ/h10RxaiGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63UbUEJ6+C1g8plaL+OcIDkzpCRgWjX84ak2XtdmiV4=;
 b=bAkIc5CDHI2SV/ZDh60raGfT3e3WZLZ1GohURRgcoXBzob43hV/AUbIL3dCZGFCLaTle1KL2GY+jhYz//Cv/UM6bHi38YdeteUVTQjtnaay1+ah2Oa5A43/EWy+ykKEd+CXHRotZDFcud1alSGfJ7fN/spN+1aB2bvzKF8lTrOptua904EH+mF364xUv9tLKWZeL862Ex9DNmtUITLIvB4mwpBKvgALQKAs0pBnJTrmQncPEW207SceHveV4z+DJ/OMFoCOVAdFjuBsd8/9K2v2suc/FUCis8L1fRoVYhzyVgsEHvL+eAONIKsOyvRLiKTVGs7/QE5xEx/h5YDD1bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Fri, 6 Feb 2026 01:04:24 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 01:04:24 +0000
Message-ID: <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
Date: Thu, 5 Feb 2026 20:04:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 02/26] gpu: Move DRM buddy allocator one level up
To: Dave Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-3-joelagnelf@nvidia.com>
 <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:208:335::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: fba27274-5ab3-44eb-cad3-08de651baabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBtdC9FRlZlL0J5M0ZHRDlsaDNzS3BqeHhnYklYTDFUYTUxY3JzM2duam9V?=
 =?utf-8?B?Vit0emIrdDQ3SWVmUHRqNFBaS0YxV0FMOXZTbFJMeWROaFVJd1Q5U2kyK3ZM?=
 =?utf-8?B?WkZDbXVrSkxlcXkwY0IrWEV0Zkx2SnJhSXlhK3djMlNCb2IzVUUwYUhHOXZo?=
 =?utf-8?B?Mm42YWh4M1FqeGZYaHVRN3gzUURneWR0NDErS01RUXBzc2orSGcxS2M0RnZz?=
 =?utf-8?B?T01XSUxCMG5IWkl2ZEIrQlh6dHEvWXlCSTJ0SC83Q1NxZnBydS8xRElCeFVv?=
 =?utf-8?B?TFExQ0NRaXdiT0lnMmdGamZ4WC9NTDh6VUcrS3padUlCN1cxdWgxQ0t3eXpw?=
 =?utf-8?B?MUdKZ0x3N25wMHlzd1EvZWtVbEt2Y2R1cVVSRUIxRWYwWjZXRklsZ2xLc2dL?=
 =?utf-8?B?U2NxcThuSURBak1FR0pGb1RJMmlYOEg3RFZOc0NYdDRxalM5c1hDVzRFRVhS?=
 =?utf-8?B?a25zMmg4UUJCcGVTcmkzcVNtMm1wczFWZk5JejEzTjJwY0RXMkVnazVCV241?=
 =?utf-8?B?OFcrM1dHQW5uVzIwelFxbGp0WmQxSFl3WnJBQ0pPdk1CbnR3RGlVY0YwTCtZ?=
 =?utf-8?B?R0IvbTlWbm14YWNKTHRoUHFYVUhtK1pLZVI2dEdOQU0vUndOMTA0VVpBNm5P?=
 =?utf-8?B?bGFVRml4ejkzclU0WjljbDl2L2h6K3VTM3NpR3VwaEdGTWlGSURiZWN2S2VX?=
 =?utf-8?B?SFc5b0pVVmw1cDUybjZobGowcTl5YkNPeEozSU1CWFJaUS9xY1kwbXhTQWky?=
 =?utf-8?B?UE9NQUl5M0JFbG5tNDJFeUtoeWZCWkdHbW5iV3VHYkdWRHVmbmRqK1ZZdVhs?=
 =?utf-8?B?dmV5Ymk4UURIOHRMRm5yb09aRGlVU2FNV3JpQ1UvWU8yR05FVTdzZTJENDlN?=
 =?utf-8?B?Y3p6c2dqMjM2RTc5SFBEeTllb0JGQTFUQkRLSlZyWDZ0VzBzcWlJS2cweEJP?=
 =?utf-8?B?bjlhR2x2bEI0d3AvRDZhTDc2OFdCcEQ2QitQV3F1QU8zUTA2UTlqbVZMZEpL?=
 =?utf-8?B?dGxVMWFRQWJlU1I3WWkwQXZaSjhvck94NmdoVG5OSlMxa3NXRW1rY0tTbXJN?=
 =?utf-8?B?NkR6RU93NGo0SnU1Tmh5eTRmdCszSUtDTTJ5MTBPQmw1b3VzaFdldUJac2w0?=
 =?utf-8?B?eDNzcGZSbXQ2bHhXSzhab1NlU0tqc0tINm5Jc013ZGxYcnJQMWFkVDVJUm10?=
 =?utf-8?B?c2dzc2lpNkNuamo0UTZab1p2STNvWlkyS0hucURuRjd2cjlmOUJzVUdyS25T?=
 =?utf-8?B?VCtaaUxDbFdCMlhMdjc2cFFKRXNvVXpCbFE0a3NQQS9OajVtQVJOU2FMOVNX?=
 =?utf-8?B?M25IS0dzdW1mMEtDc3JwNE00ck91MXlweEw4YXBWYkpOdjZ3ckpLNE1WVHFk?=
 =?utf-8?B?NUlLc0xQWHFDelc0eFpDMjlBelJLMFh1Ym1RbHlHME1kSHRDY2ZLbHNpOS9C?=
 =?utf-8?B?cjVyRTEzYVRmaU9WeUl4YVZidm1uWmN0UCsxZWZVQjNPYUVXUTcvbi9Dbjls?=
 =?utf-8?B?L0N4a3oydkVqaGdSOWR3dk83ODNPTVlVSnFzWVIrZEdkbEZ2eVp4WGc4Wnlv?=
 =?utf-8?B?bEFxRVhiU25kZ1B0QURuSEZvVUZncGh3Ym1vMjBMKzJlcHN6ejNsSFA2czJp?=
 =?utf-8?B?dU94VGRtTXRFRVZSTHZlNmlGaG9XRzRGZlhOeU9oMk9hSG9HQ3hpSjd0ZXEz?=
 =?utf-8?B?TktVMFJ5dHlkVWY4UTNOMDFiZEkyblZMOU0rYTFZczRIUC9Rb3FlRDZqMWFS?=
 =?utf-8?B?akQvNmZJOTlmNDJBRFBGTzFtZ0E4ZmxZeXVQUUFMRVlpYTh4WGl1b203eGQ5?=
 =?utf-8?B?d1U2QVh3ZEdLaWlhQUtzWHNsN1FSdjQ3TTI5UnJVMWI0V3dWOFZUZk1vN21k?=
 =?utf-8?B?eTVJUFZ3YVh4QjNLZC9NUmFiaFpwUEJxWU9rU2ljcHdGSU5JcmtaS1dwR094?=
 =?utf-8?B?eW10ZDBaS0xQeExPR1RJTVdXUG5TcmpkQk9YVGpaaWdwRXZ1ZitGSGsybnpi?=
 =?utf-8?B?Q1VJWExJeGh2WVVGYjRSV2FlUjdUWFdRVjNHeVFybSt6YTMrclVsVTJ4QXFT?=
 =?utf-8?B?ZTRjUDZ2NkJvejZoaWFZS3F2cVNoaHZhWmVoV09sdUQ5ZDhoWVVHNXhiYzRB?=
 =?utf-8?Q?xkQM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZlSnBaUW1GR2JSMDhBOXhrc1B2OVYwQ1lQQ3ZtMCtXOVpFVnJ1TXExTmpk?=
 =?utf-8?B?ZmRrbmFqNWVIRlp2VXNFRFRyRVlPY2JKTVpZeXRsVGQwVFRVN3c3bEVBNGZz?=
 =?utf-8?B?Yk5yRGFxaFFqZlRjdEE2TFRuVWNDUlN1UkJSemZna0NPaThIQUZyRFNhVnhW?=
 =?utf-8?B?VG1VMXRxVzQ5bFlZVlVubmxDSHMyb0JBTnA4Z01HQ3kwbjlPYVNmdTEzK1dr?=
 =?utf-8?B?OG1IOHpRR0ZTV3c4ZXBqOFkyTi9DUGQzZDArcE9rZ24xa1RHL3RFOWhZVXdR?=
 =?utf-8?B?QnVndE9YTHJUamJNaVlnTW5yZ3UxenFLVVdlbGtoMExnNzFCTmp2ZDNpblNk?=
 =?utf-8?B?bnc3YXNWd1RvdjVKQk5hckdGTGFtTlhxRDRhOFBScEpSK1llNDZGTDluRlIv?=
 =?utf-8?B?SkZFNEJGdEdPMHd5MGp4U01UaklQRDhGL1VEeDB6TnphTHRLcXRnNHdRWmlK?=
 =?utf-8?B?dnNTWEZ0YmNFdnB4bDIzWTdzVWdOU3RCTkI1TmhNdU5oVGRLSG1iVjYrUnBC?=
 =?utf-8?B?SXVuMWcvS28wdmpXYUdqNFlxU1M5TTYxSFNXWnFFR0hPbnpES0lvczFSaVU1?=
 =?utf-8?B?RGVKZ0tPZWwzMjlKTlBsenU3aTRzdllYT3NxWVdGaFdEc3JqdUhoSW15aXJD?=
 =?utf-8?B?VmxLdUQ3czJqLzdwSkQxSE9oR1M0Nm0rWENwL1JNRUpXN0x0ckRPcTZyT1JI?=
 =?utf-8?B?WFZBT0hvcEdEN1MvTFMrc2xUSm5OT09vSlBSRlNKWmdReTZKL3B4Znhob1B2?=
 =?utf-8?B?SGdiVmJwcnVQQkNIa3lxbldoQ2p1QXJYSEdPbVRUYWZIWUNTcTdpd0w5RllR?=
 =?utf-8?B?c1A0VFc2Zi9rVmI5bnZ0d1dqMnVHaThQZTZWcTUrUlVYQ3hwbHFEUnR5UnpJ?=
 =?utf-8?B?ZWFZV3BjUVoxVXB5RjBRTm1oclZlSk1JTUR0OWt3VzVETG9sSmdXbklLaDlk?=
 =?utf-8?B?cnNCR3h2SnN1SHV0aGd4SnZLalRtdVJWR0tZM1pCaXMwWmtuc2tJcStEbE4v?=
 =?utf-8?B?bU1iRWc3eXBNalV3MjJiYUZsYWluSmxJYS9OYjBoOFZaeHRBNFZqbG1NWXBE?=
 =?utf-8?B?S3NRQjZIYTlIVVFKUlhtNndvMUpoblR4U1RBcXhidGZGZDlpS3hrczRpTDVU?=
 =?utf-8?B?UnNhc0IxM3l6ZEl3STJDUldUUkgyR1lmYU5HK1RyYXdnTkhqdWJ0MXlZRlQ3?=
 =?utf-8?B?YjlJaEVRQmY3SUZFUzBPcTNmcWFza2NvVHk3bjFrVHdJbEhyYVphN3BON0dS?=
 =?utf-8?B?eHpEc0lXTjRRVi8wRUdkTjhVMFhMNE1TSnNBRFlmS2lCaFBGNFBNS2V4NmdP?=
 =?utf-8?B?bGNQblAyVUE2eVM2YlZXQ2lXVmdnNTBCbnpqYmhFelYyUDQ5RkhrOUJZNmFN?=
 =?utf-8?B?Y2hCWTVmT0xUbE9KaXBGSW5wUUtYdVNPcU1YR3RWOW9PczdYMjdkQUxERzdv?=
 =?utf-8?B?WC8xYVVTMkVrbnJIcGV6NmVyWm5HaWZuSWx5SVpCS0xIQVJJb0pya2Fwdjl1?=
 =?utf-8?B?UUVFSTdHbzRINk9hY1BCa1dML045K3lhN3E4RVFEeEtMdHljOGlEbHVJckZW?=
 =?utf-8?B?NkJkYm5MdW5WcEJnRDlVTmNDd1kwN0JyaTRWTzNscm5sY0tobStaOG1WOW5m?=
 =?utf-8?B?YTU5UENSYjAxNXZCZ0J4ZkUzUUNyaDdxZVF4eHJXYlgvVDdZbURRdXJYQ2pQ?=
 =?utf-8?B?Sk9laWo0NEJOcjYxVHVGS2paQS9aMFBwSFEwZW94ZHpFdnpYY3pHSXVES3ZN?=
 =?utf-8?B?cDF2enVrZXhMY0tDK2hzTFA1Yy8zdWtUNXBHWmVnUU5JbkExOGY0YnM1bC9t?=
 =?utf-8?B?elFaTU4vMFJJbjJQdFJObHhoSHo5MzJsalFRUTJYOXBmUi9taVBEUEVBU0Vu?=
 =?utf-8?B?U1JibnpWK0FDSGVKYkQyU2NheXJXaHNoR1NtNlBUUzMvMkR3UDdlQ0FCUGlh?=
 =?utf-8?B?SkhJRHhqNlpQOTVEWGhXS29uTG9OT01mKzhoWlJCWldSME9WcFJhVm12R0pw?=
 =?utf-8?B?SW1MZm1LZHhERTB2T2pjK1FlODRocXdhVjJySTlnVHpMdHJTMm5zZnYxdk5Q?=
 =?utf-8?B?dDcvc0pyRW1wVGlDNWFWaXRPZmNobmMrYzdWZldaMkF2TFNIcmw2Y3JaVEtS?=
 =?utf-8?B?YVJpTmE5d1lzMmxTZGhTU2ozeUpiNFlxc0lOQkRFZm5PK0FpcW9SZUtNZ3RR?=
 =?utf-8?B?Z0wzSEZweVRMUmo2dnM3U3JzTGZndy9IbTNqck9tVmZlcG4rcStHblo0dVJP?=
 =?utf-8?B?NDBFZXgvL0ovQ1BTbUgyR1J3ME83VVRMZ0tTaVZlaFB6WVhuTklwWGU0d1B6?=
 =?utf-8?B?UE5kNGNJNHN2TDFVV2VKQ2Zjc1pPVkVNWFJhb3FMOW12Mzlla1FZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba27274-5ab3-44eb-cad3-08de651baabb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:04:24.1780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyNGzTomVUdDuDWQCMndd53ZsE0nKJMBPPVjy1+Ds5HhBgHE1tc2Lp08jQ+dQ5487Sev2XexzB/q6VVXI73x+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 3AD9CF8CC4
X-Rspamd-Action: no action



On 2/5/2026 3:55 PM, Dave Airlie wrote:
> On Wed, 21 Jan 2026 at 06:44, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Move the DRM buddy allocator one level up so that it can be used by GPU
>> drivers (example, nova-core) that have usecases other than DRM (such as
>> VFIO vGPU support). Modify the API, structures and Kconfigs to use
>> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
>>
>> The commit cannot be split due to bisectability, however no functional
>> change is intended. Verified by running K-UNIT tests and build tested
>> various configurations.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> I suggested this and think it's a good idea.
> 
> Reviewed-by: Dave Airlie <airlied@redhat.com>
Thanks, Dave!

--
Joel Fernandes

