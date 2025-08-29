Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB0B3AF5A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764FE10EB16;
	Fri, 29 Aug 2025 00:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fdYfH2MX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744D10EB13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI1HxfIBnmuFI/AjoyyiMsWB27bViE28d4NCMC4SwJvYBH38cC4Cb0QGhVs3Pp4+DWE0YNd7STlaLmb6U3WjWEzr4YXsa5dpYCDeZyJwSzg5T8FCCe/JgL9RPHGKYF8Hy5pmBuvP0rFT4YiDgExVcK66ti0Edf8dgb931tHu5ojXLVEjUv+9InWKBu0jV4iWT9iJ6g37aJHYdBLCSAYd02EVFW+zicvTVJXw4lEZ9G9buFzxHv22Qk2DAjSRjywD+0P1Sx9/fJjEFAB1gqX2B12hZO+UTraQc5ojAiq6nXC7CL6cBriWpWR3clvezbnCJ3EOLDfv7b3CJdgFfhn1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxeEyuNA1EyeD9K8BkcA3MBl5griJr/hviQtELFEVt0=;
 b=RFe6uD8o5K4Nag3izZxi4Bn7/Oa2ut/JIjFGo9gUK08kYtc+hduH0nGCqMH/pMoc3ZFbrfR28jYfqBY89wCf4Esvc3GL5Fq5jTOL0s97ohp5P5OkCRnMAm0Sbznc3X+yT8cxXDviobyeJH6+TnALXcf5sT4pTCa07Q+pWoUM/lG2lAR2bpxWXqcBPVbaIs85+ohWWA7etvMG38t7KI5Jl9ZTbtdHKFh+rHf/r/anC78bJZaSJ0t9spurOjcHLZ6DrFkqlzpVzD4YsROh2EJ8ikl19Z/oq7hd1I1J2jVbI0p7qmVuILXhAtlaG4oB4su+501BCmi2oFEtNAGmnmLoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxeEyuNA1EyeD9K8BkcA3MBl5griJr/hviQtELFEVt0=;
 b=fdYfH2MXwGg9lP3cuHlZdcJ8EXYvr3iVBu04RxxpkvL7w96a/7bIBgo9HbHZx92rsZcQnwclp/ID9YdVljA55r9wzOie+F7nZgiyWSQDVxnc/qnuUWfOkrBU/gPreVSmXSO9XWu2GN8p4DDPVALrcaW45JLErIbo7Uc6mP/Mmp/p7C6i/dFTFuV9+ncxXVzO9TsUA+/kN56H+zu2LN42P/dL57iWx/W/8TnEBZWF69K4clQWXGc/6d2Z6oZ93Z1TMSq3JSmiTrWDHipj5u6Su+exphDPKQn1MVmoRQgN9K9MvRAcBj3MJoyEELBHIKxZt+tNOGJfFYZGLB36LxrAWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Fri, 29 Aug
 2025 00:29:59 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:29:59 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
Date: Fri, 29 Aug 2025 09:29:53 +0900
Message-ID: <18894880.sWSEgdgrri@senjougahara>
In-Reply-To: <CAPVz0n3AvQaFrpeyUODpqOwkxxinjWgMQTgqvD4hAZvdqprVdA@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <2263218.C4sosBPzcN@senjougahara>
 <CAPVz0n3AvQaFrpeyUODpqOwkxxinjWgMQTgqvD4hAZvdqprVdA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0178.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::9) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: cdae6e17-2eea-4939-34f2-08dde6932fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG1tMUJzYjFPbmJmdFBjeEVUN0tuQ1MvV0ZpeE5FdXhEZUU1Z3IydjRWTk9h?=
 =?utf-8?B?UWJiL2ZlSWNCNkdJMCtIQnExQ2xFREJFV3RLdVQzMFNjL3QweDdXaHpCNGFx?=
 =?utf-8?B?V21WckVieTB3bnFPL2N3ODM5aG0vRmpQV1lTNUNnMFdSbU1zVStpTzliZ25h?=
 =?utf-8?B?bzE2YWdtOXBTdWpDY1NXUlAzUkZoMFU2eEtBRWE0MGorWjVaUlpXQVpjdVgz?=
 =?utf-8?B?NGM0TTlyN2NBSWh1THE1Z3RmVEFXSG1rajBGV0dQSWZBVEo2OU9BS2laRGRY?=
 =?utf-8?B?RmdvMUhBMXhoMmkyUGp1NVJWblpVc2VhZENjbWZBR3Z6U0ZxenUrZ1lZd0ZN?=
 =?utf-8?B?WWJQc0gybTBJMk5PdnRQR01zVHFCUnNKNFYwU1B1WENLUWk1SEllWDlrQ2M5?=
 =?utf-8?B?d3VzdTlhMThHRk5qRTZtQ1A0UmZxVmpnQ3VZU1NrVTlpYzNacEI4bmtsSjAv?=
 =?utf-8?B?T1F2dHpnWEZKMVpkMkEydWdaTm5Va1MrcStuVUlTZlQ1d1JHTkNJTU5yajBk?=
 =?utf-8?B?bmpPclp0eDFqSHc4Y0ZDT1N6OXhCTzNJbTRRbXhjUWR5dEtHbjVWdnFCbkVJ?=
 =?utf-8?B?Sk1ZeTBJeGlWR2lmUG0ydm11b1M0aG9SL0srQVMwZzFXaEo0azZEeFArR1Ju?=
 =?utf-8?B?Uk9MWUVFYlF2T2VVaDV0MDdvSXJFWjBGV2xHVHZPVlhzb0Z3SEx1ck0yeisr?=
 =?utf-8?B?YVZjaGJPMzdvWWlDYkVrNTRYOCtHbHdjRXk2ZlpKMGQ0Y2cvUm9iOG10UGlv?=
 =?utf-8?B?MlhCaHpaVkcwN04rNWVTcVdabzNYNUJtSFNGeVo1Q2NkbVBSYzRhNGRXN3I3?=
 =?utf-8?B?OTNvODduclNEcTFmUFpSQmllK1phT0wvcVdLTjZMbU5TRklMMWF6YUdXNzd2?=
 =?utf-8?B?alZJTWJjL1htQmh3N0NTb3Jkd0NPRGJDbEtXUzFGWmk2Vko3YTdyb0NIWlJx?=
 =?utf-8?B?MTUwKzk2WDJaS1FYL1Ztd05aZ3poMTZFNHJmU3dmbWp3UzViZ1JWYVhWOWx5?=
 =?utf-8?B?WDJ4WHNuYzhOT3NTWmU1WFBoL0ttc3RVU0xoRjZyRkxyT1VWaEVTQ0gyUGtL?=
 =?utf-8?B?dFE0TjZIeitPQXV3SGhXZjVRMWxQT2xTdlhRa1A2MmUrWk1uSUlkaEthRTdX?=
 =?utf-8?B?TnJId1FIZU9PclJCR0Qxb2VSRElJUVpad0hVa0JWNTJRbkx3Y1FhSVlZL05F?=
 =?utf-8?B?VUF2eUNmQ2QvYXREQks4WHdoQ1FTSnJOVHBRSHRCbkpYbWtyK3dac1R2U3JJ?=
 =?utf-8?B?eWplbk96bTZmLys1aStSSTJFWTI2YzZvcFZ5Mmt5M3hLMHNSbHNLSUJYc09O?=
 =?utf-8?B?OWdQRmhrRjd3YVVlNFdpZlYyTmhJVnZRVjhkd0FNOWkvY1ExallIT0RTZ0Rl?=
 =?utf-8?B?LzlpOEs0dGpwZXk5d00zaEQvazU3eDQ1b29YdHR6U0crT2svYlpPNFRRd2h4?=
 =?utf-8?B?ZTIvNFlBNzFXVnNIb3ZWOW5wK09laUNUdVhaOWZWUnUxSGJtL3JobHhpbGZL?=
 =?utf-8?B?Ni95L1pwMGVuM1dtZVBSbTRHa0hpWlFLcVl4VEptZGYyRFF0Yk5XUjNWMnBs?=
 =?utf-8?B?MExPdU5TZzFrYnU4bGZOZzRBSjZxSnFmelB5c25XK2lURnJyY2dHZmExTmFm?=
 =?utf-8?B?Q0V4d2JXb1R5dGpYOEo2L0NSaEducEFEVytmRk5RQkplZDhheERyOHd1aitC?=
 =?utf-8?B?VjNZUmdQbGg4N0xZQVFQaUNaM1J6TytzK2tXRmNxYlEvTEcrNVRhUVR3bHlp?=
 =?utf-8?B?cWtrTW0xS1F0QWhqLzF3Tk8wQlNuVnE5ZzVjQ2VtN3ZYSTExMGR2N0NIbGZh?=
 =?utf-8?B?bWNacWJIQXgzSlRpbWFDTE1Bc09VVE5XSEV2NnBVTjNFMzBvTkxEbVF2SWNw?=
 =?utf-8?B?MG5BZXFnVTNLVkhLdEpYQ1ljR3A5VE1pYkQ0ZGROcFIrZHdtd3FKdEM1c1kv?=
 =?utf-8?Q?Hpf+SeQHB2k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEtjZEZQcjVMOWYzQlVVVUlXc3cwRWFTVENqZVJYK0FBUXZralZIUmdiKzJj?=
 =?utf-8?B?ck5VS201cDBOU0F0bjR3VjRiOHYwRHVqNTVWT3BaR2x3TGNTQTBINitYS3Vj?=
 =?utf-8?B?SWcxVGNiK0pUeTB0dHNSZTI1UUhUWGpWZERIaFZJcjhDMjUvTFJzZTlKeXFJ?=
 =?utf-8?B?NlVjVGYzMVN6NnhQZjZwWFYwK0EwSE0vaWpEWGFhSkhZL2ZtOXJibWFGbjdO?=
 =?utf-8?B?OXl6c1RPRGtxWCtHbzQ3N1lFV2hwMEVNZHNOd3g3NUJIUWxwd1NBdnlpb3VG?=
 =?utf-8?B?bGlGOHVQWFRJVnhtNndjT1dpcDdjSDVGRC83LzRvSDFZNStlVFBCVjAyRWtK?=
 =?utf-8?B?eElwbDRpZnJTMno3aFREbnY1cmp5QkdhUFNqTUtZS25hMWxZUjdiV3dDd1Jk?=
 =?utf-8?B?cHVPZzY3RjdDZ2cwU2E1bGxQeXlITGhjUVBwS2gxa0l4aHE0ejcvdlRpNnMr?=
 =?utf-8?B?U1Mwcmo5c3NwMkhqQmhtM1loZkpwSkRqdkZ3KytQM1pJUHhzS2RsTnY4RUU1?=
 =?utf-8?B?TEFveGNtdlJGWjBvdHQwS2lWQ2FBdko5QVNTUlpPa3VsdlN6T2NPeW9waUJX?=
 =?utf-8?B?V25qM1grVFBtTTBQY3ZrUGpwSFV1VGhIbW8zRGV0VStnMzdJU2N3N0pCZTZh?=
 =?utf-8?B?cWxOMnV1U2VITEw3OXJkcXNVZHdrU3NYS2tpYkdGVWFTSElDa2VCTXZ6WXYv?=
 =?utf-8?B?T1ZGandPa1BQQzVVMDFHcEF1OW9YbzJtZ3BNZWRoa0JCWUFmRDNFNC9xZWV2?=
 =?utf-8?B?OG5JMmFFQ0d5NFQ3UWtyQjU4MHlDMk94MEdFMlQwcHhYaitpVlpZV1htVjd5?=
 =?utf-8?B?QStTTm1MaWlmY3o3QzQxTHhJV21yUmlIN2FIdUVlSXNJRUxnbmh4OHZRV0Zo?=
 =?utf-8?B?RFBxdk0wb3ROMjJ5b1JKNDBtUWNCOUU3bFlSdVRJY2s2Y1RDU0E0QWhWZCtM?=
 =?utf-8?B?WFRLRU1YZjFZWE1GUHR3eVhkbjQ1N1BwNjIyeWZuZlNKV3lJQjNEOG1jRXhD?=
 =?utf-8?B?enk0QWhqWkNhY2xNcWZxbmh1ejFPV1Ywc3hxYlpLcVZZNWRVRGVBZG00ZEJY?=
 =?utf-8?B?Ym1sK2FZNGxHTGRqYU9RUWdIQ3BXVWR0K2VoZmphOFp4Y0hrTDBFMmpqMFlF?=
 =?utf-8?B?cTZpVE42WVEyUUlSaG5sNkptUnRJUVpoM2dZOWtOWnlXQmZCT3k0ckZSRGVN?=
 =?utf-8?B?Q0loVUt1SnlPMThiTkRNMVhzaDU0aEVCWE1VcDlWaldlRjB2cGhYcll4SmNq?=
 =?utf-8?B?TFp6VWRXVmNZT0w2cHBwVEZ5NDNDL0ZXSElzYy9Gczh0YnNDNllOdzVGM3Y2?=
 =?utf-8?B?UDJPK2VBdkFIbDkxby9KSEt4cS9GWG91VVZOZHZ5SGkycW9qcTl6R2Q1ZlFr?=
 =?utf-8?B?ZHlNZWhFWWF1N2tCTDJ0SHZvcDAvS0Z2b3QwMlhIUnROSmdCZFdzcVRHNDYy?=
 =?utf-8?B?cis3Q2NEcEV2NDZnMkpqYVBuSFRWUTBsTndRa1Yzbnc2RjFQbkpXQllYOGR2?=
 =?utf-8?B?WFB4U3g0d01pRmw2eEczMDVpSExKUXFKMmNpWStrN201YVVhdXJqMVpiSVYx?=
 =?utf-8?B?UFdqVWNoN2dTQkJkR1FPOEV2MzlSa2lGUkRiY1A5bWpCYWJEczNGVmh4dXpK?=
 =?utf-8?B?dmw1WEMzR3dpb0pvZEtOR0xMaVNma1BJZkVNaG1pengrQ3JrejZxRFFlSzNu?=
 =?utf-8?B?ZTBNYXBnS3hiSDFWM1VUeVlILzF0U2kwMWdQZHY3MlY5QjEwTWxPUkVsT1BB?=
 =?utf-8?B?Q1J3QitDOGhvcERUTUxuZlVzaVNHTkdmK240dXRlNFRkZFRVUUJkeVRENzZz?=
 =?utf-8?B?aGhoN3phbm9ZUlc0Yy9QYUsxSnYvSUs3REJJcnBXS0RMdkUrOTlhMDNxSkxB?=
 =?utf-8?B?SEN4VzdRYXRMQ280aWxFdDRQMFBVWTk2dm1TQUYzSGdtT3EyR0w3WTJnNjRE?=
 =?utf-8?B?YTBCNXJ5VW93cUtNeWJqSTVOWnIwTkNla0lSNUhRaTYzN0YrRi9kNzkxWU9i?=
 =?utf-8?B?NE1iMGlxMDVTSkFRbzRCdEE0dmZRUTcwOUtLSmxJTjlvMmhjRXhsWE9HU1dP?=
 =?utf-8?B?VGI1RWhINW5qU1RiREE1TE9OSGRHK0FyVE1KdGlvY1FjdnRqR1NSRWZjYWhh?=
 =?utf-8?Q?cRdIzgfFaYcEAlgMEpwwDXEoQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae6e17-2eea-4939-34f2-08dde6932fac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:29:59.4936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd3yb9b4X7NMSz4tndGQCaJUaEzbm0gBDZwAZzFCgsCRSzry8ukLidFG7xrPG/bnp85d+AHygIT9Qd9IIpPHlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
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

On Thursday, August 28, 2025 7:23=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13=
:15 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thursday, August 28, 2025 5:28=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=
=BE 11:13 Mikko Perttunen <mperttunen@nvidia.com>=20
=D0=BF=D0=B8=D1=88=D0=B5:
> > > > On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > > =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =
=D0=BE 13:36 Mikko Perttunen <mperttunen@nvidia.com>
> >=20
> > =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > > > > > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. =
07:09:45 GMT+03:00, Mikko Perttunen
> > > > > >=20
> > > > > > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel=
 wrote:
> > > > > > > >> CSUS clock is required to be enabled on camera device
> > > > > > > >> configuration
> > > > > > > >> or
> > > > > > > >> else camera module refuses to initiate properly.
> > > > > > > >>=20
> > > > > > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > >> ---
> > > > > > > >>=20
> > > > > > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > > > > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > > > > > >>  2 files changed, 2 insertions(+)
> > > > > > > >>=20
> > > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > > > > > >> b/drivers/clk/tegra/clk-tegra20.c index
> > > > > > > >> 551ef0cf0c9a..42f8150c6110
> > > > > > > >> 100644
> > > > > > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > > > > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > > > > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table
> > > > > > > >> init_table[]
> > > > > > > >> =3D {
> > > > > > > >>=20
> > > > > > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > > > > > >>=20
> > > > > > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > > > > > > >>=20
> > > > > > > >>    /* must be the last entry */
> > > > > > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > > > > > >> =20
> > > > > > > >>  };
> > > > > > > >>=20
> > > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > > > > > >> b/drivers/clk/tegra/clk-tegra30.c index
> > > > > > > >> 82a8cb9545eb..70e85e2949e0
> > > > > > > >> 100644
> > > > > > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > > > > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > > > > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table
> > > > > > > >> init_table[]
> > > > > > > >> =3D {
> > > > > > > >>=20
> > > > > > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > > > > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000=
, 0
> > > > > > > >>    },
> > > > > > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > > > > >>=20
> > > > > > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > > > > > > >>=20
> > > > > > > >>    /* must be the last entry */
> > > > > > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > > > > > >> =20
> > > > > > > >>  };
> > > > > > > >
> > > > > > > >I looked into what this clock does and it seems to be a gate
> > > > > > > >for
> > > > > > > >the
> > > > > > > >CSUS
> > > > > > > >pin, which provides an output clock for camera sensors (VI
> > > > > > > >MCLK).
> > > > > > > >Default
> > > > > > > >source seems to be PLLC_OUT1. It would be good to note that =
on
> > > > > > > >the
> > > > > > > >commit
> > > > > > > >message, as I can't find any documentation about the CSUS cl=
ock
> > > > > > > >elsewhere.
> > > > > > > >
> > > > > > > >What is the 6MHz rate based on?
> > > > > > >=20
> > > > > > > 6mhz is the statistic value which I was not able to alter whi=
le
> > > > > > > testing.
> > > > > > > I
> > > > > > > have tried 12mhz and 24mhz too but it remained 6mhz, so I lef=
t
> > > > > > > it
> > > > > > > 6mhz.
> > > > > > >=20
> > > > > > > >Since this seems to be a clock consumed by the sensor, it se=
ems
> > > > > > > >to
> > > > > > > >me
> > > > > > > >that
> > > > > > > >rather than making it always on, we could point to it in the
> > > > > > > >sensor's
> > > > > > > >device tree entry.
> > > > > > >=20
> > > > > > > Sensor device tree uses vi_sensor as clocks source and sensor
> > > > > > > drivers
> > > > > > > don't
> > > > > > > support multiple linked clocks.
> > > > > >=20
> > > > > > AIUI vi_sensor is an internal clock so the sensor cannot be
> > > > > > receiving
> > > > > > it
> > > > > > directly. Perhaps the sensor is actually connected to csus, and
> > > > > > the
> > > > > > reason
> > > > > > we need to enable it is to allow the vi_sensor clock to pass
> > > > > > through
> > > > > > the
> > > > > > csus gate?
> > > > > >=20
> > > > > > That leaves the question of why the csus pad would be muxed to
> > > > > > vi_sensor
> > > > > > by
> > > > > > default, but perhaps there's an explanation for that.
> > > > >=20
> > > > > From downstream T30 sources csus and vi_sensor are always called =
in
> > > > > pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed tha=
t
> > > > > latter is used as camera reference clock since most sensors has
> > > > > reference clock around 24 MHz
> > > >=20
> > > > It's possible that the csus pad is still outputting 24MHz. The pinm=
ux
> > > > options for the csus pad are various clocks, so it would seem logic=
al
> > > > that the clock source for the pad is one of those clocks. However, =
on
> > > > the
> > > > clock framework side, the csus clock is just a gate. What I'm confu=
sed
> > > > about is that since on the clock framework side the parent of csus =
is
> > > > currently set to clk_m, I don't know why setting the rate of csus
> > > > would
> > > > affect the output of the pad, given clk_m is not one of the options
> > > > for
> > > > the pinmux.
> > > >=20
> > > > It's be good to verify the register value for the csus pinmux to se=
e
> > > > where
> > > > it thinks the clock is coming from, and then check how that matches
> > > > with
> > > > what we are seeing.
> > >=20
> > > TRM does not provide such data, it has only register address with
> > > layout for it as a plain pad control, that register has only DRVDN,
> > > DRVUP, SLWR and SLWF and I don't see a way to decode clock value or
> > > parent or anything similar. If you give me a method I will calculate
> > > those values.
> >=20
> > I notice that on Tegra20, there is a mux pingroup called 'csus', which =
has
> > the mux options PLLC_OUT1, PLLP_OUT2, PLLP_OUT3, and VI_SENSOR_CLK (bas=
ed
> > on upstream pinctrl-tegra20.c). The TRM also says 'Enable clock to SUS
> > pad.' about the CSUS (or SUS) clock.
> >=20
> > On Tegra30, however, which I guess you refer to, I guess mux pingroups =
are
> > gone and each pin has its own mux (again looking at upstream pinctrl-
> > tegra30.c). vi_mclk_pt1 is now its own mux with the options VI, VI_ALT1=
,
> > VI_ALT2, VI_ALT3. The drive group for this pin is still called csus, so=
 by
> > that name it only has the drive settings as you mention.
> >=20
> > Are you testing on Tegra20, Tegra30, or both?
>=20
> I am testing on Tegra30 since I did not have compatible Tegra20 device
> (with supported camera).
>=20
> > I've looked at some Tegra30 schematics, and they show a signal called
> > VI_MCLK being routed to CSI cameras.
> >=20
> > > Another theory is that maybe csus is used for VIP cameras only and
> > > vi_sensor is used for CSI cameras, but they both have to be on in
> > > order to work correctly. Csus was removed from Tegra114 along with
> > > VIP, might not be a coincidence. Moreover, T124 uses vi_sensor as
> > > camera mclk source.
> >=20
> > I see the CSUS clock still on Tegra124 based on the upstream kernel. Th=
ere
> > is also a CAM_MCLK pin. It seems Tegra30 has both VI_MCLK and CAM_MCLK
> > pins, which both can output the clock. After Tegra30 there is only
> > CAM_MCLK.
> >=20
> > Looking at L4T r21, in tegra12_clocks.c, it defines the clocks mclk and
> > mclk2.>=20
> > There is a comment on mclk saying:
> >                        .clk_num =3D 92, /* csus */
> >=20
> > whereas mclk2 is vim2_clk. These clocks are indeed defined as gates, wi=
th
> > vi_sensor / vi_sensor2 as parent, set_rate being passed onto the parent=
.
> >=20
> > All of that wasn't very coherently written, but to summarize my thought=
s:
> >=20
> > On Tegra30, we have
> > - Pins vi_mclk and cam_mclk. Both can only source from (vi_)mclk which
> > also
> > goes by name csus. The mclk/csus clock is a clock gate with vi_sensor a=
s
> > parent.
> > On Tegra114 and later,
> > - Same situation, but vi_mclk is gone, so instead we have cam_mclk
> > (possibly multiple with associated mclkN and vi_sensorN clocks)
> > On Tegra20,
> > - The vi_mclk pin has a variety of mux options, one of which is
> > VI_SENSOR_CLK. I expect this to correspond to the same behavior as late=
r
> > chips, i.e. sources from the csus(/mclk) clock, which sources from
> > vi_sensor.
>=20
> While this is all quite interesting, how to configure this properly?

Fix the csus clock's parent to be vi_sensor. Point the sensor's device tree=
=20
clock entry to csus. The sensor's clk_enable should then ungate csus and=20
clk_set_rate should flow to vi_sensor to set the rate appropriately. In the=
=20
board device tree pinctrl section, set the vi_mclk pin's function to VI=20
(should be default on Tegra30, but best to be explicit).

I think that should do it, but it's all theoretical of course :)

>=20
> > > Here is a fragment of Tegra124 clock tree (dumped from Mi pad 1)
> > >=20
> > >          pll_p                                 on     13  x34    =20
> > >          408000000
> > >=20
> > > vi_sensor2                       $ off    0   3.0      136000000 mclk=
2
> > >=20
> > >                    $ off    0            136000000 vi_sensor
> > >        =20
> > >         $ off    0   3.0      136000000 mclk                         =
 $
> > >         off
> > >   =20
> > >    0            136000000
> > >   =20
> > > > > > > >Cheers,
> > > > > > > >Mikko




