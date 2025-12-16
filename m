Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFBCC0F92
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9899910E6B5;
	Tue, 16 Dec 2025 05:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lfFnG3dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7324610E209;
 Tue, 16 Dec 2025 05:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9UjrHGm33hJ2AKIN1FPkee5M89meBkA+S85E5Y+ZsOEo+J13C+VsohNznv39xeNZkkj83G5oTovnOu4RNARVuRL2mAkfUIitC/U4/FPa4a8rL+qUo2fM/nwwp/g7WiV7MdDZRXb4o1sqbGpJmLbkjshGks9ElyvL9Lllgcv0gaOKi8rdcQpfJrbtaVbTQAXU/WEcIGDfheARbyUuZHBkEoOy3gBHFNlPyjguzFc/CqsTc11285V7MlyRsDHzDP7T3rSX3tkOA70edgG6LKxhOyELrLlgWlKbZdz7ashbNhVTvEEeKXULsh6eBdCrcjotODw5apE/jSS1JKHGxKBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUMDiv8CEGyszg9oMJQVl+4wdeGAm8ZFQgnYRA26OXM=;
 b=VzfRBN+11/hadqYr/D+Yz+a4FNSpRU6RsBrgy9b+KTaKDGWZ4tHM64T1l75RGBJ6b7UkUdKRH4Fa08uWPWxXKS385ZeKEMB+fJyQFQlnTHqBnUJuYr3GMCzE29PvdcxWFsndObzQOC4ZjRzNwhfoB+UPFFDhMkxh0v45jQOmmpo1JLtxJZu19UOxKdmafPGL+i+fh+EUm9N4fLp8nMjdjbT+QZrviFhx9D7HYKpcpg1WUHBBnlwmfKA7LQebNkiGLlxjtKfJW5AA3TjgE5utgHdJVITIJ3ky3vIRvvNCUEiw8JUJMeNA47wdMo7U0DJN3LoKDpmW0m8oukXBIfct3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUMDiv8CEGyszg9oMJQVl+4wdeGAm8ZFQgnYRA26OXM=;
 b=lfFnG3dAdJ9zpznFHyszGfCao6UqqJeiK7dnj7nZRESMYee2oQSjgjp/fADW4mXwhe0pPlPzVod+GJ0Ej3e+cSyoX7LUCZh4WzE6w0la4ltzmMeJBLRIA2TWlJ0rj4MoyQ+sC5EuCFxQ3TLzX+kE8UrNm6p+1lrSFy8WSJ2NrlOT058WCUl+4IfTDeieflDL5tHGAn76CpBjOGLkNTjwBuLv/4P57r8LgixAAygEYJzCgPtO5oc/psFaWKFfJbVZDZFGJgLPFd6ZjF8VGS4I8sjIsE0p9YPenxJT4CYb88U5KBgUfzKCquvfkIKfJjSW26txq6m2ptD807lyeWmiZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:29 +0900
Subject: [PATCH 3/7] gpu: nova-core: use warn_on_err macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-3-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: c664406e-1237-454d-615a-08de3c61e21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUFhSGt5Rk9uUzE3TDNtR2crTXZ5YTJTdEpRR3lNSExpZmc4R2RyTWRES3I3?=
 =?utf-8?B?Q1RyQ3M4SWRPbHpkWmVjbmh3NFlpdGRBK2NVeExhdGtjb3hRQmwxWktoUFdJ?=
 =?utf-8?B?OWNPN0VFbHZYYko4TkZLRE4zTUYxOU1KMkkzV2s5bDR2bzdDSzVLOWYzTGtP?=
 =?utf-8?B?SDZxVEJ3SFhTbjlleEJrZ2lwTlNDS3R6eUZyNzRqZXMvdklFbjNyMzM4djV5?=
 =?utf-8?B?bU5ZNCtIRlN2Y1kzTUEwNVArbm1PM25OUmZGUjBPbUZQeHZxNHBLV0txZnRu?=
 =?utf-8?B?Q0R0cis2ZC9wak1tZnBKbVZ0bkZOK0JDaXIzSUVocG9TbVNnRjFnZCthRkti?=
 =?utf-8?B?QzBMdGZjS3l1Y0FVTUZqV3NuK3RRdjdadzlvVUt1OVFZWjdsNlFxOWUwYjVX?=
 =?utf-8?B?TUkwY0NONnAxU3YyMmthVXdBdkQweFpvY1ZYTmdpZW1LaHBlaml1SFdpcWZm?=
 =?utf-8?B?d0xuMGQxNVlvb1N4amRzdm80b3Z6MnlnSk5Cc1BOT3VBNDBSek5sNmN4bUpt?=
 =?utf-8?B?em5BOTFQMWlmRTNSbHpJVTFtdHltSXpaOVQ5ZWRtN3JtaWU0dGRTUlliSmNn?=
 =?utf-8?B?MHBQUDhTd1RnZ2dtNUZtcG5jcTVsdWp4RUJBbEwrNDBOTmNWV1Uwa0tvM3ox?=
 =?utf-8?B?WHFCN3BNb1k2VlE4TEMxa3JCc3p1UStDdkpSNmtscmRLaVE3RFdhZjM5SE9w?=
 =?utf-8?B?eTdjTkF6VWhtTXFGOWFpZG5hK0FDRkEyK05IUS90S1lrYnkvTEgxK29nbU5l?=
 =?utf-8?B?TGt4b043WjNHbThuWFM0TTBLb2ZRZkZ3Rkg0dTVxUUZzY0k2enpoOWROci9x?=
 =?utf-8?B?TDhqNkN0bUs4UUp5NC8xaGRCMzFVMjBNaUg5TUNrZktUSFJHSld5WXg2QWMz?=
 =?utf-8?B?L3NaTjg1TUtxaXRueDdocjRtcUoxT2RacWlVQzVLZDczTmllMExlN2ZrWGFk?=
 =?utf-8?B?d3I0bmZ4eFN6MFdieTRQZS9zUHVxR1JiSDA0ditzTWhNQ1MrbFRVdzNyWEVF?=
 =?utf-8?B?SmJHT3U0TFNSKzBwbS81a0xqa25IMkFPYXkxNHlYdlpBbXQ1Uy8rVkVKV2hN?=
 =?utf-8?B?VnVzdGtaQlVvcUhkTG9LRnJEVlhuZG9JbytXc0xkWFdwcWVKbGg2ODdjNjFm?=
 =?utf-8?B?WHB4M05pRUhLNTBucmZUTkJXKzNlMmNxNXNzODkvRGp1K2dONE9mTTNhUHNO?=
 =?utf-8?B?bC96RFcwV21Fc0dMbktBUnZkK0hGSFFwQ3NzeFMwYUhRZUNQMlI4QVZ0SDBT?=
 =?utf-8?B?TUlrL1NjbklTY0RNZitJTmVDMVphb3VNcGlXak4xTERZUkZmd3AxUGd4cFpC?=
 =?utf-8?B?eFJoUVBVbjlZbXZSaVVQOExBVFR2c0NVaEVzTmlzZ1JKNW5zd1U2dkNET0lx?=
 =?utf-8?B?QXdIUXJoaGorN1JTNGVJWndMbTM2b0RGQ1Z3UFRydnIwTVVWcHUvbVJuMFpP?=
 =?utf-8?B?VTMwZjZxSjZ2bk5YblozZzFJVENIU08wL0E1R1BNN2VTT2pva25PNk1MbUhM?=
 =?utf-8?B?MGlrWFVNRkY3MHpvN3B6MG5pYjUvNEQvUGxUYXYwdWQ2RVc5VVAvZXNRaDJP?=
 =?utf-8?B?cTF2WC9wWjJENFh4ZlNNYjhGY3JBN0UxL09QYTNmS3huY21oM2tWWEJBSENs?=
 =?utf-8?B?UGNhbzZFd2RidFkrS1h5N0U4aFMzMnpPTGxEQ2Jwd2VNNW9nNnlOZGdSNC9V?=
 =?utf-8?B?QjIxcCs5OVh0Y09TNlFVUnU0STFVWm1TMjNDUFdpcGxUVFpLNmFBSCtsbWpI?=
 =?utf-8?B?UDM0eVBlMEVCZWc0aTBxcjA3Y3ZjU0VlR0ZYZGdoRy9hcGExR1c1S2RkUGox?=
 =?utf-8?B?L0xNMnpDRVJ3VVNBSVhZOThTZDdsUlEyQU1FcmNTRXdDQjZsVUdKQUZFbTZJ?=
 =?utf-8?B?bHl6a0FSZHhIZjdZcmw0WGtDQkZTYlFabWNkblpZZkZvZ2JlazJhZzdXcVFW?=
 =?utf-8?B?ZWZSaHcyd0JmYlVZbHBibER0WjYxT1JjZ01lSHE5Q3hpcXlTUnRaaDlMb0tF?=
 =?utf-8?Q?H0MXTXPPuMThCJs2VCMjqydkR+Sqbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpZWWk0cVkyL3VJQ0U2QnZZZ3FjZVJVdGo5cnlGbDE0aGRsbUhjM0ZSalNt?=
 =?utf-8?B?NzFPUGM0NTZYS1VoekhKS3A2ejk2ajJkcmJjSEdWY0pUdFNsRDIrT05FelNE?=
 =?utf-8?B?QnhlVlVaUjZEWUNOM3dObmVoL0grZXRmOGl2TlN4ZllpbFpzRE1TOExGdlov?=
 =?utf-8?B?cjN1NlZZOVdMSUdoUG0yN2RWY3RxSkhIUWxxdnJZMVRnZUhwZ3pxd0NNOXhI?=
 =?utf-8?B?Q01OYnNpMnFtNU5HcHRtcW9MSWlkZXQvR1FNS1VmQ1ZpZlBNS3IxaXBkNDR0?=
 =?utf-8?B?aVh2QTlSSXE5bDk2cVZlRlRycjFLUWJzd3ZScHo3NDFPcmg0dVFIaU93UVpo?=
 =?utf-8?B?a3pwV2ptallWVkcwVkRSZ0hmMTFiTTk2QklSMnY2UlpWS0d5c2JKUUR0TVc2?=
 =?utf-8?B?RSt1YmtNdDlFaFZabG1udTJXUDRSRFBFMkNwOVpKRVRZWVpTT2RYeWRwWDFR?=
 =?utf-8?B?Y0hYempmellwa0VMSWZYZWdkM3U1SzhLam9lWlVnRDA2NW96blJ6WXFQMkJz?=
 =?utf-8?B?NEJzeGdXbGJ2V3Yyckx0eHF4RlFLTTkzS1hnZEs0ZlYrS2tOYm9jSDNHd24v?=
 =?utf-8?B?V3VkQlE4S3ZkMS9ndFZlbXBaMm9xQUNJZHUvVUFtNG9MSGt5cTNweFBjNnAz?=
 =?utf-8?B?VUZIQzVnZ1c1amM0ZDV6S0lWbHFGWHIyTElyZE9CNWxZOXJGb2pSYVRlVy81?=
 =?utf-8?B?Qkh5TXdWamwzK1BMTkFsaTd3Y0F2bVIwVG1BNFpNd0lsM2pEdTlRZ0sxbXQr?=
 =?utf-8?B?TlJLeEF4c3QyVUF2ZVo4R3lRSjVpMG9OTnFTVk5mZVQ2d1J6L1VPcytIQjh4?=
 =?utf-8?B?UW9OckhPSFdxOFpmcUluVStTQ1NmRk00UlB5azFOb0ZhWlpyRVRESy93VHZr?=
 =?utf-8?B?emhtZ0tQak01SkExcXBvQzhaQ3c4WC9nN29hRVAwNXZyMktzOFByUXVGempx?=
 =?utf-8?B?NSt5bU9VcFB1MjFQamNmTHpaZUxTTkNmZVNyUThtQWxpbVlpMFBhbzFLbmdz?=
 =?utf-8?B?bWY2VE1VUnF5ak5JRUg2enRMZEVMdzNoSTdWcExEWGJ6bTFOMy9pNEEyb3Ni?=
 =?utf-8?B?WTdPbkY4eThMSlRYbmpQU01MdGNUNms0NzJyN0k4dk1Rd3FhRzd4YTdnQU95?=
 =?utf-8?B?Y0JmbVlOenhHekgzT2JOempNZVlzWFJJQUN1L1A1cHE3NTdtTGpxYVdCK3R5?=
 =?utf-8?B?enBZWGhKV01EaTAwRUFEU1dWYndWdUNyYTdaSFJEdWl2eEtNYTIveUxjQmJr?=
 =?utf-8?B?MU9jbzJNRTVUWHhlT3l5Nkd2T21PdkMzZ3pmSVhnRDFVT1QxOE0rL2NiM2Zw?=
 =?utf-8?B?amRGMEF3UDNQVWNGREtRQW9xSVZaYncrYTVZb3ZNRHNuWmNvOFd1N0tBbkxL?=
 =?utf-8?B?U05tV0VYTHNHODA4TTJJeGdoM0Vaa09Ram80WnlDV1gwVUc0b0hDdDZ4OXJB?=
 =?utf-8?B?RWdMdHRCU1lSYUp4VkNuMXVpcEpPcXA5a0NxT29EcWN5RW9Tb21sempFWGtJ?=
 =?utf-8?B?TlU1Z2pGY1pDeUhEd0hVdUhSblFyY084VW41VDBPL1UrRUdkU0pxTFpPVElt?=
 =?utf-8?B?eXBTZ1cwS1UrZVRPdFRhd2t6THc3RTBzMThkOVRMUEVWTXpmRUs3T0hiRVdO?=
 =?utf-8?B?UXltNmVuVjF0Z3Bzc2k3YTNsTXl0WU9NcWtZNzRLUEUzd0ZFRFIxb1huaEVH?=
 =?utf-8?B?cEpqYk4zQ0JiMDRqaTc4OFByaVE2c0J2clA0WDl4VHRYYmFDYnMxQXFqUTNB?=
 =?utf-8?B?WkRMSDBKdFpTWEk3aXdQdzhCOWdmR05OcE9iSjdlSlZ1eHg0UmNtdWdKNCtK?=
 =?utf-8?B?YXVDQ1lidWRYNGFRTnZzVk9SSU43S0sxVnVIYnlRZFlKandTeENtc216MWIx?=
 =?utf-8?B?RUNsdFRkbC80M3NMSVFBRnUyWm9nSEFCTWY1UFRlOVZvdzZvQTBzUFFaeG94?=
 =?utf-8?B?dXJPY2JlZkhtcHV1OXBaNjdUL2JtbHdwbnorWTB4ZURDclJ6Wkx0T2p6VXU3?=
 =?utf-8?B?NXBRT3kvRDhuQXdDLzNUeHJJMVVxQVBFN3NUMGUybWIyREloUVM3U1pnVEZV?=
 =?utf-8?B?MC9abFVuVFEzVlI2NVFkVURTdjF6Y2NhcEFuMlo4aS9mb2ZsMXBqWk02TzJS?=
 =?utf-8?B?Nk1EeG5DK2FIMitwZU1VUzFEbGMvcWFVZ2k5WmtJYk15MkFEeU9SNTB3cDl4?=
 =?utf-8?Q?u8j1kRUgk9t+A1lyHAjvVOuQBvV/sOEieofk0TeRJCwR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c664406e-1237-454d-615a-08de3c61e21c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:43.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZxhKaeCTqA+5apXTk+MjmJ3wCSN2xAxYsNbxFdiosK8LBYhQMjLvZ3V2E4E1do74A/E8u260oNqdIAL+ajQWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Use the warn_on_err macro in the unbind sequence, and refactor it to
early-exit during the failure path as we will need to use the bar for
other purposes.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..e16d3c2a6b38 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -293,10 +293,10 @@ pub(crate) fn new<'a>(
     ///
     /// Note: This method must only be called from `Driver::unbind`.
     pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
-        kernel::warn_on!(self
-            .bar
-            .access(dev)
-            .inspect(|bar| self.sysmem_flush.unregister(bar))
-            .is_err());
+        let Ok(bar) = kernel::warn_on_err!(self.bar.access(dev)) else {
+            return;
+        };
+
+        self.sysmem_flush.unregister(bar);
     }
 }

-- 
2.52.0

