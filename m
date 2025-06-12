Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20AAD7300
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2E910E861;
	Thu, 12 Jun 2025 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TrHjAUqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5D10E869;
 Thu, 12 Jun 2025 14:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKOamWlqpCdTJSQkRbwPdwsLC18H5XpFBeOe0pQNPPuM0eHVSnp2TbeQUS3Rok40ByWb91fGmZNI57bQeaRjWeT7oQM+UlrnQjhkLXBSfI3Gh//h8MyRi3BzX9MzPEdfspLf6l8E58vU4vznC4TH74C2dA443s9A3HjPk+eCu4n1WUy9mwiC+qD+xs8RqDAbfmj1jFp2RRWFas8WqdmswNdFD+FEf53GUk4uckCiCbcvQQ1HPA+S42Z8ntv3oMDqLO0w/hy8DhUUun+OpbtrJCmftgmEWrZ9wrQoGNivb4JaZKU+2vybjjN8aacHZs+05Zv7PIURcfGYEVO2ofqhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnybqlTJLU2DYWZmw52EQmrPJlPy3qcHOH7oMBG6NlM=;
 b=EZiyFTGsnD2pUM0DsRUDexhvf7UotTuHsRldzPkVAY6Rb0MhANwL1h1IbG5yKoIk9xAt9aG/pm9ou7pxrti+Uat0fY0x02JK+8f4bRC4C28UZcrUhr6USUNwYJYgdqBhz+Xd/ZTyDwHpiueEpQTDaTGFsPylODN3zzGEkWEnOQcq6dEFCtcGaf5UceillVpgFq/wnznrECS7qplLBTsSKnAsqx1B6iQkg0A4Nm4WkK06zyO/G9rwWVaArt787SzoD+UF5gSsaJmTqItT2gsjoJU49Z7yHPRq/R+LWRcAS38Cu4LWTRHC7B0gCP7tChXa8HWpA9anw0oaTIlFAs/osA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnybqlTJLU2DYWZmw52EQmrPJlPy3qcHOH7oMBG6NlM=;
 b=TrHjAUqp6id7uAUV+yf33H1q/H2ybXXCaxPX+fxEuOllWo8cDdjwbxL6J++rwtbVfbpVZkBDGPxirxF3J0pD+5xNzYZOvUwMoBbQq4GXKKnCmGDiXQ9A1VuF001IPi4eUH23MYIKbtmmvnoJdXCtXGXG10u8voU79Xf7UHAHoa01nz06EEppPj1DGbUnOGe4CMziKkv15ZtugcXey4rnBEhbtfcovNxkSCE2Gj902I91nxGDirc/Gqag172waOPCPR1963XDtycaB3Isg2OzxwKzk19Dwb7ojxWCnqYU7lMvRmgx/xQK+JFtfIHyWjmLV9udNAtT5Nzf5ErldMQSiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:40 +0900
Subject: [PATCH v5 12/23] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-12-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e8d926-d910-4e35-b086-08dda9b9dd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDRraHZISnAySEpWYzhrdXRZOVZxcTllMUZYa2xHZmtXbEg4dEpYMitTeEla?=
 =?utf-8?B?eUlPRHNMTHFLWWRaMFJhY1BHbGlRK05mSlpaa0tpbENhajZtVVZUWDdEUmIr?=
 =?utf-8?B?WTRGdjJYQTN5N1Jnd1plVnF4VkhkLzN6KzB3bmxKT2ZLbGY0YmwweDVBQnox?=
 =?utf-8?B?V21JT1dCNWltemdvUUk3OTZXMlRXb0ZUajhSM1REaUZuSVJFWnRFclNrWG5I?=
 =?utf-8?B?ZEs1cTIzbUdKcm5LdmdUSXFFdGdXaFp0VXVWSkVHaTZkODArVE1BbHlqMis2?=
 =?utf-8?B?Z1NIVis5cUlFeFlSS2s5aUVKSEp1bVN2QlhGYTdpVEpVUFlsT2U3THNmMURF?=
 =?utf-8?B?VFhQUk1CSThFVitGUHJpeTRTS285L1AxKzQzSk1GS0QwZHU1VzRoditLVEtZ?=
 =?utf-8?B?UWp0YW4wZUR2QTZ6UjA4VUY2WkNtNWRBZHk0Qlk1OGNjU3hiS0NrY3ppSU9n?=
 =?utf-8?B?Tlg0a3VXZUpFb0ZsOFRQYmZ6SjQwQTB6TVRNYVZldFdYSzRJRmtkV1JXc3g2?=
 =?utf-8?B?NnpjR2JMcDZyc0V4UldQZU1CZjFTV2xOcDlmVkZhR3lxbWJKMU5mMEFZeUoz?=
 =?utf-8?B?R3dZYnIzN3EzeHdkSXhZeVVVQkJCRGJBSVN2MmF6bmI0L25zNDlOMUxqN05q?=
 =?utf-8?B?RitRZDBYK2lRaXFmempoUTljdjYwOGNqNVFta2tBcDl3U0Q0RUcySnkwR291?=
 =?utf-8?B?dElOelVIV0RPZWJacEVNdXVhSUM2VU1BZEowSk1kTHlFbXo1dXZkd0hEazBi?=
 =?utf-8?B?bVVOV1lFcTE2THZ4dmUxY29YZG9ISWhwME1QTFRJVkJ5SGFuSjB1SHU2RHFZ?=
 =?utf-8?B?V0dKc3RMMWhJSzFkRHZrbHlNQW9KVmplVUVYOTZDRTBVWDc5azU1amoxaUpE?=
 =?utf-8?B?STRkQUFKWTJXWGpzYkVJbjlyTGFzc1RyNER5N25Lb3BjYWRzeXRyVGZWaVZy?=
 =?utf-8?B?YlZLN0phZk8vVGdUOVd5WmZNMnl5TG5qaFFDYWx1ZTl0SVppbEtVUTlMZitU?=
 =?utf-8?B?RXgxOTErSU9LZDhtK3ZZbXVJeGRHbGlrRExPUElFdEIrcGtpZ3FFaXd4eXh5?=
 =?utf-8?B?UWg4cVFiazFkZDcxeHJnL3BDRk1GQytsTjJ5ZFoxUk16WnovckFDS3pvbTRJ?=
 =?utf-8?B?cDJaaWdvK2ZiN3lMZkhQNjlNVFVNbjRUM2dyWFN1QjlZN2Raem1VRjJveTUr?=
 =?utf-8?B?YlRQU3JIa2ZaWjRxbFlJcHF6dStwSWdwSC93eWlrRHYvbUpiZUZ2eUJtd1JN?=
 =?utf-8?B?UnlVYyt1YitKWjBOMXVSLzBzYldFcVRJRTJLM3VZUnp3R3BOWXpnemNZMnRn?=
 =?utf-8?B?TkZDTDk2cU5ET21wY1RWcTcyZmtoZkU3eURiOWxVdXFsN0hFY0Z5ZzVhUXo3?=
 =?utf-8?B?RmxEOTlOdkU0UkVEU3Bwa3FPL3ZHRkpITDdMY3hKWEFmZGhpQnRxNUg2K1F4?=
 =?utf-8?B?Q2xRZExjT3pqZWk2bUlQUWp6YnNtNDh3bGVNU3JBQVQ0ckVIVlhZWCs0RGs2?=
 =?utf-8?B?NmhPSWpyaTZGblFmRkZOUTMxR0h1dy84WDlqdmtteTExdnp6Y0hmbU90K1g4?=
 =?utf-8?B?VmNvSzlMSFpkdHNDbXl5VUoyc0pTdytTN1ZOa1BIQnd1NmhiTkNaOGRsQWo2?=
 =?utf-8?B?emM5d2VjU2VJSXpkTWdMSUJSUU5XM2FOenBhWnJOR0dJb3k5eEpIK2IwcXli?=
 =?utf-8?B?ZnF2Z2Z5c2JzRnFvWDAwZ1BJNjNUbytzcWtnbXF5WUdnaDVoNzdVdG9vM3Q1?=
 =?utf-8?B?NFo4WnFESkZTeHIzY3JabGFtUlZ0dzl6OG1aYi9vZ0JmUTJEcHdkMnFhV0s4?=
 =?utf-8?B?TzlBNS9HRHp0SGtuRkRNQUxPejZVUnNXVG9BUU9mTzdIZGJEblVXYktGMDE2?=
 =?utf-8?B?RUpRdWt2Zm1VaFdMcEREYnVMcndKR3kvaUlIUVFNOGNHMW5hUE9ra1BENmRS?=
 =?utf-8?B?ZG5nTVpIS3lMaGd6aXJUdHozK2RwOEd1MUVSd2YyZXlaVVd6aDVPZVBJVmJl?=
 =?utf-8?B?b0JDVURKOGxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhuOEYzZ1VjS1M4TnFYZE5YOGd2Q05mNTBiT1ZLanlvU2hreVBSV3B6c2RS?=
 =?utf-8?B?Z2o3OGowWTdlQmF2bk9rWlRuNDRqeURlaEQ3YkQ1djQ0ZTM3TmMvRlFtZGFE?=
 =?utf-8?B?VGZzMVIwdmRPZnR0WStZbFdQUmJRMlpFbGpOQlFYeWFoWjNnYU9tNkplMEM1?=
 =?utf-8?B?a1R2UWQ5S2RUd0JMSVYvblNFWTJGNmZCMnlNQUx5a1RjcnNWcjVjMUtYallB?=
 =?utf-8?B?djBNWWxQMm9reU9RUWszK0lXMWltSWhmZjBaL2J2a2xTZUlydGFNQWdhdkxl?=
 =?utf-8?B?Rm9OWlo0RXRLdk9UNmkzeVJKekRkd0J2NDcwTFREd1hzMStlV1JsMFYrMXFC?=
 =?utf-8?B?ZUN5TDVmREZwdlFxTE1YZVFEa0lQV0VralNaYjd4bkl3ditWQnFPeWgrUE5H?=
 =?utf-8?B?YW1xSSsvTCtNNkM3L20zTDZRNE5hdXh0NzEzSUQyNm9EWVV2djlJTmR4QXc2?=
 =?utf-8?B?ZS82YS9ESW93Ri9uWEd2UVZob2syMHJ5NTNLZ1VOYUhEUVVxTTlMTEgrWXJm?=
 =?utf-8?B?T3NGbEdqYnR4S1Q4ZCtyNHN6SnZkVHpsdkY3NEhSSUQxTnVNUENtT1VQY0Vv?=
 =?utf-8?B?NEYyL01MWmh1a3o4QVhKSHNwbGRSVXE3ZytYaVJRYWtZb25kL0ZVWkZ6TmE0?=
 =?utf-8?B?Q0RNelZ2MDVWczV3elhwL0NzQTN1T29pS0pTUm1qZnNUSTlZWEhYelE4UFky?=
 =?utf-8?B?VWZjV0pnWW1RR28ybHdsMzN6YXNKLzIxVlJKYzJrSTFZZzBDNGVXNVBIaXpK?=
 =?utf-8?B?YmNURjRrVWVpaUh3WUlzTEUxamx6Y2d4OXFOR0hOQTRGMERmQW1wbVk5UUdY?=
 =?utf-8?B?aFNkNDROTE5ZR05Ub25ZcithNFV6SzhYUkFTMjJJcVBickV4eVpLbVlDNXdN?=
 =?utf-8?B?c1Zzd2NlRlp1YWN4YVBKVk0xVmxIMnlrby8zVEhraEdYUTRsRVdJcVgxWU0v?=
 =?utf-8?B?eUxQK0F1a2tZUHhoUGxhTVAwQzFXNzFvb0lBQi9vYkJlTlZtTlZyTHRrOGJM?=
 =?utf-8?B?SXpaaUJsOThuMEIzYXo3dG1PSlYzRFhTdEo5TVVySzdQQTB1TTJwMFJ0L2Jv?=
 =?utf-8?B?ZEo4L0V0R1RlRlN2TGdjQS9ic29LRlM4SzZ3cUxyRDVRTnp0RnZueHdCOWJl?=
 =?utf-8?B?NFFBcFhRVmdLMXdHVVQ3c1Rjbk1IbDk5SXRMTVNLRktyb0l3WUd2Q0pNWnBB?=
 =?utf-8?B?SitMMWhxL2FkUFRlaWE0eHFlWWIxNmMvQTB3aUpPOEsvNTZ0dzA1NDdJNXg1?=
 =?utf-8?B?bTZ2QVdmZ0JvWGdXK1JlaisrL0pFWm5lVGNTRDNqcmllaXo4YWN6aVVSWWdh?=
 =?utf-8?B?TEVUb1dQTFR3Z0NYaTk2TXJoV2RNZHdQNFkzbmZzZGZ1OGgrK09CZDVPOURt?=
 =?utf-8?B?NnJuTmpXcWFYT2NiVS95OXBYU2g3NmF0VUtHVFR4Ky9BaWo2WjljSjV4Y2lS?=
 =?utf-8?B?Y3NsNXphdGh6NS90dU9yZEV2bGRKNUowNjVWT2VZUjBCcktHQ1Q1b2M5S2pP?=
 =?utf-8?B?TTFicVJxeVpweW9qQ1Z3RGRjM08yalpXT01Lc0dqNG5PaVNkY0NMM3RZN1By?=
 =?utf-8?B?T1JzMXJhRXc0ekVxRXoyZTdqZVhpWWJnWWg5aWU2bGlQQTNLTFpqUStvbGZW?=
 =?utf-8?B?ZGFPYmRYMEtaeEprQkpVQVZlSXlHSSsvdE14T1dNYm1lM0dtZTFqZUJtOVN5?=
 =?utf-8?B?ejBHNDNoVlY4NllKaFFDYjRHdE5FWUxXbS9rMnhQVjc2R0drSTQvTG9vdldo?=
 =?utf-8?B?eFBISm5NRStyNE9NQ1A4bWZja0hqU0dueVl2c3RkdnRmN2lPaXFNNk5Ybk8w?=
 =?utf-8?B?bGFyeFNEbHd0bnNMTy9ZaTkvdGFHRXFhQnczeGRLQmllbHVkekJpUmZQVTZr?=
 =?utf-8?B?ZXNKM3owRDg3cVYzNzVsRUJSd2RpNkpqRHZhS1ByYmptNVJ0Ujd4MGpNK1dM?=
 =?utf-8?B?Y290Yk1mY1JYS2dkbGtrd3RDYzloVDBWU3d2RGpBekdGN1RZL1BscC9BaGFr?=
 =?utf-8?B?Rzhwa3Jmb1l2dUtuaHVEMHZiRmhTK0d6R0hQcVMvcWVML2x6TTJFSUo4ck91?=
 =?utf-8?B?ZGxIZE5oQ01Kcm83UkloVmcyT0hIbGZUZmd1OWl6dUl5cmQrNXp0YWRwZmk4?=
 =?utf-8?B?eWlhVjRnWEdMQ3ZIeVVsa0JnOXRiMXNYWXpBSVAyRzZKTWMrcEw0VFlEdnA0?=
 =?utf-8?Q?4vpduiD16HxFxNmwHSuJw4n99mzP2PIrpMfuUKoDlxTD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e8d926-d910-4e35-b086-08dda9b9dd59
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:10.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBIMEcqRgCMf4/R8IZ0RQU0aaHThz1wQDUyARHkLgM2vfMRHkcYxMcF7LH2/vtAcY1pJXLWajkCVrpHF3KYChA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

Upon reset, the GPU executes the GFW (GPU Firmware) in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs       | 39 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 25 ++++++++++++++++++++++++
 drivers/gpu/nova-core/util.rs      |  1 -
 5 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..911338660f9774d74c71c090517b220b64989bf6
--- /dev/null
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU Firmware (GFW) support.
+//!
+//! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
+//! the GPU is considered unusable until this step is completed, so we must wait on it before
+//! performing driver initialization.
+
+use core::time::Duration;
+
+use kernel::bindings;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+use crate::util;
+
+/// Wait until GFW (GPU Firmware) completes, or a 4 seconds timeout elapses.
+pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
+    util::wait_on(Duration::from_secs(4), || {
+        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
+        // status.
+        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+            .read_protection_level0()
+            && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
+
+        if gfw_booted {
+            Some(())
+        } else {
+            // Avoid busy-looping.
+            // SAFETY: msleep should be safe to call with any parameter.
+            // TODO: replace with [1] once it merges.
+            // [1] https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
+            unsafe { bindings::msleep(1) };
+
+            None
+        }
+    })
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60b86f3702842dc2c8b06f092250a5bad3b97bf4..e44ff6fa07147c6dd1515c2c6c0df927a2257c85 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::gfw;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -182,6 +183,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        gfw::wait_gfw_boot_completion(bar)
+            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 618632f0abcc8f5ef6945a04fc084acc4ecbf20b..c3fde3e132ea658888851137ab47fcb7b3637577 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod driver;
 mod firmware;
+mod gfw;
 mod gpu;
 mod regs;
 mod util;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5a12732303066f78b8ec5745096cef632ff3bfba..cba442da51181971f209b338249307c11ac481e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -37,3 +37,28 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             .and_then(Chipset::try_from)
     }
 }
+
+/* PGC6 */
+
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
+});
+
+// TODO: This is an array of registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
+    "Scratch group 05 register 0 used as GFW boot progress indicator" {
+        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+    }
+);
+
+impl NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT {
+    /// Returns `true` if GFW boot is completed.
+    pub(crate) fn completed(self) -> bool {
+        self.progress() == 0xff
+    }
+}
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index c50bfa5ab7fe385fae26c8909ae5984b96af618a..69f29238b25ed949b00def1b748df3ff7567d83c 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-#[expect(dead_code)]
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Instant::now();
 

-- 
2.49.0

