Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC12B4089D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388EF10E78C;
	Tue,  2 Sep 2025 15:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ujDFTVPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04F710E78C;
 Tue,  2 Sep 2025 15:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUPBnofMY1WYaRzXqhcEnSA3vsoaoArv+JQs36q19YozPFBkvFpx32GtuFHkovtixwsRdg+PWmjPRtPLY0vwPsH7KRxZlyu3bt9AlvCGDq8bMghGoxax2Nn79eeW9ItJQWzl+w6YQ2OoO0hx7EtUC1IuAtHMkEMomskEEafxDAPTQwi8XIBLabRYrorAy7ySraRm+aK8ZAx+s2C36o+8SDwOEskLJ0szkWne6/tef4EvHufGGS13sOGVY3ffNtd6G1rxjAuuuCNJFvlX+2VkbC5Rcl48EwvpW2um6L/NEB7gw2FQ8+x+q3cIU6tWpmHwH13jzh5kipGW06Tzoa+ssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0I/gaFmO7Iq6WoHeZipZw7cH2gJmx2EDEEmRCf1x84=;
 b=VXvjX/ULJSxO7qXIANb9cOpgZ0GGNbY49BjSdtXBXrNnlx/11w9EZ4nUIhgvcS2mf5y23My8TEx0IFiN0qbPys9c/PiKxPgHuBT1X0Rj0PHIHmio3qK2GNxHJzq+7IpxuxrJ6yfEXUx0L0hXmI640Kg9QVujuurnXhmGJNO+ELUcm6t8M/io7EPFtRA9Xk+ATyBWkXmsGQfjBWpm0P7FXxlrMljyaP9CNsCIZIQ8YVclsJhjd7GBVwv/PsHTUi0dmYFa1fQideYwxA61kBaPoKQcILHptJxiEMpZpazo5L+nnADnWQVHYxU+qcMxvHbMJCKwdz/9xKqWotR4VwcneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0I/gaFmO7Iq6WoHeZipZw7cH2gJmx2EDEEmRCf1x84=;
 b=ujDFTVPXyx7fBDE8PgyTVYmMoEkuDwxktJQZEtwLwABonqt/BdX6mN3T4GPAH/zsxQE4ATf4M7Z9dqhgzQn6+WIpA+QbG2x/rzXhYF/I7yzbprp5/I5ywMDfWXFyiFfPFba0kRPDvvKh46p75v4jZDLc2x1a4O74N8oiGeVhFAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 15:11:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.9052.017; Tue, 2 Sep 2025
 15:11:32 +0000
Message-ID: <7a25b5ae-b995-431b-bd46-6d2d58d18e36@amd.com>
Date: Tue, 2 Sep 2025 11:11:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amdgpu/amdkfd: Avoid a couple hundred
 -Wflex-array-member-not-at-end warnings
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aLF5vQv9P_vp0R6_@kspp>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <aLF5vQv9P_vp0R6_@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0005.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: a10a199f-0b08-4d56-e090-08ddea330014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUNDNTRrck9rbnlsN1FYdEVzb2xZaEZPM2dJUlF3a3JkbUtWV2Ird0t0WVlU?=
 =?utf-8?B?eUFZbXdIYWZLQjJmZy9qb1E1OEtWSHpaRzc5VlpDTUJwLzRhMUdnZm1NdmZw?=
 =?utf-8?B?QlpaK3lIblRMdFloblViZG5BblQ1dWNxNzQ4Qlk3b09RMzJoOGdMWVhDdTNq?=
 =?utf-8?B?MkNWZm5HYm56bnZBakk5Z1RIVXhoMGY1NjZFdm1kZzljbkJMRTVXY0YvU2k2?=
 =?utf-8?B?ZTBZbFFsWUNBalloamZoQ0pXTmFjbUI2eTRHQ25tbGROb1NsazFwODZOcjNB?=
 =?utf-8?B?UUhpejY3MlB0RlZkU1BzVWJQZCtwTHlRdFU4Y2ZVKzdkQkZjRlVjZWlsa21N?=
 =?utf-8?B?N252RExkVlV6aXNXb1k0cXBuc3hyVkx0dVIxU3NKeWZTUHZRNzRXdjV6RWRJ?=
 =?utf-8?B?ZXFiemp1VzlnZUJHY21JZzVmcmdXRndUUjhRSXFheUJMK09VRk5BZlVoeDlW?=
 =?utf-8?B?aC9VNEtqY2NTNU14TVdxdHdGSm1GYmdiWUN1bUd4dDdFUFhZMzMrMU9xZXdh?=
 =?utf-8?B?MnhVdVMvbVdkbzRyVHNsa1FxZzl3Z0x6SEtzRWkxbWY2RjJXK2Jjbk9VNmtI?=
 =?utf-8?B?ZHVVSGZqSkNHUm9DenhwZTRQeHkyT2V6b1lWWVZObUVzek5rWXBmdUNWTllC?=
 =?utf-8?B?Q1VrTzcwbm9tb25OWnRyTFdSM2dvSldxbWpJUmsyL0VMRzVmdGkwOXpXblYr?=
 =?utf-8?B?SEppQTE2M25OeVpjbnNseUxqTDE3bSt6UkdlMjZOQzRHTkN4bU9mU01Ua044?=
 =?utf-8?B?MFlHQzd4M2UzM2lEbDQxWEhRaUJZcms1SElBMnZJUGFNeHV3ZWdSM2lleU4w?=
 =?utf-8?B?Vkg4NVNvdkpKWEpJQmNYeE1EQ1RWWTlWN3NWMnJrTSt1NGZjK0RyZk5QcXYw?=
 =?utf-8?B?Vll5RXZSM240UkVOK21LakdwVDEzMml1ZVpPeDNONmZoTkxHTGJmYk9GUm1k?=
 =?utf-8?B?dU4yK0VmRWFmUXZFMzRCai9ydlVuV0RMakUrUDZXa2lwRHpLbmxnMHluZXVu?=
 =?utf-8?B?ek1XdlFUcVVKTktTTzZKT2lyUDdjU2FiVXpiclBHRmZ3K3pQSXpkVnU0bStk?=
 =?utf-8?B?RnNYRkJGb3JvTGdvQ0FwN1ZLQk13UUR5dzNsN0pmTkdXTWNId2RjRVlucUJx?=
 =?utf-8?B?eXU5WjlPb1p0SndHZDR5cXVzS0dzTkt2bDlxTGZta3lMNTZ6T0lldzQxYmox?=
 =?utf-8?B?bCt4VWtMS0JVTkIxd3RsTzhLZllFR2FTN0hJVWVXMzRnODBBaXFZQlBvYkpa?=
 =?utf-8?B?MEp6VUl1QTE4UkZNRmRpd2xoYjJnNDZWOHJZazJQTUE3dmNXNDByVzZHRmRu?=
 =?utf-8?B?UXJva0sybzJudjl6N0Z6b2ZITnZtOVRqbUFMV08xbXZKSlhKM0pvN2dDTUVa?=
 =?utf-8?B?L01XNis3MCtHVlFEZHg5ZmJpWVFOQzNzM3JGMmpFeFRQQVNYNG9aUmNOanRS?=
 =?utf-8?B?VlpwYzVhendsQzA4anFpWDVQVnBkWCtOYnByTmhQQTlIcVZXdDdBM3FPbjNw?=
 =?utf-8?B?czVvS243cTVVeHEvbkhmVW04S2VtZ2F2RHR6cyt2dFBwbmpYck5nNTV2cGRV?=
 =?utf-8?B?R1c4MU56akVLL2V3VlNpL3p5T1VqMzhUVUxsdEQ3RFliZjVhYytTcEVCOHBB?=
 =?utf-8?B?U1k1N2Q3b3JIbWgydUJQRVNkVi9mb2tvWjNXWElWRW00cnJ4b1hOTWFkMTFG?=
 =?utf-8?B?dUVoaXRQNjdDZVNEUDJSNTMvTDQvamlpQTlnYUpreHBEZWhqWTZlcW9ZOHRW?=
 =?utf-8?B?NEs5SmQ5YzFYc1pmY2EzV3NQL3dTVDM2QVhTKzl4YndQMGdNejB5T084UXh5?=
 =?utf-8?B?VnBoeFQxWFUyd2JKMEN3V0plVkhVdEdOc0NWMmFUNDdGUzZqWDR3cmhGaDUv?=
 =?utf-8?B?UytaazRuZW1Ic1pCZzZTVy9yL1R3ZXNHampTRC81UTQ3U0wyUUdvZGNqSUVj?=
 =?utf-8?Q?37wevjuZ8aQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1M2dSt1YmNMUk10K2k5UzZMcjZOUU5LR0c2QVZHbkdiMWo2M2xnNkhLclJM?=
 =?utf-8?B?cnpLMHBTejFwNVlKTmoxMUZTaTlGZDZNN1oybkZEQkVuVVQwQnBNMTNaT2Rt?=
 =?utf-8?B?Vi9qYy9YUDdaTzJNMDdndFI4SlNJNHpIRHA2MlM1b0dvT0YzRXpsUlhkQVJr?=
 =?utf-8?B?bWN1U1hNS21aZFNPeEc2elpqSXlPM0NSR1A5UlFNY3RFTDdiUm16SklmY3FX?=
 =?utf-8?B?OW5IaEZFTzhXUUtsbjJEd1BOVVZuYUJyeHdCQkR1RUZNK3NQbldrblE2bFYw?=
 =?utf-8?B?TTZMdUFEcGl2ZzB1Z2V5TXk3TTZsTGtsTXZNTGZMUFlVNVcybmFwNERiNVNX?=
 =?utf-8?B?UzV1NnczRHJIL21pK3BvTHVDTjZMTGJhV3ZxQjloS0Q0R3dPVXRpTGNZZHdV?=
 =?utf-8?B?MHlsS29rVXgxUFlmcU9kSWFzUUlLVjRwYlBETEpWMUVLL0YzRE5YSjFEcitl?=
 =?utf-8?B?eFJydjZHWW1aSjBEazVXTGFGMFd3cW5iNHVidWxHc0NxWFIvRStJODFSVm9U?=
 =?utf-8?B?MzV2U3d3VmhwOVdWRG93blgwVjlqTk93TkQ3UUl2dVNYZ3RNUUd6ditRc0xl?=
 =?utf-8?B?Vmw4c1V3QWhYN2dQYUdYNFhnb05MSzErNEFpcjZkUXIrOG43eHRyeTB1L2wx?=
 =?utf-8?B?dDdSM1FaNHdPTnhab3h4T2lMSEFjTC8vSnVCZ05MZWpRUHovdHBBTUxqcmVZ?=
 =?utf-8?B?VldmRE9rOTZ2Q2o5RmdrRjdjQ0ZXRXJtQ0FlZzBSTHp0ejF5blpVYnFDeXRo?=
 =?utf-8?B?TGtsS0JLWmJyUFlHdGpjd2c1Nll3bm80MTAycWlHVGFRK3MrOGxsUytBcnh3?=
 =?utf-8?B?RE9uSFhBNlh4SHlMYkh3U3JHQWFjQ3JmMm9jWU4xMStHRlJjNStjejR0dW1O?=
 =?utf-8?B?ekJFUXJkNGhDM1U5ZldRK0N2VGlYRUVTT3lSNExuMUxac0tRQ1R0dUlQS01M?=
 =?utf-8?B?eFhTSWkvb0twTlFhSVFtKzEyMDFTSkpQL1BuMVEyOWNXUHJ6UnNJZmFHVlY2?=
 =?utf-8?B?dFdZaHFXdFg1eXRpVGVMbFRRQWRQa3JBM3VGTUtKSDZYNWZVZGlTV1puMVNM?=
 =?utf-8?B?RFVaOFptM0FqZm5FR3EyY1E4d0pvL0pMak5sbVpFZ0lFSXhvYVVWaklaVWdK?=
 =?utf-8?B?bGFUTlJDT054dlMwbGd3NjNwTml3dUZudm1zbzJQTDNpZTFSRzZNSzlmNU9r?=
 =?utf-8?B?WFZjN1lRUUQvQlc2ZCt3T0xQcXBCamg5Nk8zdDJOZXN1RFAwRVhZNk4xRWU2?=
 =?utf-8?B?dFFZNDIxbzlXQXRZNlR2TWJjRmpYVDJIc1pKSnBRRjNkUTdsM004Smx4cXFy?=
 =?utf-8?B?VHZ2clVVeWpqZWg2bnN0blVhWGY5cUt4V29EajFJUXMzdWpQU0swaHhyNUJv?=
 =?utf-8?B?MXNKMTMwY1phL1I0dXJ2enp3Vk94WU9WMm5sWm5neU9vT3VUdkRiMGYvWWZu?=
 =?utf-8?B?SCsxS0hPSS96RmJCbFBybUQxRlIvRkdaMTkzd3V3eERVQm1KYXpXajJ3b21l?=
 =?utf-8?B?MjJMTmlpYUZQa0NwYSs5YnVZemxIdUZFTWRLbm0vVUxSSmRTNlUwS1dFYzVu?=
 =?utf-8?B?cDh1bW1YWTZVNnBET1MzcVhrQ1dhVFNtazNjUVZlT2x2QjFZdG9qdk9QYjND?=
 =?utf-8?B?a2NoSVlwVXNxb1NKQWIzRzZPYktmSC8rZHQvTkVUc0N2U2phd1VmRkIwWWVK?=
 =?utf-8?B?c2NCMEJJSGdlMjBPNmY0OUttRzFHQVcranZjWlpoVTJ6TkVWMGtndy9EMFlw?=
 =?utf-8?B?M2J6TGYrYTFGc1VkdStsWk9ZMnc4VW5zWHdPL0c1NzZnNE9seUdQK0pKNi8y?=
 =?utf-8?B?aVU2VG8yUnJCOU55NGd3aGFvd0pjbmFPZ2lhcExBY2ZVSlZwM0xkU2lscDFH?=
 =?utf-8?B?dDY2VmJUVUx6NERrM1FCcURxQUZZbUVLb05KaEhYRDZHQVNGYWp3Qk5JQk1C?=
 =?utf-8?B?Q1JoMTFnY1J3d2lzZVhuZjhnNjlFUmt3RU0ybmxRMGQwRkJYclJGamNPR1RD?=
 =?utf-8?B?Y2dVOGthWjdBRnlaeCtyMWlURjRMNkhpS1hPZExoV2djbHQxMlVlalhaVFZw?=
 =?utf-8?B?R0c0dk9CTWt3eUdaY0RZSnhIUk12NXpwc0JmcDlsRTlxeVY2Y1VEalFPLytj?=
 =?utf-8?Q?Wmltkp7g5xQ8xybiMo8ic6j3r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10a199f-0b08-4d56-e090-08ddea330014
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 15:11:32.4157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMHS7iYACGYDsKs+p81Ze65ZASI5ZBFUghHcYJubmd5T+ifIa68HhiMcUumX/uNrBIM2d+x6RrKU8IlYBgw9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
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

On 2025-08-29 5:58 a.m., Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
>
> Move the conflicting declarations to the end of the corresponding
> structures. Notice that `struct dev_pagemap` is a flexible structure,
> this is a structure that contains a flexible-array member.
>
> Fix 283 of the following type of warnings:
>      283 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h:111:28: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thank you. I'll apply this to amd-staging-drm-next. I'll also add a note 
to the commit description that struct dev_pagemap always has space for 
at least one range, and that amdgpu only uses a single range. Therefore 
no changes are needed in the way struct amdgpu_device is allocated.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 8 +++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 8 +++++---
>   2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index ddd472e56f69..24f3e5cfbe5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1155,9 +1155,6 @@ struct amdgpu_device {
>   	/* for userq and VM fences */
>   	struct amdgpu_seq64		seq64;
>   
> -	/* KFD */
> -	struct amdgpu_kfd_dev		kfd;
> -
>   	/* UMC */
>   	struct amdgpu_umc		umc;
>   
> @@ -1320,6 +1317,11 @@ struct amdgpu_device {
>   	struct mutex                    userq_mutex;
>   	bool                            userq_halt_for_enforce_isolation;
>   	struct amdgpu_uid *uid_info;
> +
> +	/* KFD
> +	 * Must be last --ends in a flexible-array member.
> +	 */
> +	struct amdgpu_kfd_dev		kfd;
>   };
>   
>   static inline uint32_t amdgpu_ip_version(const struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 33eb4826b58b..127927b16ee2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -107,11 +107,13 @@ struct amdgpu_kfd_dev {
>   	bool init_complete;
>   	struct work_struct reset_work;
>   
> -	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
> -	struct dev_pagemap pgmap;
> -
>   	/* Client for KFD BO GEM handle allocations */
>   	struct drm_client_dev client;
> +
> +	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping
> +	 * Must be last --ends in a flexible-array member.
> +	 */
> +	struct dev_pagemap pgmap;
>   };
>   
>   enum kgd_engine_type {
