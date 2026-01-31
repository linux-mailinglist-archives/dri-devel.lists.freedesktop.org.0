Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RrZEMtcAfmlqUwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:17:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC96C1E13
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5489151;
	Sat, 31 Jan 2026 13:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lR5nwOZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C9F89151;
 Sat, 31 Jan 2026 13:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipozqpODWGHtzHPeWCmC1FMRGWus+ZL32l91gE7z/4/zW91sSW5rY1k8DB7SsLA6OrSpFitRVhkYA0czKjRy1bpa9eUfFTJ62NAwtB2YSz5MR64OfzBIFpStUmV9pmCdFRuM4Ntj4CD8iW5Q7NcUzuMCunVr0qhcuoIypV/+EztLwsN3e/gK0TUR0ZjQw2T3OyooscvATwPBKsAz5fKQEKDJiIAhjRrBiaeTpoaE1z+a/Ga4nGAzX0uJLfoL3K968eTwTFnpWAkZTb5qR//vYLDz3x+vqi2vCS+5AqqYDOvWupHNgYQYjsFQ5R2E1yY61WZEtQcmhNYPrdC+LPoOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htE3EfQ5QzS62RP6GVe6p0WVAAsNbxhaO4Du9ndFYCo=;
 b=hTTdNB93UXrxXElAawY4Fx+2RXrO2/9he+4QFKlUKxrG4XCOCJYMA4icetXipWTnmNmaMZtDhbaXfjTWu1iIHjhriuAv0YMYxcf+ANZ3j8YPNiF5Z87tvW4NAOCYNAcGpkvWLqYd+0cRmikQQzzUc2HQYTH7u3FK46KapcMAS4fy0hGX2OsW4QhGF1WqWNBS1e4gReQlJCGgs4mF+ofYNBHAtgm67H26BhgrhCd5/x8BKJrLQ+xjz9YbgMEfZvE4XImnD2zfPU47sjFNgCNfHvdvBvlzKyfvh/GHESFw/aZrR7aMd2gkQDkrEMg8hX8l/luXvGsFqhJckJJvPkTipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htE3EfQ5QzS62RP6GVe6p0WVAAsNbxhaO4Du9ndFYCo=;
 b=lR5nwOZN5Os3iQ8W4R3lPC7OsYo2iqRF1wDAubTJE1VxkEEbleKW7OEi47RJTNF0SUk16EQPNPIrM75jCVHYlI/WITb98l9RA6L9SUUtH8McbLXlbDj1HhQvadUP3f6iVkjNc5dWfW/J7srFb9GeALl7kFwHw1XlLAg9J9/31qCVCNqZ8JlVUGPuSnblmW5YLHyMkAlMeG+oHBkgnMJDU1+PcOB7v3PD/hnB3p3RhHyVokE7t5CGz3eBaEJ1ZT1/6d7q6fYYv2a6tJAJmxfIZgW4IDwButLnuiEMXTqSJrIYzc0xAQvVk9ruuON4xbxhNjAanEcQUfl63GYs8G6yAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFF62310189.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 13:17:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 13:17:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 22:16:58 +0900
Message-Id: <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
In-Reply-To: <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
X-ClientProxiedBy: TY1PR01CA0192.jpnprd01.prod.outlook.com (2603:1096:403::22)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFF62310189:EE_
X-MS-Office365-Filtering-Correlation-Id: 469b71e7-a687-4a29-79fe-08de60cb0583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWVNb0UzcnZPcVpkTFN5SHhKUzdVaElydnlrVTN6bDQ0NEFub1lwdWJUenAw?=
 =?utf-8?B?c2ZNZlR4NVRoMnQ1dEpwZ08yckQ5OFliNWZsYUpZejZFRjhTL3hyZW1JV2py?=
 =?utf-8?B?TDkwdkxwdUxzUGJhQU9mTE9jWS82OFFaTERBeWN2MUl1ZUw4M2dSSGEzYThL?=
 =?utf-8?B?NVpnRWdObmlwNG1SRFB1aVdsVXRpNVNnMWxPb29VaG1XcWVyOURJTUxnWFJS?=
 =?utf-8?B?Vk5PSVdvWTAzeFprWG9lL3hGWG1YOVNHMlRZM2ZFdXcvN2FNUzFlN04wbktF?=
 =?utf-8?B?aG1Pb0c3bXltQXI2ZzhRRm1GVmpsV2N4L3lRemIwYnVyT1VoUWg2Q1huNHpV?=
 =?utf-8?B?c0FsT25aNlhBREpYcTd3OHpsZTRjaWVXWmh2cERUT2Z3WVdvNG9XZG1jRTg4?=
 =?utf-8?B?WnZVYktqYWhQMDhoZFlLTk1XU0RNOXFFM255N3psMVhTcVdqQUE4cDJnVm5o?=
 =?utf-8?B?OWpiRzArMnNhbDcwNUxKTVV2ZVV1ZEM5SmlzQ3llYy8vb1F2Vnd5VmlhWE9a?=
 =?utf-8?B?aURrUlF1UEFTNW9waXlZL3NEN3ozdUg3TGZrayszdW5WVUt0N3VPc1VEMUJ6?=
 =?utf-8?B?TUx4YlpJTUNMeEhWVW50VDdLYmg0d1MzME5vUFIyMGRYdkoweGNHUnEwenN5?=
 =?utf-8?B?SjFGUzQwM1pHUDlPYjRpaHV2MEdSa3NyYWJHZ2VwbGhoWFBIVmdiV0dCZ2ZC?=
 =?utf-8?B?bUVxMG0vM29HQWd0VTAyKzdNbUlIZ09JRUtYMVVaMlY0Rk9wcVVQTWt6ZHBG?=
 =?utf-8?B?c0ttaUF3djZvdThEL1NIbkpZMVBQTmlETlk0TGoyQlVmaUZYZFIzY2Y4YjY0?=
 =?utf-8?B?N0VHNGlaSExEVlJkNU93dkZBT2UrcWNiR3o1WnBQVkhEU2E5QS9WU0wyVHpB?=
 =?utf-8?B?WkRldXNyNzhCbXZJY0dOanRBNVZZRnBhSVNmMDlDUElxKy9xelI1UllKTlpK?=
 =?utf-8?B?VzdTS0tNWGRrZzc4K0dqSUJMT0YxcHl0aU01aG1RT21yZGRzOWdBYytkTWRX?=
 =?utf-8?B?alBTOVlwZUgwVzhCUnF4K0puVEtvR21oMG1XeERrY3RSWEdSd3BleVlFamNm?=
 =?utf-8?B?Rjl0M21YTDdwYTlrb1lVYXFvaHhFSG9NUUFPYitkanJqZzVmQ1FZZjRnRThz?=
 =?utf-8?B?eWNONFdkSTVCZUc5Q0J4ZGUwVi85OEtxNUprWHdtQUlSUG4xbzJsQUNDL3Rh?=
 =?utf-8?B?Z0FvTmJCRHhZa0UyWkZsMUNocFB6bnYyQlJvZGd1UjFoTlY5QnhZdzhHc1BR?=
 =?utf-8?B?MEVJS21KYWZQRTNGWmpERHlSaDVzVWs0L2l0UzJ3TXl4dHo1cGVPVmRnQmR1?=
 =?utf-8?B?SGU2MmJTdTlLRHluVUwvaTFCMFF2WDZxd1NrK09jNk9sbnhlY3pHVjZXSUZH?=
 =?utf-8?B?Zk9zVTVuY3d6N0lOcHlmUVU1QU1CWlFHQVlFWEQzaXJ2QkZFRG1pZWNXc0Y4?=
 =?utf-8?B?WUhJblNacW1IQzlRVlVtYlBHZ0VwRXJxRzEwVTJsemp1L0NIN2tDN2NvRTI3?=
 =?utf-8?B?Wm1ITG8vNFUzS01KTzJyTUMvR1FueUVkU0dGUk1PNUZqbGcyOXdHbTJ6VUcr?=
 =?utf-8?B?eHN5dENBc2hsYy84dUl2M010RDkzMjFKOXdZKytzTnpXNy8xeDdmU2tLY3k1?=
 =?utf-8?B?ZmdNRlhHeE9FRkIrWWRycVZIS2ZHS1VWOXY4ZUNsVHlWb1RobHJLY1ByeERI?=
 =?utf-8?B?dXV1NDNXdWdWRDZIU3YzLzNhVXJqdUxQekd4TzZIVTVoaXUyVE5qRXpvd2ly?=
 =?utf-8?B?Y3p0d2xxNGw3VElnZGZ4akpXN1Znak1paTY2MkFZejhSNTQ4UzREbzhGRlhN?=
 =?utf-8?B?YnhPT2lGMmdtMTIvTW94eEFTb1BBTXlGb04xck1GWG1sdzVjUkxIaDV2OFlH?=
 =?utf-8?B?U0JPbFY1N0J0UlB3b0d4RVhVclRxYVh5Q0dHTTZ1WWhUVkJ2YnVJNzN3b3FO?=
 =?utf-8?B?M1NIRXRFTVVSQXpvSGswVzh5NFpNQ0hQVmd1a2hWcUNjOGd4VnZIcWJJcnkw?=
 =?utf-8?B?UHI1a0t1VTd1OTZIMXdlZUFqL1QxczVUYVA0STBGOGpGaFZHNDhvMFdnSzh1?=
 =?utf-8?B?SnpWaVBVcVU1bTN3UlI5eTlkN0tValp2OEErc0svemUwaTdUeE5ha2tIWkpQ?=
 =?utf-8?Q?z0OY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE5DWkd3cEg5a1BDR2pxaFNMTjAwZWplSU9Id0RoZGVNemd0SUNXRE5yNlll?=
 =?utf-8?B?eXEwcVRPNjgvNXJFWTZsdmNPckgvV0NvT1VhbCtEWFlqRFE2dVVNYklwcnhw?=
 =?utf-8?B?em1UenovUk91aUFTZGY5RXl2VVc0a1oyZEd4OHpHN0hXZ2hUZFJqUDlDTTJD?=
 =?utf-8?B?V08xMDZUV0ZPeHJRd21oTCtEWWFpZ1RIb2d4QjEvQWhYMW5RdktKMWNCaEpU?=
 =?utf-8?B?UHcwUU5vOVVEZ1JvOHIwcDdDWmx6RkhEMExKYjhWcXhueHRiTGYzbXQ1Zk9p?=
 =?utf-8?B?UmtROWR2NFoyajl2eFU4aXA5dWY4dUkwTzBJeW40WW8xWForR0xORjNEUnRV?=
 =?utf-8?B?QmpaTGs1VzcwdHB3YXVyRlNLQjdwSk14MzUrakdqQWtFd1Y0cDV6VmsvNXBW?=
 =?utf-8?B?NlhnejZpSTRNbnFCTDN0M3N2aXFoRGJnMDJGZ2dlODJxYnR4VFQ2a1pLUTRE?=
 =?utf-8?B?Z1hxNnBkTi91OWVjd2JsZVJKWXg0d3Z2bCtVQ3VkTXVoYXFyN1NxR0pRMzJa?=
 =?utf-8?B?NlowRmZYSk83THhuUXlZTkMvVEZORWY5b1NvZnlGcmE3WXE4NjRodTczaGJw?=
 =?utf-8?B?ajF5R3FheFZwYlRBcEU4MHl1VUdEU0J3U0VXOHhDVklzYlIwUnM3bTZqUWVw?=
 =?utf-8?B?NGVmZWttRjI0YVdrZ0pNUEVTL3FYZmI5QXQ2T3l2K1RmZDNkVzFaQVVCNkhI?=
 =?utf-8?B?MmR6VDJJWkM0Uk12U0hxa1FSMUVKM0dzY0h3aDFXYTVVQ3ZzL3Z0ZFROeVpD?=
 =?utf-8?B?WVFob01qWWhEVTF4clpEeEd3NXRHNzdGZWJGNHFCTmJ4YThBYTRRdHZ2WGw0?=
 =?utf-8?B?bFJVUU4xVHNDWUY2ZzZZdEpLemJGUUgvRXFnSktvM093ZWI5TVdUZGpKWXQ2?=
 =?utf-8?B?bjYvTlFSSUZNOVVoOXlXZmFiRzVnTVJwYzFUQ1BEeEpzUTIwWEJDTkQ4K1dB?=
 =?utf-8?B?N3M4UWJpSGxLb3dCWG5INE9aTUlCY3k1RGpKRFpKRGFQbWdGbUFiU0xEYnhH?=
 =?utf-8?B?ZE9sUmdQNE5Uc013UlpMTEJqTHoxemdMWVFLQVgvQi93bE56bWZUMEd4Yzli?=
 =?utf-8?B?TTJNUXczNmcwNEdHbHJ1Y2E1b1plSjRIdnVMdDF1WXBGQXhsNVIycFZsUFZr?=
 =?utf-8?B?RENKZEVJQ3N4c2gvMW5XSHp1c0N0NitSU2hvQ3dTbHkvV0IrcjJKSVE5YWZV?=
 =?utf-8?B?L1Erak0zbzF0OTNCaC9PR0x1elB6WlRYbXd1TDVXd2hKOXJ5Yk92ejByWTJs?=
 =?utf-8?B?TXcrUnNtNFNkK0h6UUk5QnU4Tkc0dG1tZlNjM0Vld0NCUTV4TlM4b1I2dVRm?=
 =?utf-8?B?NGJ6SjUvajRKSDdLdGpKODhScStiMVozU3NueWFHZ2QyRU1jbXY4N1ZrdzZt?=
 =?utf-8?B?UlJhK2JGU0pyMkNhV0ZvWWlaVTBVK09JQnh3cGc1eXUzSFdaUThvc0pQRGRa?=
 =?utf-8?B?VzZZbDlVMTF4dkxmT2Q0aTJyY1BDcEI4Um9jK0F1UDBDM09NNERESDlwalRR?=
 =?utf-8?B?M1h4SkZoRkJqSnVBS25kOHp3RGlLajZnTFFZTnhzOUl1WUY0SXVhK2NqUFIw?=
 =?utf-8?B?RU1mN0swMysyZFAxcWNvcVFhS1lySER3cHgvVFpZcWUxN0RJdUtOM0YwZ1ZS?=
 =?utf-8?B?VGtvVkNycHNNVVhuOFJNZWRMNDZnVHNlc2kwSk5CSHI2amVSMWJQTU1SU0VO?=
 =?utf-8?B?aWVMVnI0cExQZ3h2OElZdnJpajhSRE1kODhBOGN2ZmpnbDZFa1JZZHpUd2Jj?=
 =?utf-8?B?TFVVQ2Y3V3ZNa2x0UUcwdjVhSnNFNWdPeFEyWFo0MXlJRWpyZ1JSWHdsZi9E?=
 =?utf-8?B?bzN1VWVPOHdwM2lUTmNnY0RhQTgrTDBHSXZMQXNwOTNEdkJ0SXkrVXNGM0Rp?=
 =?utf-8?B?NW5pMkV3UEpSY2hqZlpYY2JXVk5nQXpOYjdSTTFEWFlIMmpFbU5uaytUKzZP?=
 =?utf-8?B?aHVWcTExUUlYcU9pVkZvMDRWZVkyMHNzdG04L1BhdTJtcy9nNjhDRVlybmVQ?=
 =?utf-8?B?a2dIVlBpdyszdlozVWhVOWZJVjI1cEI0eUF5ZVF0cE9TYkRnT1lzWkgyOU9q?=
 =?utf-8?B?cGxsOHd2TWRoM2UyTitySVBtbXJtZStiSmQ4OG43OXM2YzNyUmRGbmR5d2ts?=
 =?utf-8?B?MkpNZ0xvRWswSllKNHhPVEppcldrZ01IazZLWU5NamJxSElwb2VqZUM5TmZT?=
 =?utf-8?B?eFJSK1VNNEcwQTR1SkZRSTg4RU5KZUM1U0Z2dGZmUzkwVDBzUFduTDQ3YzZ3?=
 =?utf-8?B?em9WVlcyZXZrdkNlRlNWek1MY3AvSDkwWU5WQllpZTRZTmZVNDFhb3QwNVVO?=
 =?utf-8?B?blZLcjZ0ZTIxUWVHaGRIUG5wUFNyUkkreWZpdHZSeWQ5Zm9FRURRbFdlaXNt?=
 =?utf-8?Q?nEyvxSuUp1ftabHMrjgB7GBF2uWiQCegtKT8vLhz10jWu?=
X-MS-Exchange-AntiSpam-MessageData-1: Y1XcpTuF1zWosQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469b71e7-a687-4a29-79fe-08de60cb0583
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 13:17:02.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rwElTbv5ZC8VFP3mDCsXMynJP9VLagm8ImA4FmSa7MbEZIRrNCqhPLU74YUTkeDoutgmY9x5EgbB/z5t5A2vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF62310189
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,ffwll.ch,gmail.com,collabora.com,arm.com,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1BC96C1E13
X-Rspamd-Action: no action

On Sat Jan 31, 2026 at 9:27 PM JST, Danilo Krummrich wrote:
> (Cc: Lyude)
>
> On Fri Jan 30, 2026 at 9:34 AM CET, Eliot Courtney wrote:
>> This series extends the DMA coherent allocation API to support compile-t=
ime
>> known sizes. This lets bounds checking to be moved from runtime to build
>> time, which is useful to avoid runtime panics from index typos. It also
>> removes the need for a Result return type in some places.
>>
>> The compile time size is specified via a marker type: StaticSize<N>.
>> Statically sized allocations can decay to runtime sized ones via deref
>> coercion for code that doesn't need to know the size at compile time, or=
 to
>> avoid having to carry around extra type parameters. The implementation
>> follows a similar pattern to Device/DeviceContext.
>>
>> The series defines three type aliases: CoherentSlice<T> (for runtime siz=
e),
>> CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (fo=
r
>> single object allocations). It also adds infallible dma_read!/dma_write!
>> macros and methods to CoherentArray, while prefixing the existing fallib=
le
>> methods and macros with `try_`.
>>
>> The macros keep the same syntax (i.e.
>> coherent_allocation[index].optional_fields =3D expression) even for
>> CoherentObject, because the [] syntax is needed to know where to split t=
he
>> actual CoherentAllocation object from the fields. This means that
>> CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
>> alternative is defining a separate macro for single object access, but i=
t
>> still would need a way to delineate between the allocation and the field=
s,
>> perhaps by using commas (dma_read_obj!(object, fields),
>> dma_write_obj!(object, fields, value)). This would be inconsistent with =
the
>> array/slice syntax.
>
> We've just generalized I/O to support arbitrary I/O backends (busses, bac=
king
> storage, etc.).
>
> With this we can wire up the I/O traits to DMA and generalize the dma_rea=
d() and
> dma_write() macros accordingly. I.e. we can extend the I/O traits with
> field_write() and field_read().

With the caveat that the I/O traits for now only support accessing
primitive types; is the plan to add a function to read any type
implementing `FromBytes`?

>
> (Lyude is going to work on this as a more integrated alternative to iosys=
_map.
> It would be good to align with her regarding this work.)

Heads up, I am also doing some plumbing in `io.rs` related to the
register macro. Maybe we should have a thread on Zulip to discuss what
everyone is working on.

>
> This has the advantage that we don't have to duplicate all this infrastru=
cture
> for I/O memory, DMA, etc.
>
> I also think that CoherentSlice is too specific of a type. I'd rather hav=
e a
> generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backen=
d for
> accesses.

For me the main appeal of this patchset is that it provides a way to
work infallibly with a single object or a fixed-size array. I hope
that's something we can preserve.
