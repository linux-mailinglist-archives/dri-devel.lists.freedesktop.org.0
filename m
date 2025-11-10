Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004DC46E94
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88B10E39A;
	Mon, 10 Nov 2025 13:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i2fSrFwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012035.outbound.protection.outlook.com
 [40.107.200.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687C10E396;
 Mon, 10 Nov 2025 13:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ts/1utFpWAINcTPC05o58MxDboGquAzbESh6Y9aVtEZyr0vFItBOOZ+DFRgLjJL9l7dd59NKl1gsh2dqTckiDaFvD4Ot786ShV0XBusKAqKThvBC5WQkbAkSBmibdTKwVJzn5kddUlBcCJ4z9JWTlMJjZSFjj+fiKvfkBLRj1FW1HdXXE+/oP+ZlblfiQ1ZFYCFb/COLONV73+1yV+4K33zmodmtm/srLAzg/p4ikj+rLCRyqRc2R8OknTqsfN2J9MHV13HDl8eygsBhxQV0eOdoklbfSaReUq2hpfv072pNlNJX7sK5uMJZdj1aD7dkM0hd+Gw4WIot7RTxKeUjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ajdCCfhwRoEYoy+ERqcbzGlxnf+nW7IIcsvQuGAjRQ=;
 b=H0XqBi636OIN5P3Z2pVKBzUCfumSXeC8w6ZVcMdw+5NfI7D6UsEo8BXPE1HhFPi0gZD/VMjYqSJUbg9kJ/l6iQ7FaP9SjWNp39Ra/uJxasQMqeDhYe75Pb4xIGL1QRaWbp9J2AZff6K2EUNwGvSMi7evBCL24N8Gb5Aj+wGOe7pMrUFEWT3vPBLlk44arsVhJS3IkYkxxPbQIcW+OpAzmrfH/BFBFPheYR69IJokyTG3+n96B5I1+qtYnvNAmezpTTs/i/ZEdQvkOFPUcbl7d3lLHUVtwhWFtebUB+3SXQTPC3F2jSNhL5qMUu+cUDD6L7Fix3/IEnkrs8B11MDMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ajdCCfhwRoEYoy+ERqcbzGlxnf+nW7IIcsvQuGAjRQ=;
 b=i2fSrFwLE4WZsyevxGeFXYe13Av/LuH5r40EZQfOwazens7wzj4ax5/ZMrZsalZGKOjkq9+hGflUwFTlKX5Zz0LnFwWq6GJO3FFzcWmb9jyja+WTKiUINyzDyCPaaDcpLuMJm6fd2B145Ru7bolpGcTBaawTgrNgfWdK5AzEJxBNe7idYEzG6GKyCoAoRilaCcL0ZnPHhZob68hbVcjbs1ofeyxeLABULpEeSYrZ4edpwdc72FHjruYJk5unjFiWkjXJsYRhkLqHiDXCQoObk0tiTR24dxEVTpcow5pp6VYurH+2YdjTSDNKxmB07veojJgbP+6GhISIV9plumjp+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v9 00/15] gpu: nova-core: Boot GSP to RISC-V active
Date: Mon, 10 Nov 2025 22:34:08 +0900
Message-Id: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDpEWkC/1WMwQ6CMBAFf4X0bM1SCgVP/ocxpqUL7EFKWtJoC
 P9uITHocV7ezMICesLALtnCPEYK5MYEzSlj7aDHHjnZxEyAKHMQivdhehjnZt5WxoCsdQESWbp
 PHjt67anbPfFAYXb+vZej2tZvpDkiUXHghRRC6U7bQqrrGMmSPrfuybZKrA8zh/rHrJOpwKhKI
 Fpbwp+5rusHFhJBGNsAAAA=
X-Change-ID: 20251027-gsp_boot-c6bb048a304e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 390d79ac-2e3f-4e11-f50d-08de205dda13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFnSXJXSVBHbmY4eWlwWUNwemZCNlBHYk1RODdCUFRyM2pTWU5zdFBHeWV3?=
 =?utf-8?B?ZGt3ejBxQUw2NFJIYWc0ZktLV0hPd0l0S0pkd0tSaWtydFFWeVdKTWxnalh4?=
 =?utf-8?B?RE1UeXZlc0VubDlxdnNXSk9yN2VBNHd2dXFaVXF5azZUdGtKZnlnZEJGWE9x?=
 =?utf-8?B?V2V1cjFZb1FIMUZWNXNhck1oby9yUm50TVVqSU1GRXhhRHIyT0xzTjJURVpJ?=
 =?utf-8?B?dllTRERwY1RrUzJJcmdkNzJIV2J0VEh5R1l3TXNzRk1MdnRaOExXeFlQMnVW?=
 =?utf-8?B?NHdrYTQ0cDJWQXdZV3dJNGRuODYvTWRCa1JXYzlNaFNwd1lOUmVOWjFyVFhm?=
 =?utf-8?B?T1lNbEpOTy9vdm1FV2NSK3g2YW5SZm9YeDhyMkNzKzJPV1NqcmhEQmgrZjg4?=
 =?utf-8?B?OEIyQ0txbExOWHUrNEZzcFVrZ0NzRzJuc1ZRUkhKWE9WbWNRZi8vVVNOeDJH?=
 =?utf-8?B?b1hES3BzYTVwWHpnMitqalc1NWFWNHZoV256TlhwYnhoVVRIbEJuVk02WC8v?=
 =?utf-8?B?MWNHZ04xMTZ3dERQaXNZSmExT1F3a2tMcXJGak5JR1Qwc3haVGxzWm0xeGZK?=
 =?utf-8?B?TU5XdWFBK2N2aXM4ZGJFNWovaFNqaU53dXZZbjdWVzByV1F2Vk9URmkrQ2V6?=
 =?utf-8?B?SnRTRVhsY2hSbXU0d1UzRG1taytjU3VZTkloRkJEV2tVb0xZZ1FJVjE3ZUM3?=
 =?utf-8?B?RWUzTEV0VGRFK3p2ZytyOFpDeEs5NjdyV0RBYjFRZ3ViUWNyc2tyOXM3U0pT?=
 =?utf-8?B?SzArVEp1WlM4eklHRFcwMVZJLy91dm9pTHQzeGt3bk5qU3JlR0wvRDAvYzRY?=
 =?utf-8?B?ajN4eEZLNzUvVEcwMjNmZVd5Q0h0VHlISE15aUZSaWgrbFlxWE9xaGFWcTB6?=
 =?utf-8?B?azBLUXVPZDRhNkxZc1VjWlVjUFlHOVJ4MWY5ZENkU04xMzJxMVhGcmtJZzds?=
 =?utf-8?B?RkdxUGd0MUZ0c1BDWHRJalBOd3N3VmRYazZidkRPVy9DOERwSTBacGdmN0NI?=
 =?utf-8?B?dWdyRzhTMFo0bUhJYk9KTDRXeU94UmJVY3BoUC9nZlg1M2IxR2lXQ2dXUXpm?=
 =?utf-8?B?clBTTEFUcCtUTTBZRHhXaGd3TGJJbkJycEp1dnVRTkFJS09SMTFRUUREUnlz?=
 =?utf-8?B?RDRMU1RnVkRoL2sxZUpXSVBkVFdNQ1pPZHlzQWxnZ2wxdGxGc2VjUmtSQUNH?=
 =?utf-8?B?OTByOUtlLzlOK0RjMDdUU28rRGNKcitIZjZJMDFwSzBUNkVyUHNuV2c0OVFJ?=
 =?utf-8?B?emRUdGt2TTByQzRqM1liRkVyOExjS0pyNnlPc0tlNHlOdU9yM2V6SmdVSFVu?=
 =?utf-8?B?aGplbnNWSG5adG1kWCtIMlB0R3JUZElDdGFVQXBBaU9BWmtoNjV6c2szVnJk?=
 =?utf-8?B?a3RqVTN5YXMwSHRTVUtrUEYrUkM4L0w2aDRwTVJxV1U0UkczNXozdnFDSHU2?=
 =?utf-8?B?VTQ0VFhIRXhRak9KR284aEFtNDRVQlhZV3NMSENFN2dCU3YrYlIzL3h2RjdD?=
 =?utf-8?B?SkVHeTFjdnFWTjNnd3diVERmRm0ydFNLd1kyZU95KzhXTUlJc1BPZE41ZWpL?=
 =?utf-8?B?OFBXV2hjMkhPVWhCQVhXdlBxT0d0UjhWTFZFb2xXbEtyYTdwN3dvYWtmODlx?=
 =?utf-8?B?TzJWTmIxc0QyRW12S2xFSC9YeWFHU0JDSDF3VHZXdlJsNVgzRHRsVnk1RlFJ?=
 =?utf-8?B?VkdqSlF5NzB4eUhCTjF5L3RGelM3Tm9RNUlVZzczZnhGVklWNzVKT2c5OUlN?=
 =?utf-8?B?WXJ1YmJmdUhWSEJlU082ZzEyZGxCR3k0TnJHQ2dSQy90bmUvaTBSY01iM2Vu?=
 =?utf-8?B?ZGRBVm9iNHZpZDdINCs4emNkWGt6QU01djVNRVBiV1FVbTFvVEdFQUhiV2Yw?=
 =?utf-8?B?S2RpcUxpaVpnRmFzU2dGN3RTRWxJUnNVeUE4VlVjU0RGMG4xeUljNWwvZ3lh?=
 =?utf-8?B?VW5hamJkMHEwaWZ0aEdTM3lDRytUMzNWVzRDenBRdk44UlRWbWhnbjd1UWJ4?=
 =?utf-8?B?c3YraXA3YWN4aWZlK0JvMCtHK0hPcW8vMlozdVdxWkpRSWtnd09MNWwwS1Nx?=
 =?utf-8?Q?ORWkiI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXNncER2cVczeFhnNTN1SHNsTTlDdUNVTXZqanZGL2NaUWRvSnVXQ203UHRl?=
 =?utf-8?B?ZjRic09WTGdpQWNNMmcyQ1lMais5MHBHSHhVSjFIYXp2VW5hVzdtOWhTL2k1?=
 =?utf-8?B?R21xbDZJVWRUdGs3Ukd4V09QQnAxc0pPbkZYYkZZSXJOQVUvLzg2b0V0ckRw?=
 =?utf-8?B?QUpDVlQ0ak9qQmlvM29SYmNjYVZDYzhMQ1ZVNUV1OXBFb0dmTjdpTW52a0tR?=
 =?utf-8?B?Ly9ZS3BaaGlNcVBPbHo2SVhubnl4eEd4S2t6KzdWaEMycmVVS1NiVjVZcTFC?=
 =?utf-8?B?dHo4T1FTVjUrQ0I0VUE0cm9DLzJkbFVBcGlLcTdYK0FVSE53LzNWUWJwZXUr?=
 =?utf-8?B?T0ZxR3lsSWQvZ2djbDFWSG9ndTBKd2wzVHE1ZlpBTGM3MWUwTTdzUzE2MDla?=
 =?utf-8?B?ZFhzZFU3a2t4dHpiOFRId3hNZUxTTHJtUFkyM0xMMitHTmlKeTFhU2M4R3l6?=
 =?utf-8?B?M3VJUTZtc0ZvRW10WlV2ckZDWmVZOVdLQjd6SzNnWlAwaUlKVFowQU1zbDBi?=
 =?utf-8?B?TitVSUhNYjE4MThjOHJlYXBmN3JYY1ZnNTJHRzJQVUpuSnZ1bE5qNEZVanp4?=
 =?utf-8?B?ZlFpVk1vQjdVMjh2Z3l6RDUyVUlNOGhYbkMvb05DRWJ2dis4Ykd0a0Yxckt3?=
 =?utf-8?B?K0xtSC91bUpKM3IzQW9QQlF4ZVJISktFUWJrZE41UFo2aG9IcktORGdZc2ov?=
 =?utf-8?B?MW14ZU5LYmFlclVSTWpsU1BvcUlYVXpvN1ZpYWtjWEJOWmFvanVQQUZrQjVT?=
 =?utf-8?B?YWF5Uk9uRDN1aGdud05BTXdmU1ZqcHZiYWNYS1JmWjMyYkJXcXY4NXJsL0V1?=
 =?utf-8?B?SmtzbHNUV2xYYU9OWUZHQ21vTkV4MUNRRjVBcEJoYUJMM09ZdFhMVVA5OE1V?=
 =?utf-8?B?Wll0OFRBVkVCM2x6b1pPVWNMTncyNXJMSnFrdW84SDhvcS9FVDVIblJwMzk5?=
 =?utf-8?B?U2RBeUZjSXB2eEdNeDlocFVqdTVpYXpNTTFlcHlVOXB1anB6aHFPOThXelpE?=
 =?utf-8?B?YiticE9mRWpLbHhlVlFkcTZHVDVGRjFlNGloQXp1KzNpa0c2UWx5MWN3VlNk?=
 =?utf-8?B?YjF5aCs4a2pXSERwT0tFdCs5RXpLczJUenFUVFE2TFl2dkVJOGd0YkRKeEdi?=
 =?utf-8?B?bHVIMzB2QTJpdTVTdCs0a1FMNlBaS2VZN1kvWXNYcHMvUG5VVHJsaEdoamtQ?=
 =?utf-8?B?Q0EyWDB2YUFUNzhSdXBEODlhdkJMZ2JTelV2c1dDd014MFpuaDY4MUFDM0lm?=
 =?utf-8?B?TS95c0N3bUJlQnpvbWUxV0hIRE9obVkveDkrRWljcHV1NGxkZEFQM1VmeWxu?=
 =?utf-8?B?V1FwV21mSTBOQlVDNjh3U0NweUk2Y3l5dGtYeXZ1NFg4alpVVVQvT3RRSDFT?=
 =?utf-8?B?T1NBdnVJd25GMkxhQlJNT3kwNkgxeWdkaVB0T3Q2QlV0NU55Nko2alV0cUc0?=
 =?utf-8?B?MjVwOEFLNTRscEpMZHNWVUZUeXFPay9QRGc4R1dBMklXa0YwblRaSE04TFFl?=
 =?utf-8?B?enNUMG5tcEpnZUMrUFlnVVJQcjRITmFBVkZSVVdLUWl0YSs3ZXRrTWtLRFdK?=
 =?utf-8?B?Y0VpdGFFeTlHZ0JWcWVwYlhXSm9pYkY0ZE93ZWpSMTU4ZkZMS0JwVVBZV29G?=
 =?utf-8?B?SlJ2NnNTTDRpRjlpdFdadkRDU3VGNVhSUkJFN0VTMGVTM3FtTFMzTHROUlFk?=
 =?utf-8?B?SFlrM0Y2RmNwQ01kb1JEZ1Y5bHB1RGcyU1d6VGREcmhOYjZma2ZDMFFadzhD?=
 =?utf-8?B?REJJa0FQM0tydEdObTJKVUtYSVY1TGIwZXpVYVprWXdxc0l3NkFDMHBoNzN2?=
 =?utf-8?B?Mi9xd2hpVkxISlVpSHFKbStMSVhLL2ZjRHhSMUQ0MmYrelhZMkpvdHhIZVRp?=
 =?utf-8?B?VjVIekUxMDl6WEsxZ1poV2xqLzJhQjVEL3lPT2p2TDB2RDZjOVA1L1hORHdm?=
 =?utf-8?B?bEIwYWhwYjY0MFZJUHVPWUR2SDZBZW9XRzNYMFc0UmNQODlJMTBNTU9hT1pY?=
 =?utf-8?B?V2t2Z1NUR1h5KzZwTnBJSlVZQlNpRmlVZ1pRMkRRUDJoV29OQ3R0U1JjeEpa?=
 =?utf-8?B?a0NEcHpJNWxTK2tNOTl5dGFzazFtRUJsSDhheUY3ODNUdXNzc2R5MkxUNm5U?=
 =?utf-8?B?YzAxWWwwend5eUVrNE1TWWpnWThpK2VWUVB5ZHdPN3lFL2tDTkptVlZrWEhW?=
 =?utf-8?Q?eWVIh+Z2H+9l5pTpO4zs71fzIvys2RbeXGawB6pr04M7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390d79ac-2e3f-4e11-f50d-08de205dda13
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:19.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Enk1Z9OneffiTWIsPKQPIGnCVIsQz6SV80/45dHQGQrPpfcyu4/H20KwZvNgiTq9sZX1wlVL583ZvWjatYHlWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

This revision features a more adequate method for receiving messages,
and some general cleanup. It looks solid to me, and although there are
further minor improvements I want to eventually see I think it makes an
adequate first milestone.

I am considering merging this before -rc6, so it can make it into 6.19.
If there are reasons not to, please scream. :)

A branch including this series and its dependencies is available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/gsp_boot

Changes in v9:
- More doccomments.
- Use the `MessageFromGsp` trait instead of an arbitrary closure to extract
  incoming messages from the message queue.
- Split the message receiving method into a non-generic transport layer
  receive, and the generic part validating and constructing the message.
- Use well-defined types for sending and receiving messages instead of
  error-prone tuples.
- Link to v8: https://lore.kernel.org/r/20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com

Changes in v8:
- Add lots of doccomments.
- Refactor and simplify GSP command sending - now uses a single trait
  and a single method.
- Leverage the new `from_bytes_prefix` family of methods to simplify GSP
  command queue code a bit.
- Simplify RM arguments.
- Split the `GspSetSystemInfo` and `SetRegistry` commands into their own
  patch.
- Add a `is_empty` method to `SBufferIter` and use it to detect when a
  command's variable length payload has not been entirely written.
- Harmonize imports according to new format rules.
- Link to v7: https://lore.kernel.org/r/20251029-gsp_boot-v7-0-34227afad347@nvidia.com

Changes in v7:
- Remove `as` conversions by using the features of the `num` module.
- Add build-time conversion of constant integer values to smaller types.
- Thanks to the two items above, make more functions infallible.
- Remove unneeded `nr_ptes` member of the `Cmdq`.
- Use `repr(u32)` for `MsgFunction` to simplify it.
- Use `from_ref` instead of casting references into pointers with `as`.
- Add message header version type to remove use of magic number.
- Switch some parameters to `usize` to limit type conversions.
- Add comments for undocumented functions.
- Remove `function_number` method of `GspMsgElement` and return invalid
  function numbers as the error value of `function` instead.
- Work around the renaming of `slice::flatten` to
  `slice::as_flattened` in Rust 1.80 (thanks Miguel!).
- Fix clippy warning with Rust 1.78.
- Link to v6: https://lore.kernel.org/r/20251017054736.2984332-1-apopple@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      gpu: nova-core: compute layout of more framebuffer regions required for GSP
      gpu: nova-core: num: add functions to safely convert a const value to a smaller type
      rust: enable slice_flatten feature and provide it through an extension trait

Alistair Popple (9):
      gpu: nova-core: Set correct DMA mask
      gpu: nova-core: Create initial Gsp
      gpu: nova-core: gsp: Create wpr metadata
      gpu: nova-core: Add zeroable trait to bindings
      gpu: nova-core: gsp: Add GSP command queue bindings and handling
      gpu: nova-core: gsp: Create rmargs
      gpu: nova-core: gsp: Add SetSystemInfo command
      gpu: nova-core: gsp: Add SetRegistry command
      gpu: nova-core: gsp: Boot GSP

Joel Fernandes (3):
      gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
      gpu: nova-core: falcon: Add support to check if RISC-V is active
      gpu: nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs                   |  16 +
 drivers/gpu/nova-core/falcon.rs                   |  15 +
 drivers/gpu/nova-core/fb.rs                       |  72 ++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   7 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  11 +-
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 156 ++++-
 drivers/gpu/nova-core/gsp/boot.rs                 |  85 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 680 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 129 ++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 608 ++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 106 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 703 ++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/num.rs                      |  51 ++
 drivers/gpu/nova-core/regs.rs                     |  17 +-
 drivers/gpu/nova-core/sbuffer.rs                  | 228 +++++++
 init/Kconfig                                      |   3 +
 rust/kernel/lib.rs                                |   4 +
 rust/kernel/prelude.rs                            |   3 +
 rust/kernel/slice.rs                              |  49 ++
 22 files changed, 2918 insertions(+), 34 deletions(-)
---
base-commit: 80b3dc0a5a2e51fb2b8f3406f5ee20ad4a652316
change-id: 20251027-gsp_boot-c6bb048a304e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

