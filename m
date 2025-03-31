Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F269A77116
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816DD10E1FD;
	Mon, 31 Mar 2025 22:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GHJFmyLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD6710E09C;
 Mon, 31 Mar 2025 22:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut/d6/dUEtTEsouYcth2KiL/5VS/3YFXleskXGdo0xX/h7VHuexK23+W024Zya5BnnASo/Z6+N1Q6NAx6/iQyLWkh7OkEozMbCOP5+FRuFnu8ro//zQVWIVtk1LbXW31o1EkFvlCRcMLHwW2WNMBMVcYjdbr0YDSj2+SayMcX8q3DVRHistGsUShSxG8xwfMqq7xJYo7jI/pt9OXvjbuf8F5vi3KdFFXK+brts5UwdqGo77DuBpVKshhPBoOQNvFQfyWYs26LblVUGQnSrsHkndleEoVFgmmVDVzeDjm+Q+HFYQCz1t7T4+zGPgFXegwIS/l5lM12/DQ3X5xy4FH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3bKtxXTlzpi6oNQ6B6Ui4TwbrWyHZBL4I3Zzt76nW8=;
 b=uvNQ03Uq2iptIhl1eP77VlmHsJjQZOKZfu0BnNAjW0+17k9fQcb7PvvAQlRLC3B9Jq3x0H54O6fkrzQH1d4dAJyrrd6xuD1izK9Gp+LjH3SlLsMXwvxVcob8zz/sL2O1/4WshuL2x1lq+bIGzFu/UwCswKmqAkl7NHIeXo9FDmqbci7bLY8bHTta2bTQwoKWtjS9U/I4NXJpZ3hgz7fIUulycv4ya5wuBNOwHEnBQRevUhj++dTfWbcbLkr31ujhQPKo1Qn7iIb2/ziC5ADUcGuQsEcoGUKBLV9J2vbM5E0VIiNuURlIfB4+WZR5F9k5Ua2Ikp+IzBf5AEjYIvFpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3bKtxXTlzpi6oNQ6B6Ui4TwbrWyHZBL4I3Zzt76nW8=;
 b=GHJFmyLjxKPKCQ7NZIBP4+aS5pzIOdCNa18e9wOWhMXy1KgM1k54wuFGyZkVX+Eq2vEYqqO8oox/OFGp7j3Di+3s2soB0H3wihd0bzPGtZY8C8j8pE6YNAiMrhEvYvzaCBI/cD/mVa5PMJvx3gPmoqUXJxb5x8bor3Q17yyLHSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 22:52:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 22:52:30 +0000
Message-ID: <e3da6807-3d39-43b6-89af-a67c5e231300@amd.com>
Date: Mon, 31 Mar 2025 18:52:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdkfd: Change svm_range_get_info return type
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250331131833.68281-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20250331131833.68281-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: d45dd497-0623-4101-3191-08dd70a6b736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHlvQmRYMFNONGZSYS9rRXltSzE5aXNKek8wWmJ5NVo5UG83R3FkaVd5aW93?=
 =?utf-8?B?TFhUaHZIWWtuMExUdUtTV1F4d1NZc2YyQjBkSC9KZnFCQmNqTmV6VEtkS0du?=
 =?utf-8?B?eFo4S1REQjdxVEc1bm4zeDdzMXNiNXBoQ3hGTGJpYkgzWUVnblAxSjVBeWdM?=
 =?utf-8?B?Sm1oMU51L3p3Mll5akh2MDVoZnIwcU1KL3Fmc1RUVHdQZzlvN0RpS0Q1MEdU?=
 =?utf-8?B?b1htd1VZVUxLaU5QUE9PWnNueTQxQjZ2K00rTk9rNk82V1oybU9RZ3ZwZVMw?=
 =?utf-8?B?WHB6Zk42N3d1b3hObWJ0TkJXVy9IY0N6T1lWTkU2OTcwODYvTzM2QVZwOW5s?=
 =?utf-8?B?MFJKT0N3UGMwendsTnVhMlNOVjZhanplMnNBWjVkRmxEWmJYU3lHUjB2eVVs?=
 =?utf-8?B?c05NT0o5RE1mblZqZWt3RXJkczRvN0NaNS8zYnhNZWNqNWRQT01tK2s0RG5i?=
 =?utf-8?B?eGNHbThQUEYvSERrQXlqVzNucmUvbjFvdjFNaGhOMW85cXdXdVZQUzFZMita?=
 =?utf-8?B?cHk2ZWZWOVV0eHdYNWdzMXRjV3hhN3M4ZmxncitkNlUrTW5JdW5jN0QrVVlJ?=
 =?utf-8?B?bm9FYStORVpQanhtazZ6c25ORmxXVE1MUmI0b0I0VGRjMW9kZVNSRENXTHBR?=
 =?utf-8?B?ZEk2OGhFWUNqT2g0K1pSejh6SmhLbmx4WEpmOEphZTE4YlRXRHBZNG44UHB0?=
 =?utf-8?B?VG9YUGtJVWJsQ08vSUpnWUV6aGcxamJnMW56QmNMS244ZFJma0hKVlpobC9K?=
 =?utf-8?B?cWVzUlZ6YmZxRWFIbnlBVnFxaHAzaStyVklIbXBiditWU3NYeHdZU1BMN3pI?=
 =?utf-8?B?K2hXc0xDNEJvNVFsVlpSWWlFeCt3a2U3RlpPUXhqeUlvZUxobHMrQnJYZ29a?=
 =?utf-8?B?OXlWTWNINGpkU0VmTlN6VVc4OUdkMEZwR2xuaHZxNVZsTlowaEt2cmZVcEZr?=
 =?utf-8?B?UC9laEhMNVd5d0g2UEV2OWxWVmJPOXBrQ0lyNjBjR2lBNExLUWdsWVQvK0Jj?=
 =?utf-8?B?L1hEYTF6bG85dGZVVEpCaHd4d2NwNGxpTkMzRTVyTTBJcXh1aWsvOFVjY0Fi?=
 =?utf-8?B?bjNpazEvR2dqWTVrTzE1eVJuZFhMVXF0TWlrUHpRUEt6ZmJsVXJHQzhKcVQz?=
 =?utf-8?B?WmlGVDY2WXRTRjhOZEtHczRodWpoTFg3cW1xNTFySWpiRkpta3RLeURhSmdJ?=
 =?utf-8?B?eGFBMFlaZXhtVVBzUXVKcDFmM3g1M1RIUVYwUWU4cHVUY1VmSFNoMUZVU043?=
 =?utf-8?B?eXBFbzNyVWdYVEJXNGUvbU9uZE1UMXd1S1dFelRNcEtsWnVreDdFZmtvbUcz?=
 =?utf-8?B?TDg5N2haejNaWFdTZ3JZQU9mYWN2VDYxU0FmenNxaktBQzRVQjFLU2pZVmg2?=
 =?utf-8?B?ZDlMU2FUTjlDbmQyR3NCKzlwUnZySi83ZEI1aTFmVjNUSnhMUFBmZzNBYzY2?=
 =?utf-8?B?dTFSb3BrM3BWeFArZlcrZWJ1Q0VvMGNmYytlaUdIOUhydUJrWm1zckdvRzJJ?=
 =?utf-8?B?ZVN2QVJEWWhkZ2JyOGQrK2tuOEZ0V2hRUDYwZW94UFlpRndxMkVKSlBobkFl?=
 =?utf-8?B?Y3JoZFdlZzhOZXhPakFtVlQ1S2xPT3B0ZTU0Qm9pZ3Q2QnJGdlVncHFpaVQv?=
 =?utf-8?B?SHlWZDZZUXhSOWZrTGx0RXVjS3lLS2xKcVRtM3QyNlc3bC9PTkNwWFA4cjBF?=
 =?utf-8?B?SVRUU3hWcXVpZ1I3YUpidENCTkZoL1ppRVpsZTJQKzlFY3R2NVR3SHcxa0hh?=
 =?utf-8?B?QjhSTklVN0o2KzIrUzdRZnp5ZVBvSURnTVZrUnlqYURtRCtsTXZWU2VWUCtZ?=
 =?utf-8?B?VlFiTE1nSDRhb3c3VWdyQ3FjRkVTYmdOK1g3UmhXVFJ2OXczM2tpQWdJbnho?=
 =?utf-8?Q?87ujq+Y81zNSn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFHU0dHVzhoTVNPTkpUUXordjdNU1U2eGxmTHVMUmdFbzZVeFpYRDJqZmJS?=
 =?utf-8?B?YTFDTmZMQUxkazRadlFNNGh2bVpLY0FBM2xNRFlTZ3MyZjRDMDhsVFppbzVC?=
 =?utf-8?B?SkJEWXlPaVg5M0RIRkRYZzlEVlpMS0EwaUc3SHkrd0x3WC9LaEUxeGdlbjNy?=
 =?utf-8?B?RmNGbTJJR2ZML3JyYjZhQkZYcU0vT0xqd2RoVSs0UmJMU0xad0hoUUNNUldR?=
 =?utf-8?B?WldkcWxXZmxTR09IZHJZcDlScHhrMnNySjBZbDlSaHFaUVUyZTlwUUs2MkF4?=
 =?utf-8?B?eDRQSWxIUTkxdzNRemxCLzd1Sk5rM0xoYkUrNXAxR0xTc1ZLeUhsMitnMGVj?=
 =?utf-8?B?TGZMNWFxempKNDBJRVF2LzYrQ2tPQ1B3dnM4eFFpVENLM2tXVTgxdUJONWhk?=
 =?utf-8?B?ZHcvZmVaOVdpK1ZYdnZnQzk3dlZwK0I2b0piRnRLcWdlRGc2OStmQXRFMVNV?=
 =?utf-8?B?NGVrM1pkaWdOdTNRcXFFbDYzY0NxbGgzSVkwSlNPWDdhL3JaUmdPa0RjYjFM?=
 =?utf-8?B?cHRKVS8vYjJwbFBKV3V4T0o1eWtoZ3ZrRGNKNWhacmJRcnFQRk9oUlh6bEJR?=
 =?utf-8?B?R1RwRjRFU0R0QlhnRFZOakdiRDVDc2FvdHhIUERmZWRkMTZ6WThKekZ6dlpu?=
 =?utf-8?B?YU1LUmtKN0kyVVhWMEJRRE1zY1dGM3IxQmpFeS9FNzI5bzRnbWVUY1FscDdp?=
 =?utf-8?B?dVFOMklWOVE1aTR3ams4SWJxS0NPSUNZMW84aDF5Zkw2UENUazEvUmcxVU9Z?=
 =?utf-8?B?ajN1Sll2MmR3M2JCcGpEYUFWVXljS0puOEtVUmpvL3pvdVg1WXVkc1hhYTR3?=
 =?utf-8?B?VVZTQ3N0OWd5azhZQzVMMmVpeGdlM3drOW8zaW5oS3UxNGF3VWV3akh2Uitn?=
 =?utf-8?B?bGN3THJhdjhRb21XdXlPT1FlSGxBVS9ITjQ4cXRXQXhwV0QxMC9yMkh0TkJF?=
 =?utf-8?B?NjVzSXljWVdGNVZLZEJjeWZ5TlIzdU1CeEF2dkxqTjI5dFNDM2VFYjR6S0Fn?=
 =?utf-8?B?MC9RTzdkelNsRVdwR3g1bTYzaTRQb3kvTUdZRFR0QVc3cXEyblJCZ1FEZ25X?=
 =?utf-8?B?ZW1MWmJ0Q1VZWWJUQ3pwZGpuZWx4S3lES2UzZFBkTXY2ekNiSVBLNEMvenJj?=
 =?utf-8?B?czRZT3M1Z1h3VFR0Z3pITjlmNHdkR2xuc2xaQThLcWZjenhwM3hIRWNqQzN1?=
 =?utf-8?B?dnlyYS9Gcmw0SXl1UFNWYzRxbktGdVJaTG5yOTRlejhRV21hUmVuVjZlcjFa?=
 =?utf-8?B?WUUxQWc1SnFpZndSK3M3dFNoRVptbXAzdjF1ODhGbUNPdWtVTWo1MldPYWt3?=
 =?utf-8?B?VlNHeW5WYm40YnQ2aW5XTS94VHpaa3d3MlF5VmJ2WVh2QnRJV2dZem5SdVgz?=
 =?utf-8?B?cUZCQnlqclg2eUlDaDJKTFdaNUZiSUhEYld3OHd0MjJOK1JWZmRZRkc3RjFD?=
 =?utf-8?B?dkJPa3M5di9VMkppTjlQRjFaYmxSc1dXbVB5VDJGaFYyUnhtWUNJU0N4MVVq?=
 =?utf-8?B?d09ZSHpTUmRnZitlZFRvWHozc1RsQ0V4SFVjVUtUWGlkcDlVVmp6ajFXbXJa?=
 =?utf-8?B?U3g5c1I5aTFaMVY2L1pEeFZTVGs3c3dkNnBmSXgrTEZEckxUaDE2bXMyZjFi?=
 =?utf-8?B?TU5jd1pvQVZjR01aaUM4djE5VS9mQzlEVW5xTGlDWUswakN1R3F0bVZISDM5?=
 =?utf-8?B?Sk00S1Y2OHU3Sld2Sll5dndzTFE2WXkxRlZNVWNFenNPMFM1b09vL0lMR3FN?=
 =?utf-8?B?dGEwY2FSUXVEVWwxYlEybCtKdUZmaWtkb3ZpRVQzeDR1c0VEbTFSU1Qzdnlw?=
 =?utf-8?B?cGd1d24xZmt4by9FVTlFdWg4cVdIUVRoNVJZWWJrc0RVbHNiMUdhK083RXBn?=
 =?utf-8?B?dmpIYmVPS1ZlelNRU0I5SHAxUGdOeGhBak1mdTFSVVZhbDJnTzJ5cStWVDVR?=
 =?utf-8?B?Skl6OHppZnc4ZUwrQXhURS9wWWwyM3EyeitZQU9nZzMrVzYxMTd5ZXp1ZkNU?=
 =?utf-8?B?WElvdnROaFNObTk0bERKUHFXdEZ1c1JVTkNOSUY5dFhENmxXMkZ2SmtDbDI3?=
 =?utf-8?B?OEdBM0Jzb1RRa3RGTHVNT3hUNUt6c1Nveml4eGRyMHVNNWR6UU45QTFZa2xj?=
 =?utf-8?Q?fntSsyfbX172/8hQ5ZRt3qqiO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45dd497-0623-4101-3191-08dd70a6b736
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 22:52:30.0696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2baOCDWhfrI7hc8gv74zkoH1gQoGohAtQW+xcsjI5khwK/n0sE1GmRCqFpzn29ZfVDsRshDjOHedLnkYMn/2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
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

On 2025-03-31 09:18, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
>
> Static analysis shows that pointer "svms" cannot be NULL because it points
> to the object "struct svm_range_list". Remove the extra NULL check. It is
> meaningless and harms the readability of the code.
>
> In the function svm_range_get_info() there is no possibility of failure.
> Therefore, the caller of the function svm_range_get_info() does not need
> a return value. Change the function svm_range_get_info() return type from
> "int" to "void".
>
> Since the function svm_range_get_info() has a return type of "void". The
> caller of the function svm_range_get_info() does not need a return value.
> Delete extra code.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
> ---
> v1 -> v2: also change return type of svm_range_get_info() per Felix Kuehling suggestion
Thank you for the patch. It seems you lost the change in 
kfd_criu_checkpoint_svm from the first version. Was that accidental or 
were you planning to send another patch?

I'm also having trouble applying your patches automatically with git am. 
Apparently you're using DOS CR-LF line endings, and --no-keep-cr isn't 
helping. I finally made it work with "git am --quoted-cr=strip ...". 
Please check your workflow for generating patches.

Thanks,
   Felix


>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  7 ++-----
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++------
>   3 files changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 1e9dd00620bf..a2149afa5803 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2039,9 +2039,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
>   
>   	num_events = kfd_get_num_events(p);
>   
> -	ret = svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
> -	if (ret)
> -		return ret;
> +	svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
>   
>   	*num_objects = num_queues + num_events + num_svm_ranges;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 100717a98ec1..1b7d57a1b245 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -4076,8 +4076,8 @@ int kfd_criu_restore_svm(struct kfd_process *p,
>   	return ret;
>   }
>   
> -int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> -		       uint64_t *svm_priv_data_size)
> +void svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> +			uint64_t *svm_priv_data_size)
>   {
>   	uint64_t total_size, accessibility_size, common_attr_size;
>   	int nattr_common = 4, nattr_accessibility = 1;
> @@ -4089,8 +4089,6 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>   	*svm_priv_data_size = 0;
>   
>   	svms = &p->svms;
> -	if (!svms)
> -		return -EINVAL;
>   
>   	mutex_lock(&svms->lock);
>   	list_for_each_entry(prange, &svms->list, list) {
> @@ -4132,7 +4130,6 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>   
>   	pr_debug("num_svm_ranges %u total_priv_size %llu\n", *num_svm_ranges,
>   		 *svm_priv_data_size);
> -	return 0;
>   }
>   
>   int kfd_criu_checkpoint_svm(struct kfd_process *p,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> index 6ea23c78009c..01c7a4877904 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> @@ -184,8 +184,8 @@ void schedule_deferred_list_work(struct svm_range_list *svms);
>   void svm_range_dma_unmap_dev(struct device *dev, dma_addr_t *dma_addr,
>   			 unsigned long offset, unsigned long npages);
>   void svm_range_dma_unmap(struct svm_range *prange);
> -int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> -		       uint64_t *svm_priv_data_size);
> +void svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> +			uint64_t *svm_priv_data_size);
>   int kfd_criu_checkpoint_svm(struct kfd_process *p,
>   			    uint8_t __user *user_priv_data,
>   			    uint64_t *priv_offset);
> @@ -237,13 +237,12 @@ static inline int svm_range_schedule_evict_svm_bo(
>   	return -EINVAL;
>   }
>   
> -static inline int svm_range_get_info(struct kfd_process *p,
> -				     uint32_t *num_svm_ranges,
> -				     uint64_t *svm_priv_data_size)
> +static inline void svm_range_get_info(struct kfd_process *p,
> +				      uint32_t *num_svm_ranges,
> +				      uint64_t *svm_priv_data_size)
>   {
>   	*num_svm_ranges = 0;
>   	*svm_priv_data_size = 0;
> -	return 0;
>   }
>   
>   static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
