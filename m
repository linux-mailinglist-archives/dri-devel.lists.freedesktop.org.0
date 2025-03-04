Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CBA4DFD7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9764810E36C;
	Tue,  4 Mar 2025 13:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IiBh6+Qf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E1D10E319;
 Tue,  4 Mar 2025 13:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/wE2YAiHI8fosmzOdOuZKij+ksURgaVE3PX+gHv8gPCx3zbzLbbnMefzzq29VUZxHo2LXVhOLuKwyiT/ter+o0oQHTknlmTblPECaxH0Mh9yUSp8010MlZQ/G8tdbQwRzQGrC1W1foNKjo1vF+tcUozJ+b9nzESBhMH0HJB9gDt6JzWh9sl9pmtgLTQIkOEvgYjudE34MaCBulzR6CdKMupnBTit6ryVXhq9K84euU3EpXase9QTtMJm1YiBF80hQ3JXuulMH0yAZtuiuNwo7dn6Z1iNPTkRUFg8EhRW252iSZYKaflubJKhagcigM9tlGY+wnQEb6IMGEes143vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L137rMd0Rw1ndCyur9Cq3zz8gr3aJMXQRaK6fobdNvU=;
 b=P1Sj7LSK6JrOJ/3pdZBLF3Auo+UaSKQ9xjduApKbSeRVROEBdinz3V9MoEk4gV84HhniqvOcRLzaAPuXT38WfpHhWq/WEPD2m+Jxv1FlQ3tEDogb+Va01K6HYiuZxqUK1XToNER+Yen2fekbSjW08jFj62SrnMAxtV44N6a/8wLEY2CZkUuMNv8IgqRsXtR/ECHavlnSvQu6/tcTPErd9nkr2Ch0WtxvgQwLU6vIwfiRbFOcnrFZ//X2ulPY/91pfgAjG1j5mGhgeoN6wtKZ0TRuVeImJB4OW6JwiZ5ODTUGidvMcuLN25ScHls9GPrZBZ05g/QKJ9RP0Z9bOcTevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L137rMd0Rw1ndCyur9Cq3zz8gr3aJMXQRaK6fobdNvU=;
 b=IiBh6+Qf3hgPGJvvDTxAZaFFWYWAPgXr4ZcMVtYUbWeK21pLkUBMw7ZpxEeBZHbZthJhVxxSrvoxmajVe14d3dJCB8meGekyBqJiZGWcvGBt3kxHUhHbD3oKH8BxgtkrWHZL1/9R6+0qh6oSWV9bzCyErifE3GDADYVJvcSjrMgBkR15rWpfT2fPgGEW9D68RoxvjAGBfWXYTe4zi7tWpZ+s1jJWGZEliMbRcxk8QQoou300ONYvhp+nlsg5N0PzuQuDEZi4uqtiERLu1K9g4hHym1k6aCaI/NfztWb/i5S82FFNq5EmkBiB+hPHUWTH03/WFNSoa830yKZGLk692w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:54:54 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:54:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Mar 2025 22:53:57 +0900
Subject: [PATCH RFC v2 1/5] rust: add useful ops for u64
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nova_timer-v2-1-8fb13f3f8cff@nvidia.com>
References: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
In-Reply-To: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0189.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::15) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 1383bec0-331a-482c-cc5a-08dd5b24248f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWdvTGZiYkFWMysrbXpGaWRWN3IyenBHYjEvYjFNekhudEhJem5NcGU1NUdX?=
 =?utf-8?B?MDUrRkt5d2UvZDlPTmNFcUgzRHZRUkJlRWpnM0NwaTZkOXlFZkVjWk1STldr?=
 =?utf-8?B?dDcxWElOTVhVQ0ZqWWplZm9ZWk5vWEFtY2U4VkNlcVNFSTRNcFhWTWRZbFA1?=
 =?utf-8?B?ckdOTE9oN0xPWXAyNU9hWFQ2MHpzOUVkUzcwcUxQUUluYklQRnZQeEhUWWcx?=
 =?utf-8?B?YldzMjYzQURjR2RzOTcydjZXQlk2U093blhhdGI5bExzem9ZUjlWOVg1bVk3?=
 =?utf-8?B?NHRMVUhGZmJxdm5JQWR2NGhmalc4MkF2MmovcCtKS1lFVldUdTJadlBlLzdy?=
 =?utf-8?B?UjBsYVR5MzBEQ1dHNTY4MmFJL28vcFlILzN0UWVwenJERC90STFQNkZWRUtx?=
 =?utf-8?B?T3FNa1lZcTNwa2NGYm96MW5pM3dWQ2ZJd1lkYkxDOVl0dWE1SE0yeEZkcFhL?=
 =?utf-8?B?clJuSENKT1I4RlNXZkgrU05jSE9oVVloNCtSN0E1Z0tYMnd4NEZVVldCVEk2?=
 =?utf-8?B?alE4dTd0TTlCQ1krMjg4VlY2cjIySW1aK2dzS3FjUjNtTitxb3NXMEV2c1Jq?=
 =?utf-8?B?K2gvS2hSamlaLzRQcjh3WGVJbndFbXpvclA3dW5Qc3FPM2xzeDl2dldscTVC?=
 =?utf-8?B?S1NReHV5L0RaK3pyblNKRmpxMUhjcHVCS2p5OVN2UGgwbjFHZEkvVHV1aTVo?=
 =?utf-8?B?SGxsOStmVE8xMXpGUFZNY3NqSXB3SUtiR3liRUgwb3VjUHZyYUExQUdpb2cw?=
 =?utf-8?B?Tm80Y0x1T25pemRIK3lWdi9zemk3ZlFkN1grVkRjTHIwQ25UL2pkS1VPQ3ZO?=
 =?utf-8?B?Q0lSaDVxV1ZTaFRCT2s4YmVNTHh5S2NLRnFNS3dvaVluaEFMTmo0N1RCaG82?=
 =?utf-8?B?aW1xdk4za2hBTVVWV3M0SHc0MGlxK0tnRUpqU1A3bDVVWnlKd215bnhDU1VI?=
 =?utf-8?B?ZjF3c1RWRWg2cEpDQnZhMnZuUVlWUURJZ2NLUXpCK2VrZjl3N2pXeWRFVG5Q?=
 =?utf-8?B?M2s3OEIxUis5WkhzMCtxSHUyaU1CcTR0aC9GclBPYURkcWhHbDQvUUdFYmpN?=
 =?utf-8?B?dUpndGtROVEwR3JaZGlBa052TEFSMzcrbVY1NWtoR1crR29hQVRwdEgycHdz?=
 =?utf-8?B?NE9IaXNGa1NsV3B0MkovMWRscEt2ZEh0ZlVkdEI1dVhDVTY4R2UvamZpRE1m?=
 =?utf-8?B?cGduc25BakljR1h1QWNDdS9qTFE4bG15K3N0cWVTZm1BbGdnWXFXejBsdW1Z?=
 =?utf-8?B?UHFBWVhhekJYeFhqK0xweVhoVStHWmJ1UDI2R2ZsTGlqYTVsU2xnRVBRMStL?=
 =?utf-8?B?K1QweVBOOHJod1h3Uk9ja2RLVUxOanhLbUhKTmZSNklhOXN1WDJzSEI4UEkr?=
 =?utf-8?B?YkhyMDRpWVR1MGlkQlFhQmJuQnovQ0x2d2c5bW8vNzVkWEhoNWNwWlJuSTA1?=
 =?utf-8?B?MG1jZ2Ztd2dudFF2RHlzYWtEMk96Ty9QZm5XaTNjcUQyaFNvMUFUYWZ6QVV0?=
 =?utf-8?B?MUl1U2svSS95Z3Z1OWgxaGc1djFYSmdldlRZc29Yb0VCUmF1OU5xRXl5T054?=
 =?utf-8?B?S2hsaWVPODd4Qk04QlJHbHI2MDdvSktEcE9yM0l3Q2ZJOFFxNWFxUUNMaFc3?=
 =?utf-8?B?VUVXWmtlbHEyaSthU0ZCN2FHWmZQN2lvVFI3NWRhNHFINjFPTDBCcldvUXdF?=
 =?utf-8?B?a2t0UHpOSWE1VUM1b3JyWlE5WXh0T2ZyN0pJdnJSOElKdU5yMXJ1Wng3Y2lp?=
 =?utf-8?B?VDUvNTJsbWprZmErNTg0VnhYN0NScjliQWdvblRkRWVaVGVjZExmM05DYnF2?=
 =?utf-8?B?aGE2dExMQm5OVHBxZkQxcER1TlZWY1JKSXVXTEY0YmtpVksvc05tdkRnMjUw?=
 =?utf-8?B?dFVZSEViNFhVUWtBSlRkdG5JeEROTW9SUk9DKzVsUVdReTZ2TGNFNHMydXNk?=
 =?utf-8?Q?C1Lks8DQPnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTh3MlZkcFFRUlBRN3d4ZDhtRGR1UFZuNEsyOWg2azNxczZjRWNPYk5EaEEx?=
 =?utf-8?B?Y2dyWUhtNFdXcnpHVXhLdFh1RmhsbXlCeWJBb1ZuWmhDOG1sTFVKQURYT2lK?=
 =?utf-8?B?Q2FkRXZVakh3M2V2VGZXU2JMd0hDWkMyL3gwV0dUWEI5Sm9VQVAzdnFUNUpF?=
 =?utf-8?B?cm1COGdXS21vRHJRTkdoL1FMaG44cHJ3L1ZNeUZwWmJaUFN2dldPR1VzSnBP?=
 =?utf-8?B?N3BnNk8zbHlqT3A0cmFFcVlPdTRvaHh1TUI0Z1Boc3BkaXdHbVFSZFNqc205?=
 =?utf-8?B?cnNWS0hzaUg1bW1saG0wQ3YyeE02dUdIc0o1UjlNWFd5NnpEUlQ4L0dCV0Fv?=
 =?utf-8?B?MDRWbmZBSVFqbDBFbitWYkwrWm1ScXZxZEdFTGU0YU1uUEZiT3BjLzJPYlc2?=
 =?utf-8?B?TGVHOVpmRmFDaG5PdGFSYk82cjMvZVA2c1h5dWo1YStCT3F0eHkzQi9hQVVO?=
 =?utf-8?B?Nkc5MUp3RGl0bzR2Z0VvUVl4WGRzQk5DWGdiZEhycE8xZm5OMENCL2VtN2ow?=
 =?utf-8?B?ay9zZzFJWHZZNUhRd09qL0dZSUI2K3RzMDBFbWwyZG1XRGFocU5kaFBXNm9k?=
 =?utf-8?B?NkdTaG5RUi9qYnB6UDNDTHdlbGRScjZtMWZIendadWFLNUg0RDJpdERNQVpu?=
 =?utf-8?B?eTJ5OGJOYlI0MXNRdWxyb1JNZVNYMStybEpUSGN0N1dmYisrT3IxeEFna2Ft?=
 =?utf-8?B?UGF1aGx6VzdSWUJDdWE0MXRaamxseEZKNXpnSlB2WmFVWkdiNnAvVVFGQy83?=
 =?utf-8?B?OGZ6aHBublVub09NNzRJWmJRTy9aNFJMODJjNERZRlg2VWF5a1pCY01oeENV?=
 =?utf-8?B?VTh3ZDlFbG8vY1NDSTVHek1nNmd2VmpSaWlCNjRXaktHMDBhdldGY0RIOTdQ?=
 =?utf-8?B?WlBGMmRPc0FzSWtKVDVQVXFEZ2lNTEY5M05sWWxLb2NtWjQ2L0lKbFU4NC84?=
 =?utf-8?B?SzZmdGhTY0xRazFFTGdPVDN4QkREWm5XRkllaGNMVVJKb2dYRHRsTVBHMm9z?=
 =?utf-8?B?TERBL1dvYUdVa3c3RmFLazRBUGw4SmNwUlBuQ3pMQXp3aXZiNzJPVE1VdGFp?=
 =?utf-8?B?NlNWb2xXc2o2NzlMMmhLYURaTzZMWGloTThvTnZQMkkxdE5wUzFkTHRDWThp?=
 =?utf-8?B?S1RwUyszdEdvWmswK0JCYVppaHlQdGlEcDhhMjdtRDZmYVpudGlJSGVLdy8y?=
 =?utf-8?B?LzhqSEhpL3Q2T3p6NDdlUVlBZG9maVYwSkh0eE84VDJpWklGRDZjS0JFdnRi?=
 =?utf-8?B?dE0wSlRnY0VDOVpLVzFOZVcwbjhSVmtHUzVqWjcyMzNpQXVkMWY3ckNPQ1Fk?=
 =?utf-8?B?OTFxcGc2aCtOdEFkdTErZEZqdDZIQU5jd21UY0Frd21KUFlmbXF2cWFNcE44?=
 =?utf-8?B?eTlrSzNBYU1ZV1VTMEJKd1k1Q254aFFEQnpqZGFpU0FHOVFCclZXd1ZrMFFy?=
 =?utf-8?B?ZWM0SngxZDZtb09LbjRxdnd3NjNIa2RnTm5NcXlSR3BYZGo2am4rS09Lbm1L?=
 =?utf-8?B?RFF2OUNlVklJL3FrZml4SlMvM0lBaUtvb1poaG9yZzFhMXNGSzRDS0hVVGh3?=
 =?utf-8?B?OFZzWEJ0UkY2a2JjVzlIRkt4MFc5QmpmaUU0QWZ5SUduQmt4VHdwV3hTS2FY?=
 =?utf-8?B?K1h3Vnl4US83ZjFiVUhSZGdNSjArNEFNZFNyUENCOGpDWS92ZDJ4MDBLUXR3?=
 =?utf-8?B?UzBsQmEybi8yNktlOVlKNkRkeHB0MC9lTmdmWU40dENVUmR4WlJTVklwME9F?=
 =?utf-8?B?TGhobkxwazBVQWRybVlkMHF4NVRUN0svVzVoN2FDT0V5WUUvT2Z2MnViMTZ0?=
 =?utf-8?B?T0JMclR3cDBEdWQ4c3FMOEdPWUxtckNMZ0J5em1DYlJFTi9VSUJvOEwzNS9h?=
 =?utf-8?B?ekFlN2trOUFXUTY3cXV1QnRTaXptbXkvdnY2WllFWkVEd0RGWE5HM0tCR0Fy?=
 =?utf-8?B?MHo5NGNFWURBM3M2UmlIMWtZQzRHazBsVm1CdUJDUUtsZ2hXQUhzMW04ZVAx?=
 =?utf-8?B?elVIb2k0QndkWm9MQWJUSFA2L0hJeEcrNDFCeFNVQnd2RWhudSs3RUNIdWdy?=
 =?utf-8?B?dng5N3hpTWsxWXFHeXJqcHdMUWdPb0ZiYWZKOXNqU1lwekZFKytsT1BtM3Er?=
 =?utf-8?B?SDYwNlc0ZFNtMHBjUXBNWE0yRVVHN2hXako4SjRiSGdDNmtQUmwyVWtXOVE3?=
 =?utf-8?Q?tC94O30dsMpbS5uPgCeaX+ppTMiX3aW3qlH//O8s3ajE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1383bec0-331a-482c-cc5a-08dd5b24248f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:54:54.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIJsaxQjErijzorULWw876fiRkBnfMxS62YjazOw6Gr+b+CHkiLXRafFIr5ToNYZsgH64KcfISC7V7QZIiwsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
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

It is common to build a u64 from its high and low parts obtained from
two 32-bit registers. Conversely, it is also common to split a u64 into
two u32s to write them into registers. Add an extension trait for u64
that implement these methods in a new `num` module.

It is expected that this trait will be extended with other useful
operations, and similar extension traits implemented for other types.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 8e76ef9b4346956009a936b1317f7474a83c8dbd..caee059249cf56993d5db698a876f040eda33dd5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f03c82f13643412cc13b0b841dfdf3b06490926d
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// Useful operations for `u64`.
+pub trait U64Ext {
+    /// Build a `u64` by combining its `high` and `low` parts.
+    ///
+    /// ```
+    /// use kernel::num::U64Ext;
+    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89abcdef);
+    /// ```
+    fn from_u32s(high: u32, low: u32) -> Self;
+
+    fn upper_32_bits(self) -> u32;
+    fn lower_32_bits(self) -> u32;
+}
+
+impl U64Ext for u64 {
+    fn from_u32s(high: u32, low: u32) -> Self {
+        ((high as u64) << u32::BITS) | low as u64
+    }
+
+    fn upper_32_bits(self) -> u32 {
+        (self >> u32::BITS) as u32
+    }
+
+    fn lower_32_bits(self) -> u32 {
+        self as u32
+    }
+}
+
+pub const fn upper_32_bits(v: u64) -> u32 {
+    (v >> u32::BITS) as u32
+}
+
+pub const fn lower_32_bits(v: u64) -> u32 {
+    v as u32
+}
+
+pub const fn u32s_to_u64(high: u32, low: u32) -> u64 {
+    ((high as u64) << u32::BITS) | low as u64
+}

-- 
2.48.1

