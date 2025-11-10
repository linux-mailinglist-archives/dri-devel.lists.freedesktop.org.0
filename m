Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D84C46EDE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8BE10E3AF;
	Mon, 10 Nov 2025 13:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G8yCBGmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866610E3A9;
 Mon, 10 Nov 2025 13:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9ilXZ7NCDi+hR+3ptJhJg+Eo8Afuw8iS/5FdOG68oyBGHTQyKgaeUYczHffP/fsxvr6/L2ypF8hqg/a6ZWTl9c5ZSC46ZQVKOQJMMmuqoQ59T1S487MlNJ1153OuZFkFtj9bxUalH1MASsT9Wn79ucK9e3s/jA12gWoMoOXYCbKsyj9oCVo58NS1/MPlEIY/KdZYb3NGgezRMxDT5jgwq7htzCimK4esOOk/kUZhC7EexnDnT13C9S1sV+U9Zuaxo/QQfd18WIcDnVXHMc4IcbUoLx/aAlEJxjqWtpN55OZ/LbJ1vrek2hZE+6bqGk71kxPDfpV1s1j9gTs5YZ62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ1kZZM3dx424J3ArRXvhbCr2S0C7duZb9qRZrNNW7U=;
 b=JQQkxjmDDAhDBK0K8ox9rHx7YDXqrBPD8gZ+VM2wD/0hdO6oWe3oo/faO/ZPTNUNF1adBeBMvrHYGreCNpXKjhpdJZxM9d8Djcu/WSJTuOL9EbxwBrkUJixQ1A+SKPlzln/+bixY+eKtnJy+q/DKKDGumLZ9JWmU7EUhV9x9LDONCaKLVYs/sKyY++K4h2z81eokKxxefRdNrXdq/kRVtrCBWVIjM9H8sMA4gGXHFKlJtmxalbz8/hhn6WQUG/Q2W8SbGXsIRS98kfI0EGutspnk9RN/sXeKhlDXZr88Zk1Ph6h968lyuIkLGk9d2k4v0NhLEkXIr0nNqc5X2gv6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ1kZZM3dx424J3ArRXvhbCr2S0C7duZb9qRZrNNW7U=;
 b=G8yCBGmuVHwVSs3p2uNjCK7a+uPBsQamvv/u5aI9v+0fC6UVUFkPK5PcV7jN/eu2J5pYgkZCxudp4k6UWjgZsh3ae+Bng2H/JTnpGPH1iTC9scAh7/wIstLacujX3AVNs2+WjQSnNJlXISL9n59YZNdVc5XNS/nm/dS+JB7Fdvwgz/Edrr33Lwyd7bwbXws1Jkm/m4hTlnxn6NKZiaBme7PfkfSyjiCUcR2qLtbbKrOsnWXqPJFXMbhGHrMvNHoNIZcahdQsFqToX0+6T1OawZ5+OMdKe4AmUTLdfUifAdmwBq/vg9vauTOTy9pKuB47NaAH1XRKhsqG0jxXcXogtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:17 +0900
Subject: [PATCH v9 09/15] gpu: nova-core: gsp: Add GSP command queue
 bindings and handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-9-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
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
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0248.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: b94b08bd-9d7c-40f3-aba2-08de205deea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukoybi8vdVlkeFBVUEYzcGRUaHppTDJiaXp2L053Qm5JOXdBZGRiWEhueGF4?=
 =?utf-8?B?am9uVVA0Y0o1SXQ4ZXFpWHRhbThvdHFVTUp4WStDVjBESktQcUVWeG9WUkVh?=
 =?utf-8?B?VHAxbVZzTitlUm8wMDl5WmNDQ0w1My95eDlOajR0NERITW1FcWVLTHZmZ2Nt?=
 =?utf-8?B?UFV2aUx0M2NiNmxZYjdxMksxYkErYlNFaWZCWm1zcVBySFRPU3hUb2dMWVFD?=
 =?utf-8?B?Ly9odDFtQVBuYnJ0V0dIT2VmNldJZ01ucjVjZUVPVjJjMk9Oa1FLZGYrckhL?=
 =?utf-8?B?ZDRaUmpmaVd2cFI0SUcrTEZYcHg3TU9nNHJ2VS82V2gzRFZDL2crZngxU3o5?=
 =?utf-8?B?dURhcGFraWpqNzZwRmFYOWFJVEZvZmZSS3RiTWRaZ3h3bEw5bjNyekZQd3RR?=
 =?utf-8?B?TXNWZGkzZnZUbS8vS0ozMHJpclpHQjVtWlRJeE9NdFBySkpwRWYzdUgwTVl1?=
 =?utf-8?B?cHZsM1BsamRMVHNvMGRHVmEyNVVjdktRQ3owckxOM1RLTVNEYzVWd0JDMjV2?=
 =?utf-8?B?MFdZS3B2RUdNdFNZaFRKR25yejNQbzFDaFVETEtqSXMyZVIreEdKaitJV3g1?=
 =?utf-8?B?Z2JvTDNSR1FWL3YrbDJucDBqMHdVNFlNZENGMXV6WTIxcUpLbTY3UmdCNndE?=
 =?utf-8?B?cWdVdU1MeWxMOFFZeitaeVNFOXpXZHg2UHVvcGVRN01lT1gwa3RHTXdJcVhJ?=
 =?utf-8?B?MmVkUjdnSFExSGYzZjBBQnpLZ0piSEdrSmY4a3hhRmhzZHp5eWpMTnhqOHJJ?=
 =?utf-8?B?WEVzbzRxVW80YXZLUmRIMXV3cUR6eFJBaHQ3azBZY1BRdTk1TmMvcUg4UXNa?=
 =?utf-8?B?aEVRSVVXSUNmNXV4SVVFOUZRVW5XdWJKTmI0MTltb25mUUJOaGdhUXE4dnpG?=
 =?utf-8?B?Y25HRWF1YmxjclR1VEhubzdDdVBhbjQ4UVp2TlRXS0FjSDFSdnpwd0N1S3pa?=
 =?utf-8?B?NEplNVNjNkQrVHA2ZDViUFYyWXZPbG1QLys2SUNsR0wwT3llU2wxM0U2b3Rz?=
 =?utf-8?B?ZysrY1dheitESUN4NnAvZzRBN1VRTUs1M1VHSEhEb1dQYjN4WDNXNjAwcjJh?=
 =?utf-8?B?dTE5bnlDMUVLQ0g2RzJTZXNYZ2pTaEprczI0VTM1OXI2QnRNVGpTeHZjeXZ5?=
 =?utf-8?B?UjB4emswU09HR3o0K3QrZm9xSVA2Y2w2OGwxd1RJYjM4cFZoMk9xVDYvcXN6?=
 =?utf-8?B?Lzc0NlBhZ1NmRXAycnYwR3Btd2gySVVBVEgxL3BVSFRDbUxacG9PV2ExMXhJ?=
 =?utf-8?B?V1ZyK2ExRXEzUm9ubUQ1UGc2ZHMwNHU5ZUd1NjFJWWg5TmpSUUQ0QjlFaXQw?=
 =?utf-8?B?MGkxajRDb01veXlZcHA2U1FZZU5SMmYyeUJYVWNNNTJKcUVEMnlucVFhUUVj?=
 =?utf-8?B?NktlZ2diZDNBRmdqdzEzbkRRc0FWU0NubWRQeTRqOEhvb1dPUVFPdEZWS2I5?=
 =?utf-8?B?ZGprL0l0WXFTbWVRVXIzdWhMcktGb0ZjUm5RTWtGV3ZqSXZPeUJ1ZkZiTVhi?=
 =?utf-8?B?RThXU2ZyZmNtcUdYRDVWdlNzZVRRb2owYW5weXZBNzJ1d1RXOVlZNVI2SHc2?=
 =?utf-8?B?WnQ0TWxsRWlSRy9tVXFzNHZ1TjRES1E5UFNaZFIzMTdiRlVOZE1TZG5lTnFC?=
 =?utf-8?B?WXNjdk40ZGxyNytXbHpJZW5sdGRZeWd5bXU3dVg5b00rTGQrcGxwWTJ1TFRV?=
 =?utf-8?B?TVRTMXUrYXZrT0hMVkRScTQrUnpLKzFiU2pGcGdUMmRabWs5a0txU3gyc2FC?=
 =?utf-8?B?SWg0NmdiM2FPL3MzUUZHcG5Xa0Q4TE00MkVqeldYalpNUzRYbTR5WlBoV3pS?=
 =?utf-8?B?R2lvc0FNT0FKQ3FRVW95YXdPZWozdUxPZlo1SmYyMzdSSkxzaEc0YVE5OUNF?=
 =?utf-8?B?cC9obkZiQ2h2dUpSRUQrSWx3czg5YkJmblZucGhQOHRyQ0hKb1hXbGxOWmVa?=
 =?utf-8?B?VjJOZnBLa09DSkFoV21KdDZkdUkvZ0VZb1pwQk9uanJBSjZOU0FIUmUvSmpx?=
 =?utf-8?Q?1Y6JXbamhVtDH3x4Ly0o77ZzCU8LAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhBcHp4RWx2RlFmSm9sMWFZUWZmRDVoTk04cjNFUHNVanZKakhBbDZTa3Zw?=
 =?utf-8?B?R3NuVEthRUs0OHVrR2JRaTVEeSs1NVJmV1duWFRmazYySkFINVcyRmoyZjgv?=
 =?utf-8?B?QVdMYkFGZ1BNYmk5VkdUK1R1SFJCQ29qbUxSNVlwbWFWSm9qZk9SWHRLZ2pz?=
 =?utf-8?B?anV3YS9jYS8wYTdlb1ZKejJCcmlpaVpLdTl1dld1bERBeFJreEFJS2dHZkFp?=
 =?utf-8?B?MVNZSzRzblhHQWtnZEhXRTFGcUNSalU5VWRHTGVRTVRrWHhFaWFxdjh0K08y?=
 =?utf-8?B?NjZCZFBOc1RqcFpqSnJtMXU3QkxSUVpBbUV4L1owNVRTYURDdS96MFhpYWFw?=
 =?utf-8?B?YnBMaWdTenQyaWRxbFVGZTAxeDc0M2QyZytPc0tOMHpiTkw5OVFSWUZndWxV?=
 =?utf-8?B?dUdxbzBkREhiL0RtL2ZNeThPci9IcVV1eWh2anh6WDlBSGZEYk5jalRGV05Q?=
 =?utf-8?B?QXBUVmpoMnppN0pMWUw2dHBPcDl3VnA1SHQzYllNbmlvM2tnNGRJQXh3aVVx?=
 =?utf-8?B?NlF5c3orTDhERE9tTnR4dG1FR0VIdXl3QVpmSjM2ZWNRRXZHRStMVGZ1WGZW?=
 =?utf-8?B?bG1jMjNMN1c3MXg4cUpYdXg4QnpZdTI1dEk4ZUtVcW00cTlHUm15K2pMY0JU?=
 =?utf-8?B?cXQ0WXgwVFN3L1Z6UkVKOG55ME5RcDFXbzdXRzBSOTRVbjkyV2ZuWDZRMmEy?=
 =?utf-8?B?Q2QzRUppRHNSZGxzUXFRWFdYTk9hWDhUNFFUNUpROGxxVHV4eVZ4UGxCd0x5?=
 =?utf-8?B?RGJ6NUhyM1hhTC90YldsWDk5anM2U1dFekhZNzJoTUwyd3FkTXNmWlc4Uzc3?=
 =?utf-8?B?Vmh1OHZhUlJOZkxMNENZL05WOG1kVUxudDdzVEZhRFZMekQyUm9aUmJsTlpH?=
 =?utf-8?B?T1dwTkNvMHNEaTZsa0d4a1lhV0JQdDA1T0svWGZVaTRmU3owVUl4MmROejR3?=
 =?utf-8?B?ZDZLK3lodE9UUlJQd0YzM1BKL1FuWEhjN2QzUmdHMytRVk43ejVoMllDYmJ0?=
 =?utf-8?B?VkJRUVdjUnFnMFRQdUlvSFBpam9Fa1dsWjVDWUNNZVAwcEZUZWY0VkNCazJi?=
 =?utf-8?B?VXNLemRxdXowbVo0S3dnYTEyOVJSbEQ4ODl1MkhHa1UwNVI5NURzeTZ4cDdG?=
 =?utf-8?B?cXRVWkxBbEVMSnhieUlGZzdvaXhJZnFTVGNTSGJnaFZFeUgwTUJEbEN0QkdE?=
 =?utf-8?B?MkJFTFNadnNndXJFUWlWam9KSTUxeVN4Wmh0eDFKZlppcC95dDloSG1odVRI?=
 =?utf-8?B?OGVOei9NQk9QakpWOE5OR3Ewdm9zYmFha2lpL3djNFpHZTI3MHZUOC91VDdD?=
 =?utf-8?B?aU1lSVZVSjQzVmUvYjU5SGV2NjZ6Q09xaWgxM1FaNEpPNm1KM2R1UlY4SmFU?=
 =?utf-8?B?TjdKOGpuOWJsNGhnRWdkand3NDBPbUZscmhFclgzS3pFb1RTam1KcS9NMzl6?=
 =?utf-8?B?V25mUXhYMkx2WHhoUkFscFppQ1NZczhSQzNyVXhmclQxT05QZ1ZuVzhaY0N5?=
 =?utf-8?B?WFkvYW4zZG9xMFU0YXgyTkxTN1VxN0JwUHZwTXo1OHAva1ZkZnoxTEN2OVpS?=
 =?utf-8?B?dllNcVBJRmJlako2UEFvc1BXakhvVkZQZlpqZkZSTXQwaWxGK3dVdkxreCt4?=
 =?utf-8?B?Rk1hUlB4c2VPNUljNkhyd3J2bkxCMVVaUUNnMEsvcnNsME5YWVltL1N3NmJE?=
 =?utf-8?B?ZTB3UlpybkNEa2dWdGpMbk5lWmZlQkpXMllrWVJJa0ptQVJDZ0FCblJGcTdt?=
 =?utf-8?B?VjlYRHdjQjgzWEpmbFQyS2x1VkdNeG0xRFpNK1JNVCtFQnp6UVJHVkhxWSs3?=
 =?utf-8?B?UU44Z3NhNHJjZHVPWll2UzY4aURhOUZiSEY4ZDZoQ2lyNXhTb0VBUTE2emZP?=
 =?utf-8?B?MmtCS1BZay9HWUdvQkczdGoxMHJJb2dYMnczV1VZVGcvS3lJRzZEWGZ6ci9t?=
 =?utf-8?B?RHpNS0lIYjZnY2NScnFvMU1vOWJNRkpPMk8wTFJadUdyNUpESWRlekRWSzhE?=
 =?utf-8?B?eW5yRWVWUHpvTGpjN21Fb1cvSzFTN1RNdmYrTm5YeGI3eXd2dkgzajA1cmE0?=
 =?utf-8?B?SUh1L28xUHBYamsvSkdQTE9TTThvUFFIRVhzTHBPejBwMGNsVmhpVG5jN1lW?=
 =?utf-8?B?RitCZkRTRGxaQWdQNXNGVHF2TlJlSlMxL1M3MEJjYTJCK2NxL2U3QUVyRERF?=
 =?utf-8?Q?z+B+bSasOdfYHb+1f0rIt/j+BZzC5ehPQ6uJLC6sqVGr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94b08bd-9d7c-40f3-aba2-08de205deea7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:54.5744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xku4wkJ6td1ck1TlwkwmUdZhXwvZyhV+9fr33ow5NCjxKr8k08RZL9Xl9YXp1owT1fPsW+tsHPp3h+xkOcbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Alistair Popple <apopple@nvidia.com>

This commit introduces core infrastructure for handling GSP command and
message queues in the nova-core driver. The command queue system enables
bidirectional communication between the host driver and GSP firmware
through a remote message passing interface.

The interface is based on passing serialised data structures over a ring
buffer with separate transmit and receive queues. Commands are sent by
writing to the CPU transmit queue and waiting for completion via the
receive queue.

To ensure safety mutable or immutable (depending on whether it is a send
or receive operation) references are taken on the command queue when
allocating the message to write/read to. This ensures message memory
remains valid and the command queue can't be mutated whilst an operation
is in progress.

Currently this is only used by the probe() routine and therefore can
only used by a single thread of execution. Locking to enable safe access
from multiple threads will be introduced in a future series when that
becomes necessary.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |   7 +
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 656 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 335 ++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 409 ++++++++++++++
 drivers/gpu/nova-core/regs.rs                     |   4 +
 drivers/gpu/nova-core/sbuffer.rs                  |   3 -
 6 files changed, 1410 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ec053395694b..f9819a04bb40 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -14,6 +14,7 @@
     transmute::AsBytes, //
 };
 
+pub(crate) mod cmdq;
 mod fw;
 
 pub(crate) use fw::{
@@ -22,6 +23,7 @@
 };
 
 use crate::{
+    gsp::cmdq::Cmdq,
     gsp::fw::LibosMemoryRegionInitArgument,
     num, //
 };
@@ -104,6 +106,8 @@ pub(crate) struct Gsp {
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+    /// Command queue.
+    pub(crate) cmdq: Cmdq,
 }
 
 impl Gsp {
@@ -128,11 +132,14 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         let logrm = LogBuffer::new(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
 
+        let cmdq = Cmdq::new(dev)?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            cmdq,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
new file mode 100644
index 000000000000..c00d9fa9b79b
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::{
+    cmp,
+    mem,
+    sync::atomic::{
+        fence,
+        Ordering, //
+    }, //
+};
+
+use kernel::{
+    device,
+    dma::CoherentAllocation,
+    dma_write,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    sync::aref::ARef,
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::{
+    driver::Bar0,
+    gsp::{
+        fw::{
+            GspMsgElement,
+            MsgFunction,
+            MsgqRxHeader,
+            MsgqTxHeader, //
+        },
+        PteArray,
+        GSP_PAGE_SIZE, //
+    },
+    num,
+    regs,
+    sbuffer::SBufferIter, //
+};
+
+/// Trait implemented by types representing a command to send to the GSP.
+///
+/// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
+/// needs to send a given command.
+///
+/// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
+/// into the space reserved for it in the command queue buffer.
+///
+/// Some commands may be followed by a variable-length payload. For these, the
+/// [`CommandToGsp::variable_payload_len`] and [`CommandToGsp::init_variable_payload`] need to be
+/// defined as well.
+pub(crate) trait CommandToGsp {
+    /// Function identifying this command to the GSP.
+    const FUNCTION: MsgFunction;
+
+    /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
+    type Command: FromBytes + AsBytes;
+
+    /// Error type returned by [`CommandToGsp::init`].
+    type InitError;
+
+    /// In-place command initializer responsible for filling the command in the command queue
+    /// buffer.
+    fn init(&self) -> impl Init<Self::Command, Self::InitError>;
+
+    /// Size of the variable-length payload following the command structure generated by
+    /// [`CommandToGsp::init`].
+    ///
+    /// Most commands don't have a variable-length payload, so this is zero by default.
+    fn variable_payload_len(&self) -> usize {
+        0
+    }
+
+    /// Method initializing the variable-length payload.
+    ///
+    /// The command buffer is circular, which means that we may need to jump back to its beginning
+    /// while in the middle of a command. For this reason, the variable-length payload is
+    /// initialized using a [`SBufferIter`].
+    ///
+    /// This method will receive a buffer of the length returned by
+    /// [`CommandToGsp::variable_payload_len`], and must write every single byte of it. Leaving
+    /// unwritten space will lead to an error.
+    ///
+    /// Most commands don't have a variable-length payload, so this does nothing by default.
+    fn init_variable_payload(
+        &self,
+        _dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        Ok(())
+    }
+}
+
+/// Trait representing messages received from the GSP.
+///
+/// This trait tells [`Cmdq::receive_msg`] how it can receive a given type of message.
+pub(crate) trait MessageFromGsp: Sized {
+    /// Function identifying this message from the GSP.
+    const FUNCTION: MsgFunction;
+
+    /// Error type returned by [`MessageFromGsp::read`].
+    type InitError;
+
+    /// Type containing the raw message to be read from the message queue.
+    type Message: FromBytes;
+
+    /// Method reading the message from the message queue and returning it.
+    ///
+    /// From a `Self::Message` and a [`SBufferIter`], constructs an instance of `Self` and returns
+    /// it.
+    fn read(
+        msg: &Self::Message,
+        sbuffer: &mut SBufferIter<core::array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError>;
+}
+
+/// Number of GSP pages making the [`Msgq`].
+pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
+
+/// Circular buffer of a [`Msgq`].
+///
+/// This area of memory is to be shared between the driver and the GSP to exchange commands or
+/// messages.
+#[repr(C, align(0x1000))]
+#[derive(Debug)]
+struct MsgqData {
+    data: [[u8; GSP_PAGE_SIZE]; num::u32_as_usize(MSGQ_NUM_PAGES)],
+}
+
+// Annoyingly we are forced to use a literal to specify the alignment of
+// `MsgqData`, so check that it corresponds to the actual GSP page size here.
+static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
+
+/// Unidirectional message queue.
+///
+/// Contains the data for a message queue, that either the driver or GSP writes to.
+///
+/// Note that while the write pointer of `tx` corresponds to the `msgq` of the same instance, the
+/// read pointer of `rx` actually refers to the `Msgq` owned by the other side.
+/// This design ensures that only the driver or GSP ever writes to a given instance of this struct.
+#[repr(C)]
+// There is no struct defined for this in the open-gpu-kernel-source headers.
+// Instead it is defined by code in `GspMsgQueuesInit()`.
+struct Msgq {
+    /// Header for sending messages, including the write pointer.
+    tx: MsgqTxHeader,
+    /// Header for receiving messages, including the read pointer.
+    rx: MsgqRxHeader,
+    /// The message queue proper.
+    msgq: MsgqData,
+}
+
+/// Structure shared between the driver and the GSP and containing the command and message queues.
+#[repr(C)]
+struct GspMem {
+    /// Self-mapping page table entries.
+    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
+    /// write and read pointers that the CPU updates.
+    ///
+    /// This member is read-only for the GSP.
+    cpuq: Msgq,
+    /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
+    /// write and read pointers that the GSP updates.
+    ///
+    /// This member is read-only for the driver.
+    gspq: Msgq,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspMem {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspMem {}
+
+/// Wrapper around [`GspMem`] to share it with the GPU using a [`CoherentAllocation`].
+///
+/// This provides the low-level functionality to communicate with the GSP, including allocation of
+/// queue space to write messages to and management of read/write pointers.
+///
+/// This is shared with the GSP, with clear ownership rules regarding the command queues:
+///
+/// * The driver owns (i.e. can write to) the part of the CPU message queue between the CPU write
+///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
+/// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
+///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
+struct DmaGspMem(CoherentAllocation<GspMem>);
+
+impl DmaGspMem {
+    /// Allocate a new instance and map it for `dev`.
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
+        const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
+
+        let gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+
+        Ok(Self(gsp_mem))
+    }
+
+    /// Returns the region of the CPU message queue that the driver is currently allowed to write
+    /// to.
+    ///
+    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
+    /// that case the second slice will have a non-zero length.
+    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
+
+        // SAFETY:
+        // - The `CoherentAllocation` contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
+        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
+        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
+
+        if rx <= tx {
+            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
+            // to `rx`, minus one unit, belongs to the driver.
+            if rx == 0 {
+                let last = after_tx.len() - 1;
+                (&mut after_tx[..last], &mut before_tx[0..0])
+            } else {
+                (after_tx, &mut before_tx[..rx])
+            }
+        } else {
+            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
+            //
+            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_read_ptr`, `rx` and `tx` are
+            // `<= MSGQ_NUM_PAGES`, and the test above ensured that `rx > tx`.
+            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+        }
+    }
+
+    /// Returns the region of the GSP message queue that the driver is currently allowed to read
+    /// from.
+    ///
+    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
+    /// that case the second slice will have a non-zero length.
+    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
+
+        // SAFETY:
+        // - The `CoherentAllocation` contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
+        // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
+        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
+
+        match tx.cmp(&rx) {
+            cmp::Ordering::Equal => (&after_rx[0..0], &after_rx[0..0]),
+            cmp::Ordering::Greater => (&after_rx[..tx], &before_rx[0..0]),
+            cmp::Ordering::Less => (after_rx, &before_rx[..tx]),
+        }
+    }
+
+    /// Allocates a region on the command queue that is large enough to send a command of `size`
+    /// bytes.
+    ///
+    /// This returns a [`GspCommand`] ready to be written to by the caller.
+    ///
+    /// # Errors
+    ///
+    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `EIO` if the command header is not properly aligned.
+    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+        // Get the current writable area as an array of bytes.
+        let (slice_1, slice_2) = {
+            let (slice_1, slice_2) = self.driver_write_area();
+
+            #[allow(clippy::incompatible_msrv)]
+            (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
+        };
+
+        // If the GSP is still processing previous messages the shared region
+        // may be full in which case we will have to retry once the GSP has
+        // processed the existing commands.
+        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
+            return Err(EAGAIN);
+        }
+
+        // Extract area for the `GspMsgElement`.
+        let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
+
+        // Create the contents area.
+        let (slice_1, slice_2) = if slice_1.len() > size {
+            // Contents fits entirely in `slice_1`.
+            (&mut slice_1[..size], &mut slice_2[0..0])
+        } else {
+            // Need all of `slice_1` and some of `slice_2`.
+            let slice_2_len = size - slice_1.len();
+            (slice_1, &mut slice_2[..slice_2_len])
+        };
+
+        Ok(GspCommand {
+            header,
+            contents: (slice_1, slice_2),
+        })
+    }
+
+    // Returns the index of the memory page the GSP will write the next message to.
+    //
+    // # Invariants
+    //
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    fn gsp_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The 'CoherentAllocation' contains at least one object.
+        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Returns the index of the memory page the GSP will read the next command from.
+    //
+    // # Invariants
+    //
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    fn gsp_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The 'CoherentAllocation' contains at least one object.
+        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Returns the index of the memory page the CPU can read the next message from.
+    //
+    // # Invariants
+    //
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    fn cpu_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Informs the GSP that it can send `elem_count` new pages into the message queue.
+    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
+        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered.
+        fence(Ordering::SeqCst);
+
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The 'CoherentAllocation' contains at least one object.
+        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
+    }
+
+    // Returns the index of the memory page the CPU can write the next command to.
+    //
+    // # Invariants
+    //
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    fn cpu_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The 'CoherentAllocation' contains at least one object.
+        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Informs the GSP that it can process `elem_count` new pages from the command queue.
+    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The 'CoherentAllocation' contains at least one object.
+        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
+
+        // Ensure all command data is visible before triggering the GSP read.
+        fence(Ordering::SeqCst);
+    }
+}
+
+/// A command ready to be sent on the command queue.
+///
+/// This is the type returned by [`DmaGspMem::allocate_command`].
+struct GspCommand<'a> {
+    // Writable reference to the header of the command.
+    header: &'a mut GspMsgElement,
+    // Writable slices to the contents of the command. The second slice is zero unless the command
+    // loops over the command queue.
+    contents: (&'a mut [u8], &'a mut [u8]),
+}
+
+/// A message ready to be processed from the message queue.
+///
+/// This is the type returned by [`Cmdq::wait_for_msg`].
+struct GspMessage<'a> {
+    // Reference to the header of the message.
+    header: &'a GspMsgElement,
+    // Slices to the contents of the message. The second slice is zero unless the message loops
+    // over the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
+/// GSP command queue.
+///
+/// Provides the ability to send commands and receive messages from the GSP using a shared memory
+/// area.
+pub(crate) struct Cmdq {
+    /// Device this command queue belongs to.
+    dev: ARef<device::Device>,
+    /// Current command sequence number.
+    seq: u32,
+    /// Memory area shared with the GSP for communicating commands and messages.
+    gsp_mem: DmaGspMem,
+}
+
+impl Cmdq {
+    /// Creates a new command queue for `dev`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
+        let gsp_mem = DmaGspMem::new(dev)?;
+
+        Ok(Cmdq {
+            dev: dev.into(),
+            seq: 0,
+            gsp_mem,
+        })
+    }
+
+    /// Computes the checksum for the message pointed to by `it`.
+    ///
+    /// A message is made of several parts, so `it` is an iterator over byte slices representing
+    /// these parts.
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    /// Notifies the GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        regs::NV_PGSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+    }
+
+    /// Sends `command` to the GSP.
+    ///
+    /// # Errors
+    ///
+    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    #[expect(unused)]
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let dst = self.gsp_mem.allocate_command(command_size)?;
+
+        // Extract area for the command itself.
+        let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
+
+        // Fill the header and command in-place.
+        let msg_element = GspMsgElement::init(self.seq, command_size, M::FUNCTION);
+        // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
+        // fails.
+        unsafe {
+            msg_element.__init(core::ptr::from_mut(dst.header))?;
+            command.init().__init(core::ptr::from_mut(cmd))?;
+        }
+
+        // Fill the variable-length payload.
+        if command_size > size_of::<M::Command>() {
+            let mut sbuffer =
+                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+            command.init_variable_payload(&mut sbuffer)?;
+
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+        }
+
+        // Compute checksum now that the whole message is ready.
+        dst.header
+            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+                dst.header.as_bytes(),
+                dst.contents.0,
+                dst.contents.1,
+            ])));
+
+        dev_dbg!(
+            &self.dev,
+            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
+            self.seq,
+            M::FUNCTION,
+            dst.header.length(),
+        );
+
+        // All set - update the write pointer and inform the GSP of the new command.
+        let elem_count = dst.header.element_count();
+        self.seq += 1;
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        Cmdq::notify_gsp(bar);
+
+        Ok(())
+    }
+
+    /// Wait for a message to become available on the message queue.
+    ///
+    /// This works purely at the transport layer and does not interpret or validate the message
+    /// beyond the advertised length in its [`GspMsgElement`].
+    ///
+    /// This method returns:
+    ///
+    /// - A reference to the [`GspMsgElement`] of the message,
+    /// - Two byte slices with the contents of the message. The second slice is empty unless the
+    ///   message loops across the message queue.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
+    ///   message queue.
+    ///
+    /// Error codes returned by the message constructor are propagated as-is.
+    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+        // Wait for a message to arrive from the GSP.
+        let (slice_1, slice_2) = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area| !driver_area.0.is_empty(),
+            Delta::from_millis(1),
+            timeout,
+        )
+        .map(|(slice_1, slice_2)| {
+            #[allow(clippy::incompatible_msrv)]
+            (slice_1.as_flattened(), slice_2.as_flattened())
+        })?;
+
+        // Extract the `GspMsgElement`.
+        let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
+
+        dev_dbg!(
+            self.dev,
+            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
+            header.sequence(),
+            header.function(),
+            header.length(),
+        );
+
+        // Check that the driver read area is large enough for the message.
+        if slice_1.len() + slice_2.len() < header.length() {
+            return Err(EIO);
+        }
+
+        // Cut the message slices down to the actual length of the message.
+        let (slice_1, slice_2) = if slice_1.len() > header.length() {
+            // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
+            (slice_1.split_at(header.length()).0, &slice_2[0..0])
+        } else {
+            (
+                slice_1,
+                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
+                // large as `msg_header.length()`.
+                slice_2.split_at(header.length() - slice_1.len()).0,
+            )
+        };
+
+        // Validate checksum.
+        if Cmdq::calculate_checksum(SBufferIter::new_reader([
+            header.as_bytes(),
+            slice_1,
+            slice_2,
+        ])) != 0
+        {
+            dev_err!(
+                self.dev,
+                "GSP RPC: receive: Call {} - bad checksum",
+                header.sequence()
+            );
+            return Err(EIO);
+        }
+
+        Ok(GspMessage {
+            header,
+            contents: (slice_1, slice_2),
+        })
+    }
+
+    /// Receive a message from the GSP.
+    ///
+    /// `init` is a closure tasked with processing the message. It receives a reference to the
+    /// message in the message queue, and a [`SBufferIter`] pointing to its variable-length
+    /// payload, if any.
+    ///
+    /// The expected message is specified using the `M` generic parameter. If the pending message
+    /// is different, `EAGAIN` is returned and the unexpected message is dropped.
+    ///
+    /// This design is by no means final, but it is simple and will let us go through GSP
+    /// initialization.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
+    ///   message queue.
+    /// - `EINVAL` if the function of the message was unrecognized.
+    #[expect(unused)]
+    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        let message = self.wait_for_msg(timeout)?;
+        let function = message.header.function().map_err(|_| EINVAL)?;
+
+        // Extract the message. Store the result as we want to advance the read pointer even in
+        // case of failure.
+        let result = if function == M::FUNCTION {
+            let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
+            let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
+
+            M::read(cmd, &mut sbuffer).map_err(|e| e.into())
+        } else {
+            Err(ERANGE)
+        };
+
+        // Advance the read pointer past this message.
+        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
+            message.header.length().div_ceil(GSP_PAGE_SIZE),
+        )?);
+
+        result
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index a6ee52475bdb..ceda61c99b92 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -5,10 +5,14 @@
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
 
-use core::ops::Range;
+use core::{
+    fmt,
+    ops::Range, //
+};
 
 use kernel::{
     dma::CoherentAllocation,
+    prelude::*,
     ptr::{
         Alignable,
         Alignment, //
@@ -27,6 +31,7 @@
     fb::FbLayout,
     firmware::gsp::GspFirmware,
     gpu::Chipset,
+    gsp::GSP_PAGE_SIZE,
     num::{
         self,
         FromSafeCast, //
@@ -181,6 +186,128 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
     }
 }
 
+#[derive(Copy, Clone, Debug, PartialEq)]
+#[repr(u32)]
+pub(crate) enum MsgFunction {
+    // Common function codes
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
+    AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
+    GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
+    GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+
+    // Event codes
+    GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
+    MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
+    OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
+}
+
+impl fmt::Display for MsgFunction {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            // Common function codes
+            MsgFunction::Nop => write!(f, "NOP"),
+            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
+            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
+            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
+            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
+            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
+            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
+            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
+            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
+            MsgFunction::Free => write!(f, "FREE"),
+            MsgFunction::Log => write!(f, "LOG"),
+            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
+            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
+            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
+            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
+            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
+
+            // Event codes
+            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
+            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
+            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
+            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
+            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
+            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
+            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
+            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
+        }
+    }
+}
+
+impl TryFrom<u32> for MsgFunction {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<MsgFunction> {
+        match value {
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
+                Ok(MsgFunction::GspInitPostObjGpu)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
+                Ok(MsgFunction::GspRunCpuSequencer)
+            }
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
+            bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
+            bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl From<MsgFunction> for u32 {
+    fn from(value: MsgFunction) -> Self {
+        // CAST: `MsgFunction` is `repr(u32)` and can thus be cast losslessly.
+        value as u32
+    }
+}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
@@ -235,3 +362,209 @@ fn id8(name: &str) -> u64 {
         })
     }
 }
+
+/// TX header for setting up a message queue with the GSP.
+#[repr(transparent)]
+pub(crate) struct MsgqTxHeader(bindings::msgqTxHeader);
+
+impl MsgqTxHeader {
+    /// Create a new TX queue header.
+    ///
+    /// # Arguments
+    ///
+    /// * `msgq_size` - Total size of the message queue structure, in bytes.
+    /// * `rx_hdr_offset` - Offset, in bytes, of the start of the RX header in the message queue
+    ///   structure.
+    /// * `msg_count` - Number of messages that can be sent, i.e. the number of memory pages
+    ///   allocated for the message queue in the message queue structure.
+    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
+        Self(bindings::msgqTxHeader {
+            version: 0,
+            size: msgq_size,
+            msgSize: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            msgCount: msg_count,
+            writePtr: 0,
+            flags: 1,
+            rxHdrOff: rx_hdr_offset,
+            entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+        })
+    }
+
+    /// Returns the value of the write pointer for this queue.
+    pub(crate) fn write_ptr(&self) -> u32 {
+        let ptr = core::ptr::from_ref(&self.0.writePtr);
+
+        // SAFETY: `ptr` is a valid pointer to a `u32`.
+        unsafe { ptr.read_volatile() }
+    }
+
+    /// Sets the value of the write pointer for this queue.
+    pub(crate) fn set_write_ptr(&mut self, val: u32) {
+        let ptr = core::ptr::from_mut(&mut self.0.writePtr);
+
+        // SAFETY: `ptr` is a valid pointer to a `u32`.
+        unsafe { ptr.write_volatile(val) }
+    }
+}
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for MsgqTxHeader {}
+
+/// RX header for setting up a message queue with the GSP.
+#[repr(transparent)]
+pub(crate) struct MsgqRxHeader(bindings::msgqRxHeader);
+
+/// Header for the message RX queue.
+impl MsgqRxHeader {
+    /// Creates a new RX queue header.
+    pub(crate) fn new() -> Self {
+        Self(Default::default())
+    }
+
+    /// Returns the value of the read pointer for this queue.
+    pub(crate) fn read_ptr(&self) -> u32 {
+        let ptr = core::ptr::from_ref(&self.0.readPtr);
+
+        // SAFETY: `ptr` is a valid pointer to a `u32`.
+        unsafe { ptr.read_volatile() }
+    }
+
+    /// Sets the value of the read pointer for this queue.
+    pub(crate) fn set_read_ptr(&mut self, val: u32) {
+        let ptr = core::ptr::from_mut(&mut self.0.readPtr);
+
+        // SAFETY: `ptr` is a valid pointer to a `u32`.
+        unsafe { ptr.write_volatile(val) }
+    }
+}
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for MsgqRxHeader {}
+
+bitfield! {
+    struct MsgHeaderVersion(u32) {
+        31:24 major as u8;
+        23:16 minor as u8;
+    }
+}
+
+impl MsgHeaderVersion {
+    const MAJOR_TOT: u8 = 3;
+    const MINOR_TOT: u8 = 0;
+
+    fn new() -> Self {
+        Self::default()
+            .set_major(Self::MAJOR_TOT)
+            .set_minor(Self::MINOR_TOT)
+    }
+}
+
+impl bindings::rpc_message_header_v {
+    fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
+        type RpcMessageHeader = bindings::rpc_message_header_v;
+
+        try_init!(RpcMessageHeader {
+            header_version: MsgHeaderVersion::new().into(),
+            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
+            function: function.into(),
+            length: size_of::<Self>()
+                .checked_add(cmd_size)
+                .ok_or(EOVERFLOW)
+                .and_then(|v| v.try_into().map_err(|_| EINVAL))?,
+            rpc_result: 0xffffffff,
+            rpc_result_private: 0xffffffff,
+            ..Zeroable::init_zeroed()
+        })
+    }
+}
+
+// SAFETY: We can't derive the Zeroable trait for this binding because the
+// procedural macro doesn't support the syntax used by bindgen to create the
+// __IncompleteArrayField types. So instead we implement it here, which is safe
+// because these are explicitly padded structures only containing types for
+// which any bit pattern, including all zeros, is valid.
+unsafe impl Zeroable for bindings::rpc_message_header_v {}
+
+/// GSP Message Element.
+///
+/// This is essentially a message header expected to be followed by the message data.
+#[repr(transparent)]
+pub(crate) struct GspMsgElement {
+    inner: bindings::GSP_MSG_QUEUE_ELEMENT,
+}
+
+impl GspMsgElement {
+    /// Creates a new message element.
+    ///
+    /// # Arguments
+    ///
+    /// * `sequence` - Sequence number of the message.
+    /// * `cmd_size` - Size of the command (not including the message element), in bytes.
+    /// * `function` - Function of the message.
+    #[allow(non_snake_case)]
+    pub(crate) fn init(
+        sequence: u32,
+        cmd_size: usize,
+        function: MsgFunction,
+    ) -> impl Init<Self, Error> {
+        type RpcMessageHeader = bindings::rpc_message_header_v;
+        type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
+        let init_inner = try_init!(InnerGspMsgElement {
+            seqNum: sequence,
+            elemCount: size_of::<Self>()
+                .checked_add(cmd_size)
+                .ok_or(EOVERFLOW)?
+                .div_ceil(GSP_PAGE_SIZE)
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            rpc <- RpcMessageHeader::init(cmd_size, function),
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspMsgElement {
+            inner <- init_inner,
+        })
+    }
+
+    /// Sets the checksum of this message.
+    ///
+    /// Since the header is also part of the checksum, this is usually called after the whole
+    /// message has been written to the shared memory area.
+    pub(crate) fn set_checksum(&mut self, checksum: u32) {
+        self.inner.checkSum = checksum;
+    }
+
+    /// Returns the total length of the message.
+    pub(crate) fn length(&self) -> usize {
+        // `rpc.length` includes the length of the GspRpcHeader but not the message header.
+        size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
+            + num::u32_as_usize(self.inner.rpc.length)
+    }
+
+    // Returns the sequence number of the message.
+    pub(crate) fn sequence(&self) -> u32 {
+        self.inner.rpc.sequence
+    }
+
+    // Returns the function of the message, if it is valid, or the invalid function number as an
+    // error.
+    pub(crate) fn function(&self) -> Result<MsgFunction, u32> {
+        self.inner
+            .rpc
+            .function
+            .try_into()
+            .map_err(|_| self.inner.rpc.function)
+    }
+
+    // Returns the number of elements (i.e. memory pages) used by this message.
+    pub(crate) fn element_count(&self) -> u32 {
+        self.inner.elemCount
+    }
+}
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for GspMsgElement {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspMsgElement {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index f7b38978c5f8..17fb2392ec3c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1,5 +1,36 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+pub const NV_VGPU_MSG_SIGNATURE_VALID: u32 = 1129337430;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
@@ -11,6 +42,7 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -19,6 +51,345 @@
 pub type u16_ = __u16;
 pub type u32_ = __u32;
 pub type u64_ = __u64;
+pub const NV_VGPU_MSG_FUNCTION_NOP: _bindgen_ty_2 = 0;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO: _bindgen_ty_2 = 1;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_ROOT: _bindgen_ty_2 = 2;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE: _bindgen_ty_2 = 3;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY: _bindgen_ty_2 = 4;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA: _bindgen_ty_2 = 5;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA: _bindgen_ty_2 = 6;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY: _bindgen_ty_2 = 7;
+pub const NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA: _bindgen_ty_2 = 8;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT: _bindgen_ty_2 = 9;
+pub const NV_VGPU_MSG_FUNCTION_FREE: _bindgen_ty_2 = 10;
+pub const NV_VGPU_MSG_FUNCTION_LOG: _bindgen_ty_2 = 11;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIDMEM: _bindgen_ty_2 = 12;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY: _bindgen_ty_2 = 13;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY_DMA: _bindgen_ty_2 = 14;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY_DMA: _bindgen_ty_2 = 15;
+pub const NV_VGPU_MSG_FUNCTION_GET_EDID: _bindgen_ty_2 = 16;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_CHANNEL: _bindgen_ty_2 = 17;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_OBJECT: _bindgen_ty_2 = 18;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SUBDEVICE: _bindgen_ty_2 = 19;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DYNAMIC_MEMORY: _bindgen_ty_2 = 20;
+pub const NV_VGPU_MSG_FUNCTION_DUP_OBJECT: _bindgen_ty_2 = 21;
+pub const NV_VGPU_MSG_FUNCTION_IDLE_CHANNELS: _bindgen_ty_2 = 22;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_EVENT: _bindgen_ty_2 = 23;
+pub const NV_VGPU_MSG_FUNCTION_SEND_EVENT: _bindgen_ty_2 = 24;
+pub const NV_VGPU_MSG_FUNCTION_REMAPPER_CONTROL: _bindgen_ty_2 = 25;
+pub const NV_VGPU_MSG_FUNCTION_DMA_CONTROL: _bindgen_ty_2 = 26;
+pub const NV_VGPU_MSG_FUNCTION_DMA_FILL_PTE_MEM: _bindgen_ty_2 = 27;
+pub const NV_VGPU_MSG_FUNCTION_MANAGE_HW_RESOURCE: _bindgen_ty_2 = 28;
+pub const NV_VGPU_MSG_FUNCTION_BIND_ARBITRARY_CTX_DMA: _bindgen_ty_2 = 29;
+pub const NV_VGPU_MSG_FUNCTION_CREATE_FB_SEGMENT: _bindgen_ty_2 = 30;
+pub const NV_VGPU_MSG_FUNCTION_DESTROY_FB_SEGMENT: _bindgen_ty_2 = 31;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SHARE_DEVICE: _bindgen_ty_2 = 32;
+pub const NV_VGPU_MSG_FUNCTION_DEFERRED_API_CONTROL: _bindgen_ty_2 = 33;
+pub const NV_VGPU_MSG_FUNCTION_REMOVE_DEFERRED_API: _bindgen_ty_2 = 34;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_READ: _bindgen_ty_2 = 35;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_WRITE: _bindgen_ty_2 = 36;
+pub const NV_VGPU_MSG_FUNCTION_SIM_MANAGE_DISPLAY_CONTEXT_DMA: _bindgen_ty_2 = 37;
+pub const NV_VGPU_MSG_FUNCTION_FREE_VIDMEM_VIRT: _bindgen_ty_2 = 38;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PSTATE_INFO: _bindgen_ty_2 = 39;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PERFMON_SAMPLE: _bindgen_ty_2 = 40;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_VIRTUAL_PSTATE_INFO: _bindgen_ty_2 = 41;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_LEVEL_INFO: _bindgen_ty_2 = 42;
+pub const NV_VGPU_MSG_FUNCTION_MAP_SEMA_MEMORY: _bindgen_ty_2 = 43;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_SEMA_MEMORY: _bindgen_ty_2 = 44;
+pub const NV_VGPU_MSG_FUNCTION_SET_SURFACE_PROPERTIES: _bindgen_ty_2 = 45;
+pub const NV_VGPU_MSG_FUNCTION_CLEANUP_SURFACE: _bindgen_ty_2 = 46;
+pub const NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER: _bindgen_ty_2 = 47;
+pub const NV_VGPU_MSG_FUNCTION_TDR_SET_TIMEOUT_STATE: _bindgen_ty_2 = 48;
+pub const NV_VGPU_MSG_FUNCTION_SWITCH_TO_VGA: _bindgen_ty_2 = 49;
+pub const NV_VGPU_MSG_FUNCTION_GPU_EXEC_REG_OPS: _bindgen_ty_2 = 50;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO: _bindgen_ty_2 = 51;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIRTMEM: _bindgen_ty_2 = 52;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_PDE_2: _bindgen_ty_2 = 53;
+pub const NV_VGPU_MSG_FUNCTION_SET_PAGE_DIRECTORY: _bindgen_ty_2 = 54;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_PSTATE_INFO: _bindgen_ty_2 = 55;
+pub const NV_VGPU_MSG_FUNCTION_TRANSLATE_GUEST_GPU_PTES: _bindgen_ty_2 = 56;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_57: _bindgen_ty_2 = 57;
+pub const NV_VGPU_MSG_FUNCTION_RESET_CURRENT_GR_CONTEXT: _bindgen_ty_2 = 58;
+pub const NV_VGPU_MSG_FUNCTION_SET_SEMA_MEM_VALIDATION_STATE: _bindgen_ty_2 = 59;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENGINE_UTILIZATION: _bindgen_ty_2 = 60;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPU_PDES: _bindgen_ty_2 = 61;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENCODER_CAPACITY: _bindgen_ty_2 = 62;
+pub const NV_VGPU_MSG_FUNCTION_VGPU_PF_REG_READ32: _bindgen_ty_2 = 63;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO_EXT: _bindgen_ty_2 = 64;
+pub const NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO: _bindgen_ty_2 = 65;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_INIT: _bindgen_ty_2 = 66;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLOSE_QUEUE: _bindgen_ty_2 = 67;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLEANUP: _bindgen_ty_2 = 68;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_TEST: _bindgen_ty_2 = 69;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE: _bindgen_ty_2 = 70;
+pub const NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD: _bindgen_ty_2 = 71;
+pub const NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO: _bindgen_ty_2 = 72;
+pub const NV_VGPU_MSG_FUNCTION_SET_REGISTRY: _bindgen_ty_2 = 73;
+pub const NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU: _bindgen_ty_2 = 74;
+pub const NV_VGPU_MSG_FUNCTION_SUBDEV_EVENT_SET_NOTIFICATION: _bindgen_ty_2 = 75;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL: _bindgen_ty_2 = 76;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO2: _bindgen_ty_2 = 77;
+pub const NV_VGPU_MSG_FUNCTION_DUMP_PROTOBUF_COMPONENT: _bindgen_ty_2 = 78;
+pub const NV_VGPU_MSG_FUNCTION_UNSET_PAGE_DIRECTORY: _bindgen_ty_2 = 79;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_STATIC_INFO: _bindgen_ty_2 = 80;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_FAULT_BUFFER: _bindgen_ty_2 = 81;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_FAULT_BUFFER: _bindgen_ty_2 = 82;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 83;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 84;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_VGPU_FB_USAGE: _bindgen_ty_2 = 85;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVFBC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 86;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVENC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 87;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_CHANNEL: _bindgen_ty_2 = 88;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_ISOLATED_CHANNEL: _bindgen_ty_2 = 89;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_HANDLE_VF_PRI_FAULT: _bindgen_ty_2 = 90;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CLK_GET_EXTENDED_INFO: _bindgen_ty_2 = 91;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_BOOST: _bindgen_ty_2 = 92;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_VPSTATES_GET_CONTROL: _bindgen_ty_2 = 93;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE: _bindgen_ty_2 = 94;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_COLOR_CLEAR: _bindgen_ty_2 = 95;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_DEPTH_CLEAR: _bindgen_ty_2 = 96;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SCHEDULE: _bindgen_ty_2 = 97;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TIMESLICE: _bindgen_ty_2 = 98;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PREEMPT: _bindgen_ty_2 = 99;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_DISABLE_CHANNELS: _bindgen_ty_2 = 100;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TSG_INTERLEAVE_LEVEL: _bindgen_ty_2 = 101;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_CHANNEL_INTERLEAVE_LEVEL: _bindgen_ty_2 = 102;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC: _bindgen_ty_2 = 103;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_V2: _bindgen_ty_2 = 104;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_AES_ENCRYPT: _bindgen_ty_2 = 105;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY: _bindgen_ty_2 = 106;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY_STATUS: _bindgen_ty_2 = 107;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 108;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 109;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_EXCEPTION_MASK: _bindgen_ty_2 = 110;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_PROMOTE_CTX: _bindgen_ty_2 = 111;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_PREEMPTION_BIND: _bindgen_ty_2 = 112;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_CTXSW_PREEMPTION_MODE: _bindgen_ty_2 = 113;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_ZCULL_BIND: _bindgen_ty_2 = 114;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_INITIALIZE_CTX: _bindgen_ty_2 = 115;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES: _bindgen_ty_2 = 116;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_CLEAR_FAULTED_BIT: _bindgen_ty_2 = 117;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_LATEST_ECC_ADDRESSES: _bindgen_ty_2 = 118;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MC_SERVICE_INTERRUPTS: _bindgen_ty_2 = 119;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DMA_SET_DEFAULT_VASPACE: _bindgen_ty_2 = 120;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_CE_PCE_MASK: _bindgen_ty_2 = 121;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE_ENTRY: _bindgen_ty_2 = 122;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_PEER_ID_MASK: _bindgen_ty_2 = 123;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_STATUS: _bindgen_ty_2 = 124;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS: _bindgen_ty_2 = 125;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_MATRIX: _bindgen_ty_2 = 126;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_0: _bindgen_ty_2 = 127;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_PM_AREA_SMPC: _bindgen_ty_2 = 128;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HWPM_LEGACY: _bindgen_ty_2 = 129;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_B0CC_EXEC_REG_OPS: _bindgen_ty_2 = 130;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BIND_PM_RESOURCES: _bindgen_ty_2 = 131;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SUSPEND_CONTEXT: _bindgen_ty_2 = 132;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_RESUME_CONTEXT: _bindgen_ty_2 = 133;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_EXEC_REG_OPS: _bindgen_ty_2 = 134;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_DEBUG: _bindgen_ty_2 = 135;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 136;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 137;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_ERRBAR_DEBUG: _bindgen_ty_2 = 138;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE: _bindgen_ty_2 = 139;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_ALLOC_PMA_STREAM: _bindgen_ty_2 = 140;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PMA_STREAM_UPDATE_GET_PUT: _bindgen_ty_2 = 141;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_INFO_V2: _bindgen_ty_2 = 142;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SET_CHANNEL_PROPERTIES: _bindgen_ty_2 = 143;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 144;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_KGR_GET_CTX_BUFFER_PTES: _bindgen_ty_2 = 145;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_EVICT_CTX: _bindgen_ty_2 = 146;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_FS_INFO: _bindgen_ty_2 = 147;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GRMGR_GET_GR_FS_INFO: _bindgen_ty_2 = 148;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_STOP_CHANNEL: _bindgen_ty_2 = 149;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_PC_SAMPLING_MODE: _bindgen_ty_2 = 150;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_GET_STATUS: _bindgen_ty_2 = 151;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_SET_CONTROL: _bindgen_ty_2 = 152;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FREE_PMA_STREAM: _bindgen_ty_2 = 153;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_TIMER_SET_GR_TICK_FREQ: _bindgen_ty_2 = 154;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB: _bindgen_ty_2 = 155;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_GR_STATIC_INFO: _bindgen_ty_2 = 156;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP: _bindgen_ty_2 = 157;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_TPC_PARTITION_MODE: _bindgen_ty_2 = 158;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_TPC_PARTITION_MODE: _bindgen_ty_2 = 159;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_ALLOCATE: _bindgen_ty_2 = 160;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_DESTROY: _bindgen_ty_2 = 161;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_MAP: _bindgen_ty_2 = 162;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_UNMAP: _bindgen_ty_2 = 163;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_PUSH_STREAM: _bindgen_ty_2 = 164;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_SET_HANDLES: _bindgen_ty_2 = 165;
+pub const NV_VGPU_MSG_FUNCTION_UVM_METHOD_STREAM_GUEST_PAGES_OPERATION: _bindgen_ty_2 = 166;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_QUIESCE_PMA_CHANNEL: _bindgen_ty_2 = 167;
+pub const NV_VGPU_MSG_FUNCTION_DCE_RM_INIT: _bindgen_ty_2 = 168;
+pub const NV_VGPU_MSG_FUNCTION_REGISTER_VIRTUAL_EVENT_BUFFER: _bindgen_ty_2 = 169;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EVENT_BUFFER_UPDATE_GET: _bindgen_ty_2 = 170;
+pub const NV_VGPU_MSG_FUNCTION_GET_PLCABLE_ADDRESS_KIND: _bindgen_ty_2 = 171;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_LIMITS_SET_STATUS_V2: _bindgen_ty_2 = 172;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM: _bindgen_ty_2 = 173;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_MMU_DEBUG_MODE: _bindgen_ty_2 = 174;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS: _bindgen_ty_2 = 175;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_SIZE: _bindgen_ty_2 = 176;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 177;
+pub const NV_VGPU_MSG_FUNCTION_DISABLE_CHANNELS: _bindgen_ty_2 = 178;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEMORY_DESCRIBE: _bindgen_ty_2 = 179;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEM_STATS: _bindgen_ty_2 = 180;
+pub const NV_VGPU_MSG_FUNCTION_SAVE_HIBERNATION_DATA: _bindgen_ty_2 = 181;
+pub const NV_VGPU_MSG_FUNCTION_RESTORE_HIBERNATION_DATA: _bindgen_ty_2 = 182;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED: _bindgen_ty_2 = 183;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_CREATE: _bindgen_ty_2 = 184;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_DELETE: _bindgen_ty_2 = 185;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN: _bindgen_ty_2 = 186;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX: _bindgen_ty_2 = 187;
+pub const NV_VGPU_MSG_FUNCTION_PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION: _bindgen_ty_2 =
+    188;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK:
+    _bindgen_ty_2 = 189;
+pub const NV_VGPU_MSG_FUNCTION_SET_SYSMEM_DIRTY_PAGE_TRACKING_BUFFER: _bindgen_ty_2 = 190;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_P2P_CAPS: _bindgen_ty_2 = 191;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_SET_P2P_MAPPING: _bindgen_ty_2 = 192;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_UNSET_P2P_MAPPING: _bindgen_ty_2 = 193;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK: _bindgen_ty_2 = 194;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_MIGRATABLE_OPS: _bindgen_ty_2 = 195;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_TOTAL_HS_CREDITS: _bindgen_ty_2 = 196;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_HS_CREDITS: _bindgen_ty_2 = 197;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_HS_CREDITS: _bindgen_ty_2 = 198;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PM_AREA_PC_SAMPLER: _bindgen_ty_2 = 199;
+pub const NV_VGPU_MSG_FUNCTION_INVALIDATE_TLB: _bindgen_ty_2 = 200;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_QUERY_ECC_STATUS: _bindgen_ty_2 = 201;
+pub const NV_VGPU_MSG_FUNCTION_ECC_NOTIFIER_WRITE_ACK: _bindgen_ty_2 = 202;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_DEBUG: _bindgen_ty_2 = 203;
+pub const NV_VGPU_MSG_FUNCTION_RM_API_CONTROL: _bindgen_ty_2 = 204;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_GPU_START_FABRIC_PROBE: _bindgen_ty_2 = 205;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVLINK_GET_INBAND_RECEIVED_DATA: _bindgen_ty_2 = 206;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_DATA: _bindgen_ty_2 = 207;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_208: _bindgen_ty_2 = 208;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_GET_INFO_V2: _bindgen_ty_2 = 209;
+pub const NV_VGPU_MSG_FUNCTION_GET_BRAND_CAPS: _bindgen_ty_2 = 210;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_NVLINK_INBAND_SEND_DATA: _bindgen_ty_2 = 211;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPM_GUEST_BUFFER_INFO: _bindgen_ty_2 = 212;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_CONTROL_GSP_TRACE: _bindgen_ty_2 = 213;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_STENCIL_CLEAR: _bindgen_ty_2 = 214;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_VGPU_HEAP_STATS: _bindgen_ty_2 = 215;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_LIBOS_HEAP_STATS: _bindgen_ty_2 = 216;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 217;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 218;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HES: _bindgen_ty_2 = 219;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_HES: _bindgen_ty_2 = 220;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_CCU_PROF: _bindgen_ty_2 = 221;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_CCU_PROF: _bindgen_ty_2 = 222;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED: _bindgen_ty_2 = 223;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_CHIPLET_HS_CREDIT_POOL: _bindgen_ty_2 = 224;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_HS_CREDITS_MAPPING: _bindgen_ty_2 = 225;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_EXPORT: _bindgen_ty_2 = 226;
+pub const NV_VGPU_MSG_FUNCTION_NUM_FUNCTIONS: _bindgen_ty_2 = 227;
+pub type _bindgen_ty_2 = ffi::c_uint;
+pub const NV_VGPU_MSG_EVENT_FIRST_EVENT: _bindgen_ty_3 = 4096;
+pub const NV_VGPU_MSG_EVENT_GSP_INIT_DONE: _bindgen_ty_3 = 4097;
+pub const NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER: _bindgen_ty_3 = 4098;
+pub const NV_VGPU_MSG_EVENT_POST_EVENT: _bindgen_ty_3 = 4099;
+pub const NV_VGPU_MSG_EVENT_RC_TRIGGERED: _bindgen_ty_3 = 4100;
+pub const NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED: _bindgen_ty_3 = 4101;
+pub const NV_VGPU_MSG_EVENT_OS_ERROR_LOG: _bindgen_ty_3 = 4102;
+pub const NV_VGPU_MSG_EVENT_RG_LINE_INTR: _bindgen_ty_3 = 4103;
+pub const NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES: _bindgen_ty_3 = 4104;
+pub const NV_VGPU_MSG_EVENT_SIM_READ: _bindgen_ty_3 = 4105;
+pub const NV_VGPU_MSG_EVENT_SIM_WRITE: _bindgen_ty_3 = 4106;
+pub const NV_VGPU_MSG_EVENT_SEMAPHORE_SCHEDULE_CALLBACK: _bindgen_ty_3 = 4107;
+pub const NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT: _bindgen_ty_3 = 4108;
+pub const NV_VGPU_MSG_EVENT_VGPU_GSP_PLUGIN_TRIGGERED: _bindgen_ty_3 = 4109;
+pub const NV_VGPU_MSG_EVENT_PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK: _bindgen_ty_3 = 4110;
+pub const NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE: _bindgen_ty_3 = 4111;
+pub const NV_VGPU_MSG_EVENT_VGPU_CONFIG: _bindgen_ty_3 = 4112;
+pub const NV_VGPU_MSG_EVENT_DISPLAY_MODESET: _bindgen_ty_3 = 4113;
+pub const NV_VGPU_MSG_EVENT_EXTDEV_INTR_SERVICE: _bindgen_ty_3 = 4114;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_256: _bindgen_ty_3 = 4115;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_512: _bindgen_ty_3 = 4116;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_1024: _bindgen_ty_3 = 4117;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_2048: _bindgen_ty_3 = 4118;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_4096: _bindgen_ty_3 = 4119;
+pub const NV_VGPU_MSG_EVENT_TIMED_SEMAPHORE_RELEASE: _bindgen_ty_3 = 4120;
+pub const NV_VGPU_MSG_EVENT_NVLINK_IS_GPU_DEGRADED: _bindgen_ty_3 = 4121;
+pub const NV_VGPU_MSG_EVENT_PFM_REQ_HNDLR_STATE_SYNC_CALLBACK: _bindgen_ty_3 = 4122;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FAULT_UP: _bindgen_ty_3 = 4123;
+pub const NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE: _bindgen_ty_3 = 4124;
+pub const NV_VGPU_MSG_EVENT_MIG_CI_CONFIG_UPDATE: _bindgen_ty_3 = 4125;
+pub const NV_VGPU_MSG_EVENT_UPDATE_GSP_TRACE: _bindgen_ty_3 = 4126;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FATAL_ERROR_RECOVERY: _bindgen_ty_3 = 4127;
+pub const NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD: _bindgen_ty_3 = 4128;
+pub const NV_VGPU_MSG_EVENT_FECS_ERROR: _bindgen_ty_3 = 4129;
+pub const NV_VGPU_MSG_EVENT_RECOVERY_ACTION: _bindgen_ty_3 = 4130;
+pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
+pub type _bindgen_ty_3 = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub sharedMemPhysAddr: u64_,
+    pub pageTableEntryCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub bInPMTransition: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub gpuInstance: u32_,
+    pub bDmemStack: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone, Zeroable)]
+pub union rpc_message_rpc_union_field_v03_00 {
+    pub spare: u32_,
+    pub cpuRmGfid: u32_,
+}
+impl Default for rpc_message_rpc_union_field_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
+#[repr(C)]
+pub struct rpc_message_header_v03_00 {
+    pub header_version: u32_,
+    pub signature: u32_,
+    pub length: u32_,
+    pub function: u32_,
+    pub rpc_result: u32_,
+    pub rpc_result_private: u32_,
+    pub sequence: u32_,
+    pub u: rpc_message_rpc_union_field_v,
+    pub rpc_message_data: __IncompleteArrayField<u8_>,
+}
+impl Default for rpc_message_header_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_header_v = rpc_message_header_v03_00;
 #[repr(C)]
 #[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
@@ -145,3 +516,41 @@ pub struct LibosMemoryRegionInitArgument {
     pub loc: u8_,
     pub __bindgen_padding_0: [u8; 6usize],
 }
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct msgqTxHeader {
+    pub version: u32_,
+    pub size: u32_,
+    pub msgSize: u32_,
+    pub msgCount: u32_,
+    pub writePtr: u32_,
+    pub flags: u32_,
+    pub rxHdrOff: u32_,
+    pub entryOff: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct msgqRxHeader {
+    pub readPtr: u32_,
+}
+#[repr(C)]
+#[repr(align(8))]
+#[derive(Zeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT {
+    pub authTagBuffer: [u8_; 16usize],
+    pub aadBuffer: [u8_; 16usize],
+    pub checkSum: u32_,
+    pub seqNum: u32_,
+    pub elemCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub rpc: rpc_message_header_v,
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 934003cab8a8..41fdda8a0748 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -86,6 +86,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+    31:0    address as u32;
+});
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index f0cecbcb81be..25e3ad665cac 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -50,7 +50,6 @@ impl<'a, I> SBufferIter<I>
     /// let sum: u8 = sbuffer.sum();
     /// assert_eq!(sum, 45);
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a [u8]>,
@@ -72,7 +71,6 @@ pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
     ///
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a mut [u8]>,
@@ -131,7 +129,6 @@ fn get_slice_internal(
     }
 
     /// Returns whether this buffer still has data available.
-    #[expect(unused)]
     pub(crate) fn is_empty(&self) -> bool {
         self.cur_slice.is_none()
     }

-- 
2.51.2

