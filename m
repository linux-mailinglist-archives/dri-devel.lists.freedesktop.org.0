Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79CBABEC26
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDA410E647;
	Wed, 21 May 2025 06:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KB3d+Tth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B70D10E09C;
 Wed, 21 May 2025 06:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoR8j8X7yet15kv3MEMqkZCctUo9s3e1B1CVtlEJFHOb/Dnakop2Ztb5n4DIZgVQak6NKQmHhUGQiCsqWckgBJTaDYNRAj5Ql1B7RVr83C5O1poTOOjGx4x+M4LwRW7/htD3QlD7vhCVmIwoxkxx64fjqd63pHWbMApHPEqRDm83YRbEkRENCAeLGfFxGpR4TifSoipOLo9mteivP5P3jjfIede6ET50MhsMDO8z7GcLQjpJB9USZVCQx4UNH/hdMzQGIgKefTnxQr+EPlkqxDvzboxyEoKjK3AOUcLHbUPCruBlDA8NWuy5bRCmgyEvubgZWKfwx6nKbVZaMqXUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7kV3dX8/S3vGqWv/Yam24qP4+/scyhofksKEBS2vbM=;
 b=Yd098U4Fd7CfQBxXx1emfL7u528Ff9PEjpc99JG6NDImxHqOaHpWvnLWx22PL5xtTaQhpgBax6Lnhdx9Y3zKuK/DhbvHsTP8ZQzsLgFdRGimELvtjN7nHOg0OmpOz/aTpSuvWrFUzmR55+08scLJyJzBtBz43LKigf3bqr2HTQP9F9z3V+jmUxd2AAOGtGM8xuiBWC94D0mIRVU47sbjOEbIYDHl6v9e211H4QhQ61vxDEeTtZT0XkcfZphRgXwv6eIAulWya2u+UvN/HchZIVK0Sj1X84+7WBXDSovG0wS1SOR0GMCdEkn9w8Bx2sGxJoMUv7ZwzUkJKXHnGwUY6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7kV3dX8/S3vGqWv/Yam24qP4+/scyhofksKEBS2vbM=;
 b=KB3d+TthEiDgJHL9nUasZpa9oOPMZu/fCKLnrTf2mfySY9RrqsVhYhiGd14H5/MgmnfkI0B28dK1NhaoSGjfPOKvZY+5GRgsD0qbc88MChy6li0McDeZuzZXnOB7JzTEEFCs0Fn/YOcM9lFWA4Z3foDyJMXWJLwI0vQxRG+vDdNRBbAWLO+nG/9oXRQ3futjRIeGqINyGgQTRznfdZH4DPfq2SE0w2xCHz/lCSyJF9JEO4A0vi/5TEZnsC9R6YaYxNnkHY6A3E0/EbyRZaMGlT6qqiyGdlgGi8Ghz4ZgAOn+CLgfmIOhMrcDEnhdh6R1fWXKjZBeojgF4TIMZHUvpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:03 +0900
Subject: [PATCH v4 08/20] gpu: nova-core: allow register aliases
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-8-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be9878e-0f28-4c4e-c6c9-08dd983314b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUtPc1BuTVlBMG1IZVRFcnFhdVBvNnpKUXJZQU1vT2hqQWk1U2JtWlRCdUp2?=
 =?utf-8?B?NnplQS9HMjdsTkw2RENzM1Z4M3hETHRrcm1DbjBXbzVzbjhOaDl6RDhyQWgy?=
 =?utf-8?B?VXd0V21LTVVpUkNNRzQyYU1VUHlNQUZwMmdpd09la245NU1ldGQ0L2JLd09S?=
 =?utf-8?B?UEdIUXZXc0pFUVpJa3RGbkZaMFFhVHFjbUsvRTRxaEdJNkFSSkR1S25VUjl4?=
 =?utf-8?B?THNNMklpZ2FGUjJOZnJKQU1qYWVsemlValdSd3NJU1RSZFh4L0o1WkJ6bmhZ?=
 =?utf-8?B?aHFuT3ZDQXBYRlBvYTllNXJwWDVWRU1ib3FhNVo4VHlvK3RwRzJlWEkwRHBN?=
 =?utf-8?B?UEIyUlN2eUVUeE5qVEIwMW9mZ05uNm9VaWUvOUpSTWt5enRrRXV6cDFNa21w?=
 =?utf-8?B?NFVHcGwzVWJiZUJNOW9pS1l3a1gvWlFQMjAwYThNZmNGQlFoK3ZjaGdtUE5x?=
 =?utf-8?B?dkZIYlRRbk9XYzRMSFQrUEVRa2dLbDY4TFZvdUtmVXp5Z1prUTFVUVVZZWZW?=
 =?utf-8?B?cVgybTBNNUtIWng2MGJiUEw1TlJ1SitOY2YwbVAyRFBmKzBrVHAvaUQ2WXZl?=
 =?utf-8?B?ZnN4U0c4ci9SYmtxMnpTMUQ0WE4vbDlXa3hQb3VaZXBlNUtBUVhvN3M5d0xT?=
 =?utf-8?B?NXBrNjJEL2dmSFNUNHQ4UmFQaUxXaklKdE04ZE5OUGNQNmNkdWRCZUJjVFlB?=
 =?utf-8?B?Mi9TbHZRb0x0c1Q1VFoxL2dseFcyNnlQK3hyemJtSkNOYlRCdWhuT2djTWNB?=
 =?utf-8?B?cm1RUjF2UStrQXlCNUx0WGt1bjI0d0lqeFJpL1JJcDcyZmVWS3FFTGJaYVlE?=
 =?utf-8?B?a0o5aWZVTkpaYjNRK09YQVdLTitWbUpnZk1BbTUwMFdtWlF3SFFkTWJlTVlB?=
 =?utf-8?B?djU5bmZQL2NHOW1FdlkrN0FWZGhFZTNrSGw1c0lQMk1sRzJ2MTZyU2pVeGcx?=
 =?utf-8?B?eWM1NTZBWVRjTFV2Si91U2ZVMk1lVHUyZkduT2pTUENmSUNjVnp6VXZUUU1r?=
 =?utf-8?B?ZFU5NXo0WGd1QW1tOHArNW1ybHJ6VEM2SzBHanFocnpWSlg3dXNJOFRNTzJz?=
 =?utf-8?B?QkJGN1hqMHJvOW03YVpuTzZXVG1aZHhTV25Sb0VjMk1FUXhabGhGbG9QdGJh?=
 =?utf-8?B?Z1RnMHlvWUxwQ1RmeFhta1RiQTFuTmRyN1k4NTYrSnJlaVBlM0YrNXpYTVMr?=
 =?utf-8?B?SlhFWmNoK082UkplZGtPLy9CQ1dSb3BpNGc4S3BFNnpkNWpGYUk3TXBtdytM?=
 =?utf-8?B?TUt3QnorLzc0aitGaUhaU040NHFxUTc5bzA5Q1NsaHRLSWlFK0dpdDNKd0hR?=
 =?utf-8?B?MVJmanF5ZGdRMVFCVzBzMkhWcUdnRUJ6MENIZTM4RzZSWlQ0UVAzaUMrSjQz?=
 =?utf-8?B?OXVtd2xPdlNOSjRzODVxL09pYTNoeEIyOEE3dHZPRlgwRHBpWTBTRnh3SFN6?=
 =?utf-8?B?S094ZC8reUV2eEM3dWZCNGtMNGxCeEhTVnl5SHFUOFF5Y2NYdytlT0tzaUNs?=
 =?utf-8?B?UFA0WE94M0FiQzhTZ3JaY0pqRmdpeGFWdldneWZOOWdnU1hROWJkLzE0VEJD?=
 =?utf-8?B?UHl5VlVzTTdPS0xaLys4NnlvU1cvTjFCVVphNXVqKys4dFBsdkFhc2pyeFhv?=
 =?utf-8?B?bkRhV01UcHpZMG5GSklScUNFRXFMak9IM1o4elBUL1Q2c3hFbFNvaUZNUXFH?=
 =?utf-8?B?YUpvdnJzTkdVbm5hQW9PVTdKVnA1TnBtalVzZWwwZU1KMVEwcmJabHRrU2gx?=
 =?utf-8?B?Z2s3MFlXVkZhTVhBdTFEc2NXblJHS1pWUkVOZkNwbXEyUWZiZm9SK2pDMXdG?=
 =?utf-8?B?Zi9VK0JhME04ZXVzcENxeVJkWUNQT0M5dGFYaEo4amt3YndsZXkxWVlIMGtD?=
 =?utf-8?B?ZDNxRGJmaXhqbitOVFhELzMraVNac0V4TkdVOVZhRzQ1QWV4N0R3ZS91OHpC?=
 =?utf-8?B?cEtodytrVENKb0dQSHdVRnlNUitGbk4vRGsvSGlzc1pONEtBSHgzazJrdU92?=
 =?utf-8?B?a3NHN3lqYUNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0pHN0c3SG9GUHNRdHhzZXdOamNjdCtiNTdXRkJFZ0F3Rkhjb0NhSmJET2w3?=
 =?utf-8?B?Z21GOUNtTDhCeHRDZjZxWXQ1RisyUi9WdkRLUW8wczJYZ0FjSlhjMFJkdG0x?=
 =?utf-8?B?RXZsRldjSjF4WGU0dTV2UHptcjloZUJxMjhEM0dtc1U2SEp4TnppRURyNmI5?=
 =?utf-8?B?QlRhS1Z0eUhYTytMZzdwKzNQVlAwMXNId2p2azRxN1ZhaWlPaGZmU1ZoY0Z5?=
 =?utf-8?B?VGpXeTRtOHByQXZncDRlcGtiUE56bEM1eGRXWjZ4c3QrdmVlVUZ5ekFxbDI0?=
 =?utf-8?B?TGwyaERoVTJlQ0IrT2pKcG5PamRuZ0wwa3c4UitpNFBNRnFpYW9OaVQ2NkYv?=
 =?utf-8?B?YXlnaTJWNTNWbTk0MHhRNEI3NEtxZHkybWFxamJnRGZaTUZNQ1pXU0Y2N0xx?=
 =?utf-8?B?WmRpeEZkNVhBd1VnNTcwVytzTXZodDVCVmNJWHl6eDNyYXQyWWo3aGVVZUth?=
 =?utf-8?B?Umc3WTJGWWpHZE9rQWRpNmVuWVlKdEI2a1k5TVRaK2ViRG50SHFzWlI0eVYx?=
 =?utf-8?B?K01vcDA0d25BcXZxNmpCVkczSE52MUNBeXBsWXJ5aWxCUngvVFRvUloyMTNS?=
 =?utf-8?B?SkUzN0pJRDZveWNlSDNYOWl6L21UMngxUTN5RUFRdjh1VWg5Q3cxUW96YXV4?=
 =?utf-8?B?eG5EQk16SnltTmU2MjB4ckhyWEh5UFFxS0JwRTJQOWwyRDZiQ3NYQ0ppZFo1?=
 =?utf-8?B?b0QxUjFNYXQ0dTVYOVdYM2o4aFl4K0RNV2hvZzhGWjJTaWVySTJ2cmNrc2hP?=
 =?utf-8?B?b05VZHhOUnFyRzJ1MWhzQVl3ZTZ2bXE4N1JYdzJQRCtQbHJwSG82aUJUMk44?=
 =?utf-8?B?d2g5NEhXSzFlam1QSDNZMkhINmdLZW9lR3QyeHZTY1NqOUFyNld6SzBTZmx3?=
 =?utf-8?B?QllQWUFTMGRNTFpWZThsTzlrRkpXYWwvVGpXSHNFUVRTOFBJdjZVbmZlQ09l?=
 =?utf-8?B?RG1QZUxBaFFSN3ZEODdWcDdydzMvT1RVdC9zM0VNUDFqdGJ2YkgzMHVCNENt?=
 =?utf-8?B?dWdsV3RCUUEyMHRXRmZDWXNMc2cyNU5PZHJ1alUvTDR1ZHBzZXovR3dEMG5a?=
 =?utf-8?B?Zk0ydTk5eDVRZjZYYytjbWd6M0pXbi9JM2swZjZoSDB4aVl6d21KZmVQYkJ2?=
 =?utf-8?B?SFFuWDAxVmU0RFdHZFRQSTRBd25FT2xiMWN6cEVHQ2d4cklCNDErc1c4c0h6?=
 =?utf-8?B?QXYwUUFkTFliUUo3VmpvejhBWTZCQjUxZHBiMG1Uc3NlS29UbGhwS0JYV1FM?=
 =?utf-8?B?Q1hDLzRxR1ZBVHdQdjFVeXFhMmc4MlM5QldPVG9IUDBXeVFCMyszalJJTmRv?=
 =?utf-8?B?VTNKc215Z0pBc2lOSFBoay9NazU2ZUlxN2VXWS9Na09jNUNSN2ZoaFI0WFl2?=
 =?utf-8?B?T1pUV1ZwVkdNcmYvOFhlRHRMdFVlUXRPR0RUa3RSUENJMml3ZFZ6NXVMcjNN?=
 =?utf-8?B?RGw0NlB4N3RKeXc4WGRCUVk0UmYybEp3elhadnRHSEQwR0orbEFwTW9QTU5J?=
 =?utf-8?B?bGUvdkxGcUQ2cG1iQzBTMUw1eTlXSGxSQ1gyTGw4ZUw0MTdIZDZVN25KYTJF?=
 =?utf-8?B?NnZOa29KOTIrOFc4ZXRvZjM3ZlRVaUQwbENKZHhSRFBTTXQyOGJrNTdpWlFW?=
 =?utf-8?B?bXVRVng4MUMvRk5DRXVRa24vSllVSWFpZEdsS05oR3pQTXBhazdYblF0c3Uw?=
 =?utf-8?B?cllZSkNoaDVDM0tFUGZYVlgzUitseW5VNXZQcHA1QjF4Q1k2S3h6V2trSTdF?=
 =?utf-8?B?RExuRGJkbW9HSGRBVlc3OXgreFZsUVFGazFkUWVVWmVtNFk3TkM3ZTNuSllX?=
 =?utf-8?B?b3k1VHJQbzZlMzdlL2tSMlVhNmVCMDJHM3pBL1BWcVVMNGtCaWtDby9VdVRx?=
 =?utf-8?B?NWF2MlcxNVk5M0dzdk9obXZmaHhPY3BEWE1UbzBsRXdMV0VzcTZxRUlKRXFp?=
 =?utf-8?B?STVtVGFHRzhmcDhTeU03VHFCUWpGTW9TVit0UlkxdnZVVlJ1VzhHYmhQZUNC?=
 =?utf-8?B?dEc0Q3lwSElGZTBFalBBVm5OeEsvaFpFeEtYbnJuNTZ1OGRzaWNONCsrSXpG?=
 =?utf-8?B?M3VHdnlReEg4d1RRYndGZ0dqQThRays2Z1VGVGN0NDgvdmNxdXE2SlBtdWtm?=
 =?utf-8?B?czBlNlYrNWNjcFArL2czSnZzMUtYVjJvWXJld0dBL3ZHUThnTElIaDlsdnlt?=
 =?utf-8?Q?GVfvccGBQkmwiZZgjTP6mmvWLch1gDyrngzDgvEXfX1f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be9878e-0f28-4c4e-c6c9-08dd983314b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:31.6495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rc9nci/DmkCUjR70rtxg9MxiN0w0jwTgzU7uS42V9BvgoNrsVZV+PSNC7HKjTHJvxdwfn+rO7ghwzKZhKLgBTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Some registers (notably scratch registers) don't have a definitive
purpose, but need to be interpreted differently depending on context.

Expand the register!() macro to support a syntax indicating that a
register type should be at the same offset as another one, but under a
different name, and with different fields and documentation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7cd013f3c90bbd8ca437d4072cae8f11d7946fcd..64dda1d4d93d3c7022ef02b6f6fb81b58e90dd44 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -71,6 +71,20 @@
 /// pr_info!("CPU CTL: {:#x}", cpuctl);
 /// cpuctl.set_start(true).write(&bar, CPU_BASE);
 /// ```
+///
+/// It is also possible to create a alias register by using the `=> PARENT` syntax. This is useful
+/// for cases where a register's interpretation depends on the context:
+///
+/// ```no_run
+/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
+///    31:0     value as u32, "Raw value";
+///
+/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {
+///     0:0     completed as bool, "Whether the firmware has completed booting";
+/// ```
+///
+/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
+/// providing its own `completed` method.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     (
@@ -83,6 +97,17 @@ macro_rules! register {
         register!(@io $name @ $offset);
     };
 
+    // Creates a alias register of fixed offset register `parent` with its own fields.
+    (
+        $name:ident => $parent:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $parent::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ $parent::OFFSET);
+    };
+
     // Creates a register at a relative offset from a base address.
     (
         $name:ident @ + $offset:literal $(, $comment:literal)? {
@@ -94,11 +119,22 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // Creates a alias register of relative offset register `parent` with its own fields.
+    (
+        $name:ident => + $parent:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $parent::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ + $parent::OFFSET);
+    };
+
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident @ $offset:literal $(, $comment:literal)?) => {
+    (@common $name:ident @ $offset:expr $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -280,7 +316,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
     };
 
     // Creates the IO accessors for a fixed offset register.
-    (@io $name:ident @ $offset:literal) => {
+    (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
             #[inline]

-- 
2.49.0

