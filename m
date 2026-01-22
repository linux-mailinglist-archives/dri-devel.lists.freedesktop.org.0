Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFpEHuztcWlKZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:29:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D182864880
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3496510E967;
	Thu, 22 Jan 2026 09:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AB6HMXg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41B010E96B;
 Thu, 22 Jan 2026 09:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Reosjx2/q4IXt3fqZ2QpytmnftOmX1DB4nN7Eqt9mrTnK7gSIZ7yZj5nAohz5mrbhAZNYrWx5xBgkbgLQeHTUOJtsiVLMrrBfr98YpIWIxLPEP/1QVrP+wwC7JY+KGhOqmuynZoL7DuF67XdoecyAdEPmXK2yKx9+IAOT3lH1YZXxLWJTlhTbuJQW6YxRDEB5V5o4L1EYyOFa3kFpC0fIhUYDyB/EreRVdSuupwinU/zskfCpxCpizxmC5mZfCpzZNwbBARDVTG7KXfLyY/qgrhw+n4osNbY+A+4vBnKI9MGQzXC0izoc+NaBDrM5KvDzUV5AtnSO7y0t8bhXVdKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX9ofKJvc5qK2H3uoBSN/U7IKzki6fRBUZIvTFdf5tM=;
 b=LrSiTSwn3Si4gEJfucaf0o/kAW7VY3G11e2shgIZOt5ooY5C7IXfvLEuS4j7jC9mVVAZfPu5r+axa/7TXy/5R6Nj5DLmaGtjd8GvvCbXSN36V5O5bwZMOoWwDMlkMvguPMw7NRmB60GSXJ64s9ss48jLsvojOyQMyre6rXVV3v+slc4wm2REE+Zct9kgYCmqjCRb8csxBdPNZQHg2sxAL7Op7P8jFkzccQTgkRl/YQv5uHySlUHsto6+77VHVxmXluaAp0d9T3i46cngT3qwzYvfuM9gcuHOOEM1endIo/bKlliJNeBLQSJ36ShBwNHtVG4adRDQVn2xLD+wGRbyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX9ofKJvc5qK2H3uoBSN/U7IKzki6fRBUZIvTFdf5tM=;
 b=AB6HMXg6/GSY6sByWa/otTIoKCFzQkV5kjBrrQ3T6KKKiSjYbEFxyQOxj3CZREzh7qsC6Q5NF3NXMzK3TU8pgtCcodctcCX2W6XJtPbaDrAoeB8kZ2MGwjOvXPhJxQTF2ByY8ddykDHboZdmo1vIN0uE1oBsAeh1YV2ZKcx1NnRZ1RsjtEhzUxuSMx0PiCKNDF6Fhdd8XbxNgBKISXxkaFIB+Ramjn3mZazMFGTSNC+QTGLDd8IHAdBv379NRysTL/xtxTd0gao1DXBg+QdK76J4swESVN6rj2sT5OaGASOgJuh7As2lpqd51pcQyOEG+SLogZoX7EA0VRNs1zq3kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:29:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:29:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 18:27:45 +0900
Message-Id: <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
In-Reply-To: <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
X-ClientProxiedBy: TY4P286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: f1988260-f469-4742-c46b-08de5998b11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnBlQ2ZubWNkdkd4ZUIxZTRYemJmK2ZYV2dDZmdwQVpyb09HNEdJTmhTc3lo?=
 =?utf-8?B?WjZ2RmlYeHdKSzZudUZ6QVc1NTEwVlhEbXhIUWxWeTBaTStDSi9GTklpdTNJ?=
 =?utf-8?B?YVBJMk9OZG1iS2FOcTF4dzMyMzllQWZjSVRta0lFNEhHMkV5a2tNbDFvM3BC?=
 =?utf-8?B?NHg0Ym9la0lROXp3UU9GNG1vMHE2bHRXN2x5bGkzM25JYW93TjhvT0orcEJW?=
 =?utf-8?B?eXVkRXNCWWEvTHRtVXBKWFZyWTFheUhOd3lWcG5lTkxkMlIxWXlweEtEYUlv?=
 =?utf-8?B?NTRxbS9aNXBMSlZieTlnOUFvMTNqdjBYUEs5VmZWTU9yS3I2Ym1hQnhxeWRR?=
 =?utf-8?B?dkZ4eHZUVnIvOC9xK2hsWmkrTkVRNFkwODRnQU4xK1R6RUU5UzRmZzVIVWFt?=
 =?utf-8?B?VEMxVnEyeURiUWhicnpidHdvaWd5cGJIODFjeXlJSDkzNUNpbnU3cWt1YjM5?=
 =?utf-8?B?dE5rcFhVajNkWWdmK1FFeVJjM1dGYW5NNzhzdkhHc3R6K1RrYlBtclIxTFlR?=
 =?utf-8?B?bWtVeHBYYXAvcXJXcVM3c1NSYmhNcWpwQ0orM29uRmVQbnBwd3g1OVRhQ2t4?=
 =?utf-8?B?a2RFN214RjlyVURudys5TmZFMk5VYWV4ejc3c2hEVFhrK3dmTUU5cGVOeWM0?=
 =?utf-8?B?TDJldm9SRnk0WHI3RU1SdW9PUjhuQ3IwSmFHWU1Ra2YxM2Q3QmxDTDgvbHR2?=
 =?utf-8?B?Q1g5emh0RlpSMzkwcUwwUW1VZjA0dTJnMmZ1OGl2NXNYdG9pOVZWeUVobG9N?=
 =?utf-8?B?VGRJaUpMLzJoZkJBQ2VNNGJXRE05cm5zZ09HSG1aQWFUcEhCTTdRR0sxRUVZ?=
 =?utf-8?B?V29CZ1RGbXhTV3psT3RHYlRGVk5vOVE1WUMweU5TVklCMEZmaE5BZ3lGQ1dY?=
 =?utf-8?B?Z3RzMi9RcnlVa210TTEycWo0a2lkUTl2bENBSHVlc3dWdENrYU4zN0NmVmF4?=
 =?utf-8?B?cWQyMHZLMDVWTVJaaXdxVXY3eklCV29BbkV4cGpBenB4bCtPZEhQU2NwMTdn?=
 =?utf-8?B?cC9iQUFvWW5VN1Z3MVk3WFVlTUtVVzNvUzJWeS9hSWVGaEhKbXFxQ2hxNWFS?=
 =?utf-8?B?bVhJQ3o0bisrbDlySmIvME5hOHJMc3M0ZWZaMnN6YzQrbVRRdUJkNkIvY3Bw?=
 =?utf-8?B?Vjh6bDRyUzdnM2wyazBGOE5QLzBqL09wRVJQbDRpVjgxUDhibWVxSGRYVlNM?=
 =?utf-8?B?aVJ3N09YbmJIaUhmbXE5RWNpcEFZdVlNZE5hY0dMMlZIZitiY2JJRDhjTmtI?=
 =?utf-8?B?S3F1eUtsVnpXYmlCZThreEFLOHcwRDZsOE11bHFsaFV2MWJFR3VSbkcwSmJ6?=
 =?utf-8?B?NThaRFpaVFVmWk5lWEFhYm12ZTVnbC95WDFzM1Z2WUJ3dXZ0OGxqdEdQQ0RF?=
 =?utf-8?B?NzNzSXNBMXZORURsQ05HUjZ1STZXa1pjVVh4eFFwVkcvMnl6OWtka2E5MWlH?=
 =?utf-8?B?ZUZkVmpuaDJlMk5EaVJNM0hxVVpua3pWODhZZHFIM3FZMVJ6UlRZWEdBdzNU?=
 =?utf-8?B?YXkzRGhkM2ozbGhhaHBQeEFucU9IWVhaVVVXZGFSZnFkdHU0OVFyMW5CeERH?=
 =?utf-8?B?ekZhbXZ0dHIzL25DcTF5NSsrZTlSYlY2S3JrSXNtR3doRmNGSEV4TUd4Uy9G?=
 =?utf-8?B?Y1VpWDBWc1VJNnhOVXVzaFhERDkvUEZKN1A0UUtScWRQaHg1UGlMdUJUWG9G?=
 =?utf-8?B?RzRQZUZVVGkxMjRyTnRGNk9WdXcyZHZYdVpQWE5UV29tMW51dWhTMnhTUDA1?=
 =?utf-8?B?QnpBN1lwRE55VytjSFBuSXZOT3ZYVFJZR1NLcjlQaXpzYzc0VzRzM3NKUVFN?=
 =?utf-8?B?T2JBRDQ3S1dUV3FZYkxXdGJDMFpMYXpxT2FlSlVmaWpSWDFKdzhWWFk2bnJX?=
 =?utf-8?B?SFc0Q1ZvS01mazlJb2UrbjFmck9mVVh4YUJFdHZVTWJSU3R4Z1hPcWNweGVB?=
 =?utf-8?B?MnViTVZCQmpoblM4VFF1VTFUeDZnNEJyK2djWS9sYTU3VUM3UVhDZG9RTEds?=
 =?utf-8?B?R0NpWVROMGlCQTM0TDNRWDdCWlZkckNzR0FVSUtpYmlGdENBOHhlNGtVVHYw?=
 =?utf-8?B?c0JPdFJNVVU2L0w1dm96UEg5RkRVOFoyZ0ZFeTEvQ0Q0REtQQmJSS3BWWHdr?=
 =?utf-8?Q?5oJo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9DTXhCWkJGbFRVUS9sNVl6d1dRMjVFT2s5M0tkSmZOQVlBMHBHb3J1Vm9B?=
 =?utf-8?B?c0VldDJ0K09reEg1ZTBaK2RSU1NqS1ozcTJTbXJTeFpub1pCSzVWSGhGa2xx?=
 =?utf-8?B?VGlCKzRPWnNUaktDdERwOFMrVy9UekhuVGRRdDNTaGI2alRtNTNTVzFEWkU1?=
 =?utf-8?B?cXd3ZGZsTzFFOTdJcGdsVlNhSkRCQ2l5WWlpd2xhdVlBOEw3MVZjUnZnU1FU?=
 =?utf-8?B?RHJaWGNhQ0JnWGg4TkkvVlhsYzBJL0ticlBCaGlFZUgyNFRPbGdBRHFDTzRl?=
 =?utf-8?B?S04xWjRTL3JoVHdjM2FwNTRhM242a1ViV0UzRUY3RDhtd24yL2pRM2QzaFc4?=
 =?utf-8?B?alZielhWUm5LTkpDbG1haytGRHFtVlU5Z2g5UzZkL1c3Y1YySGxZSE5NUHBQ?=
 =?utf-8?B?ZmNhWUZKVXdjSThIdWlSV2VjNVB1YjFuNE1sRjdqMzg4Q09BTlU3dWo5QzI3?=
 =?utf-8?B?YmdmMjdiK2xrN3I2dVZkczlseWkwVTRWVzFjVUZYNVZyTk1TZnZWZjZZd0RI?=
 =?utf-8?B?M1g3TWxGTnk4NEZSTzh5cVJGTTRZNk1yWFI0WXNFajdBc3hVWVR0OVVxcm5y?=
 =?utf-8?B?c1E3MXZFL1NzdlhDWmlHcytOY2NmQ3RCbWVBUk1tU1NobXlaRGZJZURtV2t3?=
 =?utf-8?B?dUxIRy9TeEk2b3JrSVpTQlVZN1dTcTg4L3FVSWJheHB5UmMwT0E0d2tMUGxX?=
 =?utf-8?B?LzdHcDhQek1HaXFYeDFLMXdsdStnVlphL0NzQXZRY3ZFS2NiYVlCVU16THVz?=
 =?utf-8?B?UXBIa3pKWDVhRG1HZUN3MG1UMmtkaEFqWTJKb1oxamVzc20wcFZQWWZZVlF4?=
 =?utf-8?B?b2pMaktBc2JLbG1SOERsVWdjQVJCYktMY0NuK2hLeFRHWWh3MmR2UThiQWhu?=
 =?utf-8?B?cm9RNUZYc2xUV2l0cUVLVUd2Zkl6VjBpeXQvWWJIRDRqbUxtb3diQWcyRjgw?=
 =?utf-8?B?Z25EbEltQnlZWGpOblVEbVJUTVZZRys4SlFnTm83eTJqY3c1Tk40aWtzNlNi?=
 =?utf-8?B?V2VuWkdjeEtwMit2a28wQTFXWFRNMTZ6Y05uQ014UEN0RlpJTEFzaTBvQUVz?=
 =?utf-8?B?Nng1aUtENlJnRGFFSk43akZEOFpYRDg5VDhXSFdJNW55MmZoRXZpc09IaUVM?=
 =?utf-8?B?b3ZpemhaVEpjekxlemxNZ29La3VoZUhqa0lQbHBZakd1alQ5M09SMldNZVdi?=
 =?utf-8?B?L2JtSE9WV3U4SDF3S0JQUGpwOElGTHNManNOTmZBbjlEREJ5cXdER1FCVWkv?=
 =?utf-8?B?c0ZqSEFZU0JYT2FGME8rR3Izc2VGd29aK2w3UU9VNFRRdVIxbXhsOW1PQmkz?=
 =?utf-8?B?OG1vVlZrWEJnSytuYnBGamZMWUJhVjllblJJYUd5MmQ3MThoSmxsVG9ac2h1?=
 =?utf-8?B?eDZOcWRQTG9QcnkycTlSTlgrR3c2eUVTQ3djNHJoSVF4SUxQSngxMnhkbk9w?=
 =?utf-8?B?eTV0c0dXK05LUGlaUzFDc0xkVTBxZU9zOTZEYjhHV213VlVxYjR1Qno4SXBN?=
 =?utf-8?B?eDBId2Uwb2ZYSEZpaFZyVEE4d0xsUjhRd2p2YVJtaTFNWE9QeXBqY3EzZUtX?=
 =?utf-8?B?QmVaR05mYWt0RDN3VnZaanJEV1FpU2FPUFRnanNTYk1xek1abVpHclNUUGJp?=
 =?utf-8?B?bFQ1S21qSXdOM0Y5RGV2WmZTWUxtMG9PcmFHVDhkalgyM1VORExleFlaVVNH?=
 =?utf-8?B?cWZQclJRUDZHM0ZTM3oxb3lDc1dlaTV0a21Cek5ucUFBbHJJUmhWam9INEUr?=
 =?utf-8?B?YzVZQitQYzZZdys3VndwUGloeFNubEFpZTFqRGlZVDlFRUtaTDRDakZaWFlG?=
 =?utf-8?B?Z0F6eENwVmNsYU5RWUpBZVdjYXdqZm4wbTlhUmVXSnZIUFpta1hLQ2kvS2E3?=
 =?utf-8?B?cktEdFB2RlcwRXF5QmFFMVhUYUpPU1JKZlFyVFdTTWNnb2p5Q2FPT3NwN1BO?=
 =?utf-8?B?VzlmV2hXUUJYMUEyNkpZOU1aRGlvQy9kNVBmZkIyTENiZGQ1bUtGZU9RNURx?=
 =?utf-8?B?eUVGamhBUytHc0dEamJyNHNQMEZGcWY3SmJiTE1kcUR5NEMvNmlQTTREdXFD?=
 =?utf-8?B?TmMzZlQ3c0lUMGJ6aEg1NkVua25ranluMm10OFRQNjN0aVRxT3BlbE5vQUhp?=
 =?utf-8?B?VFVFYjA0ODl1cUNvNWVLd2FoRzA0Y0xnZnM4Vi9WN29oODVKcFVTZWZOT1Jq?=
 =?utf-8?B?NTdHUXdkTnRBdmZ0YzR6MXBUcmkyZ0Q3bVpybngzWW8xQXVzM0U3d1J5UnJJ?=
 =?utf-8?B?bklVVGQrck1aei9GL2ZqK2tZUEhtbksxR3ZCcWk3bkV3RjIyZDlUTnN2QS8r?=
 =?utf-8?B?ZDd2OXBOZjBHQ3BaQ0FRSVRjN1RybmRVN1BIQVJ3VDg2cnlvNmRWVi82R25u?=
 =?utf-8?Q?CJdYgG4Wwy3ASc3voFSzXS0fXuJEDoed4g+O002xdKvmr?=
X-MS-Exchange-AntiSpam-MessageData-1: 2UgMFifoS7uiBg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1988260-f469-4742-c46b-08de5998b11a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:29:08.0743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2auz3P+fCPvKgOT0idQB/aCItJCtq7UfCgox54jGJ4ibMYEDuLG4Mi4X7V4sDOjJbpkPeLvrKyKn3yRRAOK8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: D182864880
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 2:07 PM JST, Eliot Courtney wrote:
> On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:
>> On 1/21/26 6:59 PM, Eliot Courtney wrote:
>>> +            // The area is contiguous and we leave an empty slot befor=
e `rx`.
>>> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >=3D 0`
>>> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len(=
) =3D=3D MSGQ_NUM_PAGES - tx`:
>>> +            //   `rx - 1 <=3D MSGQ_NUM_PAGES` -> `rx - tx - 1 <=3D MSG=
Q_NUM_PAGES - tx`
>>> +            //   -> `rx - tx - 1 <=3D after_tx.len()`
>>
>> Hi Eliot,
>>
>> Documentation nit: the proofs are great, but the above just does
>> not go into my head easily, because it's a proof, rather than a
>> sentence.
> I had a look now and I agree that it looks like plain English is the
> defacto standard for the PANIC comments, so I will update them.
>
> But, I wonder what people think about this. IMO it makes sense to have
> SAFETY and PANIC comments as rigorous proofs (where practical and
> possible) to match the level of work the compiler does for us in the
> infalliable areas of the code - if an issue occurs, unsafe or panicking
> code is often the root cause IMO. Writing these in plain English is
> easier to read but also harder to verify that the proof is correct and
> harder to verify if there are any implicit assumptions.
>
> I see there are some guidelines about SAFETY: comments but not about
> PANIC: comments in Documentation/rust/coding-guidelines.rst.

Would be interesting to have Miguel/Alice and the core team's opinion
on this IMHO.
