Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9961A34BA2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A2A10EB74;
	Thu, 13 Feb 2025 17:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3aGHMd0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9610EB60;
 Thu, 13 Feb 2025 17:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2PP687/71Jqf5+f/vwBDkfmhn/+FqEZM2JGudBYcqJaPkCjSA0R7QvawcSMGCqTMxHW+7mkftRq9aYlsI8fa+ofBCIXZeLAxbRrfNlDc0QRMeBmMkq1E+Bn0Bm4giYGmxN1v8/qQx5KEJ8PbPoTUwqtiOWC7IzzKZYSl1X8UNrMyNv/I2jZg2mIoHOAhr0N8EBlMUDpbYnEcNBD+hMZCaEeasXBhfXwzUcqmkDqZAREzWKsBlRHsu3bBDp6vk5h3KEs7Kr+rLMFMsc+v0zlBoeAv0Zwiine3nLviBnpvxL8daXuH5rLtqzH/hHWpldt9iGDp2+gp3wWVRM88Za5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCZ2gCYlIilsJie1EHQVWtv7xx8cNUu6g+lwF72/9Vo=;
 b=jc6BSmB1UybfNfeYi9dNZDqVlcdZs54mVsmgfiuyWfChefXHnsCOBoOKRG+iqCSF8FvnZvdnpP/4R+0IwBjS32+8yfwM8B2mclrVbhw+jJ9Hc0JCq4dHxrEY8Hevf3VZw2wNNLWBjnJR6fDaZd5YFqWHVQOYnL+zGh/idf3YFWX4ffFMGPjSCB3+WcebLixErHKAlHQPVcOidVyDgtPeJ+e3an3M1JBfWDdAYs6UltDFZG+uqVa1GmrUSNc7JRKNSm5v8WlOp59GT2XdG8Ynyrvwh7ycbxnYvIfAYoOTMw3MD4jBCX+zk6bhrDdEUrER+W+M48dRgByjE3TZ1dsMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCZ2gCYlIilsJie1EHQVWtv7xx8cNUu6g+lwF72/9Vo=;
 b=3aGHMd0MK4ApOjI4gCXsQB1RyU/32g3UZk72rwP5p76M0+z6YbxFUCeS2bohWDv2iv0zW09c89fw+Uj/FOgBoYSFiXfO4+Uxq5isUg/2EUppu8B58qdJO7G7rpBOfX27yPuI8j/0HSl2/20+QliYe4Fty/NdCKAT7haJrbxrRes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Thu, 13 Feb 2025 17:20:35 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 17:20:35 +0000
Message-ID: <0c0d57c9-d018-48eb-a897-4c127a05b797@amd.com>
Date: Thu, 13 Feb 2025 12:16:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 35/45] drm/amd/display: add 3x4 matrix colorop
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-36-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241220043410.416867-36-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d92679-830c-46d2-ebd0-08dd4c52ba4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0o2M2VPTWZpZFpEdXZHaXNxYkdJN2dOWWFVU05paFpLZHVwUjlYT1l0Ykpp?=
 =?utf-8?B?cUxKMnUrVTRYVW5veUQ1NE5oaTNDaTFsZjhtOW5jdWc4QkJISDF0Vll3NEla?=
 =?utf-8?B?aUlCd1cycmZQbWtyNEJ5cmNqTHUwZUNGbmlrNFVUMFlzekdYZHBCMnAyQXVa?=
 =?utf-8?B?enU2YVZja3VzSy8vdzJnMGE5ejE2dXJmQmoyd09KM1lXK3N2YkNwNFpnemNM?=
 =?utf-8?B?ZDBpU0JmVlZsZGtmcnUyUmFRUTBObG5vaG5tWUpvWnhHdEpybDY5RWZGUUpL?=
 =?utf-8?B?SE5BUUsrYmV5dGdlcTViUG9CU2xpY1RZMzBvcjIyTTczMSt2cy9zT1VlUFZr?=
 =?utf-8?B?S1pJL3BBUVZSQndWT3hmY0tQNU92aVRERHp2a3RlUDJ1aVB6R0d6eUI0VnN1?=
 =?utf-8?B?bjNTKzdRTUg0Q2ZiRWhVWVgwNnVPY2J5U2lxK1E0bHV5S1ZhSEhDSG9yb2x5?=
 =?utf-8?B?MmRNSDRCQjhNUlRFbjdwMElHM29DM3B0bUNrUDVBanNiVUpMU3V2aG54SkZm?=
 =?utf-8?B?ODRUakxZaUI0eW82WTRCYlMzcFRFakhpNWkzVnVEY2hlMjZhRWE2cDRHcEp2?=
 =?utf-8?B?WERKdUJhcTk5NE04aFBnbytBMnZuOGp6d2sxanV5NHQ5ZDdrREkyb09pNEY2?=
 =?utf-8?B?SndLOVNWaWpERUZUSHNKSDY5azV1LzBsdHhNV2JGSkNYRklQRG9XdzZqMWdW?=
 =?utf-8?B?M2dEVzRrZDV4TjBuQ0YxaVNCczQ2b2M3VHRBUlZMUER5RnVNT3RKeWZKL28v?=
 =?utf-8?B?Q0pxWXhteEtsbi9UWmJ4RlBjcThDUjBxNEdZL0pVVHU4UEZ6dDVRdDhXYVNw?=
 =?utf-8?B?YmJWMnlLRTdnTC9wcE5STW9iVWdMaTlwR3RZMUlxVmFHUzRXclFDQWJnYnhO?=
 =?utf-8?B?VktqRFgyWnR2NExZSk9RaFJNc1NTN1pWNFBEVEg1Qk8wWSswTTU4OXBCdjNF?=
 =?utf-8?B?eEpSS2ZPRytXcDRSTk5lSG1POEpHNEZWTjFyMU1xVFowck1EMTd2M29Wc2Nl?=
 =?utf-8?B?TnExYjhnamJ0U3ZSa3VrQmhRTTBUVnZZeFIxWVhxVFRpSTBoendiK05HU2Rn?=
 =?utf-8?B?a1pWZlFKcEd5Zkh1b3lsM2tSV3ovNGVqQXFzYVA5MnVIZEx1VE1ncUZVN2lM?=
 =?utf-8?B?TWNzcCtPSWhjK1NHZTZLRldGYlJqZ2NoL1k5L0g4dDRGYTErd3c3WUdwQ3ZH?=
 =?utf-8?B?NGN5U3VDbno2OFhKdDQxNkpxcC95OGQ4Q0RGM2o2YjUwa0licS9OTk5QVFpm?=
 =?utf-8?B?WXhYWnRGM3J6SXJHTG5TYy9BRHovUENTUlFybGY4d3ZvU3MzTmtjbDdFU1k2?=
 =?utf-8?B?d0pzeFYxUVFXQlJuZGJzalMzSzBTZjZ0QkF6a1F1R3QyYWd5NWpBR3lrbjlE?=
 =?utf-8?B?cGZQZkMxTEI1cWpWcHAvSzlpaW1Mdk1sdG4yUnBpQjliNmhGU1NHT00xWnNB?=
 =?utf-8?B?SFVwNWJkNy9xdTBleUFzUmttaWZ6aGhieFV2OXR6TnZNZEVJUzI0eFJJdkh5?=
 =?utf-8?B?alErOHV6N2xMdVU2UHpTL2NVbUk5R2phR2M5T1Nic3NzSHFYUEU0RnVuV2dZ?=
 =?utf-8?B?SkI3NmZTczNzd0hIeDlJR25pZGlldmg1dm1mSnZrbTVvUk5jWGFwZXdTd0dp?=
 =?utf-8?B?eXI1VnhkWWx4SFd4U2M2NmxxTWNsRk9QemNtWlVHMXhQTGR1c3dCcFJFeVZu?=
 =?utf-8?B?Sm43ZS9qQk51NkNtSFVySzZnWFhCTkxQbkRJd2lpK2luQVJZQnNyR0ZhTk16?=
 =?utf-8?B?Q2ZpbC9NS2RiWWMyMVFpRWRwdEFXbmpJZ3F1dlFwZFFvRHoxNHRIRVdMbEJJ?=
 =?utf-8?B?QzdSV3phbXliUS9EVTZFR3pEd2xpRGVQSm4ySU9NZjRSby9lZDJEOEc1STdx?=
 =?utf-8?Q?dCOO/biIoA5jj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVzUGI3bDkyVFI2UkoxdGNscGx5eG1HQjkrYlpsWTdzYzR1ZnFkaW1IWm1a?=
 =?utf-8?B?aG9yaHpqUm5jcWQ1bEpKL0Uwd1VtUjhWK2Y4NEJZT3Awc1JMdnJTQk5PdWkz?=
 =?utf-8?B?bzl5ai8zdzNHTVQzWEdPL3B2L28wclEzNWpwUWtmUGJHTll1ckZCOEs1UkJX?=
 =?utf-8?B?V3N5d00rMDhhU2U2ZkFFdW1kNlpCM3l4SzdOV0NSZFV4YnNiZTZYdzFyekcx?=
 =?utf-8?B?U0NWRHlZNTIxZlFIbmtMUDkwVlhqK2NzVXlLQ0pHU1FudzVBNnI0Ti9Ja21F?=
 =?utf-8?B?b0s4T3o0eFFKOWVuZjd3UkNRVWZWaDJjNXk0dWR1MlZvYitaTjdwTHlJRVgr?=
 =?utf-8?B?RXJaTVZkZHluRmR2OEhIMVBpQWJLdVhrZ2VLcHhsZzB3cU50ZnM0ZFpPUjZM?=
 =?utf-8?B?bTdPSWIxUkRpUTlvVlhsdXV1ZDlPREFKWHFCOE1SY25KUjIrbDRyVTRWVktZ?=
 =?utf-8?B?SWRsVit2UXhsN0xhUHFjYmtsTVJwUGRhbGdrSFk1eVdWd0RySjQvWUZWTk5F?=
 =?utf-8?B?K0JHeVpRSFd0aTRFMHpyTklSUm5ueWM2ZTQrUFlaOTg1bTRDMFlwMnVvUTZn?=
 =?utf-8?B?ZURSejV1QXpKaDdPdFhVczhka1RRQXdYZUdhR3BaWlFlWWVSSEQ4OE96Y29u?=
 =?utf-8?B?c0RxZHBOVE5oaTVXdEFBcUo0MWVBZi80eXVPUDcrVmRDRHJOYk94UGV0eE1N?=
 =?utf-8?B?dlQyeDIvQ1UrWm0xK2hXY0lwNDJCTkYzOEtZTU13Y2lacEJuTlpBTXVWRWxp?=
 =?utf-8?B?Q2FQQ1d2Vk13RHdPWURjVWd0SXR4VWZEY0lLTXdMRGlhSThlSG5jRXN1VWd5?=
 =?utf-8?B?RUU0Ym5rNXdIczh0QWYvRnB5Z2gyTG9yNFN5SDRUc3IwVVZEOEVDSHZGbkF1?=
 =?utf-8?B?S3kzb2FSSTVEdkFoS1Z1MGlwM3dmUExnZm5QUEl2QzdYRGdmeUM2NU9HT1JF?=
 =?utf-8?B?eDFsTFZWcmIxckJleURTbVpDMnhLN2dwU1VrbWQyZ1hsOUgrZTU2bENUaXRi?=
 =?utf-8?B?TkpRYmxLam5aNEVMcXZQMVNQalJ4Z29BdEVJR05NK2x1QlNhSWV2TkVCYlBx?=
 =?utf-8?B?UDQwSm9ObmFUY21CNTVNUGR2bkFMQm5DMUx3UGhuZ3p6RlZrcXpHMHpyNkc4?=
 =?utf-8?B?TzZPVFdSbFVMZHVOend4MXBDY2hpVnZWcDJIb2pEdzgvbnlYVi9pem1aSWti?=
 =?utf-8?B?WlkyeUhreDloMEtWOGhpMEJ4cm45WnJMUytEd2hJYmNzalkrOEVCcmt4RE5m?=
 =?utf-8?B?ajhOakFuRmRXTWViaVUrR01PZFNSNnJxbXdCbDBHTWE0Q3VRcTdsZ29tMFlH?=
 =?utf-8?B?NEhYbmV2NU1Fb1I0Y05WV2ZsMkpURGxlZC9pZ2EzaFJ3Z0o1bHFTYUg3ZXMv?=
 =?utf-8?B?TTRCUnY2emJEVHNTTTk0cXBqN1dObzJub1dQMkh5ZFJyOExHOXU2enU0ckVQ?=
 =?utf-8?B?R3kxKy9jVnJEQlJUd1pxZ2JPYThYZzJmRVFNZk1YSFdVNHZKd2tnK0xmdmQy?=
 =?utf-8?B?ZXM5Ym1HR200YUpRMlgrejRkMG51R2tObTR2Y0IwU3lEODFwNWR6OEIvLzVD?=
 =?utf-8?B?L1pHMUxqdEkxRzRkWjdrMmN4NmhBWTBVZVpyTVRZNG1xQ2p2SFk4U2RkQ3dE?=
 =?utf-8?B?M2RjTTNmTUpJb2h6YXQveXRoRDF3UERqbDZ2eXdCTmNjbEZiNGVIaDl5dlht?=
 =?utf-8?B?VnB2RWpJbXlkeVlZMXlyU3RNNXY0RUdFOHhHM0JMNUZ6SzdQNXFxZmpyeXpX?=
 =?utf-8?B?c2ZiQzNic0FZUThTZURsRlRjVnVFSXY3TjJwcXZlY2x3MVJzMmNUT3poOUhr?=
 =?utf-8?B?aWVJK05jUk1PNURSTlZtcjNYOHVCa2d1SXJoS3h2bEYxWWlFMHIxMzE0OTV3?=
 =?utf-8?B?MXJSRUJweTAzRDVQM09CV3VxNjJsa1VXOUF6QjUzSkV3ZFR4K3pXNlhnTkhG?=
 =?utf-8?B?dld4ZktXWkxKUlNzMEdaVDg0TXdEOEpucERETWN6MlRXa2hVRC9hbnN3amtT?=
 =?utf-8?B?NnZRcnNBVGVxQnZ4WTd6RDVFKzFhQUYwSnVDem43UzU5RDljUWFKeUFHKzhF?=
 =?utf-8?B?bVY4UEo4R1JaRHk4K3BERXVWU3JmVnF1ZzQwaVJQVFpQQkFEOEtLU0Y5RHg1?=
 =?utf-8?Q?rdMyL/kKM3LJ2SYGsUCJ/rAcj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d92679-830c-46d2-ebd0-08dd4c52ba4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:20:35.4973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6PaQ4XdDo6hDEtbS3ijcb4Fi3tl+rax4JlN7p4CSh7Q0sYSvBWPQ2Ma/lwRhG2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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



On 2024-12-19 23:33, Alex Hung wrote:
> This adds support for a 3x4 color transformation matrix.
> 
> With this change the following IGT tests pass:
> kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
> kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
> kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
> kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
> kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec
> 
> The color pipeline now consists of the following colorops:
> 1. 1D curve colorop
> 2. 3x4 CTM
> 3. 1D curve colorop
> 4. 1D LUT
> 5. 1D curve colorop
> 6. 1D LUT
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Change %lu to %zu for sizeof() when In drm_warn
> 
> v6:
>   - fix warnings in dbg prints
> 
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 50 +++++++++++++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 0bea52eede39..5d6effe6f90e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1211,6 +1211,45 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
>   	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
>   }
>   
> +static int
> +__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
> +				  struct dc_plane_state *dc_plane_state,
> +				  struct drm_colorop *colorop)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct drm_atomic_state *state = plane_state->state;
> +	const struct drm_device *dev = colorop->dev;
> +	const struct drm_property_blob *blob;
> +	struct drm_color_ctm_3x4 *ctm = NULL;
> +	int i = 0;
> +
> +	/* 3x4 matrix */
> +	old_colorop = colorop;
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
> +		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
> +		blob = colorop_state->data;
> +		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
> +			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;
> +			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
> +			dc_plane_state->gamut_remap_matrix.enable_remap = true;
> +			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> +		} else
> +			drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
> +				 blob->length, sizeof(struct drm_color_ctm_3x4));

Should -EINVAL be returned here?
- Leo

> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   			      struct dc_plane_state *dc_plane_state,
> @@ -1409,6 +1448,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> +	/* 3x4 matrix */
> +	colorop = colorop->next;
> +	if (!colorop) {
> +		drm_dbg(dev, "no 3x4 matrix colorop found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
> +	if (ret)
> +		return ret;
> +
>   	/* 1D Curve & LUT - SHAPER TF & LUT */
>   	colorop = colorop->next;
>   	if (!colorop) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index 8a5e15083f11..9a9386bf85ec 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -75,6 +75,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	i++;
>   
> +	/* 3x4 matrix */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	i++;
> +
>   	/* 1D curve - SHAPER TF */
>   	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>   	if (!ops[i]) {

