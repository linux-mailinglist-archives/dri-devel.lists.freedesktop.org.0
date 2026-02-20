Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hkIJKHa/l2nL7wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DB1642AF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4159110E685;
	Fri, 20 Feb 2026 01:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dBAJeCUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBC910E685;
 Fri, 20 Feb 2026 01:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC0UA/MWHku3oYUAC4Expc+FBAD/rSgLVPUDEpTWiayL/4iarx60GnkryVoJaWCzSr5EL92RQsO+rOaYEK2EdfGBo8QcQl1sZEmMZdIqQpNR+NY5KR7EthUl1nku26NOMLJl+vTNmWzZ6Q28vJlb0vEXtXSRSYykCLNR8i3k38BljV1rVBSZy1T+FCinDVKtdMe0X9oPxFy73DWGJoSrCh4kz41rUeyGxrf5zYGppTu/Uw3w3WliYkfvvDmc7YsVE0FBgQL8n62QllmaXrkPpiquVSwkKTOm8YJ6yhFMMS1XQiwBnIsRow0wOJxg9t5BQ1iVMi8rDGhX6wpDzvPU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKvewD3g2RWcBUjle5Lwektco4lqtHnf1jMNPYFa7nc=;
 b=O7CbWx/Fn0zFu+pFtdLDLoMJTpbaQTRHFIUf5NeNxhIc8CBWtiedMM0tVs8l4qxsk83fXFUGMOseNtVzZIQF2vU2MKuPnVCguQhydNlEw5w3u2soGkvO2M7y8AYEY3NRMFCLwvOM5Ufg0R9rl5+FghCs8RtsZuY/iO+b9Mn3Wcu3mpc9C7Xq3Gg/kDcJ5wtshZ5sjWZgdXYgIA2HcZqK5iBqq//ZfkcxpC7xPsIdgSBZqpabtz2bJuxqx/+zhvtcFTsBQf/t6RflwdiWlCL47U7x0YO5B3iyRj04+gGXdy4FO0lTXhp6ZxVZ+d9KvVX8tntrsFHH/QBJn0vuCScGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKvewD3g2RWcBUjle5Lwektco4lqtHnf1jMNPYFa7nc=;
 b=dBAJeCUaNqjQM07NfW9H59Df45G0bK4fbP+oikV84QZNcjlt/r2vc2QfZNwF/3kNArvfwIkTAAnbKfT2gbzh3kb0xw/L93m1roDcBfXS0qA87QxvhK0NtmQAkzVi2yBF/5tKTltctFQdzR/hiBMxrcatnJF62OTscWlmifjg+2dpDRw2i9X0tZC1XB8z9l7JTmSrc7E4dbcY80nK6NlJLtZlRVEFo+7C3XF6YoAGuYGDg28KFEsqAVOdDpXpKL/zM/OMMcZvI2s5L1l9IQm4JSlmC57YY53e0QHV8WSeQNTmlRnjFZ324tu3oM2tieDZH4kwjVxvMNykJI7Yl0y8Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 01:56:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:56:59 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:56:50 +0900
Message-Id: <DGJEZM3GTY6H.1ET73V84QR6MV@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
In-Reply-To: <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
X-ClientProxiedBy: KU0P306CA0088.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:22::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: df6c03f3-7009-4216-5c2b-08de702354b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdNUmYrZGdmeEk5em93UjR2NkNMTTljRHBjRng5OFViM3RyN0s1WStuaWo4?=
 =?utf-8?B?SE55RWFQNVNUZU9iNE5xSmVvWXZVUHdRRk9iVjlLUnZKS09xK0taREZEbmd4?=
 =?utf-8?B?L2JibU9tQVg2ZDByRElndnBDYkNjek9URFJvRVZRZHVGVDEydE1aaEN4ZlpL?=
 =?utf-8?B?ZVI1WVFuNUlEcFhrSDdTRWhVcU9LRXllNGdoRXdhY1FYK08zSnRzbEtxV2hx?=
 =?utf-8?B?eTJJN1FiYWlTSTRMQWtQUGFMUEl3NWhWL25zT2tmRWhUMTYwdVdWK3FaT2p5?=
 =?utf-8?B?T2tNT3M3ekpjNnBhOGVzSFVwbTArdGd5YjZHdkl5bnVlL2FCemRlWGZHdVk1?=
 =?utf-8?B?MW1FZFNPQTNpUkN3VmNCNGhQTGNRRHo3azFOdUJxaHRaU0NNU0NRb0JhUEVS?=
 =?utf-8?B?akNpMFE0YlA1SHpxazQ1MjVOdlR6dW5OLzdTTVdwaWV0RURNZUp5U3VZcjJw?=
 =?utf-8?B?Tnd1NTNuL2JiNDBiZ1VuSGFpSXdCK1FybWZwZkNpSm01SVFSUFI5cnBRVnF1?=
 =?utf-8?B?a0pUUVoyVWVpUlVuM04yOTBVR0twaGdrZE9menoyaXllSERaTmRjSGpCK0Fa?=
 =?utf-8?B?SmU1Q1MzbG5FWk1oaEZQYTRPeGlXb0lySHk5UnBZcHlSS2QzaUM1OWQxTjQ4?=
 =?utf-8?B?WENiT0lzMGsrZVBSVCtXVHdWWXFWeXFxaTN5Rm5KbXRFM0JlTFE2aWdOWUo5?=
 =?utf-8?B?aG9XeXY4SXdQRXVpaldkeEF2cDZTcTJESGRLdjd6SWFaMzgvWXhhRFQxRHd6?=
 =?utf-8?B?djV5dHNQK0Vxb21PSmZBL3VUTkdtay9mNnpIdHA0SDlWRHVndTJqNlFmNzNp?=
 =?utf-8?B?ZzNJTTJIOWVKYkIyREFncVl5emlZUEFzSFlLek8vWkpXWWl6NDZiUW9zUTV6?=
 =?utf-8?B?RFhSaVVWN3RhZVl2eDZSdmFMd1JQZmtQYjUwYS9sOGkxUGoyVTNQYXFpLytz?=
 =?utf-8?B?Y3VJdzNjTnd6Zy9DelV1TW8vZDE0VFUweVBRUnNldUI3ZkN6TnhrSFE3ZkE5?=
 =?utf-8?B?dFhldGQ5bStSRlhGVm13LzNqeWppeXNvR2NZR1A5NGdrVXB6SEROSXhIQTFT?=
 =?utf-8?B?WUJkYUFlM2dzYjluZzN3blhIaTZycVQySlYxZ1h1S1ZsR2k2bGFZZm9aOE5N?=
 =?utf-8?B?T1JQQ3IwTWN3Qko3U1VlUy9WQ0Fyek1BdTUxUlc3M2ZlSXpmanEyM0h4ZFJO?=
 =?utf-8?B?RTJyWDFxZUQydWdLOWtVeWszZTlWV2xFUVBWMC96K3R4bWhkZjlKVXFFdUZm?=
 =?utf-8?B?WGNVS1FVSy8zUlJBV2ZXOXdkYUdQdDlpckdMRDRmVzVBYXVKYVp1dkRUUDVR?=
 =?utf-8?B?aSt3ckY4a3pKY3h0K3Nob2VPaVQrN05QTSs4QnpJVHdNYlJEMlU2L08yM0xa?=
 =?utf-8?B?dGNPVUVjUUg1ZkhDQ3BFSGxQc0lnOXVVYURQU1F3WXduR2d5L09aK0UxMjB5?=
 =?utf-8?B?dEk1SkdkOFVGWjhxVVByVCtlY0JWYlRHd092L2lpMG5oSlJ4bWIwWUwxUXBB?=
 =?utf-8?B?VXFFc1E2QUFBU0FQUXV6cy9jNUozK0Y0TDhqUklEL3hEMzdvOFBtbzdzbVdj?=
 =?utf-8?B?NFBxNjZSeE5oYXRYcEZWOGJHcmszd3g1WEtBbkM5dGxQTnQvQmV6UEpOMFZX?=
 =?utf-8?B?OG4rVm83ai81a1RETXZtalFTK3lTandVaWZqbmpzTEQ2cmg3NnExZWJRMjZR?=
 =?utf-8?B?M1grK3FHWFJFSlgrNGNtbDd5Mi9CWTB1d0RaNWtQTmNUeW52UXlsNHhPVXpS?=
 =?utf-8?B?U1pMcHpWOWNmd2dsN0k1c25zK3NIK25PMDkrZHJMcCtTRGw5a24ybCtlTDFN?=
 =?utf-8?B?MEQ5dmZ0K1dpMXFMZ3hSZk5EdklXZnNabXQyakpIMGhUa3VHb0hHeWJFeDQ2?=
 =?utf-8?B?R2JFZVUraWVwQTJHM2U0Tkg5TzNFdW9pL013SzJmWmloMmIrQWFHMndpV2t2?=
 =?utf-8?B?QzRQc0paWXdpek5KVzlkSjg2d3h3bEVHclFEOEtQOUtFTmlrTk0vMS9kc3Jz?=
 =?utf-8?B?SkF2Wit3YUhDWGY3K3lMaWs0dFhwdTNQVEFrd1lZbDNzU2E1Y3FGWXprWHdX?=
 =?utf-8?B?VWlSdjRVWG9mbUYzWWlnbVNTOTdwaFQvQUpjOXNIRWliVm8ycVN5TVhzNURS?=
 =?utf-8?Q?UUWU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVoQ2VVcEd0azJlbVRCYlZMKzExZGY2YVQ0OTA4UWVrbVROMVRyd0pjaVJF?=
 =?utf-8?B?NkNQYWFqanpNbUdORjIvUjZKWHRHMTBnSHpvU2s2aHBpMnBkbzdrOEYxVjJ4?=
 =?utf-8?B?dHVxZDNXTXRyV091dm44Ty9FcG9yVVJLRmdlVG5QR2RSMGtSd3NRTnFpS0JI?=
 =?utf-8?B?VTBCUGN6VWcvWlhXR3g4ZDRGU0M3SUVaNkpXbEVTRjBVQjdud1FZVkRrUFlD?=
 =?utf-8?B?bTBXOEdOMFZYQ21IanUzSWY2dEVpVUpNUWFLMWRMbldmYmZIa2pRRklaTldh?=
 =?utf-8?B?Mmt2cjMvK0RkNzArNm9SNzUvdGVlM3FpaDBuckovcXR2SnptTlJiaExkeTUw?=
 =?utf-8?B?cHVXbEVOUFpCS3RidmVIaTRqNW5QUmFHTVU3ZmFQZ2RKTUptbFlHQWg3S2Iz?=
 =?utf-8?B?d1dpT2YwOEliVUp6cWRWMWgwYzcwL2h3TXZtWXE4QlU2bk1MRHpVRmkxS2Fq?=
 =?utf-8?B?dzZTV0dEcWxpMXR5QVluclpUamdXcjQ4R09xRzFCbkdXdkhQWWhMRjJDOFFO?=
 =?utf-8?B?SERjYVJoZVFSZ29JL0IxaEM5MXlNTEs0Tm1BK3JrdE9PVHBBbnhuWjI0TWZX?=
 =?utf-8?B?Um1VcmZTSFJnQ2pUL0pDWDdKelpBclo5cndMbzBPRk4yOVUxNWFSREcySTdz?=
 =?utf-8?B?UDhnbUw2bEFJaHZWWEFFeHJaVFBzb2l5OEZRR0UrdUZBUnlxNzNlZG1XSkFI?=
 =?utf-8?B?Z3c2VVBpWnhBRUhQNzlFcm1yQzB4Mno3ZHhVM052bis5eEJrMzd4a20wSmo0?=
 =?utf-8?B?dCtIdkZUZE1FMFM5d01xNmFqbUNZMFl5NFROSjhzSFZiREw4d2dnNk1LY2Jp?=
 =?utf-8?B?K1NLUWhFZmhFQVZZQnpjVFJoNEYzUWxocXlGYS80QTF4S0RMWURyOG13Sm5o?=
 =?utf-8?B?VjFxR3IvbGhQZnhYalovc2o3TkgvRUxtaGptRFJhckNNc0VuWXRnWEt5UGRT?=
 =?utf-8?B?ME1QM0xyM0JNeTcwWkJRUkhMSEJzdldoTjlXL2toakNPa3pYc0tSYngrT3U0?=
 =?utf-8?B?QUV2RGJZaUNQcktqZEt0QmJkMkdxVzN5a09udytLSFV2YWRSNlpoNldjOEta?=
 =?utf-8?B?eTBpZXByczF5MndTVFFxQnVBbjJ2c3NUR1FHRittQTYwL2xuS3NPd2QwOWUv?=
 =?utf-8?B?OVZsbGt0cVZzOHdScVU3Q2kvQXZ4Wi9ucWdIQ0FvNVRhemYzdldSNVJKWGFX?=
 =?utf-8?B?R2szT213VnBkRzVocldCTkNKVnZTOEEzUUsxVUtxa2ZHM0dqeVEvZUhoM05n?=
 =?utf-8?B?Rmp2U3lSYkRjQjE4dVFOYVBranlTazkxd0ZHMTZwS1dydUozZU53RTNWZkdi?=
 =?utf-8?B?YnVkMDRqSlZocS80VlhaRlBaSGNTbEd0M3NtdG80blRuek9zVEhBdUNnZUd6?=
 =?utf-8?B?c2tWUDMrV0VlU0xEb01zYllPSkN1OUR0OS9uRy85Z2p3RVlBSmRkYlN4THYr?=
 =?utf-8?B?MFBrNUlrK1NseWxmL1QxdHF3c2xySm1BYmFQNUhGa0dLc0xVNmtXL2tXRGgw?=
 =?utf-8?B?UVBIOTM0L29PVjVoV3NpVEtqQ1k3dlhzd0QwTXdMbWptdktBY0hnQ3dJTSto?=
 =?utf-8?B?dEhzUXBJWTRnODJuWERubmF4dWU1dWV3VExOODNIbkxVclQzaUF6a1BjNkwv?=
 =?utf-8?B?UHNNai91eUx1RTh5VjkwNHVJVmxEamJHanZxL3ZEdVlZTy9xUWlRbkcwY0xv?=
 =?utf-8?B?YWxNZ0x6ZVcvaHYxQ1ZEdzZ1cnBLVlVPSmJaQ09aZlVUWWsyNzAzRnBadE5U?=
 =?utf-8?B?ZldTekl5RTJCeURJK24vTE1DWGt1WlpKRXhkZFVXc01LeEwybmxGT0pvdERL?=
 =?utf-8?B?OG1EUlRNb2FIUlIxUGkwSEVNanN6aHZGeXVNODZPdXhzYy9OT2w5WWNKRXZr?=
 =?utf-8?B?L3RWdThSYjJzcTFzbDBURlpvUUJ5Y3J6U2E0ZWtmaVJzcW9WSVludXZQQkI2?=
 =?utf-8?B?K3BjK3o3M1h4SzhRSVBRL3V1OEVjQ1FpbEpzNHVaakZxcjJTQUdGenhLZDFl?=
 =?utf-8?B?ZzZSV3ZxNEFvMDdFay92WXRaNG9JTHZOOTUwOHllN0hOM0tlU3oxcjlDWlQw?=
 =?utf-8?B?ajNRUS9GZnFSNTVnbXMvaVlNNUpvMHBLRHRDZ0h3c01FbXFwN2IxNFhqVkxu?=
 =?utf-8?B?cG1QajR4dDlxRGE5c2djSU9FYlNuNjczeEZ3eU5pSlBya3E5M0pKUWRXUFQx?=
 =?utf-8?B?SzhuRGxrR0t6bmt3RStrSGVhbkp1djU1VllQbVJXaTNnR2llSlp2WUpLUUJH?=
 =?utf-8?B?UHl2UmxIQ1ZIRFNxN3ZxVEdmcElGSnJETThDTmpGc2dtcHVHdkhhSVljdkE5?=
 =?utf-8?B?amNJc08rUHBHa1JBS3lFV1FLd0h4c2JudEwxeDNCWXp2dnFwN3JLdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6c03f3-7009-4216-5c2b-08de702354b3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:56:59.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1weQ+5kh2FVNsrKK7IgMUwA4rM2yjR4LwUjt9hJLIpqJvcyss4RWp5dSg2Eyljz3dKQdYcqUxilOLZVqALz+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: F27DB1642AF
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 3:07 AM JST, Joel Fernandes wrote:
>
>
> On 2/19/2026 11:24 AM, Danilo Krummrich wrote:
>> On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>>>
>>>
>>> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>>>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>>>> +RUST TO C LIST INTERFACES
>>>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you =
want to
>>>>> sign up for looking after FFI helper infrastructure in general)?
>>>>
>>>> Good idea, done.
>>>
>>> Actually, I am not sure we want to commit to entire RUST FFI infra thou=
gh its
>>> pretty tiny right now. Most of this infra right now is clist, let us st=
art with
>>> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C L=
IST
>>> INTERFACES [RUST]" sections.
>>=20
>> I feel like it makes a bit more sense to have an entry for the entire cl=
ass of
>> "RUST [FFI]" infrastructure.
>>=20
>> I could imagine that we will find quite some more cases where an FFI abs=
traction
>> layer makes sense; at some point it might even go the other way around.
>>=20
>> Once that happens, I think it would be good to have people looking after
>> intermediate FFI layers in general. But it does not have to be you of co=
urse.
>>=20
>> Maybe we can create the "RUST [FFI]" entry already with the following
>> constraint:
>>=20
>> 	RUST [FFI]
>> 	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
>> 	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
>> 	L:	rust-for-linux@vger.kernel.org
>> 	S:	Maintained
>> 	F:	rust/kernel/ffi/
>
> Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok with=
 this too?
>
> If all in agreement, I can make this change for next revision.

Sure (once we agree on what the entry should be named), that should be
low-bandwidth anyway as folks will be discouraged to use this module
whenever possible anyway. :)
