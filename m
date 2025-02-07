Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32385A2BDBD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132EE10EA43;
	Fri,  7 Feb 2025 08:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Be/f/7Ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6060B10E2D8;
 Fri,  7 Feb 2025 08:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmYMnPkMeP5gwbBNAb3xdl85eqtZNXGZCzLjOE9Alytkru6ULWtPRnztGTafAWowM2ZPTg0KD2M/ekNOgYECDPuTXu/VQgMG8H2oQ5TMJJFg1CXvKzgzSkBSMlmDvjjw8rpzNbK14zk2fKiVgBcMu4upcdKWOSGN0y9GTOikatS3VsxiCsGPg96wOfVLSWS9oBIz2XFFYrMuHbh8u7iXi2ueTVa9V36PE3R+Lfbht/sogiI6KXC0rKSFEMaTV1c20H10FaYlIpMrTnZ3R9W9pkpcNbs42jvqqCg0U+v622xjZhMYa88CT3aYsPPV2aHhlZvDVoeDzBS6JC+V7NgYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utCr9kpxUiyav5Q+CosLtNdcf0OK0YstI4xKo7w+9IQ=;
 b=Wh6JX847IucJfZN4biySTZDvAtnhs284Crmk5HU0Fw3AIaFIzjvgVc8QDasA8vHc3b+6SSKFf63PJp4VjsVkBBNvCgQZeiaz1aRlg6J/0FqaPUyWS54VkD/+vGuaG4PUrgH5B3QqYsR1iGzCziSf25h/z0crP78cPLC3Dgqfrs7LLw9xFkmX9Qx9suDk8zjFCVgdJfAy2BLC4TSWzM98F13xMWFwZAvI9HuWO5KboOlri86s1he2snPyVCQGB7jmCUhTJcHNP47aVsPLxPy1sOj25AgK5jRxSH9e+2R8sBp2fSzt73kp4gRjouU6l6SSD0upTxxKhVuA8FPL6z/Iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utCr9kpxUiyav5Q+CosLtNdcf0OK0YstI4xKo7w+9IQ=;
 b=Be/f/7Efx+wpTyGF4xr8Phc35uzteKFEKVjWtfBDhVKNyFFp29KwMJ5QjuoVD5oltZNQitbt+gAxNeDl+HJSPV9UOnMMTp5QpLzeQe9Hu7bevs7tzawAKuWh4m0+FL/6lZvXwKspoUoGPL32/YqA9CXUgZtFQb2Sn1TvT4YyazyzAvH7/YfimKv90v+SklfGsx0/lCIF2LAHfVTh25V7Z7L8HuAvkfYcQE9HdnAILqs4IzHx2Fnc5eqmuT8O18roInwDtxaxqSmq1ReFoc/1eRY2+wbuHqRvwFuStcoEkp/A6sMltjb/CxfGEwz+aP4rK9ch9epKbh72tPJ3Pcv44g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 08:23:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 08:23:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 17:23:37 +0900
Message-Id: <D7M2HTWHNGEZ.10FM642ZMX1PX@nvidia.com>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <corbet@lwn.net>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <ajanulgu@redhat.com>, <lyude@redhat.com>,
 <pstanner@redhat.com>, <cjia@nvidia.com>, <jhubbard@nvidia.com>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
In-Reply-To: <20250205155646.00003c2f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b76403-d03f-46b6-e332-08dd4750bce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFdKamJqcWpxckpHWlFRZTUzNmVVRnV3elNMWm9tSGE3OS9zeUhOVGJyUi8y?=
 =?utf-8?B?VFdhT0VqNEljL05TdVF2OHVVOGJwLzRXKzNpajkwNE5VditabHJmMEpWbGhS?=
 =?utf-8?B?L2JTL0kxOUJYc1JnSy81eUtpc2VaWi9DN1hoSTh2S1hhT1ZXczRpVHhTVWw2?=
 =?utf-8?B?eGhmelRUcWVpYlhESk9BM2lUVlE1USt3TGZxdGcxaENWYlRsdjd3U0N5TTRk?=
 =?utf-8?B?ZHJVd09uajdjL0lNQzRnUzdhUnQxajFmWVRrSi84SmR5K3RXbG9pcW9DZHBN?=
 =?utf-8?B?ejZjWHRXZ2hidlhKOG0ycjYrTnF2amU1dU05ZmxjMTdvUmt3dUdmQ083TzZQ?=
 =?utf-8?B?S2RxLzVpQkJmQUtPOVRleUNlRGVHUWU5WC84V0pkK1FsY2JrMVUySXE0bE1J?=
 =?utf-8?B?czVGYm4reStta0t5UWRGeXlhUmU5aGkvNWFVMHdoUWZFQ3ZMc2d6NWRyUUI0?=
 =?utf-8?B?RUhKUWdEZk5obW05R2ROTUI5SWI1WWs4eHRocXdTZ3ZVMFVIWTRjS0xVVEZS?=
 =?utf-8?B?MXMxemhMOXM1aXMwL1N1bEdXQllBTTVNaEt1eStCTVBYMnhCNGZNN3E0QjdZ?=
 =?utf-8?B?bWw5L3dVOHM2SS90dzBmYlArTFUya2o2akF3SXZkL0F3K0xCM1V4K21wR1Zh?=
 =?utf-8?B?UENQK01FZG9Rc092eWRhcnBpcGhaNzh0aGJ3MWdDZlZUeG41bmt6OFFrbllE?=
 =?utf-8?B?TGdTWW1HQ0pSdTV4Mm91Z0x3bktQMXorNHRjalR3d2ozUjZzaXRKcS9wUWNZ?=
 =?utf-8?B?NEd4YThFc21rNzZ4U20xZGQ0Q2N1b3hHdGIyQlJvMGl4RFVQeUplai9ueFBQ?=
 =?utf-8?B?UjdyY203UVNNRDZQS1UvU2dLZDMvS1l3cGlUb2czVU80ckt2a1lKSjI3V3pt?=
 =?utf-8?B?M1l1T09odk40azNraG5FRG41cTJsK0JpcTFlRHRCL0pMbFR5NThwdnkwUzVB?=
 =?utf-8?B?Wk9VSVdGeS8zendPQ0NvYUtFM1dybnVoU3d2b0ttTkNZSUczL0xucVp1aDdo?=
 =?utf-8?B?TTlwVU9sMUFuZGtVemNSRngvakRCMUtQZUU2clltNjkyY080amFrdFdiSVdj?=
 =?utf-8?B?SGd5bFgyNzVPRlRLeDYzbE15MmFrZFRPdVh2K3NuMUNudlJNNGVLVjBjS3FX?=
 =?utf-8?B?ZWtSSTRZcHdkc2NMRlNETDY4ZHE1Qjk2clltVUhidlBaNnNvcFQ0aVlNOHBx?=
 =?utf-8?B?ckE2cUNPeVZQUVZBajM3dks4Q3pWdVFPV01UN216TGNSOUM4ZEQ4bmxmR0xj?=
 =?utf-8?B?c0JjRHYyYjRvZWZNQVRDOWlsR1dmNWRTYWEzT21lUXAwdUtZOUE1ODBYZnR2?=
 =?utf-8?B?RUNtNTFvdVZyS1lyc0k5dElOaXJjMVZCeEFoTnNVUCtVNDFzcFhWOE1wb3dW?=
 =?utf-8?B?SytIdTI5RThSNnhDYkN6ZG1BMnV4RS9PbVlqQ2FoVlF0THZMZUFPQTIzN2tP?=
 =?utf-8?B?Kzl2ZS9ZVnlJa0ZSSkpCWStwL3BibFVuaVZKNktqeUNuSFY4aGVET3pKRnZw?=
 =?utf-8?B?QnNzaWJxWUxzL2ZWRWdDQmg5UEYxRExucGIxcUdocHluRDgyelkxOEZoYk5x?=
 =?utf-8?B?ZjRTV3U4Y0s4ZmdzNUs1MU92RUEzQStoSy96andWdUNZMDNJS1o0dDlGc25B?=
 =?utf-8?B?Z2RLU1Y2bnJXRUVBeUcyUC9xdkZYVXRYQUxhRUpmYVA3MlBmNG0wZkhrd2Ri?=
 =?utf-8?B?RVJmblp4RG9TMnJKWnBZVzBVdmp1M0syb1F5MW9FdStzbWdIeXI4TjYwNWhj?=
 =?utf-8?B?OWdJZ3oxa1ZNSlFmMTRQbDBpZDdnY3RlZ0hVVW4rNE5Dc1VncmZhNDlsZUtL?=
 =?utf-8?B?aDFaQXFVN1A1cHJDTVRZQkdFWVgvNm5IV0crMEprMXNGKy9YY0FQU0k4OGtL?=
 =?utf-8?Q?2SJlVrFVuKQUx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGgyUW9CbzczYVZDbm1rRzVxTHF6bzFqdkJySjlsY1ZVVUhGSXZQSFVLZ0JQ?=
 =?utf-8?B?VDZ4R1MyTW9hZzRpeTFGdG1HQk4yeVR5ZG1acldjYTlITG42a3BHN3hkdVAv?=
 =?utf-8?B?Yk45L3ZqbW1oaEZjN0V0TjRoT0s2U01FYUpSSnpTT1VmeU4vTGNhV0k1TVFN?=
 =?utf-8?B?SXlmclZMSVRIS2ZLSExJSS8wdVhhOEI2UmpNUnNKL25EQXZtamNnVXQ1VEtR?=
 =?utf-8?B?STFsSmJCekdxT2sybHRJcVRkQlNwdUhacjI0RVdsVG1aTmZudHFyQWpWTG5v?=
 =?utf-8?B?eldXSmtUYTVJY21pZG5VdDVEUlVnN0tSQTkwRUJuemRCdXdLZlVrWHhrU2NU?=
 =?utf-8?B?ZFlUUVVpZStmbW9sUlVWZlhaNmx0U2JTeEdJUmE3b1MxdURFUWJmckJoVFNs?=
 =?utf-8?B?TU1jMFc4dTlHeFN5VEpEd1oxdzE4Ri80MDVNS0pmdUc1Q3JkMDZLclhXc0wr?=
 =?utf-8?B?bU5kVWhOaGE4UmgreDMzcEVyZXBTY2VxdDFDaXltZFpVQmE3QmdFVktvNTg4?=
 =?utf-8?B?Zmd3cU1zSTFDQ0dNVmpyT2QxaGI1bkhPbTlBWlFnUWZmZUx1eHBPUHpKbnBk?=
 =?utf-8?B?SU5uaDlrdzlMeTN3bTBTdEFORXNRMGJwQzZFT0t4NHdHTXdMU2ZMb3NvK0l4?=
 =?utf-8?B?cjRUTGVGd05sbXhzeDNmL2hKM1lHc2FWcEptQVF1V2xGZkhKV3JENTZIekNp?=
 =?utf-8?B?czRzenFna0wyaEl3bW5WbEZ2UVMvdE1hdXZRRWVOTEhFRkZFTUxUditiRVor?=
 =?utf-8?B?RVE1eG5nRSt2ZlpLaTgwMUhSLzZkNVBuRXhHSmZNWEdqNGhxYlk1QWQzR09v?=
 =?utf-8?B?TGVpQXNkNGJCNFJYZUJxb3BlWUFTNmQrVkxHTWY5WWN6eEkyelJkL2NPaWkr?=
 =?utf-8?B?YWxPam43aTZweDRuOThDWSszTGtDQjRZT1RwWGpZQ3ZZTHRpaTFkbytKcmc5?=
 =?utf-8?B?RW5udVl6b0ZXK2ZaRGFqK2g1WGZKREszOGU4T2doTks3NTZxMnB4ZjRNOE0y?=
 =?utf-8?B?dXp1MzBaM3dadTBYQzkwZms5ZitLREJMSWVhSVVKNkQyb2FCL2p6am5TUW0r?=
 =?utf-8?B?QXJRalVuYUdqc3hRdE5DOWZnYldzeTRZcnZNa1lZY2JPN1RyQ3ozMG9jSTEr?=
 =?utf-8?B?QW53endFanpRNEZzNFZKUkZEU0RISGQzRytrUitHMGMxdzRxN0dWQ3drOTlZ?=
 =?utf-8?B?UTZNQW5nVHMxQ3RiQm5UY0E4ZEduVXZWcFdkSjdRaE9YcVlsNGJvT2JSUitC?=
 =?utf-8?B?ZERJaHN3d1dDMzlsc05XOUt5UlBzdFFxTE91THp3OWlwbERoNHozbld3d0ha?=
 =?utf-8?B?cjRNdEJJVUJkVjEwaVV2dnUxYlkzUFJLaCs5eTJVVmlETms4b3RGV1c3SERQ?=
 =?utf-8?B?L2gzR3ZWcWFaZXFyU0xYR21ZRGdwWjh4Z3lCcGxRR2VBQVpVeVF5cUdoVlhr?=
 =?utf-8?B?RU12Zm5DTUgrMFNoZG13YTBUVzBZRWwvckxZbUc3aWlZa3dqRG50MWpTb2NE?=
 =?utf-8?B?UjBRZ0R4UUNaYjJZTCtwbE84S2lNbEVzQ0d5bDJ6TmQvWjgwRDdxTW84Y1pt?=
 =?utf-8?B?MGJmSXFNcmJrM0lIdTJLVCtDZVQxYXBoWWV5LzZhMnJESFNkaSt3OWVaQndw?=
 =?utf-8?B?bzFQV09teFYrTUJrM3dPbmxTdWxOOEJoMyt1SWJ1K3pxRDRFeHEwYnp0OWNq?=
 =?utf-8?B?MFpEdkduMlBaT3dTYlFtWkE0YUdKM21mRUFXZVpOaDVITWcrOHMxZGpIdmNv?=
 =?utf-8?B?SW5HUFRWZmZka1BCYWhSdW9VbTJNdHpFa3BqS1c3bVc5bldxWnEvb2JmUEtB?=
 =?utf-8?B?TWxNTFl4VzhnZEtUMXNQbmhnWW9oL1kzNENWU2g0VTZoT1BpdzZpWTJUaXRL?=
 =?utf-8?B?eExvcGU4NXVCbGJYSnpCTUwweEo3b3I0MElaNXhUb09CVzdQNU9rc1hlQ0Fm?=
 =?utf-8?B?a0JubVhTQXJQdVcxSEp6RnBQNnR6aXludXFGY3BpL2x5b2ltdHZIUlA0b3h0?=
 =?utf-8?B?ZFZwR1gxb2NXQy9PNlFMZmNIejBGSmEyVTZNN2ZIL1FTUFBrMmtpZk50dDVJ?=
 =?utf-8?B?WTdCVTNLaG5FeDVhY0x2amNSem81bnZ4ZmFQNk1EU0lDR0J1TVYzSzZlRmpa?=
 =?utf-8?B?V2NyU1RIWWlPcXpjcVJoQlM2V1ZzM3JOQWwrbkcvRzV3YzV2NlhyOWNFbFRu?=
 =?utf-8?Q?0EDkiJzWBCYN8ZkDCuuhRe6lrqbdqEGv8fMuOrdL1sXJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b76403-d03f-46b6-e332-08dd4750bce2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:23:45.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjdLu9ylLjZoNs6cH5C18YAUra9UzelYE2CPblgWHvJjO06LdzAjiaHqS/dASFOwZbQ2VzRa4xoaS0mlaSFFxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174
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

On Wed Feb 5, 2025 at 10:56 PM JST, Zhi Wang wrote:
> On Tue,  4 Feb 2025 20:03:12 +0100
> Danilo Krummrich <dakr@kernel.org> wrote:
>
>> Add the initial documentation of the Nova project.
>>=20
>> The initial project documentation consists out of a brief introduction
>> of the project, as well as project guidelines both general and nova-core
>> specific and a task list for nova-core specifically.
>>=20
>> The task list is divided into tasks for general Rust infrastructure
>> required by the project, tasks regarding GSP enablement and firmware
>> abstraction, general GPU driver tasks as well as tasks related to
>> external API design and test infrastructure.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>   - Add task "Generic register abstraction".
>>   - Change complexity of "Debugfs abstractions".
>> ---
>>  Documentation/gpu/drivers.rst              |   1 +
>>  Documentation/gpu/nova/core/guidelines.rst |  24 ++
>>  Documentation/gpu/nova/core/todo.rst       | 445 +++++++++++++++++++++
>>  Documentation/gpu/nova/guidelines.rst      |  73 ++++
>>  Documentation/gpu/nova/index.rst           |  30 ++
>>  MAINTAINERS                                |   1 +
>>  6 files changed, 574 insertions(+)
>>  create mode 100644 Documentation/gpu/nova/core/guidelines.rst
>>  create mode 100644 Documentation/gpu/nova/core/todo.rst
>>  create mode 100644 Documentation/gpu/nova/guidelines.rst
>>  create mode 100644 Documentation/gpu/nova/index.rst
>>=20
>> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.r=
st
>> index 1f17ad0790d7..7c2c5dcb5fd4 100644
>> --- a/Documentation/gpu/drivers.rst
>> +++ b/Documentation/gpu/drivers.rst
>> @@ -24,6 +24,7 @@ GPU Driver Documentation
>>     panfrost
>>     panthor
>>     zynqmp
>> +   nova/index
>> =20
>>  .. only::  subproject and html
>> =20
>> diff --git a/Documentation/gpu/nova/core/guidelines.rst b/Documentation/=
gpu/nova/core/guidelines.rst
>> new file mode 100644
>> index 000000000000..a389d65d7982
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/core/guidelines.rst
>> @@ -0,0 +1,24 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Guidelines
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This documents contains the guidelines for nova-core. Additionally, all=
 common
>> +guidelines of the Nova project do apply.
>> +
>> +Driver API
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +One main purpose of nova-core is to implement the abstraction around th=
e
>> +firmware interface of GSP and provide a firmware (version) independent =
API for
>> +2nd level drivers, such as nova-drm or the vGPU manager VFIO driver.
>> +
>> +Therefore, it is not permitted to leak firmware (version) specifics, th=
rough the
>> +driver API, to 2nd level drivers.
>> +
>> +Acceptance Criteria
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +- To the extend possible, patches submitted to nova-core must be tested=
 for
>> +  regressions with all 2nd level drivers.
>> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/no=
va/core/todo.rst
>> new file mode 100644
>> index 000000000000..5e66ec35c5e3
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/core/todo.rst
>> @@ -0,0 +1,445 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Task List
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>
> ...
>
>> +
>> +Generic register abstraction
>> +----------------------------
>> +
>> +Work out how register constants and structures can be automatically gen=
erated
>> +through generalized macros.
>> +
>> +Example:
>> +
>> +.. code-block:: rust
>> +
>> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
>> +	   MINOR_REVISION(3:0, RO),
>> +	   MAJOR_REVISION(7:4, RO),
>> +	   REVISION(7:0, RO), // Virtual register combining major and minor re=
v.
>> +	])
>> +
>
> I think it is better not to tie this to pci::Bar and its operations. It
> would be better to have a intermediate container as the macro param. The
> container holds the register region vaddr pointer, size, read/write trait=
s.
> The macro expands it from there, thus, we can also use this on firmware
> memory structures, e.g. GSP WPR2 info.

Another reason for not tying this to a particular bus is that Tegra
doesn't use PCI to reach the registers of its integrated GPU. Maybe we
can remove that parameter from the register!() macro and have read()
take a generic argument for its `bar` parameter instead, so that method
gets automatically specialized for every type of bus we need to use?

