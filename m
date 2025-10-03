Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB4BB74FB
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC2210E126;
	Fri,  3 Oct 2025 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qd8oJ0Rg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012012.outbound.protection.outlook.com
 [40.93.195.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9E110E13C;
 Fri,  3 Oct 2025 15:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bng/Stg3ZijDN7NOMwqT0M7vaiS9t3n0UKmSP32on23OJOYPHgKARlRuYod596oGVHxnpVsrelCThBEQNWsl/kaJlC6nNmJE/QLONAIZpug/eMYugbbVU06fcsVbkKHYVPFD64litqr2+nUmDOLN4g5fTi1QwKVsvjLO9dQdPpmaimPnV4OU/sE0HSdfmvxFUkk1ndvMs9p3AxTFrVpCO8jVva7+9ApQlr+xM/93PT5BAqAw9vJsdm+x1NUa5CzVXJ5eY9gwt5q0VBLojqtJ6Ax9uHL1L0qbgicWlO4HHKrVhdmvDH5irhYpHVJbMp9jfCGuO9t/itJmIeKoSlpxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtc5WMSxVlVNzPst3RpH9eKfrwJFRtvWi3FALTkEYoc=;
 b=cyPE9toTEj/YTOuvaHyAxOY54KZ3us7Lst99t4Q5crvjzJezNJu/ake+a3+V5JyWWNVggpRooEhx9TLtfuAQedCmES+NjMhfhVeOs82MHrjnnI6jFtDBDLbBDxUyfwCSOBAFZfQe+vQnZW57FSKBaptJlQ4fX2PGdRlAm3/7dQ22WEthEOOGD1KPJX3qNK5Xy/O02041Z9mnTNMv2TRWjr18VVB0o8sDvVHrW7Qe17sC2MxtlpbTgHZb3XvBGAXuLrLjR4UnUUYRbtoP2twMhBLCBYKweK2yu7Va2tpT+YYrDviu85T63f6j389jpJ38K9f0iWrWOKQwJjeoBLJD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtc5WMSxVlVNzPst3RpH9eKfrwJFRtvWi3FALTkEYoc=;
 b=qd8oJ0Rgr9/x8vlNqcS9XQBIcL5fBSSU8cpjRDnZnAtvBNZg2wsdedWP6+28DkgHbxKDaL5WjSbMVquoDUvXDujKXuK8Hy0czWud4tN1LsZniaW/eoZKRSi6XExuV4QFLzQ//COWiGxRp89W4mgwcGOnf0fKdjfrgzjnqzmkJgf7D9O8/O7d+pki8zkSX79scVCa3fhtb9tQ67kLEnMtpDpIv+c2qkehfDu0jFJTrvZF//TcWDGnhFx9pg+MnwCB85ewLeRNtZ9ccvgBo6XyYFwGq9T7xU901dgVILAprKCiqkqlYnLr8jd20LWJtHU/eJ3GlRFBh0iQDLE4sZQ5Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 15:23:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:23:45 +0000
Message-ID: <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
Date: Fri, 3 Oct 2025 11:23:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0039.namprd04.prod.outlook.com
 (2603:10b6:408:e8::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 69dde9f3-e127-42f0-8416-08de0290d7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzA3MUk1QWJlVEh2K3pzbkt1UzZGSW11ZDBZWEI2dDg3OUVKN0FYemVJSjBU?=
 =?utf-8?B?TFNld2liOGdpTmNwUVZINGR2c0VSRHlhY1ZrYXAzTjVLMTdmMW1pZXN6cTBn?=
 =?utf-8?B?eEY2VDNFd3M5eEZCajVzbFU0MXJnUUdpRm1JREk4UDlhRmlBS0xhb2FMdEpC?=
 =?utf-8?B?Z1cra2JTb2xQRWgzRjBlM2hRWDV3YUpCOWh6dTJlQUc2Sit6bXNpd2pyeHk2?=
 =?utf-8?B?dUM4bzNNRjBsVDMrZ1lwSEpGYVZxbWllSkphU1ZPd2NCNFB5L0tPSkVmNklH?=
 =?utf-8?B?NjBaRWpWSTB3em5IUlRScmlFL2k5ZUtZb2RzYzhOVHZMYXVCRFAwOWVyUnBm?=
 =?utf-8?B?SnQ0V2IrZ213eTZnNHVsUEpYaWJCWjBTckRJeFh0K2hiazUzdFFaTHVRR1Q0?=
 =?utf-8?B?blprbUV5UG1zMjZkdERGN2IzSWNoSjZ3akpVQ2o5d2lGc3MxQ2lYbXArV1Za?=
 =?utf-8?B?dk5Lc3phS2FVcGdFcmxlTGtHbjlPZW9PbGdpVW96NGVQZWxqUnNLOXVtMHMv?=
 =?utf-8?B?K004T2lmUzlVT0VqV1ZqWHRTU3hNNEVhR2RNNFVlNjNXWlFLOVFHYUpPbzMr?=
 =?utf-8?B?TnUzWUNseldSMk13UGd5OU8vRXdtNjNkQVhodVpGQjVOcGlUcVNPbi91YVlx?=
 =?utf-8?B?bmRVL3pVcHlvYzVQVkhWUjFDTUx3REd6bU5taHhabnJTaVR2bE1HKysyeDlW?=
 =?utf-8?B?dDBGZk0yT295YmFLUWJqNDFKMkM1WjVCaCswN1VNOEkrWXFrTDhNQkVJNXFl?=
 =?utf-8?B?MFh1WGhnTXk0NVdWVHMvckxhRm1UKytodCthTmZiOS9VeHdOMEdOVFBHUTZs?=
 =?utf-8?B?aGRLdlRrOHhiVjh6djhETnRoRGd4bVFRMU9WQ0NwNDBZdVFlTEJQWUVldVE5?=
 =?utf-8?B?c09hNzZQRzhnTHZoVER0NGRVSlhwOERoLzlmTVRoRXFJUzV5N2dXTG5VR2dW?=
 =?utf-8?B?QVFyeFZVdjIzN1o4V1FrY25kVUhRQzBaYlQ0SWxSUEk2YU9lQ2FIdWp6Q24z?=
 =?utf-8?B?a283T2Nxa0x4ZWZnallFbFFyaHM1N2tWYksyN05rVWxDOFJmZmZ4M1VTeFo2?=
 =?utf-8?B?TmFxRlc3a0QzMVNBT0RTb2toQmIvc2JyL1JabnhYRU93L0dHRUxkTVFmZXZJ?=
 =?utf-8?B?UGNLb1k4dlBROGY5cnorclUyUFl6M1RYUGZVYjBPVCtjdS9ZZ1ZKNGk3Nkd5?=
 =?utf-8?B?UWxaU055aXFjSEowUXYrUVh6ejMzOE1ERVhLNDBHaTU1R2RBNGJaL3p0cWJZ?=
 =?utf-8?B?YmhFVGo2ZVMydkZaK2VIUlZTbFVQbzVHNjkyTWR1YU1OSkVRNXVBaHc0Mzlk?=
 =?utf-8?B?bGU4WGNEM0toUHdPQWNVQzc5QXVZT1F1eWF5K1VrN0V6TjJhSTlkL0F4bUht?=
 =?utf-8?B?dXpheUZNY1U4TkNzOXBIZWl1RGRkMVprYm91MkoxM1crVDZzSFdRUE5XNHhB?=
 =?utf-8?B?OUs0Y2dVM09XMXU5RHVITXpvSEpPZ012SWJ3UXkxejhFWDJ2cjZzaUN4clFm?=
 =?utf-8?B?SWFZOVlMWTI0aUxTUnlMQ1BYcVY0WjBCUU8weUtiZTJzOGt6dUlFNHJONnQ3?=
 =?utf-8?B?V2x1Mm9VN0hoQ2t6MFUwa0ErQzJZc3Byd3dsR3RZMXh4MlV3a0F0VW9mbmtQ?=
 =?utf-8?B?QmJXYUFRaVZkK25aNURzZlQxNmNNM2V1N2k4OUhEMnh6ZWs4dVlLSXNWRlRW?=
 =?utf-8?B?NEpMdzNwK3RMM2dnS3U4czVjWWdJUTVtZWxuYnF0UU1FVFBSV2FMVGpZTmxO?=
 =?utf-8?B?VUxhb3Y0SzA2UUovZ3RzTlFoSWZoeHMxMTBmekZacVJ4UlpFL0V2ZitMUmJx?=
 =?utf-8?B?d3ovWmRtZkhaa1lyWGxIcHpOZzc3c3dCS3R0QWxURHFyNkUvTFlrS0JyL0Zx?=
 =?utf-8?B?SVhpZWtmNDl5RTlGdEFlYXRMbGpxc0tSQTQ4NWFDbmFtU3g4ejRVS3ZNZy9C?=
 =?utf-8?Q?plnYXazVUsdhPA5dP4+ilbIgU0QWsThN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJRZTJRMEUybTc4azF6UTdGak5uL1JVNDZzNDRENkExQ0hYTlViNHR5blVx?=
 =?utf-8?B?UDdoSHh6U0I1dUpFYkw1RzFTZDBGajN6aXprYW9tRk1IWE5aMUFSeFZWRkJp?=
 =?utf-8?B?YVkxV0pud3lHMi9vb095V2dXclAwUmV4ZHdDVkY0M2RDeFVVeW1hcU5sZTJv?=
 =?utf-8?B?S2RQUnh1TGtOV0ZmWVZmMTBPUnZmZmFTUGh0R3NqT0c2dGZNS085U1ZSckZY?=
 =?utf-8?B?bGVoQXh3elVNL1Y2NElwS1BZWlA0SGQ2eHVza3JJcm1wdUNweEQ0UWthaTA4?=
 =?utf-8?B?WmJsejUwRmdWaHhpZVhZNkVaQitPazdLdTZhMnk2ODh4T1EzSUcvWHhvNUFF?=
 =?utf-8?B?b096SmdFeG9wd0tNaEJjTUhWSWR3cThoK3NnbGhpNUJwd0N2Y1hLK2FZZHF3?=
 =?utf-8?B?ZU1wRUcrbFQ0S1RjbjRDUHV1SllZTzRCOUh4SHoxTHlldTdyaHJUcU5ZL2dG?=
 =?utf-8?B?YWh0MkY2TUpCeTdrN0s0clUrVGNXTFlXOGJOdEpvb0E1RU16MTRkRW9DZUFk?=
 =?utf-8?B?Y0F6WmNlbHpQTFFSYWhOemhvdkVyd3VLSnM1dDJINjVLbStBQ0F1eUVKdW1R?=
 =?utf-8?B?L1hQODVYazhNVzBNK0hmcG5yL2FBR1NQVmZ3R0NOM1UxZ1pMaWd6eEloNHUr?=
 =?utf-8?B?NWV6KzlRNFBQVWw3ZVkvcElZWXdiMmkrUWpVQ3RPQWdoUFljWTZNbEh2ZjFN?=
 =?utf-8?B?RGJ2TlNLNWZkMHVyQW9EUURHWTNidjdLUjFZQytvayt1eFA3WE5WZ1g5SjBR?=
 =?utf-8?B?V2ZvVTNkQ3dPNGZCVG1PZDFFQUZTOWNLN25MTVp3VlR0cWJyL2NrU3RIWXBI?=
 =?utf-8?B?UHZILzlyRGNKelZ0NmRyWWxLTkV4dnJsRE1rTmcxSDRrWjVmRnJUcWFlZ3hF?=
 =?utf-8?B?RXVwKzF6YzVscG5ibnVrZjBnY1gzWEZOeVJJL0tURDVvTWZWNk5oRktMdlFs?=
 =?utf-8?B?VHVwdFQxSHZQRXpxK005NjlmNW8vcW11TU0xQkN2b2lUWnRFbGJIUXlPK1hX?=
 =?utf-8?B?THhPb0Z1cUZDTklzaEFCL0hCWVYzL0t0WGVWNDgrdTJta3NkVUJrOGpkb3dU?=
 =?utf-8?B?RUlpN0RvaUZVKzFGWHdhWFFNQzVTbGVEcUszN2pMdTE4Sys3VXgwbFRtVFJE?=
 =?utf-8?B?amlDYmZIZ2VBSEJDbjNwSnVleFZVU1BZTTBQcWNSMEJUZW9EQklTdXlPbVc2?=
 =?utf-8?B?UVgvRHh5OVlTajNZMkd3MDh0Vm1LQVEyaWNFK25lVmVGNXpmNkpxZkdvcUg4?=
 =?utf-8?B?M2Y5OGs0VS92THNzUGEwb1hNNVN4WTNaRzk0aTVTdTZ4RkRHQnZ1akF2aTc1?=
 =?utf-8?B?ZTcrb3B4b0lVeFBjK3I4cGt3ZDlSWERtZzhzTUhOV09TUVhyZXpHcktGb05Y?=
 =?utf-8?B?N1o2OTV4UmpiOXZHTUtmNUt6anRrZzdCblRURndGaE9hK1lEVUc2Tkx1TVlV?=
 =?utf-8?B?cUVubFo4L3pnQm01M2FhenJrZ1c1TmJESmJBZmJBd2F6Ty82dUpGSEtRTjZh?=
 =?utf-8?B?REU4ZmtJM0lEV3pjTmUxdGFIazVDVEJydnQrbkdBOEFKRTdZVlFGZjkwVUQr?=
 =?utf-8?B?c1Z1anVVaFhXWENKZCtwU1d0N3FZb0xtcmp3WDhkTElQYlF6Z1VHbEJGVUlz?=
 =?utf-8?B?bi9RUTZwWG0zTVRLNHJJbG9ZSWZGdTZoSXl2c3U0bi82aHdiaENnSS96Y1NE?=
 =?utf-8?B?UVNyT3dxWjZ5TWxyZ015V3VzWGJZL3ZaZHBCT01pTjRnZWVDK3FtanlNdTBV?=
 =?utf-8?B?V0lsd21UTS9FWVZrNUxocCtXZ2tlcm1NWkxFNWpMYUovMWVBVXljQVVvVlNt?=
 =?utf-8?B?VU02SGlTMWsvTU5jQVVZdWRxSjI2RHRhM2dZYUU1YXUwemNhSzRVdTZoaDJw?=
 =?utf-8?B?bm5wTE11WjA1clBkUFFWL0M1aHNTbEh3VmdEaXlQQ2l2dzVaa1IrR1c1YU53?=
 =?utf-8?B?MDFGTUVPQzU2K3BHZWJTeXp1T1c4RGNnUW4wNWd3UlFDOVdiTXNqL1M3OGNn?=
 =?utf-8?B?am9weVFlZHoyOW94UWFocERiU1doZVZWaysrdHZPdUFpdGd5WDFzaWlhVjVa?=
 =?utf-8?B?VVNSREFRQ3NmWnZubFJNeVc2TmhQc3o3RjRIc1E4Q3VNMkxPWVE4emZaSVpP?=
 =?utf-8?Q?Btu3M6hAsdJsVam+HUrZwZVhu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dde9f3-e127-42f0-8416-08de0290d7f4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:23:45.7202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ws9J6R9G4PTBjz+3pmZKTglvxuQuoDVGdig2nftLR9f/X79thWqu99DgiOmJhG4oCYgGdWvOfp/nm2OQLO7oeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
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



On 10/1/2025 9:41 PM, Alexandre Courbot wrote:
> On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
>> Add KUNIT tests to make sure the macro is working correctly.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  rust/kernel/bitfield.rs | 321 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 321 insertions(+)
>>
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> index fed19918c3b9..9a20bcd2eb60 100644
>> --- a/rust/kernel/bitfield.rs
>> +++ b/rust/kernel/bitfield.rs
>> @@ -402,3 +402,324 @@ fn default() -> Self {
>>          }
>>      };
>>  }
>> +
>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>> +mod tests {
>> +    use core::convert::TryFrom;
>> +
>> +    // Enum types for testing => and ?=> conversions
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum MemoryType {
>> +        Unmapped = 0,
>> +        Normal = 1,
>> +        Device = 2,
>> +        Reserved = 3,
>> +    }
>> +
>> +    impl Default for MemoryType {
>> +        fn default() -> Self {
>> +            MemoryType::Unmapped
>> +        }
>> +    }
> 
> Tip: you can add `Default` to the `#[derive]` marker of `MemoryType` and
> mark the variant you want as default with `#[default]` instead of
> providing a full impl block:
> 
>     #[derive(Debug, Default, Clone, Copy, PartialEq)]
>     enum MemoryType {
>         #[default]
>         Unmapped = 0,
>         Normal = 1,
>         Device = 2,
>         Reserved = 3,
>     }
> 

Good point, changed to this.

>> +
>> +    impl TryFrom<u8> for MemoryType {
>> +        type Error = u8;
>> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +            match value {
>> +                0 => Ok(MemoryType::Unmapped),
>> +                1 => Ok(MemoryType::Normal),
>> +                2 => Ok(MemoryType::Device),
>> +                3 => Ok(MemoryType::Reserved),
>> +                _ => Err(value),
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<MemoryType> for u64 {
>> +        fn from(mt: MemoryType) -> u64 {
>> +            mt as u64
>> +        }
>> +    }
>> +
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum Priority {
>> +        Low = 0,
>> +        Medium = 1,
>> +        High = 2,
>> +        Critical = 3,
>> +    }
>> +
>> +    impl Default for Priority {
>> +        fn default() -> Self {
>> +            Priority::Low
>> +        }
>> +    }
>> +
>> +    impl From<u8> for Priority {
>> +        fn from(value: u8) -> Self {
>> +            match value & 0x3 {
>> +                0 => Priority::Low,
>> +                1 => Priority::Medium,
>> +                2 => Priority::High,
>> +                _ => Priority::Critical,
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<Priority> for u16 {
>> +        fn from(p: Priority) -> u16 {
>> +            p as u16
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestPageTableEntry(u64) {
>> +            0:0       present     as bool;
>> +            1:1       writable    as bool;
>> +            11:9      available   as u8;
>> +            13:12     mem_type    as u8 ?=> MemoryType;
>> +            17:14     extended_type as u8 ?=> MemoryType;  // For testing failures
>> +            51:12     pfn         as u64;
>> +            51:12     pfn_overlap as u64;
>> +            61:52     available2  as u16;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestControlRegister(u16) {
>> +            0:0       enable      as bool;
>> +            3:1       mode        as u8;
>> +            5:4       priority    as u8 => Priority;
>> +            7:4       priority_nibble as u8;
>> +            15:8      channel     as u8;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestStatusRegister(u8) {
>> +            0:0       ready       as bool;
>> +            1:1       error       as bool;
>> +            3:2       state       as u8;
>> +            7:4       reserved    as u8;
>> +            7:0       full_byte   as u8;  // For entire register
>> +        }
>> +    }
>> +
>> +    #[test]
>> +    fn test_single_bits() {
>> +        let mut pte = TestPageTableEntry::default();
>> +
>> +        assert!(!pte.present());
>> +        assert!(!pte.writable());
>> +
>> +        pte = pte.set_present(true);
>> +        assert!(pte.present());
>> +
>> +        pte = pte.set_writable(true);
>> +        assert!(pte.writable());
>> +
>> +        pte = pte.set_writable(false);
>> +        assert!(!pte.writable());
>> +
>> +        assert_eq!(pte.available(), 0);
>> +        pte = pte.set_available(0x5);
>> +        assert_eq!(pte.available(), 0x5);
> 
> I'd suggest testing the actual raw value of the register on top of
> invoking the getter. That way you also test that:

Sure, I am actually doing a raw check in a few other tests, but I could do so in
this one as well.

> 
> - The right field is actually written (i.e. if the offset is off by one,
>   the getter will return the expected result even though the bitfield
>   has the wrong value),
> - No other field has been affected.
> 
> So something like:
> 
>     pte = pte.set_present(true);
>     assert!(pte.present());
>     assert(pte.into(), 0x1u64);
> 
>     pte = pte.set_writable(true);
>     assert!(pte.writable());
>     assert(pte.into(), 0x3u64);
> 
> It might look a bit gross, but it is ok since these are not doctests
> that users are going to take as a reference, so we case improve test
> coverage at the detriment of readability.
> 

Ack. I will add these.

Thanks for the review! (I am assuming with these changes you're Ok with me
carrying your Reviewed-by tag on this patch as well, but please let me know if
there is a concern.)

 - Joel


