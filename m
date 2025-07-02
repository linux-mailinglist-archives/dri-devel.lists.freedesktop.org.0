Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389FAF12F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7910E6E0;
	Wed,  2 Jul 2025 11:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="riRb6nom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CC710E6E0;
 Wed,  2 Jul 2025 11:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOByEl5BgxLxExoxaJ8pw6IwmsGnR2HNm6Y/7yWmJ6PTY4GYEJx/kL0MYL2w/SiaxXsWtuMbuDU544+ntHtI8IiwJ4v8hQWwxj4wFN4+E/AiioLZ0WiLoAxrk68F6brg9i98B2Q7/86ai137OveVfGcDwUx5PXGwKd8bCqzy7admu2Oe01wkeTzTYh/pMYPanZ31DNQ3qd/sbD9kVghyXf/G79mmPHHG4aBexkLwtxILuRQhl0xsldILQpPxQ5TTlEVFp+urzrvIcv8+GvmOQZnHigxLV/YbuBCt5ydNcK/mGuR/S+1Pk5wVpE17eXX2gnSlgzrZw0yzNQ+K2Dy/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uh5XCTW2Y/BMgm6vbF7KYBJlMPheA8vDUaXKQEBPYAQ=;
 b=wvr8piAU0mQIxmHy8cMROQnsybOv1OoPiBvimsO+YWTWoMW35oPJJGDsbLMhARehuwhgDZkY/XCuP0p7JUpu0/j6DHvuVhhVodd41p1MILY13SkoCDvuJz/M90kLTKKLyTeolNhPL77WIKq+FnIoevbbESqQMaVdBrMZdXOQGKCNYI8X2eo5+w1Lq/OSLcwfKgvhu4vL315I3q73jCPN+yybRBaB33HqIUh3i+pmk7G94//iRFsyLygUhUtrumiNUd/e9lNsGRquG5eEeYcMgViPn64/YEqUKAI9cn65BrqZDjk0Spnb86yCExBnRob/jIEz5G/1YXQEjBUr3nu/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh5XCTW2Y/BMgm6vbF7KYBJlMPheA8vDUaXKQEBPYAQ=;
 b=riRb6nom/q2AMdZcP8AAC/3f+shs8OXTFsJJTvYNTbAHFT0476F/fLFr4NgE+/Dh4MdiuYOV/GUBGXW4FKaU1rDNk0befWNngIq8u+rVE8JEaYth9RcqDQUuaCuqTS1+coGfXdz1pmQP9DTOAoyrdzsxM4QkDaqwZU23cbFkgihf9GX4UWWDxIWyNxGqpK5TAbrsSs3hLEszG7lcDwO9N64o2XmwZNptPIvynE8Cn8D8h2sYxO9Mk6dDncJC2AQinjilIdbJn4sQqPshNmNoUcOT/dVJU3g4qkBkCoqCUmyQjUB/xcxtsHEMQ+lWPxgODlPwLWCfDIPFASI8dph4Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:00:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:00:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:38 +0900
Subject: [PATCH v3 1/7] gpu: nova-core: Add code comments related to
 devinit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 748183ca-807c-4150-f215-08ddb957ba4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHJuS1dFaEhhd1JuZXhoOHB0RUEzTEdrbE9aY09GakM4RW1FVnBiM2MxTitE?=
 =?utf-8?B?Vmcxd1VWeEd0alQrZERrQXkzMXlGSWtWcjNBOU5DMG9WMWhUOFI1VjFyNUIx?=
 =?utf-8?B?N0FuVFdueWdiOHN0OWRuYjZ6dElSU0ZPOWlHZDdkK1B4TDhkY0UxZlpLZWln?=
 =?utf-8?B?THN3VFRyd3NHN0xZL0JqMm5uUjRJYjdrVFJUTDcrS1BrbGc4OW1MZFdTT05I?=
 =?utf-8?B?WjJaVnUzSmxtUHZKTDJwZE14TE1zTFVDZ204ZkYwU1ZLTTZuY1NKN0hVUU1W?=
 =?utf-8?B?U1Nua3V2VUJvVlpQRGlGRG13bTNHY3F2NnJSaDFRS2kyNW9ETDltMzRXbVNO?=
 =?utf-8?B?RGcwSi96NW9UajBEVnVuVUc4a2ZSZldhdnBoblBZME5xazJuRlNrZU01U210?=
 =?utf-8?B?djc0akowL0ZhUlBnRWwzSDZ6RmlIdzQrM1JEcjJZMXdEL0xpWmZIYWFOVFNT?=
 =?utf-8?B?T0YySkFqb2lER0lzdmtKS3U0cGo4NFZWdXhJekhOclRpZE83MzhCaHVSWGpU?=
 =?utf-8?B?clU3THBDbjNqR0M1NTdNOWJLRzRaNzZZVloxNFNqWEtoaWh1bzFXUDd1dEtQ?=
 =?utf-8?B?Wmt6bGxSZ01rV3RCRlRKOGN0Wm92YkFMSHVxemRncnRpdE9uNms5ZElhdjRR?=
 =?utf-8?B?ZkV5alJYSHZWSWxXUGU1YU5LS0ZpSkRiK2EyZS8rbXFwQnNvTjF5VENBdUMz?=
 =?utf-8?B?Zll6aFFicEJsMlZzS2hJSWVwMVlmcG9uNnVXV2Z4UU84VW9BeGxsUGR6RURC?=
 =?utf-8?B?em5nb0cyWmlRWEZoY0lFMFIvNFZlN3N6NzkzdUN3M1FKczJwamRrcVB2dVA2?=
 =?utf-8?B?THhyQjU4dXU1VnlsS1M4cXR4ejVGQWJhalVCQzdERTNFMkdBL281RVRCNXd2?=
 =?utf-8?B?Tm1Xa0czMU5helJXNEtqZG5aQjBBQVdQbVdTNWgwdG4yQmZpbVhMYkI5elNZ?=
 =?utf-8?B?c3ozazZCSkE5Rks1b3hDbkVwU1hUeTBzSVluMjJyWEdGRzlEUnBpYUdzUjFS?=
 =?utf-8?B?K0FTYk8zUGppa3ZQWVdhUmpDQ3pJQWYxS1hmN3huS1M1SnRpQ0kyREtjZWQw?=
 =?utf-8?B?NHFvc1FibWJ2UExZL3Q2ck1ZbmtjcUh6eXE0MGRnMndFYVBvYWxuZktUa1RY?=
 =?utf-8?B?TGZxaGkza3ZLdi95Ly9RbTNEYktZK3lnSHB6RHFablpJaC9xSlQrbmdwV2Qw?=
 =?utf-8?B?Z1d5R0F2bFd2UTk0M3pGd1VrZmVpeFlhQVlVd1BkTlljV1NJQmFGamdpbmN2?=
 =?utf-8?B?OHM4Vkp5azdKUFBHQm4wVVBSekdKbXRTQnpDU1Z6c2ozOHNYdjNuSmpWeG5w?=
 =?utf-8?B?c0VidjZFeTJzcS9uMTVQSVBkWnRSOGJaYXNnVmMzVUJVaTgzWUNJNE1LSldU?=
 =?utf-8?B?Vng0dFpHY05LNTNnU29wYWN5bzFBVjU4R1ZXZi9wY2xDeTFOYllSeG1vbDZU?=
 =?utf-8?B?U2pVbjdNZjNSZGhwVmlCZEtIZzJ6bXpXVVU2bnNDcWZIOE1CQ3NvUkF6LzVn?=
 =?utf-8?B?SGVqNnJqK00yblNNNUZyZFh5Y1VOUXdKOUFBOWlVYmNIcFY0K3JNMDlPMUpC?=
 =?utf-8?B?RkZZYldPczJsT1JjOFE3aWJ2MXhPLzB3dmljY1hZUkMwNkYzMXJLdDl4OTdX?=
 =?utf-8?B?NFFsVHhSWjVzRktLZXR6TVZBRlhJZ0gyOVBnejIvWTJXMFFDTTRDUHBqK0xL?=
 =?utf-8?B?eUxlWXNWQ0c2eXhWRTcyQThrazQwRUVoUzAyb1F4YnFtcnFrZmQ1TUpGODBn?=
 =?utf-8?B?aEZsZzZlMm9oajE4Szhmd2NGeHZaekdtLzQ1YWJrY0ZVK2p2Uk9rYnZTcit6?=
 =?utf-8?B?ek9odlZ2SVhTSnE2SXc1TGFwam16SzFwWHN4YVdWb1krYXhEZVBRQmtOL0Zk?=
 =?utf-8?B?Um8vNmV6aVZIVms3SzY3WU9VaE52VDhBQkxOeDJOYWdOL2xyc1AvdEM2T0tO?=
 =?utf-8?Q?jlgDzT5F7HA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUgrOXlYRlBQU0ZFWUI1dmkwR1dPQWVnNjdoeE1lNStPejcxYlJLQWkydGlz?=
 =?utf-8?B?em9SN25kYjdKQnpEa25mVDRCampqcHRuLzIrV3V5Skg2R3pxdEM5cW4ycmwz?=
 =?utf-8?B?Zmt0NFF0ZGdGYVFtTE0vYnJIYXhaQXVCTy9IYVZmWGdFcFRtV05ncWkxQlNW?=
 =?utf-8?B?eHE0eXN2UnpZTHZGNE8wNVhqOUwxNVJxYjNHTjkxYm5xZlNYL1BkdXFESmtX?=
 =?utf-8?B?U2JhdUpzdUZHM0drTlVxRE45R2NvWU9CZXFaWFN3eklITTFNdm9rbDV6Tm1B?=
 =?utf-8?B?dVh0cjRXQ2tBckdsV0QxOW1hYUN4bGNVT1YwK0F0UVUzVmtjTkU3dlVsd0cx?=
 =?utf-8?B?d21YRjgweUJjZ3BoVmRLdzNlWUJoVnhnVEpTSlVhb215d2diRlVoRUVaYnc0?=
 =?utf-8?B?cDJtR1FZelBqd0ZURmtEZmF1ZEV3SVQ2TEpMYnc0cTZPRlR2cFlLMlF3Mm5D?=
 =?utf-8?B?OWFTMlgwRXZ6MkhEcHB3ZEZtazdySGZqWEJLWjc3dERRRnRRdGNnMkFHK1Yx?=
 =?utf-8?B?UUNtcmV6NEVLU0pITXh4b0dabEZrNXV6c0cvc1lhd09NNG9VaGpOenZnVnpW?=
 =?utf-8?B?a2tXYnZ3ODhWN0o1QVozWkFDdCt0cVhJem9YV2NlWXRZL0EzUjVBVklCVkt1?=
 =?utf-8?B?a1Q4VVg0bU1CM01HbEpjVHk1VnA3ZHlCbUcyK2NLdTJ6MDQ2d29TblRQT2tL?=
 =?utf-8?B?NDNsVDZUaERhRVVHblo3MmJYc1d2dXRSS3BMQnhGMDBjZ3YzdVVoSEh0WitY?=
 =?utf-8?B?cmNzWmVWT2lBNG1QU0pXbE9GZUJyVytrbUtWSjB6SEtDVmZRNm45eVhiSi9B?=
 =?utf-8?B?aHpjNG5kdWRnRVJSMEhKUUhzMTlJTk0vMi9XRFhDSDVtZm1yVUF5REhIeVpu?=
 =?utf-8?B?WUpLZ25wcGhYazROYytqcjVsQ21vVDY3VGFaL3lobUFXZU1QQ3V2YW5lWlNH?=
 =?utf-8?B?U0haUDA3aEYxRmEyNFZLQVlZcWNPSURQeXRjTldDdzE3VHJ4bENQaU9UYmV0?=
 =?utf-8?B?VHdRSjVQaXBQamxUL1VwRFR0SU40ODhKYlZ4RE02U0FzOFl4Zm5TK3ZXZmsv?=
 =?utf-8?B?QjB0RG9OWnZ0SXhGWlQwSm93Qm5RTlI5R3RSaEdxVm5KQ3o0VytpNitRaEJ3?=
 =?utf-8?B?d3diZlpaNXplTktVRW9GTWJtaEtPd2ExenVYK21PckVHOEwxR1dLZEpISThO?=
 =?utf-8?B?M0JiUWtGSXNlSHBkNUphVll6WlM0QzhYTSthay9jTUJ2L1FUaFpUUUN6K1BQ?=
 =?utf-8?B?SzltSEJLNituaitYT2NYVS9YWjg4Z3pRYU85QWJBbnpuWllLTHRpeGtHUkY0?=
 =?utf-8?B?NHVNS1NNa1k1N2pTdmorSHBiQ3VkOUpCSTZ1Ym9WMVhpZzRhL0VmQWFTZEpy?=
 =?utf-8?B?ZndGMWpXeUcxTndKM3I0MDQyVnZacS9QMVdjNDlvaXhReHU1RnJ4bFFvdlEw?=
 =?utf-8?B?WE1hdVRMMHdXb0QxdVU0RTFGRXVORHZ2dlUrZmNwMGJGVHZBaVJxVVNjS1NB?=
 =?utf-8?B?NGQ1aHZmVi9TcWFSbG1ubnE3T3dJTTJOTlFiWUZORjZOQk01MUh1eHVFNUhv?=
 =?utf-8?B?TWhaL1VOaDh0ekY5YWQ2L1RURm0wNGE3YjIrYTB5S0V4SmVkVlpoT2QxbGh2?=
 =?utf-8?B?clJyVURnM0xpcklXK3pMZ1d2a1F0bUp6SmltTFpBK0hzWEd0RkFHcE8wdWRz?=
 =?utf-8?B?bU8rTlZrdVo0L2dhYXpQRERyQ21ZajRHMDF2YXhYbWM2T0ZqOU1sNDBpdklY?=
 =?utf-8?B?V1hiY1RJbWM4emp2TEc1bEtFSmF6WTFqRno2U01Qc3lTek5rWS9tekwyUDV4?=
 =?utf-8?B?MEJnWDd2NnN3N1lkNWRtMHBKR1QvcmV5RTVrZitUbVMzSnEvSEVKQzZTaXRO?=
 =?utf-8?B?eDcxNUk3UDFRS0tCMS9lbXZ5WkpoSXh2S2xGY2RRUkNYZWgwUHhlQWplK3Ru?=
 =?utf-8?B?ODVIR0dja1VWK2t2QTRJQVRpeldlcFEvY1Y3MG1vM3E0anRDdThDTjhUT1Za?=
 =?utf-8?B?SXdNU0NJWWlmaFprODk3S0RNZ3R0OHBISi9URHVjRnBDMGxlb3owa2ZtZCtX?=
 =?utf-8?B?c1BXMmtFaVdYcUIzYlBPam05akVpTlQ2Z3pNSCtkU2diOXFOT05ZYzBFb0RT?=
 =?utf-8?B?K21FV1EwQk82cUY2N25xOVZnbmxaakMwNGFMQ1padDE1RmNvanA0TDl0bFBp?=
 =?utf-8?Q?q9+VKq4Iv5WZnKICtJrYSIr5fOjCZsz83XJF37R3SoMz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748183ca-807c-4150-f215-08ddb957ba4d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:00:59.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6/szxsIOsVlFv0CmGCGT6sMRIcrM8ywpz0gT912rg9CuKEhqXPmzbrhh7q5ikp7H2FAhuU7kHn3Gqs8jTkrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add several code comments to reduce acronym soup and explain how devinit
magic and bootflow works before driver loads. These are essential for
debug and development of the nova driver.

[acourbot@nvidia.com: reformat and reword a couple of sentences]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs  | 39 +++++++++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs | 16 ++++++++++++++--
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index d5b68e02d405750b18d634d772f15f413453e80d..8ac1ed18719926493369c2aae9a59b2b55fa2b12 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -1,10 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! GPU Firmware (GFW) support.
+//! GPU Firmware (`GFW`) support, a.k.a `devinit`.
 //!
 //! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
 //! the GPU is considered unusable until this step is completed, so we must wait on it before
 //! performing driver initialization.
+//!
+//! A clarification about devinit terminology: devinit is a sequence of register read/writes after
+//! reset that performs tasks such as:
+//! 1. Programming VRAM memory controller timings.
+//! 2. Power sequencing.
+//! 3. Clock and PLL configuration.
+//! 4. Thermal management.
+//!
+//! devinit itself is a 'script' which is interpreted by an interpreter program typically running
+//! on the PMU microcontroller.
+//!
+//! Note that the devinit sequence also needs to run during suspend/resume.
 
 use kernel::bindings;
 use kernel::prelude::*;
@@ -14,13 +26,32 @@
 use crate::regs;
 use crate::util;
 
-/// Wait until `GFW` (GPU Firmware) completes, or a 4 seconds timeout elapses.
+/// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds timeout.
+///
+/// Upon GPU reset, several microcontrollers (such as PMU, SEC2, GSP etc) run some firmware code to
+/// setup its core parameters. Most of the GPU is considered unusable until this step is completed,
+/// so it must be waited on very early during driver initialization.
+///
+/// The `GFW` code includes several components that need to execute before the driver loads. These
+/// components are located in the VBIOS ROM and executed in a sequence on these different
+/// microcontrollers. The devinit sequence typically runs on the PMU, and the FWSEC runs on the
+/// GSP.
+///
+/// This function waits for a signal indicating that core initialization is complete. Before this
+/// signal is received, little can be done with the GPU. This signal is set by the FWSEC running on
+/// the GSP in Heavy-secured mode.
 pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
+    // Before accessing the completion status in `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05`, we must
+    // first check `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK`. This is because
+    // `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05` becomes accessible only after the secure firmware
+    // (FWSEC) lowers the privilege level to allow CPU (LS/Light-secured) access. We can only
+    // safely read the status register from CPU (LS/Light-secured) once the mask indicates
+    // that the privilege level has been lowered.
+    //
     // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
     // reset, and should complete in less time than that.
     util::wait_on(Delta::from_secs(4), || {
-        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
-        // status.
+        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT status.
         let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
             .read_protection_level0()
             && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e8b8aabce3f36abe6a7fba3e11f677e36baa3897..ce08fab8fa96fcacf6947512ebdf4975ebd8772c 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -104,9 +104,21 @@ pub(crate) fn higher_bound(self) -> u64 {
     }
 }
 
-/* PGC6 */
+/*
+ * PGC6 register space.
+ *
+ * `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
+ * for power rails needed to keep self-refresh working and important registers and hardware
+ * blocks).
+ *
+ * These scratch registers remain powered on even in a low-power state and have a designated group
+ * number.
+ */
 
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+// Privilege level mask register. It dictates whether the host CPU has privilege to access the
+// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
+          "Privilege level mask register" {
     0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
 });
 

-- 
2.50.0

