Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJbiEKa8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBEE15CB6F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3E10E6AB;
	Thu, 19 Feb 2026 07:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gMJn43el";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550C710E680;
 Thu, 19 Feb 2026 07:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPjRUoAuFA/6/yslvHjT8rFGgvhDIOarPEw4zmSJ0aPyF+Qjc7KKYwLZVwBpzDkgJpDJq+tq80onlrc19CchCocVgHs7SrRk0AMjx866DZXhaKirRXTkIetySMTNbOdUhu5MkxqqGMuU6qQIVxxSALr3nybItGQLnxTbwG3LmIMxmX80Zhk+bTlcePMn1SAQ1UBq4Iyw808Y9PYMjIcyM8h17IVjL+8wqGM2iYgdO21Tom051p/deykUwHujG0RNcEeQRVLWsPSs+lfrHsTql4e7scxolUpADCcvIoYy9MJT9hf3JrgW+RdbzEnA5tdBrKfOpZ808HocnMWGpyQwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL9mZBn0Ur5tTFMiFzXHbFIaoHcCDjAM2rs1hl5xCXI=;
 b=tQGjNnVraxr6Gf7SF683I2HXC/lJ5p2Auf7qqIw4DPKsOQ3AlxkZMt0hs4ZI0sX+zuFjBII2XNQmTdx8f5tb5rKtgXF+nbDfUpPf1vd6HgyC8jds9h8jc8geYE/ge7bLsipGN7PCIPddYP2zI3vbnuw7GodRzga7TR2SRNPEQgHK5CLzRp1gyZdMOIeNNlsPOAJixnNp++0Uxt5wBJ1qEqW/yCwrkzFA0flhT03NrHYXlPWnaIGVOTrjP749vdU9iOo/sRZjNJVaIAFHvmQYH5Nz2Tf07NSQn2pOGbZ8GPwyxldDbLs4ip1X4zhVs6x1HoF189I25ANCID1aeVA2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL9mZBn0Ur5tTFMiFzXHbFIaoHcCDjAM2rs1hl5xCXI=;
 b=gMJn43elidwTMBYM4DSRAVNjyn8Wjzq1wozKddgr4+Se6OXSKpgL+tji8kW8Pec3Sn5TIQX2G4j6QpUt1VQCOwhpUaODa5nCP7XZhyff47t9sXiXlHSllFEeipYMyuMF53FwaDMPQmUkjvvMFK225zQOdy0UIZbP8ShjXFOtiUdJ89gqFaoU9pv8a/sNIDgDu+jPrbFPRkMKCFCZD3vkWZJTi4bwij83u3qTO8IGQNn1wHDRyrs6CdbayMOZwnVR3uBhwwakoEEHXLOvunPJ0pqRE7hNe6SW76pRAV5DTwb63vnvX89fIARHqBThS6VkeeyApljMO3T7N/F6b16kiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:48 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:58 +0900
Subject: [PATCH v2 9/9] gpu: nova-core: gsp: add tests for SplitState
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-9-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: d482698b-19a1-4619-a834-08de6f8914c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWJ3ckpYMXQ2SEIrUFcrMVRPSWh3emRVVUFGNFJLZ01VKytlL2RxcUVMNXl0?=
 =?utf-8?B?blhGemdIQlJoczBQZTlwRkZBaFJEYzNZV1BiNXBPME93cGVndElHd01pZWxG?=
 =?utf-8?B?ZEF5alVIdTVjWTZOZ1REdDdBVHRGbDk4UnlGY253bk5MRFpDV2xzZlEyek92?=
 =?utf-8?B?K1hQd0E2SjZlVVFGcUZzWm9QYzZIUENhN3hxQmc0RU9KSHJzMXJxUFN4QkpR?=
 =?utf-8?B?S2RBWlhNYlEycktOc1lhK2RRY2h1N05VR0EyV1pPSDZrZjZpZUVGR3FqTHFi?=
 =?utf-8?B?MUpheENTQm5jN3BXQmVSdGZVN3BRSmFKRHRNOVlndWtVK2RxUG1tVlphVllr?=
 =?utf-8?B?RnFxbzJqQWdSUGo1OENCeTlNV0ZWalY4MGNZeVVLemFuZGZ5YkJnRENhWjM1?=
 =?utf-8?B?MGtnVWNPek1mUFZxcmlRRmxOZWIzZGI0WDRwU0JmY3dFVlJ6TExuS0oyMUho?=
 =?utf-8?B?bzBYUEVidTBrSHd0c09rNHdhaVVUaXFVTmprbjNPMG5jWkJPSmpZOEIybGZr?=
 =?utf-8?B?SnZIOXE1S09YWUFOSWpQZUIwUFpVbUtQaTE1VUtYRTZqazNYQ2tpenJpTWcx?=
 =?utf-8?B?dG1tRXJkREd6cS9kZXRQd1cwZ0ZqQUcxWUVjd3Fyb1RXY0NTeUhtV2pOOUJ4?=
 =?utf-8?B?eUNWSGxtd1dMbWxiM1ZhS05DQlZiSndTRUpEek1DencvMStZWUhiaGswdFFR?=
 =?utf-8?B?aUtPQk5IMkhoWHVkMnJqUU1wV3hjejY0UXdYeHkvMWN3b3I2WGw3WUZDT1Mr?=
 =?utf-8?B?OW1xWkU1UWRSL2VldStTMVRGTkVBUkR5NGxXR1p1ZlpRRnBwaXRqU3V4OHJr?=
 =?utf-8?B?ZmdSaFFWR2RkU3JQUHpvTWNBMDNJUFBSamZwUmVJb2hqTXBxQ1lRaUNoR05v?=
 =?utf-8?B?ZWFUcThQUVRBd3VwenU2djJnMHlJOFhaKzUvM2ZiVFpxSGdCNTZ0SXRPWXpU?=
 =?utf-8?B?MjJXRHFVci91dytyR3hMTXpuRXVRcjJYaGYxcHdPQ1phRDdURG9FNkVmcVI2?=
 =?utf-8?B?bVJFMkNvV2J1U2FUaVQ2aWdkbjF5T0REMlVEUXhYQ0lUOTZWNzdCVHNDcndj?=
 =?utf-8?B?NFJ5NFMySnVaYXdqNG9CYkxTZGZENFpEZmhnV241TDYxT1lhUVZlbkM5UDRj?=
 =?utf-8?B?UzNmak9RS2dxS1c4Qm9nc3hVUmZLTDRhMUd4a01pVHJ5Z2JQMFNZNDMwMzYx?=
 =?utf-8?B?NWEyWDZreFMzdTU0SnJTdVJzMmlOREovZENsa2MvSEQ5QUtyakhXMjlxVGVq?=
 =?utf-8?B?bXdUVkJvNVdnK3doTlJUeThZQVAvNUY1TmJORHd5RmpmYUwrUXJGUHBIMGpJ?=
 =?utf-8?B?emZjU3JFVHZrbnVBTzhaMXJSWDRPcURieHMxcUppR0NPN05SQkNYdlI5TExF?=
 =?utf-8?B?dUtTbVo1eTdyRGZQN1Q3WWFrYTFHajhNVzlqb2ZWcEV2ZUdWTzBFNXFrY2tP?=
 =?utf-8?B?VDNJSkNWeENGTkVQY3BMWTdWajJBL3drRG1hUVp0VDFvWHVwZnJ4VDBndHRM?=
 =?utf-8?B?WkNWRjZ5S3crNytTUjcrQ0dwMDZqQk5GV3lSc213SjRVK2VyeDFYWm84M0hM?=
 =?utf-8?B?eEwvbU9kbmY2bmYyWWdyWGxMTWVyOFVUSzZzTjRISEdwWXd3Zm5LS3ArRnM5?=
 =?utf-8?B?d3YzYkYveDFQVmM1VkN0TkFJcWVkQkd3N1prcDdMWWdWWWZROTdvREsxak44?=
 =?utf-8?B?NWZrNHJFY3dyZ24zVytrRVRJcmdMRU91Umk1SXRHTDk4eHR6OEtPQ2ZxLytk?=
 =?utf-8?B?eFowclJJYzRrbTBlbXRlNDZ2UXZtWXNwcDdJMUl4M3FwY1JCRWpWcm9BbVVS?=
 =?utf-8?B?VFU0SlRSSmZUeS9oRnA4SE5QUHdVTW1PeElLOG5TeFYrYzJWcERCaHo4eGlm?=
 =?utf-8?B?Sm82ajBvTlpWQkRtcmJ1VHhaMkNIS1RrcWMrL3dhNFdybzh6SlR3aDV0VVNW?=
 =?utf-8?B?NytEZkdIVTRDRFZSd001VC80U0pTUGlBL2FPNHN3RC9DWHg2anNYMFRmeGhl?=
 =?utf-8?B?VXVob2Rwblc4RjdVUVRZNHpzTHlUeTFuL1QxWmFvNklzNTRXdUdyYzVteEpH?=
 =?utf-8?B?M2w0cEh0aDVRTUVTdlFKaS9iSzd0UEV0cm9RalBFQWpOWmdNMnUwUkhyZXNu?=
 =?utf-8?B?R2R1MXJGQXZTM0pyQ0htM2dON0VrNHB0QWRKeGJFVExPWDZhMnA2NFdwRGhs?=
 =?utf-8?B?NXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1CZFVkci9FZFRRMHZLY2Q2SGlESk5ST0pCeDBnMlpFYlJ2RFZ0eXAvWVFE?=
 =?utf-8?B?L1hudko5dWxFdG9Ud1lSdExITW9KR2VYOHJTcWJYb2ZENEtXNnVnQ2F5MzBJ?=
 =?utf-8?B?MGdncWRMQm8wWVB6WGdhdEhMVmlldGhRd01MMGNDNHo4VncyMS8zZDBhYlJu?=
 =?utf-8?B?M1hUMTJOVHc1eTRYQm1pMEh4R0tmMWpGUjFiZW91V2hWOWRtMTdpMTBUcmJw?=
 =?utf-8?B?cmVNZzFidXdOSDZjNDMxOG0vbnFjYzJZMkgzUisyU0Vieklxb0JWT0Z1dlRS?=
 =?utf-8?B?Y0hEY0V3eUI5WlU2R210aXV6Y04xV0JBYUhXWnlIbUlBRUpHYmM3alg0U2p1?=
 =?utf-8?B?NGpUai9zdXdUb0dQUmUxeXlSbGh2WFVDZHJwMkJ2VStDSlBYenJPNUthZkdx?=
 =?utf-8?B?aHk2ZmpBV1RmVUN2bC8zR0dSRnAzZ3FWZkxiQnFRS1hLd092T211cll2SVZ1?=
 =?utf-8?B?M0FjYzRKcGk5NVJsc3JZSU5TYVEzcUQrcGVaN1ZmUHZaUFV6OFBCMmVDRGVF?=
 =?utf-8?B?cVEyRWhhN1JjbE5zMFJBcDAxa3ZqUWg5MHVTSFVad0N6TGdRRThuamRsK0NH?=
 =?utf-8?B?NWlGWWZjTXkyUnhIWEVNV0pyMmh0UjlpWEc0SEpiVEZHQmIyMy9BOG5HcnFt?=
 =?utf-8?B?aEpZYTNXa2M0bGVsWDNlQ3BSeUxQVUVlSjRmVi9ScjV4eEppeWJ5VlJVLy8r?=
 =?utf-8?B?OXdVYzhvRGVHa3piT2VYVG5pbmhtVjlKVlVuZUNUOUdTcHNNNU14M3dwQXNw?=
 =?utf-8?B?NE0xSThPY0NROXlnaGFzYnpvTHMyVENtNlp4Z00xakZEV0VaYTFrZXdWU0lB?=
 =?utf-8?B?THdza3pEM3o3bERWMXZ1bGRFempmVTJxQ0JZQVlQbzYrUHZDNTdtOGFVMkU1?=
 =?utf-8?B?NmZwWVVBN0kxN282QzdaNW55QkNGeDBCanpCV3Z3bExEdnJFRitJTWxjZHV4?=
 =?utf-8?B?QXlqbXJsaTV5MEdWQ1hrWUpSOXd6SGJIQjVaVk1LOStpTkF2eDdFU2FLckJp?=
 =?utf-8?B?ekozN0NIY0ZXM1NqeGwwYThWb01QbDlFNVJJclZYd1JWeCtBSk43NDlQYmFD?=
 =?utf-8?B?ekN5VFlBcFBqQ0VpS3BnN2REYXl5Q2p5SDJLbUJwdnFaVml2RFRHQWtNM1kv?=
 =?utf-8?B?UGpOTW9XclEwVzFtN01wbEkvSEdSUi9SU2ptcDRsK3JvV1dta0E4RnBEQXYz?=
 =?utf-8?B?MnliM1ZjY2F4Rk56OWNzVm0zVTZCWm9PR0pjWnM1bURDMDBKVWU1M1JISjJV?=
 =?utf-8?B?YXhGM0RVMUVoUmpIYzE1UDJMTk0za2lqQkJGNkNiOURESHZZS3ZMdEJZOG95?=
 =?utf-8?B?Q3V0THVTdXdLRHNQekJNaUlWSVdPbWwxVXBYWHp3Vm9YMXF1MXhJMXBQbmNW?=
 =?utf-8?B?VHJtOWVJQUhTcW1tcGozTS8yVFAzeFRFSENEa0FXLyt3R1NRaitnOUFERFJq?=
 =?utf-8?B?U0JoczNnamlIbmJzcFR2Vm1WWURwWU9DVHpza2FNM2tkTlBrTENJQk1oTitw?=
 =?utf-8?B?Tys0ekNWWHB0R0JYeXpGaUd6NitEQnMrdFhpNW9sYmlWcFJCbjNScEJkaWZV?=
 =?utf-8?B?UDFmSEJiTlZMMm1HM1dBdk5zZFBFZWFEdU9YQTY4OVBFTHBmb2VmUXhreGo2?=
 =?utf-8?B?RXNsaUd4V2NwTzlBeTMxMGRlUEhwQmxJcUREdC83cUwxK2gxUFlhZVRjaXo0?=
 =?utf-8?B?cjJ4b016ZHB4TGNiRmsyYXVIQWxSVW8rUXlDL3JHNm0rbTZwWnZVVzFZQTJL?=
 =?utf-8?B?ayt2S3pZUlBDTnc4YkU0end5bUVOMWU5TnUrR1QyTkpEM09aRCtwWEIrSVZY?=
 =?utf-8?B?VWlwazFTVVg5OUhSU2g1WmVSYmtWN1dkb0hTMU43elZUWWRZZUpCbVdxQVdV?=
 =?utf-8?B?UUJYME9hWURvVms2eVBHcFN4U0xtWCtVZGlYYStKS2FZK0REeXZnb1J6UU1x?=
 =?utf-8?B?bk1QVytYMXZwd3ozeEdDWHg5WUZHbGdCeWNsYldFMUQ4R29UNXhmL3JEbU55?=
 =?utf-8?B?ZFVHelZ5SEpBSTRhclBlSHRLRldhdk9raWpNS1R4K2pLUzVXWkFvZ0ZGOGd4?=
 =?utf-8?B?V0VmL2ZVekh5WFQxaFR2TXgyRUJKbEEwODlnZjJaRHVnVzI5UmRaRW16WlMw?=
 =?utf-8?B?bGg1TCtWOHJXTHJ1MEtVR0RGWGdSSUdUa0ZSMWRYYVpFOGRRVEloU05teWov?=
 =?utf-8?B?ZC8vQUdKeEl0dHoxN0ppVTFNd2s0NW9KZ1JiaU0vZGNyVU9pYkVYa0hoQSsx?=
 =?utf-8?B?TEVTMzVxU3FWejFFaXA2ZGxyMFdWUEw2dXp4SGs1ZitTU0svSloxYTlFRlJq?=
 =?utf-8?B?czNBbit6R08rbGwyRHBsNEMwUkNDOGQyRjVPek9FSXZyQzRqM0s0OHVhL2NJ?=
 =?utf-8?Q?KuJV28Dr7hANVe24VX2az8qgTMIhg6N3b+iBjc4FcQG/B?=
X-MS-Exchange-AntiSpam-MessageData-1: U/3+BYm4XupAWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d482698b-19a1-4619-a834-08de6f8914c6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:48.5519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPChy8QDmVNA7vH6Cs+f0CSJrmkZYnvCTvo3OeuPUUwAX9saw3z2cUzPpOMiUcOEf9i9hObays9T96Kz3u8/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDBEE15CB6F
X-Rspamd-Action: no action

Add tests for SplitState. They cover boundary conditions at the split
points to make sure the right number of continuation records are made.
They also check that the data concatenated is correct.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 113 ++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index e722c6091ec8..1683ebb4c685 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -383,3 +383,116 @@ fn init_variable_payload(
     }
 }
 
+#[kunit_tests(nova_core_gsp_commands)]
+mod tests {
+    use super::*;
+
+    struct TestPayload {
+        data: KVVec<u8>,
+    }
+
+    impl TestPayload {
+        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
+            let mut data = KVVec::with_capacity(len, GFP_KERNEL)?;
+            for i in 0..len {
+                data.push(i as u8, GFP_KERNEL)?;
+            }
+            Ok(data)
+        }
+
+        fn new(len: usize) -> Result<Self> {
+            Ok(Self {
+                data: Self::generate_pattern(len)?,
+            })
+        }
+    }
+
+    impl CommandToGsp for TestPayload {
+        const FUNCTION: MsgFunction = MsgFunction::Nop;
+        type Command = ();
+        type InitError = Infallible;
+
+        fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+            <()>::init_zeroed()
+        }
+
+        fn variable_payload_len(&self) -> usize {
+            self.data.len()
+        }
+
+        fn init_variable_payload(
+            &self,
+            dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+        ) -> Result {
+            dst.write_all(self.data.as_slice())
+        }
+    }
+
+    const MAX_CMD_SIZE: usize = SplitState::<TestPayload>::MAX_CMD_SIZE;
+
+    fn read_payload(cmd: &impl CommandToGsp) -> Result<KVVec<u8>> {
+        let len = cmd.variable_payload_len();
+        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
+        cmd.init_variable_payload(&mut sbuf)?;
+        drop(sbuf);
+        Ok(buf)
+    }
+
+    struct SplitTest {
+        payload_size: usize,
+        num_continuations: usize,
+    }
+
+    fn check_split(t: SplitTest) -> Result {
+        let payload = TestPayload::new(t.payload_size)?;
+        let mut state = SplitState::new(&payload)?;
+
+        let mut buf = read_payload(&state.command(payload))?;
+        assert!(buf.len() <= MAX_CMD_SIZE);
+
+        let mut num_continuations = 0;
+        while let Some(cont) = state.next_continuation_record() {
+            let payload = read_payload(&cont)?;
+            assert!(payload.len() <= MAX_CMD_SIZE);
+            buf.extend_from_slice(&payload, GFP_KERNEL)?;
+            num_continuations += 1;
+        }
+
+        assert_eq!(num_continuations, t.num_continuations);
+        assert_eq!(
+            buf.as_slice(),
+            TestPayload::generate_pattern(t.payload_size)?.as_slice()
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn split_command() -> Result {
+        check_split(SplitTest {
+            payload_size: 0,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE + 1,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 2,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 2 + 1,
+            num_continuations: 2,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 3 + MAX_CMD_SIZE / 2,
+            num_continuations: 3,
+        })?;
+        Ok(())
+    }
+}

-- 
2.53.0

