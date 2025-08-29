Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819AB3AF81
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B7410EB13;
	Fri, 29 Aug 2025 00:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CUvhZT3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7710EB13;
 Fri, 29 Aug 2025 00:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnkSSoX74fiy0ixd+BfY7JFBqqeiVDHLw7Ot4l8QLE0SKKgND9U/vVDPhau0I6gFGj8kMdnXqm0g0dEdEg2hbNrWm4EP3DYqSdAIbvKAQchSRca51gBOI9s9OwvDPrNq23SY0xdYOHa4prbcyHVl6/LprMIlnaJ/OxU58dFglzhPuviK0zzPFsJ+xVfqf/dIBXkafsFo/2TvFsFVbfI+zrEMlnLlOubWMh26aSBFAalOW7WmRwlVypWLTnVmWRQZTmnFVZmpeQGjcxIN/I3i1Zz8SbKzEPOikvHFfiDZXs1ctfGiv9mW6TxELDXqLxDqswegbTySydNi8rtXj/N/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/oG3BKyVMtQClC4g1aWYw61n862g+uHvLNSRl7i+wo=;
 b=ISYhY20nBSJnuH5EcXDLpoTbYA1XAadgwHGhWybhhnFDjP/Mm6fzTdlkEfwTPShr3SQGQ68tZNklgG6C0gz/f9Naf7Ny8YrSWSRbhA0JNLVpprBasctscJkFxpRaeSRtRSNSyKjkiKO7Psfv3teiat0qZJQtdFEEimZGQxgfGlYpSuGHnoBrIS+YmqgXHkWW8Xmp+8qkm6+TmNs3iCPkjlF5KySMYwSM4YfDMIurOtOuJhDJ/mvOTjGcxQjgI9TnXEW4n8mPydfntWiOSk88Xa/uLSe7e1TZjIMUlzaoFUzv1yTCrN5ivwXbB+1+NdH9OFnLUHAawEBEnqtXOLWc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/oG3BKyVMtQClC4g1aWYw61n862g+uHvLNSRl7i+wo=;
 b=CUvhZT3rsuGlsR1Efc86EYaU8GlO25QApD548jRdPQnIsJAKjfO0LP1oC1C/kInKnQdPH4IJmLL+OIcjvGpPuE662+j8Frgfr+g6+NqH7PZ9bHc3n8kU0uN89r5QG4Dd4Ms9uY56mGrI3a1tEqipKDalLC7/NPlANlXmdeTwzYbHg8nB5RUmapAHGhruIzJwv6P9XqNLGJJVoPMpQmduOF1ZHTXS015c63FnfPk+Hp2/q8nCX/PWQEOOFCPp3ahct+VDIvCIyD8NBgtLCW7l7C/BJGoc2j9e8x8PmQp1W2mYsTEh3Zr48+jdfsVZh76PugW6gIYoBmOzyrHbghoUXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Fri, 29 Aug
 2025 00:32:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:32:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 09:32:37 +0900
Message-Id: <DCEHLSM8E6J0.3BG0EHC9I3183@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: depend on CONFIG_64BIT
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250828223954.351348-1-dakr@kernel.org>
In-Reply-To: <20250828223954.351348-1-dakr@kernel.org>
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8ae6ac-76da-4d99-a124-08dde6938fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnFnYTMxaTVQMUwrTFVBRE05eEg0cGhzRDN5V1UwejJQcjRlaDRJRCtXb0ZH?=
 =?utf-8?B?WTdxUVBmNHFjQkJLK0dueXUzdll3WjNMcG9KN2IxZzBoSWRNclJKc3dOeU5N?=
 =?utf-8?B?N1RyVFZzc2c3bUxCMHlmcmU0MzBqYUFmdXl1VU94eS9BZUpENmhkbUNNK0FF?=
 =?utf-8?B?THQ1c1V5TFNEaDhQbnhRNzhtV015d2N6b204T2tRVkVKaFpLVDNaT1ZmTkRK?=
 =?utf-8?B?UGl6REdRT1Y1eGtPdkx6T1BLVmovNUd0M0pNZ2NjRWFQYmt4RmpvMStPWUNi?=
 =?utf-8?B?YXlIRFpzaktUOTNLMzVaZ3EzeE5OaGVwRnI4czU4bVo4cUZsb2JTcGUwZG45?=
 =?utf-8?B?ejYzQ2IzeFQrWXUzTXk1dDlpSWtOZGROS0RkbURhemtrV0RvYzYwOC8zblZO?=
 =?utf-8?B?VUVkZnoxYmE1QjdOeWhiRVA1RkNNQUpDbVlqN1JBR2xsSHVFNWxvd2haMXRi?=
 =?utf-8?B?Q0xHYnlzQ3RKUGhmdFN4eTZoKzhwYzBxRWNFWVc4aFpuYWNlTCs5TDQvZzk3?=
 =?utf-8?B?SHdWc3U0RWlzN1oydDc2UkM3YkJ2UjU5d0t4LzdvaVJISCtOQXRmNWYrL0V0?=
 =?utf-8?B?Z3FydUIzV29SUlBuK2t4MTA2Z2J1ZUViQnc0empmd1RRbmZ5YStSZ1RUalRQ?=
 =?utf-8?B?Nm5YWXQwZ0pMd1BUZ3ErS2U0R1VWNFJTQW1DbURxWENXSXZyMnZjWmlEbXJp?=
 =?utf-8?B?OVlRbFNwRXlrejZJRks2elZUVmV6TzdGZGxRbXAxRERNdEJ0VE5vSEFXQ1gr?=
 =?utf-8?B?NFl2eFlWNTRack1Jck8wLzduWko2Q05QOHBQZkQyTnhBVXJhVndlWTFUWkRi?=
 =?utf-8?B?MFVFMmhGOU9BTis5MTg2TVVpeHlQVTR3cEt1NUNsU3JVNFFIT2hFM1dDaWxT?=
 =?utf-8?B?TGlIcEgyMVU0Zzk2U3NaMXVQbzdsKy9ZQzVvcEsvSlBUbXFRY1dYQzVXelNr?=
 =?utf-8?B?bDNmeXlrNFpnZ1FoU3hrMVlKSkIzT2EyMUJEODNEUlhJTGJCeGorOXJXZHQ4?=
 =?utf-8?B?MURaNEF1eGY4WkVHejZkekxxZkppdi94bmdXZG41TnFpZnJGQ3BqRHE0QWpq?=
 =?utf-8?B?T21HOTQ0dndDcmlWOXMySzVMaWJWYnNPdUZNdzFWdm9kOFZtWHlNY1QrNzd6?=
 =?utf-8?B?dEU2MkpSWmpmMU1VRHBhSWF3OHFDdHN5TzJGSjcrMUl6WnE5OU9lTitBQ3V5?=
 =?utf-8?B?YTFrTUxRVUlxNXdzMUIyM1JhVXdudEVVc0E4Mlg4TE9mTWx5STRxMGVUeEVm?=
 =?utf-8?B?TXdOSlE5am00Q0loY3NIa1FMUXBJSGxkSnlGTmMxQzlDb2RHSmpOTGxqZlRJ?=
 =?utf-8?B?T294bkdGK2hjMCtxdzdYcFRKUk1TTCtuYUVxM2YyUXkxTW5Oem1abHNxaE1y?=
 =?utf-8?B?U0RuTDZqRVNJZmRySHV4Ym1nV0RlN1FXQk41YTJYY2tJelFFTkg3Vm9ObEx4?=
 =?utf-8?B?cy91Q3YxMFBsZTNwNTJSa2liNFNLbEJmaUorUm14ZEFXR2paYW1lYmxmQW1m?=
 =?utf-8?B?RVlPVVpjYzRrVUFoYjh2L2hydHZ4WVBHTVVNWjQ3UXlTRno5UFd4WmtRQnRn?=
 =?utf-8?B?ekZlV3BMMmdWYUswcUxkN3llRG1Sd210Wi8wOVdVYWF6c05YNmFFa0pMK0F4?=
 =?utf-8?B?bzZNSXQ1RlpJMkRUQlEwOEZrMEt2WUpFVTZRY2lodkFic3NjSGpTVjJuT1BR?=
 =?utf-8?B?SmVOdzdVb2VZU0dNYVk5RS9IODdoZG5HWXkzQmZWZ3REUFVtalJQNng2eU9M?=
 =?utf-8?B?M0RYS0wvZlVwaWJqQUU4RjFiWWdBeGMwaDNra2draWdvUjMzU3psM040WDlJ?=
 =?utf-8?B?aFBFZFFKTkcvMmtHMVpTVWk2Y0VPdWRlQWcrQ0VxRElBaDllVjZjYzF1NVkx?=
 =?utf-8?B?eGJiWDA3NmRLY25EMDM1VFNSLys1V3kwQm9Zc1BDY2ZTaisyS0xNOTY4SWpO?=
 =?utf-8?Q?Ee3G4iVlsLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNqNnNEU3RRMGF4c2pnMmMwcHZCNU1BMVNUNk1pSHFjTWQzNVptdTJnV3Fo?=
 =?utf-8?B?S0ZHOG96ZHY1em9PVlpSc3VxN215NFlWTHpwNTIvamRyY0VxSDdWRkgrNXhn?=
 =?utf-8?B?dWhLTjRWNUdUQjQyVnpsM1ZHZmRzOXdzYkk3bGl6enBUS0VhOEwzNnFMTURX?=
 =?utf-8?B?Y3VhMEkzbjBaSnZvOUUwZ2VySzNIS2JkN29nS09qMnd6VGlQcXNJc09ObVBW?=
 =?utf-8?B?dDdjTzNWV3owTlBPSnZZNjZRL0pGQjRHMXlLVXZVd0FLNm16Unk0SENMQmpV?=
 =?utf-8?B?YjhUZnZqWGlRQXVSSEd1cy8wbmxYRG5tSFlSU2x0QkdpeFdTQXdQZm5PSkFN?=
 =?utf-8?B?dTBtdXg4SXNSQWpQWlhodkNnT0hhMnIwSzJJeWZHTXkzS01mTVR2NFJNLzdC?=
 =?utf-8?B?a0RncnNoakV3dXZHaXUreDNuNE5vV1RaYlVtV2N5Z0FmRDNrZmdGb2N0emI1?=
 =?utf-8?B?THpqRFBrNzBMbnVaSXNVaFdZMW12aGxBWkozRVNpMUhyMHpYRkZDQjJ1d0VX?=
 =?utf-8?B?VHY0ZEJjV3NERWMzM1UycThFbkFQWHppb2V5cmY5aHV4QUpaZDZSQzNqS2JI?=
 =?utf-8?B?SlVqUkFXYzl4Z2FJMUd2NnJEb0FRdFZwcWRZdHdVazF1KzA1eEM0czdQN1g1?=
 =?utf-8?B?b0ZnOGJ2TTc5TUJCUmVCbnRjVzF2c2Y4YldadThTbmUyMEM4QTkrTDc2Z2tX?=
 =?utf-8?B?UFFwWnh2QytpY2lodUNVTStzc0piNnpIWEc0TjNVK0RscWcwSHY5Q1RVRm5Q?=
 =?utf-8?B?eWt4VDJCQ1B1czl2ZzMwWXF5N2NNM0x3NDNaWGtTaXkrOWJ5bjA3eDRDUlUx?=
 =?utf-8?B?TElML053T3VkTktvR2VuREZmMWlMZVZhZnRhcHBacFhIN2owcmFCR0J6RWZI?=
 =?utf-8?B?L2pBY0VzWXk1b0xQL0hsMkpWNm9uUTBhWEgwVGlxRkhjZG5nYURPMmNqV2lh?=
 =?utf-8?B?NmFIWXBFL1RjS05kSzdwdGhtSmpXbS8xaDdRbVM1ZjJZbmREUmtsa2xYMEtm?=
 =?utf-8?B?S0hVYm9oSzU1enVMS0ZSZ3hGVmhITnRiQmZRdVRvRmI5b2E4MkE4UGNaZ2t5?=
 =?utf-8?B?S0RtbGRXQzFGK01SaW1vOHJmc2RSQTFtTllHeFZLdks5dnNoYVpMcEx5M3I1?=
 =?utf-8?B?S0t5UXlJOUU4NXlWWlg5bVNobExMNFZmUy9lZ0hVbU1RanNkSDVkQW4xV01v?=
 =?utf-8?B?RFkycmIzK3p3bEl5UUdTYzRwZEY0UklDMzFteXhZWDdHaXVQOGtCaDRZRG41?=
 =?utf-8?B?VktaaXdUNGY0WUtSWk1ZRlUxZ2g4UDJvWitqd1gzRnMwLzlrNzZuSXpnRS9E?=
 =?utf-8?B?a0I4QnZNU1oxQWd3bTcwOG9IZktySVgvQWpTUHVOVXBvQ1lEK0hKQmtqb0Zo?=
 =?utf-8?B?UEVUbTRTVU5QejZCUmxkUVJ0VTZaaEFEK1UyNzBMbmdZcUROaDdzUFdZd2ZB?=
 =?utf-8?B?L3VZMXBRRzZmRHFRV1c3WjZsc2pZNGEzTGV2TktpWFVvMlpLaHRjTm5VRkpS?=
 =?utf-8?B?UEZQZXM2K2VIM3N3RGUvU01KdG1jYkFuNDgxL1hnVHVJelpvNy9jZFRGR01V?=
 =?utf-8?B?dHRXRkhpMnRWVSsvOENoeHdlaDFRcUFDSyswQ3J3emlLaXgzaDBBVjIwenBO?=
 =?utf-8?B?SGVhbFFBb3VoMTl1OUNVTmtXT0NXZmdkUjIvTCtKY1ZzWjdaRGdXYkxVeUYw?=
 =?utf-8?B?bS84cm5kYlV2dGQ5ZkFCV1ozaUh5NlE4Y1hSUjUyVDFBNHBNOXRmV01FRUxT?=
 =?utf-8?B?OUF0VktOY3BGUGFWMVZGQXZQcEk0Nm1BNFZlMis0WVpPNUtFNjZkcCt2RmVk?=
 =?utf-8?B?Q0sxWE9KMk5UOGZGcXd5M0RyOS95eTFEeXFzWjlCMkRCVGRoSUYvVVRhUzQr?=
 =?utf-8?B?MVZtcVk2OHZ6cmZodjVVZDJab0pvL3duZityRWs0NFZybXAzYmFqbEdxNVVP?=
 =?utf-8?B?a3FJenNwem1UaVlrd01yNndQQmtFblVPdmFuRUN3N3l3bGtHN3d6OGd3UmxR?=
 =?utf-8?B?U1ZkUmZrZ0RSUmhITUNoa3NJOXVFUGJ4VEd2aEZ1SG4zMjRydXY4Nm5wS2lV?=
 =?utf-8?B?ZUt2SDdFZFRoWjhNU1lzbFc3cXMxTnJjSTB4aWh5dVRqdnpRWlFVaFF6bHow?=
 =?utf-8?B?V3lvU0h5M0dHTDJRT0F2RUxHRXdaOUFMSWk4L2pNZFZmeVBZS0ZuTTVXUnRZ?=
 =?utf-8?Q?VsVICc8u8U5pZd4ZP2I+NUeIvC6Bvp7KOSGyMZzWMMfW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8ae6ac-76da-4d99-a124-08dde6938fe1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:32:40.7398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hGPl1jBkYtvW5AruyDqrZRuSGjwnsWH5h5WEVnkHQw+ss7q8g4CqGK3VLiCYtOipZFwwQeU7Fr50wsHZ2E9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
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

On Fri Aug 29, 2025 at 7:39 AM JST, Danilo Krummrich wrote:
> If built on architectures with CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy nova-core
> produces that following build failures:
>
>     error[E0308]: mismatched types
>       --> drivers/gpu/nova-core/fb.rs:49:59
>        |
>     49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.d=
ma_handle())?;
>        |                              -----------------------      ^^^^^^=
^^^^^^^^^^^ expected `u64`, found `u32`
>        |                              |
>        |                              arguments to this method are incorr=
ect
>        |
>     note: method defined here
>       --> drivers/gpu/nova-core/fb/hal.rs:19:8
>        |
>     19 |     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> =
Result;
>        |        ^^^^^^^^^^^^^^^^^^^^^^^
>     help: you can convert a `u32` to a `u64`
>        |
>     49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.d=
ma_handle().into())?;
>        |                                                                 =
           +++++++
>
>     error[E0308]: mismatched types
>       --> drivers/gpu/nova-core/fb.rs:65:47
>        |
>     65 |         if hal.read_sysmem_flush_page(bar) =3D=3D self.page.dma_=
handle() {
>        |            -------------------------------    ^^^^^^^^^^^^^^^^^^=
^^^^ expected `u64`, found `u32`
>        |            |
>        |            expected because this is `u64`
>        |
>     help: you can convert a `u32` to a `u64`
>        |
>     65 |         if hal.read_sysmem_flush_page(bar) =3D=3D self.page.dma_=
handle().into() {
>        |                                                                 =
    +++++++
>
>     error: this arithmetic operation will overflow
>        --> drivers/gpu/nova-core/falcon.rs:469:23
>         |
>     469 |             .set_base((dma_start >> 40) as u16)
>         |                       ^^^^^^^^^^^^^^^^^ attempt to shift right =
by `40_i32`, which would overflow
>         |
>         =3D note: `#[deny(arithmetic_overflow)]` on by default
>
> This is due to the code making assumptions on the width of dma_addr_t to
> be 64 bit.
>
> While this could technically be handled, it is rather painful to deal
> with, as the following example illustrates:
>
> 	pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> DmaAddress {
> 	    let addr =3D u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar=
).adr_39_08())
> 	        << FLUSH_SYSMEM_ADDR_SHIFT
> 	        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).ad=
r_63_40())
> 	            << FLUSH_SYSMEM_ADDR_SHIFT_HI;
>
> 	    addr.try_into().unwrap_or_else(|_| {
> 	        kernel::warn_on!(true);
>
> 	        0
> 	    })
> 	}
>
> At the same time there's not much value for nova-core to support 32-bit,
> given that the supported GPU architectures are Turing and later, hence
> depend on CONFIG_64BIT.
>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250828160247.37492-1-ojeda@kernel.=
org/
> Fixes: 6554ad65b589 ("gpu: nova-core: register sysmem flush page")
> Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and=
 base code")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

