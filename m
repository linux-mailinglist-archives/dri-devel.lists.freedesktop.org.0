Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC043A4DFD5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B33910E319;
	Tue,  4 Mar 2025 13:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dWevrl3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7199B10E0FA;
 Tue,  4 Mar 2025 13:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZQLy0JDGjuBC0kw+HC8TygpLfCNolZZNm7yIBHxayC8apQjAGauKLWmJ6/pDC4bsDBRudmiQ2zJc6bdOlYeQfMveswG0fegfFtBlZNRkgf++Tsuq5miYUNk7OWZpmlAfXD4ysehguz5WLWiepKyKsLQ2FVggKr8fCesSX+TPiWD95WioTKcElU6bHbrDfs3Pn9RkU5F7siNku33840ze5M0gmYqm890Sl16Ih5KH+RESnlrwRQBu61F7b9zlWs1dtDVLh18QqTWcXqbTX1cq4BDfJAE4/xth7UEOSsoDgkoisTutjbL0Udb5TLp7jyfTH3oN4HmXd2vpdx3kNR7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPnytbVLNMZtSinX202w86hfBqCuS+JmTfUgM1yUgGA=;
 b=ePKeVAfIgsxC/Qkmr1dN+3loyWzjcTy09jj2eHT1gPb4vff1i2c2CdAjh5DSuUxD5ywj3PAhJTMY4dSMo8Ln3Jryz6AemukAtA3IjtWGcBGjOAZ5b74g2OiQ1mxysjVNfxBv+NZtZHcRfCtGVSrhExJTE69avzsTKhP22tBxlvRZS6JXEbj8QkInLjU/GKqK/d4err/PtF46s5brzlqhCqntLoofS7/cQWV6BUH58076LcnmvUY++M9CL3Eb2szYGKDYa1mNA+A6y+3yexcrxPgn+SScBhDuU7gFo9rMQgQEABmkIWeweLS3CPzv2fH5DmwrBBKq/jv54N0EDeYluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPnytbVLNMZtSinX202w86hfBqCuS+JmTfUgM1yUgGA=;
 b=dWevrl3AywRy+jvSb+DLSUdK9ibdC0eV0n2H4I7JpuPYwYjyydi62uXOYJlGA6o1N8O7XmZ/x2XSCb8fG8iowahFmMVbgNlerliuO4Mpm6jLStGAlD+9WUyjzft+K7znPknMgTynHx3/BBUinuQC0/EWuU3hCDC0y6Sw1dsqYZIiUZzD4G2nXNqcQdEwcojDcYXmlEg3SDATF8dz9nnSzY+CiK0r3ScEwhxl+q8E3YRi1lzNp9NCbb+VEmIQcmXku1j58WnTkcQH9nYFXOkxOPkHxcjL8rjFsS1JsyTvi1Elj4DBsSMDJOmZyrmXD4aPBtWrlaIcV12trWfKFRgSNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:54:58 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:54:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Mar 2025 22:53:58 +0900
Subject: [PATCH RFC v2 2/5] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nova_timer-v2-2-8fb13f3f8cff@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bb5603-dacd-4495-2d1d-08dd5b24264d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzBkSmhDaTJLRUQxdzhXUHJDeXNkc3FlV3FiRlpJOU5lZ0haTzRxL25EVU5D?=
 =?utf-8?B?dU5PaFYyemdJNkppanhRVWRRTnNKSDdjRWlZMHV4Vm1DdXZ5UTdPSm9Da3U0?=
 =?utf-8?B?dTUvMEJWVWRpVGs1RGtsalQ3RVh5TGtVWWJGSVhZa0lodUF4ZmlrY2hmazBs?=
 =?utf-8?B?eXBwbnJQeHNjZkRwcGkwaURsU0dEYit5c3lidEl1bXJ2dGZGSGE1cVRoQnhQ?=
 =?utf-8?B?QkN3akM0UFlHdWw5N0pON1hqSVAwY0tvQWxCa0tBUTgzNm5GZm1tY3ZlZ1Zn?=
 =?utf-8?B?NUtjWld0b2ZHamwzYzA4SURIRTF5NkcwY1J6dXlSajJidWZTNUNSeXllV3Jr?=
 =?utf-8?B?UDZiR1duZUVQZkV0d1ZkbFpXWEpZY0FSc1dzdFNOQzhrVDkrTncvOFFmblZn?=
 =?utf-8?B?YVJ5ZEdnVTJmS1ZiQmd2QTVvTkhuSnVZa0d3WURacHFmT0cyRURGNnJ4aGNC?=
 =?utf-8?B?Z2JIN3Z2K3VVMVVPeGtmb3o1aEZqeXF4WDBLK3J0ajJEVElSYlR5RC95MEpt?=
 =?utf-8?B?YVg1ZGUvT3k5M2c3YnhMSkJERkg4eG1BazVaNElpa25NbG55NzZoK3NRUlF1?=
 =?utf-8?B?U2pCNTJkeENwdHJWTkF1WWI1cXhHam5NOFhBYnNJWkhiWFoxSG1Cb1RVelNB?=
 =?utf-8?B?d2h6L0ZYcVBUUUFDaExGWGtEMW53Nk9OSUdJUi9LWHhQYTh1aXVnSmZuNVIv?=
 =?utf-8?B?bGtZdzlZdTFPcis1WGhkMVErWVNFZ0QwREZDbExUN0RCRzV0NG5pcHMxNGRj?=
 =?utf-8?B?YzZlaW5uZnhHakRZWHIyOXc1QmhOV2FBMG93aEhIYXg0SmJFMGQrUmJMTWN0?=
 =?utf-8?B?Q3dYQzJ0dGVSVVBFM2wzV05QRmlTaFJ4SUkxY1RHSUFEZm1iK0w4bTFzdWEv?=
 =?utf-8?B?akQ1Y2sxZGFza20wRWN6NjNwTXJyVFZML1NZMDNJbXpjZUphdDF5a01GQ3VY?=
 =?utf-8?B?emFYNGxUZjZnbDVucGhxenkxSnhJM3BMMi9wVDl4cDBtUGR4d3YzdC92S29N?=
 =?utf-8?B?T080YmhaOFFTaDNYTDFTdWR3dVdrN2c3ajd5azZIWkRicURIbEVqbDdjazdR?=
 =?utf-8?B?T2dsZVBDMkljb0xLSTVONEYxbTBHend3cTlNaUxiclJoV3loUEhpQVlrUXl6?=
 =?utf-8?B?OERJS1Vzc2tteitQUzNYUXMxelduSHdRQS92WHlDY2dFT1ZWRFNSRzhqckFh?=
 =?utf-8?B?aGc3R25zai9ySHJvWXFSTFU4T24wV3BXdVp3WmFXNWt3c3lLYW9raFF4dkx3?=
 =?utf-8?B?akF0RzlzV3kzeGFITkEvdGR2VjJTZ1h3VzQxYUFVeUlTUFlGMXBYR3NZVGhS?=
 =?utf-8?B?QmNPTWEzajRDdTM4R204ektBaGFZZU5GYlpQWUhOOEZRT0FyUk5LWDJnTlhM?=
 =?utf-8?B?aXZIbStJN0NpTjJ5QVh4MzJrNEx3YWxURzc3cExKV2VJWHRMRVF5eHpYaEty?=
 =?utf-8?B?TEpNanNZcnFjeTZocEtQN0gyRmNPM0FvUnRHcHYxaDRaNDJiU094WUd4cERX?=
 =?utf-8?B?a1NvdHI5N0QzTjdWb1A4L1BBdWU2UmkwbkE3TXNoR1MzQXkxaVN2RittR2Qz?=
 =?utf-8?B?b0F3ejRKMGtkSm9UVlB0cXRFbEZKaUh1NWhEQVhQQVVpQkVzNm5kMW9OcTZI?=
 =?utf-8?B?Nk05c1h0SzZ4TUc2NU1IK3B6Sm55NE5qVW52NXVxMGhlYzBJWGNPV1VjVEo3?=
 =?utf-8?B?V2tLVVpKYm0wMU1NaXJNRmRScjV1dDc0alpWY2I1REQ1YnF6bldnRWRCdTlh?=
 =?utf-8?B?WVhKYzh3TnZybnRmQmk0Y0ptSFkxQTlLQWhrS0ZtZ3NNeXhCTFkzQVErWXdp?=
 =?utf-8?B?OTRFVzlaTThqREd4bmxEZ2ErRy9FeHpUSHRVeHZZa0tHRi9jUXptSzNTUjZX?=
 =?utf-8?B?OVpGc2VyRHlCckpxVjVoS2dpZmxXM0MwU244bWdqdlJTTDlCVzZuVDM0K2Er?=
 =?utf-8?Q?91HgGjlAjAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlQ3dWRWVzB5RDFkaHBQQlVES3g4SGVjNUgzc1BjYVNrMHRXbk55bjlYTm11?=
 =?utf-8?B?aEQ3S3BSMjk2ajkyb0R0OFVuMTN0aXlUQVkyOFRMcTYxM2Q1RDJxWUl5TmdJ?=
 =?utf-8?B?Z0JkNTlQbmM5MFl0MEZYSWVRSHlLNHRDN2VhNHdFKzluWTFFNWVadmpSZk5s?=
 =?utf-8?B?bVp1STJaQzBoRWJNdmZiUTAzNFJOOE14NGVteGRvTEVDUU8ySVllMmVqaEt5?=
 =?utf-8?B?ZlpEb3BBSXVGWGs4akczR0UyM0dLNjZZaTEyMGQ0VDA4K1c2RlgySkRLU1FV?=
 =?utf-8?B?Nnkvdm5ybjJDMjUyM1NndWZ3bHZpb1BOSzdvVi9BWHkxOTR6QjJKT3BFby9m?=
 =?utf-8?B?cWhDN25NbG04ZGtYc3BHdXJXTVRlcVZhZDVTQ0t4WHVSeE4zSWpja3ZwTHJI?=
 =?utf-8?B?Nkh1d0VkcFBTcDBsU0hicW80TXRiRGdNNXV3UDkxU2ZyL014NmoyLzFlTHV6?=
 =?utf-8?B?UHFzL3FLRXRpTDRRRFVSaVJKNzBpdVB6Rm1TdEU5Zk4yS2VDS1VxMjhGY1Qz?=
 =?utf-8?B?TVNkS2RkY0NWSk1HR1c4eEl2VGg4ckg1R0VTRjFMdk80MUZ4dTUrL0Z3VGFq?=
 =?utf-8?B?WThYNWhsOGFhMzZscndvU2tUUDlwaEdaVDZLMXZFZjVmYzZWT1BVOElXVWJa?=
 =?utf-8?B?cUlmNklxTnFleWZsZUFoSThEWU9oU2MvNlhTNzltRUdOMnVDclRSVW1vaUUx?=
 =?utf-8?B?MkFOYVArKytneFRpamxOZUNPMHBsTjgzMkRocGRGNk5RM20wTUhIVnNtSGlF?=
 =?utf-8?B?dFpab0hLWDNVTmxWNnJwYmtSN0FnT1ZEL0ZxbWVTZDQ1QkJyM29SNllBSHk3?=
 =?utf-8?B?ZG9yR0FPR1lVazZRQ1B5Nkx5RklERnVpVHI2Sm9WbGx6K3QwR2s4NFRxLytI?=
 =?utf-8?B?dC9yZzZKN2JXc2puNEFodS9LMjRIWXVDY1hMS3BVYnIyY0xCNGF0bHFtbE9C?=
 =?utf-8?B?d2xLR0hpYnhZMVY5MW13Y0I4N3BlYTg3LzNuTWlQeFNTRmZXb2N3bGNUT0d0?=
 =?utf-8?B?c1RsMHFZZHhSZjhnbUx6WmlWYzBPemlKSTBqM1RmUEFNM3QyK0lFbXhCaTFS?=
 =?utf-8?B?L0wzMEtTanpXeHNKdmtBRGtlWFM0YnlHVWtwMFV5dCtiWW11bTdLcllrbStn?=
 =?utf-8?B?Sk5FbjhEaXZsU05NaUxhSXVPQlBVT0h6cEFPbnBwZGppMGRpOFBIMHd5Qm94?=
 =?utf-8?B?S3FpNkoxMXY4bCttQXV2RkZ5ck5UUnE5dkJCYUsrRTRyYWhaN09zN3JGdnAy?=
 =?utf-8?B?d1pwbWRtM3RoRGFMaUw1UFlCY00xaWVLQ3dpWW85eVJwamx5OURYV1dvcWlV?=
 =?utf-8?B?L0NEcWhSUkdIZktTYkIySGVCajcxWHd5eksxNTF1Vk1YTnNHS3V3d0h5UGhP?=
 =?utf-8?B?MlU3NzV0OUM4NVp0RFBkdTJ3WjE5bVBsRTJ3a0IvalFEMzZhZk51bkF5RDlh?=
 =?utf-8?B?OGljcnJEVGNJRE4xZ3I3akM4VUFhUkZKYllpMUNLanFwYnpYbEcrMEhEV0dw?=
 =?utf-8?B?cnBrbERBYUozTDREaGN1WkJFVk0vNkw1RlRnVjlXeHJLMjZGQ0VGcHhIRUlh?=
 =?utf-8?B?ZDBEbnFkekZ3d2FQRm5FKzlmZS9PaFA4STRGaXI2c0cyTE92eEh3WHlsK24x?=
 =?utf-8?B?cWtrQUlpOFhHaDRVb1BEQmRyNWhrZkJCMEg1QjVvekR2Tjl5TWJZNHlleEJO?=
 =?utf-8?B?T2VIcUxaNS9IUUVKOXRwSnc2SW55MHk2YXZlVW5CQ0pSVFBHVE5mR3h1emZP?=
 =?utf-8?B?VEl1QUtodUQ2czlGUWtWdXphWm8xQkRKNllkSkdIYWdsVTZENFNpck5HVk93?=
 =?utf-8?B?ZTNPUTJyQ1QwYzZKUlJmUTVoZ0ZlZUJmU3l5Q3kzZEVBRWJxUmhqRW5yWS9v?=
 =?utf-8?B?SUNndEczdExWMzhxYlY0MWNQRGtjYTVGVkVENEorZXhVWkc3Q3J6L0ZXR3pm?=
 =?utf-8?B?S3dsWXZMYkk2ekdTVXkzS1FzSUd1VzNDYktrdEpabmpReXRGUHpESndjOUFO?=
 =?utf-8?B?RmtUTmt2KzZkQk4zNHFTblczeFp0UzRmQUV0L3NvSDdudWl1MWh2RkhuT1Ji?=
 =?utf-8?B?cnVkeldubXRPV0QzbjQ2TG12OFVlM1ZvRzltYlJyWitmNDUweVZKa3hxZUxU?=
 =?utf-8?B?TXdSbTdmQTNpcWtwaFI1cGtrM3pCajNyMEJ3T0xuZ250UWcxKzN5MXhZK2pE?=
 =?utf-8?Q?bmJ37ySRNHNxKcwEXpGL0ysei8MfDO/L4apfv6KLD6Nc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bb5603-dacd-4495-2d1d-08dd5b24264d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:54:58.1406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp2RLjaAD1JdMVFF29evY+uEDKvv8dvJSK/uYDlrUQwpg8ZqGkoOvwTbdure2mHX3AJRA16e/ZisTTFvcpV5iw==
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

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 1e510181432cceae46219f7ed3597a88b85ebe0a..475d14a4830774aa7717d3b5e70c7ff9de203dc2 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.48.1

