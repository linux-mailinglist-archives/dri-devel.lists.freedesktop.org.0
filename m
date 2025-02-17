Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03410A3855B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718710E4D2;
	Mon, 17 Feb 2025 14:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N71tKTwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1C110E4D3;
 Mon, 17 Feb 2025 14:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqI7tRq9WKOwiU2avy/i0aXSPqomDbRSYk3sj2blaESVdvxUh11pFB7uXbJ44+5tvB2e0IdN2vnJ/OrnA6fCwQ5MLjh1EhUsJJ0cmA3Cpl5DX7/S/djHIUu51UrZeRoGoPu17WnD74hma1g8Vf7rjgiu51pLDQYnG6f7vxnUMT9D6rIJIpEQcqvw1b7bVPgWNbXnueBShJIH5yQcFLkka/oYLN9OJ41f92UlArhINcX1YC/JzwcvBjjirCHuE6w0HJIaLwr6KH9VRrjFAFeMPRYm7fXOTRtHC2XMjkLYYpERdxupYfPm/jOMvBp4aqPWdDlfy4fuCTWbHj4Iae2OvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0giXkbfZ97KCjGxEv6E3orDPpMhefyg3MZB6wGUVyZU=;
 b=OCS3w/aKNWSFqzYNkgY4UBh+IWm+UF+iI7cddfdHMFpYq+j9d7b5a4jJDDJy+FpPKDPFfstsUMW+lQGNUqGfy3rzwq2MV0kRDoxNDkh1f7xOFCrS2mQGQ+GojwvjmT0nuj+TIF4/3cV/IZTBTd1DaUIRl+oNstthLrt8xQtwGAwdN14RMhbJHoaB9SnDwEWaHWE35odGPC3f12l4bub6YI0rcGRlF+osbIRIUCqrxeiyY9PIb/430St7zdgiQUAmYojOCVN4UYa1qi0nb0gOJvYuVEjwSOSnZu2AQ2MLT07xe+B05Ypz8VvO+tmQD8+zV7d8FaWNqqca7J6vdWUOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0giXkbfZ97KCjGxEv6E3orDPpMhefyg3MZB6wGUVyZU=;
 b=N71tKTwHE3jAqtiXzc4PuN7swJWQUCaFFub9whQVP8awHWZHnSgvNWEDf/IYe0YYd59CJPqRYhcoDcps+yhnoqAmByHsO9CS9+SL86Lhr+Saon7q/XHcvumKeTTqGQMjGyQbA3zwokO1sisS9/3SXecWcAFHmCr2j/OpnGa2BL6o4G8VkS+Dz1HFD1Ml4uXwXHqG+tA1Y7axJt61u9DAds/nPRkluVBkeWJoUsV4luKaShe1vUnTQJJ1ShNikjMftFHyQje89Zcn3iTmO8Q3iRMLGuimU0lxilMVjm4+HFdjInzoUC+eHWbIpB0ohH2mJCYx1CTQwfUh9lPdUOMPdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:04:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 14:04:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 17 Feb 2025 23:04:46 +0900
Subject: [PATCH RFC 1/3] rust: add useful ops for u64
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: afccc283-ab71-4a81-ad63-08dd4f5c0dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amcxcFZCUFM1ZEw4Z0JSOXZWNkNrcDJoWTNTRHV3YTl6RklwT0ZHQUUycE1I?=
 =?utf-8?B?b3pFY0JVM2VkWkxDOWJZclF2MzRqR3VOd2ZaWTB2V2JaUzFJUm9LWWNDWFg2?=
 =?utf-8?B?ZlVOQkdtd01jUi9MamxBQTJxeVROYkFwQUFTejNLY3NDbzJENUJKbWNrVzVz?=
 =?utf-8?B?bG5FSS8zOWlwWUxBdlBETlVIMmVFSWZyeEtGM3RyMEF4eXViUm9EbnNlK29S?=
 =?utf-8?B?UXAxTTR4SE4wR2l0ajVkODNwMU9odzJULzQrSmhMMXlURnVKaURaaG83dTdo?=
 =?utf-8?B?Q0VSNHdLelNaUnNENXQvT3RUVDVueE0rTDN6WFlIZEJJYXZ6L3U5Si84N1pR?=
 =?utf-8?B?ei9uQkpxVTdJTllEVzI4SVU4VTVPemRCeDFDbE9sTVVvcWIzSkMrZElJaWRm?=
 =?utf-8?B?YTI3WEpkT2EvY1h5YzY4NTgzNk5nSnJoeUIyZFpyUEIvV011clRRRy90S3h6?=
 =?utf-8?B?NG5tb2FjVkQ0NkJVQ213ekdwSjNxbE1Xa3Z1T2xEaWpLdUhIRXQ0Tytnd3ZB?=
 =?utf-8?B?Ty8vWkhwQ3VCU2cyMEE3U2VvN2dGR0JzT2FXSkJ4b3RJclREN0xEdHNJUlZX?=
 =?utf-8?B?RnViQmFYNzkzUUVVazRHUENwNGl2M3RzdEo3MmhZVXhSWFlHakV2MkhkdnV0?=
 =?utf-8?B?TEM0VFFNUlM4R1ZnVitXUWNBSk1KdTE0eDlEd3FQQnZEUHdrZll4T2EyZ09o?=
 =?utf-8?B?UzZVSGMzaXl1Y2xFMEJxVmtpWUxXSzZ2N1FqOTR4Ums4ZEFyWUMveUhsRDVP?=
 =?utf-8?B?YWltRWswWmlTNlFUOE9lT2Zoaks3U1hhcGNhVmJlaVI1S0grKzZVcWxlUUpS?=
 =?utf-8?B?dDFUS2M3ZUZjUHIwaDVlWDlVM3N2dE9yYWRCRUk1NGlBbmpBWnBMSVg2V2Rz?=
 =?utf-8?B?RUI0RThRWUJPa2RHWTdHM2F5b3I1M2V1UzBQQ1lIYWk5QVlPOVpzNlM1SWZF?=
 =?utf-8?B?dytyd0NOcHdoVzhIeDNIcVJNdGtPTzZUeUNTYXo1VFh3em42ZEpkVDF1SE5Q?=
 =?utf-8?B?aWRHWHNRdjMrV200Zzhabmh1VnlCL0lMcWYybDVlRmtzNTcvSXAwbXdOYlZ5?=
 =?utf-8?B?VXZLa0lpdEtRZW1nRWliRHF3MndRM3oxMEg4THVvZFZCVGtNK3I0TUZEb0Zq?=
 =?utf-8?B?R2gvZXB2SXdoZ2haWTVoeGYrNUJOWVM3ME16ejhXc21zaXBVVmZrTGZ0N1VF?=
 =?utf-8?B?RVd0QU83MUZQcmlzNEtTK1ltMHBSSWkrZmYrZ2RZYThFZEtNWXdUMTJUa293?=
 =?utf-8?B?dC91QlBZUkc3RlEyK0xmeTNuTFNXOEpVZ0ROdDhZUmk4SHJsK2crVEhZeTV0?=
 =?utf-8?B?V25VUyt1NXVGdFhmSTkrTzdxb2JERVNUWW0wRTlaVndxQkhVWUp0cjcwMDBr?=
 =?utf-8?B?TlkyQzR3V2RzeDVnWmFKZk1yQkFaWUl2YXdZa3hTSXpKcG1pTVpWalRYRHI5?=
 =?utf-8?B?TUVvWFE2WjFWL3dqQTQxN1JNWnRIc2ZxcU9LcU9hczdiZ2EyZTNCTjZ2aTZ3?=
 =?utf-8?B?SlI1VGNJcVVMTmlPSEgyM0J1cU81Q2xZSTBYYmNPVEpsOEVmb1FBaXhBcUp5?=
 =?utf-8?B?alEza2c4V1MzSkdoRklvNGhSTk9VQmw0QVpqSkM0QmtHVEw5WjlHOEN3Kzdx?=
 =?utf-8?B?dG5zZlduNC9EUXA3OHJFTFhCd0Y1T3kwVGJWRVRvRnV5OWg0QXZQanRJQnZW?=
 =?utf-8?B?UEJFRjlwNEV2TTVud0hyd2tta2JGTXRIcGN6anVETHJacG14STJ0YTcyMlkr?=
 =?utf-8?B?TnlVRG5RK1hjTGdvNmJxYWJpNmt5RFkwRndRb1NCZFJWOXlOcHgvOUpvNE9o?=
 =?utf-8?B?NU1oUFhVdGZES1lTNHBHL0FvMFRlcjUwc1pYMWxha3crLzdoTWRjaHNLRElG?=
 =?utf-8?Q?P2sf1VV6PvsRa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmMwcTQ3aTkyRS9nRG5ueElKNkxqcDgrVmt6ckZJVnZhQjhkR0tObTQvVEQ3?=
 =?utf-8?B?SS96K2ZwUnY4VnNGTFQ0aTFIbU92OHMyaVphUHR1RWhnZW4xZ0gvYXFSMnR3?=
 =?utf-8?B?RXBzQWtyUWlvL1BBeTN6dFZKOXFYRm83MDBjWlVhRE9EUGdvVnRGUzkwYzI2?=
 =?utf-8?B?eUZHS25IZ2hhR2Zva0RQMEZYRmVRZW5LSjNYQXZZalJ1ZUtMYWZNMXE3Y3U4?=
 =?utf-8?B?OXBzcW9rUzdDaHQwK2w1V2lqMFdwbHYwaTJXWXM0WjVGeC9iY0xrd3RFQmh0?=
 =?utf-8?B?UnNjUEM5Nm9zeUZQaEw5RUxzaDduMDBVRjlMTFpDVmkxVTdFU043Z2lOb0VQ?=
 =?utf-8?B?b0swY21yZFp5YUlRVDRzeEpqd1pPUDl3UTVrV3lGUGo3RlJLV1EwaU1EL1Uv?=
 =?utf-8?B?K29rWitSVHdycERWOFdHd2hCQncrbDNINjBrSE5vTEFzckVXTnBmeXM2VzVT?=
 =?utf-8?B?cC9LSVd5QmtDcGZKWVpVdktKWFdhTlY2Nml4ZDlXdmNxOXE3MG1GYXZvMmJQ?=
 =?utf-8?B?ZHF5Sk1kTVJIOWtrTVREekswbW1Pa0Q1NDNkZGsrTGVOYldQdTRGeHhxdFJk?=
 =?utf-8?B?YTJ6OHV3TTlwdEhiOTZGa3lqS2ozM2NIWTRCVzY3QitBdk93Y05QTHh5dWU0?=
 =?utf-8?B?WFZCSVE4dkI0dFlabUtRRzJwVzFHWXNidnNBQ2ZrdXd5cW9CcVB5NWJxR0ln?=
 =?utf-8?B?dlI3Y0NoS0tuamZqYndmZ1Z1N0hqeGE4Q05BaVd4Q0trQ1ZvdmdHVFFXS3Bo?=
 =?utf-8?B?R25qUmV6aHBOTENhN0xzN2JHakNTVGNKMlU5N0E3UzV2ZVE5Q2RoSWxBQkp2?=
 =?utf-8?B?RDI0VUw4N29PL1BuNEJBcWdJYWxkUVN6UmVJTTV3N0dmYU93RmZyWVlvclVD?=
 =?utf-8?B?Yk81amVUTG4vV0ZMS2JoSjF0T3JUR0tTdDdaRVlPN2QvVVV6L25OU1VOS3ho?=
 =?utf-8?B?QU52VFVKS1pweXgySEJkOC9peWQ2UWdzRk13cVZLbHNlSS9IaEg5TVV2eUVU?=
 =?utf-8?B?aUduYWVXckI4RjJqQlNTRVQyNmhVNEZENXg1WjJkV2paZFA1Q0tpYUNtL3pW?=
 =?utf-8?B?cExqdDZxZkp4eCtmejB4UFBzRlBBWkg2RGpQcXNaR1JyblFralcveW04bHJl?=
 =?utf-8?B?amYvMWR6TWRpcnFWaUZHbm1xMUFKa2s2MGs4aDNuRS9WMnVQaVZmVHNSTzhw?=
 =?utf-8?B?V3JvcHVFYXpiQU4vSEJHOWI0ZEhpWVp1MXF3ZGNIYkR0NlRUZ2lEVHFWYmFB?=
 =?utf-8?B?S3h5WXdYdVc5NzlmU201MGlWcEpiSUlwU1VtdWhadittb0lBeXAzbEFOZzFi?=
 =?utf-8?B?WnU0eDBiTFQ5MFFiRCt1WXNIWVIwR3pIeThFU2lXcmpYempoM09ScVRmWmRu?=
 =?utf-8?B?aXh0alFiSTBQdHF4d2RTSTZ5TGtXYTArZGc1ay9BTnBLZnZlVkFicEhBaDJm?=
 =?utf-8?B?M2cvMjJrdnhNcW53MGhUWFBwTVdtY3cvRWg0U2ZaRDFPL0g1STZPSHI4UFBm?=
 =?utf-8?B?QWRLczNMMTY1UWVOY05nS2NYaWRycW9tYWRmMFZNSUZ6MVNCRVpMZTBmQlJo?=
 =?utf-8?B?VVJPRjduV2w4alVZVHRzdGM1YnhlQTE0cjA4ZGZTUzQwM1ZwdmNZWEQrZEJ1?=
 =?utf-8?B?SkJlYThhSEdJNEZkZEdmckFTWFpiQ05qcG81eFppVFp3U0hTcTdadzFKeThj?=
 =?utf-8?B?aVRuOHF3MW0vREd0d01WOXUwQk0yblN5Y0wybEhTTHZuZFhicm13MXd4RTVl?=
 =?utf-8?B?YzE3dURFaW9QZm9jTVBSaVgvODJZNmlsbkZvR2xEejhkOWlCeHBvSXVWa29V?=
 =?utf-8?B?U1N6YkM1WkpPLzlZMzgwbytXWG1MNzRoVTRKUlNiTkxMYzE5bWtETklaNnV2?=
 =?utf-8?B?Y2pFUjI2QTdNdDVOZmJTN0pPdjhKYk9PTnZTVUw0SEY1Y2hUSm5vZnFycEwz?=
 =?utf-8?B?VGh6M1FRNkdrbGpEZ0lUMUs5dFg4c1BSK2gwRmFNSHZqcEM2LzNuNnI4UG9m?=
 =?utf-8?B?WVpiNnhYcHRaUk1XckxKdzdwKys2YXRhTmQydkhqNmNLQ3pyQUxVY05XTjRG?=
 =?utf-8?B?ZEVybkx0amR6NnBqalhNYnBXVmNYVEd5ZjFVOFFKUHo3RFdvTUsyN0RQR0hj?=
 =?utf-8?B?N1NwR3Z2NlA2Qk11S1huWU1FZlFqZU5DZFF4eG9LYkRGZTR6c3NSeUh1dXRS?=
 =?utf-8?Q?bORSiaaYzxKjPsepyT3whTxoJUMg60rxlxKV2MYtcSuI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afccc283-ab71-4a81-ad63-08dd4f5c0dd0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:04:54.6271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqfm1WcBo9gcf+0UtFOIXPq3avpG4vTlCEYISPhcOoyu7zAxQkca1alO6bNlss8ij4TYUJna1V4HlqNjZ2eDBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
 rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444be3e03878650ddf77 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -59,6 +59,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660580dc4c5683f8c2b
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,32 @@
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
+    /// Returns the `(high, low)` u32s that constitute `self`.
+    ///
+    /// ```
+    /// use kernel::num::U64Ext;
+    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x89abcdef));
+    /// ```
+    fn into_u32s(self) -> (u32, u32);
+}
+
+impl U64Ext for u64 {
+    fn from_u32s(high: u32, low: u32) -> Self {
+        ((high as u64) << u32::BITS) | low as u64
+    }
+
+    fn into_u32s(self) -> (u32, u32) {
+        ((self >> u32::BITS) as u32, self as u32)
+    }
+}

-- 
2.48.1

